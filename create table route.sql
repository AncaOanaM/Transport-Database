drop table if exists route
go
create table route
				(IdRoute smallint primary key not null,
				RouteName varchar(50) null,
				RouteTime tinyint null)

insert into route(IdRoute)
SELECT TOP 20 ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
FROM sys.objects

--with CTE as (SELECT
--    t1.OfficeAdress + ' ' + t2.OfficeAdress AS CombinedValues
--FROM
--    customers t1
--JOIN
--    customers t2 ON t1.OfficeAdress <> t2.OfficeAdress)
--select distinct CombinedValues
--from CTE


WITH CTE AS (
    SELECT
        t1.IdRoute,
        t1.RouteName + ' ' + t2.OfficeAdress AS CombinedValues
    FROM
        route t1
    JOIN
        customers t2 ON t1.IdRoute = t2.IdCustomer AND t1.RouteName <> t2.OfficeAdress
)
UPDATE route
SET RouteName = c.CombinedValues
FROM route t1
JOIN CTE c ON t1.IdRoute = c.IdRoute;