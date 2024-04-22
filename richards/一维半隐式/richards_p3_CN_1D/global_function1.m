function result=global_function1(result1_1,vertices,T_basis,x,j,n,test_derivative_degree)

if j==1/2
    if test_derivative_degree==0
    result=function_initial(x);
    else
    result=-1.02;
    end
else
    solution=result1_1;
    vertices_solution=solution(T_basis(:,n),:);   
    result=0;
    for i=1:4
        if test_derivative_degree==0
        result=result+vertices_solution(i)*local_basis_1D_reference(x,vertices,i,0);
        else 
        result=result+vertices_solution(i)*local_basis_1D_reference(x,vertices,i,1);
        end
    end

end

