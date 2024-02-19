drop table if exists vehicles
go
create table vehicles
					(IdVehicle smallint primary key not null,
					 VehicleType varchar(100) not null,
					 VehicleStatus varchar(50) null,
					 CurrentLocation int references city(IdCity) null,
					 IdDriver tinyint references drivers(IdDriver) null,
					 PurchaseDate date null,
					 Model varchar(50) null,
					 VehicleNumber varchar(10) null,
					 Capacity dec(10,3))
go
insert into vehicles(IdVehicle,VehicleType,PurchaseDate,Model,VehicleNumber,Capacity) values 
(1,'Sprinter','2021.12.05','Ford Transit','BV01SHI',2.143),
(2,'Sprinter','2018.12.31','Ford Transit','BV02SHI',2.143),
(3,'Sprinter','2018.12.12','Ford Transit','BV03SHI',2.143),
(4,'Van','2022.02.01','NISSAN NV','BV04SHI',2.3),
(5,'Truck','2020.08.01','Nissan Frontier','BV05SHI',13.0),
(6,'Truck','2020.08.02','Ford F-150','BV06SHI',12.8),
(7,'Truck','2021.12.05','Ford F-150','BV07SHI',12.8),
(8,'Truck','2020.08.01','Nissan Frontier','BV08SHI',13.0),
(9,'Truck','2021.08.01','Nissan Frontier','BV09SHI',13.0),
(10,'Truck','2020.08.01','Nissan Frontier','BV10SHI',13.0)
