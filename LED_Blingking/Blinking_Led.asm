
_main:

;Blinking_Led.c,1 :: 		void main() {
;Blinking_Led.c,2 :: 		TRISB = 0;
	CLRF       TRISB+0
;Blinking_Led.c,3 :: 		while(1)
L_main0:
;Blinking_Led.c,5 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;Blinking_Led.c,6 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;Blinking_Led.c,7 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;Blinking_Led.c,8 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;Blinking_Led.c,9 :: 		}
	GOTO       L_main0
;Blinking_Led.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
