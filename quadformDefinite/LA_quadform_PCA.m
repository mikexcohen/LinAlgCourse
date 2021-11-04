%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Quadratic form and definiteness
%      VIDEO: Application of the normalized quadratic form: PCA
% Instructor: sincxpress.com
% 
%%


% simulation parameters
N = 1000; % time points
M =   20; % channels

% time vector (radian units)
t = linspace(0,6*pi,N);

% relationship across channels (imposing covariance)
chanrel = sin(linspace(0,2*pi,M))';

% create dataset
data = bsxfun(@times,repmat( sin(t),M,1 ),chanrel) + randn(M,N)/3;


% compute covariance matrix
data = bsxfun(@minus,data,mean(data,2));
covmat = data*data'/(N-1);

% visualize the data
figure(4), clf
subplot(121)
plot(t,bsxfun(@plus,data,(1:M)'))
set(gca,'ytick',[])
xlabel('Time'), ylabel('Channels')
axis tight, axis square
title('Channel data')


subplot(122)
imagesc(covmat)
axis square
xlabel('Channels'), ylabel('Channels')
title('Covariance matrix')


%% now for PCA


% eigendecomposition of covariance matrix
[evecs,evals] = eig( covmat );

% sort eigenvalues and eigenvectors
[evals,soidx] = sort( diag(evals),'descend' );
evecs = evecs(:,soidx);

% convert eigenvalues to percent variance explained
evals = 100*evals/sum(evals);


% compute component time series
r = 2; % two components
comp_time_series = evecs(:,1:r)'*data;


% visualize and interpret the results
figure(5), clf

% eigenvalues
subplot(231)
plot(evals,'s-','linew',2,'markerfacecolor','w')
axis square
xlabel('Component number'), ylabel('\lambda (% total variance)')

% eigenvectors
subplot(232)
plot(evecs(:,1:2),'s-','linew',2,'markerfacecolor','w')
axis square
xlabel('Channel'), ylabel('PC weight')
legend({'PC1';'PC2'})

% original channel modulator
subplot(233)
plot(chanrel,'s-','linew',2,'markerfacecolor','w')
axis square
xlabel('Channel'), ylabel('Ground truth')

% component time series
subplot(212)
plot(1:N,comp_time_series)
xlabel('Time (a.u.)'), ylabel('Activity')
legend({'PC1';'PC2'})

%% done.
