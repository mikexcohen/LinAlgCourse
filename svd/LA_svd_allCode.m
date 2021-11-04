%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Singular value decomposition
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% the matrix
A = [3 0 5; 8 1 3];

[U,S,V] = svd(A);

figure(1), clf
subplot(141), imagesc(A)
axis square, axis off, title('A')

subplot(142), imagesc(U)
axis square, axis off, title('U')

subplot(143), imagesc(S)
axis square, axis off, title('\Sigma')

subplot(144), imagesc(V')
axis square, axis off, title('V^T')

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Relation between singular values and eigenvalues
% Instructor: sincxpress.com
% 
%%


%% case 1: eig(A'A) vs. svd(A)

A = [ 3 1 0; 1 1 0];

[ sort(nonzeros(eig(A'*A))) sort(svd(A)).^2 ]


%% case 2: eig(A'A) vs. svd(A'A)

[ sort(eig(A'*A)) sort(svd(A'*A)) ]

%% case 3a: eig(A) vs. svd(A), real-valued eigs

% need a square matrix for eig
A = [ 3 1 0; 1 1 0; 1 1 1];

[ sort(eig(A)) sort(svd(A)) ]

%% case 3b: eig(A) vs. svd(A), complex eigs

% random matrices are likely to give complex eigenvalues
A = randn(3);
[ sort(eig(A)) sort(svd(A)) ]



%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Spectral theory of matrices
% Instructor: sincxpress.com
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

% SVD
[U,S,V] = svd(A);


% color limit based on matrix range
clim = [-.5 .5]*max(abs(A(:)));

% show the constituent matrices
figure(2), clf
subplot(241), imagesc(A)
axis square, axis off, title('A')
set(gca,'clim',clim)

subplot(242), imagesc(U)
axis square, axis off, title('U')

subplot(243), imagesc(S)
axis square, axis off, title('\Sigma')
set(gca,'clim',clim)

subplot(244), imagesc(V')
axis square, axis off, title('V^T')

subplot(212)
plot(diag(S),'ks-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Component number'), ylabel('\sigma')
title('"Scree plot" of singular values')

%% now show the first 5 "layers" separately

figure(3), clf

rank1mats = zeros(5,m,n);

for i=1:5
    
    % create rank1 matrix
    rank1mats(i,:,:) = U(:,i)*S(i,i)*V(:,i)';
    
    subplot(2,5,i)
    imagesc(squeeze(rank1mats(i,:,:)))
    axis square, axis off
    set(gca,'clim',clim)
    title([ 'Component ' num2str(i) ])
    
    subplot(2,5,i+5)
    imagesc(squeeze(sum(rank1mats(1:i,:,:),1)))
    axis square, axis off
    set(gca,'clim',clim)
    title([ 'Components 1:' num2str(i) ])
end

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: SVD for low-rank approximations
% Instructor: sincxpress.com
% 
%%

%%% NOTE: run the code above to generate the data and SVD

% number of components (singular "layers") to keep
nComps = 5;

% reduced matrices
Ur = U(:,1:nComps);
Sr = S(1:nComps,1:nComps);
Vr = V(:,1:nComps);

% low-rank apporoximation
reconImage = Ur*Sr*Vr';

% rank (confirm same as nComps)
rank(reconImage)

% error map and percent difference from original matrix
errormap = (reconImage-A).^2;
pctdiff  = 100*norm(reconImage-A)/norm(A);

% show the results!
figure(4), clf
subplot(131), imagesc(A)
axis square, axis off
set(gca,'clim',clim)

subplot(132), imagesc(reconImage)
axis square, axis off
set(gca,'clim',clim)

subplot(133), imagesc(errormap)
axis square, axis off
set(gca,'clim',clim)


% put SVD results into structure (ease of size comparison)
mapRecn.U = Ur;
mapRecn.S = Sr;
mapRecn.V = Vr;

% get variable information
reconsize = whos('mapRecn');
origsize  = whos('A');

% display compression
disp([ num2str(100-100*reconsize.bytes/origsize.bytes) '% compression and ' ...
       num2str(pctdiff) '% error for r=' num2str(nComps) ' low-rank approximation.' ])
   

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Convert singular values to percent variance
% Instructor: sincxpress.com
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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: SVD, matrix inverse, and pseudoinverse
% Instructor: sincxpress.com
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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Condition number of a matrix
% Instructor: sincxpress.com
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

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
