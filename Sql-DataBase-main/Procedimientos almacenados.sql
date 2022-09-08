use SFCIB

-- Procedimiento Almacenado
-- CRUD: Ingresar, Dar baja, modificar,
-- buscar y listar
select * from Deptos

alter table Deptos add EstadoD bit default 1

update Deptos set EstadoD=1

create procedure NDpto
@ND nvarchar(48)
as
declare @nde as nvarchar(48)
set @nde=(select NombreDpto from Deptos
where NombreDpto=@ND)
if(@ND='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@ND=@nde)
  begin
    print 'Dpto duplicado'
  end
  else
  begin
    insert into Deptos values(@ND,1)
  end
end

select * from Deptos

NDpto 'Leon'
--Dar baja
create procedure BDpto
@ID int
as
declare @iddept as int
set @iddept=(select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@iddept=@ID)
begin
  update Deptos set EstadoD=0 where Id_Dptos=@ID
end
else
begin
  print 'Dpto no encontrado'
end

BDpto 4

select * from Deptos

-- Buscar Depto
create procedure BuscarD
@ID int
as
declare @idd as int
set @idd=(select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@ID=@idd)
begin
  select * from Deptos where Id_Dptos=@ID
end
else
begin
  print 'Depto no encontrado'
end

BuscarD 2

--Listar Deptos
create procedure ListarD
as
select * from Deptos where EstadoD=1

ListarD

-- Modificacion o Actualizacion
create procedure MDpto
@ID int,
@ND nvarchar(48)
as
declare @idd as int
set @idd=(select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@idd=@ID)
begin
  if(@ND='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    update Deptos set NombreDpto=@ND where Id_Dptos=@ID and EstadoD=1
  end
end
else
begin
  print 'Dpto no encontrado'
end

MDpto 4,'Matagalpa'

select * from Deptos

--backup database SFCIB to disk='D:\SFCIB.bak'

-- Insercion Municipios
alter table Municipios add EstadoM bit default 1 

update Municipios set EstadoM=1

create procedure NMun
@NM nvarchar(45),
@IDD int
as
declare @iddept as int
set @iddept=(select Id_Dptos from Deptos where Id_Dptos=@IDD)
if(@NM='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@IDD=@iddept)
  begin
    insert into Municipios values(@NM,@IDD)
  end
  else
  begin
    print 'Dpto no registrado'
  end
end

select * from Municipios

NMun 'Leon',4

--Dar baja Municipio
create procedure BMun
@ID int
as
declare @iddept as int
set @iddept=(select Id_Mun from Municipios where Id_Mun=@ID)
if(@iddept=@ID)
begin
  update Municipios set EstadoM=0 where Id_Mun=@ID
end
else
begin
  print 'Mun no encontrado'
end

BMun 4

select * from Municipios

-- Modificacion o Actualizacion
create procedure MMun
@ID int,
@NM nvarchar(45)
as
declare @idd as int
set @idd=(select Id_Mun from Municipios where Id_Mun=@ID)
if(@idd=@ID)
begin
  if(@NM='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    update Municipios set NombreMun=@NM where Id_Mun=@ID and EstadoM=1
  end
end
else
begin
  print 'Mun no encontrado'
end

MMun 8,'Elbichosiuuu'

select * from Municipios

-- Buscar Mun
create procedure BuscarMun
@ID int
as
declare @idd as int
set @idd=(select Id_Mun from Municipios where Id_Mun=@ID)
if(@ID=@idd)
begin
  select * from Municipios where Id_Mun=@ID
end
else
begin
  print 'Municipio no encontrado'
end

BuscarMun 2

--Listar Municipio
create procedure ListarMun
as
select * from Municipios where EstadoM=1

ListarMun


--Ingresar proveedor

alter table Proveedor add EstadoProv bit default 1 

update Proveedor set EstadoProv=1

create procedure NProv
@NP nvarchar(35),
@DP nvarchar(70),
@TP char (8),
@IDM int
as
declare @idmun as int
set @idmun=(select Id_Prov from Proveedor where Id_Prov=@IDM)
if(@NP='' or @DP='' or @TP='' )
begin
  print 'No puede ser nulo'
end
else
begin
  if(@IDM=@idmun)
  begin
    insert into Proveedor values(@NP,@DP,@TP,1,@IDM)
  end
  else
  begin
    print 'Proveedor no registrado'
  end
end

select * from Proveedor

NProv 1,'Alex Company','Tus nalgas','22224444'


















