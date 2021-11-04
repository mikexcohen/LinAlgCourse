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

%% done.
