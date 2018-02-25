#line 1 "W:/PIC/YM3812/lib_ym3812.c"
#line 1 "w:/pic/ym3812/lib_ym3812.h"
#line 30 "w:/pic/ym3812/lib_ym3812.h"
void YM3812_Init();


void YM3812_Reset();


void YM3812_WriteAddess(const  unsigned char  addr);


void YM3812_WriteData(const  unsigned char  dt);


void YM3812_SetRegister(
 const  unsigned char  reg,
 const  unsigned char  dt,
 const  unsigned char  ch
);


void YM3812_SetOperatorRegister(
 const  unsigned char  reg,
 const  unsigned char  dt,
 const  unsigned char  ch,
 const  unsigned char  op
);


void YM3812_GetNote(
 const  unsigned char  n,
  unsigned char  *upper,
  unsigned char  *lower
);
#line 4 "W:/PIC/YM3812/lib_ym3812.c"
const  unsigned char  YM3812_channelOffset [9] = { 0x00, 0x01, 0x02, 0x08, 0x09, 0x0A, 0x10, 0x11, 0x12 };

void YM3812_Init() {

 TRISB = 0x00;
 TRISC = 0x00;

  PORTB  = 0x00;
  PORTC  =  0x10  |  0x08 ;
}

void YM3812_Reset() {
  PORTC  =  0x08 ;
 delay_ms(25);
  PORTC  =  0x10  |  0x08 ;
}

void YM3812_WriteAddess(const  unsigned char  addr) {

  PORTC  =  0x10  |  0x08  |  0x04 ;


  PORTB  = addr;


  PORTC  =  0x10  |  0x04 ;
 asm {nop};
  PORTC  =  0x10  |  0x08  |  0x04 ;
}

void YM3812_WriteData(const  unsigned char  dt) {

  PORTC  =  0x10  |  0x08  |  0x04 |  0x01 ;


  PORTB  = dt;


  PORTC  =  0x10  |  0x04  |  0x01 ;
 asm {nop};
  PORTC  =  0x10  |  0x08  |  0x04  |  0x01 ;
}

void YM3812_SetRegister(
 const  unsigned char  reg,
 const  unsigned char  dt,
 const  unsigned char  ch
) {
 YM3812_WriteAddess(reg + YM3812_channelOffset[ch]);
 YM3812_WriteData(dt);
}


void YM3812_SetOperatorRegister(
 const  unsigned char  reg,
 const  unsigned char  dt,
 const  unsigned char  ch,
 const  unsigned char  op
) {
 YM3812_WriteAddess(reg + YM3812_channelOffset[ch] + (op ? 3 : 0));
 YM3812_WriteData(dt);
}

void YM3812_GetNote(
 const  unsigned char  n,
  unsigned char  *upper,
  unsigned char  *lower
) {
 switch(n){
 case 0x00:
 *upper = 0x01;
 *lower = 0x6B;
 break;
 case 0x01:
 *upper = 0x01;
 *lower = 0x81;
 break;
 case 0x02:
 *upper = 0x01;
 *lower = 0x98;
 break;
 case 0x03:
 *upper = 0x01;
 *lower = 0xB0;
 break;
 case 0x04:
 *upper = 0x01;
 *lower = 0xCA;
 break;
 case 0x05:
 *upper = 0x01;
 *lower = 0xE5;
 break;
 case 0x06:
 *upper = 0x02;
 *lower = 0x02;
 break;
 case 0x07:
 *upper = 0x02;
 *lower = 0x20;
 break;
 case 0x08:
 *upper = 0x02;
 *lower = 0x41;
 break;
 case 0x09:
 *upper = 0x02;
 *lower = 0x63;
 break;
 case 0x0A:
 *upper = 0x02;
 *lower = 0x87;
 break;
 case 0x0B:
 *upper = 0x02;
 *lower = 0xAE;
 break;
 }
}
