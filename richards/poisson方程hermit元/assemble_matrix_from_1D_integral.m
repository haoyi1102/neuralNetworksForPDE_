function result=assemble_matrix_from_1D_integral(coefficient_function_name,M_partition,T_partition,T_basis_trial,T_basis_test,...
    number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,...
    Gauss_point_reference_1D,trial_derivative_degree,test_derivative_degree)

result=sparse(matrix_size(1),matrix_size(2));%生成一个10*10全局稀疏矩阵

for n=1:number_of_elements
   
    vertices=M_partition(:,T_partition(:,n));
    lower_bound=min(vertices(1),vertices(2));
    upper_bound=max(vertices(1),vertices(2));
    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);
   
    for alpha=1:number_of_trial_local_basis
       for beta=1:number_of_test_local_basis      
          temp=Gauss_quadrature_for_1D_integral_trial_test(coefficient_function_name,Gauss_coefficient_local_1D,Gauss_point_local_1D,...
              vertices,alpha,trial_derivative_degree,vertices,beta,test_derivative_degree); 
          result(T_basis_test(beta,n),T_basis_trial(alpha,n))=result(T_basis_test(beta,n),T_basis_trial(alpha,n))+temp;
       end
    end

end