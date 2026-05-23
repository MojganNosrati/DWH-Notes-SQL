select ROW_NUMBER () over (order by (select null)) as Gegraphykey,* into DIMgeography from (

select null as country,state, city from authors
union
select null as country,state, city from stores
union
select  country,state, city from publishers
) as x