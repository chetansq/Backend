-- 23-11-24

-- braces --> () [] {} get details

-- 26-11-24

-- how to Database Design real life example 

-- EXERCISES

-- CLIENT MASTER

 create table CLIENT_MASTER (
CLIENTNO varchar(6),
NAME varchar(20),
ADDRESS1 varchar(30),
ADDRESS2 varchar(30),
CITY varchar(15),
PINCODE varchar(8),
STATE varchar(15),
BALDUE numeric(10,2)
 );

insert into client_master values("C00001","Ivan Bayross","mota varacha","surat","Mumbai","400054","Maharashtra",15000);
insert into client_master values("C00002","Mamta Muzumdar","vijaybger","yogichok","Madras","780001","Tamil Nadu",0);
insert into client_master values("C00003","Chhaya Bankar","gitanger","punagam","Mumbai","400057","Maharashtra",5000);
insert into client_master values("C00004","Ashwini Joshi","shrdha","kamrej","Bangalore","560001","Karnatka",0);
insert into client_master values("C00005","Hansel Colaco","varj bhumi","katargam","Mumbai","400060","Maharashtra",2000);
insert into client_master values("C00006","Deepak Sharma","deepmala","bhutbhvani","Mangalore","560050","Karnatka",0);


--  PRODUCT_MASTER

create table PRODUCT_MASTER (
PRODUCTNO varchar(6),
DESCRIPTION varchar(15),
PROFITPERCENT numeric(4,2),
UNITMEASURE varchar(10),
QTYONHAND numeric(8),
REORDERLVL numeric(8),
SELLPRICE numeric(8,2),
BALDUE numeric(8,2)
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

-- SALESMAN_MASTER

create table SALESMAN_MASTER (
SALESMANNO varchar(6),
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
BALDUE numeric(10,2),

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



|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

--  Select Query :-

3. Exercise on retrieving records from a table

a. Find out the names of all the clients.

==> mysql> select NAME from client_master;
+----------------+
| NAME           |
+----------------+
| Ivan Bayross   |
| Mamta Muzumdar |
| Chhaya Bankar  |
| Ashwini Joshi  |
| Hansel Colaco  |
| Deepak Sharma  |
+----------------+


b. Retrieve the entire contents of the Client Master table.

==> mysql> select * from client_master;
+----------+----------------+--------------+------------+-----------+---------+-------------+----------+
| CLIENTNO | NAME           | ADDRESS1     | ADDRESS2   | CITY      | PINCODE | STATE       | BALDUE   |
+----------+----------------+--------------+------------+-----------+---------+-------------+----------+
| C00001   | Ivan Bayross   | mota varacha | surat      | Mumbai    | 400054  | Maharashtra | 15000.00 |
| C00002   | Mamta Muzumdar | vijaybger    | yogichok   | Madras    | 780001  | Tamil Nadu  |     0.00 |
| C00003   | Chhaya Bankar  | gitanger     | punagam    | Mumbai    | 400057  | Maharashtra |  5000.00 |
| C00004   | Ashwini Joshi  | shrdha       | kamrej     | Bangalore | 560001  | Karnatka    |     0.00 |
| C00005   | Hansel Colaco  | varj bhumi   | katargam   | Mumbai    | 400060  | Maharashtra |  2000.00 |
| C00006   | Deepak Sharma  | deepmala     | bhutbhvani | Mangalore | 560050  | Karnatka    |     0.00 |
+----------+----------------+--------------+------------+-----------+---------+-------------+----------+

c. Retrieve the list of names, city and the sate of all the clients.

==> select NAME,CITY,STATE from client_master;


mysql>  select NAME,CITY,STATE from client_master;
+----------------+-----------+-------------+
| NAME           | CITY      | STATE       |
+----------------+-----------+-------------+
| Ivan Bayross   | Mumbai    | Maharashtra |
| Mamta Muzumdar | Madras    | Tamil Nadu  |
| Chhaya Bankar  | Mumbai    | Maharashtra |
| Ashwini Joshi  | Bangalore | Karnatka    |
| Hansel Colaco  | Mumbai    | Maharashtra |
| Deepak Sharma  | Mangalore | Karnatka    |
+----------------+-----------+-------------+


d. List the various products available from the Product Master table.

==> mysql> select DESCRIPTION from product_master;
+--------------+
| DESCRIPTION  |
+--------------+
| T-Shirt      |
| Shirt        |
| T-Shirt      |
| Cotton Jeans |
| Jeans        |
| Trousers     |
| Pull Overs   |
| Denim Shirts |
| Lycra Tops   |
| Skirts       |
+--------------+


e. List all the clients who are located in Mumbai.

==> mysql> select name,city from client_master where city = "mumbai";
+---------------+--------+
| name          | city   |
+---------------+--------+
| Ivan Bayross  | Mumbai |
| Chhaya Bankar | Mumbai |
| Hansel Colaco | Mumbai |
+---------------+--------+



f. Find the names of salesmen who have a salary equal to Rs.3000.

==>mysql>  select SALESMANNAME,SALAMT from salesman_master where SALAMT = 3000;
+--------------+---------+
| SALESMANNAME | SALAMT  |
+--------------+---------+
| Aman         | 3000.00 |
| Omkar        | 3000.00 |
| Raj          | 3000.00 |
+--------------+---------+


|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


--  Update Query :-


4. Exercise on updating records in a table

a. Change the city of ClientNo 'C00005' to 'Bangalore'.



==> update client_master set CITY = 'Bangalore' where CLIENTNO = 'C00005' ;

mysql> select * from client_master;
+----------+----------------+--------------+------------+-----------+---------+-------------+----------+
| CLIENTNO | NAME           | ADDRESS1     | ADDRESS2   | CITY      | PINCODE | STATE       | BALDUE   |
+----------+----------------+--------------+------------+-----------+---------+-------------+----------+
| C00001   | Ivan Bayross   | mota varacha | surat      | Mumbai    | 400054  | Maharashtra | 15000.00 |
| C00002   | Mamta Muzumdar | vijaybger    | yogichok   | Madras    | 780001  | Tamil Nadu  |     0.00 |
| C00003   | Chhaya Bankar  | gitanger     | punagam    | Mumbai    | 400057  | Maharashtra |  5000.00 |
| C00004   | Ashwini Joshi  | shrdha       | kamrej     | Bangalore | 560001  | Karnatka    |     0.00 |
| C00005   | Hansel Colaco  | varj bhumi   | katargam   | Bangalore | 400060  | Maharashtra |  2000.00 |
| C00006   | Deepak Sharma  | deepmala     | bhutbhvani | Bangalore | 560050  | Karnatka    |     0.00 |
+----------+----------------+--------------+------------+-----------+---------+-------------+----------+


b. Change the BalDue of ClientNo 'C00001' to Rs. 1000. 

==> update client_master set BALDUE = 1000 where CLIENTNO = 'C00001' ;

mysql> select * from client_master;
+----------+----------------+--------------+------------+-----------+---------+-------------+---------+
| CLIENTNO | NAME           | ADDRESS1     | ADDRESS2   | CITY      | PINCODE | STATE       | BALDUE  |
+----------+----------------+--------------+------------+-----------+---------+-------------+---------+
| C00001   | Ivan Bayross   | mota varacha | surat      | Mumbai    | 400054  | Maharashtra | 1000.00 |
| C00002   | Mamta Muzumdar | vijaybger    | yogichok   | Madras    | 780001  | Tamil Nadu  |    0.00 |
| C00003   | Chhaya Bankar  | gitanger     | punagam    | Mumbai    | 400057  | Maharashtra | 5000.00 |
| C00004   | Ashwini Joshi  | shrdha       | kamrej     | Bangalore | 560001  | Karnatka    |    0.00 |
| C00005   | Hansel Colaco  | varj bhumi   | katargam   | Bangalore | 400060  | Maharashtra | 2000.00 |
| C00006   | Deepak Sharma  | deepmala     | bhutbhvani | Bangalore | 560050  | Karnatka    |    0.00 |
+----------+----------------+--------------+------------+-----------+---------+-------------+---------+


c. Change the cost price of Trousers to Rs. 950.00. 

==>  update product_master set SELLPRICE = 950.00 where DESCRIPTION = 'Trousers';

| P07868    | Trousers     |          2.00 | Piece       |       150 |         50 |    950.00 | 550.00 |

d. Change the city of the salesman to Pune.

==> update salesman_master set CITY = 'PUNE' where CITY = 'Mumbai'; 


mysql> select * from salesman_master;
+------------+--------------+----------+----------+------+---------+-------------+---------+----------+----------+---------+
| SALESMANNO | SALESMANNAME | ADDRESS1 | ADDRESS2 | CITY | PINCODE | STATE       | SALAMT  | TGTTOGET | YTDSALES | REMARKS |
+------------+--------------+----------+----------+------+---------+-------------+---------+----------+----------+---------+
| S00001     | Aman         | A/14     | Wordi    | PUNE | 400002  | Maharashtra | 3000.00 |   100.00 |    50.00 | Good    |
| S00002     | Omkar        | 65       | Nariman  | PUNE | 400001  | Maharashtra | 3000.00 |   100.00 |   100.00 | Good    |
| S00003     | Raj          | P-7      | Bandra   | PUNE | 400032  | Maharashtra | 3000.00 |   200.00 |   100.00 | Good    |
| S00004     | Ashish       | A/5      | Juhu     | PUNE | 400044  | Maharashtra | 3500.00 |   200.00 |   150.00 | Good    |
+------------+--------------+----------+----------+------+---------+-------------+---------+----------+----------+---------+




|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-- Delete Records

5. Exercise on deleting records in a table


a. Delete all salesmen from the Salesman_Master whose salaries are equal to Rs. 3500.

==> delete from salesman_master where SALAMT = 3500;


mysql> select * from salesman_master;
+------------+--------------+----------+----------+------+---------+-------------+---------+----------+----------+---------+
| SALESMANNO | SALESMANNAME | ADDRESS1 | ADDRESS2 | CITY | PINCODE | STATE       | SALAMT  | TGTTOGET | YTDSALES | REMARKS |
+------------+--------------+----------+----------+------+---------+-------------+---------+----------+----------+---------+
| S00001     | Aman         | A/14     | Wordi    | PUNE | 400002  | Maharashtra | 3000.00 |   100.00 |    50.00 | Good    |
| S00002     | Omkar        | 65       | Nariman  | PUNE | 400001  | Maharashtra | 3000.00 |   100.00 |   100.00 | Good    |
| S00003     | Raj          | P-7      | Bandra   | PUNE | 400032  | Maharashtra | 3000.00 |   200.00 |   100.00 | Good    |
+------------+--------------+----------+----------+------+---------+-------------+---------+----------+----------+---------+

b.Delete all products from Product_Master where the quantity on hand is equal to 100.

==>   delete from product_master where QTYONHAND = 100;

 mysql> select * from product_master;
+-----------+-------------+---------------+-------------+-----------+------------+-----------+--------+
| PRODUCTNO | DESCRIPTION | PROFITPERCENT | UNITMEASURE | QTYONHAND | REORDERLVL | SELLPRICE | BALDUE |
+-----------+-------------+---------------+-------------+-----------+------------+-----------+--------+
| P00001    | T-Shirt     |          5.00 | Piece       |       200 |         50 |    350.00 | 250.00 |
| P0345     | Shirt       |          6.00 | Piece       |       150 |         50 |    500.00 | 350.00 |
| P03453    | T-Shirt     |          5.00 | Piece       |       250 |         50 |    500.00 | 350.00 |
| P07868    | Trousers    |          2.00 | Piece       |       150 |         50 |    950.00 | 550.00 |
| P07885    | Pull Overs  |          2.50 | Piece       |        80 |         30 |    700.00 | 450.00 |
| P07975    | Lycra Tops  |          5.00 | Piece       |        70 |         30 |    300.00 | 175.00 |
| P08865    | Skirts      |          5.00 | Piece       |        75 |         30 |    450.00 | 300.00 |
+-----------+-------------+---------------+-------------+-----------+------------+-----------+--------+

c.Delete from Client Master where the column state holds the value 'Tamil Nadu'.

==> delete from client_master where STATE = 'TAmil Nadu';

mysql> select * from client_master;
+----------+---------------+--------------+------------+-----------+---------+-------------+---------+
| CLIENTNO | NAME          | ADDRESS1     | ADDRESS2   | CITY      | PINCODE | STATE       | BALDUE  |
+----------+---------------+--------------+------------+-----------+---------+-------------+---------+
| C00001   | Ivan Bayross  | mota varacha | surat      | Mumbai    | 400054  | Maharashtra | 1000.00 |
| C00003   | Chhaya Bankar | gitanger     | punagam    | Mumbai    | 400057  | Maharashtra | 5000.00 |
| C00004   | Ashwini Joshi | shrdha       | kamrej     | Bangalore | 560001  | Karnatka    |    0.00 |
| C00005   | Hansel Colaco | varj bhumi   | katargam   | Bangalore | 400060  | Maharashtra | 2000.00 |
| C00006   | Deepak Sharma | deepmala     | bhutbhvani | Bangalore | 560050  | Karnatka    |    0.00 |
+----------+---------------+--------------+------------+-----------+---------+-------------+---------+      


////////////////////////////////////////////////////////////////////////////////


create database exercises2

-- CLIENT_MASTER

 create table CLIENT_MASTER (
clientNo varchar(6) primary key,
name varchar(20),
address1 varchar(30),
address2 varchar(30),
city varchar(15),
pincode varchar(8),
state varchar(15),
baldu numeric(10,2),
check (clientNo like 'C%')
 );

 insert into client_master values("C00001","Ivan Bayross","mota varacha","surat","Mumbai","400054","Maharashtra",15000);
insert into client_master values("C00002","Mamta Muzumdar","vijaybger","yogichok","Madras","780001","Tamil Nadu",0);
insert into client_master values("C00003","Chhaya Bankar","gitanger","punagam","Mumbai","400057","Maharashtra",5000);
insert into client_master values("C00004","Ashwini Joshi","shrdha","kamrej","Bangalore","560001","Karnatka",0);
insert into client_master values("C00005","Hansel Colaco","varj bhumi","katargam","Mumbai","400060","Maharashtra",2000);
insert into client_master values("C00006","Deepak Sharma","deepmala","bhutbhvani","Mangalore","560050","Karnatka",0);

-- Error

mysql> insert into client_master values("100007","Deepak Sharma","deepmala","bhutbhvani","Mangalore","560050","Karnatka",0);
ERROR 3819 (HY000): Check constraint 'client_master_chk_1' is violated.
mysql> insert into client_master values("p00007","Deepak Sharma","deepmala","bhutbhvani","Mangalore","560050","Karnatka",0);
ERROR 3819 (HY000): Check constraint 'client_master_chk_1' is violated.

mysql> insert into client_master values("c00007","Deepak Sharma","deepmala","bhutbhvani","Mangalore","560050","Karnatka",0);
Query OK, 1 row affected (0.01 sec)


--  PRODUCT_MASTER

create table PRODUCT_MASTER (
productNo varchar(6),
description varchar(15),
profitprecent numeric(4,2),
unitmeasure varchar(10),
qtyonhand numeric(8),
reorderlvl numeric(8),
sellprice numeric(8,2),
baldue numeric(8,2),
check (productNo like "P%"),
check(sellprice > 0),
check(baldue > 0)
 );

 insert into product_master values("P00001","T-Shirt",5,"Piece",200,50,350,250);
  insert into product_master values("P0345","Shirt",6,"Piece",150,50,500,350);
  insert into product_master values("P03453","T-Shirt",5,"Piece",250,50,500,350);
  insert into product_master values("P06734","Cotton Jeans",5,"Piece",100,20,600,450);

-- Error

  mysql>   insert into product_master values("P06734","Cotton Jeans",5,"Piece",100,20,0,70);
ERROR 3819 (HY000): Check constraint 'product_master_chk_2' is violated.
mysql>   insert into product_master values("P06734","Cotton Jeans",5,"Piece",100,20,0,0);
ERROR 3819 (HY000): Check constraint 'product_master_chk_2' is violated.
mysql>   insert into product_master values("P06745","Cotton Jeans",5,"Piece",100,20,0,0);
ERROR 3819 (HY000): Check constraint 'product_master_chk_2' is violated.

mysql>   insert into product_master values("P06745","Cotton Jeans",5,"Piece",100,20,560,80);
