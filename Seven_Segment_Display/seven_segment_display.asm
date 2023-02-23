
_main:

;seven_segment_display.c,3 :: 		void main()
;seven_segment_display.c,5 :: 		TRISB =0;
	CLRF       TRISB+0
;seven_segment_display.c,6 :: 		portb=0;
	CLRF       PORTB+0
;seven_segment_display.c,9 :: 		for(i=0;i<=10;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _i+0, 0
	SUBLW      10
L__main11:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;seven_segment_display.c,11 :: 		portb=a[i];
	MOVF       _i+0, 0
	ADDLW      _a+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_display.c,12 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;seven_segment_display.c,9 :: 		for(i=0;i<=10;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;seven_segment_display.c,13 :: 		}
	GOTO       L_main2
L_main3:
;seven_segment_display.c,14 :: 		for(i=8;i>=0;i--)
	MOVLW      8
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	SUBWF      _i+0, 0
L__main12:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;seven_segment_display.c,16 :: 		portb=a[i];
	MOVF       _i+0, 0
	ADDLW      _a+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_display.c,17 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;seven_segment_display.c,14 :: 		for(i=8;i>=0;i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;seven_segment_display.c,18 :: 		}
	GOTO       L_main6
L_main7:
;seven_segment_display.c,19 :: 		portb=0;
	CLRF       PORTB+0
;seven_segment_display.c,21 :: 		}
L_main1:
;seven_segment_display.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
