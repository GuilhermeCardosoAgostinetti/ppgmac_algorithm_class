% Trabalho Juliana O.
% Discentes: Guilherme Cardoso Agostinetti e Nelson Nghale
% Exercício 01

clc, clear
 
%Entrada de Variaveis...
N = input("Valor de N: ");;
x = input("Valor de x");
solucao_numerica = x;
solucao_exata = 1/tan(x);
p = 0;
erro_relativo = 0.1;
quantidade_termos = 0;

%Loop para finalizar no erro desejado
        %Loop para calculo com N quantidade de Termos...
        for k = 1:2:N
        
        termo = -x^(2*k+1)/(2*k+1) +x^(2*k+3)/x^(2*k+3);
        solucao_numerica = solucao_numerica + termo;
        
        dados_solucao_numerica(k) = solucao_numerica;
        end
        
        % Análise das suluções e erros.
%         
%         dados_solucao_numerica(k) = solucao_numerica;
%         quantidade_termos(k) = N; 
%         erro_absoluto(k) = abs(solucao_exata-solucao_numerica);
%         erro_relativo(k) = abs(solucao_exata-solucao_numerica)/solucao_exata;
%         solucao_numerica = 0;


