-- 查询每个部门入职最早的 2 名员工
WITH ranked_emp AS (SELECT d.dept_name,
                           e.emp_name,
                           e.hire_date,
                           ROW_NUMBER() OVER (PARTITION BY d.dept_id ORDER BY e.hire_date) AS 'rn'
                    FROM employee e
                             JOIN department d ON e.dept_id = d.dept_id)
SELECT dept_name AS '部门名称', emp_name AS '姓名', hire_date AS '入职日期', rn AS '入职顺序'
FROM ranked_emp
WHERE rn <= 2;