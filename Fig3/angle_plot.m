clc
clear all
msize=1;
text={'c_rate0001_30_refined.txt' 'c_rate001_30_refined.txt'  'c_rate01_30_refined.txt'...
    'c_rate0001_45_refined.txt' 'c_rate001_45_refined.txt' 'c_rate01_45_refined.txt' ...
    'c_rate0001_60_refined.txt' 'c_rate001_60_refined.txt' 'c_rate01_60_refined.txt'...
    'c_rate0001_75_refined.txt' 'c_rate001_75_refined.txt' 'c_rate01_75_refined.txt'};

colors = [
    [0 0 0 1]; [[0 0 0]+0.4 0.8]; [[0 0 0]+0.7 0.8];
    [1 0 0 1];[0.7 0 0 0.7];[0.5 0 0 0.5];
    [0 0 1 1];[0 0 0.8 0.5];[0 0 0.5 0.5];
    [0 1 0 1];[0 0.8 0 0.8];[0 0.5 0 0.5];]'; 
for i_text=1:1:length(text)
c=readmatrix(text{i_text});
% plot(c(:,1),c(:,2),'o','LineWidth', 3,'Color',colors(:,i_text),'MarkerSize',msize )
% hold on

xc=c(:,1);
yc=c(:,2);
idx=find(xc<1);
xc(idx)=[];
yc(idx)=[];
p=polyfit(xc,yc,1);
angle(i_text)=-atand(p(1));
% angle(i_text)=atand(((max(m)+min(m))/2-sum(n)/2)/2);
end
% the angle calculation: X from the 1mm to 3mm
% xlabel('$X-0.4W$','FontSize',32,'interpreter','latex')
% ylabel('$Y-0.5H$','FontSize',32,'interpreter','latex')
% set(gca,'color','w','FontSize',32,'LineWidth',1)
% set(gca,'FontName','Times')
% set(gcf,'color','w')
% set(gcf,'Position',[100 100 8*100 7*100])
% set(gca,'Position',[0.2 0.2 0.75 0.75])
% xlim([0 3])



rate=[0.001 0.01 0.1 0.001 0.01 0.1 0.001 0.01 0.1 0.001 0.01 0.1];

figure
hold on

xlabel('$\dot{\lambda} (/s)$','FontSize',32,'interpreter','latex')
ylabel('$\theta_{c} (^{\circ})$','FontSize',32,'interpreter','latex')
set(gca,'color','w','FontSize',32,'LineWidth',1)
set(gca,'FontName','Times')
set(gcf,'color','w')
set(gcf,'Position',[100 100 8*100 7*100])
set(gca,'Position',[0.2 0.2 0.75 0.75])
set(gca, 'XScale', 'log');
box on
 str='$\theta_0$=30$^{\circ}$';
 annotation('textbox',[0.25 0.38 0.1 0.1],'Color',colors(:,1) ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
 
 str='$45^{\circ}$';
 annotation('textbox',[0.25 0.62 0.1 0.1],'Color',colors(:,4) ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
 
 str='$60^{\circ}$';
 annotation('textbox',[0.25 0.72 0.1 0.1],'Color',colors(:,7) ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
 
 str='$75^{\circ}$';
 annotation('textbox',[0.25 0.51 0.1 0.1],'Color',colors(:,10) ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

t30_01=[22 24.5 24 24];
t30_1=[21 21.5 20];
t30_10=[19 18.5];

t45_01=[33.5 33.5 35];
t45_1=[31 34 32 32.5];
t45_10=[30 31.5 31];

t60_01=[38 40 40.5];
t60_1=[40.5 40 39.5];
t60_10=[37 36 35];

t75_01=[30.5 34];
t75_1=[31 26.5 27.5 30];
t75_10=[28.5 29.5];
msize=10;
lwidth=3;

semilogx(rate(1)*ones(length(t30_01)), t30_01,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,1));
semilogx(rate(2)*ones(length(t30_1)), t30_1,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,2));
semilogx(rate(3)*ones(length(t30_10)), t30_10,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,3));

semilogx(rate(1)*ones(length(t45_01)), t45_01,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,4));
semilogx(rate(2)*ones(length(t45_1)), t45_1,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,5));
semilogx(rate(3)*ones(length(t45_10)), t45_10,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,6));

semilogx(rate(1)*ones(length(t60_01)), t60_01,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,7));
semilogx(rate(2)*ones(length(t60_1)), t60_1,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,8));
semilogx(rate(3)*ones(length(t60_10)), t60_10,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,9));

semilogx(rate(1)*ones(length(t75_01)), t75_01,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,10));
semilogx(rate(2)*ones(length(t75_1)), t75_1,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,11));
semilogx(rate(3)*ones(length(t75_10)), t75_10,'^','MarkerSize',msize,'LineWidth',lwidth,'Color',colors(:,12));

patch([0.001 0.01 0.1 0.1 0.01 0.001],...
    [min(t30_01) min(t30_1) min(t30_10) max(t30_10) max(t30_1) max(t30_01)],'k',...
    'FaceAlpha',0.2,'EdgeColor','r','LineStyle','none')

patch([0.001 0.01 0.1 0.1 0.01 0.001],...
    [min(t45_01) min(t45_1) min(t45_10) max(t45_10) max(t45_1) max(t45_01)],'r',...
    'FaceAlpha',0.2,'EdgeColor','r','LineStyle','none')

patch([0.001 0.01 0.1 0.1 0.01 0.001],...
    [min(t60_01) min(t60_1) min(t60_10) max(t60_10) max(t60_1) max(t60_01)],'b',...
    'FaceAlpha',0.2,'EdgeColor','r','LineStyle','none')

patch([0.001 0.01 0.1 0.1 0.01 0.001],...
    [min(t75_01) min(t75_1) min(t75_10) max(t75_10) max(t75_1) max(t75_01)],'g',...
    'FaceAlpha',0.2,'EdgeColor','r','LineStyle','none')

semilogx(rate(1:3), angle(1:3),'k-','LineWidth',3);
semilogx(rate(4:6), angle(4:6),'r-','LineWidth',3);
semilogx(rate(7:9), angle(7:9),'b-','LineWidth',3);
semilogx(rate(10:12), angle(10:12),'g-','LineWidth',3);

for i_text=1:1:length(text)
c=readmatrix(text{i_text});
semilogx(rate(i_text), angle(i_text),'o','MarkerSize',12,'LineWidth',3,'Color',colors(:,i_text));
end


str='Theory  EXP';
 annotation('textbox',[0.63 0.85 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 line_v=41;
plot([0.055 0.08],[line_v line_v],'Color',[0 0 0 0.2],'linewidth',20);
plot([0.02 0.033],[line_v line_v],'k-','linewidth',3);
plot(0.0673,line_v,'k^','MarkerSize',msize,'LineWidth',lwidth);
plot(0.026,line_v,'ko','MarkerSize',12,'LineWidth',3);

ylim([15 45])

print(gcf,'angle_fig3_win.png','-dpng','-r600');