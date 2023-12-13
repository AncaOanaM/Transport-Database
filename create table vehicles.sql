drop table if exists vehicles
go
create table vehicles
					(IdVehicle smallint primary key not null,
					 VehicleType varchar(100) not null,
					 VehicleStatus varchar(50) null,
					 CurrentLocation varchar(50) null,
					 PurchaseDate date null)
go
insert into vehicles(IdVehicle,VehicleType,PurchaseDate) values 
(1,'Sprinter','2021-12-05'),
(2,'Sprinter','2018-12-31'),
(3,'Sprinter','2021-01-01'),
(4,'Sprinter','2023-01-03'),
(5,'Sprinter','2020-02-03'),
(6,'Sprinter','2017-12-31'),
(7,'Sprinter','2018-12-12'),
(8,'Van','2022-01-02'),
(9,'Van','2023-02-02'),
(10,'Van','2023-01-03'),
(11,'Van','2019-01-01'),
(12,'Van','2019-12-01'),
(13,'Van','2018-05-01'),
(14,'Van','2018-10-01'),
(15,'Truck','2020-05-01'),
(16,'Truck','2020-08-02'),
(17,'Truck','2021-12-05'),
(18,'Truck','2020-08-01'),
(19,'Truck','2021-08-01'),
(20,'Truck','2020-08-01')
