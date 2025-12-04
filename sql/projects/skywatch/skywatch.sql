-- Query to make a new database in the system
CREATE DATABASE Skywatch;

 -- Well here is telling the system that am going to use Skuwatch DB
use Skywatch;


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
(10, 'Ndevelwa Station', 'Janeth Ally', 1010);

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
(10,7,-6.7300,32.9100,1099,'Ndevelwa');


DELETE FROM Locations;

SELECT * FROM Locations;

INSERT INTO Sensors (sensor_id, station_id, sensor_type, model, last_calibrated)
VALUES
(1,1,'Temperature','TMP-100','2025-01-10'),(2,2,'Humidity','HMD-110','2025-01-11'),
(3,3,'Pressure','PRS-120','2025-01-12'),(4,4,'Rain','RNG-130','2025-01-13'),
(5,5,'Wind','WND-140','2025-01-14'),(6,6,'Soil','SOL-150','2025-01-15'),
(7,7,'Temperature','TMP-101','2025-01-16'),(8,8,'Humidity','HMD-111','2025-01-17'),
(9,9,'Pressure','PRS-121','2025-01-18'),(10,10,'Rain','RNG-131','2025-01-19');




INSERT INTO Weather_readings
(sensor_id, recorded_at, temperature_c, humidity_percent, pressure_hpa, rain_mm, wind_speed_kmh, soil_moisture)
VALUES
(1,GETDATE(),29.4,65.2,1008.3,0.0,14.2,52),(2,GETDATE(),31.1,58.9,1005.1,1.2,18.4,47),
(3,GETDATE(),26.8,72.0,1012.4,5.6,10.5,61),(4,GETDATE(),33.2,49.5,1002.8,0.0,22.7,38),
(5,GETDATE(),24.9,81.3,1015.6,12.4,9.1,74),(6,GETDATE(),27.5,69.8,1010.2,2.0,15.3,59),
(7,GETDATE(),35.0,41.6,998.4,0.0,28.9,33),(8,GETDATE(),22.6,88.4,1018.9,18.7,7.4,82),
(9,GETDATE(),30.8,57.1,1006.7,0.8,19.6,46),(10,GETDATE(),28.1,63.5,1011.0,3.1,13.9,55);

INSERT INTO Daily_summaries
(station_id, min_temp, max_temp, total_rain_mm, avg_humidity)
VALUES
(1,21.4,32.6,6.2,68.4),(2,22.0,34.1,1.4,62.1),
(3,20.6,30.9,12.7,75.2),(4,23.1,35.8,0.0,55.6),
(5,19.8,29.5,18.3,81.0),(6,21.9,33.2,4.1,66.9),
(7,24.3,36.7,0.0,51.4),(8,20.1,31.0,22.8,86.5),
(9,22.2,34.0,1.3,60.7),(10,21.0,32.4,7.5,70.6);


 ------------------------------------ 🫠  ------------------------------------ 
 
 
------------------------------------ JOINS, SELECTIONS, SUB-QUERIES, ETC. ------------------------------------

-- ALTER TABLE: adding the status on the table
ALTER TABLE Sensors
ADD status VARCHAR(50);

-- UPDATE: well here we update some data
UPDATE Sensors
SET status = 'Active'
WHERE last_calibrated > '2025-02-01';

UPDATE Sensors
SET status = 'Needs Calibration'
WHERE last_calibrated <= '2025-02-01';

-- JOIN: this is the full outer join
SELECT 
    s.station_name, 
    l.pleace_name, 
    l.latitude, 
    l.logitude
FROM 
    Stations s
JOIN 
    Locations l ON s.station_id = l.station_id;

-- SELECTION with WHERE: print ir show all the stations which are active
SELECT 
    station_name, 
    owner_name, 
    installed_date
FROM 
    Stations
WHERE 
    is_active = 'yes';

-- GROUPING: well herer we make a summary of the things
SELECT 
    s.sensor_type,
    AVG(wr.temperature_c) AS avg_temp,
    MAX(wr.temperature_c) AS max_temp,
    MIN(wr.temperature_c) AS min_temp
FROM 
    Sensors s
JOIN 
    Weather_readings wr ON s.sensor_id = wr.sensor_id
GROUP BY 
    s.sensor_type;

-- ORDER BY: herer we order the things according ti the dates
SELECT 
    station_name, 
    installed_date
FROM 
    Stations
ORDER BY 
    installed_date DESC;

-- SUB-QUERY: Select sensors that have recorded temperatures above the average temperature
SELECT 
    sensor_id, 
    sensor_type, 
    model
FROM Sensors
WHERE sensor_id IN (
        SELECT sensor_id 
        FROM  Weather_readings 
        WHERE temperature_c > (SELECT AVG(temperature_c) FROM Weather_readings)
    );

-- OPERATION: Select weather readings and convert temperature from Celsius to Fahrenheit just for eaasy translation
SELECT 
    reading_id,
    temperature_c,
    (temperature_c * 9/5) + 32 AS temperature_f
FROM  Weather_readings;