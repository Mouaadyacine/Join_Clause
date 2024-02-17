mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bdtest             |
| cntrfor            |
| firstdatabase      |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test               |
| testjoinprimfor    |
+--------------------+
10 rows in set (0.00 sec)

mysql>
mysql> use testJoinPrimFor;
Database changed
   

mysql> show tables;
Empty set (0.00 sec)

mysql>
mysql> create table person (
    ->     personID int not null,
    ->     name varchar(14) not null ,
    ->     birthDate int not null,
    ->     primary key(personID)
    -> );
Query OK, 0 rows affected (0.86 sec)

mysql> create table emp (
    ->     empID int not null,
    ->     job varchar(16) not null,
    ->     salary int ,
    ->     personID int ,
    ->     primary key (empID),
    ->     foreign key (personID) references person(personID)
    -> );
Query OK, 0 rows affected (0.69 sec)

mysql>
mysql> insert into person values
    ->  (1,"mohamed",2020),
    ->  (2,"agmed",2050),
    ->  (3,"ismail",2060),
    ->  (4,"jemy",2060);
Query OK, 4 rows affected (0.26 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> insert into emp values
    ->  (66,"tech",134,1),
    ->  (23,"fina",145,2),
    ->  (31,"assu",1444,3),
    ->  (45,"res",1144,4);
Query OK, 4 rows affected (0.06 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> select person.name , person.birthDate, emp.job, emp.salary from emp join person on person.personID = emp.personID;
+---------+-----------+------+--------+
| name    | birthDate | job  | salary |
+---------+-----------+------+--------+
| agmed   |      2050 | fina |    145 |
| ismail  |      2060 | assu |   1444 |
| jemy    |      2060 | res  |   1144 |
| mohamed |      2020 | tech |    134 |
+---------+-----------+------+--------+
4 rows in set (0.00 sec)

mysql>