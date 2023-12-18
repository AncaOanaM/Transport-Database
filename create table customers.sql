drop table if exists customers
go
create table customers
					(IdCustomer smallint primary key not null,
					 Name varchar(100) not null,
					 OfficeAdress int references city(IdCity) not null,
					 EmailAdress varchar(50) null,
					 PhoneNumber varchar(15) null)
go
insert into customers(IdCustomer,Name,OfficeAdress,EmailAdress,PhoneNumber) values 
(1,'Adaconi',12,'office@adaconi.ro','+40724123456'),
(2,'Akro',12,'office@akro.ro','+40724589556'),
(3,'ALl Green Way',77,'office@allgreenway.com','+3597256245'),
(4,'Art Nouveau',51,'office@artnouveau.com','+337256885'),
(5,'Ataline Prosistem',5,'office@atalineprosistem.ro','+40724523556'),
(6,'Grup Editorial',20,'office@clubeditorial.ro','+40724862556'),
(7,'Hod-Chimex',19,'office@hodchimex.ro','+40724523998'),
(8,'Valcor',88,'office@atalineprosistem.com','+32724523580'),
(9,'Filodi',50,'office@filodi.com','+20762723556'),
(10,'Trustkp',50,'office@trustkp.com','+20762723806'),
(11,'Makegood',3,'office@makegood.com','+34724093506'),
(12,'Mapason',49,'office@mapason.ro','+34806580077'),
(13,'Nicola',16,'office@nicola.ro','+40724800900'),
(14,'Zian Art',12,'office@zianart.ro','+40749800200'),
(15,'Wise Tigers',12,'office@wisetigers.ro','+40752300689'),
(16,'Time Design',16,'office@timedeisgn.ro','+40724879878'),
(17,'Simval Prod',12,'office@simvalprod.ro','+40723520520'),
(18,'Procesuality',50,'office@procesuality.com','+20724523777'),
(19,'Merobis',2,'office@merobis.ro','+30789789874'),
(20,'Medimfarm',38,'office@medimfarm.ro','+4072505050')

