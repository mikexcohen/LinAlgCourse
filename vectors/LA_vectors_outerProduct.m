%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector outer product
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

v1 = [  1 2 3 ]'; % transpose (') to make column vectors
v2 = [ -1 0  ]';

% dot (inner) product!
v1'*v2

% outer product
v1*v2'

% terrible programming, but helps conceptually:
op = zeros(length(v1),length(v2));
for i=1:length(v1)
    for j=1:length(v2)
        op(i,j) = v1(i) * v2(j);
    end
end

%% done.
