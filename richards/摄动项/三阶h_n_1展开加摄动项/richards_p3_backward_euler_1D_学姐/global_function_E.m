%每一层上的数值解的表达式
function result=global_function_E(result1_1,vertices,T_basis,x,j,n)

if j==1
    result=function_initial(x);
else
    solution=result1_1;
    vertices_solution=solution(T_basis(:,n),:);
   
    result=0;
    for i=1:4
        result=result+vertices_solution(i)*local_basis_1D_reference(x,vertices,i,0);
    end

end

