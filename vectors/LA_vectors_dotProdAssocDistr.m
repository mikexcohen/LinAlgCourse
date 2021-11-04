%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Dot product properties: associative and distributive
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

%% Distributive property

% create random vectors
n = 10;
a = randn(n,1);
b = randn(n,1);
c = randn(n,1);

% the two results
res1 = a' * (b+c);
res2 = a'*b + a'*c;

% compare them
disp([ res1 res2 ])

%% Associative property

% create random vectors
n = 10;
a = randn(n,1);
b = randn(n,1);
c = randn(n,1);

% compute results
res1 = a' * (b'*c);
res2 = (a'*b)' * c;

disp([ res1' res2 ])

%%% special cases where associative property works!
% 1) one vector is the zeros vector
% 2) a==b==c

%% done.
