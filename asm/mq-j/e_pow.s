# e_pow.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x800CFC68 - 0x800D04A0

glabel __ieee754_pow
/* 0CCC68 800CFC68 7C0802A6 */  mflr      r0
/* 0CCC6C 800CFC6C 3C60800D */  lis       r3, D_800D22A0@ha
/* 0CCC70 800CFC70 90010004 */  stw       r0, 0x4(r1)
/* 0CCC74 800CFC74 9421FF78 */  stwu      r1, -0x88(r1)
/* 0CCC78 800CFC78 DBE10080 */  stfd      f31, 0x80(r1)
/* 0CCC7C 800CFC7C BF210064 */  stmw      r25, 0x64(r1)
/* 0CCC80 800CFC80 3BE322A0 */  addi      r31, r3, D_800D22A0@l
/* 0CCC84 800CFC84 D8410010 */  stfd      f2, 0x10(r1)
/* 0CCC88 800CFC88 83A10010 */  lwz       r29, 0x10(r1)
/* 0CCC8C 800CFC8C D8210008 */  stfd      f1, 0x8(r1)
/* 0CCC90 800CFC90 80810014 */  lwz       r4, 0x14(r1)
/* 0CCC94 800CFC94 57BC007E */  clrlwi    r28, r29, 1
/* 0CCC98 800CFC98 83C10008 */  lwz       r30, 0x8(r1)
/* 0CCC9C 800CFC9C 7F802379 */  or.       r0, r28, r4
/* 0CCCA0 800CFCA0 8321000C */  lwz       r25, 0xc(r1)
/* 0CCCA4 800CFCA4 57DA007E */  clrlwi    r26, r30, 1
/* 0CCCA8 800CFCA8 4082000C */  bne       lbl_800CFCB4
/* 0CCCAC 800CFCAC C8228560 */  lfd       f1, D_8018C4A0@sda21(r0)
/* 0CCCB0 800CFCB0 480007B8 */  b         lbl_800D0468
lbl_800CFCB4:
/* 0CCCB4 800CFCB4 3C007FF0 */  lis       r0, 0x7ff0
/* 0CCCB8 800CFCB8 7C1A0000 */  cmpw      r26, r0
/* 0CCCBC 800CFCBC 41810038 */  bgt       lbl_800CFCF4
/* 0CCCC0 800CFCC0 3C1A8010 */  subis     r0, r26, 0x7ff0
/* 0CCCC4 800CFCC4 28000000 */  cmplwi    r0, 0x0
/* 0CCCC8 800CFCC8 4082000C */  bne       lbl_800CFCD4
/* 0CCCCC 800CFCCC 28190000 */  cmplwi    r25, 0x0
/* 0CCCD0 800CFCD0 40820024 */  bne       lbl_800CFCF4
lbl_800CFCD4:
/* 0CCCD4 800CFCD4 3C007FF0 */  lis       r0, 0x7ff0
/* 0CCCD8 800CFCD8 7C1C0000 */  cmpw      r28, r0
/* 0CCCDC 800CFCDC 41810018 */  bgt       lbl_800CFCF4
/* 0CCCE0 800CFCE0 3C1C8010 */  subis     r0, r28, 0x7ff0
/* 0CCCE4 800CFCE4 28000000 */  cmplwi    r0, 0x0
/* 0CCCE8 800CFCE8 4082001C */  bne       lbl_800CFD04
/* 0CCCEC 800CFCEC 28040000 */  cmplwi    r4, 0x0
/* 0CCCF0 800CFCF0 41820014 */  beq       lbl_800CFD04
lbl_800CFCF4:
/* 0CCCF4 800CFCF4 C8210008 */  lfd       f1, 0x8(r1)
/* 0CCCF8 800CFCF8 C8010010 */  lfd       f0, 0x10(r1)
/* 0CCCFC 800CFCFC FC21002A */  fadd      f1, f1, f0
/* 0CCD00 800CFD00 48000768 */  b         lbl_800D0468
lbl_800CFD04:
/* 0CCD04 800CFD04 2C1E0000 */  cmpwi     r30, 0x0
/* 0CCD08 800CFD08 3B600000 */  li        r27, 0x0
/* 0CCD0C 800CFD0C 40800078 */  bge       lbl_800CFD84
/* 0CCD10 800CFD10 3C004340 */  lis       r0, 0x4340
/* 0CCD14 800CFD14 7C1C0000 */  cmpw      r28, r0
/* 0CCD18 800CFD18 4180000C */  blt       lbl_800CFD24
/* 0CCD1C 800CFD1C 3B600002 */  li        r27, 0x2
/* 0CCD20 800CFD20 48000064 */  b         lbl_800CFD84
lbl_800CFD24:
/* 0CCD24 800CFD24 3C003FF0 */  lis       r0, 0x3ff0
/* 0CCD28 800CFD28 7C1C0000 */  cmpw      r28, r0
/* 0CCD2C 800CFD2C 41800058 */  blt       lbl_800CFD84
/* 0CCD30 800CFD30 7F83A670 */  srawi     r3, r28, 20
/* 0CCD34 800CFD34 3803FC01 */  subi      r0, r3, 0x3ff
/* 0CCD38 800CFD38 2C000014 */  cmpwi     r0, 0x14
/* 0CCD3C 800CFD3C 40810024 */  ble       lbl_800CFD60
/* 0CCD40 800CFD40 20000034 */  subfic    r0, r0, 0x34
/* 0CCD44 800CFD44 7C830430 */  srw       r3, r4, r0
/* 0CCD48 800CFD48 7C600030 */  slw       r0, r3, r0
/* 0CCD4C 800CFD4C 7C040040 */  cmplw     r4, r0
/* 0CCD50 800CFD50 40820034 */  bne       lbl_800CFD84
/* 0CCD54 800CFD54 546007FE */  clrlwi    r0, r3, 31
/* 0CCD58 800CFD58 23600002 */  subfic    r27, r0, 0x2
/* 0CCD5C 800CFD5C 48000028 */  b         lbl_800CFD84
lbl_800CFD60:
/* 0CCD60 800CFD60 28040000 */  cmplwi    r4, 0x0
/* 0CCD64 800CFD64 40820020 */  bne       lbl_800CFD84
/* 0CCD68 800CFD68 20000014 */  subfic    r0, r0, 0x14
/* 0CCD6C 800CFD6C 7F830630 */  sraw      r3, r28, r0
/* 0CCD70 800CFD70 7C600030 */  slw       r0, r3, r0
/* 0CCD74 800CFD74 7C1C0000 */  cmpw      r28, r0
/* 0CCD78 800CFD78 4082000C */  bne       lbl_800CFD84
/* 0CCD7C 800CFD7C 546007FE */  clrlwi    r0, r3, 31
/* 0CCD80 800CFD80 23600002 */  subfic    r27, r0, 0x2
lbl_800CFD84:
/* 0CCD84 800CFD84 28040000 */  cmplwi    r4, 0x0
/* 0CCD88 800CFD88 408200CC */  bne       lbl_800CFE54
/* 0CCD8C 800CFD8C 3C1C8010 */  subis     r0, r28, 0x7ff0
/* 0CCD90 800CFD90 28000000 */  cmplwi    r0, 0x0
/* 0CCD94 800CFD94 4082005C */  bne       lbl_800CFDF0
/* 0CCD98 800CFD98 3C1AC010 */  subis     r0, r26, 0x3ff0
/* 0CCD9C 800CFD9C 7C00CB79 */  or.       r0, r0, r25
/* 0CCDA0 800CFDA0 40820010 */  bne       lbl_800CFDB0
/* 0CCDA4 800CFDA4 C8010010 */  lfd       f0, 0x10(r1)
/* 0CCDA8 800CFDA8 FC200028 */  fsub      f1, f0, f0
/* 0CCDAC 800CFDAC 480006BC */  b         lbl_800D0468
lbl_800CFDB0:
/* 0CCDB0 800CFDB0 3C003FF0 */  lis       r0, 0x3ff0
/* 0CCDB4 800CFDB4 7C1A0000 */  cmpw      r26, r0
/* 0CCDB8 800CFDB8 4180001C */  blt       lbl_800CFDD4
/* 0CCDBC 800CFDBC 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCDC0 800CFDC0 4180000C */  blt       lbl_800CFDCC
/* 0CCDC4 800CFDC4 C8210010 */  lfd       f1, 0x10(r1)
/* 0CCDC8 800CFDC8 480006A0 */  b         lbl_800D0468
lbl_800CFDCC:
/* 0CCDCC 800CFDCC C8228568 */  lfd       f1, D_8018C4A8@sda21(r0)
/* 0CCDD0 800CFDD0 48000698 */  b         lbl_800D0468
lbl_800CFDD4:
/* 0CCDD4 800CFDD4 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCDD8 800CFDD8 40800010 */  bge       lbl_800CFDE8
/* 0CCDDC 800CFDDC C8010010 */  lfd       f0, 0x10(r1)
/* 0CCDE0 800CFDE0 FC200050 */  fneg      f1, f0
/* 0CCDE4 800CFDE4 48000684 */  b         lbl_800D0468
lbl_800CFDE8:
/* 0CCDE8 800CFDE8 C8228568 */  lfd       f1, D_8018C4A8@sda21(r0)
/* 0CCDEC 800CFDEC 4800067C */  b         lbl_800D0468
lbl_800CFDF0:
/* 0CCDF0 800CFDF0 3C1CC010 */  subis     r0, r28, 0x3ff0
/* 0CCDF4 800CFDF4 28000000 */  cmplwi    r0, 0x0
/* 0CCDF8 800CFDF8 40820024 */  bne       lbl_800CFE1C
/* 0CCDFC 800CFDFC 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCE00 800CFE00 40800014 */  bge       lbl_800CFE14
/* 0CCE04 800CFE04 C8228560 */  lfd       f1, D_8018C4A0@sda21(r0)
/* 0CCE08 800CFE08 C8010008 */  lfd       f0, 0x8(r1)
/* 0CCE0C 800CFE0C FC210024 */  fdiv      f1, f1, f0
/* 0CCE10 800CFE10 48000658 */  b         lbl_800D0468
lbl_800CFE14:
/* 0CCE14 800CFE14 C8210008 */  lfd       f1, 0x8(r1)
/* 0CCE18 800CFE18 48000650 */  b         lbl_800D0468
lbl_800CFE1C:
/* 0CCE1C 800CFE1C 3C1DC000 */  subis     r0, r29, 0x4000
/* 0CCE20 800CFE20 28000000 */  cmplwi    r0, 0x0
/* 0CCE24 800CFE24 40820010 */  bne       lbl_800CFE34
/* 0CCE28 800CFE28 C8010008 */  lfd       f0, 0x8(r1)
/* 0CCE2C 800CFE2C FC200032 */  fmul      f1, f0, f0
/* 0CCE30 800CFE30 48000638 */  b         lbl_800D0468
lbl_800CFE34:
/* 0CCE34 800CFE34 3C1DC020 */  subis     r0, r29, 0x3fe0
/* 0CCE38 800CFE38 28000000 */  cmplwi    r0, 0x0
/* 0CCE3C 800CFE3C 40820018 */  bne       lbl_800CFE54
/* 0CCE40 800CFE40 2C1E0000 */  cmpwi     r30, 0x0
/* 0CCE44 800CFE44 41800010 */  blt       lbl_800CFE54
/* 0CCE48 800CFE48 C8210008 */  lfd       f1, 0x8(r1)
/* 0CCE4C 800CFE4C 480011D1 */  bl        sqrt
/* 0CCE50 800CFE50 48000618 */  b         lbl_800D0468
lbl_800CFE54:
/* 0CCE54 800CFE54 C8210008 */  lfd       f1, 0x8(r1)
/* 0CCE58 800CFE58 4BFFFE09 */  bl        fabs__Fd
/* 0CCE5C 800CFE5C 28190000 */  cmplwi    r25, 0x0
/* 0CCE60 800CFE60 D8210048 */  stfd      f1, 0x48(r1)
/* 0CCE64 800CFE64 40820084 */  bne       lbl_800CFEE8
/* 0CCE68 800CFE68 3C1A8010 */  subis     r0, r26, 0x7ff0
/* 0CCE6C 800CFE6C 28000000 */  cmplwi    r0, 0x0
/* 0CCE70 800CFE70 41820018 */  beq       lbl_800CFE88
/* 0CCE74 800CFE74 2C1A0000 */  cmpwi     r26, 0x0
/* 0CCE78 800CFE78 41820010 */  beq       lbl_800CFE88
/* 0CCE7C 800CFE7C 3C1AC010 */  subis     r0, r26, 0x3ff0
/* 0CCE80 800CFE80 28000000 */  cmplwi    r0, 0x0
/* 0CCE84 800CFE84 40820064 */  bne       lbl_800CFEE8
lbl_800CFE88:
/* 0CCE88 800CFE88 C8210048 */  lfd       f1, 0x48(r1)
/* 0CCE8C 800CFE8C 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCE90 800CFE90 D8210050 */  stfd      f1, 0x50(r1)
/* 0CCE94 800CFE94 40800010 */  bge       lbl_800CFEA4
/* 0CCE98 800CFE98 C8028560 */  lfd       f0, D_8018C4A0@sda21(r0)
/* 0CCE9C 800CFE9C FC000824 */  fdiv      f0, f0, f1
/* 0CCEA0 800CFEA0 D8010050 */  stfd      f0, 0x50(r1)
lbl_800CFEA4:
/* 0CCEA4 800CFEA4 2C1E0000 */  cmpwi     r30, 0x0
/* 0CCEA8 800CFEA8 40800038 */  bge       lbl_800CFEE0
/* 0CCEAC 800CFEAC 3C1AC010 */  subis     r0, r26, 0x3ff0
/* 0CCEB0 800CFEB0 7C00DB79 */  or.       r0, r0, r27
/* 0CCEB4 800CFEB4 40820018 */  bne       lbl_800CFECC
/* 0CCEB8 800CFEB8 C8010050 */  lfd       f0, 0x50(r1)
/* 0CCEBC 800CFEBC FC000028 */  fsub      f0, f0, f0
/* 0CCEC0 800CFEC0 FC000024 */  fdiv      f0, f0, f0
/* 0CCEC4 800CFEC4 D8010050 */  stfd      f0, 0x50(r1)
/* 0CCEC8 800CFEC8 48000018 */  b         lbl_800CFEE0
lbl_800CFECC:
/* 0CCECC 800CFECC 2C1B0001 */  cmpwi     r27, 0x1
/* 0CCED0 800CFED0 40820010 */  bne       lbl_800CFEE0
/* 0CCED4 800CFED4 C8010050 */  lfd       f0, 0x50(r1)
/* 0CCED8 800CFED8 FC000050 */  fneg      f0, f0
/* 0CCEDC 800CFEDC D8010050 */  stfd      f0, 0x50(r1)
lbl_800CFEE0:
/* 0CCEE0 800CFEE0 C8210050 */  lfd       f1, 0x50(r1)
/* 0CCEE4 800CFEE4 48000584 */  b         lbl_800D0468
lbl_800CFEE8:
/* 0CCEE8 800CFEE8 7FC3FE70 */  srawi     r3, r30, 31
/* 0CCEEC 800CFEEC 38030001 */  addi      r0, r3, 0x1
/* 0CCEF0 800CFEF0 7C03DB79 */  or.       r3, r0, r27
/* 0CCEF4 800CFEF4 40820018 */  bne       lbl_800CFF0C
/* 0CCEF8 800CFEF8 38000021 */  li        r0, 0x21
/* 0CCEFC 800CFEFC 900D8F98 */  stw       r0, D_8018BF18@sda21(r0)
/* 0CCF00 800CFF00 3C60800F */  lis       r3, D_800F51D8@ha
/* 0CCF04 800CFF04 C02351D8 */  lfs       f1, D_800F51D8@l(r3)
/* 0CCF08 800CFF08 48000560 */  b         lbl_800D0468
lbl_800CFF0C:
/* 0CCF0C 800CFF0C 3C6041E0 */  lis       r3, 0x41e0
/* 0CCF10 800CFF10 7C1C1800 */  cmpw      r28, r3
/* 0CCF14 800CFF14 40810108 */  ble       lbl_800D001C
/* 0CCF18 800CFF18 3C6043F0 */  lis       r3, 0x43f0
/* 0CCF1C 800CFF1C 7C1C1800 */  cmpw      r28, r3
/* 0CCF20 800CFF20 4081004C */  ble       lbl_800CFF6C
/* 0CCF24 800CFF24 3C603FF0 */  lis       r3, 0x3ff0
/* 0CCF28 800CFF28 3883FFFF */  subi      r4, r3, 0x1
/* 0CCF2C 800CFF2C 7C1A2000 */  cmpw      r26, r4
/* 0CCF30 800CFF30 4181001C */  bgt       lbl_800CFF4C
/* 0CCF34 800CFF34 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCF38 800CFF38 4080000C */  bge       lbl_800CFF44
/* 0CCF3C 800CFF3C C8228570 */  lfd       f1, D_8018C4B0@sda21(r0)
/* 0CCF40 800CFF40 48000528 */  b         lbl_800D0468
lbl_800CFF44:
/* 0CCF44 800CFF44 C8228568 */  lfd       f1, D_8018C4A8@sda21(r0)
/* 0CCF48 800CFF48 48000520 */  b         lbl_800D0468
lbl_800CFF4C:
/* 0CCF4C 800CFF4C 7C1A1800 */  cmpw      r26, r3
/* 0CCF50 800CFF50 4180001C */  blt       lbl_800CFF6C
/* 0CCF54 800CFF54 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCF58 800CFF58 4081000C */  ble       lbl_800CFF64
/* 0CCF5C 800CFF5C C8228570 */  lfd       f1, D_8018C4B0@sda21(r0)
/* 0CCF60 800CFF60 48000508 */  b         lbl_800D0468
lbl_800CFF64:
/* 0CCF64 800CFF64 C8228568 */  lfd       f1, D_8018C4A8@sda21(r0)
/* 0CCF68 800CFF68 48000500 */  b         lbl_800D0468
lbl_800CFF6C:
/* 0CCF6C 800CFF6C 3C603FF0 */  lis       r3, 0x3ff0
/* 0CCF70 800CFF70 3883FFFF */  subi      r4, r3, 0x1
/* 0CCF74 800CFF74 7C1A2000 */  cmpw      r26, r4
/* 0CCF78 800CFF78 4080001C */  bge       lbl_800CFF94
/* 0CCF7C 800CFF7C 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCF80 800CFF80 4080000C */  bge       lbl_800CFF8C
/* 0CCF84 800CFF84 C8228570 */  lfd       f1, D_8018C4B0@sda21(r0)
/* 0CCF88 800CFF88 480004E0 */  b         lbl_800D0468
lbl_800CFF8C:
/* 0CCF8C 800CFF8C C8228568 */  lfd       f1, D_8018C4A8@sda21(r0)
/* 0CCF90 800CFF90 480004D8 */  b         lbl_800D0468
lbl_800CFF94:
/* 0CCF94 800CFF94 7C1A1800 */  cmpw      r26, r3
/* 0CCF98 800CFF98 4081001C */  ble       lbl_800CFFB4
/* 0CCF9C 800CFF9C 2C1D0000 */  cmpwi     r29, 0x0
/* 0CCFA0 800CFFA0 4081000C */  ble       lbl_800CFFAC
/* 0CCFA4 800CFFA4 C8228570 */  lfd       f1, D_8018C4B0@sda21(r0)
/* 0CCFA8 800CFFA8 480004C0 */  b         lbl_800D0468
lbl_800CFFAC:
/* 0CCFAC 800CFFAC C8228568 */  lfd       f1, D_8018C4A8@sda21(r0)
/* 0CCFB0 800CFFB0 480004B8 */  b         lbl_800D0468
lbl_800CFFB4:
/* 0CCFB4 800CFFB4 C8210008 */  lfd       f1, 0x8(r1)
/* 0CCFB8 800CFFB8 38600000 */  li        r3, 0x0
/* 0CCFBC 800CFFBC C8028560 */  lfd       f0, D_8018C4A0@sda21(r0)
/* 0CCFC0 800CFFC0 C84285A0 */  lfd       f2, D_8018C4E0@sda21(r0)
/* 0CCFC4 800CFFC4 FC810028 */  fsub      f4, f1, f0
/* 0CCFC8 800CFFC8 C8228598 */  lfd       f1, D_8018C4D8@sda21(r0)
/* 0CCFCC 800CFFCC C8028590 */  lfd       f0, D_8018C4D0@sda21(r0)
/* 0CCFD0 800CFFD0 C8628588 */  lfd       f3, D_8018C4C8@sda21(r0)
/* 0CCFD4 800CFFD4 D8810028 */  stfd      f4, 0x28(r1)
/* 0CCFD8 800CFFD8 C8A28578 */  lfd       f5, D_8018C4B8@sda21(r0)
/* 0CCFDC 800CFFDC C8C10028 */  lfd       f6, 0x28(r1)
/* 0CCFE0 800CFFE0 C8828580 */  lfd       f4, D_8018C4C0@sda21(r0)
/* 0CCFE4 800CFFE4 FC2209BC */  fnmsub    f1, f2, f6, f1
/* 0CCFE8 800CFFE8 FC4601B2 */  fmul      f2, f6, f6
/* 0CCFEC 800CFFEC FC06007C */  fnmsub    f0, f6, f1, f0
/* 0CCFF0 800CFFF0 FC2501B2 */  fmul      f1, f5, f6
/* 0CCFF4 800CFFF4 FC020032 */  fmul      f0, f2, f0
/* 0CCFF8 800CFFF8 FC030032 */  fmul      f0, f3, f0
/* 0CCFFC 800CFFFC FC4401B8 */  fmsub     f2, f4, f6, f0
/* 0CD000 800D0000 FC01102A */  fadd      f0, f1, f2
/* 0CD004 800D0004 D8010030 */  stfd      f0, 0x30(r1)
/* 0CD008 800D0008 90610034 */  stw       r3, 0x34(r1)
/* 0CD00C 800D000C C8010030 */  lfd       f0, 0x30(r1)
/* 0CD010 800D0010 FC000828 */  fsub      f0, f0, f1
/* 0CD014 800D0014 FC020028 */  fsub      f0, f2, f0
/* 0CD018 800D0018 480001F0 */  b         lbl_800D0208
lbl_800D001C:
/* 0CD01C 800D001C 3C600010 */  lis       r3, 0x10
/* 0CD020 800D0020 7C1A1800 */  cmpw      r26, r3
/* 0CD024 800D0024 39000000 */  li        r8, 0x0
/* 0CD028 800D0028 4080001C */  bge       lbl_800D0044
/* 0CD02C 800D002C C8210048 */  lfd       f1, 0x48(r1)
/* 0CD030 800D0030 3900FFCB */  li        r8, -0x35
/* 0CD034 800D0034 C80285A8 */  lfd       f0, D_8018C4E8@sda21(r0)
/* 0CD038 800D0038 FC010032 */  fmul      f0, f1, f0
/* 0CD03C 800D003C D8010048 */  stfd      f0, 0x48(r1)
/* 0CD040 800D0040 83410048 */  lwz       r26, 0x48(r1)
lbl_800D0044:
/* 0CD044 800D0044 3C600004 */  lis       r3, 0x4
/* 0CD048 800D0048 5745033E */  clrlwi    r5, r26, 12
/* 0CD04C 800D004C 3863988E */  subi      r3, r3, 0x6772
/* 0CD050 800D0050 7F44A670 */  srawi     r4, r26, 20
/* 0CD054 800D0054 7D044214 */  add       r8, r4, r8
/* 0CD058 800D0058 7C051800 */  cmpw      r5, r3
/* 0CD05C 800D005C 64A43FF0 */  oris      r4, r5, 0x3ff0
/* 0CD060 800D0060 3908FC01 */  subi      r8, r8, 0x3ff
/* 0CD064 800D0064 4181000C */  bgt       lbl_800D0070
/* 0CD068 800D0068 38E00000 */  li        r7, 0x0
/* 0CD06C 800D006C 48000028 */  b         lbl_800D0094
lbl_800D0070:
/* 0CD070 800D0070 3C60000C */  lis       r3, 0xc
/* 0CD074 800D0074 3863B67A */  subi      r3, r3, 0x4986
/* 0CD078 800D0078 7C051800 */  cmpw      r5, r3
/* 0CD07C 800D007C 4080000C */  bge       lbl_800D0088
/* 0CD080 800D0080 38E00001 */  li        r7, 0x1
/* 0CD084 800D0084 48000010 */  b         lbl_800D0094
lbl_800D0088:
/* 0CD088 800D0088 3C84FFF0 */  subis     r4, r4, 0x10
/* 0CD08C 800D008C 38E00000 */  li        r7, 0x0
/* 0CD090 800D0090 39080001 */  addi      r8, r8, 0x1
lbl_800D0094:
/* 0CD094 800D0094 90810048 */  stw       r4, 0x48(r1)
/* 0CD098 800D0098 54E31838 */  slwi      r3, r7, 3
/* 0CD09C 800D009C 7CDF1A14 */  add       r6, r31, r3
/* 0CD0A0 800D00A0 C8428560 */  lfd       f2, D_8018C4A0@sda21(r0)
/* 0CD0A4 800D00A4 C9610048 */  lfd       f11, 0x48(r1)
/* 0CD0A8 800D00A8 C8660000 */  lfd       f3, 0x0(r6)
/* 0CD0AC 800D00AC 7C830E70 */  srawi     r3, r4, 1
/* 0CD0B0 800D00B0 C8028568 */  lfd       f0, D_8018C4A8@sda21(r0)
/* 0CD0B4 800D00B4 64632000 */  oris      r3, r3, 0x2000
/* 0CD0B8 800D00B8 FC2B182A */  fadd      f1, f11, f3
/* 0CD0BC 800D00BC FD0B1828 */  fsub      f8, f11, f3
/* 0CD0C0 800D00C0 3CA30008 */  addis     r5, r3, 0x8
/* 0CD0C4 800D00C4 54E3901A */  slwi      r3, r7, 18
/* 0CD0C8 800D00C8 D8010018 */  stfd      f0, 0x18(r1)
/* 0CD0CC 800D00CC FDA20824 */  fdiv      f13, f2, f1
/* 0CD0D0 800D00D0 7C651A14 */  add       r3, r5, r3
/* 0CD0D4 800D00D4 C88285D8 */  lfd       f4, D_8018C518@sda21(r0)
/* 0CD0D8 800D00D8 90610018 */  stw       r3, 0x18(r1)
/* 0CD0DC 800D00DC 6D048000 */  xoris     r4, r8, 0x8000
/* 0CD0E0 800D00E0 FC080372 */  fmul      f0, f8, f13
/* 0CD0E4 800D00E4 C86285D0 */  lfd       f3, D_8018C510@sda21(r0)
/* 0CD0E8 800D00E8 C82285C8 */  lfd       f1, D_8018C508@sda21(r0)
/* 0CD0EC 800D00EC 38A00000 */  li        r5, 0x0
/* 0CD0F0 800D00F0 C84285C0 */  lfd       f2, D_8018C500@sda21(r0)
/* 0CD0F4 800D00F4 FFE00032 */  fmul      f31, f0, f0
/* 0CD0F8 800D00F8 D8010020 */  stfd      f0, 0x20(r1)
/* 0CD0FC 800D00FC C8C10018 */  lfd       f6, 0x18(r1)
/* 0CD100 800D0100 3C604330 */  lis       r3, 0x4330
/* 0CD104 800D0104 90A10024 */  stw       r5, 0x24(r1)
/* 0CD108 800D0108 FC641FFA */  fmadd     f3, f4, f31, f3
/* 0CD10C 800D010C C8860000 */  lfd       f4, 0x0(r6)
/* 0CD110 800D0110 C9810020 */  lfd       f12, 0x20(r1)
/* 0CD114 800D0114 FD462028 */  fsub      f10, f6, f4
/* 0CD118 800D0118 9081005C */  stw       r4, 0x5c(r1)
/* 0CD11C 800D011C FC7F08FA */  fmadd     f3, f31, f3, f1
/* 0CD120 800D0120 C82285B8 */  lfd       f1, D_8018C4F8@sda21(r0)
/* 0CD124 800D0124 C8A285B0 */  lfd       f5, D_8018C4F0@sda21(r0)
/* 0CD128 800D0128 FD2C41BC */  fnmsub    f9, f12, f6, f8
/* 0CD12C 800D012C C8E285E0 */  lfd       f7, D_8018C520@sda21(r0)
/* 0CD130 800D0130 FC5F10FA */  fmadd     f2, f31, f3, f2
/* 0CD134 800D0134 90610058 */  stw       r3, 0x58(r1)
/* 0CD138 800D0138 C86285F8 */  lfd       f3, D_8018C538@sda21(r0)
/* 0CD13C 800D013C FD4B5028 */  fsub      f10, f11, f10
/* 0CD140 800D0140 C88285F0 */  lfd       f4, D_8018C530@sda21(r0)
/* 0CD144 800D0144 FD1F08BA */  fmadd     f8, f31, f2, f1
/* 0CD148 800D0148 C8428668 */  lfd       f2, D_8018C5A8@sda21(r0)
/* 0CD14C 800D014C C8210058 */  lfd       f1, 0x58(r1)
/* 0CD150 800D0150 FD4C4ABC */  fnmsub    f10, f12, f10, f9
/* 0CD154 800D0154 C8C285E8 */  lfd       f6, D_8018C528@sda21(r0)
/* 0CD158 800D0158 FCBF2A3A */  fmadd     f5, f31, f8, f5
/* 0CD15C 800D015C FD3F07F2 */  fmul      f9, f31, f31
/* 0CD160 800D0160 FD4D02B2 */  fmul      f10, f13, f10
/* 0CD164 800D0164 FD290172 */  fmul      f9, f9, f5
/* 0CD168 800D0168 FD6C0332 */  fmul      f11, f12, f12
/* 0CD16C 800D016C FD0C002A */  fadd      f8, f12, f0
/* 0CD170 800D0170 FC211028 */  fsub      f1, f1, f2
/* 0CD174 800D0174 FCA7582A */  fadd      f5, f7, f11
/* 0CD178 800D0178 FD2A4A3A */  fmadd     f9, f10, f8, f9
/* 0CD17C 800D017C FC45482A */  fadd      f2, f5, f9
/* 0CD180 800D0180 D8410018 */  stfd      f2, 0x18(r1)
/* 0CD184 800D0184 90A1001C */  stw       r5, 0x1c(r1)
/* 0CD188 800D0188 C8A10018 */  lfd       f5, 0x18(r1)
/* 0CD18C 800D018C FC453828 */  fsub      f2, f5, f7
/* 0CD190 800D0190 FD0C0172 */  fmul      f8, f12, f5
/* 0CD194 800D0194 FC425828 */  fsub      f2, f2, f11
/* 0CD198 800D0198 FC491028 */  fsub      f2, f9, f2
/* 0CD19C 800D019C FC020032 */  fmul      f0, f2, f0
/* 0CD1A0 800D01A0 FC4A017A */  fmadd     f2, f10, f5, f0
/* 0CD1A4 800D01A4 FC08102A */  fadd      f0, f8, f2
/* 0CD1A8 800D01A8 D8010040 */  stfd      f0, 0x40(r1)
/* 0CD1AC 800D01AC 90A10044 */  stw       r5, 0x44(r1)
/* 0CD1B0 800D01B0 C8E10040 */  lfd       f7, 0x40(r1)
/* 0CD1B4 800D01B4 C8A60020 */  lfd       f5, 0x20(r6)
/* 0CD1B8 800D01B8 FC074028 */  fsub      f0, f7, f8
/* 0CD1BC 800D01BC D8210028 */  stfd      f1, 0x28(r1)
/* 0CD1C0 800D01C0 FCC601F2 */  fmul      f6, f6, f7
/* 0CD1C4 800D01C4 FC220028 */  fsub      f1, f2, f0
/* 0CD1C8 800D01C8 C8060010 */  lfd       f0, 0x10(r6)
/* 0CD1CC 800D01CC C8410028 */  lfd       f2, 0x28(r1)
/* 0CD1D0 800D01D0 FC230072 */  fmul      f1, f3, f1
/* 0CD1D4 800D01D4 FC2409FA */  fmadd     f1, f4, f7, f1
/* 0CD1D8 800D01D8 FC65082A */  fadd      f3, f5, f1
/* 0CD1DC 800D01DC FC26182A */  fadd      f1, f6, f3
/* 0CD1E0 800D01E0 FC01002A */  fadd      f0, f1, f0
/* 0CD1E4 800D01E4 FC02002A */  fadd      f0, f2, f0
/* 0CD1E8 800D01E8 D8010030 */  stfd      f0, 0x30(r1)
/* 0CD1EC 800D01EC 90A10034 */  stw       r5, 0x34(r1)
/* 0CD1F0 800D01F0 C8210030 */  lfd       f1, 0x30(r1)
/* 0CD1F4 800D01F4 C8060010 */  lfd       f0, 0x10(r6)
/* 0CD1F8 800D01F8 FC211028 */  fsub      f1, f1, f2
/* 0CD1FC 800D01FC FC010028 */  fsub      f0, f1, f0
/* 0CD200 800D0200 FC003028 */  fsub      f0, f0, f6
/* 0CD204 800D0204 FC030028 */  fsub      f0, f3, f0
lbl_800D0208:
/* 0CD208 800D0208 387BFFFF */  subi      r3, r27, 0x1
/* 0CD20C 800D020C CBE28560 */  lfd       f31, D_8018C4A0@sda21(r0)
/* 0CD210 800D0210 7C001B79 */  or.       r0, r0, r3
/* 0CD214 800D0214 40820008 */  bne       lbl_800D021C
/* 0CD218 800D0218 CBE28600 */  lfd       f31, D_8018C540@sda21(r0)
lbl_800D021C:
/* 0CD21C 800D021C C8410010 */  lfd       f2, 0x10(r1)
/* 0CD220 800D0220 38600000 */  li        r3, 0x0
/* 0CD224 800D0224 C8610030 */  lfd       f3, 0x30(r1)
/* 0CD228 800D0228 3C004090 */  lis       r0, 0x4090
/* 0CD22C 800D022C D8410038 */  stfd      f2, 0x38(r1)
/* 0CD230 800D0230 FC220032 */  fmul      f1, f2, f0
/* 0CD234 800D0234 9061003C */  stw       r3, 0x3c(r1)
/* 0CD238 800D0238 C8810038 */  lfd       f4, 0x38(r1)
/* 0CD23C 800D023C FC0400F2 */  fmul      f0, f4, f3
/* 0CD240 800D0240 FC422028 */  fsub      f2, f2, f4
/* 0CD244 800D0244 D8010040 */  stfd      f0, 0x40(r1)
/* 0CD248 800D0248 FD0308BA */  fmadd     f8, f3, f2, f1
/* 0CD24C 800D024C C8410040 */  lfd       f2, 0x40(r1)
/* 0CD250 800D0250 FC08102A */  fadd      f0, f8, f2
/* 0CD254 800D0254 D8010050 */  stfd      f0, 0x50(r1)
/* 0CD258 800D0258 80A10050 */  lwz       r5, 0x50(r1)
/* 0CD25C 800D025C 80C10054 */  lwz       r6, 0x54(r1)
/* 0CD260 800D0260 7C050000 */  cmpw      r5, r0
/* 0CD264 800D0264 41800048 */  blt       lbl_800D02AC
/* 0CD268 800D0268 3C05BF70 */  subis     r0, r5, 0x4090
/* 0CD26C 800D026C 7C003379 */  or.       r0, r0, r6
/* 0CD270 800D0270 41820014 */  beq       lbl_800D0284
/* 0CD274 800D0274 C8228608 */  lfd       f1, D_8018C548@sda21(r0)
/* 0CD278 800D0278 FC0107F2 */  fmul      f0, f1, f31
/* 0CD27C 800D027C FC210032 */  fmul      f1, f1, f0
/* 0CD280 800D0280 480001E8 */  b         lbl_800D0468
lbl_800D0284:
/* 0CD284 800D0284 C8228610 */  lfd       f1, D_8018C550@sda21(r0)
/* 0CD288 800D0288 C8010050 */  lfd       f0, 0x50(r1)
/* 0CD28C 800D028C FC21402A */  fadd      f1, f1, f8
/* 0CD290 800D0290 FC001028 */  fsub      f0, f0, f2
/* 0CD294 800D0294 FC010040 */  fcmpo     cr0, f1, f0
/* 0CD298 800D0298 4081006C */  ble       lbl_800D0304
/* 0CD29C 800D029C C8228608 */  lfd       f1, D_8018C548@sda21(r0)
/* 0CD2A0 800D02A0 FC0107F2 */  fmul      f0, f1, f31
/* 0CD2A4 800D02A4 FC210032 */  fmul      f1, f1, f0
/* 0CD2A8 800D02A8 480001C0 */  b         lbl_800D0468
lbl_800D02AC:
/* 0CD2AC 800D02AC 3C604091 */  lis       r3, 0x4091
/* 0CD2B0 800D02B0 54A4007E */  clrlwi    r4, r5, 1
/* 0CD2B4 800D02B4 3803CC00 */  subi      r0, r3, 0x3400
/* 0CD2B8 800D02B8 7C040000 */  cmpw      r4, r0
/* 0CD2BC 800D02BC 41800048 */  blt       lbl_800D0304
/* 0CD2C0 800D02C0 3C653F6F */  addis     r3, r5, 0x3f6f
/* 0CD2C4 800D02C4 38033400 */  addi      r0, r3, 0x3400
/* 0CD2C8 800D02C8 7C003379 */  or.       r0, r0, r6
/* 0CD2CC 800D02CC 41820014 */  beq       lbl_800D02E0
/* 0CD2D0 800D02D0 C8228618 */  lfd       f1, D_8018C558@sda21(r0)
/* 0CD2D4 800D02D4 FC0107F2 */  fmul      f0, f1, f31
/* 0CD2D8 800D02D8 FC210032 */  fmul      f1, f1, f0
/* 0CD2DC 800D02DC 4800018C */  b         lbl_800D0468
lbl_800D02E0:
/* 0CD2E0 800D02E0 C8010050 */  lfd       f0, 0x50(r1)
/* 0CD2E4 800D02E4 FC001028 */  fsub      f0, f0, f2
/* 0CD2E8 800D02E8 FC080040 */  fcmpo     cr0, f8, f0
/* 0CD2EC 800D02EC 4C401382 */  cror      eq, lt, eq
/* 0CD2F0 800D02F0 40820014 */  bne       lbl_800D0304
/* 0CD2F4 800D02F4 C8228618 */  lfd       f1, D_8018C558@sda21(r0)
/* 0CD2F8 800D02F8 FC0107F2 */  fmul      f0, f1, f31
/* 0CD2FC 800D02FC FC210032 */  fmul      f1, f1, f0
/* 0CD300 800D0300 48000168 */  b         lbl_800D0468
lbl_800D0304:
/* 0CD304 800D0304 54A4007E */  clrlwi    r4, r5, 1
/* 0CD308 800D0308 3C003FE0 */  lis       r0, 0x3fe0
/* 0CD30C 800D030C 54A3657E */  extrwi    r3, r5, 11, 1
/* 0CD310 800D0310 38C3FC01 */  subi      r6, r3, 0x3ff
/* 0CD314 800D0314 7C040000 */  cmpw      r4, r0
/* 0CD318 800D0318 38600000 */  li        r3, 0x0
/* 0CD31C 800D031C 40810060 */  ble       lbl_800D037C
/* 0CD320 800D0320 3C800010 */  lis       r4, 0x10
/* 0CD324 800D0324 C8028568 */  lfd       f0, D_8018C4A8@sda21(r0)
/* 0CD328 800D0328 38060001 */  addi      r0, r6, 0x1
/* 0CD32C 800D032C 7C800630 */  sraw      r0, r4, r0
/* 0CD330 800D0330 D8010028 */  stfd      f0, 0x28(r1)
/* 0CD334 800D0334 7CE50214 */  add       r7, r5, r0
/* 0CD338 800D0338 54E3657E */  extrwi    r3, r7, 11, 1
/* 0CD33C 800D033C 38C3FC01 */  subi      r6, r3, 0x3ff
/* 0CD340 800D0340 3804FFFF */  subi      r0, r4, 0x1
/* 0CD344 800D0344 7C003630 */  sraw      r0, r0, r6
/* 0CD348 800D0348 7CE30078 */  andc      r3, r7, r0
/* 0CD34C 800D034C 54E0033E */  clrlwi    r0, r7, 12
/* 0CD350 800D0350 90610028 */  stw       r3, 0x28(r1)
/* 0CD354 800D0354 64030010 */  oris      r3, r0, 0x10
/* 0CD358 800D0358 20060014 */  subfic    r0, r6, 0x14
/* 0CD35C 800D035C 2C050000 */  cmpwi     r5, 0x0
/* 0CD360 800D0360 7C630630 */  sraw      r3, r3, r0
/* 0CD364 800D0364 40800008 */  bge       lbl_800D036C
/* 0CD368 800D0368 7C6300D0 */  neg       r3, r3
lbl_800D036C:
/* 0CD36C 800D036C C8210040 */  lfd       f1, 0x40(r1)
/* 0CD370 800D0370 C8010028 */  lfd       f0, 0x28(r1)
/* 0CD374 800D0374 FC010028 */  fsub      f0, f1, f0
/* 0CD378 800D0378 D8010040 */  stfd      f0, 0x40(r1)
lbl_800D037C:
/* 0CD37C 800D037C C8410040 */  lfd       f2, 0x40(r1)
/* 0CD380 800D0380 38000000 */  li        r0, 0x0
/* 0CD384 800D0384 C8228630 */  lfd       f1, D_8018C570@sda21(r0)
/* 0CD388 800D0388 5464A016 */  slwi      r4, r3, 20
/* 0CD38C 800D038C FC08102A */  fadd      f0, f8, f2
/* 0CD390 800D0390 C9428620 */  lfd       f10, D_8018C560@sda21(r0)
/* 0CD394 800D0394 C9228628 */  lfd       f9, D_8018C568@sda21(r0)
/* 0CD398 800D0398 D8010028 */  stfd      f0, 0x28(r1)
/* 0CD39C 800D039C C8C28658 */  lfd       f6, D_8018C598@sda21(r0)
/* 0CD3A0 800D03A0 9001002C */  stw       r0, 0x2c(r1)
/* 0CD3A4 800D03A4 C8028650 */  lfd       f0, D_8018C590@sda21(r0)
/* 0CD3A8 800D03A8 C9610028 */  lfd       f11, 0x28(r1)
/* 0CD3AC 800D03AC C8A28648 */  lfd       f5, D_8018C588@sda21(r0)
/* 0CD3B0 800D03B0 FC6B1028 */  fsub      f3, f11, f2
/* 0CD3B4 800D03B4 C8828640 */  lfd       f4, D_8018C580@sda21(r0)
/* 0CD3B8 800D03B8 FCE102F2 */  fmul      f7, f1, f11
/* 0CD3BC 800D03BC C8428638 */  lfd       f2, D_8018C578@sda21(r0)
/* 0CD3C0 800D03C0 C8228660 */  lfd       f1, D_8018C5A0@sda21(r0)
/* 0CD3C4 800D03C4 FD081828 */  fsub      f8, f8, f3
/* 0CD3C8 800D03C8 C8628560 */  lfd       f3, D_8018C4A0@sda21(r0)
/* 0CD3CC 800D03CC FD4A02F2 */  fmul      f10, f10, f11
/* 0CD3D0 800D03D0 FD693A3A */  fmadd     f11, f9, f8, f7
/* 0CD3D4 800D03D4 FCEA582A */  fadd      f7, f10, f11
/* 0CD3D8 800D03D8 D8E10050 */  stfd      f7, 0x50(r1)
/* 0CD3DC 800D03DC C9210050 */  lfd       f9, 0x50(r1)
/* 0CD3E0 800D03E0 FCE90272 */  fmul      f7, f9, f9
/* 0CD3E4 800D03E4 FD095028 */  fsub      f8, f9, f10
/* 0CD3E8 800D03E8 D8E10028 */  stfd      f7, 0x28(r1)
/* 0CD3EC 800D03EC FD0B4028 */  fsub      f8, f11, f8
/* 0CD3F0 800D03F0 C8E10028 */  lfd       f7, 0x28(r1)
/* 0CD3F4 800D03F4 FCC601FA */  fmadd     f6, f6, f7, f0
/* 0CD3F8 800D03F8 FC09423A */  fmadd     f0, f9, f8, f8
/* 0CD3FC 800D03FC FCA729BA */  fmadd     f5, f7, f6, f5
/* 0CD400 800D0400 FC87217A */  fmadd     f4, f7, f5, f4
/* 0CD404 800D0404 FC47113A */  fmadd     f2, f7, f4, f2
/* 0CD408 800D0408 FC4700B2 */  fmul      f2, f7, f2
/* 0CD40C 800D040C FC491028 */  fsub      f2, f9, f2
/* 0CD410 800D0410 D8410030 */  stfd      f2, 0x30(r1)
/* 0CD414 800D0414 C8810030 */  lfd       f4, 0x30(r1)
/* 0CD418 800D0418 FC490132 */  fmul      f2, f9, f4
/* 0CD41C 800D041C FC240828 */  fsub      f1, f4, f1
/* 0CD420 800D0420 FC220824 */  fdiv      f1, f2, f1
/* 0CD424 800D0424 FC010028 */  fsub      f0, f1, f0
/* 0CD428 800D0428 FC004828 */  fsub      f0, f0, f9
/* 0CD42C 800D042C FC030028 */  fsub      f0, f3, f0
/* 0CD430 800D0430 D8010050 */  stfd      f0, 0x50(r1)
/* 0CD434 800D0434 80010050 */  lwz       r0, 0x50(r1)
/* 0CD438 800D0438 7C002214 */  add       r0, r0, r4
/* 0CD43C 800D043C 7C00A671 */  srawi.    r0, r0, 20
/* 0CD440 800D0440 41810014 */  bgt       lbl_800D0454
/* 0CD444 800D0444 C8210050 */  lfd       f1, 0x50(r1)
/* 0CD448 800D0448 48000039 */  bl        scalbn
/* 0CD44C 800D044C D8210050 */  stfd      f1, 0x50(r1)
/* 0CD450 800D0450 48000010 */  b         lbl_800D0460
lbl_800D0454:
/* 0CD454 800D0454 80010050 */  lwz       r0, 0x50(r1)
/* 0CD458 800D0458 7C002214 */  add       r0, r0, r4
/* 0CD45C 800D045C 90010050 */  stw       r0, 0x50(r1)
lbl_800D0460:
/* 0CD460 800D0460 C8010050 */  lfd       f0, 0x50(r1)
/* 0CD464 800D0464 FC3F0032 */  fmul      f1, f31, f0
lbl_800D0468:
/* 0CD468 800D0468 BB210064 */  lmw       r25, 0x64(r1)
/* 0CD46C 800D046C 8001008C */  lwz       r0, 0x8c(r1)
/* 0CD470 800D0470 CBE10080 */  lfd       f31, 0x80(r1)
/* 0CD474 800D0474 38210088 */  addi      r1, r1, 0x88
/* 0CD478 800D0478 7C0803A6 */  mtlr      r0
/* 0CD47C 800D047C 4E800020 */  blr

glabel scalbn
/* 0CD480 800D0480 7C0802A6 */  mflr      r0
/* 0CD484 800D0484 90010004 */  stw       r0, 0x4(r1)
/* 0CD488 800D0488 9421FFF8 */  stwu      r1, -0x8(r1)
/* 0CD48C 800D048C 48000431 */  bl        ldexp
/* 0CD490 800D0490 8001000C */  lwz       r0, 0xc(r1)
/* 0CD494 800D0494 38210008 */  addi      r1, r1, 0x8
/* 0CD498 800D0498 7C0803A6 */  mtlr      r0
/* 0CD49C 800D049C 4E800020 */  blr

# 0x800D22A0 - 0x800D22D0
.section .rodata, "a"

.balign 8

glabel D_800D22A0
	.double 1
	.double 1.5
	.double 0
	.double 0.5849624872207642
	.double 0
	.double 0.00000001350039202129749

# 0x8018C4A0 - 0x8018C5B0
.section .sdata2, "a"

glabel D_8018C4A0
	.double 1

glabel D_8018C4A8
	.double 0

glabel D_8018C4B0
	.double inf

glabel D_8018C4B8
	.double 1.4426950216293335

glabel D_8018C4C0
	.double 0.000000019259629911266175

glabel D_8018C4C8
	.double 1.4426950408889634

glabel D_8018C4D0
	.double 0.5

glabel D_8018C4D8
	.double 0.3333333333333333

glabel D_8018C4E0
	.double 0.25

glabel D_8018C4E8
	.double 9007199254740992

glabel D_8018C4F0
	.double 0.5999999999999946

glabel D_8018C4F8
	.double 0.4285714285785502

glabel D_8018C500
	.double 0.33333332981837743

glabel D_8018C508
	.double 0.272728123808534

glabel D_8018C510
	.double 0.23066074577556175

glabel D_8018C518
	.double 0.20697501780033842

glabel D_8018C520
	.double 3

glabel D_8018C528
	.double 0.9617967009544373

glabel D_8018C530
	.double -0.000000007028461650952758

glabel D_8018C538
	.double 0.9617966939259756

glabel D_8018C540
	.double -1

glabel D_8018C548
	.double 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

glabel D_8018C550
	.double 0.00000000000000008008566259537294

glabel D_8018C558
	.double 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001

glabel D_8018C560
	.double 0.6931471824645996

glabel D_8018C568
	.double 0.6931471805599453

glabel D_8018C570
	.double -0.000000001904654299957768

glabel D_8018C578
	.double 0.16666666666666602

glabel D_8018C580
	.double -0.0027777777777015593

glabel D_8018C588
	.double 0.00006613756321437934

glabel D_8018C590
	.double -0.0000016533902205465252

glabel D_8018C598
	.double 0.000000041381367970572385

glabel D_8018C5A0
	.double 2

glabel D_8018C5A8
	.double 4503601774854144
