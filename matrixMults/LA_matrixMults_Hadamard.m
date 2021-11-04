%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Element-wise (Hadamard) multiplication
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% any matrix sizes
m = 13;
n =  2;

% but the two matrices must be the same size
A = randn(m,n);
B = randn(m,n);

% note the .* instead of *
C = A .* B

%% done.
