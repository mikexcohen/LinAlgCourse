%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: The pseudoinverse, part 1
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

%% run the code from the previous video before running this cell!

% pseudoinverse of rectangular matrix A
pseudoInvA = pinv(A);

subplot(334), imagesc(pseudoInvA), axis image, axis off
title('MP Pseudoinverse of A')


subplot(337), imagesc(pseudoInvA*A), axis image, axis off
title('A^*A')

%%

% create random matrix
n = 50;
A = randn(n);

% make rank deficient by repeating a column
A(:,end) = A(:,end-1);

% rank of A!
rank(A)


% compute the pseudoinverse
Ai = pinv(A);


% and show the matrices
figure(5), clf
subplot(221), imagesc(A), axis square, axis off
title('A'), set(gca,'fontsize',20)

subplot(222), imagesc(Ai), axis square, axis off
title('A^*'), set(gca,'fontsize',20)

subplot(223), imagesc(Ai*A), axis square, axis off
title('A^*A'), set(gca,'fontsize',20)

subplot(224), imagesc(A*Ai), axis square, axis off
title('AA^*'), set(gca,'fontsize',20)

%% done.
