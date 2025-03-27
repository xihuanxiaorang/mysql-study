-- 用户表t_user
CREATE TABLE t_user
(
    user_id   INTEGER PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

-- 好友关系表t_friend
CREATE TABLE t_friend
(
    user_id   INTEGER NOT NULL,
    friend_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, friend_id)
);

-- 粉丝表t_follower
CREATE TABLE t_follower
(
    user_id     INTEGER NOT NULL,
    follower_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, follower_id)
);

-- 关注表t_followed
CREATE TABLE t_followed
(
    user_id     INTEGER NOT NULL,
    followed_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, followed_id)
);
