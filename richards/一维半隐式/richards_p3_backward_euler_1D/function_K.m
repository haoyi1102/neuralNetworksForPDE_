function result=function_K(result1_1,vertices,T_basis,x,j,n)

if j==1
    h=function_initial(x);
else
    h=global_function(result1_1,vertices,T_basis,x,j,n);
end

K_s=0.00944;
A=1.175e6;
gamma=4.74;
result=(K_s*A)/(A+abs(h)^gamma);
