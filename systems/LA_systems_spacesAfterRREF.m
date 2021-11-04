%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Solving systems of equations
%      VIDEO: Matrix spaces after row reduction
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% create matrix
M = [ 1 2;
      3 7;
      9 1 ];

% obtain RREF
Mr = rref(M);


% draw the planes spanned by M and Mr
figure(3), clf, hold on
h1 = ezmesh(@(s,t)M(1,1)*s+M(1,2)*t,@(s,t)M(2,1)*s+M(2,2)*t,@(s,t)M(3,1)*s+M(3,2)*t,[-1 1 -1 1 -1 1]/4);
h2 = ezmesh(@(s,t)Mr(1,1)*s+Mr(1,2)*t,@(s,t)Mr(2,1)*s+Mr(2,2)*t,@(s,t)Mr(3,1)*s+Mr(3,2)*t,[-1 1 -1 1 -1 1]);

% adjust colors for visibility
set(h1,'facecolor','g','cdata',ones(50),'LineStyle','none')
set(h2,'facecolor','m','cdata',zeros(50),'LineStyle','none')

% draw basis vectors (normalized)
M  = M/norm(M);
plot3([0 M(1,1)],[0 M(2,1)],[0 M(3,1)],'k','linew',2)
plot3([0 M(1,2)],[0 M(2,2)],[0 M(3,2)],'k','linew',2)

plot3([0 Mr(1,1)],[0 Mr(2,1)],[0 Mr(3,1)],'y','linew',2)
plot3([0 Mr(1,2)],[0 Mr(2,2)],[0 Mr(3,2)],'y','linew',2)

% make plot a bit nicer
xlabel('M_1'), ylabel('M_2'), zlabel('M_3')
axis square
grid on, rotate3d on
title('')
legend({'C(M)';'C(rref(M))'})

%% done.
