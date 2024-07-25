drop procedure if exists newinscription;
DELIMITER //

CREATE PROCEDURE newinscription (
    IN etudiant_id INT,
    IN formation_id INT,
    IN inscription_date DATE,
    IN paiement_statut BOOL
)
BEGIN
    INSERT INTO Inscriptions ( id_etudiant_Etudiants, id_formation_Formations, date_inscription, statut_paiement)
    VALUES ( etudiant_id, formation_id, inscription_date, paiement_statut);
    END //
    
DELIMITER ;


drop function if exists formation;

DELIMITER //

CREATE FUNCTION formation_availaible (id_formation_Formation INT) 
RETURNS bool
DETERMINISTIC
BEGIN
    DECLARE nombre_total INT;
    DECLARE nombre_inscriptions INT;
    DECLARE places_restantes bool;
    
    SELECT nombre_places INTO nombre_total
    FROM Formations 
    WHERE id_formation = formation_id;

    SELECT COUNT(*) INTO nombre_inscriptions
    FROM Inscriptions
    WHERE id_formation_Formations = formation_id;

    SET places_restantes = nombre_total - nombre_inscriptions;


if (places_restantes <= 0) then
	set places_restantes = false;
else
	set places_restantes = true;
end if  ; 
    RETURN places_restantes;
    
END //

DELIMITER ;