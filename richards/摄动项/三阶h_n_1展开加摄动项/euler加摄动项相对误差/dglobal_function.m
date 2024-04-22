%每一层上的数值解的表达式的导数
function result = dglobal_function(result1_1,vertices,T_basis,x,j,n)

if j==1
    result = -1.02;
else
    solution=result1_1;
    vertices_solution=solution(T_basis(:,n),:);
   
    result=0;
    for i=1:4
        result=result+vertices_solution(i)*local_basis_1D_reference(x,vertices,i,1);
    end

end

