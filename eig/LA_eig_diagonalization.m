%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Diagonalization
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

A = round(10*randn(4));
A = A'*A;

% eigendecomposition
[evecs,evals] = eig(A);

% test reconstruction
Ap = evecs * evals * inv(evecs);


% plot
figure(4), clf
subplot(121), imagesc(A)
axis square, axis off, title('A')

subplot(122), imagesc(Ap)
axis square, axis off, title('V\Lambda V^{-1}')


% subtract the two (should be zero with rounding errors)
recondiff = A-Ap

% reconstruction error (due to inverse numerical inaccuracies)
rmsA = sqrt( mean(recondiff(:).^2) );
disp([ 'Reconstruction RMS: ' num2str(rmsA) ])

%% done.
