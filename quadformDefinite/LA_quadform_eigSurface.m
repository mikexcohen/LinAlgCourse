%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Quadratic form and definiteness
%      VIDEO: Eigenvectors and the quadratic form surface
% Instructor: sincxpress.com
% 
%%

% create a happy little symmetric matrix
A = [1 2; 2 3];

% weights along each dimension
xi = -2:.1:2;

quadform = zeros(length(xi));
for i=1:length(xi)
    for j=1:length(xi)
        
        % define the vector
        x = [xi(i) xi(j)]';
        
        % compute the quadratic form of matrix A
        quadform(i,j) = x'*A*x/(x'*x);
        
    end
end

figure(3), clf, hold on

% draw the surface
surf(xi,xi,quadform'), shading interp
title('Visual representation of quadratic form of matrix A')
xlabel('W_1'), ylabel('W_2'), zlabel('energy')
rotate3d on, axis square

% eigendecomposition
[V,D] = eig(A);
V = V*2; % stretch for visualization

% plot the eigenvectors
zfact = max(quadform(:));
plot3([0 V(1,1)],[0 V(2,1)],[1 1]*zfact,'r','linew',5)
plot3([0 V(1,2)],[0 V(2,2)],[1 1]*zfact,'k','linew',5)

%% done.
