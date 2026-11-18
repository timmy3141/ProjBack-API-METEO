-- Projet Backend - API de relevés météo
-- Données fictives à charger dans les tables vides après execution de "db/schema.sql"

USE api_meteo;

START TRANSACTION;

INSERT INTO station (id, name, location, altitude, latitude, longitude) VALUES
(1, 'Station du collège', 'Sainte-Croix', 1080.00, 46.822000, 6.502000),
(2, 'Station du lac', 'Yverdon-les-Bains', 435.00, 46.778000, 6.641000),
(3, 'Station du parc', 'Lausanne', 520.00, 46.520000, 6.632000),
(4, 'Station de test', 'Neuchâtel', 480.00, 46.990000, 6.930000);


INSERT INTO releve (
    id, station_id, date, time, temperature, humidity,
    pressure, wind_speed, wind_direction
) VALUES
(1, 1, '2026-11-17', '14:00:00', 6.50, 65.00, 895.20, 12.00, 'NO'),
(2, 1, '2026-11-17', '08:00:00', -2.30, 92.00, 897.50, 0.00, 'N'),
(3, 1, '2026-11-18', '08:00:00', 1.20, 88.00, 898.00, 5.50, 'NE'),
(4, 2, '2026-11-17', '08:00:00', 4.80, 85.00, 963.50, 8.00, 'E'),
(5, 2, '2026-11-18', '08:00:00', 5.10, 87.00, 962.80, 6.00, 'SE'),
(6, 2, '2026-11-17', '14:00:00', 10.20, 62.00, 961.20, 15.50, 'S'),
(7, 3, '2026-11-18', '08:00:00', 6.30, 80.00, 953.70, 4.00, 'SO'),
(8, 3, '2026-11-17', '08:00:00', 5.90, 82.00, 954.00, 9.00, 'O'),
(9, 3, '2026-11-17', '14:00:00', 11.40, 58.00, 952.50, 18.00, 'NO');

COMMIT;
