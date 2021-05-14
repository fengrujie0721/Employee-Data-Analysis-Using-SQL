-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar(25)   NOT NULL,
    "dept_name" varchar(25)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(25)   NOT NULL,
    "title" varchar(25)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(25)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(25)   NOT NULL,
    "last_name" varchar(25)   NOT NULL,
    "sex" varchar(25)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(25)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(25)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

select * from "departments";
select * from "titles";
select * from "employees";
select * from "salaries";
select * from "dept_emp";
select * from "dept_manager";

select employees.emp_no as "employee number",employees.last_name,employees.first_name,employees.sex,salaries.salary 
from employees
join salaries
on employees.emp_no=salaries.emp_no;

select first_name,last_name,hire_date
from employees
where 
extract(year from hire_date )='1986';

select dept_manager.dept_no as "department number", departments.dept_name as "department name",dept_manager.emp_no as "manager's employee number",employees.last_name,employees.first_name
from dept_manager
join departments
on dept_manager.dept_no=departments.dept_no
join employees
on dept_manager.emp_no=employees.emp_no;

select dept_emp.emp_no as "employee number",employees.last_name,employees.first_name,departments.dept_name as "department name"
from dept_emp
join employees
on dept_emp.emp_no=employees.emp_no
join departments
on dept_emp.dept_no=departments.dept_no;

select first_name,last_name,sex
from employees
where first_name ='Hercules'
and last_name like 'B%';

select dept_emp.emp_no as "employee number",employees.first_name,employees.last_name,departments.dept_name as "department name"
from departments
inner join dept_emp
on (departments.dept_no=dept_emp.dept_no)
inner join employees
on (employees.emp_no=dept_emp.emp_no)
where dept_name='Sales';

select dept_emp.emp_no as "employee number",employees.first_name,employees.last_name,departments.dept_name as "department name"
from departments
inner join dept_emp
on (departments.dept_no=dept_emp.dept_no)
inner join employees
on (employees.emp_no=dept_emp.emp_no)
where dept_name='Sales' or dept_name='Development';

select last_name,count(last_name) as "count of last_name"
from employees
group by last_name
order by count(last_name) DESC;




