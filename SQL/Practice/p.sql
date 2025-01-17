
create table customer
	(WordAlias	varchar(50),
	WordSerial	tinyint,
	PartsOfSpeech	varchar(30),
	Meaning		varchar(1000),
	UseInSentence	varchar(200),
	BPron		varchar(30),
	BAntonym	varchar(100),
	EngMeaning	varchar(),
	primary key(customer_name)
	);

insert into customer
	(customer_name, customer_street, customer_city)
	values ('Atique', 'University_of_Dhaka', 'Dhaka');

alter table customer drop column cusomer_name;

alter table customer add column customer_name char(20);

-- inserted all data and created tables using script



-- Find the name, street and city of the customer whose account number is A-102
-- ==============================================================

select * 
	from customer, depositor
	where account_no='A-102';

select * 
	from customer, depositor
	where account_no='A-102' and customer.customer_name=depositor.customer_name;

select customer.customer_name, customer_street, customer_city
	from customer, depositor
	where account_no='A-102' and customer.customer_name=depositor.customer_name;

-- Find customer names who have account in the bank
-- ===========================================
select customer_name
	from depositor;

To eliminate duplicate entries:
select distinct customer_name
	from depositor;

-- Find customer names who have loans in the bank
-- ===========================================
select customer_name
	from borrower;

-- Find all customer names who have account or loan or both in the bank
-- ================================================================
(select customer_name
	from depositor)
union
(select customer_name
	from borrower);

Include duplicates,
(select customer_name
	from depositor)
union all
(select customer_name
	from borrower);

-- Find all customer names who have both account and loan in the bank
-- ================================================================
select distinct depositor.customer_name
	from depositor, borrower
	where depositor.customer_name = borrower.customer_name;

-- select tuples from loan relation whose branch is Perryridge
-- ============================================
select *
	from loan;

select *
	from loan
	where branch_name = 'Perryridge';

-- Find customer name who has accounts in the bank but does not have  a loan in the bank
-- ==================================================================
(select distinct customer_name
	from depositor)
minus
(select customer_name
	from borrower);


-- List all loan numbers and amounts of loan
-- ================================
select loan_no, amount
	from loan;


-- Find all customer name whose city is Harrison
-- ===================================
select *
	from customer;

select *
	from customer
	where customer_city = 'Harrison';

-- Find average account balances in Perryridge branch from account relation
-- ========================================================
select avg(balance)
	from account
	where branch_name='Perryridge';

-- inserting a new record into account table
-- =========================================
insert into account
    (account_no, branch_name, balance)
    values('A-420', 'Perryridge', 500);

or

insert into account
    values('A-420', 'Perryridge', 500);

-- deleting a record from account table
-- ====================================
delete from account
	where account_no = 'A-420';

-- Find the branch which has lowest asset to fire out
-- ======================================
select min(assets)
	from branch;

select max(assets)
	from branch;

insert into branch
	values('ARstall', 'Dhaka', '9000000');

select max(assets)
	from branch;
max shows only one output even if more than one tuple has max

delete from branch
	where branch_name='ARstall';

also show branch name
select branch_name
from (select max(assets)
	from branch) as max;


-- Find the branches who have assets at least more than one branch located in Brooklyn
-- ==========================================================
select T.branch_name, T.assets
	from branch as T, branch as S
	where T.assets > S.assets and S.branch_city='Brooklyn';

using set comparison

select branch_name, assets
	from branch
	where assets> some (select assets
		from branch
		where branch_name='Brooklyn');


-- Find customers who live in customer street where their names *a*n*
-- ===================================================

select customer_name, customer_street
	from customer
	where customer_street like '%a%n%';

-- Find customer whose customer street names have exactly 4 characters
-- =====================================================

select customer_name, customer_street
	from customer
	where customer_street like '____';


-- Find the customers who have both loan and account in the Downtown branch
-- ==========================================================

(select distinct customer_name
	from account, depositor
	where account.account_no = depositor.account_no and branch_name='Perryridge')
union
(select distinct customer_name
	from loan, borrower
	where loan.loan_no = borrower.loan_no and branch_name = 'Perryridge')

select *
	from loan
	order by amount desc, loan_no asc;

same to

select *
	from loan
	order by amount desc, loan_no;


select branch_name, max(balance)
	from account
	group by branch_name;

-- Find the number of depositors in each branch
-- ==================================

Find depositors in each branch grouped
select customer_name, branch_name
	from account, depositor
	where depositor.account_no = account.account_no
	group by branch_name;

select branch_name, count(distinct customer_name)
	from account, depositor
	where (customer_name, branch_name) in
	(select customer_name, branch_name
		from account, depositor
		where depositor.account_no = account.account_no
		group by branch_name)
	group by branch_name;

-- Find the average balance in each branch
-- ==================================
select branch_name, avg(balance)
	from account
	group by branch_name;

-- count the depositors in each branch
-- ============================
select branch_name, count(distinct customer_name)
	from account, depositor
	where account.account_no= depositor.account_no
	group by branch_name;


-- find the branches who have average balance more than 500
-- =============================================
select branch_name, avg(balance)
	from account
	group by branch_name
	having avg(balance) > 500;

-- count the number of tuples in customer
-- ==============================
select count(*)
	from customer;

Find the average balance of customers who has accounts in Brighton
-- ==================================================
select customer_name, avg(balance)
	from account, depositor
	where account.account_no = depositor.account_no and branch_name = 'Brighton'
	group by customer_name;

select customer_name
	from customer
	where customer.customer_city = 'Harrison';


select customer.customer_name, avg(balance)
	from customer, depositor, account
	where customer.customer_name=depositor.customer_name and
		account.account_no=depositor.account_no and
		customer.customer_city = 'Harrison'
	group by customer_name
	having count(distinct depositor.account_no) > 2;


-- Find the loan_no which does have amounts
-- ================================
select loan_no
	from loan
	where amount is not null;

-- Arrange in assending, descending..
-- ==========================
select branch_name, balance, account_no
	from account
	order by balance, account_no;

-- Find the maximum balances of branches
-- ==============================
select branch_name, max(balance)
	from account
	group by branch_name;

-- Find the branch with maximum balance
-- =============================
select branch_name, assets
	from branch
	where assets in (select max(assets)
			from branch);

select branch_name, assets
	from branch
	having assets>= all (select assets
		from branch);

select branch_name, assets
	from branch
	where assets = (select max(assets)
		from branch);

-- Find the customers who have both loans and account in the bank
-- ================================================
select customer_name
	from depositor
	where customer_name in
		(select customer_name
		from borrower);

-- Find the customers who have accounts but no loans in the bank
-- ================================================
select distinct customer_name
	from depositor
	where customer_name not in
		(select customer_name
		from borrower);

-- Find all customers who have both loans and accounts in Perryridge branch
-- =======================================================
Find the depositors who have loans in Perryridge branch
select customer_name
	from account, depositor
	where account.account_no=depositor.account_no and
	branch_name = 'Perryridge';

Find the depositors who have loans in Perryridge branch
select customer_name
	from loan, borrower
	where loan.loan_no=borrower.loan_no and
	branch_name = 'Perryridge';

set intersection
select customer_name
	from account, depositor
	where account.account_no=depositor.account_no and
	branch_name = 'Perryridge' and customer_name in (select customer_name
		from loan, borrower
		where loan.loan_no=borrower.loan_no and
		branch_name = 'Perryridge');

select distinct customer_name
	from account, depositor
	where account.account_no = depositor.account_no and
	customer_name not in ('Hayes', 'Blair');

-- creating view with all customers who have account or loan in the bank
-- ====================================================
create view all_customer as
	(select customer_name
		from depositor)
	union (select customer_name
		from borrower);

-- To see details no a view
-- ====================
desc viewName;

select customer_name
	from all_customer;

-- delete view all_customer
-- ===================
drop view all_customer;

select d_CN
	from (depositor left outer join borrower
	on depositor.customer_name=borrower.customer_name)
	as db1 (d_CN, account_no, b_CN, loan_no)
where b_CN is null;

create table worker(
	worker_id int(10) not null,
	worker_name varchar(20),
	hourly_wage float(5,2),
	skill_type varchar(25),
	constraint w_pk primary key (worker_id),
	constraint hw_chk check (hourly_wage>10)
	);


create table building (
	building_id int(10) not null,
	address varchar(50) not null,
	building_type varchar(15) not null,
	constraint b_pk primary key (building_id)
	);

alter table building modify column building_id varchar(10) not null;

create table assignment (
	worker_id int(10) not null,
	building_id int(10) not null,
	start_date date,
	constraint w_fk foreign key (worker_id) references worker(worker_id),
	constraint b_fk foreign key (building_id) references building(building_id)
	);

alter table assignment modify column building_id varchar(10) not null;

insert into worker
	values(1, 'Moznu', 20, 'Farmer');
insert into worker
	values(2, 'Karim', 25, 'Drawing');
insert into worker
	values(3, 'Dirham', 30, 'Carpenter');
insert into worker
	values(4, 'Laili', 25, 'Embroidary');
insert into worker
	values(5, 'Badhon', 50, 'Artist');


insert into building
	values('B101', '23/1 Motijheel', 'Hospital');
insert into building
	values('B102', '123/1/1 Rajabazar', 'Warehouse');
insert into building
	values('B103', '100 GPO', 'Office');
insert into building
	values('B104', '24/1 Motijheel', 'Hospital');
insert into building
	values('B105', '25/1 Gulistan', 'Hospital');


insert into assignment
	values('1', 'B101', '1999-12-10');
insert into assignment
	values('2', 'B102', '2000-12-10');
insert into assignment
	values('3', 'B105', '1998-11-10');
insert into assignment
	values('4', 'B103', '1999-01-10');
insert into assignment
	values('5', 'B104', '2001-01-10');

select skill_type
	from worker natural join assignment
	where worker.worker_id = assignment.worker_id and
	building_id='B102';

-- Natural join automatically matches the primary key if available
-- ===========================================
select *
	from worker natural join assignment
	where worker.worker_id = assignment.worker_id;

select *
	from worker, assignment
	where worker.worker_id = assignment.worker_id;

-- Find the branch that has the highest average balance
-- =========================================
select branch_name, avg(balance)
	from account
	group by branch_name;


select branch_name, avg(balance)
	from account
	group by branch_name
	having avg(balance) >= all (select avg(balance)
		from account
		group by branch_name);


-- create view with the average loan amount in each branch along with the branch_name
create view avgloan as
	select branch_name, avg(amount) as avg_amount
	from loan
	group by branch_name;

select * from avgloan;

-- Now find the branch having max amount
select branch_name
	from avgloan
	where avg_amount = (select max(avg_amount)
		from avgloan);

-- How to know the name of database which I'm using?

-- create table visitor
-- =====================
create table bvisitor
	(userid varchar(30) not null,
	userfullname varchar(120) not null,
	useremail varchar(120) not null,
	totpageload int default 0,
	unipageload int default 0,
	cookie char(100),
	primary key(userid)
	);
