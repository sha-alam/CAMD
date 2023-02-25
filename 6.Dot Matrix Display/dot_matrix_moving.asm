
_main:

;dot_matrix_moving.c,5 :: 		void main() {
;dot_matrix_moving.c,6 :: 		TRISB=0x00;
	CLRF       TRISB+0
;dot_matrix_moving.c,7 :: 		TRISD=0x00;
	CLRF       TRISD+0
;dot_matrix_moving.c,8 :: 		while(1){
L_main0:
;dot_matrix_moving.c,9 :: 		for(xx=0;xx<8;xx++){
	CLRF       _xx+0
	CLRF       _xx+1
L_main2:
	MOVLW      128
	XORWF      _xx+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      8
	SUBWF      _xx+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;dot_matrix_moving.c,10 :: 		for(zx=0;zx<30;zx++){
	CLRF       _zx+0
	CLRF       _zx+1
L_main5:
	MOVLW      128
	XORWF      _zx+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      30
	SUBWF      _zx+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;dot_matrix_moving.c,11 :: 		for(i=0;i<8;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main8:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      8
	SUBWF      _i+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;dot_matrix_moving.c,12 :: 		PORTD=j[i];
	MOVF       _i+0, 0
	ADDLW      _j+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dot_matrix_moving.c,13 :: 		PORTB=a[i]<<xx;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _a+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       _xx+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main17:
	BTFSC      STATUS+0, 2
	GOTO       L__main18
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main17
L__main18:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;dot_matrix_moving.c,14 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;dot_matrix_moving.c,11 :: 		for(i=0;i<8;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dot_matrix_moving.c,15 :: 		}
	GOTO       L_main8
L_main9:
;dot_matrix_moving.c,10 :: 		for(zx=0;zx<30;zx++){
	INCF       _zx+0, 1
	BTFSC      STATUS+0, 2
	INCF       _zx+1, 1
;dot_matrix_moving.c,16 :: 		}
	GOTO       L_main5
L_main6:
;dot_matrix_moving.c,9 :: 		for(xx=0;xx<8;xx++){
	INCF       _xx+0, 1
	BTFSC      STATUS+0, 2
	INCF       _xx+1, 1
;dot_matrix_moving.c,17 :: 		}
	GOTO       L_main2
L_main3:
;dot_matrix_moving.c,18 :: 		delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
;dot_matrix_moving.c,20 :: 		}
	GOTO       L_main0
;dot_matrix_moving.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
