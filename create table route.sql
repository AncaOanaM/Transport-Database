drop table if exists route
go
create table route
				(IdRoute smallint primary key not null,
				RouteName varchar(50) null,
				RouteTime tinyint null)

DECLARE @Counter INT = 1
WHILE @Counter <= 500
BEGIN
    INSERT INTO route(IdRoute,RouteName,RouteTime)
    VALUES (@Counter,null,null);
    SET @Counter = @Counter + 1;
END

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
