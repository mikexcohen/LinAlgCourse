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

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Finding eigenvectors
% Instructor: sincxpress.com
%
%%

% matrix
A = [1 2; 2 1];

% eigenvectors
[evecs,evals] = eig(A);

% convert eigenvalues to vector
evals = diag( evals );


% compute the norm of each eigenvector
mag_v1 = sqrt( sum(evecs(:,1).^2) );
mag_v2 = sqrt( sum(evecs(:,2).^2) );


% plot
figure(2), clf
plot([0 evecs(1,1)],[0 evecs(2,1)],'r','linew',3)
hold on
plot([0 evecs(1,2)],[0 evecs(2,2)],'k','linew',3)
legend({'v_1';'v_2'})


axis([-1 1 -1 1])
grid on, axis square
plot(get(gca,'xlim'),[0 0],'k')
plot([0 0],get(gca,'ylim'),'k')


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Diagonalization
% Instructor: sincxpress.com
%
%%

A = round(10*randn(4));
A = A'*A;

% eigendecomposition
[evecs,evals] = eig(A);

% test reconstruction
Ap = evecs * evals * inv(evecs);


% plot
figure(4), clf
subplot(121), imagesc(A)
axis square, axis off, title('A')

subplot(122), imagesc(Ap)
axis square, axis off, title('V\Lambda V^{-1}')


% subtract the two (should be zero with rounding errors)
recondiff = A-Ap

% reconstruction error (due to inverse numerical inaccuracies)
rmsA = sqrt( mean(recondiff(:).^2) );
disp([ 'Reconstruction RMS: ' num2str(rmsA) ])

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Matrix powers via diagonalization
% Instructor: sincxpress.com
%
%%

A = rand(2);

% compute matrix power directly
A^3 % A*A*A

% and via eigendecomposition
[V,D] = eig(A);
V * D^3 * inv(V)

%% eigenvalues of A and A^3

% create a symmetric matrix
A = rand(3);
A = A*A';

[V,D]   = eig(A);
[V3,D3] = eig(A^3);

% sort the results
[d,sidx] = sort(diag(D),'descend');
V = V(:,sidx);
D = diag(d);

[d,sidx] = sort(diag(D3),'descend');
V3 = V3(:,sidx);
D3 = diag(d);


figure(6), clf
subplot(221), imagesc(V)
axis square, title('evecs of A')

subplot(223), imagesc(V3)
axis square, title('evecs of A^3')

%% now plot their eigenvectors/values

% plot eigenvectors of A
subplot(222), hold on
plot3([0 V(1,1)],[0 V(2,1)],[0 V(3,1)],'r','linew',3)
plot3([0 V(1,2)],[0 V(2,2)],[0 V(3,2)],'k','linew',3)
plot3([0 V(1,3)],[0 V(2,3)],[0 V(3,3)],'b','linew',3)
axis([-1 1 -1 1 -1 1]), axis square
rotate3d on, grid on

% plot eigenvectors of A^3
plot3([0 V3(1,1)],[0 V3(2,1)],[0 V3(3,1)],'r--','linew',3)
plot3([0 V3(1,2)],[0 V3(2,2)],[0 V3(3,2)],'k--','linew',3)
plot3([0 V3(1,3)],[0 V3(2,3)],[0 V3(3,3)],'b--','linew',3)
title('Eigenvectors')


subplot(224)
plot(1:3,diag(D),'bs-','linew',3,'markersize',15,'markerfacecolor','w')
hold on
plot(1.1:3.1,diag(D3),'rs-','linew',3,'markersize',15,'markerfacecolor','w')
set(gca,'xlim',[.5 3.5]), axis square
title('Eigenvalues')
legend({'A';'A^3'})

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Eigenvectors of repeated eigenvalues
% Instructor: sincxpress.com
%
%%

% a matrix
A = [ 5   -1   0;
     -1    5   0;
     1/3 -1/3  4];

% its eigendecomposition
[V,D] = eig(A);

% sort eigenvalues
[D,sidx] = sort( diag(D) );
V = V(:,sidx);


% plot eigenvectors
figure(2), clf, hold on
plot3([0 V(1,1)],[0 V(2,1)],[0 V(3,1)],'k','linew',3)
plot3([0 V(1,2)],[0 V(2,2)],[0 V(3,2)],'r','linew',3)
plot3([0 V(1,3)],[0 V(2,3)],[0 V(3,3)],'b','linew',3)
legend({[ 'v_1 (\lambda=' num2str(D(1)) ')' ];[ 'v_1 (\lambda=' num2str(D(2)) ')' ];[ 'v_3 (\lambda=' num2str(D(3)) ')' ]})

% plot subspace spanned by same-eigenvalued eigenvectors
h = ezmesh( @(s,t)V(1,1)*s+V(1,2)*t , @(s,t)V(2,1)*s+V(2,2)*t , @(s,t)V(3,1)*s+V(3,2)*t , [-1 1 -1 1 -1 1]);
set(h,'facecolor','g','cdata',ones(50),'LineStyle','none')
xlabel('eig_1'), ylabel('eig_2'), zlabel('eig_3')
axis square, grid on, rotate3d on
title('')

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Eigendecomposition of symmetric matrices
% Instructor: sincxpress.com
%
%%

% create a random matrix
A = randn(14);

% make it symmetric (additive method)
A = A+A';

% diagonalize it
[evecs,evals] = eig(A);


% magnitudes of each vector
sqrt( sum(evecs.^2,1) )


% and make plots
figure(6), clf
subplot(131), imagesc(A)
axis square, axis off
title('A')

subplot(132), imagesc(evecs)
axis square, axis off
title('Eigenvectors')

subplot(133), imagesc(evecs*evecs')
axis square, axis off
title('VV^T')

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Generalized eigendecomposition
% Instructor: sincxpress.com
%
%%

% define matrices
A = [3 2; 1 3];
B = [1 1; 4 1];

% GED
[eigvecs,eigvals] = eig(A,B);


% matrix-vector multiplication
Av = A*eigvecs(:,2);
Bv = B*eigvecs(:,2);
BinvAv = inv(B)*A*eigvecs(:,2);


figure(1), clf
subplot(131)
plot([0 eigvecs(1,2)],[0 eigvecs(2,2)],'k','linew',4), hold on
plot([0 Av(1)],[0 Av(2)],'r--','linew',2)
axis square, axis([-1 1 -1 1]*3), plot(get(gca,'xlim'),[0 0],'k:'), plot([0 0],get(gca,'ylim'),'k:')
legend({'v_2';'Av_2'})
title('Av')


subplot(132)
plot([0 eigvecs(1,2)],[0 eigvecs(2,2)],'k','linew',4), hold on
plot([0 Bv(1)],[0 Bv(2)],'r--','linew',2)
axis square, axis([-1 1 -1 1]*3), plot(get(gca,'xlim'),[0 0],'k:'), plot([0 0],get(gca,'ylim'),'k:')
legend({'v_2';'Bv_2'})
title('Bv')


subplot(133)
plot([0 eigvecs(1,2)],[0 eigvecs(2,2)],'k','linew',4), hold on
plot([0 BinvAv(1)],[0 BinvAv(2)],'r--','linew',2)
axis square, axis([-1 1 -1 1]*3), plot(get(gca,'xlim'),[0 0],'k:'), plot([0 0],get(gca,'ylim'),'k:')
legend({'v_2';'B^{-1}Av_2'})
title('B^-^1Av')

%% done.

% Interested in more courses? See sincxpress.com
% Use code MXC-DISC4ALL for the lowest price for all courses.
