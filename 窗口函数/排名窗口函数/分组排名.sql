-- 按入职时间排序，将员工分为 5 组, 计算每个员工所在分组
SELECT emp_name AS '姓名', hire_date AS '入职日期', NTILE(5) OVER (ORDER BY hire_date) AS '分组位置'
FROM employee;
