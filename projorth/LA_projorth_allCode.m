%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Projections and orthogonalization
%      VIDEO: Projections in R^2
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% point b
b = [ 4 1 ]';

% line a
a = [ 2 5 ]';

% beta
beta = (a'*b) / (a'*a);

% draw!
figure(1), clf
plot(b(1),b(2),'ko','markerfacecolor','m','markersize',20)
hold on
plot([0 a(1)],[0 a(2)],'b','linew',3)

% now plot projection line
plot([b(1) beta*a(1)],[b(2) beta*a(2)],'r--','linew',3)

legend({'b';'a';'b-\betaa'})
axis([-1 1 -1 1]*max([norm(a) norm(b)]))
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'xlim'),'k--')
axis square


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Projections and orthogonalization
%      VIDEO: Projections in R^N
% Instructor: sincxpress.com
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

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Projections and orthogonalization
%      VIDEO: QR decomposition
% Instructor: sincxpress.com
% 
%%

%% example from the slides

A = [ 1 0;
      1 0;
      0 1];
  
% "full" QR decomposition
[Q,R] = qr(A);

% "economy" QR decompmosition
[Q,R] = qr(A,0);


%% another example

% the to-be-decomposed matrix
M = [ 1  1 -2 ; 
      3 -1  1 ];

% QR decomposition
[Q,R] = qr(M);

% notice:
R
Q'*M

% plot
figure(4), clf
colorz = 'krg';

for i=1:size(M,2)
    
    % plot original vector M
    plot([0 M(1,i)],[0 M(2,i)],colorz(i),'linew',3), hold on
    
    % plot orthogonalized vector Q
    if i<=size(Q,2)
        plot([0 Q(1,i)],[0 Q(2,i)],[colorz(i) '--'],'linew',2)
    end
    
    % plot residual vector R
    plot([0 R(1,i)],[0 R(2,i)],[colorz(i) ':'],'linew',2)
end
legend({'M_1';'Q_1';'R_1'})


axis([-1 1 -1 1]*norm(M))
axis square
grid on

%% done

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
