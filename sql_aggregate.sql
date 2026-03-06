-- count aggreate 
SELECT COUNT(*) FROM employees;
+----------+
| COUNT(*) |
+----------+
|        9 |
+----------+

 SELECT *, 
     (SELECT COUNT(*) FROM employees) AS total_employees
     FROM employees;
+--------+---------+---------+------------+---------+--------+-----------------+
| emp_id | fname   | lname   | desig      | dept    | salary | total_employees |
+--------+---------+---------+------------+---------+--------+-----------------+
|    101 | Raju    | Rastogi | Manager    | Loan    |  37000 |               9 |
|    102 | Sham    | Mohan   | Cashier    | Cash    |  25000 |               9 |
|    103 | Baburao | Apte    | Associate  | Loan    |  35000 |               9 |
|    104 | Paul    | Philip  | Accountant | Account |  48000 |               9 |
|    105 | Alex    | Watt    | Associate  | Deposit |  50000 |               9 |
|    106 | Rick    | Watt    | Manager    | Account |  75000 |               9 |
|    107 | Leena   | Johnson | Lead       | Cash    |  20000 |               9 |
|    108 | John    | Paul    | Manager    | IT      |  27500 |               9 |
|    109 | Alex    | Watt    | Probation  | Loan    |  40000 |               9 |
+--------+---------+---------+------------+---------+--------+-----------------+

 SELECT dept, COUNT(*) AS total
     FROM employees
    GROUP BY dept;
+---------+-------+
| dept    | total |
+---------+-------+
| Loan    |     3 |
| Cash    |     2 |
| Account |     2 |
| Deposit |     1 |
| IT      |     1 |
+---------+-------+

-- group by agrreate

select dept from employees group by dept;
+---------+
| dept    |
+---------+
| Loan    |
| Cash    |
| Account |
| Deposit |
| IT      |
+---------+

-- max and  min aggreate
 select max(salary) from  employees;
+-------------+
| max(salary) |
+-------------+
|       75000 |
+-------------+

SELECT fname, salary
     FROM employees
     WHERE salary = (
         SELECT MAX(salary) FROM employees
     );
+-------+--------+
| fname | salary |
+-------+--------+
| Rick  |  75000 |
+-------+--------+

-- use sum and avg

select sum(salary) from employees;
+-------------+
| sum(salary) |
+-------------+
|      357500 |

 select  AVG(salary) from employees;
+-------------+
| AVG(salary) |
+-------------+
|  39722.2222 |
+-------------+

 select dept, max(salary) from  employees group by dept;
+---------+-------------+
| dept    | max(salary) |
+---------+-------------+
| Loan    |       40000 |
| Cash    |       25000 |
| Account |       75000 |
| Deposit |       50000 |
| IT      |       27500 |
+---------+-------------+

select dept,count(emp_id) ,sum(salary) from  employees group by dept;
+---------+---------------+-------------+
| dept    | count(emp_id) | sum(salary) |
+---------+---------------+-------------+
| Loan    |             3 |      112000 |
| Cash    |             2 |       45000 |
| Account |             2 |      123000 |
| Deposit |             1 |       50000 |
| IT      |             1 |       27500 |
+---------+---------------+-------------+
