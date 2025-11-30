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


DELETE FROM Locations;

SELECT * FROM Locations;

INSERT INTO Sensors (sensor_id, station_id, sensor_type, model, last_calibrated)
VALUES
(1,1,'Temperature','TMP-100','2025-01-10'),(2,2,'Humidity','HMD-110','2025-01-11'),
(3,3,'Pressure','PRS-120','2025-01-12'),(4,4,'Rain','RNG-130','2025-01-13'),
(5,5,'Wind','WND-140','2025-01-14'),(6,6,'Soil','SOL-150','2025-01-15'),
(7,7,'Temperature','TMP-101','2025-01-16'),(8,8,'Humidity','HMD-111','2025-01-17'),
(9,9,'Pressure','PRS-121','2025-01-18'),(10,10,'Rain','RNG-131','2025-01-19'),

(11,11,'Wind','WND-141','2025-01-20'),(12,12,'Soil','SOL-151','2025-01-21'),
(13,13,'Temperature','TMP-102','2025-01-22'),(14,14,'Humidity','HMD-112','2025-01-23'),
(15,15,'Pressure','PRS-122','2025-01-24'),(16,16,'Rain','RNG-132','2025-01-25'),
(17,17,'Wind','WND-142','2025-01-26'),(18,18,'Soil','SOL-152','2025-01-27'),
(19,19,'Temperature','TMP-103','2025-01-28'),(20,20,'Humidity','HMD-113','2025-01-29'),

(21,21,'Pressure','PRS-123','2025-01-30'),(22,22,'Rain','RNG-133','2025-01-31'),
(23,23,'Wind','WND-143','2025-02-01'),(24,24,'Soil','SOL-153','2025-02-02'),
(25,25,'Temperature','TMP-104','2025-02-03'),(26,26,'Humidity','HMD-114','2025-02-04'),
(27,27,'Pressure','PRS-124','2025-02-05'),(28,28,'Rain','RNG-134','2025-02-06'),
(29,29,'Wind','WND-144','2025-02-07'),(30,30,'Soil','SOL-154','2025-02-08'),

(31,31,'Temperature','TMP-105','2025-02-09'),(32,32,'Humidity','HMD-115','2025-02-10'),
(33,33,'Pressure','PRS-125','2025-02-11'),(34,34,'Rain','RNG-135','2025-02-12'),
(35,35,'Wind','WND-145','2025-02-13'),(36,36,'Soil','SOL-155','2025-02-14'),
(37,37,'Temperature','TMP-106','2025-02-15'),(38,38,'Humidity','HMD-116','2025-02-16'),
(39,39,'Pressure','PRS-126','2025-02-17'),(40,40,'Rain','RNG-136','2025-02-18'),

(41,41,'Wind','WND-146','2025-02-19'),(42,42,'Soil','SOL-156','2025-02-20'),
(43,43,'Temperature','TMP-107','2025-02-21'),(44,44,'Humidity','HMD-117','2025-02-22'),
(45,45,'Pressure','PRS-127','2025-02-23'),(46,46,'Rain','RNG-137','2025-02-24'),
(47,47,'Wind','WND-147','2025-02-25'),(48,48,'Soil','SOL-157','2025-02-26'),
(49,49,'Temperature','TMP-108','2025-02-27'),(50,50,'Humidity','HMD-118','2025-02-28'),

(51,51,'Pressure','PRS-128','2025-03-01'),(52,52,'Rain','RNG-138','2025-03-02'),
(53,53,'Wind','WND-148','2025-03-03'),(54,54,'Soil','SOL-158','2025-03-04'),
(55,55,'Temperature','TMP-109','2025-03-05'),(56,56,'Humidity','HMD-119','2025-03-06'),
(57,57,'Pressure','PRS-129','2025-03-07'),(58,58,'Rain','RNG-139','2025-03-08'),
(59,59,'Wind','WND-149','2025-03-09'),(60,60,'Soil','SOL-159','2025-03-10'),

(61,61,'Temperature','TMP-110','2025-03-11'),(62,62,'Humidity','HMD-120','2025-03-12'),
(63,63,'Pressure','PRS-130','2025-03-13'),(64,64,'Rain','RNG-140','2025-03-14'),
(65,65,'Wind','WND-150','2025-03-15'),(66,66,'Soil','SOL-160','2025-03-16'),
(67,67,'Temperature','TMP-111','2025-03-17'),(68,68,'Humidity','HMD-121','2025-03-18'),
(69,69,'Pressure','PRS-131','2025-03-19'),(70,70,'Rain','RNG-141','2025-03-20'),

(71,71,'Wind','WND-151','2025-03-21'),(72,72,'Soil','SOL-161','2025-03-22'),
(73,73,'Temperature','TMP-112','2025-03-23'),(74,74,'Humidity','HMD-122','2025-03-24'),
(75,75,'Pressure','PRS-132','2025-03-25'),(76,76,'Rain','RNG-142','2025-03-26'),
(77,77,'Wind','WND-152','2025-03-27'),(78,78,'Soil','SOL-162','2025-03-28'),
(79,79,'Temperature','TMP-113','2025-03-29'),(80,80,'Humidity','HMD-123','2025-03-30'),

(81,81,'Pressure','PRS-133','2025-03-31'),(82,82,'Rain','RNG-143','2025-04-01'),
(83,83,'Wind','WND-153','2025-04-02'),(84,84,'Soil','SOL-163','2025-04-03'),
(85,85,'Temperature','TMP-114','2025-04-04'),(86,86,'Humidity','HMD-124','2025-04-05'),
(87,87,'Pressure','PRS-134','2025-04-06'),(88,88,'Rain','RNG-144','2025-04-07'),
(89,89,'Wind','WND-154','2025-04-08'),(90,90,'Soil','SOL-164','2025-04-09'),

(91,91,'Temperature','TMP-115','2025-04-10'),(92,92,'Humidity','HMD-125','2025-04-11'),
(93,93,'Pressure','PRS-135','2025-04-12'),(94,94,'Rain','RNG-145','2025-04-13'),
(95,95,'Wind','WND-155','2025-04-14'),(96,96,'Soil','SOL-165','2025-04-15'),
(97,97,'Temperature','TMP-116','2025-04-16'),(98,98,'Humidity','HMD-126','2025-04-17'),
(99,99,'Pressure','PRS-136','2025-04-18'),(100,100,'Rain','RNG-146','2025-04-19');




INSERT INTO Weather_readings
(sensor_id, recorded_at, temperature_c, humidity_percent, pressure_hpa, rain_mm, wind_speed_kmh, soil_moisture)
VALUES
(1,GETDATE(),29.4,65.2,1008.3,0.0,14.2,52),(2,GETDATE(),31.1,58.9,1005.1,1.2,18.4,47),
(3,GETDATE(),26.8,72.0,1012.4,5.6,10.5,61),(4,GETDATE(),33.2,49.5,1002.8,0.0,22.7,38),
(5,GETDATE(),24.9,81.3,1015.6,12.4,9.1,74),(6,GETDATE(),27.5,69.8,1010.2,2.0,15.3,59),
(7,GETDATE(),35.0,41.6,998.4,0.0,28.9,33),(8,GETDATE(),22.6,88.4,1018.9,18.7,7.4,82),
(9,GETDATE(),30.8,57.1,1006.7,0.8,19.6,46),(10,GETDATE(),28.1,63.5,1011.0,3.1,13.9,55),

(11,GETDATE(),34.3,44.9,999.6,0.0,26.1,36),(12,GETDATE(),25.7,76.2,1014.8,9.5,11.2,68),
(13,GETDATE(),21.9,90.1,1020.5,22.0,5.8,85),(14,GETDATE(),32.4,53.7,1004.2,0.4,21.3,42),
(15,GETDATE(),27.0,70.4,1012.1,2.7,12.6,60),(16,GETDATE(),29.9,61.8,1007.5,0.0,17.4,50),
(17,GETDATE(),34.8,46.0,1001.3,0.0,27.8,35),(18,GETDATE(),23.4,84.6,1017.9,15.2,8.9,79),
(19,GETDATE(),31.5,55.4,1005.9,1.0,20.1,44),(20,GETDATE(),26.1,74.7,1013.6,6.8,10.0,66),

(21,GETDATE(),35.6,39.2,996.7,0.0,31.5,30),(22,GETDATE(),24.0,82.1,1016.5,13.9,9.7,73),
(23,GETDATE(),28.7,64.3,1009.0,0.3,16.8,54),(24,GETDATE(),21.5,91.8,1021.1,25.4,6.1,88),
(25,GETDATE(),32.9,52.0,1003.4,0.0,23.4,40),(26,GETDATE(),27.8,68.7,1010.8,1.9,14.7,58),
(27,GETDATE(),34.1,45.5,1000.1,0.0,26.6,34),(28,GETDATE(),23.1,85.0,1019.3,17.6,8.2,81),
(29,GETDATE(),30.2,59.9,1006.2,0.5,18.9,48),(30,GETDATE(),25.6,75.1,1014.1,7.2,11.5,69),

(31,GETDATE(),36.0,37.8,995.9,0.0,34.2,28),(32,GETDATE(),24.7,80.9,1017.0,14.1,9.4,72),
(33,GETDATE(),29.1,62.7,1008.7,0.7,16.1,53),(34,GETDATE(),22.0,89.4,1020.0,21.8,6.4,86),
(35,GETDATE(),31.8,54.2,1004.8,1.3,21.0,43),(36,GETDATE(),27.2,70.9,1011.5,2.4,13.4,62),
(37,GETDATE(),34.6,46.8,1001.9,0.0,29.1,37),(38,GETDATE(),23.7,83.2,1018.4,16.5,8.6,78),
(39,GETDATE(),31.0,56.8,1005.4,0.9,19.7,45),(40,GETDATE(),25.9,73.6,1013.2,6.1,10.9,67),

(41,GETDATE(),36.4,36.5,994.8,0.0,35.9,26),(42,GETDATE(),24.3,81.7,1016.1,13.0,9.9,71),
(43,GETDATE(),28.4,65.0,1009.6,0.2,17.1,56),(44,GETDATE(),21.8,90.6,1021.6,24.3,6.0,87),
(45,GETDATE(),32.2,53.1,1003.9,0.0,22.5,41),(46,GETDATE(),27.4,68.0,1010.1,1.5,14.9,57),
(47,GETDATE(),33.7,47.3,1001.0,0.0,28.2,36),(48,GETDATE(),23.9,84.5,1017.8,16.0,8.7,80),
(49,GETDATE(),30.4,60.1,1006.9,0.6,19.1,49),(50,GETDATE(),26.0,74.2,1013.0,6.5,10.4,65),

(51,GETDATE(),35.8,40.0,997.5,0.0,32.0,31),(52,GETDATE(),24.2,83.4,1016.9,14.8,9.5,74),
(53,GETDATE(),29.0,63.6,1008.4,0.9,16.3,52),(54,GETDATE(),22.3,88.7,1020.4,22.1,6.2,84),
(55,GETDATE(),31.6,55.0,1004.6,1.1,20.3,44),(56,GETDATE(),27.1,69.3,1011.2,2.2,14.0,61),
(57,GETDATE(),34.5,46.2,1002.0,0.0,27.5,35),(58,GETDATE(),23.5,83.9,1018.2,15.9,8.8,79),
(59,GETDATE(),30.1,59.4,1007.2,0.4,18.7,47),(60,GETDATE(),26.4,74.9,1013.8,6.9,10.7,68),

(61,GETDATE(),36.2,38.2,996.3,0.0,33.8,29),(62,GETDATE(),24.5,82.5,1016.7,13.6,9.8,73),
(63,GETDATE(),28.9,64.8,1009.3,0.3,17.0,55),(64,GETDATE(),21.7,91.2,1021.2,24.7,6.3,89),
(65,GETDATE(),32.6,52.6,1003.7,0.0,23.1,41),(66,GETDATE(),27.9,69.0,1010.6,1.7,15.0,58),
(67,GETDATE(),34.0,45.8,1000.5,0.0,26.9,34),(68,GETDATE(),23.2,85.5,1019.5,17.8,8.3,82),
(69,GETDATE(),30.3,60.8,1006.5,0.6,19.3,48),(70,GETDATE(),25.8,75.4,1014.2,7.1,11.3,70),

(71,GETDATE(),36.1,37.5,995.6,0.0,34.7,27),(72,GETDATE(),24.6,81.1,1017.2,14.4,9.2,72),
(73,GETDATE(),29.3,62.4,1008.2,0.8,16.0,54),(74,GETDATE(),22.1,89.9,1020.7,21.5,6.5,86),
(75,GETDATE(),31.9,54.5,1004.5,1.4,21.5,43),(76,GETDATE(),27.3,71.0,1011.7,2.6,13.8,63),
(77,GETDATE(),34.7,46.5,1001.7,0.0,29.6,36),(78,GETDATE(),23.8,84.0,1018.1,16.3,8.4,79),
(79,GETDATE(),30.7,57.2,1006.8,0.7,19.9,46),(80,GETDATE(),26.2,73.8,1013.4,6.4,10.6,67),

(81,GETDATE(),36.5,36.1,994.9,0.0,36.0,25),(82,GETDATE(),24.1,81.6,1016.0,13.2,9.6,71),
(83,GETDATE(),28.2,65.1,1009.8,0.2,17.3,57),(84,GETDATE(),21.6,90.9,1021.9,24.9,6.0,88),
(85,GETDATE(),32.3,53.4,1003.8,0.0,22.8,40),(86,GETDATE(),27.6,68.5,1010.9,1.8,14.5,59),
(87,GETDATE(),34.9,45.0,1000.9,0.0,27.0,35),(88,GETDATE(),23.6,83.1,1018.0,16.1,8.5,78),
(89,GETDATE(),30.5,58.7,1006.6,0.5,18.6,49),(90,GETDATE(),26.3,74.0,1013.1,6.2,10.8,66),

(91,GETDATE(),36.8,35.9,994.6,0.0,36.5,24),(92,GETDATE(),24.9,82.3,1016.3,13.7,9.3,72),
(93,GETDATE(),28.6,64.0,1009.1,0.4,16.9,55),(94,GETDATE(),21.9,91.5,1021.4,25.1,6.2,89),
(95,GETDATE(),32.7,52.2,1003.5,0.0,23.0,41),(96,GETDATE(),27.7,69.1,1010.3,1.6,14.6,58),
(97,GETDATE(),34.2,46.1,1001.2,0.0,27.4,36),(98,GETDATE(),23.4,84.3,1018.6,16.8,8.7,80),
(99,GETDATE(),30.9,57.9,1006.1,0.9,19.5,46),(100,GETDATE(),26.5,73.5,1013.5,6.0,10.9,67);

INSERT INTO Daily_summaries
(station_id, min_temp, max_temp, total_rain_mm, avg_humidity)
VALUES
(1,21.4,32.6,6.2,68.4),(2,22.0,34.1,1.4,62.1),
(3,20.6,30.9,12.7,75.2),(4,23.1,35.8,0.0,55.6),
(5,19.8,29.5,18.3,81.0),(6,21.9,33.2,4.1,66.9),
(7,24.3,36.7,0.0,51.4),(8,20.1,31.0,22.8,86.5),
(9,22.2,34.0,1.3,60.7),(10,21.0,32.4,7.5,70.6),

(11,24.9,37.2,0.0,49.9),(12,20.5,30.6,14.6,78.1),
(13,19.7,29.3,25.4,88.0),(14,23.6,35.1,0.5,56.2),
(15,21.4,33.0,3.8,66.0),(16,22.7,34.4,0.0,60.1),
(17,25.1,37.9,0.0,48.5),(18,20.6,31.2,19.1,83.6),
(19,22.9,34.2,2.2,61.9),(20,21.3,32.8,8.9,71.4),

(21,24.8,38.1,0.0,46.7),(22,20.9,30.4,16.8,79.2),
(23,22.5,33.7,1.0,63.3),(24,19.5,29.2,28.6,89.5),
(25,23.2,35.6,0.0,57.0),(26,21.7,33.1,4.5,67.8),
(27,25.6,38.4,0.0,45.2),(28,20.2,31.0,21.4,85.1),
(29,22.3,34.0,0.9,61.0),(30,21.1,32.5,9.8,72.3),

(31,25.0,38.6,0.0,44.0),(32,20.8,30.3,15.7,77.9),
(33,22.6,33.5,1.6,64.1),(34,19.6,29.1,26.9,90.0),
(35,23.9,36.4,0.0,55.1),(36,21.5,33.2,3.9,66.7),
(37,25.3,38.0,0.0,47.4),(38,20.4,31.1,20.2,84.0),
(39,22.7,34.6,1.8,62.7),(40,21.2,32.7,8.1,70.9),

(41,25.7,39.2,0.0,43.6),(42,20.7,30.2,14.3,78.0),
(43,22.4,33.9,1.1,63.9),(44,19.4,29.0,27.8,91.4),
(45,24.0,36.9,0.0,54.0),(46,21.9,33.4,4.7,68.5),
(47,25.5,38.7,0.0,46.3),(48,20.0,31.0,22.0,86.1),
(49,22.1,34.1,1.3,60.4),(50,21.4,32.9,9.4,72.9),

(51,25.9,39.6,0.0,42.3),(52,20.6,30.5,16.2,79.7),
(53,22.8,34.2,1.9,65.0),(54,19.7,29.4,29.1,90.5),
(55,24.1,36.8,0.0,55.7),(56,21.8,33.7,4.8,69.1),
(57,25.4,38.3,0.0,47.0),(58,20.3,31.3,20.7,84.6),
(59,22.6,34.4,1.5,62.0),(60,21.6,32.6,10.2,73.5),

(61,26.1,39.9,0.0,41.8),(62,20.9,30.8,15.4,77.5),
(63,22.9,34.5,2.0,65.8),(64,19.8,29.6,28.0,92.0),
(65,24.4,37.2,0.0,53.2),(66,22.2,34.1,4.9,68.8),
(67,25.8,38.9,0.0,45.7),(68,20.5,31.2,21.6,85.4),
(69,22.4,34.3,1.2,61.7),(70,21.9,33.1,9.7,71.0),

(71,26.4,40.2,0.0,40.9),(72,21.0,30.9,15.2,78.3),
(73,23.0,34.0,1.7,64.4),(74,20.1,29.7,27.3,90.9),
(75,24.6,37.4,0.0,54.4),(76,22.1,33.9,4.1,68.0),
(77,26.0,39.5,0.0,46.0),(78,20.6,31.4,20.9,84.9),
(79,22.5,34.8,1.4,62.4),(80,21.8,32.8,10.0,72.1),

(81,26.9,41.0,0.0,39.5),(82,21.3,31.1,14.9,77.0),
(83,23.1,34.6,1.6,65.9),(84,20.3,30.0,26.7,91.6),
(85,24.9,38.0,0.0,53.6),(86,22.5,34.8,4.3,68.9),
(87,26.3,39.1,0.0,45.3),(88,20.8,31.7,21.3,85.8),
(89,22.7,34.4,1.1,61.5),(90,22.0,33.3,9.5,70.8),

(91,27.1,41.5,0.0,38.7),(92,21.5,31.5,15.6,78.6),
(93,23.3,35.0,1.8,66.2),(94,20.4,30.2,27.9,92.3),
(95,24.8,38.3,0.0,52.8),(96,22.4,35.1,4.6,69.5),
(97,26.6,39.7,0.0,44.9),(98,20.7,31.6,22.5,86.3),
(99,22.9,34.9,1.5,63.1),(100,22.3,33.7,10.4,71.9);


 ------------------------------------ 🫠  ------------------------------------ 
 