function result=assemble_matrix_from_K_integral(i,result1_1,T_basis,M_partition,T_partition,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,trial_derivative_degree,test_derivative_degree)

result=zeros(matrix_size(1),matrix_size(2));

for n=1:number_of_elements
   
    vertices=M_partition(:,T_partition(:,n));
    
    lower_bound=min(vertices(1),vertices(2));
    upper_bound=max(vertices(1),vertices(2));

    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);
   
    for alpha=1:number_of_trial_local_basis
       for beta=1:number_of_test_local_basis      
          temp=Gauss_quadrature_for_K_integral_trial_test(i,n,result1_1,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,alpha,trial_derivative_degree,beta,test_derivative_degree); 
          result(T_basis(beta,n),T_basis(alpha,n))=result(T_basis(beta,n),T_basis(alpha,n))+temp;
       end
    end

end