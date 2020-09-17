# e_pow.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __ieee754_pow
/* 0CBAF0 800D1090 7C0802A6 */  mflr	r0
/* 0CBAF4 800D1094 3C60800D */  lis		r3, bp@ha
/* 0CBAF8 800D1098 90010004 */  stw		r0, 4(r1)
/* 0CBAFC 800D109C 9421FF78 */  stwu	r1, -0x88(r1)
/* 0CBB00 800D10A0 DBE10080 */  stfd	f31, 0x80(r1)
/* 0CBB04 800D10A4 BF210064 */  stmw	r25, 0x64(r1)
/* 0CBB08 800D10A8 3BE336C0 */  addi	r31, r3, bp@l
/* 0CBB0C 800D10AC D8410010 */  stfd	f2, 0x10(r1)
/* 0CBB10 800D10B0 83A10010 */  lwz		r29, 0x10(r1)
/* 0CBB14 800D10B4 D8210008 */  stfd	f1, 8(r1)
/* 0CBB18 800D10B8 80810014 */  lwz		r4, 0x14(r1)
/* 0CBB1C 800D10BC 57BC007E */  clrlwi	r28, r29, 1
/* 0CBB20 800D10C0 83C10008 */  lwz		r30, 8(r1)
/* 0CBB24 800D10C4 7F802379 */  or.		r0, r28, r4
/* 0CBB28 800D10C8 8321000C */  lwz		r25, 0xc(r1)
/* 0CBB2C 800D10CC 57DA007E */  clrlwi	r26, r30, 1
/* 0CBB30 800D10D0 4082000C */  bne		lbl_800D10DC
/* 0CBB34 800D10D4 C8228570 */  lfd		f1, D_80136270-_SDA2_BASE_(r2)
/* 0CBB38 800D10D8 480007B8 */  b		lbl_800D1890
lbl_800D10DC:
/* 0CBB3C 800D10DC 3C007FF0 */  lis		r0, 0x7ff0
/* 0CBB40 800D10E0 7C1A0000 */  cmpw	r26, r0
/* 0CBB44 800D10E4 41810038 */  bgt		lbl_800D111C
/* 0CBB48 800D10E8 3C1A8010 */  addis	r0, r26, 0x8010
/* 0CBB4C 800D10EC 28000000 */  cmplwi	r0, 0
/* 0CBB50 800D10F0 4082000C */  bne		lbl_800D10FC
/* 0CBB54 800D10F4 28190000 */  cmplwi	r25, 0
/* 0CBB58 800D10F8 40820024 */  bne		lbl_800D111C
lbl_800D10FC:
/* 0CBB5C 800D10FC 3C007FF0 */  lis		r0, 0x7ff0
/* 0CBB60 800D1100 7C1C0000 */  cmpw	r28, r0
/* 0CBB64 800D1104 41810018 */  bgt		lbl_800D111C
/* 0CBB68 800D1108 3C1C8010 */  addis	r0, r28, 0x8010
/* 0CBB6C 800D110C 28000000 */  cmplwi	r0, 0
/* 0CBB70 800D1110 4082001C */  bne		lbl_800D112C
/* 0CBB74 800D1114 28040000 */  cmplwi	r4, 0
/* 0CBB78 800D1118 41820014 */  beq		lbl_800D112C
lbl_800D111C:
/* 0CBB7C 800D111C C8210008 */  lfd		f1, 8(r1)
/* 0CBB80 800D1120 C8010010 */  lfd		f0, 0x10(r1)
/* 0CBB84 800D1124 FC21002A */  fadd	f1, f1, f0
/* 0CBB88 800D1128 48000768 */  b		lbl_800D1890
lbl_800D112C:
/* 0CBB8C 800D112C 2C1E0000 */  cmpwi	r30, 0
/* 0CBB90 800D1130 3B600000 */  li		r27, 0
/* 0CBB94 800D1134 40800078 */  bge		lbl_800D11AC
/* 0CBB98 800D1138 3C004340 */  lis		r0, 0x4340
/* 0CBB9C 800D113C 7C1C0000 */  cmpw	r28, r0
/* 0CBBA0 800D1140 4180000C */  blt		lbl_800D114C
/* 0CBBA4 800D1144 3B600002 */  li		r27, 2
/* 0CBBA8 800D1148 48000064 */  b		lbl_800D11AC
lbl_800D114C:
/* 0CBBAC 800D114C 3C003FF0 */  lis		r0, 0x3ff0
/* 0CBBB0 800D1150 7C1C0000 */  cmpw	r28, r0
/* 0CBBB4 800D1154 41800058 */  blt		lbl_800D11AC
/* 0CBBB8 800D1158 7F83A670 */  srawi	r3, r28, 0x14
/* 0CBBBC 800D115C 3803FC01 */  addi	r0, r3, -1023
/* 0CBBC0 800D1160 2C000014 */  cmpwi	r0, 0x14
/* 0CBBC4 800D1164 40810024 */  ble		lbl_800D1188
/* 0CBBC8 800D1168 20000034 */  subfic	r0, r0, 0x34
/* 0CBBCC 800D116C 7C830430 */  srw		r3, r4, r0
/* 0CBBD0 800D1170 7C600030 */  slw		r0, r3, r0
/* 0CBBD4 800D1174 7C040040 */  cmplw	r4, r0
/* 0CBBD8 800D1178 40820034 */  bne		lbl_800D11AC
/* 0CBBDC 800D117C 546007FE */  clrlwi	r0, r3, 0x1f
/* 0CBBE0 800D1180 23600002 */  subfic	r27, r0, 2
/* 0CBBE4 800D1184 48000028 */  b		lbl_800D11AC
lbl_800D1188:
/* 0CBBE8 800D1188 28040000 */  cmplwi	r4, 0
/* 0CBBEC 800D118C 40820020 */  bne		lbl_800D11AC
/* 0CBBF0 800D1190 20000014 */  subfic	r0, r0, 0x14
/* 0CBBF4 800D1194 7F830630 */  sraw	r3, r28, r0
/* 0CBBF8 800D1198 7C600030 */  slw		r0, r3, r0
/* 0CBBFC 800D119C 7C1C0000 */  cmpw	r28, r0
/* 0CBC00 800D11A0 4082000C */  bne		lbl_800D11AC
/* 0CBC04 800D11A4 546007FE */  clrlwi	r0, r3, 0x1f
/* 0CBC08 800D11A8 23600002 */  subfic	r27, r0, 2
lbl_800D11AC:
/* 0CBC0C 800D11AC 28040000 */  cmplwi	r4, 0
/* 0CBC10 800D11B0 408200CC */  bne		lbl_800D127C
/* 0CBC14 800D11B4 3C1C8010 */  addis	r0, r28, 0x8010
/* 0CBC18 800D11B8 28000000 */  cmplwi	r0, 0
/* 0CBC1C 800D11BC 4082005C */  bne		lbl_800D1218
/* 0CBC20 800D11C0 3C1AC010 */  addis	r0, r26, 0xc010
/* 0CBC24 800D11C4 7C00CB79 */  or.		r0, r0, r25
/* 0CBC28 800D11C8 40820010 */  bne		lbl_800D11D8
/* 0CBC2C 800D11CC C8010010 */  lfd		f0, 0x10(r1)
/* 0CBC30 800D11D0 FC200028 */  fsub	f1, f0, f0
/* 0CBC34 800D11D4 480006BC */  b		lbl_800D1890
lbl_800D11D8:
/* 0CBC38 800D11D8 3C003FF0 */  lis		r0, 0x3ff0
/* 0CBC3C 800D11DC 7C1A0000 */  cmpw	r26, r0
/* 0CBC40 800D11E0 4180001C */  blt		lbl_800D11FC
/* 0CBC44 800D11E4 2C1D0000 */  cmpwi	r29, 0
/* 0CBC48 800D11E8 4180000C */  blt		lbl_800D11F4
/* 0CBC4C 800D11EC C8210010 */  lfd		f1, 0x10(r1)
/* 0CBC50 800D11F0 480006A0 */  b		lbl_800D1890
lbl_800D11F4:
/* 0CBC54 800D11F4 C8228578 */  lfd		f1, D_80136278-_SDA2_BASE_(r2)
/* 0CBC58 800D11F8 48000698 */  b		lbl_800D1890
lbl_800D11FC:
/* 0CBC5C 800D11FC 2C1D0000 */  cmpwi	r29, 0
/* 0CBC60 800D1200 40800010 */  bge		lbl_800D1210
/* 0CBC64 800D1204 C8010010 */  lfd		f0, 0x10(r1)
/* 0CBC68 800D1208 FC200050 */  fneg	f1, f0
/* 0CBC6C 800D120C 48000684 */  b		lbl_800D1890
lbl_800D1210:
/* 0CBC70 800D1210 C8228578 */  lfd		f1, D_80136278-_SDA2_BASE_(r2)
/* 0CBC74 800D1214 4800067C */  b		lbl_800D1890
lbl_800D1218:
/* 0CBC78 800D1218 3C1CC010 */  addis	r0, r28, 0xc010
/* 0CBC7C 800D121C 28000000 */  cmplwi	r0, 0
/* 0CBC80 800D1220 40820024 */  bne		lbl_800D1244
/* 0CBC84 800D1224 2C1D0000 */  cmpwi	r29, 0
/* 0CBC88 800D1228 40800014 */  bge		lbl_800D123C
/* 0CBC8C 800D122C C8228570 */  lfd		f1, D_80136270-_SDA2_BASE_(r2)
/* 0CBC90 800D1230 C8010008 */  lfd		f0, 8(r1)
/* 0CBC94 800D1234 FC210024 */  fdiv	f1, f1, f0
/* 0CBC98 800D1238 48000658 */  b		lbl_800D1890
lbl_800D123C:
/* 0CBC9C 800D123C C8210008 */  lfd		f1, 8(r1)
/* 0CBCA0 800D1240 48000650 */  b		lbl_800D1890
lbl_800D1244:
/* 0CBCA4 800D1244 3C1DC000 */  addis	r0, r29, 0xc000
/* 0CBCA8 800D1248 28000000 */  cmplwi	r0, 0
/* 0CBCAC 800D124C 40820010 */  bne		lbl_800D125C
/* 0CBCB0 800D1250 C8010008 */  lfd		f0, 8(r1)
/* 0CBCB4 800D1254 FC200032 */  fmul	f1, f0, f0
/* 0CBCB8 800D1258 48000638 */  b		lbl_800D1890
lbl_800D125C:
/* 0CBCBC 800D125C 3C1DC020 */  addis	r0, r29, 0xc020
/* 0CBCC0 800D1260 28000000 */  cmplwi	r0, 0
/* 0CBCC4 800D1264 40820018 */  bne		lbl_800D127C
/* 0CBCC8 800D1268 2C1E0000 */  cmpwi	r30, 0
/* 0CBCCC 800D126C 41800010 */  blt		lbl_800D127C
/* 0CBCD0 800D1270 C8210008 */  lfd		f1, 8(r1)
/* 0CBCD4 800D1274 480011D1 */  bl		sqrt
/* 0CBCD8 800D1278 48000618 */  b		lbl_800D1890
lbl_800D127C:
/* 0CBCDC 800D127C C8210008 */  lfd		f1, 8(r1)
/* 0CBCE0 800D1280 4BFFFE09 */  bl		fabs__Fd
/* 0CBCE4 800D1284 28190000 */  cmplwi	r25, 0
/* 0CBCE8 800D1288 D8210048 */  stfd	f1, 0x48(r1)
/* 0CBCEC 800D128C 40820084 */  bne		lbl_800D1310
/* 0CBCF0 800D1290 3C1A8010 */  addis	r0, r26, 0x8010
/* 0CBCF4 800D1294 28000000 */  cmplwi	r0, 0
/* 0CBCF8 800D1298 41820018 */  beq		lbl_800D12B0
/* 0CBCFC 800D129C 2C1A0000 */  cmpwi	r26, 0
/* 0CBD00 800D12A0 41820010 */  beq		lbl_800D12B0
/* 0CBD04 800D12A4 3C1AC010 */  addis	r0, r26, 0xc010
/* 0CBD08 800D12A8 28000000 */  cmplwi	r0, 0
/* 0CBD0C 800D12AC 40820064 */  bne		lbl_800D1310
lbl_800D12B0:
/* 0CBD10 800D12B0 C8210048 */  lfd		f1, 0x48(r1)
/* 0CBD14 800D12B4 2C1D0000 */  cmpwi	r29, 0
/* 0CBD18 800D12B8 D8210050 */  stfd	f1, 0x50(r1)
/* 0CBD1C 800D12BC 40800010 */  bge		lbl_800D12CC
/* 0CBD20 800D12C0 C8028570 */  lfd		f0, D_80136270-_SDA2_BASE_(r2)
/* 0CBD24 800D12C4 FC000824 */  fdiv	f0, f0, f1
/* 0CBD28 800D12C8 D8010050 */  stfd	f0, 0x50(r1)
lbl_800D12CC:
/* 0CBD2C 800D12CC 2C1E0000 */  cmpwi	r30, 0
/* 0CBD30 800D12D0 40800038 */  bge		lbl_800D1308
/* 0CBD34 800D12D4 3C1AC010 */  addis	r0, r26, 0xc010
/* 0CBD38 800D12D8 7C00DB79 */  or.		r0, r0, r27
/* 0CBD3C 800D12DC 40820018 */  bne		lbl_800D12F4
/* 0CBD40 800D12E0 C8010050 */  lfd		f0, 0x50(r1)
/* 0CBD44 800D12E4 FC000028 */  fsub	f0, f0, f0
/* 0CBD48 800D12E8 FC000024 */  fdiv	f0, f0, f0
/* 0CBD4C 800D12EC D8010050 */  stfd	f0, 0x50(r1)
/* 0CBD50 800D12F0 48000018 */  b		lbl_800D1308
lbl_800D12F4:
/* 0CBD54 800D12F4 2C1B0001 */  cmpwi	r27, 1
/* 0CBD58 800D12F8 40820010 */  bne		lbl_800D1308
/* 0CBD5C 800D12FC C8010050 */  lfd		f0, 0x50(r1)
/* 0CBD60 800D1300 FC000050 */  fneg	f0, f0
/* 0CBD64 800D1304 D8010050 */  stfd	f0, 0x50(r1)
lbl_800D1308:
/* 0CBD68 800D1308 C8210050 */  lfd		f1, 0x50(r1)
/* 0CBD6C 800D130C 48000584 */  b		lbl_800D1890
lbl_800D1310:
/* 0CBD70 800D1310 7FC3FE70 */  srawi	r3, r30, 0x1f
/* 0CBD74 800D1314 38030001 */  addi	r0, r3, 1
/* 0CBD78 800D1318 7C03DB79 */  or.		r3, r0, r27
/* 0CBD7C 800D131C 40820018 */  bne		lbl_800D1334
/* 0CBD80 800D1320 38000021 */  li		r0, 0x21
/* 0CBD84 800D1324 900D8FF8 */  stw		r0, errno-_SDA_BASE_(r13)
/* 0CBD88 800D1328 3C60800F */  lis		r3, __float_nan@ha
/* 0CBD8C 800D132C C0233E78 */  lfs		f1, __float_nan@l(r3)
/* 0CBD90 800D1330 48000560 */  b		lbl_800D1890
lbl_800D1334:
/* 0CBD94 800D1334 3C6041E0 */  lis		r3, 0x41e0
/* 0CBD98 800D1338 7C1C1800 */  cmpw	r28, r3
/* 0CBD9C 800D133C 40810108 */  ble		lbl_800D1444
/* 0CBDA0 800D1340 3C6043F0 */  lis		r3, 0x43f0
/* 0CBDA4 800D1344 7C1C1800 */  cmpw	r28, r3
/* 0CBDA8 800D1348 4081004C */  ble		lbl_800D1394
/* 0CBDAC 800D134C 3C603FF0 */  lis		r3, 0x3ff0
/* 0CBDB0 800D1350 3883FFFF */  addi	r4, r3, -1
/* 0CBDB4 800D1354 7C1A2000 */  cmpw	r26, r4
/* 0CBDB8 800D1358 4181001C */  bgt		lbl_800D1374
/* 0CBDBC 800D135C 2C1D0000 */  cmpwi	r29, 0
/* 0CBDC0 800D1360 4080000C */  bge		lbl_800D136C
/* 0CBDC4 800D1364 C8228580 */  lfd		f1, D_80136280-_SDA2_BASE_(r2)
/* 0CBDC8 800D1368 48000528 */  b		lbl_800D1890
lbl_800D136C:
/* 0CBDCC 800D136C C8228578 */  lfd		f1, D_80136278-_SDA2_BASE_(r2)
/* 0CBDD0 800D1370 48000520 */  b		lbl_800D1890
lbl_800D1374:
/* 0CBDD4 800D1374 7C1A1800 */  cmpw	r26, r3
/* 0CBDD8 800D1378 4180001C */  blt		lbl_800D1394
/* 0CBDDC 800D137C 2C1D0000 */  cmpwi	r29, 0
/* 0CBDE0 800D1380 4081000C */  ble		lbl_800D138C
/* 0CBDE4 800D1384 C8228580 */  lfd		f1, D_80136280-_SDA2_BASE_(r2)
/* 0CBDE8 800D1388 48000508 */  b		lbl_800D1890
lbl_800D138C:
/* 0CBDEC 800D138C C8228578 */  lfd		f1, D_80136278-_SDA2_BASE_(r2)
/* 0CBDF0 800D1390 48000500 */  b		lbl_800D1890
lbl_800D1394:
/* 0CBDF4 800D1394 3C603FF0 */  lis		r3, 0x3ff0
/* 0CBDF8 800D1398 3883FFFF */  addi	r4, r3, -1
/* 0CBDFC 800D139C 7C1A2000 */  cmpw	r26, r4
/* 0CBE00 800D13A0 4080001C */  bge		lbl_800D13BC
/* 0CBE04 800D13A4 2C1D0000 */  cmpwi	r29, 0
/* 0CBE08 800D13A8 4080000C */  bge		lbl_800D13B4
/* 0CBE0C 800D13AC C8228580 */  lfd		f1, D_80136280-_SDA2_BASE_(r2)
/* 0CBE10 800D13B0 480004E0 */  b		lbl_800D1890
lbl_800D13B4:
/* 0CBE14 800D13B4 C8228578 */  lfd		f1, D_80136278-_SDA2_BASE_(r2)
/* 0CBE18 800D13B8 480004D8 */  b		lbl_800D1890
lbl_800D13BC:
/* 0CBE1C 800D13BC 7C1A1800 */  cmpw	r26, r3
/* 0CBE20 800D13C0 4081001C */  ble		lbl_800D13DC
/* 0CBE24 800D13C4 2C1D0000 */  cmpwi	r29, 0
/* 0CBE28 800D13C8 4081000C */  ble		lbl_800D13D4
/* 0CBE2C 800D13CC C8228580 */  lfd		f1, D_80136280-_SDA2_BASE_(r2)
/* 0CBE30 800D13D0 480004C0 */  b		lbl_800D1890
lbl_800D13D4:
/* 0CBE34 800D13D4 C8228578 */  lfd		f1, D_80136278-_SDA2_BASE_(r2)
/* 0CBE38 800D13D8 480004B8 */  b		lbl_800D1890
lbl_800D13DC:
/* 0CBE3C 800D13DC C8210008 */  lfd		f1, 8(r1)
/* 0CBE40 800D13E0 38600000 */  li		r3, 0
/* 0CBE44 800D13E4 C8028570 */  lfd		f0, D_80136270-_SDA2_BASE_(r2)
/* 0CBE48 800D13E8 C84285B0 */  lfd		f2, D_801362B0-_SDA2_BASE_(r2)
/* 0CBE4C 800D13EC FC810028 */  fsub	f4, f1, f0
/* 0CBE50 800D13F0 C82285A8 */  lfd		f1, D_801362A8-_SDA2_BASE_(r2)
/* 0CBE54 800D13F4 C80285A0 */  lfd		f0, D_801362A0-_SDA2_BASE_(r2)
/* 0CBE58 800D13F8 C8628598 */  lfd		f3, D_80136298-_SDA2_BASE_(r2)
/* 0CBE5C 800D13FC D8810028 */  stfd	f4, 0x28(r1)
/* 0CBE60 800D1400 C8A28588 */  lfd		f5, D_80136288-_SDA2_BASE_(r2)
/* 0CBE64 800D1404 C8C10028 */  lfd		f6, 0x28(r1)
/* 0CBE68 800D1408 C8828590 */  lfd		f4, D_80136290-_SDA2_BASE_(r2)
/* 0CBE6C 800D140C FC2209BC */  fnmsub	f1, f2, f6, f1
/* 0CBE70 800D1410 FC4601B2 */  fmul	f2, f6, f6
/* 0CBE74 800D1414 FC06007C */  fnmsub	f0, f6, f1, f0
/* 0CBE78 800D1418 FC2501B2 */  fmul	f1, f5, f6
/* 0CBE7C 800D141C FC020032 */  fmul	f0, f2, f0
/* 0CBE80 800D1420 FC030032 */  fmul	f0, f3, f0
/* 0CBE84 800D1424 FC4401B8 */  fmsub	f2, f4, f6, f0
/* 0CBE88 800D1428 FC01102A */  fadd	f0, f1, f2
/* 0CBE8C 800D142C D8010030 */  stfd	f0, 0x30(r1)
/* 0CBE90 800D1430 90610034 */  stw		r3, 0x34(r1)
/* 0CBE94 800D1434 C8010030 */  lfd		f0, 0x30(r1)
/* 0CBE98 800D1438 FC000828 */  fsub	f0, f0, f1
/* 0CBE9C 800D143C FC020028 */  fsub	f0, f2, f0
/* 0CBEA0 800D1440 480001F0 */  b		lbl_800D1630
lbl_800D1444:
/* 0CBEA4 800D1444 3C600010 */  lis		r3, 0x10
/* 0CBEA8 800D1448 7C1A1800 */  cmpw	r26, r3
/* 0CBEAC 800D144C 39000000 */  li		r8, 0
/* 0CBEB0 800D1450 4080001C */  bge		lbl_800D146C
/* 0CBEB4 800D1454 C8210048 */  lfd		f1, 0x48(r1)
/* 0CBEB8 800D1458 3900FFCB */  li		r8, -53
/* 0CBEBC 800D145C C80285B8 */  lfd		f0, D_801362B8-_SDA2_BASE_(r2)
/* 0CBEC0 800D1460 FC010032 */  fmul	f0, f1, f0
/* 0CBEC4 800D1464 D8010048 */  stfd	f0, 0x48(r1)
/* 0CBEC8 800D1468 83410048 */  lwz		r26, 0x48(r1)
lbl_800D146C:
/* 0CBECC 800D146C 3C600004 */  lis		r3, 4
/* 0CBED0 800D1470 5745033E */  clrlwi	r5, r26, 0xc
/* 0CBED4 800D1474 3863988E */  addi	r3, r3, -26482
/* 0CBED8 800D1478 7F44A670 */  srawi	r4, r26, 0x14
/* 0CBEDC 800D147C 7D044214 */  add		r8, r4, r8
/* 0CBEE0 800D1480 7C051800 */  cmpw	r5, r3
/* 0CBEE4 800D1484 64A43FF0 */  oris	r4, r5, 0x3ff0
/* 0CBEE8 800D1488 3908FC01 */  addi	r8, r8, -1023
/* 0CBEEC 800D148C 4181000C */  bgt		lbl_800D1498
/* 0CBEF0 800D1490 38E00000 */  li		r7, 0
/* 0CBEF4 800D1494 48000028 */  b		lbl_800D14BC
lbl_800D1498:
/* 0CBEF8 800D1498 3C60000C */  lis		r3, 0xc
/* 0CBEFC 800D149C 3863B67A */  addi	r3, r3, -18822
/* 0CBF00 800D14A0 7C051800 */  cmpw	r5, r3
/* 0CBF04 800D14A4 4080000C */  bge		lbl_800D14B0
/* 0CBF08 800D14A8 38E00001 */  li		r7, 1
/* 0CBF0C 800D14AC 48000010 */  b		lbl_800D14BC
lbl_800D14B0:
/* 0CBF10 800D14B0 3C84FFF0 */  addis	r4, r4, 0xfff0
/* 0CBF14 800D14B4 38E00000 */  li		r7, 0
/* 0CBF18 800D14B8 39080001 */  addi	r8, r8, 1
lbl_800D14BC:
/* 0CBF1C 800D14BC 90810048 */  stw		r4, 0x48(r1)
/* 0CBF20 800D14C0 54E31838 */  slwi	r3, r7, 3
/* 0CBF24 800D14C4 7CDF1A14 */  add		r6, r31, r3
/* 0CBF28 800D14C8 C8428570 */  lfd		f2, D_80136270-_SDA2_BASE_(r2)
/* 0CBF2C 800D14CC C9610048 */  lfd		f11, 0x48(r1)
/* 0CBF30 800D14D0 C8660000 */  lfd		f3, 0(r6)
/* 0CBF34 800D14D4 7C830E70 */  srawi	r3, r4, 1
/* 0CBF38 800D14D8 C8028578 */  lfd		f0, D_80136278-_SDA2_BASE_(r2)
/* 0CBF3C 800D14DC 64632000 */  oris	r3, r3, 0x2000
/* 0CBF40 800D14E0 FC2B182A */  fadd	f1, f11, f3
/* 0CBF44 800D14E4 FD0B1828 */  fsub	f8, f11, f3
/* 0CBF48 800D14E8 3CA30008 */  addis	r5, r3, 8
/* 0CBF4C 800D14EC 54E3901A */  slwi	r3, r7, 0x12
/* 0CBF50 800D14F0 D8010018 */  stfd	f0, 0x18(r1)
/* 0CBF54 800D14F4 FDA20824 */  fdiv	f13, f2, f1
/* 0CBF58 800D14F8 7C651A14 */  add		r3, r5, r3
/* 0CBF5C 800D14FC C88285E8 */  lfd		f4, D_801362E8-_SDA2_BASE_(r2)
/* 0CBF60 800D1500 90610018 */  stw		r3, 0x18(r1)
/* 0CBF64 800D1504 6D048000 */  xoris	r4, r8, 0x8000
/* 0CBF68 800D1508 FC080372 */  fmul	f0, f8, f13
/* 0CBF6C 800D150C C86285E0 */  lfd		f3, D_801362E0-_SDA2_BASE_(r2)
/* 0CBF70 800D1510 C82285D8 */  lfd		f1, D_801362D8-_SDA2_BASE_(r2)
/* 0CBF74 800D1514 38A00000 */  li		r5, 0
/* 0CBF78 800D1518 C84285D0 */  lfd		f2, D_801362D0-_SDA2_BASE_(r2)
/* 0CBF7C 800D151C FFE00032 */  fmul	f31, f0, f0
/* 0CBF80 800D1520 D8010020 */  stfd	f0, 0x20(r1)
/* 0CBF84 800D1524 C8C10018 */  lfd		f6, 0x18(r1)
/* 0CBF88 800D1528 3C604330 */  lis		r3, 0x4330
/* 0CBF8C 800D152C 90A10024 */  stw		r5, 0x24(r1)
/* 0CBF90 800D1530 FC641FFA */  fmadd	f3, f4, f31, f3
/* 0CBF94 800D1534 C8860000 */  lfd		f4, 0(r6)
/* 0CBF98 800D1538 C9810020 */  lfd		f12, 0x20(r1)
/* 0CBF9C 800D153C FD462028 */  fsub	f10, f6, f4
/* 0CBFA0 800D1540 9081005C */  stw		r4, 0x5c(r1)
/* 0CBFA4 800D1544 FC7F08FA */  fmadd	f3, f31, f3, f1
/* 0CBFA8 800D1548 C82285C8 */  lfd		f1, D_801362C8-_SDA2_BASE_(r2)
/* 0CBFAC 800D154C C8A285C0 */  lfd		f5, D_801362C0-_SDA2_BASE_(r2)
/* 0CBFB0 800D1550 FD2C41BC */  fnmsub	f9, f12, f6, f8
/* 0CBFB4 800D1554 C8E285F0 */  lfd		f7, D_801362F0-_SDA2_BASE_(r2)
/* 0CBFB8 800D1558 FC5F10FA */  fmadd	f2, f31, f3, f2
/* 0CBFBC 800D155C 90610058 */  stw		r3, 0x58(r1)
/* 0CBFC0 800D1560 C8628608 */  lfd		f3, D_80136308-_SDA2_BASE_(r2)
/* 0CBFC4 800D1564 FD4B5028 */  fsub	f10, f11, f10
/* 0CBFC8 800D1568 C8828600 */  lfd		f4, D_80136300-_SDA2_BASE_(r2)
/* 0CBFCC 800D156C FD1F08BA */  fmadd	f8, f31, f2, f1
/* 0CBFD0 800D1570 C8428678 */  lfd		f2, D_80136378-_SDA2_BASE_(r2)
/* 0CBFD4 800D1574 C8210058 */  lfd		f1, 0x58(r1)
/* 0CBFD8 800D1578 FD4C4ABC */  fnmsub	f10, f12, f10, f9
/* 0CBFDC 800D157C C8C285F8 */  lfd		f6, D_801362F8-_SDA2_BASE_(r2)
/* 0CBFE0 800D1580 FCBF2A3A */  fmadd	f5, f31, f8, f5
/* 0CBFE4 800D1584 FD3F07F2 */  fmul	f9, f31, f31
/* 0CBFE8 800D1588 FD4D02B2 */  fmul	f10, f13, f10
/* 0CBFEC 800D158C FD290172 */  fmul	f9, f9, f5
/* 0CBFF0 800D1590 FD6C0332 */  fmul	f11, f12, f12
/* 0CBFF4 800D1594 FD0C002A */  fadd	f8, f12, f0
/* 0CBFF8 800D1598 FC211028 */  fsub	f1, f1, f2
/* 0CBFFC 800D159C FCA7582A */  fadd	f5, f7, f11
/* 0CC000 800D15A0 FD2A4A3A */  fmadd	f9, f10, f8, f9
/* 0CC004 800D15A4 FC45482A */  fadd	f2, f5, f9
/* 0CC008 800D15A8 D8410018 */  stfd	f2, 0x18(r1)
/* 0CC00C 800D15AC 90A1001C */  stw		r5, 0x1c(r1)
/* 0CC010 800D15B0 C8A10018 */  lfd		f5, 0x18(r1)
/* 0CC014 800D15B4 FC453828 */  fsub	f2, f5, f7
/* 0CC018 800D15B8 FD0C0172 */  fmul	f8, f12, f5
/* 0CC01C 800D15BC FC425828 */  fsub	f2, f2, f11
/* 0CC020 800D15C0 FC491028 */  fsub	f2, f9, f2
/* 0CC024 800D15C4 FC020032 */  fmul	f0, f2, f0
/* 0CC028 800D15C8 FC4A017A */  fmadd	f2, f10, f5, f0
/* 0CC02C 800D15CC FC08102A */  fadd	f0, f8, f2
/* 0CC030 800D15D0 D8010040 */  stfd	f0, 0x40(r1)
/* 0CC034 800D15D4 90A10044 */  stw		r5, 0x44(r1)
/* 0CC038 800D15D8 C8E10040 */  lfd		f7, 0x40(r1)
/* 0CC03C 800D15DC C8A60020 */  lfd		f5, 0x20(r6)
/* 0CC040 800D15E0 FC074028 */  fsub	f0, f7, f8
/* 0CC044 800D15E4 D8210028 */  stfd	f1, 0x28(r1)
/* 0CC048 800D15E8 FCC601F2 */  fmul	f6, f6, f7
/* 0CC04C 800D15EC FC220028 */  fsub	f1, f2, f0
/* 0CC050 800D15F0 C8060010 */  lfd		f0, 0x10(r6)
/* 0CC054 800D15F4 C8410028 */  lfd		f2, 0x28(r1)
/* 0CC058 800D15F8 FC230072 */  fmul	f1, f3, f1
/* 0CC05C 800D15FC FC2409FA */  fmadd	f1, f4, f7, f1
/* 0CC060 800D1600 FC65082A */  fadd	f3, f5, f1
/* 0CC064 800D1604 FC26182A */  fadd	f1, f6, f3
/* 0CC068 800D1608 FC01002A */  fadd	f0, f1, f0
/* 0CC06C 800D160C FC02002A */  fadd	f0, f2, f0
/* 0CC070 800D1610 D8010030 */  stfd	f0, 0x30(r1)
/* 0CC074 800D1614 90A10034 */  stw		r5, 0x34(r1)
/* 0CC078 800D1618 C8210030 */  lfd		f1, 0x30(r1)
/* 0CC07C 800D161C C8060010 */  lfd		f0, 0x10(r6)
/* 0CC080 800D1620 FC211028 */  fsub	f1, f1, f2
/* 0CC084 800D1624 FC010028 */  fsub	f0, f1, f0
/* 0CC088 800D1628 FC003028 */  fsub	f0, f0, f6
/* 0CC08C 800D162C FC030028 */  fsub	f0, f3, f0
lbl_800D1630:
/* 0CC090 800D1630 387BFFFF */  addi	r3, r27, -1
/* 0CC094 800D1634 CBE28570 */  lfd		f31, D_80136270-_SDA2_BASE_(r2)
/* 0CC098 800D1638 7C001B79 */  or.		r0, r0, r3
/* 0CC09C 800D163C 40820008 */  bne		lbl_800D1644
/* 0CC0A0 800D1640 CBE28610 */  lfd		f31, D_80136310-_SDA2_BASE_(r2)
lbl_800D1644:
/* 0CC0A4 800D1644 C8410010 */  lfd		f2, 0x10(r1)
/* 0CC0A8 800D1648 38600000 */  li		r3, 0
/* 0CC0AC 800D164C C8610030 */  lfd		f3, 0x30(r1)
/* 0CC0B0 800D1650 3C004090 */  lis		r0, 0x4090
/* 0CC0B4 800D1654 D8410038 */  stfd	f2, 0x38(r1)
/* 0CC0B8 800D1658 FC220032 */  fmul	f1, f2, f0
/* 0CC0BC 800D165C 9061003C */  stw		r3, 0x3c(r1)
/* 0CC0C0 800D1660 C8810038 */  lfd		f4, 0x38(r1)
/* 0CC0C4 800D1664 FC0400F2 */  fmul	f0, f4, f3
/* 0CC0C8 800D1668 FC422028 */  fsub	f2, f2, f4
/* 0CC0CC 800D166C D8010040 */  stfd	f0, 0x40(r1)
/* 0CC0D0 800D1670 FD0308BA */  fmadd	f8, f3, f2, f1
/* 0CC0D4 800D1674 C8410040 */  lfd		f2, 0x40(r1)
/* 0CC0D8 800D1678 FC08102A */  fadd	f0, f8, f2
/* 0CC0DC 800D167C D8010050 */  stfd	f0, 0x50(r1)
/* 0CC0E0 800D1680 80A10050 */  lwz		r5, 0x50(r1)
/* 0CC0E4 800D1684 80C10054 */  lwz		r6, 0x54(r1)
/* 0CC0E8 800D1688 7C050000 */  cmpw	r5, r0
/* 0CC0EC 800D168C 41800048 */  blt		lbl_800D16D4
/* 0CC0F0 800D1690 3C05BF70 */  addis	r0, r5, 0xbf70
/* 0CC0F4 800D1694 7C003379 */  or.		r0, r0, r6
/* 0CC0F8 800D1698 41820014 */  beq		lbl_800D16AC
/* 0CC0FC 800D169C C8228618 */  lfd		f1, D_80136318-_SDA2_BASE_(r2)
/* 0CC100 800D16A0 FC0107F2 */  fmul	f0, f1, f31
/* 0CC104 800D16A4 FC210032 */  fmul	f1, f1, f0
/* 0CC108 800D16A8 480001E8 */  b		lbl_800D1890
lbl_800D16AC:
/* 0CC10C 800D16AC C8228620 */  lfd		f1, D_80136320-_SDA2_BASE_(r2)
/* 0CC110 800D16B0 C8010050 */  lfd		f0, 0x50(r1)
/* 0CC114 800D16B4 FC21402A */  fadd	f1, f1, f8
/* 0CC118 800D16B8 FC001028 */  fsub	f0, f0, f2
/* 0CC11C 800D16BC FC010040 */  fcmpo	cr0, f1, f0
/* 0CC120 800D16C0 4081006C */  ble		lbl_800D172C
/* 0CC124 800D16C4 C8228618 */  lfd		f1, D_80136318-_SDA2_BASE_(r2)
/* 0CC128 800D16C8 FC0107F2 */  fmul	f0, f1, f31
/* 0CC12C 800D16CC FC210032 */  fmul	f1, f1, f0
/* 0CC130 800D16D0 480001C0 */  b		lbl_800D1890
lbl_800D16D4:
/* 0CC134 800D16D4 3C604091 */  lis		r3, 0x4091
/* 0CC138 800D16D8 54A4007E */  clrlwi	r4, r5, 1
/* 0CC13C 800D16DC 3803CC00 */  addi	r0, r3, -13312
/* 0CC140 800D16E0 7C040000 */  cmpw	r4, r0
/* 0CC144 800D16E4 41800048 */  blt		lbl_800D172C
/* 0CC148 800D16E8 3C653F6F */  addis	r3, r5, 0x3f6f
/* 0CC14C 800D16EC 38033400 */  addi	r0, r3, 0x3400
/* 0CC150 800D16F0 7C003379 */  or.		r0, r0, r6
/* 0CC154 800D16F4 41820014 */  beq		lbl_800D1708
/* 0CC158 800D16F8 C8228628 */  lfd		f1, D_80136328-_SDA2_BASE_(r2)
/* 0CC15C 800D16FC FC0107F2 */  fmul	f0, f1, f31
/* 0CC160 800D1700 FC210032 */  fmul	f1, f1, f0
/* 0CC164 800D1704 4800018C */  b		lbl_800D1890
lbl_800D1708:
/* 0CC168 800D1708 C8010050 */  lfd		f0, 0x50(r1)
/* 0CC16C 800D170C FC001028 */  fsub	f0, f0, f2
/* 0CC170 800D1710 FC080040 */  fcmpo	cr0, f8, f0
/* 0CC174 800D1714 4C401382 */  cror	2, 0, 2
/* 0CC178 800D1718 40820014 */  bne		lbl_800D172C
/* 0CC17C 800D171C C8228628 */  lfd		f1, D_80136328-_SDA2_BASE_(r2)
/* 0CC180 800D1720 FC0107F2 */  fmul	f0, f1, f31
/* 0CC184 800D1724 FC210032 */  fmul	f1, f1, f0
/* 0CC188 800D1728 48000168 */  b		lbl_800D1890
lbl_800D172C:
/* 0CC18C 800D172C 54A4007E */  clrlwi	r4, r5, 1
/* 0CC190 800D1730 3C003FE0 */  lis		r0, 0x3fe0
/* 0CC194 800D1734 54A3657E */  rlwinm	r3, r5, 0xc, 0x15, 0x1f
/* 0CC198 800D1738 38C3FC01 */  addi	r6, r3, -1023
/* 0CC19C 800D173C 7C040000 */  cmpw	r4, r0
/* 0CC1A0 800D1740 38600000 */  li		r3, 0
/* 0CC1A4 800D1744 40810060 */  ble		lbl_800D17A4
/* 0CC1A8 800D1748 3C800010 */  lis		r4, 0x10
/* 0CC1AC 800D174C C8028578 */  lfd		f0, D_80136278-_SDA2_BASE_(r2)
/* 0CC1B0 800D1750 38060001 */  addi	r0, r6, 1
/* 0CC1B4 800D1754 7C800630 */  sraw	r0, r4, r0
/* 0CC1B8 800D1758 D8010028 */  stfd	f0, 0x28(r1)
/* 0CC1BC 800D175C 7CE50214 */  add		r7, r5, r0
/* 0CC1C0 800D1760 54E3657E */  rlwinm	r3, r7, 0xc, 0x15, 0x1f
/* 0CC1C4 800D1764 38C3FC01 */  addi	r6, r3, -1023
/* 0CC1C8 800D1768 3804FFFF */  addi	r0, r4, -1
/* 0CC1CC 800D176C 7C003630 */  sraw	r0, r0, r6
/* 0CC1D0 800D1770 7CE30078 */  andc	r3, r7, r0
/* 0CC1D4 800D1774 54E0033E */  clrlwi	r0, r7, 0xc
/* 0CC1D8 800D1778 90610028 */  stw		r3, 0x28(r1)
/* 0CC1DC 800D177C 64030010 */  oris	r3, r0, 0x10
/* 0CC1E0 800D1780 20060014 */  subfic	r0, r6, 0x14
/* 0CC1E4 800D1784 2C050000 */  cmpwi	r5, 0
/* 0CC1E8 800D1788 7C630630 */  sraw	r3, r3, r0
/* 0CC1EC 800D178C 40800008 */  bge		lbl_800D1794
/* 0CC1F0 800D1790 7C6300D0 */  neg		r3, r3
lbl_800D1794:
/* 0CC1F4 800D1794 C8210040 */  lfd		f1, 0x40(r1)
/* 0CC1F8 800D1798 C8010028 */  lfd		f0, 0x28(r1)
/* 0CC1FC 800D179C FC010028 */  fsub	f0, f1, f0
/* 0CC200 800D17A0 D8010040 */  stfd	f0, 0x40(r1)
lbl_800D17A4:
/* 0CC204 800D17A4 C8410040 */  lfd		f2, 0x40(r1)
/* 0CC208 800D17A8 38000000 */  li		r0, 0
/* 0CC20C 800D17AC C8228640 */  lfd		f1, D_80136340-_SDA2_BASE_(r2)
/* 0CC210 800D17B0 5464A016 */  slwi	r4, r3, 0x14
/* 0CC214 800D17B4 FC08102A */  fadd	f0, f8, f2
/* 0CC218 800D17B8 C9428630 */  lfd		f10, D_80136330-_SDA2_BASE_(r2)
/* 0CC21C 800D17BC C9228638 */  lfd		f9, D_80136338-_SDA2_BASE_(r2)
/* 0CC220 800D17C0 D8010028 */  stfd	f0, 0x28(r1)
/* 0CC224 800D17C4 C8C28668 */  lfd		f6, D_80136368-_SDA2_BASE_(r2)
/* 0CC228 800D17C8 9001002C */  stw		r0, 0x2c(r1)
/* 0CC22C 800D17CC C8028660 */  lfd		f0, D_80136360-_SDA2_BASE_(r2)
/* 0CC230 800D17D0 C9610028 */  lfd		f11, 0x28(r1)
/* 0CC234 800D17D4 C8A28658 */  lfd		f5, D_80136358-_SDA2_BASE_(r2)
/* 0CC238 800D17D8 FC6B1028 */  fsub	f3, f11, f2
/* 0CC23C 800D17DC C8828650 */  lfd		f4, D_80136350-_SDA2_BASE_(r2)
/* 0CC240 800D17E0 FCE102F2 */  fmul	f7, f1, f11
/* 0CC244 800D17E4 C8428648 */  lfd		f2, D_80136348-_SDA2_BASE_(r2)
/* 0CC248 800D17E8 C8228670 */  lfd		f1, D_80136370-_SDA2_BASE_(r2)
/* 0CC24C 800D17EC FD081828 */  fsub	f8, f8, f3
/* 0CC250 800D17F0 C8628570 */  lfd		f3, D_80136270-_SDA2_BASE_(r2)
/* 0CC254 800D17F4 FD4A02F2 */  fmul	f10, f10, f11
/* 0CC258 800D17F8 FD693A3A */  fmadd	f11, f9, f8, f7
/* 0CC25C 800D17FC FCEA582A */  fadd	f7, f10, f11
/* 0CC260 800D1800 D8E10050 */  stfd	f7, 0x50(r1)
/* 0CC264 800D1804 C9210050 */  lfd		f9, 0x50(r1)
/* 0CC268 800D1808 FCE90272 */  fmul	f7, f9, f9
/* 0CC26C 800D180C FD095028 */  fsub	f8, f9, f10
/* 0CC270 800D1810 D8E10028 */  stfd	f7, 0x28(r1)
/* 0CC274 800D1814 FD0B4028 */  fsub	f8, f11, f8
/* 0CC278 800D1818 C8E10028 */  lfd		f7, 0x28(r1)
/* 0CC27C 800D181C FCC601FA */  fmadd	f6, f6, f7, f0
/* 0CC280 800D1820 FC09423A */  fmadd	f0, f9, f8, f8
/* 0CC284 800D1824 FCA729BA */  fmadd	f5, f7, f6, f5
/* 0CC288 800D1828 FC87217A */  fmadd	f4, f7, f5, f4
/* 0CC28C 800D182C FC47113A */  fmadd	f2, f7, f4, f2
/* 0CC290 800D1830 FC4700B2 */  fmul	f2, f7, f2
/* 0CC294 800D1834 FC491028 */  fsub	f2, f9, f2
/* 0CC298 800D1838 D8410030 */  stfd	f2, 0x30(r1)
/* 0CC29C 800D183C C8810030 */  lfd		f4, 0x30(r1)
/* 0CC2A0 800D1840 FC490132 */  fmul	f2, f9, f4
/* 0CC2A4 800D1844 FC240828 */  fsub	f1, f4, f1
/* 0CC2A8 800D1848 FC220824 */  fdiv	f1, f2, f1
/* 0CC2AC 800D184C FC010028 */  fsub	f0, f1, f0
/* 0CC2B0 800D1850 FC004828 */  fsub	f0, f0, f9
/* 0CC2B4 800D1854 FC030028 */  fsub	f0, f3, f0
/* 0CC2B8 800D1858 D8010050 */  stfd	f0, 0x50(r1)
/* 0CC2BC 800D185C 80010050 */  lwz		r0, 0x50(r1)
/* 0CC2C0 800D1860 7C002214 */  add		r0, r0, r4
/* 0CC2C4 800D1864 7C00A671 */  srawi.	r0, r0, 0x14
/* 0CC2C8 800D1868 41810014 */  bgt		lbl_800D187C
/* 0CC2CC 800D186C C8210050 */  lfd		f1, 0x50(r1)
/* 0CC2D0 800D1870 48000039 */  bl		scalbn
/* 0CC2D4 800D1874 D8210050 */  stfd	f1, 0x50(r1)
/* 0CC2D8 800D1878 48000010 */  b		lbl_800D1888
lbl_800D187C:
/* 0CC2DC 800D187C 80010050 */  lwz		r0, 0x50(r1)
/* 0CC2E0 800D1880 7C002214 */  add		r0, r0, r4
/* 0CC2E4 800D1884 90010050 */  stw		r0, 0x50(r1)
lbl_800D1888:
/* 0CC2E8 800D1888 C8010050 */  lfd		f0, 0x50(r1)
/* 0CC2EC 800D188C FC3F0032 */  fmul	f1, f31, f0
lbl_800D1890:
/* 0CC2F0 800D1890 BB210064 */  lmw		r25, 0x64(r1)
/* 0CC2F4 800D1894 8001008C */  lwz		r0, 0x8c(r1)
/* 0CC2F8 800D1898 CBE10080 */  lfd		f31, 0x80(r1)
/* 0CC2FC 800D189C 38210088 */  addi	r1, r1, 0x88
/* 0CC300 800D18A0 7C0803A6 */  mtlr	r0
/* 0CC304 800D18A4 4E800020 */  blr		

glabel scalbn
/* 0CC308 800D18A8 7C0802A6 */  mflr	r0
/* 0CC30C 800D18AC 90010004 */  stw		r0, 4(r1)
/* 0CC310 800D18B0 9421FFF8 */  stwu	r1, -8(r1)
/* 0CC314 800D18B4 48000431 */  bl		ldexp
/* 0CC318 800D18B8 8001000C */  lwz		r0, 0xc(r1)
/* 0CC31C 800D18BC 38210008 */  addi	r1, r1, 8
/* 0CC320 800D18C0 7C0803A6 */  mtlr	r0
/* 0CC324 800D18C4 4E800020 */  blr		


.section .rodata, "a"

.balign 8

/* 000D0740 800D36C0 0010 */
bp:
    .long 0x3FF00000, 0x00000000, 0x3FF80000, 0x00000000

/* 000D0750 800D36D0 0010 */
dp_h:
    .long 0x00000000, 0x00000000, 0x3FE2B803, 0x40000000

/* 000D0760 800D36E0 0010 */
dp_l:
    .long 0x00000000, 0x00000000, 0x3E4CFDEB, 0x43CFD006


.section .sdata2, "wa"

.balign 8

/* 000F1D70 80136270 0008 */
D_80136270:
    .double 1.0

.balign 8

/* 000F1D78 80136278 0008 */
D_80136278:
    .double 0.0

.balign 8

/* 000F1D80 80136280 0008 */
D_80136280:
    .double inf

.balign 8

/* 000F1D88 80136288 0008 */
D_80136288:
    .double 1.4426950216293335

.balign 8

/* 000F1D90 80136290 0008 */
D_80136290:
    .double 1.9259629911266175e-08

.balign 8

/* 000F1D98 80136298 0008 */
D_80136298:
    .double 1.4426950408889634

.balign 8

/* 000F1DA0 801362A0 0008 */
D_801362A0:
    .double 0.5

.balign 8

/* 000F1DA8 801362A8 0008 */
D_801362A8:
    .double 0.3333333333333333

.balign 8

/* 000F1DB0 801362B0 0008 */
D_801362B0:
    .double 0.25

.balign 8

/* 000F1DB8 801362B8 0008 */
D_801362B8:
    .double 9007199254740992.0

.balign 8

/* 000F1DC0 801362C0 0008 */
D_801362C0:
    .double 0.5999999999999946

.balign 8

/* 000F1DC8 801362C8 0008 */
D_801362C8:
    .double 0.4285714285785502

.balign 8

/* 000F1DD0 801362D0 0008 */
D_801362D0:
    .double 0.33333332981837743

.balign 8

/* 000F1DD8 801362D8 0008 */
D_801362D8:
    .double 0.272728123808534

.balign 8

/* 000F1DE0 801362E0 0008 */
D_801362E0:
    .double 0.23066074577556175

.balign 8

/* 000F1DE8 801362E8 0008 */
D_801362E8:
    .double 0.20697501780033842

.balign 8

/* 000F1DF0 801362F0 0008 */
D_801362F0:
    .double 3.0

.balign 8

/* 000F1DF8 801362F8 0008 */
D_801362F8:
    .double 0.9617967009544373

.balign 8

/* 000F1E00 80136300 0008 */
D_80136300:
    .double -7.028461650952758e-09

.balign 8

/* 000F1E08 80136308 0008 */
D_80136308:
    .double 0.9617966939259756

.balign 8

/* 000F1E10 80136310 0008 */
D_80136310:
    .double -1.0

.balign 8

/* 000F1E18 80136318 0008 */
D_80136318:
    .double 1e+300

.balign 8

/* 000F1E20 80136320 0008 */
D_80136320:
    .double 8.008566259537294e-17

.balign 8

/* 000F1E28 80136328 0008 */
D_80136328:
    .double 1e-300

.balign 8

/* 000F1E30 80136330 0008 */
D_80136330:
    .double 0.6931471824645996

.balign 8

/* 000F1E38 80136338 0008 */
D_80136338:
    .double 0.6931471805599453

.balign 8

/* 000F1E40 80136340 0008 */
D_80136340:
    .double -1.904654299957768e-09

.balign 8

/* 000F1E48 80136348 0008 */
D_80136348:
    .double 0.16666666666666602

.balign 8

/* 000F1E50 80136350 0008 */
D_80136350:
    .double -0.0027777777777015593

.balign 8

/* 000F1E58 80136358 0008 */
D_80136358:
    .double 6.613756321437934e-05

.balign 8

/* 000F1E60 80136360 0008 */
D_80136360:
    .double -1.6533902205465252e-06

.balign 8

/* 000F1E68 80136368 0008 */
D_80136368:
    .double 4.1381367970572385e-08

.balign 8

/* 000F1E70 80136370 0008 */
D_80136370:
    .double 2.0

.balign 8

/* 000F1E78 80136378 0008 */
D_80136378:
    .double 4503601774854144.0


