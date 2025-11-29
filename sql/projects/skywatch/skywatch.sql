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

