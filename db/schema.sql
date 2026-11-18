-- Projet Backend - API de relevés météo
-- Création de la base et des tables MySQL.

CREATE DATABASE IF NOT EXISTS api_meteo
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE api_meteo;

CREATE TABLE IF NOT EXISTS station (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    altitude DECIMAL(7,2) NOT NULL, -- Altitude en mètres
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    CONSTRAINT chk_station_latitude CHECK (latitude BETWEEN -90 AND 90),
    CONSTRAINT chk_station_longitude CHECK (longitude BETWEEN -180 AND 180)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS releve (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    station_id INT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    temperature DECIMAL(5,2) NOT NULL, -- Température en degrés Celsius
    humidity DECIMAL(5,2) NOT NULL, -- Humidité en pourcentage
    pressure DECIMAL(6,2) NOT NULL, -- Pression en hPa
    wind_speed DECIMAL(5,2) NOT NULL, -- Vitesse du vent en km/h
    wind_direction ENUM('N', 'NE', 'E', 'SE', 'S', 'SO', 'O', 'NO') NOT NULL,
    CONSTRAINT fk_releve_station FOREIGN KEY (station_id)
        REFERENCES station(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT chk_releve_humidity CHECK (humidity BETWEEN 0 AND 100),
    CONSTRAINT chk_releve_pressure CHECK (pressure > 0),
    CONSTRAINT chk_releve_wind_speed CHECK (wind_speed >= 0),
    CONSTRAINT chk_releve_time CHECK (time >= '00:00:00' AND time < '24:00:00'),
    INDEX idx_releve_station_date_time (station_id, date, time)
) ENGINE=InnoDB;
