       01  SCREEN-FRAME FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [RD] TITRE.                                                 *
      ******************************************************************
           05 FILLER PIC X(18) VALUE  "CREATION ADHERENT" LINE 6 COL 91 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [RD] CHAMPS DE SAISIS.                                      *
      ******************************************************************

      *    [RD] Champ de saisi pour le genre.     
           05 FILLER PIC X(05) VALUE 'Genre' LINE 11 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 11 COL 53.

           05 FILLER PIC X(10) TO CUD-GENDER LINE 11 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le nom.     
           05 FILLER PIC X(03) VALUE 'Nom' LINE 13 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 13 COL 53.

           05 FILLER PIC X(20) TO CUD-LASTNAME LINE 13 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le prenom.
           05 FILLER PIC X(06) VALUE 'Prenom' LINE 13 COL 111. 

           05 FILLER PIC X VALUE ':' LINE 13 COL 129.

           05 FILLER PIC X(20) TO CUD-FIRSTNAME LINE 13 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD] Champ de saisi pour la date de naissance.
           05 FILLER PIC X(31) VALUE 'Date de naissance (AAAA-MM-JJ)' 
           LINE 15 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 15 COL 53.

           05 FILLER PIC X(02) TO CUB-DAYS LINE 15 COL 63 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 15 COL 62 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) TO CUB-MONTH
           LINE 15 COL 60 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 15 COL 59 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(04) TO CUB-YEAR
           LINE 15 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour l'adresse 1.
           05 FILLER PIC X(09) VALUE 'Adresse 1' LINE 17 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 17 COL 53.

           05 FILLER PIC X(50) TO CUD-ADRESS1 LINE 17 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD] Champ de saisi pour l'adresse 2.
           05 FILLER PIC X(09) VALUE 'Adresse 2' LINE 17 COL 111. 

           05 FILLER PIC X VALUE ':' LINE 17 COL 129.

           05 FILLER PIC X(50) TO CUD-ADRESS2 LINE 17 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD] Champ de saisi pour le code postal.
           05 FILLER PIC X(11) VALUE 'Code postal' LINE 19 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 19 COL 53.

           05 FILLER PIC X(15) TO CUD-ZIPCODE LINE 19 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour la ville.
           05 FILLER PIC X(05) VALUE 'Ville' LINE 19 COL 111. 

           05 FILLER PIC X VALUE ':' LINE 19 COL 129.

           05 FILLER PIC X(50) TO CUD-TOWN LINE 19 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le pays.
           05 FILLER PIC X(04) VALUE 'Pays' LINE 21 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 21 COL 53.

           05 FILLER PIC X(20) TO CUD-COUNTRY LINE 21 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le telephone.
           05 FILLER PIC X(09) VALUE 'Telephone' LINE 23 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 23 COL 53.

           05 FILLER PIC X(10) TO CUD-ZIPCODE LINE 23 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le mail.
           05 FILLER PIC X(04) VALUE 'Mail' LINE 23 COL 111. 

           05 FILLER PIC X VALUE ':' LINE 23 COL 129.

           05 FILLER PIC X(50) TO CUD-MAIL LINE 23 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le couple.
           05 FILLER PIC X(19) VALUE 'En couple (Oui/Non)' 
           LINE 25 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 25 COL 53.

           05 FILLER PIC X(03) TO CUD-MAIL LINE 25 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le nombre d'enfants.
           05 FILLER PIC X(16) VALUE "Nombre d'enfants" 
           LINE 25 COL 111. 

           05 FILLER PIC X VALUE ':' LINE 25 COL 129.

           05 FILLER PIC X(03) TO CUD-NBCHILDREN LINE 25 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Champ de saisi pour le num de securite sociale.
           05 FILLER PIC X(27) VALUE 'Numero de securite sociale' 
           LINE 27 COL 21.

           05 FILLER PIC X VALUE ':' LINE 27 COL 53.

           05 FILLER PIC X(01) TO CCS-SECU-1 LINE 27 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(02) TO CCS-SECU-2 LINE 27 COL 57 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(02) TO CCS-SECU-3 LINE 27 COL 60 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(02) TO CCS-SECU-4 LINE 27 COL 63 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(03) TO CCS-SECU-5 LINE 27 COL 66 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(03) TO CCS-SECU-6 LINE 27 COL 70 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(02) TO CCS-SECU-7 LINE 27 COL 74 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.  

      *    [RD] Champ de saisi pour le docteur.
           05 FILLER PIC X(07) VALUE 'Docteur' 
           LINE 27 COL 111. 

           05 FILLER PIC X VALUE ':' LINE 27 COL 129.

           05 FILLER PIC X(50) TO CUD-DOCTOR LINE 27 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.     

      *    [RD] Champ de saisi pour l'IBAN.
           05 FILLER PIC X(04) VALUE 'IBAN' 
           LINE 29 COL 21. 

           05 FILLER PIC X VALUE ':' LINE 29 COL 53.

           05 FILLER PIC X(34) TO CUD-CODE-IBAN LINE 29 COL 55 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.   

      *    [RD] Bouton rechercher.
           05 FILLER PIC X(23) VALUE "Creation de l'adherent" 
           LINE 34 COL 16 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(01) TO WS-SEARCH-VALIDATION LINE 34 COL 39
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE 
           LINE 31 COL 60 AUTO 
           FOREGROUND-COLOR IS 2.

      *    [RD] Bouton retour au menu.
           05 FILLER PIC X(01) TO WS-MENU-RETURN LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(14) VALUE 'Retour menu' LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

      ******************************************************************
      *    [RD] DEFINITION DU CADRE.                                   *
      ******************************************************************

      *    [RD] Bordure du haut pour le cadre.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 4 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [RD] Bordure de séparation entre le HEADER et le BODY.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 8 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [RD] Bordure du bas pour le cadre.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [RD] Côté du cadre (Ligne 5 à XXX).
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 5 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 5 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE  ALL SPACES LINE 6 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 6 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 7 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACE LINE 7 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 9 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 9 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 10 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 10 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 11 COL 10 
           BACKGROUND-COLOR IS 2.                       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 11 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 12 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 12 COL 190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 13 COL 10 
           BACKGROUND-COLOR IS 2.                           
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 13 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 14 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 14 COL 190 
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 15 COL 10 
           BACKGROUND-COLOR IS 2.                  
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 15 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 16 COL 10 
           BACKGROUND-COLOR IS 2.                
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 16 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 17 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 17 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 18 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 18 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 19 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 19 COL 190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 20 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 20 COL 190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 21 COL 190
           BACKGROUND-COLOR IS 2.                     

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 22 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 23 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 24 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 25 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 26 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 27 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 28 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 29 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 30 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 31 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 31 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 32 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 32 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 33 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 33 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 34 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 34 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 35 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 35 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 36 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 36 COL 190
           BACKGROUND-COLOR IS 2. 
