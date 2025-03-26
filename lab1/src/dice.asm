;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"dice.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__gptrget2
	extern	__gptrput2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_generarAleatorio16
	global	_retardoVisual

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_dice_0	udata
r0x1014	res	1
r0x1013	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x100C	res	1
r0x100B	res	1
r0x100A	res	1
r0x100E	res	1
r0x100D	res	1
r0x1010	res	1
r0x100F	res	1
r0x1011	res	1
r0x1012	res	1
r0x1003	res	1
r0x1002	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
_main_semilla_65537_5	res	2
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_dice	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _generarAleatorio16
;   __moduint
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _retardoVisual
;   _generarAleatorio16
;   __moduint
;10 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   STK00
;   STK01
;   r0x1019
;   STK02
;; Starting pCode block
S_dice__main	code
_main:
; 2 exit points
;	.line	12; "dice.c"	TRISIO = 0b00100000;
	MOVLW	0x20
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	15; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	19; "dice.c"	unsigned short semilla = 1;      // Semilla para el generador LFSR
	MOVLW	0x01
	BANKSEL	_main_semilla_65537_5
	MOVWF	_main_semilla_65537_5
	CLRF	(_main_semilla_65537_5 + 1)
;	.line	20; "dice.c"	unsigned short *ptrSemilla = &semilla;
	MOVLW	high (_main_semilla_65537_5 + 0)
	BANKSEL	r0x1013
	MOVWF	r0x1013
	MOVLW	(_main_semilla_65537_5 + 0)
	MOVWF	r0x1014
	CLRF	r0x1015
;	.line	21; "dice.c"	unsigned short caraDado = 0;     // Almacena la cara resultante del dado
	CLRF	r0x1016
	CLRF	r0x1017
_00117_DS_:
;	.line	25; "dice.c"	if (GP5) {
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00114_DS_
;;unsigned compare: left < lit(0x1=1), size=2
;	.line	26; "dice.c"	switch (caraDado) {
	MOVLW	0x00
	BANKSEL	r0x1017
	SUBWF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00137_DS_
	MOVLW	0x01
	SUBWF	r0x1016,W
_00137_DS_:
	BTFSS	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7fff06d29f60
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x7=7), size=2
	MOVLW	0x00
	BANKSEL	r0x1017
	SUBWF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00138_DS_
	MOVLW	0x07
	SUBWF	r0x1016,W
_00138_DS_:
	BTFSC	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7fff06d29f60
	BANKSEL	r0x1016
	DECF	r0x1016,W
	MOVWF	r0x1018
	MOVLW	HIGH(_00139_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00139_DS_
	BANKSEL	r0x1018
	ADDWF	r0x1018,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00139_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
_00105_DS_:
;	.line	29; "dice.c"	GPIO = 0b00000010;
	MOVLW	0x02
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	30; "dice.c"	retardoVisual(retardo);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_retardoVisual
	CALL	_retardoVisual
	PAGESEL	$
;	.line	32; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	33; "dice.c"	break;
	GOTO	_00117_DS_
_00106_DS_:
;	.line	35; "dice.c"	GPIO = 0b00000001;
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	36; "dice.c"	retardoVisual(retardo);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_retardoVisual
	CALL	_retardoVisual
	PAGESEL	$
;	.line	37; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	38; "dice.c"	break;
	GOTO	_00117_DS_
_00107_DS_:
;	.line	40; "dice.c"	GPIO = 0b00000011;
	MOVLW	0x03
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	41; "dice.c"	retardoVisual(retardo);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_retardoVisual
	CALL	_retardoVisual
	PAGESEL	$
;	.line	42; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	43; "dice.c"	break;
	GOTO	_00117_DS_
_00108_DS_:
;	.line	45; "dice.c"	GPIO = 0b00010001;
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	46; "dice.c"	retardoVisual(retardo);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_retardoVisual
	CALL	_retardoVisual
	PAGESEL	$
;	.line	47; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	48; "dice.c"	break;
	GOTO	_00117_DS_
_00109_DS_:
;	.line	50; "dice.c"	GPIO = 0b00010110;
	MOVLW	0x16
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	51; "dice.c"	retardoVisual(retardo);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_retardoVisual
	CALL	_retardoVisual
	PAGESEL	$
;	.line	52; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	53; "dice.c"	break;
	GOTO	_00117_DS_
_00110_DS_:
;	.line	55; "dice.c"	GPIO = 0b00011001;
	MOVLW	0x19
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	56; "dice.c"	retardoVisual(retardo);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_retardoVisual
	CALL	_retardoVisual
	PAGESEL	$
;	.line	57; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	58; "dice.c"	break;
	GOTO	_00117_DS_
_00114_DS_:
;	.line	65; "dice.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	67; "dice.c"	generarAleatorio16(ptrSemilla);
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	STK01
	MOVF	r0x1013,W
	MOVWF	STK00
	MOVF	r0x1015,W
	PAGESEL	_generarAleatorio16
	CALL	_generarAleatorio16
	PAGESEL	$
;	.line	69; "dice.c"	caraDado = 1 + (semilla % 6);
	BANKSEL	_main_semilla_65537_5
	MOVF	_main_semilla_65537_5,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_main_semilla_65537_5
	MOVF	(_main_semilla_65537_5 + 1),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0x06
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
	MOVF	r0x1018,W
	MOVWF	r0x1016
	MOVF	r0x1019,W
	MOVWF	r0x1017
	GOTO	_00117_DS_
;	.line	72; "dice.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;; Starting pCode block
S_dice__retardoVisual	code
_retardoVisual:
; 2 exit points
;	.line	89; "dice.c"	void retardoVisual(unsigned int duracion) {
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
;	.line	91; "dice.c"	for (i = 0; i < duracion; i++) {
	CLRF	r0x1004
	CLRF	r0x1005
_00158_DS_:
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	SUBWF	r0x1005,W
	BTFSS	STATUS,2
	GOTO	_00179_DS_
	MOVF	r0x1003,W
	SUBWF	r0x1004,W
_00179_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3307: created from rifx:0x7fff06d29f60
;	.line	92; "dice.c"	for (j = 0; j < 256; j++) {
	BANKSEL	r0x1006
	CLRF	r0x1006
	MOVLW	0x01
	MOVWF	r0x1007
_00156_DS_:
	MOVLW	0xff
	BANKSEL	r0x1006
	ADDWF	r0x1006,W
	MOVWF	r0x1008
	MOVLW	0xff
	MOVWF	r0x1009
	MOVF	r0x1007,W
	BTFSC	STATUS,0
	INCFSZ	r0x1007,W
	ADDWF	r0x1009,F
	MOVF	r0x1008,W
	MOVWF	r0x1006
	MOVF	r0x1009,W
	MOVWF	r0x1007
	MOVF	r0x1009,W
	IORWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	91; "dice.c"	for (i = 0; i < duracion; i++) {
	INCF	r0x1004,F
	BTFSC	STATUS,2
	INCF	r0x1005,F
	GOTO	_00158_DS_
_00160_DS_:
;	.line	96; "dice.c"	}
	RETURN	
; exit point of _retardoVisual

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;13 compiler assigned registers:
;   r0x100A
;   STK00
;   r0x100B
;   STK01
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   STK02
;   STK03
;   r0x1011
;   r0x1012
;; Starting pCode block
S_dice__generarAleatorio16	code
_generarAleatorio16:
; 2 exit points
;	.line	75; "dice.c"	void generarAleatorio16(unsigned short *valorActual) {
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x100B
	MOVF	STK01,W
;	.line	77; "dice.c"	if ((*valorActual) & 1) {
	MOVWF	r0x100C
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	BTFSS	r0x100E,0
	GOTO	_00145_DS_
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
;	.line	79; "dice.c"	(*valorActual) >>= 1;
	BCF	STATUS,0
	RRF	r0x100D,W
	MOVWF	r0x100F
	RRF	r0x100E,W
	MOVWF	r0x1010
	MOVF	r0x100F,W
	MOVWF	STK02
	MOVF	r0x1010,W
	MOVWF	STK03
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
;	.line	81; "dice.c"	(*valorActual) ^= (1 << 15) | (1 << 14) | (1 << 12) | (1 << 3);
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	MOVWF	r0x1011
	MOVF	r0x100F,W
	MOVWF	r0x1012
	MOVLW	0x08
	XORWF	r0x1011,W
	MOVWF	r0x1011
	MOVWF	r0x1010
	MOVLW	0xd0
	XORWF	r0x1012,W
	MOVWF	r0x100F
	MOVWF	r0x1012
	MOVWF	STK02
	MOVF	r0x1011,W
	MOVWF	STK03
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
	GOTO	_00147_DS_
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
_00145_DS_:
;	.line	84; "dice.c"	(*valorActual) >>= 1;
	BCF	STATUS,0
	BANKSEL	r0x100D
	RRF	r0x100D,W
	MOVWF	r0x100F
	RRF	r0x100E,W
	MOVWF	r0x1010
	MOVF	r0x100F,W
	MOVWF	STK02
	MOVF	r0x1010,W
	MOVWF	STK03
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
_00147_DS_:
;	.line	86; "dice.c"	}
	RETURN	
; exit point of _generarAleatorio16


;	code size estimation:
;	  232+   62 =   294 instructions (  712 byte)

	end
