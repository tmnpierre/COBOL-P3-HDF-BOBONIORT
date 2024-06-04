       IDENTIFICATION DIVISION.
       PROGRAM-ID. scfront.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SC-MENU-RETURN PIC X.
       01  WS-CUSTOMER-DATA.
           05  CUSTOMER-FIRSTNAME PIC X(50).
           05  CUSTOMER-CODE-SECU.
               10 CODE-SECU-1 PIC 9.
               10 CODE-SECU-2 PIC 9(2).
               10 CODE-SECU-3 PIC 9(2).
               10 CODE-SECU-4 PIC 9(2).
               10 CODE-SECU-5 PIC 9(3).
               10 CODE-SECU-6 PIC 9(3).
               10 CODE-SECU-7 PIC 9(2).
       
       SCREEN SECTION.
       COPY "screen-frame.cpy".

       PROCEDURE DIVISION.

           ACCEPT SCREEN-FRAME.