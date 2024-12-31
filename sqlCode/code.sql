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
    id_vehicule INT NOT null AUTO_INCREMENT PRIMARY KEY,
    modele VARCHAR(250) NOT NULL,
    marque VARCHAR(250) NOT NULL,
    prix_par_jour float NOT NULL,
    disponibilite BOOLEAN DEFAULT TRUE NOT null,
    id_categorie INT,
    imageUrl VARCHAR(255) not null,
    description TEXT NOT null,
    km float NOT null,
    consom varchar(50) NOT null,
    annee int NOT null,
    place int NOT null,
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie) ON DELETE SET NULL
);

CREATE TABLE reservations (
    id_reservation INT NOT null AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT null,
    id_vehicule INT NOT null,
    date_reser DATE NOT NULL,
    heure_reser time not null,
    lieu_reser VARCHAR(100) NOT null,
    statut ENUM('En attente', 'Confirmée', 'Annulée') DEFAULT 'En attente' not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES usersite(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule) ON DELETE CASCADE
);

CREATE TABLE avis (
    id_avis INT NOT null AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT null,
    id_vehicule INT NOT null,
    commentaire TEXT NOT null,
    note INT CHECK (note BETWEEN 1 AND 5) NOT null,
    soft_delete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_user) REFERENCES usersite(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule) ON DELETE CASCADE
);