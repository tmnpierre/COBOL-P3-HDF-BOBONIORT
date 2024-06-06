
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

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "INSERT INTO CUSTOMER ( CUSTOME"
OCESQL  &  "R_UUID, CUSTOMER_GENDER, CUSTOMER_LASTNAME, CUSTOMER_FIRST"
OCESQL  &  "NAME, CUSTOMER_ADRESS1, CUSTOMER_ADRESS2, CUSTOMER_ZIPCODE"
OCESQL  &  ", CUSTOMER_TOWN, CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOME"
OCESQL  &  "R_MAIL, CUSTOMER_BIRTH_DATE, CUSTOMER_DOCTOR, CUSTOM".
OCESQL     02  FILLER PIC X(110) VALUE "ER_CODE_SECU, CUSTOMER_CODE_IB"
OCESQL  &  "AN ) VALUES ( $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11"
OCESQL  &  ", $12, $13, $14, $15 )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
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
OCESQL*    EXEC SQL
OCESQL*        CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.

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

OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
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
OCESQL*    EXEC SQL
OCESQL*        INSERT INTO CUSTOMER (
OCESQL*            CUSTOMER_UUID, CUSTOMER_GENDER, CUSTOMER_LASTNAME, 
OCESQL*            CUSTOMER_FIRSTNAME, CUSTOMER_ADRESS1, 
OCESQL*            CUSTOMER_ADRESS2, 
OCESQL*            CUSTOMER_ZIPCODE, CUSTOMER_TOWN, CUSTOMER_COUNTRY, 
OCESQL*            CUSTOMER_PHONE, CUSTOMER_MAIL, CUSTOMER_BIRTH_DATE, 
OCESQL*            CUSTOMER_DOCTOR, CUSTOMER_CODE_SECU,
OCESQL*            CUSTOMER_CODE_IBAN )
OCESQL*        VALUES (:WS-UUID, :WS-GENDER, :WS-LASTNAME, 
OCESQL*                :WS-FIRSTNAME, :WS-ADRESS1, :WS-ADRESS2, 
OCESQL*                :WS-ZIPCODE, :WS-TOWN, :WS-COUNTRY, 
OCESQL*                :WS-PHONE, :WS-MAIL, :WS-BIRTH-DATE, 
OCESQL*                :WS-DOCTOR, :WS-CODE-SECU, :WS-CODE-IBAN)
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 15
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.



