function [M,T]=generate_M_T_1D(left,right,h_partition,basis_type)

h=h_partition;

if basis_type==101

   N=(right-left)/h;
   M=zeros(1,N+1);
   T=zeros(2,N);

   for i=1:N+1
       M(1,i)=left+(i-1)*h;       
   end

   for i=1:N
       T(1,i)=i;    
       T(2,i)=i+1;
   end
      
end