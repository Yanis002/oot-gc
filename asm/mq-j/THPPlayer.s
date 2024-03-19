# THPPlayer.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x8000F66C - 0x80010B78

glabel THPPlayerInit
/* 00C66C 8000F66C 7C0802A6 */  mflr      r0
/* 00C670 8000F670 3C808010 */  lis       r4, D_800FAA40@ha
/* 00C674 8000F674 90010004 */  stw       r0, 0x4(r1)
/* 00C678 8000F678 38A001D0 */  li        r5, 0x1d0
/* 00C67C 8000F67C 9421FFE8 */  stwu      r1, -0x18(r1)
/* 00C680 8000F680 93E10014 */  stw       r31, 0x14(r1)
/* 00C684 8000F684 3BE4AA40 */  addi      r31, r4, D_800FAA40@l
/* 00C688 8000F688 38800000 */  li        r4, 0x0
/* 00C68C 8000F68C 93C10010 */  stw       r30, 0x10(r1)
/* 00C690 8000F690 3BC30000 */  addi      r30, r3, 0x0
/* 00C694 8000F694 387F05A0 */  addi      r3, r31, 0x5a0
/* 00C698 8000F698 4BFF5C89 */  bl        memset
/* 00C69C 8000F69C 4808D805 */  bl        LCEnable
/* 00C6A0 8000F6A0 387F0060 */  addi      r3, r31, 0x60
/* 00C6A4 8000F6A4 389F0080 */  addi      r4, r31, 0x80
/* 00C6A8 8000F6A8 38A00003 */  li        r5, 0x3
/* 00C6AC 8000F6AC 4808F421 */  bl        OSInitMessageQueue
/* 00C6B0 8000F6B0 480B7EB5 */  bl        THPInit
/* 00C6B4 8000F6B4 2C030000 */  cmpwi     r3, 0x0
/* 00C6B8 8000F6B8 4082000C */  bne       lbl_8000F6C4
/* 00C6BC 8000F6BC 38600000 */  li        r3, 0x0
/* 00C6C0 8000F6C0 480000CC */  b         lbl_8000F78C
lbl_8000F6C4:
/* 00C6C4 8000F6C4 4808EB85 */  bl        OSDisableInterrupts
/* 00C6C8 8000F6C8 38A00000 */  li        r5, 0x0
/* 00C6CC 8000F6CC 93CD8944 */  stw       r30, D_8018B8C4@sda21(r0)
/* 00C6D0 8000F6D0 3C808001 */  lis       r4, THPAudioMixCallback@ha
/* 00C6D4 8000F6D4 90AD8934 */  stw       r5, D_8018B8B4@sda21(r0)
/* 00C6D8 8000F6D8 38040664 */  addi      r0, r4, THPAudioMixCallback@l
/* 00C6DC 8000F6DC 3BC30000 */  addi      r30, r3, 0x0
/* 00C6E0 8000F6E0 90AD893C */  stw       r5, D_8018B8BC@sda21(r0)
/* 00C6E4 8000F6E4 7C030378 */  mr        r3, r0
/* 00C6E8 8000F6E8 90AD8940 */  stw       r5, D_8018B8C0@sda21(r0)
/* 00C6EC 8000F6EC 480A75ED */  bl        AIRegisterDMACallback
/* 00C6F0 8000F6F0 906D8938 */  stw       r3, D_8018B8B8@sda21(r0)
/* 00C6F4 8000F6F4 800D8938 */  lwz       r0, D_8018B8B8@sda21(r0)
/* 00C6F8 8000F6F8 28000000 */  cmplwi    r0, 0x0
/* 00C6FC 8000F6FC 40820038 */  bne       lbl_8000F734
/* 00C700 8000F700 800D8944 */  lwz       r0, D_8018B8C4@sda21(r0)
/* 00C704 8000F704 2C000000 */  cmpwi     r0, 0x0
/* 00C708 8000F708 4182002C */  beq       lbl_8000F734
/* 00C70C 8000F70C 38600000 */  li        r3, 0x0
/* 00C710 8000F710 480A75C9 */  bl        AIRegisterDMACallback
/* 00C714 8000F714 7FC3F378 */  mr        r3, r30
/* 00C718 8000F718 4808EB59 */  bl        OSRestoreInterrupts
/* 00C71C 8000F71C 3C60800F */  lis       r3, D_800EB7A0@ha
/* 00C720 8000F720 4CC63182 */  crclr     cr1eq
/* 00C724 8000F724 3863B7A0 */  addi      r3, r3, D_800EB7A0@l
/* 00C728 8000F728 4808E41D */  bl        OSReport
/* 00C72C 8000F72C 38600000 */  li        r3, 0x0
/* 00C730 8000F730 4800005C */  b         lbl_8000F78C
lbl_8000F734:
/* 00C734 8000F734 7FC3F378 */  mr        r3, r30
/* 00C738 8000F738 4808EB39 */  bl        OSRestoreInterrupts
/* 00C73C 8000F73C 800D8944 */  lwz       r0, D_8018B8C4@sda21(r0)
/* 00C740 8000F740 2C000000 */  cmpwi     r0, 0x0
/* 00C744 8000F744 4082003C */  bne       lbl_8000F780
/* 00C748 8000F748 387F00A0 */  addi      r3, r31, 0xa0
/* 00C74C 8000F74C 38800000 */  li        r4, 0x0
/* 00C750 8000F750 38A00500 */  li        r5, 0x500
/* 00C754 8000F754 4BFF5BCD */  bl        memset
/* 00C758 8000F758 387F00A0 */  addi      r3, r31, 0xa0
/* 00C75C 8000F75C 38800500 */  li        r4, 0x500
/* 00C760 8000F760 4808D565 */  bl        DCFlushRange
/* 00C764 8000F764 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00C768 8000F768 38800280 */  li        r4, 0x280
/* 00C76C 8000F76C 1C000280 */  mulli     r0, r0, 0x280
/* 00C770 8000F770 7C7F0214 */  add       r3, r31, r0
/* 00C774 8000F774 386300A0 */  addi      r3, r3, 0xa0
/* 00C778 8000F778 480A75A5 */  bl        AIInitDMA
/* 00C77C 8000F77C 480A7639 */  bl        AIStartDMA
lbl_8000F780:
/* 00C780 8000F780 38000001 */  li        r0, 0x1
/* 00C784 8000F784 900D8928 */  stw       r0, D_8018B8A8@sda21(r0)
/* 00C788 8000F788 38600001 */  li        r3, 0x1
lbl_8000F78C:
/* 00C78C 8000F78C 8001001C */  lwz       r0, 0x1c(r1)
/* 00C790 8000F790 83E10014 */  lwz       r31, 0x14(r1)
/* 00C794 8000F794 83C10010 */  lwz       r30, 0x10(r1)
/* 00C798 8000F798 7C0803A6 */  mtlr      r0
/* 00C79C 8000F79C 38210018 */  addi      r1, r1, 0x18
/* 00C7A0 8000F7A0 4E800020 */  blr

glabel THPPlayerOpen
/* 00C7A4 8000F7A4 7C0802A6 */  mflr      r0
/* 00C7A8 8000F7A8 3CA08010 */  lis       r5, D_800FAA40@ha
/* 00C7AC 8000F7AC 90010004 */  stw       r0, 0x4(r1)
/* 00C7B0 8000F7B0 9421FFC0 */  stwu      r1, -0x40(r1)
/* 00C7B4 8000F7B4 BEA10014 */  stmw      r21, 0x14(r1)
/* 00C7B8 8000F7B8 3B85AA40 */  addi      r28, r5, D_800FAA40@l
/* 00C7BC 8000F7BC 3CA0800F */  lis       r5, D_800EB6A0@ha
/* 00C7C0 8000F7C0 3AA30000 */  addi      r21, r3, 0x0
/* 00C7C4 8000F7C4 3BC40000 */  addi      r30, r4, 0x0
/* 00C7C8 8000F7C8 3BA5B6A0 */  addi      r29, r5, D_800EB6A0@l
/* 00C7CC 8000F7CC 800D8928 */  lwz       r0, D_8018B8A8@sda21(r0)
/* 00C7D0 8000F7D0 2C000000 */  cmpwi     r0, 0x0
/* 00C7D4 8000F7D4 40820018 */  bne       lbl_8000F7EC
/* 00C7D8 8000F7D8 387D013C */  addi      r3, r29, 0x13c
/* 00C7DC 8000F7DC 4CC63182 */  crclr     cr1eq
/* 00C7E0 8000F7E0 4808E365 */  bl        OSReport
/* 00C7E4 8000F7E4 38600000 */  li        r3, 0x0
/* 00C7E8 8000F7E8 48000220 */  b         lbl_8000FA08
lbl_8000F7EC:
/* 00C7EC 8000F7EC 3BFC0640 */  addi      r31, r28, 0x640
/* 00C7F0 8000F7F0 801C0640 */  lwz       r0, 0x640(r28)
/* 00C7F4 8000F7F4 2C000000 */  cmpwi     r0, 0x0
/* 00C7F8 8000F7F8 41820018 */  beq       lbl_8000F810
/* 00C7FC 8000F7FC 387D0178 */  addi      r3, r29, 0x178
/* 00C800 8000F800 4CC63182 */  crclr     cr1eq
/* 00C804 8000F804 4808E341 */  bl        OSReport
/* 00C808 8000F808 38600000 */  li        r3, 0x0
/* 00C80C 8000F80C 480001FC */  b         lbl_8000FA08
lbl_8000F810:
/* 00C810 8000F810 3B5C0620 */  addi      r26, r28, 0x620
/* 00C814 8000F814 387A0000 */  addi      r3, r26, 0x0
/* 00C818 8000F818 38800000 */  li        r4, 0x0
/* 00C81C 8000F81C 38A0000C */  li        r5, 0xc
/* 00C820 8000F820 4BFF5B01 */  bl        memset
/* 00C824 8000F824 3B3C062C */  addi      r25, r28, 0x62c
/* 00C828 8000F828 38790000 */  addi      r3, r25, 0x0
/* 00C82C 8000F82C 38800000 */  li        r4, 0x0
/* 00C830 8000F830 38A00010 */  li        r5, 0x10
/* 00C834 8000F834 4BFF5AED */  bl        memset
/* 00C838 8000F838 38750000 */  addi      r3, r21, 0x0
/* 00C83C 8000F83C 389C05A0 */  addi      r4, r28, 0x5a0
/* 00C840 8000F840 480A2039 */  bl        DVDOpen
/* 00C844 8000F844 2C030000 */  cmpwi     r3, 0x0
/* 00C848 8000F848 4082001C */  bne       lbl_8000F864
/* 00C84C 8000F84C 38950000 */  addi      r4, r21, 0x0
/* 00C850 8000F850 4CC63182 */  crclr     cr1eq
/* 00C854 8000F854 387D01B0 */  addi      r3, r29, 0x1b0
/* 00C858 8000F858 4808E2ED */  bl        OSReport
/* 00C85C 8000F85C 38600000 */  li        r3, 0x0
/* 00C860 8000F860 480001A8 */  b         lbl_8000FA08
lbl_8000F864:
/* 00C864 8000F864 389C0000 */  addi      r4, r28, 0x0
/* 00C868 8000F868 387C05A0 */  addi      r3, r28, 0x5a0
/* 00C86C 8000F86C 38A00040 */  li        r5, 0x40
/* 00C870 8000F870 38C00000 */  li        r6, 0x0
/* 00C874 8000F874 480023C9 */  bl        movieDVDRead
/* 00C878 8000F878 3B7C05DC */  addi      r27, r28, 0x5dc
/* 00C87C 8000F87C 387B0000 */  addi      r3, r27, 0x0
/* 00C880 8000F880 389C0000 */  addi      r4, r28, 0x0
/* 00C884 8000F884 38A00030 */  li        r5, 0x30
/* 00C888 8000F888 4BFF5B8D */  bl        memcpy
/* 00C88C 8000F88C 387B0000 */  addi      r3, r27, 0x0
/* 00C890 8000F890 388D80D0 */  li        r4, D_8018B050@sda21
/* 00C894 8000F894 480BFB85 */  bl        strcmp
/* 00C898 8000F898 2C030000 */  cmpwi     r3, 0x0
/* 00C89C 8000F89C 41820020 */  beq       lbl_8000F8BC
/* 00C8A0 8000F8A0 387D01C0 */  addi      r3, r29, 0x1c0
/* 00C8A4 8000F8A4 4CC63182 */  crclr     cr1eq
/* 00C8A8 8000F8A8 4808E29D */  bl        OSReport
/* 00C8AC 8000F8AC 387C05A0 */  addi      r3, r28, 0x5a0
/* 00C8B0 8000F8B0 480A2091 */  bl        DVDClose
/* 00C8B4 8000F8B4 38600000 */  li        r3, 0x0
/* 00C8B8 8000F8B8 48000150 */  b         lbl_8000FA08
lbl_8000F8BC:
/* 00C8BC 8000F8BC 807C05E0 */  lwz       r3, 0x5e0(r28)
/* 00C8C0 8000F8C0 3C03FFFF */  subis     r0, r3, 0x1
/* 00C8C4 8000F8C4 28001000 */  cmplwi    r0, 0x1000
/* 00C8C8 8000F8C8 41820020 */  beq       lbl_8000F8E8
/* 00C8CC 8000F8CC 387D01E0 */  addi      r3, r29, 0x1e0
/* 00C8D0 8000F8D0 4CC63182 */  crclr     cr1eq
/* 00C8D4 8000F8D4 4808E271 */  bl        OSReport
/* 00C8D8 8000F8D8 387C05A0 */  addi      r3, r28, 0x5a0
/* 00C8DC 8000F8DC 480A2065 */  bl        DVDClose
/* 00C8E0 8000F8E0 38600000 */  li        r3, 0x0
/* 00C8E4 8000F8E4 48000124 */  b         lbl_8000FA08
lbl_8000F8E8:
/* 00C8E8 8000F8E8 82DC05FC */  lwz       r22, 0x5fc(r28)
/* 00C8EC 8000F8EC 389C0000 */  addi      r4, r28, 0x0
/* 00C8F0 8000F8F0 387C05A0 */  addi      r3, r28, 0x5a0
/* 00C8F4 8000F8F4 38D60000 */  addi      r6, r22, 0x0
/* 00C8F8 8000F8F8 38A00020 */  li        r5, 0x20
/* 00C8FC 8000F8FC 48002341 */  bl        movieDVDRead
/* 00C900 8000F900 3AFC060C */  addi      r23, r28, 0x60c
/* 00C904 8000F904 38770000 */  addi      r3, r23, 0x0
/* 00C908 8000F908 389C0000 */  addi      r4, r28, 0x0
/* 00C90C 8000F90C 38A00014 */  li        r5, 0x14
/* 00C910 8000F910 4BFF5B05 */  bl        memcpy
/* 00C914 8000F914 38000000 */  li        r0, 0x0
/* 00C918 8000F918 981C0647 */  stb       r0, 0x647(r28)
/* 00C91C 8000F91C 3B1C0647 */  addi      r24, r28, 0x647
/* 00C920 8000F920 3B7C05A0 */  addi      r27, r28, 0x5a0
/* 00C924 8000F924 3AA00000 */  li        r21, 0x0
/* 00C928 8000F928 3AD60014 */  addi      r22, r22, 0x14
/* 00C92C 8000F92C 4800009C */  b         lbl_8000F9C8
lbl_8000F930:
/* 00C930 8000F930 881B0070 */  lbz       r0, 0x70(r27)
/* 00C934 8000F934 2C000001 */  cmpwi     r0, 0x1
/* 00C938 8000F938 41820040 */  beq       lbl_8000F978
/* 00C93C 8000F93C 40800070 */  bge       lbl_8000F9AC
/* 00C940 8000F940 2C000000 */  cmpwi     r0, 0x0
/* 00C944 8000F944 40800008 */  bge       lbl_8000F94C
/* 00C948 8000F948 48000064 */  b         lbl_8000F9AC
lbl_8000F94C:
/* 00C94C 8000F94C 389C0000 */  addi      r4, r28, 0x0
/* 00C950 8000F950 38D60000 */  addi      r6, r22, 0x0
/* 00C954 8000F954 387C05A0 */  addi      r3, r28, 0x5a0
/* 00C958 8000F958 38A00020 */  li        r5, 0x20
/* 00C95C 8000F95C 480022E1 */  bl        movieDVDRead
/* 00C960 8000F960 387A0000 */  addi      r3, r26, 0x0
/* 00C964 8000F964 389C0000 */  addi      r4, r28, 0x0
/* 00C968 8000F968 38A0000C */  li        r5, 0xc
/* 00C96C 8000F96C 4BFF5AA9 */  bl        memcpy
/* 00C970 8000F970 3AD6000C */  addi      r22, r22, 0xc
/* 00C974 8000F974 4800004C */  b         lbl_8000F9C0
lbl_8000F978:
/* 00C978 8000F978 389C0000 */  addi      r4, r28, 0x0
/* 00C97C 8000F97C 38D60000 */  addi      r6, r22, 0x0
/* 00C980 8000F980 387C05A0 */  addi      r3, r28, 0x5a0
/* 00C984 8000F984 38A00020 */  li        r5, 0x20
/* 00C988 8000F988 480022B5 */  bl        movieDVDRead
/* 00C98C 8000F98C 38790000 */  addi      r3, r25, 0x0
/* 00C990 8000F990 389C0000 */  addi      r4, r28, 0x0
/* 00C994 8000F994 38A00010 */  li        r5, 0x10
/* 00C998 8000F998 4BFF5A7D */  bl        memcpy
/* 00C99C 8000F99C 38000001 */  li        r0, 0x1
/* 00C9A0 8000F9A0 98180000 */  stb       r0, 0x0(r24)
/* 00C9A4 8000F9A4 3AD60010 */  addi      r22, r22, 0x10
/* 00C9A8 8000F9A8 48000018 */  b         lbl_8000F9C0
lbl_8000F9AC:
/* 00C9AC 8000F9AC 387D01F4 */  addi      r3, r29, 0x1f4
/* 00C9B0 8000F9B0 4CC63182 */  crclr     cr1eq
/* 00C9B4 8000F9B4 4808E191 */  bl        OSReport
/* 00C9B8 8000F9B8 38600000 */  li        r3, 0x0
/* 00C9BC 8000F9BC 4800004C */  b         lbl_8000FA08
lbl_8000F9C0:
/* 00C9C0 8000F9C0 3B7B0001 */  addi      r27, r27, 0x1
/* 00C9C4 8000F9C4 3AB50001 */  addi      r21, r21, 0x1
lbl_8000F9C8:
/* 00C9C8 8000F9C8 80170000 */  lwz       r0, 0x0(r23)
/* 00C9CC 8000F9CC 7C150040 */  cmplw     r21, r0
/* 00C9D0 8000F9D0 4180FF60 */  blt       lbl_8000F930
/* 00C9D4 8000F9D4 38800000 */  li        r4, 0x0
/* 00C9D8 8000F9D8 989C0645 */  stb       r4, 0x645(r28)
/* 00C9DC 8000F9DC 38000001 */  li        r0, 0x1
/* 00C9E0 8000F9E0 38600001 */  li        r3, 0x1
/* 00C9E4 8000F9E4 989C0644 */  stb       r4, 0x644(r28)
/* 00C9E8 8000F9E8 989C0646 */  stb       r4, 0x646(r28)
/* 00C9EC 8000F9EC 93DC0650 */  stw       r30, 0x650(r28)
/* 00C9F0 8000F9F0 901F0000 */  stw       r0, 0x0(r31)
/* 00C9F4 8000F9F4 C0028070 */  lfs       f0, D_8018BFB0@sda21(r0)
/* 00C9F8 8000F9F8 D01C067C */  stfs      f0, 0x67c(r28)
/* 00C9FC 8000F9FC C01C067C */  lfs       f0, 0x67c(r28)
/* 00CA00 8000FA00 D01C0680 */  stfs      f0, 0x680(r28)
/* 00CA04 8000FA04 909C0688 */  stw       r4, 0x688(r28)
lbl_8000FA08:
/* 00CA08 8000FA08 BAA10014 */  lmw       r21, 0x14(r1)
/* 00CA0C 8000FA0C 80010044 */  lwz       r0, 0x44(r1)
/* 00CA10 8000FA10 38210040 */  addi      r1, r1, 0x40
/* 00CA14 8000FA14 7C0803A6 */  mtlr      r0
/* 00CA18 8000FA18 4E800020 */  blr

glabel THPPlayerCalcNeedMemory
/* 00CA1C 8000FA1C 3C608010 */  lis       r3, D_800FAA40@ha
/* 00CA20 8000FA20 38A3AA40 */  addi      r5, r3, D_800FAA40@l
/* 00CA24 8000FA24 80050640 */  lwz       r0, 0x640(r5)
/* 00CA28 8000FA28 2C000000 */  cmpwi     r0, 0x0
/* 00CA2C 8000FA2C 41820090 */  beq       lbl_8000FABC
/* 00CA30 8000FA30 80050650 */  lwz       r0, 0x650(r5)
/* 00CA34 8000FA34 2C000000 */  cmpwi     r0, 0x0
/* 00CA38 8000FA38 41820014 */  beq       lbl_8000FA4C
/* 00CA3C 8000FA3C 806505F8 */  lwz       r3, 0x5f8(r5)
/* 00CA40 8000FA40 3803001F */  addi      r0, r3, 0x1f
/* 00CA44 8000FA44 54060034 */  clrrwi    r6, r0, 5
/* 00CA48 8000FA48 48000014 */  b         lbl_8000FA5C
lbl_8000FA4C:
/* 00CA4C 8000FA4C 806505E4 */  lwz       r3, 0x5e4(r5)
/* 00CA50 8000FA50 3803001F */  addi      r0, r3, 0x1f
/* 00CA54 8000FA54 54000034 */  clrrwi    r0, r0, 5
/* 00CA58 8000FA58 1CC0000A */  mulli     r6, r0, 0xa
lbl_8000FA5C:
/* 00CA5C 8000FA5C 80850620 */  lwz       r4, 0x620(r5)
/* 00CA60 8000FA60 80650624 */  lwz       r3, 0x624(r5)
/* 00CA64 8000FA64 88050647 */  lbz       r0, 0x647(r5)
/* 00CA68 8000FA68 7C6419D6 */  mullw     r3, r4, r3
/* 00CA6C 8000FA6C 3883001F */  addi      r4, r3, 0x1f
/* 00CA70 8000FA70 5463F0BE */  srwi      r3, r3, 2
/* 00CA74 8000FA74 54840034 */  clrrwi    r4, r4, 5
/* 00CA78 8000FA78 3863001F */  addi      r3, r3, 0x1f
/* 00CA7C 8000FA7C 1C840003 */  mulli     r4, r4, 0x3
/* 00CA80 8000FA80 54630034 */  clrrwi    r3, r3, 5
/* 00CA84 8000FA84 1C630003 */  mulli     r3, r3, 0x3
/* 00CA88 8000FA88 7CC62214 */  add       r6, r6, r4
/* 00CA8C 8000FA8C 7CC61A14 */  add       r6, r6, r3
/* 00CA90 8000FA90 28000000 */  cmplwi    r0, 0x0
/* 00CA94 8000FA94 7CC61A14 */  add       r6, r6, r3
/* 00CA98 8000FA98 4182001C */  beq       lbl_8000FAB4
/* 00CA9C 8000FA9C 800505E8 */  lwz       r0, 0x5e8(r5)
/* 00CAA0 8000FAA0 5403103A */  slwi      r3, r0, 2
/* 00CAA4 8000FAA4 3803001F */  addi      r0, r3, 0x1f
/* 00CAA8 8000FAA8 54000034 */  clrrwi    r0, r0, 5
/* 00CAAC 8000FAAC 1C000003 */  mulli     r0, r0, 0x3
/* 00CAB0 8000FAB0 7CC60214 */  add       r6, r6, r0
lbl_8000FAB4:
/* 00CAB4 8000FAB4 38661000 */  addi      r3, r6, 0x1000
/* 00CAB8 8000FAB8 4E800020 */  blr
lbl_8000FABC:
/* 00CABC 8000FABC 38600000 */  li        r3, 0x0
/* 00CAC0 8000FAC0 4E800020 */  blr

glabel THPPlayerSetBuffer
/* 00CAC4 8000FAC4 7C0802A6 */  mflr      r0
/* 00CAC8 8000FAC8 3C808010 */  lis       r4, D_800FAA40@ha
/* 00CACC 8000FACC 90010004 */  stw       r0, 0x4(r1)
/* 00CAD0 8000FAD0 9421FFD0 */  stwu      r1, -0x30(r1)
/* 00CAD4 8000FAD4 BF410018 */  stmw      r26, 0x18(r1)
/* 00CAD8 8000FAD8 3BE4AA40 */  addi      r31, r4, D_800FAA40@l
/* 00CADC 8000FADC 801F0640 */  lwz       r0, 0x640(r31)
/* 00CAE0 8000FAE0 2C000000 */  cmpwi     r0, 0x0
/* 00CAE4 8000FAE4 418201F0 */  beq       lbl_8000FCD4
/* 00CAE8 8000FAE8 881F0644 */  lbz       r0, 0x644(r31)
/* 00CAEC 8000FAEC 28000000 */  cmplwi    r0, 0x0
/* 00CAF0 8000FAF0 408201E4 */  bne       lbl_8000FCD4
/* 00CAF4 8000FAF4 801F0650 */  lwz       r0, 0x650(r31)
/* 00CAF8 8000FAF8 2C000000 */  cmpwi     r0, 0x0
/* 00CAFC 8000FAFC 41820014 */  beq       lbl_8000FB10
/* 00CB00 8000FB00 907F0654 */  stw       r3, 0x654(r31)
/* 00CB04 8000FB04 801F05F8 */  lwz       r0, 0x5f8(r31)
/* 00CB08 8000FB08 7FC30214 */  add       r30, r3, r0
/* 00CB0C 8000FB0C 480000D8 */  b         lbl_8000FBE4
lbl_8000FB10:
/* 00CB10 8000FB10 907F06A0 */  stw       r3, 0x6a0(r31)
/* 00CB14 8000FB14 38000008 */  li        r0, 0x8
/* 00CB18 8000FB18 809F05E4 */  lwz       r4, 0x5e4(r31)
/* 00CB1C 8000FB1C 3884001F */  addi      r4, r4, 0x1f
/* 00CB20 8000FB20 54840034 */  clrrwi    r4, r4, 5
/* 00CB24 8000FB24 7FC32214 */  add       r30, r3, r4
/* 00CB28 8000FB28 93DF06AC */  stw       r30, 0x6ac(r31)
/* 00CB2C 8000FB2C 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CB30 8000FB30 3863001F */  addi      r3, r3, 0x1f
/* 00CB34 8000FB34 54630034 */  clrrwi    r3, r3, 5
/* 00CB38 8000FB38 7FDE1A14 */  add       r30, r30, r3
/* 00CB3C 8000FB3C 93DF06B8 */  stw       r30, 0x6b8(r31)
/* 00CB40 8000FB40 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CB44 8000FB44 3863001F */  addi      r3, r3, 0x1f
/* 00CB48 8000FB48 54630034 */  clrrwi    r3, r3, 5
/* 00CB4C 8000FB4C 7FDE1A14 */  add       r30, r30, r3
/* 00CB50 8000FB50 93DF06C4 */  stw       r30, 0x6c4(r31)
/* 00CB54 8000FB54 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CB58 8000FB58 3863001F */  addi      r3, r3, 0x1f
/* 00CB5C 8000FB5C 54630034 */  clrrwi    r3, r3, 5
/* 00CB60 8000FB60 7FDE1A14 */  add       r30, r30, r3
/* 00CB64 8000FB64 93DF06D0 */  stw       r30, 0x6d0(r31)
/* 00CB68 8000FB68 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CB6C 8000FB6C 3863001F */  addi      r3, r3, 0x1f
/* 00CB70 8000FB70 54630034 */  clrrwi    r3, r3, 5
/* 00CB74 8000FB74 7FDE1A14 */  add       r30, r30, r3
/* 00CB78 8000FB78 93DF06DC */  stw       r30, 0x6dc(r31)
/* 00CB7C 8000FB7C 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CB80 8000FB80 3863001F */  addi      r3, r3, 0x1f
/* 00CB84 8000FB84 54630034 */  clrrwi    r3, r3, 5
/* 00CB88 8000FB88 7FDE1A14 */  add       r30, r30, r3
/* 00CB8C 8000FB8C 93DF06E8 */  stw       r30, 0x6e8(r31)
/* 00CB90 8000FB90 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CB94 8000FB94 3863001F */  addi      r3, r3, 0x1f
/* 00CB98 8000FB98 54630034 */  clrrwi    r3, r3, 5
/* 00CB9C 8000FB9C 7FDE1A14 */  add       r30, r30, r3
/* 00CBA0 8000FBA0 93DF06F4 */  stw       r30, 0x6f4(r31)
/* 00CBA4 8000FBA4 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CBA8 8000FBA8 3863001F */  addi      r3, r3, 0x1f
/* 00CBAC 8000FBAC 54630034 */  clrrwi    r3, r3, 5
/* 00CBB0 8000FBB0 7FDE1A14 */  add       r30, r30, r3
/* 00CBB4 8000FBB4 48000128 */  b         lbl_8000FCDC
lbl_8000FBB8:
/* 00CBB8 8000FBB8 2060000A */  subfic    r3, r0, 0xa
/* 00CBBC 8000FBBC 2800000A */  cmplwi    r0, 0xa
/* 00CBC0 8000FBC0 7C6903A6 */  mtctr     r3
/* 00CBC4 8000FBC4 40800020 */  bge       lbl_8000FBE4
lbl_8000FBC8:
/* 00CBC8 8000FBC8 93C40100 */  stw       r30, 0x100(r4)
/* 00CBCC 8000FBCC 3884000C */  addi      r4, r4, 0xc
/* 00CBD0 8000FBD0 807F05E4 */  lwz       r3, 0x5e4(r31)
/* 00CBD4 8000FBD4 3803001F */  addi      r0, r3, 0x1f
/* 00CBD8 8000FBD8 54000034 */  clrrwi    r0, r0, 5
/* 00CBDC 8000FBDC 7FDE0214 */  add       r30, r30, r0
/* 00CBE0 8000FBE0 4200FFE8 */  bdnz      lbl_8000FBC8
lbl_8000FBE4:
/* 00CBE4 8000FBE4 807F0620 */  lwz       r3, 0x620(r31)
/* 00CBE8 8000FBE8 3BBF05A0 */  addi      r29, r31, 0x5a0
/* 00CBEC 8000FBEC 801F0624 */  lwz       r0, 0x624(r31)
/* 00CBF0 8000FBF0 3B800000 */  li        r28, 0x0
/* 00CBF4 8000FBF4 7C8301D6 */  mullw     r4, r3, r0
/* 00CBF8 8000FBF8 5483F0BE */  srwi      r3, r4, 2
/* 00CBFC 8000FBFC 3884001F */  addi      r4, r4, 0x1f
/* 00CC00 8000FC00 3803001F */  addi      r0, r3, 0x1f
/* 00CC04 8000FC04 549B0034 */  clrrwi    r27, r4, 5
/* 00CC08 8000FC08 541A0034 */  clrrwi    r26, r0, 5
lbl_8000FC0C:
/* 00CC0C 8000FC0C 93DD0178 */  stw       r30, 0x178(r29)
/* 00CC10 8000FC10 387E0000 */  addi      r3, r30, 0x0
/* 00CC14 8000FC14 389B0000 */  addi      r4, r27, 0x0
/* 00CC18 8000FC18 4808D081 */  bl        DCInvalidateRange
/* 00CC1C 8000FC1C 7FDEDA14 */  add       r30, r30, r27
/* 00CC20 8000FC20 93DD017C */  stw       r30, 0x17c(r29)
/* 00CC24 8000FC24 387E0000 */  addi      r3, r30, 0x0
/* 00CC28 8000FC28 389A0000 */  addi      r4, r26, 0x0
/* 00CC2C 8000FC2C 4808D06D */  bl        DCInvalidateRange
/* 00CC30 8000FC30 7FDED214 */  add       r30, r30, r26
/* 00CC34 8000FC34 93DD0180 */  stw       r30, 0x180(r29)
/* 00CC38 8000FC38 387E0000 */  addi      r3, r30, 0x0
/* 00CC3C 8000FC3C 389A0000 */  addi      r4, r26, 0x0
/* 00CC40 8000FC40 4808D059 */  bl        DCInvalidateRange
/* 00CC44 8000FC44 3B9C0001 */  addi      r28, r28, 0x1
/* 00CC48 8000FC48 281C0003 */  cmplwi    r28, 0x3
/* 00CC4C 8000FC4C 7FDED214 */  add       r30, r30, r26
/* 00CC50 8000FC50 3BBD0010 */  addi      r29, r29, 0x10
/* 00CC54 8000FC54 4180FFB8 */  blt       lbl_8000FC0C
/* 00CC58 8000FC58 881F0647 */  lbz       r0, 0x647(r31)
/* 00CC5C 8000FC5C 28000000 */  cmplwi    r0, 0x0
/* 00CC60 8000FC60 41820068 */  beq       lbl_8000FCC8
/* 00CC64 8000FC64 93DF0748 */  stw       r30, 0x748(r31)
/* 00CC68 8000FC68 38800000 */  li        r4, 0x0
/* 00CC6C 8000FC6C 93DF074C */  stw       r30, 0x74c(r31)
/* 00CC70 8000FC70 909F0750 */  stw       r4, 0x750(r31)
/* 00CC74 8000FC74 801F05E8 */  lwz       r0, 0x5e8(r31)
/* 00CC78 8000FC78 5403103A */  slwi      r3, r0, 2
/* 00CC7C 8000FC7C 3803001F */  addi      r0, r3, 0x1f
/* 00CC80 8000FC80 54000034 */  clrrwi    r0, r0, 5
/* 00CC84 8000FC84 7FDE0214 */  add       r30, r30, r0
/* 00CC88 8000FC88 93DF0754 */  stw       r30, 0x754(r31)
/* 00CC8C 8000FC8C 93DF0758 */  stw       r30, 0x758(r31)
/* 00CC90 8000FC90 909F075C */  stw       r4, 0x75c(r31)
/* 00CC94 8000FC94 801F05E8 */  lwz       r0, 0x5e8(r31)
/* 00CC98 8000FC98 5403103A */  slwi      r3, r0, 2
/* 00CC9C 8000FC9C 3803001F */  addi      r0, r3, 0x1f
/* 00CCA0 8000FCA0 54000034 */  clrrwi    r0, r0, 5
/* 00CCA4 8000FCA4 7FDE0214 */  add       r30, r30, r0
/* 00CCA8 8000FCA8 93DF0760 */  stw       r30, 0x760(r31)
/* 00CCAC 8000FCAC 93DF0764 */  stw       r30, 0x764(r31)
/* 00CCB0 8000FCB0 909F0768 */  stw       r4, 0x768(r31)
/* 00CCB4 8000FCB4 801F05E8 */  lwz       r0, 0x5e8(r31)
/* 00CCB8 8000FCB8 5403103A */  slwi      r3, r0, 2
/* 00CCBC 8000FCBC 3803001F */  addi      r0, r3, 0x1f
/* 00CCC0 8000FCC0 54000034 */  clrrwi    r0, r0, 5
/* 00CCC4 8000FCC4 7FDE0214 */  add       r30, r30, r0
lbl_8000FCC8:
/* 00CCC8 8000FCC8 93DF063C */  stw       r30, 0x63c(r31)
/* 00CCCC 8000FCCC 38600001 */  li        r3, 0x1
/* 00CCD0 8000FCD0 4800001C */  b         lbl_8000FCEC
lbl_8000FCD4:
/* 00CCD4 8000FCD4 38600000 */  li        r3, 0x0
/* 00CCD8 8000FCD8 48000014 */  b         lbl_8000FCEC
lbl_8000FCDC:
/* 00CCDC 8000FCDC 1C60000C */  mulli     r3, r0, 0xc
/* 00CCE0 8000FCE0 7C9F1A14 */  add       r4, r31, r3
/* 00CCE4 8000FCE4 388405A0 */  addi      r4, r4, 0x5a0
/* 00CCE8 8000FCE8 4BFFFED0 */  b         lbl_8000FBB8
lbl_8000FCEC:
/* 00CCEC 8000FCEC BB410018 */  lmw       r26, 0x18(r1)
/* 00CCF0 8000FCF0 80010034 */  lwz       r0, 0x34(r1)
/* 00CCF4 8000FCF4 38210030 */  addi      r1, r1, 0x30
/* 00CCF8 8000FCF8 7C0803A6 */  mtlr      r0
/* 00CCFC 8000FCFC 4E800020 */  blr

glabel InitAllMessageQueue
/* 00CD00 8000FD00 7C0802A6 */  mflr      r0
/* 00CD04 8000FD04 3C608010 */  lis       r3, D_800FAA40@ha
/* 00CD08 8000FD08 90010004 */  stw       r0, 0x4(r1)
/* 00CD0C 8000FD0C 9421FFE8 */  stwu      r1, -0x18(r1)
/* 00CD10 8000FD10 93E10014 */  stw       r31, 0x14(r1)
/* 00CD14 8000FD14 3BE3AA40 */  addi      r31, r3, D_800FAA40@l
/* 00CD18 8000FD18 93C10010 */  stw       r30, 0x10(r1)
/* 00CD1C 8000FD1C 93A1000C */  stw       r29, 0xc(r1)
/* 00CD20 8000FD20 93810008 */  stw       r28, 0x8(r1)
/* 00CD24 8000FD24 801F0650 */  lwz       r0, 0x650(r31)
/* 00CD28 8000FD28 2C000000 */  cmpwi     r0, 0x0
/* 00CD2C 8000FD2C 40820024 */  bne       lbl_8000FD50
/* 00CD30 8000FD30 3B800000 */  li        r28, 0x0
/* 00CD34 8000FD34 3BDF05A0 */  addi      r30, r31, 0x5a0
lbl_8000FD38:
/* 00CD38 8000FD38 387E0100 */  addi      r3, r30, 0x100
/* 00CD3C 8000FD3C 48001A3D */  bl        PushFreeReadBuffer
/* 00CD40 8000FD40 3B9C0001 */  addi      r28, r28, 0x1
/* 00CD44 8000FD44 2C1C000A */  cmpwi     r28, 0xa
/* 00CD48 8000FD48 3BDE000C */  addi      r30, r30, 0xc
/* 00CD4C 8000FD4C 4180FFEC */  blt       lbl_8000FD38
lbl_8000FD50:
/* 00CD50 8000FD50 3BBF05A0 */  addi      r29, r31, 0x5a0
/* 00CD54 8000FD54 3BDD0000 */  addi      r30, r29, 0x0
/* 00CD58 8000FD58 3B800000 */  li        r28, 0x0
lbl_8000FD5C:
/* 00CD5C 8000FD5C 387E0178 */  addi      r3, r30, 0x178
/* 00CD60 8000FD60 48003419 */  bl        PushFreeTextureSet
/* 00CD64 8000FD64 3B9C0001 */  addi      r28, r28, 0x1
/* 00CD68 8000FD68 2C1C0003 */  cmpwi     r28, 0x3
/* 00CD6C 8000FD6C 3BDE0010 */  addi      r30, r30, 0x10
/* 00CD70 8000FD70 4180FFEC */  blt       lbl_8000FD5C
/* 00CD74 8000FD74 881F0647 */  lbz       r0, 0x647(r31)
/* 00CD78 8000FD78 28000000 */  cmplwi    r0, 0x0
/* 00CD7C 8000FD7C 41820020 */  beq       lbl_8000FD9C
/* 00CD80 8000FD80 3BC00000 */  li        r30, 0x0
lbl_8000FD84:
/* 00CD84 8000FD84 387D01A8 */  addi      r3, r29, 0x1a8
/* 00CD88 8000FD88 480010E9 */  bl        PushFreeAudioBuffer
/* 00CD8C 8000FD8C 3BDE0001 */  addi      r30, r30, 0x1
/* 00CD90 8000FD90 2C1E0003 */  cmpwi     r30, 0x3
/* 00CD94 8000FD94 3BBD000C */  addi      r29, r29, 0xc
/* 00CD98 8000FD98 4180FFEC */  blt       lbl_8000FD84
lbl_8000FD9C:
/* 00CD9C 8000FD9C 387F0040 */  addi      r3, r31, 0x40
/* 00CDA0 8000FDA0 388D892C */  li        r4, D_8018B8AC@sda21
/* 00CDA4 8000FDA4 38A00001 */  li        r5, 0x1
/* 00CDA8 8000FDA8 4808ED25 */  bl        OSInitMessageQueue
/* 00CDAC 8000FDAC 8001001C */  lwz       r0, 0x1c(r1)
/* 00CDB0 8000FDB0 83E10014 */  lwz       r31, 0x14(r1)
/* 00CDB4 8000FDB4 83C10010 */  lwz       r30, 0x10(r1)
/* 00CDB8 8000FDB8 7C0803A6 */  mtlr      r0
/* 00CDBC 8000FDBC 83A1000C */  lwz       r29, 0xc(r1)
/* 00CDC0 8000FDC0 83810008 */  lwz       r28, 0x8(r1)
/* 00CDC4 8000FDC4 38210018 */  addi      r1, r1, 0x18
/* 00CDC8 8000FDC8 4E800020 */  blr

glabel PrepareReady
/* 00CDCC 8000FDCC 7C0802A6 */  mflr      r0
/* 00CDD0 8000FDD0 3CA08010 */  lis       r5, D_800FAA80@ha
/* 00CDD4 8000FDD4 90010004 */  stw       r0, 0x4(r1)
/* 00CDD8 8000FDD8 38830000 */  addi      r4, r3, 0x0
/* 00CDDC 8000FDDC 3865AA80 */  addi      r3, r5, D_800FAA80@l
/* 00CDE0 8000FDE0 9421FFF8 */  stwu      r1, -0x8(r1)
/* 00CDE4 8000FDE4 38A00001 */  li        r5, 0x1
/* 00CDE8 8000FDE8 4808ED45 */  bl        OSSendMessage
/* 00CDEC 8000FDEC 8001000C */  lwz       r0, 0xc(r1)
/* 00CDF0 8000FDF0 38210008 */  addi      r1, r1, 0x8
/* 00CDF4 8000FDF4 7C0803A6 */  mtlr      r0
/* 00CDF8 8000FDF8 4E800020 */  blr

glabel THPPlayerPrepare
/* 00CDFC 8000FDFC 7C0802A6 */  mflr      r0
/* 00CE00 8000FE00 3CC08010 */  lis       r6, D_800FAA40@ha
/* 00CE04 8000FE04 90010004 */  stw       r0, 0x4(r1)
/* 00CE08 8000FE08 9421FFD0 */  stwu      r1, -0x30(r1)
/* 00CE0C 8000FE0C BF410018 */  stmw      r26, 0x18(r1)
/* 00CE10 8000FE10 3BC6AA40 */  addi      r30, r6, D_800FAA40@l
/* 00CE14 8000FE14 3CC0800F */  lis       r6, D_800EB6A0@ha
/* 00CE18 8000FE18 3BA30000 */  addi      r29, r3, 0x0
/* 00CE1C 8000FE1C 3B440000 */  addi      r26, r4, 0x0
/* 00CE20 8000FE20 3B650000 */  addi      r27, r5, 0x0
/* 00CE24 8000FE24 3BE6B6A0 */  addi      r31, r6, D_800EB6A0@l
/* 00CE28 8000FE28 801E0640 */  lwz       r0, 0x640(r30)
/* 00CE2C 8000FE2C 2C000000 */  cmpwi     r0, 0x0
/* 00CE30 8000FE30 41820228 */  beq       lbl_80010058
/* 00CE34 8000FE34 3B9E0644 */  addi      r28, r30, 0x644
/* 00CE38 8000FE38 881E0644 */  lbz       r0, 0x644(r30)
/* 00CE3C 8000FE3C 28000000 */  cmplwi    r0, 0x0
/* 00CE40 8000FE40 40820218 */  bne       lbl_80010058
/* 00CE44 8000FE44 2C1D0000 */  cmpwi     r29, 0x0
/* 00CE48 8000FE48 40810084 */  ble       lbl_8000FECC
/* 00CE4C 8000FE4C 807E0600 */  lwz       r3, 0x600(r30)
/* 00CE50 8000FE50 28030000 */  cmplwi    r3, 0x0
/* 00CE54 8000FE54 40820018 */  bne       lbl_8000FE6C
/* 00CE58 8000FE58 387F0210 */  addi      r3, r31, 0x210
/* 00CE5C 8000FE5C 4CC63182 */  crclr     cr1eq
/* 00CE60 8000FE60 4808DCE5 */  bl        OSReport
/* 00CE64 8000FE64 38600000 */  li        r3, 0x0
/* 00CE68 8000FE68 480001F4 */  b         lbl_8001005C
lbl_8000FE6C:
/* 00CE6C 8000FE6C 801E05F0 */  lwz       r0, 0x5f0(r30)
/* 00CE70 8000FE70 7C00E840 */  cmplw     r0, r29
/* 00CE74 8000FE74 40810044 */  ble       lbl_8000FEB8
/* 00CE78 8000FE78 381DFFFF */  subi      r0, r29, 0x1
/* 00CE7C 8000FE7C 5400103A */  slwi      r0, r0, 2
/* 00CE80 8000FE80 7CC30214 */  add       r6, r3, r0
/* 00CE84 8000FE84 389E0000 */  addi      r4, r30, 0x0
/* 00CE88 8000FE88 387E05A0 */  addi      r3, r30, 0x5a0
/* 00CE8C 8000FE8C 38A00020 */  li        r5, 0x20
/* 00CE90 8000FE90 48001DAD */  bl        movieDVDRead
/* 00CE94 8000FE94 801E0604 */  lwz       r0, 0x604(r30)
/* 00CE98 8000FE98 807E0000 */  lwz       r3, 0x0(r30)
/* 00CE9C 8000FE9C 7C001A14 */  add       r0, r0, r3
/* 00CEA0 8000FEA0 901E0658 */  stw       r0, 0x658(r30)
/* 00CEA4 8000FEA4 93BE0660 */  stw       r29, 0x660(r30)
/* 00CEA8 8000FEA8 801E0004 */  lwz       r0, 0x4(r30)
/* 00CEAC 8000FEAC 7C030050 */  subf      r0, r3, r0
/* 00CEB0 8000FEB0 901E065C */  stw       r0, 0x65c(r30)
/* 00CEB4 8000FEB4 4800002C */  b         lbl_8000FEE0
lbl_8000FEB8:
/* 00CEB8 8000FEB8 387F023C */  addi      r3, r31, 0x23c
/* 00CEBC 8000FEBC 4CC63182 */  crclr     cr1eq
/* 00CEC0 8000FEC0 4808DC85 */  bl        OSReport
/* 00CEC4 8000FEC4 38600000 */  li        r3, 0x0
/* 00CEC8 8000FEC8 48000194 */  b         lbl_8001005C
lbl_8000FECC:
/* 00CECC 8000FECC 801E0604 */  lwz       r0, 0x604(r30)
/* 00CED0 8000FED0 901E0658 */  stw       r0, 0x658(r30)
/* 00CED4 8000FED4 801E05F4 */  lwz       r0, 0x5f4(r30)
/* 00CED8 8000FED8 901E065C */  stw       r0, 0x65c(r30)
/* 00CEDC 8000FEDC 93BE0660 */  stw       r29, 0x660(r30)
lbl_8000FEE0:
/* 00CEE0 8000FEE0 3BBE0647 */  addi      r29, r30, 0x647
/* 00CEE4 8000FEE4 881E0647 */  lbz       r0, 0x647(r30)
/* 00CEE8 8000FEE8 28000000 */  cmplwi    r0, 0x0
/* 00CEEC 8000FEEC 41820030 */  beq       lbl_8000FF1C
/* 00CEF0 8000FEF0 2C1B0000 */  cmpwi     r27, 0x0
/* 00CEF4 8000FEF4 41800010 */  blt       lbl_8000FF04
/* 00CEF8 8000FEF8 801E0638 */  lwz       r0, 0x638(r30)
/* 00CEFC 8000FEFC 7C1B0040 */  cmplw     r27, r0
/* 00CF00 8000FF00 41800018 */  blt       lbl_8000FF18
lbl_8000FF04:
/* 00CF04 8000FF04 387F0270 */  addi      r3, r31, 0x270
/* 00CF08 8000FF08 4CC63182 */  crclr     cr1eq
/* 00CF0C 8000FF0C 4808DC39 */  bl        OSReport
/* 00CF10 8000FF10 38600000 */  li        r3, 0x0
/* 00CF14 8000FF14 48000148 */  b         lbl_8001005C
lbl_8000FF18:
/* 00CF18 8000FF18 937E068C */  stw       r27, 0x68c(r30)
lbl_8000FF1C:
/* 00CF1C 8000FF1C 575A07FE */  clrlwi    r26, r26, 31
/* 00CF20 8000FF20 9B5E0646 */  stb       r26, 0x646(r30)
/* 00CF24 8000FF24 38000000 */  li        r0, 0x0
/* 00CF28 8000FF28 3BFE0650 */  addi      r31, r30, 0x650
/* 00CF2C 8000FF2C 901E0678 */  stw       r0, 0x678(r30)
/* 00CF30 8000FF30 801E0650 */  lwz       r0, 0x650(r30)
/* 00CF34 8000FF34 2C000000 */  cmpwi     r0, 0x0
/* 00CF38 8000FF38 4182005C */  beq       lbl_8000FF94
/* 00CF3C 8000FF3C 3B5E0654 */  addi      r26, r30, 0x654
/* 00CF40 8000FF40 80BE05F8 */  lwz       r5, 0x5f8(r30)
/* 00CF44 8000FF44 3B7E0604 */  addi      r27, r30, 0x604
/* 00CF48 8000FF48 809E0654 */  lwz       r4, 0x654(r30)
/* 00CF4C 8000FF4C 80DE0604 */  lwz       r6, 0x604(r30)
/* 00CF50 8000FF50 387E05A0 */  addi      r3, r30, 0x5a0
/* 00CF54 8000FF54 48001CE9 */  bl        movieDVDRead
/* 00CF58 8000FF58 809A0000 */  lwz       r4, 0x0(r26)
/* 00CF5C 8000FF5C 38600014 */  li        r3, 0x14
/* 00CF60 8000FF60 801E0658 */  lwz       r0, 0x658(r30)
/* 00CF64 8000FF64 80BB0000 */  lwz       r5, 0x0(r27)
/* 00CF68 8000FF68 7C040214 */  add       r0, r4, r0
/* 00CF6C 8000FF6C 7F450050 */  subf      r26, r5, r0
/* 00CF70 8000FF70 389A0000 */  addi      r4, r26, 0x0
/* 00CF74 8000FF74 48002D89 */  bl        CreateVideoDecodeThread
/* 00CF78 8000FF78 881D0000 */  lbz       r0, 0x0(r29)
/* 00CF7C 8000FF7C 28000000 */  cmplwi    r0, 0x0
/* 00CF80 8000FF80 41820040 */  beq       lbl_8000FFC0
/* 00CF84 8000FF84 3860000C */  li        r3, 0xc
/* 00CF88 8000FF88 389A0000 */  addi      r4, r26, 0x0
/* 00CF8C 8000FF8C 48000BED */  bl        CreateAudioDecodeThread
/* 00CF90 8000FF90 48000030 */  b         lbl_8000FFC0
lbl_8000FF94:
/* 00CF94 8000FF94 38600014 */  li        r3, 0x14
/* 00CF98 8000FF98 38800000 */  li        r4, 0x0
/* 00CF9C 8000FF9C 48002D61 */  bl        CreateVideoDecodeThread
/* 00CFA0 8000FFA0 881D0000 */  lbz       r0, 0x0(r29)
/* 00CFA4 8000FFA4 28000000 */  cmplwi    r0, 0x0
/* 00CFA8 8000FFA8 41820010 */  beq       lbl_8000FFB8
/* 00CFAC 8000FFAC 3860000C */  li        r3, 0xc
/* 00CFB0 8000FFB0 38800000 */  li        r4, 0x0
/* 00CFB4 8000FFB4 48000BC5 */  bl        CreateAudioDecodeThread
lbl_8000FFB8:
/* 00CFB8 8000FFB8 38600008 */  li        r3, 0x8
/* 00CFBC 8000FFBC 48001981 */  bl        CreateReadThread
lbl_8000FFC0:
/* 00CFC0 8000FFC0 4BFFFD41 */  bl        InitAllMessageQueue
/* 00CFC4 8000FFC4 48002E1D */  bl        VideoDecodeThreadStart
/* 00CFC8 8000FFC8 881D0000 */  lbz       r0, 0x0(r29)
/* 00CFCC 8000FFCC 28000000 */  cmplwi    r0, 0x0
/* 00CFD0 8000FFD0 41820008 */  beq       lbl_8000FFD8
/* 00CFD4 8000FFD4 48000C85 */  bl        AudioDecodeThreadStart
lbl_8000FFD8:
/* 00CFD8 8000FFD8 801F0000 */  lwz       r0, 0x0(r31)
/* 00CFDC 8000FFDC 2C000000 */  cmpwi     r0, 0x0
/* 00CFE0 8000FFE0 40820008 */  bne       lbl_8000FFE8
/* 00CFE4 8000FFE4 48001925 */  bl        ReadThreadStart
lbl_8000FFE8:
/* 00CFE8 8000FFE8 387E0040 */  addi      r3, r30, 0x40
/* 00CFEC 8000FFEC 38810014 */  addi      r4, r1, 0x14
/* 00CFF0 8000FFF0 38A00001 */  li        r5, 0x1
/* 00CFF4 8000FFF4 4808EC01 */  bl        OSReceiveMessage
/* 00CFF8 8000FFF8 80010014 */  lwz       r0, 0x14(r1)
/* 00CFFC 8000FFFC 2C000000 */  cmpwi     r0, 0x0
/* 00D000 80010000 4182000C */  beq       lbl_8001000C
/* 00D004 80010004 38000001 */  li        r0, 0x1
/* 00D008 80010008 48000008 */  b         lbl_80010010
lbl_8001000C:
/* 00D00C 8001000C 38000000 */  li        r0, 0x0
lbl_80010010:
/* 00D010 80010010 2C000000 */  cmpwi     r0, 0x0
/* 00D014 80010014 4082000C */  bne       lbl_80010020
/* 00D018 80010018 38600000 */  li        r3, 0x0
/* 00D01C 8001001C 48000040 */  b         lbl_8001005C
lbl_80010020:
/* 00D020 80010020 38000001 */  li        r0, 0x1
/* 00D024 80010024 981C0000 */  stb       r0, 0x0(r28)
/* 00D028 80010028 38000000 */  li        r0, 0x0
/* 00D02C 8001002C 3C608001 */  lis       r3, PlayControl@ha
/* 00D030 80010030 981E0645 */  stb       r0, 0x645(r30)
/* 00D034 80010034 386300CC */  addi      r3, r3, PlayControl@l
/* 00D038 80010038 901E0698 */  stw       r0, 0x698(r30)
/* 00D03C 8001003C 901E069C */  stw       r0, 0x69c(r30)
/* 00D040 80010040 901E0690 */  stw       r0, 0x690(r30)
/* 00D044 80010044 901E0694 */  stw       r0, 0x694(r30)
/* 00D048 80010048 48094ECD */  bl        fn_800A4F14
/* 00D04C 8001004C 906D8930 */  stw       r3, D_8018B8B0@sda21(r0)
/* 00D050 80010050 38600001 */  li        r3, 0x1
/* 00D054 80010054 48000008 */  b         lbl_8001005C
lbl_80010058:
/* 00D058 80010058 38600000 */  li        r3, 0x0
lbl_8001005C:
/* 00D05C 8001005C BB410018 */  lmw       r26, 0x18(r1)
/* 00D060 80010060 80010034 */  lwz       r0, 0x34(r1)
/* 00D064 80010064 38210030 */  addi      r1, r1, 0x30
/* 00D068 80010068 7C0803A6 */  mtlr      r0
/* 00D06C 8001006C 4E800020 */  blr

glabel THPPlayerPlay
/* 00D070 80010070 3C608010 */  lis       r3, D_800FAA40@ha
/* 00D074 80010074 38A3AA40 */  addi      r5, r3, D_800FAA40@l
/* 00D078 80010078 80050640 */  lwz       r0, 0x640(r5)
/* 00D07C 8001007C 2C000000 */  cmpwi     r0, 0x0
/* 00D080 80010080 41820044 */  beq       lbl_800100C4
/* 00D084 80010084 38650644 */  addi      r3, r5, 0x644
/* 00D088 80010088 88050644 */  lbz       r0, 0x644(r5)
/* 00D08C 8001008C 28000001 */  cmplwi    r0, 0x1
/* 00D090 80010090 4182000C */  beq       lbl_8001009C
/* 00D094 80010094 28000004 */  cmplwi    r0, 0x4
/* 00D098 80010098 4082002C */  bne       lbl_800100C4
lbl_8001009C:
/* 00D09C 8001009C 38000002 */  li        r0, 0x2
/* 00D0A0 800100A0 98030000 */  stb       r0, 0x0(r3)
/* 00D0A4 800100A4 38800000 */  li        r4, 0x0
/* 00D0A8 800100A8 3800FFFF */  li        r0, -0x1
/* 00D0AC 800100AC 90850670 */  stw       r4, 0x670(r5)
/* 00D0B0 800100B0 38600001 */  li        r3, 0x1
/* 00D0B4 800100B4 90850674 */  stw       r4, 0x674(r5)
/* 00D0B8 800100B8 9005066C */  stw       r0, 0x66c(r5)
/* 00D0BC 800100BC 90050668 */  stw       r0, 0x668(r5)
/* 00D0C0 800100C0 4E800020 */  blr
lbl_800100C4:
/* 00D0C4 800100C4 38600000 */  li        r3, 0x0
/* 00D0C8 800100C8 4E800020 */  blr

glabel PlayControl
/* 00D0CC 800100CC 7C0802A6 */  mflr      r0
/* 00D0D0 800100D0 3C808010 */  lis       r4, D_800FAA40@ha
/* 00D0D4 800100D4 90010004 */  stw       r0, 0x4(r1)
/* 00D0D8 800100D8 9421FFE0 */  stwu      r1, -0x20(r1)
/* 00D0DC 800100DC 93E1001C */  stw       r31, 0x1c(r1)
/* 00D0E0 800100E0 3BE4AA40 */  addi      r31, r4, D_800FAA40@l
/* 00D0E4 800100E4 93C10018 */  stw       r30, 0x18(r1)
/* 00D0E8 800100E8 93A10014 */  stw       r29, 0x14(r1)
/* 00D0EC 800100EC 93810010 */  stw       r28, 0x10(r1)
/* 00D0F0 800100F0 818D8930 */  lwz       r12, D_8018B8B0@sda21(r0)
/* 00D0F4 800100F4 280C0000 */  cmplwi    r12, 0x0
/* 00D0F8 800100F8 4182000C */  beq       lbl_80010104
/* 00D0FC 800100FC 7D8803A6 */  mtlr      r12
/* 00D100 80010100 4E800021 */  blrl
lbl_80010104:
/* 00D104 80010104 801F0640 */  lwz       r0, 0x640(r31)
/* 00D108 80010108 3BA0FFFF */  li        r29, -0x1
/* 00D10C 8001010C 2C000000 */  cmpwi     r0, 0x0
/* 00D110 80010110 41820238 */  beq       lbl_80010348
/* 00D114 80010114 3BDF0644 */  addi      r30, r31, 0x644
/* 00D118 80010118 881F0644 */  lbz       r0, 0x644(r31)
/* 00D11C 8001011C 28000002 */  cmplwi    r0, 0x2
/* 00D120 80010120 40820228 */  bne       lbl_80010348
/* 00D124 80010124 801F0648 */  lwz       r0, 0x648(r31)
/* 00D128 80010128 2C000000 */  cmpwi     r0, 0x0
/* 00D12C 8001012C 40820010 */  bne       lbl_8001013C
/* 00D130 80010130 801F064C */  lwz       r0, 0x64c(r31)
/* 00D134 80010134 2C000000 */  cmpwi     r0, 0x0
/* 00D138 80010138 41820014 */  beq       lbl_8001014C
lbl_8001013C:
/* 00D13C 8001013C 38000005 */  li        r0, 0x5
/* 00D140 80010140 981F0645 */  stb       r0, 0x645(r31)
/* 00D144 80010144 981E0000 */  stb       r0, 0x0(r30)
/* 00D148 80010148 48000200 */  b         lbl_80010348
lbl_8001014C:
/* 00D14C 8001014C 801F066C */  lwz       r0, 0x66c(r31)
/* 00D150 80010150 38A00001 */  li        r5, 0x1
/* 00D154 80010154 807F0668 */  lwz       r3, 0x668(r31)
/* 00D158 80010158 38800000 */  li        r4, 0x0
/* 00D15C 8001015C 7C002814 */  addc      r0, r0, r5
/* 00D160 80010160 901F066C */  stw       r0, 0x66c(r31)
/* 00D164 80010164 7C032114 */  adde      r0, r3, r4
/* 00D168 80010168 3B9F0668 */  addi      r28, r31, 0x668
/* 00D16C 8001016C 901F0668 */  stw       r0, 0x668(r31)
/* 00D170 80010170 80DF0668 */  lwz       r6, 0x668(r31)
/* 00D174 80010174 80FF066C */  lwz       r7, 0x66c(r31)
/* 00D178 80010178 7CC02278 */  xor       r0, r6, r4
/* 00D17C 8001017C 7CE32278 */  xor       r3, r7, r4
/* 00D180 80010180 7C600379 */  or.       r0, r3, r0
/* 00D184 80010184 40820088 */  bne       lbl_8001020C
/* 00D188 80010188 480001E1 */  bl        ProperTimingForStart
/* 00D18C 8001018C 2C030000 */  cmpwi     r3, 0x0
/* 00D190 80010190 4182006C */  beq       lbl_800101FC
/* 00D194 80010194 881F0647 */  lbz       r0, 0x647(r31)
/* 00D198 80010198 28000000 */  cmplwi    r0, 0x0
/* 00D19C 8001019C 41820050 */  beq       lbl_800101EC
/* 00D1A0 800101A0 3B9F0690 */  addi      r28, r31, 0x690
/* 00D1A4 800101A4 807F0694 */  lwz       r3, 0x694(r31)
/* 00D1A8 800101A8 801F0690 */  lwz       r0, 0x690(r31)
/* 00D1AC 800101AC 7C030050 */  subf      r0, r3, r0
/* 00D1B0 800101B0 2C000001 */  cmpwi     r0, 0x1
/* 00D1B4 800101B4 4181002C */  bgt       lbl_800101E0
/* 00D1B8 800101B8 38600000 */  li        r3, 0x0
/* 00D1BC 800101BC 48002FED */  bl        PopDecodedTextureSet
/* 00D1C0 800101C0 809F0678 */  lwz       r4, 0x678(r31)
/* 00D1C4 800101C4 3BA30000 */  addi      r29, r3, 0x0
/* 00D1C8 800101C8 3804FFFF */  subi      r0, r4, 0x1
/* 00D1CC 800101CC 901F0678 */  stw       r0, 0x678(r31)
/* 00D1D0 800101D0 807C0000 */  lwz       r3, 0x0(r28)
/* 00D1D4 800101D4 38030001 */  addi      r0, r3, 0x1
/* 00D1D8 800101D8 901C0000 */  stw       r0, 0x0(r28)
/* 00D1DC 800101DC 480000AC */  b         lbl_80010288
lbl_800101E0:
/* 00D1E0 800101E0 38000002 */  li        r0, 0x2
/* 00D1E4 800101E4 981F0645 */  stb       r0, 0x645(r31)
/* 00D1E8 800101E8 480000A0 */  b         lbl_80010288
lbl_800101EC:
/* 00D1EC 800101EC 38600000 */  li        r3, 0x0
/* 00D1F0 800101F0 48002FB9 */  bl        PopDecodedTextureSet
/* 00D1F4 800101F4 7C7D1B78 */  mr        r29, r3
/* 00D1F8 800101F8 48000090 */  b         lbl_80010288
lbl_800101FC:
/* 00D1FC 800101FC 3800FFFF */  li        r0, -0x1
/* 00D200 80010200 901C0004 */  stw       r0, 0x4(r28)
/* 00D204 80010204 901C0000 */  stw       r0, 0x0(r28)
/* 00D208 80010208 48000080 */  b         lbl_80010288
lbl_8001020C:
/* 00D20C 8001020C 7CE32A78 */  xor       r3, r7, r5
/* 00D210 80010210 7CC02278 */  xor       r0, r6, r4
/* 00D214 80010214 7C600379 */  or.       r0, r3, r0
/* 00D218 80010218 4082000C */  bne       lbl_80010224
/* 00D21C 8001021C 38000002 */  li        r0, 0x2
/* 00D220 80010220 981F0645 */  stb       r0, 0x645(r31)
lbl_80010224:
/* 00D224 80010224 480001B1 */  bl        ProperTimingForGettingNextFrame
/* 00D228 80010228 2C030000 */  cmpwi     r3, 0x0
/* 00D22C 8001022C 4182005C */  beq       lbl_80010288
/* 00D230 80010230 881F0647 */  lbz       r0, 0x647(r31)
/* 00D234 80010234 28000000 */  cmplwi    r0, 0x0
/* 00D238 80010238 41820044 */  beq       lbl_8001027C
/* 00D23C 8001023C 3B9F0690 */  addi      r28, r31, 0x690
/* 00D240 80010240 807F0694 */  lwz       r3, 0x694(r31)
/* 00D244 80010244 801F0690 */  lwz       r0, 0x690(r31)
/* 00D248 80010248 7C030050 */  subf      r0, r3, r0
/* 00D24C 8001024C 2C000001 */  cmpwi     r0, 0x1
/* 00D250 80010250 41810038 */  bgt       lbl_80010288
/* 00D254 80010254 38600000 */  li        r3, 0x0
/* 00D258 80010258 48002F51 */  bl        PopDecodedTextureSet
/* 00D25C 8001025C 809F0678 */  lwz       r4, 0x678(r31)
/* 00D260 80010260 3BA30000 */  addi      r29, r3, 0x0
/* 00D264 80010264 3804FFFF */  subi      r0, r4, 0x1
/* 00D268 80010268 901F0678 */  stw       r0, 0x678(r31)
/* 00D26C 8001026C 807C0000 */  lwz       r3, 0x0(r28)
/* 00D270 80010270 38030001 */  addi      r0, r3, 0x1
/* 00D274 80010274 901C0000 */  stw       r0, 0x0(r28)
/* 00D278 80010278 48000010 */  b         lbl_80010288
lbl_8001027C:
/* 00D27C 8001027C 38600000 */  li        r3, 0x0
/* 00D280 80010280 48002F29 */  bl        PopDecodedTextureSet
/* 00D284 80010284 7C7D1B78 */  mr        r29, r3
lbl_80010288:
/* 00D288 80010288 281D0000 */  cmplwi    r29, 0x0
/* 00D28C 8001028C 41820028 */  beq       lbl_800102B4
/* 00D290 80010290 3C1D0001 */  addis     r0, r29, 0x1
/* 00D294 80010294 2800FFFF */  cmplwi    r0, 0xffff
/* 00D298 80010298 4182001C */  beq       lbl_800102B4
/* 00D29C 8001029C 3B9F0698 */  addi      r28, r31, 0x698
/* 00D2A0 800102A0 807F0698 */  lwz       r3, 0x698(r31)
/* 00D2A4 800102A4 28030000 */  cmplwi    r3, 0x0
/* 00D2A8 800102A8 41820008 */  beq       lbl_800102B0
/* 00D2AC 800102AC 48000319 */  bl        PushUsedTextureSet
lbl_800102B0:
/* 00D2B0 800102B0 93BC0000 */  stw       r29, 0x0(r28)
lbl_800102B4:
/* 00D2B4 800102B4 881F0646 */  lbz       r0, 0x646(r31)
/* 00D2B8 800102B8 540007FF */  clrlwi.   r0, r0, 31
/* 00D2BC 800102BC 4082008C */  bne       lbl_80010348
/* 00D2C0 800102C0 881F0647 */  lbz       r0, 0x647(r31)
/* 00D2C4 800102C4 28000000 */  cmplwi    r0, 0x0
/* 00D2C8 800102C8 41820038 */  beq       lbl_80010300
/* 00D2CC 800102CC 809F0694 */  lwz       r4, 0x694(r31)
/* 00D2D0 800102D0 807F0660 */  lwz       r3, 0x660(r31)
/* 00D2D4 800102D4 801F05F0 */  lwz       r0, 0x5f0(r31)
/* 00D2D8 800102D8 7C641A14 */  add       r3, r4, r3
/* 00D2DC 800102DC 7C030040 */  cmplw     r3, r0
/* 00D2E0 800102E0 40820068 */  bne       lbl_80010348
/* 00D2E4 800102E4 801F069C */  lwz       r0, 0x69c(r31)
/* 00D2E8 800102E8 28000000 */  cmplwi    r0, 0x0
/* 00D2EC 800102EC 4082005C */  bne       lbl_80010348
/* 00D2F0 800102F0 38000003 */  li        r0, 0x3
/* 00D2F4 800102F4 981F0645 */  stb       r0, 0x645(r31)
/* 00D2F8 800102F8 981E0000 */  stb       r0, 0x0(r30)
/* 00D2FC 800102FC 4800004C */  b         lbl_80010348
lbl_80010300:
/* 00D300 80010300 807F0698 */  lwz       r3, 0x698(r31)
/* 00D304 80010304 28030000 */  cmplwi    r3, 0x0
/* 00D308 80010308 41820014 */  beq       lbl_8001031C
/* 00D30C 8001030C 8063000C */  lwz       r3, 0xc(r3)
/* 00D310 80010310 801F0660 */  lwz       r0, 0x660(r31)
/* 00D314 80010314 7C830214 */  add       r4, r3, r0
/* 00D318 80010318 4800000C */  b         lbl_80010324
lbl_8001031C:
/* 00D31C 8001031C 807F0660 */  lwz       r3, 0x660(r31)
/* 00D320 80010320 3883FFFF */  subi      r4, r3, 0x1
lbl_80010324:
/* 00D324 80010324 807F05F0 */  lwz       r3, 0x5f0(r31)
/* 00D328 80010328 3803FFFF */  subi      r0, r3, 0x1
/* 00D32C 8001032C 7C040040 */  cmplw     r4, r0
/* 00D330 80010330 40820018 */  bne       lbl_80010348
/* 00D334 80010334 281D0000 */  cmplwi    r29, 0x0
/* 00D338 80010338 40820010 */  bne       lbl_80010348
/* 00D33C 8001033C 38000003 */  li        r0, 0x3
/* 00D340 80010340 981F0645 */  stb       r0, 0x645(r31)
/* 00D344 80010344 981E0000 */  stb       r0, 0x0(r30)
lbl_80010348:
/* 00D348 80010348 80010024 */  lwz       r0, 0x24(r1)
/* 00D34C 8001034C 83E1001C */  lwz       r31, 0x1c(r1)
/* 00D350 80010350 83C10018 */  lwz       r30, 0x18(r1)
/* 00D354 80010354 7C0803A6 */  mtlr      r0
/* 00D358 80010358 83A10014 */  lwz       r29, 0x14(r1)
/* 00D35C 8001035C 83810010 */  lwz       r28, 0x10(r1)
/* 00D360 80010360 38210020 */  addi      r1, r1, 0x20
/* 00D364 80010364 4E800020 */  blr

glabel ProperTimingForStart
/* 00D368 80010368 7C0802A6 */  mflr      r0
/* 00D36C 8001036C 3C608010 */  lis       r3, D_800FAFE0@ha
/* 00D370 80010370 90010004 */  stw       r0, 0x4(r1)
/* 00D374 80010374 3863AFE0 */  addi      r3, r3, D_800FAFE0@l
/* 00D378 80010378 9421FFF8 */  stwu      r1, -0x8(r1)
/* 00D37C 8001037C 80630088 */  lwz       r3, 0x88(r3)
/* 00D380 80010380 546007FF */  clrlwi.   r0, r3, 31
/* 00D384 80010384 41820018 */  beq       lbl_8001039C
/* 00D388 80010388 48096291 */  bl        VIGetNextField
/* 00D38C 8001038C 28030000 */  cmplwi    r3, 0x0
/* 00D390 80010390 40820030 */  bne       lbl_800103C0
/* 00D394 80010394 38600001 */  li        r3, 0x1
/* 00D398 80010398 4800002C */  b         lbl_800103C4
lbl_8001039C:
/* 00D39C 8001039C 546007BD */  rlwinm.   r0, r3, 0, 30, 30
/* 00D3A0 800103A0 41820018 */  beq       lbl_800103B8
/* 00D3A4 800103A4 48096275 */  bl        VIGetNextField
/* 00D3A8 800103A8 28030001 */  cmplwi    r3, 0x1
/* 00D3AC 800103AC 40820014 */  bne       lbl_800103C0
/* 00D3B0 800103B0 38600001 */  li        r3, 0x1
/* 00D3B4 800103B4 48000010 */  b         lbl_800103C4
lbl_800103B8:
/* 00D3B8 800103B8 38600001 */  li        r3, 0x1
/* 00D3BC 800103BC 48000008 */  b         lbl_800103C4
lbl_800103C0:
/* 00D3C0 800103C0 38600000 */  li        r3, 0x0
lbl_800103C4:
/* 00D3C4 800103C4 8001000C */  lwz       r0, 0xc(r1)
/* 00D3C8 800103C8 38210008 */  addi      r1, r1, 0x8
/* 00D3CC 800103CC 7C0803A6 */  mtlr      r0
/* 00D3D0 800103D0 4E800020 */  blr

glabel ProperTimingForGettingNextFrame
/* 00D3D4 800103D4 7C0802A6 */  mflr      r0
/* 00D3D8 800103D8 3C608010 */  lis       r3, D_800FAA40@ha
/* 00D3DC 800103DC 90010004 */  stw       r0, 0x4(r1)
/* 00D3E0 800103E0 9421FFE8 */  stwu      r1, -0x18(r1)
/* 00D3E4 800103E4 93E10014 */  stw       r31, 0x14(r1)
/* 00D3E8 800103E8 3BE3AA40 */  addi      r31, r3, D_800FAA40@l
/* 00D3EC 800103EC 93C10010 */  stw       r30, 0x10(r1)
/* 00D3F0 800103F0 807F0628 */  lwz       r3, 0x628(r31)
/* 00D3F4 800103F4 546007FF */  clrlwi.   r0, r3, 31
/* 00D3F8 800103F8 41820018 */  beq       lbl_80010410
/* 00D3FC 800103FC 4809621D */  bl        VIGetNextField
/* 00D400 80010400 28030000 */  cmplwi    r3, 0x0
/* 00D404 80010404 408200D8 */  bne       lbl_800104DC
/* 00D408 80010408 38600001 */  li        r3, 0x1
/* 00D40C 8001040C 480000D4 */  b         lbl_800104E0
lbl_80010410:
/* 00D410 80010410 546007BD */  rlwinm.   r0, r3, 0, 30, 30
/* 00D414 80010414 41820018 */  beq       lbl_8001042C
/* 00D418 80010418 48096201 */  bl        VIGetNextField
/* 00D41C 8001041C 28030001 */  cmplwi    r3, 0x1
/* 00D420 80010420 408200BC */  bne       lbl_800104DC
/* 00D424 80010424 38600001 */  li        r3, 0x1
/* 00D428 80010428 480000B8 */  b         lbl_800104E0
lbl_8001042C:
/* 00D42C 8001042C C0228074 */  lfs       f1, D_8018BFB4@sda21(r0)
/* 00D430 80010430 C01F05EC */  lfs       f0, 0x5ec(r31)
/* 00D434 80010434 EC010032 */  fmuls     f0, f1, f0
/* 00D438 80010438 FC00001E */  fctiwz    f0, f0
/* 00D43C 8001043C D8010008 */  stfd      f0, 0x8(r1)
/* 00D440 80010440 83C1000C */  lwz       r30, 0xc(r1)
/* 00D444 80010444 48096315 */  bl        VIGetTvFormat
/* 00D448 80010448 28030001 */  cmplwi    r3, 0x1
/* 00D44C 8001044C 4082003C */  bne       lbl_80010488
/* 00D450 80010450 80DF066C */  lwz       r6, 0x66c(r31)
/* 00D454 80010454 7FC4FE70 */  srawi     r4, r30, 31
/* 00D458 80010458 807F0668 */  lwz       r3, 0x668(r31)
/* 00D45C 8001045C 38A00000 */  li        r5, 0x0
/* 00D460 80010460 7C06F016 */  mulhwu    r0, r6, r30
/* 00D464 80010464 7C63F1D6 */  mullw     r3, r3, r30
/* 00D468 80010468 7C630214 */  add       r3, r3, r0
/* 00D46C 8001046C 7C0621D6 */  mullw     r0, r6, r4
/* 00D470 80010470 7C86F1D6 */  mullw     r4, r6, r30
/* 00D474 80010474 7C630214 */  add       r3, r3, r0
/* 00D478 80010478 38C01388 */  li        r6, 0x1388
/* 00D47C 8001047C 480BC179 */  bl        __div2i
/* 00D480 80010480 909F0674 */  stw       r4, 0x674(r31)
/* 00D484 80010484 48000038 */  b         lbl_800104BC
lbl_80010488:
/* 00D488 80010488 80DF066C */  lwz       r6, 0x66c(r31)
/* 00D48C 8001048C 7FC4FE70 */  srawi     r4, r30, 31
/* 00D490 80010490 807F0668 */  lwz       r3, 0x668(r31)
/* 00D494 80010494 38A00000 */  li        r5, 0x0
/* 00D498 80010498 7C06F016 */  mulhwu    r0, r6, r30
/* 00D49C 8001049C 7C63F1D6 */  mullw     r3, r3, r30
/* 00D4A0 800104A0 7C630214 */  add       r3, r3, r0
/* 00D4A4 800104A4 7C0621D6 */  mullw     r0, r6, r4
/* 00D4A8 800104A8 7C86F1D6 */  mullw     r4, r6, r30
/* 00D4AC 800104AC 7C630214 */  add       r3, r3, r0
/* 00D4B0 800104B0 38C0176A */  li        r6, 0x176a
/* 00D4B4 800104B4 480BC141 */  bl        __div2i
/* 00D4B8 800104B8 909F0674 */  stw       r4, 0x674(r31)
lbl_800104BC:
/* 00D4BC 800104BC 389F0670 */  addi      r4, r31, 0x670
/* 00D4C0 800104C0 807F0674 */  lwz       r3, 0x674(r31)
/* 00D4C4 800104C4 801F0670 */  lwz       r0, 0x670(r31)
/* 00D4C8 800104C8 7C001800 */  cmpw      r0, r3
/* 00D4CC 800104CC 41820010 */  beq       lbl_800104DC
/* 00D4D0 800104D0 90640000 */  stw       r3, 0x0(r4)
/* 00D4D4 800104D4 38600001 */  li        r3, 0x1
/* 00D4D8 800104D8 48000008 */  b         lbl_800104E0
lbl_800104DC:
/* 00D4DC 800104DC 38600000 */  li        r3, 0x0
lbl_800104E0:
/* 00D4E0 800104E0 8001001C */  lwz       r0, 0x1c(r1)
/* 00D4E4 800104E4 83E10014 */  lwz       r31, 0x14(r1)
/* 00D4E8 800104E8 83C10010 */  lwz       r30, 0x10(r1)
/* 00D4EC 800104EC 7C0803A6 */  mtlr      r0
/* 00D4F0 800104F0 38210018 */  addi      r1, r1, 0x18
/* 00D4F4 800104F4 4E800020 */  blr

glabel THPPlayerDrawCurrentFrame
/* 00D4F8 800104F8 7C0802A6 */  mflr      r0
/* 00D4FC 800104FC 3D008010 */  lis       r8, D_800FAA40@ha
/* 00D500 80010500 90010004 */  stw       r0, 0x4(r1)
/* 00D504 80010504 9421FFC0 */  stwu      r1, -0x40(r1)
/* 00D508 80010508 BF410028 */  stmw      r26, 0x28(r1)
/* 00D50C 8001050C 3BE8AA40 */  addi      r31, r8, D_800FAA40@l
/* 00D510 80010510 3B440000 */  addi      r26, r4, 0x0
/* 00D514 80010514 3B650000 */  addi      r27, r5, 0x0
/* 00D518 80010518 3B860000 */  addi      r28, r6, 0x0
/* 00D51C 8001051C 3BA70000 */  addi      r29, r7, 0x0
/* 00D520 80010520 801F0640 */  lwz       r0, 0x640(r31)
/* 00D524 80010524 2C000000 */  cmpwi     r0, 0x0
/* 00D528 80010528 41820084 */  beq       lbl_800105AC
/* 00D52C 8001052C 881F0644 */  lbz       r0, 0x644(r31)
/* 00D530 80010530 28000000 */  cmplwi    r0, 0x0
/* 00D534 80010534 41820078 */  beq       lbl_800105AC
/* 00D538 80010538 3BDF0698 */  addi      r30, r31, 0x698
/* 00D53C 8001053C 801F0698 */  lwz       r0, 0x698(r31)
/* 00D540 80010540 28000000 */  cmplwi    r0, 0x0
/* 00D544 80010544 41820068 */  beq       lbl_800105AC
/* 00D548 80010548 48000AE5 */  bl        THPGXYuv2RgbSetup
/* 00D54C 8001054C 80BE0000 */  lwz       r5, 0x0(r30)
/* 00D550 80010550 7FA00734 */  extsh     r0, r29
/* 00D554 80010554 7F460734 */  extsh     r6, r26
/* 00D558 80010558 90010008 */  stw       r0, 0x8(r1)
/* 00D55C 8001055C 7F670734 */  extsh     r7, r27
/* 00D560 80010560 7F8A0734 */  extsh     r10, r28
/* 00D564 80010564 809F0620 */  lwz       r4, 0x620(r31)
/* 00D568 80010568 801F0624 */  lwz       r0, 0x624(r31)
/* 00D56C 8001056C 80650000 */  lwz       r3, 0x0(r5)
/* 00D570 80010570 7C880734 */  extsh     r8, r4
/* 00D574 80010574 80850004 */  lwz       r4, 0x4(r5)
/* 00D578 80010578 7C090734 */  extsh     r9, r0
/* 00D57C 8001057C 80A50008 */  lwz       r5, 0x8(r5)
/* 00D580 80010580 48000FB1 */  bl        THPGXYuv2RgbDraw
/* 00D584 80010584 48000991 */  bl        THPGXRestore
/* 00D588 80010588 807E0000 */  lwz       r3, 0x0(r30)
/* 00D58C 8001058C 801F0660 */  lwz       r0, 0x660(r31)
/* 00D590 80010590 8083000C */  lwz       r4, 0xc(r3)
/* 00D594 80010594 807F05F0 */  lwz       r3, 0x5f0(r31)
/* 00D598 80010598 7C840214 */  add       r4, r4, r0
/* 00D59C 8001059C 7C041B96 */  divwu     r0, r4, r3
/* 00D5A0 800105A0 7C0019D6 */  mullw     r0, r0, r3
/* 00D5A4 800105A4 7C602050 */  subf      r3, r0, r4
/* 00D5A8 800105A8 48000008 */  b         lbl_800105B0
lbl_800105AC:
/* 00D5AC 800105AC 3860FFFF */  li        r3, -0x1
lbl_800105B0:
/* 00D5B0 800105B0 BB410028 */  lmw       r26, 0x28(r1)
/* 00D5B4 800105B4 80010044 */  lwz       r0, 0x44(r1)
/* 00D5B8 800105B8 38210040 */  addi      r1, r1, 0x40
/* 00D5BC 800105BC 7C0803A6 */  mtlr      r0
/* 00D5C0 800105C0 4E800020 */  blr

glabel PushUsedTextureSet
/* 00D5C4 800105C4 7C0802A6 */  mflr      r0
/* 00D5C8 800105C8 3CA08010 */  lis       r5, D_800FAAA0@ha
/* 00D5CC 800105CC 90010004 */  stw       r0, 0x4(r1)
/* 00D5D0 800105D0 38830000 */  addi      r4, r3, 0x0
/* 00D5D4 800105D4 3865AAA0 */  addi      r3, r5, D_800FAAA0@l
/* 00D5D8 800105D8 9421FFF8 */  stwu      r1, -0x8(r1)
/* 00D5DC 800105DC 38A00000 */  li        r5, 0x0
/* 00D5E0 800105E0 4808E54D */  bl        OSSendMessage
/* 00D5E4 800105E4 8001000C */  lwz       r0, 0xc(r1)
/* 00D5E8 800105E8 38210008 */  addi      r1, r1, 0x8
/* 00D5EC 800105EC 7C0803A6 */  mtlr      r0
/* 00D5F0 800105F0 4E800020 */  blr

glabel THPPlayerDrawDone
/* 00D5F4 800105F4 7C0802A6 */  mflr      r0
/* 00D5F8 800105F8 90010004 */  stw       r0, 0x4(r1)
/* 00D5FC 800105FC 9421FFE8 */  stwu      r1, -0x18(r1)
/* 00D600 80010600 93E10014 */  stw       r31, 0x14(r1)
/* 00D604 80010604 800D8928 */  lwz       r0, D_8018B8A8@sda21(r0)
/* 00D608 80010608 2C000000 */  cmpwi     r0, 0x0
/* 00D60C 8001060C 41820044 */  beq       lbl_80010650
/* 00D610 80010610 3C608010 */  lis       r3, D_800FAAA0@ha
/* 00D614 80010614 3BE3AAA0 */  addi      r31, r3, D_800FAAA0@l
lbl_80010618:
/* 00D618 80010618 387F0000 */  addi      r3, r31, 0x0
/* 00D61C 8001061C 38810008 */  addi      r4, r1, 0x8
/* 00D620 80010620 38A00000 */  li        r5, 0x0
/* 00D624 80010624 4808E5D1 */  bl        OSReceiveMessage
/* 00D628 80010628 2C030001 */  cmpwi     r3, 0x1
/* 00D62C 8001062C 4082000C */  bne       lbl_80010638
/* 00D630 80010630 80010008 */  lwz       r0, 0x8(r1)
/* 00D634 80010634 48000008 */  b         lbl_8001063C
lbl_80010638:
/* 00D638 80010638 38000000 */  li        r0, 0x0
lbl_8001063C:
/* 00D63C 8001063C 28000000 */  cmplwi    r0, 0x0
/* 00D640 80010640 7C030378 */  mr        r3, r0
/* 00D644 80010644 4182000C */  beq       lbl_80010650
/* 00D648 80010648 48002B31 */  bl        PushFreeTextureSet
/* 00D64C 8001064C 4BFFFFCC */  b         lbl_80010618
lbl_80010650:
/* 00D650 80010650 8001001C */  lwz       r0, 0x1c(r1)
/* 00D654 80010654 83E10014 */  lwz       r31, 0x14(r1)
/* 00D658 80010658 38210018 */  addi      r1, r1, 0x18
/* 00D65C 8001065C 7C0803A6 */  mtlr      r0
/* 00D660 80010660 4E800020 */  blr

glabel THPAudioMixCallback
/* 00D664 80010664 7C0802A6 */  mflr      r0
/* 00D668 80010668 3C608010 */  lis       r3, D_800FAA40@ha
/* 00D66C 8001066C 90010004 */  stw       r0, 0x4(r1)
/* 00D670 80010670 9421FFF0 */  stwu      r1, -0x10(r1)
/* 00D674 80010674 93E1000C */  stw       r31, 0xc(r1)
/* 00D678 80010678 3BE3AA40 */  addi      r31, r3, D_800FAA40@l
/* 00D67C 8001067C 93C10008 */  stw       r30, 0x8(r1)
/* 00D680 80010680 800D8944 */  lwz       r0, D_8018B8C4@sda21(r0)
/* 00D684 80010684 2C000000 */  cmpwi     r0, 0x0
/* 00D688 80010688 40820070 */  bne       lbl_800106F8
/* 00D68C 8001068C 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D690 80010690 38800280 */  li        r4, 0x280
/* 00D694 80010694 68000001 */  xori      r0, r0, 0x1
/* 00D698 80010698 900D8934 */  stw       r0, D_8018B8B4@sda21(r0)
/* 00D69C 8001069C 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D6A0 800106A0 1C000280 */  mulli     r0, r0, 0x280
/* 00D6A4 800106A4 7C7F0214 */  add       r3, r31, r0
/* 00D6A8 800106A8 386300A0 */  addi      r3, r3, 0xa0
/* 00D6AC 800106AC 480A6671 */  bl        AIInitDMA
/* 00D6B0 800106B0 4808DBAD */  bl        OSEnableInterrupts
/* 00D6B4 800106B4 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D6B8 800106B8 3BC30000 */  addi      r30, r3, 0x0
/* 00D6BC 800106BC 38800000 */  li        r4, 0x0
/* 00D6C0 800106C0 1C000280 */  mulli     r0, r0, 0x280
/* 00D6C4 800106C4 7C7F0214 */  add       r3, r31, r0
/* 00D6C8 800106C8 38A000A0 */  li        r5, 0xa0
/* 00D6CC 800106CC 386300A0 */  addi      r3, r3, 0xa0
/* 00D6D0 800106D0 4800010D */  bl        MixAudio
/* 00D6D4 800106D4 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D6D8 800106D8 38800280 */  li        r4, 0x280
/* 00D6DC 800106DC 1C000280 */  mulli     r0, r0, 0x280
/* 00D6E0 800106E0 7C7F0214 */  add       r3, r31, r0
/* 00D6E4 800106E4 386300A0 */  addi      r3, r3, 0xa0
/* 00D6E8 800106E8 4808C5DD */  bl        DCFlushRange
/* 00D6EC 800106EC 7FC3F378 */  mr        r3, r30
/* 00D6F0 800106F0 4808DB81 */  bl        OSRestoreInterrupts
/* 00D6F4 800106F4 480000D0 */  b         lbl_800107C4
lbl_800106F8:
/* 00D6F8 800106F8 2C000001 */  cmpwi     r0, 0x1
/* 00D6FC 800106FC 40820030 */  bne       lbl_8001072C
/* 00D700 80010700 800D893C */  lwz       r0, D_8018B8BC@sda21(r0)
/* 00D704 80010704 28000000 */  cmplwi    r0, 0x0
/* 00D708 80010708 41820008 */  beq       lbl_80010710
/* 00D70C 8001070C 900D8940 */  stw       r0, D_8018B8C0@sda21(r0)
lbl_80010710:
/* 00D710 80010710 818D8938 */  lwz       r12, D_8018B8B8@sda21(r0)
/* 00D714 80010714 7D8803A6 */  mtlr      r12
/* 00D718 80010718 4E800021 */  blrl
/* 00D71C 8001071C 480A66D9 */  bl        AIGetDMAStartAddr
/* 00D720 80010720 3C038000 */  addis     r0, r3, 0x8000
/* 00D724 80010724 900D893C */  stw       r0, D_8018B8BC@sda21(r0)
/* 00D728 80010728 4800001C */  b         lbl_80010744
lbl_8001072C:
/* 00D72C 8001072C 818D8938 */  lwz       r12, D_8018B8B8@sda21(r0)
/* 00D730 80010730 7D8803A6 */  mtlr      r12
/* 00D734 80010734 4E800021 */  blrl
/* 00D738 80010738 480A66BD */  bl        AIGetDMAStartAddr
/* 00D73C 8001073C 3C038000 */  addis     r0, r3, 0x8000
/* 00D740 80010740 900D8940 */  stw       r0, D_8018B8C0@sda21(r0)
lbl_80010744:
/* 00D744 80010744 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D748 80010748 38800280 */  li        r4, 0x280
/* 00D74C 8001074C 68000001 */  xori      r0, r0, 0x1
/* 00D750 80010750 900D8934 */  stw       r0, D_8018B8B4@sda21(r0)
/* 00D754 80010754 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D758 80010758 1C000280 */  mulli     r0, r0, 0x280
/* 00D75C 8001075C 7C7F0214 */  add       r3, r31, r0
/* 00D760 80010760 386300A0 */  addi      r3, r3, 0xa0
/* 00D764 80010764 480A65B9 */  bl        AIInitDMA
/* 00D768 80010768 4808DAF5 */  bl        OSEnableInterrupts
/* 00D76C 8001076C 800D8940 */  lwz       r0, D_8018B8C0@sda21(r0)
/* 00D770 80010770 3BC30000 */  addi      r30, r3, 0x0
/* 00D774 80010774 28000000 */  cmplwi    r0, 0x0
/* 00D778 80010778 41820010 */  beq       lbl_80010788
/* 00D77C 8001077C 7C030378 */  mr        r3, r0
/* 00D780 80010780 38800280 */  li        r4, 0x280
/* 00D784 80010784 4808C515 */  bl        DCInvalidateRange
lbl_80010788:
/* 00D788 80010788 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D78C 8001078C 38A000A0 */  li        r5, 0xa0
/* 00D790 80010790 808D8940 */  lwz       r4, D_8018B8C0@sda21(r0)
/* 00D794 80010794 1C000280 */  mulli     r0, r0, 0x280
/* 00D798 80010798 7C7F0214 */  add       r3, r31, r0
/* 00D79C 8001079C 386300A0 */  addi      r3, r3, 0xa0
/* 00D7A0 800107A0 4800003D */  bl        MixAudio
/* 00D7A4 800107A4 800D8934 */  lwz       r0, D_8018B8B4@sda21(r0)
/* 00D7A8 800107A8 38800280 */  li        r4, 0x280
/* 00D7AC 800107AC 1C000280 */  mulli     r0, r0, 0x280
/* 00D7B0 800107B0 7C7F0214 */  add       r3, r31, r0
/* 00D7B4 800107B4 386300A0 */  addi      r3, r3, 0xa0
/* 00D7B8 800107B8 4808C50D */  bl        DCFlushRange
/* 00D7BC 800107BC 7FC3F378 */  mr        r3, r30
/* 00D7C0 800107C0 4808DAB1 */  bl        OSRestoreInterrupts
lbl_800107C4:
/* 00D7C4 800107C4 80010014 */  lwz       r0, 0x14(r1)
/* 00D7C8 800107C8 83E1000C */  lwz       r31, 0xc(r1)
/* 00D7CC 800107CC 83C10008 */  lwz       r30, 0x8(r1)
/* 00D7D0 800107D0 7C0803A6 */  mtlr      r0
/* 00D7D4 800107D4 38210010 */  addi      r1, r1, 0x10
/* 00D7D8 800107D8 4E800020 */  blr

glabel MixAudio
/* 00D7DC 800107DC 7C0802A6 */  mflr      r0
/* 00D7E0 800107E0 28040000 */  cmplwi    r4, 0x0
/* 00D7E4 800107E4 90010004 */  stw       r0, 0x4(r1)
/* 00D7E8 800107E8 3CC08010 */  lis       r6, D_800FAA40@ha
/* 00D7EC 800107EC 9421FFC0 */  stwu      r1, -0x40(r1)
/* 00D7F0 800107F0 BF210024 */  stmw      r25, 0x24(r1)
/* 00D7F4 800107F4 3BC6AA40 */  addi      r30, r6, D_800FAA40@l
/* 00D7F8 800107F8 418201C4 */  beq       lbl_800109BC
/* 00D7FC 800107FC 801E0640 */  lwz       r0, 0x640(r30)
/* 00D800 80010800 2C000000 */  cmpwi     r0, 0x0
/* 00D804 80010804 418201AC */  beq       lbl_800109B0
/* 00D808 80010808 881E0645 */  lbz       r0, 0x645(r30)
/* 00D80C 8001080C 28000002 */  cmplwi    r0, 0x2
/* 00D810 80010810 408201A0 */  bne       lbl_800109B0
/* 00D814 80010814 881E0647 */  lbz       r0, 0x647(r30)
/* 00D818 80010818 28000000 */  cmplwi    r0, 0x0
/* 00D81C 8001081C 41820194 */  beq       lbl_800109B0
/* 00D820 80010820 3CC0800F */  lis       r6, D_800EB6A0@ha
/* 00D824 80010824 3B450000 */  addi      r26, r5, 0x0
/* 00D828 80010828 3B630000 */  addi      r27, r3, 0x0
/* 00D82C 8001082C 3B240000 */  addi      r25, r4, 0x0
/* 00D830 80010830 3B9E0688 */  addi      r28, r30, 0x688
/* 00D834 80010834 3BE6B6A0 */  addi      r31, r6, D_800EB6A0@l
/* 00D838 80010838 3BBE069C */  addi      r29, r30, 0x69c
lbl_8001083C:
/* 00D83C 8001083C 801D0000 */  lwz       r0, 0x0(r29)
/* 00D840 80010840 28000000 */  cmplwi    r0, 0x0
/* 00D844 80010844 40820038 */  bne       lbl_8001087C
/* 00D848 80010848 38600000 */  li        r3, 0x0
/* 00D84C 8001084C 48000655 */  bl        PopDecodedAudioBuffer
/* 00D850 80010850 28030000 */  cmplwi    r3, 0x0
/* 00D854 80010854 907D0000 */  stw       r3, 0x0(r29)
/* 00D858 80010858 40820018 */  bne       lbl_80010870
/* 00D85C 8001085C 387B0000 */  addi      r3, r27, 0x0
/* 00D860 80010860 38990000 */  addi      r4, r25, 0x0
/* 00D864 80010864 5745103A */  slwi      r5, r26, 2
/* 00D868 80010868 4BFF4BAD */  bl        memcpy
/* 00D86C 8001086C 480002F8 */  b         lbl_80010B64
lbl_80010870:
/* 00D870 80010870 807E0694 */  lwz       r3, 0x694(r30)
/* 00D874 80010874 38030001 */  addi      r0, r3, 0x1
/* 00D878 80010878 901E0694 */  stw       r0, 0x694(r30)
lbl_8001087C:
/* 00D87C 8001087C 807D0000 */  lwz       r3, 0x0(r29)
/* 00D880 80010880 80030008 */  lwz       r0, 0x8(r3)
/* 00D884 80010884 28000000 */  cmplwi    r0, 0x0
/* 00D888 80010888 4182FFB4 */  beq       lbl_8001083C
/* 00D88C 8001088C 7C00D040 */  cmplw     r0, r26
/* 00D890 80010890 41800008 */  blt       lbl_80010898
/* 00D894 80010894 7F40D378 */  mr        r0, r26
lbl_80010898:
/* 00D898 80010898 28000000 */  cmplwi    r0, 0x0
/* 00D89C 8001089C 7C0903A6 */  mtctr     r0
/* 00D8A0 800108A0 80630004 */  lwz       r3, 0x4(r3)
/* 00D8A4 800108A4 408100C8 */  ble       lbl_8001096C
lbl_800108A8:
/* 00D8A8 800108A8 809C0000 */  lwz       r4, 0x0(r28)
/* 00D8AC 800108AC 2C040000 */  cmpwi     r4, 0x0
/* 00D8B0 800108B0 41820020 */  beq       lbl_800108D0
/* 00D8B4 800108B4 3884FFFF */  subi      r4, r4, 0x1
/* 00D8B8 800108B8 909C0000 */  stw       r4, 0x0(r28)
/* 00D8BC 800108BC C03E067C */  lfs       f1, 0x67c(r30)
/* 00D8C0 800108C0 C01E0684 */  lfs       f0, 0x684(r30)
/* 00D8C4 800108C4 EC01002A */  fadds     f0, f1, f0
/* 00D8C8 800108C8 D01E067C */  stfs      f0, 0x67c(r30)
/* 00D8CC 800108CC 4800000C */  b         lbl_800108D8
lbl_800108D0:
/* 00D8D0 800108D0 C01E0680 */  lfs       f0, 0x680(r30)
/* 00D8D4 800108D4 D01E067C */  stfs      f0, 0x67c(r30)
lbl_800108D8:
/* 00D8D8 800108D8 C01E067C */  lfs       f0, 0x67c(r30)
/* 00D8DC 800108DC A8830000 */  lha       r4, 0x0(r3)
/* 00D8E0 800108E0 FC00001E */  fctiwz    f0, f0
/* 00D8E4 800108E4 A8B90000 */  lha       r5, 0x0(r25)
/* 00D8E8 800108E8 D8010018 */  stfd      f0, 0x18(r1)
/* 00D8EC 800108EC 80C1001C */  lwz       r6, 0x1c(r1)
/* 00D8F0 800108F0 54C6083C */  slwi      r6, r6, 1
/* 00D8F4 800108F4 7CDF3214 */  add       r6, r31, r6
/* 00D8F8 800108F8 A0C60000 */  lhz       r6, 0x0(r6)
/* 00D8FC 800108FC 7C8621D6 */  mullw     r4, r6, r4
/* 00D900 80010900 7C847E70 */  srawi     r4, r4, 15
/* 00D904 80010904 7C852214 */  add       r4, r5, r4
/* 00D908 80010908 2C048000 */  cmpwi     r4, -0x8000
/* 00D90C 8001090C 40800008 */  bge       lbl_80010914
/* 00D910 80010910 38808000 */  li        r4, -0x8000
lbl_80010914:
/* 00D914 80010914 2C047FFF */  cmpwi     r4, 0x7fff
/* 00D918 80010918 40810008 */  ble       lbl_80010920
/* 00D91C 8001091C 38807FFF */  li        r4, 0x7fff
lbl_80010920:
/* 00D920 80010920 7C840734 */  extsh     r4, r4
/* 00D924 80010924 B09B0000 */  sth       r4, 0x0(r27)
/* 00D928 80010928 A8830002 */  lha       r4, 0x2(r3)
/* 00D92C 8001092C A8B90002 */  lha       r5, 0x2(r25)
/* 00D930 80010930 7C8621D6 */  mullw     r4, r6, r4
/* 00D934 80010934 7C847E70 */  srawi     r4, r4, 15
/* 00D938 80010938 7C852214 */  add       r4, r5, r4
/* 00D93C 8001093C 2C048000 */  cmpwi     r4, -0x8000
/* 00D940 80010940 40800008 */  bge       lbl_80010948
/* 00D944 80010944 38808000 */  li        r4, -0x8000
lbl_80010948:
/* 00D948 80010948 2C047FFF */  cmpwi     r4, 0x7fff
/* 00D94C 8001094C 40810008 */  ble       lbl_80010954
/* 00D950 80010950 38807FFF */  li        r4, 0x7fff
lbl_80010954:
/* 00D954 80010954 7C840734 */  extsh     r4, r4
/* 00D958 80010958 B09B0002 */  sth       r4, 0x2(r27)
/* 00D95C 8001095C 3B7B0004 */  addi      r27, r27, 0x4
/* 00D960 80010960 3B390004 */  addi      r25, r25, 0x4
/* 00D964 80010964 38630004 */  addi      r3, r3, 0x4
/* 00D968 80010968 4200FF40 */  bdnz      lbl_800108A8
lbl_8001096C:
/* 00D96C 8001096C 80BD0000 */  lwz       r5, 0x0(r29)
/* 00D970 80010970 7F40D050 */  subf      r26, r0, r26
/* 00D974 80010974 80850008 */  lwz       r4, 0x8(r5)
/* 00D978 80010978 7C002050 */  subf      r0, r0, r4
/* 00D97C 8001097C 90050008 */  stw       r0, 0x8(r5)
/* 00D980 80010980 809D0000 */  lwz       r4, 0x0(r29)
/* 00D984 80010984 90640004 */  stw       r3, 0x4(r4)
/* 00D988 80010988 807D0000 */  lwz       r3, 0x0(r29)
/* 00D98C 8001098C 80030008 */  lwz       r0, 0x8(r3)
/* 00D990 80010990 28000000 */  cmplwi    r0, 0x0
/* 00D994 80010994 40820010 */  bne       lbl_800109A4
/* 00D998 80010998 480004D9 */  bl        PushFreeAudioBuffer
/* 00D99C 8001099C 38000000 */  li        r0, 0x0
/* 00D9A0 800109A0 901D0000 */  stw       r0, 0x0(r29)
lbl_800109A4:
/* 00D9A4 800109A4 281A0000 */  cmplwi    r26, 0x0
/* 00D9A8 800109A8 418201BC */  beq       lbl_80010B64
/* 00D9AC 800109AC 4BFFFE90 */  b         lbl_8001083C
lbl_800109B0:
/* 00D9B0 800109B0 54A5103A */  slwi      r5, r5, 2
/* 00D9B4 800109B4 4BFF4A61 */  bl        memcpy
/* 00D9B8 800109B8 480001AC */  b         lbl_80010B64
lbl_800109BC:
/* 00D9BC 800109BC 801E0640 */  lwz       r0, 0x640(r30)
/* 00D9C0 800109C0 2C000000 */  cmpwi     r0, 0x0
/* 00D9C4 800109C4 41820194 */  beq       lbl_80010B58
/* 00D9C8 800109C8 881E0645 */  lbz       r0, 0x645(r30)
/* 00D9CC 800109CC 28000002 */  cmplwi    r0, 0x2
/* 00D9D0 800109D0 40820188 */  bne       lbl_80010B58
/* 00D9D4 800109D4 881E0647 */  lbz       r0, 0x647(r30)
/* 00D9D8 800109D8 28000000 */  cmplwi    r0, 0x0
/* 00D9DC 800109DC 4182017C */  beq       lbl_80010B58
/* 00D9E0 800109E0 3C80800F */  lis       r4, D_800EB6A0@ha
/* 00D9E4 800109E4 3B650000 */  addi      r27, r5, 0x0
/* 00D9E8 800109E8 3B430000 */  addi      r26, r3, 0x0
/* 00D9EC 800109EC 3BBE0688 */  addi      r29, r30, 0x688
/* 00D9F0 800109F0 3BE4B6A0 */  addi      r31, r4, D_800EB6A0@l
/* 00D9F4 800109F4 3B9E069C */  addi      r28, r30, 0x69c
lbl_800109F8:
/* 00D9F8 800109F8 801C0000 */  lwz       r0, 0x0(r28)
/* 00D9FC 800109FC 28000000 */  cmplwi    r0, 0x0
/* 00DA00 80010A00 40820038 */  bne       lbl_80010A38
/* 00DA04 80010A04 38600000 */  li        r3, 0x0
/* 00DA08 80010A08 48000499 */  bl        PopDecodedAudioBuffer
/* 00DA0C 80010A0C 28030000 */  cmplwi    r3, 0x0
/* 00DA10 80010A10 907C0000 */  stw       r3, 0x0(r28)
/* 00DA14 80010A14 40820018 */  bne       lbl_80010A2C
/* 00DA18 80010A18 387A0000 */  addi      r3, r26, 0x0
/* 00DA1C 80010A1C 5765103A */  slwi      r5, r27, 2
/* 00DA20 80010A20 38800000 */  li        r4, 0x0
/* 00DA24 80010A24 4BFF48FD */  bl        memset
/* 00DA28 80010A28 4800013C */  b         lbl_80010B64
lbl_80010A2C:
/* 00DA2C 80010A2C 807E0694 */  lwz       r3, 0x694(r30)
/* 00DA30 80010A30 38030001 */  addi      r0, r3, 0x1
/* 00DA34 80010A34 901E0694 */  stw       r0, 0x694(r30)
lbl_80010A38:
/* 00DA38 80010A38 807C0000 */  lwz       r3, 0x0(r28)
/* 00DA3C 80010A3C 80830008 */  lwz       r4, 0x8(r3)
/* 00DA40 80010A40 28040000 */  cmplwi    r4, 0x0
/* 00DA44 80010A44 4182FFB4 */  beq       lbl_800109F8
/* 00DA48 80010A48 7C04D840 */  cmplw     r4, r27
/* 00DA4C 80010A4C 41800008 */  blt       lbl_80010A54
/* 00DA50 80010A50 7F64DB78 */  mr        r4, r27
lbl_80010A54:
/* 00DA54 80010A54 28040000 */  cmplwi    r4, 0x0
/* 00DA58 80010A58 7C8903A6 */  mtctr     r4
/* 00DA5C 80010A5C 80A30004 */  lwz       r5, 0x4(r3)
/* 00DA60 80010A60 408100B4 */  ble       lbl_80010B14
lbl_80010A64:
/* 00DA64 80010A64 807D0000 */  lwz       r3, 0x0(r29)
/* 00DA68 80010A68 2C030000 */  cmpwi     r3, 0x0
/* 00DA6C 80010A6C 41820020 */  beq       lbl_80010A8C
/* 00DA70 80010A70 3803FFFF */  subi      r0, r3, 0x1
/* 00DA74 80010A74 901D0000 */  stw       r0, 0x0(r29)
/* 00DA78 80010A78 C03E067C */  lfs       f1, 0x67c(r30)
/* 00DA7C 80010A7C C01E0684 */  lfs       f0, 0x684(r30)
/* 00DA80 80010A80 EC01002A */  fadds     f0, f1, f0
/* 00DA84 80010A84 D01E067C */  stfs      f0, 0x67c(r30)
/* 00DA88 80010A88 4800000C */  b         lbl_80010A94
lbl_80010A8C:
/* 00DA8C 80010A8C C01E0680 */  lfs       f0, 0x680(r30)
/* 00DA90 80010A90 D01E067C */  stfs      f0, 0x67c(r30)
lbl_80010A94:
/* 00DA94 80010A94 C01E067C */  lfs       f0, 0x67c(r30)
/* 00DA98 80010A98 A8050000 */  lha       r0, 0x0(r5)
/* 00DA9C 80010A9C FC00001E */  fctiwz    f0, f0
/* 00DAA0 80010AA0 D8010018 */  stfd      f0, 0x18(r1)
/* 00DAA4 80010AA4 8061001C */  lwz       r3, 0x1c(r1)
/* 00DAA8 80010AA8 5463083C */  slwi      r3, r3, 1
/* 00DAAC 80010AAC 7C7F1A14 */  add       r3, r31, r3
/* 00DAB0 80010AB0 A0630000 */  lhz       r3, 0x0(r3)
/* 00DAB4 80010AB4 7C0301D6 */  mullw     r0, r3, r0
/* 00DAB8 80010AB8 7C007E70 */  srawi     r0, r0, 15
/* 00DABC 80010ABC 2C008000 */  cmpwi     r0, -0x8000
/* 00DAC0 80010AC0 40800008 */  bge       lbl_80010AC8
/* 00DAC4 80010AC4 38008000 */  li        r0, -0x8000
lbl_80010AC8:
/* 00DAC8 80010AC8 2C007FFF */  cmpwi     r0, 0x7fff
/* 00DACC 80010ACC 40810008 */  ble       lbl_80010AD4
/* 00DAD0 80010AD0 38007FFF */  li        r0, 0x7fff
lbl_80010AD4:
/* 00DAD4 80010AD4 7C000734 */  extsh     r0, r0
/* 00DAD8 80010AD8 B01A0000 */  sth       r0, 0x0(r26)
/* 00DADC 80010ADC A8050002 */  lha       r0, 0x2(r5)
/* 00DAE0 80010AE0 7C0301D6 */  mullw     r0, r3, r0
/* 00DAE4 80010AE4 7C007E70 */  srawi     r0, r0, 15
/* 00DAE8 80010AE8 2C008000 */  cmpwi     r0, -0x8000
/* 00DAEC 80010AEC 40800008 */  bge       lbl_80010AF4
/* 00DAF0 80010AF0 38008000 */  li        r0, -0x8000
lbl_80010AF4:
/* 00DAF4 80010AF4 2C007FFF */  cmpwi     r0, 0x7fff
/* 00DAF8 80010AF8 40810008 */  ble       lbl_80010B00
/* 00DAFC 80010AFC 38007FFF */  li        r0, 0x7fff
lbl_80010B00:
/* 00DB00 80010B00 7C000734 */  extsh     r0, r0
/* 00DB04 80010B04 B01A0002 */  sth       r0, 0x2(r26)
/* 00DB08 80010B08 3B5A0004 */  addi      r26, r26, 0x4
/* 00DB0C 80010B0C 38A50004 */  addi      r5, r5, 0x4
/* 00DB10 80010B10 4200FF54 */  bdnz      lbl_80010A64
lbl_80010B14:
/* 00DB14 80010B14 807C0000 */  lwz       r3, 0x0(r28)
/* 00DB18 80010B18 7F64D850 */  subf      r27, r4, r27
/* 00DB1C 80010B1C 80030008 */  lwz       r0, 0x8(r3)
/* 00DB20 80010B20 7C040050 */  subf      r0, r4, r0
/* 00DB24 80010B24 90030008 */  stw       r0, 0x8(r3)
/* 00DB28 80010B28 807C0000 */  lwz       r3, 0x0(r28)
/* 00DB2C 80010B2C 90A30004 */  stw       r5, 0x4(r3)
/* 00DB30 80010B30 807C0000 */  lwz       r3, 0x0(r28)
/* 00DB34 80010B34 80030008 */  lwz       r0, 0x8(r3)
/* 00DB38 80010B38 28000000 */  cmplwi    r0, 0x0
/* 00DB3C 80010B3C 40820010 */  bne       lbl_80010B4C
/* 00DB40 80010B40 48000331 */  bl        PushFreeAudioBuffer
/* 00DB44 80010B44 38000000 */  li        r0, 0x0
/* 00DB48 80010B48 901C0000 */  stw       r0, 0x0(r28)
lbl_80010B4C:
/* 00DB4C 80010B4C 281B0000 */  cmplwi    r27, 0x0
/* 00DB50 80010B50 41820014 */  beq       lbl_80010B64
/* 00DB54 80010B54 4BFFFEA4 */  b         lbl_800109F8
lbl_80010B58:
/* 00DB58 80010B58 54A5103A */  slwi      r5, r5, 2
/* 00DB5C 80010B5C 38800000 */  li        r4, 0x0
/* 00DB60 80010B60 4BFF47C1 */  bl        memset
lbl_80010B64:
/* 00DB64 80010B64 BB210024 */  lmw       r25, 0x24(r1)
/* 00DB68 80010B68 80010044 */  lwz       r0, 0x44(r1)
/* 00DB6C 80010B6C 38210040 */  addi      r1, r1, 0x40
/* 00DB70 80010B70 7C0803A6 */  mtlr      r0
/* 00DB74 80010B74 4E800020 */  blr

# 0x800EB6A0 - 0x800EB940
.section .data, "wa"

.balign 8

glabel D_800EB6A0
	.long 0x00000002
	.long 0x00080012
	.long 0x00200032
	.long 0x00490063
	.long 0x008200A4
	.long 0x00CB00F5
	.long 0x01240157
	.long 0x018E01C9
	.long 0x0208024B
	.long 0x029202DD
	.long 0x032C037F
	.long 0x03D70432
	.long 0x049204F5
	.long 0x055D05C9
	.long 0x063806AC
	.long 0x072407A0
	.long 0x082008A4
	.long 0x092C09B8
	.long 0x0A480ADD
	.long 0x0B750C12
	.long 0x0CB20D57
	.long 0x0DFF0EAC
	.long 0x0F5D1012
	.long 0x10CA1187
	.long 0x1248130D
	.long 0x13D714A4
	.long 0x1575164A
	.long 0x17241801
	.long 0x18E319C8
	.long 0x1AB21BA0
	.long 0x1C911D87
	.long 0x1E811F7F
	.long 0x20812187
	.long 0x2291239F
	.long 0x24B225C8
	.long 0x26E22801
	.long 0x29232A4A
	.long 0x2B752CA3
	.long 0x2DD62F0D
	.long 0x30483187
	.long 0x32CA3411
	.long 0x355C36AB
	.long 0x37FF3956
	.long 0x3AB13C11
	.long 0x3D743EDC
	.long 0x404841B7
	.long 0x432B44A3
	.long 0x461F479F
	.long 0x49234AAB
	.long 0x4C374DC7
	.long 0x4F5C50F4
	.long 0x52905431
	.long 0x55D6577E
	.long 0x592B5ADC
	.long 0x5C905E49
	.long 0x600661C7
	.long 0x638C6555
	.long 0x672268F4
	.long 0x6AC96CA2
	.long 0x6E807061
	.long 0x72477430
	.long 0x761E7810
	.long 0x7A067C00
	.long 0x7DFE8000

glabel D_800EB7A0
	.string "Pleae call AXInit or sndInit before you call THPPlayerInit\n"

glabel D_800EB7DC
	.string "You must call THPPlayerInit before you call this function\n\000"

glabel D_800EB818
	.string "Can't open %s because a thp file is already opened.\n\000\000\000"

glabel D_800EB850
	.string "Can't open %s.\n"

glabel D_800EB860
	.string "This file is not a THP file.\n\000\000"

glabel D_800EB880
	.string "invalid version.\n\000\000"

glabel D_800EB894
	.string "Unknown frame components.\n\000"

glabel D_800EB8B0
	.string "This thp file doesn't have the offset data\n"

glabel D_800EB8DC
	.string "Specified frame number is over total frame number\n\000"

glabel D_800EB910
	.string "Specified audio track number is invalid\n\000\000\000\000\000\000\000"

# 0x800F5A40 - 0x800FB1B0
.section .bss, "wa"

glabel D_800F5A40
	.skip 0x5000

glabel D_800FAA40
	.skip 0x40

glabel D_800FAA80
	.skip 0x20

glabel D_800FAAA0
	.skip 0x20

glabel D_800FAAC0
	.skip 0x20

glabel D_800FAAE0
	.skip 0x500

glabel D_800FAFE0
	.skip 0x1D0

# 0x8018B050 - 0x8018B058
.section .sdata, "wa"

glabel D_8018B050
	.long 0x54485000
	.long 0x00000000

# 0x8018B8A8 - 0x8018B8C8
.section .sbss, "wa"

glabel D_8018B8A8
	.skip 0x4

glabel D_8018B8AC
	.skip 0x4

glabel D_8018B8B0
	.skip 0x4

glabel D_8018B8B4
	.skip 0x4

glabel D_8018B8B8
	.skip 0x4

glabel D_8018B8BC
	.skip 0x4

glabel D_8018B8C0
	.skip 0x4

glabel D_8018B8C4
	.skip 0x4

# 0x8018BFB0 - 0x8018BFB8
.section .sdata2, "a"

glabel D_8018BFB0
	.float 127

glabel D_8018BFB4
	.float 100
