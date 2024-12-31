CREATE DATABASE DriveLoc;

USE DriveLoc;

-- Table Role
CREATE TABLE role (
    id_role int NOT null AUTO_INCREMENT PRIMARY KEY,
    name_user ENUM('Admin', 'Client') NOT NULL
);

