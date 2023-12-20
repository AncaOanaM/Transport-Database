drop table if exists vehicles
go
create table vehicles
					(IdVehicle smallint primary key not null,
					 VehicleType varchar(100) not null,
					 VehicleStatus varchar(50) null,
					 CurrentLocation varchar(50) null,
					 PurchaseDate date null,
					 Model varchar(50) null,
					 VehicleNumber varchar(10) null,
					 Capacity dec(10,3))
go
insert into vehicles(IdVehicle,VehicleType,PurchaseDate,Model,VehicleNumber,Capacity) values 
(1,'Sprinter','2021.12.05','Ford Transit','BV01SHI',2.143),
(2,'Sprinter','2018.12.31','Ford Transit','BV02SHI',2.143),
(3,'Sprinter','2021.01.01','Ford Transit','BV03SHI',2.143),
(4,'Sprinter','2020.01.03','Ford Transit','BV04SHI',2.143),
(5,'Sprinter','2020.03.02','Ford Transit','BV05SHI',2.143),
(6,'Sprinter','2017.12.31','Ford Transit','BV06SHI',2.143),
(7,'Sprinter','2018.12.12','Ford Transit','BV07SHI',2.143),
(8,'Van','2022.02.01','NISSAN NV','BV08SHI',2.3),
(9,'Van','2023.02.02','NISSAN NV','BV09SHI',2.3),
(10,'Van','2023.03.01','NISSAN NV','BV10SHI',2.3),
(11,'Van','2019.01.01','Fiat Ducato','BV11SHI',2.2),
(12,'Van','2019.12.01','Fiat Ducato','BV12SHI',2.2),
(13,'Van','2018.05.01','Fiat Ducato','BV13SHI',2.2),
(14,'Van','2018.01.10','Volkswagen Crafter','BV14SHI',2.4),
(15,'Truck','2020.01.05','Ford F-150','BV15SHI',12.8),
(16,'Truck','2020.08.02','Ford F-150','BV16SHI',12.8),
(17,'Truck','2021.12.05','Ford F-150','BV17SHI',12.8),
(18,'Truck','2020.08.01','Nissan Frontier','BV18SHI',13.0),
(19,'Truck','2021.08.01','Nissan Frontier','BV19SHI',13.0),
(20,'Truck','2020.08.01','Nissan Frontier','BV20SHI',13.0)
