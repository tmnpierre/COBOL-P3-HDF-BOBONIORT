       IDENTIFICATION DIVISION.
       PROGRAM-ID. muback.
       AUTHOR. Pierre.

      ******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SC-MENU-RETURN PIC X(01).
       01  VALID-CHOICE PIC X(01) VALUE 'O'.

      ******************************************************************
       PROCEDURE DIVISION.

      ******************************************************************
       0000-START-VALIDATE-CHOICE.
      *---------------------------------------------------------------
      * This paragraph orchestrates the validation process by 
      * performing the necessary steps: displaying the message,
      * accepting and validating the input, and ending the process.
      *---------------------------------------------------------------
           PERFORM 1000-DISPLAY-VALIDATION-MESSAGE.
           PERFORM 2000-ACCEPT-AND-VALIDATE.
           PERFORM 9000-END-VALIDATE-CHOICE.
           EXIT.

      ******************************************************************
       1000-DISPLAY-VALIDATION-MESSAGE.
      *---------------------------------------------------------------
      * This paragraph displays a message to the user, instructing 
      * them to press "O" followed by Enter to validate their choice.
      *---------------------------------------------------------------
           DISPLAY "Appuyez sur O puis Entree pour valider".
           EXIT.

      ******************************************************************
       2000-ACCEPT-AND-VALIDATE.
      *---------------------------------------------------------------
      * This paragraph accepts the user input and converts it to 
      * uppercase. It then checks if the input matches the valid 
      * choice ("O"). If not, it displays an error message and 
      * recursively re-invokes itself until a valid input is provided.
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
      * This paragraph displays a confirmation message indicating 
      * that a valid choice has been made.
      *---------------------------------------------------------------
           DISPLAY "Choix valide.".
           EXIT.
