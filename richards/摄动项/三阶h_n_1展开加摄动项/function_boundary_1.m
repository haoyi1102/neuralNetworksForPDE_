function result=function_boundary_1(x,j,t_partition,T)

left=0;
right=40;

if x==left
    result=-1.02-10*j*t_partition/T;
elseif x==right
    result=-1.02+10*j*t_partition/T;
end