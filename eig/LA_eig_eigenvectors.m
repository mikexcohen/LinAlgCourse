%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Finding eigenvectors
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
