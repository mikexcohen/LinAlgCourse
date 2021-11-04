%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: A zoo of matrices
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% square vs. rectangular
S = randn(5);
S = randn(5,5);
R = randn(5,2); % 5 rows, 2 columns

% identity
I = eye(3);

% zeros
Z = zeros(4);

% diagonal
D = diag([ 1 2 3 5 2 ]);

% create triangular matrix from full matrices
S = randn(5);
U = triu(S);
L = tril(S);

% concatenate matrices (sizes must match!)
A = randn(3,2);
B = randn(4,4);
C = [ A B ];

%% done.
