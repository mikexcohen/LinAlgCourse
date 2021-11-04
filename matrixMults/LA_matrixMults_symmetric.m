%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Additive and multiplicative symmetric matrices
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
