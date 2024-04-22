function [M,T]=generate_M_T_rectangular(left,right,bottom,top,h_partition,basis_type)
%矩形元
h=h_partition;

if basis_type==1

   N1=(right-left)/h(1);
   N2=(top-bottom)/h(2);
   tnp=(N1+1)*(N2+1);
   M=zeros(2,tnp);%每个点处的坐标
   T=zeros(4,N1*N2);%每个单元上的每个点的全局编号
   Q=zeros(N1+1,N2+1);%每个点的全局标号

   for j=1:tnp
      if mod(j,N2+1)==0
         M(1,j)=left+(j/(N2+1)-1)*h(1);
         M(2,j)=top;
      else
         M(1,j)=left+fix(j/(N2+1))*h(1);
         M(2,j)=bottom+(mod(j,N2+1)-1)*h(2);
      end
   end

   for i=1:N1+1
      for j=1:N2+1
         Q(i,j)=(i-1)*(N2+1)+j;
      end
   end

%Go through all rectangles in the partition. 
%For the nth rectangle, store the information of its two triangular elements whose element indices are 2n-1 and 2n.
   for n=1:N1*N2
   
      if mod(n,N2)==0
         row=N2;   %行
         column=n/N2;  %列
      else
         row=mod(n,N2);
         column=fix(n/N2)+1;
      end
   
      T(1,n)=Q(column,row);
      T(2,n)=Q(column+1,row);
      T(3,n)=Q(column+1,row+1);  
      T(4,n)=Q(column,row+1);
   end

elseif basis_type==2

   N1=(right-left)/h(1);
   N2=(top-bottom)/h(2);
   dh=h/2;
   dN1=N1*2;
   dN2=N2*2;
   tnp=(dN1+1)*(dN2+1);
   M=zeros(2,tnp);
   T=zeros(9,N1*N2);
   Q=zeros(dN1+1,dN2+1);

   for j=1:tnp
      if mod(j,dN2+1)==0
         M(1,j)=left+(j/(dN2+1)-1)*dh(1);
         M(2,j)=top;
      else
         M(1,j)=left+fix(j/(dN2+1))*dh(1);
         M(2,j)=bottom+(mod(j,dN2+1)-1)*dh(2);
      end
   end

   for i=1:dN1+1
      for j=1:dN2+1
         Q(i,j)=(i-1)*(dN2+1)+j;
      end
   end

%Go through all rectangles in the partition. 
%For the nth rectangle, store the information of its two triangular elements whose element indices are 2n-1 and 2n.
   for n=1:N1*N2
   
      if mod(n,N2)==0
         row=N2;
         column=n/N2;
      else
         row=mod(n,N2);
         column=fix(n/N2)+1;
      end
   
      T(1,n)=Q(2*column-1,2*row-1);
      T(2,n)=Q(2*column+1,2*row-1); 
      T(3,n)=Q(2*column+1,2*row+1);
      T(4,n)=Q(2*column-1,2*row+1);
      T(5,n)=Q(2*column,2*row-1);
      T(6,n)=Q(2*column+1,2*row);
      T(7,n)=Q(2*column,2*row+1);
      T(8,n)=Q(2*column-1,2*row);
      T(9,n)=Q(2*column,2*row);

   end
end
