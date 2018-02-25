#include "lib_ym3812.h"
#include "lib_channel.h"

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
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_20[o] = (channel->reg_20[o] & 0xF0) | d;

    YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetNonPercussive(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_20[o] = (channel->reg_20[o] & 0xDF) | (d << 5);

    YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetVibrato(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_20[o] = (channel->reg_20[o] & 0xBF) | (d << 6);

    YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetTremolo(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_20[o] = (channel->reg_20[o] & 0x7F) | (d << 7);

    YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
}

void SetDecay(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_60[o] = (channel->reg_60[o] & 0xF0) | d;

    YM3812_SetOperatorRegister(0x60, channel->reg_60[o], channel->ChannelNumber, o);
}

void SetAttack(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_60[o] = (channel->reg_60[o] & 0x0F) | (d << 4);

    YM3812_SetOperatorRegister(0x60, channel->reg_60[o], channel->ChannelNumber, o);
}

void SetRelease(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_80[o] = (channel->reg_80[o] & 0xF0) | d;

    YM3812_SetOperatorRegister(0x80, channel->reg_80[o], channel->ChannelNumber, o);
}

void SetSustain(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_80[o] = (channel->reg_80[o] & 0x0F) | (d << 4);

    YM3812_SetOperatorRegister(0x80, channel->reg_80[o], channel->ChannelNumber, o);
}
void SetFrequency(
    struct YM3812_Channel *channel,
    const uint8_t upper,
    const uint8_t lower
) {
    YM3812_SetRegister(0xA0, lower, channel->ChannelNumber);

    // Update the shadow register
    channel->reg_B0 = (channel->reg_B0 & 0xFC) | upper;
    YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void SetBlock(
    struct YM3812_Channel *channel,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_B0 = (channel->reg_B0 & 0xE3) | (d << 2);
    YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void Play(struct YM3812_Channel *channel) {
    // Update the shadow register
    channel->reg_B0 = (channel->reg_B0 & 0xDF) | 0x20;
    YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void Mute(struct YM3812_Channel *channel) {
    // Update the shadow register
    channel->reg_B0 = channel->reg_B0 & 0xDF;
    YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
}

void SetVolume(
    struct YM3812_Channel *channel,
    const uint8_t o,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_40[o] = (channel->reg_40[o] & 0xC0) | d;

    YM3812_SetOperatorRegister(0x40, channel->reg_40[o], channel->ChannelNumber, o);
}

void SetFeedback(
    struct YM3812_Channel *channel,
    const uint8_t d
) {
    // Update the shadow register
    channel->reg_C0 = (channel->reg_C0 & 0xC0) | (d << 1);

    YM3812_SetRegister(0xC0, channel->reg_C0, channel->ChannelNumber);
}