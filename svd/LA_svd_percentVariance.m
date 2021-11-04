%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Convert singular values to percent variance
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% matrix sizes
m = 40;
n = 30;

% define a 2D Gaussian for smoothing
k = round((m+n)/4);
[X,Y] = meshgrid(linspace(-3,3,k));
g2d = exp( -(X.^2 + Y.^2)/(k/8) );


% matrix
A = conv2(randn(m,n),g2d,'same');

%%

Ascaled = A*1;

% SVD (need only singular values)
s = svd(Ascaled);

% convert to percent variance
spct = 100*s/sum(s);

% plot the singular values for comparison
figure(6), clf
subplot(211)
plot(s,'ks-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Component number'), ylabel('\sigma')
title('Raw singular values')

subplot(212)
plot(spct,'ks-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Component number'), ylabel('\sigma (% of total)')
title('Percent-change-normalized singular values')

%% done.
