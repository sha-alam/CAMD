
_InitMain:

;pwm.c,3 :: 		void InitMain() {
;pwm.c,6 :: 		}
L_end_InitMain:
	RETURN
; end of _InitMain

_main:

;pwm.c,8 :: 		void main() {
;pwm.c,10 :: 		trisd=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;pwm.c,11 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;pwm.c,12 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;pwm.c,13 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;pwm.c,14 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,15 :: 		current_duty  = 0;
	CLRF       _current_duty+0
;pwm.c,18 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;pwm.c,19 :: 		PWM1_Set_Duty(current_duty);        // Set current duty for PWM1
	MOVF       _current_duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,21 :: 		while (1) {
L_main0:
;pwm.c,22 :: 		if (portd.f0==1 && current_duty<255) {
	BTFSS      PORTD+0, 0
	GOTO       L_main4
	MOVLW      255
	SUBWF      _current_duty+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main12:
;pwm.c,23 :: 		Delay_ms(100);
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
;pwm.c,24 :: 		current_duty+=10;
	MOVLW      10
	ADDWF      _current_duty+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _current_duty+0
;pwm.c,25 :: 		PWM1_Set_Duty(current_duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,26 :: 		}
L_main4:
;pwm.c,28 :: 		if (portd.f1==1 && current_duty>0) {
	BTFSS      PORTD+0, 1
	GOTO       L_main8
	MOVF       _current_duty+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main11:
;pwm.c,29 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;pwm.c,30 :: 		current_duty-=10;
	MOVLW      10
	SUBWF      _current_duty+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _current_duty+0
;pwm.c,31 :: 		PWM1_Set_Duty(current_duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,32 :: 		}
L_main8:
;pwm.c,35 :: 		Delay_ms(10);                      // slow down change pace a little
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;pwm.c,36 :: 		}
	GOTO       L_main0
;pwm.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
