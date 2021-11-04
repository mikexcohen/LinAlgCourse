%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Standard matrix multiplication, parts 1 & 2
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

%% rules for multiplication validity

m = 4;
n = 3;
k = 6;

% make some matrices
A = randn(m,n);
B = randn(n,k);
C = randn(m,k);

% test which multiplications are valid.
% Think of your answer first, then test.
A*B;
A*A;
A'*C;
B*B';
B'*B;
B*C;
C*B;
C'*B;
C*B';

%% done.
