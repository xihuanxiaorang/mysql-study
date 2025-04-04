SELECT name, '语文' AS 'subject', cn_score AS 'score'
FROM t_score1
UNION ALL
SELECT name, '数学', math_score
FROM t_score1
UNION ALL
SELECT name, '英语', en_score
FROM t_score1
ORDER BY name;