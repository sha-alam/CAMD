int i,x,zx;
int ix,xx,zxx;
char j[]={0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01};
int a[5][8]={
{0x18,0x24,0x42,0x7e,0x42,0x42,0x42,0x42},
{0xf0,0x88,0x88,0xf0,0x88,0x88,0xf0,0x00},
{0x38,0x44,0x40,0x40,0x40,0x44,0x38,0x00},
{0x78,0x44,0x44,0x44,0x44,0x44,0x44,0x78},
{0x00,0x3c,0x20,0x20,0x3c,0x20,0x20,0x3c}
};
void main() {
     TRISB=0x00;
     TRISD=0x00;
     while(1){
         for(x=0;x<5;x++){
             for(xx=0;xx<8;xx++){
                 for(zx=0;zx<80;zx++){
                     for(i=0;i<8;i++){
                         PORTD=j[i];
                         PORTB=a[x][i]<<xx;
                         delay_ms(1);
                     }
                 }
              }
              delay_ms(30);
           }
      }
}