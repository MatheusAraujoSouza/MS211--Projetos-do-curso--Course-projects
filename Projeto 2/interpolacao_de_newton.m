function G1=interpolacao_de_newton

%vamos começar usando o método de interpolação de newton
%antes de tudo precisamos calcular as diferenças divididas e depois montar 
%o polinomio esse passo vai ser simples
                %interpolação de newton
                
%carregando primeiro os dados 
X=[0 0.5 1 2 2.5 3 3.5];
y=[2 1.6 0.8 0.04 0.004 0.0002 0.000009];

%nosso objetivo agora é escrever um programa que determine uma aproXimação
%de f no ponto 1.5

%calculando as diferenças divididas 
%vamos reduzir o tamanho da nossa matriz para diminuição de uso da memória
DifereDivi=zeros(7,5);
DifereDivi(:,1)=y;

%depois de criarmos nossa matriz das diferenças divididas vamos efetuar os
%calculos correspondentes a cada uma.
n=input('Dentre os graus 1,2 e 3 qual vamos usar na interpolação?, n=');
for i=2:n+1
    for j=i+2:n+3
        DifereDivi(j,i)=[DifereDivi(j,i-1)-DifereDivi(j-1,i-1)]/[X(j)-X(j-i+1)];

    end
end
%quando eXecutamos esse laço sempre fazemos o calculo até o n+1 diferenças
%divididas, sempre evitando calculos desnecessarios nas nossas interações,
%não precisamos fazer os calculos das diferenças dividias que tem em baixo
%para chegar na próXima coluna assim também evistamos de 


%agora que já calculamos as diferenças divididas vamos calcular o polinomio
%de newton 
%como queremos calcular o melhor polinomio que passa pelo 1.5 usando
%polinomios de interpolação dada a nossa função de newton nosso f(X0) vai
%ser o DifereDivi(3,1)
syms x
%com esse comando 'syms' é possivel manipular variaveis simbolicas 
polnewton=DifereDivi(3,1);
P=1;
for i1=1:n
    P=P*(x-X(i1+2));
    polnewton=polnewton+P*DifereDivi(i1+3,i1+1);
end
%para deixar o polinomio em uma melhor forma de visualização vamos usar o
%comando expand
polnewton;
polnewton=expand(polnewton)



end





 
 