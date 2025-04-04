-- 计算各产品的月度环比增长率
SELECT product AS '产品',
       ym      AS '年月',
       amount  AS '销售额',
       (amount - LAG(amount, 1) OVER (PARTITION BY product ORDER BY ym)) /
       LAG(amount, 1) OVER (PARTITION BY product ORDER BY ym) *
       100     AS '环比增长率(%)'
FROM sales_monthly
ORDER BY product, ym;