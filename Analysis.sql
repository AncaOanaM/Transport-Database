--1. top 5 the most used routes

create or alter view TheMostUsedRoutes
as
	select top 5
		r.IdRoute,
		count(s.Idshipment) NmbofShipments
	from shipments s
		join orders o on o.Idorder=s.IdOrder
		join route r on r.IdRoute=o.IdRoute
	group by r.IdRoute
	order by NmbofShipments desc

select * from TheMostUsedRoutes

select
	c1.CityName as StartLocation,
	c2.CityName as EndLocation,
	t.NmbofShipments
from TheMostUsedRoutes t
	join route r on r.IdRoute=t.IdRoute
	join city c1 on c1.IdCity=r.StartLocation
	join city c2 on c2.IdCity=r.EndLocation
order by t.NmbofShipments desc

# startlocation,endlocation,NmbofShipments  
Brasov	Bucharest	66
Bucharest	Cluj-Napoca	59
Belgrade	Madrid	42
Madrid	Timi?oara	39
Belgrade	Bucharest	38

--2. 	The average time taken to complete deliveries for each route

create or alter view ShipmentDeliveyTime
as
select
	o.IdRoute,
	(convert(time,s.EndTime-s.StartTime)) Durata
from shipments s
join orders o
	on o.Idorder=s.IdOrder

select * from ShipmentDeliveyTime

create or alter view AverageDeliveryTime
as
SELECT
IdRoute,
NmbOfDeliveryPerRoute,
CONVERT(TIME, DATEADD(SECOND, TotalSecond/NmbOfDeliveryPerRoute,0)) AverageSeconds

FROM 
	(select
		IdRoute,
		count(*) NmbOfDeliveryPerRoute,
		SUM(DATEPART(HOUR, Durata) * 3600 + DATEPART(MINUTE, Durata) * 60 + DATEPART(SECOND, Durata)) as TotalSecond
	from ShipmentDeliveyTime
	group by IdRoute)
	as TotalSecondsPerRoute

select * from AverageDeliveryTime


--3. The total distance traveled for each route

select
o.IdRoute,
sum(s.DistanceTraveled) TotalDistance
from shipments s
join orders o
	on o.Idorder=s.IdOrder
group by o.IdRoute


--4. Shipments with suplementary kilometers

select distinct
	r.IdRoute,
	s.DistanceTraveled,
	r.RouteDistance,
	s.DistanceTraveled-r.RouteDistance ExtraDistance,
	s.Idshipment,
	o.Idorder
from shipments s
	join orders o
		on o.Idorder=s.IdOrder
	join route r
		on r.IdRoute=o.IdRoute
where s.DistanceTraveled-r.RouteDistance<>0

--5. routes with delays

create or alter view TimeTraveled
as
select distinct
	r.IdRoute,
	r.RouteTime,
	convert(time,s.EndTime-s.StartTime) TimeTraveled,
	s.Idshipment,
	s.EndTime,
	o.Idorder
from shipments s
	join orders o on o.Idorder=s.IdOrder
	join route r on r.IdRoute=o.IdRoute


select distinct
	dt.IdRoute,
	CONVERT(TIME, DATEADD(SECOND, Extratime,0)) Extratime,
	c1.CityName StartLocation,
	c2.CityName EndLocation
from
	(select
	IdRoute,Idorder,Idshipment,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled) as dt
join route r on r.IdRoute=dt.IdRoute
join city c1 on c1.IdCity=r.StartLocation
join city c2 on c2.IdCity=r.EndLocation
where Extratime<>0
order by Extratime desc


--6. average costs by route

create or alter view AvgCost
as
	select
	o.IdRoute,
		avg(s.TravelCost) AverageCost
	from shipments s
	join orders o on o.Idorder=s.IdOrder
	group by o.IdRoute

select
*
from AvgCost


--7. top 5 routes with exceeding average delivery cost
select distinct top 5
	o.Idorder,
	s.TravelCost-ac.AverageCost as ExceedingAvgCost,
	ac.IdRoute,
	c1.CityName as StartLocation,
	c2.CityName as EndLocation
from AvgCost ac
	join orders o on o.IdRoute=ac.IdRoute
	join shipments s on s.IdOrder=o.Idorder
	join route r on r.IdRoute=o.IdRoute
	join city c1 on c1.IdCity=r.StartLocation
	join city c2 on c2.IdCity=r.EndLocation
where s.TravelCost>ac.AverageCost
order by ExceedingAvgCost desc



select
s.IdOrder,s.TravelCost,c.Name
from shipments s
join orders o
	on o.Idorder=s.IdOrder
join customers c
	on c.IdCustomer=o.IdCustomer
where c.IdCustomer=4

select
* from customers -- nefinalizat

--ponderea livrarilor cu depasiri de timp in totalul livrarilor

select
	dt.IdRoute,
	dt.Idorder,
	dt.Idshipment,
	CONVERT(TIME, DATEADD(SECOND, Extratime,0)) ExtraShipmentTime
from
	(select
	IdRoute,Idorder,Idshipment,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled) as dt
where Extratime=0

--numarul de livrari cu intarziere pe luna

create or alter view TimeTraveled
as
select distinct
	r.IdRoute,
	r.RouteTime,
	(convert(time,s.EndTime-s.StartTime)) TimeTraveled,
	s.Idshipment,
	s.EndTime,
	o.Idorder
from shipments s
	join orders o
		on o.Idorder=s.IdOrder
	join route r
		on r.IdRoute=o.IdRoute

select * from TimeTraveled

select
month(tt.EndTime),
count(tt.Idshipment)
from TimeTraveled tt
group by month(tt.EndTime)

select
	count(dt.Idshipment) NmrShipmperMonth,
	dt.Luna 
from
	(select
	tt.Idshipment,month(tt.EndTime) Luna,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled tt) as dt
where dt.Extratime=0
group by dt.Luna

--rezultat
41	1
40	2
56	3
45	4
29	5
28	6
14	7
51	8
36	9
59	10
43	11
69	12

select
	count(dt.Idshipment) NmrShipmperMonth,
	dt.Luna 
from
	(select
	tt.Idshipment,month(tt.EndTime) Luna,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled tt) as dt
where dt.Extratime<>0
group by dt.Luna

--rezultat
13	1
14	2
16	3
9	4
7	5
8	6
4	7
21	8
13	10
14	11
21	12