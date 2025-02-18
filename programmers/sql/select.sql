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

select * from (
    select
        date_format(sales_date, '%Y-%m-%d') as sales_date
        , product_id
        , user_id
        , sales_amount
    from online_sale
    where date_format(sales_date, '%Y-%m') = date_format(now(), '2022-03')
    union 
    select 
        date_format(sales_date, '%Y-%m-%d') as sales_date
        , product_id
        , NULL as user_id
        , sales_amount
    from offline_sale
    where date_format(sales_date, '%Y-%m') = date_format(now(), '2022-03')
    ) u
order by sales_date asc, product_id asc, user_id asc;

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

SELECT *
from animal_ins
order by animal_id

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

# 6
select
    member_id
    , member_name
    , gender
    , date_format(date_of_birth, '%Y-%m-%d') date_of_birth
from member_profile
where tlno is not null
and date_format(date_of_birth, '%m') = date_format(now(), '03')
and gender = 'W'
order by member_id asc

# 7
select
    user_id
    ,product_id
from online_sale
group by user_id, product_id
having count(*) >= 2
order by user_id asc, product_id desc

# 8
SELECT
    i.REST_ID
    , i.REST_NAME
    , i.FOOD_TYPE
    , i.FAVORITES
    , i.ADDRESS
    , round(avg(r.review_score), 2) as SCORE
from rest_review r join rest_info i on r.rest_id = i.rest_id
where i.address like '서울%'
group by rest_id
order by SCORE desc, favorites desc

# 9
SELECT
    dr_name
    , dr_id
    , mcdp_cd
    , date_format(hire_ymd, '%Y-%m-%d') hire_ymd
from doctor
where mcdp_cd in ('CS', 'GS')
order by hire_ymd desc, dr_name asc

SELECT
    pt_name
    , pt_no
    , gend_cd
    , age
    , COALESCE(tlno, 'NONE') tlno
from patient
where age < 13 and gend_cd = 'W'
order by age desc, pt_name asc

# 10
SELECT f.flavor
from first_half f join icecream_info i on f.flavor = i.flavor
where
i.ingredient_type = 'fruit_based'
and f.total_order >= 3000
order by f.total_order desc

SELECT flavor
from first_half
order by total_order desc, shipment_id asc

# 11
SELECT factory_id, factory_name, address
from food_factory
where address like '강원%'
order by factory_id asc

# 12
SELECT
    book_id
    , date_format(published_date, '%Y-%m-%d') published_date
from book
where 1=1
and date_format(published_date, '%Y') = '2021'
and category = '인문'
order by published_date asc

# 13
select
    id
    , email
    , first_name
    , last_name
from developer_infos
where 'Python' in (skill_1, skill_2, skill_3)
order by id asc;

    
# group by
select
        b.book_id
        , b.author_id
        , b.category
        , s.total_sales * b.price as total_sales
    from (
        select
            book_id
            , sum(sales) as total_sales
        from book_sales
        group by book_id
    ) s join book b on s.book_id = b.book_id
    order by b.author_id asc, b.category desc
) p join author a on p.author_id = a.author_id

SELECT
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY,
    SUM(b.PRICE * s.SALES) AS TOTAL_SALES
FROM
    BOOK_SALES s
    INNER JOIN BOOK b ON s.BOOK_ID = b.BOOK_ID
    INNER JOIN AUTHOR a ON b.AUTHOR_ID = a.AUTHOR_ID
WHERE
    s.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY
    a.AUTHOR_ID,
    b.CATEGORY
ORDER BY
    a.AUTHOR_ID ASC,
    b.CATEGORY  DESC;
