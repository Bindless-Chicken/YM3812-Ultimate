#define uint8_t unsigned char

// Pin affectation
#define DATA_PORT PORTB
#define CONTROL_PORT PORTC   // X|X|X|IC|CS|RD|WR|A0

// Channels
#define CHANNEL_0 0
#define CHANNEL_1 1
#define CHANNEL_2 2
#define CHANNEL_3 3
#define CHANNEL_4 4
#define CHANNEL_5 5
#define CHANNEL_6 6
#define CHANNEL_7 7
#define CHANNEL_8 8

// Operators
#define MODULATOR 0
#define CARRIER 1

// Pin masks
#define MASK_RESET 0x10
#define MASK_CS 0x08
#define MASK_RD 0x04
#define MASK_WR 0x02
#define MASK_A0 0x01

// Init the YM3812 chip
void YM3812_Init();

// Reset the YM3812 chip
void YM3812_Reset();

// Write an address on the line
void YM3812_WriteAddess(const uint8_t addr);

// Write some data on the line
void YM3812_WriteData(const uint8_t dt);

// Set the content of a register without operator
void YM3812_SetRegister(
    const uint8_t reg,
    const uint8_t dt,
    const uint8_t ch
);

// Set the content of a register with operator
void YM3812_SetOperatorRegister(
    const uint8_t reg,
    const uint8_t dt,
    const uint8_t ch,
    const uint8_t op
);

// Bind the letter note to the frequency
void YM3812_GetNote(
    const uint8_t n,
    uint8_t *upper,
    uint8_t *lower
);