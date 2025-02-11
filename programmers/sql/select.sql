# 1
SELECT
    ROUND(AVG(DAILY_FEE)) as AVERAGE_FEE
from CAR_RENTAL_COMPANY_CAR
group by car_type
having car_type = 'SUV'

# 2
select
    user_id
    ,product_id
from online_sale
group by user_id, product_id
having count(*) >= 2
order by user_id asc, product_id desc

# 3 animal
SELECT NAME, DATETIME
from ANIMAL_INS
order by ANIMAL_ID DESC

SELECT ANIMAL_ID, NAME
from ANIMAL_INS
where INTAKE_CONDITION = 'SICK'
order by ANIMAL_ID

SELECT animal_id, name
from animal_ins
where intake_condition != 'Aged'
order by animal_id

SELECT animal_id, name
from animal_ins
order by animal_id

SELECT
    animal_id
    , name
    , datetime
from animal_ins
where 1=1
order by name asc, datetime desc

SELECT name
from animal_ins
order by datetime asc
limit 0,1

# 4
SELECT count(*) as USERS
from user_info
where
date_format(joined, '%Y') = date_format(now(), '2021')
and age between 20 and 29

# 5
WITH RECURSIVE cte
as (
    SELECT
        ID
        , PARENT_ID
        , 1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    
    UNION
    
    SELECT
        e.ID
        , e.PARENT_ID
        , GENERATION + 1
    FROM ECOLI_DATA e
    JOIN cte c on e.PARENT_ID = c.ID

)   SELECT
        COUNT(*) AS COUNT 
        , GENERATION
    FROM cte
    WHERE ID NOT IN (
        SELECT
            DISTINCT PARENT_ID
            FROM ECOLI_DATA
            WHERE PARENT_ID IS NOT NULL # ***
    )
    GROUP BY GENERATION
