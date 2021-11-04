%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: SVD, matrix inverse, and pseudoinverse
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%


% the matrix
A = [ 1 2 3;
      1 2 4; % hint: change 2->0 for invertible matrix to test
      1 2 5];
  
% SVD
[U,S,V] = svd(A);

% pseudoinvert S
nonzeroels = S>eps; % find nonzero elements
S(nonzeroels) = 1./S(nonzeroels); % invert only those elements

% now pseudoinvert A
Ai = V*S*U';

% it's sortof close to I...?
Ai*A

% compute with MATLAB's pinv
[ Ai pinv(A) ]

%% done.
