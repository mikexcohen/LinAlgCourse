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

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Order of operations on matrices
% Instructor: sincxpress.com
%
%%

n = 2;
L = randn(n);
I = randn(n);
V = randn(n);
E = randn(n);

% result of "forward" multiplication and then transpose
res1 = (L*I*V*E)';

% result of "flipped" multiplication of transposed matrices
res2 = E'*V'*I'*L';

% test equality by subtracting (ignore possible computer rounding errors)
res1-res2

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Matrix-vector multiplication
% Instructor: sincxpress.com
%
%%

% number of elements
m = 4;

% create matrices
N = round( 10*randn(m) );
S = round( N'*N/m^2 ); % scaled symmetric

% and vector
w = [-1 0 1 2]'; % transpose to get a column vector


% with symmetric matrix
S*w    % 1
(S*w)' % 2
w*S    % 3
w'*S'  % 4
w'*S   % 5


% with nonsymmetric matrix
N*w    % 1
(N*w)' % 2
w*N    % 3
w'*N'  % 4
w'*N   % 5

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: 2D transformation matrices
% Instructor: sincxpress.com
%
%%


% 2D input vector
v = [ 3 -2 ];

% 2x2 transformation matrix
A = [ 1 -1;
      2  1 ];

% output vector is Av (convert v to column)
w = A*v';


% plot them
figure(1), clf

% the main plotting line:
plot([0 v(1)],[0 v(2)],'k','linew',2)
hold on
plot([0 w(1)],[0 w(2)],'r','linew',3)


% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*max([norm(v) norm(w)]))
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
legend({'v';'Av'})
title('Rotation + stretching')

%% pure rotation matrix

% 2D input vector
v = [ 3 -2 ];

% rotation angle (specify in radians)
theta = pi/30;

% 2x2 transformation matrix
A = [ cos(theta) -sin(theta);
      sin(theta) cos(theta) ];

% output vector is Av (convert v to column)
w = A*v';


% plot them
figure(2), clf

% the main plotting line:
plot([0 v(1)],[0 v(2)],'k','linew',2)
hold on
plot([0 w(1)],[0 w(2)],'r','linew',3)


% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*max([norm(v) norm(w)]))
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
legend({'v';'Av'})
title('Pure rotation')

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Additive and multiplicative matrix identities
% Instructor: sincxpress.com
%
%%

% size of matrices
n = 4;

A = round( 10*randn(n) );
I = eye(n);
Z = zeros(n);


% test both identities (answer is 1=true or 0=false)
isequal( A*I , A   )
isequal( A   , A*I )
isequal( A   , A+I )

isequal( A   , A+Z )
isequal( A+Z , A*I )


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Additive and multiplicative symmetric matrices
% Instructor: sincxpress.com
%
%%

%% the additive method

% specify sizes
m = 5;
n = 5;

% create matrices
A = randn(m,n);
S = (A+A')/2;

% A symmetric matrix minus its transpose should be all zeros
S-S'

%% the multiplicative method

% specify sizes
m = 5;
n = 3;

% create matrices
A   = randn(m,n);
AtA = A'*A;
AAt = A*A';

% first, show that they are square
size(AtA)
size(AAt)


% next, show that they are symmetric
AtA - AtA'
AAt - AAt'

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Element-wise (Hadamard) multiplication
% Instructor: sincxpress.com
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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Multiplication of two symmetric matrices
% Instructor: sincxpress.com
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

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Frobenius dot-product
% Instructor: sincxpress.com
%

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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Matrix norms
% Instructor: sincxpress.com
%

% Create a matrix
A = [ 1 2 3; 4 5 6; 7 7 9 ];
% optional orthogonal matrix to show that 2-norm is 1
% [Q,R] = qr(randn(5));
% A = Q;

% Frobenius norm
normFrob = norm(A,'fro');

% induced 2-norm
normInd2 = norm(A);
% note: computed as below
% lambda = sqrt( max(eig(A'*A)) );


% schatten p-norm
p = 1;
s = svd(A); % get singular values
normSchat = sum(s.^p)^(1/p);


% show all norms for comparison
disp([ normFrob normInd2 normSchat ])


%% end.

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
