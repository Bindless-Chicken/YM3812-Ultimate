#line 1 "W:/PIC/YM3812/YM3812.c"
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
#line 1 "w:/pic/ym3812/lib_channel.h"





struct YM3812_Channel{
  unsigned char  ChannelNumber;
  unsigned char  reg_20[2];
  unsigned char  reg_40[2];
  unsigned char  reg_60[2];
  unsigned char  reg_80[2];
  unsigned char  reg_B0;
  unsigned char  reg_C0;
};


void Init(struct YM3812_Channel *channel);


void SetMultiplier(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetNonPercussive(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetVibrato(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetTremolo(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetDecay(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetAttack(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetRelease(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetSustain(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);


void SetFrequency(
 struct YM3812_Channel *channel,
 const  unsigned char  upper,
 const  unsigned char  lower
);


void SetBlock(
 struct YM3812_Channel *channel,
 const  unsigned char  d
);

void SetVolume(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
);

void SetFeedback(
 struct YM3812_Channel *channel,
 const  unsigned char  d
);


void Play(struct YM3812_Channel *channel);
void Mute(struct YM3812_Channel *channel);
#line 8 "W:/PIC/YM3812/YM3812.c"
const  unsigned char  tune[] = {
 0x01, 0x03, 0x06, 0x01, 0x03,
 0x01, 0x02, 0x06, 0x01, 0x03,
 0x01, 0x03, 0x06, 0x01, 0x03,
 0x01, 0x02, 0x06, 0x01, 0x03,
 0x01, 0x03, 0x06, 0x01, 0x03,
 0x01, 0x0A, 0x05, 0x01, 0x03,
 0x01, 0x01, 0x06, 0x01, 0x03,
 0x01, 0x0B, 0x05, 0x01, 0x03,
 0x01, 0x08, 0x05, 0x05, 0x00,
 0x02, 0x08, 0x03, 0x01, 0x03,
 0x02, 0x03, 0x04, 0x01, 0x03,
 0x02, 0x08, 0x04, 0x01, 0x03,
 0x01, 0x0B, 0x04, 0x01, 0x03,
 0x01, 0x03, 0x05, 0x01, 0x03,
 0x01, 0x08, 0x05, 0x01, 0x03,
 0x01, 0x0A, 0x05, 0x05, 0x00,
 0x02, 0x03, 0x03, 0x01, 0x03,
 0x02, 0x03, 0x04, 0x01, 0x03,
 0x02, 0x07, 0x04, 0x01, 0x03,
 0x01, 0x03, 0x05, 0x01, 0x03,
 0x01, 0x07, 0x05, 0x01, 0x03,
 0x01, 0x0A, 0x05, 0x01, 0x03,
 0x01, 0x0B, 0x05, 0x01, 0x03,
 0xFF, 0x00, 0x00, 0x00, 0x00
};



const  unsigned char  notes[12][2] = {
 {0x01, 0x6B}, {0x01, 0x81}, {0x01, 0x98}, {0x01, 0xB0},
 {0x01, 0xCA}, {0x01, 0xE5}, {0x02, 0x02}, {0x02, 0x20},
 {0x02, 0x41}, {0x02, 0x63}, {0x02, 0x87}, {0x02, 0xAE}
};

void main() {
 struct YM3812_Channel channel[ 2 ];
  unsigned char  tuneBuffer[5];
  unsigned char  *tuneReader;
  unsigned char  i, j, upper, lower, isPlaying;
  unsigned char  press[ 2 ];
  unsigned char  nextEvent;

 ANSEL = ANSELH = 0;

 YM3812_Init();

 delay_ms(10);

 YM3812_Reset();


 Init(&channel[0]);
 channel[0].ChannelNumber =  0 ;
 Init(&channel[1]);
 channel[1].ChannelNumber =  1 ;
#line 78 "W:/PIC/YM3812/YM3812.c"
 for(i=0; i< 2 ; ++i) {

 SetMultiplier(&channel[i],  0 , 0x02);


 SetVolume(&channel[i],  0 , 0x29);


 setAttack(&channel[i],  0 , 0x0F);
 setDecay(&channel[i],  0 , 0x05);


 setSustain(&channel[i],  0 , 0x07);
 setRelease(&channel[i],  0 , 0x05);


 SetFeedback(&channel[i], 0x00);


 SetMultiplier(&channel[i],  1 , 0x01);


 SetVolume(&channel[i],  1 , 0x00);


 setAttack(&channel[i],  1 , 0x0F);
 setDecay(&channel[i],  1 , 0x02);


 setSustain(&channel[i],  1 , 0x0F);
 setRelease(&channel[i],  1 , 0x03);


 channel[i].reg_B0 = 0x11;
 SetBlock(&channel[i], 0x06);
 }

 *tuneReader = tune;
 nextEvent = 0;

 while(1) {
 i = 0;
 isPlaying = 0x01;
 nextEvent = 0x00;
 do{
 while(nextEvent == 0) {

  unsigned char  index;
 index = (5*i);
 tuneBuffer[0] = tune[0 + index];
 tuneBuffer[1] = tune[1 + index];
 tuneBuffer[2] = tune[2 + index];
 tuneBuffer[3] = tune[3 + index];
 tuneBuffer[4] = tune[4 + index];

 i += 1;

 if(tuneBuffer[0] == 0xFF) {
 isPlaying = 0x00;
 break;
 }
 else {

 nextEvent = tuneBuffer[4];


 YM3812_GetNote(tuneBuffer[1], &upper, &lower);
 SetFrequency(&channel[tuneBuffer[0]-1], upper, lower);


 SetBlock(&channel[tuneBuffer[0]-1], tuneBuffer[2]);


 press[tuneBuffer[0]-1] = tuneBuffer[3];
 Play(&channel[tuneBuffer[0]-1]);
 }
 }


 for(j = 0; j <  2 ; ++j) {
 if(press[j] == 0) {
 Mute(&channel[j]);
 }
 else {
 press[j] -=1;
 }
 }


 nextEvent -= 1;


 delay_ms(150);
 } while(isPlaying);


 for(j = 0; j <  2 ; ++j) {
 Mute(&channel[j]);
 }
 }
}
