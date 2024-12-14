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
insert into sales_order_details values("O19003","P08865",2,2,1050);
insert into sales_order_details values("O19003","P06734",1,1,12000);
insert into sales_order_details values("O46866","P07965",1,0,8400);
insert into sales_order_details values("O46866","P07975",1,0,1050);
insert into sales_order_details values("O19008","P00001",10,5,525);
insert into sales_order_details values("O19008","P07975",5,3,1050);


-- 04-12-24

-- |||| join query ||||

theory

-- 05-12-24


create table client_master(
    client_no varchar(6) PRIMARY KEY,
    name varchar(20),
    address1 varchar(30),
    address2 varchar(30),
    city varchar(15),
    pincode numeric(8),
    state varchar(15),
    bal_due numeric(10,2)
);

 desc client_master;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| client_no | varchar(6)    | NO   | PRI | NULL    |       |
| name      | varchar(20)   | YES  |     | NULL    |       |
| address1  | varchar(30)   | YES  |     | NULL    |       |
| address2  | varchar(30)   | YES  |     | NULL    |       |
| city      | varchar(15)   | YES  |     | NULL    |       |
| pincode   | decimal(8,0)  | YES  |     | NULL    |       |
| state     | varchar(15)   | YES  |     | NULL    |       |
| bal_due   | decimal(10,2) | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+

insert into client_master values('C00001', 'Ivan Bayross', 'A', '5', 'Mumbai', 400054, 'Maharashtra', 15000);
insert into client_master values('C00002', 'Mamta Muzumdar', 'C', '10', 'Madras', 780001, 'Tamil Nadu', 0);
insert into client_master values('C00003', 'Chhaya Bankar', 'B', '7', 'Mumbai', 400057, 'Maharashtra', 5000);
insert into client_master values('C00004', 'Ashwini Joshi', 'E', '2', 'Bangalore', 560001, 'Karnataka', 0);
insert into client_master values('C00005', 'Hansel Colaco', 'A', '2', 'Mumbai', 400060, 'Maharashtra', 2000);
insert into client_master values('C00006', 'Deepak Sharma', 'B', '3', 'Mangalore', 560050, 'Karnataka', 0);

select * from client_master;
+-----------+----------------+----------+----------+-----------+---------+-------------+----------+
| client_no | name           | address1 | address2 | city      | pincode | state       | bal_due  |
+-----------+----------------+----------+----------+-----------+---------+-------------+----------+
| C00001    | Ivan Bayross   | A        | 5        | Mumbai    |  400054 | Maharashtra | 15000.00 |
| C00002    | Mamta Muzumdar | C        | 10       | Madras    |  780001 | Tamil Nadu  |     0.00 |
| C00003    | Chhaya Bankar  | B        | 7        | Mumbai    |  400057 | Maharashtra |  5000.00 |
| C00004    | Ashwini Joshi  | E        | 2        | Bangalore |  560001 | Karnataka   |     0.00 |
| C00005    | Hansel Colaco  | A        | 2        | Mumbai    |  400060 | Maharashtra |  2000.00 |
| C00006    | Deepak Sharma  | B        | 3        | Mangalore |  560050 | Karnataka   |     0.00 |
+-----------+----------------+----------+----------+-----------+---------+-------------+----------+
6 rows in set (0.00 sec)

 create table product_master(
    product_no varchar(6) primary key,
    description varchar(15),
    profit_percent numeric(4,2),
    unit_mesure varchar(10),
    qty_on_hand numeric(8),
    reoder_lvl numeric(8),
    sell_price numeric(8,2),
    cost_price numeric(8,2)
    );


desc product_master;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| product_no     | varchar(6)   | NO   | PRI | NULL    |       |
| description    | varchar(15)  | YES  |     | NULL    |       |
| profit_percent | decimal(4,2) | YES  |     | NULL    |       |
| unit_measure   | varchar(10)  | YES  |     | NULL    |       |
| qty_on_hand    | decimal(8,0) | YES  |     | NULL    |       |
| reorder_lvl    | decimal(8,0) | YES  |     | NULL    |       |
| sell_price     | decimal(8,2) | YES  |     | NULL    |       |
| cost_price     | decimal(8,2) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

insert into product_master values('P00001', 'T-Shirts', 5, 'Piece', 200, 50, 350, 250);
insert into product_master values('P0345', 'Shirts', 6, 'Piece', 150, 50, 500, 350);
insert into product_master values('P06734', 'Cotton Jeans', 5, 'Piece', 100, 20, 600, 450);
insert into product_master values('P07865', 'Jeans', 5, 'Piece', 100, 20, 750, 500);
insert into product_master values('P07868', 'Trousers', 2, 'Piece', 150, 50, 850, 550);
insert into product_master values('P07885', 'Pull Overs', 2.5, 'Piece', 80, 30, 700, 450);
insert into product_master values('P07965', 'Denim Shirts', 4, 'Piece', 100, 40, 350, 250);
insert into product_master values('P07975', 'Lycra Tops', 5, 'Piece', 70, 30, 300, 175);
insert into product_master values('P08865', 'Skirts', 5, 'Piece', 75, 30, 450, 300);

select * from product_master;
-- +------------+--------------+----------------+--------------+-------------+-------------+------------+------------+
-- | product_no | description  | profit_percent | unit_measure | qty_on_hand | reorder_lvl | sell_price | cost_price |
-- +------------+--------------+----------------+--------------+-------------+-------------+------------+------------+
-- | P00001     | T-Shirts     |           5.00 | Piece        |         200 |          50 |     350.00 |     250.00 |
-- | P0345      | Shirts       |           6.00 | Piece        |         150 |          50 |     500.00 |     350.00 |
-- | P06734     | Cotton Jeans |           5.00 | Piece        |         100 |          20 |     600.00 |     450.00 |
-- | P07865     | Jeans        |           5.00 | Piece        |         100 |          20 |     750.00 |     500.00 |
-- | P07868     | Trousers     |           2.00 | Piece        |         150 |          50 |     850.00 |     550.00 |
-- | P07885     | Pull Overs   |           2.50 | Piece        |          80 |          30 |     700.00 |     450.00 |
-- | P07965     | Denim Shirts |           4.00 | Piece        |         100 |          40 |     350.00 |     250.00 |
-- | P07975     | Lycra Tops   |           5.00 | Piece        |          70 |          30 |     300.00 |     175.00 |
-- | P08865     | Skirts       |           5.00 | Piece        |          75 |          30 |     450.00 |     300.00 |
-- +------------+--------------+----------------+--------------+-------------+-------------+------------+------------+
-- 9 rows in set (0.00 sec)


create table salesman_master(
    salesman_no varchar(6) PRIMARY KEY,
    salesman_name varchar(20),
    address1 varchar(30),
    address2 varchar(30),
    city varchar(20),
    pincode numeric(8),
    state varchar(20),
    sal_amt numeric(8,2),
    tgt_to_get numeric(6,2),
    ytd_sales numeric(6,2),
    remarks varchar(60)
);

desc salesman_master;
-- +---------------+--------------+------+-----+---------+-------+
-- | Field         | Type         | Null | Key | Default | Extra |
-- +---------------+--------------+------+-----+---------+-------+
-- | salesman_no   | varchar(6)   | NO   | PRI | NULL    |       |
-- | salesman_name | varchar(20)  | YES  |     | NULL    |       |
-- | address1      | varchar(30)  | YES  |     | NULL    |       |
-- | address2      | varchar(30)  | YES  |     | NULL    |       |
-- | city          | varchar(20)  | YES  |     | NULL    |       |
-- | pincode       | decimal(8,0) | YES  |     | NULL    |       |
-- | state         | varchar(20)  | YES  |     | NULL    |       |
-- | sal_amt       | decimal(8,2) | YES  |     | NULL    |       |
-- | tgt_to_get    | decimal(6,2) | YES  |     | NULL    |       |
-- | ytd_sales     | decimal(6,2) | YES  |     | NULL    |       |
-- | remarks       | varchar(60)  | YES  |     | NULL    |       |
-- +---------------+--------------+------+-----+---------+-------+
-- 11 rows in set (0.00 sec)


insert into salesman_master values('S00001', 'Aman', 'A/14', 'Worli', 'Mumbai', 400002, 'Maharashtra', 3000, 100, 50, 'Good');
insert into salesman_master values('S00002', 'Omkar', '65', 'Nariman', 'Mumbai', 400001, 'Maharashtra', 3000, 200, 100, 'Good');
insert into salesman_master values('S00003', 'Raj', 'P-7', 'Bandra', 'Mumbai', 400032, 'Maharashtra', 3000, 200, 100, 'Good');
insert into salesman_master values('S00004', 'Ashish', 'A/5', 'Juhu', 'Mumbai', 400044, 'Maharashtra', 3500, 200, 150, 'Good');


create table sales_order(
    order_no varchar(6) PRIMARY KEY,
    client_no varchar(6),
    order_date date NOT NULL,
    dely_addr varchar(25),
    salesman_no varchar(6),
    dely_type char(1),
    bill_yn char(1),
    dely_date date,
    order_status varchar(10),
    CONSTRAINT CHK_order_no CHECK (order_no LIKE 'O%'),
    CONSTRAINT FK_CLIENT_ID FOREIGN KEY (client_no) REFERENCES client_master(client_no),
    CONSTRAINT FK_SALESMAN_ID FOREIGN KEY (salesman_no) REFERENCES salesman_master(salesman_no),
    CONSTRAINT CHK_order_status CHECK ((order_status = "In Process") || (order_status = "Fulfilled") || (order_status = "BackOrder") || (order_status = "Cancelled"))
);

-- +--------------+-------------+------+-----+---------+-------+
-- | Field        | Type        | Null | Key | Default | Extra |
-- +--------------+-------------+------+-----+---------+-------+
-- | order_no     | varchar(6)  | NO   | PRI | NULL    |       |
-- | client_no    | varchar(6)  | YES  | MUL | NULL    |       |
-- | order_date   | date        | NO   |     | NULL    |       |
-- | dely_addr    | varchar(25) | YES  |     | NULL    |       |
-- | salesman_no  | varchar(6)  | YES  | MUL | NULL    |       |
-- | dely_type    | char(1)     | YES  |     | NULL    |       |
-- | bill_yn      | char(1)     | YES  |     | NULL    |       |
-- | dely_date    | date        | YES  |     | NULL    |       |
-- | order_status | varchar(10) | YES  |     | NULL    |       |
-- +--------------+-------------+------+-----+---------+-------+
-- 9 rows in set (0.00 sec)

insert into sales_order values('O19001', 'C00001', '04-06-12', 'Mumbai', 'S00001', 'F', 'N', '02-07-20', 'In Process');
insert into sales_order values('O19002', 'C00002', '04-06-25', 'Surat', 'S00002', 'P', 'N', '02-06-27', 'Cancelled');
insert into sales_order values('O46865', 'C00003', '04-02-18', 'Mumbai', 'S00003', 'F', 'Y', '02-02-20', 'Fulfilled');
insert into sales_order values('O19003', 'C00001', '04-04-03', 'Pune', 'S00001', 'F', 'Y', '02-04-07', 'Fulfilled');
insert into sales_order values('O46866', 'C00004', '04-05-20', 'Pune', 'S00002', 'P', 'N', '02-05-22', 'Cancelled');
insert into sales_order values('O19008', 'C00005', '04-05-24', 'Mumbai', 'S00004', 'F', 'N', '02-07-26', 'In Process');

select * from sales_order;
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- | order_no | client_no | order_date | dely_addr | salesman_no | dely_type | bill_yn | dely_date  | order_status |
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- | O19001   | C00001    | 2004-06-12 | Mumbai    | S00001      | F         | N       | 2002-07-20 | In Process   |
-- | O19002   | C00002    | 2004-06-25 | Surat     | S00002      | P         | N       | 2002-06-27 | Cancelled    |
-- | O19003   | C00001    | 2004-04-03 | Pune      | S00001      | F         | Y       | 2002-04-07 | Fulfilled    |
-- | O19008   | C00005    | 2004-05-24 | Mumbai    | S00004      | F         | N       | 2002-07-26 | In Process   |
-- | O46865   | C00003    | 2004-02-18 | Mumbai    | S00003      | F         | Y       | 2002-02-20 | Fulfilled    |
-- | O46866   | C00004    | 2004-05-20 | Pune      | S00002      | P         | N       | 2002-05-22 | Cancelled    |
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- 6 rows in set (0.01 sec)

create table sales_order_details(
    order_no varchar(6),
    product_no varchar(6),
    qty_ordered numeric(8),
    qty_disp numeric(8),
    product_rate numeric(10,2),
    CONSTRAINT FK_order_no FOREIGN KEY (order_no) REFERENCES sales_order(order_no),
    CONSTRAINT FK_product_no FOREIGN KEY (product_no) REFERENCES product_master(product_no)
);

-- +--------------+---------------+------+-----+---------+-------+
-- | Field        | Type          | Null | Key | Default | Extra |
-- +--------------+---------------+------+-----+---------+-------+
-- | order_no     | varchar(6)    | YES  | MUL | NULL    |       |
-- | product_no   | varchar(6)    | YES  | MUL | NULL    |       |
-- | qty_ordered  | decimal(8,0)  | YES  |     | NULL    |       |
-- | qty_disp     | decimal(8,0)  | YES  |     | NULL    |       |
-- | product_rate | decimal(10,2) | YES  |     | NULL    |       |
-- +--------------+---------------+------+-----+---------+-------+
-- 5 rows in set (0.00 sec)

insert into sales_order_details values('O19001', 'P00001', 4, 4, 525);
insert into sales_order_details values('O19001', 'P07965', 2, 1, 8400);
insert into sales_order_details values('O19001', 'P07885', 2, 1, 5250);
insert into sales_order_details values('O19002', 'P00001', 10, 0, 525);
insert into sales_order_details values('O46865', 'P07868', 3, 3, 3150);
insert into sales_order_details values('O46865', 'P07885', 3, 1, 5250);
insert into sales_order_details values('O46865', 'P00001', 10, 10, 525);
insert into sales_order_details values('O46865', 'P0345', 4, 4, 1050);
insert into sales_order_details values('O19003', 'P08865', 2, 2, 1050);
insert into sales_order_details values('O19003', 'P06734', 1, 1, 12000);
insert into sales_order_details values('O46866', 'P07965', 1, 0, 8400);
insert into sales_order_details values('O19008', 'P00001', 10, 5, 525);
insert into sales_order_details values('O19008', 'P07975', 5, 3, 1050);

select * from sales_order_details;
-- +----------+------------+-------------+----------+--------------+
-- | order_no | product_no | qty_ordered | qty_disp | product_rate |
-- +----------+------------+-------------+----------+--------------+
-- | O19001   | P00001     |           4 |        4 |       525.00 |
-- | O19001   | P07965     |           2 |        1 |      8400.00 |
-- | O19001   | P07885     |           2 |        1 |      5250.00 |
-- | O19002   | P00001     |          10 |        0 |       525.00 |
-- | O46865   | P07868     |           3 |        3 |      3150.00 |
-- | O46865   | P07885     |           3 |        1 |      5250.00 |
-- | O46865   | P00001     |          10 |       10 |       525.00 |
-- | O46865   | P0345      |           4 |        4 |      1050.00 |
-- | O19003   | P06734     |           1 |        1 |     12000.00 |
-- | O46866   | P07965     |           1 |        0 |      8400.00 |
-- | O19008   | P00001     |          10 |        5 |       525.00 |
-- | O19008   | P07975     |           5 |        3 |      1050.00 |
-- +----------+------------+-------------+----------+--------------+



------- Theta style --------

-- SYNTAX :-

select <col-name1> ,<col-name2>,<col-name N>
from <tb-name1>,<tb-name2>
where <tb-name1>.<col-name1> = <tb-name2>.<col-name2>
and <condition>
order by <col-name1>,<col-name2>,<col-name N >



EXAMPLE : -

use sql1;

==> select description,product_rate
from product_master,sales_order_details
where product_master.product_no = sales_order_details.product_no;

+--------------+--------------+
| description  | product_rate |
+--------------+--------------+
| T-Shirts     |       525.00 |
| Denim Shirts |      8400.00 |
| Pull Overs   |      5250.00 |
| T-Shirts     |       525.00 |
| Trousers     |      3150.00 |
| Pull Overs   |      5250.00 |
| T-Shirts     |       525.00 |
| Shirts       |      1050.00 |
| Cotton Jeans |     12000.00 |
| Denim Shirts |      8400.00 |
| T-Shirts     |       525.00 |
| Lycra Tops   |      1050.00 |
| Skirts       |      1050.00 |
+--------------+--------------+
13 rows in set (0.00 sec);


==> select pm.description, sod.product_rate
from product_master pm,sales_order_details sod
where pm.product_no = sod.product_no;


==> select sales_order_details.order_no,product_rate,order_date,description
from product_master,sales_order_details,sales_order 
where sales_order_details.order_no = sales_order.order_no
and product_master.product_no = sales_order_details.product_no;

+----------+--------------+------------+--------------+
| order_no | product_rate | order_date | description  |
+----------+--------------+------------+--------------+
| O19001   |       525.00 | 2004-06-12 | T-Shirts     |
| O19001   |      8400.00 | 2004-06-12 | Denim Shirts |
| O19001   |      5250.00 | 2004-06-12 | Pull Overs   |
| O19002   |       525.00 | 2004-06-25 | T-Shirts     |
| O46865   |      3150.00 | 2004-02-18 | Trousers     |
| O46865   |      5250.00 | 2004-02-18 | Pull Overs   |
| O46865   |       525.00 | 2004-02-18 | T-Shirts     |
| O46865   |      1050.00 | 2004-02-18 | Shirts       |
| O19003   |     12000.00 | 2004-04-03 | Cotton Jeans |
| O46866   |      8400.00 | 2004-05-20 | Denim Shirts |
| O19008   |       525.00 | 2004-05-24 | T-Shirts     |
| O19008   |      1050.00 | 2004-05-24 | Lycra Tops   |
| O19003   |      1050.00 | 2004-04-03 | Skirts       |
+----------+--------------+------------+--------------+

-- Practice

==> select sell_price,dely_date,qty_disp
from product_master,sales_order_details,sales_order 
where product_master.product_no = sales_order_details.product_no
and sales_order_details.order_no = sales_order.order_no;


+------------+------------+----------+
| sell_price | dely_date  | qty_disp |
+------------+------------+----------+
|     350.00 | 2002-07-20 |        4 |
|     350.00 | 2002-07-20 |        1 |
|     700.00 | 2002-07-20 |        1 |
|     350.00 | 2002-06-27 |        0 |
|     850.00 | 2002-02-20 |        3 |
|     700.00 | 2002-02-20 |        1 |
|     350.00 | 2002-02-20 |       10 |
|     500.00 | 2002-02-20 |        4 |
|     600.00 | 2002-04-07 |        1 |
|     350.00 | 2002-05-22 |        0 |
|     350.00 | 2002-07-26 |        5 |
|     300.00 | 2002-07-26 |        3 |
|     450.00 | 2002-04-07 |        2 |
+------------+------------+----------+


==>
select salesman_name,sales_order.salesman_no,order_status
from salesman_master,sales_order
where salesman_master.salesman_no = sales_order.salesman_no;


+---------------+-------------+--------------+
| salesman_name | salesman_no | order_status |
+---------------+-------------+--------------+
| Aman          | S00001      | In Process   |
| Aman          | S00001      | Fulfilled    |
| Aman          | S00001      | In Process   |
| Omkar         | S00002      | Cancelled    |
| Omkar         | S00002      | Cancelled    |
| Raj           | S00003      | Fulfilled    |
| Ashish        | S00004      | In Process   |
+---------------+-------------+--------------+
7 rows in set (0.00 sec)


||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- 06-12-24 friday

.............................ANSI style........................


-- SYNTAX :-

select <col-name1> ,<col-name2>,<col-name N>
from <tb-name1> 
inner join <tb-name2>
on <tb-name1>.<col-name1> = <tb-name2>.<col-name2>
where <condition>
order by <col-name1>,<col-name2>,<col-name N >

-- another :-

select * 
from <tb-1> inner join <tb-2> on <expression>;


-- EXAMPLE : -

select * 
from product_master pm
inner join sales_order_details sod on sod.product_no = pm.product_no
inner join sales_order so on sod.order_no = so.order_no
inner join client_master cm on so.client_no = cm.client_no;


select description,product_rate 
from product_master pm
inner join sales_order_details sod on sod.product_no = pm.product_no;
-- inner join sales_order so on sod.order_no = so.order_no
-- inner join client_master cm on so.client_no = cm.client_no;


//////////////////////////////////////////////////////////////////////////////////

-- 12-12-24 thu

............................. Group by ........................

-- SYNTAX :-
select agg_function (col_name(s))
From tb-name
where condition
Group by col-name(s)

-- EXAMPLE :-

select city from client_master Group by city;

+-----------+
| city      |
+-----------+
| Mumbai    |
| Madras    |
| Bangalore |
| Mangalore |
+-----------+

select city,max(bal_due) "bal_due" from client_master Group by city;

+-----------+----------+
| city      | bal_due  |
+-----------+----------+
| Mumbai    | 15000.00 |
| Madras    |     0.00 |
| Bangalore |     0.00 |
| Mangalore |     0.00 |
+-----------+----------+

select city,sum(bal_due) "bal_due" from client_master Group by city;

+-----------+----------+
| city      | bal_due  |
+-----------+----------+
| Mumbai    | 22000.00 |
| Madras    |     0.00 |
| Bangalore |     0.00 |
| Mangalore |     0.00 |
+-----------+----------+

select city,sum(bal_due) "bal_due" from client_master
where city = "mumbai" 
 Group by city;


+--------+----------+
| city   | bal_due  |
+--------+----------+
| Mumbai | 22000.00 |
+--------+----------+

select city,max(bal_due) "bal_due" from client_master
where city = "mumbai" 
 Group by city
 having max(bal_due);

+--------+----------+
| city   | bal_due  |
+--------+----------+
| Mumbai | 15000.00 |
+--------+----------+

select city,sum(bal_due) "bal_due" from client_master
where city = "mumbai" 
 Group by city
 having max(bal_due);


+--------+----------+
| city   | bal_due  |
+--------+----------+
| Mumbai | 22000.00 |
+--------+----------+


 update client_master set bal_due = 9500.00 where city = 'Madras';
 update client_master set bal_due = 10500.00 where city = 'Bangalore';
 update client_master set bal_due = 7000.00 where city = 'Mangalore';



select city,sum(bal_due) "bal_due" from client_master
 Group by city
 having sum(bal_due) > 10000;


+-----------+----------+
| city      | bal_due  |
+-----------+----------+
| Mumbai    | 22000.00 |
| Bangalore | 10500.00 |
+-----------+----------+