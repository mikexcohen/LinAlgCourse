%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: Spectral theory of matrices
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

%% done.
