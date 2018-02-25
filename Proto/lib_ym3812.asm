
_YM3812_Init:

;lib_ym3812.c,6 :: 		void YM3812_Init() {
;lib_ym3812.c,8 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;lib_ym3812.c,9 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;lib_ym3812.c,11 :: 		DATA_PORT = 0x00;
	CLRF       PORTB+0
;lib_ym3812.c,12 :: 		CONTROL_PORT = MASK_RESET | MASK_CS;
	MOVLW      24
	MOVWF      PORTC+0
;lib_ym3812.c,13 :: 		}
L_end_YM3812_Init:
	RETURN
; end of _YM3812_Init

_YM3812_Reset:

;lib_ym3812.c,15 :: 		void YM3812_Reset() {
;lib_ym3812.c,16 :: 		CONTROL_PORT = MASK_CS;
	MOVLW      8
	MOVWF      PORTC+0
;lib_ym3812.c,17 :: 		delay_ms(25);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_YM3812_Reset0:
	DECFSZ     R13+0, 1
	GOTO       L_YM3812_Reset0
	DECFSZ     R12+0, 1
	GOTO       L_YM3812_Reset0
	NOP
;lib_ym3812.c,18 :: 		CONTROL_PORT = MASK_RESET | MASK_CS;
	MOVLW      24
	MOVWF      PORTC+0
;lib_ym3812.c,19 :: 		}
L_end_YM3812_Reset:
	RETURN
; end of _YM3812_Reset

_YM3812_WriteAddess:

;lib_ym3812.c,21 :: 		void YM3812_WriteAddess(const uint8_t addr) {
;lib_ym3812.c,23 :: 		CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD;
	MOVLW      28
	MOVWF      PORTC+0
;lib_ym3812.c,26 :: 		DATA_PORT = addr;
	MOVF       FARG_YM3812_WriteAddess_addr+0, 0
	MOVWF      PORTB+0
;lib_ym3812.c,29 :: 		CONTROL_PORT = MASK_RESET | MASK_RD;
	MOVLW      20
	MOVWF      PORTC+0
;lib_ym3812.c,30 :: 		asm {nop};
	NOP
;lib_ym3812.c,31 :: 		CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD;
	MOVLW      28
	MOVWF      PORTC+0
;lib_ym3812.c,32 :: 		}
L_end_YM3812_WriteAddess:
	RETURN
; end of _YM3812_WriteAddess

_YM3812_WriteData:

;lib_ym3812.c,34 :: 		void YM3812_WriteData(const uint8_t dt) {
;lib_ym3812.c,36 :: 		CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD| MASK_A0;
	MOVLW      29
	MOVWF      PORTC+0
;lib_ym3812.c,39 :: 		DATA_PORT = dt;
	MOVF       FARG_YM3812_WriteData_dt+0, 0
	MOVWF      PORTB+0
;lib_ym3812.c,42 :: 		CONTROL_PORT = MASK_RESET | MASK_RD | MASK_A0;
	MOVLW      21
	MOVWF      PORTC+0
;lib_ym3812.c,43 :: 		asm {nop};
	NOP
;lib_ym3812.c,44 :: 		CONTROL_PORT = MASK_RESET | MASK_CS | MASK_RD | MASK_A0;
	MOVLW      29
	MOVWF      PORTC+0
;lib_ym3812.c,45 :: 		}
L_end_YM3812_WriteData:
	RETURN
; end of _YM3812_WriteData

_YM3812_SetRegister:

;lib_ym3812.c,51 :: 		) {
;lib_ym3812.c,52 :: 		YM3812_WriteAddess(reg + YM3812_channelOffset[ch]);
	MOVF       FARG_YM3812_SetRegister_ch+0, 0
	ADDLW      _YM3812_channelOffset+0
	MOVWF      R0+0
	MOVLW      hi_addr(_YM3812_channelOffset+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      FARG_YM3812_SetRegister_reg+0, 0
	MOVWF      FARG_YM3812_WriteAddess_addr+0
	CALL       _YM3812_WriteAddess+0
;lib_ym3812.c,53 :: 		YM3812_WriteData(dt);
	MOVF       FARG_YM3812_SetRegister_dt+0, 0
	MOVWF      FARG_YM3812_WriteData_dt+0
	CALL       _YM3812_WriteData+0
;lib_ym3812.c,54 :: 		}
L_end_YM3812_SetRegister:
	RETURN
; end of _YM3812_SetRegister

_YM3812_SetOperatorRegister:

;lib_ym3812.c,62 :: 		) {
;lib_ym3812.c,63 :: 		YM3812_WriteAddess(reg + YM3812_channelOffset[ch] + (op ? 3 : 0));
	MOVF       FARG_YM3812_SetOperatorRegister_ch+0, 0
	ADDLW      _YM3812_channelOffset+0
	MOVWF      R0+0
	MOVLW      hi_addr(_YM3812_channelOffset+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      FARG_YM3812_SetOperatorRegister_reg+0, 0
	MOVWF      FARG_YM3812_WriteAddess_addr+0
	MOVF       FARG_YM3812_SetOperatorRegister_op+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_SetOperatorRegister1
	MOVLW      3
	MOVWF      ?FLOC___YM3812_SetOperatorRegisterT10+0
	GOTO       L_YM3812_SetOperatorRegister2
L_YM3812_SetOperatorRegister1:
	CLRF       ?FLOC___YM3812_SetOperatorRegisterT10+0
L_YM3812_SetOperatorRegister2:
	MOVF       ?FLOC___YM3812_SetOperatorRegisterT10+0, 0
	ADDWF      FARG_YM3812_WriteAddess_addr+0, 1
	CALL       _YM3812_WriteAddess+0
;lib_ym3812.c,64 :: 		YM3812_WriteData(dt);
	MOVF       FARG_YM3812_SetOperatorRegister_dt+0, 0
	MOVWF      FARG_YM3812_WriteData_dt+0
	CALL       _YM3812_WriteData+0
;lib_ym3812.c,65 :: 		}
L_end_YM3812_SetOperatorRegister:
	RETURN
; end of _YM3812_SetOperatorRegister

_YM3812_GetNote:

;lib_ym3812.c,71 :: 		) {
;lib_ym3812.c,72 :: 		switch(n){
	GOTO       L_YM3812_GetNote3
;lib_ym3812.c,73 :: 		case 0x00:
L_YM3812_GetNote5:
;lib_ym3812.c,74 :: 		*upper = 0x01;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;lib_ym3812.c,75 :: 		*lower = 0x6B;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      107
	MOVWF      INDF+0
;lib_ym3812.c,76 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,77 :: 		case 0x01:
L_YM3812_GetNote6:
;lib_ym3812.c,78 :: 		*upper = 0x01;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;lib_ym3812.c,79 :: 		*lower = 0x81;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      129
	MOVWF      INDF+0
;lib_ym3812.c,80 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,81 :: 		case 0x02:
L_YM3812_GetNote7:
;lib_ym3812.c,82 :: 		*upper = 0x01;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;lib_ym3812.c,83 :: 		*lower = 0x98;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      152
	MOVWF      INDF+0
;lib_ym3812.c,84 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,85 :: 		case 0x03:
L_YM3812_GetNote8:
;lib_ym3812.c,86 :: 		*upper = 0x01;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;lib_ym3812.c,87 :: 		*lower = 0xB0;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      176
	MOVWF      INDF+0
;lib_ym3812.c,88 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,89 :: 		case 0x04:
L_YM3812_GetNote9:
;lib_ym3812.c,90 :: 		*upper = 0x01;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;lib_ym3812.c,91 :: 		*lower = 0xCA;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      202
	MOVWF      INDF+0
;lib_ym3812.c,92 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,93 :: 		case 0x05:
L_YM3812_GetNote10:
;lib_ym3812.c,94 :: 		*upper = 0x01;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
;lib_ym3812.c,95 :: 		*lower = 0xE5;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      229
	MOVWF      INDF+0
;lib_ym3812.c,96 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,97 :: 		case 0x06:
L_YM3812_GetNote11:
;lib_ym3812.c,98 :: 		*upper = 0x02;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,99 :: 		*lower = 0x02;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,100 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,101 :: 		case 0x07:
L_YM3812_GetNote12:
;lib_ym3812.c,102 :: 		*upper = 0x02;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,103 :: 		*lower = 0x20;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
;lib_ym3812.c,104 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,105 :: 		case 0x08:
L_YM3812_GetNote13:
;lib_ym3812.c,106 :: 		*upper = 0x02;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,107 :: 		*lower = 0x41;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
;lib_ym3812.c,108 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,109 :: 		case 0x09:
L_YM3812_GetNote14:
;lib_ym3812.c,110 :: 		*upper = 0x02;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,111 :: 		*lower = 0x63;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      99
	MOVWF      INDF+0
;lib_ym3812.c,112 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,113 :: 		case 0x0A:
L_YM3812_GetNote15:
;lib_ym3812.c,114 :: 		*upper = 0x02;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,115 :: 		*lower = 0x87;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      135
	MOVWF      INDF+0
;lib_ym3812.c,116 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,117 :: 		case 0x0B:
L_YM3812_GetNote16:
;lib_ym3812.c,118 :: 		*upper = 0x02;
	MOVF       FARG_YM3812_GetNote_upper+0, 0
	MOVWF      FSR
	MOVLW      2
	MOVWF      INDF+0
;lib_ym3812.c,119 :: 		*lower = 0xAE;
	MOVF       FARG_YM3812_GetNote_lower+0, 0
	MOVWF      FSR
	MOVLW      174
	MOVWF      INDF+0
;lib_ym3812.c,120 :: 		break;
	GOTO       L_YM3812_GetNote4
;lib_ym3812.c,121 :: 		}
L_YM3812_GetNote3:
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote5
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote6
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote7
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote8
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote9
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote10
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote11
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote12
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote13
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote14
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote15
	MOVF       FARG_YM3812_GetNote_n+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_YM3812_GetNote16
L_YM3812_GetNote4:
;lib_ym3812.c,122 :: 		}
L_end_YM3812_GetNote:
	RETURN
; end of _YM3812_GetNote
