%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Quadratic form and definiteness
%      VIDEO: Quadratic form of generalized eigenvectors
% Instructor: sincxpress.com
% 
%%

% create two symmetric matrices
m = 14;
n = 1000;
A = bsxfun(@times,randn(m,n),cos(linspace(0,pi,m))');
A = A*A';

B = bsxfun(@times,randn(m,n),cos(linspace(0,pi,m))');
B = B*B';



% generalized eigendecomposition
[evecs,evals] = eig(A,B);


%%% some plotting
figure(5), clf

% W'W
subplot(231), imagesc(evecs'*evecs), axis square, title('W^TW')
tmp = evecs'*evecs;
subplot(234), plot(tmp(5,:),'s-'), axis square, title('W_j^TW')

% W'AW
subplot(232), imagesc(evecs'*A*evecs), axis square, title('W^TAW')
subplot(235), plot(diag(evecs'*A*evecs),'s-'), axis square, title('diag( W^TAW )')
hold on, plot(diag(evals),'rx')


% W'BW
subplot(233), imagesc(evecs'*B*evecs), axis square, title('W^TBW')
subplot(236), plot(diag(evecs'*B*evecs),'s-'), axis square, title('diag( W^TBW )')

%% done.
