%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Vectors
%      VIDEO: The dot product from a geometric perspective
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
%
%%


% two vectors
v1 = [ 2  4 -3 ];
v2 = [ 0 -3 -3 ];

% compute the angle (radians) between two vectors
ang = acos( dot(v1,v2) / (norm(v1)*norm(v2)) );


% draw them
figure(4), clf
plot3([0 v1(1)],[0 v1(2)],[0 v1(3)],'b','linew',2)
hold on
plot3([0 v2(1)],[0 v2(2)],[0 v2(3)],'r','linew',2)

axmax = max([ norm(v1) norm(v2) ]);
axis([-1 1 -1 1 -1 1]*axmax)
grid on, rotate3d on, axis square
title([ 'Angle between vectors: ' num2str(rad2deg(ang)) '^0' ])

%% equivalence of algebraic and geometric dot product formulas

% two vectors
v1 = [ 2  4 -3 ];
v2 = [ 0 -3 -3 ];


% algebraic
dp_a = sum( v1.*v2 );

% geometric
dp_g = norm(v1)*norm(v2)*cos(ang);

% print dot product to command
disp([ 'Algebra: ' num2str(dp_a) ', geometry: ' num2str(dp_g) ])

%% done.
