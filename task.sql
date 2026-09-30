CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IPRange, CountryID)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL AUTO_INCREMENT,
    IPRange VARCHAR(255) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=Memory;

-- Create a table for storing product descriptions for different countries (Columns: ID, Description, ProductID, CountryID)
CREATE TABLE ProductDescription (
    ID INT NOT NULL AUTO_INCREMENT,
    Description TEXT,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Timestamp, Message)
CREATE TABLE Logs (
    ID INT NOT NULL AUTO_INCREMENT,
    Timestamp DATETIME NOT NULL,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Create a table for storing reporting data, which will be sent to a separate application in CSV format for analytics purposes (Columns: Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
