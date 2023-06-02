SELECT 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) as 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) as 'total_unit',
	SUM(ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) as 'sales rep'
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items as ite
ON ord.order_id = ite.order_id
JOIN production.products as pro
ON ite.product_id = pro.product_id
JOIN production.categories as cat
ON pro.category_id = cat.category_id
JOIN sales.stores as sto
ON ord.store_id = sto.store_id
JOIN sales.staffs as sta
ON ord.store_id = sta.store_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name)