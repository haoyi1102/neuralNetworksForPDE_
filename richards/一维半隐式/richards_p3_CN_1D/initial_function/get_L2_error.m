function result=get_L2_error(left,right,T,t,h_partition,t_partition,basis_type,Gauss_point_number)
% left=0;right=40;T=1000;t=1000;h_partition=1;t_partition=0.1;basis_type=103;Gauss_point_number=4;

[M_partition,~]=generate_M_T_1D(left,right,h_partition,101);
solution=test_function(left,right,T,h_partition,t_partition,basis_type,Gauss_point_number);

column=t/t_partition+1;

solution=solution(1:2:end,column);
exact_solver=exact_solution(M_partition,t,T)';

u=solution-exact_solver;
result=norm(u,'inf');

