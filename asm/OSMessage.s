# OSMessage.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSInitMessageQueue
/* 099FE0 8009F580 7C0802A6 */  mflr	r0
/* 099FE4 8009F584 90010004 */  stw		r0, 4(r1)
/* 099FE8 8009F588 9421FFD8 */  stwu	r1, -0x28(r1)
/* 099FEC 8009F58C 93E10024 */  stw		r31, 0x24(r1)
/* 099FF0 8009F590 3BE50000 */  addi	r31, r5, 0
/* 099FF4 8009F594 93C10020 */  stw		r30, 0x20(r1)
/* 099FF8 8009F598 3BC40000 */  addi	r30, r4, 0
/* 099FFC 8009F59C 93A1001C */  stw		r29, 0x1c(r1)
/* 09A000 8009F5A0 3BA30000 */  addi	r29, r3, 0
/* 09A004 8009F5A4 48001C91 */  bl		OSInitThreadQueue
/* 09A008 8009F5A8 387D0008 */  addi	r3, r29, 8
/* 09A00C 8009F5AC 48001C89 */  bl		OSInitThreadQueue
/* 09A010 8009F5B0 93DD0010 */  stw		r30, 0x10(r29)
/* 09A014 8009F5B4 38000000 */  li		r0, 0
/* 09A018 8009F5B8 93FD0014 */  stw		r31, 0x14(r29)
/* 09A01C 8009F5BC 901D0018 */  stw		r0, 0x18(r29)
/* 09A020 8009F5C0 901D001C */  stw		r0, 0x1c(r29)
/* 09A024 8009F5C4 8001002C */  lwz		r0, 0x2c(r1)
/* 09A028 8009F5C8 83E10024 */  lwz		r31, 0x24(r1)
/* 09A02C 8009F5CC 83C10020 */  lwz		r30, 0x20(r1)
/* 09A030 8009F5D0 83A1001C */  lwz		r29, 0x1c(r1)
/* 09A034 8009F5D4 38210028 */  addi	r1, r1, 0x28
/* 09A038 8009F5D8 7C0803A6 */  mtlr	r0
/* 09A03C 8009F5DC 4E800020 */  blr		

glabel OSSendMessage
/* 09A040 8009F5E0 7C0802A6 */  mflr	r0
/* 09A044 8009F5E4 90010004 */  stw		r0, 4(r1)
/* 09A048 8009F5E8 9421FFD8 */  stwu	r1, -0x28(r1)
/* 09A04C 8009F5EC 93E10024 */  stw		r31, 0x24(r1)
/* 09A050 8009F5F0 3BE50000 */  addi	r31, r5, 0
/* 09A054 8009F5F4 93C10020 */  stw		r30, 0x20(r1)
/* 09A058 8009F5F8 93A1001C */  stw		r29, 0x1c(r1)
/* 09A05C 8009F5FC 3BA40000 */  addi	r29, r4, 0
/* 09A060 8009F600 93810018 */  stw		r28, 0x18(r1)
/* 09A064 8009F604 3B830000 */  addi	r28, r3, 0
/* 09A068 8009F608 4BFFF6F5 */  bl		OSDisableInterrupts
/* 09A06C 8009F60C 3BC30000 */  addi	r30, r3, 0
/* 09A070 8009F610 57FF07FE */  clrlwi	r31, r31, 0x1f
/* 09A074 8009F614 48000024 */  b		lbl_8009F638
lbl_8009F618:
/* 09A078 8009F618 2C1F0000 */  cmpwi	r31, 0
/* 09A07C 8009F61C 40820014 */  bne		lbl_8009F630
/* 09A080 8009F620 7FC3F378 */  mr		r3, r30
/* 09A084 8009F624 4BFFF701 */  bl		OSRestoreInterrupts
/* 09A088 8009F628 38600000 */  li		r3, 0
/* 09A08C 8009F62C 4800005C */  b		lbl_8009F688
lbl_8009F630:
/* 09A090 8009F630 7F83E378 */  mr		r3, r28
/* 09A094 8009F634 480029D9 */  bl		OSSleepThread
lbl_8009F638:
/* 09A098 8009F638 80DC0014 */  lwz		r6, 0x14(r28)
/* 09A09C 8009F63C 809C001C */  lwz		r4, 0x1c(r28)
/* 09A0A0 8009F640 7C062000 */  cmpw	r6, r4
/* 09A0A4 8009F644 4081FFD4 */  ble		lbl_8009F618
/* 09A0A8 8009F648 801C0018 */  lwz		r0, 0x18(r28)
/* 09A0AC 8009F64C 387C0008 */  addi	r3, r28, 8
/* 09A0B0 8009F650 80BC0010 */  lwz		r5, 0x10(r28)
/* 09A0B4 8009F654 7C802214 */  add		r4, r0, r4
/* 09A0B8 8009F658 7C0433D6 */  divw	r0, r4, r6
/* 09A0BC 8009F65C 7C0031D6 */  mullw	r0, r0, r6
/* 09A0C0 8009F660 7C002050 */  subf	r0, r0, r4
/* 09A0C4 8009F664 5400103A */  slwi	r0, r0, 2
/* 09A0C8 8009F668 7FA5012E */  stwx	r29, r5, r0
/* 09A0CC 8009F66C 809C001C */  lwz		r4, 0x1c(r28)
/* 09A0D0 8009F670 38040001 */  addi	r0, r4, 1
/* 09A0D4 8009F674 901C001C */  stw		r0, 0x1c(r28)
/* 09A0D8 8009F678 48002A81 */  bl		OSWakeupThread
/* 09A0DC 8009F67C 7FC3F378 */  mr		r3, r30
/* 09A0E0 8009F680 4BFFF6A5 */  bl		OSRestoreInterrupts
/* 09A0E4 8009F684 38600001 */  li		r3, 1
lbl_8009F688:
/* 09A0E8 8009F688 8001002C */  lwz		r0, 0x2c(r1)
/* 09A0EC 8009F68C 83E10024 */  lwz		r31, 0x24(r1)
/* 09A0F0 8009F690 83C10020 */  lwz		r30, 0x20(r1)
/* 09A0F4 8009F694 83A1001C */  lwz		r29, 0x1c(r1)
/* 09A0F8 8009F698 83810018 */  lwz		r28, 0x18(r1)
/* 09A0FC 8009F69C 38210028 */  addi	r1, r1, 0x28
/* 09A100 8009F6A0 7C0803A6 */  mtlr	r0
/* 09A104 8009F6A4 4E800020 */  blr		

glabel OSReceiveMessage
/* 09A108 8009F6A8 7C0802A6 */  mflr	r0
/* 09A10C 8009F6AC 90010004 */  stw		r0, 4(r1)
/* 09A110 8009F6B0 9421FFD8 */  stwu	r1, -0x28(r1)
/* 09A114 8009F6B4 93E10024 */  stw		r31, 0x24(r1)
/* 09A118 8009F6B8 3BE30000 */  addi	r31, r3, 0
/* 09A11C 8009F6BC 93C10020 */  stw		r30, 0x20(r1)
/* 09A120 8009F6C0 3BC50000 */  addi	r30, r5, 0
/* 09A124 8009F6C4 93A1001C */  stw		r29, 0x1c(r1)
/* 09A128 8009F6C8 93810018 */  stw		r28, 0x18(r1)
/* 09A12C 8009F6CC 3B840000 */  addi	r28, r4, 0
/* 09A130 8009F6D0 4BFFF62D */  bl		OSDisableInterrupts
/* 09A134 8009F6D4 3BA30000 */  addi	r29, r3, 0
/* 09A138 8009F6D8 57DE07FE */  clrlwi	r30, r30, 0x1f
/* 09A13C 8009F6DC 48000024 */  b		lbl_8009F700
lbl_8009F6E0:
/* 09A140 8009F6E0 2C1E0000 */  cmpwi	r30, 0
/* 09A144 8009F6E4 40820014 */  bne		lbl_8009F6F8
/* 09A148 8009F6E8 7FA3EB78 */  mr		r3, r29
/* 09A14C 8009F6EC 4BFFF639 */  bl		OSRestoreInterrupts
/* 09A150 8009F6F0 38600000 */  li		r3, 0
/* 09A154 8009F6F4 48000070 */  b		lbl_8009F764
lbl_8009F6F8:
/* 09A158 8009F6F8 387F0008 */  addi	r3, r31, 8
/* 09A15C 8009F6FC 48002911 */  bl		OSSleepThread
lbl_8009F700:
/* 09A160 8009F700 801F001C */  lwz		r0, 0x1c(r31)
/* 09A164 8009F704 2C000000 */  cmpwi	r0, 0
/* 09A168 8009F708 4182FFD8 */  beq		lbl_8009F6E0
/* 09A16C 8009F70C 281C0000 */  cmplwi	r28, 0
/* 09A170 8009F710 41820018 */  beq		lbl_8009F728
/* 09A174 8009F714 801F0018 */  lwz		r0, 0x18(r31)
/* 09A178 8009F718 807F0010 */  lwz		r3, 0x10(r31)
/* 09A17C 8009F71C 5400103A */  slwi	r0, r0, 2
/* 09A180 8009F720 7C03002E */  lwzx	r0, r3, r0
/* 09A184 8009F724 901C0000 */  stw		r0, 0(r28)
lbl_8009F728:
/* 09A188 8009F728 80BF0018 */  lwz		r5, 0x18(r31)
/* 09A18C 8009F72C 7FE3FB78 */  mr		r3, r31
/* 09A190 8009F730 809F0014 */  lwz		r4, 0x14(r31)
/* 09A194 8009F734 38A50001 */  addi	r5, r5, 1
/* 09A198 8009F738 7C0523D6 */  divw	r0, r5, r4
/* 09A19C 8009F73C 7C0021D6 */  mullw	r0, r0, r4
/* 09A1A0 8009F740 7C002850 */  subf	r0, r0, r5
/* 09A1A4 8009F744 901F0018 */  stw		r0, 0x18(r31)
/* 09A1A8 8009F748 809F001C */  lwz		r4, 0x1c(r31)
/* 09A1AC 8009F74C 3804FFFF */  addi	r0, r4, -1
/* 09A1B0 8009F750 901F001C */  stw		r0, 0x1c(r31)
/* 09A1B4 8009F754 480029A5 */  bl		OSWakeupThread
/* 09A1B8 8009F758 7FA3EB78 */  mr		r3, r29
/* 09A1BC 8009F75C 4BFFF5C9 */  bl		OSRestoreInterrupts
/* 09A1C0 8009F760 38600001 */  li		r3, 1
lbl_8009F764:
/* 09A1C4 8009F764 8001002C */  lwz		r0, 0x2c(r1)
/* 09A1C8 8009F768 83E10024 */  lwz		r31, 0x24(r1)
/* 09A1CC 8009F76C 83C10020 */  lwz		r30, 0x20(r1)
/* 09A1D0 8009F770 83A1001C */  lwz		r29, 0x1c(r1)
/* 09A1D4 8009F774 83810018 */  lwz		r28, 0x18(r1)
/* 09A1D8 8009F778 38210028 */  addi	r1, r1, 0x28
/* 09A1DC 8009F77C 7C0803A6 */  mtlr	r0
/* 09A1E0 8009F780 4E800020 */  blr		


