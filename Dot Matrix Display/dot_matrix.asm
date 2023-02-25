
_main:

;dot_matrix.c,4 :: 		void main() {
;dot_matrix.c,5 :: 		TRISB=0x00;
	CLRF       TRISB+0
;dot_matrix.c,6 :: 		TRISD=0x00;
	CLRF       TRISD+0
;dot_matrix.c,7 :: 		while(1){
L_main0:
;dot_matrix.c,8 :: 		for(i=0;i<8;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      8
	SUBWF      _i+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;dot_matrix.c,9 :: 		PORTD=j[i];
	MOVF       _i+0, 0
	ADDLW      _j+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dot_matrix.c,10 :: 		PORTB=k[i];
	MOVF       _i+0, 0
	ADDLW      _k+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;dot_matrix.c,11 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;dot_matrix.c,8 :: 		for(i=0;i<8;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dot_matrix.c,12 :: 		}
	GOTO       L_main2
L_main3:
;dot_matrix.c,13 :: 		}
	GOTO       L_main0
;dot_matrix.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
