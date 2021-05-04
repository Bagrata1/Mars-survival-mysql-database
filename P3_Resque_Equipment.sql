CREATE TABLE Ref_Equipment_Status(
Equipment_Status_Code INTEGER UNIQUE AUTO_INCREMENT,
Equipment_Status_Name VARCHAR(25),
Equipment_Status_Info VARCHAR(255) DEFAULT 'Mars Inc.' ,
PRIMARY KEY (Equipment_Status_Code));

INSERT INTO Ref_Equipment_Status(Equipment_Status_Name, Equipment_status_Info)
VALUES ('Available', 'Mars Mission'),
('In Use', 'Mars Mission'),
('Damaged', 'Mars Mission'),
('Missing', 'Mars Mission');


CREATE TABLE Ref_Equipment_Types(
Equipment_Type_Code INTEGER UNIQUE AUTO_INCREMENT,
Equipment_Type_Name VARCHAR(50),
Equipment_Type_Info VARCHAR(255) DEFAULT 'TOOLS',
PRIMARY KEY (Equipment_Type_Code));

INSERT INTO Ref_Equipment_Types(Equipment_Type_Name, Equipment_Type_Info)
VALUES ('Medic', 'Medical'),
('Fire', 'Fire Hazards'),
('Ground', 'Tools For Ground Work'),
('Handyman', 'All-round tools'),
('Safety', 'Safety equipment'),
('Drones', 'AI Drones for search and rescue'),
('Robots', 'S & R Robots'),
('Flares', 'Flares for rescue'),
('Rope', 'Ropes'),
('Ascender', 'ascender for rock climbing');

SELECT * FROM Ref_Equipment_Types;

CREATE TABLE Ref_Locations(
Location_Code INTEGER UNIQUE AUTO_INCREMENT,
Location_Description VARCHAR(255) NOT NULL,
PRIMARY KEY(Location_Code));

INSERT INTO Ref_Locations (Location_Description)
VALUES ('Main Base'),
('Departure Point A'),
('Departure Point B'),
('Arrival Point C'),
('Arrival Point D'),
('Hangar'),
('Barracks'),
('Hospital'),
('Warehouse'),
('Office Area'),
('Lab 1'),
('Lab 2');

SELECT * FROM Ref_Locations;

CREATE TABLE Equipment(
Equipment_RFID INTEGER UNIQUE AUTO_INCREMENT,
Equipment_Status_Code INTEGER NOT NULL,
Equipment_Type_Code INTEGER NOT NULL,
Location_Code INTEGER NOT NULL,
Equipment_Name VARCHAR(50) NOT NULL,
PRIMARY KEY (Equipment_RFID),
FOREIGN KEY (Equipment_Status_Code) REFERENCES Ref_Equipment_Status(Equipment_Status_Code) ON DELETE CASCADE,
FOREIGN KEY (Equipment_Type_Code) REFERENCES Ref_Equipment_Types(Equipment_Type_Code) ON DELETE CASCADE,
FOREIGN KEY (Location_Code) REFERENCES Ref_Locations(Location_Code)ON DELETE CASCADE);

INSERT INTO Equipment(Equipment_Status_Code, Equipment_Type_Code, Location_Code, Equipment_Name)
VALUES (1,1,1,'Band-Aid'),
(1,1,1,'First-Aid Kit'),
(1,1,1,'Oxygen Tank'),
(1,1,1,'Aspirin'),
(2,1,2,'Foil Blanket'),
(1,2,2,'CO2 Tank'),
(1,2,3,'Extinguisher'),
(1,3,4,'Excavator'),
(1,3,5,'Sample Robot'),
(2,4,6,'Hammer'),
(1,4,7,'Screwdriver'),
(2,5,8,'Safety Manual'),
(1,5,9,'Safety Box'),
(2,6,1,'Search Drone'),
(1,6,1,'Maintenance Drone'),
(1,7,2,'Sample Robot'),
(1,7,4,'DNA Robot'),
(3,7,3,'Hound'),
(3,8,7,'Safety Rope'),
(4,9,8,'Basic Ascender'),
(4,9,8,'Ultra Ascender');







CREATE TABLE Users(
User_ID INTEGER UNIQUE AUTO_INCREMENT,
User_Name VARCHAR(255),
PRIMARY KEY (User_ID));

INSERT INTO Users(User_Name)
VALUES 
('Andrew Brooks'),
('Irakli Bagratishvili'),
('Sebastiaan Bye'),
('Thrisha Dev'),
('Zoe El-Hage'),
('Darong Groot'),
('Derin Guven'),
('Annelies Jong de'),
('Maggie Maliszewski'),
('Veerle Maslowski'),
('India Nunes'),
('Elise Steenvoorden'),
('Jan Stelmaszczyk'),
('Kalle Valkeakari'),
('Sukhuma Wattanasiriwech'),
('Marise Wijk van');

SELECT * FROM Users;

CREATE TABLE User_Equipment_Requests(
User_ID INTEGER UNIQUE NOT NULL,
Equipment_RFID INTEGER NOT NULL,
Date_Requested DATE,
Date_Returned DATE DEFAULT NULL,
PRIMARY KEY (Date_Requested),
FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
FOREIGN KEY(Equipment_RFID) REFERENCES Equipment(Equipment_RFID) ON DELETE CASCADE); 


INSERT INTO User_Equipment_Requests(User_ID, Equipment_RFID, Date_Requested)
VALUES
(2,2,'2031-05-11'),
(3,3,'2031-06-01'),
(4,4,'2031-07-01'),
(5,5,'2031-08-11'),
(6,6,'2031-03-05'),
(7,7,'2031-03-12'),
(8,8,'2031-03-26'),
(9,9,'2031-12-12'),
(10,10,'2031-06-02'),
(11,11,'2031-12-09'),
(14,12,'2031-10-04'),
(12,13,'2031-06-12'),
(13,14,'2031-05-02'),
(15,15,'2031-02-05');

/* Checking Which User Requested The Item.*/
SELECT Users.User_ID, Users.User_Name, user_equipment_requests.Date_Requested, Equipment.Equipment_Name
FROM User_Equipment_Requests
LEFT JOIN Users ON Users.User_ID = user_equipment_requests.User_ID
LEFT JOIN Equipment ON Equipment.Equipment_RFID = User_equipment_Requests.Equipment_RFID;

/* Checking Status of an item*/
SELECT Equipment.Equipment_RFID, Equipment.Equipment_Name, Ref_Equipment_Status.Equipment_Status_Code, 
Ref_Equipment_Status.Equipment_Status_Name, Ref_Locations.Location_Code
FROM Equipment
LEFT JOIN Ref_Equipment_Status ON Ref_Equipment_Status.Equipment_Status_Code = Equipment.Equipment_Status_Code
LEFT JOIN Ref_Locations ON Ref_Locations.Location_Code = Equipment.Location_Code;


