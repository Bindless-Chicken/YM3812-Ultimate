
_main:

;YM3812.c,43 :: 		void main() {
;YM3812.c,51 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;YM3812.c,53 :: 		YM3812_Init();
	CALL       _YM3812_Init+0
;YM3812.c,55 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
;YM3812.c,57 :: 		YM3812_Reset();
	CALL       _YM3812_Reset+0
;YM3812.c,60 :: 		Init(&channel[0]);
	MOVLW      main_channel_L0+0
	MOVWF      FARG_Init_channel+0
	CALL       _Init+0
;YM3812.c,61 :: 		channel[0].ChannelNumber = CHANNEL_0;
	CLRF       main_channel_L0+0
;YM3812.c,62 :: 		Init(&channel[1]);
	MOVLW      main_channel_L0+11
	MOVWF      FARG_Init_channel+0
	CALL       _Init+0
;YM3812.c,63 :: 		channel[1].ChannelNumber = CHANNEL_1;
	MOVLW      1
	MOVWF      main_channel_L0+11
;YM3812.c,78 :: 		for(i=0; i<NB_CHANNEL; ++i) {
	CLRF       main_i_L0+0
L_main1:
	MOVLW      2
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;YM3812.c,80 :: 		SetMultiplier(&channel[i], MODULATOR, 0x02);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetMultiplier_channel+0
	CLRF       FARG_SetMultiplier_o+0
	MOVLW      2
	MOVWF      FARG_SetMultiplier_d+0
	CALL       _SetMultiplier+0
;YM3812.c,83 :: 		SetVolume(&channel[i], MODULATOR, 0x29);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetVolume_channel+0
	CLRF       FARG_SetVolume_o+0
	MOVLW      41
	MOVWF      FARG_SetVolume_d+0
	CALL       _SetVolume+0
;YM3812.c,86 :: 		setAttack(&channel[i], MODULATOR, 0x0F);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetAttack_channel+0
	CLRF       FARG_SetAttack_o+0
	MOVLW      15
	MOVWF      FARG_SetAttack_d+0
	CALL       _SetAttack+0
;YM3812.c,87 :: 		setDecay(&channel[i], MODULATOR, 0x05);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetDecay_channel+0
	CLRF       FARG_SetDecay_o+0
	MOVLW      5
	MOVWF      FARG_SetDecay_d+0
	CALL       _SetDecay+0
;YM3812.c,90 :: 		setSustain(&channel[i], MODULATOR, 0x07);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetSustain_channel+0
	CLRF       FARG_SetSustain_o+0
	MOVLW      7
	MOVWF      FARG_SetSustain_d+0
	CALL       _SetSustain+0
;YM3812.c,91 :: 		setRelease(&channel[i], MODULATOR, 0x05);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetRelease_channel+0
	CLRF       FARG_SetRelease_o+0
	MOVLW      5
	MOVWF      FARG_SetRelease_d+0
	CALL       _SetRelease+0
;YM3812.c,94 :: 		SetFeedback(&channel[i], 0x00);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetFeedback_channel+0
	CLRF       FARG_SetFeedback_d+0
	CALL       _SetFeedback+0
;YM3812.c,97 :: 		SetMultiplier(&channel[i], CARRIER, 0x01);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetMultiplier_channel+0
	MOVLW      1
	MOVWF      FARG_SetMultiplier_o+0
	MOVLW      1
	MOVWF      FARG_SetMultiplier_d+0
	CALL       _SetMultiplier+0
;YM3812.c,100 :: 		SetVolume(&channel[i], CARRIER, 0x00);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetVolume_channel+0
	MOVLW      1
	MOVWF      FARG_SetVolume_o+0
	CLRF       FARG_SetVolume_d+0
	CALL       _SetVolume+0
;YM3812.c,103 :: 		setAttack(&channel[i], CARRIER, 0x0F);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetAttack_channel+0
	MOVLW      1
	MOVWF      FARG_SetAttack_o+0
	MOVLW      15
	MOVWF      FARG_SetAttack_d+0
	CALL       _SetAttack+0
;YM3812.c,104 :: 		setDecay(&channel[i], CARRIER, 0x02);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetDecay_channel+0
	MOVLW      1
	MOVWF      FARG_SetDecay_o+0
	MOVLW      2
	MOVWF      FARG_SetDecay_d+0
	CALL       _SetDecay+0
;YM3812.c,107 :: 		setSustain(&channel[i], CARRIER, 0x0F);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetSustain_channel+0
	MOVLW      1
	MOVWF      FARG_SetSustain_o+0
	MOVLW      15
	MOVWF      FARG_SetSustain_d+0
	CALL       _SetSustain+0
;YM3812.c,108 :: 		setRelease(&channel[i], CARRIER, 0x03);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetRelease_channel+0
	MOVLW      1
	MOVWF      FARG_SetRelease_o+0
	MOVLW      3
	MOVWF      FARG_SetRelease_d+0
	CALL       _SetRelease+0
;YM3812.c,111 :: 		channel[i].reg_B0 = 0x11;
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      main_channel_L0+0
	ADDWF      R0+0, 1
	MOVLW      9
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVLW      17
	MOVWF      INDF+0
;YM3812.c,112 :: 		SetBlock(&channel[i], 0x06);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetBlock_channel+0
	MOVLW      6
	MOVWF      FARG_SetBlock_d+0
	CALL       _SetBlock+0
;YM3812.c,78 :: 		for(i=0; i<NB_CHANNEL; ++i) {
	INCF       main_i_L0+0, 1
;YM3812.c,113 :: 		}
	GOTO       L_main1
L_main2:
;YM3812.c,115 :: 		*tuneReader = tune;
	MOVF       main_tuneReader_L0+0, 0
	MOVWF      FSR
	MOVLW      _tune+0
	MOVWF      INDF+0
;YM3812.c,116 :: 		nextEvent = 0;
	CLRF       main_nextEvent_L0+0
;YM3812.c,118 :: 		while(1) {
L_main4:
;YM3812.c,119 :: 		i = 0;
	CLRF       main_i_L0+0
;YM3812.c,120 :: 		isPlaying = 0x01;
	MOVLW      1
	MOVWF      main_isPlaying_L0+0
;YM3812.c,121 :: 		nextEvent = 0x00;
	CLRF       main_nextEvent_L0+0
;YM3812.c,122 :: 		do{
L_main6:
;YM3812.c,123 :: 		while(nextEvent == 0) {
L_main9:
	MOVF       main_nextEvent_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;YM3812.c,126 :: 		index = (5*i);
	MOVLW      5
	MOVWF      R0+0
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
;YM3812.c,127 :: 		tuneBuffer[0] = tune[0 + index];    // Channel
	MOVF       R0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVLW      _tune+0
	ADDWF      R1+0, 1
	MOVLW      hi_addr(_tune+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R1+1, 1
	MOVF       R1+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R1+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      main_tuneBuffer_L0+0
;YM3812.c,128 :: 		tuneBuffer[1] = tune[1 + index];    // Note
	MOVF       R0+0, 0
	ADDLW      1
	MOVWF      R1+0
	CLRF       R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVLW      _tune+0
	ADDWF      R1+0, 1
	MOVLW      hi_addr(_tune+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R1+1, 1
	MOVF       R1+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R1+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      main_tuneBuffer_L0+1
;YM3812.c,129 :: 		tuneBuffer[2] = tune[2 + index];    // Octave
	MOVF       R0+0, 0
	ADDLW      2
	MOVWF      R1+0
	CLRF       R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVLW      _tune+0
	ADDWF      R1+0, 1
	MOVLW      hi_addr(_tune+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R1+1, 1
	MOVF       R1+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R1+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      main_tuneBuffer_L0+2
;YM3812.c,130 :: 		tuneBuffer[3] = tune[3 + index];    // Press duration
	MOVF       R0+0, 0
	ADDLW      3
	MOVWF      R1+0
	CLRF       R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVLW      _tune+0
	ADDWF      R1+0, 1
	MOVLW      hi_addr(_tune+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R1+1, 1
	MOVF       R1+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R1+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      main_tuneBuffer_L0+3
;YM3812.c,131 :: 		tuneBuffer[4] = tune[4 + index];    // Next event
	MOVLW      4
	ADDWF      R0+0, 1
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _tune+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_tune+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      main_tuneBuffer_L0+4
;YM3812.c,133 :: 		i += 1;
	INCF       main_i_L0+0, 1
;YM3812.c,135 :: 		if(tuneBuffer[0] == 0xFF) {
	MOVF       main_tuneBuffer_L0+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;YM3812.c,136 :: 		isPlaying = 0x00;
	CLRF       main_isPlaying_L0+0
;YM3812.c,137 :: 		break;
	GOTO       L_main10
;YM3812.c,138 :: 		}
L_main11:
;YM3812.c,141 :: 		nextEvent = tuneBuffer[4];
	MOVF       main_tuneBuffer_L0+4, 0
	MOVWF      main_nextEvent_L0+0
;YM3812.c,144 :: 		YM3812_GetNote(tuneBuffer[1], &upper, &lower);
	MOVF       main_tuneBuffer_L0+1, 0
	MOVWF      FARG_YM3812_GetNote_n+0
	MOVLW      main_upper_L0+0
	MOVWF      FARG_YM3812_GetNote_upper+0
	MOVLW      main_lower_L0+0
	MOVWF      FARG_YM3812_GetNote_lower+0
	CALL       _YM3812_GetNote+0
;YM3812.c,145 :: 		SetFrequency(&channel[tuneBuffer[0]-1], upper, lower);
	MOVLW      1
	SUBWF      main_tuneBuffer_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      11
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetFrequency_channel+0
	MOVF       main_upper_L0+0, 0
	MOVWF      FARG_SetFrequency_upper+0
	MOVF       main_lower_L0+0, 0
	MOVWF      FARG_SetFrequency_lower+0
	CALL       _SetFrequency+0
;YM3812.c,148 :: 		SetBlock(&channel[tuneBuffer[0]-1], tuneBuffer[2]);
	MOVLW      1
	SUBWF      main_tuneBuffer_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      11
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_SetBlock_channel+0
	MOVF       main_tuneBuffer_L0+2, 0
	MOVWF      FARG_SetBlock_d+0
	CALL       _SetBlock+0
;YM3812.c,151 :: 		press[tuneBuffer[0]-1] = tuneBuffer[3];
	MOVLW      1
	SUBWF      main_tuneBuffer_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      main_press_L0+0
	MOVWF      FSR
	MOVF       main_tuneBuffer_L0+3, 0
	MOVWF      INDF+0
;YM3812.c,152 :: 		Play(&channel[tuneBuffer[0]-1]);
	MOVLW      1
	SUBWF      main_tuneBuffer_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      11
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_Play_channel+0
	CALL       _Play+0
;YM3812.c,154 :: 		}
	GOTO       L_main9
L_main10:
;YM3812.c,157 :: 		for(j = 0; j < NB_CHANNEL; ++j) {
	CLRF       main_j_L0+0
L_main13:
	MOVLW      2
	SUBWF      main_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;YM3812.c,158 :: 		if(press[j] == 0) {
	MOVF       main_j_L0+0, 0
	ADDLW      main_press_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;YM3812.c,159 :: 		Mute(&channel[j]);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_j_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_Mute_channel+0
	CALL       _Mute+0
;YM3812.c,160 :: 		}
	GOTO       L_main17
L_main16:
;YM3812.c,162 :: 		press[j] -=1;
	MOVF       main_j_L0+0, 0
	ADDLW      main_press_L0+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	DECF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;YM3812.c,163 :: 		}
L_main17:
;YM3812.c,157 :: 		for(j = 0; j < NB_CHANNEL; ++j) {
	INCF       main_j_L0+0, 1
;YM3812.c,164 :: 		}
	GOTO       L_main13
L_main14:
;YM3812.c,167 :: 		nextEvent -= 1;
	DECF       main_nextEvent_L0+0, 1
;YM3812.c,170 :: 		delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
;YM3812.c,171 :: 		} while(isPlaying);
	MOVF       main_isPlaying_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;YM3812.c,174 :: 		for(j = 0; j < NB_CHANNEL; ++j) {
	CLRF       main_j_L0+0
L_main19:
	MOVLW      2
	SUBWF      main_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;YM3812.c,175 :: 		Mute(&channel[j]);
	MOVLW      11
	MOVWF      R0+0
	MOVF       main_j_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      main_channel_L0+0
	MOVWF      FARG_Mute_channel+0
	CALL       _Mute+0
;YM3812.c,174 :: 		for(j = 0; j < NB_CHANNEL; ++j) {
	INCF       main_j_L0+0, 1
;YM3812.c,176 :: 		}
	GOTO       L_main19
L_main20:
;YM3812.c,177 :: 		}
	GOTO       L_main4
;YM3812.c,178 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
