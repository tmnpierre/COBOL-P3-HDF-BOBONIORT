      ******************************************************************
      *    Sous programme gerant l'affichage                           *
      *    de l'écran de menu de l'adherent  et la gestion d'erreur    *
      ****************************************************************** 
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menucust.

       AUTHOR. Yves. Alexandre.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       LINKAGE SECTION.
       
       01 LK-CUSTOMER-NAME.
           05 LK-FIRSTNAME            PIC X(14).
           05 FILLER                  PIC X(01) VALUE SPACE.
           05 LK-LASTNAME             PIC X(14). 

       WORKING-STORAGE SECTION. 

       01  WS-OPTIONS-MENU-CUST.
           05 WS-CUSTOMER-MODIF       PIC X(01).
           05 WS-CONTRACT-LIST        PIC X(01).
           05 WS-CUST-ARCHIVE         PIC X(01).
           05 WS-CALL-MENU            PIC X(01).               
           05 WS-ERROR-MESSAGE        PIC X(62).                     
       
       01 WS-MESSAGE.
           05 WS-MESSAGE1       PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'.
           05 WS-MESSAGE2       PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'.
       
       01 WS-SELECT-OPTION            PIC X(05) VALUE 'FALSE'.  
 
       01 WS-CUSTOMER-NAME.
           05 LK-FIRSTNAME            PIC X(14).
           05 FILLER                  PIC X(01) VALUE SPACE.
           05 LK-LASTNAME             PIC X(14). 

       SCREEN SECTION.
           COPY 'screen-section-menu-customer.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION .
      * USING 
       
       0000-START-MAIN.

           PERFORM 1000-START-CONTROL-IMPUT 
           THRU 1000-END-CONTROL-IMPUT.

       END-0000-MAIN.
           STOP RUN.
      *     GOBACK.

      ******************************************************************      
       1000-START-CONTROL-IMPUT.
      *    AL - Boucle d'affichage de la gestion du menu
      
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'
               
              ACCEPT SCREEN-SECTION-MENU-USER 
              PERFORM 1100-START-CHECK-CHOICE 
              THRU 1100-END-CHECK-CHOICE
              END-PERFORM.

       1000-END-CONTROL-IMPUT.
           EXIT.    

      ******************************************************************      
       1100-START-CHECK-CHOICE.
      *    YM - Vérifie la saisine utilisateur : 'O' dans l'input
      *    et appelle le sous programme necessaire.

           IF FUNCTION UPPER-CASE(WS-CUSTOMER-MODIF) 
           EQUAL 'O' THEN
              CALL 'updacust'  USING S-CUSTOMER-NAME

           ELSE IF FUNCTION UPPER-CASE(WS-CONTRACT-LIST)
           EQUAL 'O' THEN
              CALL 'detacust'  USING S-CUSTOMER-NAME

           ELSE IF FUNCTION UPPER-CASE(WS-CUST-ARCHIVE)
           EQUAL 'O' THEN           
              CALL 'archust'   USING S-CUSTOMER-NAME

           ELSE IF FUNCTION UPPER-CASE(WS-CALL-MENU)
           EQUAL 'O' THEN
               CALL 'menuuser' USING S-CUSTOMER-NAME
 
           ELSE  
              PERFORM 1200-START-ERROR-MESSAGE 
              THRU 1200-END-ERROR-MESSAGE
           END-IF.
           
       1100-END-CHECK-CHOICE.
           EXIT.   
      ******************************************************************       
       1200-START-ERROR-MESSAGE.
      *    YM - Gère l'affichage du message d'erreur en 
      *    cas d'erreur de saisie 

            MOVE WS-MESSAGE          
             TO WS-ERROR-MESSAGE.
            DISPLAY WS-ERROR-MESSAGE
            LINE 26 COL 60 FOREGROUND-COLOR IS 7.
            INITIALIZE WS-CUSTOMER-MODIF 
            WS-CONTRACT-LIST  
            WS-CUST-ARCHIVE   
            WS-CALL-MENU.      

       1200-END-ERROR-MESSAGE.
           EXIT.

      ******************************************************************       
       