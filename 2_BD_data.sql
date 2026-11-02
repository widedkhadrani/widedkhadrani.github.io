USE snowpeak;


INSERT INTO station (nom_station, lieu) VALUES
('Les Arcs', 'Bourg-Saint-Maurice, Savoie'),
('Chamrousse', 'Grenoble, Isère'),
('Val Thorens', 'Saint-Martin-de-Belleville, Savoie'),
('Méribel', 'Les Allues, Savoie');


INSERT INTO employe (nom_employe, prenom_employe, role_employe, email_employe, telephone_employe, id_station) VALUES
-- Station 1 : Les Arcs
('Bouzian', 'Abdoullah', 'Moniteur', 'abdoullah.bouzian@snowpeak.fr', '0612345678', 1),
('Ziti', 'Taslim', 'Moniteur', 'taslim.ziti@snowpeak.fr', '0623456789', 1),
('Fajri', 'Rania', 'Technicien', 'rania.fajri@snowpeak.fr', '0634567890', 1),
('Tamsouri', 'Mohammed', 'Technicien', 'mohammed.tamsouri@snowpeak.fr', '0645678901', 1),
('Khadrani', 'Wided', 'Administratif', 'wided.khadrani@snowpeak.fr', '0656789012', 1),
('Lefevere', 'Julien', 'Administratif', 'julien.lefevere@snowpeak.fr', '0667890123', 1),
-- Station 2 : Chamrousse
('Schaal', 'Gabriel', 'Moniteur', 'gabriel.schaal@snowpeak.fr', '0678901234', 2),
('Daguet', 'Laura', 'Moniteur', 'laura.daguet@snowpeak.fr', '0689012345', 2),
('Gobalasamy', 'Ashani', 'Technicien', 'ashani.gobalasamy@snowpeak.fr', '0690123456', 2),
('Benabbi', 'Youssef', 'Technicien', 'youssef.benabbi@snowpeak.fr', '0601234567', 2),
('Kouassi', 'Eunice', 'Administratif', 'eunice.kouassi@snowpeak.fr', '0611234567', 2),
('Belahcen', 'Nabil', 'Administratif', 'nabil.belahcen@snowpeak.fr', '0622345678', 2),
-- Station 3 : Val Thorens
('Poincignon', 'Thomas', 'Moniteur', 'thomas.poincignon@snowpeak.fr', '0633456789', 3),
('Bennacar', 'Salma', 'Moniteur', 'salma.bennacar@snowpeak.fr', '0644567890', 3),
('Gomar', 'Julia', 'Technicien', 'julia.gomar@snowpeak.fr', '0655678901', 3),
('Skoczen', 'Konrad', 'Technicien', 'konrad.skoczen@snowpeak.fr', '0666789012', 3),
('Safi', 'Lina', 'Administratif', 'lina.safi@snowpeak.fr', '0677890123', 3),
('Pham', 'Ngoc Anh Tuan', 'Administratif', 'ngoc-anh-tuan.pham@snowpeak.fr', '0688901234', 3),
-- Station 4 : Méribel
('Boukhir', 'Sami', 'Moniteur', 'sami.boukhir@snowpeak.fr', '0699012345', 4),
('Chtioui', 'Hadil', 'Moniteur', 'hadil.chtioui@snowpeak.fr', '0610123456', 4),
('Ben Ziki', 'Nahid', 'Technicien', 'nahid.ben-ziki@snowpeak.fr', '0621234567', 4),
('Lahssini', 'Haroun', 'Technicien', 'haroun.lahssini@snowpeak.fr', '0632345678', 4),
('Jaquet', 'Laura', 'Administratif', 'laura.jaquet@snowpeak.fr', '0643456789', 4),
('Rougui', 'Mohammed Mehdi', 'Administratif', 'mohammed-mehdi.rougui@snowpeak.fr', '0654567890', 4);


INSERT INTO horaire (jour, heure_debut, heure_fin, id_employe) VALUES
-- Station 1 : Les Arcs
-- Moniteur 1 (Abdoullah Bouzian)
('Mardi', '08:00:00', '17:00:00', 1),
('Jeudi', '08:00:00', '17:00:00', 1),
('Samedi', '08:00:00', '17:00:00', 1),
-- Moniteur 2 (Taslim Ziti)
('Mercredi', '08:00:00', '17:00:00', 2),
('Vendredi', '08:00:00', '17:00:00', 2),
('Dimanche', '08:00:00', '17:00:00', 2),
-- Technicien 1 (Rania Fajri)
('Mardi', '08:00:00', '16:00:00', 3),
('Jeudi', '08:00:00', '16:00:00', 3),
('Samedi', '08:00:00', '16:00:00', 3),
-- Technicien 2 (Mohammed Tamsouri)
('Mercredi', '08:00:00', '16:00:00', 4),
('Vendredi', '08:00:00', '16:00:00', 4),
('Dimanche', '08:00:00', '16:00:00', 4),
-- Administratif 1 (Wided Khadrani)
('Lundi', '09:00:00', '17:00:00', 5),
('Mercredi', '09:00:00', '13:00:00', 5),
('Vendredi', '09:00:00', '17:00:00', 5),
-- Administratif 2 (Julien Lefevere)
('Mardi', '09:00:00', '17:00:00', 6),
('Jeudi', '09:00:00', '17:00:00', 6),
('Samedi', '09:00:00', '13:00:00', 6),

-- Station 2 : Chamrousse
-- Moniteur 1 (Gabriel Schaal)
('Lundi', '08:00:00', '17:00:00', 7),
('Samedi', '08:00:00', '17:00:00', 7),
('Dimanche', '08:00:00', '17:00:00', 7),
-- Moniteur 2 (Laura Daguet)
('Mardi', '08:00:00', '17:00:00', 8),
('Jeudi', '08:00:00', '17:00:00', 8),
('Samedi', '08:00:00', '17:00:00', 8),
-- Technicien 1 (Ashani Gobalasamy)
('Lundi', '08:00:00', '16:00:00', 9),
('Mercredi', '08:00:00', '16:00:00', 9),
('Samedi', '08:00:00', '16:00:00', 9),
-- Technicien 2 (Youssef Benabbi)
('Mardi', '08:00:00', '16:00:00', 10),
('Jeudi', '08:00:00', '16:00:00', 10),
('Dimanche', '08:00:00', '16:00:00', 10),
-- Administratif 1 (Eunice Kouassi)
('Lundi', '09:00:00', '17:00:00', 11),
('Mercredi', '09:00:00', '13:00:00', 11),
('Vendredi', '09:00:00', '17:00:00', 11),
-- Administratif 2 (Nabil Belahcen)
('Mardi', '09:00:00', '17:00:00', 12),
('Jeudi', '09:00:00', '17:00:00', 12),
('Samedi', '09:00:00', '13:00:00', 12),

-- Station 3 : Val Thorens
-- Moniteur 1 (Thomas Poincignon)
('Lundi', '08:00:00', '17:00:00', 13),
('Vendredi', '08:00:00', '13:00:00', 13),
('Samedi', '08:00:00', '17:00:00', 13),
('Dimanche', '08:00:00', '17:00:00', 13),
-- Moniteur 2 (Salma Bennacar)
('Mardi', '08:00:00', '17:00:00', 14),
('Mercredi', '08:00:00', '17:00:00', 14),
('Jeudi', '08:00:00', '17:00:00', 14),
('Vendredi', '13:00:00', '17:00:00', 14),
-- Technicien 1 (Julia Gomar)
('Lundi', '08:00:00', '16:00:00', 15),
('Mercredi', '08:00:00', '16:00:00', 15),
('Jeudi', '08:00:00', '12:00:00', 15),
('Samedi', '08:00:00', '16:00:00', 15),
-- Technicien 2 (Konrad Skoczen)
('Mardi', '08:00:00', '16:00:00', 16),
('Jeudi', '12:00:00', '16:00:00', 16),
('Vendredi', '08:00:00', '16:00:00', 16),
('Dimanche', '08:00:00', '16:00:00', 16),
-- Administratif 1 (Lina Safi)
('Lundi', '09:00:00', '17:00:00', 17),
('Mercredi', '09:00:00', '13:00:00', 17),
('Vendredi', '09:00:00', '17:00:00', 17),
-- Administratif 2 (Ngoc Anh Tuan Pham)
('Mardi', '09:00:00', '17:00:00', 18),
('Jeudi', '09:00:00', '17:00:00', 18),
('Samedi', '09:00:00', '13:00:00', 18),

-- Station 4 : Méribel
-- Moniteur 1 (Sami Boukhir)
('Lundi', '08:00:00', '17:00:00', 19),
('Samedi', '08:00:00', '17:00:00', 19),
('Dimanche', '08:00:00', '17:00:00', 19),
-- Moniteur 2 (Hadil Chtioui)
('Mardi', '09:00:00', '18:00:00', 20),
('Jeudi', '09:00:00', '18:00:00', 20),
('Dimanche', '09:00:00', '18:00:00', 20),
-- Technicien 1 (Nahid Ben Ziki)
('Lundi', '08:00:00', '16:00:00', 21),
('Mercredi', '08:00:00', '16:00:00', 21),
('Samedi', '08:00:00', '16:00:00', 21),
-- Technicien 2 (Haroun Lahssini)
('Mardi', '08:00:00', '16:00:00', 22),
('Vendredi', '08:00:00', '16:00:00', 22),
('Dimanche', '08:00:00', '16:00:00', 22),
-- Administratif 1 (Laura Jaquet)
('Lundi', '09:00:00', '17:00:00', 23),
('Mercredi', '09:00:00', '17:00:00', 23),
('Vendredi', '09:00:00', '17:00:00', 23),
-- Administratif 2 (Mohammed Mehdi Rougui)
('Mardi', '09:00:00', '17:00:00', 24),
('Jeudi', '09:00:00', '17:00:00', 24),
('Samedi', '09:00:00', '17:00:00', 24);


INSERT INTO client (nom_client, prenom_client, date_naissance_client, telephone_client, email_client) VALUES
('Deng', 'Yuxin', '1990-05-15', '0712345678', 'yuxin.deng@gmail.com'),
('Guinebert', 'Bastien', '1995-03-22', '0723456789', 'bastien.guinebert@gmail.com'),
('He', 'Yihan', '2001-07-10', '0734567890', 'yihan.he@gmail.com'),
('Huang', 'Yuanyuan', '2001-11-30', '0745678901', 'yuanyuan.huang@gmail.com'),
('Miceli', 'Lilian', '2004-03-25', '0687362937', 'lilian.miceli@gmail.com'),
('Periniola', 'Johan', '2004-09-14', '0767890123', 'johan.periniola@gmail.com'),
('Restif', 'Hugues', '2003-11-03', '0637283946', 'hugues.restif@gmail.com'),
('Sakhri', 'Assmaa', '2004-12-03', '0789012345', 'assmaa.sakhri@gmail.com'),
('Sooben', 'Nelly', '2000-06-19', '0790123456', 'nelly.sooben@gmail.com'),
('Taverdet', 'Paul', '2004-09-12', '0635743963', 'paul.taverdet@gmail.com'),
('Yasar', 'Bilal', '2004-04-08', '0778901234', 'bilal.yasar@gmail.com'),
('Deschaux', 'Lois', '2004-07-03', '0697327463', 'lois.deschaux@gmail.com');


INSERT INTO service (type_service, prix_service) VALUES
('Assurance Neige', 110.00),
('Assistance Piste', 50.00);


INSERT INTO fournisseur (nom_fournisseur, type_service, email_fournisseur, telephone_fournisseur) VALUES
('Snowtech', 'Maintenance équipements', 'contact@snowtech.fr', '0412345678'),
('Snowrisk', 'Assurance/Assistance', 'contact@snowrisk.fr', '0423456789');


INSERT INTO equipement (type_equipement, taille, etat, niveau_requis, disponibilite, prix_jour_base, id_station) VALUES
-- Station 1 : Les Arcs
('Ski', '140cm', 'Neuf', 'Débutant', 1, 18.00, 1),
('Ski', '150cm', 'Bon état', 'Débutant', 1, 20.00, 1),
('Ski', '160cm', 'Bon état', 'Intermédiaire', 1, 25.00, 1),
('Ski', '170cm', 'Usagé', 'Intermédiaire', 1, 22.00, 1),
('Ski', '175cm', 'Neuf', 'Expert', 1, 28.00, 1),
('Snowboard', '130cm', 'Neuf', 'Débutant', 1, 25.00, 1),
('Snowboard', '140cm', 'Bon état', 'Intermédiaire', 1, 30.00, 1),
('Snowboard', '150cm', 'Neuf', 'Expert', 1, 32.00, 1),
('Snowboard', '130cm', 'Usagé', 'Débutant', 1, 22.00, 1),
('Snowboard', '150cm', 'Bon état', 'Intermédiaire', 1, 28.00, 1),
('Luge', 'Enfant', 'Neuf', 'Débutant', 1, 10.00, 1),
('Luge', 'Enfant', 'Bon état', 'Débutant', 1, 8.00, 1),
('Luge', 'Standard', 'Usagé', 'Débutant', 1, 6.00, 1),
('Luge', 'Standard', 'Neuf', 'Débutant', 1, 10.00, 1),
('Luge', 'Standard', 'Bon état', 'Débutant', 1, 8.00, 1),
-- Station 2 : Chamrousse
('Ski', '140cm', 'Bon état', 'Débutant', 1, 18.00, 2),
('Ski', '150cm', 'Neuf', 'Débutant', 1, 20.00, 2),
('Ski', '160cm', 'Usagé', 'Intermédiaire', 1, 22.00, 2),
('Ski', '170cm', 'Bon état', 'Intermédiaire', 1, 25.00, 2),
('Ski', '175cm', 'Neuf', 'Expert', 1, 28.00, 2),
('Snowboard', '140cm', 'Bon état', 'Débutant', 1, 25.00, 2),
('Snowboard', '130cm', 'Neuf', 'Intermédiaire', 1, 30.00, 2),
('Snowboard', '155cm', 'Usagé', 'Expert', 1, 28.00, 2),
('Snowboard', '135cm', 'Neuf', 'Débutant', 1, 22.00, 2),
('Snowboard', '150cm', 'Bon état', 'Intermédiaire', 1, 28.00, 2),
('Luge', 'Standard', 'Neuf', 'Débutant', 1, 10.00, 2),
('Luge', 'Standard', 'Bon état', 'Débutant', 1, 8.00, 2),
('Luge', 'Enfant', 'Usagé', 'Débutant', 1, 6.00, 2),
('Luge', 'Enfant', 'Neuf', 'Débutant', 1, 10.00, 2),
('Luge', 'Standard', 'Bon état', 'Débutant', 1, 8.00, 2),
-- Station 3 : Val Thorens
('Ski', '140cm', 'Neuf', 'Débutant', 1, 18.00, 3),
('Ski', '150cm', 'Bon état', 'Débutant', 1, 20.00, 3),
('Ski', '160cm', 'Neuf', 'Intermédiaire', 1, 25.00, 3),
('Ski', '170cm', 'Usagé', 'Intermédiaire', 1, 22.00, 3),
('Ski', '175cm', 'Bon état', 'Expert', 1, 28.00, 3),
('Snowboard', '130cm', 'Neuf', 'Débutant', 1, 25.00, 3),
('Snowboard', '150cm', 'Bon état', 'Intermédiaire', 1, 30.00, 3),
('Snowboard', '155cm', 'Neuf', 'Expert', 1, 32.00, 3),
('Snowboard', '140cm', 'Usagé', 'Débutant', 1, 22.00, 3),
('Snowboard', '140cm', 'Bon état', 'Intermédiaire', 1, 28.00, 3),
('Luge', 'Standard', 'Neuf', 'Débutant', 1, 10.00, 3),
('Luge', 'Standard', 'Bon état', 'Débutant', 1, 8.00, 3),
('Luge', 'Standard', 'Usagé', 'Débutant', 1, 6.00, 3),
('Luge', 'Enfant', 'Neuf', 'Débutant', 1, 10.00, 3),
('Luge', 'Enfant', 'Bon état', 'Débutant', 1, 8.00, 3),
-- Station 4 : Méribel
('Ski', '140cm', 'Bon état', 'Débutant', 1, 18.00, 4),
('Ski', '150cm', 'Neuf', 'Débutant', 1, 20.00, 4),
('Ski', '160cm', 'Bon état', 'Intermédiaire', 1, 25.00, 4),
('Ski', '170cm', 'Neuf', 'Intermédiaire', 1, 26.00, 4),
('Ski', '175cm', 'Usagé', 'Expert', 1, 25.00, 4),
('Snowboard', '150cm', 'Neuf', 'Débutant', 1, 25.00, 4),
('Snowboard', '155cm', 'Bon état', 'Intermédiaire', 1, 30.00, 4),
('Snowboard', '130cm', 'Neuf', 'Expert', 1, 32.00, 4),
('Snowboard', '140cm', 'Usagé', 'Débutant', 1, 22.00, 4),
('Snowboard', '145cm', 'Bon état', 'Intermédiaire', 1, 28.00, 4),
('Luge', 'Standard', 'Neuf', 'Débutant', 1, 10.00, 4),
('Luge', 'Enfant', 'Bon état', 'Débutant', 1, 8.00, 4),
('Luge', 'Enfant', 'Usagé', 'Débutant', 1, 6.00, 4),
('Luge', 'Standard', 'Neuf', 'Débutant', 1, 10.00, 4),
('Luge', 'Standard', 'Bon état', 'Débutant', 1, 8.00, 4);


INSERT INTO cours (libelle, niveau_cours, tarif_cours, duree, capacite_max, id_employe, id_station) VALUES
-- Station 1 : Les Arcs
('Initiation ski débutant', 'Débutant', 50.00, 2, 10, 1, 1),
('Perfectionnement ski', 'Intermédiaire', 70.00, 3, 8, 1, 1),
('Ski expert', 'Expert', 90.00, 3, 6, 2, 1),
('Initiation snowboard', 'Débutant', 55.00, 2, 8, 2, 1),
('Perfectionnement snowboard', 'Intermédiaire', 75.00, 3, 6, 1, 1),
('Ski enfants débutants', 'Débutant', 40.00, 2, 8, 2, 1),
('Snowboard enfants', 'Débutant', 45.00, 2, 6, 1, 1),
-- Station 2 : Chamrousse 
('Initiation ski débutant', 'Débutant', 50.00, 2, 10, 7, 2),
('Perfectionnement ski', 'Intermédiaire', 70.00, 3, 8, 7, 2),
('Ski expert', 'Expert', 90.00, 3, 6, 8, 2),
('Initiation snowboard', 'Débutant', 55.00, 2, 8, 8, 2),
('Perfectionnement snowboard', 'Intermédiaire', 75.00, 3, 6, 7, 2),
('Ski enfants débutants', 'Débutant', 40.00, 2, 8, 8, 2),
('Snowboard enfants', 'Débutant', 45.00, 2, 6, 7, 2),
-- Station 3 : Val Thorens 
('Initiation ski débutant', 'Débutant', 50.00, 2, 10, 13, 3),
('Perfectionnement ski', 'Intermédiaire', 70.00, 3, 8, 13, 3),
('Ski expert', 'Expert', 90.00, 3, 6, 14, 3),
('Initiation snowboard', 'Débutant', 55.00, 2, 8, 14, 3),
('Perfectionnement snowboard', 'Intermédiaire', 75.00, 3, 6, 13, 3),
('Ski enfants débutants', 'Débutant', 40.00, 2, 8, 14, 3),
('Snowboard enfants', 'Débutant', 45.00, 2, 6, 13, 3),
-- Station 4 : Méribel 
('Initiation ski débutant', 'Débutant', 50.00, 2, 10, 19, 4),
('Perfectionnement ski', 'Intermédiaire', 70.00, 3, 8, 19, 4),
('Ski expert', 'Expert', 90.00, 3, 6, 20, 4),
('Initiation snowboard', 'Débutant', 55.00, 2, 8, 20, 4),
('Perfectionnement snowboard', 'Intermédiaire', 75.00, 3, 6, 19, 4),
('Ski enfants débutants', 'Débutant', 40.00, 2, 8, 20, 4),
('Snowboard enfants', 'Débutant', 45.00, 2, 6, 19, 4);


INSERT INTO reservation (date_debut, date_fin, statut, id_client, id_station) VALUES
-- Client 1 (Yuxin Deng)
('2024-01-10', '2024-01-15', 'Terminée', 1, 1),
('2026-04-10', '2026-04-17', 'En cours', 1, 2),
-- Client 2 (Bastien Guinebert)
('2024-02-05', '2024-02-10', 'Terminée', 2, 3),
('2025-01-15', '2025-01-20', 'Terminée', 2, 1),
-- Client 3 (Yihan He)
('2025-02-10', '2025-02-15', 'Annulée', 3, 4),
-- Client 4 (Yuanyuan Huang)
('2024-01-20', '2024-01-25', 'Terminée', 4, 4),
('2025-03-01', '2025-03-07', 'Terminée', 4, 3),
-- Client 5 (Lilian Miceli)
('2024-02-15', '2024-02-20', 'Terminée', 5, 1),
-- Client 6 (Johan Perniola)
('2024-04-01', '2024-04-05', 'Terminée', 6, 3),
('2026-04-15', '2026-04-20', 'En cours', 6, 4),
-- Client 7 (Hugues Restif)
('2026-04-12', '2026-04-18', 'En cours', 7, 1),
-- Client 8 (Assmaa Sakhri)
('2024-01-05', '2024-01-10', 'Terminée', 8, 4),
('2025-01-20', '2025-01-25', 'Terminée', 8, 3),
-- Client 9 (Nelly Sooben)
('2024-02-01', '2024-02-07', 'Terminée', 9, 1),
('2025-02-01', '2025-02-07', 'Annulée', 9, 2),
-- Client 10 (Paul Taverdet)
('2026-04-20', '2026-04-25', 'En cours', 10, 4),
-- Client 11 (Bilal Yasar)
('2024-04-10', '2024-04-15', 'Terminée', 11, 1);


INSERT INTO facture_client (montant_total, date_emission, statut, mode_paiement, id_reservation) VALUES
-- Réservation 1 (Client 1, Les Arcs, Réservation terminée)
(150.00, '2024-01-10 14:00:00', 1, 'Carte bancaire', 1),
-- Réservation 2 (Client 1, Chamrousse, Réservation en cours)
(200.00, '2026-04-10 10:00:00', 0, 'Virement', 2),
-- Réservation 3 (Client 2, Val Thorens, Réservation terminée)
(175.00, '2024-02-05 11:00:00', 1, 'Chèque', 3),
-- Réservation 4 (Client 2, Les Arcs, Réservation terminée)
(160.00, '2025-01-15 09:00:00', 1, 'Carte bancaire', 4),
-- Réservation 6 (Client 4, Méribel, Réservation terminée)
(180.00, '2024-01-20 15:00:00', 1, 'Virement', 6),
-- Réservation 7 (Client 4, Val Thorens, Réservation terminée)
(210.00, '2025-03-01 12:00:00', 1, 'Carte bancaire', 7),
-- Réservation 8 (Client 5, Les Arcs, Réservation terminée)
(130.00, '2024-02-15 16:00:00', 1, 'Espèces', 8),
-- Réservation 9 (Client 6, Val Thorens, Réservation terminée)
(145.00, '2024-04-01 10:00:00', 1, 'Carte bancaire', 9),
-- Réservation 10 (Client 6, Méribel, Réservation en cours)
(220.00, '2026-04-15 09:00:00', 0, 'Virement', 10),
-- Réservation 11 (Client 7, Les Arcs, Réservation en cours)
(190.00, '2026-04-12 11:00:00', 0, 'Carte bancaire', 11),
-- Réservation 12 (Client 8, Méribel, Réservation terminée)
(165.00, '2024-01-05 14:00:00', 1, 'Espèces', 12),
-- Réservation 13 (Client 8, Val Thorens, Réservation terminée)
(175.00, '2025-01-20 10:00:00', 1, 'Carte bancaire', 13),
-- Réservation 14 (Client 9, Les Arcs, Réservation terminée)
(200.00, '2024-02-01 15:00:00', 1, 'Chèque', 14),
-- Réservation 16 (Client 10, Méribel, Réservation en cours)
(180.00, '2026-04-20 10:00:00', 0, 'Virement', 16),
-- Réservation 17 (Client 11, Les Arcs, Réservation terminée)
(155.00, '2024-04-10 14:00:00', 1, 'Chèque', 17);


INSERT INTO facture_fournisseur (montant_total, date_emission, statut, mode_paiement, id_fournisseur, id_station) VALUES
-- Fournisseur 1 (Snowtech : maintenance des équipements)
(1600.00, '2025-04-30 10:00:00', 1, 'Virement', 1, 1),
(1400.00, '2025-12-31 10:00:00', 1, 'Virement', 1, 2),
(1800.00, '2026-01-31 10:00:00', 1, 'Chèque', 1, 3),
(1500.00, '2026-02-28 10:00:00', 1, 'Chèque', 1, 4),
(1700.00, '2026-03-31 10:00:00', 0, 'Virement', 1, 1),
-- Fournisseur 2 (Snowrisk : assurance & assistance)
(2300.00, '2025-04-30 10:00:00', 1, 'Chèque', 2, 2),
(2300.00, '2025-12-31 10:00:00', 1, 'Virement', 2, 3),
(2400.00, '2026-01-31 10:00:00', 1, 'Chèque', 2, 4),
(2400.00, '2026-02-28 10:00:00', 1, 'Virement', 2, 1),
(2400.00, '2026-03-31 10:00:00', 0, 'Chèque', 2, 2);


INSERT INTO location_equipement (id_reservation, id_equipement, date_debut_location, date_fin_location, prix_applique) VALUES
-- Réservation 1 (Client 1 SEUL, Les Arcs)
(1, 1, '2024-01-10', '2024-01-12', 18.00), -- skis pour le début de la réservation (le 12 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(1, 6, '2024-01-13', '2024-01-15', 25.00), -- snowboard pour la fin de la réservation
-- Réservation 2 (Client 1 avec ACCOMPAGNATEUR, Chamrousse)
(2, 16, '2026-04-10', '2026-04-17', 18.00), -- skis pour le client 1
(2, 21, '2026-04-10', '2026-04-17', 25.00), -- snowboard pour l'accompagnateur de client 1 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 1)
-- Réservation 3 (Client 2 avec ACCOMPAGNATEUR, Val Thorens)
(3, 31, '2024-02-05', '2024-02-10', 18.00), -- skis pour le client 2
(3, 36, '2024-02-05', '2024-02-10', 25.00), -- snowboard pour l'accompagnateur de client 2 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 2)
-- Réservation 4 (Client 2 avec ACCOMPAGNATEUR, Les Arcs)
(4, 2, '2025-01-15', '2025-01-20', 20.00), -- skis pour le client 2
(4, 7, '2025-01-15', '2025-01-20', 30.00), -- snowboard pour l'accompagnateur de client 2 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 2)
-- Réservation 6 (Client 4 SEUL, Méribel)
(6, 46, '2024-01-20', '2024-01-22', 18.00), -- skis pour le début de la réservation (le 22 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(6, 51, '2024-01-23', '2024-01-25', 25.00), -- snowboard pour la fin de la réservation
-- Réservation 7 (Client 4 SEUL, Val Thorens)
(7, 33, '2025-03-01', '2025-03-03', 25.00), -- skis pour le début de la réservation (le 03 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(7, 38, '2025-03-04', '2025-03-07', 30.00), -- snowboard pour la fin de la réservation
-- Réservation 8 (Client 5 avec ACCOMPAGNATEUR, Les Arcs)
(8, 3, '2024-02-15', '2024-02-20', 25.00), -- skis pour le client 5
(8, 10, '2024-02-15', '2024-02-20', 28.00), -- snowboard pour l'accompagnateur de client 5 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 5)
-- Réservation 9 (Client 6 SEUL, Val Thorens)
(9, 32, '2024-04-01', '2024-04-03', 20.00), -- skis pour le début de la réservation (le 03 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(9, 41, '2024-04-04', '2024-04-05', 10.00), -- luge standard pour la fin de la réservation
-- Réservation 10 (Client 6 SEUL, Méribel)
(10, 47, '2026-04-15', '2026-04-18', 20.00), -- skis pour le début de la réservation (le 18 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(10, 52, '2026-04-19', '2026-04-20', 30.00), -- snowboard pour la fin de la réservation
-- Réservation 11 (Client 7 avec ACCOMPAGNATEUR, Les Arcs)
(11, 4, '2026-04-12', '2026-04-18', 25.00), -- skis pour le client 7
(11, 8, '2026-04-12', '2026-04-18', 32.00), -- snowboard pour l'accompagnateur de client 7 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 7)
-- Réservation 12 (Client 8 avec ACCOMPAGNATEUR, Méribel)
(12, 48, '2024-01-05', '2024-01-10', 25.00), -- skis pour le client 8
(12, 47, '2024-01-05', '2024-01-10', 20.00), -- skis pour l'accompagnateur de client 8 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 8)
-- Réservation 13 (Client 8 SEUL, Val Thorens)
(13, 34, '2025-01-20', '2025-01-23', 22.00), -- skis pour le début de la réservation (le 23 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(13, 42, '2025-01-24', '2025-01-25', 8.00), -- luge standard pour la fin de la réservation
-- Réservation 14 (Client 9 SEUL, Les Arcs)
(14, 5, '2024-02-01', '2024-02-03', 28.00), -- skis pour le début de la réservation (le 03 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(14, 9, '2024-02-04', '2024-02-07', 22.00), -- snowboard pour la fin de la réservation
-- Réservation 16 (Client 10 avec ACCOMPAGNATEUR, Méribel)
(16, 49, '2026-04-20', '2026-04-25', 30.00), -- skis pour le client 10
(16, 53, '2026-04-20', '2026-04-25', 32.00), -- snowboard pour l'accompagnateur de client 16 (car on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 16)
-- Réservation 17 (Client 11 avec ACCOMPAGNATEUR, Les Arcs)
(17, 3, '2024-04-10', '2024-04-14', 25.00), -- skis pour le client 11 pour le début de la réservation (le 14 est inclus : on retourne le matériel en fin de journée et on le récupère le matin)
(17, 1, '2024-04-10', '2024-04-14', 18.00), -- skis pour l'accompagnateur de client 11 (de même, le 14 est inclus + on part du principe qu'on a 1 reservation pour 2 personnes. elle est au nom de Client 11)
(17, 14, '2024-04-14', '2024-04-15', 10.00), -- luge standard pour client 11 pour la fin de la réservation
(17, 11, '2024-04-14', '2024-04-15', 10.00); -- luge enfant pour l'accompagnateur de client 11


INSERT INTO inscription_cours (id_reservation, id_cours, nb_participants, statut_inscription) VALUES
-- Réservation 1 (Client 1 SEUL prend un cours)
(1, 1, 1, 'Confirmé'),
-- Réservation 2 (Client 1 AVEC ACCOMPAGNATEUR prend un cours pour 2)
(2, 8, 2, 'Confirmé'),
-- Réservation 3 (Client 2 AVEC ACCOMPAGNATEUR prend un cours pour 2)
(3, 15, 2, 'Confirmé'),
-- Réservation 6 (Client 4 SEUL prend un cours)
(6, 22, 1, 'Confirmé'),
-- Réservation 8 (Client 5 AVEC ACCOMPAGNATEUR prend un cours pour son enfant)
(8, 6, 1, 'Confirmé'), 
-- Réservation 11 (Client 7 AVEC ACCOMPAGNATEUR prend un cours pour 2)
(11, 3, 2, 'Confirmé'), 
-- Réservation 12 (Client 8 AVEC ACCOMPAGNATEUR prend un cours pour 2)
(12, 22, 2, 'Confirmé'), -- Initiation ski débutant
-- Réservation 16 (Client 10 AVEC ACCOMPAGNATEUR prend un cours pour 2)
(16, 24, 2, 'Confirmé'), 
-- Réservation 17 (Client 11 AVEC ACCOMPAGNATEUR prend un cours pour son enfant)
(17, 6, 1, 'Confirmé'); 


INSERT INTO souscription_service (id_reservation, id_service, date_souscription, montant) VALUES
-- Réservation 1 (Client 1 souscrit à l'assurance neige)
(1, 1, '2024-01-10', 110.00),
-- Réservation 2 (Client 1 souscrit aux 2 services)
(2, 1, '2026-04-10', 110.00), -- assurance neige
(2, 2, '2026-04-10', 50.00), -- assistance piste
-- Réservation 3 (Client 2 souscrit à l'assurance neige)
(3, 1, '2024-02-05', 110.00),
-- Réservation 8 (Client 5 souscrit à l'assistance piste)
(8, 2, '2024-02-15', 50.00),
-- Réservation 11 (Client 7 souscrit aux 2 services)
(11, 1, '2026-04-12', 110.00), -- assurance neige
(11, 2, '2026-04-12', 50.00), -- assistance piste
-- Réservation 12 (Client 8 souscrit à l'assurance neige)
(12, 1, '2024-01-05', 110.00),
-- Réservation 17 (Client 11 souscrit aux 2 services)
(17, 1, '2024-04-10', 110.00), -- assurance neige
(17, 2, '2024-04-10', 50.00); -- assistance piste

