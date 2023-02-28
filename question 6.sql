SET sql_mode = (select replace (@@sql_mode,'ONLY_FULL_GROUP_BY','')) ;


select cat.CAT_ID, CAT_NAME, PRO_ID, PRO_NAME, min(MIN_PRICE) 
as MinProductPrice from category as cat
inner join 
 ( 
 select prod.PRO_ID, PRO_NAME, CAT_ID, MIN_PRICE from product as prod 
 inner join
 ( select pro_id as PRO_ID, min(supp_price) as MIN_PRICE from supplier_pricing 
 group by pro_id 
 )  
 as sp 
 on prod.pro_id = sp.pro_id 
 )
 as pro_sp
 on cat.cat_id = pro_sp.CAT_ID 
 group by cat_id 

