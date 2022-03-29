create table TRG_DEPT (
	ID INT(7),
    NAME VARCHAR(25)
);
desc TRG_DEPT;

alter table trg_dept 
add LAST_NAME varchar(25),
ADD FIRST_NAME varchar(25);
alter table trg_dept rename trg_emp;
desc trg_emp;

alter table trg_emp modify LAST_NAME VARCHAR(40);
desc trg_emp;

CREATE TABLE TRG_EMPLOYEES AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

ALTER table trg_employees RENAME column EMPLOYEE_ID to ID;

ALTER table trg_employees RENAME column DEPARTMENT_ID to DEPT_ID;
desc trg_employees;

drop table trg_emp;

alter table TRG_EMPLOYEES rename TRG_EMP;

alter table TRG_EMP drop column FIRST_NAME;
desc trg_emp;
