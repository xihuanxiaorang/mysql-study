WITH df(user1, user2) AS (SELECT r.user_id, r.follower_id
                          FROM t_followed d
                                   INNER JOIN t_follower r
                                              ON d.user_id = r.user_id AND d.followed_id = r.follower_id AND
                                                 r.user_id < r.follower_id)
SELECT u1.user_name AS '用户一', u2.user_name AS '用户二'
FROM df
         INNER JOIN t_user u1 ON df.user1 = u1.user_id
         INNER JOIN t_user u2 ON df.user2 = u2.user_id;