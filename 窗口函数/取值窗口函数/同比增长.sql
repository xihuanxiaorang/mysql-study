-- 计算各产品的月度同比增长率
SELECT product AS '产品',
       ym      AS '年月',
       amount  AS '销售额',
       (amount - LAG(amount, 12) OVER (PARTITION BY product ORDER BY ym)) /
       LAG(amount, 12) OVER (PARTITION BY product ORDER BY ym) *
       100     AS '同比增长率(%)'
FROM sales_monthly
ORDER BY product, ym;