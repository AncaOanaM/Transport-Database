--1. view pentru tabela comenzi de introdus in shipment
--de modificat de fiecare data orderdate
update orders
set OrderStatus='Pending'

select * from orders
where 
OrderStatus='Pending' and 
OrderDate='2023-12-23'

select * from orders
where OrderDate='2023-12-23' and OrderStatus='Pending'

select * from vehicles

create or alter view VehicleProximity
as
select distinct
	 o.Idorder,
	 o.OrderDate,
	 o.IdRoute,
	 v.IdVehicle,
	 v.currentlocation as VehicleLocation,
			case
				when (r.StartLocation=o.StartLocation and r.EndLocation=v.CurrentLocation)
				or (r.StartLocation=v.CurrentLocation and r.EndLocation=o.StartLocation)
						then r.RouteDistance
				when o.StartLocation=v.CurrentLocation 
						then 0
				end 
			as RouteDistance 
from orders o
cross join vehicles v
join route r
on (r.StartLocation=o.StartLocation and r.EndLocation=v.CurrentLocation)
	or (r.StartLocation=v.CurrentLocation and r.EndLocation=o.StartLocation)
	or o.StartLocation=v.CurrentLocation
where o.OrderDate='2023-12-23'
		and v.VehicleStatus='Available' 
		and r.RouteDistance is not null
		and o.OrderStatus='Pending'
go	

select * from VehicleProximity


--2. Procedura de introducere in shipment a comenzilor dintr-o zi

create or alter procedure AddShipment
as
begin
	declare @nmbOrders int
	declare @counterOrders int=1
	declare @nmbVehicles int

	select 
		@nmbOrders=count(distinct(Idorder))
	from VehicleProximity
	where RouteDistance is not null

while @counterOrders<=@nmbOrders
	begin	
		declare @idvehicle int=0
		declare @idorder int=0
		declare @vehicleLocation int=0

		select top 1
		@idvehicle=IdVehicle,
		@idorder=Idorder,
		@vehicleLocation=vehicleLocation
		from VehicleProximity
		where RouteDistance is not null
		order by RouteDistance,Idorder,IdVehicle

		insert into shipments (Idvehicle,Idorder,StartTime,ShipmentStatus)
		select top 1
			Idvehicle,Idorder,dateadd(day,1,orderDate),'Processing'
		from VehicleProximity
		where RouteDistance is not null
		order by RouteDistance,Idorder,IdVehicle
		
		update orders
		set OrderStatus='Processing'
		from orders o
		where Idorder=@idorder
			
		update vehicles
		set VehicleStatus='In transit'
		from vehicles v
		where IdVehicle=@idvehicle
				
		set @counterOrders=@counterOrders+1
	end
end

exec AddShipment

select * from shipments

--3. Update locatie vehicul dupa transportul marfii
--DE SCHIMBAT DATA COMENZII

update vehicles
		set CurrentLocation=
			case when o.StartLocation=r.StartLocation then r.EndLocation
			     when o.StartLocation=r.EndLocation then r.StartLocation
			end 
		from orders o
		join route r
			on r.IdRoute=o.IdRoute
		join shipments s
			on s.IdOrder=o.Idorder
		join vehicles v
			on v.IdVehicle=s.Idvehicle
where o.OrderDate='2023-12-23'
		
		
--4. update stare vehicul dupa transportul marfii

update vehicles
set VehicleStatus='Available'

--5. Se updateaza coloana distanceTraveled si Endtime

select
count(*) nmbshipments,o.IdRoute 
from shipments s
join orders o
	on o.Idorder=s.IdOrder
join route r
	on r.IdRoute=o.IdRoute
group by o.IdRoute
order by nmbshipments desc

--update distance
update shipments
		set DistanceTraveled=
			case when o.IdRoute=830 and month(o.orderdate) in (2,4,7,9) then r.RouteDistance+50
				 when o.IdRoute=830 and month(o.orderdate) in (1,3,5,6,8,10,11,12) then r.RouteDistance+30
				 when o.IdRoute=3077 and month(o.orderdate) in (2,4,7,9) then r.RouteDistance+80
				 when o.IdRoute=3077 and month(o.orderdate) in (1,3,5,6,8,10,11,12) then r.RouteDistance+100
				 when o.IdRoute=3830 and month(o.orderdate) in (1,3,5,7,9,11) then r.RouteDistance+100
				 when o.IdRoute=3830 and month(o.orderdate) in (2,4,6,8,10,12) then r.RouteDistance+120
				 else r.RouteDistance
			end 
		from route r
		join orders o
			on r.IdRoute=o.IdRoute
		join shipments s
			on s.IdOrder=o.Idorder
	

--update endTime
update shipments
set EndTime=
	case when o.IdRoute=830 and month(o.orderdate) in (2,4,7,9) then DATEADD(MINUTE, 45, DATEADD(HOUR, 0, r.RouteTime))
		 when o.IdRoute=830 and month(o.orderdate) in (1,3,5,6,8,10,11,12) then DATEADD(MINUTE, 25, DATEADD(HOUR, 0, r.RouteTime)) 
		 when o.IdRoute=3077 and month(o.orderdate) in (2,4,7,9) then DATEADD(MINUTE, 15, DATEADD(HOUR, 1, r.RouteTime))
		 when o.IdRoute=3077 and month(o.orderdate) in (1,3,5,6,8,10,11,12) then DATEADD(MINUTE, 45, DATEADD(HOUR, 1, r.RouteTime)) 
		 when o.IdRoute=3830 and month(o.orderdate) in (1,3,5,7,9,11) then DATEADD(MINUTE, 55, DATEADD(HOUR, 1, r.RouteTime)) 
		 when o.IdRoute=3830 and month(o.orderdate) in (2,4,6,8,10,12) then DATEADD(MINUTE, 05, DATEADD(HOUR, 02, r.RouteTime)) 
		 else r.RouteTime
	end
from route r
join orders o
	on r.IdRoute=o.IdRoute
join shipments s
	on s.IdOrder=o.Idorder


--update travel cost
update shipments
set TravelCost=
	case when s.DistanceTraveled-r.RouteDistance>0 and year(v.PurchaseDate)=2018 then r.FuelEstimated*7.5*1.25*(1+(s.DistanceTraveled-r.RouteDistance)/r.RouteDistance)
		 when s.DistanceTraveled-r.RouteDistance>0 and year(v.PurchaseDate)=2019 then r.FuelEstimated*7.5*1.15*(1+(s.DistanceTraveled-r.RouteDistance)/r.RouteDistance)
		 when s.DistanceTraveled-r.RouteDistance>0 and year(v.PurchaseDate)=2020 then r.FuelEstimated*7.5*1.05*(1+(s.DistanceTraveled-r.RouteDistance)/r.RouteDistance)
		 when s.DistanceTraveled-r.RouteDistance>0 and year(v.PurchaseDate)=2021 then r.FuelEstimated*7.5*1.02
		 when s.DistanceTraveled-r.RouteDistance>0 and year(v.PurchaseDate)=2022 then r.FuelEstimated*7.5*1.01
		 when s.DistanceTraveled-r.RouteDistance=0 and year(v.PurchaseDate)=2018 then r.FuelEstimated*7.5*1.25
		 when s.DistanceTraveled-r.RouteDistance=0 and year(v.PurchaseDate)=2019 then r.FuelEstimated*7.5*1.15
		 when s.DistanceTraveled-r.RouteDistance=0 and year(v.PurchaseDate)=2020 then r.FuelEstimated*7.5*1.05
		 else r.FuelEstimated*7.5*1.02
	end
from shipments s
join orders o
	on o.Idorder=s.IdOrder
join route r
	on r.IdRoute=o.IdRoute
join vehicles v
	on v.IdVehicle=s.Idvehicle


