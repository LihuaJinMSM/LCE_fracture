clc
clear all
close all
filename='LCE_rate0001_45_at1_s_12_mesh5_mesh2_path_refined.txt';
data = readmatrix(filename);
X_fem=data(:,1);
Y_fem=data(:,2);

idx = find(X_fem<0);
X_fem(idx)=[];
Y_fem(idx)=[];

p=polyfit(X_fem,Y_fem,4);


X_fem_up=[];
Y_fem_up=[];

X_fem_down=[];
Y_fem_down=[];

for i=1:1:length(X_fem)
    if polyval(p,X_fem(i))<Y_fem(i)
        X_fem_up(end+1)=X_fem(i);
        Y_fem_up(end+1)=Y_fem(i);
    else
        X_fem_down(end+1)=X_fem(i);
        Y_fem_down(end+1)=Y_fem(i);
    end
end

[X_fem_up,sortIdx] = sort(X_fem_up,'descend');
Y_fem_up = Y_fem_up(sortIdx);

[X_fem_down,sortIdx] = sort(X_fem_down,'descend');
Y_fem_down = Y_fem_down(sortIdx);


patch([X_fem_down fliplr(X_fem_up)], [Y_fem_down fliplr(Y_fem_up)],[1 0 0],...
    'FaceAlpha',0.2,'EdgeColor','r','LineStyle','--','LineWidth',1)

hold on

filename='LCE_rate01_45_at1_s_4_tstep_path_refined.txt';
data = readmatrix(filename);
X_fem=data(:,1);
Y_fem=data(:,2);

idx = find(X_fem<0);
X_fem(idx)=[];
Y_fem(idx)=[];

p=polyfit(X_fem,Y_fem,4);

X_fem_up=[];
Y_fem_up=[];

X_fem_down=[];
Y_fem_down=[];

for i=1:1:length(X_fem)
    if polyval(p,X_fem(i))<Y_fem(i)
        X_fem_up(end+1)=X_fem(i);
        Y_fem_up(end+1)=Y_fem(i);
    else
        X_fem_down(end+1)=X_fem(i);
        Y_fem_down(end+1)=Y_fem(i);
    end
end

[X_fem_up,sortIdx] = sort(X_fem_up,'descend');
Y_fem_up = Y_fem_up(sortIdx);

[X_fem_down,sortIdx] = sort(X_fem_down,'descend');
Y_fem_down = Y_fem_down(sortIdx);



patch([X_fem_down fliplr(X_fem_up)], [Y_fem_down fliplr(Y_fem_up)],'b',...
    'FaceAlpha',0.2,'EdgeColor','b','LineStyle','--','LineWidth',1)

xlim([0 9])
ylim([-1.2 1])


load rate_0001.mat
plot(x_crack_plot,y_crack_plot,'r-','LineWidth',3)

clear all
load rate_01_6248.mat
plot(x_crack_plot,y_crack_plot,'b-','LineWidth',3)


xlabel('$X-0.4W$','FontSize',32,'interpreter','latex')
ylabel('$Y-0.5H$','FontSize',32,'interpreter','latex')
set(gca,'color','w','FontSize',32,'LineWidth',1)
set(gca,'FontName','Times')
set(gcf,'color','w')
set(gcf,'Position',[100 100 8*100 7*100])
set(gca,'Position',[0.2 0.2 0.75 0.75])
box on

str='$\dot {\lambda} =0.1\%/s$';
 annotation('textbox',[0.6 0.82 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
 
  str='$10\%/s$';
 annotation('textbox',[0.4 0.6 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 str='$\theta _0 = 45 ^{\circ}$';
 annotation('textbox',[0.21 0.85 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

str='Theory  EXP';
 annotation('textbox',[0.21 0.3 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
 str='$(d \ge 0.95) $';
 annotation('textbox',[0.2 0.240 0.1 0.1] ,'fontsize',26,...
     'interpreter','latex','String',str,'EdgeColor','none');
line_v=-1.05;
plot([0.8 1.8],[line_v line_v],'Color',[0 0 0 0.2],'linewidth',20);
plot([2.7 3.5],[line_v line_v],'k-','linewidth',3);

print(gcf,'path_fig4_win.png','-dpng','-r600');