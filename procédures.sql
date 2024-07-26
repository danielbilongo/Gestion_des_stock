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
