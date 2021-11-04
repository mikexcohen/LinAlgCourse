%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix rank
%      VIDEO: Rank of A^TA and AA^T
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% matrix sizes
m = 14;
n =  3;

% create matrices
A = round( 10*randn(m,n) );

AtA = A'*A;
AAt = A*A';

fprintf('\n AtA: %gx%g, rank=%g',size(AtA,1),size(AtA,2),rank(AtA));
fprintf('\n AAt: %gx%g, rank=%g\n',size(AAt,1),size(AAt,2),rank(AAt));

%% done.
