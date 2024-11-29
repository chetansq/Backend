-- 22-11-24 fri

-- for display  all database

--  command:- show databases;

-- creating database

--  create :- create database <db-name>

--  create database test;

--  for activate current working database

-- use <db-name>

-- use  test;


-- || 23-11-24 sat ||
---------------------------


**** || CREATE TABLE || **** 


-- SYNTAX:- 

create table <tb-name> values(col database(size),...);

-- EXAMPLE:-
-- create table stud (sid varchar(3),sname varchar(20),scontact varchar(10));


**** || SHOW table || ****


mysql> show tables;

-- +----------------+
-- | Tables_in_test |
-- +----------------+
-- | stud           |
-- +----------------+
-- 1 row in set (0.00 sec)



**** || INSERT DATA || ****



-- SYNTAX :-

insert into <tb-name> (col1,....) values(' df',1 , ....); --> ' ' for String and  , , --> for Number

-- EXAMPLE :-
-- insert into stud values ('11' , 'aman', "1234567890");



**** || SELECT QUERY || ****



-- SYNTAX :- 

select * from <tb-name>;

-- EXAMPLE :-
-- mysql> select * from stud;

-- +------+-------+------------+
-- | sid  | sname | scontact   |
-- +------+-------+------------+
-- | 11   | aman  | 1234567890 |
-- | 11   | aman  | 1234567890 |
-- | 11   | aman  | 1234567890 |
-- | 11   | aman  | 1234567890 |
-- +------+-------+------------+

-- 1 row in set (0.00 sec)

**** || PRIMARY KEY || ****

-- SYNTAX :-

create table stud1 (sid varchar(3) primary key ,sname varchar(20) ,scontact varchar(10));

-- mysql> desc stud1;
-- +----------+-------------+------+-----+---------+-------+
-- | Field    | Type        | Null | Key | Default | Extra |
-- +----------+-------------+------+-----+---------+-------+
-- | sid      | varchar(3)  | NO   | PRI | NULL    |       |
-- | sname    | varchar(20) | YES  |     | NULL    |       |
-- | scontact | varchar(10) | YES  |     | NULL    |       |
-- +----------+-------------+------+-----+---------+-------+
-- 3 rows in set (0.00 sec)

-- EXAMPLE :-

-- insert into stud1 values ('11' , 'aman', "1234567890");
-- insert into stud1 values ('12' , 'aman', "1234567890");
-- insert into stud1 values ('13' , 'amit', "3452567890");

-- ERROR :-

-- (Duplicate entry '11' for key 'stud1.PRIMARY')

-- mysql> insert into stud1 values ('11' , 'aman', "1234567890");
-- ERROR 1062 (23000): Duplicate entry '11' for key 'stud1.PRIMARY'

-- mysql> select * from stud1;
-- +-----+-------+------------+
-- | sid | sname | scontact   |
-- +-----+-------+------------+
-- | 11  | aman  | 1234567890 |
-- | 12  | aman  | 1234567890 |
-- | 13  | amit  | 3452567890 |
-- +-----+-------+------------+
-- 3 rows in set (0.00 sec)


**** || COMPOSITE PRIMARY KEY || ****

-- create table stud2 (sid varchar(3) primary key ,sname varchar(20) primary key,scontact varchar(10));

-- ERROR :-

-- (Multiple primary key defined)

-- mysql> create table stud2 (sid varchar(3) primary key ,sname varchar(20) primary key,scontact varchar(10));
-- ERROR 1068 (42000): Multiple primary key defined


-- SYNTAX :-

create table stud2 (sid varchar(3) ,sname varchar(20) ,scontact varchar(10), 
PRIMARY KEY (sid,sname) );


-- EXAMPLE :-

--  insert into stud2 values ('11' , 'aman', "1234567890");
--  insert into stud2 values ('12' , 'aman', "1234567890");

-- mysql> select * from stud2;
-- +-----+-------+------------+
-- | sid | sname | scontact   |
-- +-----+-------+------------+
-- | 11  | aman  | 1234567890 |
-- | 12  | aman  | 1234567890 |
-- +-----+-------+------------+
-- 2 rows in set (0.00 sec)


-- ERROR :-
-- if two primary key in one table and insert same data (same id and same name)
--  then ... (Duplicate entry '12-aman')

-- mysql>  insert into stud2 values ('12' , 'aman', "1234567890");
-- ERROR 1062 (23000): Duplicate entry '12-aman' for key 'stud2.PRIMARY'

-- mysql>  insert into stud2 values ('12' , 'amit', "1234567890");
-- Query OK, 1 row affected (0.01 sec)

-- mysql> select * from stud2;
-- +-----+-------+------------+
-- | sid | sname | scontact   |
-- +-----+-------+------------+
-- | 11  | aman  | 1234567890 |
-- | 12  | aman  | 1234567890 | ****** ||
-- | 12  | amit  | 1234567890 | ****** ||
-- +-----+-------+------------+
-- 3 rows in set (0.00 sec)


-- 25-11-24 Mon

**** || WHERE CLAUSE || ****

-- SYNTAX :-

select * from <tb-name> where <expression (col-name = 'values')>;

-- EXAMPLE :-

-- select * from stud1 where sname = 'Raj';

-- +-----+-------+------------+
-- | sid | sname | scontact   |
-- +-----+-------+------------+
-- | 14  | raj   | 1234567890 |
-- +-----+-------+------------+

-- insert into  stud1 values ('14' , 'Raj', "1234567890");
--  insert into stud1 values ('15' , 'Rajesh', "1234567890");
--  insert into stud1 values ('16' , 'Ajay', "1234567890");
--  insert into stud1 values ('17' , 'Meet', "1234567890");
--  insert into stud1 values ('18' , 'Veer', "1234567890");
--  insert into stud1 values ('19' , 'Mehul', "1234567890");
--  insert into stud1 values ('20' , 'Shah', "1234567890");



**** || LIKE PREDICATE || ****

-- SYNTAX :-

select * from <tb-name> where <expression like >; _ %

--  _ --> For single character
--  % --> For all character/word

-- EXAMPLE :-

-- First Character A
select * from stud1 where sname like 'a%'; -- 'a%' / 'A%'

-- +-----+-------+------------+
-- | sid | sname | scontact   |
-- +-----+-------+------------+
-- | 11  | aman  | 1234567890 |
-- | 12  | aman  | 1234567890 |
-- | 13  | amit  | 3452567890 |
-- | 16  | ajay  | 1234567890 |
-- +-----+-------+------------+

-- Last Character h
select * from stud1 where sname like '%h';

-- +-----+--------+------------+
-- | sid | sname  | scontact   |
-- +-----+--------+------------+
-- | 15  | rajesh | 1234567890 |
-- | 20  | Shah   | 1234567890 |
-- +-----+--------+------------+ 

-- Last Character a
select * from stud1 where sname like '_a%';

-- +-----+--------+------------+
-- | sid | sname  | scontact   |
-- +-----+--------+------------+
-- | 14  | raj    | 1234567890 |
-- | 15  | rajesh | 1234567890 |
-- +-----+--------+------------+

-- Last Character a
select * from stud1 where sname like '%a_';

-- +-----+-------+------------+
-- | sid | sname | scontact   |
-- +-----+-------+------------+
-- | 11  | aman  | 1234567890 |
-- | 12  | aman  | 1234567890 |
-- | 14  | raj   | 1234567890 |
-- | 16  | ajay  | 1234567890 |
-- | 20  | Shah  | 1234567890 |
-- +-----+-------+------------+

mysql> select * from stud1 where sname like '_a_';

select * from stud1 where sname like '__j%';



29-11-24 Friday


create database exercises1 ;

-- CLIENT_MASTER

 create table CLIENT_MASTER (
CLIENTNO varchar(6) primary key,
NAME varchar(20),
ADDRESS1 varchar(30),
ADDRESS2 varchar(30),
CITY varchar(15),
PINCODE varchar(8),
STATE varchar(15),
BALDUE numeric(10,2)
 );


-- INSERT QUERY

insert into client_master values("C00001","Ivan Bayross","mota varacha","surat","Mumbai","400054","Maharashtra",15000);
insert into client_master values("C00002","Mamta Muzumdar","vijaybger","yogichok","Madras","780001","Tamil Nadu",0);
insert into client_master values("C00003","Chhaya Bankar","gitanger","punagam","Mumbai","400057","Maharashtra",5000);
insert into client_master values("C00004","Ashwini Joshi","shrdha","kamrej","Bangalore","560001","Karnatka",0);
insert into client_master values("C00005","Hansel Colaco","varj bhumi","katargam","Mumbai","400060","Maharashtra",2000);
insert into client_master values("C00006","Deepak Sharma","deepmala","bhutbhvani","Mangalore","560050","Karnatka",0);


create table PRODUCT_MASTER (
PRODUCTNO varchar(6) primary key,
DESCRIPTION varchar(15),
PROFITPERCENT numeric(4,2),
UNITMEASURE varchar(10),
QTYONHAND numeric(8),
REORDERLVL numeric(8),
SELLPRICE numeric(8,2),
COSTPRICE numeric(8,2)
 );

 insert into product_master values("P00001","T-Shirt",5,"Piece",200,50,350,250);
  insert into product_master values("P0345","Shirt",6,"Piece",150,50,500,350);
  insert into product_master values("P03453","T-Shirt",5,"Piece",250,50,500,350);
  insert into product_master values("P06734","Cotton Jeans",5,"Piece",100,20,600,450);
  insert into product_master values("P07865","Jeans",5,"Piece",100,20,750,500);
  insert into product_master values("P07868","Trousers",2,"Piece",150,50,850,550);
  insert into product_master values("P07885","Pull Overs",2.5,"Piece",80,30,700,450);
  insert into product_master values("P07965","Denim Shirts",4,"Piece",100,40,350,250);
  insert into product_master values("P07975","Lycra Tops",5,"Piece",70,30,300,175);
  insert into product_master values("P08865","Skirts",5,"Piece",75,30,450,300);


 create table SALESMAN_MASTER (
SALESMANNO varchar(6) primary key,
SALESMANNAME varchar(20),
ADDRESS1 varchar(30),
ADDRESS2 varchar(30),
CITY varchar(20),
PINCODE varchar(8),
STATE varchar(20),
SALAMT numeric(8,2),
TGTTOGET numeric(6,2),
YTDSALES numeric(6,2),
REMARKS varchar(60)
 );


insert into salesman_master values("S00001","Aman","A/14","Wordi","Mumbai",400002,"Maharashtra",3000,100,50,"Good");
insert into salesman_master values("S00002","Omkar","65","Nariman","Mumbai",400001,"Maharashtra",3000,100,100,"Good");
insert into salesman_master values("S00003","Raj","P-7","Bandra","Mumbai",400032,"Maharashtra",3000,200,100,"Good");
insert into salesman_master values("S00004","Ashish","A/5","Juhu","Mumbai",400044,"Maharashtra",3500,200,150,"Good");


  create table sales_order (
ORDERNO varchar(6) primary key,
CLIENTNO varchar(20),
ORDERDATE date,
DELYADDR varchar(25),
SALESMANNO varchar(6),
DELYTYPE char(1),
BILLYN char(1),
DELYDATE date,
ORDERSTATUS varchar(10),
foreign key (CLIENTNO) references client_master(CLIENTNO),
foreign key (SALESMANNO) references salesman_master(SALESMANNO)
 );


 insert into sales_order values("O19001","C00001","12-06-04","Mumbai","S00001","F","N","20-07-02","In Process");
insert into sales_order values("O19002","C00002","25-06-04","Gujarat","S00002","P","N","27-06-02","Cancelled");
insert into sales_order values("O46865","C00003","18-02-04","Delhi","S00003","F","Y","20-02-02","Fulfilled");
insert into sales_order values("O19003","C00001","03-04-04","Ahemdabad","S00001","F","Y","27-04-02","Fulfilled");
insert into sales_order values("O46866","C00004","20-05-04","Rajshthan","S00002","P","N","22-05-02","Cancelled");
insert into sales_order values("O19008","C00005","24-05-04","Banglore","S00004","F","N","26-07-02","In Process");



   create table sales_order_details (
ORDERNO varchar(6),
PRODUCTNO varchar(6),
QTYORDERED numeric(8),
QTYDISP numeric(8),
PRODUCTRATE numeric(10,2),
foreign key (ORDERNO) references sales_order(ORDERNO),
foreign key (PRODUCTNO) references PRODUCT_MASTER(PRODUCTNO)
 );


insert into sales_order_details values("O19001","P00001",4,4,525);
insert into sales_order_details values("O19001","P07965",2,1,8400);
insert into sales_order_details values("O19001","P07885",2,1,5250);
insert into sales_order_details values("O19002","P00001",10,0,525);
insert into sales_order_details values("O46865","P07868",3,3,3150);
insert into sales_order_details values("O46865","P07885",3,1,5250);
insert into sales_order_details values("O46865","P00001",10,10,525);
insert into sales_order_details values("O46865","P0345",4,4,1050);
insert into sales_order_details values("O19003","P03453",2,2,1050);
insert into sales_order_details values("O19003","P06734",1,1,12000);
insert into sales_order_details values("O46866","P07965",1,0,8400);
insert into sales_order_details values("O46866","P07975",1,0,1050);
insert into sales_order_details values("O19008","P00001",10,5,525);
insert into sales_order_details values("O19008","P07975",5,3,1050);


















