-- 创建地铁线路表
CREATE TABLE bj_subway
(
    station_id   INT         NOT NULL PRIMARY KEY,
    line_name    VARCHAR(20) NOT NULL,
    station_name VARCHAR(50) NOT NULL,
    next_station VARCHAR(50) NOT NULL,
    direction    VARCHAR(50) NOT NULL
);
