function r=FE_solution_error_triangle(uh,accurate_function,left,right,h_partition,Gauss_point_number)
%Xiaoming He, 07/01/2009.
%We will use "FE" to replace "finite element" in the comments.
%Numerically compute a norm error of FE solution on the whole domain [left,right]*[bottom,top].
%uh: the values of the FE solution at all nodes of FE in the whole domain. These values are in 1D index of nodes of FE.
%accurate_function: the accurate function in the error.
%When we take the L2 norm,accurate_function is the exact solution.
%When we take the H1 seminorm, accurate_function is the first derivative of the exact solution.
%h_partition: the stepsize of the partition.
%basis_type: the type of the FE.
%basis_type=1:2D linear FE.
%basis_type=2:2D Lagrange quadratic FE.
%derivative_degree_x:the derivative degree of the FE solution with respect to x.
%derivative_degree_y:the derivative degree of the FE solution with respect to y.
%Gauss_point_number: the number of the Gauss points of the Gauss quadrature we want to use.

%N1_partition,N2_partition:The N1 and N2 for the partition,not the FE basis functions.
%N1 is the number of the sub-intervals of the partition in x-direction.
%N2 is the number of the sub-intervals of the partition in y-direction.
%vertices: the coordinates of the vertices of a triangular element.
%uh_local: the values of the FE solution at the nodes of FE in a triangular element.


N_partition=(right-left)/h_partition;
number_of_elements=N_partition;

[M_partition,T_partition]=generate_M_T_1D(left,right,h_partition,101);


M_basis=zeros(1,2*N_partition+2);
M_basis(1,1:2:end)=M_partition;
M_basis(1,2:2:end)=M_partition;
T_basis=zeros(4,N_partition);
  for i=1:N_partition
       T_basis(1,i)=2*i-1;    
       T_basis(2,i)=2*i;
       T_basis(3,i)=2*i+1;
       T_basis(4,i)=2*i+2; 
  end

[Gauss_coefficient_reference_1D,Gauss_point_reference_1D]=generate_Gauss_reference_1D(Gauss_point_number);

r=0;
%Go through all elements and accumulate the error on them.
for n=1:number_of_elements
    vertices=M_partition(:,T_partition(:,n));
    uh_local=uh(T_basis(:,n),:);
    accurate_function_local=accurate_function(T_basis(:,n),:);
    r=r+Gauss_quadrature_for_volume_integral_FE_solution_error_triangle(uh_local,accurate_function_local,vertices,Gauss_coefficient_reference_1D,Gauss_point_reference_1D);
end
r=sqrt(r);