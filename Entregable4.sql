Create Database Tarea4
go 
use Tarea4
go 

--Crear una tabla (create table - sp_tables - sp_columns - drop table)
Create table agenda(
   apellido varchar(30),
   nombre varchar(20),
   domicilio varchar(30),
   telefono varchar(11),
);
Exec sp_tables @table_owner='dbo';
Exec sp_columns agenda;
Drop table agenda;

--Insertar y recuperar registros de una tabla (insert into - select)

If object_id('agenda') is not null drop table agenda;

Create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

Exec sp_tables @table_owner='dbo';
Exec sp_columns agenda;
Insert into agenda (apellido, nombre, domicilio, telefono)values ('Moreno','Alberto','Colon 123','4234567');
Insert into agenda (apellido,nombre, domicilio, telefono)values ('Torres','Juan','Avellaneda 135','4458787');
Select * from agenda;
Drop table agenda;

--Tipos de datos básicos

If object_id('peliculas')is not null drop table peliculas;

Create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );
 Exec sp_columns peliculas;
 Insert into peliculas (nombre, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',128,3);
 Insert into peliculas (nombre, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',130,2);
 Insert into peliculas (nombre, actor, duracion, cantidad) values ('Mujer bonita','Julia Roberts',118,3);
 Insert into peliculas (nombre, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',110,2);
 Select * from peliculas;
 --Recuperar algunos campos (select)

If object_id('peliculas') is not null drop table peliculas;

Create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
);
Exec sp_columns peliculas;
Insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',180,3);
Insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',190,2);
Insert into peliculas (titulo, actor, duracion, cantidad) values ('Mujer bonita','Julia Roberts',118,3);
Insert into peliculas (titulo, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',110,2);

Select titulo,actor from peliculas;
Select titulo,duracion from peliculas;
Select titulo,cantidad from peliculas;

--Recuperar algunos registros (where)
If object_id('agenda') is not null drop table agenda;

Create table agenda (
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
);

Exec sp_columns agenda;
Insert into agenda(apellido,nombre,domicilio,telefono) values('Acosta', 'Ana', 'Colon 123', '4234567');
Insert into agenda(apellido,nombre,domicilio,telefono) values('Bustamante', 'Betina', 'Avellaneda 135', '4458787');
Insert into agenda(apellido,nombre,domicilio,telefono) values('Lopez', 'Hector', 'Salta 545', '4887788'); 
Insert into agenda(apellido,nombre,domicilio,telefono) values('Lopez', 'Luis', 'Urquiza 333', '4545454');
Insert into agenda(apellido,nombre,domicilio,telefono) values('Lopez', 'Marisa', 'Urquiza 333', '4545454');

Select * from agenda;
Select * from agenda Where nombre='Marisa';
Select nombre,domicilio from agenda Where apellido='Lopez';
Select nombre from agenda Where telefono='4545454';

--Operadores relacionales
If object_id('articulos') is not null drop table articulos;

Create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
);
Exec sp_columns articulos;
Insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
Insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30);
Insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10);
Insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50);
Insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50);

select * from articulos where nombre='impresora';
select * from articulos where precio>=400;
select codigo,nombre from articulos where cantidad<30;
select nombre, descripcion from articulos where precio<>100;

--Borrar registros (delete)

If object_id('agenda') is not null drop table agenda;

Create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

Insert into agenda (apellido,nombre,domicilio,telefono) values('Alvarez','Alberto','Colon 123','4234567');
Insert into agenda (apellido,nombre,domicilio,telefono) values('Juarez','Juan','Avellaneda 135','4458787');
Insert into agenda (apellido,nombre,domicilio,telefono) values('Lopez','Maria','Urquiza 333','4545454');
Insert into agenda (apellido,nombre,domicilio,telefono) values('Lopez','Jose','Urquiza 333','4545454');
Insert into agenda (apellido,nombre,domicilio,telefono) values('Salas','Susana','Gral. Paz 1234','4123456');

Delete from agenda where nombre='Juan';
Delete from agenda where telefono='4545454';
Select * from agenda;
Delete from agenda;
Select * from agenda;

--Actualizar registros (update)

If object_id('agenda') is not null drop table agenda;
Create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
);

Insert into agenda (apellido,nombre,domicilio,telefono) values ('Acosta','Alberto','Colon 123','4234567');
Insert into agenda (apellido,nombre,domicilio,telefono) values ('Juarez','Juan','Avellaneda 135','4458787');
Insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Maria','Urquiza 333','4545454');
Insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Jose','Urquiza 333','4545454');
Insert into agenda (apellido,nombre,domicilio,telefono) values ('Suarez','Susana','Gral. Paz 1234','4123456');

Select * from agenda;
Update agenda set nombre='Juan Jose' where nombre='Juan';
Select * from agenda;
Update agenda set telefono='4445566' where telefono='4545454';
Select * from agenda;
Update agenda set nombre='Juan Jose' where nombre='Juan';
Select * from agenda;

--Valores null (is null)

If object_id('medicamentos') is not null drop table medicamentos;

Create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
);

Exec sp_columns medicamentos;
Insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(1,'Sertal gotas',null,null,100); 
Insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(2,'Sertal compuesto',null,8.90,150);
Insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(3,'Buscapina','Roche',null,200);
Select * from medicamentos;

Insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Bayaspirina','',0,150);
Insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(0,'','Bayer',15.60,0);
Select * from medicamentos;

Insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(null,'Amoxidal jarabe','Bayer',25,120);
Select * from medicamentos where laboratorio is null;
Select * from medicamentos where laboratorio='';
Select * from medicamentos where precio is null;
Select * from medicamentos  where precio=0;
Select * from medicamentos where laboratorio<>'';
Select * from medicamentos where laboratorio is not null;
Select * from medicamentos where precio<>0;
Select * from medicamentos where precio is not null;

--Clave primaria

If object_id('libros') is not null drop table libros;

Create table libros(
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
);

Insert into libros (codigo,titulo,autor,editorial) values (1,'El aleph','Borges','Emece');
Insert into libros (codigo,titulo,autor,editorial) values (2,'Martin Fierro','Jose Hernandez','Planeta');
Insert into libros (codigo,titulo,autor,editorial) values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');
Insert into libros (codigo,titulo,autor,editorial) values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
Insert into libros (codigo,titulo,autor,editorial) values (null,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');

Update libros set codigo=1 where titulo='Martin Fierro';


--Campo con atributo Identity

If object_id('medicamentos') is not null drop table medicamentos;

Create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
);
Exec sp_columns medicamentos;

Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
Select * from medicamentos;
Insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);

Update medicamentos set codigo=5 where nombre='Bayaspirina';
Delete from medicamentos where codigo=3;
Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);
Select * from medicamentos;


 -- Otras características del atributo Identity

If object_id('medicamentos') is not null drop table medicamentos;

Create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
);

Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
Select * from medicamentos;

Insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);
Set identity_insert medicamentos on;
Insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);
Insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(10,'Amoxilina 500','Bayer',15.60,100);
Select ident_seed('medicamentos');
Select ident_incr('medicamentos');

 --Truncate table
If object_id('alumnos') is not null drop table alumnos;

Create table alumnos(
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
);

Insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
Insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
Insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');
Insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');
Delete from alumnos;

Insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
Insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
Insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');
Insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');
Select * from alumnos;
Truncate table alumnos;

Insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
Insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
Insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');
Insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');
Select * from alumnos;

--Tipo de dato (texto)

if object_id('autos') is not null drop table autos;

Create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
);

Insert into autos values('ACD123','Fiat 128','1970',15000);
Insert into autos values('ACG234','Renault 11','1990',40000);
Insert into autos values('BCD333','Peugeot 505','1990',80000);
Insert into autos values('GCD123','Renault Clio','1990',70000);
Insert into autos values('BCC333','Renault Megane','1998',95000);
Insert into autos values('BVF543','Fiat 128','1975',20000);
Select * from autos where modelo='1990';

--Tipo de dato (numérico)

If object_id('cuentas') is not null drop table cuentas;

Create table cuentas(
  numero int not null,
  documento char(8),
  nombre varchar(30),
  saldo money,
  primary key (numero)
);

Insert into cuentas(numero,documento,nombre,saldo) values('1234','25666777','Pedro Perez',500000.60);
Insert into cuentas(numero,documento,nombre,saldo) values('2234','27888999','Juan Lopez',-250000);
Insert into cuentas(numero,documento,nombre,saldo) values('3344','27888999','Juan Lopez',4000.50);
Insert into cuentas(numero,documento,nombre,saldo) values('3346','32111222','Susana Molina',1000);
Select * from cuentas where saldo<4000;
Select numero,saldo from cuentas where nombre='Juan Lopez';
Select * from cuentas where saldo<0;
Select * from cuentas where numero>=3000;

--Tipo de dato (fecha y hora)

If object_id('alumnos') is not null drop table alumnos;

Create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
);
Set dateformat 'dmy';
Insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');
Insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');
Insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);
Insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

Select * from alumnos where fechaingreso<'1-1-91';
Select * from alumnos where fechanacimiento is null;
Insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null);
Set dateformat 'mdy';
Insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
Select * from alumnos;

--Ingresar algunos campos (insert into)

If object_id('cuentas') is not null drop table cuentas;

Create table cuentas(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  saldo money
);
Insert into cuentas values (1,'25666777','Juan Perez',2500.50);
Insert into cuentas values ('25666777','Juan Perez',2500.50);
Insert into cuentas (documento,saldo) values ('28999777',-5500);
Insert into cuentas (numero,documento,nombre,saldo) values (5,'28999777','Luis Lopez',34000);
Insert into cuentas (numero,documento,nombre) values (3344,'28999777','Luis Lopez',34000);
Insert into cuentas (nombre, saldo) values ('Luis Lopez',34000);
Select * from libros;

-- Valores por defecto (default)

If object_id('visitantes') is not null drop table visitantes;

Create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
);
Exec sp_columns visitantes;
Insert into visitantes (nombre, domicilio, montocompra) values ('Susana Molina','Colon 123',59.80);
Insert into visitantes (nombre, edad, ciudad, mail) values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
Select *from visitantes;
Insert into visitantes values ('Marcelo Morales',38,default,default,default,'4255232','marcelomorales@hotmail.com',default);
Insert into visitantes default values;
Select * from visitantes;

--Columnas calculadas (operadores aritméticos y de concatenación)

If object_id ('articulos') is not null drop table articulos;

Create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
);

Insert into articulos (nombre, descripcion, precio,cantidad) values ('impresora','Epson Stylus C45',400.80,20);
Insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500);
Insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800);
Insert into articulos (nombre, descripcion, precio,cantidad) values ('teclado','ingles Biswal',100,50);
Update articulos set precio=precio+(precio*0.15);
Select * from articulos;
Select nombre+','+descripcion from articulos;

Update articulos set cantidad=cantidad-5 where nombre='teclado';
Select * from articulos;

--Alias

If object_id ('libros') is not null drop table libros;

Create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
);

Insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
Insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
Insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
Select titulo, autor,editorial,precio,cantidad,precio*cantidad as 'monto total' from libros;
Select titulo,autor,precio,precio*0.1 as descuento,precio-(precio*0.1) as 'precio final' from libros where editorial='Emece';
Select titulo+'-'+autor as "Título y autor" from libros;

--Funciones para el uso de fechas y horas

If object_id ('empleados') is not null drop table empleados;

Create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
);

Insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
Insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
Insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
Insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
Insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);
Select nombre+space(1)+upper(apellido) as nombre, Stuff(documento,1,0,'DNI Nº ') as documento, Stuff(sueldo,1,0,'$ ') as sueldo from empleados;
Select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;
Select nombre,apellido from empleados where datename(month,fechanacimiento)='october';
Select nombre,apellido from empleados where datepart(year,fechaingreso)=2000; 

--Ordenar registros (order by) 

If object_id('visitas') is not null drop table visitas;

Create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
);

Insert into visitas (nombre,mail,pais,fecha) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
Insert into visitas (nombre,mail,pais,fecha) values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
Insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
Insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
Insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
Insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
Insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
Select * from visitas order by fecha desc;
Select nombre,pais,datename(month,fecha) from visitas order by pais,datename(month,fecha) desc;
Select nombre,mail, datename(month,fecha) mes, datename(day,fecha) dia, datename(hour,fecha) hora from visitas order by 3,4,5;
Select mail, pais from visitas  where datename(month,fecha)='October' order by 2;
--Operadores lógicos ( and - or - not)

If object_id('medicamentos') is not null drop table medicamentos;

Create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

Insert into medicamentos values('Sertal','Roche',5.2,100);
Insert into medicamentos values('Buscapina','Roche',4.10,200);
Insert into medicamentos values('Amoxidal 500','Bayer',15.60,100);
Insert into medicamentos values('Paracetamol 500','Bago',1.90,200);
Insert into medicamentos values('Bayaspirina','Bayer',2.10,150); 
Insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250); 
Select codigo,nombre from medicamentos where laboratorio='Roche' and precio<5;
Select * from medicamentos where laboratorio='Roche' or precio<5;
Select * from medicamentos where not laboratorio='Bayer' and cantidad=100;
Select * from medicamentos where laboratorio='Bayer' and not cantidad=100;
Delete from medicamentos where laboratorio='Bayer' and precio>10;

Update medicamentos set cantidad=200 where laboratorio='Roche' and precio>5;
Delete from medicamentos where laboratorio='Bayer' or precio<3;

--Crear y asociar reglas (create rule - sp_bindrule)

If object_id('vehiculos') is not null drop table vehiculos;
If object_id ('RG_patente_patron') is not null  drop rule RG_patente_patron;
If object_id ('RG_horallegada') is not null drop rule RG_horallegada;
If object_id ('RG_vehiculos_tipo') is not null drop rule RG_vehiculos_tipo;
If object_id ('RG_vehiculos_tipo2') is not null drop rule RG_vehiculos_tipo2;
If object_id ('RG_menor_fechaactual') is not null drop rule RG_menor_fechaactual;
Create table vehiculos( patente char(6) not null, tipo char(1),--'a'=auto, 'm'=moto horallegada datetime not null, horasalida datetime);

Insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
Insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
Insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
Insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);
Create rule RG_patente_patron as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';

 exec sp_help;

 exec sp_helpconstraint vehiculos;

 exec sp_bindrule RG_patente_patron,'vehiculos.patente';

 select * from empleados;

 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);

 create rule RG_vehiculos_tipo as @tipo in ('a','m');

 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';

 update vehiculos set tipo='c' where patente='AAA111';

 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m');

 exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';

 update vehiculos set tipo='c' where patente='AAA111';

 create rule RG_menor_fechaactual
 as @fecha <= getdate();

 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida';

 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);

 delete from vehiculos where patente='NOP555';

 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);

 alter table vehiculos
 add constraint DF_vehiculos_tipo
 default 'b'
 for tipo;

 insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30');

 exec sp_helpconstraint vehiculos;

--Eliminar y dasasociar reglas (sp_unbindrule - drop rule)

If object_id('vehiculos') is not null drop table vehiculos;
If object_id ('RG_patente_patron') is not null drop rule RG_patente_patron;
If object_id ('RG_vehiculos_tipo') is not null drop rule RG_vehiculos_tipo;
If object_id ('RG_vehiculos_tipo2') is not null drop rule RG_vehiculos_tipo2;
Create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
);

Create rule RG_patente_patron as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';
Exec sp_bindrule RG_patente_patron,'vehiculos.patente';
Insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);
Create rule RG_vehiculos_tipo as @tipo in ('a','m');
Exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';
Insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
Create rule RG_vehiculos_tipo2 as @tipo in ('a','c','m');
Exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';
Insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
Drop rule RG_vehiculos_tipo2;
Drop rule RG_vehiculos_tipo;
Drop rule RG_patente_patron;
Exec sp_unbindrule 'vehiculos.patente';
Exec sp_helpconstraint vehiculos;
Exec sp_help;
Drop rule RG_patente_patron;
Exec sp_help;

--Otros operadores relacionales (in)
If object_id('medicamentos') is not null drop table medicamentos;

Create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
);

Insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01');
Insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01');
Insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
Insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
Insert into medicamentos values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
Insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 
Select nombre,precio from medicamentos where laboratorio in ('Bayer','Bago');
Select * from medicamentos where cantidad between 1 and 5;
Select * from medicamentos where cantidad in (1,2,3,4,5);

--Valores predeterminados (create default)

if object_id ('clientes') is not null
  drop table clientes;

 if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron;
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual;

 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 );

 create rule RG_legajo_patron
 as @valor like '[A-Z][A-Z][0-9][0-9]';

 exec sp_bindrule RG_legajo_patron,'clientes.legajo';

 create default VP_legajo_patron
  as 'AA00';

 exec sp_bindefault VP_legajo_patron,'clientes.legajo';

 create default VP_datodesconocido
  as '??';

 exec sp_bindefault VP_datodesconocido,'clientes.domicilio';

 exec sp_bindefault VP_datodesconocido,'clientes.ciudad';

 insert into clientes values('GF12','Ana Perez',default,default,'Cordoba','2001-10-10');
 select * from clientes;

 exec sp_bindefault VP_datodesconocido,'clientes.provincia';

 create default VP_fechaactual
  as getdate();

 exec sp_bindefault VP_fechaactual,'clientes.fechaingreso';

 insert into clientes default values;
 select * from clientes;

 exec sp_bindefault VP_datodesconocido,'clientes.fechaingreso';

 insert into clientes default values;

 create rule RG_legajo
  as @valor like 'B%';

 exec sp_bindrule RG_legajo,'clientes.legajo';

 insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10');

 -- Modificador del group by (with cube)

If object_id('ventas') is not null drop table ventas;

Create table ventas(
  numero int identity,
  montocompra decimal(6,2),
  tipopago char(1),--c=contado, t=tarjeta
  vendedor varchar(30),
  primary key (numero)
 );

Insert into ventas values(100.50,'c','Marisa Perez');
Insert into ventas values(200,'c','Marisa Perez');
Insert into ventas values(50,'t','Juan Lopez');
Insert into ventas values(220,'c','Juan Lopez');
Insert into ventas values(150,'t','Marisa Perez');
Insert into ventas values(550.80,'c','Marisa Perez');
Insert into ventas values(300,'t','Juan Lopez');
Insert into ventas values(25,'c','Marisa Perez');
Select vendedor,tipopago, count(*) as cantidad from ventas group by vendedor,tipopago with rollup;
Select vendedor,tipopago, count(*) as cantidad from venta group by vendedor,tipopago with cube;

--Función grouping

If object_id('empleados') is not null drop table empleados;

Create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
 );

Insert into empleados values ('22222222','Alberto Lopez','m','c','Sistemas');
Insert into empleados values ('23333333','Beatriz Garcia','f','c','Administracion');
Insert into empleados values ('24444444','Carlos Fuentes','m','s','Administracion');
Insert into empleados values ('25555555','Daniel Garcia','m','s','Sistemas');
Insert into empleados values ('26666666','Ester Juarez',null,'c','Sistemas');
Insert into empleados values ('27777777','Fabian Torres',null,'s','Sistemas');
Insert into empleados values ('28888888','Gabriela Lopez','f',null,'Sistemas');
Insert into empleados values ('29999999','Hector Garcia','m',null,'Administracion');

Select sexo,estadocivil, Count(*) as cantidad from empleados group by sexo,estadocivil with rollup;
Select sexo,estadocivil, count(*) as cantidad, grouping(sexo) as 'resumen sexo', grouping(estadocivil) as 'resumen estado civil' from empleados group by sexo,estadocivil with rollup;
Select sexo,estadocivil, Count(*) as cantidad, grouping(sexo) as 'resumen sexo', grouping(estadocivil) as 'resumen estado civil' from empleados group by sexo,estadocivil with cube;

--Cláusulas compute y compute by

if object_id('inmuebles') is not null
  drop table inmuebles;

 create table inmuebles (
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2),
  monto decimal (8,2)
 );

 insert into inmuebles
  values ('11111111','Alberto Acosta','Avellaneda 800','Centro','Cordoba','e',100,1200);
 insert into inmuebles
  values ('11111111','Alberto Acosta','Sarmiento 245','Gral. Paz','Cordoba','e',200,2500);
 insert into inmuebles
  values ('22222222','Beatriz Barrios','San Martin 202','Centro','Cordoba','e',250,1900);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Paso 1234','Alberdi','Cordoba','b',200,1000);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Guemes 876','Alberdi','Cordoba','b',300,1500);
 insert into inmuebles
  values ('44444444','Diana Dominguez','Calderon 456','Matienzo','Cordoba','b',200,800);
 insert into inmuebles
  values ('55555555','Estela Fuentes','San Martin 321','Flores','Carlos Paz','e',500,4500);
 insert into inmuebles
  values ('55555555','Estela Fuentes','Lopez y Planes 853','Alberdi','Cordoba','e',350,2200);

 select *from inmuebles
 compute avg(monto);

 select *from inmuebles
  compute avg(superficie),sum(monto);

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,barrio,ciudad;

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,barrio;

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento;

 select *from inmuebles
  order by documento,barrio,ciudad compute avg(superficie),sum(monto)
  by documento,ciudad;

 select *from inmuebles
  order by documento
  compute sum(monto)
  compute avg(monto)
  by documento;

 --Creación de índices
  if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

 insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
 insert into alumnos values ('A234','23333333','Lopez','Ana',9);
 insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
 insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
 insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
 insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

 create unique clustered index I_alumnos_apellido
 on alumnos(apellido);

 create clustered index I_alumnos_apellido
 on alumnos(apellido); 

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key clustered (legajo);

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key nonclustered (legajo);

 exec sp_helpindex alumnos;

 exec sp_helpconstraint alumnos;

 create unique nonclustered index I_alumnos_documento
 on alumnos(documento);

 insert into alumnos values ('A789','27777777','Morales','Hector',8);

 exec sp_helpindex alumnos;

 create index I_alumnos_apellidonombre
  on alumnos(apellido,nombre);

 select name from sysindexes
  where name like '%alumnos%';

 alter table alumnos
  add constraint UQ_alumnos_documento
  unique (documento);

 exec sp_helpconstraint alumnos;

 exec sp_helpindex alumnos;

 select name from sysindexes
  where name like '%alumnos%';

 select name from sysindexes
  where name like 'I_%';


 --Regenerar índices

If object_id('alumnos') is not null drop table alumnos;

Create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
);

Create nonclustered index I_alumnos_apellido on alumnos(apellido); 
exec sp_helpindex alumnos;
Create nonclustered index I_alumnos_apellido on alumnos(apellido,nombre) with drop_existing;
Exec sp_helpindex alumnos;
Alter table alumnos add constraint UQ_alumnos_documento unique nonclustered (documento);
Exec sp_helpindex alumnos;

Create clustered index UQ_alumnos_documento on alumnos(documento) with drop_existing;
Create nonclustered index I_alumnos_legajo on alumnos(legajo); 
Exec sp_helpindex alumnos;
Create clustered index I_alumnos_legajo on alumnos(legajo) with drop_existing;
Exec sp_helpindex alumnos;

Create nonclustered index I_alumnos_legajo on alumnos(legajo) with drop_existing;
Create nonclustered index I_alumnos_apellido on alumnos(apellido) with drop_existing;
Create clustered index I_alumnos_apellido on alumnos(apellido) with drop_existing;
Create unique clustered index I_alumnos_legajo on alumnos(legajo) with drop_existing;
Exec sp_helpindex alumnos;
Create clustered index I_alumnos_legajo on alumnos(legajo) with drop_existing;
Exec sp_helpindex alumnos;

--Eliminar índices

if object_id('alumnos') is not null drop table alumnos;

Create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

Create nonclustered index I_alumnos_apellido on alumnos(apellido);
Alter table alumnos add constraint PK_alumnos_legajo Primary key clustered (legajo);
Exec sp_helpindex alumnos;
Drop index PK_alumnos_legajo;
Drop index I_alumnos_apellido;
Drop index alumnos.I_alumnos_apellido;
Exec sp_helpindex alumnos;

if exists (select name from sysindexes where name = 'I_alumnos_apellido') drop index alumnos.I_alumnos_apellido;

Alter table alumnos drop PK_alumnos_legajo;
Exec sp_helpindex alumnos;

--Combinación interna (inner join)

If (object_id('clientes')) is not null drop table clientes;
If (object_id('provincias')) is not null drop table provincias;

Create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

Create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

Insert into provincias (nombre) values('Cordoba');
Insert into provincias (nombre) values('Santa Fe');
Insert into provincias (nombre) values('Corrientes');
Insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
Insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
Insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
Insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
Insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
Insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
Insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

Select c.nombre,domicilio,ciudad,p.nombre from clientes as c join provincias as p on c.codigoprovincia=p.codigo;
Select c.nombre,domicilio,ciudad,p.nombre from clientes as c join provincias as p on c.codigoprovincia=p.codigo order by p.nombre;
Select c.nombre,domicilio,ciudad from clientes as c join provincias as p on c.codigoprovincia=p.codigo where p.nombre='Santa Fe';

--Combinación externa izquierda (left join)

If (object_id('clientes')) is not null drop table clientes;
If (object_id('provincias')) is not null drop table provincias;

Create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
);

Create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);

Insert into provincias (nombre) values('Cordoba');
Insert into provincias (nombre) values('Santa Fe');
Insert into provincias (nombre) values('Corrientes');
Insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
Insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
Insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
Insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
Insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
Insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
Insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

Select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p on codigoprovincia = p.codigo;
Select c.nombre,domicilio,ciudad, p.nombre from provincias as p left join clientes as c on codigoprovincia = p.codigo;

Select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p on codigoprovincia = p.codigo where p.codigo is not null;
Select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p on codigoprovincia = p.codigo where p.codigo is null order by c.nombre;
Select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p on codigoprovincia = p.codigo where p.nombre='Cordoba';

--Restricciones (foreign key)

If object_id('clientes') is not null drop table clientes;
If object_id('provincias') is not null drop table provincias;

Create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint
);

Create table provincias(
  codigo tinyint not null,
  nombre varchar(20)
);

Alter table clientes add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo);
Alter table provincias add constraint PK_provincias_codigo primary key (codigo);

Insert into provincias values(1,'Cordoba');
Insert into provincias values(2,'Santa Fe');
Insert into provincias values(3,'Misiones');
Insert into provincias values(4,'Rio Negro');
Insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
Insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
Insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);
Insert into clientes values('Luisa Lopez','Juarez 555','La Plata',6);

Alter table clientes add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo);
Delete from clientes where codigoprovincia=6; 
Alter table clientes add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo);
Insert into clientes values('Garcia Marcos','Colon 877','Lules',9);
Delete from provincias where codigo=3;
Delete from provincias where codigo=4;
Update provincias set codigo=7 where codigo=1;
Exec sp_helpconstraint clientes;
Exec sp_helpconstraint provincias;

--Restricciones foreign key en la misma tabla
If object_id('clientes') is not null drop table clientes;

Create table clientes(
  codigo int not null,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int,
  primary key(codigo)
);

Insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
Insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
Insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
Insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
Insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);
Alter table clientes add constraint FK_clientes_referenciadopor foreign key (referenciadopor) references clientes (codigo);
Update clientes set referenciadopor=90 where referenciadopor=9;
Alter table clientes add constraint FK_clientes_referenciadopor foreign key (referenciadopor) references clientes (codigo);
Exec sp_helpconstraint clientes;
Insert into clientes values(150,'Karina Gomez','Caseros 444','Cruz del Eje',8);
Update clientes set codigo=180 where codigo=90;
Delete from clientes where nombre='Marta Juarez';
Update clientes set codigo=180 where codigo=125;
Delete from clientes where codigo=110;

--Restricciones foreign key (acciones)

If object_id('clientes') is not null drop table clientes;
if object_id('provincias') is not null drop table provincias;

Create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint,
  primary key(codigo)
);

Create table provincias( codigo tinyint, nombre varchar(20), primary key (codigo));

Insert into provincias values(1,'Cordoba');
Insert into provincias values(2,'Santa Fe');
Insert into provincias values(3,'Misiones');
Insert into provincias values(4,'Rio Negro');
Insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
Insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
Insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);

Alter table clientes add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo) on update cascade on delete no action;
Delete from provincias where codigo=3;
Update provincias set codigo=9 where codigo=3;
Select * from provincias;
Select * from clientes;

Alter table clientes add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo) on update cascade,ON  delete cascade;
Drop table provincias;

--Restricciones foreign key deshabilitar y eliminar (with check - nocheck)

If object_id('clientes') is not null drop table clientes;
If object_id('provincias') is not null drop table provincias;

Create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint,
  primary key(codigo)
);

Create table provincias(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
);

Insert into provincias values(1,'Cordoba');
Insert into provincias values(2,'Santa Fe');
Insert into provincias values(3,'Misiones');
Insert into provincias values(4,'Rio Negro');
Insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
Insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
Insert into clientes values('Garcia Juan','Sucre 345','Cordoba',1);
Insert into clientes values('Lopez Susana','Caseros 998','Posadas',3);
Insert into clientes values('Marcelo Moreno','Peru 876','Viedma',4);
Insert into clientes values('Lopez Sergio','Avellaneda 333','La Plata',5);

Alter table clientes add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo) on update cascade on delete cascade;
Alter table clientes with nocheck add constraint FK_clientes_codigoprovincia foreign key (codigoprovincia) references provincias(codigo) on update cascade on delete cascade;
Exec sp_helpconstraint clientes;
Exec sp_helpconstraint provincias;
Alter table clientes nocheck constraint FK_clientes_codigoprovincia;
Exec sp_helpconstraint clientes;
Exec sp_helpconstraint provincias;

Insert into clientes values('Garcia Omar','San Martin 100','La Pampa',6);
Delete from provincias where codigo=2;
Select * from clientes;
Select * from provincias;
Update provincias set codigo=9 where codigo=3;
Select * from clientes;
Select * from provincias;

Drop table provincias;

--Combinación de más de dos tablas

If object_id('socios') is not null drop table socios;
If object_id('deportes') is not null drop table deportes;
If object_id('inscriptos') is not null drop table inscriptos;

Create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
);

Create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );

Create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
);

Insert into socios values('22222222','Ana Acosta','Avellaneda 111');
Insert into socios values('23333333','Betina Bustos','Bulnes 222');
Insert into socios values('24444444','Carlos Castro','Caseros 333');
Insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
Insert into deportes values('basquet','Juan Juarez');
Insert into deportes values('futbol','Pedro Perez');
Insert into deportes values('natacion','Marina Morales');
Insert into deportes values('tenis','Marina Morales');
Insert into inscriptos values ('22222222',3,'2006','s');
Insert into inscriptos values ('23333333',3,'2006','s');
Insert into inscriptos values ('24444444',3,'2006','n');
Insert into inscriptos values ('22222222',3,'2005','s');
Insert into inscriptos values ('22222222',3,'2007','n');
Insert into inscriptos values ('24444444',1,'2006','s');
Insert into inscriptos values ('24444444',2,'2006','s');
Insert into inscriptos values ('26666666',0,'2006','s');

Select s.nombre,d.nombre,anio from deportes as d right join inscriptos as  on codigodeporte=d.codigo left join socios as s on i.documento=s.documento;
Select s.nombre,d.nombre,anio,matricula from deportes as d full join inscriptos as i on codigodeporte=d.codigo full join socios as s on s.documento=i.documento;
Select s.nombre,d.nombre,anio,matricula from deportes as d join inscriptos as i on codigodeporte=d.codigo join socios as s on s.documento=i.documento where s.documento='22222222';

--Restricciones al crear la tabla

If object_id('inscriptos') is not null drop table inscriptos;
If object_id('socios') is not null drop table socios;
If object_id('profesores') is not null drop table profesores;
If object_id('deportes') is not null drop table deportes;

Create table profesores(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  constraint CK_profesores_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  constraint PK_profesores_documento
  primary key (documento)
);

Create table deportes(
  codigo tinyint identity,
  nombre varchar(20) not null,
  dia varchar(30)
  constraint DF_deportes_dia default('sabado'),
  profesor char(8),--documento del profesor
  constraint CK_deportes_dia_lista check (dia in ('lunes','martes','miercoles','jueves','viernes','sabado')),
  constraint PK_deportes_codigo
  primary key (codigo)
);

Create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  constraint CK_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  constraint PK_socios_numero
  primary key nonclustered(numero),
  constraint UQ_socios_documento
  unique clustered(documento)
);

Create table inscriptos(
  numerosocio int not null,
  codigodeporte tinyint,
  matricula char(1),
  constraint PK_inscriptos_numerodeporte
  primary key clustered (numerosocio,codigodeporte),
  constraint FK_inscriptos_deporte
  foreign key (codigodeporte)
  references deportes(codigo)
  on update cascade,
  constraint FK_inscriptos_socios
  foreign key (numerosocio)
  references socios(numero)
  on update cascade
  on delete cascade,
  constraint CK_matricula_valores check (matricula in ('s','n'))
);

Insert into profesores values('21111111','Andres Acosta','Avellaneda 111');
Insert into profesores values('22222222','Betina Bustos','Bulnes 222');
Insert into profesores values('23333333','Carlos Caseros','Colon 333');
Insert into deportes values('basquet','lunes',null);
Insert into deportes values('futbol','lunes','23333333');
Insert into deportes values('natacion',null,'22222222');
Insert into deportes values('padle',default,'23333333');
Insert into deportes (nombre,dia) values('tenis','jueves');
Insert into socios values('30111111','Ana Acosta','America 111');
Insert into socios values('30222222','Bernardo Bueno','Bolivia 222');
Insert into socios values('30333333','Camila Conte','Caseros 333');
Insert into socios values('30444444','Daniel Duarte','Dinamarca 444');
Insert into inscriptos values(1,3,'s');
Insert into inscriptos values(1,5,'s');
Insert into inscriptos values(2,1,'s');
Insert into inscriptos values(4,1,'n');
Insert into inscriptos values(4,4,'s');

Select s.*,d.nombre as deporte,d.dia,p.nombre as profesor from socios as s join inscriptos as i on numero=i.numerosocio join deportes as d on d.codigo=i.codigodeporte left join profesores as p on d.profesor=p.documento;
Select s.*,d.nombre as deporte,d.dia,p.nombre as profesor from socios as s full join inscriptos as i on numero=i.numerosocio left join deportes as d on d.codigo=i.codigodeporte left join profesores as p on d.profesor=p.documento;
Select p.*,d.nombre as deporte,d.dia from profesores as p left join deportes as  on d.profesor=p.documento;
Select d.nombre,count(i.codigodeporte) as cantidad from deportes as d left join inscriptos as i on d.codigo=i.codigodeporte group by d.nombre;  
Exec sp_helpconstraint socios;
Exec sp_helpconstraint deportes;
Exec sp_helpconstraint profesores;
Exec sp_helpconstraint inscriptos;

--Tipo de dato definido por el usuario (crear - informacion)

Drop table empleados;
If exists (select name from systypes where name = 'tipo_legajo') exec sp_droptype tipo_legajo;
Exec sp_addtype tipo_legajo, 'char(4)','not null';
Exec sp_help tipo_legajo;

Create table empleados(
  legajo tipo_legajo,
  documento char(8),
  nombre varchar(30)
 );

Insert into empleados default values;
Insert into empleados values('A111','22222222','Juan Perez');

--Tipo de dato definido por el usuario (asociación de reglas)

If exists (select *from systypes where name = 'tipo_año') exec sp_droptype tipo_año;
Exec sp_addtype tipo_año, 'int','null';
Exec sp_help tipo_año;

create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

Drop table clientes
If object_id ('RG_año') is not null drop rule RG_año;

Create rule RG_año as @año between 1990 and datepart(year,getdate());
Exec sp_bindrule RG_año, 'tipo_año', 'futureonly';
Exec sp_helpconstraint empleados;

Create table clientes(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
);

Exec sp_helpconstraint clientes;
Insert into empleados values('11111111','Ana Acosta',2050);
Select * from empleados;
Insert into clientes values('22222222','Juan Perez',2050);
Exec sp_unbindrule 'tipo_año';
Exec sp_helpconstraint clientes;
Exec sp_bindrule RG_año, 'tipo_año';
Insert into empleados values('33333333','Romina Guzman',1900);
Exec sp_help tipo_año;

If object_id ('RG_añonegativo') is not null drop rule RG_añonegativo;

Create rule RG_añonegativo as @año between -2000 and -1;
Exec sp_bindrule RG_añonegativo, 'clientes.añoingreso';
Exec sp_helpconstraint clientes;
Exec sp_help tipo_año;

Insert into empleados values('44444444','Pedro Perez',-1900);
Insert into clientes values('44444444','Pedro Perez',-1900);
Select * from clientes;

--Tipo de dato definido por el usuario (eliminar)

If object_id ('empleados') is not null drop table empleados;
if exists (select *from systypes where name = 'tipo_año') exec sp_droptype tipo_año;
exec sp_addtype tipo_año, 'int','null';

if object_id ('RG_año') is not null drop rule RG_año;

create rule RG_año as @año between 1990 and datepart(year,getdate());

exec sp_bindrule RG_año, 'tipo_año';

create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

insert into empleados values('22222222','Juan Lopez',1980);
insert into empleados values('22222222','Juan Lopez',2000);
drop rule RG_año;
exec sp_unbindrule 'tipo_año';
exec sp_helpconstraint empleados;
exec sp_help tipo_año;
drop rule RG_año;

exec sp_help RG_año;
insert into empleados values('22222222','Juan Lopez',1980);
exec sp_droptype tipo_año;
drop table empleados;
exec sp_help tipo_año;
exec sp_droptype tipo_año;
exec sp_help tipo_año;


-- Agregar y eliminar campos ( alter table - add - drop)

If object_id('empleados') is not null drop table empleados;

Create table empleados(
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  fechaingreso datetime
 );

Insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

Alter table empleados add sueldo decimal(5,2);
Exec sp_columns empleados;
Alter table empleados add codigo int identity;
Alter table empleados Add documento char(8) not null;
Alter table empleados add documento char(8) not null default '00000000';
Exec sp_columns empleados;
Alter table empleados drop column sueldo;
Exec sp_columns empleados;
Alter table empleados drop column documento;
Alter table empleados drop column codigo,fechaingreso;
Exec sp_columns empleados;

--Subconsultas como expresión

If object_id('alumnos') is not null drop table alumnos;

Create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento),
  constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
 );

Insert into alumnos values('30111111','Ana Algarbe',5.1);
Insert into alumnos values('30222222','Bernardo Bustamante',3.2);
Insert into alumnos values('30333333','Carolina Conte',4.5);
Insert into alumnos values('30444444','Diana Dominguez',9.7);
Insert into alumnos values('30555555','Fabian Fuentes',8.5);
Insert into alumnos values('30666666','Gaston Gonzalez',9.70);

Select alumnos.* from alumnos where nota=(select max(nota) from alumnos);
Select documento ,nombre, nota from alumnos where nota=(select nombre,max(nota) from alumnos);
Select alumnos.*, (select avg(nota) from alumnos)-nota as diferencia from alumnos where nota< (select avg(nota) from alumnos);
Update alumnos set nota=4 where nota= (select min(nota) from alumnos);
Delete from alumnos where nota< (select avg(nota) from alumnos);

--Subconsultas con in

if (object_id('ciudades')) is not null drop table ciudades;
if (object_id('clientes')) is not null drop table clientes;

create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);

create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad tinyint not null,
  primary key(codigo),
  constraint FK_clientes_ciudad
   foreign key (codigociudad)
   references ciudades(codigo)
   on update cascade,
);

insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');
insert into clientes values ('Lopez Marcos','Colon 111',1);
insert into clientes values ('Lopez Hector','San Martin 222',1);
insert into clientes values ('Perez Ana','San Martin 333',2);
insert into clientes values ('Garcia Juan','Rivadavia 444',3);
insert into clientes values ('Perez Luis','Sarmiento 555',3);
insert into clientes values ('Gomez Ines','San Martin 666',4);
insert into clientes values ('Torres Fabiola','Alem 777',5);
insert into clientes values ('Garcia Luis','Sucre 888',5);

select nombre from ciudades where codigo in (select codigociudad from clientes where domicilio like 'San Martin %');
select distinct ci.nombre from ciudades as ci join clientes as cl on codigociudad=ci.codigo where domicilio like 'San Martin%';
select nombre from ciudades where codigo not in (select codigociudad from clientes where nombre like 'G%');
select codigociudad from clientes where nombre like 'G%';


--Subconsultas any - some - all

If object_id('inscriptos') is not null drop table inscriptos;
If object_id('socios') is not null drop table socios;

Create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
Create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
  check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
  foreign key (numerosocio)
  references socios(numero)
  on update cascade
  on delete cascade,
);

Insert into socios values('23333333','Alberto Paredes','Colon 111');
Insert into socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into socios values('26666666','Hector Lopez','Sucre 344');
Insert into inscriptos values(1,'tenis',1);
Insert into inscriptos values(1,'basquet',2);
Insert into inscriptos values(1,'natacion',1);
Insert into inscriptos values(2,'tenis',9);
Insert into inscriptos values(2,'natacion',1);
Insert into inscriptos values(2,'basquet',default);
Insert into inscriptos values(2,'futbol',2);
Insert into inscriptos values(3,'tenis',8);
Insert into inscriptos values(3,'basquet',9);
Insert into inscriptos values(3,'natacion',0);
Insert into inscriptos values(4,'basquet',10);
Select numero,nombre,deporte from socios as s join inscriptos as i on numerosocio=numero;
Select nombre from socios join inscriptos as i on numero=numerosocio where deporte='natacion' and  numero= any (select numerosocio from inscriptos as i where deporte='tenis');
Select deporte from inscriptos as i where numerosocio=1 and deporte= any (select deporte from inscriptos as i where numerosocio=2);
Select i1.deporte from inscriptos as i1 join inscriptos as i2 on i1.deporte=i2.deporte where i1.numerosocio=1 and i2.numerosocio=2;
Select deporte from inscriptos as i where numerosocio=2 and cuotas>any (select cuotas from inscriptos where numerosocio=1);
Select deporte from inscriptos as i where numerosocio=2 and cuotas>all (select cuotas from inscriptos where numerosocio=1);
Delete from inscriptos where numerosocio=any (select numerosocio  from inscriptos where cuotas=0);

-- Subconsultas correlacionadas

If object_id('inscriptos') is not null drop table inscriptos;
If object_id('socios') is not null drop table socios;

Create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);
 
Create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
  check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
  foreign key (numerosocio)
  references socios(numero)
  on update cascade
  on delete cascade,
);

Insert into socios values('23333333','Alberto Paredes','Colon 111');
Insert into socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into socios values('26666666','Hector Lopez','Sucre 344');
Insert into inscriptos values(1,'tenis',1);
Insert into inscriptos values(1,'basquet',2);
Insert into inscriptos values(1,'natacion',1);
Insert into inscriptos values(2,'tenis',9);
Insert into inscriptos values(2,'natacion',1);
Insert into inscriptos values(2,'basquet',default);
Insert into inscriptos values(2,'futbol',2);
Insert into inscriptos values(3,'tenis',8);
Insert into inscriptos values(3,'basquet',9);
Insert into inscriptos values(3,'natacion',0);
Insert into inscriptos values(4,'basquet',10);
Select nombre,domicilio, (select count(*) from inscriptos as i where s.numero=i.numerosocio) as 'deportes' from socios as s;
Select nombre, (select (count(*)*10) from inscriptos as i where s.numero=i.numerosocio) as total, (select sum(i.cuotas) from inscriptos as i where s.numero=i.numerosocio) as pagas from socios as s;
Select nombre, count(i.deporte)*10 as total, sum(i.cuotas) as pagas from socios as s join inscriptos as i on numero=numerosocio group by nombre;


--Subconsulta simil autocombinación

If object_id('deportes') is not null drop table deportes;

Create table deportes(
  nombre varchar(15),
  profesor varchar(30),
  dia varchar(10),
  cuota decimal(5,2),
);
 
Insert into deportes values('tenis','Ana Lopez','lunes',20);
Insert into deportes values('natacion','Ana Lopez','martes',15);
Insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
Insert into deportes values('basquet','Gaston Garcia','jueves',15);
Insert into deportes values('padle','Juan Huerta','lunes',15);
Insert into deportes values('handball','Juan Huerta','martes',10);

Select distinct d1.profesor from deportes as d1 where d1.profesor in (select d2.profesor from deportes as d2  where d1.nombre <> d2.nombre);
Select distinct d1.profesor from deportes as d1 join deportes as d2 on d1.profesor=d2.profesor where d1.nombre<>d2.nombre;
Select nombre from deportes where nombre<>'natacion' and dia =(select dia from deportes where nombre='natacion');
Select d1.nombre from deportes as d1 join deportes as d2 on d1.dia=d2.dia where d2.nombre='natacion' and d1.nombre<>d2.nombre;

--Subconsultas correlacionadas

If object_id('inscriptos') is not null drop table inscriptos;
If object_id('socios') is not null drop table socios;

Create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);
 
Create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
  check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
  foreign key (numerosocio)
  references socios(numero)
  on update cascade
  on delete cascade,
);

Insert into socios values('23333333','Alberto Paredes','Colon 111');
Insert into socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into socios values('26666666','Hector Lopez','Sucre 344');
Insert into inscriptos values(1,'tenis',1);
Insert into inscriptos values(1,'basquet',2);
Insert into inscriptos values(1,'natacion',1);
Insert into inscriptos values(2,'tenis',9);
Insert into inscriptos values(2,'natacion',1);
Insert into inscriptos values(2,'basquet',default);
Insert into inscriptos values(2,'futbol',2);
Insert into inscriptos values(3,'tenis',8);
Insert into inscriptos values(3,'basquet',9);
Insert into inscriptos values(3,'natacion',0);
Insert into inscriptos values(4,'basquet',10);

Select nombre,domicilio, (select count(*) from inscriptos as i where s.numero=i.numerosocio) as 'deportes' from socios as s;
Select nombre, (select (count(*)*10) from inscriptos as i where s.numero=i.numerosocio) as total, (select sum(i.cuotas) from inscriptos as i where s.numero=i.numerosocio) as pagasfrom socios as s;
Select nombre,count(i.deporte)*10 as total, sum(i.cuotas) as pagas from socios as s join inscriptos as i on numero=numerosocio group by nombre;

--Subconsulta en lugar de una tabla

If object_id('inscriptos') is not null drop table inscriptos;
If object_id('socios') is not null drop table socios;
If object_id('deportes') is not null drop table deportes;

Create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

Create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 
Create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año),
  constraint FK_inscriptos_socio
  foreign key (documento)
  references socios(documento)
  on update cascade
  on delete cascade
 );

Insert into socios values('22222222','Ana Acosta','Avellaneda 111');
Insert into socios values('23333333','Betina Bustos','Bulnes 222');
Insert into socios values('24444444','Carlos Castro','Caseros 333');
Insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
Insert into deportes values('basquet','Juan Juarez');
Insert into deportes values('futbol','Pedro Perez');
Insert into deportes values('natacion','Marina Morales');
Insert into deportes values('tenis','Marina Morales');

Insert into inscriptos values ('22222222',3,'2006','s');
Insert into inscriptos values ('23333333',3,'2006','s');
Insert into inscriptos values ('24444444',3,'2006','n');
Insert into inscriptos values ('22222222',3,'2005','s');
Insert into inscriptos values ('22222222',3,'2007','n');
Insert into inscriptos values ('24444444',1,'2006','s');
Insert into inscriptos values ('24444444',2,'2006','s');

Select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor from deportes as d join inscriptos as i on d.codigo=i.codigodeporte;
Select s.nombre,td.deporte,td.profesor,td.año,td.matricula from socios as s join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor from deportes as d join inscriptos as i on d.codigo=i.codigodeporte) as td on td.documento=s.documento;

--Procedimientos almacenados (parámetros de entrada)

If object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
);

Insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
Insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
Insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
Insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
Insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');
If object_id('pa_empleados_sueldo') is not null drop procedure pa_empleados_sueldo;

Create procedure pa_empleados_sueldo @sueldo decimal(6,2) as select nombre,apellido,sueldo from empleados where sueldo>=@sueldo;
Exec pa_empleados_sueldo 400;
Exec pa_empleados_sueldo 500;
Exec pa_empleados_sueldo;

If object_id('pa_empleados_actualizar_sueldo') is not null drop procedure pa_empleados_actualizar_sueldo;
Create procedure pa_empleados_actualizar_sueldo @sueldoanterior decimal(6,2), @sueldonuevo decimal(6,2) as update empleados set sueldo=@sueldonuevo where sueldo=@sueldoanterior;
Exec pa_empleados_actualizar_sueldo 300,350;
Select * from empleados;
Exec pa_empleados_actualizar_sueldo 350;
Exec pa_empleados_actualizar_sueldo @sueldonuevo=400,@sueldoanterior=350;
Select * from empleados;
If object_id('pa_sueldototal') is not null drop procedure pa_sueldototal;
Create procedure pa_sueldototal @documento varchar(8) = '%' as select nombre,apellido, sueldototal= case  when sueldo<500 then sueldo+(cantidadhijos*200) when sueldo>=500 then sueldo+(cantidadhijos*100) end from empleados where documento like @documento;
Exec pa_sueldototal '22333333';exec pa_sueldototal '22444444';
Exec pa_sueldototal '22666666';
Exec pa_sueldototal;

--Procedimientos almacenados (parámetros de salida)

If object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
);

Insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
Insert into empleados values('22333333','Luis','Lopez',350,0,'Contaduria');
Insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
Insert into empleados values('22555555','Susana','Garcia',null,2,'Secretaria');
Insert into empleados values('22666666','Jose Maria','Morales',460,3,'Secretaria');
Insert into empleados values('22777777','Andres','Perez',580,3,'Sistemas');
Insert into empleados values('22888888','Laura','Garcia',400,3,'Secretaria');
If object_id('pa_seccion') is not null drop procedure pa_seccion;
Create procedure pa_seccion @seccion varchar(20)='%', @promedio decimal(6,2) output, @mayor decimal(6,2) output as select @promedio=avg(sueldo) from empleados where seccion like @seccion select @mayor=max(sueldo) from empleados where seccion like @seccion;
Declare @p decimal(6,2), @m decimal(6,2) execute pa_seccion 'Contaduria', @p output, @m output select @p as promedio, @m as mayor
Execute pa_seccion 'Secretaria', @p output, @m output select @p as promedio, @m as mayor;
Declare @p decimal(6,2), @m decimal(6,2) execute pa_seccion @promedio=@p output,@mayor= @m output select @p as promedio, @m as mayor;

If object_id('pa_sueldototal') is not null drop procedure pa_sueldototal;

Create procedure pa_sueldototal @documento varchar(8)='%', @sueldototal decimal(8,2) output as select @sueldototal= case  when sueldo<500 then sueldo+(cantidadhijos*200)
when sueldo>=500 then sueldo+(cantidadhijos*100) end from empleados where documento like @documento;
Declare @st decimal(8,2) exec pa_sueldototal '22666666', @st output select @st;
Declare @st decimal(8,2) exec pa_sueldototal '22999999', @st output select @st;
Declare @st decimal(8,2) exec pa_sueldototal '22555555', @st output select @st;
Declare @st decimal(8,2) exec pa_sueldototal @sueldototal=@st output select @st;

--Procedimientos almacenados (return)

If object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

Insert into empleados values('22222222','Juan','Perez',2,'Contaduria');
Insert into empleados values('22333333','Luis','Lopez',0,'Contaduria');
Insert into empleados values ('22444444','Marta','Perez',NULL,'Sistemas');
Insert into empleados values('22555555','Susana','Garcia',2,'Secretaria');
Insert into empleados values('22666666','Jose Maria','Morales',1,'Secretaria');
Insert into empleados values('22777777','Andres','Perez',3,'Sistemas');
Insert into empleados values('22888888','Laura','Garcia',3,'Secretaria');
If object_id('pa_empleados_seccion') is not null drop procedure pa_empleados_seccion;

Create procedure pa_empleados_seccion @seccion varchar(20)=null as  if @seccion is null begin  select 'Debe indicar una seccion' return end select nombre from empleados where seccion=@seccion;
Exec pa_empleados_seccion 'Secretaria';
Exec pa_empleados_seccion;

If object_id('pa_actualizarhijos') is not null drop procedure pa_actualizarhijos;

Create procedure pa_actualizarhijos @documento char(8)=null, @hijos tinyint=nullas if (@documento is null) or (@hijos is null) return 0 else  begin
Update empleados set cantidadhijos=@hijos where documento=@documento return 1 end;

Declare @retorno int exec @retorno=pa_actualizarhijos '22222222',3 select 'Registro actualizado=1' = @retorno;
select *from empleados;
Declare @retorno int exec @retorno=pa_actualizarhijos '22333333' select 'Registro actualizado=1' = @retorno;
Select *from empleados;
Declare @retorno int exec @retorno=pa_actualizarhijos '22333333',2 if @retorno=1 select 'Registro actualizado' else select 'Registro no actualizado, se necesita un documento y la cantidad de hijos';
Select *from empleados;
Declare @retorno int exec @retorno=pa_actualizarhijos @hijos=4if @retorno=1 select 'Registro actualizado' else select 'Registro no actualizado, se necesita un documento y la cantidad de hijos';

--Vistas (with check option)

If object_id('clientes') is not null drop table clientes;
If object_id('ciudades') is not null drop table ciudades;

Create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  constraint PK_ciudades
   primary key (codigo)
);

Create table clientes(
  nombre varchar(20),
  apellido varchar(20),
  documento char(8),
  domicilio varchar(30),
  codigociudad tinyint
  constraint FK_clientes_ciudad
  foreign key (codigociudad)
  references ciudades(codigo)
  on update cascade
 );

Insert into ciudades values('Cordoba');
Insert into ciudades values('Carlos Paz');
Insert into ciudades values('Cruz del Eje');
Insert into ciudades values('La Falda');
Insert into clientes values('Juan','Perez','22222222','Colon 1123',1);
Insert into clientes values('Karina','Lopez','23333333','San Martin 254',2);
Insert into clientes values('Luis','Garcia','24444444','Caseros 345',1);
Insert into clientes values('Marcos','Gonzalez','25555555','Sucre 458',3);
Insert into clientes values('Nora','Torres','26666666','Bulnes 567',1);
Insert into clientes values('Oscar','Luque','27777777','San Martin 786',4);

If object_id('vista_clientes') is not null drop view vista_clientes;

Create view vista_clientes as select apellido, cl.nombre, documento, domicilio, cl.codigociudad,ci.nombre as ciudad from clientes as cl
join ciudades as ci on codigociudad=codigo where ci.nombre='Cordoba' with check option;
select * from vista_clientes;
Update vista_clientes set apellido='Pereyra' where documento='22222222';
Select * from clientes;
Update vista_clientes set codigociudad=2 where documento='22222222';

--Tipo de dato text - ntext e image (leer)

If object_id('visitas') is not null drop table visitas;

Create table visitas (
  numero int identity,
  nombre varchar(30),
  mail varchar(50),
  pais varchar (20),
  fecha datetime
  constraint DF_visitas_fecha default getdate(),
  comentarios text,
  constraint PK_visitas
  primary key(numero)
);

Insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10',null);
Insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30',default);
Insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',default,'Excelente página');
Insert into visitas values ('Mariano Perez','PerezM@hotmail.com','Argentina','2006-11-11 14:30','Muy buena y divertida');

Declare @puntero varbinary(16) select @puntero=textptr(comentarios)  from visitas where numero=3 readtext visitas.comentarios @puntero 0 10;
Declare @puntero varbinary(16) select @puntero=textptr(comentarios)  from visitas where numero=1 readtext visitas.comentarios @puntero 0 10;
Declare @puntero varbinary(16) select @puntero=textptr(comentarios)  from visitas where numero=1 if (textvalid('visitas.comentarios', @puntero)=1)
Readtext visitas.comentarios @puntero 0 0 else select 'puntero invalido';

--Tipo de dato text - ntext e image (escribir)
If object_id('visitas') is not null drop table visitas;

Create table visitas (
  numero int identity,
  nombre varchar(30),
  mail varchar(50),
  pais varchar (20),
  fecha datetime
  constraint DF_visitas_fecha default getdate(),
  comentarios text,
  constraint PK_visitas
  primary key(numero)
);

Insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10',null);
Insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30',default);
Insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',default,'Excelente página');
Insert into visitas values ('Mariano Perez','PerezM@hotmail.com','Argentina','2006-11-11 14:30','Muy buena y divertida');
Select *from visitas;

Declare @puntero binary(16) select @puntero = textptr (comentarios) from visitas where numero=3
Writetext visitas.comentarios @puntero 'Esta página es excelente, no hay otra mejor.';
Declare @puntero binary(16) select @puntero = textptr (comentarios) from visitas where numero=3 readtext visitas.comentarios @puntero 0 0;
Declare @puntero varbinary(16) select @puntero=textptr(comentarios)  from visitas where numero=1
Writetext visitas.comentarios @puntero 'Es una muy buena página, pero tiene algunos errores.';
Declare @puntero varbinary(16) select @puntero=textptr(comentarios)  from visitas where numero=1 if (textvalid('visitas.comentarios', @puntero)=1)
Writetext visitas.comentarios @puntero 'Es una muy buena página, pero tiene algunos errores.' else select 'puntero invalido, no se actualizó el registro';
Insert into visitas values ('Salvador Quiroga','salvador@hotmail.com','Argentina','2006-09-09 18:25','');
Declare @puntero varbinary(16) select @puntero=textptr(comentarios)  from visitas where nombre='Salvador Quiroga' if (textvalid('visitas.comentarios', @puntero)=1)
Writetext visitas.comentarios @puntero 'Es una página más que interesante.';
Declare @puntero binary(16) select @puntero = textptr (comentarios) from visitas where nombre='Salvador Quiroga'
Readtext visitas.comentarios @puntero 0 0;

-- Procedimientos almacenados (insertar)

If object_id('alumnos') is not null drop table alumnos;

Create table alumnos(
  documento char(8),
  nombre varchar(40),
  nota decimal(4,2),
  primary key(documento)
);

Insert into alumnos values ('22222222','Pedro Lopez',5);
Insert into alumnos values ('23333333','Ana Lopez',4);
Insert into alumnos values ('24444444','Maria Juarez',8);
Insert into alumnos values ('25555555','Juan Garcia',5.6);
Insert into alumnos values ('26666666','Karina Torres',2);
Insert into alumnos values ('27777777','Nora Torres',7.5);
Insert into alumnos values ('28888888','Mariano Herrero',3.5);
 
If object_id('aprobados') is not null drop table aprobados;

Create table aprobados(
  documento char(8),
  nombre varchar(40),
  nota decimal(4,2)
);

If object_id('desaprobados') is not null drop table desaprobados;

Create table desaprobados(
  documento char(8),
  nombre varchar(40)
);

If object_id('pa_aprobados') is not null drop procedure pa_aprobados;
Create proc pa_aprobados as select * from alumnos where nota>=4;
Insert into aprobados exec pa_aprobados;
Select * from aprobados;
If object_id('pa_desaprobados') is not null drop procedure pa_desaprobados;
Create proc pa_desaprobados as select documento,nombre from alumnos where nota<4;
Insert into desaprobados exec pa_desaprobados;
Select * from desaprobados;


--Lenguaje de control de flujo (case)

If object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);

Insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
Insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
Insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
Insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
Insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400); 
Insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
Insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
Insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
Insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

Select sexo, count(*) as cantidad, obsequio= case  when sexo='f' then 'rosas' else 'corbata' end from empleados where datepart(month,fechanacimiento)=5 group by sexo;
Select nombre,datepart(year,fechaingreso) as añoingreso, datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
Case (datepart(year,getdate())-datepart(year,fechaingreso)) %10 when 0 then 'Si'  --si la cantidad de años es divisible por 10 else 'No' end from empleados where datepart(month,fechaingreso)=4;
Select nombre,sueldo,cantidadhijos,porhijo= case  when sueldo<=500 then 200 else 100 end, salariofamilar= case when sueldo<=500 then 200*cantidadhijos else 100*cantidadhijos end,
Sueldototal= case when sueldo<=500 then sueldo+(200*cantidadhijos) else sueldo+(100*cantidadhijos) end from empleados order by sueldototal;

--Lenguaje de control de flujo (case)

If object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);

Insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
Insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
Insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
Insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
Insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
Insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
Insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
Insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
Insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

Select sexo, count(*) as cantidad, obsequio= case  when sexo='f' then 'rosas' else 'corbata' end from empleados where datepart(month,fechanacimiento)=5 group by sexo;
Select nombre,datepart(year,fechaingreso) as añoingreso, datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
Case (datepart(year,getdate())-datepart(year,fechaingreso)) %10 when 0 then 'Si'  --si la cantidad de años es divisible por 10
Else 'No' end from empleados where datepart(month,fechaingreso)=4;

Select nombre,sueldo,cantidadhijos, porhijo= case  when sueldo<=500 then 200 else 100 end,salariofamilar= case when sueldo<=500 then 200*cantidadhijos else 100*cantidadhijos
End, sueldototal= case when sueldo<=500 then sueldo+(200*cantidadhijos) else sueldo+(100*cantidadhijos) end from empleados order by sueldototal;

--Funciones escalares (crear y llamar)

if object_id('consultas') is not null
  drop table consultas;
 if object_id('medicos') is not null
  drop table medicos;

 create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
   primary key clustered (documento)
 );

 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );

 insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');
 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

 if object_id('f_nombreDia') is not null drop function f_nombreDia;

 create function f_nombreDia
 (@fecha varchar(30))
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(weekday,@fecha)
       when 'Monday' then 'lunes'
       when 'Tuesday' then 'martes'
       when 'Wednesday' then 'miércoles'
       when 'Thursday' then 'jueves'
       when 'Friday' then 'viernes'
       when 'Saturday' then 'sábado'
       when 'Sunday' then 'domingo'
      end--case
    end--si es una fecha válida
    return @nombre
 end;
 
 if object_id('f_horario') is not null
  drop function f_horario;

 create function f_horario
 (@fecha varchar(30))
  returns varchar(5)
  as
  begin
    declare @nombre varchar(5)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
      set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
    end--si es una fecha válida
    return @nombre
 end;

 if object_id('f_fecha') is not null
  drop function f_fecha;

 create function f_fecha
 (@fecha varchar(30))
  returns varchar(12)
  as
  begin
    declare @nombre varchar(12)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+'/'
      set @nombre=@nombre+rtrim(cast(datepart(month,@fecha) as char(2)))+'/'
      set @nombre=@nombre+rtrim(cast(datepart(year,@fecha) as char(4)))
    end--si es una fecha válida
    return @nombre
 end;

 select dbo.f_nombredia(fecha) as dia,
  dbo.f_fecha(fecha) as fecha,
  dbo.f_horario(fecha) as horario,
  paciente
  from consultas as c
  join medicos as m
  on m.documento=c.medico
  where m.nombre='Alfredo Acosta';

 select fecha, m.nombre
 from consultas as c
 join medicos as m
 on m.documento=c.medico
 where dbo.f_nombredia(fecha)='sábado';

 declare @valor char(30)
 set @valor='2007/04/09'
 select dbo.f_nombreDia(@valor);

--Funciones de tabla de varias instrucciones
If object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
  primary key(documento)
);

Insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
Insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
Insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
Insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

If object_id('f_empleados') is not null drop function f_empleados;

Create function f_empleados
 (@opcion varchar(10)
 )
returns @listado table
(documento char(8),
nombre varchar(60),
domicilio varchar(60),
nacimiento varchar(12))
as 
 begin
  if @opcion not in ('total','parcial')
    set @opcion='parcial'
  if @opcion='total'
   insert @listado 
    select documento,
    (apellido+' '+nombre),
    (domicilio+' ('+ciudad+')'), 
    cast(fechanacimiento as varchar(12))
     from empleados
  else
   insert @listado
   select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
   from empleados
  return
end;

Select *from dbo.f_empleados('total');
Select *from dbo.f_empleados();
Select *from dbo.f_empleados('');
Select *from dbo.f_empleados('parcial')
Where domicilio='Cordoba';

--Funciones de tabla de varias instrucciones
if object_id('empleados') is not null drop table empleados;

Create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
   primary key(documento)
 );

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
 insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
 insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
 insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

 if object_id('f_empleados') is not null drop function f_empleados;

 create function f_empleados
 (@opcion varchar(10)
 )
 returns @listado table
 (documento char(8),
 nombre varchar(60),
 domicilio varchar(60),
 nacimiento varchar(12))
 as 
 begin
  if @opcion not in ('total','parcial')
    set @opcion='parcial'
  if @opcion='total'
   insert @listado 
    select documento,
    (apellido+' '+nombre),
    (domicilio+' ('+ciudad+')'), 
    cast(fechanacimiento as varchar(12))
     from empleados
  else
   insert @listado
   select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
   from empleados
  return
end;

select *from dbo.f_empleados('total');
select *from dbo.f_empleados();
select *from dbo.f_empleados('');
select *from dbo.f_empleados('parcial') where domicilio='Cordoba';
