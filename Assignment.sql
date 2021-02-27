mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| electronic_devices |
| information_schema |
| matrimony          |
| mysql              |
| performance_schema |
| sys                |
| transformer11      |
| trv11              |
| x_workz            |
| xworkz             |
+--------------------+
11 rows in set (0.00 sec)

mysql> use company;
Database changed

mysql> show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| dept              |
| employee          |
+-------------------+
2 rows in set (0.00 sec)


mysql> desc employee;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| empno    | int           | NO   | PRI | NULL    |       |
| ename    | varchar(45)   | YES  |     | NULL    |       |
| job      | varchar(45)   | YES  |     | NULL    |       |
| mgr      | int           | YES  |     | NULL    |       |
| hiredata | date          | YES  |     | NULL    |       |
| sal      | decimal(14,0) | YES  |     | NULL    |       |
| comm     | decimal(12,0) | YES  |     | NULL    |       |
| deptno   | int           | YES  |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+
8 rows in set (0.00 sec)


mysql> desc dept;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptno   | int         | NO   | PRI | NULL    |       |
| dname    | varchar(45) | YES  |     | NULL    |       |
| location | varchar(45) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> create table emp(
    -> empno int not null primary key,
    -> ename varchar(50) not null,
    -> job varchar(50) not null,
    -> mgr int,
    -> hiredate date,
    -> sal decimal(10,2),
    -> comm decimal(10,2),
    -> deptno int not null,
    -> foreign key(deptno) references dept(deptno));
Query OK, 0 rows affected (1.97 sec)


mysql> insert into dept values (10,'Accounting','New York');
Query OK, 1 row affected (0.23 sec)

mysql>  insert into dept values (20,'Research','Dallas'),
    -> (30,'Sales','Chicago'),
    -> (40,'Operation','Baston');
Query OK, 3 rows affected (0.16 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select * from dept;
+--------+------------+-----------+
| deptno | dname      | location  |
+--------+------------+-----------+
|     10 | Accounting | New York  |
|     20 | Research   | Dallas    |
|     30 | Sales      | Chicago   |
|     40 | Operations | Boston    |
|     50 | Production | india     |
|     60 | marketing  | bangalore |
|     70 | finance    | mumbai    |
+--------+------------+-----------+
7 rows in set (0.22 sec)


mysql> insert into emp values (7002,'Sham','Manager',7698,'2020-06-18',2500.00,NULL,50),
    -> (7004,'Ravi','Clerk',7782,'2000-12-12',500.00,NULL,50),
    -> (7369,'SMITH','CLERK',7902,'1993-06-13',800,0.00,20),
    -> (7499,'ALLEN','SALESMAN',7698,'1998-08-15',1600.00,300.00,30),
    -> (7521,'WARD','SALESMAN',7698,'1996-03-26',1250.00,500.00,30),
    -> (7566,'JONES','MANAGER',7839,'1995-10-31',2975.00,NULL,20),
    -> (7654,'MARTIN','SALESMAN',7698,'1998-12-05',1250.00,1400.00,30),
    -> (7698,'BLAKE','MANAGER',7839,'1992-06-11',2850.00,NULL,30),
    -> (7782,'CLARK','MANAGER',7839,'1993-05-14',2450.00,NULL,10),
    -> (7788,'SCOTT','ANALYST',7566,'1996-03-05',3000.00,NULL,20),
    -> (7839,'KING','PRESIDENT',NULL,'1990-06-09',5000.00,0.00,10),
    -> (7844,'TURNER','SALESMAN',7698,'1995-06-04',1500.00,0.00,30),
    -> (7876,'ADAMS','CLERK',7788,'1999-06-04',1100.00,NULL,20),
    -> (7900,'JAMES','CLERK',7698,'2000-06-23',950.00,NULL,30),
    -> (7902,'FORD','ANALYST',7566,'1997-12-05',3000.00,NULL,20),
    -> (7934,'MILLER','CLERK',7782,'2000-01-21',1300.00,NULL,10);
Query OK, 16 rows affected (0.16 sec)
Records: 16  Duplicates: 0  Warnings: 0


mysql> select * from employee;
+-------+--------+-----------+------+------------+------+------+--------+
| empno | ename  | job       | mgr  | hiredata   | sal  | comm | deptno |
+-------+--------+-----------+------+------------+------+------+--------+
|  7000 | John   | manager   | 7698 | 2020-06-18 | 2500 | NULL |     50 |
|  7002 | Shan   | manager   | 7698 | 2020-06-18 | 2500 | NULL |     50 |
|  7004 | Ravi   | clerk     | 7782 | 2000-12-12 |  500 | NULL |     50 |
|  7369 | SMITA  | CLERK     | 7902 | 1993-06-13 |  800 |    0 |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1998-08-15 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1996-03-26 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1995-10-31 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1998-12-05 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1992-06-11 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1993-05-14 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1996-03-05 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1990-06-09 | 5000 |    0 |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1995-06-04 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1999-06-04 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 2000-06-23 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1997-12-05 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 2000-01-21 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
17 rows in set (0.05 sec)