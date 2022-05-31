------------------------------------ER DIAGRAM-------------------------------------------
mysql> create table Employee(id int primary key,name varchar(50),salary int,Start_date DATE,Company_Id int);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into Employee values(1,'Saurabh',25000,'2022-05-26',2);
Query OK, 1 row affected (0.02 sec)

mysql> insert into Employee values(2,'Adesh',28000,'2022-04-26',1);
Query OK, 1 row affected (0.02 sec)

mysql> insert into Employee values(3,'Sneha',30000,'2022-06-26',3);
Query OK, 1 row affected (0.02 sec)
mysql> select * from Employee;
+----+---------+--------+------------+------------+
| id | name    | salary | Start_date | Company_Id |
+----+---------+--------+------------+------------+
|  1 | Saurabh |  25000 | 2022-05-26 |          2 |
|  2 | Adesh   |  28000 | 2022-04-26 |          1 |
|  3 | Sneha   |  30000 | 2022-06-26 |          3 |
+----+---------+--------+------------+------------+
3 rows in set (0.00 sec)
=============================================================================================
mysql> create table Company(Company_Id int primary key,Company_name varchar(50));
Query OK, 0 rows affected (0.06 sec)

mysql> insert into Company values(1,'Bridgelabz');
Query OK, 1 row affected (0.03 sec)

mysql> insert into Company values(2,'TCS');
Query OK, 1 row affected (0.02 sec)

mysql> insert into Company values(3,'Tech-Mahindra');
Query OK, 1 row affected (0.01 sec)

mysql> select * from Company;
+------------+---------------+
| Company_Id | Company_name  |
+------------+---------------+
|          1 | Bridgelabz    |
|          2 | TCS           |
|          3 | Tech-Mahindra |
+------------+---------------+
3 rows in set (0.01 sec)
==================================================================================
mysql> alter table Employee
    -> add foreign key(Company_Id)
    -> references Company(Company_Id);
Query OK, 3 rows affected (0.15 sec)
Records: 3  Duplicates: 0  Warnings: 0
===================================================================================
mysql> create table Department(Department_Id int primary key,Phone_Number int(10),Address varchar(150),Department varchar(150));
Query OK, 0 rows affected, 1 warning (0.07 sec)

mysql> alter table Employee
    -> add (Department_Id int);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0
===================================================================================
mysql> create table Payroll(Payroll_Id int primary key,Basic_Pay int,Deduction int,Taxable_Pay int,Income_Tax int,Net_Pay int);
Query OK, 0 rows affected (0.07 sec)

mysql> alter table Employee
    -> add foreign key(Payroll_Id)
    -> references Payroll(Payroll_Id);
Query OK, 3 rows affected (0.17 sec)
Records: 3  Duplicates: 0  Warnings: 0
===================================================================================
mysql> desc Employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int         | NO   | PRI | NULL    |       |
| name          | varchar(50) | YES  |     | NULL    |       |
| salary        | int         | YES  |     | NULL    |       |
| Start_date    | date        | YES  |     | NULL    |       |
| Company_Id    | int         | YES  | MUL | NULL    |       |
| Department_Id | int         | YES  | MUL | NULL    |       |
| Payroll_Id    | int         | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+