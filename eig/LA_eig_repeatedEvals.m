%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Eigenvectors of repeated eigenvalues
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
