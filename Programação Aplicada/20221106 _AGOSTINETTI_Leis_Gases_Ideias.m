%% Programação Aplicada - Projeto 2
%% Discente: Guilherme Cardoso Agostinetti
%% Docente: Juliana Oliveira

%% Entrada de Dados
clear, clc
gas = 10;
R = 0.082054;
matriz_final = [];
quantidade_de_equcoes = 0;
quantos_outros_gases = 0;
legenda = [];
legenda_erro = [];
local_outrogas = [];
vetor_temperatura = [300,500,700];
vetor_pressao = ["1","10","100"];
matriz_1 = [];
matriz_plot = [];
matriz_erro = [];
nomes_outros_gases = "";

%% Start estado da equação
estado_diox = false;
estado_ox = false;
estado_gasideal = false;
estado_outrogas = false;
%% LOOP
while true
    nome_gas = " "; % Variaveis resetadas a cada loop
    vetor_legenda = [];
    vetor_resultado = [];
    matriz_resultado = [];
    
    disp("0. para parar.") %Menu Gás
    disp("1. para Dióxido de Carbono")
    disp("2. para Oxigenio")
    disp("3. Gas da sua escolha")
    disp("4. Solução Gás Ideal")
    gas = input("Digite a opção desejada: ");       
        switch gas 
            case 0 %Finalizar Loop
                break
            case  1 %Setando valores de a e b para dióxido de carbono
                quantidade_de_equcoes = quantidade_de_equcoes+1;
                nome_gas = " Equação Van der Waals para dióxido de carbono";
                a = 3.592;
                b = 0.04267;
                estado_diox = true;
                local_diox = quantidade_de_equcoes+2*(quantidade_de_equcoes-1);
           
            case 2 %Setando valores de a e b para oxigenio
               quantidade_de_equcoes = quantidade_de_equcoes+1;
               nome_gas = " Equação Van der Waals para oxigenio";
               a = 1.360;
               b = 0.03183; 
               estado_ox = true;
               local_ox = quantidade_de_equcoes+2*(quantidade_de_equcoes-1);
        
            case 3 %Setando valores de a e b para oxigenio
               quantidade_de_equcoes = quantidade_de_equcoes+1;
               nome_gas = input("Digite o Nome do Gás: ","s");
               a = input("Digite o valor de a: ");
               b = input("Digite o valor de b: ");
               estado_outrogas = true;
               local_outrogas = [local_outrogas, quantidade_de_equcoes+2*(quantidade_de_equcoes-1)]; %Marcando a posião de cada gás extra
               quantos_outros_gases = quantos_outros_gases +1; %Marcando quantos novos gases foram inseridos
               nomes_outros_gases = [nomes_outros_gases, nome_gas]; %atribuindo os nomes de novos gases
            
            case 4
                quantidade_de_equcoes = quantidade_de_equcoes+1;
                nome_gas = "Equação dos Gáses ideias"
                estado_gasideal = true;
                local_gasesideias = quantidade_de_equcoes+2*(quantidade_de_equcoes-1);
        end

    legenda = [legenda, nome_gas]; % Vetor com o nome de todos os gases
    for T = 300:200:700 %Laço para Temperatura
        for n = 0:2 %Laço para Pressão
            P = 10^n;
                if gas == 4 % Lei dos Gases Ideias
                    v = R*T/P; 
                else 
                    v = (R*T)/(P+(a/(R*T/P)^2))-b;% Equação Van der Waals
                end   
        vetor_resultado = [vetor_resultado, v]; % Vetor resultado para T em funcao da Pressão
        end
          matriz_resultado = [matriz_resultado;vetor_resultado];
          vetor_resultado = [];
    end
    matriz_final = [matriz_final;matriz_resultado]; % Gerando matriz com todos os resultados
    disp(matriz_final)
end

%% PLOTS
figure(1)
for k = 1:3
    subplot(1,3,k);
    for n = 1:3:3*quantidade_de_equcoes   
        plot(vetor_temperatura, matriz_final(n:n+2,k))
        hold on
        legend(legenda)
        xlabel("Temperatura(T)")
        ylabel("Volume Molar(v)")
        title("Para P = " + vetor_pressao(k))
        grid on
    end 
end

%% PLOTS ERROS
contador = 0;
if estado_gasideal == true
    disp("1.Sim")
    disp("2. Não")
    comando = input("Deseja Plotar Erros? ");
    if comando == 1
        if estado_diox == true
            matriz_erro = abs(matriz_final(local_gasesideias:local_gasesideias+2,:) - matriz_final(local_diox:local_diox+2,:));
            contador = contador +1;
            legenda_erro = [legenda_erro, "Diferença entre as equações para Dióxido de Carbono"];
        end
        if estado_ox == true
            matriz_erro = [matriz_erro;abs(matriz_final(local_gasesideias:local_gasesideias+2,:) - matriz_final(local_ox:local_ox+2,:))];
            contador = contador + 1;
            legenda_erro = [legenda_erro, "Diferença entre as equações para Oxigenio"];
        end
        if estado_outrogas == true
           for p = 1:quantos_outros_gases
              matriz_erro = [matriz_erro;abs(matriz_final(local_gasesideias:local_gasesideias+2,:) - matriz_final(local_outrogas(p):local_outrogas(p)+2,:))];
              contador = contador + 1;
              legenda_erro = [legenda_erro, nomes_outros_gases(p+1)];
           end 
        end
          figure(2)
                for q = 1:3
                    subplot(1,3,q);
                    for c = 1:contador
                        plot(vetor_temperatura,matriz_erro(c+2*(c-1):3*c,q))
                        hold on
                        legend(legenda_erro);
                        xlabel("Temperatura(T)")
                        ylabel("Erro")
                        title("Para P = " + vetor_pressao(q))
                    end
                end
    end
end

%% PRINT MATRIZ
for v = 1:quantidade_de_equcoes
    vetor_temperatura = [vetor_temperatura,vetor_temperatura(1,1:3)];  
end
vetor_temperatura = vetor_temperatura';

for r = 1:3*quantidade_de_equcoes
    matriz_1 = [matriz_1;vetor_temperatura(r),matriz_final(r,:)];
end
    vetor_pressao = [legenda(1),vetor_pressao];
    contador = 0;
for m = 1:3:3*quantidade_de_equcoes
    contador = contador + 1;
    vetor_pressao(1) = legenda(contador);
    matriz_plot = [ matriz_plot;vetor_pressao;matriz_1(m:m+2,:)];
end
disp(matriz_plot);
