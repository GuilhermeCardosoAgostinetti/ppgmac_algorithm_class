% Trabalho Juliana O.
% Discentes: Guilherme Cardoso Agostinetti
% Data: 20221009
% Exercício 01

clc, clear
 
%Entrada de Variaveis...
N = input("Valor de N");
x = input("Valor de x");
solucao_numerica = 0;
solucao_exata = 1/2*log((1+x)/(1-x));
p = 0;
erro_relativo = 0.1;
quantidade_termos = 0;

        %Loop para calculo com N quantidade de Termos...
        for k = 1:N
        
        t = x^(2*k-1)/(2*k-1);
        solucao_numerica = solucao_numerica + t;
       
        quantidade_termos(k) = k; 
        
        % Análise de erros...
        erro_absoluto(k) = abs(solucao_exata-solucao_numerica);
        erro_relativo(k) = abs(solucao_exata-solucao_numerica)/solucao_exata;
        dados_solucao_numerica(k) = solucao_numerica;
        dados_Sol_exata(k) = solucao_exata;
         
        end
       
%Resultados...
Tabela = ["Qtd. Termos"  quantidade_termos;"Sol. Numérica" dados_solucao_numerica;"Erro Absoluto" erro_absoluto; "Erro Relativo" erro_relativo];
Tabela = Tabela';
