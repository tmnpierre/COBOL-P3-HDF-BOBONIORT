      ****************************************************************** 
      *[BJ]Sous programme de gestion des erreurs pour la recherche     *
      *    d'adhérents                                                 * 
      ******************************************************************      
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. seaerr.
       AUTHOR. Bafodé.
      ******************************************************************
       DATA DIVISION.
       LINKAGE SECTION.
       01  LK-SQLCODE           PIC S9(09) COMP.
       01  LK-ERRMSG            PIC X(100).
    
       01  LK-CUSTOMER-ACCEPT.
           03 LK-CUS-CODE-SECU  PIC 9(15).
           03 LK-CUS-LASTNAME   PIC X(50).
           03 LK-CUS-FIRSTNAME  PIC X(50).
           03 LK-CUS-BIRTH-DATE PIC X(10).

        01 LK-REQUEST-CODE      PIC 9(01).
      ******************************************************************
       PROCEDURE DIVISION USING LK-SQLCODE LK-ERRMSG.

       0000-START-MAIN.
           PERFORM 1000-INPUT-ERRORS THRU END-1000-INPUT-ERRORS.
            IF LK-ERRMSG NOT = SPACES THEN DISPLAY LK-ERRMSG
               GOBACK 
            END-IF.

           PERFORM 2000-SQL-ERRORS THRU END-2000-SQL-ERRORS.
            
       END-0000-MAIN.
           GOBACK.
      ***** Gestion des erreurs liées a la saisie de l'utilisateur
       1000-INPUT-ERRORS.
      ***** gestion du champ numero de sécu  
            EVALUATE LK-REQUEST-CODE
               WHEN 1
               IF LK-CUS-CODE-SECU = SPACES OR LK-CUS-CODE-SECU 
               NOT NUMERIC
                  MOVE 'Erreur :Saisisez un numéro de sécu. valide.'
                  TO LK-ERRMSG
               END-IF
               WHEN 2
      ***** gestion du champ nom       
               IF LK-CUS-LASTNAME = SPACES OR LK-CUS-LASTNAME NUMERIC
                  MOVE 'Erreur : Saisisez un nom valide.'
                  TO LK-ERRMSG
      ***** gestion du champ prénom        
               Else IF LK-CUS-FIRSTNAME = SPACES OR LK-CUS-FIRSTNAME 
               NUMERIC
                  MOVE 'Erreur : Veuillez saisir un prénom valide.'
                  TO LK-ERRMSG
      ***** gestion du champ date de naissance  
               ELSE IF LK-CUS-BIRTH-DATE = SPACES 
                  MOVE 'Erreur : Veuillez saisir une date valide .'
                  TO LK-ERRMSG
               END-IF
               WHEN 3
      ***** gestion du champ numéro de sécu cas 3
               IF LK-CUS-CODE-SECU = SPACES
                  MOVE 'Erreur : saisisez un numéro de sécu valide.'
                     TO LK-ERRMSG
      ***** gestion du champ nom cas 3            
               ELSE IF LK-CUS-LASTNAME = SPACES OR LK-CUS-LASTNAME 
               NUMERIC
                  MOVE 'Erreur : Veuillez saisir un nom valide.'
                  TO LK-ERRMSG
      ***** gestion du champ prénom cas 3
               ELSE IF LK-CUS-FIRSTNAME = SPACES OR LK-CUS-FIRSTNAME 
               NUMERIC
                  MOVE 'Erreur : Veuillez saisir un prénom valide.'
                  TO LK-ERRMSG
               END-IF
            END-EVALUATE.
           
       END-1000-INPUT-ERRORS.
             EXIT.
      ***** Gestion de erreurs liées a la base de donée     
      
       2000-SQL-ERRORS.
      *****[BJ] Envoie du message d'erreur selon le probleme rencontrer  
            EVALUATE LK-SQLCODE

      *****[BJ] erreur de syntaxe sql 
            WHEN -104
               MOVE 'Erreur technique : code B1000'   TO LK-ERRMSG
               MOVE 'contacter le support technique.' TO LK-ERRMSG

      *****[BJ] table non trouvé      
            WHEN -204
               MOVE 'Erreur technique : code B2000'   TO LK-ERRMSG
               MOVE 'contacter le support technique.' TO LK-ERRMSG

      *****[BJ] Colonne non trouvé    
            WHEN -206
               MOVE 'Erreur technique : code B3000'   TO LK-ERRMSG
               MOVE 'contacter le support technique.' TO LK-ERRMSG

      *****[BJ] Violation contrainte d'unicité
            WHEN -803
               MOVE 'Erreur technique : Code B4000 '  TO LK-ERRMSG
               MOVE 'contacter le support technique.' TO LK-ERRMSG

      *****[BJ] Problème de connexion a la base de donées
            WHEN -924
               MOVE 'Erreur critique : Code B5000 '   TO LK-ERRMSG
               MOVE 'contacter le support technique.' TO LK-ERRMSG
      *****[BJ] Pas de resultat de recherche
            WHEN 100
               MOVE 'Erreur : Aucun adhérent trouvé ' TO LK-ERRMSG
               MOVE 'Veuillez vérifier les informations et réessayer.' 
                                                      TO LK-ERRMSG
      *****[BJ] Autres erreurs                   
            WHEN OTHER
               MOVE 'Erreur technique inconnue. Code erreur : ' 
                                                      TO LK-ERRMSG
               MOVE  LK-SQLCODE TO LK-ERRMSG 
               MOVE 'Erreur: Veuillez contacter le support technique. ' 
                                                      TO LK-ERRMSG
            END-EVALUATE.
       END-2000-SQL-ERRORS.
           EXIT.



      
           
