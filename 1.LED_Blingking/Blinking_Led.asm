
_main:

;Blinking_Led.c,1 :: 		void main()
;Blinking_Led.c,3 :: 		TRISB = 0;
	CLRF       TRISB+0
;Blinking_Led.c,4 :: 		while(1)
L_main0:
;Blinking_Led.c,6 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;Blinking_Led.c,7 :: 		delay_ms(200);
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
;Blinking_Led.c,8 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;Blinking_Led.c,9 :: 		delay_ms(200);
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
;Blinking_Led.c,10 :: 		}
	GOTO       L_main0
;Blinking_Led.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
