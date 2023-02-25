
_main:

;relay.c,1 :: 		void main()
;relay.c,3 :: 		TRISB=0;
	CLRF       TRISB+0
;relay.c,4 :: 		portb=0;
	CLRF       PORTB+0
;relay.c,5 :: 		while(1)
L_main0:
;relay.c,7 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;relay.c,8 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;relay.c,9 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;relay.c,10 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;relay.c,11 :: 		}
	GOTO       L_main0
;relay.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
