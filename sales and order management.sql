create database Tcl;
use tcl;
create table salesman
( salesman_id int,
  Name varchar(50),
  city varchar(50),
  commission decimal (3,3)
);
INSERT INTO salesman (salesman_id, name, city,commission ) values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);
 select * from salesman;
 
 
 Create table  customer (
    customer_id INT ,
    customer_name Varchar(50),
    city varchar(50),
    grade int,
    salesman_id INT
);
INSERT INTO customer VALUES 
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London',null  , 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

select * from customer;

create table orders (
    order_no int,
    purch_amt Decimal(10, 2),
    order_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orders VALUES 
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

select * from orders;
drop table nobel_win;
create table nobel_win (
    year int ,
    subject varchar(50),
    winner varchar(255) ,
    country varchar(100) ,
    category varchar(50) 
);

insert into  nobel_win  values
(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

select * from nobel_win;

select name,commission from salesman;
select name,city from salesman
where city="paris";

select * from customer
where grade =200;

select order_no,order_date,purch_amt from orders
where salesman_id =5001;

select winner from nobel_win
where year=1971 and subject="literature";

select* from nobel_win
where winner like "louis%";

select * from nobel_win
where (year= 1970 and subject= "physics") or
(year =1971 and subject="economics");

select * from nobel_win
where year=1970 and subject not in ("physiology","economics");

select * from nobel_win
where subject not like "p%%"
order by year desc,winner;

select count(*) from orders
where order_date= "2012-08-17";

select customer_id,order_date,max(purch_amt) from orders
group by customer_id,order_date;

select * from customer
where city= "new york" or grade=100 ;

select *from salesman
where commission between 0.12 and 0.14;

select * from salesman
where name  like "n%%"  "%I%";

select sum(purch_amt) from orders;

select city,max(grade) from customer
group by city;

select customer_id, order_date, max(purch_amt) from orders
group by customer_id, order_date,purch_amt
having purch_amt>2000;

select  count(salesman_id) from orders;

select customer_id,max(purch_amt) from orders
group by customer_id;

select count(*) from orders
where order_date="2012-08-17";

select * from customer
where customer_name like "%%N";

select * from customer 
where grade is null;

select e.customer_name,d.name ,e.city from
customer e,salesman d
where e.city = d.city;

select e.customer_name ,d.name from customer e  ,salesman d
where e.salesman_id = d.salesman_id;

select  o.order_no,e.customer_name,e.customer_id, d.salesman_id from orders o  ,customer e, salesman d
where not e.city=d.city
and o.customer_id =e.customer_id
and o.salesman_id =d.salesman_id;

