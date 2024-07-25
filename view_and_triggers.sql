#-----------------------------------------------------------------------------------------
# 5. view and trigger to update payment status
#-----------------------------------------------------------------------------------------
SELECT "*********************VIEW AND TRIGGER*********************************\n";

# 1. view to display registration details
#------------------------------------------------------------------
SELECT "*******View to display registration details***********\n";

drop view if exists inscriptionsDetails;
create view inscriptionsDetails as
select nom, nom_formation, date_inscription from Inscriptions inner join
Etudiants on id_etudiant = id_etudiant_Etudiants inner join
Formations on id_formation = id_formation_Formations;

# calling the view
select * from inscriptionsDetails order by date_inscription;

#-----------------------------------------------------------------
# 2. trigger update paymentStatus when a payment is done
#------------------------------------------------------------------
SELECT "**********Trigger to update paymentStatus**************\n";

# a. when a payment is done
drop trigger if exists paymentStatus;
delimiter //
create trigger paymentStatus
after insert on paiement
for each row
begin
	declare total float;
    declare price real;
    select id_inscription_Inscriptions, SUM(montant) into total 
    where id_inscription_Inscriptions = new.id_inscription_Inscriptions;
    select tarif into price from Formations;
    if total < price then
		select 'il reste encore: '+price - total+'$ a verser';
    else
		update Inscriptions set statut_paiement = true 
        where id_inscription = new.id_inscription_Inscriptions;
	end if;
end //
delimiter ;