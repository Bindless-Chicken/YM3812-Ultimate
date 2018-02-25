#define uint8_t unsigned char
#define OFF 0
#define ON 1

// Structure containing the registers of a channel
struct YM3812_Channel{
    uint8_t ChannelNumber;
    uint8_t reg_20[2];
    uint8_t reg_40[2];
    uint8_t reg_60[2];
    uint8_t reg_80[2];
    uint8_t reg_B0;
    uint8_t reg_C0;
};

// Clear and prepare the registers
void Init(struct YM3812_Channel *channel);

// Set the octave of the frequency
void SetMultiplier(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Switch between percussive and non percussive tones
void SetNonPercussive(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set the vibrato
void SetVibrato(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set the tremolo
void SetTremolo(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set decay
void SetDecay(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set attack
void SetAttack(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set release
void SetRelease(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set sustain
void SetSustain(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

// Set Frequency
void SetFrequency(
    struct YM3812_Channel *channel,
    const uint8_t upper,
    const uint8_t lower
);

// Set block
void SetBlock(
    struct YM3812_Channel *channel,
    const uint8_t d
);

void SetVolume(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
);

void SetFeedback(
    struct YM3812_Channel *channel,
    const uint8_t d
);


void Play(struct YM3812_Channel *channel);
void Mute(struct YM3812_Channel *channel);