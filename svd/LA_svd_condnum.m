%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Condition number of a matrix
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%


% matrix sizes
m = 40;

% define a 2D Gaussian for smoothing
k     = round(m/2); % try denominators from .1 to 10
[X,Y] = meshgrid(linspace(-3,3,k));
g2d   = exp( -(X.^2 + Y.^2)/(k/8) );

% matrix
A = randn(m);
A = conv2(randn(m),g2d,'same');


% SVD (we need only the singular values,
%      not the singular vectors)
s = svd(A);

% compute condition number
condnum = s(1)/s(end);

% or let MATLAB do it:
%condnum = cond(A);

% show the matrix
figure(6), clf
subplot(211)
imagesc(A), axis square, axis off
title([ 'Condition number: ' num2str(condnum) ])

subplot(212)
plot(s,'ks-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Component number'), ylabel('\sigma')
title('"Scree plot" of singular values')

%% sphere created from a 3x3 matrix to illustrate the "spread" idea

% the transformation matrix T
T = eye(3);
% T(end) = .5;

% create the spherical coordinates
[x,y,z] = sphere;

% impose the transformation matrix onto the sphere coordinates
M = [x(:) y(:) z(:)]';
TM = T*M;

% reshape back to new coordinates
xp = reshape(TM(1,:),[21 21]); % note: 21 is default resolution for sphere function
yp = reshape(TM(2,:),[21 21]);
zp = reshape(TM(3,:),[21 21]);

% and plot
figure(7), clf
surf(xp,yp,zp)
shading interp

axis([-1 1 -1 1 -1 1])
axis square, rotate3d on
title([ 'Transformation matrix \kappa: ' num2str(cond(T)) ])

%% done.
