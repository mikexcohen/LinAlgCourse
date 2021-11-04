%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Order of operations on matrices
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
