create table vendedor(
   vendedor_id int primary key,
   vendedor_nome char(50)
);

create table venda(
   venda_id int primary key,
   vendedor_id int,
   venda_data date,
   venda_valor float
);

insert into vendedor(vendedor_id,vendedor_nome) values (1, 'teste1');

insert into vendedor(vendedor_id,vendedor_nome) values (2, 'teste2');

insert into vendedor(vendedor_id,vendedor_nome) values (3, 'teste3');

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (1,1,'20160201',1000);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (2,1,'20160101',100);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (3,1,'20050101',1000);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (4,2,'20160201',200);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (5,2,'20160101',2000);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (6,2,'20050101',3000);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (7,3,'20040101',3000);

insert into venda(venda_id, vendedor_id, venda_data, venda_valor) values (8,3,'20030101',30000);

select vd1.vendedor_id,
       vd1.vendedor_nome,
       vd2.venda_id,
       vd2.venda_data,
       vd2.venda_valor
from (
   select  vd3.vendedor_id,
           (select top(1) vd4.venda_id
              from venda vd4
             where vd4.vendedor_id = vd3.vendedor_id
               and year(vd4.venda_data)=2016
             order by vd4.venda_valor desc) venda_id
     from vendedor vd3
) vd
join vendedor vd1 on vd.vendedor_id = vd1.vendedor_id
join venda vd2    on vd.venda_id = vd2.venda_id
                 and vd.vendedor_id=vd2.vendedor_id
