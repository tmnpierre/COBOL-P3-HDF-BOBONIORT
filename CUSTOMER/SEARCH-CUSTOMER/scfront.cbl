       IDENTIFICATION DIVISION.
       PROGRAM-ID. scfront.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SC-MENU-RETURN PIC X.
       01  SC-SEARCH-VALIDATION PIC X.
       01  ERROR-MESSAGE PIC X(100).
       01  RESULT PIC X(100).
       01  WS-CUSTOMER-DATA.
           05  CUSTOMER-FIRSTNAME PIC X(50).
           05  CUSTOMER-LASTNAME PIC X(50).
           05  CUSTOMER-BIRTHDATE.
               10 BIRTHDATE-DAYS PIC X(2).
               10 FILLER PIC X VALUE "/".
               10 BIRTHDATE-MONTH PIC X(2).
               10 FILLER PIC X VALUE "/".
               10 BIRTHDATE-YEAR PIC X(4).
           05  CUSTOMER-CODE-SECU.
               10 CODE-SECU-1 PIC X.
               10 CODE-SECU-2 PIC X(2).
               10 CODE-SECU-3 PIC X(2).
               10 CODE-SECU-4 PIC X(2).
               10 CODE-SECU-5 PIC X(3).
               10 CODE-SECU-6 PIC X(3).
               10 CODE-SECU-7 PIC X(2).
       
       SCREEN SECTION.
       COPY "screen-frame.cpy".

       PROCEDURE DIVISION.

           ACCEPT SCREEN-FRAME.