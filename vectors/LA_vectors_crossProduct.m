%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: Vector cross product
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%

% create vectors
v1  = [ -3  2 5 ];
v2  = [  4 -3 0 ];

% MATLAB's cross-product function
v3a = cross( v1,v2 );

% "manual" method
v3b = [ v1(2)*v2(3) - v1(3)*v2(2) ;
        v1(3)*v2(1) - v1(1)*v2(3) ;
        v1(1)*v2(2) - v1(2)*v2(1) ];

    
%%% draw the vectors and the plane they span
figure(5), clf, hold on
h = ezmesh( @(s,t)v1(1)*s+v2(1)*t , @(s,t)v1(2)*s+v2(2)*t , @(s,t)v1(3)*s+v2(3)*t , [-1 1 -1 1]*2);
set(h,'facecolor','g','cdata',ones(50),'EdgeColor','none')

% individual vectors
plot3([0 v1(1)],[0 v1(2)],[0 v1(3)],'k','linew',3)
plot3([0 v2(1)],[0 v2(2)],[0 v2(3)],'k','linew',3)
plot3([0 v3a(1)],[0 v3a(2)],[0 v3a(3)],'r--','linew',3)

% make the plot look a bit nicer
xlabel('R_1'), ylabel('R_2'), zlabel('R_3')
axis square
grid on, rotate3d on, hold on
title('')

%% done.
