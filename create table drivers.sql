drop table if exists drivers
go
create table drivers
					(IdDriver tinyint primary key not null,
					 FirstName varchar(100) not null,
					 LastName varchar(50) not null,
					 Adress int references city(IdCity) not null,
					 PhoneNumber varchar(15) null)
go
insert into drivers(IdDriver,FirstName,LastName,Adress,PhoneNumber) values 
(1,'Adam','Paul',11,'+40724123456'),
(2,'Taus','Gabriel',11,'+40724589500'),
(3,'Mirita','Ecaterina',16,'+40724123800'),
(4,'Ardeleanu','Mihai',16,'+40724123777'),
(5,'Suteu','Marius',11,'+40724523989')
(6,'Popescu','Ghiocel',11,'+40724862100'),
(7,'Florescu','Robert',11,'+40724523998'),
(8,'Nastase','Valentin',11,'+40724123202')
