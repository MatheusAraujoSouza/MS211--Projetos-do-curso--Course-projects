
function x=NewtonInexato

%vamos começar com o método de newton para resolução de sistemas não
%lineares 

                    %Método de newton inexato 

           e= 10^-3; % Erro máximo para |f(t)|
%vamos escolher esses pontos iniciais porque eles foram os obtidos dos
%métodos passados, assim podemos chegar mais próximo da função.


 t= [0.337402344;2.857244673;1.301251912];
%poderiamos mandar os t1 dessa forma mas podemos em relação 
%ao nosso x t1=xk(1,1),t2=xk(2,1),t3=xk(3,1)

           ft=[t(1).^3-9*t(1)-6*t(2)-4 ;log10(t(2)).*(t(2)-t(1))-3*(t(3)-t(2))+1;
                2*sin(((3*pi)/2)*(t(3)-t(2)))-t(1)+t(3)];
%assim teremos um controle melhor das nossas variáveis 
Jk=[       3*t(1)^2 - 9,                                       -6,                              0;
 -log(t(2))/log(10), log(t(2))/log(10) - (t(1) - t(2))/(t(2)*log(10)) + 3,                             -3;
              -1,              -3*pi*cos((3*pi*(t(3) - t(2)))/2), 3*pi*cos((3*pi*(t(3) - t(2)))/2) + 1];
      
k=0;
dt=9999;            


                        while max(abs(ft)) > e && max(abs(dt))> e 
                            
                   %vamos implementar Lu com pivotemento parcial
                   [L,U,p]=lu(Jk);
                   y=L\(p*(-ft));
                   s=U\y;
                   ta=t;
                   t = t + s;
                   ft=[t(1).^3-9*t(1)-6*t(2)-4 ;log10(t(2)).*(t(2)-t(1))-3*(t(3)-t(2))+1;
                2*sin(((3*pi)/2)*(t(3)-t(2)))-t(1)+t(3)];
            Jk=[       3*t(1)^2 - 9,                                       -6,                              0;
 -log(t(2))/log(10), log(t(2))/log(10) - (t(1) - t(2))/(t(2)*log(10)) + 3,                             -3;
              -1,              -3*pi*cos((3*pi*(t(3) - t(2)))/2), 3*pi*cos((3*pi*(t(3) - t(2)))/2) + 1];
                   dt=t-ta;
                   k=k+1;
                   
                   
                   fprintf(1,'%s %2d %s %12.9f %s %12.9f\n ',...
    'k =',k,' d(t) =',max(abs(dt)),' f(t) =',max(abs(ft)));
                        end
                        
                
                   
                          
end



