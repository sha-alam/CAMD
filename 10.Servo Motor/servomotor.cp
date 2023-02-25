#line 1 "E:/Course/3-1/Microcontroler/Lab/10.Servo Motor/servomotor.c"
void servorotate0(){
 unsigned int i;
 for(i=0;i<50;i++){
 PORTB.f0=1;
 delay_us(1000);
 PORTB.f0=0;
 delay_us(19000);
 }
}
void servorotate90(){
 unsigned int i;
 for(i=0;i<50;i++){
 PORTB.f0=1;
 delay_us(1500);
 PORTB.f0=0;
 delay_us(18500);
 }
}
void servorotate180(){
 unsigned int i;
 for(i=0;i<50;i++){
 PORTB.f0=1;
 delay_us(2200);
 PORTB.f0=0;
 delay_us(17800);
 }
}
void main() {
 TRISB=0;
 do{
 servorotate0();
 delay_ms(2000);
 servorotate90();
 delay_ms(2000);
 servorotate180();
 delay_ms(2000);
 }while(1);
}
