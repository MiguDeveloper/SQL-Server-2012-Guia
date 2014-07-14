--++----------- CONSULTAS DE FILA SIMPLE -------------------------++
select



--++----------- CONSULTAS DE FILA MULTIPLE -----------------------++
--Vendedores con ventas mayores al promedio
select * from sales.SalesPerson
where SalesYTD>=(select avg() from );

--Los productos que dejaron de estar a la venta
--apartir del primer producto descontinuado
select name, SellEndDate from Production.Product 
where SellEndDate>=(select min(SellEndDate) 
from Production.Product where SellEndDate is not null and)