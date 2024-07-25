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
('Foucher', 'Gabriel', '+33 3 86 40 24 65', 'zriou@example.com', '2023-01-27', '1997-06-11'),
('Ferrand', 'Olivier', '+33 (0)3 90 32 47 67', 'vincent69@example.org', '2024-05-22', '1997-02-17'),
('Dias', 'Michèle', '+33 6 22 12 84 98', 'leroypatricia@example.org', '2023-07-06', '1994-04-18'),
('Dupuis', 'Jean', '+33 5 82 53 65 62', 'didiercaroline@example.net', '2024-03-29', '1995-10-02'),
('Laporte', 'Jean', '+33 (0)4 42 53 40 03', 'celina68@example.net', '2024-02-17', '1998-03-24'),
('Coste', 'Marie', '02 34 83 04 66', 'nathalie56@example.org', '2023-03-01', '1997-05-10'),
('Lucas', 'Louis', '+33 (0)1 64 68 65 38', 'smeyer@example.com', '2023-03-07', '1993-12-01'),
('Bonneau', 'Gilles', '+33 (0)4 90 10 86 05', 'martine33@example.org', '2023-04-06', '1992-05-31'),
('Loiseau', 'Charles', '+33 (0)4 92 86 07 28', 'xavierpineau@example.com', '2023-02-01', '1994-09-01');

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
  


