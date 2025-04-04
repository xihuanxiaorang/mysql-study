-- 计算自 2018 年 1 月以来不同产品的月均复合增长率
WITH s(product, ym, amount, first_amount, num) AS (SELECT product,
                                                          ym,
                                                          amount,
                                                          FIRST_VALUE(amount) OVER (PARTITION BY product ORDER BY ym),
                                                          ROW_NUMBER() OVER (PARTITION BY product ORDER BY ym)
                                                   FROM sales_monthly)
SELECT product AS                                                               '产品',
       ym      AS                                                               '年月',
       amount  AS                                                               '销售额',
       (POWER(1.0 * amount / first_amount, 1.0 / NULLIF(num - 1, 0)) - 1) * 100 '月均复合销售率（%）'
FROM s;