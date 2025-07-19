clc
clear all

mlsize=3;



hold on

filename='LCE_rate0001_45_at1_s_12_mesh5_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem(1:end),stress_fem(1:end),'r-','LineWidth',3)



filename='LCE_rate01_45_at1_s_4_tstep_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem(1:end),stress_fem(1:end),'b-','LineWidth',3)


end1=10;


M = readmatrix('S6_01P_1__1.csv');  
strain=M(1:1:end-end1,2)/10+1;
stress=M(1:1:end-end1,3)/15/0.5;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-0),stress_smooth(1:end/1000:end-0),'r--','LineWidth',3)


M = readmatrix('S6_10P_5_1.csv');
strain=M(1:1:end-end1,2)/10+1;
stress=M(1:1:end-end1,3)/15/0.5;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-12),stress_smooth(1:end/1000:end-12),'b--','LineWidth',3)



ylabel(['$s$' ' (Mpa)'],'FontSize',32,'interpreter','latex')
xlabel('$\lambda$','FontSize',32,'interpreter','latex')
set(gca,'color','w','FontSize',32,'LineWidth',1)
set(gca,'FontName','Times')
set(gcf,'color','w')
box on
set(gcf,'Position',[100 100 8*100 7*100])
set(gca,'Position',[0.2 0.2 0.75 0.75])
ylim([0 1.2])
xlim([1 2.7])


str='$\dot {\lambda} =0.1\%/s$';
 annotation('textbox',[0.38 0.20 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');


  
  str='$10\%/s$';
 annotation('textbox',[0.37 0.65 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

 str='$\theta _0 = 45 ^{\circ}$';
 annotation('textbox',[0.75 0.85 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');

str='Theory  EXP';
 annotation('textbox',[0.21 0.85 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
line_v=1.05;
plot([1.1 1.3]+0.05,[line_v line_v],'k-','linewidth',3);
plot([1.42 1.6]+0.1,[line_v line_v],'k--','linewidth',3);


print(gcf,'s_fig4_win2.png','-dpng','-r600');