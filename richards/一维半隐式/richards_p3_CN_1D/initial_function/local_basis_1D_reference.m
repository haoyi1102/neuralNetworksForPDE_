function result=local_basis_1D_reference(x,vertices,basis_index,derivative_degree)

% if basis_type==103
      c=(x-vertices(1))/(vertices(2)-vertices(1));
    if derivative_degree==0
        
        if basis_index==1
            result=(1-c)^2*(2*c+1);
        elseif basis_index==2
             result=(vertices(2)-vertices(1))*c*(1-c)^2;
        elseif basis_index==3
            result=c^2*(-2*c+3);
        elseif basis_index==4
            result=(vertices(2)-vertices(1))*c^2*(c-1);
        end

    elseif derivative_degree==1
        
        if basis_index==1
            result=(1/(vertices(2)-vertices(1)))*(-6)*c*(1-c);
        elseif basis_index==2
             result=(c-1)*(3*c-1);
        elseif basis_index==3
            result=(1/(vertices(2)-vertices(1)))*6*c*(1-c);
        elseif basis_index==4
             result=3*c^2-2*c;
        end
        
    end  
% end

