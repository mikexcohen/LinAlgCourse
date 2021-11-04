%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: Left inverse and right inverse
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% m>n for left inverse,
% m<n for right inverse
m = 6;
n = 3;

% create matrices
A = randn(m,n);
AtA = A'*A;
AAt = A*A';

% inspect ranks
disp([ 'Rank of A^TA: ' num2str(rank(AtA)) ])
disp([ 'Rank of AA^T: ' num2str(rank(AAt)) ])

% left inverse
Aleft = inv(AtA)*A';

% right inverse
Aright = A'*inv(AAt);

% now test!
I_left  = Aleft  * A;
I_right = A * Aright;

% and then test using the inverse function
AtA_inv = inv(AtA);
I_AtA   = AtA_inv * AtA;

AAt_inv = inv(AAt);
I_AAt   = AAt_inv * AAt;


% show images
figure(4), clf
subplot(331), imagesc(A), axis image, axis off
title([ 'A, r=' num2str(rank(A)) ])

subplot(332), imagesc(AtA), axis image, axis off
title([ 'A^TA, r=' num2str(rank(AtA)) ])

subplot(333), imagesc(AAt), axis image, axis off
title([ 'AA^T, r=' num2str(rank(AAt)) ])

subplot(335), imagesc(Aleft), axis image, axis off
title('Left inverse: (A^TA)^{-1}A^T')

subplot(336), imagesc(Aright), axis image, axis off
title('Right inverse: A^T(AA^T)^{-1}')

subplot(338), imagesc(I_left), axis image, axis off
title('[ (A^TA)^{-1}A^T ]  A')

subplot(339), imagesc(I_right), axis image, axis off
title('A  [ A^T(AA^T)^{-1} ]')

%% done.
