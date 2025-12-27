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
HasCitizenship BIT
);

CREATE TABLE Countries
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50),
Area DECIMAL(10,2),
CityId INT
);

CREATE TABLE Cities
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50),
Area DECIMAL(10,2),
PersonId INT
);

INSERT INTO People
([Name], Surname, PhoneNumber, Email, Age, Gender, HasCitizenship)
VALUES
('Ali', 'Mammadov', 501234567, 'ali@mail.com', 25, 'Male', 1),
('Aysel', 'Huseynova', 551112233, 'aysel@mail.com', 22, 'Female', 1),
('Kamal', 'Aliyev', 701234111, 'kamal@mail.com', 30, 'Male', 0),
('Leyla', 'Quliyeva', 991234999, 'leyla@mail.com', 27, 'Female', 1),
('Nijat', 'Karimov', 771234555, 'nijat@mail.com', 35, 'Male', 0);


INSERT INTO Cities
([Name], Area, PersonId)
VALUES
('Baku', 2130.50, 1),
('Ankara', 1100.00, 2),
('Batumi', 830.75, 3),
('Munhen', 450.40, 4),
('Paris', 600.60, 5);


INSERT INTO Countries
([Name], Area, CityId)
VALUES
('Azerbaijan', 86600.00, 1),
('Turkey', 783562.00, 2),
('Georgia', 69700.00, 3),
('Germany', 357022.00, 4),
('France', 551695.00, 5);


SELECT p.[Name],p.Surname,co.[Name] CountryName, ci.[Name] CityName FROM People p
JOIN Cities ci
ON ci.PersonId = p.Id
JOIN Countries co
ON co.CityId = ci.Id

SELECT * FROM Countries ORDER BY Area;

SELECT * FROM Countries ORDER BY [Name] DESC;

SELECT *,(SELECT TOP 1 Area FROM Countries ORDER BY Area DESC) AS MaxArea FROM Countries WHERE Name LIKE 'I%';

SELECT * FROM Countries
UNION ALL
SELECT * FROM Cities



