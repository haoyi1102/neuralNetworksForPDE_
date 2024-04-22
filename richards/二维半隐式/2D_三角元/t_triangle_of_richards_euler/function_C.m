function result=function_C(result1,vertices,T_basis,x,y,j,n)

if j==1
    h=function_initial(x,y);
else
    h=global_function(result1,vertices,T_basis,x,y,j,n);
end

if y >= 20
    theta_r=0.034;
    theta_s=0.46;
    err=0.016;
    n=1.37;
    K_s=0.25/3600;
    m=1-1/n;
else
   theta_r=0.120;
    theta_s=0.5;
    err=0.028;
    n=3;
    K_s=2/3600;
    m=1-1/n;
end
% m=0.5;
result=(m*n*err^n*abs(h)^(n - 1)*(theta_s - theta_r))/(err^n*abs(h)^n + 1)^(m + 1);

% result=(err*m*n*sign(h)*(err*abs(h))^(n - 1)*(theta_r - theta_s))/((err*abs(h))^n + 1)^(m + 1);