 -- Query to make a new database in the system
CREATE DATABASE Skywatch;

 -- Well here is telling the system that am going to use Skuwatch DB
use irini;


 ------------------------------------ TABLES  ------------------------------------ 
 
 --Query to create the All Weather stations Database
 CREATE TABLE Stations (station_id INT PRIMARY KEY, 
                        station_name VARCHAR(255) UNIQUE, 
                        owner_name VARCHAR(255),
                        owner_phone INT,
                        installed_date DATE DEFAULT getdate(),
                        is_active VARCHAR(3) DEFAULT 'yes'
 );

 -- Query to create All weather stations Locations
 CREATE TABLE Locations (location_id INT PRIMARY KEY,
                         station_id INT FOREIGN KEY REFERENCES Stations(station_id),
                         latitude DECIMAL,
                         logitude DECIMAL,
                         altitude_m INT,
                         pleace_name VARCHAR(255)
 );

 --Query to store sensors data 
 CREATE TABLE Sensors (sensor_id INT PRIMARY KEY,
                       station_id INT FOREIGN KEY REFERENCES Stations(station_id),
                       sensor_type VARCHAR(20),
                       model VARCHAR(30),
                       last_calibrated DATE
 );

 --Query to tap all the weather data collected
 CREATE TABLE Weather_readings (reading_id TIMESTAMP PRIMARY KEY,
                                sensor_id INT FOREIGN KEY REFERENCES Sensors(sensor_id),
                                recorded_at DATETIME DEFAULT getdate(),
                                temperature_c DECIMAL,
                                humidity_percent DECIMAL,
                                pressure_hpa DECIMAL,
                                rain_mm DECIMAL,
                                wind_speed_kmh DECIMAL,
                                soil_moisture INT,
 );

 --Querry to get daily summaries
 CREATE TABLE Daily_summaries (summary_id INT IDENTITY(1,1) PRIMARY KEY,
                               station_id INT FOREIGN KEY REFERENCES Stations(station_id),
                               daily_date DATE DEFAULT GETDATE(),
                               min_temp DECIMAL,
                               max_temp DECIMAL,
                               total_rain_mm DECIMAL,
                               avg_humidity DECIMAL
 );

 --Query to collect data about the alerts been pronounced 
 CREATE TABLE Alerts (alert_id INT IDENTITY(1,1) PRIMARY KEY,
                      station_id INT FOREIGN KEY REFERENCES Stations(station_id),
                      alert_type VARCHAR(50),
                      alert_message VARCHAR(300),
                      sent_at DATETIME DEFAULT getdate(),
                      acknowledged VARCHAR(3) DEFAULT 'Yes'
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
(10, 'Ndevelwa Station', 'Janeth Ally', 1010),

(11, 'Mwinyi Weather Base', 'Hassan Salum', 1011),
(12, 'Kitete Climate Post', 'Lucas Frank', 1012),
(13, 'Ipuli Weather Station', 'Martha Daniel', 1013),
(14, 'Ifucha Meteor Center', 'Kelvin Godfrey', 1014),
(15, 'Kanyenye Station', 'Saida Juma', 1015),
(16, 'Mabama Weather Point', 'Richard Antony', 1016),
(17, 'Bukene Station', 'Jane Paulo', 1017),
(18, 'Mvomero Field Station', 'Chris Andrew', 1018),
(19, 'Geita Lake Station', 'Zuberi Hamis', 1019),
(20, 'Shinyanga Central Station', 'Agnes Peter', 1020),

(21, 'Kahama Mining Station', 'Thomas James', 1021),
(22, 'Maswa Climate Post', 'Sophia Lucas', 1022),
(23, 'Bariadi Weather Hub', 'Wilson Peter', 1023),
(24, 'Magu Lake Station', 'Anna Charles', 1024),
(25, 'Misungwi Weather Post', 'Victor Edwin', 1025),
(26, 'Nyamagana City Station', 'Beatrice Maria', 1026),
(27, 'Ilemela Climate Station', 'Joseph Henry', 1027),
(28, 'Ukerewe Island Station', 'Pauline Esther', 1028),
(29, 'Bunda Weather Point', 'Abel Stephen', 1029),
(30, 'Serengeti Park Station', 'Robert William', 1030),

(31, 'Tarime Border Station', 'Fatuma Suleiman', 1031),
(32, 'Mara Regional Station', 'Andrew Thomas', 1032),
(33, 'Musoma Airport Station', 'Kelvin Robert', 1033),
(34, 'Butiama Climate Post', 'Clara Benson', 1034),
(35, 'Rorya Weather Station', 'Dennis Mark', 1035),
(36, 'Kilosa Field Station', 'Edward Victor', 1036),
(37, 'Gairo Climate Center', 'Susan Patrick', 1037),
(38, 'Mikumi Park Station', 'Joseph Martin', 1038),
(39, 'Ifakara Basin Station', 'Lucy Bernard', 1039),
(40, 'Ulanga Weather Post', 'Hassan Yusuf', 1040),

(41, 'Kilombero Valley Station', 'Paula Erick', 1041),
(42, 'Morogoro Central Station', 'Mark Stephen', 1042),
(43, 'Ngerengere Station', 'Dorothy Paul', 1043),
(44, 'Bigwa Weather Point', 'Frank Oscar', 1044),
(45, 'Mzumbe Campus Station', 'Mary Deogratius', 1045),
(46, 'Turiani Climate Center', 'Luka Benson', 1046),
(47, 'Mtibwa Sugar Station', 'Ruth Emmanuel', 1047),
(48, 'Fungafunga Station', 'Steven Albert', 1048),
(49, 'Kilakala Ridge Station', 'Juliet Moses', 1049),
(50, 'Mindu Dam Station', 'Samson Elia', 1050),

(51, 'Dodoma Capital Station', 'Charles Mussa', 1051),
(52, 'Chamwino Weather Post', 'Leah Patrick', 1052),
(53, 'Kondoa Hills Station', 'Godfrey Musa', 1053),
(54, 'Mpwapwa Field Station', 'Ellen George', 1054),
(55, 'Chemba Climate Post', 'Ronald Colin', 1055),
(56, 'Bahi Salt Station', 'Nicholas Paulo', 1056),
(57, 'Manyoni Weather Center', 'Brenda Victor', 1057),
(58, 'Singida Central Station', 'Alfred Joseph', 1058),
(59, 'Ikungi Climate Station', 'Nancy Baraka', 1059),
(60, 'Iramba Plains Station', 'Patrick Mwinuka', 1060),

(61, 'Mkalama Station', 'Helena George', 1061),
(62, 'Arusha Airport Station', 'Daniel Kweka', 1062),
(63, 'Njiro Hill Station', 'Lilian Mbise', 1063),
(64, 'Sakina Weather Post', 'Joshua Mmari', 1064),
(65, 'Usa River Station', 'Anna Ngowi', 1065),
(66, 'Meru Slopes Station', 'Benjamin Mushi', 1066),
(67, 'Monduli Plains Station', 'Rehema Kimaro', 1067),
(68, 'Karatu Highlands Station', 'Isack Ndesamburo', 1068),
(69, 'Ngorongoro Rim Station', 'Elisabeth Nanyaro', 1069),
(70, 'Longido Border Station', 'Peter Lekaita', 1070),

(71, 'Kilimanjaro Airport Station', 'Andrew Mosha', 1071),
(72, 'Moshi Town Station', 'Janet Mushi', 1072),
(73, 'Rombo Slopes Station', 'Emmanuel Mrema', 1073),
(74, 'Hai Plains Station', 'Judith Kilasara', 1074),
(75, 'Same Lowlands Station', 'Bernard Mlay', 1075),
(76, 'Pangani Coast Station', 'Salum Bakari', 1076),
(77, 'Korogwe Valley Station', 'Agatha Mushi', 1077),
(78, 'Handeni Plains Station', 'Erick Mhando', 1078),
(79, 'Muheza Hills Station', 'Paul Zuze', 1079),
(80, 'Tanga Port Station', 'Sophia Chande', 1080),

(81, 'Bagamoyo Coast Station', 'Hamisi Rashid', 1081),
(82, 'Kibaha Plains Station', 'Moses Selemani', 1082),
(83, 'Mkuranga Lowlands Station', 'Joyce Suleiman', 1083),
(84, 'Temeke Urban Station', 'Andrew Swaleh', 1084),
(85, 'Ilala City Station', 'Patrick Mlay', 1085),
(86, 'Kinondoni Station', 'Lucy Joachim', 1086),
(87, 'Ubungo Weather Post', 'Frank Mgeni', 1087),
(88, 'Kigamboni Marine Station', 'Rehema Ally', 1088),
(89, 'Jangwani River Station', 'Deogratius Mboya', 1089),
(90, 'Mbezi Hills Station', 'Lucas Mallya', 1090),

(91, 'Mbeya Highlands Station', 'Peter Chilewa', 1091),
(92, 'Uyole Research Station', 'Agnes Kapinga', 1092),
(93, 'Tunduma Border Station', 'Godson Mwakalila', 1093),
(94, 'Rungwe Slopes Station', 'Stella Kibona', 1094),
(95, 'Kyela Lowlands Station', 'Michael Mwakipesile', 1095),
(96, 'Njombe Highlands Station', 'Thomas Mlangwa', 1096),
(97, 'Makambako Transit Station', 'Veronica Mtei', 1097),
(98, 'Ludewa Valley Station', 'Edwin Mbwambo', 1098),
(99, 'Songea Plains Station', 'Patrick Mhando', 1099),
(100,'Tunduru Southern Station', 'Rachel Mpanju', 1100);

UPDATE Stations
SET owner_phone = 1000 + station_id
WHERE station_id BETWEEN 1 AND 100;
