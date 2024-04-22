function result=global_function(result1,vertices,T_basis,x,y,j,n)

if j==1/2
    result=function_initial(x,y);
else
%     solution=result1;
    vertices_solution=result1(T_basis(:,n));
   
    result=0;
    for i=1:6
        result=result+vertices_solution(i)*triangular_local_basis(x,y,vertices,i,0,0);
    end

end