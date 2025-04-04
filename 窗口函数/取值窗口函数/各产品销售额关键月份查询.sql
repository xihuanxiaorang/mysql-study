-- 统计不同产品的最高、最低及第三高销售额所在的月份
SELECT product                 AS '产品',
       ym                      AS '年月',
       amount                  AS '销售额',
       FIRST_VALUE(ym) OVER w  AS '最高销售额月份',
       LAST_VALUE(ym) OVER w   AS '最低销售额月份',
       NTH_VALUE(ym, 3) OVER w AS '第三高销售额月份'
FROM sales_monthly
WINDOW w AS ( PARTITION BY product ORDER BY amount DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING )
ORDER BY product, ym;