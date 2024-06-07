
      ******************************************************************
      *    [MF] Le programme 'Create Adherent logic' ajoute un adhérent
      *    à la table customer
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ccback.
       AUTHOR.       Martial.
      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
         
       01  WS-VALIDATION-STATUS        PIC X(01) VALUE 'N'.

       01  WS-ADHERENT.
           05  WS-UUID                 PIC X(36).
           05  WS-GENDER               PIC X(10).
           05  WS-LASTNAME             PIC X(50).
           05  WS-FIRSTNAME            PIC X(50).
           05  WS-ADRESS1              PIC X(50).
           05  WS-ADRESS2              PIC X(50).
           05  WS-ZIPCODE              PIC X(15).
           05  WS-TOWN                 PIC X(50).
           05  WS-COUNTRY              PIC X(20).
           05  WS-PHONE                PIC X(20).
           05  WS-MAIL                 PIC X(50).
           05  WS-BIRTH-DATE           PIC X(10).
           05  WS-DOCTOR               PIC X(50).
           05  WS-CODE-SECU            PIC X(15).
           05  WS-CODE-IBAN            PIC X(34).

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       LINKAGE SECTION.
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

      ******************************************************************

       PROCEDURE DIVISION USING LK-REQUEST-CODE, LK-ADHERENT-INPUT, 
           LK-ERROR-MESSAGE.
       0000-START-MAIN.
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.

      *    [MF] Déplacement des données du linkage vers la
      *    working-storage

           MOVE LK-ADHERENT-INPUT TO WS-ADHERENT.

           PERFORM INITIALIZE-VALUES
           PERFORM VALIDATE-INPUT
           IF WS-VALIDATION-STATUS = 'Y'
               PERFORM INSERT-DATA-TO-DB
           ELSE
               DISPLAY 'Erreur: ' LK-ERROR-MESSAGE
           END-IF

           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
           GOBACK.

       INITIALIZE-VALUES.
           MOVE SPACES TO LK-ERROR-MESSAGE
           MOVE 'N' TO WS-VALIDATION-STATUS.

      *    [MF] Vérification de la saisie de l'utilisateur

       VALIDATE-INPUT.
           IF WS-GENDER = SPACES
               MOVE 'Le genre est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-LASTNAME = SPACES
               MOVE 'Le nom est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-FIRSTNAME = SPACES
               MOVE 'Le prénom est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-ADRESS1 = SPACES
               MOVE 'L''adresse est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-ZIPCODE = SPACES
               MOVE 'Le code postal est obligatoire.' TO 
               LK-ERROR-MESSAGE
           END-IF.
           IF WS-TOWN = SPACES
               MOVE 'La ville est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-COUNTRY = SPACES
               MOVE 'Le pays est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF NOT FUNCTION NUMVAL(WS-PHONE) > 0
               MOVE 'Le numéro de téléphone doit être numérique.'
                TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-MAIL = SPACES
               MOVE 'L''email est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-BIRTH-DATE = SPACES
               MOVE 'La date de naissance est obligatoire.'
                TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-CODE-SECU = SPACES
               MOVE 'Le code de sécurité sociale est obligatoire.' 
               TO LK-ERROR-MESSAGE
           END-IF.
           IF WS-CODE-IBAN = SPACES
               MOVE 'Le code IBAN est obligatoire.' TO LK-ERROR-MESSAGE
           END-IF.

           MOVE 'Y' TO WS-VALIDATION-STATUS.

      *    [MF] Si toute les saisies de l'utilisateur sont bonnes alors
      *    on insère les données dans la table CUSTOMER

       INSERT-DATA-TO-DB.
           EXEC SQL
               INSERT INTO CUSTOMER (
                   CUSTOMER_UUID, CUSTOMER_GENDER, CUSTOMER_LASTNAME, 
                   CUSTOMER_FIRSTNAME, CUSTOMER_ADRESS1, 
                   CUSTOMER_ADRESS2, 
                   CUSTOMER_ZIPCODE, CUSTOMER_TOWN, CUSTOMER_COUNTRY, 
                   CUSTOMER_PHONE, CUSTOMER_MAIL, CUSTOMER_BIRTH_DATE, 
                   CUSTOMER_DOCTOR, CUSTOMER_CODE_SECU,
                   CUSTOMER_CODE_IBAN )
               VALUES (:WS-UUID, :WS-GENDER, :WS-LASTNAME, 
                       :WS-FIRSTNAME, :WS-ADRESS1, :WS-ADRESS2, 
                       :WS-ZIPCODE, :WS-TOWN, :WS-COUNTRY, 
                       :WS-PHONE, :WS-MAIL, :WS-BIRTH-DATE, 
                       :WS-DOCTOR, :WS-CODE-SECU, :WS-CODE-IBAN)
           END-EXEC.

