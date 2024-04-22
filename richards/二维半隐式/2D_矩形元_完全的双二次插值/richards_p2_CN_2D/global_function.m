function result=global_function(result1,vertices,T_basis,x,y,j,n,test_derivative_degree_x,test_derivative_degree_y)

if j==1/2
    if test_derivative_degree_x==0&&test_derivative_degree_y==0
    result=function_initial(x,y);
    elseif test_derivative_degree_x==1&&test_derivative_degree_y==0
        result=0;
    elseif test_derivative_degree_x==0&&test_derivative_degree_y==1
        result=-1;
    end
else
%     solution=result1;
    vertices_solution=result1(T_basis(:,n));
   
    result=0;
    for i=1:9
        if test_derivative_degree_x==0&&test_derivative_degree_y==0
            result=result+vertices_solution(i)*rectangular_local_basis(x,y,vertices,i,0,0);
        elseif test_derivative_degree_x==1&&test_derivative_degree_y==0
            result=result+vertices_solution(i)*rectangular_local_basis(x,y,vertices,i,1,0);
        elseif test_derivative_degree_x==0&&test_derivative_degree_y==1
            result=result+vertices_solution(i)*rectangular_local_basis(x,y,vertices,i,0,1);
        end
    end

end