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

%%

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Matrix addition and subtraction
% Instructor: sincxpress.com
%
%%

% create random matrices
A = randn(5,4);
B = randn(5,3);
C = randn(5,4);

% try to add them
A+B
A+C



% "shifting" a matrix
l = .3; % lambda
N = 5; % size of square matrix
D = randn(N); % can only shift a square matrix

% 
Ds = D + l*eye(N);

%%

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Matrix-scalar multiplication
% Instructor: sincxpress.com
%
%%

M = [1 2; 2 5];
s = 2;

% pre- and post-multiplication is the same:
M*s
s*M


%%

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Transpose
% Instructor: sincxpress.com
%
%%

M = [ 1 2 3; 2 3 4 ];

M'
M'' % note: '' not "

% warning! be careful when using complex matrices
C = [ 4+1i 3 2-4i ];
C'
transpose(C)
C.'


%%

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Diagonal and trace
% Instructor: sincxpress.com
%
%%

M = round( 5*randn(4) );

% extract the diagonals
d = diag(M);

% notice the two ways of using the diag function
d = diag(M); % input is matrix, output is vector
D = diag(d); % input is vector, output is matrix


% trace as sum of diagonal elements
tr = trace(M);
tr2 = sum( diag(M) );

%%

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Broadcasting matrix arithmetic
% Instructor: sincxpress.com
%
%%

% create a matrix
A = reshape(1:12,3,4);

% and two vectors
r = [ 10 20 30 40 ];
c = [ 100 200 300 ]';

%% three methods for broadcasting

% the repmat way
A + repmat(r,size(A,1),1)
A + repmat(c,1,size(A,2))

% the bsxfun way
bsxfun(@plus,A,r)
bsxfun(@plus,A,c)

% the non-mathy way
A + r
A + c

%%


%% end.

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
