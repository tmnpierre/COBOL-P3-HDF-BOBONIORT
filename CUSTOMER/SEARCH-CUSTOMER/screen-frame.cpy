       01  SCREEN-FRAME FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.
           05 FILLER PIC X(182) VALUE all " " LINE 4 COL 10 
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 5 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 6 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(18) VALUE  "RECHERCHE ADHERENT" 
           COL 91 
           FOREGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 7 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  "  " LINE 8 COL 10 
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 9 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 10 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 11 COL 10 
           BACKGROUND-COLOR IS 2.                       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 12 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 13 COL 10 
           BACKGROUND-COLOR IS 2.                           
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(27) VALUE "Numero de securite sociale " 
           LINE 16 COL 60 .
           05 FILLER PIC X VALUE ":" 
           LINE 16 COL 92 .
           05 FILLER PIC X(1) TO  CCS-SECU-1 
            LINE 16 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
         
           05 FILLER PIC X(2) TO  CCS-SECU-2 
            LINE 16 COL 117 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
          
           05 FILLER PIC X(2) TO  CCS-SECU-3 
            LINE 16 COL 119 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           
           05 FILLER PIC X(2) TO  CCS-SECU-4 
            LINE 16 COL 122 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
        
           05 FILLER PIC X(3) TO  CCS-SECU-5 
            LINE 16 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
        
           05 FILLER PIC X(3) TO  CCS-SECU-6 
            LINE 16 COL 129 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
        
           05 FILLER PIC X(2) TO  CCS-SECU-7 
           LINE 16 COL 133 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           
           05 FILLER PIC X(2) VALUE  "  " LINE 14 COL 10 
           BACKGROUND-COLOR IS 2. 
           
           05 FILLER PIC X(7) VALUE "Prenom " 
           LINE 18 COL 60 . 
           05 FILLER PIC X VALUE ":" 
           LINE 18 COL 92 .
           05 FILLER PIC X(20) TO  CUD-FIRSTNAME
           LINE 18 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.  
           05 FILLER PIC X(2) VALUE  "  " LINE 14 COL 190 
           BACKGROUND-COLOR IS 2.             
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 15 COL 10 
           BACKGROUND-COLOR IS 2.                  
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 16 COL 10 
           BACKGROUND-COLOR IS 2.                
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 17 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(4) VALUE "Nom " 
           LINE 20 COL 60 . 
           05 FILLER PIC X VALUE ":" 
           LINE 20 COL 92 .
           05 FILLER PIC X(20) TO  CUD-LASTNAME
           LINE 20 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(31) VALUE "Date de naissance (AAAA-MM-JJ) " 
           LINE 22 COL 60 . 
           05 FILLER PIC X VALUE ":" 
           LINE 22 COL 92 .
           05 FILLER PIC X(2) TO  CUB-DAYS
           LINE 22 COL 133 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(1) VALUE "-"
           LINE 22 COL 132 AUTO 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(2) TO  CUB-MONTH
           LINE 22 COL 130 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(1) VALUE "-"
           LINE 22 COL 129 AUTO 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(4) TO  CUB-YEAR
           LINE 22 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(10) VALUE "RECHERCHER" 
           LINE 27 COL 60 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(1) TO  WS-SEARCH-VALIDATION
           LINE 27 COL 71
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           
          
           05 FILLER PIC X(70) FROM  WS-ERROR-MESSAGE
           LINE 29 COL 60 AUTO 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  "  " LINE 18 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE  19 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 20 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.                     

           05 FILLER PIC X(2) VALUE  "  " LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 31 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 32 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 
           
           05 FILLER PIC X(2) VALUE  "  " LINE 33 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 34 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(1) TO  WS-MENU-RETURN  
           COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(14) VALUE  "RETOUR AU MENU" 
           COL 172 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 35 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 36 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  "  " LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.
