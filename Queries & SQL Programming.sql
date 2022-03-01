USE Group_Project;
-- Stored Procedure to update salaries of employees for Salaries of Employees
DROP PROCEDURE UpdateSalary;
CREATE PROCEDURE UpdateSalary
@EmployeeID SMALLINT,
@updatedSalary INT
AS
BEGIN
	BEGIN TRANSACTION

	UPDATE SalariedEmployee
	SET Salary=@updatedSalary
	WHERE EmployeeID=@EmployeeID;

	COMMIT;
END;

EXECUTE UpdateSalary
@EmployeeID=3,
@updatedSalary=50000;

--Check the Updated Salary

SELECT * FROM SalariedEmployee WHERE EmployeeID=3;

--Trigger to insert record for Number of hours worked by Employees in EmployeeService history Table
DROP TRIGGER NumberOfHours;
CREATE TRIGGER NumberOfHours 
ON EmployeeService AFTER INSERT, UPDATE
AS 
BEGIN
	DECLARE @Pre_NoOfHours SMALLINT = (SELECT NumOfHours from Deleted),
			@Curr_NoOfHours SMALLINT = (SELECT NumOfHours FROM INSERTED);

	INSERT INTO EmployeeServiceHistory(EmployeeID, ServiceID, NumOfHours)
	SELECT EmployeeID, ServiceID, NumOfHours FROM INSERTED;

END;

--Insert a statement in EmployeeService 
INSERT INTO EmployeeService (EmployeeID, ServiceID, NumOfHours)
VALUES (16, 1, 100);

--Check if record is inserted in EmployeeServiceHistory to validate trigger execution
SELECT * FROM EmployeeServiceHistory WHERE EmployeeID=16;


-- View to know customers having a subscription

DROP VIEW subscribed_customers;
CREATE VIEW subscribed_customers AS 
SELECT c.CustomerID, c.BirthDate, c.JobTitle  FROM Customer as c
INNER JOIN CustomerSubscription as cs
ON c.CustomerID=cs.CustomerID;

SELECT * from subscribed_customers;

--View to get a list of employees hired after a 2019-11-01

DROP VIEW [Fresh Hires];
CREATE VIEW [Fresh Hires] AS
SELECT FirstName, LastName, HireDate
FROM Employee
WHERE HireDate > '2019-11-01';

SELECT * FROM [Fresh Hires];



--User defined function
DROP FUNCTION IF EXISTS getAvgSalary;
CREATE FUNCTION getAvgSalary()
  RETURNS INT
  AS
    BEGIN 
       RETURN (SELECT AVG([Salary]) FROM [SalariedEmployee])
    END

SELECT [EmployeeID], [Salary],
dbo.getAvgSalary() AS [AverageSalary]
FROM [SalariedEmployee]


-- Query to count number of employees in each skill level using aggregate functions

SELECT SkillLevel, COUNT(*) AS NoOfEmployees FROM EmployeeSkill GROUP BY SkillLevel 

-- Query demonstrating a subquery to find Employees who have worked more than 50 hours

SELECT FirstName, LastName FROM Employee WHERE EmployeeID in (
SELECT EmployeeID FROM EmployeeService WHERE NumOfHours>50)

--Query demonstrating INNER JOIN to find clients who are on medication
SELECT cl.FirstName, cl.LastName FROM Client as cl
INNER JOIN Customer as c
ON cl.CustomerID=c.CustomerID
WHERE cl.Medication='Yes';


--Queries for All tables

SELECT * FROM CustomerEmail;
SELECT * FROM CustomerPhoneNumber;
SELECT * FROM CustomerSubscription;
SELECT * FROM PaymentMethodEPayment;
SELECT * FROM PaymentMethod;
SELECT * FROM Subscription;
SELECT * FROM ClientService;
SELECT * FROM EmployeeService;
SELECT * FROM EmployeeServiceHistory;
SELECT * FROM SalariedEmployee
SELECT * FROM HourlyEmployee;
SELECT * FROM Contractor;
SELECT * FROM EmployeeSkill;
SELECT * FROM Employee;
SELECT * FROM Client;
SELECT * FROM Service;
SELECT * FROM Customer;


