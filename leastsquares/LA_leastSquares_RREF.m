%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Least-squares and statistics
%      VIDEO: Least-squares via row-reduction
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

m = 10;
n = 3;

% create data
X = randn(m,n); % design matrix
y = randn(m,1); % outcome measures (data)

% try directly applying RREF
rref([ X y ])

% now reapply to the normal equations
Xsol = rref([ X'*X X'*y ]);
beta = Xsol(:,end);

% compare to left-inverse
beta2 = (X'*X)\(X'*y);

% even simpler (MATLAB version-dependent)
beta3 = X\y;

%% done.
