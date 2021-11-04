%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Solving systems of equations
%      VIDEO: Systems of equations: algebra and geometry
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% these are the coefficients of the equation:
% ay = bx + c;
eq1o = [1 2 1]; % [a b c]
eq2o = [2 1 3];

figure(1), clf
plotlim = [-10 10];

for i=1:10
    
    % randomly update equations
    eq1 = eq1o + randn*eq2o;
    eq2 = eq2o + randn*eq1o;
    
    % plot new lines (solutions)
    cla
    h(1) = fplot(@(x) (eq1(2)*x+eq1(3))/eq1(1), plotlim);
    hold on
    h(2) = fplot(@(x) (eq2(2)*x+eq2(3))/eq2(1), plotlim);
    set(h,'linew',3)
    
    % make plot look nicer
    axis([plotlim plotlim])
    plot(get(gca,'xlim'),[0 0],'k--')
    plot([0 0],get(gca,'xlim'),'k--')
    axis square
    grid on
    
    % wait to allow visual inspection
    pause(1)
end


%% repeat in R3

% these are the coefficients of the equation:
% az = bx + cy + d;
eq1o = [1 2 3 -1]; % [a b c d]
eq2o = [2 1 3 3];


figure(2), clf

for i=1:10
    
    % randomly update equations
    eq1 = eq1o + randn*eq2o;
    eq2 = eq2o + randn*eq1o;
    
    X = [eq1(1:3);eq2(1:3)];
    b = [eq1(4);eq2(4)];

    % plot new lines (solutions)
%     cla
    h(1) = fplot3(@(x)x, @(x) (x*eq1(2)+eq1(4))/eq1(1), @(x) (x*eq1(3)+eq1(4))/eq1(1), plotlim);
    hold on
    h(2) = fplot3(@(x)x, @(x) (x*eq2(2)+eq2(4))/eq2(1), @(x) (x*eq2(3)+eq2(4))/eq2(1), plotlim);
    set(h,'linew',3)
    axis(repmat(plotlim,1,3))
    
    % wait to allow visual inspection
%     pause(1)
end

% make plot look nicer
axis square, grid on, rotate3d on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'xlim'),'k--')
plot3([0 0],[0 0],get(gca,'zlim'),'k--')

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Solving systems of equations
%      VIDEO: Reduced row echelon form
% Instructor: sincxpress.com
% 
%%

% make some random matrices
A = randn(4,4);
B = randn(4,4);

% print out the matrix and its rref
[A rref(A)]
[B rref(B)]


% here's how you check your homework:
M = [ 1 2 4 5;
      2 4 5 4;
      4 5 4 2 ];

[M rref(M)]

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Solving systems of equations
%      VIDEO: Matrix spaces after row reduction
% Instructor: sincxpress.com
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

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
