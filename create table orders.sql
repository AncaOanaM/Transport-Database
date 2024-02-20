use shipment
go

drop table if exists orders
go

create table orders
					(Idorder smallint primary key not null,
					 IdCustomer smallint references customers(IdCustomer) not null,
					 IdRoute int references route(IdRoute) not null,
					 OrderDate date not null,
					 OrderStatus varchar(20) null,
					 StartLocation int references city(idcity) null)
go


