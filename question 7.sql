SELECT p.pro_id, p.pro_name from product as p
inner join(

select sp.pro_id, sp.pricing_id from supplier_pricing as sp
inner join(
select pricing_id from `order` where `ord date` > "2021-10-05"
)
as o
on sp.pricing_id = o.pricing_id
)

as sp_o
on p.pro_id = sp_o.pro_id;

select product.pro_id, product.pro_name from `order`
inner join supplier_pricing
on supplier_pricing.pricing_id = `order`.pricing_id
inner join product
on product.pro_id = supplier_pricing.pro_id
where `order`.ord_date> "2021-10-05"