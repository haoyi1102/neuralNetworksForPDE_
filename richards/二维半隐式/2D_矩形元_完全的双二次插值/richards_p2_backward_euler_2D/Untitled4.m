T=10;
left=0;right=10;
bottom=0;top=10;
Gauss_point_number=9;
h_min=[0.625 0.625];
N1_partition=(right-left)/h_min(1);
N2_partition=(top-bottom)/h_min(2);
N1_basis=N1_partition*2;
N2_basis=N2_partition*2;


approximate_global_solutions=test_function(left,right,bottom,top,h_min,T,1);
approximate_solutions=approximate_global_solutions(:,end);
a=zeros((N1_basis+1)*(N2_basis+1),1);
exact_solution=FE_solution_error_triangle(a,approximate_solutions,left,right,bottom,top,h_min,0,0,Gauss_point_number)
