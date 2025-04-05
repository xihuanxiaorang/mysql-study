WITH t1 AS (SELECT player_id, MIN(event_date) AS 'install_dt'
            FROM activity
            GROUP BY player_id),
     t2 AS (SELECT t1.install_dt, t1.player_id AS 'id1', a.player_id AS 'id2'
            FROM t1
                     LEFT JOIN activity a ON a.player_id = t1.player_id AND
                                             a.event_date =
                                             DATE_ADD(t1.install_dt, INTERVAL 1 DAY))
SELECT install_dt,
       COUNT(DISTINCT id1)                                 AS 'installs',
       ROUND(COUNT(DISTINCT id2) / COUNT(DISTINCT id1), 2) AS 'Day1_retention'
FROM t2
GROUP BY install_dt;