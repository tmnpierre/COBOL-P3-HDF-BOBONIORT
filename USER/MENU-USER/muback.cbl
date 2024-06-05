       IDENTIFICATION DIVISION.
       PROGRAM-ID. muback.
       AUTHOR. Pierre.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SC-MENU-RETURN PIC X(01).
       01  VALID-CHOICE PIC X(01) VALUE 'O'.
       
       PROCEDURE DIVISION.
       0000-START-VALIDATE-CHOICE.
           PERFORM 1000-DISPLAY-VALIDATION-MESSAGE.
           PERFORM 2000-ACCEPT-AND-VALIDATE.
           PERFORM 9000-END-VALIDATE-CHOICE.
           EXIT.
       
       1000-DISPLAY-VALIDATION-MESSAGE.
           DISPLAY "Appuyez sur O puis Entree pour valider".
           EXIT.
       
       2000-ACCEPT-AND-VALIDATE.
           ACCEPT SC-MENU-RETURN.
           MOVE FUNCTION UPPER-CASE(SC-MENU-RETURN) TO SC-MENU-RETURN.
           IF SC-MENU-RETURN NOT = VALID-CHOICE
               DISPLAY "CHOIX INVALIDE, ESSAYEZ ENCORE."
               PERFORM 2000-ACCEPT-AND-VALIDATE
           END-IF.
           EXIT.
       
       9000-END-VALIDATE-CHOICE.
           DISPLAY "Choix valide.".
           EXIT.
