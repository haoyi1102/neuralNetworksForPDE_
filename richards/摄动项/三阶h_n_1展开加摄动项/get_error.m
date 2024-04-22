function result=get_error(h_partition,t_partition)
%get_error(1,0.01)
left=0;
right=40;
T=10;
Gauss_point_number=4;

[M_partition,~]=generate_M_T_1D(left,right,h_partition,101);
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:2:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact_solver=exact_solution(M_partition,t,T)';
u=solution-exact_solver;
absolute_error=norm(u,'inf');
result=absolute_error/norm(exact_solver,'inf');

