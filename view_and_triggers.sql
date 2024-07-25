#-----------------------------------------------------------------------------------------
# 5. view and trigger to update payment status
#-----------------------------------------------------------------------------------------

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
    
