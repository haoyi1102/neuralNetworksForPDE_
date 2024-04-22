function result=get_error_L2_inf(h_partition)
%get_error_L2_inf(1)
%get_error_L2_inf(2)
%get_error_L2_inf(1.25)
left=0;
right=40;
T=10;
Gauss_point_number=4;

[M_partition,~]=generate_M_T_1D(left,right,h_partition,101);

t1=0.1;
solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
%  column=2*t/t_partition+1;
solution_1=solution_1(1:end,end);
% a1=solution_1';
% file_name1='D:\matlab\richards\整理好没问题的\三阶h_n_1展开加摄动项\结果\摄动项调精度\e=0,T=1,h=1\t=0.0125.xlsx';  % 需要保存的文件名称及路径
% xlswrite(file_name1,a1','sheet1','A1') % B2 表示写入excel中第一个数的位置
% solution_1=xlsread('D:\matlab\richards\整理好没问题的\三阶h_n_1展开加摄动项\结果\摄动项调精度\e=0,T=1,h=1\t=0.0125.xlsx','A1:A82');
solution_1=solution_1(1:2:end,end);
t_number=floor(T/t1);
t_1=t_number*t1;
exact_solver_1=exact_solution(M_partition,t_1,T)';
u_1=solution_1-exact_solver_1;
absolute_error_1=norm(u_1,2);
result_1=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.25;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_2=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.2;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_3=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.1;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_4=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.05;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_5=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.04;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_6=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.025;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_7=absolute_error_1/norm(exact_solver_1,2);
% 
% t1=0.02;
% solution_1=test_function(left,right,T,h_partition,t1,Gauss_point_number);
% %  column=2*t/t_partition+1;
% solution_1=solution_1(1:2:end,end);
% t_number=floor(T/t1);
% t_1=t_number*t1;
% exact_solver_1=exact_solution(M_partition,t_1,T)';
% u_1=solution_1-exact_solver_1;
% absolute_error_1=norm(u_1,2);
% result_8=absolute_error_1/norm(exact_solver_1,2);
% 
% 
% 
% result=[result_1,result_2,result_3,result_4,result_5,result_6,result_7,result_8];
% 
result=result_1;