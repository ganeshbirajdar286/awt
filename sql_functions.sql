-- SUBSTRING Function
SELECT acc_no,
     CONCAT_WS("-", name, acc_type) AS customer_info,
     SUBSTRING(name,1,3) AS short_name
     FROM customer5;
+--------+---------------+------------+
| acc_no | customer_info | short_name |
+--------+---------------+------------+
|      1 | Ganesh-saving | Gan        |
|      2 | Veer-saving   | Vee        |
|      3 | Akash-saving  | Aka        |
+--------+---------------+------------+


--SUBSTRING_INDEX Function
SELECT acc_no, CONCAT_WS("-", name, acc_type) AS customer_info,SUBSTRING_INDEX(name, "-", 1) AS short_name FROM customer5; //It returns text before _.
+--------+---------------+------------+
| acc_no | customer_info | short_name |
+--------+---------------+------------+
|      1 | Ganesh-saving | Ganesh     |
|      2 | Veer-saving   | Veer       |
|      3 | Akash-saving  | Akash      |
+--------+---------------+------------+

-- REPLACE Function
select * from customer4;
+--------+------+----------+
| acc_no | name | acc_type |
+--------+------+----------+
|   1001 | Raju | saving   |
|   1002 | Sham | saving   |
+--------+------+----------+

select acc_no,replace(acc_type,"saving","saved") as account  from customer4 where account;
+--------+---------+
| acc_no | account |
+--------+---------+
|   1001 | saved   |
+--------+---------+


--REVERSE Function
select * , reverse(acc_type) from customer4;
+--------+------+----------+-------------------+
| acc_no | name | acc_type | reverse(acc_type) |
+--------+------+----------+-------------------+
|   1001 | Raju | saving   | gnivas            |
|   1002 | Sham | saving   | gnivas            |
+--------+------+----------+-------------------+

--UPPER and LOWER Functions

 SELECT *, 
    UPPER(name) AS upper_case, 
    LOWER(name) AS lower_case
    FROM customer4;
+--------+------+----------+------------+------------+
| acc_no | name | acc_type | upper_case | lower_case |
+--------+------+----------+------------+------------+
|   1001 | Raju | saving   | RAJU       | raju       |
|   1002 | Sham | saving   | SHAM       | sham       |
+--------+------+----------+------------+------------+
--this is another way 
SELECT *,
    UCASE(name) AS upper_case, 
    LCASE(name) AS lower_case 
    FROM customer4;
+--------+------+----------+------------+------------+
| acc_no | name | acc_type | upper_case | lower_case |
+--------+------+----------+------------+------------+
|   1001 | Raju | saving   | RAJU       | raju       |
|   1002 | Sham | saving   | SHAM       | sham       |
+--------+------+----------+------------+------------+

--CHAR_LENGTH Function
SELECT *, char_length(acc_type) as length FROM customer4;
+--------+------+----------+--------+
| acc_no | name | acc_type | length |
+--------+------+----------+--------+
|   1001 | Raju | saving   |      6 |
|   1002 | Sham | saving   |      6 |
+--------+------+----------+--------+

-- INSERT Function (String Insert)

SELECT INSERT("HelloWorld",6,0," ") as word;
+-------------+
| word        |
+-------------+
| Hello World |
+-------------+

INSERT(original_string, position, length, new_string)

Parameter	        Meaning
original_string  	main string
position	        starting position
length	            number of characters to replace
new_string	        string to insert


--LEFT Function
select left("hey buddy",3);
+---------------------+
| left("hey buddy",3) |
+---------------------+
| hey                 |
+---------------------+

--RIGHT Function
select right("hey buddy",5);
+----------------------+
| right("hey buddy",5) |
+----------------------+
| buddy                |
+----------------------+

--REPEAT Function
select repeat("haha ",5);
+---------------------------+
| repeat("haha ",5)         |
+---------------------------+
| haha haha haha haha haha  |
+---------------------------+

--TRIM Function
select trim("  Ganesh   ");
+---------------------+
| trim("  Ganesh   ") |
+---------------------+
| Ganesh              |
+---------------------+

