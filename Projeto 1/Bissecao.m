

function M1=Bissecao
%Para invocar a função basta escrever Bissecao no 'Command Window'

%Primeira parte do projeto vamos criar um código do método da bisseção
%assim poderemos revolver o uma das funções encontrando suas raizes nas
%limitações especificadas 

                        % Método da Bisseção

%Não precisamos fazer a analise de convergência dessa função, estamos
%trabalhando com polinómios eles são continuous em toda reta real

a = 0; % Limite inferior do intervalo
b = 1; % Limite superior do intervalo
% f(t)=t^3-9t=-3 primeira função que vamos avaliar 

    f = 't^3-9*t+3';
    e1 = 10^-3; % Cota de erro absoluto máxima e para |f(t)|

    
% Cálculos Iniciais
t = (a+b)/2; % Aproximação inicial
% erro absoluto inicial vamos trabalhar sempre com uma modificação do erro
% absoluto incial assim podemos fazer a análise antes e depois da troca de
% dados

EA = abs(b-a); 


k = 0; % Contador de iterações
g = abs(eval(f)); % Módulo de f(t) na raiz aprotimada inicial


%vamos também calcular o número de interações 
%dado meu a e b inicial e meu e1 podemos fazer uma aproxímação para o
%número de interações totais do nosso método intKBi=Log(na base 2)(E0/e1)
E0 = b-a;
intKBi=log2(E0/e1);

%assim conseguimos estimar um número exato de interações 

fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n','k =',k,...
' t =',t,' f(t) =',eval(f),' EA|(b-a)| =',EA);


%aqui já estamos prontos para começar nosso loop vamos usar como critério
%de parada vamos usar 
           %|(b-a)| > e1 && |f(t)| > e1 && k < Log2(E0/e1)

               while EA > e1 && g > e1 && k < intKBi
                            t = a;
              fa = eval(f); %calculo o valor do meu fa usando a função eval
                             t = b;
              fb = eval(f); %calculo o valor do meu fb usando a função eval
                             t = (a+b)/2;
                             ft = eval(f);
              %comando que testa sempre se a imagem da minha função está em
              %um intervalo certo.
                             if fa*ft < 0
                                b = t;
                             else
                                a = t;
                             end
                             k = k+1;
t = (a+b)/2; % Nova aproximação da raiz
EA = abs(b-a); %erro absoluto
g = abs(eval(f)); % Módulo de f(t) na nova aproximação da raiz
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n','k =',k,...
' t =',t,' f(t) =',eval(f),' EA|(b-a)|=',EA);
end
