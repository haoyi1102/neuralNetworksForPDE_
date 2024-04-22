function result=assemble_vector_from_E2_integral(Epsilon,i,result1_1,T_basis,M_partition,T_partition,number_of_test_local_basis,...
    number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,test_derivative_degree)

result=zeros(vector_size,1);

for n=1:number_of_elements
    
    vertices=M_partition(:,T_partition(:,n));
    
    lower_bound=min(vertices(1),vertices(2));
    upper_bound=max(vertices(1),vertices(2));
    
    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);

    for beta=1:number_of_test_local_basis     
        temp=Gauss_quadrature_for_E2_integral_test(Epsilon,i,n,result1_1,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,beta,...
            test_derivative_degree);
        result(T_basis(beta,n),1)=result(T_basis(beta,n),1)+temp;
    end

end