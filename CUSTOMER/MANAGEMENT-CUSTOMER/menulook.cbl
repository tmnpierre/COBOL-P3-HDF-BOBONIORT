      ****************************************************************** 
      * Gestion du menu pour créer ou chercher un adhérent.            *
      *    Programme précédent: menu principal(tableau de bord)        *
      *    Programme suivant : dépend du choix de l'utilisateur        *
      *    Le menu affiche les options et un bouton retour             *
      * Auteur: Isabelle                                               *     
      * Date de création : le 06/06/2024                               *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menulook.
       AUTHOR. Isabelle.
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    gestion des erreurs de saisie
       01 WS-SELECT-OPTION      PIC X(05)   VALUE 'FALSE'     . 
       01 WS-MESSAGE.
           05 WS-MESSAGE1       PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'        .
           05 WS-MESSAGE2       PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'         .
      *    gestion de la saisie
       01  WS-CREATE-CHOICE     PIC X(01)   VALUE SPACE       .
       01  WS-SEARCH-CHOICE     PIC X(01)   VALUE SPACE       .
       01  WS-RETURN-CHOICE     PIC X(01)   VALUE SPACE       .

      ******************************************************************
       SCREEN SECTION.
           COPY MENU-LOOK-SCREEN.CPY

      ******************************************************************
       PROCEDURE DIVISION.
      ****************************************************************** 
      * [IM]- le 06-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie et      *
      *    appelle le programme correspondant au choix de l'utilisateur*
      ****************************************************************** 
       0000-START-MAIN.          
           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
      *    EXIT PROGRAM.
           STOP RUN.    

      ******************************************************************    
      *    [IM] - le 05-06-2024                                        *
      *    Pour permettre de boucler sur l'affichage en cas d'erreur   *
      *    de saisie de l'utilisateur                                  *
      ****************************************************************** 
       1000-SCREEN-LOOP-START.   
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'            
              ACCEPT MENU-LOOK-SCREEN  
              PERFORM 3000-WITCH-CHOICE-START
                    THRU END-3000-WITCH-CHOICE
           END-PERFORM.          
       END-1000-SCREEN-LOOP. 
           EXIT.   

      ******************************************************************    
      *    [IM] - le 06-06-2024                                        *
      *    Je vérifie la saisie                                        *
      ******************************************************************
       3000-WITCH-CHOICE-START.
           IF FUNCTION UPPER-CASE(WS-CREATE-CHOICE) 
           EQUAL 'O' THEN
              CALL 'creacust'  

           ELSE IF FUNCTION UPPER-CASE(WS-SEARCH-CHOICE)
           EQUAL 'O' THEN
              CALL 'searcust'  

           ELSE IF FUNCTION UPPER-CASE(WS-RETURN-CHOICE)
           EQUAL 'O' THEN
               CALL 'menuuser' 
 
           ELSE  
              PERFORM 9200-ERROR-MESSAGE-START 
                       THRU END-9200-ERROR-MESSAGE
           END-IF.
       END-3000-WITCH-CHOICE.
           EXIT.

      ******************************************************************    
      *    [IM] - le 06-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9200-ERROR-MESSAGE-START. 
            DISPLAY WS-MESSAGE
            LINE 26 COL 60 FOREGROUND-COLOR IS 7.
            INITIALIZE 
                 WS-CREATE-CHOICE
                 WS-SEARCH-CHOICE
                 WS-RETURN-CHOICE .                      
       END-9200-ERROR-MESSAGE.
           EXIT.

      
