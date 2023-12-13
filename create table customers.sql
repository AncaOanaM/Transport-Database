drop table if exists customers
go
create table customers
					(IdCustomer smallint primary key not null,
					 Name varchar(100) not null,
					 OfficeAdress varchar(50) not null,
					 EmailAdress varchar(50) null,
					 PhoneNumber varchar(15) null)
go
insert into customers(IdCustomer,Name,OfficeAdress,EmailAdress,PhoneNumber) values 
(1,'Adaconi','Brasov','office@adaconi.ro','+40724123456'),
(2,'Akro','Brasov','office@akro.ro','+40724589556'),
(3,'ALl Green Way','Sofia','office@allgreenway.com','+3597256245'),
(4,'Art Nouveau','Lion','office@artnouveau.com','+337256885'),
(5,'Ataline Prosistem','Bistrita','office@atalineprosistem.ro','+40724523556'),
(6,'Grup Editorial','Cluj-Napoca','office@clubeditorial.ro','+40724862556'),
(7,'Hod-Chimex','Galati','office@hodchimex.ro','+40724523998'),
(8,'Valcor','Leuven','office@atalineprosistem.com','+32724523580'),
(9,'Filodi','London','office@filodi.com','+20762723556'),
(10,'Trustkp','London','office@trustkp.com','+20762723806'),
(11,'Makegood','Barcelona','office@makegood.com','+34724093506'),
(12,'Mapason','Madrid','office@mapason.ro','+34806580077'),
(13,'Nicola','Bucuresti','office@nicola.ro','+40724800900'),
(14,'Zian Art','Ghimbav','office@zianart.ro','+40749800200'),
(15,'Wise Tigers','Paulesti','office@wisetigers.ro','+40752300689'),
(16,'Time Design','Oradea','office@timedeisgn.ro','+40724879878'),
(17,'Simval Prod','Brasov','office@simvalprod.ro','+40723520520'),
(18,'Procesuality','London','office@procesuality.com','+20724523777'),
(19,'Merobis','Athena','office@merobis.ro','+30789789874'),
(20,'Medimfarm','Iasi','office@medimfarm.ro','+4072505050')
