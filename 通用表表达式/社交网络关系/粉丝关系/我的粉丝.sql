SELECT u.user_name AS '我的粉丝'
FROM t_follower r
         INNER JOIN t_user u ON r.follower_id = u.user_id
WHERE r.user_id = 1;