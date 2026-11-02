USE snowpeak;

-- SELECT --
-- VOIR LES NOMS DE TOUTES LES STATIONS
SELECT nom_station FROM station ;

-- VOIR LE NOMBRE DE VALEURS DISTINCTES DE PARTICIPANTS DANS LES INSCRIPTIONS
SELECT COUNT(DISTINCT nb_participants) 
FROM inscription_cours;

-- VOIR LE NOMBRE DE RÉSERVATIONS PAR CLIENT PAR ORDRE DÉCROISSANT
SELECT cl.nom_client, cl.prenom_client, COUNT(r.id_reservation) AS nb_reservations
FROM client cl
LEFT JOIN reservation r ON cl.id_client = r.id_client
GROUP BY cl.id_client
ORDER BY nb_reservations DESC;

-- VOIR LE DÉTAIL DES LOCATIONS D'ÉQUIPEMENTS PAR CLIENT
SELECT eq.type_equipement, eq.taille, cl.nom_client, 
       le.date_debut_location, le.date_fin_location, le.prix_applique
FROM location_equipement le
JOIN equipement eq ON le.id_equipement = eq.id_equipement
JOIN reservation r ON le.id_reservation = r.id_reservation
JOIN client cl ON r.id_client = cl.id_client;

-- VOIR LA LISTE DES COURS AVEC LE MONITEUR ET LA STATION ASSOCIÉ
SELECT c.libelle, c.niveau_cours, c.tarif_cours, c.duree, c.capacite_max,
       CONCAT(e.prenom_employe, ' ' ,e.nom_employe) AS moniteur,
       s.nom_station
FROM cours c
JOIN employe e ON c.id_employe = e.id_employe
JOIN station s ON c.id_station = s.id_station;

-- VOIR LE NOMBRE TOTAL DE PARTICIPANTS INCRITS AUX COURS
SELECT SUM(nb_participants) AS total_participants
FROM inscription_cours;

-- VOIR LE NOMBRE DE PARTICIPANTS INSCRITS PAR COURS ET PAR STATION
SELECT s.nom_station, c.libelle, c.niveau_cours, COALESCE(SUM(ic.nb_participants), 0) AS total_participants
FROM cours c
LEFT JOIN inscription_cours ic ON c.id_cours = ic.id_cours
JOIN station s ON c.id_station = s.id_station
GROUP BY c.id_cours, c.libelle, c.niveau_cours, s.nom_station
ORDER BY total_participants DESC;

-- VOIR LES STATIONS AVEC PLUS DE 3 RÉSERVATIONS
SELECT s.nom_station, COUNT(r.id_reservation) AS nb_reservations
FROM station s
JOIN reservation r ON s.id_station = r.id_station
GROUP BY s.id_station
HAVING COUNT(r.id_reservation) > 3;

-- AFFICHER "BIENVENUE" SUIVI DU PRÉNOM ET DU NOM DE CHAQUE CLIENT
SELECT CONCAT('Bienvenue ', prenom_client, ' ', nom_client, ' ! ') AS message
FROM client;

-- VOIR LA DUREE MOYENNE DES RESERVATIONS EN JOURS 
SELECT AVG(DATEDIFF(date_fin, date_debut)) AS duree_moyenne_jours
FROM reservation;

-- VOIR LE NOMBRE DE RESERVATIONS PAR MOIS ET ANNEE
SELECT YEAR(date_debut) AS annee, MONTH(date_debut) AS mois, COUNT(*) AS nb_reservations
FROM reservation
GROUP BY YEAR(date_debut), MONTH(date_debut)
ORDER BY annee, mois;

-- CREATION D'UN STATUT POUR CHAQUE CLIENT SELON SON NOMBRE DE RESERVATIONS
SELECT CONCAT(prenom_client, ' ', nom_client) AS client, COUNT(r.id_reservation) AS nb_reservations,
CASE
	WHEN COUNT(r.id_reservation) = 0 THEN 'Aucune réservation'
	WHEN COUNT(r.id_reservation) = 1 THEN 'Client occasionnel'
	ELSE 'Client fidèle'
END AS statut
FROM client cl
LEFT JOIN reservation r ON cl.id_client = r.id_client
GROUP BY cl.id_client;

-- VOIR LE NOMBRE TOTAL D'HEURES TRAVAILLÉES POUR CHAQUE EMPLOYÉ PAR ORDRE DÉCROISSANT
SELECT e.nom_employe, e.prenom_employe, e.role_employe, s.nom_station, SUM(TIMESTAMPDIFF(HOUR, h.heure_debut, h.heure_fin)) AS total_heures
FROM employe e
JOIN horaire h ON e.id_employe = h.id_employe
JOIN station s ON e.id_station = s.id_station
GROUP BY e.id_employe, e.role_employe, s.nom_station
ORDER BY total_heures DESC;

-- CLIENTS QUI ONT LOUÉ DU MATÉRIEL MAIS QUI N'ONT JAMAIS PRIS DE COURS
-- Utilité de ciblage des prospects futurs
SELECT DISTINCT cl.nom_client, cl.prenom_client, cl.email_client
FROM client cl
JOIN reservation r ON cl.id_client = r.id_client
JOIN location_equipement le ON r.id_reservation = le.id_reservation
LEFT JOIN inscription_cours ic ON r.id_reservation = ic.id_reservation
WHERE ic.id_reservation IS NULL;

-- NOMBRE DE RÉSERVATIONS ET MONTANT MOYEN DES FACTURES PAR STATION
-- Compare les stations entre elles
SELECT s.nom_station, COUNT(DISTINCT r.id_reservation) AS nb_reservations, ROUND(AVG(fc.montant_total), 2) AS montant_moyen_facture
FROM station s
JOIN reservation r ON s.id_station = r.id_station
JOIN facture_client fc ON r.id_reservation = fc.id_reservation
GROUP BY s.id_station, s.nom_station
ORDER BY montant_moyen_facture DESC;

-- VOIR LES ÉQUIPEMENTS ACTUELLEMENT DISPONIBLES
SELECT e.type_equipement, e.taille, e.etat, s.nom_station
FROM equipement e
JOIN station s ON e.id_station = s.id_station
WHERE e.disponibilite = 1
ORDER BY s.nom_station;

-- VOIR LES FACTURES CLIENTS NON PAYÉES
SELECT fc.id_facture_client, cl.nom_client, cl.prenom_client, fc.montant_total, fc.date_emission, fc.mode_paiement
FROM facture_client fc
JOIN reservation r ON fc.id_reservation = r.id_reservation
JOIN client cl ON r.id_client = cl.id_client
WHERE fc.statut = 0
ORDER BY fc.date_emission;

-- VOIR LE CHIFFRE D'AFFAIRES TOTAL PAR STATION
SELECT s.nom_station, SUM(fc.montant_total) AS chiffre_affaires_total, COUNT(fc.id_facture_client) AS nb_factures
FROM station s
JOIN reservation r ON s.id_station = r.id_station
JOIN facture_client fc ON r.id_reservation = fc.id_reservation
GROUP BY s.id_station, s.nom_station
ORDER BY chiffre_affaires_total DESC;


-- VIEW -- 
USE snowpeak;

-- [vue_inscriptions_moniteur] --

DROP VIEW IF EXISTS vue_inscriptions_moniteur;
CREATE VIEW vue_inscriptions_moniteur AS
SELECT e.id_employe, CONCAT(e.prenom_employe, ' ', e.nom_employe) AS nom_moniteur,
e.id_station, s.nom_station, c.id_cours, c.libelle AS cours, c.niveau_cours, r.date_debut, r.date_fin,
CONCAT(cl.prenom_client, ' ', cl.nom_client) AS nom_client,
cl.email_client, ic.nb_participants, ic.statut_inscription
FROM employe e
JOIN station s ON e.id_station = s.id_station
JOIN cours c ON e.id_employe = c.id_employe
JOIN inscription_cours ic ON c.id_cours = ic.id_cours
JOIN reservation r ON ic.id_reservation = r.id_reservation
JOIN client cl ON r.id_client = cl.id_client
WHERE e.role_employe = 'Moniteur';

-- [Appel de vue] --

-- Vue globale 
SELECT * FROM vue_inscriptions_moniteur;

-- Tous les inscrits de la station n°2
SELECT * FROM vue_inscriptions_moniteur
WHERE id_station = 2;

-- Les inscrits d'un moniteur précis dans sa station
SELECT * FROM vue_inscriptions_moniteur
WHERE id_employe = 7;

-- [vue_locations_equipements] -- 

CREATE OR REPLACE VIEW vue_location_equipement AS
SELECT s.id_station, s.nom_station, r.id_reservation, r.date_debut AS debut_sejour,
r.date_fin AS fin_sejour,
CONCAT(cl.prenom_client, ' ', cl.nom_client) AS nom_client, eq.id_equipement, eq.type_equipement, eq.taille,
eq.niveau_requis, le.date_debut_location, le.date_fin_location, le.prix_applique
FROM station s
JOIN reservation r ON s.id_station = r.id_station
JOIN client cl ON r.id_client = cl.id_client
JOIN location_equipement le ON r.id_reservation = le.id_reservation
JOIN equipement eq ON le.id_equipement = eq.id_equipement;

-- [Appel de vue] -- 

-- Toutes les locations en cours
SELECT * FROM vue_location_equipement;

-- Le chiffre d'affaires des locations par station
SELECT nom_station, SUM(prix_applique) AS chiffre_affaires
FROM vue_location_equipement
GROUP BY nom_station;

-- Les équipements les plus loués
SELECT type_equipement, COUNT(*) AS nb_locations
FROM vue_location_equipement
GROUP BY type_equipement
ORDER BY nb_locations DESC;

-- [ Triggers ] --

-- Triggers de création d'un cours apres l'insertion d'un nouveau moniteur
DELIMITER //
CREATE TRIGGER after_moniteur_insert
AFTER INSERT ON employe
FOR EACH ROW
BEGIN
	IF NEW.role_employe = 'Moniteur' THEN
INSERT INTO cours (libelle,niveau_cours,tarif_cours,duree,capacite_max,id_employe,id_station)
VALUES
("Pingouin sur la piste", 'Débutant', 30.00, 60,5,NEW.id_employe,NEW.id_station);
    END IF;
END //
DELIMITER ;

-- [Verification du triggers after_moniteur_insert] --
-- Insertion du nouveau moniteur
INSERT INTO employe (nom_employe,prenom_employe,role_employe,email_employe,telephone_employe,id_station)
VALUES 
('DesBanquises','Pingouin','Moniteur','pingouin.desbanquises@snowpeak.com','0612345678',1);

-- Vérification que le cours a bien été créé automatiquement
SELECT * FROM cours WHERE id_employe = (SELECT id_employe FROM employe WHERE prenom_employe = 'Pingouin');

-- Triggers création d'une facture lors de l'insertion d'une réservation 
SELECT * FROM facture_client; 
DELIMITER //
CREATE TRIGGER after_reservation_insert
AFTER INSERT ON reservation
FOR EACH ROW
BEGIN
    INSERT INTO facture_client (montant_total,date_emission,statut,mode_paiement,id_reservation)
    VALUES (30,NOW(),1,'Carte bancaire', NEW.id_reservation);
END //
DELIMITER ;

-- [Verification du triggers after_reservation_insert ] --

-- Insertion d'un nouveau client 
INSERT INTO client (nom_client,prenom_client,date_naissance_client,telephone_client,email_client)
VALUES ('Gollum','Smeagol','1434-05-01','0000000000','smeagol.gollum@gmail.com');

-- Insertion de la réservation pour Gollum Smeagol
INSERT INTO reservation (date_debut,date_fin,statut,id_client,id_station)
VALUES ('2025-02-01','2025-02-07','En cours',(SELECT id_client FROM client WHERE nom_client = "Gollum"),1);

-- Vérification que la facture a bien été créée automatiquement
SELECT * FROM facture_client WHERE id_reservation = LAST_INSERT_ID();



-- procedure stockees -- 

-- 1. sp_inscrire_cours
--    Inscrit des participants d'une réservation à un cours.
--    - Vérifie que le cours appartient bien à la même station
--      que la réservation
--    - Vérifie qu'il reste assez de places (hors inscriptions annulées)
--    - Crée l'inscription avec le statut 'Confirmé'

DROP PROCEDURE IF EXISTS sp_inscrire_cours;
DELIMITER //
CREATE PROCEDURE sp_inscrire_cours(
    IN p_id_reservation   INT,
    IN p_id_cours         INT,
    IN p_nb_participants  INT
)
BEGIN proc: BEGIN

    DECLARE v_capacite_max   INT;
    DECLARE v_places_prises  INT;
    DECLARE v_places_libres  INT;
    DECLARE v_station_cours  INT;
    DECLARE v_station_resa   INT;
    DECLARE v_libelle        VARCHAR(150);

    -- Récupérer infos du cours
    SELECT capacite_max, id_station, libelle
    INTO   v_capacite_max, v_station_cours, v_libelle
    FROM   cours
    WHERE  id_cours = p_id_cours;

    -- Récupérer la station de la réservation
    SELECT id_station INTO v_station_resa
    FROM   reservation
    WHERE  id_reservation = p_id_reservation;

    IF v_capacite_max IS NULL THEN
        SELECT 'Erreur : cours introuvable.' AS message;
        LEAVE proc;
    END IF;

    IF v_station_cours != v_station_resa THEN
        SELECT 'Erreur : ce cours n appartient pas à la station de la réservation.' AS message;
        LEAVE proc;
    END IF;

    -- Places déjà occupées (inscriptions non annulées)
    SELECT IFNULL(SUM(nb_participants), 0)
    INTO   v_places_prises
    FROM   inscription_cours
    WHERE  id_cours = p_id_cours
      AND  statut_inscription != 'Annulé';

    SET v_places_libres = v_capacite_max - v_places_prises;

    IF p_nb_participants > v_places_libres THEN
        SELECT CONCAT('Erreur : seulement ', v_places_libres, ' place(s) disponible(s) dans ce cours.') AS message;
        LEAVE proc;
    END IF;

    INSERT INTO inscription_cours
        (id_reservation, id_cours, nb_participants, statut_inscription)
    VALUES
        (p_id_reservation, p_id_cours, p_nb_participants, 'Confirmé');

    SELECT CONCAT('✓ Inscription confirmée au cours « ', v_libelle, ' » — ',
                  p_nb_participants, ' participant(s). Places restantes : ',
                  v_places_libres - p_nb_participants) AS message;

END proc;
END //
DELIMITER ;


-- EXEMPLES D'UTILISATION — sp_inscrire_cours


-- EXEMPLE 1 — CAS SIMPLE
-- Client 7 (Hugues Restif) est en séjour aux Arcs (réservation 11, station 1).
-- Il veut s'inscrire au cours "Initiation snowboard" (cours 4, station 1)
-- pour 1 participant. Le cours a 8 places, aucune prise → succès attendu.

-- Vérification avant : places disponibles pour le cours 4
SELECT c.id_cours, c.libelle, c.capacite_max,
       IFNULL(SUM(ic.nb_participants), 0) AS places_prises,
       capacite_max - IFNULL(SUM(ic.nb_participants), 0) AS places_restantes
FROM cours c
LEFT JOIN inscription_cours ic ON c.id_cours = ic.id_cours
    AND ic.statut_inscription != 'Annulé'
WHERE c.id_cours = 4
GROUP BY c.id_cours;

-- Appel de la procédure
CALL sp_inscrire_cours(11, 4, 1);

-- Vérification après
SELECT * FROM inscription_cours WHERE id_reservation = 11;



-- EXEMPLE 2 
-- Le cours 22 ("Initiation ski débutant" à Méribel, station 4) a une
-- capacité de 10 places.
-- État actuel : réservation 6 (1 participant) + réservation 12 (2 participants) = 3 places prises, 7 restantes.
-- Étape A : réservation 10 (Client 6, station 4) inscrit 7 participants
--           → remplit exactement le cours, succès attendu.
-- Étape B : réservation 16 (Client 10, station 4) tente d'inscrire 1 participant
--           → cours complet, erreur attendue.


-- Vérification avant : état du cours 22
SELECT c.id_cours, c.libelle, c.capacite_max,
       IFNULL(SUM(ic.nb_participants), 0) AS places_prises,
       capacite_max - IFNULL(SUM(ic.nb_participants), 0) AS places_restantes
FROM cours c
LEFT JOIN inscription_cours ic ON c.id_cours = ic.id_cours
    AND ic.statut_inscription != 'Annulé'
WHERE c.id_cours = 22
GROUP BY c.id_cours;

-- Étape A : inscription de 7 participants → doit réussir (7 places restantes)
CALL sp_inscrire_cours(10, 22, 7);

-- Étape B : tentative d'inscription d'1 participant → doit échouer (cours plein)
CALL sp_inscrire_cours(16, 22, 1);

-- Vérification finale : toutes les inscriptions au cours 22
SELECT * FROM inscription_cours WHERE id_cours = 22;


-- EXEMPLE 3 — UTILISATION DE LA VUE vue_inscriptions_moniteur
-- On utilise la vue existante pour identifier un moniteur précis, voir ses cours et les inscrits,
-- puis inscrire un nouveau client sur un cours qui a encore de la place.
-- Contexte : le moniteur Laura Daguet (id_employe 8, station 2 Chamrousse)
-- encadre plusieurs cours. On consulte la vue pour voir la situation,
-- puis on inscrit le client 1 (réservation 2, station 2) au cours
-- "Ski expert" de Chamrousse (cours 10, capacité 6, aucun inscrit).
-- ============================================================

-- Étape 1 : consulter la vue pour voir les cours du moniteur à Chamrousse
SELECT id_cours, cours, niveau_cours, nb_participants, statut_inscription
FROM vue_inscriptions_moniteur
WHERE id_employe = 8;

-- Étape 2 : vérifier les places restantes sur le cours 10 (Ski expert, station 2)
SELECT c.id_cours, c.libelle, c.capacite_max,
       IFNULL(SUM(ic.nb_participants), 0) AS places_prises,
       capacite_max - IFNULL(SUM(ic.nb_participants), 0) AS places_restantes
FROM cours c
LEFT JOIN inscription_cours ic ON c.id_cours = ic.id_cours
    AND ic.statut_inscription != 'Annulé'
WHERE c.id_cours = 10
GROUP BY c.id_cours;

-- Étape 3 : inscrire le client 1 (réservation 2, station 2) pour 2 participants
CALL sp_inscrire_cours(2, 10, 2);

-- Étape 4 : vérifier dans la vue que l'inscription apparaît bien
SELECT * FROM vue_inscriptions_moniteur
WHERE id_employe = 8 AND id_cours = 10;



-- 2. sp_reserver_equipement
--    Réserve un équipement pour une réservation existante.
--    - Vérifie que l'équipement est disponible
--    - Calcule le prix total selon le nombre de jours
--    - Crée l'entrée dans location_equipement
--    - Marque l'équipement comme indisponible

DROP PROCEDURE IF EXISTS sp_reserver_equipement;
DELIMITER //
CREATE PROCEDURE sp_reserver_equipement(
    IN p_id_reservation  INT,
    IN p_id_equipement   INT,
    IN p_date_debut      DATE,
    IN p_date_fin        DATE
)
BEGIN
    DECLARE v_disponible   BOOLEAN;
    DECLARE v_prix_jour    DECIMAL(10,2);
    DECLARE v_nb_jours     INT;
    DECLARE v_prix_total   DECIMAL(10,2);
    DECLARE v_type         VARCHAR(50);

    -- Récupérer disponibilité et prix de l'équipement
    SELECT disponibilite, prix_jour_base, type_equipement
    INTO   v_disponible, v_prix_jour, v_type
    FROM   equipement
    WHERE  id_equipement = p_id_equipement;

    IF v_disponible IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Équipement introuvable.';
    ELSEIF v_disponible = FALSE THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Équipement non disponible à la location.';
    ELSEIF p_date_fin <= p_date_debut THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La date de fin doit être postérieure à la date de début.';
    ELSE
        SET v_nb_jours   = DATEDIFF(p_date_fin, p_date_debut);
        SET v_prix_total = v_prix_jour * v_nb_jours;

        -- Créer la ligne de location
        INSERT INTO location_equipement
            (id_reservation, id_equipement, date_debut_location, date_fin_location, prix_applique)
        VALUES
            (p_id_reservation, p_id_equipement, p_date_debut, p_date_fin, v_prix_total);

        -- Marquer l'équipement comme indisponible
        UPDATE equipement
        SET    disponibilite = FALSE
        WHERE  id_equipement = p_id_equipement;

        SELECT CONCAT('✓ ', v_type, ' réservé du ', p_date_debut, ' au ', p_date_fin,
                      ' — ', v_nb_jours, ' jour(s) × ', v_prix_jour, '€ = ', v_prix_total, '€') AS message;
    END IF;
END //
DELIMITER ;


-- EXEMPLES D'UTILISATION — sp_reserver_equipement

-- EXEMPLE 1 
-- Client 7 (Hugues Restif) est en séjour aux Arcs (réservation 11,
-- station 1, du 12 au 18 avril 2026). Il a déjà des skis et un snowboard,
-- mais il veut aussi louer une luge pour toute la durée du séjour.
-- On cherche d'abord une luge disponible à la station, puis on réserve.

-- Vérification avant : luges disponibles à la station 1
SELECT id_equipement, type_equipement, taille, etat, niveau_requis, prix_jour_base
FROM equipement
WHERE id_station = 1
  AND type_equipement = 'Luge'
  AND disponibilite = TRUE;

-- Appel : on réserve la luge (équipement 11) pour toute la durée du séjour : 6 jours × 10€ = 60€ attendus
CALL sp_reserver_equipement(11, 11, '2026-04-12', '2026-04-18');

-- Vérification après
SELECT * FROM location_equipement WHERE id_reservation = 11;
SELECT id_equipement, type_equipement, disponibilite FROM equipement WHERE id_equipement = 11;


-- EXEMPLE 2 
-- Client 10 (Paul Taverdet) est à Méribel (réservation 16, station 4, du 20 au 25 avril 2026). 
-- Il veut louer le ski le moins cher disponible à sa station, adapté à son niveau débutant.
-- On utilise une variable @id_equip pour capturer dynamiquement
-- l'équipement trouvé et le passer directement à la procédure.

-- Vérification avant : état des skis débutant disponibles à Méribel
SELECT id_equipement, type_equipement, taille, etat, prix_jour_base
FROM equipement
WHERE id_station = 4
  AND type_equipement = 'Ski'
  AND niveau_requis = 'Débutant'
  AND disponibilite = TRUE
ORDER BY prix_jour_base ASC;

-- Capture du ski le moins cher disponible dans une variable
SET @id_equip = (
    SELECT id_equipement
    FROM equipement
    WHERE id_station      = 4
      AND type_equipement = 'Ski'
      AND niveau_requis   = 'Débutant'
      AND disponibilite   = TRUE
    ORDER BY prix_jour_base ASC
    LIMIT 1
);

SELECT CONCAT('Équipement sélectionné automatiquement : id = ', @id_equip) AS info;

-- Appel avec la variable : pas besoin de connaître l'id à l'avance
CALL sp_reserver_equipement(16, @id_equip, '2026-04-20', '2026-04-25');

-- Vérification après
SELECT * FROM location_equipement WHERE id_reservation = 16;
