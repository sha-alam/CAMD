
_main:

;push_button_interfacing.c,2 :: 		void main()
;push_button_interfacing.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;push_button_interfacing.c,5 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;push_button_interfacing.c,6 :: 		while(1)
L_main0:
;push_button_interfacing.c,8 :: 		if(portd.f0 == 1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;push_button_interfacing.c,10 :: 		delay_ms(200);
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
;push_button_interfacing.c,11 :: 		if(portd.f0 ==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;push_button_interfacing.c,13 :: 		if(flag==0){
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;push_button_interfacing.c,14 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
;push_button_interfacing.c,15 :: 		eeprom_write(0x01,1);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;push_button_interfacing.c,16 :: 		}
	GOTO       L_main6
L_main5:
;push_button_interfacing.c,18 :: 		flag=0;
	CLRF       _flag+0
;push_button_interfacing.c,19 :: 		eeprom_write(0x01,0);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;push_button_interfacing.c,20 :: 		}
L_main6:
;push_button_interfacing.c,21 :: 		}
L_main4:
;push_button_interfacing.c,22 :: 		}
L_main2:
;push_button_interfacing.c,23 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;push_button_interfacing.c,24 :: 		rom=eeprom_read(0x01);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _rom+0
;push_button_interfacing.c,26 :: 		if(rom==0)
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;push_button_interfacing.c,27 :: 		portb.f0=0;
	BCF        PORTB+0, 0
	GOTO       L_main9
L_main8:
;push_button_interfacing.c,29 :: 		portb.f0=1;
	BSF        PORTB+0, 0
L_main9:
;push_button_interfacing.c,30 :: 		}
	GOTO       L_main0
;push_button_interfacing.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
