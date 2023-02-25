char i=0;
char mov[]={0b00000111,0b00000011,0b00000010,0b00000110,0b00000100,0b00001100,0b00001000,0b00001001};
void main() {
     TRISB=0;
     PORTB=0x0f;
     while(1){
         PORTB=mov[i];
         delay_ms(500);
         i++;
         if(i>7){
             i=0;
         }
     }
}