#line 1 "E:/Course/3-1/Microcontroler/Lab/Dot Matrix Display/dot_matrix.c"
int i;
char j[]={0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01};
char k[]={0x18,0x24,0x24,0x3c,0x24,0x24,0x00,0x00};
void main() {
 TRISB=0x00;
 TRISD=0x00;
 while(1){
 for(i=0;i<8;i++){
 PORTD=j[i];
 PORTB=k[i];
 delay_ms(1);
 }
 }
}
