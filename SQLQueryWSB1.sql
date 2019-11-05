/* 1. Napisz zapytanie, które zwróci listê pracowników,
 których nazwisko zawiera dwie litery ‘a’ (w dowolnym miejscu) 

SELECT E.LastName 
FROM Employees AS E 
WHERE E.LastName Like '%a%a%'


2. Napisz zapytanie, które poka¿e nam wszystkie osoby kontaktowe 
z nazwiskiem zaczynaj¹cym siê na ‘L’ (imiê i nazwisko w bazie to jedna kolumna). 

SELECT C.ContactName 
FROM Customers AS C 
WHERE C.ContactName Like 'L%'


3. ZnajdŸ pracowników zatrudnionych miêdzy paŸdziernikiem 1990 a marcem 1993. 
Wynik posortuj wed³ug daty zatrudnienia. 

SELECT 
YEAR(E.HireDate) AS Rok, 
MONTH(E.HireDate) AS Miesiac
FROM Employees AS E
WHERE 
E.HireDate >= '19901001'
AND E.HireDate < '19930301'
GROUP BY
YEAR(E.HireDate), MONTH(E.HireDate)
ORDER BY Miesiac

4. Stwórz zestawienie pracowników, tak jak pokazano ponizej. 

SELECT CONCAT(E.TitleOfCourtesy, ', ',E.FirstName, ', ',E.LastName, ', ',E.Title) AS Pracownicy
FROM Employees AS E 
 
5. Napisz najkrótsze zapytanie, jakie wymyœlisz. 

SELECT * FROM Orders

6. Dla klienta o ID SAVEA wybierz wszystkie zamówienia z³o¿one po 1 maja 1995.

SELECT * 
FROM Orders 
WHERE CustomerID = 'SAVEA' AND OrderDate > '19950501'

7. Dla zamówieñ o numerach od 10760 do 10849 (w³¹cznie) ustal id klienta oraz datê zamówienia.
 
SELECT O.OrderID, O.CustomerID, O.OrderDate
FROM Orders AS O 
WHERE O.OrderID > '10760' AND O.OrderID <= '10849'

8. Poka¿ te zamówienia klienta o id SAVEA, 
które by³y obs³ugiwane przez pracowników o id 2, 4 lub 6. 

SELECT *
FROM Orders  
WHERE CustomerID = 'SAVEA'
AND EmployeeID = 2
OR CustomerID = 'SAVEA'
AND EmployeeID = 4
OR CustomerID = 'SAVEA'
AND EmployeeID = 6

9. Z tabeli klientów wybierz kraj, miasto i nazwê firmy. 
Nazwa kraju ma zaczynaæ siê liter¹ A,B lub C. 

SELECT Country, City, CompanyName
FROM Customers
WHERE Country Like 'A%'
OR Country Like 'B%'
OR Country Like 'C%'

10.  Z tabeli Employees (EmployeeID, FirstName, LastName) wybierz: 
a) pracowników z UK 

SELECT EmployeeID, FirstName, LastName, Country
FROM Employees 
WHERE Country = 'UK'

b) pracowników, którzy nie s¹ z Seatle 

SELECT EmployeeID, FirstName, LastName, City
FROM Employees 
WHERE City != 'Seattle'

c) urodzeni po 1950 roku 

SELECT EmployeeID, FirstName, LastName, BirthDate
FROM Employees 
WHERE BirthDate > '19500101'

d) wszystkie panny

SELECT EmployeeID, FirstName, LastName, TitleOfCourtesy
FROM Employees 
WHERE TitleOfCourtesy = 'Ms.'

 11. Z tabeli Orders wybierz (OrderID, CustomerID) zamówienia: 
 a) dostarczone miêdzy 1 maja a 15 paŸdziernika 1996 
 
SELECT OrderID, CustomerID, ShippedDate
FROM Orders
WHERE ShippedDate >= '19960501'
AND ShippedDate <= '19961015'
 
 b) dostarczone do Australii, Niemiec i Stanów Zjednoczonych  
 
 SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry = 'Australia'
OR ShipCountry = 'Germany'
OR ShipCountry = 'USA'
 
 c) obs³ugiwane przez przewoŸnika o id 3 
 
SELECT OrderID, CustomerID, ShipVia
FROM Orders
WHERE ShipVia=3
 
 d) dostarczone do miast, których nazwa zaczyna siê na litery od A, B
 
SELECT OrderID, CustomerID, ShipCity
FROM Orders
WHERE ShipCity Like 'A%'
OR ShipCity Like 'B%'

13. Z tabeli Products wybierz (ProductID, ProductName) produkty: 
a) nale¿¹ce do kategorii nr 8 

SELECT ProductID, ProductName, CategoryID
FROM PRODUCTS
WHERE CategoryID = 8

b) takie, gdzie cena jednostkowa jest wiêksza ni¿ 14 

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice>14
ORDER BY UnitPrice ASC

c) w cenie do 15 lub powy¿ej 50 

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice<=15
OR UnitPrice>50
ORDER BY UnitPrice ASC

d) których nazwa na drugim miejscu ma literê ‘o’ */

SELECT ProductID, ProductName
FROM Products
WHERE ProductName LIKE '_o%'