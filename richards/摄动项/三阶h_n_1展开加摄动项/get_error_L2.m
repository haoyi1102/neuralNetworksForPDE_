function relative_error=get_error_L2(h_partition)
% get_error_L2(1)
left=0;
right=40;
T=10;
Gauss_point_number=4;
N_partition=(right-left)/h_partition;
[M_partition,~]=generate_M_T_1D(left,right,h_partition,101);

t_partition=0.5;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_1=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.25;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_2=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.2;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_3=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.1;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_4=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.05;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_5=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.04;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_6=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.025;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_7=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

t_partition=0.02;
solution=test_function(left,right,T,h_partition,t_partition,Gauss_point_number);
%  column=2*t/t_partition+1;
solution=solution(1:end,end);
t_number=floor(T/t_partition);
t=t_number*t_partition;
exact=exact_solution(M_partition,t,T)';
dexact_solver=dexact_solution(M_partition,t,T)';
exact_solver=zeros(2*N_partition+2,1);
exact_solver(1:2:end,1)=exact;
exact_solver(2:2:end,1)=dexact_solver;
Absolute_error_8=FE_solution_error_triangle(solution,exact_solver,left,right,h_partition,Gauss_point_number);

exact_error=711.0911;

relative_error=[Absolute_error_1/exact_error,Absolute_error_2/exact_error,Absolute_error_3/exact_error,Absolute_error_4/exact_error,...
    Absolute_error_5/exact_error,Absolute_error_6/exact_error,Absolute_error_7/exact_error,Absolute_error_8/exact_error];
















