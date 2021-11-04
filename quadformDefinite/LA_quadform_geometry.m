%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Quadratic form and definiteness
%      VIDEO: The quadratic form in geometry
% Instructor: sincxpress.com
% 
%%

% some different matrices
S{1} = [ -9 4; 4 9 ];
S{2} = [ -4 -1; 3 -5 ];
S{3} = [ 0 1; 2 0 ];
S{4} = [ 1 1; 1 1 ];

% range for vector w
n = 30;
wRange = linspace(-2,2,n);

% initialize quadratic form matrix
qf = zeros(length(wRange),length(wRange));

figure(2), clf
for i=1:length(S)
    
    
    % compute QF
    for xi=1:n
        for yi=1:n
            
            % this w
            w = [ wRange(xi) wRange(yi) ]';
            
            % QF
            qf(xi,yi) = w'*S{i}*w;
        end
    end
    
    % show the surface
    subplot(2,2,i)
    surf(wRange,wRange,qf')
    
    % make it look a bit nicer
    shading interp, axis square
    set(gca,'fontsize',12,'clim',[-1 1]*max(abs(qf(:)))*.6)
    xlabel('w_1'), ylabel('w_2'), zlabel('Quad.form energy')
end

rotate3d on

%% done.
