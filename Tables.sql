-- Property definition

CREATE TABLE Property (
	Property_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Property_Type VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Zip_Code INTEGER NOT NULL,
	Square_Feet DOUBLE NOT NULL,
	Num_of_Rooms INTEGER NOT NULL,
	Features VARCHAR(100),
	Availability ENUM ('available', 'sold', 'rented'),
	Price DOUBLE
);


-- Clients definition

CREATE TABLE Clients (
  Client_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Client_Type ENUM ('buyer', 'seller', 'renter', 'landlord') NOT NULL,
  Name VARCHAR (50) NOT NULL,
  Phone_Number VARCHAR NOT NULL,
  Email VARCHAR (50),
  Address VARCHAR(100),
  Pref_Location VARCHAR(100),
  Pref_PropertyType VARCHAR(100),
  BudgetMin DOUBLE,
  BudgetMax DOUBLE,
  Notes TEXT 
);


-- Agents definition

CREATE TABLE Agents (
  Agent_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR (50) NOT NULL,
  Phone_Number VARCHAR NOT NULL,
  Email VARCHAR (50), 
  Assigned_Properties VARCHAR (200),
  Assigned_Clients VARCHAR (200),
  Properties_Sold INTEGER,
  Properties_Rented INTEGER,
  Commision DOUBLE
);


-- Transaction

CREATE TABLE Transaction (
    Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    Transaction_Type ENUM('sale', 'rental') NOT NULL,
    Property_ID INT NOT NULL,
    Client_ID INT NOT NULL,
    Agent_ID INT NOT NULL,
    Sale_Price DOUBLE,
    Rental_Fee DOUBLE,
    Commision_Ammount DOUBLE,
    Payment_Schedule VARCHAR(200),
    Transaction_Status ENUM('in-progress', 'completed', 'canceled') NOT NULL,
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID),
    FOREIGN KEY (Agent_ID) REFERENCES Agents(Agent_ID)
);
