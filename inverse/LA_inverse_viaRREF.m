%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix inverse
%      VIDEO: Computing the inverse via row reduction
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
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

%% done.
