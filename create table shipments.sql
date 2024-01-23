drop table if exists shipments
go

create table shipments
					(Idshipment smallint primary key not null,
					 Idvehicle smallint references vehicles(IdVehicle) not null,
					 IdDriver tinyint references drivers(IdDriver) not null,
					 IdOrder smallint references orders(IdOrder) not null,
					 StartTime datetime not null,
					 EndTime datetime null,
					 ShipmentStatus varchar(50) null,
					 TravelCost int null,
					 DistanceTraveled smallint null,
					 ReasonForDelay varchar(200) null)
go

