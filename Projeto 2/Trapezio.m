%nesmo não tendo a cara real da função vamos fazer uma formula que aproxime
%o valor da integral de [0,3.5], vai ser uma integral repetida ponto a
%ponto 
%vamos usar a regrá do trapézio
function T3=Trapezio
X=[0 0.5 1 2 2.5 3 3.5];
y=[2 1.6 0.8 0.04 0.004 0.0002 0.000009];
DifereDivi=zeros(7,7);
DifereDivi(:,1)=y;
n=6;
for i=2:n+1
    for j=i:n+1
        DifereDivi(j,i)=[DifereDivi(j,i-1)-DifereDivi(j-1,i-1)]/[X(j)-X(j-i+1)];
    end
   
end
%assim vamos calcular todas as diferenças divididas e montar nosso
%polinomio para a integração 
  syms x
  polnewton=DifereDivi(1,1);
    P=1;
    %vamos fazer essas operações para controlar o nosso novo polinomio 
    for i1=1:6
    P=P*(x-X(i1));
    polnewton=polnewton+P*DifereDivi(i1+1,i1+1);
    
    end
     
     polnewton=expand(polnewton);
     polnewton=simplify(polnewton);
     F=@(x) -0.0102*x^6+0.0779*x^5 - 0.2923*x^4+0.6800*x^3-0.800*x^2-0.800*x + 2;
     a=0;
     b=3.5;
     integral=0.5*(F(a)+(b));
     n=10000;
     h=(b-a)/n;
     c=a+h;
     for i=1:n-1
         integral=integral+F(c);
         c = c + h;
     end
     integral=h*integral
     %agora vamos calcular o erro 
     %temos que a derivada de segunda ordem da nossta função é dada como 
     Derivate=@(x) -(3060*x^4-15580*x^3+35076*x^2-40800*x+16000)/10000;
     % calculo do erro pode ser dado como uma aproximação, já que não temos
     % a função exata
     xe=max(abs(X));
     m2=abs(Derivate(xe));
     erro_de_aproximacao=(n*h^3*m2)/12
     %podemos tambem comparar com um erro das diferenças divididas 
     erro_difereDivi=(n*h^3*abs(DifereDivi(7,7)))/6
     %estariamos nesse caso fazendo uma aproximação da função exatamtente
     %falando porque não temos a cara dela então apenas pegamos a diferença
     %dividida de ordem n+1 que no nosso caso foi 7
     
    
end
