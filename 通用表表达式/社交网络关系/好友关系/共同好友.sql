WITH f1 AS (SELECT friend_id FROM t_friend WHERE user_id = 3),
     f2 AS (SELECT friend_id FROM t_friend WHERE user_id = 4)
SELECT u.user_id '好友编号', u.user_name '好友姓名'
FROM f1
         INNER JOIN f2 ON f1.friend_id = f2.friend_id
         INNER JOIN t_user u ON u.user_id = f1.friend_id;