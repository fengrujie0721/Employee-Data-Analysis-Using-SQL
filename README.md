# SQL-Challenge

A research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.
Design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, perform:


Data Engineering


Data Analysis


Inspect the CSVs and sketch out an ERD of the tables. 


![image](https://user-images.githubusercontent.com/79819331/120353166-7ad91d00-c2cf-11eb-8238-86afa15e6c07.png)

Employee SQL ERD


Create a table schema for each of the six CSV files.


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



List the following details of each employee: employee number, last name, first name, sex, and salary.



![image](https://user-images.githubusercontent.com/79819331/120354557-86791380-c2d0-11eb-86c2-109e340751be.png)


List first name, last name, and hire date for employees who were hired in 1986.


![image](https://user-images.githubusercontent.com/79819331/120355344-39497180-c2d1-11eb-83b3-8305705bdb76.png)


List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

![image](https://user-images.githubusercontent.com/79819331/120355676-79105900-c2d1-11eb-9082-21a8654fb89b.png)




