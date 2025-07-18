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
plot(strain_smooth(1:end/1000:end-50),stress_smooth(1:end/1000:end-50),'-','Color',colors(:,4),'LineWidth',3)




M = readmatrix('S8_RATE_10PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-12),stress_smooth(1:end/1000:end-12),'-','Color',colors(:,6),'LineWidth',3)


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


 str='$\dot {\lambda} =0.1\%/s$';
 annotation('textbox',[0.47 0.17 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

  str='$10\%/s$';
 annotation('textbox',[0.4 0.46 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 str='$\theta _0 = 45 ^{\circ}$';
 annotation('textbox',[0.2 0.84 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');



 xdot=[1 1.5 2 2.4 2.45];
 ydot=[0 0.105 0.215 0.444 0.439];
plot(xdot,ydot,'k.','markersize',24)

 % 
 %  str='$\{i\}$';
 % annotation('textbox',[0.18 0.12 0.1 0.1] ,'fontsize',32,...
 %     'interpreter','latex','String',str,'EdgeColor','none');

str='$(i)$';
 annotation('textbox',[0.21 0.2 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 str='$(ii)$';
 annotation('textbox',[0.34 0.24 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

  str='$(iii)$';
 annotation('textbox',[0.52 0.3 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 str='$(iv)$';
 annotation('textbox',[0.65 0.4 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

  str='$(v)$';
 annotation('textbox',[0.74 0.36 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');


print(gcf,'s_fig1_win.png','-dpng','-r600');  