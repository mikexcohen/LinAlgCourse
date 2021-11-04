%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: Concept and uses of the inverse
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% size of square matrix
m = 3;

% generate random matrix
A = randn(m);

% compute its inverse
Ainv = inv(A);

% and check the multiplication
id = A*Ainv;


% show in an image
figure(1), clf
subplot(131), imagesc(A)
title('Matrix A'), axis square, axis off

subplot(132), imagesc(Ainv)
title('Matrix A^{-1}'), axis square, axis off

subplot(133), imagesc(id)
title('AA^{-1}'), axis square, axis off

%% done.
