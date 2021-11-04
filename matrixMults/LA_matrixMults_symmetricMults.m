%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Multiplication of two symmetric matrices
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

syms a b c d e f g h k l m n o p q r s t u

% symmetric and constant-diagonal matrices
A = [ a b c d;
      b a e f;
      c e a h;
      d f h a ];

B = [ l m n o;
      m l q r;
      n q l t;
      o r t l ];

% confirmation that A and B are symmetric
A - A.'
B - B.'

% ... and constant diagonal
diag(A)
diag(B)

% but AB neq (AB)'
A*B - (A*B).'

% maybe for a submatrix?
n = 3;
A1 = A(1:n,1:n);
B1 = B(1:n,1:n);

A1*B1 - (A1*B1).'

%% done.
