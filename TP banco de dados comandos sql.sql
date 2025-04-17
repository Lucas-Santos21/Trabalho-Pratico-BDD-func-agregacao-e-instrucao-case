create database BD16Abril
go
use BD16Abril

select * from notas

update notas set ds_situacao =
	CASE
		when vl_media >= 6 then 'Aprovado'
		when vl_media < 3 then 'Reprovado'
		else 'Exame'
	end

update notas set vl_media =
	CASE
		when vl_media - floor(vl_media) <= 0.25 then floor(vl_media)
		when vl_media - floor(vl_media) >= 0.75 then floor(vl_media) + 1
		else floor(vl_media) + 0.5
	end

select 
	COUNT (nm_aluno)
	min (vl_media)
	max (vl_media)
from notas