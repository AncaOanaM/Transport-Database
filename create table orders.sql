drop table if exists orders
go

create table orders
					(Idorder smallint primary key not null,
					 IdCustomer smallint references customers(IdCustomer) not null,
					 OrderDate date not null,
					 StartLocation varchar(50) not null,
					 ShipmentDate datetime not null,
					 EndLocation varchar(50) not null,
					 EstimatedDeliveryTime datetime not null,
					 OrderStatus varchar(20) null)
go
insert into orders(Idorder,IdCustomer,OrderDate,StartLocation,ShipmentDate,EndLocation,EstimatedDeliveryTime) values 
(1,5,'2023-11-30','Bistrita','2023-12-01 10:00:00','Bucuresti','2023-12-01 18:00:00'),
(2,3,'2023-11-25','Sofia','2023-11-27 08:00:00','Londra','2023-11-28 19:00:00'),
(3,1,'2023-11-20','Brasov','2023-11-25 14:00:00','Iasi','2023-11-25 19:30:00'),
(4,2,'2023-11-30','Brasov','2023-12-01 15:00:00','Bucuresti','2023-12-01 18:00:00'),
(5,15,'2023-11-28','Paulesti','2023-11-29 08:00:00','Leuven','2023-11-30 15:00:00'),
(6,17,'2023-11-30','Cluj-Napoca','2023-12-01 09:00:01','Bucuresti','2023-12-01 18:00:00'),
(7,6,'2023-11-30','Buzau','2023-12-01 15:00:01','Bucuresti','2023-12-01 16:30:00')

