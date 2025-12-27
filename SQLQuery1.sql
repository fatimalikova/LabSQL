CREATE DATABASE DemoApp

USE DemoApp

CREATE TABLE People 
(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50),
Surname NVARCHAR(50),
PhoneNumber INT,
Email NVARCHAR(50),
Age INT NOT NULL,
Gender NVARCHAR(50),
HasCitizenship BIT,
CityId INT
);

CREATE TABLE Countries
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50),
Area DECIMAL(10,2)

);

CREATE TABLE Cities
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50),
Area DECIMAL(10,2),
CountryId INT
);

INSERT INTO Countries ([Name], Area)
VALUES
('USA', 9833520.00),
('Germany', 357022.00),
('France', 551695.00);


INSERT INTO Cities ([Name], Area, CountryId)
VALUES
('New York', 783.80, 1),
('Berlin', 891.80, 2),
('Paris', 105.40, 3);

INSERT INTO People
([Name], Surname, PhoneNumber, Email, Age, Gender, HasCitizenship, CityId)
VALUES
('John', 'Smith', 123456789, 'john.smith@email.com', 25, 'Male', 1, 1),
('Anna', 'Muller', 987654321, 'anna.muller@email.com', 30, 'Female', 1, 2),
('Pierre', 'Dubois', 555666777, 'pierre.dubois@email.com', 22, 'Male', 0, 3);



SELECT p.[Name],p.Surname,co.[Name] CountryName, ci.[Name] CityName FROM People p
JOIN Cities ci
ON ci.Id = p.CityId
JOIN Countries co
ON co.Id = ci.CountryId

SELECT * FROM Countries ORDER BY Area ASC;

SELECT * FROM Countries ORDER BY [Name] DESC;

SELECT COUNT(*) AS CountryCount FROM Countries WHERE Area > 20000;

SELECT *,(SELECT TOP 1 Area FROM Countries ORDER BY Area DESC) 
AS MaxArea FROM Countries WHERE Name LIKE 'I%';

SELECT MAX(Area) AS MaxArea FROM Countries WHERE [Name] LIKE N'İ%';

SELECT [Name] AS PlaceName FROM Countries
UNION
SELECT [Name]
FROM Cities;

SELECT c.[Name] AS CityName, COUNT(p.Id) AS PersonCount FROM Cities c LEFT JOIN People p ON p.CityId = c.Id
GROUP BY c.[Name];


SELECT c.[Name] AS CityName, COUNT(p.Id) AS PersonCount FROM Cities c
JOIN People p ON p.CityId = c.Id
GROUP BY c.[Name]
HAVING COUNT(p.Id) > 50000;

