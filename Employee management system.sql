show databases;
create database zoho;
use zoho;
create table emp_data
(
Emp_ID int,
First_name varchar(50),
Second_name varchar(50),
Salary int,
Email varchar(50),
dept_Id int
);
show tables;

desc emp;

insert into emp_data values (1, 'Arun', 'Raja', 60000, 'arun@gmail.com', 1),
(2, 'Vignesh', 'Kumar', 65000, 'vignesh@gmail.com', 1),
(3, 'Saravanan', 'Murugan', 70000, 'saravanan@gmail.com', 2),
(4, 'Kalyani', 'Deivanai', 72000, 'kalyani@gmail.com', 2),
(5, 'Kannan', 'Sundar', 68000, 'kannan@gmail.com', 3),
(6, 'Chandra', 'Rani', 73000, 'chandra@gmail.com', 3),
(7, 'Murali', 'Velan', 66000, 'murali@gmail.com', 4),
(8, 'Sumitha', 'Chandran', 71000, 'sumitha@gmail.com', 4),
(9, 'Krishna', 'Bala', 64000, 'krishna@gmail.com', 5),
(10, 'Malavika', 'Meenakshi', 69000, 'malavika@gmail.com', 5),
(11, 'Venkat', 'Kesavan', 75000, 'venkat@gmail.com', 6),
(12, 'Sneha', 'Nandini', 77000, 'sneha@gmail.com', 6),
(13, 'Bala', 'Sakthi', 72000, 'bala@gmail.com', 7),
(14, 'Anitha', 'Swathi', 70000, 'anitha@gmail.com', 7),
(15, 'Vignesh', 'Krishnan', 69000, 'vignesh@gmail.com', 8),
(16, 'Manjula', 'Bala', 74000, 'manjula@gmail.com', 8),
(17, 'Kathir', 'Vasanth', 73000, 'kathir@gmail.com', 9),
(18, 'Mohana', 'Sundari', 68000, 'mohana@gmail.com', 9),
(19, 'Manikandan', 'Pandi', 66000, 'manikandan@gmail.com', 10),
(20, 'Sumithra', 'Sanmugam', 71000, 'sumithra@gmail.com', 10),
(21, 'Naveen', 'Arivazhagan', 70000, 'naveen@gmail.com', 1),
(22, 'Tharini', 'Kalpana', 76000, 'tharini@gmail.com', 2),
(23, 'Suresh', 'Aravind', 78000, 'suresh@gmail.com', 3),
(24, 'Pavithra', 'Poorni', 73000, 'pavithra@gmail.com', 4),
(25, 'Karthik', 'Siva', 72000, 'karthik@gmail.com', 5),
(26, 'Shanthi', 'Gowri', 69000, 'shanthi@gmail.com', 6),
(27, 'Pandi', 'Murugan', 71000, 'pandi@gmail.com', 7),
(28, 'Silka', 'Mano', 74000, 'silka@gmail.com', 8),
(29, 'Amit', 'Kumar', 75000, 'amit@gmail.com', 9),
(30, 'Suvana', 'Vinoth', 67000, 'suvana@gmail.com', 10);

select * from emp;

update emp
set first_name = "Raj"
where emp_id = 100;

select first_name from emp where salary = 30000;

select first_name,second_name from emp where salary > 30000;

alter table emp 
rename emp_data;

select * from emp_data;

alter table emp_data
add location varchar(30);

alter table emp_data
add pin varchar(30)
after second_name;

alter table emp_data
add reg_no varchar(30)
first;

update emp_data
set reg_no = 1
where emp_id = 10;

alter table emp_data
drop column location;

drop table emp_data;

truncate table emp_data;

select first_name 
from emp_data
where salary >50000 and dept_id = 2;

select * 
from emp_data
where salary >80000 or dept_id = 2;

select * 
from emp_data  
where not dept_id = 2;

select * from emp_data
where salary between 50000 and 90000;

select * from emp_data where salary in (72000,60000);

select first_name,emp_id from emp_data where first_name like 'b%' ;

alter table emp_data modify first_name varchar(50) not null;

insert into emp_data (salary) values(10000);

alter table emp_data alter second_name  set default "no name";

alter table emp_data add check(salary>20000);

alter table emp_data add primary key(emp_id);

alter table emp_data add unique( first_name);

update emp_data
set first_name ="babu"
where emp_id =2;

alter table emp_data add unique( first_name);

create table student
select * from emp_data;

show full tables;

show table status;

create view emp as
select * from emp_data;

select min(salary)
from emp_data
where dept_id >=2;

select max(salary)
from emp_data;

select sum(salary) from emp_data;

select count(dept_id) total from emp_data
where salary > 70000;

select avg(salary) from emp_data;

alter table emp_data 
add location varchar(50)
after salary ;

select * from emp_data;

update emp_data
set location = "salem"
where dept_id = 1;

update emp_data
set location = "chennai"
where dept_id = 2;

update emp_data
set location = "banglore"
where dept_id = 3;

select location from emp_data
group by location;

select location,emp_id from emp_data
group by location,emp_id
order by dept_id;

select upper(first_name) from emp_data;
select lower(first_name) from emp_data;
select length(first_name) from emp_data;
select instr('sql_class','q') ;
select substr('sql_class',2,5) from emp_data;
select lpad('sql_class','70',"aac") ;
select rpad('sql_class','70',"aac") ;
select concat('sql_class','70',"aac") ;
select rtrim('sql_class      ') ;
select ltrim('     ''sql_class') ;
select replace('sql_class','sql',"aac") ;
select reverse('sql_class') ;
select round(125.22) ;
select mod(125,22) ;
select power(125,22) ;
select ceil(125.22) ;
select floor(125.22) ;
select abs(-125.22) ;
select *, rank() over (order by salary desc) as ranking from emp_data;
select *, dense_rank() over (order by salary desc) as ranking from emp_data;
select *, row_number() over (order by salary desc) as ranking from emp_data;
select max(salary) from emp_data 
where salary <(select max(salary) from emp_data);

SELECT  MAX(salary) AS salary 
FROM emp_data 
WHERE salary <
(SELECT MAX(salary) 
FROM emp_data);

select max(salary) from emp_data;

delimiter //

create procedure babu()
begin
select * from emp_data
where location ='chennai';
end//

delimiter ;
call babu();

delimiter //

create procedure balu(in abc varchar(50))
begin
select * from emp_data
where location = abc;
end//

call balu( 'salem')//

delimiter //

create procedure vetr(in abc varchar(50), in xyz int )
begin
select * from emp_data
where location ='abc' and salary > xyz;
end//

call vetr('salem',8000)//

create procedure vetrii(in abc varchar(50), in xyz int )
begin
select * from emp_data
where location ='abc' and salary > xyz;
end//

delimiter ;