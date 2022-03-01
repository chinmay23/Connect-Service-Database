
DROP DATABASE Group_Project;
CREATE DATABASE Group_Project;
DROP DATABASE Group_Project;
CREATE DATABASE Group_Project;
USE Group_Project;

DROP TABLE IF EXISTS CustomerEmail;
DROP TABLE IF EXISTS CustomerPhoneNumber;
DROP TABLE IF EXISTS CustomerSubscription;
DROP TABLE IF EXISTS PaymentMethodEPayment;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS ClientService;
DROP TABLE IF EXISTS EmployeeService;
DROP TABLE IF EXISTS EmployeeServiceHistory;
DROP TABLE IF EXISTS SalariedEmployee
DROP TABLE IF EXISTS HourlyEmployee;
DROP TABLE IF EXISTS Contractor;
DROP TABLE IF EXISTS EmployeeSkill;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
	CustomerID SMALLINT IDENTITY(1,1) NOT NULL,
	SSN VARCHAR(12) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	BirthDate DATE NOT NULL,
	JobTitle VARCHAR(40) NOT NULL,
CONSTRAINT PK_Customer_CustomerID Primary Key (CustomerID)
);
INSERT INTO Customer ( SSN, FirstName, LastName, BirthDate, JobTitle )
VALUES ( '123-456-6789', 'Lisa', 'Smith', '1973-03-06', 'Architect' ),
		( '763-343-2321', 'Emily', 'Black', '1965-04-03', 'Office Manager' ),
		( '232-345-9482', 'Sarah', 'Williams', '1974-05-27', 'Receptionist' ),
		( '333-232-5323', 'John', 'Thomas', '1975-06-13', 'Software Engineer' ),
		( '093-954-7864', 'Emil', 'Anderson', '1987-02-25', 'Systems Architect' ),
		( '873-737-4637', 'Soram', 'Martin', '1990-04-12', 'Cloud Engineer' ),
		( '948-432-6434', 'Hayk', 'Garcia', '1991-12-18', 'Dentist' ),
		( '437-847-8473', 'Anita', 'Clark', '1973-04-12', 'Veterinarian' ),
		( '444-574-9824', 'Emma', 'Lewis', '1984-12-19', 'Biologist' ),
		( '475-873-3932', 'Uli', 'Allen', '1981-10-14', 'Sales manager' ),
		( '439-984-8573', 'Sonja', 'Young', '1987-09-11', 'Project Manger' ),
		( '874-478-8483', 'Pete', 'Hall', '1991-09-24', 'Teacher' ),
		( '777-383-3889', 'Anna', 'Robinson', '1989-04-21', 'Psychologist' ),
		( '843-999-3948', 'Kai', 'Miller', '1993-08-23', 'Principal' ),
		( '399-493-3322', 'Esra', 'Johnson', '1992-01-13', 'Civil Engineer' )



--DROP TABLE IF EXISTS CustomerEmail;
CREATE TABLE CustomerEmail (
	CustomerID SMALLINT NOT NULL,
	Email VARCHAR(50) NOT NULL,
	CONSTRAINT PK_CustomerEmail_CustomerID_Email Primary Key (CustomerID, Email),
	CONSTRAINT FK_CustomerEmail_CustomerID Foreign Key (CustomerID) References Customer (CustomerID)
);
INSERT INTO CustomerEmail ( CustomerID, Email )
VALUES ( 1, 'lisa.smith@yahoo.com' ),
		( 2, 'emily.black@gmail.com' ),
        ( 3, 'sarahW@yahoo.com' ),
        ( 4, 'jThomas@gmail.com' ),
        ( 5, 'emil.anderson@yahoo.com' ),
        ( 6, 'soramMartin@gmail.com' ),
        ( 7, 'garciaHayk@yahoo.com' ),
        ( 8, 'anita.clark@gmail.com' ),
        ( 9, 'lewis-emma@yahoo.com' ),
        ( 10, 'uli.a@yahoo.com' ),
        ( 11, 'sonja-young@gmail.com' ),
        ( 12, 'pete.hall@yahoo.com' ),
        ( 13, 'anna.robinson2@yahoo.com' ),
        ( 14, 'millerk7@yahoo.com' ),
        ( 15, 'esra92@gmail.com' );

--DROP TABLE IF EXISTS CustomerPhoneNumber;
CREATE TABLE CustomerPhoneNumber (
	CustomerID SMALLINT NOT NULL,
	PhoneNumber VARCHAR(12) NOT NULL,
	CONSTRAINT PK_CustomerPhoneNumber_CustomerID_PhoneNumber Primary Key (CustomerID, PhoneNumber),
	CONSTRAINT FK_CustomerPhoneNumber_CustomerID Foreign Key (CustomerID) References Customer (CustomerID)
);
INSERT INTO CustomerPhoneNumber ( CustomerID, PhoneNumber )
VALUES ( 1, '801-123-1234' ),
	   ( 2, '801-222-3232' ),
       ( 3, '702-322-4444' ),
       ( 4, '201-123-2212' ),
       ( 5, '801-312-9643' ),
       ( 6, '201-123-2133' ),
       ( 7, '205-323-2212' ),
       ( 8, '801-865-3353' ),
       ( 9, '205-434-2578' ),
       ( 10, '205-353-6266' ),
       ( 11, '855-564-3555' ),
       ( 12, '702-646-6464' ),
       ( 13, '240-266-6842' ),
       ( 14, '240-954-2467' ),
       ( 15, '801-765-4446' );


--DROP TABLE IF EXISTS Service;
CREATE TABLE Service (
	ServiceID SMALLINT IDENTITY(1,1) NOT NULL,
	AdultCare BIT NOT NULL,
	ChildCare BIT NOT NULL,
	CONSTRAINT PK_Service_ServiceID PRIMARY KEY (ServiceID)
);
INSERT INTO Service (Adultcare, ChildCare)
VALUES (1, 0);
INSERT INTO Service (Adultcare, ChildCare)
VALUES (0, 1);
INSERT INTO Service (Adultcare, ChildCare)
VALUES (1, 1);

--DROP TABLE IF EXISTS Subscription;
CREATE TABLE Subscription (
	SubscriptionID SMALLINT IDENTITY(1,1) NOT NULL,
	ServiceID SMALLINT NOT NULL,
	Duration SMALLINT NOT NULL,
	Price SMALLINT NOT NULL,
	CONSTRAINT PK_Subscription_SubscriptionID PRIMARY KEY (SubscriptionID),
	CONSTRAINT FK_Service_ServiceID FOREIGN KEY (ServiceID) REFERENCES Service (ServiceID)
);
INSERT INTO Subscription (ServiceID, Duration, Price)
VALUES (1, 3, 500),
	   (2, 6, 1000),
       (3, 9, 1500),
       (2, 3, 500),
       (1, 3, 500),
       (2, 6, 1000),
       (3, 9, 1500),
       (2, 9, 1500),
       (1, 6, 1000),
       (2, 6, 1000),
       (1, 3, 500),
       (2, 3, 500),
       (1, 6, 1000),
       (2, 3, 500),
       (1, 6, 1000);
       

--DROP TABLE IF EXISTS Client;
CREATE TABLE Client (
	ClientID SMALLINT IDENTITY(1,1) NOT NULL,
	CustomerID SMALLINT NOT NULL,
	SSN VARCHAR(11) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Birthdate DATE NOT NULL,
	Allergies VARCHAR(256) NOT NULL,
	Surgeries VARCHAR(256) NOT NULL,
	Medication VARCHAR(256) NOT NULL,
	RelationWithCustomer VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Client_ClientID PRIMARY KEY (ClientID),
	CONSTRAINT FK_Customer_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);
INSERT INTO Client (CustomerID, SSN, FirstName, LastName, BirthDate, Allergies, Surgeries, Medication, RelationWithCustomer)
VALUES (1, '123-44-6363', 'John', 'Smith', '1955-10-12', 'Sulphus', 'Bypass surgery', 'Yes', 'Father'),
	   (2, '456-37-3322', 'Ella', 'Smith', '2004-11-22', '', '', 'Yes', 'Daughter'),
       (3, '789-97-8483', 'Kylie', 'Martin', '2009-02-12', '', '', 'No', 'Daughter'),
       (4, '102-31-2222', 'Steve', 'Anderson', '1945-05-08', '', 'Heart operation', 'Yes', 'Father'),
       (5, '121-77-3828', 'Lily', 'Anderson', '2012-11-02', '', '', '', 'Daugther'),
       (6, '132-22-4837', 'Emma', 'Garcia', '1949-03-12', 'Asthma', 'joint replacement', 'No', 'Mother'),
       (7, '473-83-3727', 'Sri', 'Clark', '2019-03-07', '', '', '', 'Son'),
       (8, '432-34-3844', 'Esla', 'Lewis', '2020-05-02', '', '', '', 'Son'),
       (9, '532-48-4737', 'Adam', 'Allen', '1953-04-28', '', 'Ulcer surgery', 'Yes', 'Father'),
       (10, '235-99-3882', 'Johannes', 'Young', '2015-04-08', '', '', '', 'Son'),
       (11, '765-47-3828', 'Bart', 'Hall', '1958-09-06', '', 'Bypass surgery', 'Yes', 'Father'),
       (12, '364-37-2332', 'Vivin', 'Black', '2018-03-30', 'Asthma', '', '', 'Son'),
       (13, '865-22-3333', 'Tami', 'Williams', '2018-11-12', '', '', '', 'Daugther'),
       (14, '306-11-3241', 'Ranjeeth', 'Williams', '1965-03-22', 'Sulphus', 'Bypass surgery', 'Yes', 'Father'),
       (15, '735-58-3244', 'Sofia', 'Thomas', '2021-11-11', '', '', '', 'Daugther');


--DROP TABLE IF EXISTS ClientService;
CREATE TABLE ClientService (
	ClientID SMALLINT NOT NULL,
	ServiceID SMALLINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	CONSTRAINT PK_ClientService_ClientID_ServiceID PRIMARY KEY (ClientID, ServiceID),
	CONSTRAINT FK_ClientService_ClientID FOREIGN KEY (ClientID) REFERENCES Client (ClientID),
	CONSTRAINT FK_ClientService_ServiceID FOREIGN KEY (ServiceID) REFERENCES Service (ServiceID)
);
INSERT INTO ClientService (ClientID, ServiceID, StartDate, EndDate)
VALUES (1,1, '12-05-2019', '01-05-2020'),
	(2,2, '11-06-2018', '12-05-2018'),
		(3,3, '08-08-2019', '09-05-2019'),
		(4,1, '10-06-2018', '10-31-2020'),
		(5,2, '12-06-2019', '10-08-2020'),
		(6,3, '09-01-2018', '09-15-2018'),
		(7,1, '07-23-2019', '08-05-2019'),
		(8,2, '04-15-2019', '04-30-2019'),
		(9,3, '03-20-2020', '04-10-2020'),
		(10,1, '09-01-2018', '09-15-2018'),
		(11,2, '08-08-2019', '08-30-2019'),
		(12,3, '11-06-2018', '11-20-2018'),
		(13,1, '07-23-2019', '08-05-2019'),
		(14,2, '12-05-2019', '12-20-2019'),
		(15,3, '11-05-2019', '11-20-2019');


--DROP TABLE IF EXISTS CustomerSubscription;
CREATE TABLE CustomerSubscription (
	CustomerID SMALLINT NOT NULL,
	SubscriptionID SMALLINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	CONSTRAINT PK_CustomerSubscription_CustomerID_SubscriptionID PRIMARY KEY (CustomerID, SubscriptionID),
	CONSTRAINT FK_CustomerSubscription_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
	CONSTRAINT FK_CustomerSubscription_SubscriptionID FOREIGN KEY (SubscriptionID) REFERENCES Subscription (SubscriptionID)
);
INSERT INTO CustomerSubscription(CustomerID, SubscriptionID, StartDate, EndDate) VALUES
 (1,1, '12-05-2019', '01-05-2020'),
	(2,2, '11-06-2018', '12-05-2018'),
		(3,3, '08-08-2019', '09-05-2019'),
		(4,4, '10-06-2018', '10-31-2020'),
		(5,5, '12-06-2019', '10-08-2020'),
		(6,6, '09-01-2018', '09-15-2018'),
		(7,7, '07-23-2019', '08-05-2019'),
		(8,8, '04-15-2019', '04-30-2019'),
		(9,9, '03-20-2020', '04-10-2020'),
		(10,10, '09-01-2018', '09-15-2018'),
		(11,11, '08-08-2019', '08-30-2019'),
		(12,12, '11-06-2018', '11-20-2018'),
		(13,13, '07-23-2019', '08-05-2019'),
		(14,14, '12-05-2019', '12-20-2019'),
		(15,15, '11-05-2019', '11-20-2019');

--DROP TABLE IF EXISTS PaymentMethod;
CREATE TABLE PaymentMethod (
	PaymentID VARCHAR (10) NOT NULL,
	CustomerID SMALLINT NOT NULL,
	CardNum VARCHAR(20) NOT NULL,
	ExpiryDate DATE NOT NULL,
	CONSTRAINT PK_PaymentMethod_PaymentID_CustomerID PRIMARY KEY (PaymentID),
	CONSTRAINT FK_PaymentMethod_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID) 
);
INSERT INTO PaymentMethod (PaymentID, CustomerID, CardNum, ExpiryDate)
VALUES (12345, 1, '3434-3305-5019-1234', '01-05-2025'),
		(23145, 2, '3431-3312-5022-1473', '09-15-2023'),
		(38910, 3, '3890-3901-4621-8294', '04-17-2024'),
		(65362, 4, '1278-7829-2382-2957', '03-10-2025'),
		(17890, 5, '3720-5263-2825-4725', '08-19-2024'),
		(90821, 6, '1093-3305-5019-3826', '07-20-2022'),
		(19353, 7, '9018-8374-1037-8254', '06-05-2025'),
		(82357, 8, '3748-2749-2910-1890', '09-13-2024'),
		(90125, 9, '9012-1289-4673-1039', '08-19-2022'),
		(83645, 10, '1209-1946-9436-8216', '10-09-2023'),
		(90345, 11, '1580-0198-4723-4921', '11-17-2022'),
		(83745, 12, '4738-0947-3735-2931', '02-06-2023'),
		(89154, 13, '1047-1873-0362-1493', '12-08-2024'),
		(14635, 14, '4621-0987-4728-8472', '10-05-2022'),
		(93502, 15, '1038-2847-0871-0912', '04-08-2024');

--DROP TABLE IF EXISTS PaymentMethodEPayment;
CREATE TABLE PaymentMethodEPayment (
	PaymentID VARCHAR (10) NOT NULL,
	CustomerID SMALLINT NOT NULL,
	EPaymentMethod VARCHAR(30),
	CONSTRAINT PK_PaymentMethodEPayment_PaymentID_EPaymentMethod Primary Key (PaymentID, EPaymentMethod),
	CONSTRAINT FK_PaymentMethodEPayment_PaymentID FOREIGN KEY (PaymentID) REFERENCES PaymentMethod(PaymentID),
	CONSTRAINT FK_PaymentMethodEPayment_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO PaymentMethodEPayment (PaymentID,CustomerID, EPaymentMethod) 
	VALUES 
	(12345, 1, 'Zelle'),
		(23145, 2,'Zelle'),
		(38910, 3, 'Venmo'),
		(65362, 4, 'Zelle'),
		(17890, 5, 'Venmo'),
		(90821, 6, 'Card Payment'),
		(19353, 7, 'Card Payment'),
		(82357, 8,'Card Payment'),
		(90125, 9, 'Venmo'),
		(83645, 10, 'Venmo'),
		(90345, 11, 'Zelle'),
		(83745, 12, 'Card Payment'),
		(89154, 13, 'Card Payment'),
		(14635, 14, 'Card Payment'),
		(93502, 15, 'Zelle');

--DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	EmployeeID SMALLINT IDENTITY(1,1) NOT NULL,
	SSN VARCHAR(12) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	BirthDate Date NOT NULL,
	Qualification VARCHAR(50) NOT NULL,
	HireDate Date NOT NULL,
	CONSTRAINT PK_Employee_EmployeeID Primary Key (EmployeeID)
);

INSERT INTO Employee( SSN, FirstName, LastName, BirthDate, Qualification, HireDate)
VALUES ('230-563-8304', 'John', 'Smith', '1983-03-08', 'STUDENT', '2018-05-10' ),
('185-493-8603', 'Kaerr', 'Wales', '1989-11-05', 'Bachelor in Arts', '2018-08-06' ),
('493-589-4758', 'Nelson', 'Mand', '1978-10-17', 'Master in Philosophy', '2019-03-14' ),
('402-563-8334', 'Nare', 'Wilser', '1976-06-14', 'HouseMaker', '2017-01-25' ),
('324-420-8944', 'Vishal', 'Naik', '1990-04-19', 'Child Development MS Degree', '2020-08-17' ),
('382-405-4028', 'Prem', 'Ratai', '1994-08-14', 'Masters Degrees in Adult Nursing', '2019-03-13' ),
('483-308-8430', 'Will', 'Smith', '1983-03-25', 'Advocate', '2018-07-20' ),
('319-201-8324', 'Abraham', 'John', '1989-09-16', 'Bachelor in healthcare administration', '2019-03-24' ),
('830-937-8047', 'Kary', 'Degrey', '1996-02-06', 'Master in Health Studies ', '2020-09-08' ),
('530-384-8976', 'Jacob', 'Case', '1965-07-24', 'Associate Degree in Nursing', '2019-02-15' ),
('123-562-6204', 'John', 'Wick', '1965-03-08', 'Pencil Artist', '2021-06-10' ),
('175-093-8003', 'Peter', 'Parker', '1994-11-05', 'Bachelor in Science', '2020-07-06' ),
('493-489-2733', 'Tony', 'Stark', '1977-11-17', 'PhD in Applied Physics', '2019-03-14' ),
('101-233-1231', 'Bruce', 'Banner', '1978-06-14', 'PhD in Radiation Physics', '2018-02-25' ),
('555-455-8945', 'Pepper', 'Pots', '1989-04-19', 'Child Psychology MS Degree', '2021-08-17' ),
('662-445-4448', 'Vlad', 'Impelar', '1993-07-12', 'Bachelors Degree in Adult Nursing', '2021-03-15' ),
('484-222-8810', 'Will', 'turner', '1973-04-26', 'Military Psychology', '2017-07-21' ),
('311-111-0011', 'Abraham', 'Lodhi', '1980-09-13', 'Bachelor in healthcare Management', '2016-03-22' ),
('800-900-8001', 'Lex', 'Luther', '1997-08-05', 'Master in Health Science ', '2020-09-08' ),
('537-183-8777', 'Jhon', 'Cena', '1968-07-21', 'Masters Degree in Nursing', '2018-01-15' );

--DROP TABLE IF EXISTS EmployeeSkill;
CREATE TABLE EmployeeSkill (
	EmployeeID SMALLINT NOT NULL,
	SkillName VARCHAR(50) NOT NULL,
	SkillLevel CHAR(15) DEFAULT NULL,
	CONSTRAINT PK_EmployeeSkill_EmployeeID_SkillName Primary Key ( EmployeeID, SkillName),
	CONSTRAINT FK_EmployeeSkill_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)
INSERT INTO EmployeeSkill(EmployeeID, SkillName, SkillLevel) VALUES 
(1,'Dialysis, Asthma' , 'Beginner'),
(2,'Autism, Specially Abled' , 'Intermediate'),
(3,'Mental Disorder, Panic Attacks' , 'Expert'),
(4,'Cancer, Dementia' , 'Beginner'),
(5,'Asthma, Paediatrics' , 'Intermediate'),
(6,'Specially Abled, Asthma' , 'Beginner'),
(7,'Dementia, Panic Attacks' , 'Beginner'),
(8,'Cancer, Mental Disorder, Asthma' , 'Expert'),
(9,'Dialysis' , 'Beginner'),
(10,'Mental Disorder, Panic Attacks, Dementia' , 'Expert'),
(11,'Asthma, Respiratory diseases' , 'Expert'),
(12,'Paediatrics' , 'Expert'),
(13,'Specially Abled, Asthma' , 'Intermediate'),
(14,'Cancer' , 'Expert'),
(15,'Panic Attacks, Dementia' , 'Intermediate'),
(16,'Deaf, Blind, ASL' , 'Expert'),
(17,'Asthma, Respiratory Diseases' , 'Expert'),
(18,'Physical Disability, ASL' , 'Intermediate'),
(19,'Physical Disability' , 'Expert'),
(20,'Cancer' , 'Expert');


--DROP TABLE IF EXISTS HourlyEmployee;
CREATE TABLE HourlyEmployee (
	EmployeeID SMALLINT NOT NULL,
	HourlyRate SMALLINT NOT NULL,
	CONSTRAINT FK_HourlyEmployee_EmployeeID FOREIGN KEY(EmployeeID) REFERENCES Employee (EmployeeID),
	CONSTRAINT PK_HourlyEmployee_EmployeeID PRIMARY KEY (EmployeeID)
)
INSERT INTO HourlyEmployee (EmployeeID, HourlyRate) VALUES
(1,20),
(4,23),
(6,30),
(7,20),
(9,23);

--DROP TABLE IF EXISTS SalariedEmployee;
CREATE TABLE SalariedEmployee  (
	EmployeeID		SMALLINT NOT NULL,
	Salary			INT NOT NULL,
	CONSTRAINT PK_SalariedEmployee_EmployeeID PRIMARY KEY (EmployeeID),
	CONSTRAINT FK_SalariedEmployee_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);
INSERT INTO SalariedEmployee (EmployeeID, Salary)
VALUES (3, 25000),
		(12, 23000),
	   (14, 60000),
       (16, 75000),
       (17, 100000),
       (19, 23000),
	   (11, 50000),
       (20, 65700),
       (8, 45600),
       (10, 81000);

--DROP TABLE IF EXISTS Contractor;
CREATE TABLE Contractor (
	EmployeeID		SMALLINT NOT NULL,
	ContractNumber	SMALLINT NOT NULL,
	BillingRate		SMALLINT NOT NULL,
	CONSTRAINT PK_Contractor_EmployeeID PRIMARY KEY (EmployeeID),
	CONSTRAINT FK_Contractor_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);
INSERT INTO Contractor (EmployeeID, ContractNumber, BillingRate)
VALUES (2, 7384, 50),
	   (5, 2222, 80),
       (15, 4221, 30),
       (18, 5322, 50),
       (13, 6533, 30);

--DROP TABLE IF EXISTS EmployeeService;
CREATE TABLE EmployeeService  (
	EmployeeID		SMALLINT NOT NULL,
	ServiceID		SMALLINT NOT NULL,
	NumOfHours		SMALLINT NOT NULL,

	CONSTRAINT PK_EmployeeService_EmployeeID PRIMARY KEY (EmployeeID),
	CONSTRAINT FK_EmployeeService_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID),
	CONSTRAINT FK_EmployeeService_ServiceID  FOREIGN KEY (ServiceID) REFERENCES Service (ServiceID)
);

INSERT INTO EmployeeService (EmployeeID, ServiceID, NumOfHours)
VALUES (1, 1, 100),
	   (2, 2, 20),
       (3, 3, 30),
       (4, 1, 300),
       (5, 2, 122),
       (6, 1, 120),
       (7, 2, 100),
       (8, 2, 70),
       (9, 1, 40),
       (10, 1, 80),
       (11, 2, 120),
       (12, 1, 432),
       (13, 2, 222),
       (14, 2, 123),
       (15, 1, 100);


CREATE TABLE EmployeeServiceHistory  (
	EmployeeID		SMALLINT NOT NULL,
	ServiceID		SMALLINT NOT NULL,
	NumOfHours	SMALLINT NOT NULL,

	CONSTRAINT PK_EmployeeServiceHistory_EmployeeID PRIMARY KEY (EmployeeID),
	CONSTRAINT FK_EmployeeServiceHistory_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID),
	CONSTRAINT FK_EmployeeServiceHistory_ServiceID  FOREIGN KEY (ServiceID) REFERENCES Service (ServiceID)
);
