--- check preview and first 10 values
SELECT *
FROM `bigquery-public-data.iowa_liquor_sales.sales`
LIMIT 10

--- check every column that want to use
SELECT DISTINC
city
FROM `bigquery-public-data.iowa_liquor_sales.sales`
GROUP BY city

SELECT DISTINC
category_name
FROM `bigquery-public-data.iowa_liquor_sales.sales`
GROUP BY category_name

--- final query to collect the data to analyze
SELECT
      invoice_and_item_number, 
      date,
      LOWER(city) AS city,
      bottles_sold,
      sale_dollars,
      REPLACE(category, '0',' ') AS category,
      ANY_VALUE(LOWER(category_name)) AS category_name
FROM `bigquery-public-data.iowa_liquor_sales.sales`
GROUP BY
      invoice_and_item_number, date, city,
      bottles_sold, sale_dollars, category,
      category_name
