%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Least-squares and statistics
%      VIDEO: Least-squares via row-reduction
% Instructor: sincxpress.com
% Course url: https://www.udemy.com/course/linear-algebra-theory-and-implementation/?couponCode=202110
% 
%%

m = 10;
n = 3;

% create data
X = randn(m,n); % design matrix
y = randn(m,1); % outcome measures (data)

% try directly applying RREF
rref([ X y ])

% now reapply to the normal equations
Xsol = rref([ X'*X X'*y ]);
beta = Xsol(:,end);

% compare to left-inverse
beta2 = (X'*X)\(X'*y);

% even simpler (MATLAB version-dependent)
beta3 = X\y;

%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Least-squares and statistics
%      VIDEO: Least-squares example 1
% Instructor: sincxpress.com
% 
%%

%% average value

% data
data = [ -4, 0, -3, 1, 2, 8, 5, 8 ]';
N    = length(data);

% design matrix
X = ones(N,1);

% fit the model
b = (X'*X)\(X'*data);

% compare against the mean
m = mean(data);

% compute the model-predicted values
yHat = X*b;

% plot data and model prediction
figure(3), clf
plot(1:N,data,'ks-','markerfacecolor','k','linew',2,'markersize',14)
hold on
plot(1:N,yHat,'ko--','markerfacecolor','k','linew',2,'markersize',14)

set(gca,'xlim',[.5 N+.5])
xlabel('Data point'), ylabel('Data value')
legend({'Observed data';'Predicted data'})

%% same as above but linear trend

% design matrix
X = (1:N)';

% fit the model
b = (X'*X)\(X'*data);

% compare against the mean
m = mean(data);

% compute the model-predicted values
yHat = X*b;

% plot data and model prediction
figure(4), clf
plot(1:N,data,'ks-','markerfacecolor','k','linew',2,'markersize',14)
hold on
plot(1:N,yHat,'ko--','markerfacecolor','k','linew',2,'markersize',14)

set(gca,'xlim',[.5 N+.5])
xlabel('Data point'), ylabel('Data value')
legend({'Observed data';'Predicted data'})

%% Now with an intercept and trend (slope)

% design matrix
X = [ ones(N,1) (1:N)' ];

% fit the model
b = (X'*X)\(X'*data);

% compare against the mean
m = mean(data);

% compute the model-predicted values
yHat = X*b;

% plot data and model prediction
figure(5), clf
plot(1:N,data,'ks-','markerfacecolor','k','linew',2,'markersize',14)
hold on
plot(1:N,yHat,'ko--','markerfacecolor','k','linew',2,'markersize',14)

set(gca,'xlim',[.5 N+.5])
xlabel('Data point'), ylabel('Data value')
legend({'Observed data';'Predicted data'})


%%
%     COURSE: Linear algebra: theory and implementation
%    SECTION: Least-squares and statistics
%      VIDEO: Least-squares example 2
% Instructor: sincxpress.com
% 
%%

% load data
load EEG_RT_data.mat
N = length(rts);

% show the data
figure(4), clf
subplot(211)
plot(rts,'ks-','markersize',14,'markerfacecolor','k')
xlabel('Trial'), ylabel('Response time (ms)')

subplot(212)
imagesc(1:N,frex,EEGdata)
axis xy
xlabel('Trial'), ylabel('Frequency')
set(gca,'clim',[-3 3])

%% now for the model creation and fitting

% design matrix
X = [ ones(N-1,1) rts(1:end-1)' EEGdata(9,2:end)' ];

% compute parameters
b = (X'*X)\(X'*rts(2:end)');

% interpreting the coefficients:
disp([ 'Intercept: ' num2str(b(1)) ' ms' ])
disp([ 'Effect of prev. RT: ' num2str(b(2)) ' ms' ])
disp([ 'Effect of EEG energy: ' num2str(b(3)) ' ms' ])

%% compute effect over frequencies

b = zeros(size(frex));

for fi=1:length(frex)
    
    % design matrix
    X = [ ones(N,1) EEGdata(fi,:)' ];
    
    % compute parameters
    t = (X'*X)\(X'*rts');
    b(fi) = t(2);
end

% plot
figure(5), clf
subplot(211)
plot(frex,b,'rs-','markersize',14,'markerfacecolor','k')
xlabel('Frequency (Hz)')
ylabel('\beta-coefficient')


% scatterplots at these frequencies
frex2plot = dsearchn(frex',[ 8 20 ]');

for fi=1:2
    subplot(2,2,2+fi)
    
    plot(EEGdata(frex2plot(fi),:),rts,'rs','markerfacecolor','k')
    h=lsline;
    set(h,'linew',2,'color','k')
    
    xlabel('EEG energy'), ylabel('RT')
    title([ 'EEG signal at ' num2str(round(frex(frex2plot(fi)))) ' Hz' ])
end

%%

% Interested in more courses? See sincxpress.com 
% Use code MXC-DISC4ALL for the lowest price for all courses.
