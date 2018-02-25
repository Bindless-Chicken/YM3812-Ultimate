#include "lib_ym3812.h"
#include "lib_channel.h"

// Format
// cnovdd


const uint8_t tune[] = {
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

#define NB_CHANNEL 2

const uint8_t notes[12][2] = {
  {0x01, 0x6B}, {0x01, 0x81}, {0x01, 0x98}, {0x01, 0xB0},
  {0x01, 0xCA}, {0x01, 0xE5}, {0x02, 0x02}, {0x02, 0x20},
  {0x02, 0x41}, {0x02, 0x63}, {0x02, 0x87}, {0x02, 0xAE}
};

void main() {
  struct YM3812_Channel channel[NB_CHANNEL];
  uint8_t tuneBuffer[5];
  uint8_t *tuneReader;
  uint8_t i, j, upper, lower, isPlaying;
  uint8_t press[NB_CHANNEL];
  uint8_t nextEvent;

  ANSEL = ANSELH = 0;

  YM3812_Init();

  delay_ms(10);

  YM3812_Reset();

  // Create the channel handle
  Init(&channel[0]);
  channel[0].ChannelNumber = CHANNEL_0;
  Init(&channel[1]);
  channel[1].ChannelNumber = CHANNEL_1;
  // Init(&channel[2]);
  // channel[2].ChannelNumber = CHANNEL_2;
  // Init(&channel[3]);
  // channel[3].ChannelNumber = CHANNEL_3;
  // Init(&channel[4]);
  // channel[4].ChannelNumber = CHANNEL_4;
  // Init(&channel[5]);
  // channel[5].ChannelNumber = CHANNEL_5;
  // { 0x00, 0xF1, 0x01, 0x97, 0x17, 0x00, 0x08, 0x21, 0x0D, 0xF1, 0x18, 0x00 };
  // { 0x00, 0x02, 0x29, 0xF5, 0x75, 0x00, 0x00, 0x01, 0x83, 0xF2, 0xF3, 0x00 };
  // { 0x00, 0x65, 0xD2, 0x81, 0x03, 0x00, 0x02, 0x71, 0x80, 0xF1, 0x05, 0x00 };

  // Setup channels 0, 1 and 2 to produce a bell sound.
  // for (i = 0; i < 3; i ++) {
  for(i=0; i<NB_CHANNEL; ++i) {
    // 0x20
    SetMultiplier(&channel[i], MODULATOR, 0x02);

    // 0x40
    SetVolume(&channel[i], MODULATOR, 0x29);

    // 0x60
    setAttack(&channel[i], MODULATOR, 0x0F);
    setDecay(&channel[i], MODULATOR, 0x05);

    // 0x80
    setSustain(&channel[i], MODULATOR, 0x07);
    setRelease(&channel[i], MODULATOR, 0x05);

    // C0
    SetFeedback(&channel[i], 0x00);

    // 0x20
    SetMultiplier(&channel[i], CARRIER, 0x01);

    // 0x40
    SetVolume(&channel[i], CARRIER, 0x00);

    // 0x60
    setAttack(&channel[i], CARRIER, 0x0F);
    setDecay(&channel[i], CARRIER, 0x02);

    // 0x80
    setSustain(&channel[i], CARRIER, 0x0F);
    setRelease(&channel[i], CARRIER, 0x03);

    // 0xB0
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
        // Read a chunk
        uint8_t index;
        index = (5*i);
        tuneBuffer[0] = tune[0 + index];    // Channel
        tuneBuffer[1] = tune[1 + index];    // Note
        tuneBuffer[2] = tune[2 + index];    // Octave
        tuneBuffer[3] = tune[3 + index];    // Press duration
        tuneBuffer[4] = tune[4 + index];    // Next event

        i += 1;

        if(tuneBuffer[0] == 0xFF) {
          isPlaying = 0x00;
          break;
        }
        else {
          // Set the duration to the next buffer
          nextEvent = tuneBuffer[4];

          // Get the note & set the frequency
          YM3812_GetNote(tuneBuffer[1], &upper, &lower);
          SetFrequency(&channel[tuneBuffer[0]-1], upper, lower);

          // Set the octave
          SetBlock(&channel[tuneBuffer[0]-1], tuneBuffer[2]);

          // Set the press duration
          press[tuneBuffer[0]-1] = tuneBuffer[3];
          Play(&channel[tuneBuffer[0]-1]);
        }
      }

      // Release the keys
      for(j = 0; j < NB_CHANNEL; ++j) {
        if(press[j] == 0) {
          Mute(&channel[j]);
        }
        else {
          press[j] -=1;
        }
      }

      // Decrease the time to the next event
      nextEvent -= 1;

      // And Delay
      delay_ms(150);
    } while(isPlaying);

    // Mute everybody
    for(j = 0; j < NB_CHANNEL; ++j) {
      Mute(&channel[j]);
    }
  }
}