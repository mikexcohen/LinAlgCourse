%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Relation between singular values and eigenvalues
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%


%% case 1: eig(A'A) vs. svd(A)

A = [ 3 1 0; 1 1 0];

[ sort(nonzeros(eig(A'*A))) sort(svd(A)).^2 ]


%% case 2: eig(A'A) vs. svd(A'A)

[ sort(eig(A'*A)) sort(svd(A'*A)) ]

%% case 3a: eig(A) vs. svd(A), real-valued eigs

% need a square matrix for eig
A = [ 3 1 0; 1 1 0; 1 1 1];

[ sort(eig(A)) sort(svd(A)) ]

%% case 3b: eig(A) vs. svd(A), complex eigs

% random matrices are likely to give complex eigenvalues
A = randn(3);
[ sort(eig(A)) sort(svd(A)) ]

%% done.
