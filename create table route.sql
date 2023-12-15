drop table if exists route
go
create table route
				(IdRoute smallint primary key not null,
				RouteName varchar(50) null,
				RouteTime tinyint null)


-- inserare date in coloana de ID	
DECLARE @Counter INT = 1
WHILE @Counter <= 500
BEGIN
    INSERT INTO route(IdRoute,RouteName,RouteTime)
    VALUES (@Counter,null,null);
    SET @Counter = @Counter + 1;
END

--am adus orasele din definirea adresei clientilor, si am creat ruta: combiantie de 2 orase	
with CTE1 as 
	(SELECT distinct
	t1.OfficeAdress + ' ' + t2.OfficeAdress AS CombinedValues
	FROM
    customers t1
JOIN
    customers t2 ON t1.OfficeAdress <> t2.OfficeAdress),
CTE2 as (select 
CombinedValues,
ROW_NUMBER() OVER (ORDER BY CTE1.CombinedValues) AS Id
from CTE1)
UPDATE Route
SET RouteName = C.CombinedValues
FROM Route r
JOIN CTE2 C ON r.IdRoute = c.ID 
