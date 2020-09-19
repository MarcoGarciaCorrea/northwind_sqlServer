--1. Seleccione todo de la tabla clientes cuyo país es USA o UK
select *
from Customers
where Country in ('USA','UK')

--2. Seleccione todos los atributos de la tabla clientes cuya región es NULL
select *
from Customers
where Region IS NULL

--3.Seleccione todos los atributos de la tabla clientes cuya región NO es NULL
select *
from Customers
where Region IS NOT NULL

--4. Seleccione todos los atributos de la tabla clientes con nombre de compañía contiene las letras “por”
select *
from Customers
where CompanyName like '%por%'

--5. Seleccione todos los atributos de la tabla clientes con nombre de compañía que empiece con las letras “Fr”
select *
from Customers
where CompanyName like 'Fr%'

--6.Seleccione todos los atributos de la tabla clientes con nombre de compañía que la primera letra no importe cual sea, pero la segunda sea “r” y el resto de letras que sea cualquiera.
select *
from Customers
where CompanyName like '_r%'

--7. Seleccione todos los atributos de la tabla EMPLEADOS que tienen su ID entre los valores 3 y 7
select *
from Employees
where EmployeeID between 3 and 7;

--8. Seleccione todos los atributos de la tabla EMPLEADOS que nacieron entre el 01 de enero de 1950 y el 31 de diciembre de 1960.
select *
from Employees
where BirthDate between '19500101' and '19601231';

--9. Para mostrar resúmenes agrupados por una o varias columnas. De la tabla de ordenes, mostrar la cantidad de ordenes para cada país (campo ShipCountry).
select ShipCountry,count (ShipCountry) as Cantidad
from Orders
group by ShipCountry

--10. Muestre de la tabla de empleados la suma de salario por país (Country)
select Country,sum (Salary) as Suma
from Employees
group by Country

--11. Muestre de la tabla de productos el máximo y mínimo precio unitario por categoría.
select CategoryID,min (UnitPrice) as Mínimo, max (UnitPrice) as Máximo
from Products
group by CategoryID

--12. De la tabla de ordenes, mostrar por cada mes del año según la fecha de la orden (orderdate), cual es el promedio de cobro de envío (freight). Ordene los resultados por número de mes.
select month(OrderDate) as NúmerodeMes, avg(Freight) as Promedio
from Orders
group by month(OrderDate) order by month(OrderDate);

--13. De la tabla Clientes muestre la cantidad de registros, la cantidad de registros según la columna país (country) que no tiene nulos, la cantidad de registros según la columna región (region) que tiene nulos.
select count(*) as Total,count(country)as País, sum(case when region is null then 1 else 0 end) as Región
from customers

--14. De empleados muestre la suma de todos los salarios
select sum(salary)
from Employees

--15. De la tabla de órdenes, mostrar por cada mes del año según la fecha de la orden (orderdate), cual es el promedio de cobro de envío (freight). Ordene los resultados por número de mes. Esta es una consulta de la lámina anterior, pero ahora deberá filtrar aquellos meses con promedio de cobro de envío >= 80
select month(OrderDate) as NúmerodeMes, avg(Freight) as Promedio
from Orders
group by month(OrderDate) 
having avg(freight)>=80
order by month(OrderDate)

--16. Repita	la	anterior	consulta	pero	que	además	 solo	se considere los empleados con cargo Representante de ventas
select month(o.OrderDate) as NúmerodeMes, avg(o.Freight) as Promedio
from Orders o
inner join Employees e on o.EmployeeID=e.EmployeeID
where e.Title = 'Sales Representative'
group by month(o.OrderDate) 
having avg(o.freight)>=80
order by month(o.OrderDate)

--17. Muestre el código de Orden y la cantidad de detalles que tiene cada una, pero filtrando que la cantidad de detalles debe ser >= 3 y <= que 5.
SELECT o.OrderID,COUNT(od.OrderID) as 'Cantidad de Productos' 
FROM Orders o
INNER JOIN OrderDetails od 
ON o.OrderID = od.OrderID 
GROUP BY o.OrderID 
HAVING COUNT(od.OrderID) BETWEEN 3 AND 5

--18. De la tabla empleados, muestre el apellido y una columna que se llamara Situación y que retorne “Gringo con Dinero” si es de USA y gana más de 3000, que retorne “Ingles con Dinero” si es de UK y gana más de 3000. En cualquier otro caso que retorne “Pobre”.
select LastName, 
case when salary >= 3000 and Country ='USA' then 'Gringo con dinero' 
when salary >=3000 and Country ='UK' then 'Ingles con dinero' else 'pobre' end as situación
from employees

--19. De la tabla de empleados, mostrar el título de la persona en español y su apellido
select case
when title='Sales Representative' then 'Representante de ventas' 
when title='Vice President, Sales' then 'Vicepresidente de Ventas' 
when title='Sales Manager' then 'Gerente de ventas'
when title='Inside Sales Coordinator' then 'Coordinador de ventas internas'
end as Título, lastname from Employees

--20.De la tabla ordenes, muestre por cada empleado el total de envío por mes de enero a junio, con presentación tipo tabla
select e.FirstName, count(o.employeeID) as "total de envios"
from orders o
inner join Employees e
on o.EmployeeID=e.EmployeeID 
where month(o.OrderDate) between 1 and 6
group by e.FirstName

