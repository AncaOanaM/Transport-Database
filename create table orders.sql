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
insert into orders(Idorder,IdCustomer,IdRoute,OrderDate,StartLocation) values 
(1,5,353,'2023-11-30',5),
(2,4,2972,'2023-11-25',51),
(3,1,841,'2023-11-20',11),
(4,2,830,'2023-11-30',11),
(5,10,3049,'2023-11-28',49),
(6,13,1203,'2023-11-30',16),
(7,6,1274,'2023-11-30',19),
(8,4,388,'2024-01-03',5),
(9,10,3087,'2024-01-03',49),
(10,2,863,'2024-01-03',11),
(11,3,3783,'2024-01-03',78),
(12,8,3087,'2024-01-04',43),
(13,10,863,'2024-01-05',49),
(14,11,1262,'2024-01-05',16),
(15,10,3783,'2024-01-05',78),
(16,10,3087,'2024-01-05',43),
(17,11,1472,'2024-01-05',78),
(18,6,1443,'2023-12-20',19),
(19,9,3049,'2024-01-05',49),
(20,6,3049,'2024-01-06',50),
(21,6,1443,'2024-01-05',49)

