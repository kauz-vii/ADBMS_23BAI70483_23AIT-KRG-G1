-- MEDIUM LEVEL

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

select d1.dept_name,e1.name, e1.salary
from employee e1
inner join department d1
on e1.department_id=d1.id
where salary in (
select max(salary)
from employee e
inner join department d
on e.department_id=d.id
group by d.id
)
order by d1.id;



-- HARD LEVEL


create table A(
    id int, 
    ename varchar(5), 
    salary int); 
create table B(
    id int, 
    ename varchar(5), 
    salary int); 
insert into A values
(1,'AA',1000),
(2,'BB',300);
insert into B values
(2,'BB',400),
(3,'CC',100);


select * from A; select * from B; 

select empid,ename, min(salary) as salary
from(
select * from A
union all
select * from B) as c1
group by empid,ename;

--another way

select id, min(ename), Min(salary) as salary
from (
    select id, ename, salary from A
    union
    select id, ename, salary from B
) as combined
group by id;