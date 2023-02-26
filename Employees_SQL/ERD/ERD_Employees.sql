-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "employee_no" INTEGER   NOT NULL,
    "employee_title" VARCHAR(30)   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Dept_Employees" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "employee_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Employees" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Managers" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "employee_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Managers" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Salaries" (
    "employee_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "employee_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_employee_title" FOREIGN KEY("employee_title")
REFERENCES "Titles" ("title");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employees" ("employee_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employees" ("employee_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employees" ("employee_no");

