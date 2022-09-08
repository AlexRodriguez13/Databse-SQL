use SFCIB

create procedure NProd
@CP char(5),
@NP nvarchar (50),
@DP nvarchar (70),
@pp float,
@e int,
@IDP int
as
declare @idprov as int 
set @idprov=(select Id_Prov from Proveedor
where Id_Prov=@IDP)
declare @codprod as char(5)
set @codprod=(select CodProd from Productos
where CodProd=@CP)
if(@CP='' or @NP='' or @DP='')
begin 
print 'No puede ser null'
end 
else 
begin
if(@CP = @codprod)
begin
print 'No puede estar duplicado'
end 
else 
begin
if(@pp>0)
begin
if(@e>0)
begin
if(@IDP=@idprov)
begin
insert into Productos values (@CP, @NP,@DP,@pp,@e,1, @IDP)
end
else 
begin
print 'Proveedor no registrado'
end
end
else 
begin
print 'Existencia no puede ser - ni 0'
end
end
else 
begin
print 'Precio no puede ser - ni 0'
end
end
end


