#How many products does Magist have
 select count(DISTINCT(product_category_name)) AS proudctsname from products;
 
 #How many products sold
SELECT
    count(p.product_id)
FROM
    products p
        LEFT JOIN
    order_items o ON p.product_id = o.product_id
WHERE
    product_category_name IN
(
        'computadores_acessorios',
        'pc_gamer',
        'computadores',
        'tablets_impressao_imagem',
        'telefonia',
        'telefonia_fixa'
    ); 
 
#What are the costs of expensive products and the cheap products 
select distinct t.product_category_name_english 
    from product_category_name_translation t
    JOIN products p ON p.product_category_name = t.product_category_name;
SELECT 
    MIN(price) AS cheapest, 
    MAX(price) AS most_expensive
FROM 
	order_items ;

#Are tech products popular
SELECT COUNT(oi.product_id), SUM(oi.price),
    CASE 
        WHEN price > 500 THEN "HighTech"
        WHEN price < 500 THEN "Others"
        ELSE "Cheap"
    END AS "price_range"
FROM order_items oi
LEFT JOIN products p
    ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation pt
    USING (product_category_name)
WHERE pt.product_category_name_english IN ("watches_gifts", "computers", "pc_gamer", "console_games", "telephony")
GROUP BY price_range
ORDER BY 1 DESC;


#How many products of tech categories are sold.
select count(p.product_id)
        FROM order_items o 
        INNER JOIN products p ON  o.product_id = p.product_id 
        WHERE product_category_name IN(
        'computadores_acessorios',
        'pc_gamer',
        'computadores',
        'tablets_impressao_imagem',
        'telefonia',
        'telefonia_fixa',
        'pcs','audio'
    ) ;
 
 #Avg Price of products being sold
    select AVG(price)
        FROM order_items o 
        INNER JOIN products p ON  o.product_id = p.product_id ;