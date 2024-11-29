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



