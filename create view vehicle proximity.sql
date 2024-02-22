use shipment
go

--acest view cuprinde combinatia intre comenzi, vehicule si distanta intre locatia de ridicare a comenzii si locatia vehiculelor disponibile
create or alter view VehicleProximity
as
select
	 o.Idorder,
	 o.OrderDate,
	 v.IdVehicle,
			case
			when (r.StartLocation=o.StartLocation and r.EndLocation=v.CurrentLocation)
			or (r.StartLocation=v.CurrentLocation and r.EndLocation=o.StartLocation)
									then r.RouteDistance
			when o.StartLocation=v.CurrentLocation 
									then 0
			end as RouteDistance 
from orders o
cross join vehicles v
cross join route r
where o.OrderDate=(select
			min(OrderDate) 
			from orders
			where OrderStatus='Pending')
		and
			--preiau locul de ridicare al primei comenzi disponibile
		v.VehicleStatus='Available' and
			--preiau locatia primei masini disponibile	
		r.RouteDistance is not null
go	

select distinct
* 
from VehicleProximity
where RouteDistance is not null
order by RouteDistance,Idorder,IdVehicle


