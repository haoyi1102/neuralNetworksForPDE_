% 时间步长空间步长与收敛阶
% a=[0.16,0.1024,0.04,0.0256,0.01,0.0064,0.0025,0.0016];
% b=[0.5,0.4,0.25,0.2,0.125,0.1,0.0625,0.05];
% b=b.^3;
% c=[0.1579,0.1022,0.0408,0.0261,0.0103,0.0066,0.0026,0.0016];
% i=8;
% b=b(:,1:i);
% c=c(:,1:i);
% b=log(b);
% c=log(c);

%分开计算收敛阶
%t固定，计算z的收敛阶
% a=[4,2,1,0.5];
% % a=a.^3;
% %b=[0.0102,0.0102,0.0102,0.0103,0.0103];%0.01
% b=[0.0395,0.0020,9.7299e-04,0.0010];%1e-03
% % b=[0.0392,0.0025,4.6382e-04,5.1237e-04];%0.0005
% % b=[0.0389,0.0029,1.9504e-04,1.0252e-04];%1e-04
% % b=[0.0388,0.0029,2.3002e-04,5.1281e-05];%5e-05
% i=3;
% a=a(:,1:i);
% b=b(:,1:i);
% a=log(a);
% b=log(b);

%z固定，计算t的收敛阶
a=[0.01	0.005	0.0025	0.002	0.001];
%b=[0.1579,0.0407,0.0102,0.0026];%z=0.5
% b=[0.1579,0.0408,0.0102,0.0026];%z=0.25
% b=[0.1582,0.0409,0.0103,0.0026];%z=0.125
b=[5.7108e-04	3.0687e-04	1.5918e-04	1.2829e-04	6.5104e-05];

i=5;
a=a(:,1:i);
b=b(:,1:i);
a=log(a);
b=log(b);







% 摄动误差与收敛阶
%  a=[1e-07,0.75e-07,0.5e-07,0.25e-07,1e-08,0.75e-08,0.5e-08,0.25e-08,1e-09,0];
% % b=[0.3458,0.2740,0.2021,0.1580,0.1580,0.1580,0.1580,0.1579,0.1579,0.1579];
% b=[0.3517,0.2684,0.1847,0.1007,0.0505,0.0423,0.0408,0.0408,0.0408,0.0408];
% b=[0.3496,0.2638,0.1777,0.0911,0.0390,0.0303,0.0216,0.0130,0.0103];
% b=[0.3489,0.2625,0.1756,0.0884,0.0358,0.0270,0.0182,0.0095,0.0042,0.0016];
% i=9;
% a=a(:,1:i);
% b=b(:,1:i);
% a=log(a);
% b=log(b);

%摄动与误差关系图
%  a=[1e-07,0.75e-07,0.5e-07,0.25e-07,1e-08,0.75e-08,0.5e-08,0.25e-08,1e-09,0];
% % % b=[0.3458,0.2740,0.2021,0.1580,0.1580,0.1580,0.1580,0.1579,0.1579,0.1579];
% % b=[0.3517,0.2684,0.1847,0.1007,0.0505,0.0423,0.0408,0.0408,0.0408,0.0408];
% b=[0.3496,0.2638,0.1777,0.0911,0.0390,0.0303,0.0216,0.0130,0.0103,0.0103];
% b=[0.3489,0.2625,0.1756,0.0884,0.0358,0.0270,0.0182,0.0095,0.0042,0.0016];
% 
% plot(a,b,'linewidth',2)
% hold on 
% scatter(a,b,'filled')

% title('Relationship Between ε and Errors')
% xlabel('ε')
% ylabel('Errors')

