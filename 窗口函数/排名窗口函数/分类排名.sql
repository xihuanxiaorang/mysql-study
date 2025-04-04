-- 查询每个员工在其部门内的月薪排名
SELECT d.dept_name                                                         AS '部门名称',
       e.emp_name                                                          AS '姓名',
       e.salary                                                            AS '月薪',
       ROW_NUMBER() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC)   AS 'row_number',
       RANK() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC)         AS 'rank',
       DENSE_RANK() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC)   AS 'dense_rank',
       PERCENT_RANK() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC) AS 'percent_rank'
FROM employee e
         JOIN department d on e.dept_id = d.dept_id;

SELECT d.dept_name           AS '部门名称',
       e.emp_name            AS '姓名',
       e.salary              AS '月薪',
       ROW_NUMBER() OVER w   AS 'row_number',
       RANK() OVER w         AS 'rank',
       DENSE_RANK() OVER w   AS 'dense_rank',
       PERCENT_RANK() OVER w AS 'percent_rank'
FROM employee e
         JOIN department d ON e.dept_id = d.dept_id
WINDOW w AS (PARTITION BY e.dept_id ORDER BY e.salary DESC);