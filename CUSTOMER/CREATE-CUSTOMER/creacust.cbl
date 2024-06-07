       IDENTIFICATION DIVISION.
       PROGRAM-ID. creacust.
       AUTHOR.       Martial.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  LK-REQUEST-CODE      PIC 9(01).
       01  LK-ADHERENT-INPUT.
           05  LK-UUID                 PIC X(36).
           05  LK-GENDER               PIC X(10).
           05  LK-LASTNAME             PIC X(50).
           05  LK-FIRSTNAME            PIC X(50).
           05  LK-ADRESS1              PIC X(50).
           05  LK-ADRESS2              PIC X(50).
           05  LK-ZIPCODE              PIC X(15).
           05  LK-TOWN                 PIC X(50).
           05  LK-COUNTRY              PIC X(20).
           05  LK-PHONE                PIC X(20).
           05  LK-MAIL                 PIC X(50).
           05  LK-BIRTH-DATE           PIC X(10).
           05  LK-DOCTOR               PIC X(50).
           05  LK-CODE-SECU            PIC X(15).
           05  LK-CODE-IBAN            PIC X(34).
       01  LK-ERROR-MESSAGE            PIC X(100).
       
       PROCEDURE DIVISION.
       0000-START-MAIN.
           CALL 'ccback' USING LK-REQUEST-CODE, LK-ADHERENT-INPUT, 
           LK-ERROR-MESSAGE.
           GOBACK.