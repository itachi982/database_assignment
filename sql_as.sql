use HMS; 

select*from doctor_master;
insert into doctor_master(doctor_id, doctor_name, dept)
values("D0006", "Nethra", "Surgery");
select*from doctor_master;


desc room_master;
select*from room_master;

desc patient_master;
select * from patient_master;

insert into patient_master(pid, pname, age, weight, gender, address, phoneno, disease, Doctor_id)
values("P0001", "Gita", 35, 65, "F", "Chennai", "9867145678", "Eye infection", "D0003"),
("P0002", "Ashish", 40,  70, "M", "Delhi", "9845675678", "Asthma", "D0003"),
("P0003", "Radha", 25, 60, "F", "Chennai", "9867166678", "Pain in heart", "D0003");

insert into patient_master(pid, pname, age, weight, gender, address, phoneno, disease, Doctor_id)
values("P0004", "Chandra", 28, 55, "F", "Bangalore", "9978675567", "Asthma", "D0001"),
("P0005", "Goyal", 42, 65, "M", "Delhi", "8967533223", "Pain in stomach", "D0004");

select*from patient_master;

drop table room_allocation;
create table room_allocation(
	room_no varchar(15) not null,
    pid varchar(15),
    admission_date date not null,
    release_date date,
    constraint fk_rNo foreign key(room_no) references room_master(room_no),
    constraint fk_pid1 foreign key(pid) references patient_master(pid)
    );
desc room_allocation;

insert into room_allocation(room_no, pid, admission_date, release_date)
values("R0001", "P0001", "2016-10-15", "2016-10-26");
    
 insert into room_allocation(room_no, pid, admission_date, release_date)
 values("R0002", "P0002", "2016-11-15", "2016-11-26"),("R0002", "P0003", "2016-12-01", "2016-12-30"),
 ("R0004", "P0001", "2017-01-17", "2017-01-30");
    
select*from room_allocation;


# QUERIES

select p.pname from patient_master p
join room_allocation r on p.pid=r.pid
where month(admission_date) = 01;

select pname from patient_master
where gender="F" and disease!="Asthma";

select gender, count(*) from patient_master
group by gender;

show tables;
select p.pid, r.room_type, p.pname, d.doctor_id, d.doctor_name, r.room_no, rA.admission_date from doctor_master d
join patient_master p on d.doctor_id=p.doctor_id
join room_allocation rA on rA.pid=p.pid
join room_master r on rA.room_no=r.room_no;




