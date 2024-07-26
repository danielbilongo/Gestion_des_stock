#Requete pour lister tous les étudiants inscrits à une certaine formation
select"-- Requete pour lister tous les étudiants inscrits à une certaine formation--";
select e.nom, e.prenom, e.id_etudiant
from Etudiants as e
join Inscriptions as i 
  on i.id_etudiant_Etudiants = e.id_etudiant
join Formations as f 
  on i.id_formation_Formations = f.id_formation
where f.nom_formation = "Infographie";



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
