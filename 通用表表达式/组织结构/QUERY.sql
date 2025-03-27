WITH RECURSIVE employee_path AS (SELECT emp_id, emp_name, emp_name AS 'path'
                                 FROM employee
                                 WHERE manager IS NULL
                                 UNION ALL
                                 SELECT e.emp_id, e.emp_name, CONCAT(ep.path, '->', e.emp_name)
                                 FROM employee e
                                          JOIN employee_path ep
                                               ON e.manager = ep.emp_id)
SELECT emp_id, emp_name, path
FROM employee_path
ORDER BY emp_id;

-- 限制查询层级，仅查询比 "刘备" 低两级的员工（即不包括 "法正" 的下级）
WITH RECURSIVE employee_path AS (SELECT emp_id, emp_name, emp_name AS 'path', 0 AS 'depth'
                                 FROM employee
                                 WHERE manager IS NULL
                                 UNION ALL
                                 SELECT e.emp_id, e.emp_name, CONCAT(ep.path, '->', e.emp_name), ep.depth + 1
                                 FROM employee e
                                          JOIN employee_path ep
                                               ON e.manager = ep.emp_id
                                 WHERE ep.depth < 2)
SELECT emp_id, emp_name, path
FROM employee_path
ORDER BY emp_id;