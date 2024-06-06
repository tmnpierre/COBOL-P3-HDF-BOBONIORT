      *    MENU DE LA RECHERCHE D'ADHERENT
     
      * ---------------------------------------------------------------- 
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. scfront.
       AUTHOR. Martial.

      * ----------------------------------------------------------------

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      
      
       01  WS-MENU-RETURN PIC X.
       01  WS-SEARCH-VALIDATION PIC X.
       01  WS-ERROR-MESSAGE PIC X(70).
       01  CUSTOMER-DATA.
           05  CUD-FIRSTNAME PIC X(20).
           05  CUD-LASTNAME PIC X(20).
           05  CUSTOMER-BIRTHDATE.
               10 CUB-DAYS PIC X(2).
               10 CUB-MONTH PIC X(2).
               10 CUB-YEAR PIC X(4).
           05  CUSTOMER-CODE-SECU.
               10 CCS-SECU-1 PIC X.
               10 CCS-SECU-2 PIC X(2).
               10 CCS-SECU-3 PIC X(2).
               10 CCS-SECU-4 PIC X(2).
               10 CCS-SECU-5 PIC X(3).
               10 CCS-SECU-6 PIC X(3).
               10 CCS-SECU-7 PIC X(2).

      

       SCREEN SECTION.
       COPY "screen-frame.cpy".

      * ----------------------------------------------------------------

       PROCEDURE DIVISION.

           ACCEPT SCREEN-FRAME.
           