function [pop,Ano]=popPais(populacao,pais)
pop=populacao(populacao.Code==pais,:);
Ano=str2num(cell2mat(pop.Year));
pop=pop.Population;
end