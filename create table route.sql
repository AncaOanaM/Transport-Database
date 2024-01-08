drop table if exists route
go
create table route
				(IdRoute int primary key not null,
				RouteName varchar(50) null,
				RouteTime tinyint null,
				RouteDistance tinyint null)

DECLARE @Counter INT = 1
WHILE @Counter <= 8000
BEGIN
    INSERT INTO route(IdRoute,RouteName,RouteTime,RouteDistance)
    VALUES (@Counter,null,null,null);
    SET @Counter = @Counter + 1;
END

with CTE1 as 
		(select 
			c1.CityName+' '+c2.cityName as routeName
		from city c1
		cross join city c2
		where c1.CityName<>c2.CityName),
	CTE2 as (select 
			routeName,
			ROW_NUMBER() OVER (ORDER BY CTE1.routeName) AS Id
		from CTE1)
UPDATE Route
SET RouteName = C.routeName
FROM Route r
JOIN CTE2 C ON r.IdRoute = c.ID
