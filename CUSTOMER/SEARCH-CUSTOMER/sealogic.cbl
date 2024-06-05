      ******************************************************************
      *    Le programme 'search logic' recherche dans la table         *
      *    'customer' un ou plusieurs adhérent en fonction des saisies *
      *    de l'utilisateur dans les différents champs de recherche.   *
      *    Les saisies de l'utilisateur correspondent à :              *
      *    - soit au code_secu.                                        *
      *    - soit au nom, prénom et date de naissance.                 *
      *    - soit au code_secu, nom, prénom et date de naissance.      *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. sealogic.
       AUTHOR.         Rémi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUSTOMER-ACCEPT.
           03 WS-CUS-CODE-SECU  PIC 9(15).
           03 WS-CUS-LASTNAME   PIC X(50).
           03 WS-CUS-FIRSTNAME  PIC X(50).
           03 WS-CUS-BIRTH-DATE PIC X(10).

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUSTOMER.
           03 SQL-CUS-UUID        PIC X(36).
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
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.  

       LINKAGE SECTION.
       01  LK-REQUEST-CODE      PIC 9(01).

       01  LK-CUSTOMER-ACCEPT.
           03 LK-CUS-CODE-SECU  PIC 9(15).
           03 LK-CUS-LASTNAME   PIC X(50).
           03 LK-CUS-FIRSTNAME  PIC X(50).
           03 LK-CUS-BIRTH-DATE PIC X(10).
       
      
      ******************************************************************

       PROCEDURE DIVISION USING LK-REQUEST-CODE, LK-CUSTOMER-ACCEPT.
       0000-START-MAIN.
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.

           MOVE LK-CUSTOMER-ACCEPT TO WS-CUSTOMER-ACCEPT.

           PERFORM 1000-START-SQL-REQUEST 
              THRU END-1000-SQL-REQUEST.

           PERFORM 2000-START-FETCH-CURSOR 
              THRU END-2000-FETCH-CURSOR.
       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC. 
           GOBACK.

      ******************************************************************
      *    [RD] Requêtes SQL qui retourne un ou plusieurs adhérents    * 
      *    qui ne sont pas archiver en fonction de la recherche        *
      *    effectuée par l'utilisateur.                                *
      ******************************************************************
       1000-START-SQL-REQUEST.
      *    Recherche en fonction du code_secu
           EXEC SQL
               DECLARE CRSCODESECU CURSOR FOR
               SELECT uuid_customer, customer_gender,
               customer_lastname, customer_firstname,
               customer_birth_date, customer_code_secu
               FROM customer
               WHERE customer_code_secu = :WS-CUS-CODE-SECU
               AND customer_active != 'A'
           END-EXEC.

      *    Recherche en fonction du lastname, firstname et birth_date
           EXEC SQL
               DECLARE CRSNAMEDATE CURSOR FOR
               SELECT uuid_customer, customer_gender, 
               customer_lastname, customer_firstname,
               customer_birth_date, customer_code_secu
               FROM customer
               WHERE customer_lastname = TRIM(:WS-CUS-LASTNAME)
               AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
               AND customer_birth_date = :WS-CUS-BIRTH-DATE
               AND customer_active != 'A'
           END-EXEC.

      *    Recherche en fonction du code_secu, lastname, firstname 
      *    et birth_date
           EXEC SQL
               DECLARE CRSALL CURSOR FOR
               SELECT uuid_customer, customer_gender, 
               customer_lastname, customer_firstname, customer_adress1,
               customer_adress2, customer_zipcode, customer_town,
               customer_country, customer_phone, customer_mail,
               customer_birth_date, customer_doctor, customer_code_secu,
               customer_code_iban, customer_nbchildren, customer_couple,
               customer_create_date, customer_update_date,
               customer_close_date, customer_active
               FROM customer
               WHERE customer_code_secu = :WS-CUS-CODE-SECU
               AND customer_lastname = TRIM(:WS-CUS-LASTNAME)
               AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
               AND customer_birth_date = :WS-CUS-BIRTH-DATE
               AND customer_active != 'A'
           END-EXEC.
       END-1000-SQL-REQUEST.
           EXIT.

      ******************************************************************
      *    [RD] Appel le paragraphe qui s'occupe de FETCH en fonction  *
      *    du numéro de LK-REQUEST-CODE.                               *
      ******************************************************************
       2000-START-FETCH-CURSOR.
           EVALUATE LK-REQUEST-CODE
               WHEN 1
                   PERFORM 2100-START-FETCH-CRSCODESECU
                      THRU END-2100-FETCH-CRSCODESECU
               WHEN 2
                   PERFORM 2200-START-FETCH-CRSNAMEDATE
                      THRU END-2200-FETCH-CRSNAMEDATE
               WHEN 3
                   PERFORM 2300-START-FETCH-CRSALL
                      THRU END-2300-FETCH-CRSALL
               WHEN OTHER
                  CONTINUE
           END-EVALUATE.
       END-2000-FETCH-CURSOR.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu.         *
      ******************************************************************
       2100-START-FETCH-CRSCODESECU.
           EXEC SQL  
               OPEN CRSCODESECU    
           END-EXEC.

           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSCODESECU
                   INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
                        :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
                        :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
                        :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
                        :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
                        :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
                        :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
                        :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
                        :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
                        :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
                        :SQL-CUS-ACTIVE
               END-EXEC

               EVALUATE SQLCODE
                   WHEN ZERO
      *                PERFORM 3000-START-HANDLE THRU END-3000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSCODESECU :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

           EXEC SQL  
               CLOSE CRSCODESECU    
           END-EXEC.
       END-2100-FETCH-CRSCODESECU.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de lastname,          *
      *    firstname et birth_date.                                    *
      ******************************************************************
       2200-START-FETCH-CRSNAMEDATE.
           EXEC SQL  
               OPEN CRSNAMEDATE    
           END-EXEC.
           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSNAMEDATE
                   INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
                        :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
                        :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
                        :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
                        :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
                        :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
                        :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
                        :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
                        :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
                        :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
                        :SQL-CUS-ACTIVE
               END-EXEC

               EVALUATE SQLCODE
                   WHEN ZERO
      *                PERFORM 3000-START-HANDLE THRU END-3000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSNAMEDATE :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

           EXEC SQL  
               CLOSE CRSNAMEDATE    
           END-EXEC.
       END-2200-FETCH-CRSNAMEDATE.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu,         *
      *    lastname, firstname et birth_date.                          *
      ******************************************************************
       2300-START-FETCH-CRSALL.
           EXEC SQL  
               OPEN CRSALL    
           END-EXEC.
           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSALL
                   INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
                        :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
                        :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
                        :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
                        :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
                        :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
                        :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
                        :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
                        :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
                        :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
                        :SQL-CUS-ACTIVE
               END-EXEC
               
               EVALUATE SQLCODE
                   WHEN ZERO
      *                PERFORM 3000-START-HANDLE THRU END-3000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSALL :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

           EXEC SQL  
               CLOSE CRSALL    
           END-EXEC.
       END-2300-FETCH-CRSALL.
           EXIT.
