%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Algebraic and geometric interpretations
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

%% creating and plotting vectors


% 2-dimensional row vector
v2 = [ 3 -2 ];

% 3-dimensional row vector
v3 = [ 4 -3 2 ];

% row to column (or vice-versa):
v3'


% plot them
figure(1), clf
subplot(211)

% the main plotting line:
plot([0 v2(1)],[0 v2(2)],'linew',2)

% this code just makes the plot look nicer
axis square
axis([ -4 4 -4 4 ])
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
xlabel('X_1 dimension')
ylabel('X_2 dimension')


% plot the 3D vector
subplot(212)

% the main plotting code:
plot3([0 v3(1)],[0 v3(2)],[0 v3(3)],'linew',2)

% make the plot look nicer
axis square
axis([ -4 4 -4 4 -4 4 ])
hold on, grid on
plot3(get(gca,'xlim'),[0 0],[0 0],'k--')
plot3([0 0],get(gca,'ylim'),[0 0],'k--')
plot3([0 0],[0 0],get(gca,'zlim'),'k--')
xlabel('X_1 dimension')
ylabel('X_2 dimension')
zlabel('X_3 dimension')

% might be easier to see when rotated
rotate3d on 


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector addition/subtraction
% Instructor: sincxpress.com
%
%%

v1 = [ 3 -1 ];
v2 = [ 2  4 ];

v3 = v1+v2;


% plot them
figure(2), clf

% the main plotting lines:
plot([0 v1(1)],[0 v1(2)],'b','linew',2)
hold on
plot([0 v2(1)]+v1(1),[0 v2(2)]+v1(2),'r','linew',2)
plot([0 v3(1)],[0 v3(2)],'k','linew',3)
legend({'v1';'v2';'v1+v2'},'AutoUpdate','off')

% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*6)
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
xlabel('X_1 dimension')
ylabel('X_2 dimension')


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector-scalar multiplication
% Instructor: sincxpress.com
%
%%

v1 = [ 3 -1 ];
l  = -.3;


% plot them
figure(3), clf

% the main plotting lines:
plot([0 v1(1)],[0 v1(2)],'b','linew',2)
hold on
plot([0 v1(1)]*l,[0 v1(2)]*l,'r:','linew',4)
legend({'v1';'v2'},'AutoUpdate','off')

% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*max([norm(v1) norm(v1*l)]))
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
xlabel('X_1 dimension')
ylabel('X_2 dimension')


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector-vector multiplication: the dot product
% Instructor: sincxpress.com
%
%%

%% many ways to compute the dot product

v1 = [ 1 2 3 4 5  ];
v2 = [ 0 -4 -3 6 5 ];

% method 1
dp = sum( v1.*v2 );

% method 2
dp = dot( v1,v2 );

% method 3
dp = v1*v2';

% method 4
dp = 0; % initialize

% loop over elements
for i=1:length(v1)
    
    % multiply corresponding element and sum
    dp = dp + v1(i)*v2(i);
end


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Dot product properties: associative and distributive
% Instructor: sincxpress.com
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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector length
% Instructor: sincxpress.com
%
%%

v1 = [ 1 2 3 4 5 6 ];

% methods 1-4, just like with the regular dot product, e.g.:
vl = sqrt( sum(v1.*v1) );

% method 5: take the norm
vl = norm(v1);

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: The dot product from a geometric perspective
% Instructor: sincxpress.com
%
%%


% two vectors
v1 = [ 2  4 -3 ];
v2 = [ 0 -3 -3 ];

% compute the angle (radians) between two vectors
ang = acos( dot(v1,v2) / (norm(v1)*norm(v2)) );


% draw them
figure(4), clf
plot3([0 v1(1)],[0 v1(2)],[0 v1(3)],'b','linew',2)
hold on
plot3([0 v2(1)],[0 v2(2)],[0 v2(3)],'r','linew',2)

axmax = max([ norm(v1) norm(v2) ]);
axis([-1 1 -1 1 -1 1]*axmax)
grid on, rotate3d on, axis square
title([ 'Angle between vectors: ' num2str(rad2deg(ang)) '^0' ])

%% equivalence of algebraic and geometric dot product formulas

% two vectors
v1 = [ 2  4 -3 ];
v2 = [ 0 -3 -3 ];


% algebraic
dp_a = sum( v1.*v2 );

% geometric
dp_g = norm(v1)*norm(v2)*cos(ang);

% print dot product to command
disp([ 'Algebra: ' num2str(dp_a) ', geometry: ' num2str(dp_g) ])


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector Hadamard multiplication
% Instructor: sincxpress.com
%
%%

w1 = [ 1 3 5 ];
w2 = [ 3 4 2 ];

w3 = w1 .* w2


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector outer product
% Instructor: sincxpress.com
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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector cross product
% Instructor: sincxpress.com
%
%%

% create vectors
v1  = [ -3  2 5 ];
v2  = [  4 -3 0 ];

% MATLAB's cross-product function
v3a = cross( v1,v2 );

% "manual" method
v3b = [ v1(2)*v2(3) - v1(3)*v2(2) ;
        v1(3)*v2(1) - v1(1)*v2(3) ;
        v1(1)*v2(2) - v1(2)*v2(1) ];

    
%%% draw the vectors and the plane they span
figure(5), clf, hold on
h = ezmesh( @(s,t)v1(1)*s+v2(1)*t , @(s,t)v1(2)*s+v2(2)*t , @(s,t)v1(3)*s+v2(3)*t , [-1 1 -1 1]*2);
set(h,'facecolor','g','cdata',ones(50),'EdgeColor','none')

% individual vectors
plot3([0 v1(1)],[0 v1(2)],[0 v1(3)],'k','linew',3)
plot3([0 v2(1)],[0 v2(2)],[0 v2(3)],'k','linew',3)
plot3([0 v3a(1)],[0 v3a(2)],[0 v3a(3)],'r--','linew',3)

% make the plot look a bit nicer
xlabel('R_1'), ylabel('R_2'), zlabel('R_3')
axis square
grid on, rotate3d on, hold on
title('')

    
%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Hermitian transpose (a.k.a. conjugate transpose)
% Instructor: sincxpress.com
%
%%

% create a complex number
z = complex(3,4);

% magnitude
norm(z)

% by transpose?
transpose(z)*z

% by Hermitian transpose
z'*z

% not the Hermitian:
z.'*z



% complex vector
v = [ 3 4i 5+2i complex(2,-5) ];
v'
v.'
transpose(v)

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Interpreting and creating unit vectors
% Instructor: sincxpress.com
%
%%

% vector
v1 = [ -3 6 ];

% mu
mu = 1/norm(v1);


% plot them
figure(5), clf

% the main plotting lines:
plot([0 v1(1)],[0 v1(2)],'b','linew',2)
hold on
plot([0 v1(1)]*mu,[0 v1(2)]*mu,'r:','linew',4)
legend({'v1';'v1-unit'},'AutoUpdate','off')

% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*norm(v1))
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
xlabel('X_1 dimension')
ylabel('X_2 dimension')

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Span
% Instructor: sincxpress.com
%
%%

% set S
S = [ [1 1 0]' [1 7 0]' ]; 

% vectors v and w
v = [1 2 0]';
w = [3 2 1]';


figure(6), clf, hold on
plot3([0 S(1,1)],[0 S(2,1)],[0 S(3,1)],'g','linew',3)
plot3([0 S(1,2)],[0 S(2,2)],[0 S(3,2)],'g','linew',3)

plot3([0 v(1)],[0 v(2)],[0 v(3)],'k','linew',3)
plot3([0 w(1)],[0 w(2)],[0 w(3)],'b','linew',3)

% draw the plane spanned by S
normvec = cross(S(:,1),S(:,2));
[X,Y] = meshgrid(-4:4,-4:4);
z = -(normvec(1)*X + normvec(2)*Y)/normvec(3);
surf(X,Y,z)
shading interp

axis square
grid on, rotate3d on

%% end.

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
