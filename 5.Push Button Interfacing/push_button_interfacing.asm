
_main:

;push_button_interfacing.c,2 :: 		void main()
;push_button_interfacing.c,4 :: 		int flag=0;
	CLRF       main_flag_L0+0
	CLRF       main_flag_L0+1
;push_button_interfacing.c,5 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;push_button_interfacing.c,6 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;push_button_interfacing.c,7 :: 		while(1)
L_main0:
;push_button_interfacing.c,9 :: 		if(portd.f0 == 1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;push_button_interfacing.c,11 :: 		delay_ms(200);
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
;push_button_interfacing.c,12 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;push_button_interfacing.c,14 :: 		if(flag==0)
	MOVLW      0
	XORWF      main_flag_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	XORWF      main_flag_L0+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;push_button_interfacing.c,15 :: 		flag=1;
	MOVLW      1
	MOVWF      main_flag_L0+0
	MOVLW      0
	MOVWF      main_flag_L0+1
	GOTO       L_main6
L_main5:
;push_button_interfacing.c,17 :: 		flag=0;
	CLRF       main_flag_L0+0
	CLRF       main_flag_L0+1
L_main6:
;push_button_interfacing.c,18 :: 		}
L_main4:
;push_button_interfacing.c,19 :: 		}
L_main2:
;push_button_interfacing.c,20 :: 		if(flag==0)
	MOVLW      0
	XORWF      main_flag_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      main_flag_L0+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;push_button_interfacing.c,21 :: 		portb.f0=0;
	BCF        PORTB+0, 0
	GOTO       L_main8
L_main7:
;push_button_interfacing.c,23 :: 		portb.f0=1;
	BSF        PORTB+0, 0
L_main8:
;push_button_interfacing.c,25 :: 		}
	GOTO       L_main0
;push_button_interfacing.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
