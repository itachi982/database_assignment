alter table trg_emp ADD constraint my_emp_id_pk primary key(ID);

alter table trg_dept ADD constraint my_dept_id_pk primary key(ID);

alter table trg_emp 
	add constraint my_emp_id_fk 
    foreign key (DEPT_ID) references trg_dept(ID) ;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'trg_emp';

desc trg_emp;
desc trg_dept;

alter table trg_emp 
	add COMMISION numeric(2,2),
    add CONSTRAINT my_emp_comm_ck CHECK (commision >=0);
    
