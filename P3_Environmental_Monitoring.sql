CREATE TABLE Inspectors(
Inspector_ID INTEGER UNIQUE AUTO_INCREMENT,
Inspector_Name VARCHAR(100) NOT NULL,
PRIMARY KEY (Inspector_ID));

SELECT * FROM Inspectors;

INSERT INTO Inspectors(Inspector_Name)
VALUES('Andrew Brooks'),
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



CREATE TABLE Ref_Calendar(
Inspection_Date DATE NOT NULL,
Year INTEGER DEFAULT 2031,
PRIMARY KEY (Inspection_Date));

INSERT INTO Ref_Calendar(Inspection_Date)
VALUES('2032-01-01'),
('2031-03-11'),
('2033-05-05'),
('2031-03-04'),
('2031-11-01'),
('2031-12-06'),
('2031-07-01'),
('2032-03-01'),
('2031-08-11'),
('2031-10-10'),
('2031-11-03'),
('2031-08-04');

SELECT Inspection_Date FROM Ref_calendar;

CREATE TABLE Ref_Grades(
Grade_Colour VARCHAR(50) NOT NULL,
Grade VARCHAR(50) NOT NULL,
Grade_Description VARCHAR(255),
PRIMARY KEY (Grade_Colour));

INSERT INTO Ref_Grades(Grade_Colour, Grade, Grade_Description)
VALUES('Green', 'A',' A = Green '),
('Orange', 'B', 'B = Orange'),
('Red', 'C', 'C = Red'),
('Blue', 'D', 'D = Blue');

SELECT * FROM Ref_Grades;

CREATE TABLE Location(
Location_ID INTEGER UNIQUE AUTO_INCREMENT NOT NULL,
Location_Name VARCHAR(255),
PRIMARY KEY (Location_Name));

INSERT INTO Location(Location_Name)
VALUES('Kaiser Sea'),
	('Lockyer Land'),
    ('Main Sea'),
    ('Herschell II Strait'),
    ('Dawes Continent'),
    ('De La Rue Ocean'),
    ('Lockyer Sea'),
    ('Dawes Sea'),
    ('Cassini Land'),
    ('Secchi Continent');

Select * From location;

CREATE TABLE Environmental_Monitoring(
Event_ID INTEGER UNIQUE AUTO_INCREMENT,
Inspection_Date DATE NOT NULL,
Grade_Colour VARCHAR(12) NOT NULL,
Inspector_ID INTEGER NOT NULL,
Location_Name VARCHAR(255),
Location_ID INTEGER NOT NULL,
Primary KEY(Event_ID),
FOREIGN KEY(Inspection_Date) REFERENCES Ref_Calendar(Inspection_Date) ON DELETE CASCADE,
FOREIGN KEY(Grade_Colour) REFERENCES Ref_Grades(Grade_Colour) ON DELETE CASCADE,
FOREIGN KEY(Inspector_ID) REFERENCES Inspectors(Inspector_ID) ON DELETE CASCADE,
FOREIGN KEY(Location_Name) REFERENCES Location(Location_Name) ON DELETE CASCADE,
FOREIGN KEY(Location_ID) REFERENCES Location(Location_ID) ON DELETE CASCADE);


INSERT INTO Environmental_Monitoring(Inspection_Date, Grade_Colour, Inspector_ID, Location_ID)
VALUES ('2032-01-01', 'Green', 1,2),
('2031-03-11', 'Green',1,1),
('2033-05-05', 'Green',3,3),
('2031-03-04','Orange',4,2),
('2031-11-01','Red',2,4),
('2031-12-06','Orange',9,6),
('2031-07-01','Green',12,7),
('2032-03-01','Orange',7,5),
('2031-08-11','Green',8,8),
('2031-10-10','Blue',11,3),
('2031-11-03','Green',13,2),
('2031-08-04','Green',6,4);



/* Order by Date Which inspectors (Name and ID) carried out monitoring with corresponding results (Grade_Colour).*/

SELECT Environmental_Monitoring.Event_ID, Ref_Calendar.Inspection_Date, Ref_grades.Grade_Colour, Inspectors.Inspector_Name, 
Inspectors.Inspector_ID
FROM Environmental_Monitoring
LEFT JOIN Ref_Calendar ON Ref_Calendar.Inspection_Date = Environmental_Monitoring.Inspection_Date
LEFT JOIN Ref_Grades ON Ref_grades.Grade_Colour = Environmental_Monitoring.Grade_Colour
LEFT JOIN Location ON Location.Location_Name = Environmental_Monitoring.Location_Name
LEFT JOIN Inspectors ON Inspectors.Inspector_ID = Environmental_Monitoring.Inspector_ID
ORDER BY inspection_date;

