SELECT name                                AS '姓名',
       SUM(IF(subject = '语文', score, 0)) AS '语文',
       SUM(IF(subject = '数学', score, 0)) AS '数学',
       SUM(IF(subject = '英语', score, 0)) AS '英语'
FROM t_score
GROUP BY name;