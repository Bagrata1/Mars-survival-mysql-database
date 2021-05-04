CREATE TABLE Locations(
Location_ID VARCHAR(15) NOT NULL,
Location_Details VARCHAR(255),
PRIMARY KEY (Location_ID));

Select * From Locations;

CREATE TABLE First_Aid_Kit(
First_Aid_Kit_ID VARCHAR(15) NOT NULL,
First_Aid_Kit_Details VARCHAR(255),
PRIMARY KEY (First_Aid_Kit_ID));

SELECT * FROM First_Aid_Kit;

CREATE TABLE Storage(
Storage_ID VARCHAR(15) NOT NULL,
Storage_details VARCHAR(255),
PRIMARY KEY (Storage_ID));

SELECT * FROM Storage;

CREATE TABLE First_Aid_Kits_In_Storage(
First_Aid_Kit_ID VARCHAR(15) NOT NULL,
Storage_ID VARCHAR(15) NOT NULL,
Location_Details VARCHAR(255),
Date_From DATE NOT NULL,
PRIMARY KEY (Date_From),
FOREIGN KEY(First_Aid_Kit_ID) REFERENCES First_Aid_Kit(First_Aid_Kit_ID) ON DELETE CASCADE,
FOREIGN KEY(Storage_ID) REFERENCES Storage(Storage_ID) ON DELETE CASCADE);

SELECT * FROM First_Aid_Kits_In_Storage;

CREATE TABLE Tracking_First_Aid_Kit(
First_Aid_Kit_ID VARCHAR(15) NOT NULL,
Date_From DATE NOT NULL,
Location_ID VARCHAR(15) NOT NULL,
Other_Details VARCHAR(255),
PRIMARY KEY (First_Aid_Kit_ID, Date_From),
FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID) ON DELETE CASCADE,
FOREIGN KEY (First_Aid_Kit_ID) REFERENCES First_Aid_Kit(First_Aid_Kit_ID) ON DELETE CASCADE,
FOREIGN KEY (Date_From) REFERENCES First_Aid_Kits_in_Storage(Date_From) ON DELETE CASCADE);



 
INSERT INTO Locations (Location_ID, Location_Details)
VALUES ('100', 'Kaiser Sea'),
	('101', 'Lockyer Land'),
    ('102', 'Main Sea'),
    ('103', 'Herschell II Strait'),
    ('104', 'Dawes Continent'),
    ('105', 'De La Rue Ocean'),
    ('106', 'Lockyer Sea'),
    ('107', 'Dawes Sea'),
    ('108', 'Cassini Land'),
    ('109', 'Secchi Continent');
    
INSERT INTO First_Aid_Kit (First_Aid_Kit_ID, First_Aid_Kit_Details)
VALUES ('300', 'Kit A'),
		('301', 'Kit B'),
        ('302', 'Kit C'),
        ('303', 'Kit D'),
        ('304', 'Kit B'),
        ('305', 'Kit B'),
        ('306', 'Kit A'),
        ('307', 'Kit A'),
        ('308', 'Kit C'),
        ('309', 'Kit D'),
        ('310', 'Kit B'),
        ('311', 'Kit C'),
        ('312', 'Kit A'),
        ('313', 'Kit D'),
        ('314', 'Kit C'),
        ('315', 'Kit B'),
        ('316', 'Kit B'),
        ('317', 'Kit A'),
        ('318', 'Kit C'),
        ('319', 'Kit A');
        
INSERT INTO Storage (Storage_ID, Storage_details)
VALUES ('10', 'Storage A'),
	('11', 'Storage B'),
    ('12', 'Storage C'),
    ('13', 'Storage D'),
    ('14', 'Storage E'),
    ('15', 'Storage F'),
    ('16', 'Storage G'),
    ('17', 'Storage H'),
    ('18', 'Storage I'),
    ('19', 'Storage J');
    
    
INSERT INTO first_aid_kits_in_storage (First_Aid_Kit_ID, Storage_ID, Date_From)
VALUES
('300', '10', '2031-01-01'),
('301', '10', '2031-03-11'),
('302', '13', '2031-05-05'),
('303', '15', '2031-03-04'),
('306', '14', '2031-11-01'),
('308', '16', '2031-12-06'),
('309', '13', '2031-07-01'),
('310', '11', '2031-03-01'),
('312', '12', '2031-08-11'),
('315', '18', '2031-10-10'),
('316', '19', '2031-11-03'),
('317', '13', '2031-08-04');

SELECT * FROM first_aid_kits_in_storage;

INSERT INTO Tracking_First_Aid_Kit (First_Aid_Kit_ID, Location_ID, Date_From)
VALUES('300', '101', '2031-01-01'),
('301', '100', '2031-03-11'),
('302', '101', '2031-05-05'),
('303', '102', '2031-03-04'),
('306', '102', '2031-11-01'),
('308', '103', '2031-12-06'),
('309', '101', '2031-07-01'),
('310', '106', '2031-03-01'),
('312', '107', '2031-08-11'),
('315', '108', '2031-10-10'),
('316', '109', '2031-11-03'),
('317', '104', '2031-08-04');


/* Queries : An Astronaut got injured while working on the excavation site in Main Sea. Based on the type of injuries, 
they will need the First Aid Kit 'A'. Our task is to check where the Kit As are currently.
 */
 
SELECT First_Aid_Kit.First_Aid_Kit_Details, Locations.Location_details, First_Aid_Kit.First_Aid_Kit_ID
FROM Tracking_First_Aid_Kit
LEFT JOIN Locations ON Locations.Location_ID = Tracking_First_Aid_Kit.Location_ID
LEFT JOIN First_Aid_Kit ON First_Aid_Kit.First_Aid_Kit_ID = Tracking_First_Aid_Kit.First_aid_kit_ID
LEFT JOIN First_Aid_Kits_in_Storage ON First_Aid_Kits_in_Storage.Date_From = Tracking_First_Aid_Kit.Date_From;

        
        
        
        