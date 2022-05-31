mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Address_Book_DB    |
| DEmo               |
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database Payroll_Service;
Query OK, 1 row affected (0.01 sec)

mysql> use Payroll_Service;
Database changed
mysql> create table Employee(id int primary key,name varchar(50),salary int,Start_date DATE,Company_Id int);
Query OK, 0 rows affected (0.05 sec)

mysql> insert into Employee values(3,'Sneha',30000,'2022-06-26',3);
Query OK, 1 row affected (0.03 sec)

mysql> insert into Employee values(2,'Amit',28000,'2022-04-26',1);
Query OK, 1 row affected (0.02 sec)

mysql> insert into Employee values(2,'Sanjana',28000,'2022-04-26',2)
    -> ;
ERROR 1062 (23000): Duplicate entry '2' for key 'Employee.PRIMARY'
mysql> insert into Employee values(1,'Sanjana',28000,'2022-04-26',2);
Query OK, 1 row affected (0.00 sec)

mysql> select * from Employee;
+----+---------+--------+------------+------------+
| id | name    | salary | Start_date | Company_Id |
+----+---------+--------+------------+------------+
|  1 | Sanjana |  28000 | 2022-04-26 |          2 |
|  2 | Amit    |  28000 | 2022-04-26 |          1 |
|  3 | Sneha   |  30000 | 2022-06-26 |          3 |
+----+---------+--------+------------+------------+
3 rows in set (0.00 sec)

mysql> create table Company(Company_Id int primary key,Company_name varchar(50));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into Company values(1,'Bridgelabz');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Company values(2,'TCS');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Company values(3,'Tech-Mahindra');
Query OK, 1 row affected (0.00 sec)

mysql> select * from Company;
+------------+---------------+
| Company_Id | Company_name  |
+------------+---------------+
|          1 | Bridgelabz    |
|          2 | TCS           |
|          3 | Tech-Mahindra |
+------------+---------------+
3 rows in set (0.00 sec)

mysql> alter table Employee
    -> add foreign key(Company_Id)
    -> references Company(Company_Id);
Query OK, 3 rows affected (0.10 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> create table Department(Department_Id int primary key,Phone_Number int(10),Address varchar(150),Department varchar(150));
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> alter table Employee
    -> add (Department_Id int);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table Payroll(Payroll_Id int primary key,Basic_Pay int,Deduction int,Taxable_Pay int,Income_Tax int,Net_Pay int);
Query OK, 0 rows affected (0.04 sec)


mysql> desc Payroll
    -> ;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| Payroll_Id  | int  | NO   | PRI | NULL    |       |
| Basic_Pay   | int  | YES  |     | NULL    |       |
| Deduction   | int  | YES  |     | NULL    |       |
| Taxable_Pay | int  | YES  |     | NULL    |       |
| Income_Tax  | int  | YES  |     | NULL    |       |
| Net_Pay     | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> alter table Employee add Payroll_Id int;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int         | NO   | PRI | NULL    |       |
| name          | varchar(50) | YES  |     | NULL    |       |
| salary        | int         | YES  |     | NULL    |       |
| Start_date    | date        | YES  |     | NULL    |       |
| Company_Id    | int         | YES  | MUL | NULL    |       |
| Department_Id | int         | YES  |     | NULL    |       |
| Payroll_Id    | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table Employee add Payroll_Id int;alter table Employee
ERROR 1060 (42S21): Duplicate column name 'Payroll_Id'
    -> ;
Query OK, 0 rows affected (0.00 sec)

mysql> alter table Employee
    -> add foreign key(Payroll_Id)
    -> references Payroll(Payroll_Id);
Query OK, 3 rows affected (0.08 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> desc Employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int         | NO   | PRI | NULL    |       |
| name          | varchar(50) | YES  |     | NULL    |       |
| salary        | int         | YES  |     | NULL    |       |
| Start_date    | date        | YES  |     | NULL    |       |
| Company_Id    | int         | YES  | MUL | NULL    |       |
| Department_Id | int         | YES  |     | NULL    |       |
| Payroll_Id    | int         | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> desc Department;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Department_Id | int          | NO   | PRI | NULL    |       |
| Phone_Number  | int          | YES  |     | NULL    |       |
| Address       | varchar(150) | YES  |     | NULL    |       |
| Department    | varchar(150) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> alter table Employee add foreign key(Department_Id) references Department(Department_Id);
Query OK, 3 rows affected (0.09 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> desc Department;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Department_Id | int          | NO   | PRI | NULL    |       |
| Phone_Number  | int          | YES  |     | NULL    |       |
| Address       | varchar(150) | YES  |     | NULL    |       |
| Department    | varchar(150) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

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
7 rows in set (0.00 sec)

mysql> alter table Department add Employee_Id int;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc Department;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Department_Id | int          | NO   | PRI | NULL    |       |
| Phone_Number  | int          | YES  |     | NULL    |       |
| Address       | varchar(150) | YES  |     | NULL    |       |
| Department    | varchar(150) | YES  |     | NULL    |       |
| Employee_Id   | int          | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> alter table Department add foreign key(Employee_Id) references Employee(id);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Department;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Department_Id | int          | NO   | PRI | NULL    |       |
| Phone_Number  | int          | YES  |     | NULL    |       |
| Address       | varchar(150) | YES  |     | NULL    |       |
| Department    | varchar(150) | YES  |     | NULL    |       |
| Employee_Id   | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> alter table Department add Company_Id int;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc Department;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Department_Id | int          | NO   | PRI | NULL    |       |
| Phone_Number  | int          | YES  |     | NULL    |       |
| Address       | varchar(150) | YES  |     | NULL    |       |
| Department    | varchar(150) | YES  |     | NULL    |       |
| Employee_Id   | int          | YES  | MUL | NULL    |       |
| Company_Id    | int          | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> alter table Department add foreign key(Company_Id) references Company(Company_Id);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Department;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Department_Id | int          | NO   | PRI | NULL    |       |
| Phone_Number  | int          | YES  |     | NULL    |       |
| Address       | varchar(150) | YES  |     | NULL    |       |
| Department    | varchar(150) | YES  |     | NULL    |       |
| Employee_Id   | int          | YES  | MUL | NULL    |       |
| Company_Id    | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

