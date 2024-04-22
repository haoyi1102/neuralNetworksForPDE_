function result=dexact_solution(z,t,T)
%  result=-1.02.*z+19.3+t.*(z-40).*z/(4*T);
result=-1.02+(t.*(z-40)+t.*z)/(4*T);

% syms z t
% T=10;
% z=0:1:40;
% t=0:1:T;
% 
% [z,t]=meshgrid(z,t);
% 
% h=-1.02.*z-20.7+t.*(z-40).*z/(4*T);
% mesh(z,t,h);







