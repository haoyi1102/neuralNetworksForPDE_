function r=rectangular_reference_basis(x,y,basis_index,derivative_degree_x,derivative_degree_y)

% if basis_type==2
    
    if derivative_degree_x==0&&derivative_degree_y==0
        
        if basis_index==1
            r=(1/4)*x*y*(x-1)*(y-1);
        elseif basis_index==2
            r=(1/4)*x*y*(x+1)*(y-1);
        elseif basis_index==3
            r=(1/4)*x*y*(x+1)*(y+1);
        elseif basis_index==4
            r=(1/4)*x*y*(x-1)*(y+1);
        elseif basis_index==5
            r=(1/2)*y*(y-1)*(1-x^2);
        elseif basis_index==6
            r=(1/2)*x*(x+1)*(1-y^2);
        elseif basis_index==7
            r=(1/2)*y*(y+1)*(1-x^2); 
        elseif basis_index==8
            r=(1/2)*x*(x-1)*(1-y^2);
        elseif basis_index==9
            r=(1-x^2)*(1-y^2);
        end
             
    elseif derivative_degree_x==1&&derivative_degree_y==0
 
        if basis_index==1
            r=(x*y*(y - 1))/4 + (y*(x - 1)*(y - 1))/4;
        elseif basis_index==2
            r=(x*y*(y - 1))/4 + (y*(x + 1)*(y - 1))/4;
        elseif basis_index==3
            r=(x*y*(y + 1))/4 + (y*(x + 1)*(y + 1))/4;
        elseif basis_index==4
            r=(x*y*(y + 1))/4 + (y*(x - 1)*(y + 1))/4;
        elseif basis_index==5
            r=-x*y*(y - 1);
        elseif basis_index==6
            r=- (x*(y^2 - 1))/2 - ((y^2 - 1)*(x + 1))/2;
        elseif basis_index==7
            r=-x*y*(y + 1);
        elseif basis_index==8
            r=- (x*(y^2 - 1))/2 - ((y^2 - 1)*(x - 1))/2;
        elseif basis_index==9
            r=2*x*(y^2 - 1); 
        end           

                      
    elseif derivative_degree_x==0&&derivative_degree_y==1
            
        if basis_index==1
            r=(x*y*(x - 1))/4 + (x*(x - 1)*(y - 1))/4;
        elseif basis_index==2
            r=(x*y*(x + 1))/4 + (x*(x + 1)*(y - 1))/4;
        elseif basis_index==3
            r=(x*y*(x + 1))/4 + (x*(x + 1)*(y + 1))/4;
        elseif basis_index==4
            r=(x*y*(x - 1))/4 + (x*(x - 1)*(y + 1))/4;
        elseif basis_index==5
            r=- (y*(x^2 - 1))/2 - ((x^2 - 1)*(y - 1))/2;
        elseif basis_index==6
            r=-x*y*(x + 1);
        elseif basis_index==7
            r=- (y*(x^2 - 1))/2 - ((x^2 - 1)*(y + 1))/2;
        elseif basis_index==8
            r=-x*y*(x - 1);
        elseif basis_index==9
            r=2*y*(x^2 - 1); 
        end
    end


% elseif basis_type==1
% 
%     if derivative_degree_x==0&&derivative_degree_y==0
%         
%         if basis_index==1
%             r=(1-x-y+x*y)/4;
%         elseif basis_index==2
%             r=(1+x-y-x*y)/4;
%         elseif basis_index==3
%             r=(1+x+y+x*y)/4;
%         elseif basis_index==4
%             r=(1-x+y-x*y)/4; 
%         end
% 
%     elseif derivative_degree_x==1&&derivative_degree_y==0
%         
%         if basis_index==1
%             r=(y-1)/4;
%         elseif basis_index==2
%             r=-(y-1)/4;
%         elseif basis_index==3
%             r=(y+1)/4;
%         elseif basis_index==4
%             r=-(y+1)/4;   
%         end
% 
%     elseif derivative_degree_x==0&&derivative_degree_y==1
%         
%         if basis_index==1
%             r=(x-1)/4;
%         elseif basis_index==2
%             r=(-x-1)/4;
%         elseif basis_index==3
%             r=(x+1)/4;
%         elseif basis_index==4
%             r=(1-x)/4;  
%         end
%         
%     end
%        
% end