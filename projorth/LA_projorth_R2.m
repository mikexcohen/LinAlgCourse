%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Projections and orthogonalization
%      VIDEO: Projections in R^2
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

% point b
b = [ 4 1 ]';

% line a
a = [ 2 5 ]';

% beta
beta = (a'*b) / (a'*a);

% draw!
figure(1), clf
plot(b(1),b(2),'ko','markerfacecolor','m','markersize',20)
hold on
plot([0 a(1)],[0 a(2)],'b','linew',3)

% now plot projection line
plot([b(1) beta*a(1)],[b(2) beta*a(2)],'r--','linew',3)

legend({'b';'a';'b-\betaa'})
axis([-1 1 -1 1]*max([norm(a) norm(b)]))
plot(get(gca,'xlim'),[0 0],'k--')
plot([0 0],get(gca,'xlim'),'k--')
axis square

%% done.
