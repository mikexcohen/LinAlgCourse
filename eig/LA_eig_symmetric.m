%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Eigendecomposition of symmetric matrices
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% create a random matrix
A = randn(14);

% make it symmetric (additive method)
A = A+A';

% diagonalize it
[evecs,evals] = eig(A);


% magnitudes of each vector
sqrt( sum(evecs.^2,1) )


% and make plots
figure(6), clf
subplot(131), imagesc(A)
axis square, axis off
title('A')

subplot(132), imagesc(evecs)
axis square, axis off
title('Eigenvectors')

subplot(133), imagesc(evecs*evecs')
axis square, axis off
title('VV^T')

%% done.
