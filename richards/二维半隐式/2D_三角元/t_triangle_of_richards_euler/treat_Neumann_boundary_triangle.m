function b=treat_Neumann_boundary_triangle(result1_1,j,Neumann_boundary_function_name,b,boundary_edges,M_partition,T_partition,T_basis_test,number_of_test_local_basis,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,test_derivative_degree_x,test_derivative_degree_y)

%nbe: the total number of all the boundary edges.

nbe=size(boundary_edges,2);

%Check all boundary edges.
for k=1:nbe

%If the kth boundary edge is a Neumann boundary edge,then we add the corresponding line integral to b.

    if boundary_edges(1,k)==-2 
        
        element_index=boundary_edges(2,k);
        vertices=M_partition(:,T_partition(:,element_index));
        [Gauss_coefficient_local_triangle,Gauss_point_local_triangle]=generate_Gauss_local_triangle(Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,vertices);
        end_point_1=M_partition(:,boundary_edges(3,k));
        end_point_2=M_partition(:,boundary_edges(4,k));
        for beta=1:number_of_test_local_basis
            temp=Gauss_quadrature_for_line_integral_test_triangle(result1_1,j,element_index,Neumann_boundary_function_name,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,T_basis_test,Gauss_point_local_triangle,end_point_1,end_point_2,vertices,beta,test_derivative_degree_x,test_derivative_degree_y);
            b(T_basis_test(beta,element_index),1)=b(T_basis_test(beta,element_index),1)+temp;
        end
        
    end

end