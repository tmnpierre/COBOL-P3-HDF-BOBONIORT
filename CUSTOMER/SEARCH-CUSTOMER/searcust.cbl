      ******************************************************************
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. searcust.
       
      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ERROR-CODE PIC 9(01) VALUE 3.

       01  CUSTOMER-ACCEPT.
           03 CUSTOMER-CODE-SECU  PIC 9(15) VALUE 195063475290876.
           03 CUSTOMER-LASTNAME   PIC X(50) VALUE 'Girard'.
           03 CUSTOMER-FIRSTNAME  PIC X(50) VALUE 'Sophie'.
           03 CUSTOMER-BIRTH-DATE PIC X(10) VALUE '1980-12-01'.

      ******************************************************************

       PROCEDURE DIVISION.
       0000-START-MAIN.
           CALL 
              'scback' 
              USING ERROR-CODE, CUSTOMER-ACCEPT
           END-CALL.
       END-0000-MAIN.
           GOBACK.
