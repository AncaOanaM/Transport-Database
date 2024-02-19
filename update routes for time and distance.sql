use shipment
go

select
*
from route
where RouteTime is not null


update route
set
	RouteTime='10:00',
	RouteDistance=540,
	FuelEstimated=(45.90)
where StartLocation=1 and EndLocation=5	

update route
set
	RouteTime='11:51',
	RouteDistance=640,
	FuelEstimated=(54.40)
where StartLocation=1 and EndLocation=11

update route
set
	RouteTime='13:42',
	RouteDistance=740,
	FuelEstimated=(62.90)
where StartLocation=1 and EndLocation=16

update route
set
	RouteTime='15:33',
	RouteDistance=840,
	FuelEstimated=(71.40)
where StartLocation=1 and EndLocation=19

update route
set
	RouteTime='17:24',
	RouteDistance=940,
	FuelEstimated=(79.90)
where StartLocation=1 and EndLocation=49

update route
set
	RouteTime='19:16',
	RouteDistance=1040,
	FuelEstimated=(88.40)
where StartLocation=1 and EndLocation=50
update route
set
	RouteTime='21:07',
	RouteDistance=1140,
	FuelEstimated=(96.90)
where StartLocation=1 and EndLocation=51
update route
set
	RouteTime='22:58',
	RouteDistance=1240,
	FuelEstimated=(105.40)
where StartLocation=1 and EndLocation=78
update route
set
	RouteTime='4:49',
	RouteDistance=260,
	FuelEstimated=(22.10)
where StartLocation=2 and EndLocation=5
update route
set
	RouteTime='6:40',
	RouteDistance=360,
	FuelEstimated=(30.60)
where StartLocation=2 and EndLocation=11
update route
set
	RouteTime='8:31',
	RouteDistance=460,
	FuelEstimated=(39.10)
where StartLocation=2 and EndLocation=16
update route
set
	RouteTime='10:22',
	RouteDistance=560,
	FuelEstimated=(47.60)
where StartLocation=2 and EndLocation=19
update route
set
	RouteTime='12:13',
	RouteDistance=660,
	FuelEstimated=(56.10)
where StartLocation=2 and EndLocation=49
update route
set
	RouteTime='14:40',
	RouteDistance=760,
	FuelEstimated=(64.60)
where StartLocation=2 and EndLocation=50
update route
set
	RouteTime='15:56',
	RouteDistance=860,
	FuelEstimated=(73.10)
where StartLocation=2 and EndLocation=51

update route
set
	RouteTime='17:47',
	RouteDistance=960,
	FuelEstimated=(81.60)
where StartLocation=2 and EndLocation=78
update route
set
	RouteTime='19:38',
	RouteDistance=1060,
	FuelEstimated=(90.10)
where StartLocation=2 and EndLocation=43
update route
set
	RouteTime='16:29',
	RouteDistance=890,
	FuelEstimated=(75.65)
where StartLocation=5 and EndLocation=11
update route
set
	RouteTime='18:20',
	RouteDistance=990,
	FuelEstimated=(84.15)
where StartLocation=5 and EndLocation=16
update route
set
	RouteTime='20:11',
	RouteDistance=1090,
	FuelEstimated=(92.65)
where StartLocation=5 and EndLocation=19
update route
set
	RouteTime='22:20',
	RouteDistance=1190,
	FuelEstimated=(101.15)
where StartLocation=5 and EndLocation=49
update route
set
	RouteTime='23:53',
	RouteDistance=1290,
	FuelEstimated=(109.65)
where StartLocation=5 and EndLocation=50
update route
set
	RouteTime='23:44',
	RouteDistance=1290,
	FuelEstimated=(108.15)
where StartLocation=5 and EndLocation=51
update route
set
	RouteTime='23:36',
	RouteDistance=1290,
	FuelEstimated=(106.65)
where StartLocation=5 and EndLocation=78

update route
set
	RouteTime='29:27',
	RouteDistance=1590,
	FuelEstimated=(135.15)
where StartLocation=5 and EndLocation=43

update route
set
	RouteTime='05:33',
	RouteDistance=300,
	FuelEstimated=(25.50)
where StartLocation=11 and EndLocation=16

update route
set
	RouteTime='07:24',
	RouteDistance=400,
	FuelEstimated=(34.00)
where StartLocation=11 and EndLocation=19
update route
set
	RouteTime='14:49',
	RouteDistance=800,
	FuelEstimated=(68.00)
where StartLocation=11 and EndLocation=49
update route
set
	RouteTime='16:40',
	RouteDistance=900,
	FuelEstimated=(76.50)
where StartLocation=11 and EndLocation=50
update route
set
	RouteTime='18:31',
	RouteDistance=1000,
	FuelEstimated=(85.00)
where StartLocation=11 and EndLocation=43
update route
set
	RouteTime='20:22',
	RouteDistance=1100,
	FuelEstimated=(93.50)
where StartLocation=11 and EndLocation=51
update route
set
	RouteTime='11:7',
	RouteDistance=600,
	FuelEstimated=(51.00)
where StartLocation=16 and EndLocation=78
update route
set
	RouteTime='12:58',
	RouteDistance=700,
	FuelEstimated=(59.50)
where StartLocation=16 and EndLocation=19
update route
set
	RouteTime='22:13',
	RouteDistance=1200,
	FuelEstimated=(102.00)
where StartLocation=16 and EndLocation=49
update route
set
	RouteTime='23:40',
	RouteDistance=1300,
	FuelEstimated=(110.50)
where StartLocation=16 and EndLocation=51	
update route
set
	RouteTime='23:56',
	RouteDistance=1300,
	FuelEstimated=(109.00)
where StartLocation=16 and EndLocation=50	

update route
set
	RouteTime='23:47',
	RouteDistance=1300,
	FuelEstimated=(117.50)
where StartLocation=16 and EndLocation=43

update route
set
	RouteTime='11:07',
	RouteDistance=600,
	FuelEstimated=(51.00)
where StartLocation=19 and EndLocation=78
update route
set
	RouteTime='20:22',
	RouteDistance=1100,
	FuelEstimated=(93.50)
where StartLocation=19 and EndLocation=49
update route
set
	RouteTime='22:13',
	RouteDistance=1200,
	FuelEstimated=(102.00)
where StartLocation=19 and EndLocation=50
update route
set
	RouteTime='23:56',
	RouteDistance=1400,
	FuelEstimated=(119.00)
where StartLocation=19 and EndLocation=51
update route
set
	RouteTime='23:38',
	RouteDistance=1400,
	FuelEstimated=(126.00)
where StartLocation=19 and EndLocation=43
update route
set
	RouteTime='14:49',
	RouteDistance=800,
	FuelEstimated=(68.00)
where StartLocation=49 and EndLocation=50
update route
set
	RouteTime='18:31',
	RouteDistance=1000,
	FuelEstimated=(85.00)
where StartLocation=49 and EndLocation=51
update route
set
	RouteTime='18:31',
	RouteDistance=1000,
	FuelEstimated=(85.00)
where StartLocation=49 and EndLocation=43
update route
set
	RouteTime='23:56',
	RouteDistance=1400,
	FuelEstimated=(119.00)
where StartLocation=49 and EndLocation=78
update route
set
	RouteTime='16:18',
	RouteDistance=880,
	FuelEstimated=(74.80)
where StartLocation=50 and EndLocation=51
update route
set
	RouteTime='16:40',
	RouteDistance=900,
	FuelEstimated=(76.50)
where StartLocation=50 and EndLocation=43
update route
set
	RouteTime='22:13',
	RouteDistance=1200,
	FuelEstimated=(102.00)
where StartLocation=50 and EndLocation=78
update route
set
	RouteTime='20:22',
	RouteDistance=1100,
	FuelEstimated=(93.50)
where StartLocation=51 and EndLocation=43
update route
set
	RouteTime='23:20',
	RouteDistance=1800,
	FuelEstimated=(153.00)
where StartLocation=51 and EndLocation=78
update route
set
	RouteTime='23:40',
	RouteDistance=1300,
	FuelEstimated=(110.50)
where StartLocation=78 and EndLocation=43	




