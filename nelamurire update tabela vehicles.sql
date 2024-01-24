use DemoDB
go
--creare tabela drivers
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
(5,'Suteu','Marius','Brasov','+40724523989')

--creare tabela vehicles
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
					 Capacity dec(10,3),
					 Driver tinyint references drivers(iddriver) null)
go
insert into vehicles(IdVehicle,VehicleType,PurchaseDate,Model,VehicleNumber,Capacity) values 
(1,'Sprinter','2021.12.05','Ford Transit','BV01SHI',2.143),
(2,'Sprinter','2018.12.31','Ford Transit','BV02SHI',2.143),
(3,'Sprinter','2018.12.12','Ford Transit','BV03SHI',2.143),
(4,'Van','2022.02.01','NISSAN NV','BV04SHI',2.3),
(5,'Truck','2020.08.01','Nissan Frontier','BV05SHI',13.0),
(6,'Sprinter','2017.12.31','Ford Transit','BV06SHI',2.143),
(7,'Sprinter','2018.12.12','Ford Transit','BV07SHI',2.143)

create or alter procedure AddDriver
as
begin
	--setez un counter de vehicule care sa retina nr de inregistrari din tablela vehicles
	declare @vehiclecounter int
	select 
	@vehiclecounter=max(IdVehicle)
	from vehicles
	--setez un counter de drivers care sa retina nr de inregistrari din tablela drivers
	declare @drivercounter int
	select 
	@drivercounter=max(IdDriver)
	from drivers
	declare @ivehicle int=1; --variabila care va parcurge fiecare vehicul din tabela vehicles
	declare @driver int=1; --variabila care va prelua valoarea campului driver din tabela vehicles la fiecare parcurgere de vehicul
	while @ivehicle<=@vehiclecounter --conditie de a parcurge fiecare vehicul
		begin
			select @driver=isnull(cast(driver as int),0) 
			from vehicles
			where IdVehicle=@ivehicle --variabila @driver preia valoarea din campul driver pentru vehiculul pe care il parcurge in acest moment
			if @driver<>0 --verifica daca vehiculul pe care il parcurge nu are niciun driver
				begin
					print 'This vehicle has a driver '+cast(@ivehicle as varchar) --daca are driver printeaza mesaj ca are driver 
				end
			else --daca nu are driver, se va duce in tabela drivers
				begin
				declare @idriver int=1; --variabila care preia prima valoare din tabela drivers
				while @idriver<=@drivercounter --verifica parcurgerea tuturor inregistrarilor din tabela drivers
					begin
					if not exists (select * from vehicles --verifica daca driverul pe care il parcurgem este alocat in tabela vehicule la vreo masina
							       where isnull(cast(driver as int),0)=@idriver)
						begin 
							update vehicles  --daca nu este alocat, atunci va seta campul driver pentru idvehicul pe care il parcurgem cu valoarea driver la care suntem 
							set driver=@idriver
							where IdVehicle=@ivehicle
						end
					else --daca este alocat la alta masina, va printa mesajul corespunzator
						begin
							print 'This driver has a vehicle '+cast(@idriver as varchar)
						end 
					set @idriver=@idriver+1 --va merge la urmatorul driver
					end
				end
			set @ivehicle=@ivehicle+1 --va merge la urmatorul vehicul
		end
end
exec AddDriver

select * from vehicles