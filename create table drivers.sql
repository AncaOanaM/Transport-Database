use shipment
go

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
(8,'Nastase','Valentin',11,'+40724123202'),
(9,'Bunea','Viorel',11,'+4072666779'),
(10,'Condei','Mircea',11,'+40721243202'),
(11,'Bulgarea','Costin',11,'+4079822174'),
(12,'Moise','Dorin',11,'+40745676878'),
(13,'Noro','Vasi',11,'+4072999555'),
(14,'Matic','Constantin',11,'+4073555666'),
(15,'Olimpus','George',11,'+40765444333'),
(16,'Grigore','Mihai',11,'+40754666555'),
(17,'Diamandi','Octavian',11,'+4074566777'),
(18,'Dumitru','Ion',11,'+407876354')
