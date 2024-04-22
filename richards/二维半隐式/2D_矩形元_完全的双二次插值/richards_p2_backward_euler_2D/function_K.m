function result=function_K(result1,vertices,T_basis,x,y,j,n)

if j==1
    h=function_initial(x,y);
else
    h=global_function(result1,vertices,T_basis,x,y,j,n);
end

% K_s=0.00944;
% A=1.175e6;
% gamma=4.74;
% result=(K_s*A)/(A+abs(h)^gamma);
if y>=5
    theta_r=0.034;
    theta_s=0.46;
    err=0.016;
    n=1.37;
    K_s=0.25/3600;
else 
    theta_r=0.120;
    theta_s=0.5;
    err=0.028;
    n=3;
    K_s=2/3600;
end
m=0.5;

result=(K_s*(1-(err*abs(h))^(n-1)*(1+(err*abs(h))^n)^(-m))^2)/(1+(err*abs(h))^n)^(m/2);
