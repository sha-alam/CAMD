
_main:

;pwm.c,2 :: 		void main() {
;pwm.c,3 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;pwm.c,4 :: 		TRISB=0x00;
	CLRF       TRISB+0
;pwm.c,5 :: 		PORTB.f0=0xff;
	BSF        PORTB+0, 0
;pwm.c,6 :: 		PORTB.f1=0x00;
	BCF        PORTB+0, 1
;pwm.c,7 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,8 :: 		PWM1_start();
	CALL       _PWM1_Start+0
;pwm.c,9 :: 		PWM1_set_duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,10 :: 		while(1){
L_main0:
;pwm.c,11 :: 		if(RD0_bit && duty<250){
	BTFSS      RD0_bit+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _duty+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      250
	SUBWF      _duty+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main20:
;pwm.c,12 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;pwm.c,13 :: 		if(RD0_bit && duty<250){
	BTFSS      RD0_bit+0, 0
	GOTO       L_main8
	MOVLW      128
	XORWF      _duty+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      250
	SUBWF      _duty+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main19:
;pwm.c,14 :: 		duty=duty+10;
	MOVLW      10
	ADDWF      _duty+0, 0
	MOVWF      R0+0
	MOVF       _duty+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _duty+0
	MOVF       R0+1, 0
	MOVWF      _duty+1
;pwm.c,15 :: 		PWM1_set_duty(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,16 :: 		}
L_main8:
;pwm.c,17 :: 		}
L_main4:
;pwm.c,18 :: 		if(RD0_bit && duty>0){
	BTFSS      RD0_bit+0, 0
	GOTO       L_main11
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _duty+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVF       _duty+0, 0
	SUBLW      0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
L__main18:
;pwm.c,19 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;pwm.c,20 :: 		if(RD0_bit && duty>0){
	BTFSS      RD0_bit+0, 0
	GOTO       L_main15
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _duty+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       _duty+0, 0
	SUBLW      0
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
L__main17:
;pwm.c,21 :: 		duty=duty-10;
	MOVLW      10
	SUBWF      _duty+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _duty+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _duty+0
	MOVF       R0+1, 0
	MOVWF      _duty+1
;pwm.c,22 :: 		PWM1_set_duty(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,23 :: 		}
L_main15:
;pwm.c,24 :: 		}
L_main11:
;pwm.c,25 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;pwm.c,26 :: 		}
	GOTO       L_main0
;pwm.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
