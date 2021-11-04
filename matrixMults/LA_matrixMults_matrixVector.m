%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: Matrix-vector multiplication
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% number of elements
m = 4;

% create matrices
N = round( 10*randn(m) );
S = round( N'*N/m^2 ); % scaled symmetric

% and vector
w = [-1 0 1 2]'; % transpose to get a column vector


% with symmetric matrix
S*w    % 1
(S*w)' % 2
w*S    % 3
w'*S'  % 4
w'*S   % 5


% with nonsymmetric matrix
N*w    % 1
(N*w)' % 2
w*N    % 3
w'*N'  % 4
w'*N   % 5

%% done.
