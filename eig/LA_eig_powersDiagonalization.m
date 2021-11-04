%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Matrix powers via diagonalization
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
