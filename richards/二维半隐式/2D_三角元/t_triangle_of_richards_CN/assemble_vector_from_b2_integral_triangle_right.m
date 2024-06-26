function r=assemble_vector_from_b2_integral_triangle_right(result1_1,result1_2,j,M_partition,T_partition,T_basis_test,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,test_derivative_degree_x,test_derivative_degree_y)

r=zeros(vector_size,1);
for n=1:number_of_elements

    vertices=M_partition(:,T_partition(:,n));
    [Gauss_coefficient_local_triangle,Gauss_point_local_triangle]=generate_Gauss_local_triangle(Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,vertices);

    for beta=1:number_of_test_local_basis     
       temp=Gauss_quadrature_for_b2_integral_test_triangle_right(n,result1_1,result1_2,j,T_basis_test,Gauss_coefficient_local_triangle,Gauss_point_local_triangle,vertices,beta,test_derivative_degree_x,test_derivative_degree_y);
       r(T_basis_test(beta,n),1)=r(T_basis_test(beta,n),1)+temp;
    end

end