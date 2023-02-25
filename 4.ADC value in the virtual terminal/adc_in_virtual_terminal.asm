
_main:

;adc_in_virtual_terminal.c,3 :: 		void main() {
;adc_in_virtual_terminal.c,4 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;adc_in_virtual_terminal.c,5 :: 		ADC_Init();
	CALL       _ADC_Init+0
;adc_in_virtual_terminal.c,6 :: 		while(1){
L_main0:
;adc_in_virtual_terminal.c,7 :: 		valadc = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valadc+0
	MOVF       R0+1, 0
	MOVWF      _valadc+1
;adc_in_virtual_terminal.c,8 :: 		InttoStr(valadc,x);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;adc_in_virtual_terminal.c,9 :: 		UART1_Write_Text("Analog Value is = ");
	MOVLW      ?lstr1_adc_in_virtual_terminal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;adc_in_virtual_terminal.c,10 :: 		UART1_Write_Text(x);
	MOVLW      _x+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;adc_in_virtual_terminal.c,11 :: 		strcpy(x,"");
	MOVLW      _x+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr2_adc_in_virtual_terminal+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;adc_in_virtual_terminal.c,12 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_in_virtual_terminal.c,13 :: 		delay_ms(500);
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
;adc_in_virtual_terminal.c,14 :: 		}
	GOTO       L_main0
;adc_in_virtual_terminal.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
