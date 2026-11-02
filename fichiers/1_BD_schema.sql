DROP DATABASE IF EXISTS snowpeak;
CREATE DATABASE IF NOT EXISTS snowpeak CHARACTER SET 'utf8mb4' COLLATE utf8mb4_unicode_ci;
USE snowpeak;

CREATE TABLE IF NOT EXISTS station (
id_station int AUTO_INCREMENT,
nom_station varchar(100) NOT NULL,
lieu varchar(150) NOT NULL,
CONSTRAINT pk_station PRIMARY KEY (id_station)
);

CREATE TABLE IF NOT EXISTS employe (
id_employe int AUTO_INCREMENT,
nom_employe varchar(32) NOT NULL,
prenom_employe varchar(32) NOT NULL,
role_employe ENUM('Moniteur', 'Technicien', 'Administratif') NOT NULL,
email_employe varchar(50) NOT NULL,
telephone_employe varchar(20) NOT NULL,
id_station INT NOT NULL,
CONSTRAINT pk_employe PRIMARY KEY (id_employe),
CONSTRAINT fk_employe_station FOREIGN KEY (id_station) REFERENCES station(id_station) -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'une station si elle a encore des employés
);

CREATE TABLE IF NOT EXISTS horaire (
    id_horaire INT AUTO_INCREMENT,
    jour ENUM('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche') NOT NULL,
    heure_debut TIME NOT NULL,
    heure_fin TIME NOT NULL,
    id_employe INT NOT NULL,
    CONSTRAINT pk_horaire PRIMARY KEY (id_horaire),
    CONSTRAINT fk_horaire_employe FOREIGN KEY (id_employe) REFERENCES employe(id_employe) ON DELETE CASCADE ON UPDATE CASCADE -- on met le mode de gestion sur CASCADE pour supprimer les horaires associés à une employé supprimée
);

CREATE TABLE IF NOT EXISTS client (
id_client int AUTO_INCREMENT,
nom_client varchar(32) NOT NULL,
prenom_client varchar(32) NOT NULL,
date_naissance_client date NOT NULL,
telephone_client varchar(20) NOT NULL,
email_client varchar(50) NOT NULL,
CONSTRAINT pk_client PRIMARY KEY (id_client),
CONSTRAINT uc_email_client UNIQUE (email_client)
);

CREATE TABLE IF NOT EXISTS service (
id_service int AUTO_INCREMENT,
type_service ENUM('Assurance Neige', 'Assistance Piste') NOT NULL,
prix_service decimal (10,2) NOT NULL,
CONSTRAINT pk_service PRIMARY KEY (id_service),
CONSTRAINT ck_prix_service CHECK (prix_service > 0)
);

CREATE TABLE IF NOT EXISTS equipement (
id_equipement int AUTO_INCREMENT,
type_equipement varchar(50) NOT NULL,
taille varchar(20) NOT NULL,
etat ENUM('Neuf', 'Bon état', 'Usagé', 'En réparation') NOT NULL DEFAULT 'Neuf',
niveau_requis ENUM('Débutant', 'Intermédiaire', 'Expert') NOT NULL,
disponibilite BOOLEAN NOT NULL,
prix_jour_base decimal(10,2) NOT NULL,
id_station INT NOT NULL,
CONSTRAINT pk_equipement PRIMARY KEY (id_equipement),
CONSTRAINT fk_equipement_station FOREIGN KEY (id_station) REFERENCES station(id_station) -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'une station si elle a encore des équipements
);

CREATE TABLE IF NOT EXISTS fournisseur (
id_fournisseur int AUTO_INCREMENT,
nom_fournisseur varchar(32) NOT NULL,
type_service ENUM('Maintenance équipements', 'Assurance/Assistance') NOT NULL,
email_fournisseur varchar(50) NOT NULL,
telephone_fournisseur varchar(20) NOT NULL,
CONSTRAINT pk_fournisseur PRIMARY KEY (id_fournisseur)
);

CREATE TABLE IF NOT EXISTS cours (
id_cours int AUTO_INCREMENT,
libelle varchar(150) NOT NULL,
niveau_cours ENUM('Débutant', 'Intermédiaire', 'Expert') NOT NULL,
tarif_cours decimal(10,2) NOT NULL,
duree int NOT NULL,
capacite_max INT NOT NULL,
id_employe INT NOT NULL,
id_station INT NOT NULL,
CONSTRAINT pk_cours PRIMARY KEY (id_cours),
CONSTRAINT fk_cours_employe FOREIGN KEY (id_employe) REFERENCES employe (id_employe), -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'un employé s'il encadre encore des cours
CONSTRAINT fk_cours_station FOREIGN KEY (id_station) REFERENCES station (id_station), -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'une station si elle propose encore des cours
CONSTRAINT ck_tarif_cours CHECK (tarif_cours > 0)
);

CREATE TABLE IF NOT EXISTS reservation (
id_reservation INT AUTO_INCREMENT,
date_debut date NOT NULL,
date_fin date NOT NULL,
statut ENUM('En cours', 'Terminée', 'Annulée') NOT NULL DEFAULT 'En cours',
id_client INT NOT NULL,
id_station INT NOT NULL,
CONSTRAINT pk_reservation PRIMARY KEY (id_reservation),
CONSTRAINT fk_reservation_client FOREIGN KEY (id_client) REFERENCES client (id_client), -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'un client s'il a encore des réservations
CONSTRAINT fk_reservation_station FOREIGN KEY (id_station) REFERENCES station (id_station), -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'une station si elle a encore des réservations
CONSTRAINT ck_date_fin CHECK (date_fin > date_debut)
);

CREATE TABLE IF NOT EXISTS facture_client (
id_facture_client INT AUTO_INCREMENT,
montant_total decimal(10,2) NOT NULL,
date_emission datetime NOT NULL,
statut BOOLEAN NOT NULL DEFAULT 0,
mode_paiement ENUM('Carte bancaire', 'Espèces', 'Virement', 'Chèque') NOT NULL,
id_reservation INT,
CONSTRAINT pk_facture_client PRIMARY KEY (id_facture_client),
CONSTRAINT fk_facture_client_reservation FOREIGN KEY (id_reservation) REFERENCES reservation (id_reservation) ON DELETE SET NULL ON UPDATE SET NULL, -- on met le mode de gestion sur SET NULL pour conserver la facture même si la réservation est supprimée afin de garder l'historique comptable
CONSTRAINT ck_montant_facture_client CHECK (montant_total > 0)
);

CREATE TABLE IF NOT EXISTS facture_fournisseur (
id_facture_fournisseur INT AUTO_INCREMENT,
montant_total decimal(10,2) NOT NULL,
date_emission datetime NOT NULL,
statut BOOLEAN NOT NULL DEFAULT 0,
mode_paiement ENUM('Virement', 'Chèque') NOT NULL,
id_station INT,
id_fournisseur INT,
CONSTRAINT pk_facture_fournisseur PRIMARY KEY (id_facture_fournisseur),
CONSTRAINT fk_facture_fournisseur_station FOREIGN KEY (id_station) REFERENCES station (id_station) ON DELETE SET NULL ON UPDATE SET NULL, -- on met le mode de gestion sur SET NULL pour conserver la facture même si la station est supprimée afin de garder l'historique comptable
CONSTRAINT fk_facture_fournisseur_fournisseur FOREIGN KEY (id_fournisseur) REFERENCES fournisseur (id_fournisseur) ON DELETE SET NULL ON UPDATE SET NULL, -- on met le mode de gestion sur SET NULL pour conserver la facture même si le fournisseur est supprimé afin de garder l'historique comptable
CONSTRAINT ck_montant_facture_fournisseur CHECK (montant_total > 0)
);

CREATE TABLE IF NOT EXISTS inscription_cours (
id_reservation INT NOT NULL,
id_cours INT NOT NULL,
nb_participants INT NOT NULL,
statut_inscription ENUM('Confirmé', 'En attente', 'Annulé') NOT NULL,
CONSTRAINT pk_inscription_cours PRIMARY KEY (id_reservation, id_cours),
CONSTRAINT fk_inscription_reservation FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation) ON DELETE CASCADE ON UPDATE CASCADE, -- on met le mode de gestion sur CASCADE pour supprimer les inscriptions à un cours associées à une réservation supprimée
CONSTRAINT fk_inscription_cours FOREIGN KEY (id_cours) REFERENCES cours (id_cours) -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'un cours s'il a encore des inscriptions
);

CREATE TABLE IF NOT EXISTS souscription_service (
id_reservation INT NOT NULL,
id_service INT NOT NULL,
date_souscription DATE NOT NULL,
montant DECIMAL(10,2) NOT NULL,
CONSTRAINT pk_souscription_service PRIMARY KEY (id_reservation, id_service),
CONSTRAINT fk_souscription_reservation FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation) ON DELETE CASCADE ON UPDATE CASCADE, -- on met le mode de gestion sur CASCADE pour supprimer les souscriptions associées à une réservation supprimée
CONSTRAINT fk_souscription_service FOREIGN KEY (id_service) REFERENCES service(id_service) -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'un service s'il a encore des souscriptions
);

CREATE TABLE IF NOT EXISTS location_equipement (
id_reservation INT NOT NULL,
id_equipement INT NOT NULL,
date_debut_location date NOT NULL,
date_fin_location date NOT NULL,
prix_applique decimal (10,2) NOT NULL,
CONSTRAINT pk_location_equipement PRIMARY KEY (id_reservation, id_equipement),
CONSTRAINT fk_location_reservation FOREIGN KEY (id_reservation) REFERENCES reservation (id_reservation) ON DELETE CASCADE ON UPDATE CASCADE, -- on met le mode de gestion sur CASCADE pour supprimer les locations associées à une réservation supprimée
CONSTRAINT fk_location_equipement FOREIGN KEY (id_equipement) REFERENCES equipement (id_equipement) -- on laisse le mode de gestion par défaut (RESTRICT) pour empecher la suppression d'un équipement s'il est encore présetn dans des locations
);
