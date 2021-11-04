%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Matrix multiplication
%      VIDEO: 2D transformation matrices
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%


% 2D input vector
v = [ 3 -2 ];

% 2x2 transformation matrix
A = [ 1 -1;
      2  1 ];

% output vector is Av (convert v to column)
w = A*v';


% plot them
figure(1), clf

% the main plotting line:
plot([0 v(1)],[0 v(2)],'k','linew',2)
hold on
plot([0 w(1)],[0 w(2)],'r','linew',3)


% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*max([norm(v) norm(w)]))
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
legend({'v';'Av'})
title('Rotation + stretching')

%% pure rotation matrix

% 2D input vector
v = [ 3 -2 ];

% rotation angle (specify in radians)
theta = pi/30;

% 2x2 transformation matrix
A = [ cos(theta) -sin(theta);
      sin(theta) cos(theta) ];

% output vector is Av (convert v to column)
w = A*v';


% plot them
figure(2), clf

% the main plotting line:
plot([0 v(1)],[0 v(2)],'k','linew',2)
hold on
plot([0 w(1)],[0 w(2)],'r','linew',3)


% this code just makes the plot look nicer
axis square
axis([ -1 1 -1 1 ]*max([norm(v) norm(w)]))
hold on
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'ylim'),'k--')
legend({'v';'Av'})
title('Pure rotation')

%% done.
