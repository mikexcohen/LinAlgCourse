%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Introduction
%      VIDEO: An enticing start to a linear algebra course!
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% import picture
% (taken from https://en.wikipedia.org/wiki/Albert_Einstein_in_popular_culture)
pic = imread('Einstein_tongue.jpg');

% let's have a look
figure(1), clf
imagesc(pic)


% we need to convert it to floating-point precision
pic = double(pic);
imagesc(pic)
colormap gray


%% SVD (singular value decomposition)

% do the SVD. Note: You'll understand this decomposition by the end of the
% course! Don't worry if it seems mysterious now!
[U,S,V] = svd( pic );

% plot the spectrum
figure(2), clf
plot(diag(S),'s-')
set(gca,'xlim',[0 100])
xlabel('Component number')
ylabel('Singular value (\sigma)')

%% reconstruct the image based on some components

% list the components you want to use for the reconstruction
comps = 20:151;

% reconstruct the low-rank version of the picture
reconPic = U(:,comps)*S(comps,comps)*V(:,comps)';


% show the original and reconstructed pictures for comparison
figure(3), clf
subplot(121)
imagesc(pic)
axis square
title('Original')


subplot(122)
imagesc(reconPic)
axis square
title([ 'Components ' num2str(comps(1)) '-' num2str(comps(end)) ])

colormap gray

%%% Aren't you SUPER-curious to know what all of this means and why it
%   works!!??! You're going to learn all about this in the course!

%% .
