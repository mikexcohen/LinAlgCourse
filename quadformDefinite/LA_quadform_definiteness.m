%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Quadratic form and definiteness
%      VIDEO: Matrix definiteness, geometry, and eigenvalues
% Instructor: sincxpress.com
% 
%%


% some different matrices
S{1} = [ 4 4; 4 9 ];
S{2} = [ -4 -1; -3 -5 ];
S{3} = [ 0 1; 2 0 ];
S{4} = [ 1 1; 1 1 ];
S{5} = [ -1 -2; -3 -6 ];

% range for vector w
n = 30;
wRange = linspace(-2,2,n);

% initialize quadratic form matrix
qf = zeros(length(wRange),length(wRange));

figure(6), clf
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
    subplot(2,3,i)
    surf(wRange,wRange,qf')
    
    % make it look a bit nicer
    shading interp, axis square
    set(gca,'clim',[-1 1]*max(abs(qf(:)))*.6)
    xlabel('w_1'), ylabel('w_2'), zlabel('Quad.form energy')
    
    
    %% compute the matrix's definiteness based on the eigenvalues
    
    % get eigenvalues
    evals = eig(S{i});
    
    % we care about their signs
    esign = sign(evals);
    
    % test for signs (note: this test is valid only for 2x2 matrices!)
    if sum(esign)==2
        defcat = 'Positive definite';
    elseif sum(esign)==1
        defcat = 'Positive semidefinite';
    elseif sum(esign)==0
        defcat = 'Indefinite';
    elseif sum(esign)==-1
        defcat = 'Negative semidefinite';
    elseif sum(esign)==-2
        defcat = 'Negative definite';
    end
    
    % add title
    title([ defcat ' matrix' ])
    
end


%% done.
