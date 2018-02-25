#line 1 "W:/PIC/YM3812/lib_channel.c"
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
#line 4 "W:/PIC/YM3812/lib_channel.c"
void Init(struct YM3812_Channel *channel) {
 channel->ChannelNumber = 0x00;
 channel->reg_20[0] = 0x00;
 channel->reg_20[1] = 0x00;
 channel->reg_40[0] = 0x00;
 channel->reg_40[1] = 0x00;
 channel->reg_60[0] = 0x00;
 channel->reg_60[1] = 0x00;
 channel->reg_80[0] = 0x00;
 channel->reg_80[1] = 0x00;
 channel->reg_B0 = 0x00;
 channel->reg_C0 = 0x00;
}

void SetMultiplier(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_20[o] = (channel->reg_20[o] & 0xF0) | d;

 YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetNonPercussive(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_20[o] = (channel->reg_20[o] & 0xDF) | (d << 5);

 YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetVibrato(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_20[o] = (channel->reg_20[o] & 0xBF) | (d << 6);

 YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetTremolo(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_20[o] = (channel->reg_20[o] & 0x7F) | (d << 7);

 YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetDecay(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_60[o] = (channel->reg_60[o] & 0xF0) | d;

 YM3812_SetOperatorRegister(0x60, channel->reg_60[o], channel->ChannelNumber, o);
}

void SetAttack(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_60[o] = (channel->reg_60[o] & 0x0F) | (d << 4);

 YM3812_SetOperatorRegister(0x60, channel->reg_60[o], channel->ChannelNumber, o);
}

void SetRelease(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_80[o] = (channel->reg_80[o] & 0xF0) | d;

 YM3812_SetOperatorRegister(0x80, channel->reg_80[o], channel->ChannelNumber, o);
}

void SetSustain(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_80[o] = (channel->reg_80[o] & 0x0F) | (d << 4);

 YM3812_SetOperatorRegister(0x80, channel->reg_80[o], channel->ChannelNumber, o);
}
void SetFrequency(
 struct YM3812_Channel *channel,
 const  unsigned char  upper,
 const  unsigned char  lower
) {
 YM3812_SetRegister(0xA0, lower, channel->ChannelNumber);


 channel->reg_B0 = (channel->reg_B0 & 0xFC) | upper;
 YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void SetBlock(
 struct YM3812_Channel *channel,
 const  unsigned char  d
) {

 channel->reg_B0 = (channel->reg_B0 & 0xE3) | (d << 2);
 YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void Play(struct YM3812_Channel *channel) {

 channel->reg_B0 = (channel->reg_B0 & 0xDF) | 0x20;
 YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void Mute(struct YM3812_Channel *channel) {

 channel->reg_B0 = channel->reg_B0 & 0xDF;
 YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void SetVolume(
 struct YM3812_Channel *channel,
 const  unsigned char  o,
 const  unsigned char  d
) {

 channel->reg_40[o] = (channel->reg_40[o] & 0xC0) | d;

 YM3812_SetOperatorRegister(0x40, channel->reg_40[o], channel->ChannelNumber, o);
}

void SetFeedback(
 struct YM3812_Channel *channel,
 const  unsigned char  d
) {

 channel->reg_C0 = (channel->reg_C0 & 0xC0) | (d << 1);

 YM3812_SetRegister(0xC0, channel->reg_C0, channel->ChannelNumber);
}
