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
SET is_active = 'No'
WHERE owner_phone BETWEEN 1037 AND 1045;

SELECT * FROM Stations;

INSERT INTO Locations (location_id, station_id, latitude, logitude, altitude_m, pleace_name) VALUES
(1,45,-6.8200,32.8200,1090,'Tabora Central'),
(2,12,-6.8100,32.8300,1091,'Uyui'),
(3,78,-6.8000,32.8400,1092,'Nzega'),
(4,3,-6.7900,32.8500,1093,'Igunga'),
(5,91,-6.7800,32.8600,1094,'Urambo'),
(6,27,-6.7700,32.8700,1095,'Kaliua'),
(7,66,-6.7600,32.8800,1096,'Sikonge'),
(8,18,-6.7500,32.8900,1097,'Tumbi'),
(9,54,-6.7400,32.9000,1098,'Tabora Airport'),
(10,7,-6.7300,32.9100,1099,'Ndevelwa'),

(11,83,-6.7200,32.9200,1100,'Mwinyi'),
(12,31,-6.7100,32.9300,1101,'Kitete'),
(13,96,-6.7000,32.9400,1102,'Ipuli'),
(14,22,-6.6900,32.9500,1103,'Ifucha'),
(15,59,-6.6800,32.9600,1104,'Kanyenye'),
(16,10,-6.6700,32.9700,1105,'Mabama'),
(17,71,-6.6600,32.9800,1106,'Bukene'),
(18,41,-6.6500,32.9900,1107,'Mvomero'),
(19,5,-6.6400,33.0000,1108,'Geita'),
(20,88,-6.6300,33.0100,1109,'Shinyanga'),

(21,29,-6.6200,33.0200,1110,'Kahama'),
(22,64,-6.6100,33.0300,1111,'Maswa'),
(23,14,-6.6000,33.0400,1112,'Bariadi'),
(24,99,-6.5900,33.0500,1113,'Magu'),
(25,49,-6.5800,33.0600,1114,'Misungwi'),
(26,80,-6.5700,33.0700,1115,'Nyamagana'),
(27,2,-6.5600,33.0800,1116,'Ilemela'),
(28,93,-6.5500,33.0900,1117,'Ukerewe'),
(29,36,-6.5400,33.1000,1118,'Bunda'),
(30,67,-6.5300,33.1100,1119,'Serengeti'),

(31,20,-6.5200,33.1200,1120,'Tarime'),
(32,85,-6.5100,33.1300,1121,'Mara'),
(33,57,-6.5000,33.1400,1122,'Musoma'),
(34,13,-6.4900,33.1500,1123,'Butiama'),
(35,74,-6.4800,33.1600,1124,'Rorya'),
(36,32,-6.4700,33.1700,1125,'Kilosa'),
(37,98,-6.4600,33.1800,1126,'Gairo'),
(38,9,-6.4500,33.1900,1127,'Mikumi'),
(39,61,-6.4400,33.2000,1128,'Ifakara'),
(40,46,-6.4300,33.2100,1129,'Ulanga'),

(41,15,-6.4200,33.2200,1130,'Kilombero'),
(42,90,-6.4100,33.2300,1131,'Morogoro'),
(43,34,-6.4000,33.2400,1132,'Ngerengere'),
(44,77,-6.3900,33.2500,1133,'Bigwa'),
(45,1,-6.3800,33.2600,1134,'Mzumbe'),
(46,63,-6.3700,33.2700,1135,'Turiani'),
(47,52,-6.3600,33.2800,1136,'Mtibwa'),
(48,21,-6.3500,33.2900,1137,'Fungafunga'),
(49,92,-6.3400,33.3000,1138,'Kilakala'),
(50,6,-6.3300,33.3100,1139,'Mindu'),

(51,70,-6.3200,33.3200,1140,'Dodoma'),
(52,11,-6.3100,33.3300,1141,'Chamwino'),
(53,86,-6.3000,33.3400,1142,'Kondoa'),
(54,26,-6.2900,33.3500,1143,'Mpwapwa'),
(55,95,-6.2800,33.3600,1144,'Chemba'),
(56,47,-6.2700,33.3700,1145,'Bahi'),
(57,16,-6.2600,33.3800,1146,'Manyoni'),
(58,73,-6.2500,33.3900,1147,'Singida'),
(59,40,-6.2400,33.4000,1148,'Ikungi'),
(60,100,-6.2300,33.4100,1149,'Iramba'),

(61,30,-6.2200,33.4200,1150,'Mkalama'),
(62,81,-6.2100,33.4300,1151,'Arusha'),
(63,24,-6.2000,33.4400,1152,'Njiro'),
(64,56,-6.1900,33.4500,1153,'Sakina'),
(65,8,-6.1800,33.4600,1154,'Usa River'),
(66,89,-6.1700,33.4700,1155,'Meru'),
(67,39,-6.1600,33.4800,1156,'Monduli'),
(68,97,-6.1500,33.4900,1157,'Karatu'),
(69,4,-6.1400,33.5000,1158,'Ngorongoro'),
(70,55,-6.1300,33.5100,1159,'Longido'),

(71,17,-6.1200,33.5200,1160,'Kilimanjaro'),
(72,84,-6.1100,33.5300,1161,'Moshi'),
(73,44,-6.1000,33.5400,1162,'Rombo'),
(74,60,-6.0900,33.5500,1163,'Hai'),
(75,28,-6.0800,33.5600,1164,'Same'),
(76,72,-6.0700,33.5700,1165,'Pangani'),
(77,35,-6.0600,33.5800,1166,'Korogwe'),
(78,19,-6.0500,33.5900,1167,'Handeni'),
(79,50,-6.0400,33.6000,1168,'Muheza'),
(80,65,-6.0300,33.6100,1169,'Tanga'),

(81,82,-6.0200,33.6200,1170,'Bagamoyo'),
(82,25,-6.0100,33.6300,1171,'Kibaha'),
(83,58,-6.0000,33.6400,1172,'Mkuranga'),
(84,94,-5.9900,33.6500,1173,'Temeke'),
(85,37,-5.9800,33.6600,1174,'Ilala'),
(86,23,-5.9700,33.6700,1175,'Kinondoni'),
(87,68,-5.9600,33.6800,1176,'Ubungo'),
(88,48,-5.9500,33.6900,1177,'Kigamboni'),
(89,75,-5.9400,33.7000,1178,'Jangwani'),
(90,62,-5.9300,33.7100,1179,'Mbezi'),

(91,87,-5.9200,33.7200,1180,'Mbeya'),
(92,33,-5.9100,33.7300,1181,'Uyole'),
(93,69,-5.9000,33.7400,1182,'Tunduma'),
(94,42,-5.8900,33.7500,1183,'Rungwe'),
(95,79,-5.8800,33.7600,1184,'Kyela'),
(96,51,-5.8700,33.7700,1185,'Njombe'),
(97,76,-5.8600,33.7800,1186,'Makambako'),
(98,38,-5.8500,33.7900,1187,'Ludewa'),
(99,11,-5.8400,33.8000,1188,'Songea'),
(100,58,-5.8300,33.8100,1189,'Tunduru');



SELECT * FROM Locations;