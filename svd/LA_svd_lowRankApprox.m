%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Singular value decomposition
%      VIDEO: SVD for low-rank approximations
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

%%% NOTE: run the code above to generate the data and SVD

% number of components (singular "layers") to keep
nComps = 5;

% reduced matrices
Ur = U(:,1:nComps);
Sr = S(1:nComps,1:nComps);
Vr = V(:,1:nComps);

% low-rank apporoximation
reconImage = Ur*Sr*Vr';

% rank (confirm same as nComps)
rank(reconImage)

% error map and percent difference from original matrix
errormap = (reconImage-A).^2;
pctdiff  = 100*norm(reconImage-A)/norm(A);

% show the results!
figure(4), clf
subplot(131), imagesc(A)
axis square, axis off
set(gca,'clim',clim)

subplot(132), imagesc(reconImage)
axis square, axis off
set(gca,'clim',clim)

subplot(133), imagesc(errormap)
axis square, axis off
set(gca,'clim',clim)


% put SVD results into structure (ease of size comparison)
mapRecn.U = Ur;
mapRecn.S = Sr;
mapRecn.V = Vr;

% get variable information
reconsize = whos('mapRecn');
origsize  = whos('A');

% display compression
disp([ num2str(100-100*reconsize.bytes/origsize.bytes) '% compression and ' ...
       num2str(pctdiff) '% error for r=' num2str(nComps) ' low-rank approximation.' ])
   
%% done.
