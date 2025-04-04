WITH t AS (SELECT log_ts,
                  from_user,
                  SUM(amount)
                      OVER (PARTITION BY from_user ORDER BY log_ts RANGE BETWEEN INTERVAL '5' DAY PRECEDING AND CURRENT ROW) AS total_amount
           FROM transfer_log
           WHERE type = '转账')
SELECT *
FROM t
WHERE total_amount > 1000000;