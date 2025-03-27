WITH RECURSIVE relation(uid, fid, hops, path) AS (SELECT user_id, friend_id, 0, CONCAT(user_id, '->', friend_id)
                                                  FROM t_friend
                                                  WHERE user_id = 6
                                                  UNION ALL
                                                  SELECT r.uid,
                                                         f.friend_id,
                                                         r.hops + 1,
                                                         CONCAT(r.path, '->', f.friend_id)
                                                  FROM relation r
                                                           INNER JOIN t_friend f ON r.fid = f.user_id
                                                  WHERE INSTR(r.path, f.friend_id) = 0
                                                    AND r.hops < 6)
SELECT *
FROM relation
WHERE fid = 7;