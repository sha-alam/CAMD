
_main:

;dot_matrix_moving.c,11 :: 		void main() {
;dot_matrix_moving.c,12 :: 		TRISB=0x00;
	CLRF       TRISB+0
;dot_matrix_moving.c,13 :: 		TRISD=0x00;
	CLRF       TRISD+0
;dot_matrix_moving.c,14 :: 		while(1){
L_main0:
;dot_matrix_moving.c,15 :: 		for(x=0;x<5;x++){
	CLRF       _x+0
	CLRF       _x+1
L_main2:
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      5
	SUBWF      _x+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;dot_matrix_moving.c,16 :: 		for(xx=0;xx<8;xx++){
	CLRF       _xx+0
	CLRF       _xx+1
L_main5:
	MOVLW      128
	XORWF      _xx+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      8
	SUBWF      _xx+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;dot_matrix_moving.c,17 :: 		for(zx=0;zx<80;zx++){
	CLRF       _zx+0
	CLRF       _zx+1
L_main8:
	MOVLW      128
	XORWF      _zx+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      80
	SUBWF      _zx+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;dot_matrix_moving.c,18 :: 		for(i=0;i<8;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main11:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      8
	SUBWF      _i+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;dot_matrix_moving.c,19 :: 		PORTD=j[i];
	MOVF       _i+0, 0
	ADDLW      _j+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dot_matrix_moving.c,20 :: 		PORTB=a[x][i]<<xx;
	MOVLW      4
	MOVWF      R2+0
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main21:
	BTFSC      STATUS+0, 2
	GOTO       L__main22
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main21
L__main22:
	MOVF       R0+0, 0
	ADDLW      _a+0
	MOVWF      R3+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       _xx+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main23:
	BTFSC      STATUS+0, 2
	GOTO       L__main24
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main23
L__main24:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;dot_matrix_moving.c,21 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;dot_matrix_moving.c,18 :: 		for(i=0;i<8;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dot_matrix_moving.c,22 :: 		}
	GOTO       L_main11
L_main12:
;dot_matrix_moving.c,17 :: 		for(zx=0;zx<80;zx++){
	INCF       _zx+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zx+1, 1
;dot_matrix_moving.c,23 :: 		}
	GOTO       L_main8
L_main9:
;dot_matrix_moving.c,16 :: 		for(xx=0;xx<8;xx++){
	INCF       _xx+0, 1
	BTFSC      STATUS+0, 2
	INCF       _xx+1, 1
;dot_matrix_moving.c,24 :: 		}
	GOTO       L_main5
L_main6:
;dot_matrix_moving.c,25 :: 		delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
;dot_matrix_moving.c,15 :: 		for(x=0;x<5;x++){
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;dot_matrix_moving.c,26 :: 		}
	GOTO       L_main2
L_main3:
;dot_matrix_moving.c,27 :: 		}
	GOTO       L_main0
;dot_matrix_moving.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
