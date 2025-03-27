WITH cf(user1, user2, followed) AS (SELECT d.user_id, r.follower_id, d.followed_id
                                    FROM t_followed d
                                             INNER JOIN t_follower r ON d.followed_id = r.user_id AND d.user_id != r.follower_id
                                    WHERE d.user_id = 1)
SELECT u1.user_name AS '用户一', u2.user_name AS '用户二', u3.user_name AS '共同关注'
FROM cf
         INNER JOIN t_user u1 ON cf.user1 = u1.user_id
         INNER JOIN t_user u2 ON cf.user2 = u2.user_id
         INNER JOIN t_user u3 ON cf.followed = u3.user_id;