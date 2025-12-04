CREATE DATABASE IF NOT EXISTS views;

USE views;

 CREATE TABLE Stations (station_id INT PRIMARY KEY, 
                        station_name VARCHAR(255) UNIQUE, 
                        owner_name VARCHAR(255),
                        owner_phone INT,
                        installed_date DATE DEFAULT getdate(),
                        is_active VARCHAR(3) DEFAULT 'yes'
 );



INSERT INTO Stations (station_id, station_name, owner_name, owner_phone) VALUES
(1,  'Tabora Central Station', 'John Mwita', 1001),
(2,  'Uyui Weather Post', 'Asha Mrema', 1002),
(3,  'Nzega Climate Station', 'Emmanuel Joseph', 1003),
(4,  'Igunga Weather Center', 'Neema Paul', 1004),
(5,  'Urambo Meteor Station', 'David Lucas', 1005),
(6,  'Kaliua Field Station', 'Rose Patrick', 1006),
(7,  'Sikonge Weather Point', 'Peter Simon', 1007),
(8,  'Tumbi Industrial Station', 'Grace John', 1008),
(9,  'Tabora Airport Station', 'Michael David', 1009),
(10, 'Ndevelwa Station', 'Janeth Ally', 1010);