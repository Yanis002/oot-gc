# xlPostGCN.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x80005D64 - 0x80005DC8

glabel xlPostReset
/* 002D64 80005D64 38600001 */  li        r3, 0x1
/* 002D68 80005D68 4E800020 */  blr

glabel xlPostSetup
/* 002D6C 80005D6C 38600001 */  li        r3, 0x1
/* 002D70 80005D70 4E800020 */  blr

glabel xlPostText
/* 002D74 80005D74 9421FF88 */  stwu      r1, -0x78(r1)
/* 002D78 80005D78 40860024 */  bne       cr1, lbl_80005D9C
/* 002D7C 80005D7C D8210028 */  stfd      f1, 0x28(r1)
/* 002D80 80005D80 D8410030 */  stfd      f2, 0x30(r1)
/* 002D84 80005D84 D8610038 */  stfd      f3, 0x38(r1)
/* 002D88 80005D88 D8810040 */  stfd      f4, 0x40(r1)
/* 002D8C 80005D8C D8A10048 */  stfd      f5, 0x48(r1)
/* 002D90 80005D90 D8C10050 */  stfd      f6, 0x50(r1)
/* 002D94 80005D94 D8E10058 */  stfd      f7, 0x58(r1)
/* 002D98 80005D98 D9010060 */  stfd      f8, 0x60(r1)
lbl_80005D9C:
/* 002D9C 80005D9C 90610008 */  stw       r3, 0x8(r1)
/* 002DA0 80005DA0 38600001 */  li        r3, 0x1
/* 002DA4 80005DA4 9081000C */  stw       r4, 0xc(r1)
/* 002DA8 80005DA8 90A10010 */  stw       r5, 0x10(r1)
/* 002DAC 80005DAC 90C10014 */  stw       r6, 0x14(r1)
/* 002DB0 80005DB0 90E10018 */  stw       r7, 0x18(r1)
/* 002DB4 80005DB4 9101001C */  stw       r8, 0x1c(r1)
/* 002DB8 80005DB8 91210020 */  stw       r9, 0x20(r1)
/* 002DBC 80005DBC 91410024 */  stw       r10, 0x24(r1)
/* 002DC0 80005DC0 38210078 */  addi      r1, r1, 0x78
/* 002DC4 80005DC4 4E800020 */  blr
