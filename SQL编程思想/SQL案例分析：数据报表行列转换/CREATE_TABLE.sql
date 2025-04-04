-- 按科目存储（行存储）
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE IF NOT EXISTS `t_score`
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50) NOT NULL,
    subject VARCHAR(10) NOT NULL,
    score   DECIMAL(4, 1) DEFAULT 0
);

-- 按学生存储（列存储）
DROP TABLE IF EXISTS `t_score1`;
CREATE TABLE IF NOT EXISTS `t_score1`
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    cn_score   DECIMAL(4, 1) DEFAULT 0 COMMENT '语文成绩',
    math_score DECIMAL(4, 1) DEFAULT 0 COMMENT '数学成绩',
    en_score   DECIMAL(4, 1) DEFAULT 0 COMMENT '英语成绩'
);