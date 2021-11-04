%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Eigendecomposition
%      VIDEO: Generalized eigendecomposition
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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
