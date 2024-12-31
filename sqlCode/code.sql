CREATE DATABASE DriveLoc;

USE DriveLoc;

-- Table Role
CREATE TABLE role (
    id_role int NOT null AUTO_INCREMENT PRIMARY KEY,
    name_user ENUM('Admin', 'Client') NOT NULL
);

-- Table UserSite
CREATE TABLE usersite (
    id_user int NOT null AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(250) NOT NULL UNIQUE,
    email VARCHAR(250) NOT NULL UNIQUE,
    telephone varchar(50) NOT null UNIQUE,
    password VARCHAR(255) NOT NULL,
    id_role int NOT null,
    FOREIGN KEY (id_role) REFERENCES role(id_role)
);

CREATE TABLE categorie (
    id_categorie int NOT null AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(250) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE vehicule (
    id_vehicule INT PRIMARY KEY AUTO_INCREMENT,
    modele VARCHAR(250) NOT NULL,
    marque VARCHAR(250) NOT NULL,
    prix_par_jour float NOT NULL,
    disponibilite BOOLEAN DEFAULT TRUE,
    categorie_id INT,
    imageUrl VARCHAR(255),
    description TEXT,
    km float NOT null,
    consom varchar(50) NOT null,
    annee int NOT null,
    place int NOT null,
    FOREIGN KEY (categorie_id) REFERENCES categorie(id) ON DELETE SET NULL
);