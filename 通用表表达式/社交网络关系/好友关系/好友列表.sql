SELECT u.user_id '好友编号', u.user_name '好友姓名'
FROM t_user u
         INNER JOIN t_friend f ON u.user_id = f.friend_id
WHERE f.user_id = 5;