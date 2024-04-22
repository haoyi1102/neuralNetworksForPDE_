function r=Gauss_quadrature_for_line_integral_test_triangle(result1_1,j,n,coefficient_function_name,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,T_basis,Gauss_point_local,end_point_1,end_point_2,test_vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y)

%Gpn: the number of the Gauss points of the Gauss formula we are using
%Gauss_coefficient_local_1D,Gauss_point_local_1D: the Gauss coefficients and Gauss points on the local interval.

Gpn=length(Gauss_coefficient_reference_1D);
r=0;

if end_point_1(2)==end_point_2(2)
%The edge is horizontal.

    lower_bound=min(end_point_1(1),end_point_2(1));
    upper_bound=max(end_point_1(1),end_point_2(1));
    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);
    for i=1:Gpn
         r=r+Gauss_coefficient_local_1D(i)*feval(coefficient_function_name,Gauss_point_local_1D(i),end_point_1(2))*triangular_local_basis(Gauss_point_local_1D(i),end_point_1(2),test_vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
    end    

elseif end_point_1(1)==end_point_2(1)
%The edge is vertical.

    lower_bound=min(end_point_1(2),end_point_2(2));
    upper_bound=max(end_point_1(2),end_point_2(2));
    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);
    for i=1:Gpn
        ´ý¸Ä
         C=function_C(result1_1,test_vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j,n);
         r=r+Gauss_coefficient_local_1D(i)*C*feval(coefficient_function_name,end_point_1(1),Gauss_point_local_1D(i))*triangular_local_basis(end_point_1(1),Gauss_point_local_1D(i),test_vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
    end 
    
else
%The slope of the edge is in (0,infinity).

    lower_bound=min(end_point_1(1),end_point_2(1));
    upper_bound=max(end_point_1(1),end_point_2(1));
    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);
    slope=(end_point_2(2)-end_point_1(2))/(end_point_2(1)-end_point_1(1));
    Jacobi=sqrt(1+slope^2);
    for i=1:Gpn
         x=Gauss_point_local_1D(i);
         y=slope*(x-end_point_1(1))+end_point_1(2);
         r=r+Gauss_coefficient_local_1D(i)*Jacobi*feval(coefficient_function_name,x,y)*triangular_local_basis(x,y,test_vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
    end 
    
end