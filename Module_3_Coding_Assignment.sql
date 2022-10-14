-- Using a subquery, find the names of all the tracks for the album "Californication".
Select Name 
  from Tracks
  Join Albums
    on Albums.AlbumID = Tracks.AlbumID
Where Title IN (SELECT Title
  FROM Albums
WHERE Title = 'Californication') 

--Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT Count(InvoiceID), FirstName, LastName, City, Email
  FROM Invoices
  JOIN Customers
    ON Invoices.CustomerID = Customers.CustomerID
Group by Customers.CustomerID

--Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT Tracks.Name, Title, Albums.ArtistID, TrackID
  FROM Tracks
  JOIN Albums
    ON Albums.AlbumID = Tracks.AlbumID

--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT *
  FROM Employees
Where Title LIKE '%Manager%'
UNION
SELECT *
  FROM Employees
WHERE Title NOT LIKE '%Manager%' AND ReportsTo = 6

--Find the name and ID of the artists who do not have albums. 
Select Name, Artists.ArtistID, AlbumId
from Artists
left join Albums
  on Artists. ArtistID = Albums.ArtistID
where AlbumID IS NULL

--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT FirstName, LastName
  FROM Customers
UNION
SELECT FirstName, LastName
  FROM Employees
 ORDER BY Lastname DESC

 --See if there are any customers who have a different city listed in their billing city versus their customer city.
 Select Customers.CustomerId, City, BillingCity
  FROM Invoices
  JOIN Customers
    ON Customers.CustomerId = Invoices.CustomerId
 WHERE City != BillingCity

 