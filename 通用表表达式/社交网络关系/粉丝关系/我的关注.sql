SELECT u.user_name AS "我的关注"
FROM t_followed f
         INNER JOIN t_user u ON f.followed_id = u.user_id
WHERE f.user_id = 1;