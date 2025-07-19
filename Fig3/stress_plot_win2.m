clc
clear all

mlsize=3;

colors = [
    [0 0 0 1]; [[0 0 0]+0.4 0.8]; [[0 0 0]+0.7 0.8];
    [1 0 0 1];[0.7 0 0 0.7];[0.5 0 0 0.5];
    [0 0 1 1];[0 0 0.8 0.5];[0 0 0.5 0.5];
    [0 1 0 1];[0 0.8 0 0.8];[0 0.5 0 0.5];]'; 

hold on

filename='30_0001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,1),'LineWidth',3)

filename='30_001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,2),'LineWidth',3)

filename='30_01_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,3),'LineWidth',3)

filename='45_0001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,4),'LineWidth',3)

filename='45_001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,5),'LineWidth',3)

filename='45_01_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,6),'LineWidth',3)

filename='60_0001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,7),'LineWidth',3)

filename='60_001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,8),'LineWidth',3)

filename='60_01_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,9),'LineWidth',3)

filename='75_0001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,10),'LineWidth',3)

filename='75_001_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,11),'LineWidth',3)

filename='75_01_refined.txt';
fileID = fopen(filename);
data = textscan(fileID,'%f %f');
fclose(fileID);
stretch_fem=data{1,1}+1;
stress_fem=data{1,2};
plot(stretch_fem,stress_fem,'-','Color',colors(:,12),'LineWidth',3)

M = readmatrix('S0_RATE_01PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-5),stress_smooth(1:end/1000:end-5),'--','Color',colors(:,1),'LineWidth',3)


M = readmatrix('S2_RATE_1PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-22),stress_smooth(1:end/1000:end-22),'--','Color',colors(:,2),'LineWidth',3)


M = readmatrix('S6_RATE_10PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-20),stress_smooth(1:end/1000:end-20),'--','Color',colors(:,3),'LineWidth',3)


M = readmatrix('S14_RATE_01PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-50),stress_smooth(1:end/1000:end-50),'--','Color',colors(:,4),'LineWidth',3)


M = readmatrix('S9_RATE_1PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-10),stress_smooth(1:end/1000:end-10),'--','Color',colors(:,5),'LineWidth',3)


M = readmatrix('S8_RATE_10PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-12),stress_smooth(1:end/1000:end-12),'--','Color',colors(:,6),'LineWidth',3)


M = readmatrix('RATE_01PERCENT_60DEGREE_S9_1.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.43;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-0),stress_smooth(1:end/1000:end-0),'--','Color',colors(:,7),'LineWidth',3)

M = readmatrix('S15_RATE_1PERCENT_30DEGREE_1_1222.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.48;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-23),stress_smooth(1:end/1000:end-23),'--','Color',colors(:,8),'LineWidth',3)



M = readmatrix('RATE_10PERCENT_60DEGREE_S11_1.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.43;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-21),stress_smooth(1:end/1000:end-21),'--','Color',colors(:,9),'LineWidth',3)


t75=0.56;

M = readmatrix('S2_RATE_01PERCENT_75DEGREE_1.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/t75;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-5),stress_smooth(1:end/1000:end-5),'--','Color',colors(:,10),'LineWidth',3)

M = readmatrix('RATE_1PERCENT_60DEGREE_S14_1.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/0.43;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-20),stress_smooth(1:end/1000:end-20),'--','Color',colors(:,11),'LineWidth',3)

M = readmatrix('S5_RATE_10PERCENT_75DEGREE_1.csv');
strain=M(1:1:end,2)/30+1;
stress=M(1:1:end,3)/5/t75;
n=5;
strain_smooth=reshape(strain(1:floor(length(strain)/n)*n),n,[]);
strain_smooth=sum(strain_smooth,1)/n;
stress_smooth=reshape(stress(1:floor(length(strain)/n)*n),n,[]);
stress_smooth=sum(stress_smooth,1)/n;
plot(strain_smooth(1:end/1000:end-11),stress_smooth(1:end/1000:end-11),'--','Color',colors(:,12),'LineWidth',3)


ylabel(['$s$' ' (Mpa)'],'FontSize',32,'interpreter','latex')
xlabel('$\lambda$','FontSize',32,'interpreter','latex')
set(gca,'color','w','FontSize',32,'LineWidth',1)
set(gca,'FontName','Times')
set(gcf,'color','w')
box off
set(gcf,'Position',[100 100 10*100 7*100])
set(gca,'Position',[0.15 0.16 0.85 0.8])
ylim([0 2.1])
xlim([1 3.5])



x1=1.15+1.38;
x2=1.35+1.38;
x3=1.55+1.5;
x4=1.8+1.5;
y1=1.8-0.05;
plot([x1 x2],[y1 y1],'k-','linewidth',3);
plot([x3 x4],[y1 y1],'k--','linewidth',3);


 str='Theory{\hspace{0.15cm}}EXP';
 annotation('textbox',[0.438 0.83 0.1 0.1] ,'fontsize',32,...
     'interpreter','latex','String',str,'EdgeColor','none');
 


set(legend(['$30 ^{\circ}$' ',' '$0.1\%/s$'],['$30 ^{\circ}$' ',' '$1\%/s$'],...
    ['$30 ^{\circ}$' ',' '$10\%/s$'],['$45 ^{\circ}$' ',' '$0.1\%/s$'],...
    ['$45 ^{\circ}$' ',' '$1\%/s$'],['$45 ^{\circ}$' ',' '$10\%/s$'],...
    ['$60 ^{\circ}$' ',' '$0.1\%/s$'],['$60 ^{\circ}$' ',' '$1\%/s$'],...
    ['$60 ^{\circ}$' ',' '$10\%/s$'],['$75 ^{\circ}$' ',' '$0.1\%/s$'],...
    ['$75 ^{\circ}$' ',' '$1\%/s$'],['$75 ^{\circ}$' ',' '$10\%/s$']),...
    'fontsize',30,'interpreter','latex','Location','eastoutside');
legend boxoff

print(gcf,'s_fig3_win.png','-dpng','-r600');

 