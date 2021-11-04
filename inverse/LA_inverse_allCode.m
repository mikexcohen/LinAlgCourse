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

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: Computing the inverse via row reduction
% Instructor: sincxpress.com
% 
%%

% matrix size
m = 4;

% random integers matrix
A = round( 10*randn(m) );

% augment A and identity
Aaug = [ A eye(m) ];
size(Aaug)

% rref
Asol = rref(Aaug);

Ainvrref = Asol(:,m+1:end);
Ainv = inv(A);


% show the augemented matrices
figure(2), clf
subplot(211), imagesc(Aaug)
title('A|I'), axis off
set(gca,'clim',[-1 1]*max(abs(Aaug(:)))*.5)

subplot(212), imagesc(Asol)
title('I|A^{-1}'), axis off
set(gca,'clim',[-1 1]*max(abs(Asol(:)))*.25)


% show the square matrices
figure(3), clf
subplot(131), imagesc(A)
title('Matrix A'), axis square, axis off

subplot(132), imagesc(Ainvrref)
title('Matrix A^{-1} from rref'), axis square, axis off

subplot(133), imagesc(Ainv)
title('A^{-1} from inv() function'), axis square, axis off


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: Left inverse and right inverse
% Instructor: sincxpress.com
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


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: The pseudoinverse, part 1
% Instructor: sincxpress.com
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

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
