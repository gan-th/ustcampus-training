alter table employees alter column name varchar(50) NOT NULL;

alter table employees add constraint UQ_Employee_Name UNIQUE(name);

SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT name AS TableName, create_date, modify_date
FROM sys.tables
ORDER BY name;

Select e.name, d.department_name from employees e left join departments d on e.department=d.department_id;
select d.department_name from departments d where department_id not in (select department from employees);

select department, sum(salary ) as total_sal from employees group by department having sum(salary)>2000;
select  d.department_name , count(*) as Employee_count from employees e join departments d  on e.department=d.department_id
group by d.department_name;

select name, salary from employees where salary>(select sum(salary)/count(*) from employees);
(select sum(salary)/count(*) from employees);
select avg(salary) from employees;

select top 1 d.department_name, sum(e.salary)as total_sal from employees e inner join departments d 
on e.department = d.department_id group by d.department_name 
order by total_sal DESC;

SELECT NAME, DEPARTMENT FROM EMPLOYEES WHERE DEPARTMENT IN (1,2);

select department_name from departments d where exists(select 1 from employees e where e.department=d.department_id);