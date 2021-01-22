

function M2=falsaP
%Agora vamos implementar o método da Falsa posição para a resolução da 
%segunda função

                    %método da falsa posição 
         
 %o melhor ponto é entre 1 e 3 conseguimos ver isso pela plotagem do
 %gráfico também podemos analisar isso pelas derivadas que etistem uma
 %única no intervalo mas vamos deitar isso para o relátorio 
% Parâmetros
a = 4; % Limite inferior do intervalo
b = 5; % Limite superior do intervalo

%analisamos a função graficamente logo esses pontos iniciais respeitao a
%convergencia da função com logaritmo 
f = 'log10(t).*t-3';    
e1 = 10^-3;            
                 
  % Cálculos Iniciais
t = a;
fa = eval(f);
t = b;
fb = eval(f);
%Temos aqui que nossa primeira aproximação da reta do método da falsa
%posição
t = (a*fb-b*fa)/(fb-fa); 
%aqui temos a imagem do próximo ponto xk encontrado no nosso método
%que busca sempre a intersecção com o eixo das abissiças 
ft = eval(f);
k=0;
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n','k =',k,...
' t =',t,' f(t) =',ft,'|b-a| =',abs(b-a));
        
                   
  %aqui vamos usar apenas dois critérios de parada como foi passado em aula
  %poderiamos usar até mais como diz no livro da Márcia A.gomes
  %temos então |f(t)| > e1 && |(b-a)| >e1
              while abs(ft) > e1 && abs(b-a) >e1

                           k = k+1;
                           if fa*ft < 0
                                    b = t;
                           else
                                    a = t;
                           end
                            t = a;
                            fa = eval(f);
                            t = b;
                            fb = eval(f);
                            t = (a*fb-b*fa)/(fb-fa);
                            ft = eval(f);
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n',...
    'k =',k,' t =',t,' f(t) =',ft,' |b-a|=',abs(b-a));
end
        