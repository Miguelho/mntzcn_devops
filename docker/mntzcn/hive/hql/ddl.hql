CREATE TABLE IF NOT EXISTS CITY (cityName STRING, population INT, X1 STRING, X2 STRING, X3 STRING, X4 STRING, X5 STRING); 
CREATE TABLE IF NOT EXISTS CLIENT (clientId STRING, age INT, gender STRING, nationality STRING, civilStatus STRING, socioeconomicLevel STRING);
CREATE TABLE IF NOT EXISTS ANTENNA (AntennaId STRING, Intensity STRING, X STRING, Y STRING);
CREATE TABLE IF NOT EXISTS EVENT (clientId STRING, event_date STRING, antennaId STRING);