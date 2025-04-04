-- 计算每种产品在最近 3 个月的平均销售额
SELECT product                                                                                      AS '产品',
       ym                                                                                           AS '年月',
       amount                                                                                       AS '销售额',
       AVG(amount) OVER (PARTITION BY product ORDER BY ym ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS '最近3个月的平均销售额'
FROM sales_monthly;