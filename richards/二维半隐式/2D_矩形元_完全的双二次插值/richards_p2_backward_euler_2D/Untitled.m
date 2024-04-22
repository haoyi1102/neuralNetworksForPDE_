% syms theta_s theta_r alpha h beta K_s A gamma
% theta=(alpha*(theta_s-theta_r))/(alpha+abs(h)^beta)+theta_r;
% K=(K_s*A)/(A+abs(h)^gamma);
% diff(theta,h)
% diff(K,h)

syms theta_s theta_r err n K_s m h
% sign(h)=-1;
theta=(theta_s-theta_r)/(1+(err*abs(h))^n)^m+theta_r;
K=(K_s*(1-(err*abs(h))^(n-1)*(1+(err*abs(h))^n)^(-m))^2)/(1+(err*abs(h))^n)^(m/2);
C=diff(theta,h)
dK=diff(K,h)

