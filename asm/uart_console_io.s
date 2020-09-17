# uart_console_io.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __close_console
/* 0CB8E8 800D0E88 38600000 */  li		r3, 0
/* 0CB8EC 800D0E8C 4E800020 */  blr		

glabel __write_console
/* 0CB8F0 800D0E90 7C0802A6 */  mflr	r0
/* 0CB8F4 800D0E94 38600000 */  li		r3, 0
/* 0CB8F8 800D0E98 90010004 */  stw		r0, 4(r1)
/* 0CB8FC 800D0E9C 9421FFD8 */  stwu	r1, -0x28(r1)
/* 0CB900 800D0EA0 93E10024 */  stw		r31, 0x24(r1)
/* 0CB904 800D0EA4 3BE50000 */  addi	r31, r5, 0
/* 0CB908 800D0EA8 93C10020 */  stw		r30, 0x20(r1)
/* 0CB90C 800D0EAC 3BC40000 */  addi	r30, r4, 0
/* 0CB910 800D0EB0 800D9000 */  lwz		r0, initialized$16-_SDA_BASE_(r13)
/* 0CB914 800D0EB4 2C000000 */  cmpwi	r0, 0
/* 0CB918 800D0EB8 40820020 */  bne		lbl_800D0ED8
/* 0CB91C 800D0EBC 3C600001 */  lis		r3, 1
/* 0CB920 800D0EC0 3863E100 */  addi	r3, r3, -7936
/* 0CB924 800D0EC4 4BFD35C5 */  bl		InitializeUART
/* 0CB928 800D0EC8 2C030000 */  cmpwi	r3, 0
/* 0CB92C 800D0ECC 4082000C */  bne		lbl_800D0ED8
/* 0CB930 800D0ED0 38000001 */  li		r0, 1
/* 0CB934 800D0ED4 900D9000 */  stw		r0, initialized$16-_SDA_BASE_(r13)
lbl_800D0ED8:
/* 0CB938 800D0ED8 2C030000 */  cmpwi	r3, 0
/* 0CB93C 800D0EDC 4182000C */  beq		lbl_800D0EE8
/* 0CB940 800D0EE0 38600001 */  li		r3, 1
/* 0CB944 800D0EE4 4800002C */  b		lbl_800D0F10
lbl_800D0EE8:
/* 0CB948 800D0EE8 7FC3F378 */  mr		r3, r30
/* 0CB94C 800D0EEC 809F0000 */  lwz		r4, 0(r31)
/* 0CB950 800D0EF0 4BFD3611 */  bl		WriteUARTN
/* 0CB954 800D0EF4 2C030000 */  cmpwi	r3, 0
/* 0CB958 800D0EF8 41820014 */  beq		lbl_800D0F0C
/* 0CB95C 800D0EFC 38000000 */  li		r0, 0
/* 0CB960 800D0F00 901F0000 */  stw		r0, 0(r31)
/* 0CB964 800D0F04 38600001 */  li		r3, 1
/* 0CB968 800D0F08 48000008 */  b		lbl_800D0F10
lbl_800D0F0C:
/* 0CB96C 800D0F0C 38600000 */  li		r3, 0
lbl_800D0F10:
/* 0CB970 800D0F10 8001002C */  lwz		r0, 0x2c(r1)
/* 0CB974 800D0F14 83E10024 */  lwz		r31, 0x24(r1)
/* 0CB978 800D0F18 83C10020 */  lwz		r30, 0x20(r1)
/* 0CB97C 800D0F1C 7C0803A6 */  mtlr	r0
/* 0CB980 800D0F20 38210028 */  addi	r1, r1, 0x28
/* 0CB984 800D0F24 4E800020 */  blr		

glabel __read_console
/* 0CB988 800D0F28 7C0802A6 */  mflr	r0
/* 0CB98C 800D0F2C 38600000 */  li		r3, 0
/* 0CB990 800D0F30 90010004 */  stw		r0, 4(r1)
/* 0CB994 800D0F34 9421FFD0 */  stwu	r1, -0x30(r1)
/* 0CB998 800D0F38 93E1002C */  stw		r31, 0x2c(r1)
/* 0CB99C 800D0F3C 93C10028 */  stw		r30, 0x28(r1)
/* 0CB9A0 800D0F40 3BC50000 */  addi	r30, r5, 0
/* 0CB9A4 800D0F44 93A10024 */  stw		r29, 0x24(r1)
/* 0CB9A8 800D0F48 3BA40000 */  addi	r29, r4, 0
/* 0CB9AC 800D0F4C 800D9000 */  lwz		r0, initialized$16-_SDA_BASE_(r13)
/* 0CB9B0 800D0F50 2C000000 */  cmpwi	r0, 0
/* 0CB9B4 800D0F54 40820020 */  bne		lbl_800D0F74
/* 0CB9B8 800D0F58 3C600001 */  lis		r3, 1
/* 0CB9BC 800D0F5C 3863E100 */  addi	r3, r3, -7936
/* 0CB9C0 800D0F60 4BFD3529 */  bl		InitializeUART
/* 0CB9C4 800D0F64 2C030000 */  cmpwi	r3, 0
/* 0CB9C8 800D0F68 4082000C */  bne		lbl_800D0F74
/* 0CB9CC 800D0F6C 38000001 */  li		r0, 1
/* 0CB9D0 800D0F70 900D9000 */  stw		r0, initialized$16-_SDA_BASE_(r13)
lbl_800D0F74:
/* 0CB9D4 800D0F74 2C030000 */  cmpwi	r3, 0
/* 0CB9D8 800D0F78 4182000C */  beq		lbl_800D0F84
/* 0CB9DC 800D0F7C 38600001 */  li		r3, 1
/* 0CB9E0 800D0F80 4800006C */  b		lbl_800D0FEC
lbl_800D0F84:
/* 0CB9E4 800D0F84 83FE0000 */  lwz		r31, 0(r30)
/* 0CB9E8 800D0F88 38000000 */  li		r0, 0
/* 0CB9EC 800D0F8C 38600000 */  li		r3, 0
/* 0CB9F0 800D0F90 901E0000 */  stw		r0, 0(r30)
/* 0CB9F4 800D0F94 4800002C */  b		lbl_800D0FC0
lbl_800D0F98:
/* 0CB9F8 800D0F98 387D0000 */  addi	r3, r29, 0
/* 0CB9FC 800D0F9C 38800001 */  li		r4, 1
/* 0CBA00 800D0FA0 4BFD3559 */  bl		ReadUARTN
/* 0CBA04 800D0FA4 809E0000 */  lwz		r4, 0(r30)
/* 0CBA08 800D0FA8 38040001 */  addi	r0, r4, 1
/* 0CBA0C 800D0FAC 901E0000 */  stw		r0, 0(r30)
/* 0CBA10 800D0FB0 881D0000 */  lbz		r0, 0(r29)
/* 0CBA14 800D0FB4 2800000D */  cmplwi	r0, 0xd
/* 0CBA18 800D0FB8 4182001C */  beq		lbl_800D0FD4
/* 0CBA1C 800D0FBC 3BBD0001 */  addi	r29, r29, 1
lbl_800D0FC0:
/* 0CBA20 800D0FC0 801E0000 */  lwz		r0, 0(r30)
/* 0CBA24 800D0FC4 7C00F840 */  cmplw	r0, r31
/* 0CBA28 800D0FC8 4181000C */  bgt		lbl_800D0FD4
/* 0CBA2C 800D0FCC 2C030000 */  cmpwi	r3, 0
/* 0CBA30 800D0FD0 4182FFC8 */  beq		lbl_800D0F98
lbl_800D0FD4:
/* 0CBA34 800D0FD4 2C030000 */  cmpwi	r3, 0
/* 0CBA38 800D0FD8 4082000C */  bne		lbl_800D0FE4
/* 0CBA3C 800D0FDC 38000000 */  li		r0, 0
/* 0CBA40 800D0FE0 48000008 */  b		lbl_800D0FE8
lbl_800D0FE4:
/* 0CBA44 800D0FE4 38000001 */  li		r0, 1
lbl_800D0FE8:
/* 0CBA48 800D0FE8 5403063E */  clrlwi	r3, r0, 0x18
lbl_800D0FEC:
/* 0CBA4C 800D0FEC 80010034 */  lwz		r0, 0x34(r1)
/* 0CBA50 800D0FF0 83E1002C */  lwz		r31, 0x2c(r1)
/* 0CBA54 800D0FF4 83C10028 */  lwz		r30, 0x28(r1)
/* 0CBA58 800D0FF8 7C0803A6 */  mtlr	r0
/* 0CBA5C 800D0FFC 83A10024 */  lwz		r29, 0x24(r1)
/* 0CBA60 800D1000 38210030 */  addi	r1, r1, 0x30
/* 0CBA64 800D1004 4E800020 */  blr		


.section .sbss, "wa"

.balign 8

/* 000F1F60 80135CE0 0004 */
initialized$16:
    .skip 4


