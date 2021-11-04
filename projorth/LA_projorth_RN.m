%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Projections and orthogonalization
%      VIDEO: Projections in R^N
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%


% goal here is to solve Ax=b for x

% sizes
m = 16;
n = 10;

% vector b
b = randn(m,1);

% matrix A
A = randn(m,n);

% solution using explicit inverse
x1 = inv(A'*A) * (A'*b);

% preferred solution
x2 = (A'*A) \ (A'*b);

% also possible (version dependent)
x3 = A\b;

%% geometric perspective in R^3

m = 3;
n = 2;

% vector b
b = randn(m,1);

% matrix A
A = randn(m,n);

% solution
x = (A'*A) \ (A'*b);
Ax = A*x;

% draw the plane spanned by A
figure(2), clf
h = ezmesh( @(s,t)A(1,1)*s+A(1,2)*t , @(s,t)A(2,1)*s+A(2,2)*t , @(s,t)A(3,1)*s+A(3,2)*t , [-1 1 -1 1]*norm(x)*2);
set(h,'facecolor','g','cdata',ones(50),'EdgeColor','none')
xlabel('R_1'), ylabel('R_2'), zlabel('R_3')
axis square
grid on, rotate3d on, hold on

h(1) = fplot3( @(t)t*b(1), @(t)t*b(2), @(t)t*b(3) , [-1 1]);
h(2) = fplot3( @(t)t*Ax(1), @(t)t*Ax(2), @(t)t*Ax(3) , [-1 1]);
plot3(Ax(1),Ax(2),Ax(3),'ro','markerfacecolor','r','markersize',12)

set(h,'LineWidth',3)
title('')
legend({'C(A)';'b';'Ax'})

%% done.
