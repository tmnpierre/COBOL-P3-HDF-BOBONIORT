       IDENTIFICATION DIVISION.
       PROGRAM-ID. muback.
       AUTHOR. Pierre.

      ******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SC-MENU-RETURN       PIC X(01).
       01  VALID-CHOICE         PIC X(01) VALUE 'O'.

      ******************************************************************
       PROCEDURE DIVISION.

      ******************************************************************
       0000-START-VALIDATE-CHOICE.
      *---------------------------------------------------------------
      * Ce paragraphe orchestre le processus de validation en
      * exécutant les étapes nécessaires : afficher le message,
      * accepter et valider l'entrée, et terminer le processus.
      *---------------------------------------------------------------
           PERFORM 1000-DISPLAY-VALIDATION-MESSAGE.
           PERFORM 2000-ACCEPT-AND-VALIDATE.
           PERFORM 9000-END-VALIDATE-CHOICE.
           EXIT.

      ******************************************************************
       1000-DISPLAY-VALIDATION-MESSAGE.
      *---------------------------------------------------------------
      * Ce paragraphe affiche un message à l'utilisateur, l'invitant
      * à appuyer sur "O" suivi de la touche Entrée pour valider son 
      * choix.
      *---------------------------------------------------------------
           DISPLAY "Appuyez sur O puis Entree pour valider".
           EXIT.

      ******************************************************************
       2000-ACCEPT-AND-VALIDATE.
      *---------------------------------------------------------------
      * Ce paragraphe accepte l'entrée de l'utilisateur et la convertit
      * en majuscules. Ensuite, il vérifie si l'entrée correspond au
      * choix valide ("O"). Si ce n'est pas le cas, il affiche un 
      * message d'erreur et se ré-invoque récursivement jusqu'à ce 
      * qu'une entrée valide soit fournie.
      *---------------------------------------------------------------
           ACCEPT SC-MENU-RETURN.
           MOVE FUNCTION UPPER-CASE(SC-MENU-RETURN) TO SC-MENU-RETURN.
           IF SC-MENU-RETURN NOT = VALID-CHOICE
               DISPLAY "CHOIX INVALIDE, ESSAYEZ ENCORE."
               PERFORM 2000-ACCEPT-AND-VALIDATE
           END-IF.
           EXIT.

      ******************************************************************
       9000-END-VALIDATE-CHOICE.
      *---------------------------------------------------------------
      * Ce paragraphe affiche un message de confirmation indiquant
      * qu'un choix valide a été fait.
      *---------------------------------------------------------------
           DISPLAY "Choix valide.".
           EXIT.
