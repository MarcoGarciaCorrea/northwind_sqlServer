

--1. Seleccione nombre y fecha de nacimiento de empleados.
SELECT FirstName, BirthDate FROM Employees

--2. Muestre apellido, nombre, salario y salario mensual anualizado de los empleados.
SELECT LastName,FirstName, Salary*12 FROM Employees

--3. Muestre apellido, nombre y salario al año pero llame a la columna Total de los empleados.
SELECT LastName,FirstName,Salary*12 AS 'Total' FROM Employees

--4. Muestre la lista de títulos de la tabla empleados sin que se repitan los datos.
SELECT  DISTINCT Title  FROM Employees
 
--5.Seleccione nombre y apellidos de los empleados ordenados por apellido ascendentemente.
SELECT FirstName,LastName FROM Employees ORDER BY LastName ASC

--6. Seleccione nombre y apellidos de los 3 primeros empleados ordenados por fecha de nacimiento descendentemente.
SELECT TOP 3 FirstName,LastName FROM Employees ORDER BY BirthDate DESC

--7. Muestre el código de orden, código de cliente, y fecha de orden de la tabla Ordenes, ordenados por código de cliente ascendentemente y luego por fecha de orden descendentemente.
SELECT orderId, customerID,OrderDate FROM Orders ORDER BY customerID ASC , OrderDate DESC

--8. Seleccione todos los atributos del detalle de la Orden filtrando que el precio unitario este entre 15 y 30.
SELECT * FROM OrderDetails where UnitPrice>=15 and UnitPrice<=30

--9. Seleccione todos los atributos del detalle de la Orden filtrando que el código de producto sea 5 o que tenga descuento.
SELECT * FROM OrderDetails where ProductID=5 or Discount>0
--10. En la tabla de clientes, muestre concatenados pero separados por llámele Fec.
SELECT (LastName +' S/.'+convert(varchar(10), Salary ))AS Fec FROM Employees

--11.	Muestre el código, nombre de producto, nombre de la categoría de las tablas producto y categorías, filtrando para enseñar solo aquellos que están descontinuados. 
SELECT  c.categoryId,p.productID, p.productName FROM Categories c inner join Products p ON p.CategoryID=c.CategoryID WHERE p.Discontinued=1

--12.	Muestre el código, nombre de empresa de los proveedores y fecha de orden de los proveedores que han participado con sus productos en Ordenes filtrado tal que solo se consideran las fechas de Orden de Marzo.
SELECT s.supplierID, s.CompanyName, o.orderDate FROM Orders o 
INNER JOIN OrderDetails d on (o.OrderID=d.orderID)
INNER JOIN Products p on (p.ProductID=d.ProductID)
INNER JOIN Suppliers s on (s.SupplierID=p.SupplierID)
WHERE MONTH(o.OrderDate)=3










