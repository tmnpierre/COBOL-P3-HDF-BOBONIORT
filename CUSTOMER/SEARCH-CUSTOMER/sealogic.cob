      ******************************************************************
      *    Le programme 'search logic' recherche dans la table         *
      *    'customer' un ou plusieurs adhérent en fonction des saisies *
      *    de l'utilisateur dans les différents champs de recherche.   *
      *    Les saisies de l'utilisateur correspondent soit au code_secu*
      *    soit au nom, prénom et date de naissance.                   *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. sealogic.
       AUTHOR.         Rémi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CUSTOMER-TABLE.
           03 CUS-CNT PIC 9(10).
           03 CUSTOMER OCCURS 1000 TIMES 
                       INDEXED BY CUS-IDX.
               05 CUS-GENDER      PIC X(10).
               05 CUS-LASTNAME	  PIC X(50).
               05 CUS-FIRSTNAME   PIC X(50).
               05 CUS-ADRESS1	  PIC X(50).
               05 CUS-ADRESS2	  PIC X(50).
               05 CUS-ZIPCODE	  PIC X(15).
               05 CUS-TOWN	      PIC X(50).
               05 CUS-COUNTRY	  PIC X(20).
               05 CUS-PHONE	      PIC X(10).
               05 CUS-MAIL	      PIC X(50).
               05 CUS-BIRTH-DATE  PIC X(10).
               05 CUS-DOCTOR	  PIC X(50).
               05 CUS-CODE-SECU   PIC 9(10).
               05 CUS-CODE-IBAN   PIC X(34).
               05 CUS-NBCHILDREN  PIC 9(03).
               05 CUS-COUPLE      PIC X(05).
               05 CUS-CREATE-DATE PIC X(10).
               05 CUS-UPDATE-DATE PIC X(10).
               05 CUS-CLOSE-DATE  PIC X(10).
               05 CUS-ACTIVE	  PIC X(01).

       01  WS-CUSTOMER-ACCEPT.
           03 WS-CUS-CODE-SECU  PIC 9(15).
           03 WS-CUS-LASTNAME   PIC X(50).
           03 WS-CUS-FIRSTNAME  PIC X(50).
           03 WS-CUS-BIRTH-DATE PIC X(10).

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUSTOMER.
           03 SQL-CUS-GENDER      PIC X(10).
           03 SQL-CUS-LASTNAME    PIC X(50).
           03 SQL-CUS-FIRSTNAME   PIC X(50).
           03 SQL-CUS-ADRESS1	  PIC X(50).
           03 SQL-CUS-ADRESS2	  PIC X(50).
           03 SQL-CUS-ZIPCODE	  PIC X(15).
           03 SQL-CUS-TOWN	      PIC X(50).
           03 SQL-CUS-COUNTRY	  PIC X(20).
           03 SQL-CUS-PHONE	      PIC X(10).
           03 SQL-CUS-MAIL	      PIC X(50).
           03 SQL-CUS-BIRTH-DATE  PIC X(10).
           03 SQL-CUS-DOCTOR	  PIC X(50).
           03 SQL-CUS-CODE-SECU   PIC 9(15).
           03 SQL-CUS-CODE-IBAN   PIC X(34).
           03 SQL-CUS-NBCHILDREN  PIC 9(03).
           03 SQL-CUS-COUPLE      PIC X(05).
           03 SQL-CUS-CREATE-DATE PIC X(10).
           03 SQL-CUS-UPDATE-DATE PIC X(10).
           03 SQL-CUS-CLOSE-DATE  PIC X(10).
           03 SQL-CUS-ACTIVE	  PIC X(01).
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.  
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(129) VALUE "SELECT customer_lastname, cust"
OCESQL  &  "omer_firstname, customer_birth_date, customer_code_secu FR"
OCESQL  &  "OM customer WHERE customer_code_secu = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(201) VALUE "SELECT customer_lastname, cust"
OCESQL  &  "omer_firstname, customer_birth_date, customer_code_secu FR"
OCESQL  &  "OM customer WHERE customer_lastname = TRIM( $1 ) AND custo"
OCESQL  &  "mer_firstname = TRIM( $2 ) AND customer_birth_date = $3".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01  LK-CUSTOMER-ACCEPT.
           03 LK-CUS-CODE-SECU  PIC 9(15).
           03 LK-CUS-LASTNAME   PIC X(50).
           03 LK-CUS-FIRSTNAME  PIC X(50).
           03 LK-CUS-BIRTH-DATE PIC X(10).
      
      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER-ACCEPT.
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

           MOVE LK-CUSTOMER-ACCEPT TO WS-CUSTOMER-ACCEPT.

           PERFORM 1000-START-SQL-REQUEST 
              THRU END-1000-SQL-REQUEST.

           PERFORM 2000-START-FETCH-CURSOR 
              THRU END-2000-FETCH-CURSOR.
       END-0000-MAIN.
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

      ******************************************************************
      *    [RD] Requêtes SQL qui retourne un ou plusieurs adhérents    * 
      *    en fonction de la recherche effectuée par l'utilisateur.    *
      ******************************************************************
       1000-START-SQL-REQUEST.
      *    Recherche en fonction du code_secu
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSCODESECU CURSOR FOR
OCESQL*        SELECT customer_lastname, customer_firstname,
OCESQL*        customer_birth_date, customer_code_secu
OCESQL*        FROM customer
OCESQL*        WHERE customer_code_secu = :WS-CUS-CODE-SECU
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSCODESECU" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      *    Recherche en fonction du lastname, firstname et birth_date
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSNAMEDATE CURSOR FOR
OCESQL*        SELECT customer_lastname, customer_firstname,
OCESQL*        customer_birth_date, customer_code_secu
OCESQL*        FROM customer
OCESQL*        WHERE customer_lastname = TRIM(:WS-CUS-LASTNAME)
OCESQL*        AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
OCESQL*        AND customer_birth_date = :WS-CUS-BIRTH-DATE
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSNAMEDATE" & x"00"
OCESQL          BY REFERENCE SQ0003
OCESQL          BY VALUE 3
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-1000-SQL-REQUEST.
           EXIT.

      ******************************************************************
      *    [RD] Appel les 2 paragraphes qui s'occupent de FETCH.       *
      ******************************************************************
       2000-START-FETCH-CURSOR.
           PERFORM 2100-START-FETCH-CRSCODESECU
              THRU END-2100-FETCH-CRSCODESECU.

           PERFORM 2200-START-FETCH-CRSNAMEDATE
              THRU END-2200-FETCH-CRSNAMEDATE.
       END-2000-FETCH-CURSOR.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu.         *
      ******************************************************************
       2100-START-FETCH-CRSCODESECU.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSCODESECU    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSCODESECU" & x"00"
OCESQL     END-CALL.

           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSCODESECU
OCESQL*            INTO :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
OCESQL*                 :SQL-CUS-BIRTH-DATE, :SQL-CUS-CODE-SECU
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSCODESECU" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 3000-START-HANDLE THRU END-3000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSCODESECU :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSCODESECU    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSCODESECU" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-2100-FETCH-CRSCODESECU.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de lastname,          *
      *    firstname et birth_date.                                    *
      ******************************************************************
       2200-START-FETCH-CRSNAMEDATE.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSNAMEDATE    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSNAMEDATE" & x"00"
OCESQL     END-CALL.
           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSNAMEDATE
OCESQL*            INTO :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
OCESQL*                 :SQL-CUS-BIRTH-DATE, :SQL-CUS-CODE-SECU
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSNAMEDATE" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 3000-START-HANDLE THRU END-3000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSNAMEDATE :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSNAMEDATE    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "sealogic_CRSNAMEDATE" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-2200-FETCH-CRSNAMEDATE.
           EXIT.

      ******************************************************************
      *    Stock le ou les résultats de la requête SQL dans la TABLE   *
      *    CUSTOMER.                                                   *
      ******************************************************************
       3000-START-HANDLE.
           ADD 1 TO CUS-CNT.

           MOVE SQL-CUS-LASTNAME  TO CUS-LASTNAME(CUS-CNT).
           MOVE SQL-CUS-FIRSTNAME TO CUS-FIRSTNAME(CUS-CNT).
           MOVE SQL-CUS-BIRTH-DATE TO CUS-BIRTH-DATE(CUS-CNT).
           MOVE SQL-CUS-CODE-SECU TO CUS-CODE-SECU(CUS-CNT).
           
           DISPLAY CUS-LASTNAME(CUS-CNT) 
           SPACE CUS-FIRSTNAME(CUS-CNT)
           SPACE CUS-BIRTH-DATE(CUS-CNT)
           SPACE CUS-CODE-SECU(CUS-CNT).
       END-3000-HANDLE.
           EXIT.
           EXIT.
           EXIT.
