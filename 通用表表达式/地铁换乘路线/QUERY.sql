WITH RECURSIVE transfer(start_station, stop_station, stops, paths) AS (SELECT station_name,
                                                                              next_station,
                                                                              1,
                                                                              CAST(CONCAT(line_name, station_name, '->', line_name, next_station) AS CHAR(1000))
                                                                       FROM bj_subway
                                                                       WHERE station_name = '王府井'
                                                                       UNION ALL
                                                                       SELECT t.start_station,
                                                                              s.next_station,
                                                                              t.stops + 1,
                                                                              CONCAT(t.paths, '->', s.line_name, s.next_station)
                                                                       FROM transfer t
                                                                                INNER JOIN bj_subway s
                                                                                           ON t.stop_station =
                                                                                              s.station_name
                                                                                               AND
                                                                                              INSTR(t.paths, s.next_station) =
                                                                                              0)
SELECT *
FROM transfer
WHERE stop_station = '积水潭';


WITH RECURSIVE transfer (start_station, stop_station, stops, paths) AS (SELECT station_name,
                                                                               next_station,
                                                                               1,
                                                                               CAST(
                                                                                       CONCAT(line_name, station_name, '->', line_name, next_station) AS CHAR(1000))
                                                                        FROM bj_subway
                                                                        WHERE station_name = '王府井'
                                                                        UNION ALL
                                                                        SELECT t.start_station,
                                                                               s.next_station,
                                                                               stops + 1,
                                                                               CONCAT(t.paths, '->', s.line_name, s.next_station)
                                                                        FROM transfer t
                                                                                 JOIN bj_subway s
                                                                                      ON t.stop_station = s.station_name
                                                                                          AND
                                                                                         INSTR(t.paths, s.next_station) =
                                                                                         0)
SELECT *
FROM transfer
WHERE stop_station = '积水潭';