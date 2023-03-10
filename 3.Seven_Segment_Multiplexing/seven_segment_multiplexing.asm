
_main:

;seven_segment_multiplexing.c,3 :: 		void main()
;seven_segment_multiplexing.c,5 :: 		TRISB = 0; TRISD = 0x00; TRISC = 0xff;
	CLRF       TRISB+0
	CLRF       TRISD+0
	MOVLW      255
	MOVWF      TRISC+0
;seven_segment_multiplexing.c,6 :: 		portb = 0; portc = 0;
	CLRF       PORTB+0
	CLRF       PORTC+0
;seven_segment_multiplexing.c,8 :: 		while(1)
L_main0:
;seven_segment_multiplexing.c,10 :: 		for(i=0;i<25;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      25
	SUBWF      _i+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;seven_segment_multiplexing.c,11 :: 		portb=segment[j/10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      _segment+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_multiplexing.c,12 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;seven_segment_multiplexing.c,13 :: 		delay_ms(1);
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
;seven_segment_multiplexing.c,14 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;seven_segment_multiplexing.c,16 :: 		portb=segment[(j%10)];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _segment+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_multiplexing.c,17 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;seven_segment_multiplexing.c,18 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;seven_segment_multiplexing.c,19 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;seven_segment_multiplexing.c,10 :: 		for(i=0;i<25;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;seven_segment_multiplexing.c,21 :: 		}
	GOTO       L_main2
L_main3:
;seven_segment_multiplexing.c,23 :: 		if(portc.f6==1){
	BTFSS      PORTC+0, 6
	GOTO       L_main7
;seven_segment_multiplexing.c,24 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;seven_segment_multiplexing.c,25 :: 		if(portc.f6==1){
	BTFSS      PORTC+0, 6
	GOTO       L_main9
;seven_segment_multiplexing.c,26 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;seven_segment_multiplexing.c,27 :: 		}
L_main9:
;seven_segment_multiplexing.c,28 :: 		}
L_main7:
;seven_segment_multiplexing.c,29 :: 		if(portc.f7==1){
	BTFSS      PORTC+0, 7
	GOTO       L_main10
;seven_segment_multiplexing.c,30 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;seven_segment_multiplexing.c,31 :: 		if(portc.f7==1){
	BTFSS      PORTC+0, 7
	GOTO       L_main12
;seven_segment_multiplexing.c,32 :: 		j--;
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;seven_segment_multiplexing.c,33 :: 		}
L_main12:
;seven_segment_multiplexing.c,34 :: 		}
L_main10:
;seven_segment_multiplexing.c,35 :: 		if(j<0||j>99) j=0;
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      0
	SUBWF      _j+0, 0
L__main19:
	BTFSS      STATUS+0, 0
	GOTO       L__main16
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       _j+0, 0
	SUBLW      99
L__main20:
	BTFSS      STATUS+0, 0
	GOTO       L__main16
	GOTO       L_main15
L__main16:
	CLRF       _j+0
	CLRF       _j+1
L_main15:
;seven_segment_multiplexing.c,37 :: 		}
	GOTO       L_main0
;seven_segment_multiplexing.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
