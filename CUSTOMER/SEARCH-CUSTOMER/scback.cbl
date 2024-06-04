       IDENTIFICATION DIVISION.
       PROGRAM-ID. scback.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CUSTOMER-ACCEPT.
           03 CUSTOMER-CODE-SECU  PIC 9(15) VALUE 273049876512345.
           03 CUSTOMER-LASTNAME   PIC X(50) VALUE 'Moreau'.
           03 CUSTOMER-FIRSTNAME  PIC X(50) VALUE 'Louis'.
           03 CUSTOMER-BIRTH-DATE PIC X(10) VALUE '1995-02-15'.

       PROCEDURE DIVISION.
           CALL 
              "sealogic" 
              USING CUSTOMER-ACCEPT
           END-CALL.
           
           GOBACK.
       