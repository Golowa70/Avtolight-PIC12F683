opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6446"

opt pagewidth 120

	opt pm

	processor	12F683
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_fnPodgot
	FNCALL	_main,_mainled1
	FNCALL	_main,_gotosleep
	FNCALL	_mainled1,_lightingled1
	FNCALL	_mainled1,_blankingled1
	FNCALL	_blankingled1,___lbmod
	FNCALL	_lightingled1,___lbmod
	FNROOT	_main
	FNCALL	_tmr0,_fnInputpins
	FNCALL	_tmr0,_fnPwm1
	FNCALL	intlevel1,_tmr0
	global	intlevel1
	FNROOT	intlevel1
	global	_alarmOff
	global	_doorClose
	global	_keyInLockOn
	global	_keyPowerOn
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
	line	38

;initializer for _alarmOff
	retlw	01h
	line	36

;initializer for _doorClose
	retlw	01h
	line	41

;initializer for _keyInLockOn
	retlw	01h
	line	39

;initializer for _keyPowerOn
	retlw	01h
	global	_door
	global	_key
	global	_pwmduty1
	global	_adKeyInLock
	global	_adKeyInLock2
	global	_adKeyPower
	global	_adKeyPower2
	global	_alarm
	global	_alarmOn
	global	_doorOpen
	global	_flagalarm
	global	_keyInLockOff
	global	_keyPowerOff
	global	_tic
	global	_togel
	global	_tmrSleep
	global	_adAlarm
	global	_adAlarm2
	global	_adDoor
	global	_adDoor2
	global	_flagtimer1
	global	_flagtimer2
	global	_flagtimer3
	global	_ADCON0
_ADCON0	set	31
	global	_CCP1CON
_CCP1CON	set	21
	global	_CCPR1L
_CCPR1L	set	19
	global	_CMCON0
_CMCON0	set	25
	global	_GPIO
_GPIO	set	5
	global	_INTCON
_INTCON	set	11
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_GPIE
_GPIE	set	91
	global	_GPIF
_GPIF	set	88
	global	_GPIO0
_GPIO0	set	40
	global	_GPIO1
_GPIO1	set	41
	global	_GPIO3
_GPIO3	set	43
	global	_GPIO4
_GPIO4	set	44
	global	_GPIO5
_GPIO5	set	45
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR1IF
_TMR1IF	set	96
	global	_ANSEL
_ANSEL	set	159
	global	_IOC
_IOC	set	150
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISIO
_TRISIO	set	133
	global	_WPU
_WPU	set	149
	global	_TMR1IE
_TMR1IE	set	1120
	file	"AV12F683.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_flagtimer1:
       ds      1

_flagtimer2:
       ds      1

_flagtimer3:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_tmrSleep:
       ds      2

_adAlarm:
       ds      1

_adAlarm2:
       ds      1

_adDoor:
       ds      1

_adDoor2:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_door:
       ds      8

_key:
       ds      3

_pwmduty1:
       ds      2

_adKeyInLock:
       ds      1

_adKeyInLock2:
       ds      1

_adKeyPower:
       ds      1

_adKeyPower2:
       ds      1

_alarm:
       ds      1

_alarmOn:
       ds      1

_doorOpen:
       ds      1

_flagalarm:
       ds      1

_keyInLockOff:
       ds      1

_keyPowerOff:
       ds      1

_tic:
       ds      1

_togel:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
	line	38
_alarmOff:
       ds      1

psect	dataBANK0
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
	line	36
_doorClose:
       ds      1

psect	dataBANK0
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
	line	41
_keyInLockOn:
       ds      1

psect	dataBANK0
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
	line	39
_keyPowerOn:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+06h)
	fcall	clear_ram
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+019h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_fnInputpins
?_fnInputpins:	; 0 bytes @ 0x0
	global	??_fnInputpins
??_fnInputpins:	; 0 bytes @ 0x0
	global	?_fnPwm1
?_fnPwm1:	; 0 bytes @ 0x0
	global	?_fnPodgot
?_fnPodgot:	; 0 bytes @ 0x0
	global	?_gotosleep
?_gotosleep:	; 0 bytes @ 0x0
	global	?_lightingled1
?_lightingled1:	; 0 bytes @ 0x0
	global	?_blankingled1
?_blankingled1:	; 0 bytes @ 0x0
	global	?_mainled1
?_mainled1:	; 0 bytes @ 0x0
	global	?_tmr0
?_tmr0:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	fnPwm1@n
fnPwm1@n:	; 2 bytes @ 0x0
	ds	2
	global	??_fnPwm1
??_fnPwm1:	; 0 bytes @ 0x2
	ds	2
	global	??_tmr0
??_tmr0:	; 0 bytes @ 0x4
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_fnPodgot
??_fnPodgot:	; 0 bytes @ 0x0
	global	??_gotosleep
??_gotosleep:	; 0 bytes @ 0x0
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x0
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x0
	ds	1
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x1
	ds	1
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x2
	ds	1
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x3
	ds	1
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x4
	ds	1
	global	??_lightingled1
??_lightingled1:	; 0 bytes @ 0x5
	global	??_blankingled1
??_blankingled1:	; 0 bytes @ 0x5
	global	??_mainled1
??_mainled1:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 4, bss 31, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      14
;; BANK0           80      5      34
;; BANK1           32      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _tmr0 in COMMON
;;
;;   _tmr0->_fnPwm1
;;
;; Critical Paths under _main in BANK0
;;
;;   _blankingled1->___lbmod
;;   _lightingled1->___lbmod
;;
;; Critical Paths under _tmr0 in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _tmr0 in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     318
;;                           _fnPodgot
;;                           _mainled1
;;                          _gotosleep
;; ---------------------------------------------------------------------------------
;; (1) _mainled1                                             0     0      0     318
;;                       _lightingled1
;;                       _blankingled1
;; ---------------------------------------------------------------------------------
;; (2) _blankingled1                                         0     0      0     159
;;                            ___lbmod
;; ---------------------------------------------------------------------------------
;; (2) _lightingled1                                         0     0      0     159
;;                            ___lbmod
;; ---------------------------------------------------------------------------------
;; (3) ___lbmod                                              5     4      1     159
;;                                              0 BANK0      5     4      1
;; ---------------------------------------------------------------------------------
;; (1) _fnPodgot                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gotosleep                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _tmr0                                                 3     3      0      88
;;                                              4 COMMON     3     3      0
;;                        _fnInputpins
;;                             _fnPwm1
;; ---------------------------------------------------------------------------------
;; (5) _fnPwm1                                               4     2      2      88
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (5) _fnInputpins                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _fnPodgot
;;   _mainled1
;;     _lightingled1
;;       ___lbmod
;;     _blankingled1
;;       ___lbmod
;;   _gotosleep
;;
;; _tmr0 (ROOT)
;;   _fnInputpins
;;   _fnPwm1
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       5        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      37       8        0.0%
;;ABS                  0      0      30       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      5      22       4       42.5%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       E       1      100.0%
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 253 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_fnPodgot
;;		_mainled1
;;		_gotosleep
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
	line	253
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	255
	
l2892:	
;AV12F683.c: 255: fnPodgot();
	fcall	_fnPodgot
	line	256
	
l2894:	
;AV12F683.c: 256: door.status=1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_door)+01h	;volatile
	line	260
	
l2896:	
# 260 "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
clrwdt ;#
psect	maintext
	line	262
	
l2898:	
;AV12F683.c: 262: mainled1();
	fcall	_mainled1
	line	264
	
l2900:	
;AV12F683.c: 264: if(pwmduty1==0 ){
	movf	((_pwmduty1+1)),w
	iorwf	((_pwmduty1)),w
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l2896
u1860:
	line	265
	
l2902:	
;AV12F683.c: 265: gotosleep();
	fcall	_gotosleep
	goto	l2896
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	269
	signat	_main,88
	global	_mainled1
psect	text252,local,class=CODE,delta=2
global __ptext252
__ptext252:

;; *************** function _mainled1 *****************
;; Defined at:
;;		line 94 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lightingled1
;;		_blankingled1
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text252
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
	line	94
	global	__size_of_mainled1
	__size_of_mainled1	equ	__end_of_mainled1-_mainled1
	
_mainled1:	
	opt	stack 7
; Regs used in _mainled1: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	95
	
l2774:	
;AV12F683.c: 95: if(key.power==1 && key.in_lock==1)key.flag=1;
	decf	0+(_key)+02h,w
	skipz
	goto	u1531
	goto	u1530
u1531:
	goto	l2780
u1530:
	
l2776:	
	decf	0+(_key)+01h,w
	skipz
	goto	u1541
	goto	u1540
u1541:
	goto	l2780
u1540:
	
l2778:	
	clrf	(_key)
	incf	(_key),f
	line	96
	
l2780:	
;AV12F683.c: 96: if(door.status==1)door.flag=0;
	decf	0+(_door)+01h,w	;volatile
	skipz
	goto	u1551
	goto	u1550
u1551:
	goto	l2784
u1550:
	
l2782:	
	clrf	(_door)	;volatile
	line	97
	
l2784:	
;AV12F683.c: 97: if(alarm==1)flagalarm=1;
	decf	(_alarm),w
	skipz
	goto	u1561
	goto	u1560
u1561:
	goto	l2890
u1560:
	
l2786:	
	clrf	(_flagalarm)
	incf	(_flagalarm),f
	goto	l2890
	line	104
	
l2788:	
;AV12F683.c: 104: if(door.status==0 && door.flag==0 && alarm==0){togel=1;}
	movf	0+(_door)+01h,f
	skipz	;volatile
	goto	u1571
	goto	u1570
u1571:
	goto	l2796
u1570:
	
l2790:	
	movf	(_door),f
	skipz	;volatile
	goto	u1581
	goto	u1580
u1581:
	goto	l2796
u1580:
	
l2792:	
	movf	(_alarm),f
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l2796
u1590:
	
l2794:	
	clrf	(_togel)
	incf	(_togel),f
	line	105
	
l2796:	
;AV12F683.c: 105: if(alarm==0 && flagalarm ==1 ){flagalarm=0;togel=1;}
	movf	(_alarm),f
	skipz
	goto	u1601
	goto	u1600
u1601:
	goto	l2804
u1600:
	
l2798:	
	decf	(_flagalarm),w
	skipz
	goto	u1611
	goto	u1610
u1611:
	goto	l2804
u1610:
	
l2800:	
	clrf	(_flagalarm)
	
l2802:	
	clrf	(_togel)
	incf	(_togel),f
	line	106
	
l2804:	
;AV12F683.c: 106: if(key.in_lock==0 && key.flag==1 && key.power==0 && alarm==0 ){key.flag=0;togel=1;}
	movf	0+(_key)+01h,f
	skipz
	goto	u1621
	goto	u1620
u1621:
	goto	l433
u1620:
	
l2806:	
	decf	(_key),w
	skipz
	goto	u1631
	goto	u1630
u1631:
	goto	l433
u1630:
	
l2808:	
	movf	0+(_key)+02h,f
	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l433
u1640:
	
l2810:	
	movf	(_alarm),f
	skipz
	goto	u1651
	goto	u1650
u1651:
	goto	l433
u1650:
	
l2812:	
	clrf	(_key)
	
l2814:	
	clrf	(_togel)
	incf	(_togel),f
	goto	l433
	line	110
	
l2816:	
;AV12F683.c: 110: lightingled1();
	fcall	_lightingled1
	line	111
	
l2818:	
;AV12F683.c: 111: if(door.status==1 && key.power==1){togel=4;}
	decf	0+(_door)+01h,w	;volatile
	skipz
	goto	u1661
	goto	u1660
u1661:
	goto	l413
u1660:
	
l2820:	
	decf	0+(_key)+02h,w
	skipz
	goto	u1671
	goto	u1670
u1671:
	goto	l413
u1670:
	
l2822:	
	movlw	(04h)
	movwf	(_togel)
	
l413:	
	line	112
;AV12F683.c: 112: if(alarm==1){togel=4;}
	decf	(_alarm),w
	skipz
	goto	u1681
	goto	u1680
u1681:
	goto	l414
u1680:
	
l2824:	
	movlw	(04h)
	movwf	(_togel)
	
l414:	
	line	113
;AV12F683.c: 113: if(pwmduty1==pwmMax){togel=2;} break;
	incf	(_pwmduty1),w
	movlw	3
	skipnz
	xorwf	(_pwmduty1+1),w

	skipz
	goto	u1691
	goto	u1690
u1691:
	goto	l433
u1690:
	
l2826:	
	movlw	(02h)
	movwf	(_togel)
	goto	l433
	line	116
	
l2828:	
;AV12F683.c: 116: if(door.status==1){flagtimer1=0;door.flag=0;togel=3;}
	decf	0+(_door)+01h,w	;volatile
	skipz
	goto	u1701
	goto	u1700
u1701:
	goto	l2836
u1700:
	
l2830:	
	bcf	(_flagtimer1/8),(_flagtimer1)&7
	
l2832:	
	clrf	(_door)	;volatile
	
l2834:	
	movlw	(03h)
	movwf	(_togel)
	line	117
	
l2836:	
;AV12F683.c: 117: if(door.status==0){
	movf	0+(_door)+01h,f
	skipz	;volatile
	goto	u1711
	goto	u1710
u1711:
	goto	l433
u1710:
	line	118
	
l2838:	
;AV12F683.c: 118: flagtimer2=0;
	bcf	(_flagtimer2/8),(_flagtimer2)&7
	line	119
;AV12F683.c: 119: if(flagtimer1==0){door.tmrOpen = -300000; flagtimer1=1;}
	btfsc	(_flagtimer1/8),(_flagtimer1)&7
	goto	u1721
	goto	u1720
u1721:
	goto	l419
u1720:
	
l2840:	
	movlw	0FFh
	movwf	3+(_door)+02h	;volatile
	movlw	0FBh
	movwf	2+(_door)+02h	;volatile
	movlw	06Ch
	movwf	1+(_door)+02h	;volatile
	movlw	020h
	movwf	0+(_door)+02h	;volatile

	
l2842:	
	bsf	(_flagtimer1/8),(_flagtimer1)&7
	
l419:	
	line	120
;AV12F683.c: 120: if(door.tmrOpen==0){door.flag=1;togel=4;}
	movf	3+(_door)+02h,w	;volatile
	iorwf	2+(_door)+02h,w	;volatile
	iorwf	1+(_door)+02h,w	;volatile
	iorwf	0+(_door)+02h,w	;volatile
	skipz
	goto	u1731
	goto	u1730
u1731:
	goto	l420
u1730:
	
l2844:	
	movlw	(01h)
	movwf	(_door)	;volatile
	movlw	(04h)
	movwf	(_togel)
	
l420:	
	line	121
;AV12F683.c: 121: if(alarm==1){togel=4;}
	decf	(_alarm),w
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l433
u1740:
	
l2846:	
	movlw	(04h)
	movwf	(_togel)
	goto	l433
	line	125
;AV12F683.c: 125: case 3 :
	
l422:	
	line	126
;AV12F683.c: 126: if(flagtimer2==0){door.tmrClose = -30000; flagtimer2=1;}
	btfsc	(_flagtimer2/8),(_flagtimer2)&7
	goto	u1751
	goto	u1750
u1751:
	goto	l2852
u1750:
	
l2848:	
	movlw	low(-30000)
	movwf	0+(_door)+06h	;volatile
	movlw	high(-30000)
	movwf	(0+(_door)+06h)+1	;volatile
	
l2850:	
	bsf	(_flagtimer2/8),(_flagtimer2)&7
	line	127
	
l2852:	
;AV12F683.c: 127: if(door.tmrClose==0){togel=4;}
	movf	(1+(_door)+06h),w	;volatile
	iorwf	(0+(_door)+06h),w	;volatile
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l424
u1760:
	
l2854:	
	movlw	(04h)
	movwf	(_togel)
	
l424:	
	line	128
;AV12F683.c: 128: if(key.power==1)togel=4;
	decf	0+(_key)+02h,w
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l425
u1770:
	
l2856:	
	movlw	(04h)
	movwf	(_togel)
	
l425:	
	line	129
;AV12F683.c: 129: if(alarm==1){togel=4;}
	decf	(_alarm),w
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l2860
u1780:
	
l2858:	
	movlw	(04h)
	movwf	(_togel)
	line	130
	
l2860:	
;AV12F683.c: 130: if(door.status==0){flagtimer1=0;togel=1;} break;
	movf	0+(_door)+01h,f
	skipz	;volatile
	goto	u1791
	goto	u1790
u1791:
	goto	l433
u1790:
	
l2862:	
	bcf	(_flagtimer1/8),(_flagtimer1)&7
	clrf	(_togel)
	incf	(_togel),f
	goto	l433
	line	132
;AV12F683.c: 132: case 4 :
	
l428:	
	line	133
;AV12F683.c: 133: flagtimer1=0;
	bcf	(_flagtimer1/8),(_flagtimer1)&7
	line	134
;AV12F683.c: 134: flagtimer2=0;
	bcf	(_flagtimer2/8),(_flagtimer2)&7
	line	135
	
l2864:	
;AV12F683.c: 135: blankingled1();
	fcall	_blankingled1
	line	137
	
l2866:	
;AV12F683.c: 137: if(alarm==0 && flagalarm==1 ){flagalarm=0;togel=1;}
	movf	(_alarm),f
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l2874
u1800:
	
l2868:	
	decf	(_flagalarm),w
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l2874
u1810:
	
l2870:	
	clrf	(_flagalarm)
	
l2872:	
	clrf	(_togel)
	incf	(_togel),f
	line	138
	
l2874:	
;AV12F683.c: 138: if(door.status==0 && door.flag ==0 && alarm==0 ){togel=1;}
	movf	0+(_door)+01h,f
	skipz	;volatile
	goto	u1821
	goto	u1820
u1821:
	goto	l2882
u1820:
	
l2876:	
	movf	(_door),f
	skipz	;volatile
	goto	u1831
	goto	u1830
u1831:
	goto	l2882
u1830:
	
l2878:	
	movf	(_alarm),f
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l2882
u1840:
	
l2880:	
	clrf	(_togel)
	incf	(_togel),f
	line	139
	
l2882:	
;AV12F683.c: 139: if(pwmduty1==0 ){flagtimer3=0;togel=0;} break;
	movf	((_pwmduty1+1)),w
	iorwf	((_pwmduty1)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l433
u1850:
	
l2884:	
	bcf	(_flagtimer3/8),(_flagtimer3)&7
	
l2886:	
	clrf	(_togel)
	goto	l433
	line	101
	
l2890:	
	movf	(_togel),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    16     9 (average)
; direct_byte    18    13 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l2788
	xorlw	1^0	; case 1
	skipnz
	goto	l2816
	xorlw	2^1	; case 2
	skipnz
	goto	l2828
	xorlw	3^2	; case 3
	skipnz
	goto	l422
	xorlw	4^3	; case 4
	skipnz
	goto	l428
	goto	l433

	line	145
	
l433:	
	return
	opt stack 0
GLOBAL	__end_of_mainled1
	__end_of_mainled1:
;; =============== function _mainled1 ends ============

	signat	_mainled1,88
	global	_blankingled1
psect	text253,local,class=CODE,delta=2
global __ptext253
__ptext253:

;; *************** function _blankingled1 *****************
;; Defined at:
;;		line 82 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbmod
;; This function is called by:
;;		_mainled1
;; This function uses a non-reentrant model
;;
psect	text253
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
	line	82
	global	__size_of_blankingled1
	__size_of_blankingled1	equ	__end_of_blankingled1-_blankingled1
	
_blankingled1:	
	opt	stack 6
; Regs used in _blankingled1: [wreg+status,2+status,0+pclath+cstack]
	line	84
	
l2762:	
;AV12F683.c: 84: if (pwmduty1 !=0){
	movf	(_pwmduty1+1),w
	iorwf	(_pwmduty1),w
	skipnz
	goto	u1491
	goto	u1490
u1491:
	goto	l400
u1490:
	line	85
	
l2764:	
;AV12F683.c: 85: if(key.power==0){
	movf	0+(_key)+02h,f
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l2770
u1500:
	line	86
	
l2766:	
;AV12F683.c: 86: if ((tic % 20) ==0)pwmduty1--;
	movlw	(014h)
	movwf	(?___lbmod)
	movf	(_tic),w	;volatile
	fcall	___lbmod
	iorlw	0
	skipz
	goto	u1511
	goto	u1510
u1511:
	goto	l400
u1510:
	
l2768:	
	movlw	low(01h)
	subwf	(_pwmduty1),f
	movlw	high(01h)
	skipc
	decf	(_pwmduty1+1),f
	subwf	(_pwmduty1+1),f
	goto	l400
	line	89
	
l2770:	
;AV12F683.c: 88: else{
;AV12F683.c: 89: if((tic % 5) ==0)pwmduty1--;
	movlw	(05h)
	movwf	(?___lbmod)
	movf	(_tic),w	;volatile
	fcall	___lbmod
	iorlw	0
	skipz
	goto	u1521
	goto	u1520
u1521:
	goto	l400
u1520:
	goto	l2768
	line	92
	
l400:	
	return
	opt stack 0
GLOBAL	__end_of_blankingled1
	__end_of_blankingled1:
;; =============== function _blankingled1 ends ============

	signat	_blankingled1,88
	global	_lightingled1
psect	text254,local,class=CODE,delta=2
global __ptext254
__ptext254:

;; *************** function _lightingled1 *****************
;; Defined at:
;;		line 73 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbmod
;; This function is called by:
;;		_mainled1
;; This function uses a non-reentrant model
;;
psect	text254
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
	line	73
	global	__size_of_lightingled1
	__size_of_lightingled1	equ	__end_of_lightingled1-_lightingled1
	
_lightingled1:	
	opt	stack 6
; Regs used in _lightingled1: [wreg+status,2+status,0+pclath+cstack]
	line	75
	
l2756:	
;AV12F683.c: 75: if (pwmduty1 < pwmMax){
	movlw	high(03FFh)
	subwf	(_pwmduty1+1),w
	movlw	low(03FFh)
	skipnz
	subwf	(_pwmduty1),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l392
u1470:
	line	76
	
l2758:	
;AV12F683.c: 76: if( (tic % 10) ==0){
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_tic),w	;volatile
	fcall	___lbmod
	iorlw	0
	skipz
	goto	u1481
	goto	u1480
u1481:
	goto	l392
u1480:
	line	77
	
l2760:	
;AV12F683.c: 77: pwmduty1++;
	incf	(_pwmduty1),f
	skipnz
	incf	(_pwmduty1+1),f
	line	80
	
l392:	
	return
	opt stack 0
GLOBAL	__end_of_lightingled1
	__end_of_lightingled1:
;; =============== function _lightingled1 ends ============

	signat	_lightingled1,88
	global	___lbmod
psect	text255,local,class=CODE,delta=2
global __ptext255
__ptext255:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    2[BANK0 ] unsigned char 
;;  rem             1    4[BANK0 ] unsigned char 
;;  counter         1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lightingled1
;;		_blankingled1
;; This function uses a non-reentrant model
;;
psect	text255
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 5
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l2536:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l2538:	
	clrf	(___lbmod@rem)
	line	12
	
l2540:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u1025:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u1025
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l2542:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l2544:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l2548
u1030:
	line	15
	
l2546:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l2548:	
	decfsz	(___lbmod@counter),f
	goto	u1041
	goto	u1040
u1041:
	goto	l2540
u1040:
	line	17
	
l2550:	
	movf	(___lbmod@rem),w
	line	18
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	_fnPodgot
psect	text256,local,class=CODE,delta=2
global __ptext256
__ptext256:

;; *************** function _fnPodgot *****************
;; Defined at:
;;		line 9 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\podgot12f683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text256
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\podgot12f683.c"
	line	9
	global	__size_of_fnPodgot
	__size_of_fnPodgot	equ	__end_of_fnPodgot-_fnPodgot
	
_fnPodgot:	
	opt	stack 7
; Regs used in _fnPodgot: [wreg+status,2]
	line	10
	
l2722:	
;podgot12f683.c: 10: TRISIO=0b111001;
	movlw	(039h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	11
	
l2724:	
;podgot12f683.c: 11: GPIO=0b000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	12
	
l2726:	
;podgot12f683.c: 12: IOC=0b00111001;
	movlw	(039h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	13
	
l2728:	
;podgot12f683.c: 13: CMCON0=0b00000111;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	14
	
l2730:	
;podgot12f683.c: 14: ADCON0=0b00000000;
	clrf	(31)	;volatile
	line	15
	
l2732:	
;podgot12f683.c: 15: ANSEL=0b000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	16
	
l2734:	
;podgot12f683.c: 16: WPU=0b100001;
	movlw	(021h)
	movwf	(149)^080h	;volatile
	line	17
	
l2736:	
;podgot12f683.c: 17: INTCON=0b11000000;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	18
	
l2738:	
;podgot12f683.c: 18: PIE1=0b00000001;
	movlw	(01h)
	movwf	(140)^080h	;volatile
	line	19
	
l2740:	
;podgot12f683.c: 19: OPTION=0b00000111;
	movlw	(07h)
	movwf	(129)^080h	;volatile
	line	21
	
l2742:	
;podgot12f683.c: 21: T1CON=0b00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	22
	
l2744:	
;podgot12f683.c: 22: T2CON=0b00000100;
	movlw	(04h)
	movwf	(18)	;volatile
	line	24
	
l2746:	
;podgot12f683.c: 24: TMR1H =0b11111011;
	movlw	(0FBh)
	movwf	(15)	;volatile
	line	25
	
l2748:	
;podgot12f683.c: 25: TMR1L =0b00011101;
	movlw	(01Dh)
	movwf	(14)	;volatile
	line	27
	
l2750:	
;podgot12f683.c: 27: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(21)	;volatile
	line	28
	
l2752:	
;podgot12f683.c: 28: PR2 = 0xff;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	30
	
l2754:	
;podgot12f683.c: 30: CCPR1L=0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	33
;podgot12f683.c: 33: OSCCON = 0b01110000;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	34
	
l1579:	
	return
	opt stack 0
GLOBAL	__end_of_fnPodgot
	__end_of_fnPodgot:
;; =============== function _fnPodgot ends ============

	signat	_fnPodgot,88
	global	_gotosleep
psect	text257,local,class=CODE,delta=2
global __ptext257
__ptext257:

;; *************** function _gotosleep *****************
;; Defined at:
;;		line 54 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text257
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
	line	54
	global	__size_of_gotosleep
	__size_of_gotosleep	equ	__end_of_gotosleep-_gotosleep
	
_gotosleep:	
	opt	stack 7
; Regs used in _gotosleep: [wreg+status,2+status,0]
	line	57
	
l2708:	
;AV12F683.c: 57: if(flagtimer3==0){
	btfsc	(_flagtimer3/8),(_flagtimer3)&7
	goto	u1451
	goto	u1450
u1451:
	goto	l2714
u1450:
	line	58
	
l2710:	
;AV12F683.c: 58: tmrSleep = -5000 ;
	movlw	low(-5000)
	movwf	(_tmrSleep)	;volatile
	movlw	high(-5000)
	movwf	((_tmrSleep))+1	;volatile
	line	59
	
l2712:	
;AV12F683.c: 59: flagtimer3=1;
	bsf	(_flagtimer3/8),(_flagtimer3)&7
	line	62
	
l2714:	
;AV12F683.c: 60: }
;AV12F683.c: 62: if(tmrSleep == 0){
	movf	((_tmrSleep+1)),w	;volatile
	iorwf	((_tmrSleep)),w	;volatile
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l387
u1460:
	line	63
	
l2716:	
;AV12F683.c: 63: GPIE =1;
	bsf	(91/8),(91)&7
	line	64
;AV12F683.c: 64: GPIO1=0;
	bcf	(41/8),(41)&7
	line	65
	
l2718:	
;AV12F683.c: 65: CCP1CON=0b00000000;
	clrf	(21)	;volatile
	line	67
	
l2720:	
# 67 "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
sleep ;#
psect	text257
	line	70
	
l387:	
	return
	opt stack 0
GLOBAL	__end_of_gotosleep
	__end_of_gotosleep:
;; =============== function _gotosleep ends ============

	signat	_gotosleep,88
	global	_tmr0
psect	text258,local,class=CODE,delta=2
global __ptext258
__ptext258:

;; *************** function _tmr0 *****************
;; Defined at:
;;		line 204 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_fnInputpins
;;		_fnPwm1
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text258
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
	line	204
	global	__size_of_tmr0
	__size_of_tmr0	equ	__end_of_tmr0-_tmr0
	
_tmr0:	
	opt	stack 4
; Regs used in _tmr0: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_tmr0+0)
	movf	fsr0,w
	movwf	(??_tmr0+1)
	movf	pclath,w
	movwf	(??_tmr0+2)
	ljmp	_tmr0
psect	text258
	line	206
	
i1l2360:	
;AV12F683.c: 206: if( GPIF ){
	btfss	(88/8),(88)&7
	goto	u75_21
	goto	u75_20
u75_21:
	goto	i1l2370
u75_20:
	line	207
	
i1l2362:	
;AV12F683.c: 207: GPIO & 0b11111111;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w
	line	208
	
i1l2364:	
;AV12F683.c: 208: GPIF=0;
	bcf	(88/8),(88)&7
	line	209
	
i1l2366:	
;AV12F683.c: 209: GPIE=0;
	bcf	(91/8),(91)&7
	line	210
	
i1l2368:	
;AV12F683.c: 210: flagtimer3=0;
	bcf	(_flagtimer3/8),(_flagtimer3)&7
	line	211
;AV12F683.c: 211: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(21)	;volatile
	line	217
	
i1l2370:	
;AV12F683.c: 213: }
;AV12F683.c: 217: if (T0IF && T0IE) {
	btfss	(90/8),(90)&7
	goto	u76_21
	goto	u76_20
u76_21:
	goto	i1l437
u76_20:
	
i1l2372:	
	btfss	(93/8),(93)&7
	goto	u77_21
	goto	u77_20
u77_21:
	goto	i1l437
u77_20:
	line	218
	
i1l2374:	
;AV12F683.c: 218: T0IF = 0;
	bcf	(90/8),(90)&7
	line	220
# 220 "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
clrwdt ;#
psect	text258
	line	222
	
i1l437:	
	line	226
;AV12F683.c: 222: }
;AV12F683.c: 226: if(TMR1IF && TMR1IE) {
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u78_21
	goto	u78_20
u78_21:
	goto	i1l443
u78_20:
	
i1l2376:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u79_21
	goto	u79_20
u79_21:
	goto	i1l443
u79_20:
	line	227
	
i1l2378:	
;AV12F683.c: 227: TMR1IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(96/8),(96)&7
	line	228
	
i1l2380:	
;AV12F683.c: 228: TMR1H = (65536 - (8000000 /4/1000)) >> 8 ;
	movlw	(0F8h)
	movwf	(15)	;volatile
	line	229
;AV12F683.c: 229: TMR1L = (65536 - (8000000 /4/1000)) & 0x00ff;
	movlw	(030h)
	movwf	(14)	;volatile
	line	231
	
i1l2382:	
# 231 "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
clrwdt ;#
psect	text258
	line	233
	
i1l2384:	
;AV12F683.c: 233: if(++tic==255) {
	incf	(_tic),f	;volatile
	movf	((_tic)),w	;volatile
	xorlw	0FFh
	skipz
	goto	u80_21
	goto	u80_20
u80_21:
	goto	i1l2388
u80_20:
	line	234
	
i1l2386:	
;AV12F683.c: 234: tic=0;
	clrf	(_tic)	;volatile
	line	238
	
i1l2388:	
# 238 "C:\Program Files (x86)\Microchip\Projects\AV12F683\AV12F683.c"
clrwdt ;#
psect	text258
	line	240
	
i1l2390:	
;AV12F683.c: 240: if(door.tmrOpen <0){door.tmrOpen++;}
	btfss	3+(_door)+02h,7	;volatile
	goto	u81_21
	goto	u81_20
u81_21:
	goto	i1l2394
u81_20:
	
i1l2392:	
	incf	0+(_door)+02h,f	;volatile
	skipnz
	incf	1+(_door)+02h,f	;volatile
	skipnz
	incf	2+(_door)+02h,f	;volatile
	skipnz
	incf	3+(_door)+02h,f	;volatile
	line	241
	
i1l2394:	
;AV12F683.c: 241: if(door.tmrClose<0){ door.tmrClose++;}
	movlw	(06h)
	addlw	_door&0ffh
	movwf	fsr0
	incf	fsr0,f
	bcf	status, 7	;select IRP bank0
	btfss	indf,7
	goto	u82_21
	goto	u82_20
u82_21:
	goto	i1l2398
u82_20:
	
i1l2396:	
	incf	0+(_door)+06h,f	;volatile
	skipnz
	incf	1+(_door)+06h,f	;volatile
	line	242
	
i1l2398:	
;AV12F683.c: 242: if(tmrSleep < 0){ tmrSleep++ ;}
	btfss	(_tmrSleep+1),7	;volatile
	goto	u83_21
	goto	u83_20
u83_21:
	goto	i1l2402
u83_20:
	
i1l2400:	
	incf	(_tmrSleep),f	;volatile
	skipnz
	incf	(_tmrSleep+1),f	;volatile
	line	244
	
i1l2402:	
;AV12F683.c: 244: fnInputpins();
	fcall	_fnInputpins
	line	245
	
i1l2404:	
;AV12F683.c: 245: fnPwm1(pwmduty1);
	movf	(_pwmduty1+1),w
	movwf	(?_fnPwm1+1)
	movf	(_pwmduty1),w
	movwf	(?_fnPwm1)
	fcall	_fnPwm1
	line	250
	
i1l443:	
	movf	(??_tmr0+2),w
	movwf	pclath
	movf	(??_tmr0+1),w
	movwf	fsr0
	movf	(??_tmr0+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_tmr0
	__end_of_tmr0:
;; =============== function _tmr0 ends ============

	signat	_tmr0,88
	global	_fnPwm1
psect	text259,local,class=CODE,delta=2
global __ptext259
__ptext259:

;; *************** function _fnPwm1 *****************
;; Defined at:
;;		line 12 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\pwm1.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 120/0
;;		On exit  : 120/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tmr0
;; This function uses a non-reentrant model
;;
psect	text259
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\pwm1.c"
	line	12
	global	__size_of_fnPwm1
	__size_of_fnPwm1	equ	__end_of_fnPwm1-_fnPwm1
	
_fnPwm1:	
	opt	stack 3
; Regs used in _fnPwm1: [wreg+status,2+status,0]
	line	15
	
i1l2494:	
;pwm1.c: 15: CCP1CON &= ~(1<<4);
	bcf	(21)+(4/8),(4)&7	;volatile
	line	16
;pwm1.c: 16: if ((n) & 1)
	btfss	(fnPwm1@n),(0)&7
	goto	u100_21
	goto	u100_20
u100_21:
	goto	i1l1222
u100_20:
	line	17
	
i1l2496:	
;pwm1.c: 17: CCP1CON |= 1<<4;
	bsf	(21)+(4/8),(4)&7	;volatile
	
i1l1222:	
	line	18
;pwm1.c: 18: CCP1CON &= ~(1<<5);
	bcf	(21)+(5/8),(5)&7	;volatile
	line	19
;pwm1.c: 19: if ((n) & 2)
	btfss	(fnPwm1@n),(1)&7
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l2500
u101_20:
	line	20
	
i1l2498:	
;pwm1.c: 20: CCP1CON |= 1<<5;
	bsf	(21)+(5/8),(5)&7	;volatile
	line	21
	
i1l2500:	
;pwm1.c: 21: CCPR1L=((n)>>2);
	movf	(fnPwm1@n+1),w
	movwf	(??_fnPwm1+0)+0+1
	movf	(fnPwm1@n),w
	movwf	(??_fnPwm1+0)+0
	clrc
	rrf	(??_fnPwm1+0)+1,f
	rrf	(??_fnPwm1+0)+0,f
	clrc
	rrf	(??_fnPwm1+0)+1,f
	rrf	(??_fnPwm1+0)+0,f
	movf	0+(??_fnPwm1+0)+0,w
	movwf	(19)	;volatile
	line	23
;pwm1.c: 23: CCPR1L=((n)>>2);
	movf	(fnPwm1@n+1),w
	movwf	(??_fnPwm1+0)+0+1
	movf	(fnPwm1@n),w
	movwf	(??_fnPwm1+0)+0
	clrc
	rrf	(??_fnPwm1+0)+1,f
	rrf	(??_fnPwm1+0)+0,f
	clrc
	rrf	(??_fnPwm1+0)+1,f
	rrf	(??_fnPwm1+0)+0,f
	movf	0+(??_fnPwm1+0)+0,w
	movwf	(19)	;volatile
	line	24
	
i1l1224:	
	return
	opt stack 0
GLOBAL	__end_of_fnPwm1
	__end_of_fnPwm1:
;; =============== function _fnPwm1 ends ============

	signat	_fnPwm1,4216
	global	_fnInputpins
psect	text260,local,class=CODE,delta=2
global __ptext260
__ptext260:

;; *************** function _fnInputpins *****************
;; Defined at:
;;		line 46 in file "C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 120/0
;;		On exit  : 120/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tmr0
;; This function uses a non-reentrant model
;;
psect	text260
	file	"C:\Program Files (x86)\Microchip\Projects\AV12F683\inputPins.c"
	line	46
	global	__size_of_fnInputpins
	__size_of_fnInputpins	equ	__end_of_fnInputpins-_fnInputpins
	
_fnInputpins:	
	opt	stack 3
; Regs used in _fnInputpins: [wreg+status,2+status,0]
	line	48
	
i1l2406:	
;inputPins.c: 48: if(GPIO0==doorOpen){
	movlw	0
	btfsc	(40/8),(40)&7
	movlw	1
	xorwf	(_doorOpen),w
	skipz
	goto	u84_21
	goto	u84_20
u84_21:
	goto	i1l2414
u84_20:
	line	49
	
i1l2408:	
;inputPins.c: 49: adDoor++;
	incf	(_adDoor),f
	line	50
	
i1l2410:	
;inputPins.c: 50: if(adDoor>100){door.status=0;adDoor=0;}
	movlw	(065h)
	subwf	(_adDoor),w
	skipc
	goto	u85_21
	goto	u85_20
u85_21:
	goto	i1l2416
u85_20:
	
i1l2412:	
	clrf	0+(_door)+01h	;volatile
	clrf	(_adDoor)
	goto	i1l2416
	line	52
	
i1l2414:	
;inputPins.c: 52: else adDoor=0;
	clrf	(_adDoor)
	line	54
	
i1l2416:	
;inputPins.c: 54: if(GPIO0==doorClose){
	movlw	0
	btfsc	(40/8),(40)&7
	movlw	1
	xorwf	(_doorClose),w
	skipz
	goto	u86_21
	goto	u86_20
u86_21:
	goto	i1l2424
u86_20:
	line	55
	
i1l2418:	
;inputPins.c: 55: adDoor2++;
	incf	(_adDoor2),f
	line	56
	
i1l2420:	
;inputPins.c: 56: if(adDoor2>100){door.status=1;adDoor2=0;}
	movlw	(065h)
	subwf	(_adDoor2),w
	skipc
	goto	u87_21
	goto	u87_20
u87_21:
	goto	i1l2428
u87_20:
	
i1l2422:	
	movlw	(01h)
	movwf	0+(_door)+01h	;volatile
	
i1l2424:	
	clrf	(_adDoor2)
	line	61
	
i1l2428:	
;inputPins.c: 61: if(GPIO5 ==alarmOn){adAlarm++;
	movlw	0
	btfsc	(45/8),(45)&7
	movlw	1
	xorwf	(_alarmOn),w
	skipz
	goto	u88_21
	goto	u88_20
u88_21:
	goto	i1l2436
u88_20:
	
i1l2430:	
	incf	(_adAlarm),f
	line	62
	
i1l2432:	
;inputPins.c: 62: if(adAlarm>100){alarm =1;adAlarm=0;}
	movlw	(065h)
	subwf	(_adAlarm),w
	skipc
	goto	u89_21
	goto	u89_20
u89_21:
	goto	i1l2440
u89_20:
	
i1l2434:	
	clrf	(_alarm)
	incf	(_alarm),f
	
i1l2436:	
	clrf	(_adAlarm)
	line	66
	
i1l2440:	
;inputPins.c: 66: if( GPIO5 ==alarmOff ){adAlarm2++;
	movlw	0
	btfsc	(45/8),(45)&7
	movlw	1
	xorwf	(_alarmOff),w
	skipz
	goto	u90_21
	goto	u90_20
u90_21:
	goto	i1l2448
u90_20:
	
i1l2442:	
	incf	(_adAlarm2),f
	line	67
	
i1l2444:	
;inputPins.c: 67: if(adAlarm2>100){alarm = 0;adAlarm2=0;}
	movlw	(065h)
	subwf	(_adAlarm2),w
	skipc
	goto	u91_21
	goto	u91_20
u91_21:
	goto	i1l2450
u91_20:
	
i1l2446:	
	clrf	(_alarm)
	clrf	(_adAlarm2)
	goto	i1l2450
	line	69
	
i1l2448:	
;inputPins.c: 69: else adAlarm2=0;
	clrf	(_adAlarm2)
	line	72
	
i1l2450:	
;inputPins.c: 72: if(GPIO4 ==keyPowerOff){adKeyPower++;
	movlw	0
	btfsc	(44/8),(44)&7
	movlw	1
	xorwf	(_keyPowerOff),w
	skipz
	goto	u92_21
	goto	u92_20
u92_21:
	goto	i1l2458
u92_20:
	
i1l2452:	
	incf	(_adKeyPower),f
	line	73
	
i1l2454:	
;inputPins.c: 73: if(adKeyPower>100){key.power =0;adKeyPower=0;}
	movlw	(065h)
	subwf	(_adKeyPower),w
	skipc
	goto	u93_21
	goto	u93_20
u93_21:
	goto	i1l2460
u93_20:
	
i1l2456:	
	clrf	0+(_key)+02h
	clrf	(_adKeyPower)
	goto	i1l2460
	line	75
	
i1l2458:	
;inputPins.c: 75: else adKeyPower=0;
	clrf	(_adKeyPower)
	line	77
	
i1l2460:	
;inputPins.c: 77: if( GPIO4 ==keyPowerOn ){adKeyPower2++;
	movlw	0
	btfsc	(44/8),(44)&7
	movlw	1
	xorwf	(_keyPowerOn),w
	skipz
	goto	u94_21
	goto	u94_20
u94_21:
	goto	i1l2468
u94_20:
	
i1l2462:	
	incf	(_adKeyPower2),f
	line	78
	
i1l2464:	
;inputPins.c: 78: if(adKeyPower2>100){key.power = 1;adKeyPower2=0;}
	movlw	(065h)
	subwf	(_adKeyPower2),w
	skipc
	goto	u95_21
	goto	u95_20
u95_21:
	goto	i1l2472
u95_20:
	
i1l2466:	
	clrf	0+(_key)+02h
	incf	0+(_key)+02h,f
	
i1l2468:	
	clrf	(_adKeyPower2)
	line	83
	
i1l2472:	
;inputPins.c: 83: if(GPIO3 ==keyInLockOff){adKeyInLock++;
	movlw	0
	btfsc	(43/8),(43)&7
	movlw	1
	xorwf	(_keyInLockOff),w
	skipz
	goto	u96_21
	goto	u96_20
u96_21:
	goto	i1l2480
u96_20:
	
i1l2474:	
	incf	(_adKeyInLock),f
	line	84
	
i1l2476:	
;inputPins.c: 84: if(adKeyInLock>100){key.in_lock =0;adKeyInLock=0;}
	movlw	(065h)
	subwf	(_adKeyInLock),w
	skipc
	goto	u97_21
	goto	u97_20
u97_21:
	goto	i1l2482
u97_20:
	
i1l2478:	
	clrf	0+(_key)+01h
	clrf	(_adKeyInLock)
	goto	i1l2482
	line	86
	
i1l2480:	
;inputPins.c: 86: else adKeyInLock=0;
	clrf	(_adKeyInLock)
	line	88
	
i1l2482:	
;inputPins.c: 88: if( GPIO3 ==keyInLockOn ){adKeyInLock2++;
	movlw	0
	btfsc	(43/8),(43)&7
	movlw	1
	xorwf	(_keyInLockOn),w
	skipz
	goto	u98_21
	goto	u98_20
u98_21:
	goto	i1l2490
u98_20:
	
i1l2484:	
	incf	(_adKeyInLock2),f
	line	89
	
i1l2486:	
;inputPins.c: 89: if(adKeyInLock2>100){key.in_lock = 1;adKeyInLock2=0;}
	movlw	(065h)
	subwf	(_adKeyInLock2),w
	skipc
	goto	u99_21
	goto	u99_20
u99_21:
	goto	i1l867
u99_20:
	
i1l2488:	
	clrf	0+(_key)+01h
	incf	0+(_key)+01h,f
	
i1l2490:	
	clrf	(_adKeyInLock2)
	line	93
	
i1l867:	
	return
	opt stack 0
GLOBAL	__end_of_fnInputpins
	__end_of_fnInputpins:
;; =============== function _fnInputpins ends ============

	signat	_fnInputpins,88
psect	text261,local,class=CODE,delta=2
global __ptext261
__ptext261:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
