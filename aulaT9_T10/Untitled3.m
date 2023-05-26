clear all 
close all

a=10; save teste.mat a % grava a vari?vel a no ficheiro teste.mat
b=15; save('teste.mat','b') % o mesmo na forma de funcao. O conte?do anterior teste.mat foi 
%apagado
save  teste.mat a -append% acrescenta a ao ficheiro

save 'teste.txt' a -ascii   % gravar a em format txt. Os nomes das vari?veis n?o s?o guardados
save 'teste.txt' b -ascii -append   % gravar b em format txt acrescentando ao que j? foi gravado

ab=[a,b]; save  'teste.txt' -ascii -append

clear all
load('teste.mat') % leitura de ficheiros .mat . As vari?veis ficam com o nome com que foram gravadas
whos; clear all
load('teste.mat','a'); % leitura de vari?veis especificas
whos

save  'teste.txt' -ascii 
clear all; 
load('teste.txt','-ascii'); %Leitura de ficheiros de texto -  cria uma vari?vel
S =load('teste.txt','-ascii'); %neste caso a vari?vel S fica com os dados no ficheiro
whos

% arrays de c?lulas
% um array de caracteres difere de um array de strings
Nome=['Ana    ' ; 'Ricardo']; 
% num array de caracteres cada caracter ? um elemento do array
% O n?mero de caracteres em cada linha tem que ser igual
Nome(1:2,:)

%Array de strings
Nome=["Ana" ; "Ricardo"]; % Os nomes t?m comprimento vari?vel. Cada nome ? uma string
Nome(1:2)

Notas={"Nome", "Trabalho n? 1", "Teste n?1"; "Ana", 18, 19} ;
Notas(:,:) % Todo o array de c?lulas
Notas(2,2) % A nota da Ana no trabalho n?1 como c?lula
cell2mat(Notas(2,2)) % A nota da Ana no Trabalho n?1 como numero

% Tabelas
Nome=["Ana"; "Ricardo"]; %lista dos nomes como string array
Nmec=["1213"; "25252"];
Trabalho1=[18; 15]; % lista das notas no Trabalho1 como vetor num?rico
Teste1=[19; 17]; % lista das notas no Teste1 como vetor num?rico
Tabela=table(Nome,Nmec,Trabalho1,Teste1) % cria??o de uma tabela
Tabela.Properties %lista das propriedades da tabela
Tabela.Properties.RowNames=Nmec; % Altera??o do nome das linhas
Tabela.Nmec % coluna dos Numeros Mecanograficos
NotasAna=Tabela("1213",:) % acesso a uma linha que corresponde a um nome de linha

% Estruturas

disciplina.nome='Simulacao e Modelacao'; % cria estrutura disciplina com propriedade nome
disciplina.ano=1;% adiciona a  propriedade ano a disciplina
disciplina.semestre=2; % adiciona a  propriedade semestre a disciplina
disciplina.alunos=Nome; % adiciona a propriedade alunos que ? uma string com o nome dos alunos
disciplina.Notas=Tabela; % Vari?vel tipo table vamos ver a seguir
disciplinas=repmat(disciplina,2,1); % array de estruturas
disciplinas(2).nome='Calculo 2' % define o nome da segunda disciplina 
disciplinas(2).alunos % alunos da segunda disciplina

figure(1)

populacao=readtable('population.csv');
[popPRT,AnoPRT]=popPais(populacao,"PRT");
[popESP,AnoESP]=popPais(populacao,"ESP");


plot(AnoPRT,popPRT/1e6,'r-',AnoESP,popESP/1e6,'k-' )
legend('PRT','ESP','Location','southeast')
xlabel('Ano') ; ylabel('Popula??o (milh?es)')


figure(2)
clear all
x=linspace(0,2*pi,20); f=plot(x,sin(x),'b-x');
get(f) % obter uma lista de propriedades e os seus valores
set(f,'LineWidth',1) % aumentar a largura do tra?o
set(f,'Marker','s') % mudar o marcador
f.Color=[1,0,0]; % alterar a cor da linha para vermelho