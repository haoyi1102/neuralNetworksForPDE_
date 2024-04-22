function [Absolute_error,relative_error]=get_error(h_partition,dt)

T=10;
left=0;right=40;
bottom=0;top=40;
Gauss_point_number=9;
N1_partition=(right-left)/h_partition(1);
N2_partition=(top-bottom)/h_partition(2);
N1_basis=N1_partition*2;
N2_basis=N2_partition*2;

%最小的时间步长
min_dt=0.1;

Numerical_global_solution=test_function(left,right,bottom,top,h_partition,T,dt);
Numerical_solution=Numerical_global_solution(:,end);

% h_min=2;

approximate_global_solutions=test_function(left,right,bottom,top,h_partition,T,min_dt);
approximate_solutions=approximate_global_solutions(:,end);

Absolute_error=FE_solution_error_triangle(Numerical_solution,approximate_solutions,left,right,bottom,top,h_partition,0,0,Gauss_point_number);
a=zeros((N1_basis+1)*(N2_basis+1),1);
exact_solution=FE_solution_error_triangle(a,approximate_solutions,left,right,bottom,top,h_partition,0,0,Gauss_point_number);
relative_error=Absolute_error/exact_solution;
