%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Finding eigenvalues
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%


% matrix
A = [1 5; 2 4];

% extract the eigenvalues
eigvals = eig(A);


% specify two vectors
v1 = [ 1 1 ]';   % is an eigenvector!
v2 = randn(2,1); % unlikely to be an eigenvector
v2 = v2/norm(v2);% unit length for convenience

% compute Av
Av1 = A*v1;
Av2 = A*v2;


% plot the vectors and Av
figure(1), clf
plot([0 v1(1)],[0 v1(2)],'r','linew',4)
hold on
plot([0 Av1(1)],[0 Av1(2)],'r--','linew',2)
plot([0 v2(1)],[0 v2(2)],'k','linew',4)
plot([0 Av2(1)],[0 Av2(2)],'k--','linew',2)
legend({'v';'Av';'w';'Aw'})

lim = max([Av1(:); Av2(:)])*1.2;
axis([-1 1 -1 1]*lim)
grid on, axis square
plot(get(gca,'xlim'),[0 0],'k')
plot([0 0],get(gca,'ylim'),'k')


%% eigenvalues of a 3x3 matrix

% specify matrix
A = [ -2  2 -3 ;
      -4  1 -6 ;
      -1 -2  0 ];

% get eigenvalues
eig(A)

%% done.
