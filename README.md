# LinAlgCourse

This is all the code (Python and MATLAB) that accompanies the online course "Complete linear algebra: theory and implementation in code"

Link to online course:
https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202108

## Python notebooks

Install the Python dependencies with `python -m pip install -r requirements-python.txt`,
then launch `jupyter lab`. Individual notebooks can be run from their lesson
directories or from the repository root. Run `LinAlgCourse_allCode_combined.ipynb`
from the repository root; it contains all 12 maintained `*allCode.ipynb` notebooks
in alphabetical path order.

Examples of invalid matrix operations print the expected shape errors and continue.
Left- and right-inverse examples use matrices with the required ranks. Saved
outputs are cleared in corrected notebooks so old results are not mistaken for
results of the revised code. Files under `.ipynb_checkpoints` are historical editor
snapshots, not maintained lesson notebooks.

To rebuild the combined notebook and run the headless execution checks:

```sh
python tools/concatenate_notebooks.py
python tools/validate_notebooks.py
python tools/validate_notebooks.py --from-root --seed 7
```

Validation checks notebook structure, executes every code cell in a fresh
namespace per notebook, renders figures with Matplotlib's Agg backend, and checks
selected numerical results. It does not test browser widget interactions.
