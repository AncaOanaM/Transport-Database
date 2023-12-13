drop table if exists drivers
go
create table drivers
					(IdDriver tinyint primary key,
					 FirstName varchar(100) not null,
					 LastName varchar(50) not null,
					 Adress varchar(50) null,
					 PhoneNumber varchar(15) null)
go
insert into drivers(IdDriver,FirstName,LastName,Adress,PhoneNumber) values 
(1,'Adam','Paul','Brasov','+40724123456'),
(2,'Taus','Gabriel','Brasov','+40724589500'),
(3,'Mirita','Ecaterina','Sofia','+40724123800'),
(4,'Art Nouveau','','Lion','+40724123777'),
(5,'Ataline Prosistem','','Bistrita','+40724523989'),
(6,'Grup Editorial','','Cluj-Napoca','+40724862100'),
(7,'Hod-Chimex','','Galati','+40724523998'),
(8,'Valcor','','Leuven','+40724123202'),
(9,'Filodi','','London','+40724123333'),
(10,'Trustkp','','London','+40724123408'),
(11,'Makegood','','Barcelona','+40724123401'),
(12,'Mapason','','Madrid','+40724123474'),
(13,'Nicola','','Bucuresti','+40724800900'),
(14,'Zian Art','','Ghimbav','+40749800200'),
(15,'Wise Tigers','','Paulesti','+40752300689'),
(16,'Time Design','','Oradea','+40724879878'),
(17,'Simval Prod','','Brasov','+40723520520'),
(18,'Procesuality','','London','+20724523777'),
(19,'Merobis','','Athena','+40724123505'),
(20,'Medimfarm','','Iasi','+4072505050')
