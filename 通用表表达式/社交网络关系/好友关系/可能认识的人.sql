WITH friend(fid) AS (SELECT friend_id
                     FROM t_friend
                     WHERE user_id = 2),
     fof AS (SELECT f.friend_id
             FROM friend
                      INNER JOIN t_friend f ON friend.fid = f.user_id AND f.friend_id != 2)
SELECT u.user_id '好友编号', u.user_name '好友姓名', COUNT(*) AS '共同好友数量'
FROM fof
         INNER JOIN t_user u ON fof.friend_id = u.user_id
WHERE fof.friend_id NOT IN (SELECT fid FROM friend)
GROUP BY u.user_id, u.user_name;