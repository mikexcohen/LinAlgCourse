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

%% done.
