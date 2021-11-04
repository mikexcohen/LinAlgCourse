%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Frobenius dot-product
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% any matrix sizes
m = 9;
n = 4;

% but the two matrices must be the same size
A = randn(m,n);
B = randn(m,n);

% first vectorize, then vector-dot-product
Av = A(:);
Bv = B(:);
frob_dp = sum( Av.*Bv );

% trace method
frob_dp2 = trace( A'*B );

% matrix norm
Anorm  = norm(A,'fro');
Anorm2 = sqrt( trace( A'*A ) );

%% done.
