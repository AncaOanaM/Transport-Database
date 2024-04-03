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

# startlocation, endlocation, 		NmbofShipments  
Brasov			Bucharest		66
Bucharest		Cluj-Napoca		59
Belgrade		Madrid			42
Madrid			Timisoara		39
Belgrade		Bucharest		38


--2. 	The average time taken to complete deliveries for each route; list top 5

create or alter view ShipmentDeliveyTime
as
select
	o.IdRoute,
	(convert(time,s.EndTime-s.StartTime)) Durata,
	o.
from shipments s
join orders o on o.Idorder=s.IdOrder

select * from ShipmentDeliveyTime

create or alter view AverageDeliveryTime
as
	SELECT
	IdRoute,
	NmbOfDeliveryPerRoute,
	CONVERT(TIME, DATEADD(SECOND, TotalSecond/NmbOfDeliveryPerRoute,0)) AverageTime
	FROM 
		(select
			IdRoute,
			count(*) NmbOfDeliveryPerRoute,
			SUM(DATEPART(HOUR, Durata) * 3600 + DATEPART(MINUTE, Durata) * 60 + DATEPART(SECOND, Durata)) as TotalSecond
	from ShipmentDeliveyTime
	group by IdRoute)
	as TotalSecondsPerRoute

select top 5
	c1.cityname StartLocation,
	c2.cityname Endlocation,
	NmbOfDeliveryPerRoute,
	AverageTime
from AverageDeliveryTime adt
join route r on r.idroute=adt.idroute
join city c1 on c1.idcity=r.StartLocation
join city c2 on c2.idcity=r.Endlocation
order by AverageTime desc

# StartLocation	Endlocation NmbOfDeliveryPerRoute	AverageSeconds
Bucharest		Manchester	17		23:56:00.0000000
Belgrade		Manchester	5		23:53:00.0000000
Bucharest		Lille		16		23:47:00.0000000
Belgrade		Marseille	27		23:44:00.0000000
Timișoara		Lille		3		23:40:00.0000000


--3. The top 5 routes descending by average distance traveled 

create or alter view AvgDistancePerRoute
as
	select
	o.IdRoute,
	avg(s.DistanceTraveled) AvgDistance
	from shipments s
	join orders o on o.Idorder=s.IdOrder
	group by o.IdRoute

select * from AvgDistancePerRoute	

select top 5
c1.CityName StartLocation,
c2.CityName EndLocation,
adpr.AvgDistance
from AvgDistancePerRoute adpr
join route r on r.IdRoute=adpr.IdRoute
join city c1 on c1.IdCity=r.StartLocation
join city c2 on c2.IdCity=r.EndLocation
order by adpr.AvgDistance desc 

# StartLocation EndLocation AvgDistance
Marseille		Timișoara	1800
Madrid			Timișoara	1494
Bucharest		Lille		1300
Bucharest		Manchester	1300
Timișoara		Lille		1300


--4. top 5 of shipments with extra kilometers

select distinct
	c1.CityName StartLocation,
	c2.CityName EndLocation,
	s.DistanceTraveled-r.RouteDistance ExtraKilometers
from shipments s
	join orders o on o.Idorder=s.IdOrder
	join route r on r.IdRoute=o.IdRoute
	join city c1 on c1.IdCity=r.StartLocation
	join city c2 on c2.IdCity=r.EndLocation
where s.DistanceTraveled-r.RouteDistance<>0

# StartLocation EndLocation ExtraKilometers
	Brasov	Bucharest	30
	Brasov	Bucharest	50
	Madrid	Lille		100
	Madrid	Lille		120
	Madrid	Timișoara	80
	Madrid	Timișoara	100

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
	c1.CityName StartLocation,
	c2.CityName EndLocation,
	CONVERT(TIME, DATEADD(SECOND, Extratime,0)) Extratime
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

# StartLocation EndLocation ExtraTime
	Madrid		Timișoara	04:21:00.0000000
	Madrid		Timișoara	03:21:00.0000000
	Madrid		Lille		02:05:00.0000000
	Madrid		Lille		01:55:00.0000000
	Belgrade	Bucharest	00:45:00.0000000
	Brasov		Bucharest	00:45:00.0000000
	Brasov		Bucharest	00:25:00.0000000


--6. top 5 average costs by route (descending)

create or alter view AvgCost
as
	select
	o.IdRoute,
		avg(s.TravelCost) AverageCost
	from shipments s
	join orders o on o.Idorder=s.IdOrder
	group by o.IdRoute

select top 5
	c1.CityName StartLocation,
	c2.CityName EndLocation,
	AverageCost AvgCost
from AvgCost ac
join route r on r.IdRoute=ac.IdRoute
join city c1 on c1.IdCity=r.StartLocation
join city c2 on c2.IdCity=r.EndLocation
order by AvgCost

# StartLocation EndLocation AvgCost
	Brasov		Bucharest	195
	Brasov		Cluj-Napoca	260
	Cluj-Napoca	Timișoara	390
	Bucharest	Timișoara	390
	Bucharest	Cluj-Napoca	455


--7. top 5 orders with exceeding average delivery cost

select distinct top 5
	c1.CityName as StartLocation,
	c2.CityName as EndLocation,
	o.Idorder,
	s.TravelCost-ac.AverageCost as ExceedingAvgCost,
	ac.IdRoute	
from AvgCost ac
	join orders o on o.IdRoute=ac.IdRoute
	join shipments s on s.IdOrder=o.Idorder
	join route r on r.IdRoute=o.IdRoute
	join city c1 on c1.IdCity=r.StartLocation
	join city c2 on c2.IdCity=r.EndLocation
where s.TravelCost>ac.AverageCost
order by ExceedingAvgCost desc

# StartLocation EndLocation Idorder ExceedingAvgCost
Madrid		Timișoara	603	50
Madrid		Timișoara	357	49
Madrid		Timișoara	363	49
Madrid		Timișoara	378	49
Madrid		Timișoara	5	47
	

--8. Number of shipments per month

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
	join orders o on o.Idorder=s.IdOrder
	join route r on r.IdRoute=o.IdRoute


select
datename(month,tt.EndTime) Month,
count(tt.Idshipment) NmbOfShipmentsPerMonth
from TimeTraveled tt
group by datename(month,tt.EndTime)
order by NmbOfShipmentsPerMonth desc

# Month NmbOfShipmentsPerMonth
December	85
October		74
March		71
August		64
November	60
April		58
January		56
February	50
May		38
June		37
September	37
July		21

--9. number of shipments per months, with delay

select
	count(dt.Idshipment) NmrShipmperMonth,
	dt.Month 
from
	(select
	tt.Idshipment,datename(month,tt.EndTime) Month,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled tt) as dt
where dt.Extratime<>0
group by dt.Month
order by NmrShipmperMonth desc

# NmrShipmperMonth	Month
17			November
16			December
15			January
15			March
15			October
13			April
13			August
10			February
9			May
9			June
7			July
1			September


--10. number of shipments per months, with no delay

select
	count(dt.Idshipment) NmrShipmperMonth,
	dt.Month 
from
	(select
	tt.Idshipment,datename(month,tt.EndTime) Month,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled tt) as dt
where dt.Extratime=0
group by dt.Month
order by NmrShipmperMonth desc

# NmrShipmperMonth	Month
	69		December
	59		October
	56		March
	51		August
	45		April
	43		November
	41		January
	40		February
	36		September
	29		May
	28		June
	14		July

create or alter view extratimeView
as
select
	dt.IdRoute,
	dt.Idorder,
	dt.Idshipment,
	CONVERT(TIME, DATEADD(SECOND, Extratime,0)) Extratime
		
from
	(select
	IdRoute,Idorder,Idshipment,
	datediff(second,RouteTime,TimeTraveled) Extratime
	from TimeTraveled) as dt


select 
	count(*) nmbshipments,
	sum(case when Extratime<>'00:00:00.0000000' then 1 else 0 end) NmbDelays,
	(sum(case when Extratime<>'00:00:00.0000000' then 1 else 0 end)*1.0/count(*))*100 Proportion
from extratimeView

# nmbshipments NmbDelays Proportion

651		140	 21.505376344000
