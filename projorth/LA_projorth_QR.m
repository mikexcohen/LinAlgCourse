%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Projections and orthogonalization
%      VIDEO: QR decomposition
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

%% example from the slides

A = [ 1 0;
      1 0;
      0 1];
  
% "full" QR decomposition
[Q,R] = qr(A);

% "economy" QR decompmosition
[Q,R] = qr(A,0);


%% another example

% the to-be-decomposed matrix
M = [ 1  1 -2 ; 
      3 -1  1 ];

% QR decomposition
[Q,R] = qr(M);

% notice:
R
Q'*M

% plot
figure(4), clf
colorz = 'krg';

for i=1:size(M,2)
    
    % plot original vector M
    plot([0 M(1,i)],[0 M(2,i)],colorz(i),'linew',3), hold on
    
    % plot orthogonalized vector Q
    if i<=size(Q,2)
        plot([0 Q(1,i)],[0 Q(2,i)],[colorz(i) '--'],'linew',2)
    end
    
    % plot residual vector R
    plot([0 R(1,i)],[0 R(2,i)],[colorz(i) ':'],'linew',2)
end
legend({'M_1';'Q_1';'R_1'})


axis([-1 1 -1 1]*norm(M))
axis square
grid on

%% done.
