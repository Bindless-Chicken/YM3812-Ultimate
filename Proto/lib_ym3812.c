#include "lib_ym3812.h"

// Offset for each channel to the base register
const uint8_t YM3812_channelOffset [9] = { 0x00, 0x01, 0x02, 0x08, 0x09, 0x0A, 0x10, 0x11, 0x12 };

void YM3812_Init() {
    // Set both used banks to outputs
    TRISB = 0x00;
    TRISC = 0x00;

    DATA_PORT = 0x00;
    CONTROL_PORT = MASK_RESET | MASK_CS;
}

void YM3812_Reset() {
    CONTROL_PORT = MASK_CS;
    delay_ms(25);
    CONTROL_PORT = MASK_RESET | MASK_CS;
}

void YM3812_WriteAddess(const uint8_t addr) {
    // Prepare the control port
    CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD;

    // Write the data line
    DATA_PORT = addr;

    // Flash CS
    CONTROL_PORT = MASK_RESET | MASK_RD;
    asm {nop};
    CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD;
}

void YM3812_WriteData(const uint8_t dt) {
    // Prepare the control port
    CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD| MASK_A0;

    // Write the data line
    DATA_PORT = dt;

    // Flash CS
    CONTROL_PORT = MASK_RESET | MASK_RD | MASK_A0;
    asm {nop};
    CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD | MASK_A0;
}

void YM3812_SetRegister(
    const uint8_t reg,
    const uint8_t dt,
    const uint8_t ch
) {
    YM3812_WriteAddess(reg + YM3812_channelOffset[ch]);
    YM3812_WriteData(dt);
}


void YM3812_SetOperatorRegister(
    const uint8_t reg,
    const uint8_t dt,
    const uint8_t ch,
    const uint8_t op
) {
    YM3812_WriteAddess(reg + YM3812_channelOffset[ch] + (op ? 3 : 0));
    YM3812_WriteData(dt);
}

void YM3812_GetNote(
    const uint8_t n,
    uint8_t *upper,
    uint8_t *lower
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