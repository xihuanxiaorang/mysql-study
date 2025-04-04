-- 按月薪排序，计算所有员工的累计分布情况
SELECT emp_name '姓名', salary '月薪', CUME_DIST() OVER (ORDER BY salary) '累计占比'
FROM employee;