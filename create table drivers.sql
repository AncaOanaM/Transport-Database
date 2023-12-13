drop table if exists drivers
go
create table drivers
					(IdDriver tinyint primary key not null,
					 FirstName varchar(100) not null,
					 LastName varchar(50) not null,
					 Adress varchar(50) null,
					 PhoneNumber varchar(15) null)
go
insert into drivers(IdDriver,FirstName,LastName,Adress,PhoneNumber) values 
(1,'Adam','Paul','Brasov','+40724123456'),
(2,'Taus','Gabriel','Brasov','+40724589500'),
(3,'Mirita','Ecaterina','Ghimbav','+40724123800'),
(4,'Ardeleanu','Mihai','Codlea','+40724123777'),
(5,'Suteu','Marius','Brasov','+40724523989'),
(6,'Popescu','Ghiocel','Harman','+40724862100'),
(7,'Florescu','Robert','Prejmer','+40724523998'),
(8,'Nastase','Valentin','Brasov','+40724123202'),
(9,'Macovei','Cristina','Sacele','+40724123333'),
(10,'Mihalache','Nicolae','Brasov','+40724123408'),
(11,'Cramer','Iliana','Prejmer','+40724123401'),
(12,'Olariu','Dorin','Harman','+40724123474'),
(13,'Constantinescu','Dorian','Predeal','+40724800900'),
(14,'Corozanu','Aexandru','Ghimbav','+40749800200'),
(15,'Angheluta','Mircea','Prejmer','+40752300689'),
(16,'Pascu','Stefan','Fagaras','+40724879878'),
(17,'Coroiu','Marcel','Brasov','+40723520520'),
(18,'Dragomir','Cristian','Teliu','+20724523777'),
(19,'Precu','Calin','Stupini','+40724123505'),
(20,'Zaran','Mihail','Brasov','+4072505050')
