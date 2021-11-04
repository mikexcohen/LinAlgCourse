%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction to matrices
%      VIDEO: Diagonal and trace
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
