clc
clear all

mlsize=3;

colors = [
    [0 0 0 1]; [[0 0 0]+0.4 0.8]; [[0 0 0]+0.7 0.8];
    [1 0 0 1];[0.7 0 0 0.7];[0.5 0 0 0.5];
    [0 0 1 1];[0 0 0.8 0.5];[0 0 0.5 0.5];
    [0 1 0 1];[0 0.8 0 0.8];[0 0.5 0 0.5];]'; 

hold on

M = readmatrix('S14_RATE_01PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-50),stress_smooth(1:end/1000:end-50),'--','Color',colors(:,4),'LineWidth',3)


M = readmatrix('S8_RATE_10PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-12),stress_smooth(1:end/1000:end-12),'--','Color',colors(:,6),'LineWidth',3)


ylabel(['$s$' ' (Mpa)'],'FontSize',32,'interpreter','latex')
xlabel('$\lambda$','FontSize',32,'interpreter','latex')
set(gca,'color','w','FontSize',32,'LineWidth',1)
set(gca,'FontName','Times')
set(gcf,'color','w')
box on
set(gcf,'Position',[100 100 8*100 7*100])
set(gca,'Position',[0.2 0.2 0.75 0.75])
ylim([0 1.5])
xlim([1 3])

filename='45_0001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,4),'LineWidth',3)


filename='45_01_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,6),'LineWidth',3)


 str='$\dot {\lambda} =0.1\%/s$';
 annotation('textbox',[0.47 0.17 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

  str='$10\%/s$';
 annotation('textbox',[0.4 0.46 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 str='$\theta _0 = 45 ^{\circ}$';
 annotation('textbox',[0.75 0.85 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

str='Theory  EXP';
 annotation('textbox',[0.21 0.85 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
line_v=1.3;
plot([1.15 1.35],[line_v line_v],'k-','linewidth',3);
plot([1.6 1.8],[line_v line_v],'k--','linewidth',3);

print(gcf,'s_fig2_win.png','-dpng','-r600');  