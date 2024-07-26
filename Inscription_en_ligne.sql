#Ma base de données : 
#-----------------------------------------------------------------------------------------
# 1. database creation
#-----------------------------------------------------------------------------------------
SELECT "***************CREATION DE LA BASE DE DONNEES*************************";
DROP DATABASE IF EXISTS ecole;
CREATE DATABASE ecole CHARACTER SET 'utf8';

USE ecole;

#-----------------------------------------------------------------------------------------
# 2. tables creation
#-----------------------------------------------------------------------------------------
SELECT "***************CREATION DES TABLES****************************\n";
-- Création de la table Etudiants
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

-- Création de la table Formations
DROP TABLE IF EXISTS Formations;
CREATE TABLE Formations(
        id_formation     int (25) Auto_increment not null,
        nom_formation     Varchar (50) not null,
        description     Text (2000),
        date_debut     Date not null,
        date_fin     Date not null,
        tarif     Real unsigned not null,
        nombre_places int (50),
        PRIMARY KEY (id_formation)
)ENGINE=InnoDB;

-- Création de la table Inscriptions
DROP TABLE IF EXISTS Inscriptions;
CREATE TABLE Inscriptions(
        id_inscription     int (25) auto_increment not null,
        date_inscription     Date not null,
        statut_paiement     Bool not null default false,
        id_etudiant_Etudiants  int not null,
        id_formation_Formations int not null,
        PRIMARY KEY (id_inscription),
        FOREIGN KEY (id_etudiant_Etudiants) REFERENCES Etudiants(id_etudiant),
        FOREIGN KEY (id_formation_Formations) REFERENCES Formations(id_formation)
)ENGINE=InnoDB;

-- Création de la table Paiements
DROP TABLE IF EXISTS Paiements;
CREATE TABLE Paiements(
        id_paiement     int (50) Auto_increment not null,
        montant     Float (50) not null,
        date_paiement     Date not null,
        methode_paiement     Varchar (50) not null,
        id_inscription_Inscriptions int not null,
        PRIMARY KEY (id_paiement),
        FOREIGN KEY (id_inscription_Inscriptions) REFERENCES Inscriptions(id_inscription)
)ENGINE=InnoDB;


#-----------------------------------------------------------------------------------------
# 3. inserting data in tables
#-----------------------------------------------------------------------------------------
SELECT "******************INSERTION DES DONNEES DANS LES TABLES*******************\n";
INSERT INTO Formations (nom_formation, description, date_debut, date_fin, tarif, nombre_places)
VALUES
  ('Développement web', 'Apprenez à créer des sites web dynamiques avec HTML CSS et JavaScript.', '2024-09-01', '2024-12-15', 250.000, 10),
  ('Infographie', 'Maîtrisez les logiciels Adobe Photoshop et Illustrator pour créer des visuels professionnels.', '2024-10-05', '2024-12-22', 250.000, 15),
  ('Réseaux informatiques', 'Configurez et sécurisez des réseaux informatiques pour les entreprises.', '2024-11-10', '2025-01-26', 250.000, 25),
  ('Comptabilité', 'Apprenez les bases de la comptabilité et de la gestion financière.', '2024-12-01', '2025-02-23', 250.000, 30),
  ('Anglais des affaires', 'Perfectionnez votre anglais pour des communications professionnelles efficaces.', '2025-01-12', '2025-03-30', 250.000, 25),
  ('Marketing digital', 'Maîtrisez les techniques du marketing digital pour promouvoir votre entreprise en ligne.', '2025-02-02', '2025-04-27', 250.000, 20);

INSERT INTO Etudiants (nom, prenom, telephone, email, date_inscription, date_naissance)
VALUES
('Foucher', 'Gabriel', '+33 3 86 40 24 65', 'zriou@example.com', '2023-01-22', '1997-06-11'),
('Ferrand', 'Olivier', '+33 (0)3 90 32 47 67', 'vincent69@example.org', '2024-04-12', '1997-02-17'),
('Dias', 'Michèle', '+33 6 22 12 84 98', 'leroypatricia@example.org', '2023-06-05', '1994-04-18'),
('Dupuis', 'Jean', '+33 5 82 53 65 62', 'didiercaroline@example.net', '2024-02-11', '1995-10-02'),
('Laporte', 'Jean', '+33 (0)4 42 53 40 03', 'celina68@example.net', '2024-01-10', '1998-03-24'),
('Coste', 'Marie', '02 34 83 04 66', 'nathalie56@example.org', '2023-02-09', '1997-05-10'),
('Lucas', 'Louis', '+33 (0)1 64 68 65 38', 'smeyer@example.com', '2023-02-14', '1993-12-01'),
('Bonneau', 'Gilles', '+33 (0)4 90 10 86 05', 'martine33@example.org', '2023-03-14', '1992-05-31'),
('Loiseau', 'Charles', '+33 (0)4 92 86 07 28', 'xavierpineau@example.com', '2023-01-14', '1994-09-01');

INSERT INTO Inscriptions (date_inscription, statut_paiement, id_etudiant_Etudiants, id_formation_Formations)
VALUES
('2023-01-27', 0, 1, 1),
('2024-05-22', 0, 2, 2),
('2023-07-06', 0, 3, 2),
('2024-03-29', 1, 4, 3),
('2024-02-17', 0, 5, 4),
('2023-03-01', 0, 6, 5),
('2023-03-07', 0, 7, 6),
('2023-04-06', 0, 8, 5),
('2023-02-01', 0, 9, 3); 

INSERT INTO Paiements (montant, date_paiement, methode_paiement, id_inscription_Inscriptions)
VALUES
  (100.000, '2023-07-21', 'Carte bancaire', 1),
  (90.000, '2023-06-15', 'Chèque', 2),
  (120.000, '2023-12-25', 'Carte bancaire', 3),
  (250.000, '2023-10-10', 'Chèque', 4),
  (70.000, '2024-05-14', 'Orange-money', 5),
  (50.000, '2024-08-30', 'Carte bancaire', 6),
  (200.000, '2024-03-03', 'Chèque', 7),
  (30.000, '2023-09-11', 'Orange-money', 8),
  (20.000, '2023-11-01', 'Carte bancaire', 9),
  (10.000, '2023-09-15', 'Chèque', 2),
  (60.000, '2024-03-01', 'Carte bancaire', 1),
  (15.000, '2024-02-26', 'Orange-money', 3),
  (76.000, '2024-01-01', 'Chèque', 8),
  (42.000, '2024-09-11', 'Orange-money', 6),
  (20.000, '2024-04-07', 'Carte bancaire', 9),
  (30.000, '2024-06-17', 'Chèque', 5),
  (63.000, '2024-05-01', 'Carte bancaire', 7);
  

#-----------------------------------------------------------------------------------------
# 4. procedure and function
#-----------------------------------------------------------------------------------------
SELECT "*****************CREATION PROCEDURE***********************\n"
drop procedure if exists newinscription;
DELIMITER //

CREATE PROCEDURE newinscription (
    IN etudiant_id INT,
    IN formation_id INT
)
BEGIN
    INSERT INTO Inscriptions ( id_etudiant_Etudiants, id_formation_Formations, date_inscription, statut_paiement)
    VALUES ( etudiant_id, formation_id, NOW(), FALSE);
    END //
    
DELIMITER ;


drop function if exists formation_available;

DELIMITER //

CREATE FUNCTION formation_available (id_formation_Formation INT) 
RETURNS bool
DETERMINISTIC
BEGIN
    DECLARE nombre_total INT;
    DECLARE nombre_inscriptions INT;
    DECLARE places_restantes bool;
    
    SELECT nombre_places INTO nombre_total
    FROM Formations 
    WHERE id_formation = id_formation_Formation;

    SELECT COUNT(*) INTO nombre_inscriptions
    FROM Inscriptions
    WHERE id_formation_Formations = id_formation_Formation;

    SET places_restantes = nombre_total - nombre_inscriptions;


if (places_restantes <= 0) then
	set places_restantes = false;
else
	set places_restantes = true;
end if  ; 
    RETURN places_restantes;
    
END //

DELIMITER ;



#-----------------------------------------------------------------------------------------
# 5. view and trigger to update payment status
#-----------------------------------------------------------------------------------------
SELECT "*********************VIEW AND TRIGGER*********************************\n";

# 1. view to display registration details
#------------------------------------------------------------------
#SELECT "*********************VIEW AND TRIGGER*********************************\n";

#SELECT "*******View to display registration details***********\n";

drop view if exists inscriptionDetails;
create view inscriptionDetails as
select nom, nom_formation, Inscriptions.date_inscription from Inscriptions inner join
Etudiants on id_etudiant = id_etudiant_Etudiants inner join
Formations on id_formation = id_formation_Formations;

# calling the view
select * from inscriptionDetails order by date_inscription;

#-----------------------------------------------------------------
# 2. trigger update paymentStatus when a payment is done
#------------------------------------------------------------------
#SELECT "**********Trigger to update paymentStatus**************\n";

drop procedure if exists countMoney;
delimiter //

create procedure countMoney(in id int, out total float)
begin 
	declare total float;
	select SUM(montant) into total from Inscriptions inner join 
    Paiements on id_inscription = id_inscription_Inscriptions
	where id_inscription_Inscriptions = id;
end //
delimiter ;
# select countMoney(1);

drop trigger if exists paymentStatus;
delimiter //
create trigger paymentStatus
after insert on Paiements
for each row
begin
	declare total float;
    declare price real;
    call countMoney(new.id_inscription_Inscriptions, total);
    
    select tarif into price from Formations inner join 
    Inscriptions on id_formation = id_formation_Formations 
    where id_inscription = new.id_inscription_Inscriptions;
    
    if total > price then
		update Inscriptions set statut_paiement = false 
        where id_inscription = new.id_inscription_Inscriptions;
    else
		update Inscriptions set statut_paiement = true 
        where id_inscription = new.id_inscription_Inscriptions;
	end if;
end //
delimiter ;


#Requete pour lister tous les étudiants inscrits à une certaine formation
select"-- Requete pour lister tous les étudiants inscrits à une certaine formation--";
select e.nom, e.prenom, e.id_etudiant
from Etudiants as e
join Inscriptions as i 
  on i.id_etudiant_Etudiants = e.id_etudiant
join Formations as f 
  on i.id_formation_Formations = f.id_formation
where f.nom_formation = "Infographie";


#----------------------------------------------------------------------------------------
# 6. various sql queries
#----------------------------------------------------------------------------------------
#Requête pour trouver les paiements effectués par un certain étudiant
select"-- Requete pour trouver les paiements effectués par un certain étudiant--";
select p.id_paiement, p.montant, p.methode_paiement, p.date_paiement
from Paiements as p
Join Inscriptions as i
	on p.id_inscription_Inscriptions = i.id_inscription
Join Etudiants as e
	on e.id_etudiant  = i.id_etudiant_Etudiants
where e.nom = "Foucher";



#Requête pour lister les inscriptions en cours dun étudiant
select"--Requete pour lister les inscriptions en cours dun étudiant--";
select i.id_inscription, i.date_inscription, i.statut_paiement
from Inscriptions as i
Join Etudiants as e
	On i.id_etudiant_Etudiants = e.id_etudiant
where e.nom = "Foucher" and i.statut_paiement = 0 ;


#Requête pour compter le nombre total dinscriptions par formation
select"--Requete pour compter le nombre total dinscriptions par formation--";
select f.id_formation, f.nom_formation, COUNT(f.id_formation) as Total_inscriptions
from Formations as f
Join Inscriptions as i
	On i.id_formation_Formations = f.id_formation
Where f.nom_formation = "Infographie"
GROUP BY f.id_formation;
    



ALTER TABLE Paiements ADD CONSTRAINT FK_Paiements_id_inscription_Inscriptions FOREIGN KEY (id_inscription_Inscriptions) REFERENCES Inscriptions(id_inscription);
ALTER TABLE Inscriptions ADD CONSTRAINT FK_Inscriptions_id_etudiant_Etudiants FOREIGN KEY (id_etudiant_Etudiants) REFERENCES Etudiants(id_etudiant);
ALTER TABLE Inscriptions ADD CONSTRAINT FK_Inscriptions_id_formation_Formations FOREIGN KEY (id_formation_Formations) REFERENCES Formations(id_formation);
