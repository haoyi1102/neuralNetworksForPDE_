function r=assemble_vector_from_integral_time_rectangular(result1,j,dt,M_partition,T_partition,T_basis,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,test_derivative_degree_x,test_derivative_degree_y)

r=zeros(vector_size,1);

for n=1:number_of_elements

    vertices=M_partition(:,T_partition(:,n));
    [Gauss_coefficient_local_rectangular,Gauss_point_local_rectangular]=generate_Gauss_local_rectangular(Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,vertices);

    for beta=1:number_of_test_local_basis     
       temp=Gauss_quadrature_for_integral_test_time_rectangular(n,result1,j,dt,T_basis,Gauss_coefficient_local_rectangular,Gauss_point_local_rectangular,vertices,beta,test_derivative_degree_x,test_derivative_degree_y);
       r(T_basis(beta,n),1)=r(T_basis(beta,n),1)+temp;
    end

end