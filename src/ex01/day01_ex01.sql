select object_name
from (
    select name as object_name, 1 as source_order
    from person
    union all
    select pizza_name as object_name, 2 as source_order
    from menu
) combined
order by source_order, object_name;