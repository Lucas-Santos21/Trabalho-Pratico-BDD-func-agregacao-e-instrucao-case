--1)Crie um banco de Dados com o nome BD16Abril

create database BD16Abril
go

--2) Torne-o ativo

use BD16Abril

select * from notas

--3) Atualize com apenas um UPDATE a coluna ds_situacao com o seguinte crit�rio:

update notas set ds_situacao =
	CASE
		when vl_media >= 6 then 'Aprovado'
		when vl_media < 3 then 'Reprovado'
		else 'Exame'
	end

--4) Execute uma cl�usula para arredondar as notas dos alunos seguindo o crit�rio:


update notas set vl_media =
	CASE
		when vl_media - floor(vl_media) <= 0.25 then floor(vl_media)
		when vl_media - floor(vl_media) >= 0.75 then floor(vl_media) + 1
		else floor(vl_media) + 0.5
	end

--5) Obtenha a quantidade de alunos, a maior nota, a menor nota e a m�dia geral de todos os alunos

select 
	COUNT (nm_aluno) as Quantidade_Alunos,
	max(vl_media) as Maior_nota,
	min(vl_media) as Menor_nota,
	avg(vl_media) as Media_Geral

from notas

--6) Execute uma cl�usula para mostrar os dados da tabela ordenados pelo nome do aluno

select * from notas
order by nm_aluno

----7) Execute uma cl�usula para mostrar os dados da tabela em ordem decrescente de m�dia e crescente
--de nome

select * from notas
order by vl_media desc, nm_aluno asc

--8) Obtenha a lista (nome e m�dia) dos 10 alunos com melhor desempenho (10 melhores m�dias)

select top 10 nm_aluno, vl_media from notas
order by vl_media desc

--9) Obtenha a lista (nome e m�dia) dos 10 alunos com pior desempenho (10 piores m�dias)select top 10 nm_aluno, vl_media from notasorder by vl_media--10) Obtenha uma lista com o valor da m�dia e n�mero de alunos que obtiveram aquela m�diaselect floor((select avg(vl_media) from notas)) as Media, count(*) as numero_alunos from notaswhere vl_media = (select avg(vl_media) from notas)--11) A partir da tabela notas crie duas outras tabelas:
--aprovados (com todos os alunos cuja m�dia seja igual ou superior a 6.0)
--exame (com todos os alunos cuja m�dia seja inferior a 6.0)

select * into aprovados from notas
where vl_media >= 6

select * into exame from notas
where vl_media < 6

--12) Montar uma consulta que retorne uma msg que um sistema de e-mail enviar� a todos os alunos. A
--msg dever� ter o seguinte formato. Caro(a) nome do aluno(a) � Sua Situa��o �: situa��o -
--exibir ainda ap�s a situa��o as seguintes mensagens: - Parab�ns (para os alunos aprovados), - Voc�
--dever� comparecer no dia 30/04 para a prova final (para os alunos de exame) e Infelizmente voc�
--dever� refazer a disciplina no pr�ximo semestre (para os alunos reprovados).

select 'Caro(a) ' + nm_aluno + ' sua situa��o �: ' + ds_situacao + ' | ' +
case
	when ds_situacao = 'Aprovado' then ' Parab�ns'
	when ds_situacao = 'Exame' then ' Voc� dever� comparecer no dia 30/04 para a prova final'
	else  ' Infelizmente voc� dever� refazer a disciplina no pr�ximo semestre'
end as mensagem

from notas

--12) Listar toda a tabela de vendas

select * from vendas

--13) qual o valor total de vendas?

select sum(vl_venda) from vendas

--14) qual o valor das vendas do vendedor 1?

select sum(vl_venda) from vendas
where cd_vendedor = 1

--15) qual a venda com valor m�nimo?

select * from vendas
where vl_venda = (select min(vl_venda) from vendas)

--16) qual a venda com valor m�ximo?select * from vendaswhere vl_venda = (select max(vl_venda) from vendas)--17) qual a m�dia de vendas?select avg(vl_venda) as Media_Vendas from vendas--18) quantas vendas foram feitas?select count(vl_venda) as Numero_de_vendas from vendas--19) quantas vendas o vendedor 1 fez?select count(*) as Quantidade_Vendas from vendaswhere cd_vendedor = 1--20) qual o valor m�dio de vendas do vendedor 1?select avg(vl_venda) from vendaswhere cd_vendedor = 1--21) monte uma consulta que retorne o vendedor e a soma total de suas vendasselect cd_vendedor, sum(vl_venda) from vendasgroup by cd_vendedor--22) monte uma consulta que em cada linha retorne o c�digo do vendedor,
--a soma de suas vendas, quantas vendas ele fez, a m�dia de suas vendas, sua menor
--venda e sua venda m�xima

select cd_vendedor, 
		sum(vl_venda) as Soma_Vendas, 
		count(vl_venda) as Numero_Vendas, 
		avg(vl_venda) as Media_vendas, 
		min(vl_venda) as Menor_Venda, 
		max(vl_venda) as Maior_venda from vendas
group by cd_vendedor

--23) Quantos vendedores distintos temos nessa tabela?

select count(distinct cd_vendedor) as Quantidade_de_Vendedores from vendas

select * from vendas