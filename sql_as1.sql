use FMS;

desc passenger;
select * from passenger;

desc flight;
select * from flight;


desc booking;
select * from booking;

create table Booking_details(
	Booking_id varchar(15),
    passenger_id varchar(15),
    constraint fk_bid foreign key(Booking_id) references booking(id),
    constraint fk_Pid foreign key(passenger_id) references passenger(id)
);

insert into booking_details(booking_id, passenger_id)
values("B0001", "P0001"), ("B0001", "P0002"), ("B0001", "P0003"),
("B0002", "P0004"), ("B0002", "P0005"), ("B0003", "P0006"), ("B0003", "P0001"),
("B0004", "P0002"), ("B0005", "P0003");

#Query1
select*from passenger;
select name from passenger
where name like"_e%";

#query2
select name from passenger
order by dob desc
limit 1;

#Query3
show tables;
select count(*) from flight
where flight_source="Kolkata";

#Query4

select p.name from booking_details bd
join passenger p on p.id=bd.passenger_id
group by p.id
having count(booking_id) > 1;