select po.order_date,
        concat(p.name, ' (age:', p.age, ')') as person_information
from (select person_id as id, order_date from person_order) as po
natural join (select id, name, age from person) as p
order by po.order_date, person_information;