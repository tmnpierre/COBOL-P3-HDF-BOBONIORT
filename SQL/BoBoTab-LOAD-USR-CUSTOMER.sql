INSERT INTO INSURANCE VALUES ('BOBONIORT', '21, Rue de la victoire et de la santé','','79000','NIORT','FRANCE');
INSERT INTO USER_TAB (USER_IDENTIFICATION, USER_PASSWORD, USER_AUTHORIZATION) VALUES
('UtilLECT', 'Lecture01', 'L'),
('UtilMAJ', 'Majour01', '');

/* chargement du niveau le plus bas en premier et rattachement au niveau du dessus, */
/* dans le code_function_mother de l'enregistrement mère on met 2*/
/* après rattachement des autres libellés du bloc, la valeur passe à 1 pour l'enregistrement mère*/

/* gestion de l'historique des données*/
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '10' WHERE FUNCTION_ROOT = '0';

/* blocs de la gestion des adhérents */
INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Créer un adhérent','2'),
       ( 'Modifier/archiver l''adhérent',NULL),
       ( 'Affecter de(s) contrat(s)',NULL),
       ( 'Créer des contrats types',NULL),
       ( 'Modifier les contrats de l''adhérent',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Rechercher un adhérent','2'),
       ( 'Modifier/archiver l''adhérent',NULL),
       ( 'Affecter de(s) contrat(s)',NULL),
       ( 'Créer de contrats types',NULL),
       ( 'Modifier les contrats de l''adhérent',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;  
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Gérer les adhérents','0')
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '0')
WHERE FUNCTION_ROOT = '1';
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '10' WHERE FUNCTION_ROOT = '0';

/* blocs de la gestion des cotisations */
INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Rechercher un adhérent','2'),
       ( 'Consulter les paiements',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Gérer les cotisations',0);
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '0')
WHERE FUNCTION_ROOT = '1';
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '10' WHERE FUNCTION_ROOT = '0';

/* blocs de la gestion des remboursements */
INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Rechercher un adhérent','2'),
       ( 'Suivre les remboursements',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Gérer les remboursements','0');
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '0')
WHERE FUNCTION_ROOT = '1';
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '10' WHERE FUNCTION_ROOT = '0';

/* blocs de la gestion de prestation */
INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Choisir une garantie','2'),
       ( 'Modifier la garantie',NULL),
       ( 'Créer de nouveaux montants possibles',NULL),
       ( 'Désactiver la garantie',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Créer une garantie','2'),
       ( 'Modifier la garantie',NULL),
       ( 'Créer de nouveaux montants possibles',NULL),
       ( 'Désactiver la garantie',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Choisir une prestation','2'),
       ( 'Modifier la prestation',NULL),
       ( 'Créer de nouveaux montants de prestation',NULL),       
       ( 'Désactiver la prestation',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Créer une prestation','2'),
       ( 'Modifier la prestation',NULL),
       ( 'Créer de nouveaux montants de prestation',NULL),
       ( 'Désactiver la prestation',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '2')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '1' WHERE FUNCTION_ROOT = '2';

INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Gérer les prestations et garanties','0');
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '0')
WHERE FUNCTION_ROOT = '1';
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '10' WHERE FUNCTION_ROOT = '0';

/* bloc de la visualisation des rapports */
INSERT INTO FUNCTION_TAB (FUNCTION_LARGELABEL, FUNCTION_ROOT)
VALUES ( 'Les rapports','0'),
       ( 'Rapport 1',NULL),
       ( 'Rapport 2',NULL),
       ( 'Rapport 3',NULL),
       ( 'Rapport 4',NULL)
       ;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = (SELECT UUID_FUNCTION FROM FUNCTION_TAB WHERE FUNCTION_ROOT = '0')
WHERE FUNCTION_ROOT IS NULL;
UPDATE FUNCTION_TAB SET FUNCTION_ROOT = '0' WHERE FUNCTION_ROOT = '10';


INSERT INTO CUSTOMER (CUSTOMER_GENDER, CUSTOMER_LASTNAME, CUSTOMER_FIRSTNAME, CUSTOMER_ADRESS1, CUSTOMER_ADRESS2, 
CUSTOMER_ZIPCODE, CUSTOMER_TOWN, CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOMER_MAIL, CUSTOMER_BIRTH_DATE, CUSTOMER_DOCTOR, 
CUSTOMER_CODE_SECU, CUSTOMER_CODE_IBAN,CUSTOMER_NBCHILDREN,CUSTOMER_COUPLE, CUSTOMER_CREATE_DATE, 
 CUSTOMER_UPDATE_DATE, CUSTOMER_CLOSE_DATE, CUSTOMER_ACTIVE) VALUES
('Homme', 'Dupont', 'Jean', '12 Rue des Lilas', 'Apt 45', '75015', 'Paris', 'France', '0612345678', 
'jean.dupont@email.fr', '1975-03-01', 'Dr. Moreau', 175039089400273, 'FR76 3000 6000 0112 3456 7890 189', 2, 
TRUE, '2020-01-01', '2020-01-02', NULL, '1'),
('Femme', 'Martin', 'Élise', '98 Avenue de la Republique', 'Batiment B', '69007', 'Lyon', 'France', '0623456789',
 'elise.martin@email.fr', '1982-07-16', 'Dr. Lefevre', 292073958501345, 'FR76 3001 4000 5678 9101 1234 568', 3,
  FALSE, '2020-02-01', NULL, NULL, '0'),
('Femme', 'Leroy', 'Marie', '25 Rue de la Liberté', 'App 101', '67000', 'Strasbourg', 'France', '0678901234',
 'marie.leroy@email.fr', '1989-11-11', 'Dr. Renault', 185074321900456, 'FR76 1009 3000 0001 2345 6789 001', 1,
 FALSE, '2021-05-20', '2021-05-21', NULL, '1'),
 ('Homme', 'Bernard', 'Jacques', '99 Avenue des Peupliers', '', '33000', 'Bordeaux', 'France', '0687654321', 
 'jacques.bernard@email.fr', '1970-02-15', 'Dr. Dupont', 274039087654321, 'FR76 2001 7000 0112 3456 7890 234', 3, 
 TRUE, '2021-06-01', NULL, NULL, '1'),
 ('Femme', 'Chevalier', 'Claire', '10 Rue du Port', 'Étage 3', '44000', 'Nantes', 'France', '0691234567', 
 'claire.chevalier@email.fr', '1990-05-25', 'Dr. Besson', 196085478312547, 'FR76 4004 1000 0101 2345 6789 345', 0, 
 TRUE, '2019-07-15', '2020-01-10', NULL, '0'),
('Homme', 'Petit', 'Émile', '77 Boulevard des Étoiles', '', '75017', 'Paris', 'France', '0609876543', 
'emile.petit@email.fr', '1985-08-19', 'Dr. Mercier', 204075839456789, 'FR76 3005 6001 2001 2345 6789 456', 2, 
FALSE, '2021-02-22', '2021-03-15', NULL, 'A'),
('Femme', 'Girard', 'Sophie', '32 Avenue des Champs', 'Bâtiment C', '06000', 'Nice', 'France', '0678654321',
 'sophie.girard@email.fr', '1980-12-01', 'Dr. Dupuis', 195063475290876, 'FR76 5002 7002 3301 2345 6789 567', 1, 
FALSE, '2018-11-05', '2019-05-07', NULL, '1'),
('Homme', 'Moreau', 'Louis', '5 Rue de la République', 'Appartement 202', '34000', 'Montpellier', 'France',
 '0612345678', 'louis.moreau@email.fr', '1995-02-15', 'Dr. Lemoine', 215079876543210, 'FR76 6003 8003 4401 2345 6789 678', 3, 
TRUE, '2017-06-30', '2018-07-15', NULL, '1'),
('Femme', 'Lefebvre', 'Anne', '21 Rue Victor Hugo', 'Maison', '59000', 'Lille', 'France', '0687654321',
 'anne.lefebvre@email.fr', '1978-07-30', 'Dr. Fontaine', 183072543210987, 'FR76 7004 9004 5501 2345 6789 789', 0,
 FALSE, '2022-05-01', NULL, NULL, '1'),
('Homme', 'Rousseau', 'David', '83 Rue des Jardins', 'Lotissement Les Fleurs', '13090', 'Aix-en-Provence', 'France',
 '0654321987', 'david.rousseau@email.fr', '1983-03-12', 'Dr. Blanc', 
 273049876512345, 'FR76 8005 0005 6601 2345 6789 890', 2,
 TRUE, '2020-10-25', '2021-02-11', NULL, 'A');
