-- Запрос с использованием IN
select name
from pizzeria
where id not in (
    select pizzeria_id
    from person_visits
);

-- Запрос с использованием EXISTS
select name
from pizzeria pz
where not exists (
    select 1
    from person_visits pv
    where pv.pizzeria_id = pz.id
);
