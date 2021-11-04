%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Solving systems of equations
%      VIDEO: Reduced row echelon form
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% make some random matrices
A = randn(4,4);
B = randn(4,4);

% print out the matrix and its rref
[A rref(A)]
[B rref(B)]


% here's how you check your homework:
M = [ 1 2 4 5;
      2 4 5 4;
      4 5 4 2 ];

[M rref(M)]

%% done.
