drop database if exists ecole;
create database ecole CHARACTER SET 'utf8';

use ecole;

DROP TABLE IF EXISTS Formations;
CREATE TABLE Formations(
        id_formation     int (25) Auto_increment not null,
        nom_formation     Varchar (50) not null,
        description     Text (2000) not null,
        date_debut     Date not null,
        date_fin     Date not null,
        tarif     Real unsigned not null,
        PRIMARY KEY (id_formation)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Etudiants;
CREATE TABLE Etudiants(
        id_etudiant     int (25) Auto_increment not null,
        nom     Varchar (50) not null,
        prenom     Varchar (50) not null,
        date_naissance     Date not null,
        email     Varchar (50) not null,
        telephone     Varchar (50) not null,
        date_inscription     Date not null,
        PRIMARY KEY (id_etudiant)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Paiements;
CREATE TABLE Paiements(
        id_paiement     int (50) Auto_increment not null,
        montant     Float (50) not null,
        date_paiement     Date not null,
        methode_paiement     Varchar (50) not null,
        id_inscription_Inscriptions int not null,
        PRIMARY KEY (id_paiement)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Inscriptions;
CREATE TABLE Inscriptions(
        id_inscription     int (25) auto_increment not null,
        date_inscription     Date not null,
        statut_paiement     Bool not null,
        id_etudiant_Etudiants  int not null,
        id_formation_Formations int not null,
        PRIMARY KEY (id_inscription)
)ENGINE=InnoDB;



ALTER TABLE Paiements ADD CONSTRAINT FK_Paiements_id_inscription_Inscriptions FOREIGN KEY (id_inscription_Inscriptions) REFERENCES Inscriptions(id_inscription);
ALTER TABLE Inscriptions ADD CONSTRAINT FK_Inscriptions_id_etudiant_Etudiants FOREIGN KEY (id_etudiant_Etudiants) REFERENCES Etudiants(id_etudiant);
ALTER TABLE Inscriptions ADD CONSTRAINT FK_Inscriptions_id_formation_Formations FOREIGN KEY (id_formation_Formations) REFERENCES Formations(id_formation);
