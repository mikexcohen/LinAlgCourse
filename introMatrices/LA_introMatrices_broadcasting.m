%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Broadcasting matrix arithmetic
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
