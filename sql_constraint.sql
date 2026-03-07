-- use for  unique
create table constact (
     name varchar(50),
    phonenumber varchar(10) unique);

     desc constact;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| name        | varchar(50) | YES  |     | NULL    |       |
| phonenumber | varchar(10) | YES  | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

insert into  constact (name,phonenumber)
    values ("ganesh","8828388389"),("akash","8289484019");

select * from constact;
+--------+-------------+
| name   | phonenumber |
+--------+-------------+
| ganesh | 8828388389  |
| akash  | 8289484019  |
+--------+-------------+
insert into  constact (name,phonenumber) values ("ganesh","8289484019");
ERROR 1062 (23000): Duplicate entry '8289484019' for key 'constact.phonenumber'


--  use of constraint 
-- this how to add contraint in table and the type of contraint is  nameconstraint
create table contacts(
     name varchar(50),
     mob varchar(10) unique,
     constraint mob_no_less_than_10digit check (length(mob)>=10)
    );

     desc contacts;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(50) | YES  |     | NULL    |       |
| mob   | varchar(10) | YES  | UNI | NULL    |       |
+-------+-------------+------+-----+---------+-------+

insert into contacts value ("ganesh","277");
ERROR 3819 (HY000): Check constraint 'mob_no_less_than_10digit' is violated.



--use modify  we can't add constraint
alter table constact
    -> modify  phonenumber check (length(phonenumber)>=10);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'check (length(phonenumber)>=10)' at line 2

--is wrong because MODIFY is only used to change the column definition (data type, default, null, etc.), not to add a table constraint like

--use of add constraint we can do  

ALTER TABLE constact 
  ADD CONSTRAINT chk_phone
  CHECK (LENGTH(phonenumber) >= 10);

desc constact;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| name        | varchar(50) | YES  |     | NULL    |       |
| phonenumber | varchar(10) | YES  | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

 insert into constact(phonenumber)
    -> values ("123");
ERROR 3819 (HY000): Check constraint 'chk_phone' is violated.

--it check   number legth  should be 10  only


--use alter for drop column

select *  from employee;
+--------+----------+------------+
| name   | acc_type | contact    |
+--------+----------+------------+
| ganesh | saving   | 9876543210 |
| akash  | pending  | 8765432109 |
| veer   | savings  | 7654321098 |
+--------+----------+------------+

alter table employee
    drop column acc_type;

    select *  from employee;
+--------+------------+
| name   | contact    |
+--------+------------+
| ganesh | 9876543210 |
| akash  | 8765432109 |
| veer   | 7654321098 |
+--------+------------+

-- use alter for rename filed

desc employees;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| emp_id | int         | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(50) | NO   |     | NULL    |                |
| lname  | varchar(50) | NO   |     | NULL    |                |
| desig  | varchar(50) | NO   |     | NULL    |                |
| dept   | varchar(50) | NO   |     | NULL    |                |
| salary | int         | NO   |     | 25000   |                |
+--------+-------------+------+-----+---------+----------------+

 alter table employees rename column emp_id to id;

+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int         | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(50) | NO   |     | NULL    |                |
| lname  | varchar(50) | NO   |     | NULL    |                |
| desig  | varchar(50) | NO   |     | NULL    |                |
| dept   | varchar(50) | NO   |     | NULL    |                |
| salary | int         | NO   |     | 25000   |                |
+--------+-------------+------+-----+---------+----------------+

--  use alter for rename a table

alter table employees  rename to employee;

desc employee;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int         | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(50) | NO   |     | NULL    |                |
| lname  | varchar(50) | NO   |     | NULL    |                |
| desig  | varchar(50) | NO   |     | NULL    |                |
| dept   | varchar(50) | NO   |     | NULL    |                |
| salary | int         | NO   |     | 25000   |                |
+--------+-------------+------+-----+---------+----------------+