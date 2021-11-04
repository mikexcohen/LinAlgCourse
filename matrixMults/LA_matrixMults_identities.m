%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Additive and multiplicative matrix identities
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
