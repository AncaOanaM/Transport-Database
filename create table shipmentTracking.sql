drop table if exists ShipmentTracking
go

create table ShipmentTracking
					(IdTracking smallint primary key not null,
					 IdShipment smallint references shipments(Idshipment ) not null,
					 Location varchar(50) null,
					 TimeStamp datetime null,
					 ActualStatus varchar(50) null)
go

