"""Execute maintained notebooks headlessly and check numerical regressions.

Each notebook receives a fresh namespace and deterministic random seed. Figures
are actually rendered with Agg, including 3D plots. No source is rewritten and
no exceptions from notebook code are suppressed. Jupyter checkpoints are saved
editor snapshots and are deliberately excluded.
"""
import argparse
import contextlib
import io
import os
from pathlib import Path
import warnings

os.environ.setdefault('MPLBACKEND', 'Agg')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import nbformat
import numpy as np

ROOT = Path(__file__).resolve().parents[1]


def render_figures(*args, **kwargs):
    for number in plt.get_fignums():
        plt.figure(number).canvas.draw()
    plt.close('all')


def numerical_checks(source, values):
    if 'eigenvalue 2 + sqrt(11)' in source:
        assert np.allclose(values['Av1'], (2 + np.sqrt(11))*values['v1'])
    if 'print(dp1,dp2,dp3,dp4)' in source:
        assert np.allclose([values[f'dp{i}'] for i in range(1, 5)], 32)
    if 'B = A.copy()' in source:
        assert not np.shares_memory(values['A'], values['B'])
    if 'spct = ' in source:
        centered = values['Ascaled']
        assert np.allclose(centered.mean(axis=0), 0)
        variances = np.linalg.eigvalsh(np.cov(centered, rowvar=False))[::-1]
        expected = 100*variances/np.sum(variances)
        assert np.allclose(values['spct'], expected)
        assert np.isclose(np.sum(values['spct']), 100)
    if 'Ai = V.T@np.diag(Sinv)@U.T' in source:
        assert np.allclose(values['Ai'], np.linalg.pinv(values['A']))
    if 'defcat = ' in source:
        assert values['defcat'] == 'Indefinite'
        x = np.array([2.5, -1.])
        assert x @ values['S'][4] @ x > 0  # This form is NOT negative semidefinite.
    if 'V3 *= ' in source:
        assert np.allclose(values['D3'], values['D']**3)
        assert np.allclose(values['A'] @ values['V'], values['V']*values['D'])
    if 'plot_plane(ax, np.zeros(3)' in source:
        # Inspect the generated geometry without depending on private artist fields.
        class Capture:
            def plot_surface(self, *xyz, **kwargs):
                return np.array(xyz)
        normal = np.cross(values['V'][:, 0], values['V'][:, 1])
        original = normal.copy()
        xyz = values['plot_plane'](Capture(), np.zeros(3), normal, size=1)
        assert np.allclose(np.einsum('i,ijk->jk', normal, xyz), 0)
        assert np.array_equal(normal, original)


def validate(path, seed=42, cwd=None):
    notebook = nbformat.read(path, as_version=4)
    nbformat.validate(notebook)
    namespace = {'__name__': '__main__'}
    np.random.seed(seed)
    previous = Path.cwd()
    original_show = plt.show
    count = 0
    try:
        os.chdir(cwd or path.parent)
        plt.show = render_figures
        for index, cell in enumerate(notebook.cells, 1):
            if cell.cell_type != 'code':
                continue
            with contextlib.redirect_stdout(io.StringIO()), warnings.catch_warnings():
                warnings.simplefilter('error', SyntaxWarning)
                warnings.simplefilter('error', RuntimeWarning)
                warnings.simplefilter('error', getattr(np, 'exceptions', np).ComplexWarning)
                exec(compile(cell.source, f'{path.name}:cell-{index}', 'exec'), namespace)
                numerical_checks(cell.source, namespace)
                render_figures()
            count += 1
    finally:
        plt.show = original_show
        plt.close('all')
        os.chdir(previous)
    return count


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('paths', nargs='*', type=Path)
    parser.add_argument('--seed', type=int, default=42)
    parser.add_argument('--from-root', action='store_true', help='Test data paths from the repository root')
    args = parser.parse_args()
    paths = args.paths or sorted(p for p in ROOT.rglob('*.ipynb')
                                if '.ipynb_checkpoints' not in p.parts)
    total = 0
    for path in paths:
        path = path.resolve()
        count = validate(path, args.seed, ROOT if args.from_root else None)
        total += count
        print(f'PASS {path.relative_to(ROOT)} ({count} code cells)', flush=True)
    print(f'Validated {len(paths)} notebooks and {total} code cells (seed {args.seed}).')
