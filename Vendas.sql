use BD16Abril

go

create table vendas
( cd_vendedor int not null,
  data smalldatetime,
  vl_venda money )
go  
set dateformat ymd
go

insert into vendas values (1,'2024-10-01',200.00)
insert into vendas values (2,'2024-10-01', 20.00)
insert into vendas values (5,'2024-10-02', 10.00)
insert into vendas values (6,'2024-10-03',  5.00)
insert into vendas values (1,'2024-10-05',  7.00)
insert into vendas values (4,'2024-10-07',  9.00)
insert into vendas values (5,'2024-10-10', 15.00)
insert into vendas values (2,'2024-10-12', 40.00)
insert into vendas values (3,'2024-10-13', 35.00)
insert into vendas values (1,'2024-10-14', 25.00)
insert into vendas values (5,'2024-10-15', 10.00)
insert into vendas values (6,'2024-10-16',  5.00)
insert into vendas values (2,'2024-10-17',250.00)
insert into vendas values (2,'2024-10-18', 25.00)

