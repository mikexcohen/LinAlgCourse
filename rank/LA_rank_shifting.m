%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix rank
%      VIDEO: Making a matrix full-rank by "shifting"
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% size of matrix
m = 30;

% create the square symmetric matrix
A = randn(m);
A = round( 10*A'*A );

% reduce the rank
A(:,1) = A(:,2);

% shift amount (lambda)
l = .01;

% new matrix
B = A + l*eye(m);

disp([ 'rank(w/o shift)  = ' num2str(rank(A)) ])
disp([ 'rank(with shift) = ' num2str(rank(B)) ])

%% done.
