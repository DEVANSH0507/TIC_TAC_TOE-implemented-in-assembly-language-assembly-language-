.MODEL SMALL
.STACK 500H
.DATA                                                                                                                                    
T1 DB 35,35,35,35,35,32,35,35,35,35,35,32,35,35,35,35,35,32,32,35,35,35,35,35,32,35,35,35,35,35,32,35,35,35,35,35,32,32,35,35,35,35,35,32,35,35,35,35,35,32,35,35,35,35,35,'$'
T2 DB 32,32,35,32,32,32,32,32,35,32,32,32,35,32,32,32,32,32,32,32,32,35,32,32,32,35,32,32,32,35,32,35,32,32,32,32,32,32,32,32,35,32,32,32,35,32,32,32,35,32,35,32,32,32,32,'$'  
T3 DB 32,32,35,32,32,32,32,32,35,32,32,32,35,32,32,32,32,32,32,32,32,35,32,32,32,35,35,35,35,35,32,35,32,32,32,32,32,32,32,32,35,32,32,32,35,32,32,32,35,32,35,35,35,35,35,'$'
T4 DB 32,32,35,32,32,32,32,32,35,32,32,32,35,32,32,32,32,32,32,32,32,35,32,32,32,35,32,32,32,35,32,35,32,32,32,32,32,32,32,32,35,32,32,32,35,32,32,32,35,32,35,32,32,32,32,'$' 
T5 DB 32,32,35,32,32,32,35,35,35,35,35,32,35,35,35,35,35,32,32,32,32,35,32,32,32,35,32,32,32,35,32,35,35,35,35,35,32,32,32,32,35,32,32,32,35,35,35,35,35,32,35,35,35,35,35,'$'  

DEVELOPER DB 'Devloped By Group 7$'
PAK DB 'Press any key to continue......$'    


;RULES OF GAME--------------------------------------------------------------------------------------------------------

R  DB '                    RULES OF THE GAME$'
R1 DB '1.THIS IS A TWO PLAYER GAME.$' 
R2 DB '2.PLAYER 1 WILL START THE GAME WITH (X)$'
R3 DB '3.PLAYER 2 WILL PUT (O) AFTER PLAYER 1$'
R4 DB '4.TO PLAY YOU SHOULD CHOOSE CELL NO. BETWEEN 1 TO 9$'   
R5 DB '5.TO WIN SET THREE OF A ONE KIND HORIZONTALLY,VERTICALLY OR DIAGONALLY$' 
R6 DB '6.DO NOT CHOOSE SAME CELL AGAIN  $'
R7 DB '7.GOOD LUCK FOR THE GAMES,PLAY WELL$' 

;----------------------------PLAYERS

PLAYER DB 49
SYM DB 88
MOVES DB 00 
WN DB 00
DR DB 00 
WG DB 00  

;--------------MESSAGES------------------------

WINMSG1 DB 'PLAYER 1 HAS WIN$'
WINMSG2 DB 'PLAYER 2 HAS WIN$'
WRONGINP DB 'WRONG INPUT ! ENTER AGAIN CELL NO.$' 
TRY DB 'DO YOU WANT TO PLAY AGAIN (Y/N)$'   
DRW DB 'GAME IS  DRAW$'
ENTER DB 'ENTER ANY CELL NO.$'        

;------------------------------CELLS---------------------
C1 DB '1$' 
C2 DB '2$'
C3 DB '3$'
C4 DB '4$'
C5 DB '5$'
C6 DB '6$'
C7 DB '7$'
C8 DB '8$'
C9 DB '9$' 

;---------------------------------------BOARD------------------------

L1 DB '   |   |   $'
L2 DB '-----------$'
N1 DB ' | $'

;-----------------------

 
NEWLINE DB 10,13,"$"
.CODE  
MAIN PROC    
      MOV AX,@DATA
      MOV DS,AX
      
      ;-----------------------------------------MAKING The Tittle Screen-----------------------------------------------------------------------------------------
     
TITTLESCREEN:
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,05H;ROW
      MOV DL,09H;COLOUM    
      INT 10H
      
      LEA DX,T1
      MOV AH,09H
      INT 21H  
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,06H;ROW
      MOV DL,09H;COLOUM
      INT 10H
      
      LEA DX,T2
      MOV AH,09H
      INT 21H  
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,07H;ROW
      MOV DL,09H;COLOUM
      INT 10H
      
      LEA DX,T3
      MOV AH,09H
      INT 21H   
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,08H;ROW
      MOV DL,09H;COLOUM
      INT 10H
      
      LEA DX,T4
      MOV AH,09H
      INT 21H  
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,09H;ROW
      MOV DL,09H;COLOUM
      INT 10H
      
      LEA DX,T5
      MOV AH,09H
      INT 21H    
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,10H;ROW
      MOV DL,15H;COLOUM
      INT 10H
      
      LEA DX,DEVELOPER
      MOV AH,09H
      INT 21H 
      
      MOV AH,02H;func 2 of int 10h is to select cursor operations
      MOV BH,00H;PAGE NO
      MOV DH,11H;ROW
      MOV DL,15H;COLOUM
      INT 10H
      
      LEA DX,PAK
      MOV AH,09H
      INT 21H  
      
      MOV AH,07  ;INPUT WITHOUT SHOW(ECHO) 
      INT 21H   
      
      ;CLEARING THE SCREEN ----------------------------------------------------------------------------
      
      MOV AH, 06H   ;  scroll the screen up
      MOV AL, 0     ; Number of lines to scroll (0 for entire screen)
      MOV BH, 07H   ; COLOUR
      MOV CX, 0     ; STARTING ROW AND COLOUM
      MOV DX, 184FH ; END ROW AND COLOUM{25X80
      INT 10H    
      
      ;-----------------------------------------------------------------------------------------------------
      
      JMP RULES   
      
       ;----------------------------------TITTLE SCREEN COMPLETED----------------------------------------------------------------------------
     
      
      
      ;-----------------------------------------VICTORY_CHECK----------------------------------------------------
VICTORYCHK:MOV AL,C1
         CMP AL,C2
        JZ CHK1
  Z:    MOV AL,C4
        CMP AL,C5  
        JZ CHK2
  X:    MOV AL,C7
        CMP AL,C8
        JZ CHK3
  C:    MOV AL,C1
        CMP AL,C4
        JZ CHK4
  V:    MOV AL,C2
        CMP AL,C5
        JZ CHK5
  B:    MOV AL,C3
        CMP AL,C6
        JZ CHK6
  N:    MOV AL,C1 
        CMP AL,C5
        JZ CHK7
  M:    MOV AL,C3
        CMP AL,C5 
        JZ CHK8 
        JMP DW
      
      CHK1:CMP AL,C3 
           JNZ Z
           MOV WN,01
           JMP QWERTY
      CHK2:CMP AL,C6  
           JNZ X
           MOV WN,01
          JMP QWERTY
      CHK3:CMP AL,C9
           JNZ C
           MOV WN,01
           JMP QWERTY
      CHK4:CMP AL,C7
           JNZ V
           MOV WN,01
           JMP QWERTY
      CHK5:CMP AL,C8
           JNZ B
           MOV WN,01
          JMP QWERTY
      CHK6:CMP AL,C9
           JNZ N
           MOV WN,01
           JMP QWERTY
      CHK7:CMP AL,C9
           JNZ M
           MOV WN,01
           JMP QWERTY
      CHK8:CMP AL,C7 
           JNZ DW
           MOV WN,01
           JMP QWERTY
      
      ;---DRAW CHECKING---
      
    DW:MOV AL,MOVES
       CMP AL,09H
       JNZ QWERTY
       MOV DR,01
QWERTY:RET   
         
    ;----------------------VICTORY CHECK END------------------------------------ 
      
      
    ;------------------------DRAW --------------------------------------   
    DRAW:  LEA DX,DRW
           MOV AH,09
           INT 21H
           
          JMP CHKP
      
    ;-------------------------PLAYER CHANGE--------------------------------------  
    
PLAYERCHANGE:   CMP PLAYER,49
                JZ PC1
                CMP PLAYER,50
                JZ PC2
    
                PC1:MOV PLAYER,50
                MOV SYM,79
                JMP Q
        
                PC2:MOV PLAYER,49
                MOV SYM,88    
    
               Q: RET
                
    ;----------------------PLAYER CHANGE END-----------------------------------------   
    
    
    ;-----------------------WIN CONDITIONS---------------------------------------------
    
WIN:    CMP PLAYER,49
        JZ P1W
    CMP PLAYER,50
        JZ P2W
    
    P1W: LEA DX,WINMSG2
         MOV AH,09
         INT 21H
         JMP TRYAGAIN
         
    P2W: LEA DX,WINMSG1
         MOV AH,09
         INT 21H
         JMP TRYAGAIN
 CHKP:         
         
 TRYAGAIN: MOV AH, 2     ; SET CURSOR
           MOV DH, 17
           MOV DL, 20 
           INT 10H 
        
        
        LEA DX,TRY
          MOV AH,09
          INT 21H
          
           MOV AH, 1     
           INT 21H
           
           CMP AL, 121  ; CHECK IF INPUT IS 'y'
           JZ INIT 
        
           CMP AL, 89   ; CHECK IF INPUT IS 'Y'
           JZ INIT
        
           ; IF INPUT IS 'Y'/'y' THEN REPEAT THE GAME
        
           CMP AL, 110  ; CHECK IF INPUT IS 'n'
           JZ EXIT
           CMP AL, 78   ; CHECK IF INPUT IS 'N'
           JZ EXIT  

   ;--------------------WIN CONDITIONS END------------------------------------------------------------     
   
   
   ;----------------------------------WRONG INPUT-----------------------------------------------------
   
   WNGINP:  MOV WG,01
            JMP BOARD
   
   
   WNGINPP:MOV WG,00
           LEA DX,WRONGINP
           MOV AH,09
           INT 21H 
    
           MOV AH,01            
           INT 21h  
           
           JMP CELLCOMP 
           

      
      
     
      ; ---------------------------------RULES DISPLAYING----------------------------------------------------------------------------------
     RULES:
            
            MOV AH, 2
            MOV BH, 0
            MOV DH, 3
            MOV DL, 7
            INT 10H
        
        LEA DX, R
        MOV AH, 9
        INT 21H
        

            
            MOV AH, 2
            MOV DH, 7
            MOV DL, 7
            INT 10H 
        
        
        LEA DX, R1   ; RULE 1
        MOV AH, 9
        INT 21H 
        

             
            MOV AH, 2
            MOV DH, 8
            MOV DL, 7
            INT 10H 
        
        LEA DX, R2   ; RULE 2
        MOV AH, 9
        INT 21H
        

           
            MOV AH, 2
            MOV DH, 9
            MOV DL, 7
            INT 10H 
        
        
        LEA DX, R3   ; RULE 3
        MOV AH, 9
        INT 21H
        

           
            MOV AH, 2
            MOV DH, 10
            MOV DL, 7
            INT 10H
        
        
        LEA DX, R4   ; RULE 4
        MOV AH, 9
        INT 21H
        
  
            
            MOV AH, 2
            MOV DH, 11
            MOV DL, 7
            INT 10H      
            
        
        LEA DX, R5  ; RULE 5
        MOV AH, 9
        INT 21H
        
            
            
            MOV AH, 2
            MOV DH, 12
            MOV DL, 7
            INT 10H
            
            
        LEA DX, R6
        MOV AH, 9
        INT 21H
           
           
            MOV AH, 2
            MOV DH, 13
            MOV DL, 7
            INT 10H
             
       LEA DX, R7
       MOV AH, 9
       INT 21H
            
            
            MOV AH, 2
            MOV DH, 15
            MOV DL, 7
            INT 10H     
        
        LEA DX, PAK ; PRESS ANY KEY
        MOV AH, 9
        INT 21H
        
        MOV AH, 7   ; INPUT WITHOUT ECHO
        INT 21H 
       ;------------------------------------------------ DISPLAY GAME RULES END --------------------------------      
       
;----------------------------------RETURNING FOR TRY AGAIN------------------------------------------------------

INIT:       MOV PLAYER,49     ; INITIALIZING ALL VARIABLES
            MOV MOVES,0  
            MOV DR, 0
            MOV SYM,88
            MOV WN,00
            
            MOV C1, 49
            MOV C2, 50
            MOV C3, 51
            MOV C4, 52
            MOV C5, 53
            MOV C6, 54
            MOV C7, 55
            MOV C8, 56
            MOV C9, 57



;------------------------------------END RETURNING--------------------------------------------       
       
       
; ------------- BOARD ----------   
    BOARD: 
    
         ;CLEARING THE SCREEN ----------------------------------------------------------------------------
      
      MOV AH, 06H   ;  scroll the screen up
      MOV AL, 0     ; Number of lines to scroll (0 for entire screen)
      MOV BH, 07H   ; COLOUR
      MOV CX, 0     ; STARTING ROW AND COLOUM
      MOV DX, 184FH ; END ROW AND COLOUM{25X80
      INT 10H    
    
        ; SET CURSOR
        MOV AH, 2
        MOV BH, 0
        MOV DH, 6
        MOV DL, 30
        INT 10H   
        
    LEA DX, L1
    MOV AH, 9
    INT 21H 
     
        ; SET CURSOR 
        MOV AH, 2
        MOV DH, 7
        MOV DL, 30 
        INT 10H
    
    MOV AH, 2
    MOV DL, 32
    INT 21H

; --------------------------------    
    ; CELL 1 
    
    LEA DX, C1
    MOV AH, 9
    INT 21H 
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 2
    
    LEA DX, C2
    MOV AH, 9
    INT 21H
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 3
    
    LEA DX, C3
    MOV AH, 9
    INT 21H
    
; ---------------------------------    
    

        ; SET CURSOR
        MOV AH, 2
        MOV DH, 8
        MOV DL, 30 
        INT 10H 
     
    
    LEA DX, L2
    MOV AH, 9
    INT 21H 
    

        ; SET CURSOR
        MOV AH, 2
        MOV DH, 9
        MOV DL, 30 
        INT 10H
    
    LEA DX, L1
    MOV AH, 9
    INT 21H 
    
        ; SET CURSOR
        MOV AH, 2
        MOV DH, 10
        MOV DL, 30 
        INT 10H
    
    MOV AH, 2
    MOV DL, 32
    INT 21H
    
; --------------------------------    
    ; CELL 4 
    
    LEA DX, C4
    MOV AH, 9
    INT 21H 
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 5
    
    LEA DX, C5
    MOV AH, 9
    INT 21H
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 6
    
    LEA DX, C6
    MOV AH, 9
    INT 21H
    
; ---------------------------------     

        ; SET CURSOR
        MOV AH, 2
        MOV DH, 11
        MOV DL, 30 
        INT 10H
        
    LEA DX, L1
    MOV AH, 9
    INT 21H 
 
        ; SET CURSOR
        MOV AH, 2
        MOV DH, 12
        MOV DL, 30 
        INT 10H 
     
    
    LEA DX, L2
    MOV AH, 9
    INT 21H 
    

        ; SET CURSOR
        MOV AH, 2
        MOV DH, 13
        MOV DL, 30 
        INT 10H
    
    LEA DX, L1
    MOV AH, 9
    INT 21H 
    

        ; SET CURSOR
        MOV AH, 2
        MOV DH, 14
        MOV DL, 30 
        INT 10H 
    
    MOV AH, 2
    MOV DL, 32
    INT 21H   
    
         
; --------------------------------    
    ; CELL 4 
    
    LEA DX, C7
    MOV AH, 9
    INT 21H 
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 5
    
    LEA DX, C8
    MOV AH, 9
    INT 21H
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 6
    
    LEA DX, C9
    MOV AH, 9
    INT 21H
    
; ---------------------------------     

        ; SET CURSOR
        MOV AH, 2
        MOV DH, 15
        MOV DL, 30 
        INT 10H 
     
    
    LEA DX, L1
    MOV AH, 9
    INT 21H  
    
    ; SET CURSOR 
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H 
     
   CMP WN,01
   JZ WIN
   CMP DR,01
   JZ DRAW    
   CMP WG,01
   JZ WNGINPP 
    
    
    
     
; ------------ END OF BOARD ------- 

;---------------------INPUT DATA------------------------



LEA DX,ENTER
    MOV AH,09
    INT 21H 
    
    MOV AH,01            
    INT 21h                
    

;-------------------------INPUT ENDS---------------------------------------------
;--------------------------------------------CELL COMPARE----------------------------------


CELLCOMP:  CMP AL,C1
JZ C1C
CMP AL,C2
JZ C2C
CMP AL,C3
JZ C3C
CMP AL,C4
JZ C4C
CMP AL,C5
JZ C5C
CMP AL,C6
JZ C6C
CMP AL,C7
JZ C7C
CMP AL,C8
JZ C8C
CMP AL,C9
JZ C9C

JMP WNGINP

C1C:INC MOVES 
MOV AL,SYM
MOV C1,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD          


C2C:INC MOVES 
MOV AL,SYM
MOV C2,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD 


C3C:INC MOVES 
MOV AL,SYM
MOV C3,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD  


C4C:INC MOVES 
MOV AL,SYM
MOV C4,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD 


C5C:INC MOVES 
MOV AL,SYM
MOV C5,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD 


C6C:INC MOVES 
MOV AL,SYM
MOV C6,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD 


C7C:INC MOVES 
MOV AL,SYM
MOV C7,AL
 CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD 


C8C:INC MOVES 
MOV AL,SYM
MOV C8,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD  


C9C:INC MOVES 
MOV AL,SYM
MOV C9,AL
CALL VICTORYCHK
CALL PLAYERCHANGE
     JMP BOARD  

;------------------------------------------EXITING-----------------------------

 
 EXIT:
    MOV AH, 4CH
    INT 21H 

      

END MAIN




