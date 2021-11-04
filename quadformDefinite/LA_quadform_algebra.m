%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Quadratic form and definiteness
%      VIDEO: The quadratic form in algebra
% Instructor: sincxpress.com
% 
%%

% matrix and vector
S = [ 1 3 -2; 0 3 4; -5 -2 4 ];
w = [ -2 4 3 ]';

% compute the quadratic form
qf = w'*S*w;


n = length(w); % used for plotting

% show the matrices
figure(1), clf
subplot(131)
imagesc(S)
axis square, axis off
title('Matrix S')

subplot(132)
imagesc(w)
axis square, axis off
set(gca,'xlim',[.5 n+.5]-n/3)
title('Vector w')

subplot(133)
imagesc(qf)
axis square, axis off
set(gca,'xlim',[.5 n+.5]-n/3,'ylim',[.5 n+.5]-n/3)
title('Quadratic form: w^TSw')

%% done.
