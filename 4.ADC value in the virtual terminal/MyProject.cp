#line 1 "E:/Course/3-1/Microcontroler/Lab/ADC value in the virtual terminal/MyProject.c"
int valadc;
char x[4];
void main() {
 UART1_Init(9600);
 ADC_Init();
 while(1){
 valadc = ADC_Read(0);
 InttoStr(valadc,x);
 UART1_Write_Text("Analog Value = ");
 UART1_Write_Text(x);
 strcpy(x,"");
 UART1_Write(13);
 delay_ms(1000);
 }
}
