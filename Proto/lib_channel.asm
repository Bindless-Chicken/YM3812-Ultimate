
_Init:

;lib_channel.c,4 :: 		void Init(struct YM3812_Channel *channel) {
;lib_channel.c,5 :: 		channel->ChannelNumber = 0x00;
	MOVF       FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,6 :: 		channel->reg_20[0] = 0x00;
	INCF       FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,7 :: 		channel->reg_20[1] = 0x00;
	INCF       FARG_Init_channel+0, 0
	MOVWF      R0+0
	INCF       R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,8 :: 		channel->reg_40[0] = 0x00;
	MOVLW      3
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,9 :: 		channel->reg_40[1] = 0x00;
	MOVLW      3
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      R0+0
	INCF       R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,10 :: 		channel->reg_60[0] = 0x00;
	MOVLW      5
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,11 :: 		channel->reg_60[1] = 0x00;
	MOVLW      5
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      R0+0
	INCF       R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,12 :: 		channel->reg_80[0] = 0x00;
	MOVLW      7
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,13 :: 		channel->reg_80[1] = 0x00;
	MOVLW      7
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      R0+0
	INCF       R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,14 :: 		channel->reg_B0 = 0x00;
	MOVLW      9
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,15 :: 		channel->reg_C0 = 0x00;
	MOVLW      10
	ADDWF      FARG_Init_channel+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;lib_channel.c,16 :: 		}
L_end_Init:
	RETURN
; end of _Init

_SetMultiplier:

;lib_channel.c,22 :: 		) {
;lib_channel.c,24 :: 		channel->reg_20[o] = (channel->reg_20[o] & 0xF0) | d;
	INCF       FARG_SetMultiplier_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetMultiplier_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetMultiplier_d+0, 0
	IORWF      R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,26 :: 		YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
	MOVLW      32
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	INCF       FARG_SetMultiplier_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetMultiplier_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetMultiplier_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetMultiplier_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,27 :: 		}
L_end_SetMultiplier:
	RETURN
; end of _SetMultiplier

_SetNonPercussive:

;lib_channel.c,33 :: 		) {
;lib_channel.c,35 :: 		channel->reg_20[o] = (channel->reg_20[o] & 0xDF) | (d << 5);
	INCF       FARG_SetNonPercussive_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetNonPercussive_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      223
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVLW      5
	MOVWF      R1+0
	MOVF       FARG_SetNonPercussive_d+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__SetNonPercussive3:
	BTFSC      STATUS+0, 2
	GOTO       L__SetNonPercussive4
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__SetNonPercussive3
L__SetNonPercussive4:
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,37 :: 		YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
	MOVLW      32
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	INCF       FARG_SetNonPercussive_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetNonPercussive_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetNonPercussive_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetNonPercussive_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,38 :: 		}
L_end_SetNonPercussive:
	RETURN
; end of _SetNonPercussive

_SetVibrato:

;lib_channel.c,44 :: 		) {
;lib_channel.c,46 :: 		channel->reg_20[o] = (channel->reg_20[o] & 0xBF) | (d << 6);
	INCF       FARG_SetVibrato_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetVibrato_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      191
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVLW      6
	MOVWF      R1+0
	MOVF       FARG_SetVibrato_d+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__SetVibrato6:
	BTFSC      STATUS+0, 2
	GOTO       L__SetVibrato7
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__SetVibrato6
L__SetVibrato7:
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,48 :: 		YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
	MOVLW      32
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	INCF       FARG_SetVibrato_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetVibrato_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetVibrato_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetVibrato_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,49 :: 		}
L_end_SetVibrato:
	RETURN
; end of _SetVibrato

_SetTremolo:

;lib_channel.c,55 :: 		) {
;lib_channel.c,57 :: 		channel->reg_20[o] = (channel->reg_20[o] & 0x7F) | (d << 7);
	INCF       FARG_SetTremolo_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetTremolo_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      127
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVLW      7
	MOVWF      R1+0
	MOVF       FARG_SetTremolo_d+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__SetTremolo9:
	BTFSC      STATUS+0, 2
	GOTO       L__SetTremolo10
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__SetTremolo9
L__SetTremolo10:
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,59 :: 		YM3812_SetOperatorRegister(0x20, channel->reg_20[o], channel->ChannelNumber, o);
	MOVLW      32
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	INCF       FARG_SetTremolo_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetTremolo_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetTremolo_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetTremolo_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,60 :: 		}
L_end_SetTremolo:
	RETURN
; end of _SetTremolo

_SetDecay:

;lib_channel.c,66 :: 		) {
;lib_channel.c,68 :: 		channel->reg_60[o] = (channel->reg_60[o] & 0xF0) | d;
	MOVLW      5
	ADDWF      FARG_SetDecay_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetDecay_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetDecay_d+0, 0
	IORWF      R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,70 :: 		YM3812_SetOperatorRegister(0x60, channel->reg_60[o], channel->ChannelNumber, o);
	MOVLW      96
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	MOVLW      5
	ADDWF      FARG_SetDecay_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetDecay_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetDecay_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetDecay_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,71 :: 		}
L_end_SetDecay:
	RETURN
; end of _SetDecay

_SetAttack:

;lib_channel.c,77 :: 		) {
;lib_channel.c,79 :: 		channel->reg_60[o] = (channel->reg_60[o] & 0x0F) | (d << 4);
	MOVLW      5
	ADDWF      FARG_SetAttack_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetAttack_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVF       FARG_SetAttack_d+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,81 :: 		YM3812_SetOperatorRegister(0x60, channel->reg_60[o], channel->ChannelNumber, o);
	MOVLW      96
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	MOVLW      5
	ADDWF      FARG_SetAttack_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetAttack_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetAttack_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetAttack_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,82 :: 		}
L_end_SetAttack:
	RETURN
; end of _SetAttack

_SetRelease:

;lib_channel.c,88 :: 		) {
;lib_channel.c,90 :: 		channel->reg_80[o] = (channel->reg_80[o] & 0xF0) | d;
	MOVLW      7
	ADDWF      FARG_SetRelease_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetRelease_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetRelease_d+0, 0
	IORWF      R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,92 :: 		YM3812_SetOperatorRegister(0x80, channel->reg_80[o], channel->ChannelNumber, o);
	MOVLW      128
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	MOVLW      7
	ADDWF      FARG_SetRelease_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetRelease_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetRelease_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetRelease_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,93 :: 		}
L_end_SetRelease:
	RETURN
; end of _SetRelease

_SetSustain:

;lib_channel.c,99 :: 		) {
;lib_channel.c,101 :: 		channel->reg_80[o] = (channel->reg_80[o] & 0x0F) | (d << 4);
	MOVLW      7
	ADDWF      FARG_SetSustain_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetSustain_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVF       FARG_SetSustain_d+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,103 :: 		YM3812_SetOperatorRegister(0x80, channel->reg_80[o], channel->ChannelNumber, o);
	MOVLW      128
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	MOVLW      7
	ADDWF      FARG_SetSustain_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetSustain_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetSustain_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetSustain_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,104 :: 		}
L_end_SetSustain:
	RETURN
; end of _SetSustain

_SetFrequency:

;lib_channel.c,109 :: 		) {
;lib_channel.c,110 :: 		YM3812_SetRegister(0xA0, lower, channel->ChannelNumber);
	MOVLW      160
	MOVWF      FARG_YM3812_SetRegister_reg+0
	MOVF       FARG_SetFrequency_lower+0, 0
	MOVWF      FARG_YM3812_SetRegister_dt+0
	MOVF       FARG_SetFrequency_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_ch+0
	CALL       _YM3812_SetRegister+0
;lib_channel.c,113 :: 		channel->reg_B0 = (channel->reg_B0 & 0xFC) | upper;
	MOVLW      9
	ADDWF      FARG_SetFrequency_channel+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      252
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetFrequency_upper+0, 0
	IORWF      R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,114 :: 		YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
	MOVLW      176
	MOVWF      FARG_YM3812_SetRegister_reg+0
	MOVLW      9
	ADDWF      FARG_SetFrequency_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_dt+0
	MOVF       FARG_SetFrequency_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_ch+0
	CALL       _YM3812_SetRegister+0
;lib_channel.c,115 :: 		}
L_end_SetFrequency:
	RETURN
; end of _SetFrequency

_SetBlock:

;lib_channel.c,120 :: 		) {
;lib_channel.c,122 :: 		channel->reg_B0 = (channel->reg_B0 & 0xE3) | (d << 2);
	MOVLW      9
	ADDWF      FARG_SetBlock_channel+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      227
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVF       FARG_SetBlock_d+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,123 :: 		YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
	MOVLW      176
	MOVWF      FARG_YM3812_SetRegister_reg+0
	MOVLW      9
	ADDWF      FARG_SetBlock_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_dt+0
	MOVF       FARG_SetBlock_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_ch+0
	CALL       _YM3812_SetRegister+0
;lib_channel.c,124 :: 		}
L_end_SetBlock:
	RETURN
; end of _SetBlock

_Play:

;lib_channel.c,126 :: 		void Play(struct YM3812_Channel *channel) {
;lib_channel.c,128 :: 		channel->reg_B0 = (channel->reg_B0 & 0xDF) | 0x20;
	MOVLW      9
	ADDWF      FARG_Play_channel+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      223
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	BSF        R0+0, 5
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,129 :: 		YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
	MOVLW      176
	MOVWF      FARG_YM3812_SetRegister_reg+0
	MOVLW      9
	ADDWF      FARG_Play_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_dt+0
	MOVF       FARG_Play_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_ch+0
	CALL       _YM3812_SetRegister+0
;lib_channel.c,130 :: 		}
L_end_Play:
	RETURN
; end of _Play

_Mute:

;lib_channel.c,132 :: 		void Mute(struct YM3812_Channel *channel) {
;lib_channel.c,134 :: 		channel->reg_B0 = channel->reg_B0 & 0xDF;
	MOVLW      9
	ADDWF      FARG_Mute_channel+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      223
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,135 :: 		YM3812_SetRegister(0xB0, channel->reg_B0, channel->ChannelNumber);
	MOVLW      176
	MOVWF      FARG_YM3812_SetRegister_reg+0
	MOVLW      9
	ADDWF      FARG_Mute_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_dt+0
	MOVF       FARG_Mute_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_ch+0
	CALL       _YM3812_SetRegister+0
;lib_channel.c,136 :: 		}
L_end_Mute:
	RETURN
; end of _Mute

_SetVolume:

;lib_channel.c,142 :: 		) {
;lib_channel.c,144 :: 		channel->reg_40[o] = (channel->reg_40[o] & 0xC0) | d;
	MOVLW      3
	ADDWF      FARG_SetVolume_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetVolume_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVLW      192
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetVolume_d+0, 0
	IORWF      R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,146 :: 		YM3812_SetOperatorRegister(0x40, channel->reg_40[o], channel->ChannelNumber, o);
	MOVLW      64
	MOVWF      FARG_YM3812_SetOperatorRegister_reg+0
	MOVLW      3
	ADDWF      FARG_SetVolume_channel+0, 0
	MOVWF      R0+0
	MOVF       FARG_SetVolume_o+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_dt+0
	MOVF       FARG_SetVolume_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_ch+0
	MOVF       FARG_SetVolume_o+0, 0
	MOVWF      FARG_YM3812_SetOperatorRegister_op+0
	CALL       _YM3812_SetOperatorRegister+0
;lib_channel.c,147 :: 		}
L_end_SetVolume:
	RETURN
; end of _SetVolume

_SetFeedback:

;lib_channel.c,152 :: 		) {
;lib_channel.c,154 :: 		channel->reg_C0 = (channel->reg_C0 & 0xC0) | (d << 1);
	MOVLW      10
	ADDWF      FARG_SetFeedback_channel+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVLW      192
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	MOVF       FARG_SetFeedback_d+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lib_channel.c,156 :: 		YM3812_SetRegister(0xC0, channel->reg_C0, channel->ChannelNumber);
	MOVLW      192
	MOVWF      FARG_YM3812_SetRegister_reg+0
	MOVLW      10
	ADDWF      FARG_SetFeedback_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_dt+0
	MOVF       FARG_SetFeedback_channel+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_YM3812_SetRegister_ch+0
	CALL       _YM3812_SetRegister+0
;lib_channel.c,157 :: 		}
L_end_SetFeedback:
	RETURN
; end of _SetFeedback
