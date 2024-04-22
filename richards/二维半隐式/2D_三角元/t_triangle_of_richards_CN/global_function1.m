function result=global_function1(result1,vertices,T_basis,x,y,j,n,trial_derivative_degree_x,trial_derivative_degree_y)

if j==1/2
    
    if trial_derivative_degree_x==0 && trial_derivative_degree_y==0
        result=function_initial(x,y);
    elseif trial_derivative_degree_x==1 && trial_derivative_degree_y==0
        result=0;
    elseif trial_derivative_degree_x==0 && trial_derivative_degree_y==1
        result=1;   
    end
        
else
%     solution=result1;
    vertices_solution=result1(T_basis(:,n));
   
    result=0;
    for i=1:length(vertices_solution)
        result=result+vertices_solution(i)*triangular_local_basis(x,y,vertices,i,trial_derivative_degree_x,trial_derivative_degree_y);
    end

end