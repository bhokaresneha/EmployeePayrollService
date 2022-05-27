********************************************************* UC1 **********************************************************
                                //UC1- Ability to create a payroll service database

// Query to Display all Databases
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

// Query to Creating  database payroll_services.
mysql> create database payroll_services;
Query OK, 1 row affected (0.02 sec)

// Query to Display all Databases with newly added payroll_services database
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_services   |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

// Using payroll_services Database.
mysql> use payroll_services;
Database changed
mysql> select database();
+------------------+
| database()       |
+------------------+
| payroll_services |
+------------------+
1 row in set (0.00 sec)

*************************************************** UC2 ****************************************************************
    //UC2 - Ability to create a employee payroll table in the payroll service database to manage employee payrolls.

//Query to create employee payroll table with columns id, name, salary and start date as column.
    Note Id is set to auto increment.
mysql> create table employee_payroll
    -> (
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.04 sec)

// Query to showing Description of payroll_services.
mysql> desc payroll_services;
ERROR 1146 (42S02): Table 'payroll_services.payroll_services' doesn't exist
mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)


**************************************************** UC3 ***************************************************************
            //Ability to create employee payroll data in the payroll service database as part of CURD Operation
                - Use payroll_service database

//Query to create employees payroll data into the employee_payroll table
mysql> INSERT INTO employee_payroll ( name, salary, start ) VALUES
    -> ( 'Bill', 1000000.00, '2010-10-30' ),
    -> ( 'Tersia', 2000000.00, '2019-11-13' ),
    -> ( 'charlie', 3000000.00, '2020-05-21' );
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

*************************************************** UC4 ****************************************************************
     //  Ability to retrieve all the employee payroll data that is added to payroll service database.


//Query to retrieve all the data from the employee_payroll table.
mysql> select * from employee_payroll;
+----+---------+---------+------------+
| id | name    | salary  | start_date |
+----+---------+---------+------------+
|  1 | Bill    | 1000000 | 2010-10-30 |
|  2 | Tersia  |  200000 | 2019-11-13 |
|  3 | Charlie |  300000 | 2020-05-21 |
+----+---------+---------+------------+
3 rows in set (0.00 sec)

*************************************************** UC5 ****************************************************************
// Ability to retrieve salary data for a particular employee as well as all employees who have joined in a p
        articular data range from the payroll service database.

//Query to View Bill’s salary
mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
+---------+
| salary  |
+---------+
| 1000000 |
+---------+
1 row in set (0.00 sec)

// Query to View employees start between dates from 2018-01-01 to current date.
    --Use of Database Functions like CAST() and NOW() in the Query
mysql> SELECT * FROM employee_payroll   WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  2 | Tersia  | 2000000 | 2019-11-13 |
|  3 | charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
2 rows in set (0.00 sec)

*************************************************** UC6 ****************************************************************
    // Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender.

//Query to Alter Table Command to add Field gender after the name field
mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) NOT NULL AFTER name;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

// Query to Display Gender colum is added after name column or not
mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    |        | 1000000 | 2010-10-30 |
|  2 | Tersia  |        | 2000000 | 2019-11-13 |
|  3 | charlie |        | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.01 sec)

//Query to set the gender using where condition with the employee name.
mysql> UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

//Query to Display record after CURD operation.
mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2010-10-30 |
|  2 | Tersia  |        | 2000000 | 2019-11-13 |
|  3 | charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)

//Query to set the gender Female to employee Tersia.
mysql> UPDATE employee_payroll set gender = 'F' where name = 'Tersia';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

// Query to Display records from employee_payroll
mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2010-10-30 |
|  2 | Tersia  | F      | 2000000 | 2019-11-13 |
|  3 | charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)

*************************************************** UC7 ****************************************************************
                //Ability to find sum, average, min, max and number of male and female employees.

//Query to Find SUM of salary where gender is female
mysql> SELECT SUM(salary) FROM employee_payroll
    -> WHERE gender = 'F' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|     2000000 |
+-------------+
1 row in set (0.00 sec)

//Query to Find Sum of salary where gender is male
mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'm' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|     4000000 |
+-------------+
1 row in set (0.00 sec)

//Query to Find Average salary where gender is male
mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'm' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|     2000000 |
+-------------+
1 row in set (0.00 sec)

//Query to Find Average salary of employee gender wise.
mysql> SELECT AVG(salary) FROM employee_payroll GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|     2000000 |
|     2000000 |
+-------------+
2 rows in set (0.00 sec)

//Query to Find Average salary where gender is female .
mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|     2000000 |
+-------------+
1 row in set (0.00 sec)

//Query to Display gender and calculate Average salary gender wise.
mysql> SELECT AVG(salary),gender FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+--------+
| AVG(salary) | gender |
+-------------+--------+
|     2000000 | F      |
+-------------+--------+
1 row in set (0.00 sec)

//Query to calculate Average salary gender wise.
mysql> SELECT AVG(salary),gender FROM employee_payroll GROUP BY gender;
+-------------+--------+
| AVG(salary) | gender |
+-------------+--------+
|     2000000 | M      |
|     2000000 | F      |
+-------------+--------+
2 rows in set (0.01 sec)

//Query to Display gender and calculate Average salary,total of salary gender wise.
mysql> SELECT gender, AVG(salary), SUM(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+-------------+
| gender | AVG(salary) | SUM(salary) |
+--------+-------------+-------------+
| M      |     2000000 |     4000000 |
| F      |     2000000 |     2000000 |
+--------+-------------+-------------+
2 rows in set (0.00 sec)

//Query to Display gender and calculate Average salary,total of salary,Minimum Salary,Maximum salary gender wise.
mysql> SELECT gender, AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM employee_payroll GROUP
BY gender;
+--------+-------------+-------------+-------------+-------------+
| gender | AVG(salary) | SUM(salary) | MIN(salary) | MAX(salary) |
+--------+-------------+-------------+-------------+-------------+
| M      |     2000000 |     4000000 |     1000000 |     3000000 |
| F      |     2000000 |     2000000 |     2000000 |     2000000 |
+--------+-------------+-------------+-------------+-------------+
2 rows in set (0.00 sec)

**************************************************  END  **************************************************************