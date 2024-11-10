--CASE STUDY--
--Car Rental System--

--Creating Database--
CREATE DATABASE CRSDB
USE CRSDB

--Creating Tables--
--Vehicle Table--

CREATE TABLE Vehicle (
vehicleID INT IDENTITY PRIMARY KEY,
make VARCHAR(20),
model INT,
dailyRate DECIMAL(10,2),
[status] VARCHAR(12) CHECK(status IN ('available','notAvailable')),
passengerCapacity INT,
engineCapacity DECIMAL(5,2)
)

--Customer Table--

CREATE TABLE Customer (
customerID INT IDENTITY PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(50) UNIQUE,
phoneNumber VARCHAR(15)
)

--Lease Table--

CREATE TABLE Lease (
leaseID INT IDENTITY PRIMARY KEY,
vehicleID INT,
customerID INT,
startDate DATE,
endDate DATE,
[type] VARCHAR(12) CHECK(type IN('DailyLease','MonthlyLease')),
CONSTRAINT FK_vehicleID FOREIGN KEY (vehicleID) REFERENCES Vehicle(VehicleID),
CONSTRAINT FK_customerID FOREIGN KEY (customerID) REFERENCES Customer(customerID)
)

--Payment Table--

CREATE TABLE Payment (
paymentID INT IDENTITY PRIMARY KEY,
leaseID INT ,
paymentDate DATE,
amount DECIMAL(10,2)
CONSTRAINT FK_leaseID FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
)