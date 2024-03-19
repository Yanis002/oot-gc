# frame.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x8001D0FC - 0x8002C67C

glabel PSMTX44MultVecNoW
/* 01A0FC 8001D0FC E0040000 */  psq_l     f0, 0x0(r4), 0, qr0
/* 01A100 8001D100 E0248008 */  psq_l     f1, 0x8(r4), 1, qr0
/* 01A104 8001D104 E0830000 */  psq_l     f4, 0x0(r3), 0, qr0
/* 01A108 8001D108 E0A30008 */  psq_l     f5, 0x8(r3), 0, qr0
/* 01A10C 8001D10C E0C30010 */  psq_l     f6, 0x10(r3), 0, qr0
/* 01A110 8001D110 E0E30018 */  psq_l     f7, 0x18(r3), 0, qr0
/* 01A114 8001D114 E1030020 */  psq_l     f8, 0x20(r3), 0, qr0
/* 01A118 8001D118 E1230028 */  psq_l     f9, 0x28(r3), 0, qr0
/* 01A11C 8001D11C 10800132 */  ps_mul    f4, f0, f4
/* 01A120 8001D120 1041217A */  ps_madd   f2, f1, f5, f4
/* 01A124 8001D124 10C001B2 */  ps_mul    f6, f0, f6
/* 01A128 8001D128 106131FA */  ps_madd   f3, f1, f7, f6
/* 01A12C 8001D12C 11000232 */  ps_mul    f8, f0, f8
/* 01A130 8001D130 10421094 */  ps_sum0   f2, f2, f2, f2
/* 01A134 8001D134 1121427A */  ps_madd   f9, f1, f9, f8
/* 01A138 8001D138 10431896 */  ps_sum1   f2, f3, f2, f3
/* 01A13C 8001D13C 10694A54 */  ps_sum0   f3, f9, f9, f9
/* 01A140 8001D140 F0450000 */  psq_st    f2, 0x0(r5), 0, qr0
/* 01A144 8001D144 F0658008 */  psq_st    f3, 0x8(r5), 1, qr0
/* 01A148 8001D148 4E800020 */  blr

glabel frameGetTextureInfo
/* 01A14C 8001D14C 7C0802A6 */  mflr      r0
/* 01A150 8001D150 90010004 */  stw       r0, 0x4(r1)
/* 01A154 8001D154 9421FFF8 */  stwu      r1, -0x8(r1)
/* 01A158 8001D158 38000000 */  li        r0, 0x0
/* 01A15C 8001D15C 38C00000 */  li        r6, 0x0
/* 01A160 8001D160 38A00000 */  li        r5, 0x0
/* 01A164 8001D164 48000004 */  b         lbl_8001D168
lbl_8001D168:
/* 01A168 8001D168 3CE0800F */  lis       r7, jtbl_800EC620@ha
/* 01A16C 8001D16C 3927C620 */  addi      r9, r7, jtbl_800EC620@l
/* 01A170 8001D170 48000004 */  b         lbl_8001D174
lbl_8001D174:
/* 01A174 8001D174 48000004 */  b         lbl_8001D178
lbl_8001D178:
/* 01A178 8001D178 3CE30004 */  addis     r7, r3, 0x4
/* 01A17C 8001D17C 81478340 */  lwz       r10, -0x7cc0(r7)
/* 01A180 8001D180 48000004 */  b         lbl_8001D184
lbl_8001D184:
/* 01A184 8001D184 48000004 */  b         lbl_8001D188
lbl_8001D188:
/* 01A188 8001D188 480000A4 */  b         lbl_8001D22C
lbl_8001D18C:
/* 01A18C 8001D18C 810A0034 */  lwz       r8, 0x34(r10)
/* 01A190 8001D190 38C60001 */  addi      r6, r6, 0x1
/* 01A194 8001D194 28080009 */  cmplwi    r8, 0x9
/* 01A198 8001D198 41810074 */  bgt       lbl_8001D20C
/* 01A19C 8001D19C 5507103A */  slwi      r7, r8, 2
/* 01A1A0 8001D1A0 7CE9382E */  lwzx      r7, r9, r7
/* 01A1A4 8001D1A4 7CE903A6 */  mtctr     r7
/* 01A1A8 8001D1A8 4E800420 */  bctr
lbl_8001D1AC:
/* 01A1AC 8001D1AC A90A0010 */  lha       r8, 0x10(r10)
/* 01A1B0 8001D1B0 A8EA0012 */  lha       r7, 0x12(r10)
/* 01A1B4 8001D1B4 7CE839D6 */  mullw     r7, r8, r7
/* 01A1B8 8001D1B8 38E70001 */  addi      r7, r7, 0x1
/* 01A1BC 8001D1BC 7CE70E70 */  srawi     r7, r7, 1
/* 01A1C0 8001D1C0 7C003A14 */  add       r0, r0, r7
/* 01A1C4 8001D1C4 48000064 */  b         lbl_8001D228
lbl_8001D1C8:
/* 01A1C8 8001D1C8 A90A0010 */  lha       r8, 0x10(r10)
/* 01A1CC 8001D1CC A8EA0012 */  lha       r7, 0x12(r10)
/* 01A1D0 8001D1D0 7CE839D6 */  mullw     r7, r8, r7
/* 01A1D4 8001D1D4 7C003A14 */  add       r0, r0, r7
/* 01A1D8 8001D1D8 48000050 */  b         lbl_8001D228
lbl_8001D1DC:
/* 01A1DC 8001D1DC A90A0010 */  lha       r8, 0x10(r10)
/* 01A1E0 8001D1E0 A8EA0012 */  lha       r7, 0x12(r10)
/* 01A1E4 8001D1E4 7CE839D6 */  mullw     r7, r8, r7
/* 01A1E8 8001D1E8 54E7083C */  slwi      r7, r7, 1
/* 01A1EC 8001D1EC 7C003A14 */  add       r0, r0, r7
/* 01A1F0 8001D1F0 48000038 */  b         lbl_8001D228
lbl_8001D1F4:
/* 01A1F4 8001D1F4 A90A0010 */  lha       r8, 0x10(r10)
/* 01A1F8 8001D1F8 A8EA0012 */  lha       r7, 0x12(r10)
/* 01A1FC 8001D1FC 7CE839D6 */  mullw     r7, r8, r7
/* 01A200 8001D200 54E7103A */  slwi      r7, r7, 2
/* 01A204 8001D204 7C003A14 */  add       r0, r0, r7
/* 01A208 8001D208 48000020 */  b         lbl_8001D228
lbl_8001D20C:
/* 01A20C 8001D20C 3C60800F */  lis       r3, D_800EC5F4@ha
/* 01A210 8001D210 4CC63182 */  crclr     cr1eq
/* 01A214 8001D214 3863C5F4 */  addi      r3, r3, D_800EC5F4@l
/* 01A218 8001D218 7D044378 */  mr        r4, r8
/* 01A21C 8001D21C 48080929 */  bl        OSReport
/* 01A220 8001D220 38600000 */  li        r3, 0x0
/* 01A224 8001D224 48000034 */  b         lbl_8001D258
lbl_8001D228:
/* 01A228 8001D228 814A0020 */  lwz       r10, 0x20(r10)
lbl_8001D22C:
/* 01A22C 8001D22C 280A0000 */  cmplwi    r10, 0x0
/* 01A230 8001D230 4082FF5C */  bne       lbl_8001D18C
/* 01A234 8001D234 38630004 */  addi      r3, r3, 0x4
/* 01A238 8001D238 38A50001 */  addi      r5, r5, 0x1
/* 01A23C 8001D23C 2C051000 */  cmpwi     r5, 0x1000
/* 01A240 8001D240 4180FF38 */  blt       lbl_8001D178
/* 01A244 8001D244 1C66006C */  mulli     r3, r6, 0x6c
/* 01A248 8001D248 7C001A14 */  add       r0, r0, r3
/* 01A24C 8001D24C 90040000 */  stw       r0, 0x0(r4)
/* 01A250 8001D250 38600001 */  li        r3, 0x1
/* 01A254 8001D254 90C40004 */  stw       r6, 0x4(r4)
lbl_8001D258:
/* 01A258 8001D258 8001000C */  lwz       r0, 0xc(r1)
/* 01A25C 8001D25C 38210008 */  addi      r1, r1, 0x8
/* 01A260 8001D260 7C0803A6 */  mtlr      r0
/* 01A264 8001D264 4E800020 */  blr

glabel frameInvalidateCache
/* 01A268 8001D268 7C0802A6 */  mflr      r0
/* 01A26C 8001D26C 90010004 */  stw       r0, 0x4(r1)
/* 01A270 8001D270 9421FFC0 */  stwu      r1, -0x40(r1)
/* 01A274 8001D274 BEE1001C */  stmw      r23, 0x1c(r1)
/* 01A278 8001D278 7C791B78 */  mr        r25, r3
/* 01A27C 8001D27C 5480027E */  clrlwi    r0, r4, 9
/* 01A280 8001D280 7C035E70 */  srawi     r3, r0, 11
/* 01A284 8001D284 7C630194 */  addze     r3, r3
/* 01A288 8001D288 54A0027E */  clrlwi    r0, r5, 9
/* 01A28C 8001D28C 7C1B5E70 */  srawi     r27, r0, 11
/* 01A290 8001D290 5460103A */  slwi      r0, r3, 2
/* 01A294 8001D294 7C7C1B78 */  mr        r28, r3
/* 01A298 8001D298 7F7B0194 */  addze     r27, r27
/* 01A29C 8001D29C 7FB90214 */  add       r29, r25, r0
/* 01A2A0 8001D2A0 48000004 */  b         lbl_8001D2A4
lbl_8001D2A4:
/* 01A2A4 8001D2A4 3C604BDA */  lis       r3, 0x4bda
/* 01A2A8 8001D2A8 3BD92240 */  addi      r30, r25, 0x2240
/* 01A2AC 8001D2AC 3BE312F7 */  addi      r31, r3, 0x12f7
/* 01A2B0 8001D2B0 48000004 */  b         lbl_8001D2B4
lbl_8001D2B4:
/* 01A2B4 8001D2B4 48000100 */  b         lbl_8001D3B4
lbl_8001D2B8:
/* 01A2B8 8001D2B8 3C7D0004 */  addis     r3, r29, 0x4
/* 01A2BC 8001D2BC 82E38340 */  lwz       r23, -0x7cc0(r3)
/* 01A2C0 8001D2C0 48000004 */  b         lbl_8001D2C4
lbl_8001D2C4:
/* 01A2C4 8001D2C4 48000004 */  b         lbl_8001D2C8
lbl_8001D2C8:
/* 01A2C8 8001D2C8 480000D0 */  b         lbl_8001D398
lbl_8001D2CC:
/* 01A2CC 8001D2CC 83570020 */  lwz       r26, 0x20(r23)
/* 01A2D0 8001D2D0 7F1EB850 */  subf      r24, r30, r23
/* 01A2D4 8001D2D4 38770008 */  addi      r3, r23, 0x8
/* 01A2D8 8001D2D8 38991CF8 */  addi      r4, r25, 0x1cf8
/* 01A2DC 8001D2DC 38A00140 */  li        r5, 0x140
/* 01A2E0 8001D2E0 48003A0D */  bl        packFreeBlocks
/* 01A2E4 8001D2E4 2C030000 */  cmpwi     r3, 0x0
/* 01A2E8 8001D2E8 4082000C */  bne       lbl_8001D2F4
/* 01A2EC 8001D2EC 38000000 */  li        r0, 0x0
/* 01A2F0 8001D2F0 48000008 */  b         lbl_8001D2F8
lbl_8001D2F4:
/* 01A2F4 8001D2F4 38000001 */  li        r0, 0x1
lbl_8001D2F8:
/* 01A2F8 8001D2F8 2C000000 */  cmpwi     r0, 0x0
/* 01A2FC 8001D2FC 4082000C */  bne       lbl_8001D308
/* 01A300 8001D300 38000000 */  li        r0, 0x0
/* 01A304 8001D304 48000028 */  b         lbl_8001D32C
lbl_8001D308:
/* 01A308 8001D308 38770004 */  addi      r3, r23, 0x4
/* 01A30C 8001D30C 38991C38 */  addi      r4, r25, 0x1c38
/* 01A310 8001D310 38A00030 */  li        r5, 0x30
/* 01A314 8001D314 480039D9 */  bl        packFreeBlocks
/* 01A318 8001D318 2C030000 */  cmpwi     r3, 0x0
/* 01A31C 8001D31C 4082000C */  bne       lbl_8001D328
/* 01A320 8001D320 38000000 */  li        r0, 0x0
/* 01A324 8001D324 48000008 */  b         lbl_8001D32C
lbl_8001D328:
/* 01A328 8001D328 38000001 */  li        r0, 0x1
lbl_8001D32C:
/* 01A32C 8001D32C 2C000000 */  cmpwi     r0, 0x0
/* 01A330 8001D330 4082000C */  bne       lbl_8001D33C
/* 01A334 8001D334 38A00000 */  li        r5, 0x0
/* 01A338 8001D338 4800004C */  b         lbl_8001D384
lbl_8001D33C:
/* 01A33C 8001D33C 7C1FC096 */  mulhw     r0, r31, r24
/* 01A340 8001D340 7C002E70 */  srawi     r0, r0, 5
/* 01A344 8001D344 54030FFE */  srwi      r3, r0, 31
/* 01A348 8001D348 7F001A14 */  add       r24, r0, r3
/* 01A34C 8001D34C 7F002E70 */  srawi     r0, r24, 5
/* 01A350 8001D350 5403103A */  slwi      r3, r0, 2
/* 01A354 8001D354 3C830004 */  addis     r4, r3, 0x4
/* 01A358 8001D358 38848240 */  subi      r4, r4, 0x7dc0
/* 01A35C 8001D35C 38A00001 */  li        r5, 0x1
/* 01A360 8001D360 7C79202E */  lwzx      r3, r25, r4
/* 01A364 8001D364 570006FE */  clrlwi    r0, r24, 27
/* 01A368 8001D368 7CA00030 */  slw       r0, r5, r0
/* 01A36C 8001D36C 7C0000F8 */  nor       r0, r0, r0
/* 01A370 8001D370 7C600038 */  and       r0, r3, r0
/* 01A374 8001D374 7C19212E */  stwx      r0, r25, r4
/* 01A378 8001D378 80791C30 */  lwz       r3, 0x1c30(r25)
/* 01A37C 8001D37C 3803FFFF */  subi      r0, r3, 0x1
/* 01A380 8001D380 90191C30 */  stw       r0, 0x1c30(r25)
lbl_8001D384:
/* 01A384 8001D384 2C050000 */  cmpwi     r5, 0x0
/* 01A388 8001D388 4082000C */  bne       lbl_8001D394
/* 01A38C 8001D38C 38600000 */  li        r3, 0x0
/* 01A390 8001D390 48000030 */  b         lbl_8001D3C0
lbl_8001D394:
/* 01A394 8001D394 7F57D378 */  mr        r23, r26
lbl_8001D398:
/* 01A398 8001D398 28170000 */  cmplwi    r23, 0x0
/* 01A39C 8001D39C 4082FF30 */  bne       lbl_8001D2CC
/* 01A3A0 8001D3A0 3C7D0004 */  addis     r3, r29, 0x4
/* 01A3A4 8001D3A4 38000000 */  li        r0, 0x0
/* 01A3A8 8001D3A8 90038340 */  stw       r0, -0x7cc0(r3)
/* 01A3AC 8001D3AC 3BBD0004 */  addi      r29, r29, 0x4
/* 01A3B0 8001D3B0 3B9C0001 */  addi      r28, r28, 0x1
lbl_8001D3B4:
/* 01A3B4 8001D3B4 7C1CD800 */  cmpw      r28, r27
/* 01A3B8 8001D3B8 4081FF00 */  ble       lbl_8001D2B8
/* 01A3BC 8001D3BC 38600001 */  li        r3, 0x1
lbl_8001D3C0:
/* 01A3C0 8001D3C0 BAE1001C */  lmw       r23, 0x1c(r1)
/* 01A3C4 8001D3C4 80010044 */  lwz       r0, 0x44(r1)
/* 01A3C8 8001D3C8 38210040 */  addi      r1, r1, 0x40
/* 01A3CC 8001D3CC 7C0803A6 */  mtlr      r0
/* 01A3D0 8001D3D0 4E800020 */  blr

glabel frameSetMatrixHint
/* 01A3D4 8001D3D4 2C050000 */  cmpwi     r5, 0x0
/* 01A3D8 8001D3D8 41820008 */  beq       lbl_8001D3E0
/* 01A3DC 8001D3DC 64A58000 */  oris      r5, r5, 0x8000
lbl_8001D3E0:
/* 01A3E0 8001D3E0 2C060000 */  cmpwi     r6, 0x0
/* 01A3E4 8001D3E4 41820008 */  beq       lbl_8001D3EC
/* 01A3E8 8001D3E8 64C68000 */  oris      r6, r6, 0x8000
lbl_8001D3EC:
/* 01A3EC 8001D3EC 3CE30004 */  addis     r7, r3, 0x4
/* 01A3F0 8001D3F0 8127C4C8 */  lwz       r9, -0x3b38(r7)
/* 01A3F4 8001D3F4 7C681B78 */  mr        r8, r3
/* 01A3F8 8001D3F8 39400000 */  li        r10, 0x0
/* 01A3FC 8001D3FC 48000004 */  b         lbl_8001D400
lbl_8001D400:
/* 01A400 8001D400 2C090000 */  cmpwi     r9, 0x0
/* 01A404 8001D404 7D2903A6 */  mtctr     r9
/* 01A408 8001D408 40810044 */  ble       lbl_8001D44C
/* 01A40C 8001D40C 48000004 */  b         lbl_8001D410
lbl_8001D410:
/* 01A410 8001D410 2C050000 */  cmpwi     r5, 0x0
/* 01A414 8001D414 41820014 */  beq       lbl_8001D428
/* 01A418 8001D418 3CE80004 */  addis     r7, r8, 0x4
/* 01A41C 8001D41C 8007C838 */  lwz       r0, -0x37c8(r7)
/* 01A420 8001D420 7C002840 */  cmplw     r0, r5
/* 01A424 8001D424 41820028 */  beq       lbl_8001D44C
lbl_8001D428:
/* 01A428 8001D428 2C060000 */  cmpwi     r6, 0x0
/* 01A42C 8001D42C 41820014 */  beq       lbl_8001D440
/* 01A430 8001D430 3CE80004 */  addis     r7, r8, 0x4
/* 01A434 8001D434 8007C83C */  lwz       r0, -0x37c4(r7)
/* 01A438 8001D438 7C003040 */  cmplw     r0, r6
/* 01A43C 8001D43C 41820010 */  beq       lbl_8001D44C
lbl_8001D440:
/* 01A440 8001D440 39080024 */  addi      r8, r8, 0x24
/* 01A444 8001D444 394A0001 */  addi      r10, r10, 0x1
/* 01A448 8001D448 4200FFC8 */  bdnz      lbl_8001D410
lbl_8001D44C:
/* 01A44C 8001D44C 7C0A4800 */  cmpw      r10, r9
/* 01A450 8001D450 4082003C */  bne       lbl_8001D48C
/* 01A454 8001D454 7C681B78 */  mr        r8, r3
/* 01A458 8001D458 39400000 */  li        r10, 0x0
/* 01A45C 8001D45C 48000004 */  b         lbl_8001D460
lbl_8001D460:
/* 01A460 8001D460 2C090000 */  cmpwi     r9, 0x0
/* 01A464 8001D464 7D2903A6 */  mtctr     r9
/* 01A468 8001D468 40810024 */  ble       lbl_8001D48C
/* 01A46C 8001D46C 48000004 */  b         lbl_8001D470
lbl_8001D470:
/* 01A470 8001D470 3CE80004 */  addis     r7, r8, 0x4
/* 01A474 8001D474 8007C820 */  lwz       r0, -0x37e0(r7)
/* 01A478 8001D478 2C000000 */  cmpwi     r0, 0x0
/* 01A47C 8001D47C 41800010 */  blt       lbl_8001D48C
/* 01A480 8001D480 39080024 */  addi      r8, r8, 0x24
/* 01A484 8001D484 394A0001 */  addi      r10, r10, 0x1
/* 01A488 8001D488 4200FFE8 */  bdnz      lbl_8001D470
lbl_8001D48C:
/* 01A48C 8001D48C 2C040001 */  cmpwi     r4, 0x1
/* 01A490 8001D490 40820008 */  bne       lbl_8001D498
/* 01A494 8001D494 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
lbl_8001D498:
/* 01A498 8001D498 1C0A0024 */  mulli     r0, r10, 0x24
/* 01A49C 8001D49C 3D030004 */  addis     r8, r3, 0x4
/* 01A4A0 8001D4A0 7CE80214 */  add       r7, r8, r0
/* 01A4A4 8001D4A4 38000004 */  li        r0, 0x4
/* 01A4A8 8001D4A8 9007C820 */  stw       r0, -0x37e0(r7)
/* 01A4AC 8001D4AC D0A7C824 */  stfs      f5, -0x37dc(r7)
/* 01A4B0 8001D4B0 D047C834 */  stfs      f2, -0x37cc(r7)
/* 01A4B4 8001D4B4 D027C830 */  stfs      f1, -0x37d0(r7)
/* 01A4B8 8001D4B8 D087C828 */  stfs      f4, -0x37d8(r7)
/* 01A4BC 8001D4BC D067C82C */  stfs      f3, -0x37d4(r7)
/* 01A4C0 8001D4C0 9087C840 */  stw       r4, -0x37c0(r7)
/* 01A4C4 8001D4C4 90A7C838 */  stw       r5, -0x37c8(r7)
/* 01A4C8 8001D4C8 90C7C83C */  stw       r6, -0x37c4(r7)
/* 01A4CC 8001D4CC 8088C4C8 */  lwz       r4, -0x3b38(r8)
/* 01A4D0 8001D4D0 7C0A2000 */  cmpw      r10, r4
/* 01A4D4 8001D4D4 4082000C */  bne       lbl_8001D4E0
/* 01A4D8 8001D4D8 38040001 */  addi      r0, r4, 0x1
/* 01A4DC 8001D4DC 9008C4C8 */  stw       r0, -0x3b38(r8)
lbl_8001D4E0:
/* 01A4E0 8001D4E0 3C630004 */  addis     r3, r3, 0x4
/* 01A4E4 8001D4E4 9143C514 */  stw       r10, -0x3aec(r3)
/* 01A4E8 8001D4E8 38600001 */  li        r3, 0x1
/* 01A4EC 8001D4EC 4E800020 */  blr

glabel frameFixMatrixHint
/* 01A4F0 8001D4F0 3CC30004 */  addis     r6, r3, 0x4
/* 01A4F4 8001D4F4 8006C4C8 */  lwz       r0, -0x3b38(r6)
/* 01A4F8 8001D4F8 7C671B78 */  mr        r7, r3
/* 01A4FC 8001D4FC 39000000 */  li        r8, 0x0
/* 01A500 8001D500 48000004 */  b         lbl_8001D504
lbl_8001D504:
/* 01A504 8001D504 2C000000 */  cmpwi     r0, 0x0
/* 01A508 8001D508 7C0903A6 */  mtctr     r0
/* 01A50C 8001D50C 40810094 */  ble       lbl_8001D5A0
/* 01A510 8001D510 48000004 */  b         lbl_8001D514
lbl_8001D514:
/* 01A514 8001D514 3CC70004 */  addis     r6, r7, 0x4
/* 01A518 8001D518 8006C838 */  lwz       r0, -0x37c8(r6)
/* 01A51C 8001D51C 7C002040 */  cmplw     r0, r4
/* 01A520 8001D520 40820074 */  bne       lbl_8001D594
/* 01A524 8001D524 8006C820 */  lwz       r0, -0x37e0(r6)
/* 01A528 8001D528 2C000000 */  cmpwi     r0, 0x0
/* 01A52C 8001D52C 41800068 */  blt       lbl_8001D594
/* 01A530 8001D530 1C080024 */  mulli     r0, r8, 0x24
/* 01A534 8001D534 3CC30004 */  addis     r6, r3, 0x4
/* 01A538 8001D538 7C860214 */  add       r4, r6, r0
/* 01A53C 8001D53C 38E00000 */  li        r7, 0x0
/* 01A540 8001D540 90E4C838 */  stw       r7, -0x37c8(r4)
/* 01A544 8001D544 39200000 */  li        r9, 0x0
/* 01A548 8001D548 90A4C83C */  stw       r5, -0x37c4(r4)
/* 01A54C 8001D54C 48000004 */  b         lbl_8001D550
lbl_8001D550:
/* 01A550 8001D550 48000004 */  b         lbl_8001D554
lbl_8001D554:
/* 01A554 8001D554 4800002C */  b         lbl_8001D580
lbl_8001D558:
/* 01A558 8001D558 7C094000 */  cmpw      r9, r8
/* 01A55C 8001D55C 4182001C */  beq       lbl_8001D578
/* 01A560 8001D560 3C830004 */  addis     r4, r3, 0x4
/* 01A564 8001D564 8004C83C */  lwz       r0, -0x37c4(r4)
/* 01A568 8001D568 7C002840 */  cmplw     r0, r5
/* 01A56C 8001D56C 4082000C */  bne       lbl_8001D578
/* 01A570 8001D570 90E4C838 */  stw       r7, -0x37c8(r4)
/* 01A574 8001D574 90E4C83C */  stw       r7, -0x37c4(r4)
lbl_8001D578:
/* 01A578 8001D578 38630024 */  addi      r3, r3, 0x24
/* 01A57C 8001D57C 39290001 */  addi      r9, r9, 0x1
lbl_8001D580:
/* 01A580 8001D580 8006C4C8 */  lwz       r0, -0x3b38(r6)
/* 01A584 8001D584 7C090000 */  cmpw      r9, r0
/* 01A588 8001D588 4180FFD0 */  blt       lbl_8001D558
/* 01A58C 8001D58C 38600001 */  li        r3, 0x1
/* 01A590 8001D590 48000014 */  b         lbl_8001D5A4
lbl_8001D594:
/* 01A594 8001D594 38E70024 */  addi      r7, r7, 0x24
/* 01A598 8001D598 39080001 */  addi      r8, r8, 0x1
/* 01A59C 8001D59C 4200FF78 */  bdnz      lbl_8001D514
lbl_8001D5A0:
/* 01A5A0 8001D5A0 38600000 */  li        r3, 0x0
lbl_8001D5A4:
/* 01A5A4 8001D5A4 4E800020 */  blr

glabel frameSetBuffer
/* 01A5A8 8001D5A8 3804FFFE */  subi      r0, r4, 0x2
/* 01A5AC 8001D5AC 28000001 */  cmplwi    r0, 0x1
/* 01A5B0 8001D5B0 40810028 */  ble       lbl_8001D5D8
/* 01A5B4 8001D5B4 2C040000 */  cmpwi     r4, 0x0
/* 01A5B8 8001D5B8 40820020 */  bne       lbl_8001D5D8
/* 01A5BC 8001D5BC 800300D8 */  lwz       r0, 0xd8(r3)
/* 01A5C0 8001D5C0 540001BE */  clrlwi    r0, r0, 6
/* 01A5C4 8001D5C4 90030118 */  stw       r0, 0x118(r3)
/* 01A5C8 8001D5C8 80830118 */  lwz       r4, 0x118(r3)
/* 01A5CC 8001D5CC 3C840002 */  addis     r4, r4, 0x2
/* 01A5D0 8001D5D0 380457FC */  addi      r0, r4, 0x57fc
/* 01A5D4 8001D5D4 9003011C */  stw       r0, 0x11c(r3)
lbl_8001D5D8:
/* 01A5D8 8001D5D8 38600001 */  li        r3, 0x1
/* 01A5DC 8001D5DC 4E800020 */  blr

glabel frameResetUCode
/* 01A5E0 8001D5E0 3CA30004 */  addis     r5, r3, 0x4
/* 01A5E4 8001D5E4 38000000 */  li        r0, 0x0
/* 01A5E8 8001D5E8 9005C4CC */  stw       r0, -0x3b34(r5)
/* 01A5EC 8001D5EC 8003008C */  lwz       r0, 0x8c(r3)
/* 01A5F0 8001D5F0 74009C1F */  andis.    r0, r0, 0x9c1f
/* 01A5F4 8001D5F4 2C040000 */  cmpwi     r4, 0x0
/* 01A5F8 8001D5F8 9003008C */  stw       r0, 0x8c(r3)
/* 01A5FC 8001D5FC 40820018 */  bne       lbl_8001D614
/* 01A600 8001D600 8083008C */  lwz       r4, 0x8c(r3)
/* 01A604 8001D604 3800FFFF */  li        r0, -0x1
/* 01A608 8001D608 54840184 */  rlwinm    r4, r4, 0, 6, 2
/* 01A60C 8001D60C 9083008C */  stw       r4, 0x8c(r3)
/* 01A610 8001D610 9005C4D0 */  stw       r0, -0x3b30(r5)
lbl_8001D614:
/* 01A614 8001D614 48000004 */  b         lbl_8001D618
lbl_8001D618:
/* 01A618 8001D618 38800000 */  li        r4, 0x0
/* 01A61C 8001D61C 48000004 */  b         lbl_8001D620
lbl_8001D620:
/* 01A620 8001D620 90830090 */  stw       r4, 0x90(r3)
/* 01A624 8001D624 38C00008 */  li        r6, 0x8
/* 01A628 8001D628 90830094 */  stw       r4, 0x94(r3)
/* 01A62C 8001D62C 90830098 */  stw       r4, 0x98(r3)
/* 01A630 8001D630 9083009C */  stw       r4, 0x9c(r3)
/* 01A634 8001D634 908300A0 */  stw       r4, 0xa0(r3)
/* 01A638 8001D638 908300A4 */  stw       r4, 0xa4(r3)
/* 01A63C 8001D63C 908300A8 */  stw       r4, 0xa8(r3)
/* 01A640 8001D640 908300AC */  stw       r4, 0xac(r3)
/* 01A644 8001D644 4800003C */  b         lbl_8001D680
lbl_8001D648:
/* 01A648 8001D648 2006000A */  subfic    r0, r6, 0xa
/* 01A64C 8001D64C 2C06000A */  cmpwi     r6, 0xa
/* 01A650 8001D650 7C0903A6 */  mtctr     r0
/* 01A654 8001D654 40800014 */  bge       lbl_8001D668
/* 01A658 8001D658 48000004 */  b         lbl_8001D65C
lbl_8001D65C:
/* 01A65C 8001D65C 90850090 */  stw       r4, 0x90(r5)
/* 01A660 8001D660 38A50004 */  addi      r5, r5, 0x4
/* 01A664 8001D664 4200FFF8 */  bdnz      lbl_8001D65C
lbl_8001D668:
/* 01A668 8001D668 3800FFFF */  li        r0, -0x1
/* 01A66C 8001D66C 90030120 */  stw       r0, 0x120(r3)
/* 01A670 8001D670 38000000 */  li        r0, 0x0
/* 01A674 8001D674 9003013C */  stw       r0, 0x13c(r3)
/* 01A678 8001D678 38600001 */  li        r3, 0x1
/* 01A67C 8001D67C 48000010 */  b         lbl_8001D68C
lbl_8001D680:
/* 01A680 8001D680 54C0103A */  slwi      r0, r6, 2
/* 01A684 8001D684 7CA30214 */  add       r5, r3, r0
/* 01A688 8001D688 4BFFFFC0 */  b         lbl_8001D648
lbl_8001D68C:
/* 01A68C 8001D68C 4E800020 */  blr

glabel frameSetViewport
/* 01A690 8001D690 9421FFB0 */  stwu      r1, -0x50(r1)
/* 01A694 8001D694 A8040000 */  lha       r0, 0x0(r4)
/* 01A698 8001D698 3CA04330 */  lis       r5, 0x4330
/* 01A69C 8001D69C C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 01A6A0 8001D6A0 38C10028 */  addi      r6, r1, 0x28
/* 01A6A4 8001D6A4 6C008000 */  xoris     r0, r0, 0x8000
/* 01A6A8 8001D6A8 9001004C */  stw       r0, 0x4c(r1)
/* 01A6AC 8001D6AC C0228104 */  lfs       f1, D_8018C044@sda21(r0)
/* 01A6B0 8001D6B0 90A10048 */  stw       r5, 0x48(r1)
/* 01A6B4 8001D6B4 C8010048 */  lfd       f0, 0x48(r1)
/* 01A6B8 8001D6B8 EC001028 */  fsubs     f0, f0, f2
/* 01A6BC 8001D6BC EC000072 */  fmuls     f0, f0, f1
/* 01A6C0 8001D6C0 D0010028 */  stfs      f0, 0x28(r1)
/* 01A6C4 8001D6C4 A8040002 */  lha       r0, 0x2(r4)
/* 01A6C8 8001D6C8 6C008000 */  xoris     r0, r0, 0x8000
/* 01A6CC 8001D6CC 90010044 */  stw       r0, 0x44(r1)
/* 01A6D0 8001D6D0 90A10040 */  stw       r5, 0x40(r1)
/* 01A6D4 8001D6D4 C8010040 */  lfd       f0, 0x40(r1)
/* 01A6D8 8001D6D8 EC001028 */  fsubs     f0, f0, f2
/* 01A6DC 8001D6DC EC000072 */  fmuls     f0, f0, f1
/* 01A6E0 8001D6E0 D001002C */  stfs      f0, 0x2c(r1)
/* 01A6E4 8001D6E4 A8040004 */  lha       r0, 0x4(r4)
/* 01A6E8 8001D6E8 6C008000 */  xoris     r0, r0, 0x8000
/* 01A6EC 8001D6EC 9001003C */  stw       r0, 0x3c(r1)
/* 01A6F0 8001D6F0 90A10038 */  stw       r5, 0x38(r1)
/* 01A6F4 8001D6F4 C8010038 */  lfd       f0, 0x38(r1)
/* 01A6F8 8001D6F8 EC001028 */  fsubs     f0, f0, f2
/* 01A6FC 8001D6FC EC000072 */  fmuls     f0, f0, f1
/* 01A700 8001D700 D0010030 */  stfs      f0, 0x30(r1)
/* 01A704 8001D704 48000004 */  b         lbl_8001D708
lbl_8001D708:
/* 01A708 8001D708 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 01A70C 8001D70C 48000004 */  b         lbl_8001D710
lbl_8001D710:
/* 01A710 8001D710 C0010028 */  lfs       f0, 0x28(r1)
/* 01A714 8001D714 FC000840 */  fcmpo     cr0, f0, f1
/* 01A718 8001D718 4080000C */  bge       lbl_8001D724
/* 01A71C 8001D71C FC000050 */  fneg      f0, f0
/* 01A720 8001D720 D0010028 */  stfs      f0, 0x28(r1)
lbl_8001D724:
/* 01A724 8001D724 38C60004 */  addi      r6, r6, 0x4
/* 01A728 8001D728 C0060000 */  lfs       f0, 0x0(r6)
/* 01A72C 8001D72C FC000840 */  fcmpo     cr0, f0, f1
/* 01A730 8001D730 4080000C */  bge       lbl_8001D73C
/* 01A734 8001D734 FC000050 */  fneg      f0, f0
/* 01A738 8001D738 D0060000 */  stfs      f0, 0x0(r6)
lbl_8001D73C:
/* 01A73C 8001D73C 38C60004 */  addi      r6, r6, 0x4
/* 01A740 8001D740 C0060000 */  lfs       f0, 0x0(r6)
/* 01A744 8001D744 FC000840 */  fcmpo     cr0, f0, f1
/* 01A748 8001D748 4080000C */  bge       lbl_8001D754
/* 01A74C 8001D74C FC000050 */  fneg      f0, f0
/* 01A750 8001D750 D0060000 */  stfs      f0, 0x0(r6)
lbl_8001D754:
/* 01A754 8001D754 A8040008 */  lha       r0, 0x8(r4)
/* 01A758 8001D758 3CE08002 */  lis       r7, frameDrawLine_Setup@ha
/* 01A75C 8001D75C A884000A */  lha       r4, 0xa(r4)
/* 01A760 8001D760 3CC08002 */  lis       r6, frameDrawTriangle_Setup@ha
/* 01A764 8001D764 6C008000 */  xoris     r0, r0, 0x8000
/* 01A768 8001D768 90010044 */  stw       r0, 0x44(r1)
/* 01A76C 8001D76C 6C848000 */  xoris     r4, r4, 0x8000
/* 01A770 8001D770 3C004330 */  lis       r0, 0x4330
/* 01A774 8001D774 C8628110 */  lfd       f3, D_8018C050@sda21(r0)
/* 01A778 8001D778 9081003C */  stw       r4, 0x3c(r1)
/* 01A77C 8001D77C 3CA08002 */  lis       r5, frameDrawRectFill_Setup@ha
/* 01A780 8001D780 C0228104 */  lfs       f1, D_8018C044@sda21(r0)
/* 01A784 8001D784 90010040 */  stw       r0, 0x40(r1)
/* 01A788 8001D788 3C808002 */  lis       r4, frameDrawRectTexture_Setup@ha
/* 01A78C 8001D78C C0E10028 */  lfs       f7, 0x28(r1)
/* 01A790 8001D790 38E76998 */  addi      r7, r7, frameDrawLine_Setup@l
/* 01A794 8001D794 90010038 */  stw       r0, 0x38(r1)
/* 01A798 8001D798 C8010040 */  lfd       f0, 0x40(r1)
/* 01A79C 8001D79C 38C67568 */  addi      r6, r6, frameDrawTriangle_Setup@l
/* 01A7A0 8001D7A0 C8410038 */  lfd       f2, 0x38(r1)
/* 01A7A4 8001D7A4 38A56654 */  addi      r5, r5, frameDrawRectFill_Setup@l
/* 01A7A8 8001D7A8 EC001828 */  fsubs     f0, f0, f3
/* 01A7AC 8001D7AC EC421828 */  fsubs     f2, f2, f3
/* 01A7B0 8001D7B0 C0828108 */  lfs       f4, D_8018C048@sda21(r0)
/* 01A7B4 8001D7B4 C0A1002C */  lfs       f5, 0x2c(r1)
/* 01A7B8 8001D7B8 38045D88 */  addi      r0, r4, frameDrawRectTexture_Setup@l
/* 01A7BC 8001D7BC EC000072 */  fmuls     f0, f0, f1
/* 01A7C0 8001D7C0 EC220072 */  fmuls     f1, f2, f1
/* 01A7C4 8001D7C4 C1030080 */  lfs       f8, 0x80(r3)
/* 01A7C8 8001D7C8 C0C30084 */  lfs       f6, 0x84(r3)
/* 01A7CC 8001D7CC EC6401F2 */  fmuls     f3, f4, f7
/* 01A7D0 8001D7D0 EC003828 */  fsubs     f0, f0, f7
/* 01A7D4 8001D7D4 EC212828 */  fsubs     f1, f1, f5
/* 01A7D8 8001D7D8 EC440172 */  fmuls     f2, f4, f5
/* 01A7DC 8001D7DC EC080032 */  fmuls     f0, f8, f0
/* 01A7E0 8001D7E0 EC260072 */  fmuls     f1, f6, f1
/* 01A7E4 8001D7E4 EC630232 */  fmuls     f3, f3, f8
/* 01A7E8 8001D7E8 D00300B8 */  stfs      f0, 0xb8(r3)
/* 01A7EC 8001D7EC EC0201B2 */  fmuls     f0, f2, f6
/* 01A7F0 8001D7F0 D02300BC */  stfs      f1, 0xbc(r3)
/* 01A7F4 8001D7F4 D06300C0 */  stfs      f3, 0xc0(r3)
/* 01A7F8 8001D7F8 D00300C4 */  stfs      f0, 0xc4(r3)
/* 01A7FC 8001D7FC 8083007C */  lwz       r4, 0x7c(r3)
/* 01A800 8001D800 64840001 */  oris      r4, r4, 0x1
/* 01A804 8001D804 9083007C */  stw       r4, 0x7c(r3)
/* 01A808 8001D808 90E3012C */  stw       r7, 0x12c(r3)
/* 01A80C 8001D80C 90C30130 */  stw       r6, 0x130(r3)
/* 01A810 8001D810 90A30134 */  stw       r5, 0x134(r3)
/* 01A814 8001D814 90030138 */  stw       r0, 0x138(r3)
/* 01A818 8001D818 38600001 */  li        r3, 0x1
/* 01A81C 8001D81C 38210050 */  addi      r1, r1, 0x50
/* 01A820 8001D820 4E800020 */  blr

glabel frameSetLookAt
/* 01A824 8001D824 2C040001 */  cmpwi     r4, 0x1
/* 01A828 8001D828 41820054 */  beq       lbl_8001D87C
/* 01A82C 8001D82C 40800090 */  bge       lbl_8001D8BC
/* 01A830 8001D830 2C040000 */  cmpwi     r4, 0x0
/* 01A834 8001D834 40800008 */  bge       lbl_8001D83C
/* 01A838 8001D838 48000084 */  b         lbl_8001D8BC
lbl_8001D83C:
/* 01A83C 8001D83C 38C3033C */  addi      r6, r3, 0x33c
/* 01A840 8001D840 38850008 */  addi      r4, r5, 0x8
/* 01A844 8001D844 E024E000 */  psq_l     f1, 0x0(r4), 1, qr6
/* 01A848 8001D848 D0260000 */  stfs      f1, 0x0(r6)
/* 01A84C 8001D84C 38C30340 */  addi      r6, r3, 0x340
/* 01A850 8001D850 38850009 */  addi      r4, r5, 0x9
/* 01A854 8001D854 E024E000 */  psq_l     f1, 0x0(r4), 1, qr6
/* 01A858 8001D858 D0260000 */  stfs      f1, 0x0(r6)
/* 01A85C 8001D85C 38C30344 */  addi      r6, r3, 0x344
/* 01A860 8001D860 3885000A */  addi      r4, r5, 0xa
/* 01A864 8001D864 E024E000 */  psq_l     f1, 0x0(r4), 1, qr6
/* 01A868 8001D868 D0260000 */  stfs      f1, 0x0(r6)
/* 01A86C 8001D86C 8003008C */  lwz       r0, 0x8c(r3)
/* 01A870 8001D870 64000100 */  oris      r0, r0, 0x100
/* 01A874 8001D874 9003008C */  stw       r0, 0x8c(r3)
/* 01A878 8001D878 4800004C */  b         lbl_8001D8C4
lbl_8001D87C:
/* 01A87C 8001D87C 38C30348 */  addi      r6, r3, 0x348
/* 01A880 8001D880 38850008 */  addi      r4, r5, 0x8
/* 01A884 8001D884 E024E000 */  psq_l     f1, 0x0(r4), 1, qr6
/* 01A888 8001D888 D0260000 */  stfs      f1, 0x0(r6)
/* 01A88C 8001D88C 38C3034C */  addi      r6, r3, 0x34c
/* 01A890 8001D890 38850009 */  addi      r4, r5, 0x9
/* 01A894 8001D894 E024E000 */  psq_l     f1, 0x0(r4), 1, qr6
/* 01A898 8001D898 D0260000 */  stfs      f1, 0x0(r6)
/* 01A89C 8001D89C 38C30350 */  addi      r6, r3, 0x350
/* 01A8A0 8001D8A0 3885000A */  addi      r4, r5, 0xa
/* 01A8A4 8001D8A4 E024E000 */  psq_l     f1, 0x0(r4), 1, qr6
/* 01A8A8 8001D8A8 D0260000 */  stfs      f1, 0x0(r6)
/* 01A8AC 8001D8AC 8003008C */  lwz       r0, 0x8c(r3)
/* 01A8B0 8001D8B0 64000200 */  oris      r0, r0, 0x200
/* 01A8B4 8001D8B4 9003008C */  stw       r0, 0x8c(r3)
/* 01A8B8 8001D8B8 4800000C */  b         lbl_8001D8C4
lbl_8001D8BC:
/* 01A8BC 8001D8BC 38600000 */  li        r3, 0x0
/* 01A8C0 8001D8C0 48000010 */  b         lbl_8001D8D0
lbl_8001D8C4:
/* 01A8C4 8001D8C4 38000000 */  li        r0, 0x0
/* 01A8C8 8001D8C8 90030320 */  stw       r0, 0x320(r3)
/* 01A8CC 8001D8CC 38600001 */  li        r3, 0x1
lbl_8001D8D0:
/* 01A8D0 8001D8D0 4E800020 */  blr

glabel frameSetLight
/* 01A8D4 8001D8D4 9421FFD0 */  stwu      r1, -0x30(r1)
/* 01A8D8 8001D8D8 2C040000 */  cmpwi     r4, 0x0
/* 01A8DC 8001D8DC 41800114 */  blt       lbl_8001D9F0
/* 01A8E0 8001D8E0 2C040008 */  cmpwi     r4, 0x8
/* 01A8E4 8001D8E4 4080010C */  bge       lbl_8001D9F0
/* 01A8E8 8001D8E8 1C84003C */  mulli     r4, r4, 0x3c
/* 01A8EC 8001D8EC 38C40140 */  addi      r6, r4, 0x140
/* 01A8F0 8001D8F0 7CC33214 */  add       r6, r3, r6
/* 01A8F4 8001D8F4 38000000 */  li        r0, 0x0
/* 01A8F8 8001D8F8 90060000 */  stw       r0, 0x0(r6)
/* 01A8FC 8001D8FC 88650003 */  lbz       r3, 0x3(r5)
/* 01A900 8001D900 7C600774 */  extsb     r0, r3
/* 01A904 8001D904 2C000000 */  cmpwi     r0, 0x0
/* 01A908 8001D908 41820088 */  beq       lbl_8001D990
/* 01A90C 8001D90C 9061002C */  stw       r3, 0x2c(r1)
/* 01A910 8001D910 3C604330 */  lis       r3, 0x4330
/* 01A914 8001D914 C8628128 */  lfd       f3, D_8018C068@sda21(r0)
/* 01A918 8001D918 90610028 */  stw       r3, 0x28(r1)
/* 01A91C 8001D91C C082811C */  lfs       f4, D_8018C05C@sda21(r0)
/* 01A920 8001D920 C8410028 */  lfd       f2, 0x28(r1)
/* 01A924 8001D924 C0028118 */  lfs       f0, D_8018C058@sda21(r0)
/* 01A928 8001D928 EC421828 */  fsubs     f2, f2, f3
/* 01A92C 8001D92C EC0400BA */  fmadds    f0, f4, f2, f0
/* 01A930 8001D930 D0060028 */  stfs      f0, 0x28(r6)
/* 01A934 8001D934 88050007 */  lbz       r0, 0x7(r5)
/* 01A938 8001D938 C0028120 */  lfs       f0, D_8018C060@sda21(r0)
/* 01A93C 8001D93C 90010024 */  stw       r0, 0x24(r1)
/* 01A940 8001D940 90610020 */  stw       r3, 0x20(r1)
/* 01A944 8001D944 C8410020 */  lfd       f2, 0x20(r1)
/* 01A948 8001D948 EC421828 */  fsubs     f2, f2, f3
/* 01A94C 8001D94C EC020024 */  fdivs     f0, f2, f0
/* 01A950 8001D950 D006002C */  stfs      f0, 0x2c(r6)
/* 01A954 8001D954 8805000E */  lbz       r0, 0xe(r5)
/* 01A958 8001D958 C0028124 */  lfs       f0, D_8018C064@sda21(r0)
/* 01A95C 8001D95C 9001001C */  stw       r0, 0x1c(r1)
/* 01A960 8001D960 90610018 */  stw       r3, 0x18(r1)
/* 01A964 8001D964 C8410018 */  lfd       f2, 0x18(r1)
/* 01A968 8001D968 EC421828 */  fsubs     f2, f2, f3
/* 01A96C 8001D96C EC020024 */  fdivs     f0, f2, f0
/* 01A970 8001D970 D0060030 */  stfs      f0, 0x30(r6)
/* 01A974 8001D974 A8050008 */  lha       r0, 0x8(r5)
/* 01A978 8001D978 B0060034 */  sth       r0, 0x34(r6)
/* 01A97C 8001D97C A805000A */  lha       r0, 0xa(r5)
/* 01A980 8001D980 B0060036 */  sth       r0, 0x36(r6)
/* 01A984 8001D984 A805000C */  lha       r0, 0xc(r5)
/* 01A988 8001D988 B0060038 */  sth       r0, 0x38(r6)
/* 01A98C 8001D98C 4800000C */  b         lbl_8001D998
lbl_8001D990:
/* 01A990 8001D990 C0028100 */  lfs       f0, D_8018C040@sda21(r0)
/* 01A994 8001D994 D0060028 */  stfs      f0, 0x28(r6)
lbl_8001D998:
/* 01A998 8001D998 E005A000 */  psq_l     f0, 0x0(r5), 1, qr2
/* 01A99C 8001D99C D0060010 */  stfs      f0, 0x10(r6)
/* 01A9A0 8001D9A0 38650001 */  addi      r3, r5, 0x1
/* 01A9A4 8001D9A4 E003A000 */  psq_l     f0, 0x0(r3), 1, qr2
/* 01A9A8 8001D9A8 D0060014 */  stfs      f0, 0x14(r6)
/* 01A9AC 8001D9AC 38650002 */  addi      r3, r5, 0x2
/* 01A9B0 8001D9B0 E003A000 */  psq_l     f0, 0x0(r3), 1, qr2
/* 01A9B4 8001D9B4 D0060018 */  stfs      f0, 0x18(r6)
/* 01A9B8 8001D9B8 38860004 */  addi      r4, r6, 0x4
/* 01A9BC 8001D9BC 38650008 */  addi      r3, r5, 0x8
/* 01A9C0 8001D9C0 E023E000 */  psq_l     f1, 0x0(r3), 1, qr6
/* 01A9C4 8001D9C4 D0240000 */  stfs      f1, 0x0(r4)
/* 01A9C8 8001D9C8 38860008 */  addi      r4, r6, 0x8
/* 01A9CC 8001D9CC 38650009 */  addi      r3, r5, 0x9
/* 01A9D0 8001D9D0 E023E000 */  psq_l     f1, 0x0(r3), 1, qr6
/* 01A9D4 8001D9D4 D0240000 */  stfs      f1, 0x0(r4)
/* 01A9D8 8001D9D8 3886000C */  addi      r4, r6, 0xc
/* 01A9DC 8001D9DC 3865000A */  addi      r3, r5, 0xa
/* 01A9E0 8001D9E0 E023E000 */  psq_l     f1, 0x0(r3), 1, qr6
/* 01A9E4 8001D9E4 D0240000 */  stfs      f1, 0x0(r4)
/* 01A9E8 8001D9E8 38600001 */  li        r3, 0x1
/* 01A9EC 8001D9EC 48000008 */  b         lbl_8001D9F4
lbl_8001D9F0:
/* 01A9F0 8001D9F0 38600000 */  li        r3, 0x0
lbl_8001D9F4:
/* 01A9F4 8001D9F4 38210030 */  addi      r1, r1, 0x30
/* 01A9F8 8001D9F8 4E800020 */  blr

glabel frameSetLightCount
/* 01A9FC 8001D9FC 9083013C */  stw       r4, 0x13c(r3)
/* 01AA00 8001DA00 38600001 */  li        r3, 0x1
/* 01AA04 8001DA04 4E800020 */  blr

glabel frameLoadTMEM
/* 01AA08 8001DA08 7C0802A6 */  mflr      r0
/* 01AA0C 8001DA0C 90010004 */  stw       r0, 0x4(r1)
/* 01AA10 8001DA10 9421FFC0 */  stwu      r1, -0x40(r1)
/* 01AA14 8001DA14 93E1003C */  stw       r31, 0x3c(r1)
/* 01AA18 8001DA18 93C10038 */  stw       r30, 0x38(r1)
/* 01AA1C 8001DA1C 93A10034 */  stw       r29, 0x34(r1)
/* 01AA20 8001DA20 7C7D1B78 */  mr        r29, r3
/* 01AA24 8001DA24 7C9E2378 */  mr        r30, r4
/* 01AA28 8001DA28 7CBF2B78 */  mr        r31, r5
/* 01AA2C 8001DA2C 801D007C */  lwz       r0, 0x7c(r29)
/* 01AA30 8001DA30 3C808002 */  lis       r4, frameDrawLine_Setup@ha
/* 01AA34 8001DA34 3C608002 */  lis       r3, frameDrawTriangle_Setup@ha
/* 01AA38 8001DA38 60000001 */  ori       r0, r0, 0x1
/* 01AA3C 8001DA3C 901D007C */  stw       r0, 0x7c(r29)
/* 01AA40 8001DA40 38046998 */  addi      r0, r4, frameDrawLine_Setup@l
/* 01AA44 8001DA44 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 01AA48 8001DA48 901D012C */  stw       r0, 0x12c(r29)
/* 01AA4C 8001DA4C 38037568 */  addi      r0, r3, frameDrawTriangle_Setup@l
/* 01AA50 8001DA50 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 01AA54 8001DA54 901D0130 */  stw       r0, 0x130(r29)
/* 01AA58 8001DA58 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 01AA5C 8001DA5C 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 01AA60 8001DA60 909D0134 */  stw       r4, 0x134(r29)
/* 01AA64 8001DA64 901D0138 */  stw       r0, 0x138(r29)
/* 01AA68 8001DA68 806D8914 */  lwz       r3, gpSystem@sda21(r0)
/* 01AA6C 8001DA6C 80030020 */  lwz       r0, 0x20(r3)
/* 01AA70 8001DA70 2C000005 */  cmpwi     r0, 0x5
/* 01AA74 8001DA74 40820024 */  bne       lbl_8001DA98
/* 01AA78 8001DA78 807D00EC */  lwz       r3, 0xec(r29)
/* 01AA7C 8001DA7C 2C030500 */  cmpwi     r3, 0x500
/* 01AA80 8001DA80 41820010 */  beq       lbl_8001DA90
/* 01AA84 8001DA84 3C03FF83 */  subis     r0, r3, 0x7d
/* 01AA88 8001DA88 2800A800 */  cmplwi    r0, 0xa800
/* 01AA8C 8001DA8C 4082000C */  bne       lbl_8001DA98
lbl_8001DA90:
/* 01AA90 8001DA90 807D00E8 */  lwz       r3, 0xe8(r29)
/* 01AA94 8001DA94 48006F69 */  bl        CopyAndConvertCFB
lbl_8001DA98:
/* 01AA98 8001DA98 1C7F002C */  mulli     r3, r31, 0x2c
/* 01AA9C 8001DA9C 80BD00E8 */  lwz       r5, 0xe8(r29)
/* 01AAA0 8001DAA0 3C9D0004 */  addis     r4, r29, 0x4
/* 01AAA4 8001DAA4 3C630004 */  addis     r3, r3, 0x4
/* 01AAA8 8001DAA8 93E4C340 */  stw       r31, -0x3cc0(r4)
/* 01AAAC 8001DAAC 3863C358 */  subi      r3, r3, 0x3ca8
/* 01AAB0 8001DAB0 7C7D1A14 */  add       r3, r29, r3
/* 01AAB4 8001DAB4 80030004 */  lwz       r0, 0x4(r3)
/* 01AAB8 8001DAB8 2C1E0001 */  cmpwi     r30, 0x1
/* 01AABC 8001DABC 54A4003A */  clrrwi    r4, r5, 2
/* 01AAC0 8001DAC0 540505FE */  clrlwi    r5, r0, 23
/* 01AAC4 8001DAC4 4082000C */  bne       lbl_8001DAD0
/* 01AAC8 8001DAC8 38000000 */  li        r0, 0x0
/* 01AACC 8001DACC 48000008 */  b         lbl_8001DAD4
lbl_8001DAD0:
/* 01AAD0 8001DAD0 38000002 */  li        r0, 0x2
lbl_8001DAD4:
/* 01AAD4 8001DAD4 80DD00DC */  lwz       r6, 0xdc(r29)
/* 01AAD8 8001DAD8 2C060002 */  cmpwi     r6, 0x2
/* 01AADC 8001DADC 41820088 */  beq       lbl_8001DB64
/* 01AAE0 8001DAE0 40800014 */  bge       lbl_8001DAF4
/* 01AAE4 8001DAE4 2C060000 */  cmpwi     r6, 0x0
/* 01AAE8 8001DAE8 41820018 */  beq       lbl_8001DB00
/* 01AAEC 8001DAEC 4080004C */  bge       lbl_8001DB38
/* 01AAF0 8001DAF0 480000DC */  b         lbl_8001DBCC
lbl_8001DAF4:
/* 01AAF4 8001DAF4 2C060004 */  cmpwi     r6, 0x4
/* 01AAF8 8001DAF8 408000D4 */  bge       lbl_8001DBCC
/* 01AAFC 8001DAFC 4800009C */  b         lbl_8001DB98
lbl_8001DB00:
/* 01AB00 8001DB00 A8C30024 */  lha       r6, 0x24(r3)
/* 01AB04 8001DB04 811D00E0 */  lwz       r8, 0xe0(r29)
/* 01AB08 8001DB08 38C60001 */  addi      r6, r6, 0x1
/* 01AB0C 8001DB0C A9230020 */  lha       r9, 0x20(r3)
/* 01AB10 8001DB10 7CC62670 */  srawi     r6, r6, 4
/* 01AB14 8001DB14 A8E30022 */  lha       r7, 0x22(r3)
/* 01AB18 8001DB18 7D290630 */  sraw      r9, r9, r0
/* 01AB1C 8001DB1C 7D290E70 */  srawi     r9, r9, 1
/* 01AB20 8001DB20 39080001 */  addi      r8, r8, 0x1
/* 01AB24 8001DB24 7D080E70 */  srawi     r8, r8, 1
/* 01AB28 8001DB28 7CE00630 */  sraw      r0, r7, r0
/* 01AB2C 8001DB2C 7C0801D6 */  mullw     r0, r8, r0
/* 01AB30 8001DB30 7CE90214 */  add       r7, r9, r0
/* 01AB34 8001DB34 480000A0 */  b         lbl_8001DBD4
lbl_8001DB38:
/* 01AB38 8001DB38 A8C30024 */  lha       r6, 0x24(r3)
/* 01AB3C 8001DB3C A9230020 */  lha       r9, 0x20(r3)
/* 01AB40 8001DB40 38C60001 */  addi      r6, r6, 0x1
/* 01AB44 8001DB44 A8E30022 */  lha       r7, 0x22(r3)
/* 01AB48 8001DB48 7CC61E70 */  srawi     r6, r6, 3
/* 01AB4C 8001DB4C 811D00E0 */  lwz       r8, 0xe0(r29)
/* 01AB50 8001DB50 7D290630 */  sraw      r9, r9, r0
/* 01AB54 8001DB54 7CE00630 */  sraw      r0, r7, r0
/* 01AB58 8001DB58 7C0801D6 */  mullw     r0, r8, r0
/* 01AB5C 8001DB5C 7CE90214 */  add       r7, r9, r0
/* 01AB60 8001DB60 48000074 */  b         lbl_8001DBD4
lbl_8001DB64:
/* 01AB64 8001DB64 A8C30024 */  lha       r6, 0x24(r3)
/* 01AB68 8001DB68 811D00E0 */  lwz       r8, 0xe0(r29)
/* 01AB6C 8001DB6C 38C60001 */  addi      r6, r6, 0x1
/* 01AB70 8001DB70 A9230020 */  lha       r9, 0x20(r3)
/* 01AB74 8001DB74 7CC61670 */  srawi     r6, r6, 2
/* 01AB78 8001DB78 A8E30022 */  lha       r7, 0x22(r3)
/* 01AB7C 8001DB7C 7D290630 */  sraw      r9, r9, r0
/* 01AB80 8001DB80 5508083C */  slwi      r8, r8, 1
/* 01AB84 8001DB84 7CE00630 */  sraw      r0, r7, r0
/* 01AB88 8001DB88 7C0801D6 */  mullw     r0, r8, r0
/* 01AB8C 8001DB8C 5527083C */  slwi      r7, r9, 1
/* 01AB90 8001DB90 7CE70214 */  add       r7, r7, r0
/* 01AB94 8001DB94 48000040 */  b         lbl_8001DBD4
lbl_8001DB98:
/* 01AB98 8001DB98 A8C30024 */  lha       r6, 0x24(r3)
/* 01AB9C 8001DB9C 811D00E0 */  lwz       r8, 0xe0(r29)
/* 01ABA0 8001DBA0 38C60001 */  addi      r6, r6, 0x1
/* 01ABA4 8001DBA4 A9230020 */  lha       r9, 0x20(r3)
/* 01ABA8 8001DBA8 7CC60E70 */  srawi     r6, r6, 1
/* 01ABAC 8001DBAC A8E30022 */  lha       r7, 0x22(r3)
/* 01ABB0 8001DBB0 7D290630 */  sraw      r9, r9, r0
/* 01ABB4 8001DBB4 5508103A */  slwi      r8, r8, 2
/* 01ABB8 8001DBB8 7CE00630 */  sraw      r0, r7, r0
/* 01ABBC 8001DBBC 7C0801D6 */  mullw     r0, r8, r0
/* 01ABC0 8001DBC0 5527103A */  slwi      r7, r9, 2
/* 01ABC4 8001DBC4 7CE70214 */  add       r7, r7, r0
/* 01ABC8 8001DBC8 4800000C */  b         lbl_8001DBD4
lbl_8001DBCC:
/* 01ABCC 8001DBCC 38600000 */  li        r3, 0x0
/* 01ABD0 8001DBD0 48000D64 */  b         lbl_8001E934
lbl_8001DBD4:
/* 01ABD4 8001DBD4 801D00EC */  lwz       r0, 0xec(r29)
/* 01ABD8 8001DBD8 2C1E0001 */  cmpwi     r30, 0x1
/* 01ABDC 8001DBDC 7C843A14 */  add       r4, r4, r7
/* 01ABE0 8001DBE0 5400027E */  clrlwi    r0, r0, 9
/* 01ABE4 8001DBE4 7C003A14 */  add       r0, r0, r7
/* 01ABE8 8001DBE8 901D21F8 */  stw       r0, 0x21f8(r29)
/* 01ABEC 8001DBEC 38000000 */  li        r0, 0x0
/* 01ABF0 8001DBF0 40820294 */  bne       lbl_8001DE84
/* 01ABF4 8001DBF4 A9830026 */  lha       r12, 0x26(r3)
/* 01ABF8 8001DBF8 2C0C0000 */  cmpwi     r12, 0x0
/* 01ABFC 8001DBFC 40820134 */  bne       lbl_8001DD30
/* 01AC00 8001DC00 48000004 */  b         lbl_8001DC04
lbl_8001DC04:
/* 01AC04 8001DC04 2C060000 */  cmpwi     r6, 0x0
/* 01AC08 8001DC08 7CC73378 */  mr        r7, r6
/* 01AC0C 8001DC0C 41820120 */  beq       lbl_8001DD2C
/* 01AC10 8001DC10 54E3F0BE */  srwi      r3, r7, 2
/* 01AC14 8001DC14 28030000 */  cmplwi    r3, 0x0
/* 01AC18 8001DC18 7C6903A6 */  mtctr     r3
/* 01AC1C 8001DC1C 418200D4 */  beq       lbl_8001DCF0
/* 01AC20 8001DC20 48000004 */  b         lbl_8001DC24
lbl_8001DC24:
/* 01AC24 8001DC24 54A31838 */  slwi      r3, r5, 3
/* 01AC28 8001DC28 81040000 */  lwz       r8, 0x0(r4)
/* 01AC2C 8001DC2C 81240004 */  lwz       r9, 0x4(r4)
/* 01AC30 8001DC30 7D5D1A14 */  add       r10, r29, r3
/* 01AC34 8001DC34 7C004214 */  add       r0, r0, r8
/* 01AC38 8001DC38 910A0C18 */  stw       r8, 0xc18(r10)
/* 01AC3C 8001DC3C 7C004A14 */  add       r0, r0, r9
/* 01AC40 8001DC40 38650001 */  addi      r3, r5, 0x1
/* 01AC44 8001DC44 7C002A78 */  xor       r0, r0, r5
/* 01AC48 8001DC48 912A0C1C */  stw       r9, 0xc1c(r10)
/* 01AC4C 8001DC4C 38840008 */  addi      r4, r4, 0x8
/* 01AC50 8001DC50 546505FE */  clrlwi    r5, r3, 23
/* 01AC54 8001DC54 81040000 */  lwz       r8, 0x0(r4)
/* 01AC58 8001DC58 54A31838 */  slwi      r3, r5, 3
/* 01AC5C 8001DC5C 81240004 */  lwz       r9, 0x4(r4)
/* 01AC60 8001DC60 7D5D1A14 */  add       r10, r29, r3
/* 01AC64 8001DC64 910A0C18 */  stw       r8, 0xc18(r10)
/* 01AC68 8001DC68 7C004214 */  add       r0, r0, r8
/* 01AC6C 8001DC6C 7C004A14 */  add       r0, r0, r9
/* 01AC70 8001DC70 912A0C1C */  stw       r9, 0xc1c(r10)
/* 01AC74 8001DC74 38840008 */  addi      r4, r4, 0x8
/* 01AC78 8001DC78 38650001 */  addi      r3, r5, 0x1
/* 01AC7C 8001DC7C 7C002A78 */  xor       r0, r0, r5
/* 01AC80 8001DC80 81040000 */  lwz       r8, 0x0(r4)
/* 01AC84 8001DC84 546505FE */  clrlwi    r5, r3, 23
/* 01AC88 8001DC88 81240004 */  lwz       r9, 0x4(r4)
/* 01AC8C 8001DC8C 54A31838 */  slwi      r3, r5, 3
/* 01AC90 8001DC90 7D5D1A14 */  add       r10, r29, r3
/* 01AC94 8001DC94 910A0C18 */  stw       r8, 0xc18(r10)
/* 01AC98 8001DC98 7C004214 */  add       r0, r0, r8
/* 01AC9C 8001DC9C 7C004A14 */  add       r0, r0, r9
/* 01ACA0 8001DCA0 912A0C1C */  stw       r9, 0xc1c(r10)
/* 01ACA4 8001DCA4 38840008 */  addi      r4, r4, 0x8
/* 01ACA8 8001DCA8 38650001 */  addi      r3, r5, 0x1
/* 01ACAC 8001DCAC 7C002A78 */  xor       r0, r0, r5
/* 01ACB0 8001DCB0 81040000 */  lwz       r8, 0x0(r4)
/* 01ACB4 8001DCB4 546505FE */  clrlwi    r5, r3, 23
/* 01ACB8 8001DCB8 81240004 */  lwz       r9, 0x4(r4)
/* 01ACBC 8001DCBC 54A31838 */  slwi      r3, r5, 3
/* 01ACC0 8001DCC0 7D5D1A14 */  add       r10, r29, r3
/* 01ACC4 8001DCC4 910A0C18 */  stw       r8, 0xc18(r10)
/* 01ACC8 8001DCC8 7C004214 */  add       r0, r0, r8
/* 01ACCC 8001DCCC 7C004A14 */  add       r0, r0, r9
/* 01ACD0 8001DCD0 912A0C1C */  stw       r9, 0xc1c(r10)
/* 01ACD4 8001DCD4 38650001 */  addi      r3, r5, 0x1
/* 01ACD8 8001DCD8 7C002A78 */  xor       r0, r0, r5
/* 01ACDC 8001DCDC 38840008 */  addi      r4, r4, 0x8
/* 01ACE0 8001DCE0 546505FE */  clrlwi    r5, r3, 23
/* 01ACE4 8001DCE4 4200FF40 */  bdnz      lbl_8001DC24
/* 01ACE8 8001DCE8 70E70003 */  andi.     r7, r7, 0x3
/* 01ACEC 8001DCEC 41820040 */  beq       lbl_8001DD2C
lbl_8001DCF0:
/* 01ACF0 8001DCF0 7CE903A6 */  mtctr     r7
/* 01ACF4 8001DCF4 48000004 */  b         lbl_8001DCF8
lbl_8001DCF8:
/* 01ACF8 8001DCF8 54A31838 */  slwi      r3, r5, 3
/* 01ACFC 8001DCFC 81040000 */  lwz       r8, 0x0(r4)
/* 01AD00 8001DD00 81240004 */  lwz       r9, 0x4(r4)
/* 01AD04 8001DD04 7D5D1A14 */  add       r10, r29, r3
/* 01AD08 8001DD08 7C004214 */  add       r0, r0, r8
/* 01AD0C 8001DD0C 910A0C18 */  stw       r8, 0xc18(r10)
/* 01AD10 8001DD10 7C004A14 */  add       r0, r0, r9
/* 01AD14 8001DD14 38650001 */  addi      r3, r5, 0x1
/* 01AD18 8001DD18 7C002A78 */  xor       r0, r0, r5
/* 01AD1C 8001DD1C 912A0C1C */  stw       r9, 0xc1c(r10)
/* 01AD20 8001DD20 38840008 */  addi      r4, r4, 0x8
/* 01AD24 8001DD24 546505FE */  clrlwi    r5, r3, 23
/* 01AD28 8001DD28 4200FFD0 */  bdnz      lbl_8001DCF8
lbl_8001DD2C:
/* 01AD2C 8001DD2C 48000C00 */  b         lbl_8001E92C
lbl_8001DD30:
/* 01AD30 8001DD30 39600000 */  li        r11, 0x0
/* 01AD34 8001DD34 48000004 */  b         lbl_8001DD38
lbl_8001DD38:
/* 01AD38 8001DD38 48000004 */  b         lbl_8001DD3C
lbl_8001DD3C:
/* 01AD3C 8001DD3C 4800013C */  b         lbl_8001DE78
lbl_8001DD40:
/* 01AD40 8001DD40 48000004 */  b         lbl_8001DD44
lbl_8001DD44:
/* 01AD44 8001DD44 4800003C */  b         lbl_8001DD80
lbl_8001DD48:
/* 01AD48 8001DD48 54A31838 */  slwi      r3, r5, 3
/* 01AD4C 8001DD4C 81040000 */  lwz       r8, 0x0(r4)
/* 01AD50 8001DD50 81240004 */  lwz       r9, 0x4(r4)
/* 01AD54 8001DD54 7CFD1A14 */  add       r7, r29, r3
/* 01AD58 8001DD58 7C004214 */  add       r0, r0, r8
/* 01AD5C 8001DD5C 91070C18 */  stw       r8, 0xc18(r7)
/* 01AD60 8001DD60 7C004A14 */  add       r0, r0, r9
/* 01AD64 8001DD64 38650001 */  addi      r3, r5, 0x1
/* 01AD68 8001DD68 7C002A78 */  xor       r0, r0, r5
/* 01AD6C 8001DD6C 91270C1C */  stw       r9, 0xc1c(r7)
/* 01AD70 8001DD70 38840008 */  addi      r4, r4, 0x8
/* 01AD74 8001DD74 546505FE */  clrlwi    r5, r3, 23
/* 01AD78 8001DD78 7D6B6214 */  add       r11, r11, r12
/* 01AD7C 8001DD7C 38C6FFFF */  subi      r6, r6, 0x1
lbl_8001DD80:
/* 01AD80 8001DD80 2C060000 */  cmpwi     r6, 0x0
/* 01AD84 8001DD84 41820010 */  beq       lbl_8001DD94
/* 01AD88 8001DD88 55630528 */  rlwinm    r3, r11, 0, 20, 20
/* 01AD8C 8001DD8C 2C030000 */  cmpwi     r3, 0x0
/* 01AD90 8001DD90 4182FFB8 */  beq       lbl_8001DD48
lbl_8001DD94:
/* 01AD94 8001DD94 807D00DC */  lwz       r3, 0xdc(r29)
/* 01AD98 8001DD98 396BF800 */  subi      r11, r11, 0x800
/* 01AD9C 8001DD9C 2C030003 */  cmpwi     r3, 0x3
/* 01ADA0 8001DDA0 40820080 */  bne       lbl_8001DE20
/* 01ADA4 8001DDA4 39400000 */  li        r10, 0x0
/* 01ADA8 8001DDA8 48000004 */  b         lbl_8001DDAC
lbl_8001DDAC:
/* 01ADAC 8001DDAC 48000004 */  b         lbl_8001DDB0
lbl_8001DDB0:
/* 01ADB0 8001DDB0 48000058 */  b         lbl_8001DE08
lbl_8001DDB4:
/* 01ADB4 8001DDB4 81040000 */  lwz       r8, 0x0(r4)
/* 01ADB8 8001DDB8 2C0A0000 */  cmpwi     r10, 0x0
/* 01ADBC 8001DDBC 81240004 */  lwz       r9, 0x4(r4)
/* 01ADC0 8001DDC0 38840008 */  addi      r4, r4, 0x8
/* 01ADC4 8001DDC4 7C004214 */  add       r0, r0, r8
/* 01ADC8 8001DDC8 7C004A14 */  add       r0, r0, r9
/* 01ADCC 8001DDCC 7C002A78 */  xor       r0, r0, r5
/* 01ADD0 8001DDD0 4182000C */  beq       lbl_8001DDDC
/* 01ADD4 8001DDD4 3860FFFF */  li        r3, -0x1
/* 01ADD8 8001DDD8 48000008 */  b         lbl_8001DDE0
lbl_8001DDDC:
/* 01ADDC 8001DDDC 38600001 */  li        r3, 0x1
lbl_8001DDE0:
/* 01ADE0 8001DDE0 7C651A14 */  add       r3, r5, r3
/* 01ADE4 8001DDE4 54631838 */  slwi      r3, r3, 3
/* 01ADE8 8001DDE8 7CFD1A14 */  add       r7, r29, r3
/* 01ADEC 8001DDEC 91070C18 */  stw       r8, 0xc18(r7)
/* 01ADF0 8001DDF0 38650001 */  addi      r3, r5, 0x1
/* 01ADF4 8001DDF4 546505FE */  clrlwi    r5, r3, 23
/* 01ADF8 8001DDF8 91270C1C */  stw       r9, 0xc1c(r7)
/* 01ADFC 8001DDFC 7D6B6214 */  add       r11, r11, r12
/* 01AE00 8001DE00 38C6FFFF */  subi      r6, r6, 0x1
/* 01AE04 8001DE04 694A0001 */  xori      r10, r10, 0x1
lbl_8001DE08:
/* 01AE08 8001DE08 2C060000 */  cmpwi     r6, 0x0
/* 01AE0C 8001DE0C 41820068 */  beq       lbl_8001DE74
/* 01AE10 8001DE10 55630528 */  rlwinm    r3, r11, 0, 20, 20
/* 01AE14 8001DE14 2C030000 */  cmpwi     r3, 0x0
/* 01AE18 8001DE18 4182FF9C */  beq       lbl_8001DDB4
/* 01AE1C 8001DE1C 48000058 */  b         lbl_8001DE74
lbl_8001DE20:
/* 01AE20 8001DE20 48000004 */  b         lbl_8001DE24
lbl_8001DE24:
/* 01AE24 8001DE24 4800003C */  b         lbl_8001DE60
lbl_8001DE28:
/* 01AE28 8001DE28 54A31838 */  slwi      r3, r5, 3
/* 01AE2C 8001DE2C 81040000 */  lwz       r8, 0x0(r4)
/* 01AE30 8001DE30 81240004 */  lwz       r9, 0x4(r4)
/* 01AE34 8001DE34 7CFD1A14 */  add       r7, r29, r3
/* 01AE38 8001DE38 7C004214 */  add       r0, r0, r8
/* 01AE3C 8001DE3C 91270C18 */  stw       r9, 0xc18(r7)
/* 01AE40 8001DE40 7C004A14 */  add       r0, r0, r9
/* 01AE44 8001DE44 38650001 */  addi      r3, r5, 0x1
/* 01AE48 8001DE48 7C002A78 */  xor       r0, r0, r5
/* 01AE4C 8001DE4C 91070C1C */  stw       r8, 0xc1c(r7)
/* 01AE50 8001DE50 38840008 */  addi      r4, r4, 0x8
/* 01AE54 8001DE54 546505FE */  clrlwi    r5, r3, 23
/* 01AE58 8001DE58 7D6B6214 */  add       r11, r11, r12
/* 01AE5C 8001DE5C 38C6FFFF */  subi      r6, r6, 0x1
lbl_8001DE60:
/* 01AE60 8001DE60 2C060000 */  cmpwi     r6, 0x0
/* 01AE64 8001DE64 41820010 */  beq       lbl_8001DE74
/* 01AE68 8001DE68 55630528 */  rlwinm    r3, r11, 0, 20, 20
/* 01AE6C 8001DE6C 2C030000 */  cmpwi     r3, 0x0
/* 01AE70 8001DE70 4182FFB8 */  beq       lbl_8001DE28
lbl_8001DE74:
/* 01AE74 8001DE74 396BF800 */  subi      r11, r11, 0x800
lbl_8001DE78:
/* 01AE78 8001DE78 2C060000 */  cmpwi     r6, 0x0
/* 01AE7C 8001DE7C 4082FEC4 */  bne       lbl_8001DD40
/* 01AE80 8001DE80 48000AAC */  b         lbl_8001E92C
lbl_8001DE84:
/* 01AE84 8001DE84 A8E30022 */  lha       r7, 0x22(r3)
/* 01AE88 8001DE88 A8C30026 */  lha       r6, 0x26(r3)
/* 01AE8C 8001DE8C 813D00DC */  lwz       r9, 0xdc(r29)
/* 01AE90 8001DE90 7CE73050 */  subf      r7, r7, r6
/* 01AE94 8001DE94 A9030020 */  lha       r8, 0x20(r3)
/* 01AE98 8001DE98 A8C30024 */  lha       r6, 0x24(r3)
/* 01AE9C 8001DE9C 39470004 */  addi      r10, r7, 0x4
/* 01AEA0 8001DEA0 2C090002 */  cmpwi     r9, 0x2
/* 01AEA4 8001DEA4 80FD00E0 */  lwz       r7, 0xe0(r29)
/* 01AEA8 8001DEA8 7D083050 */  subf      r8, r8, r6
/* 01AEAC 8001DEAC 7D461670 */  srawi     r6, r10, 2
/* 01AEB0 8001DEB0 39080004 */  addi      r8, r8, 0x4
/* 01AEB4 8001DEB4 7D081670 */  srawi     r8, r8, 2
/* 01AEB8 8001DEB8 4182035C */  beq       lbl_8001E214
/* 01AEBC 8001DEBC 40800010 */  bge       lbl_8001DECC
/* 01AEC0 8001DEC0 2C090000 */  cmpwi     r9, 0x0
/* 01AEC4 8001DEC4 40800014 */  bge       lbl_8001DED8
/* 01AEC8 8001DEC8 48000A5C */  b         lbl_8001E924
lbl_8001DECC:
/* 01AECC 8001DECC 2C090004 */  cmpwi     r9, 0x4
/* 01AED0 8001DED0 40800A54 */  bge       lbl_8001E924
/* 01AED4 8001DED4 480006C8 */  b         lbl_8001E59C
lbl_8001DED8:
/* 01AED8 8001DED8 8123000C */  lwz       r9, 0xc(r3)
/* 01AEDC 8001DEDC 55291838 */  slwi      r9, r9, 3
/* 01AEE0 8001DEE0 7C084800 */  cmpw      r8, r9
/* 01AEE4 8001DEE4 41800008 */  blt       lbl_8001DEEC
/* 01AEE8 8001DEE8 7D284B78 */  mr        r8, r9
lbl_8001DEEC:
/* 01AEEC 8001DEEC 54A51838 */  slwi      r5, r5, 3
/* 01AEF0 8001DEF0 39800000 */  li        r12, 0x0
/* 01AEF4 8001DEF4 48000004 */  b         lbl_8001DEF8
lbl_8001DEF8:
/* 01AEF8 8001DEF8 48000004 */  b         lbl_8001DEFC
lbl_8001DEFC:
/* 01AEFC 8001DEFC 4800030C */  b         lbl_8001E208
lbl_8001DF00:
/* 01AF00 8001DF00 7C9F2378 */  mr        r31, r4
/* 01AF04 8001DF04 558907FE */  clrlwi    r9, r12, 31
/* 01AF08 8001DF08 48000004 */  b         lbl_8001DF0C
lbl_8001DF0C:
/* 01AF0C 8001DF0C 2C090000 */  cmpwi     r9, 0x0
/* 01AF10 8001DF10 41820184 */  beq       lbl_8001E094
/* 01AF14 8001DF14 2C080000 */  cmpwi     r8, 0x0
/* 01AF18 8001DF18 7D0A4378 */  mr        r10, r8
/* 01AF1C 8001DF1C 41820174 */  beq       lbl_8001E090
/* 01AF20 8001DF20 5549E8FE */  srwi      r9, r10, 3
/* 01AF24 8001DF24 28090000 */  cmplwi    r9, 0x0
/* 01AF28 8001DF28 7D2903A6 */  mtctr     r9
/* 01AF2C 8001DF2C 41820134 */  beq       lbl_8001E060
/* 01AF30 8001DF30 48000004 */  b         lbl_8001DF34
lbl_8001DF34:
/* 01AF34 8001DF34 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01AF38 8001DF38 68A90004 */  xori      r9, r5, 0x4
/* 01AF3C 8001DF3C 39690C18 */  addi      r11, r9, 0xc18
/* 01AF40 8001DF40 7C00F214 */  add       r0, r0, r30
/* 01AF44 8001DF44 7FDD59AE */  stbx      r30, r29, r11
/* 01AF48 8001DF48 3BFF0001 */  addi      r31, r31, 0x1
/* 01AF4C 8001DF4C 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01AF50 8001DF50 7C002A78 */  xor       r0, r0, r5
/* 01AF54 8001DF54 39250001 */  addi      r9, r5, 0x1
/* 01AF58 8001DF58 5525053E */  clrlwi    r5, r9, 20
/* 01AF5C 8001DF5C 68A90004 */  xori      r9, r5, 0x4
/* 01AF60 8001DF60 39690C18 */  addi      r11, r9, 0xc18
/* 01AF64 8001DF64 7C00F214 */  add       r0, r0, r30
/* 01AF68 8001DF68 7FDD59AE */  stbx      r30, r29, r11
/* 01AF6C 8001DF6C 3BFF0001 */  addi      r31, r31, 0x1
/* 01AF70 8001DF70 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01AF74 8001DF74 7C002A78 */  xor       r0, r0, r5
/* 01AF78 8001DF78 39250001 */  addi      r9, r5, 0x1
/* 01AF7C 8001DF7C 5525053E */  clrlwi    r5, r9, 20
/* 01AF80 8001DF80 68A90004 */  xori      r9, r5, 0x4
/* 01AF84 8001DF84 39690C18 */  addi      r11, r9, 0xc18
/* 01AF88 8001DF88 7C00F214 */  add       r0, r0, r30
/* 01AF8C 8001DF8C 7FDD59AE */  stbx      r30, r29, r11
/* 01AF90 8001DF90 3BFF0001 */  addi      r31, r31, 0x1
/* 01AF94 8001DF94 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01AF98 8001DF98 7C002A78 */  xor       r0, r0, r5
/* 01AF9C 8001DF9C 39250001 */  addi      r9, r5, 0x1
/* 01AFA0 8001DFA0 5525053E */  clrlwi    r5, r9, 20
/* 01AFA4 8001DFA4 68A90004 */  xori      r9, r5, 0x4
/* 01AFA8 8001DFA8 39690C18 */  addi      r11, r9, 0xc18
/* 01AFAC 8001DFAC 7C00F214 */  add       r0, r0, r30
/* 01AFB0 8001DFB0 7FDD59AE */  stbx      r30, r29, r11
/* 01AFB4 8001DFB4 3BFF0001 */  addi      r31, r31, 0x1
/* 01AFB8 8001DFB8 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01AFBC 8001DFBC 7C002A78 */  xor       r0, r0, r5
/* 01AFC0 8001DFC0 39250001 */  addi      r9, r5, 0x1
/* 01AFC4 8001DFC4 5525053E */  clrlwi    r5, r9, 20
/* 01AFC8 8001DFC8 68A90004 */  xori      r9, r5, 0x4
/* 01AFCC 8001DFCC 39690C18 */  addi      r11, r9, 0xc18
/* 01AFD0 8001DFD0 7C00F214 */  add       r0, r0, r30
/* 01AFD4 8001DFD4 7FDD59AE */  stbx      r30, r29, r11
/* 01AFD8 8001DFD8 3BFF0001 */  addi      r31, r31, 0x1
/* 01AFDC 8001DFDC 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01AFE0 8001DFE0 7C002A78 */  xor       r0, r0, r5
/* 01AFE4 8001DFE4 39250001 */  addi      r9, r5, 0x1
/* 01AFE8 8001DFE8 5525053E */  clrlwi    r5, r9, 20
/* 01AFEC 8001DFEC 68A90004 */  xori      r9, r5, 0x4
/* 01AFF0 8001DFF0 39690C18 */  addi      r11, r9, 0xc18
/* 01AFF4 8001DFF4 7C00F214 */  add       r0, r0, r30
/* 01AFF8 8001DFF8 7FDD59AE */  stbx      r30, r29, r11
/* 01AFFC 8001DFFC 3BFF0001 */  addi      r31, r31, 0x1
/* 01B000 8001E000 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B004 8001E004 7C002A78 */  xor       r0, r0, r5
/* 01B008 8001E008 39250001 */  addi      r9, r5, 0x1
/* 01B00C 8001E00C 5525053E */  clrlwi    r5, r9, 20
/* 01B010 8001E010 68A90004 */  xori      r9, r5, 0x4
/* 01B014 8001E014 39690C18 */  addi      r11, r9, 0xc18
/* 01B018 8001E018 7C00F214 */  add       r0, r0, r30
/* 01B01C 8001E01C 7FDD59AE */  stbx      r30, r29, r11
/* 01B020 8001E020 3BFF0001 */  addi      r31, r31, 0x1
/* 01B024 8001E024 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B028 8001E028 7C002A78 */  xor       r0, r0, r5
/* 01B02C 8001E02C 39250001 */  addi      r9, r5, 0x1
/* 01B030 8001E030 5525053E */  clrlwi    r5, r9, 20
/* 01B034 8001E034 68A90004 */  xori      r9, r5, 0x4
/* 01B038 8001E038 39690C18 */  addi      r11, r9, 0xc18
/* 01B03C 8001E03C 7C00F214 */  add       r0, r0, r30
/* 01B040 8001E040 7FDD59AE */  stbx      r30, r29, r11
/* 01B044 8001E044 39250001 */  addi      r9, r5, 0x1
/* 01B048 8001E048 7C002A78 */  xor       r0, r0, r5
/* 01B04C 8001E04C 3BFF0001 */  addi      r31, r31, 0x1
/* 01B050 8001E050 5525053E */  clrlwi    r5, r9, 20
/* 01B054 8001E054 4200FEE0 */  bdnz      lbl_8001DF34
/* 01B058 8001E058 714A0007 */  andi.     r10, r10, 0x7
/* 01B05C 8001E05C 41820034 */  beq       lbl_8001E090
lbl_8001E060:
/* 01B060 8001E060 7D4903A6 */  mtctr     r10
/* 01B064 8001E064 48000004 */  b         lbl_8001E068
lbl_8001E068:
/* 01B068 8001E068 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B06C 8001E06C 68A90004 */  xori      r9, r5, 0x4
/* 01B070 8001E070 39690C18 */  addi      r11, r9, 0xc18
/* 01B074 8001E074 7C00F214 */  add       r0, r0, r30
/* 01B078 8001E078 7FDD59AE */  stbx      r30, r29, r11
/* 01B07C 8001E07C 39250001 */  addi      r9, r5, 0x1
/* 01B080 8001E080 7C002A78 */  xor       r0, r0, r5
/* 01B084 8001E084 3BFF0001 */  addi      r31, r31, 0x1
/* 01B088 8001E088 5525053E */  clrlwi    r5, r9, 20
/* 01B08C 8001E08C 4200FFDC */  bdnz      lbl_8001E068
lbl_8001E090:
/* 01B090 8001E090 4800015C */  b         lbl_8001E1EC
lbl_8001E094:
/* 01B094 8001E094 2C080000 */  cmpwi     r8, 0x0
/* 01B098 8001E098 7D0A4378 */  mr        r10, r8
/* 01B09C 8001E09C 41820150 */  beq       lbl_8001E1EC
/* 01B0A0 8001E0A0 5549E8FE */  srwi      r9, r10, 3
/* 01B0A4 8001E0A4 28090000 */  cmplwi    r9, 0x0
/* 01B0A8 8001E0A8 7D2903A6 */  mtctr     r9
/* 01B0AC 8001E0AC 41820114 */  beq       lbl_8001E1C0
/* 01B0B0 8001E0B0 48000004 */  b         lbl_8001E0B4
lbl_8001E0B4:
/* 01B0B4 8001E0B4 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B0B8 8001E0B8 39650C18 */  addi      r11, r5, 0xc18
/* 01B0BC 8001E0BC 3BFF0001 */  addi      r31, r31, 0x1
/* 01B0C0 8001E0C0 7FDD59AE */  stbx      r30, r29, r11
/* 01B0C4 8001E0C4 7C00F214 */  add       r0, r0, r30
/* 01B0C8 8001E0C8 39250001 */  addi      r9, r5, 0x1
/* 01B0CC 8001E0CC 7C002A78 */  xor       r0, r0, r5
/* 01B0D0 8001E0D0 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B0D4 8001E0D4 5525053E */  clrlwi    r5, r9, 20
/* 01B0D8 8001E0D8 39650C18 */  addi      r11, r5, 0xc18
/* 01B0DC 8001E0DC 7C00F214 */  add       r0, r0, r30
/* 01B0E0 8001E0E0 7FDD59AE */  stbx      r30, r29, r11
/* 01B0E4 8001E0E4 3BFF0001 */  addi      r31, r31, 0x1
/* 01B0E8 8001E0E8 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B0EC 8001E0EC 7C002A78 */  xor       r0, r0, r5
/* 01B0F0 8001E0F0 39250001 */  addi      r9, r5, 0x1
/* 01B0F4 8001E0F4 5525053E */  clrlwi    r5, r9, 20
/* 01B0F8 8001E0F8 39650C18 */  addi      r11, r5, 0xc18
/* 01B0FC 8001E0FC 7C00F214 */  add       r0, r0, r30
/* 01B100 8001E100 7FDD59AE */  stbx      r30, r29, r11
/* 01B104 8001E104 3BFF0001 */  addi      r31, r31, 0x1
/* 01B108 8001E108 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B10C 8001E10C 7C002A78 */  xor       r0, r0, r5
/* 01B110 8001E110 39250001 */  addi      r9, r5, 0x1
/* 01B114 8001E114 5525053E */  clrlwi    r5, r9, 20
/* 01B118 8001E118 39650C18 */  addi      r11, r5, 0xc18
/* 01B11C 8001E11C 7C00F214 */  add       r0, r0, r30
/* 01B120 8001E120 7FDD59AE */  stbx      r30, r29, r11
/* 01B124 8001E124 3BFF0001 */  addi      r31, r31, 0x1
/* 01B128 8001E128 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B12C 8001E12C 7C002A78 */  xor       r0, r0, r5
/* 01B130 8001E130 39250001 */  addi      r9, r5, 0x1
/* 01B134 8001E134 5525053E */  clrlwi    r5, r9, 20
/* 01B138 8001E138 39650C18 */  addi      r11, r5, 0xc18
/* 01B13C 8001E13C 7C00F214 */  add       r0, r0, r30
/* 01B140 8001E140 7FDD59AE */  stbx      r30, r29, r11
/* 01B144 8001E144 3BFF0001 */  addi      r31, r31, 0x1
/* 01B148 8001E148 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B14C 8001E14C 7C002A78 */  xor       r0, r0, r5
/* 01B150 8001E150 39250001 */  addi      r9, r5, 0x1
/* 01B154 8001E154 5525053E */  clrlwi    r5, r9, 20
/* 01B158 8001E158 39650C18 */  addi      r11, r5, 0xc18
/* 01B15C 8001E15C 7C00F214 */  add       r0, r0, r30
/* 01B160 8001E160 7FDD59AE */  stbx      r30, r29, r11
/* 01B164 8001E164 3BFF0001 */  addi      r31, r31, 0x1
/* 01B168 8001E168 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B16C 8001E16C 7C002A78 */  xor       r0, r0, r5
/* 01B170 8001E170 39250001 */  addi      r9, r5, 0x1
/* 01B174 8001E174 5525053E */  clrlwi    r5, r9, 20
/* 01B178 8001E178 39650C18 */  addi      r11, r5, 0xc18
/* 01B17C 8001E17C 7C00F214 */  add       r0, r0, r30
/* 01B180 8001E180 7FDD59AE */  stbx      r30, r29, r11
/* 01B184 8001E184 3BFF0001 */  addi      r31, r31, 0x1
/* 01B188 8001E188 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B18C 8001E18C 7C002A78 */  xor       r0, r0, r5
/* 01B190 8001E190 39250001 */  addi      r9, r5, 0x1
/* 01B194 8001E194 5525053E */  clrlwi    r5, r9, 20
/* 01B198 8001E198 39650C18 */  addi      r11, r5, 0xc18
/* 01B19C 8001E19C 7C00F214 */  add       r0, r0, r30
/* 01B1A0 8001E1A0 7FDD59AE */  stbx      r30, r29, r11
/* 01B1A4 8001E1A4 39250001 */  addi      r9, r5, 0x1
/* 01B1A8 8001E1A8 7C002A78 */  xor       r0, r0, r5
/* 01B1AC 8001E1AC 3BFF0001 */  addi      r31, r31, 0x1
/* 01B1B0 8001E1B0 5525053E */  clrlwi    r5, r9, 20
/* 01B1B4 8001E1B4 4200FF00 */  bdnz      lbl_8001E0B4
/* 01B1B8 8001E1B8 714A0007 */  andi.     r10, r10, 0x7
/* 01B1BC 8001E1BC 41820030 */  beq       lbl_8001E1EC
lbl_8001E1C0:
/* 01B1C0 8001E1C0 7D4903A6 */  mtctr     r10
/* 01B1C4 8001E1C4 48000004 */  b         lbl_8001E1C8
lbl_8001E1C8:
/* 01B1C8 8001E1C8 8BDF0000 */  lbz       r30, 0x0(r31)
/* 01B1CC 8001E1CC 39650C18 */  addi      r11, r5, 0xc18
/* 01B1D0 8001E1D0 39250001 */  addi      r9, r5, 0x1
/* 01B1D4 8001E1D4 7C00F214 */  add       r0, r0, r30
/* 01B1D8 8001E1D8 7FDD59AE */  stbx      r30, r29, r11
/* 01B1DC 8001E1DC 7C002A78 */  xor       r0, r0, r5
/* 01B1E0 8001E1E0 3BFF0001 */  addi      r31, r31, 0x1
/* 01B1E4 8001E1E4 5525053E */  clrlwi    r5, r9, 20
/* 01B1E8 8001E1E8 4200FFE0 */  bdnz      lbl_8001E1C8
lbl_8001E1EC:
/* 01B1EC 8001E1EC 8123000C */  lwz       r9, 0xc(r3)
/* 01B1F0 8001E1F0 7C843A14 */  add       r4, r4, r7
/* 01B1F4 8001E1F4 398C0001 */  addi      r12, r12, 0x1
/* 01B1F8 8001E1F8 55291838 */  slwi      r9, r9, 3
/* 01B1FC 8001E1FC 7D284850 */  subf      r9, r8, r9
/* 01B200 8001E200 7CA54A14 */  add       r5, r5, r9
/* 01B204 8001E204 54A5053E */  clrlwi    r5, r5, 20
lbl_8001E208:
/* 01B208 8001E208 7C0C3000 */  cmpw      r12, r6
/* 01B20C 8001E20C 4180FCF4 */  blt       lbl_8001DF00
/* 01B210 8001E210 4800071C */  b         lbl_8001E92C
lbl_8001E214:
/* 01B214 8001E214 8123000C */  lwz       r9, 0xc(r3)
/* 01B218 8001E218 5529103A */  slwi      r9, r9, 2
/* 01B21C 8001E21C 7C084800 */  cmpw      r8, r9
/* 01B220 8001E220 41800008 */  blt       lbl_8001E228
/* 01B224 8001E224 7D284B78 */  mr        r8, r9
lbl_8001E228:
/* 01B228 8001E228 54A5103A */  slwi      r5, r5, 2
/* 01B22C 8001E22C 54EB083C */  slwi      r11, r7, 1
/* 01B230 8001E230 39800000 */  li        r12, 0x0
/* 01B234 8001E234 48000004 */  b         lbl_8001E238
lbl_8001E238:
/* 01B238 8001E238 48000004 */  b         lbl_8001E23C
lbl_8001E23C:
/* 01B23C 8001E23C 48000354 */  b         lbl_8001E590
lbl_8001E240:
/* 01B240 8001E240 7C9F2378 */  mr        r31, r4
/* 01B244 8001E244 558707FE */  clrlwi    r7, r12, 31
/* 01B248 8001E248 48000004 */  b         lbl_8001E24C
lbl_8001E24C:
/* 01B24C 8001E24C 2C070000 */  cmpwi     r7, 0x0
/* 01B250 8001E250 418201A8 */  beq       lbl_8001E3F8
/* 01B254 8001E254 2C080000 */  cmpwi     r8, 0x0
/* 01B258 8001E258 7D094378 */  mr        r9, r8
/* 01B25C 8001E25C 41820198 */  beq       lbl_8001E3F4
/* 01B260 8001E260 5527E8FE */  srwi      r7, r9, 3
/* 01B264 8001E264 28070000 */  cmplwi    r7, 0x0
/* 01B268 8001E268 7CE903A6 */  mtctr     r7
/* 01B26C 8001E26C 41820154 */  beq       lbl_8001E3C0
/* 01B270 8001E270 48000004 */  b         lbl_8001E274
lbl_8001E274:
/* 01B274 8001E274 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B278 8001E278 68A70002 */  xori      r7, r5, 0x2
/* 01B27C 8001E27C 54E7083C */  slwi      r7, r7, 1
/* 01B280 8001E280 7C00F214 */  add       r0, r0, r30
/* 01B284 8001E284 39470C18 */  addi      r10, r7, 0xc18
/* 01B288 8001E288 38E50001 */  addi      r7, r5, 0x1
/* 01B28C 8001E28C 7FDD532E */  sthx      r30, r29, r10
/* 01B290 8001E290 7C002A78 */  xor       r0, r0, r5
/* 01B294 8001E294 54E5057E */  clrlwi    r5, r7, 21
/* 01B298 8001E298 3BFF0002 */  addi      r31, r31, 0x2
/* 01B29C 8001E29C A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B2A0 8001E2A0 68A70002 */  xori      r7, r5, 0x2
/* 01B2A4 8001E2A4 54E7083C */  slwi      r7, r7, 1
/* 01B2A8 8001E2A8 39470C18 */  addi      r10, r7, 0xc18
/* 01B2AC 8001E2AC 7C00F214 */  add       r0, r0, r30
/* 01B2B0 8001E2B0 7FDD532E */  sthx      r30, r29, r10
/* 01B2B4 8001E2B4 3BFF0002 */  addi      r31, r31, 0x2
/* 01B2B8 8001E2B8 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B2BC 8001E2BC 7C002A78 */  xor       r0, r0, r5
/* 01B2C0 8001E2C0 38E50001 */  addi      r7, r5, 0x1
/* 01B2C4 8001E2C4 54E5057E */  clrlwi    r5, r7, 21
/* 01B2C8 8001E2C8 68A70002 */  xori      r7, r5, 0x2
/* 01B2CC 8001E2CC 54E7083C */  slwi      r7, r7, 1
/* 01B2D0 8001E2D0 7C00F214 */  add       r0, r0, r30
/* 01B2D4 8001E2D4 39470C18 */  addi      r10, r7, 0xc18
/* 01B2D8 8001E2D8 38E50001 */  addi      r7, r5, 0x1
/* 01B2DC 8001E2DC 7FDD532E */  sthx      r30, r29, r10
/* 01B2E0 8001E2E0 7C002A78 */  xor       r0, r0, r5
/* 01B2E4 8001E2E4 54E5057E */  clrlwi    r5, r7, 21
/* 01B2E8 8001E2E8 3BFF0002 */  addi      r31, r31, 0x2
/* 01B2EC 8001E2EC A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B2F0 8001E2F0 68A70002 */  xori      r7, r5, 0x2
/* 01B2F4 8001E2F4 54E7083C */  slwi      r7, r7, 1
/* 01B2F8 8001E2F8 39470C18 */  addi      r10, r7, 0xc18
/* 01B2FC 8001E2FC 7C00F214 */  add       r0, r0, r30
/* 01B300 8001E300 7FDD532E */  sthx      r30, r29, r10
/* 01B304 8001E304 3BFF0002 */  addi      r31, r31, 0x2
/* 01B308 8001E308 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B30C 8001E30C 7C002A78 */  xor       r0, r0, r5
/* 01B310 8001E310 38E50001 */  addi      r7, r5, 0x1
/* 01B314 8001E314 54E5057E */  clrlwi    r5, r7, 21
/* 01B318 8001E318 68A70002 */  xori      r7, r5, 0x2
/* 01B31C 8001E31C 54E7083C */  slwi      r7, r7, 1
/* 01B320 8001E320 7C00F214 */  add       r0, r0, r30
/* 01B324 8001E324 39470C18 */  addi      r10, r7, 0xc18
/* 01B328 8001E328 38E50001 */  addi      r7, r5, 0x1
/* 01B32C 8001E32C 7FDD532E */  sthx      r30, r29, r10
/* 01B330 8001E330 7C002A78 */  xor       r0, r0, r5
/* 01B334 8001E334 54E5057E */  clrlwi    r5, r7, 21
/* 01B338 8001E338 3BFF0002 */  addi      r31, r31, 0x2
/* 01B33C 8001E33C A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B340 8001E340 68A70002 */  xori      r7, r5, 0x2
/* 01B344 8001E344 54E7083C */  slwi      r7, r7, 1
/* 01B348 8001E348 39470C18 */  addi      r10, r7, 0xc18
/* 01B34C 8001E34C 7C00F214 */  add       r0, r0, r30
/* 01B350 8001E350 7FDD532E */  sthx      r30, r29, r10
/* 01B354 8001E354 3BFF0002 */  addi      r31, r31, 0x2
/* 01B358 8001E358 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B35C 8001E35C 7C002A78 */  xor       r0, r0, r5
/* 01B360 8001E360 38E50001 */  addi      r7, r5, 0x1
/* 01B364 8001E364 54E5057E */  clrlwi    r5, r7, 21
/* 01B368 8001E368 68A70002 */  xori      r7, r5, 0x2
/* 01B36C 8001E36C 54E7083C */  slwi      r7, r7, 1
/* 01B370 8001E370 7C00F214 */  add       r0, r0, r30
/* 01B374 8001E374 39470C18 */  addi      r10, r7, 0xc18
/* 01B378 8001E378 38E50001 */  addi      r7, r5, 0x1
/* 01B37C 8001E37C 7FDD532E */  sthx      r30, r29, r10
/* 01B380 8001E380 7C002A78 */  xor       r0, r0, r5
/* 01B384 8001E384 54E5057E */  clrlwi    r5, r7, 21
/* 01B388 8001E388 3BFF0002 */  addi      r31, r31, 0x2
/* 01B38C 8001E38C A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B390 8001E390 68A70002 */  xori      r7, r5, 0x2
/* 01B394 8001E394 54E7083C */  slwi      r7, r7, 1
/* 01B398 8001E398 39470C18 */  addi      r10, r7, 0xc18
/* 01B39C 8001E39C 7C00F214 */  add       r0, r0, r30
/* 01B3A0 8001E3A0 7FDD532E */  sthx      r30, r29, r10
/* 01B3A4 8001E3A4 38E50001 */  addi      r7, r5, 0x1
/* 01B3A8 8001E3A8 7C002A78 */  xor       r0, r0, r5
/* 01B3AC 8001E3AC 3BFF0002 */  addi      r31, r31, 0x2
/* 01B3B0 8001E3B0 54E5057E */  clrlwi    r5, r7, 21
/* 01B3B4 8001E3B4 4200FEC0 */  bdnz      lbl_8001E274
/* 01B3B8 8001E3B8 71290007 */  andi.     r9, r9, 0x7
/* 01B3BC 8001E3BC 41820038 */  beq       lbl_8001E3F4
lbl_8001E3C0:
/* 01B3C0 8001E3C0 7D2903A6 */  mtctr     r9
/* 01B3C4 8001E3C4 48000004 */  b         lbl_8001E3C8
lbl_8001E3C8:
/* 01B3C8 8001E3C8 68A70002 */  xori      r7, r5, 0x2
/* 01B3CC 8001E3CC A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B3D0 8001E3D0 54E7083C */  slwi      r7, r7, 1
/* 01B3D4 8001E3D4 39470C18 */  addi      r10, r7, 0xc18
/* 01B3D8 8001E3D8 7C00F214 */  add       r0, r0, r30
/* 01B3DC 8001E3DC 7FDD532E */  sthx      r30, r29, r10
/* 01B3E0 8001E3E0 38E50001 */  addi      r7, r5, 0x1
/* 01B3E4 8001E3E4 7C002A78 */  xor       r0, r0, r5
/* 01B3E8 8001E3E8 3BFF0002 */  addi      r31, r31, 0x2
/* 01B3EC 8001E3EC 54E5057E */  clrlwi    r5, r7, 21
/* 01B3F0 8001E3F0 4200FFD8 */  bdnz      lbl_8001E3C8
lbl_8001E3F4:
/* 01B3F4 8001E3F4 48000180 */  b         lbl_8001E574
lbl_8001E3F8:
/* 01B3F8 8001E3F8 2C080000 */  cmpwi     r8, 0x0
/* 01B3FC 8001E3FC 7D094378 */  mr        r9, r8
/* 01B400 8001E400 41820174 */  beq       lbl_8001E574
/* 01B404 8001E404 5527E8FE */  srwi      r7, r9, 3
/* 01B408 8001E408 28070000 */  cmplwi    r7, 0x0
/* 01B40C 8001E40C 7CE903A6 */  mtctr     r7
/* 01B410 8001E410 41820134 */  beq       lbl_8001E544
/* 01B414 8001E414 48000004 */  b         lbl_8001E418
lbl_8001E418:
/* 01B418 8001E418 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B41C 8001E41C 54A7083C */  slwi      r7, r5, 1
/* 01B420 8001E420 39470C18 */  addi      r10, r7, 0xc18
/* 01B424 8001E424 7C00F214 */  add       r0, r0, r30
/* 01B428 8001E428 7FDD532E */  sthx      r30, r29, r10
/* 01B42C 8001E42C 3BFF0002 */  addi      r31, r31, 0x2
/* 01B430 8001E430 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B434 8001E434 7C002A78 */  xor       r0, r0, r5
/* 01B438 8001E438 38E50001 */  addi      r7, r5, 0x1
/* 01B43C 8001E43C 54E5057E */  clrlwi    r5, r7, 21
/* 01B440 8001E440 54A7083C */  slwi      r7, r5, 1
/* 01B444 8001E444 39470C18 */  addi      r10, r7, 0xc18
/* 01B448 8001E448 7C00F214 */  add       r0, r0, r30
/* 01B44C 8001E44C 7FDD532E */  sthx      r30, r29, r10
/* 01B450 8001E450 3BFF0002 */  addi      r31, r31, 0x2
/* 01B454 8001E454 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B458 8001E458 7C002A78 */  xor       r0, r0, r5
/* 01B45C 8001E45C 38E50001 */  addi      r7, r5, 0x1
/* 01B460 8001E460 54E5057E */  clrlwi    r5, r7, 21
/* 01B464 8001E464 54A7083C */  slwi      r7, r5, 1
/* 01B468 8001E468 39470C18 */  addi      r10, r7, 0xc18
/* 01B46C 8001E46C 7C00F214 */  add       r0, r0, r30
/* 01B470 8001E470 7FDD532E */  sthx      r30, r29, r10
/* 01B474 8001E474 3BFF0002 */  addi      r31, r31, 0x2
/* 01B478 8001E478 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B47C 8001E47C 7C002A78 */  xor       r0, r0, r5
/* 01B480 8001E480 38E50001 */  addi      r7, r5, 0x1
/* 01B484 8001E484 54E5057E */  clrlwi    r5, r7, 21
/* 01B488 8001E488 54A7083C */  slwi      r7, r5, 1
/* 01B48C 8001E48C 39470C18 */  addi      r10, r7, 0xc18
/* 01B490 8001E490 7C00F214 */  add       r0, r0, r30
/* 01B494 8001E494 7FDD532E */  sthx      r30, r29, r10
/* 01B498 8001E498 3BFF0002 */  addi      r31, r31, 0x2
/* 01B49C 8001E49C A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B4A0 8001E4A0 7C002A78 */  xor       r0, r0, r5
/* 01B4A4 8001E4A4 38E50001 */  addi      r7, r5, 0x1
/* 01B4A8 8001E4A8 54E5057E */  clrlwi    r5, r7, 21
/* 01B4AC 8001E4AC 54A7083C */  slwi      r7, r5, 1
/* 01B4B0 8001E4B0 39470C18 */  addi      r10, r7, 0xc18
/* 01B4B4 8001E4B4 7C00F214 */  add       r0, r0, r30
/* 01B4B8 8001E4B8 7FDD532E */  sthx      r30, r29, r10
/* 01B4BC 8001E4BC 3BFF0002 */  addi      r31, r31, 0x2
/* 01B4C0 8001E4C0 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B4C4 8001E4C4 7C002A78 */  xor       r0, r0, r5
/* 01B4C8 8001E4C8 38E50001 */  addi      r7, r5, 0x1
/* 01B4CC 8001E4CC 54E5057E */  clrlwi    r5, r7, 21
/* 01B4D0 8001E4D0 54A7083C */  slwi      r7, r5, 1
/* 01B4D4 8001E4D4 39470C18 */  addi      r10, r7, 0xc18
/* 01B4D8 8001E4D8 7C00F214 */  add       r0, r0, r30
/* 01B4DC 8001E4DC 7FDD532E */  sthx      r30, r29, r10
/* 01B4E0 8001E4E0 3BFF0002 */  addi      r31, r31, 0x2
/* 01B4E4 8001E4E4 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B4E8 8001E4E8 7C002A78 */  xor       r0, r0, r5
/* 01B4EC 8001E4EC 38E50001 */  addi      r7, r5, 0x1
/* 01B4F0 8001E4F0 54E5057E */  clrlwi    r5, r7, 21
/* 01B4F4 8001E4F4 54A7083C */  slwi      r7, r5, 1
/* 01B4F8 8001E4F8 39470C18 */  addi      r10, r7, 0xc18
/* 01B4FC 8001E4FC 7C00F214 */  add       r0, r0, r30
/* 01B500 8001E500 7FDD532E */  sthx      r30, r29, r10
/* 01B504 8001E504 3BFF0002 */  addi      r31, r31, 0x2
/* 01B508 8001E508 A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B50C 8001E50C 7C002A78 */  xor       r0, r0, r5
/* 01B510 8001E510 38E50001 */  addi      r7, r5, 0x1
/* 01B514 8001E514 54E5057E */  clrlwi    r5, r7, 21
/* 01B518 8001E518 54A7083C */  slwi      r7, r5, 1
/* 01B51C 8001E51C 39470C18 */  addi      r10, r7, 0xc18
/* 01B520 8001E520 7C00F214 */  add       r0, r0, r30
/* 01B524 8001E524 7FDD532E */  sthx      r30, r29, r10
/* 01B528 8001E528 38E50001 */  addi      r7, r5, 0x1
/* 01B52C 8001E52C 7C002A78 */  xor       r0, r0, r5
/* 01B530 8001E530 3BFF0002 */  addi      r31, r31, 0x2
/* 01B534 8001E534 54E5057E */  clrlwi    r5, r7, 21
/* 01B538 8001E538 4200FEE0 */  bdnz      lbl_8001E418
/* 01B53C 8001E53C 71290007 */  andi.     r9, r9, 0x7
/* 01B540 8001E540 41820034 */  beq       lbl_8001E574
lbl_8001E544:
/* 01B544 8001E544 7D2903A6 */  mtctr     r9
/* 01B548 8001E548 48000004 */  b         lbl_8001E54C
lbl_8001E54C:
/* 01B54C 8001E54C A3DF0000 */  lhz       r30, 0x0(r31)
/* 01B550 8001E550 54A7083C */  slwi      r7, r5, 1
/* 01B554 8001E554 39470C18 */  addi      r10, r7, 0xc18
/* 01B558 8001E558 7C00F214 */  add       r0, r0, r30
/* 01B55C 8001E55C 7FDD532E */  sthx      r30, r29, r10
/* 01B560 8001E560 38E50001 */  addi      r7, r5, 0x1
/* 01B564 8001E564 7C002A78 */  xor       r0, r0, r5
/* 01B568 8001E568 3BFF0002 */  addi      r31, r31, 0x2
/* 01B56C 8001E56C 54E5057E */  clrlwi    r5, r7, 21
/* 01B570 8001E570 4200FFDC */  bdnz      lbl_8001E54C
lbl_8001E574:
/* 01B574 8001E574 80E3000C */  lwz       r7, 0xc(r3)
/* 01B578 8001E578 7C845A14 */  add       r4, r4, r11
/* 01B57C 8001E57C 398C0001 */  addi      r12, r12, 0x1
/* 01B580 8001E580 54E7103A */  slwi      r7, r7, 2
/* 01B584 8001E584 7CE83850 */  subf      r7, r8, r7
/* 01B588 8001E588 7CA53A14 */  add       r5, r5, r7
/* 01B58C 8001E58C 54A5057E */  clrlwi    r5, r5, 21
lbl_8001E590:
/* 01B590 8001E590 7C0C3000 */  cmpw      r12, r6
/* 01B594 8001E594 4180FCAC */  blt       lbl_8001E240
/* 01B598 8001E598 48000394 */  b         lbl_8001E92C
lbl_8001E59C:
/* 01B59C 8001E59C 8123000C */  lwz       r9, 0xc(r3)
/* 01B5A0 8001E5A0 5529103A */  slwi      r9, r9, 2
/* 01B5A4 8001E5A4 7C084800 */  cmpw      r8, r9
/* 01B5A8 8001E5A8 41800008 */  blt       lbl_8001E5B0
/* 01B5AC 8001E5AC 7D284B78 */  mr        r8, r9
lbl_8001E5B0:
/* 01B5B0 8001E5B0 54A5083C */  slwi      r5, r5, 1
/* 01B5B4 8001E5B4 54EB103A */  slwi      r11, r7, 2
/* 01B5B8 8001E5B8 39800000 */  li        r12, 0x0
/* 01B5BC 8001E5BC 48000004 */  b         lbl_8001E5C0
lbl_8001E5C0:
/* 01B5C0 8001E5C0 48000004 */  b         lbl_8001E5C4
lbl_8001E5C4:
/* 01B5C4 8001E5C4 48000354 */  b         lbl_8001E918
lbl_8001E5C8:
/* 01B5C8 8001E5C8 7C9F2378 */  mr        r31, r4
/* 01B5CC 8001E5CC 558707FE */  clrlwi    r7, r12, 31
/* 01B5D0 8001E5D0 48000004 */  b         lbl_8001E5D4
lbl_8001E5D4:
/* 01B5D4 8001E5D4 2C070000 */  cmpwi     r7, 0x0
/* 01B5D8 8001E5D8 418201A8 */  beq       lbl_8001E780
/* 01B5DC 8001E5DC 2C080000 */  cmpwi     r8, 0x0
/* 01B5E0 8001E5E0 7D094378 */  mr        r9, r8
/* 01B5E4 8001E5E4 41820198 */  beq       lbl_8001E77C
/* 01B5E8 8001E5E8 5527E8FE */  srwi      r7, r9, 3
/* 01B5EC 8001E5EC 28070000 */  cmplwi    r7, 0x0
/* 01B5F0 8001E5F0 7CE903A6 */  mtctr     r7
/* 01B5F4 8001E5F4 41820154 */  beq       lbl_8001E748
/* 01B5F8 8001E5F8 48000004 */  b         lbl_8001E5FC
lbl_8001E5FC:
/* 01B5FC 8001E5FC 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B600 8001E600 68A70002 */  xori      r7, r5, 0x2
/* 01B604 8001E604 54E7103A */  slwi      r7, r7, 2
/* 01B608 8001E608 7C00F214 */  add       r0, r0, r30
/* 01B60C 8001E60C 39470C18 */  addi      r10, r7, 0xc18
/* 01B610 8001E610 38E50001 */  addi      r7, r5, 0x1
/* 01B614 8001E614 7FDD512E */  stwx      r30, r29, r10
/* 01B618 8001E618 7C002A78 */  xor       r0, r0, r5
/* 01B61C 8001E61C 54E505BE */  clrlwi    r5, r7, 22
/* 01B620 8001E620 3BFF0004 */  addi      r31, r31, 0x4
/* 01B624 8001E624 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B628 8001E628 68A70002 */  xori      r7, r5, 0x2
/* 01B62C 8001E62C 54E7103A */  slwi      r7, r7, 2
/* 01B630 8001E630 39470C18 */  addi      r10, r7, 0xc18
/* 01B634 8001E634 7C00F214 */  add       r0, r0, r30
/* 01B638 8001E638 7FDD512E */  stwx      r30, r29, r10
/* 01B63C 8001E63C 3BFF0004 */  addi      r31, r31, 0x4
/* 01B640 8001E640 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B644 8001E644 7C002A78 */  xor       r0, r0, r5
/* 01B648 8001E648 38E50001 */  addi      r7, r5, 0x1
/* 01B64C 8001E64C 54E505BE */  clrlwi    r5, r7, 22
/* 01B650 8001E650 68A70002 */  xori      r7, r5, 0x2
/* 01B654 8001E654 54E7103A */  slwi      r7, r7, 2
/* 01B658 8001E658 7C00F214 */  add       r0, r0, r30
/* 01B65C 8001E65C 39470C18 */  addi      r10, r7, 0xc18
/* 01B660 8001E660 38E50001 */  addi      r7, r5, 0x1
/* 01B664 8001E664 7FDD512E */  stwx      r30, r29, r10
/* 01B668 8001E668 7C002A78 */  xor       r0, r0, r5
/* 01B66C 8001E66C 54E505BE */  clrlwi    r5, r7, 22
/* 01B670 8001E670 3BFF0004 */  addi      r31, r31, 0x4
/* 01B674 8001E674 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B678 8001E678 68A70002 */  xori      r7, r5, 0x2
/* 01B67C 8001E67C 54E7103A */  slwi      r7, r7, 2
/* 01B680 8001E680 39470C18 */  addi      r10, r7, 0xc18
/* 01B684 8001E684 7C00F214 */  add       r0, r0, r30
/* 01B688 8001E688 7FDD512E */  stwx      r30, r29, r10
/* 01B68C 8001E68C 3BFF0004 */  addi      r31, r31, 0x4
/* 01B690 8001E690 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B694 8001E694 7C002A78 */  xor       r0, r0, r5
/* 01B698 8001E698 38E50001 */  addi      r7, r5, 0x1
/* 01B69C 8001E69C 54E505BE */  clrlwi    r5, r7, 22
/* 01B6A0 8001E6A0 68A70002 */  xori      r7, r5, 0x2
/* 01B6A4 8001E6A4 54E7103A */  slwi      r7, r7, 2
/* 01B6A8 8001E6A8 7C00F214 */  add       r0, r0, r30
/* 01B6AC 8001E6AC 39470C18 */  addi      r10, r7, 0xc18
/* 01B6B0 8001E6B0 38E50001 */  addi      r7, r5, 0x1
/* 01B6B4 8001E6B4 7FDD512E */  stwx      r30, r29, r10
/* 01B6B8 8001E6B8 7C002A78 */  xor       r0, r0, r5
/* 01B6BC 8001E6BC 54E505BE */  clrlwi    r5, r7, 22
/* 01B6C0 8001E6C0 3BFF0004 */  addi      r31, r31, 0x4
/* 01B6C4 8001E6C4 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B6C8 8001E6C8 68A70002 */  xori      r7, r5, 0x2
/* 01B6CC 8001E6CC 54E7103A */  slwi      r7, r7, 2
/* 01B6D0 8001E6D0 39470C18 */  addi      r10, r7, 0xc18
/* 01B6D4 8001E6D4 7C00F214 */  add       r0, r0, r30
/* 01B6D8 8001E6D8 7FDD512E */  stwx      r30, r29, r10
/* 01B6DC 8001E6DC 3BFF0004 */  addi      r31, r31, 0x4
/* 01B6E0 8001E6E0 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B6E4 8001E6E4 7C002A78 */  xor       r0, r0, r5
/* 01B6E8 8001E6E8 38E50001 */  addi      r7, r5, 0x1
/* 01B6EC 8001E6EC 54E505BE */  clrlwi    r5, r7, 22
/* 01B6F0 8001E6F0 68A70002 */  xori      r7, r5, 0x2
/* 01B6F4 8001E6F4 54E7103A */  slwi      r7, r7, 2
/* 01B6F8 8001E6F8 7C00F214 */  add       r0, r0, r30
/* 01B6FC 8001E6FC 39470C18 */  addi      r10, r7, 0xc18
/* 01B700 8001E700 38E50001 */  addi      r7, r5, 0x1
/* 01B704 8001E704 7FDD512E */  stwx      r30, r29, r10
/* 01B708 8001E708 7C002A78 */  xor       r0, r0, r5
/* 01B70C 8001E70C 54E505BE */  clrlwi    r5, r7, 22
/* 01B710 8001E710 3BFF0004 */  addi      r31, r31, 0x4
/* 01B714 8001E714 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B718 8001E718 68A70002 */  xori      r7, r5, 0x2
/* 01B71C 8001E71C 54E7103A */  slwi      r7, r7, 2
/* 01B720 8001E720 39470C18 */  addi      r10, r7, 0xc18
/* 01B724 8001E724 7C00F214 */  add       r0, r0, r30
/* 01B728 8001E728 7FDD512E */  stwx      r30, r29, r10
/* 01B72C 8001E72C 38E50001 */  addi      r7, r5, 0x1
/* 01B730 8001E730 7C002A78 */  xor       r0, r0, r5
/* 01B734 8001E734 3BFF0004 */  addi      r31, r31, 0x4
/* 01B738 8001E738 54E505BE */  clrlwi    r5, r7, 22
/* 01B73C 8001E73C 4200FEC0 */  bdnz      lbl_8001E5FC
/* 01B740 8001E740 71290007 */  andi.     r9, r9, 0x7
/* 01B744 8001E744 41820038 */  beq       lbl_8001E77C
lbl_8001E748:
/* 01B748 8001E748 7D2903A6 */  mtctr     r9
/* 01B74C 8001E74C 48000004 */  b         lbl_8001E750
lbl_8001E750:
/* 01B750 8001E750 68A70002 */  xori      r7, r5, 0x2
/* 01B754 8001E754 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B758 8001E758 54E7103A */  slwi      r7, r7, 2
/* 01B75C 8001E75C 39470C18 */  addi      r10, r7, 0xc18
/* 01B760 8001E760 7C00F214 */  add       r0, r0, r30
/* 01B764 8001E764 7FDD512E */  stwx      r30, r29, r10
/* 01B768 8001E768 38E50001 */  addi      r7, r5, 0x1
/* 01B76C 8001E76C 7C002A78 */  xor       r0, r0, r5
/* 01B770 8001E770 3BFF0004 */  addi      r31, r31, 0x4
/* 01B774 8001E774 54E505BE */  clrlwi    r5, r7, 22
/* 01B778 8001E778 4200FFD8 */  bdnz      lbl_8001E750
lbl_8001E77C:
/* 01B77C 8001E77C 48000180 */  b         lbl_8001E8FC
lbl_8001E780:
/* 01B780 8001E780 2C080000 */  cmpwi     r8, 0x0
/* 01B784 8001E784 7D094378 */  mr        r9, r8
/* 01B788 8001E788 41820174 */  beq       lbl_8001E8FC
/* 01B78C 8001E78C 5527E8FE */  srwi      r7, r9, 3
/* 01B790 8001E790 28070000 */  cmplwi    r7, 0x0
/* 01B794 8001E794 7CE903A6 */  mtctr     r7
/* 01B798 8001E798 41820134 */  beq       lbl_8001E8CC
/* 01B79C 8001E79C 48000004 */  b         lbl_8001E7A0
lbl_8001E7A0:
/* 01B7A0 8001E7A0 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B7A4 8001E7A4 54A7103A */  slwi      r7, r5, 2
/* 01B7A8 8001E7A8 39470C18 */  addi      r10, r7, 0xc18
/* 01B7AC 8001E7AC 7C00F214 */  add       r0, r0, r30
/* 01B7B0 8001E7B0 7FDD512E */  stwx      r30, r29, r10
/* 01B7B4 8001E7B4 3BFF0004 */  addi      r31, r31, 0x4
/* 01B7B8 8001E7B8 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B7BC 8001E7BC 7C002A78 */  xor       r0, r0, r5
/* 01B7C0 8001E7C0 38E50001 */  addi      r7, r5, 0x1
/* 01B7C4 8001E7C4 54E505BE */  clrlwi    r5, r7, 22
/* 01B7C8 8001E7C8 54A7103A */  slwi      r7, r5, 2
/* 01B7CC 8001E7CC 39470C18 */  addi      r10, r7, 0xc18
/* 01B7D0 8001E7D0 7C00F214 */  add       r0, r0, r30
/* 01B7D4 8001E7D4 7FDD512E */  stwx      r30, r29, r10
/* 01B7D8 8001E7D8 3BFF0004 */  addi      r31, r31, 0x4
/* 01B7DC 8001E7DC 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B7E0 8001E7E0 7C002A78 */  xor       r0, r0, r5
/* 01B7E4 8001E7E4 38E50001 */  addi      r7, r5, 0x1
/* 01B7E8 8001E7E8 54E505BE */  clrlwi    r5, r7, 22
/* 01B7EC 8001E7EC 54A7103A */  slwi      r7, r5, 2
/* 01B7F0 8001E7F0 39470C18 */  addi      r10, r7, 0xc18
/* 01B7F4 8001E7F4 7C00F214 */  add       r0, r0, r30
/* 01B7F8 8001E7F8 7FDD512E */  stwx      r30, r29, r10
/* 01B7FC 8001E7FC 3BFF0004 */  addi      r31, r31, 0x4
/* 01B800 8001E800 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B804 8001E804 7C002A78 */  xor       r0, r0, r5
/* 01B808 8001E808 38E50001 */  addi      r7, r5, 0x1
/* 01B80C 8001E80C 54E505BE */  clrlwi    r5, r7, 22
/* 01B810 8001E810 54A7103A */  slwi      r7, r5, 2
/* 01B814 8001E814 39470C18 */  addi      r10, r7, 0xc18
/* 01B818 8001E818 7C00F214 */  add       r0, r0, r30
/* 01B81C 8001E81C 7FDD512E */  stwx      r30, r29, r10
/* 01B820 8001E820 3BFF0004 */  addi      r31, r31, 0x4
/* 01B824 8001E824 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B828 8001E828 7C002A78 */  xor       r0, r0, r5
/* 01B82C 8001E82C 38E50001 */  addi      r7, r5, 0x1
/* 01B830 8001E830 54E505BE */  clrlwi    r5, r7, 22
/* 01B834 8001E834 54A7103A */  slwi      r7, r5, 2
/* 01B838 8001E838 39470C18 */  addi      r10, r7, 0xc18
/* 01B83C 8001E83C 7C00F214 */  add       r0, r0, r30
/* 01B840 8001E840 7FDD512E */  stwx      r30, r29, r10
/* 01B844 8001E844 3BFF0004 */  addi      r31, r31, 0x4
/* 01B848 8001E848 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B84C 8001E84C 7C002A78 */  xor       r0, r0, r5
/* 01B850 8001E850 38E50001 */  addi      r7, r5, 0x1
/* 01B854 8001E854 54E505BE */  clrlwi    r5, r7, 22
/* 01B858 8001E858 54A7103A */  slwi      r7, r5, 2
/* 01B85C 8001E85C 39470C18 */  addi      r10, r7, 0xc18
/* 01B860 8001E860 7C00F214 */  add       r0, r0, r30
/* 01B864 8001E864 7FDD512E */  stwx      r30, r29, r10
/* 01B868 8001E868 3BFF0004 */  addi      r31, r31, 0x4
/* 01B86C 8001E86C 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B870 8001E870 7C002A78 */  xor       r0, r0, r5
/* 01B874 8001E874 38E50001 */  addi      r7, r5, 0x1
/* 01B878 8001E878 54E505BE */  clrlwi    r5, r7, 22
/* 01B87C 8001E87C 54A7103A */  slwi      r7, r5, 2
/* 01B880 8001E880 39470C18 */  addi      r10, r7, 0xc18
/* 01B884 8001E884 7C00F214 */  add       r0, r0, r30
/* 01B888 8001E888 7FDD512E */  stwx      r30, r29, r10
/* 01B88C 8001E88C 3BFF0004 */  addi      r31, r31, 0x4
/* 01B890 8001E890 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B894 8001E894 7C002A78 */  xor       r0, r0, r5
/* 01B898 8001E898 38E50001 */  addi      r7, r5, 0x1
/* 01B89C 8001E89C 54E505BE */  clrlwi    r5, r7, 22
/* 01B8A0 8001E8A0 54A7103A */  slwi      r7, r5, 2
/* 01B8A4 8001E8A4 39470C18 */  addi      r10, r7, 0xc18
/* 01B8A8 8001E8A8 7C00F214 */  add       r0, r0, r30
/* 01B8AC 8001E8AC 7FDD512E */  stwx      r30, r29, r10
/* 01B8B0 8001E8B0 38E50001 */  addi      r7, r5, 0x1
/* 01B8B4 8001E8B4 7C002A78 */  xor       r0, r0, r5
/* 01B8B8 8001E8B8 3BFF0004 */  addi      r31, r31, 0x4
/* 01B8BC 8001E8BC 54E505BE */  clrlwi    r5, r7, 22
/* 01B8C0 8001E8C0 4200FEE0 */  bdnz      lbl_8001E7A0
/* 01B8C4 8001E8C4 71290007 */  andi.     r9, r9, 0x7
/* 01B8C8 8001E8C8 41820034 */  beq       lbl_8001E8FC
lbl_8001E8CC:
/* 01B8CC 8001E8CC 7D2903A6 */  mtctr     r9
/* 01B8D0 8001E8D0 48000004 */  b         lbl_8001E8D4
lbl_8001E8D4:
/* 01B8D4 8001E8D4 83DF0000 */  lwz       r30, 0x0(r31)
/* 01B8D8 8001E8D8 54A7103A */  slwi      r7, r5, 2
/* 01B8DC 8001E8DC 39470C18 */  addi      r10, r7, 0xc18
/* 01B8E0 8001E8E0 7C00F214 */  add       r0, r0, r30
/* 01B8E4 8001E8E4 7FDD512E */  stwx      r30, r29, r10
/* 01B8E8 8001E8E8 38E50001 */  addi      r7, r5, 0x1
/* 01B8EC 8001E8EC 7C002A78 */  xor       r0, r0, r5
/* 01B8F0 8001E8F0 3BFF0004 */  addi      r31, r31, 0x4
/* 01B8F4 8001E8F4 54E505BE */  clrlwi    r5, r7, 22
/* 01B8F8 8001E8F8 4200FFDC */  bdnz      lbl_8001E8D4
lbl_8001E8FC:
/* 01B8FC 8001E8FC 80E3000C */  lwz       r7, 0xc(r3)
/* 01B900 8001E900 7C845A14 */  add       r4, r4, r11
/* 01B904 8001E904 398C0001 */  addi      r12, r12, 0x1
/* 01B908 8001E908 54E7103A */  slwi      r7, r7, 2
/* 01B90C 8001E90C 7CE83850 */  subf      r7, r8, r7
/* 01B910 8001E910 7CA53A14 */  add       r5, r5, r7
/* 01B914 8001E914 54A505BE */  clrlwi    r5, r5, 22
lbl_8001E918:
/* 01B918 8001E918 7C0C3000 */  cmpw      r12, r6
/* 01B91C 8001E91C 4180FCAC */  blt       lbl_8001E5C8
/* 01B920 8001E920 4800000C */  b         lbl_8001E92C
lbl_8001E924:
/* 01B924 8001E924 38600000 */  li        r3, 0x0
/* 01B928 8001E928 4800000C */  b         lbl_8001E934
lbl_8001E92C:
/* 01B92C 8001E92C 901D21FC */  stw       r0, 0x21fc(r29)
/* 01B930 8001E930 38600001 */  li        r3, 0x1
lbl_8001E934:
/* 01B934 8001E934 80010044 */  lwz       r0, 0x44(r1)
/* 01B938 8001E938 83E1003C */  lwz       r31, 0x3c(r1)
/* 01B93C 8001E93C 83C10038 */  lwz       r30, 0x38(r1)
/* 01B940 8001E940 7C0803A6 */  mtlr      r0
/* 01B944 8001E944 83A10034 */  lwz       r29, 0x34(r1)
/* 01B948 8001E948 38210040 */  addi      r1, r1, 0x40
/* 01B94C 8001E94C 4E800020 */  blr

glabel frameLoadTLUT
/* 01B950 8001E950 7C0802A6 */  mflr      r0
/* 01B954 8001E954 90010004 */  stw       r0, 0x4(r1)
/* 01B958 8001E958 9421FFC8 */  stwu      r1, -0x38(r1)
/* 01B95C 8001E95C BF010018 */  stmw      r24, 0x18(r1)
/* 01B960 8001E960 7C7E1B78 */  mr        r30, r3
/* 01B964 8001E964 1C05002C */  mulli     r0, r5, 0x2c
/* 01B968 8001E968 83FE00E8 */  lwz       r31, 0xe8(r30)
/* 01B96C 8001E96C 3C7E0004 */  addis     r3, r30, 0x4
/* 01B970 8001E970 7FA30214 */  add       r29, r3, r0
/* 01B974 8001E974 3BBDC35C */  subi      r29, r29, 0x3ca4
/* 01B978 8001E978 801D0000 */  lwz       r0, 0x0(r29)
/* 01B97C 8001E97C 3B640001 */  addi      r27, r4, 0x1
/* 01B980 8001E980 3B400000 */  li        r26, 0x0
/* 01B984 8001E984 541C05FE */  clrlwi    r28, r0, 23
/* 01B988 8001E988 48000004 */  b         lbl_8001E98C
lbl_8001E98C:
/* 01B98C 8001E98C 48000004 */  b         lbl_8001E990
lbl_8001E990:
/* 01B990 8001E990 48000058 */  b         lbl_8001E9E8
lbl_8001E994:
/* 01B994 8001E994 A07F0000 */  lhz       r3, 0x0(r31)
/* 01B998 8001E998 3BFF0002 */  addi      r31, r31, 0x2
/* 01B99C 8001E99C 38A00020 */  li        r5, 0x20
/* 01B9A0 8001E9A0 5460801E */  slwi      r0, r3, 16
/* 01B9A4 8001E9A4 7C600378 */  or        r0, r3, r0
/* 01B9A8 8001E9A8 7C180378 */  mr        r24, r0
/* 01B9AC 8001E9AC 7C66E278 */  xor       r6, r3, r28
/* 01B9B0 8001E9B0 7C19FE70 */  srawi     r25, r0, 31
/* 01B9B4 8001E9B4 7F23CB78 */  mr        r3, r25
/* 01B9B8 8001E9B8 7F04C378 */  mr        r4, r24
/* 01B9BC 8001E9BC 7F5A3214 */  add       r26, r26, r6
/* 01B9C0 8001E9C0 480ADF5D */  bl        __shl2i
/* 01B9C4 8001E9C4 57851838 */  slwi      r5, r28, 3
/* 01B9C8 8001E9C8 38050C18 */  addi      r0, r5, 0xc18
/* 01B9CC 8001E9CC 7F182378 */  or        r24, r24, r4
/* 01B9D0 8001E9D0 7C9E0214 */  add       r4, r30, r0
/* 01B9D4 8001E9D4 93040004 */  stw       r24, 0x4(r4)
/* 01B9D8 8001E9D8 7F391B78 */  or        r25, r25, r3
/* 01B9DC 8001E9DC 381C0001 */  addi      r0, r28, 0x1
/* 01B9E0 8001E9E0 93240000 */  stw       r25, 0x0(r4)
/* 01B9E4 8001E9E4 541C05FE */  clrlwi    r28, r0, 23
lbl_8001E9E8:
/* 01B9E8 8001E9E8 2C1B0000 */  cmpwi     r27, 0x0
/* 01B9EC 8001E9EC 3B7BFFFF */  subi      r27, r27, 0x1
/* 01B9F0 8001E9F0 4082FFA4 */  bne       lbl_8001E994
/* 01B9F4 8001E9F4 801D0000 */  lwz       r0, 0x0(r29)
/* 01B9F8 8001E9F8 38600001 */  li        r3, 0x1
/* 01B9FC 8001E9FC 540405FE */  clrlwi    r4, r0, 23
/* 01BA00 8001EA00 3884FF00 */  subi      r4, r4, 0x100
/* 01BA04 8001EA04 7C842670 */  srawi     r4, r4, 4
/* 01BA08 8001EA08 7C840194 */  addze     r4, r4
/* 01BA0C 8001EA0C 5484073E */  clrlwi    r4, r4, 28
/* 01BA10 8001EA10 5480103A */  slwi      r0, r4, 2
/* 01BA14 8001EA14 7C9E0214 */  add       r4, r30, r0
/* 01BA18 8001EA18 93442200 */  stw       r26, 0x2200(r4)
/* 01BA1C 8001EA1C BB010018 */  lmw       r24, 0x18(r1)
/* 01BA20 8001EA20 8001003C */  lwz       r0, 0x3c(r1)
/* 01BA24 8001EA24 38210038 */  addi      r1, r1, 0x38
/* 01BA28 8001EA28 7C0803A6 */  mtlr      r0
/* 01BA2C 8001EA2C 4E800020 */  blr

glabel frameCullDL
/* 01BA30 8001EA30 1CC4001C */  mulli     r6, r4, 0x1c
/* 01BA34 8001EA34 1C85001C */  mulli     r4, r5, 0x1c
/* 01BA38 8001EA38 3CA30004 */  addis     r5, r3, 0x4
/* 01BA3C 8001EA3C 38C60358 */  addi      r6, r6, 0x358
/* 01BA40 8001EA40 38840358 */  addi      r4, r4, 0x358
/* 01BA44 8001EA44 38A5C7A0 */  subi      r5, r5, 0x3860
/* 01BA48 8001EA48 7CC33214 */  add       r6, r3, r6
/* 01BA4C 8001EA4C 7C832214 */  add       r4, r3, r4
/* 01BA50 8001EA50 38E000FF */  li        r7, 0xff
/* 01BA54 8001EA54 48000004 */  b         lbl_8001EA58
lbl_8001EA58:
/* 01BA58 8001EA58 3864001C */  addi      r3, r4, 0x1c
/* 01BA5C 8001EA5C 7C661850 */  subf      r3, r6, r3
/* 01BA60 8001EA60 3800001C */  li        r0, 0x1c
/* 01BA64 8001EA64 7C630396 */  divwu     r3, r3, r0
/* 01BA68 8001EA68 7C062040 */  cmplw     r6, r4
/* 01BA6C 8001EA6C 7C6903A6 */  mtctr     r3
/* 01BA70 8001EA70 41810104 */  bgt       lbl_8001EB74
/* 01BA74 8001EA74 48000004 */  b         lbl_8001EA78
lbl_8001EA78:
/* 01BA78 8001EA78 C0E60010 */  lfs       f7, 0x10(r6)
/* 01BA7C 8001EA7C 38000000 */  li        r0, 0x0
/* 01BA80 8001EA80 C005001C */  lfs       f0, 0x1c(r5)
/* 01BA84 8001EA84 C0450010 */  lfs       f2, 0x10(r5)
/* 01BA88 8001EA88 EC070032 */  fmuls     f0, f7, f0
/* 01BA8C 8001EA8C C106000C */  lfs       f8, 0xc(r6)
/* 01BA90 8001EA90 C025000C */  lfs       f1, 0xc(r5)
/* 01BA94 8001EA94 EC4700B2 */  fmuls     f2, f7, f2
/* 01BA98 8001EA98 C0650000 */  lfs       f3, 0x0(r5)
/* 01BA9C 8001EA9C EC08007A */  fmadds    f0, f8, f1, f0
/* 01BAA0 8001EAA0 C1260014 */  lfs       f9, 0x14(r6)
/* 01BAA4 8001EAA4 C025002C */  lfs       f1, 0x2c(r5)
/* 01BAA8 8001EAA8 ECA810FA */  fmadds    f5, f8, f3, f2
/* 01BAAC 8001EAAC C0650014 */  lfs       f3, 0x14(r5)
/* 01BAB0 8001EAB0 C0450018 */  lfs       f2, 0x18(r5)
/* 01BAB4 8001EAB4 EC09007A */  fmadds    f0, f9, f1, f0
/* 01BAB8 8001EAB8 C0C50020 */  lfs       f6, 0x20(r5)
/* 01BABC 8001EABC EC6700F2 */  fmuls     f3, f7, f3
/* 01BAC0 8001EAC0 C025003C */  lfs       f1, 0x3c(r5)
/* 01BAC4 8001EAC4 C0850004 */  lfs       f4, 0x4(r5)
/* 01BAC8 8001EAC8 ED41002A */  fadds     f10, f1, f0
/* 01BACC 8001EACC C0250008 */  lfs       f1, 0x8(r5)
/* 01BAD0 8001EAD0 EC0700B2 */  fmuls     f0, f7, f2
/* 01BAD4 8001EAD4 C0E50030 */  lfs       f7, 0x30(r5)
/* 01BAD8 8001EAD8 ECA929BA */  fmadds    f5, f9, f6, f5
/* 01BADC 8001EADC EC68193A */  fmadds    f3, f8, f4, f3
/* 01BAE0 8001EAE0 C0850024 */  lfs       f4, 0x24(r5)
/* 01BAE4 8001EAE4 EC28007A */  fmadds    f1, f8, f1, f0
/* 01BAE8 8001EAE8 C0450028 */  lfs       f2, 0x28(r5)
/* 01BAEC 8001EAEC ECC7282A */  fadds     f6, f7, f5
/* 01BAF0 8001EAF0 FC005050 */  fneg      f0, f10
/* 01BAF4 8001EAF4 C0A50034 */  lfs       f5, 0x34(r5)
/* 01BAF8 8001EAF8 EC89193A */  fmadds    f4, f9, f4, f3
/* 01BAFC 8001EAFC C0650038 */  lfs       f3, 0x38(r5)
/* 01BB00 8001EB00 EC2908BA */  fmadds    f1, f9, f2, f1
/* 01BB04 8001EB04 FC060040 */  fcmpo     cr0, f6, f0
/* 01BB08 8001EB08 EC45202A */  fadds     f2, f5, f4
/* 01BB0C 8001EB0C EC23082A */  fadds     f1, f3, f1
/* 01BB10 8001EB10 40800008 */  bge       lbl_8001EB18
/* 01BB14 8001EB14 60000001 */  ori       r0, r0, 0x1
lbl_8001EB18:
/* 01BB18 8001EB18 FC065040 */  fcmpo     cr0, f6, f10
/* 01BB1C 8001EB1C 40810008 */  ble       lbl_8001EB24
/* 01BB20 8001EB20 60000002 */  ori       r0, r0, 0x2
lbl_8001EB24:
/* 01BB24 8001EB24 FC005050 */  fneg      f0, f10
/* 01BB28 8001EB28 FC020040 */  fcmpo     cr0, f2, f0
/* 01BB2C 8001EB2C 40800008 */  bge       lbl_8001EB34
/* 01BB30 8001EB30 60000004 */  ori       r0, r0, 0x4
lbl_8001EB34:
/* 01BB34 8001EB34 FC025040 */  fcmpo     cr0, f2, f10
/* 01BB38 8001EB38 40810008 */  ble       lbl_8001EB40
/* 01BB3C 8001EB3C 60000008 */  ori       r0, r0, 0x8
lbl_8001EB40:
/* 01BB40 8001EB40 FC010040 */  fcmpo     cr0, f1, f0
/* 01BB44 8001EB44 40800008 */  bge       lbl_8001EB4C
/* 01BB48 8001EB48 60000010 */  ori       r0, r0, 0x10
lbl_8001EB4C:
/* 01BB4C 8001EB4C FC015040 */  fcmpo     cr0, f1, f10
/* 01BB50 8001EB50 40810008 */  ble       lbl_8001EB58
/* 01BB54 8001EB54 60000020 */  ori       r0, r0, 0x20
lbl_8001EB58:
/* 01BB58 8001EB58 7CE70038 */  and       r7, r7, r0
/* 01BB5C 8001EB5C 2C070000 */  cmpwi     r7, 0x0
/* 01BB60 8001EB60 4082000C */  bne       lbl_8001EB6C
/* 01BB64 8001EB64 38600000 */  li        r3, 0x0
/* 01BB68 8001EB68 48000010 */  b         lbl_8001EB78
lbl_8001EB6C:
/* 01BB6C 8001EB6C 38C6001C */  addi      r6, r6, 0x1c
/* 01BB70 8001EB70 4200FF08 */  bdnz      lbl_8001EA78
lbl_8001EB74:
/* 01BB74 8001EB74 38600001 */  li        r3, 0x1
lbl_8001EB78:
/* 01BB78 8001EB78 4E800020 */  blr

glabel frameLoadVertex
/* 01BB7C 8001EB7C 7C0802A6 */  mflr      r0
/* 01BB80 8001EB80 90010004 */  stw       r0, 0x4(r1)
/* 01BB84 8001EB84 9421FF18 */  stwu      r1, -0xe8(r1)
/* 01BB88 8001EB88 DBE100E0 */  stfd      f31, 0xe0(r1)
/* 01BB8C 8001EB8C DBC100D8 */  stfd      f30, 0xd8(r1)
/* 01BB90 8001EB90 DBA100D0 */  stfd      f29, 0xd0(r1)
/* 01BB94 8001EB94 DB8100C8 */  stfd      f28, 0xc8(r1)
/* 01BB98 8001EB98 DB6100C0 */  stfd      f27, 0xc0(r1)
/* 01BB9C 8001EB9C BE210084 */  stmw      r17, 0x84(r1)
/* 01BBA0 8001EBA0 7C7E1B78 */  mr        r30, r3
/* 01BBA4 8001EBA4 7CB42B78 */  mr        r20, r5
/* 01BBA8 8001EBA8 7CDF3378 */  mr        r31, r6
/* 01BBAC 8001EBAC 2C140000 */  cmpwi     r20, 0x0
/* 01BBB0 8001EBB0 381FFFFF */  subi      r0, r31, 0x1
/* 01BBB4 8001EBB4 7C982378 */  mr        r24, r4
/* 01BBB8 8001EBB8 7C972378 */  mr        r23, r4
/* 01BBBC 8001EBBC 7C140214 */  add       r0, r20, r0
/* 01BBC0 8001EBC0 4180001C */  blt       lbl_8001EBDC
/* 01BBC4 8001EBC4 2C140050 */  cmpwi     r20, 0x50
/* 01BBC8 8001EBC8 40800014 */  bge       lbl_8001EBDC
/* 01BBCC 8001EBCC 2C000000 */  cmpwi     r0, 0x0
/* 01BBD0 8001EBD0 4180000C */  blt       lbl_8001EBDC
/* 01BBD4 8001EBD4 2C000050 */  cmpwi     r0, 0x50
/* 01BBD8 8001EBD8 4180000C */  blt       lbl_8001EBE4
lbl_8001EBDC:
/* 01BBDC 8001EBDC 38600000 */  li        r3, 0x0
/* 01BBE0 8001EBE0 480009F8 */  b         lbl_8001F5D8
lbl_8001EBE4:
/* 01BBE4 8001EBE4 3FBE0004 */  addis     r29, r30, 0x4
/* 01BBE8 8001EBE8 801E008C */  lwz       r0, 0x8c(r30)
/* 01BBEC 8001EBEC 807DC4CC */  lwz       r3, -0x3b34(r29)
/* 01BBF0 8001EBF0 54000108 */  rlwinm    r0, r0, 0, 4, 4
/* 01BBF4 8001EBF4 54633032 */  slwi      r3, r3, 6
/* 01BBF8 8001EBF8 3EA30004 */  addis     r21, r3, 0x4
/* 01BBFC 8001EBFC 3AB5C520 */  subi      r21, r21, 0x3ae0
/* 01BC00 8001EC00 28000000 */  cmplwi    r0, 0x0
/* 01BC04 8001EC04 7EBEAA14 */  add       r21, r30, r21
/* 01BC08 8001EC08 41820080 */  beq       lbl_8001EC88
/* 01BC0C 8001EC0C 801E008C */  lwz       r0, 0x8c(r30)
/* 01BC10 8001EC10 54000252 */  rlwinm    r0, r0, 0, 9, 9
/* 01BC14 8001EC14 28000000 */  cmplwi    r0, 0x0
/* 01BC18 8001EC18 40820064 */  bne       lbl_8001EC7C
/* 01BC1C 8001EC1C 7FA4EB78 */  mr        r4, r29
/* 01BC20 8001EC20 7FA5EB78 */  mr        r5, r29
/* 01BC24 8001EC24 7EA3AB78 */  mr        r3, r21
/* 01BC28 8001EC28 3884C7E0 */  subi      r4, r4, 0x3820
/* 01BC2C 8001EC2C 38A5C4D4 */  subi      r5, r5, 0x3b2c
/* 01BC30 8001EC30 48088031 */  bl        fn_800A6C60
/* 01BC34 8001EC34 801E008C */  lwz       r0, 0x8c(r30)
/* 01BC38 8001EC38 64000040 */  oris      r0, r0, 0x40
/* 01BC3C 8001EC3C 901E008C */  stw       r0, 0x8c(r30)
/* 01BC40 8001EC40 801DC4D0 */  lwz       r0, -0x3b30(r29)
/* 01BC44 8001EC44 2C00FFFF */  cmpwi     r0, -0x1
/* 01BC48 8001EC48 41820034 */  beq       lbl_8001EC7C
/* 01BC4C 8001EC4C 1C000024 */  mulli     r0, r0, 0x24
/* 01BC50 8001EC50 7C9D0214 */  add       r4, r29, r0
/* 01BC54 8001EC54 7FA3EB78 */  mr        r3, r29
/* 01BC58 8001EC58 C024C824 */  lfs       f1, -0x37dc(r4)
/* 01BC5C 8001EC5C 7FA4EB78 */  mr        r4, r29
/* 01BC60 8001EC60 3863C4D4 */  subi      r3, r3, 0x3b2c
/* 01BC64 8001EC64 3884C4D4 */  subi      r4, r4, 0x3b2c
/* 01BC68 8001EC68 48002285 */  bl        frameScaleMatrix
/* 01BC6C 8001EC6C 2C030000 */  cmpwi     r3, 0x0
/* 01BC70 8001EC70 4082000C */  bne       lbl_8001EC7C
/* 01BC74 8001EC74 38600000 */  li        r3, 0x0
/* 01BC78 8001EC78 48000960 */  b         lbl_8001F5D8
lbl_8001EC7C:
/* 01BC7C 8001EC7C 3EDE0004 */  addis     r22, r30, 0x4
/* 01BC80 8001EC80 3AD6C4D4 */  subi      r22, r22, 0x3b2c
/* 01BC84 8001EC84 48000064 */  b         lbl_8001ECE8
lbl_8001EC88:
/* 01BC88 8001EC88 801E008C */  lwz       r0, 0x8c(r30)
/* 01BC8C 8001EC8C 54000252 */  rlwinm    r0, r0, 0, 9, 9
/* 01BC90 8001EC90 28000000 */  cmplwi    r0, 0x0
/* 01BC94 8001EC94 40820050 */  bne       lbl_8001ECE4
/* 01BC98 8001EC98 801DC4D0 */  lwz       r0, -0x3b30(r29)
/* 01BC9C 8001EC9C 2C00FFFF */  cmpwi     r0, -0x1
/* 01BCA0 8001ECA0 41820044 */  beq       lbl_8001ECE4
/* 01BCA4 8001ECA4 1C000024 */  mulli     r0, r0, 0x24
/* 01BCA8 8001ECA8 7C9D0214 */  add       r4, r29, r0
/* 01BCAC 8001ECAC 7FA3EB78 */  mr        r3, r29
/* 01BCB0 8001ECB0 C024C824 */  lfs       f1, -0x37dc(r4)
/* 01BCB4 8001ECB4 7EA4AB78 */  mr        r4, r21
/* 01BCB8 8001ECB8 3863C4D4 */  subi      r3, r3, 0x3b2c
/* 01BCBC 8001ECBC 48002231 */  bl        frameScaleMatrix
/* 01BCC0 8001ECC0 2C030000 */  cmpwi     r3, 0x0
/* 01BCC4 8001ECC4 4082000C */  bne       lbl_8001ECD0
/* 01BCC8 8001ECC8 38600000 */  li        r3, 0x0
/* 01BCCC 8001ECCC 4800090C */  b         lbl_8001F5D8
lbl_8001ECD0:
/* 01BCD0 8001ECD0 801E008C */  lwz       r0, 0x8c(r30)
/* 01BCD4 8001ECD4 3ADDC4D4 */  subi      r22, r29, 0x3b2c
/* 01BCD8 8001ECD8 64000040 */  oris      r0, r0, 0x40
/* 01BCDC 8001ECDC 901E008C */  stw       r0, 0x8c(r30)
/* 01BCE0 8001ECE0 48000008 */  b         lbl_8001ECE8
lbl_8001ECE4:
/* 01BCE4 8001ECE4 7EB6AB78 */  mr        r22, r21
lbl_8001ECE8:
/* 01BCE8 8001ECE8 807E0094 */  lwz       r3, 0x94(r30)
/* 01BCEC 8001ECEC 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 01BCF0 8001ECF0 28000000 */  cmplwi    r0, 0x0
/* 01BCF4 8001ECF4 41820328 */  beq       lbl_8001F01C
/* 01BCF8 8001ECF8 839E013C */  lwz       r28, 0x13c(r30)
/* 01BCFC 8001ECFC 547B05F0 */  rlwinm    r27, r3, 0, 23, 24
/* 01BD00 8001ED00 3B5E0140 */  addi      r26, r30, 0x140
/* 01BD04 8001ED04 3BA00000 */  li        r29, 0x0
/* 01BD08 8001ED08 3A600000 */  li        r19, 0x0
/* 01BD0C 8001ED0C 48000004 */  b         lbl_8001ED10
lbl_8001ED10:
/* 01BD10 8001ED10 3C80800F */  lis       r4, D_800F51D8@ha
/* 01BD14 8001ED14 C3C28100 */  lfs       f30, D_8018C040@sda21(r0)
/* 01BD18 8001ED18 3C60800F */  lis       r3, D_800F51DC@ha
/* 01BD1C 8001ED1C C3E28130 */  lfs       f31, D_8018C070@sda21(r0)
/* 01BD20 8001ED20 C3628134 */  lfs       f27, D_8018C074@sda21(r0)
/* 01BD24 8001ED24 3A2451D8 */  addi      r17, r4, D_800F51D8@l
/* 01BD28 8001ED28 3A4351DC */  addi      r18, r3, D_800F51DC@l
/* 01BD2C 8001ED2C 48000004 */  b         lbl_8001ED30
lbl_8001ED30:
/* 01BD30 8001ED30 480000D8 */  b         lbl_8001EE08
lbl_8001ED34:
/* 01BD34 8001ED34 7F3A9A14 */  add       r25, r26, r19
/* 01BD38 8001ED38 80190000 */  lwz       r0, 0x0(r25)
/* 01BD3C 8001ED3C 2C000000 */  cmpwi     r0, 0x0
/* 01BD40 8001ED40 41820014 */  beq       lbl_8001ED54
/* 01BD44 8001ED44 801E008C */  lwz       r0, 0x8c(r30)
/* 01BD48 8001ED48 54000294 */  rlwinm    r0, r0, 0, 10, 10
/* 01BD4C 8001ED4C 28000000 */  cmplwi    r0, 0x0
/* 01BD50 8001ED50 408200B0 */  bne       lbl_8001EE00
lbl_8001ED54:
/* 01BD54 8001ED54 7EA3AB78 */  mr        r3, r21
/* 01BD58 8001ED58 38990004 */  addi      r4, r25, 0x4
/* 01BD5C 8001ED5C 38A10028 */  addi      r5, r1, 0x28
/* 01BD60 8001ED60 4BFFE39D */  bl        PSMTX44MultVecNoW
/* 01BD64 8001ED64 C001002C */  lfs       f0, 0x2c(r1)
/* 01BD68 8001ED68 C0410028 */  lfs       f2, 0x28(r1)
/* 01BD6C 8001ED6C EC000032 */  fmuls     f0, f0, f0
/* 01BD70 8001ED70 C0610030 */  lfs       f3, 0x30(r1)
/* 01BD74 8001ED74 EC0200BA */  fmadds    f0, f2, f2, f0
/* 01BD78 8001ED78 EC6300FA */  fmadds    f3, f3, f3, f0
/* 01BD7C 8001ED7C FC03F040 */  fcmpo     cr0, f3, f30
/* 01BD80 8001ED80 40810040 */  ble       lbl_8001EDC0
/* 01BD84 8001ED84 FC401834 */  frsqrte   f2, f3
/* 01BD88 8001ED88 FC401018 */  frsp      f2, f2
/* 01BD8C 8001ED8C EC0200B2 */  fmuls     f0, f2, f2
/* 01BD90 8001ED90 EC5F00B2 */  fmuls     f2, f31, f2
/* 01BD94 8001ED94 EC03D83C */  fnmsubs   f0, f3, f0, f27
/* 01BD98 8001ED98 EC420032 */  fmuls     f2, f2, f0
/* 01BD9C 8001ED9C EC0200B2 */  fmuls     f0, f2, f2
/* 01BDA0 8001EDA0 EC5F00B2 */  fmuls     f2, f31, f2
/* 01BDA4 8001EDA4 EC03D83C */  fnmsubs   f0, f3, f0, f27
/* 01BDA8 8001EDA8 EC420032 */  fmuls     f2, f2, f0
/* 01BDAC 8001EDAC EC0200B2 */  fmuls     f0, f2, f2
/* 01BDB0 8001EDB0 EC5F00B2 */  fmuls     f2, f31, f2
/* 01BDB4 8001EDB4 EC03D83C */  fnmsubs   f0, f3, f0, f27
/* 01BDB8 8001EDB8 EC420032 */  fmuls     f2, f2, f0
/* 01BDBC 8001EDBC 48000018 */  b         lbl_8001EDD4
lbl_8001EDC0:
/* 01BDC0 8001EDC0 FC03F000 */  fcmpu     cr0, f3, f30
/* 01BDC4 8001EDC4 4182000C */  beq       lbl_8001EDD0
/* 01BDC8 8001EDC8 C0510000 */  lfs       f2, 0x0(r17)
/* 01BDCC 8001EDCC 48000008 */  b         lbl_8001EDD4
lbl_8001EDD0:
/* 01BDD0 8001EDD0 C0520000 */  lfs       f2, 0x0(r18)
lbl_8001EDD4:
/* 01BDD4 8001EDD4 C0010028 */  lfs       f0, 0x28(r1)
/* 01BDD8 8001EDD8 38000001 */  li        r0, 0x1
/* 01BDDC 8001EDDC EC0000B2 */  fmuls     f0, f0, f2
/* 01BDE0 8001EDE0 D019001C */  stfs      f0, 0x1c(r25)
/* 01BDE4 8001EDE4 C001002C */  lfs       f0, 0x2c(r1)
/* 01BDE8 8001EDE8 EC0000B2 */  fmuls     f0, f0, f2
/* 01BDEC 8001EDEC D0190020 */  stfs      f0, 0x20(r25)
/* 01BDF0 8001EDF0 C0010030 */  lfs       f0, 0x30(r1)
/* 01BDF4 8001EDF4 EC0000B2 */  fmuls     f0, f0, f2
/* 01BDF8 8001EDF8 D0190024 */  stfs      f0, 0x24(r25)
/* 01BDFC 8001EDFC 90190000 */  stw       r0, 0x0(r25)
lbl_8001EE00:
/* 01BE00 8001EE00 3BBD0001 */  addi      r29, r29, 0x1
/* 01BE04 8001EE04 3A73003C */  addi      r19, r19, 0x3c
lbl_8001EE08:
/* 01BE08 8001EE08 7C1DE000 */  cmpw      r29, r28
/* 01BE0C 8001EE0C 4180FF28 */  blt       lbl_8001ED34
/* 01BE10 8001EE10 2C1B0000 */  cmpwi     r27, 0x0
/* 01BE14 8001EE14 418201F8 */  beq       lbl_8001F00C
/* 01BE18 8001EE18 801E0320 */  lwz       r0, 0x320(r30)
/* 01BE1C 8001EE1C 2C000000 */  cmpwi     r0, 0x0
/* 01BE20 8001EE20 41820014 */  beq       lbl_8001EE34
/* 01BE24 8001EE24 801E008C */  lwz       r0, 0x8c(r30)
/* 01BE28 8001EE28 54000294 */  rlwinm    r0, r0, 0, 10, 10
/* 01BE2C 8001EE2C 28000000 */  cmplwi    r0, 0x0
/* 01BE30 8001EE30 408201DC */  bne       lbl_8001F00C
lbl_8001EE34:
/* 01BE34 8001EE34 801E008C */  lwz       r0, 0x8c(r30)
/* 01BE38 8001EE38 540001CE */  rlwinm    r0, r0, 0, 7, 7
/* 01BE3C 8001EE3C 28000000 */  cmplwi    r0, 0x0
/* 01BE40 8001EE40 40820018 */  bne       lbl_8001EE58
/* 01BE44 8001EE44 C0428100 */  lfs       f2, D_8018C040@sda21(r0)
/* 01BE48 8001EE48 D05E033C */  stfs      f2, 0x33c(r30)
/* 01BE4C 8001EE4C C0028138 */  lfs       f0, D_8018C078@sda21(r0)
/* 01BE50 8001EE50 D01E0340 */  stfs      f0, 0x340(r30)
/* 01BE54 8001EE54 D05E0344 */  stfs      f2, 0x344(r30)
lbl_8001EE58:
/* 01BE58 8001EE58 801E008C */  lwz       r0, 0x8c(r30)
/* 01BE5C 8001EE5C 5400018C */  rlwinm    r0, r0, 0, 6, 6
/* 01BE60 8001EE60 28000000 */  cmplwi    r0, 0x0
/* 01BE64 8001EE64 40820018 */  bne       lbl_8001EE7C
/* 01BE68 8001EE68 C0028138 */  lfs       f0, D_8018C078@sda21(r0)
/* 01BE6C 8001EE6C D01E0348 */  stfs      f0, 0x348(r30)
/* 01BE70 8001EE70 C0028100 */  lfs       f0, D_8018C040@sda21(r0)
/* 01BE74 8001EE74 D01E034C */  stfs      f0, 0x34c(r30)
/* 01BE78 8001EE78 D01E0350 */  stfs      f0, 0x350(r30)
lbl_8001EE7C:
/* 01BE7C 8001EE7C 7EA3AB78 */  mr        r3, r21
/* 01BE80 8001EE80 389E033C */  addi      r4, r30, 0x33c
/* 01BE84 8001EE84 38BE0324 */  addi      r5, r30, 0x324
/* 01BE88 8001EE88 4BFFE275 */  bl        PSMTX44MultVecNoW
/* 01BE8C 8001EE8C 7EA3AB78 */  mr        r3, r21
/* 01BE90 8001EE90 389E0348 */  addi      r4, r30, 0x348
/* 01BE94 8001EE94 38BE0330 */  addi      r5, r30, 0x330
/* 01BE98 8001EE98 4BFFE265 */  bl        PSMTX44MultVecNoW
/* 01BE9C 8001EE9C C01E0328 */  lfs       f0, 0x328(r30)
/* 01BEA0 8001EEA0 C07E0324 */  lfs       f3, 0x324(r30)
/* 01BEA4 8001EEA4 EC400032 */  fmuls     f2, f0, f0
/* 01BEA8 8001EEA8 C09E032C */  lfs       f4, 0x32c(r30)
/* 01BEAC 8001EEAC C0028100 */  lfs       f0, D_8018C040@sda21(r0)
/* 01BEB0 8001EEB0 EC4310FA */  fmadds    f2, f3, f3, f2
/* 01BEB4 8001EEB4 ECA4113A */  fmadds    f5, f4, f4, f2
/* 01BEB8 8001EEB8 FC050040 */  fcmpo     cr0, f5, f0
/* 01BEBC 8001EEBC 40810094 */  ble       lbl_8001EF50
/* 01BEC0 8001EEC0 40810048 */  ble       lbl_8001EF08
/* 01BEC4 8001EEC4 FC402834 */  frsqrte   f2, f5
/* 01BEC8 8001EEC8 C0828130 */  lfs       f4, D_8018C070@sda21(r0)
/* 01BECC 8001EECC C0628134 */  lfs       f3, D_8018C074@sda21(r0)
/* 01BED0 8001EED0 FC401018 */  frsp      f2, f2
/* 01BED4 8001EED4 EC0200B2 */  fmuls     f0, f2, f2
/* 01BED8 8001EED8 EC4400B2 */  fmuls     f2, f4, f2
/* 01BEDC 8001EEDC EC05183C */  fnmsubs   f0, f5, f0, f3
/* 01BEE0 8001EEE0 EC420032 */  fmuls     f2, f2, f0
/* 01BEE4 8001EEE4 EC0200B2 */  fmuls     f0, f2, f2
/* 01BEE8 8001EEE8 EC4400B2 */  fmuls     f2, f4, f2
/* 01BEEC 8001EEEC EC05183C */  fnmsubs   f0, f5, f0, f3
/* 01BEF0 8001EEF0 EC420032 */  fmuls     f2, f2, f0
/* 01BEF4 8001EEF4 EC0200B2 */  fmuls     f0, f2, f2
/* 01BEF8 8001EEF8 EC4400B2 */  fmuls     f2, f4, f2
/* 01BEFC 8001EEFC EC05183C */  fnmsubs   f0, f5, f0, f3
/* 01BF00 8001EF00 EC420032 */  fmuls     f2, f2, f0
/* 01BF04 8001EF04 48000028 */  b         lbl_8001EF2C
lbl_8001EF08:
/* 01BF08 8001EF08 FC050000 */  fcmpu     cr0, f5, f0
/* 01BF0C 8001EF0C 41820014 */  beq       lbl_8001EF20
/* 01BF10 8001EF10 3C60800F */  lis       r3, D_800F51D8@ha
/* 01BF14 8001EF14 386351D8 */  addi      r3, r3, D_800F51D8@l
/* 01BF18 8001EF18 C0430000 */  lfs       f2, 0x0(r3)
/* 01BF1C 8001EF1C 48000010 */  b         lbl_8001EF2C
lbl_8001EF20:
/* 01BF20 8001EF20 3C60800F */  lis       r3, D_800F51DC@ha
/* 01BF24 8001EF24 386351DC */  addi      r3, r3, D_800F51DC@l
/* 01BF28 8001EF28 C0430000 */  lfs       f2, 0x0(r3)
lbl_8001EF2C:
/* 01BF2C 8001EF2C C01E0324 */  lfs       f0, 0x324(r30)
/* 01BF30 8001EF30 EC0000B2 */  fmuls     f0, f0, f2
/* 01BF34 8001EF34 D01E0324 */  stfs      f0, 0x324(r30)
/* 01BF38 8001EF38 C01E0328 */  lfs       f0, 0x328(r30)
/* 01BF3C 8001EF3C EC0000B2 */  fmuls     f0, f0, f2
/* 01BF40 8001EF40 D01E0328 */  stfs      f0, 0x328(r30)
/* 01BF44 8001EF44 C01E032C */  lfs       f0, 0x32c(r30)
/* 01BF48 8001EF48 EC0000B2 */  fmuls     f0, f0, f2
/* 01BF4C 8001EF4C D01E032C */  stfs      f0, 0x32c(r30)
lbl_8001EF50:
/* 01BF50 8001EF50 C01E0334 */  lfs       f0, 0x334(r30)
/* 01BF54 8001EF54 C07E0330 */  lfs       f3, 0x330(r30)
/* 01BF58 8001EF58 EC400032 */  fmuls     f2, f0, f0
/* 01BF5C 8001EF5C C09E0338 */  lfs       f4, 0x338(r30)
/* 01BF60 8001EF60 C0028100 */  lfs       f0, D_8018C040@sda21(r0)
/* 01BF64 8001EF64 EC4310FA */  fmadds    f2, f3, f3, f2
/* 01BF68 8001EF68 ECA4113A */  fmadds    f5, f4, f4, f2
/* 01BF6C 8001EF6C FC050040 */  fcmpo     cr0, f5, f0
/* 01BF70 8001EF70 40810094 */  ble       lbl_8001F004
/* 01BF74 8001EF74 40810048 */  ble       lbl_8001EFBC
/* 01BF78 8001EF78 FC402834 */  frsqrte   f2, f5
/* 01BF7C 8001EF7C C0828130 */  lfs       f4, D_8018C070@sda21(r0)
/* 01BF80 8001EF80 C0628134 */  lfs       f3, D_8018C074@sda21(r0)
/* 01BF84 8001EF84 FC401018 */  frsp      f2, f2
/* 01BF88 8001EF88 EC0200B2 */  fmuls     f0, f2, f2
/* 01BF8C 8001EF8C EC4400B2 */  fmuls     f2, f4, f2
/* 01BF90 8001EF90 EC05183C */  fnmsubs   f0, f5, f0, f3
/* 01BF94 8001EF94 EC420032 */  fmuls     f2, f2, f0
/* 01BF98 8001EF98 EC0200B2 */  fmuls     f0, f2, f2
/* 01BF9C 8001EF9C EC4400B2 */  fmuls     f2, f4, f2
/* 01BFA0 8001EFA0 EC05183C */  fnmsubs   f0, f5, f0, f3
/* 01BFA4 8001EFA4 EC420032 */  fmuls     f2, f2, f0
/* 01BFA8 8001EFA8 EC0200B2 */  fmuls     f0, f2, f2
/* 01BFAC 8001EFAC EC4400B2 */  fmuls     f2, f4, f2
/* 01BFB0 8001EFB0 EC05183C */  fnmsubs   f0, f5, f0, f3
/* 01BFB4 8001EFB4 EC420032 */  fmuls     f2, f2, f0
/* 01BFB8 8001EFB8 48000028 */  b         lbl_8001EFE0
lbl_8001EFBC:
/* 01BFBC 8001EFBC FC050000 */  fcmpu     cr0, f5, f0
/* 01BFC0 8001EFC0 41820014 */  beq       lbl_8001EFD4
/* 01BFC4 8001EFC4 3C60800F */  lis       r3, D_800F51D8@ha
/* 01BFC8 8001EFC8 386351D8 */  addi      r3, r3, D_800F51D8@l
/* 01BFCC 8001EFCC C0430000 */  lfs       f2, 0x0(r3)
/* 01BFD0 8001EFD0 48000010 */  b         lbl_8001EFE0
lbl_8001EFD4:
/* 01BFD4 8001EFD4 3C60800F */  lis       r3, D_800F51DC@ha
/* 01BFD8 8001EFD8 386351DC */  addi      r3, r3, D_800F51DC@l
/* 01BFDC 8001EFDC C0430000 */  lfs       f2, 0x0(r3)
lbl_8001EFE0:
/* 01BFE0 8001EFE0 C01E0330 */  lfs       f0, 0x330(r30)
/* 01BFE4 8001EFE4 EC0000B2 */  fmuls     f0, f0, f2
/* 01BFE8 8001EFE8 D01E0330 */  stfs      f0, 0x330(r30)
/* 01BFEC 8001EFEC C01E0334 */  lfs       f0, 0x334(r30)
/* 01BFF0 8001EFF0 EC0000B2 */  fmuls     f0, f0, f2
/* 01BFF4 8001EFF4 D01E0334 */  stfs      f0, 0x334(r30)
/* 01BFF8 8001EFF8 C01E0338 */  lfs       f0, 0x338(r30)
/* 01BFFC 8001EFFC EC0000B2 */  fmuls     f0, f0, f2
/* 01C000 8001F000 D01E0338 */  stfs      f0, 0x338(r30)
lbl_8001F004:
/* 01C004 8001F004 38000001 */  li        r0, 0x1
/* 01C008 8001F008 901E0320 */  stw       r0, 0x320(r30)
lbl_8001F00C:
/* 01C00C 8001F00C 801E008C */  lwz       r0, 0x8c(r30)
/* 01C010 8001F010 64000020 */  oris      r0, r0, 0x20
/* 01C014 8001F014 901E008C */  stw       r0, 0x8c(r30)
/* 01C018 8001F018 4800000C */  b         lbl_8001F024
lbl_8001F01C:
/* 01C01C 8001F01C 3B600000 */  li        r27, 0x0
/* 01C020 8001F020 3B800000 */  li        r28, 0x0
lbl_8001F024:
/* 01C024 8001F024 1C74001C */  mulli     r3, r20, 0x1c
/* 01C028 8001F028 39030358 */  addi      r8, r3, 0x358
/* 01C02C 8001F02C 7D1E4214 */  add       r8, r30, r8
/* 01C030 8001F030 48000004 */  b         lbl_8001F034
lbl_8001F034:
/* 01C034 8001F034 2C1F0000 */  cmpwi     r31, 0x0
/* 01C038 8001F038 7FE903A6 */  mtctr     r31
/* 01C03C 8001F03C C0A28100 */  lfs       f5, D_8018C040@sda21(r0)
/* 01C040 8001F040 38810040 */  addi      r4, r1, 0x40
/* 01C044 8001F044 C8828110 */  lfd       f4, D_8018C050@sda21(r0)
/* 01C048 8001F048 576905EE */  rlwinm    r9, r27, 0, 23, 23
/* 01C04C 8001F04C C8628140 */  lfd       f3, D_8018C080@sda21(r0)
/* 01C050 8001F050 C8428148 */  lfd       f2, D_8018C088@sda21(r0)
/* 01C054 8001F054 38610034 */  addi      r3, r1, 0x34
/* 01C058 8001F058 C0028138 */  lfs       f0, D_8018C078@sda21(r0)
/* 01C05C 8001F05C 38A10020 */  addi      r5, r1, 0x20
/* 01C060 8001F060 C1828150 */  lfs       f12, D_8018C090@sda21(r0)
/* 01C064 8001F064 C1628154 */  lfs       f11, D_8018C094@sda21(r0)
/* 01C068 8001F068 38C1001C */  addi      r6, r1, 0x1c
/* 01C06C 8001F06C C1428130 */  lfs       f10, D_8018C070@sda21(r0)
/* 01C070 8001F070 38E10018 */  addi      r7, r1, 0x18
/* 01C074 8001F074 3C004330 */  lis       r0, 0x4330
/* 01C078 8001F078 4182055C */  beq       lbl_8001F5D4
/* 01C07C 8001F07C 48000004 */  b         lbl_8001F080
lbl_8001F080:
/* 01C080 8001F080 E0375000 */  psq_l     f1, 0x0(r23), 0, qr5
/* 01C084 8001F084 F0230000 */  psq_st    f1, 0x0(r3), 0, qr0
/* 01C088 8001F088 39570004 */  addi      r10, r23, 0x4
/* 01C08C 8001F08C E0CAD000 */  psq_l     f6, 0x0(r10), 1, qr5
/* 01C090 8001F090 D0C1003C */  stfs      f6, 0x3c(r1)
/* 01C094 8001F094 2C1C0000 */  cmpwi     r28, 0x0
/* 01C098 8001F098 C0E10034 */  lfs       f7, 0x34(r1)
/* 01C09C 8001F09C C0C10038 */  lfs       f6, 0x38(r1)
/* 01C0A0 8001F0A0 C101003C */  lfs       f8, 0x3c(r1)
/* 01C0A4 8001F0A4 ECC7302A */  fadds     f6, f7, f6
/* 01C0A8 8001F0A8 ECC8302A */  fadds     f6, f8, f6
/* 01C0AC 8001F0AC D0C80000 */  stfs      f6, 0x0(r8)
/* 01C0B0 8001F0B0 C0D6001C */  lfs       f6, 0x1c(r22)
/* 01C0B4 8001F0B4 C1010038 */  lfs       f8, 0x38(r1)
/* 01C0B8 8001F0B8 C136000C */  lfs       f9, 0xc(r22)
/* 01C0BC 8001F0BC ECE60232 */  fmuls     f7, f6, f8
/* 01C0C0 8001F0C0 C3610034 */  lfs       f27, 0x34(r1)
/* 01C0C4 8001F0C4 C0D60010 */  lfs       f6, 0x10(r22)
/* 01C0C8 8001F0C8 C1B6002C */  lfs       f13, 0x2c(r22)
/* 01C0CC 8001F0CC ECE93EFA */  fmadds    f7, f9, f27, f7
/* 01C0D0 8001F0D0 C381003C */  lfs       f28, 0x3c(r1)
/* 01C0D4 8001F0D4 ECC801B2 */  fmuls     f6, f8, f6
/* 01C0D8 8001F0D8 C3B6003C */  lfs       f29, 0x3c(r22)
/* 01C0DC 8001F0DC ED2D3F3A */  fmadds    f9, f13, f28, f7
/* 01C0E0 8001F0E0 C0F60000 */  lfs       f7, 0x0(r22)
/* 01C0E4 8001F0E4 C1160020 */  lfs       f8, 0x20(r22)
/* 01C0E8 8001F0E8 EDBD482A */  fadds     f13, f29, f9
/* 01C0EC 8001F0EC C1360030 */  lfs       f9, 0x30(r22)
/* 01C0F0 8001F0F0 ECFB31FA */  fmadds    f7, f27, f7, f6
/* 01C0F4 8001F0F4 ECC06824 */  fdivs     f6, f0, f13
/* 01C0F8 8001F0F8 ECFC3A3A */  fmadds    f7, f28, f8, f7
/* 01C0FC 8001F0FC ECE9382A */  fadds     f7, f9, f7
/* 01C100 8001F100 ECE601F2 */  fmuls     f7, f6, f7
/* 01C104 8001F104 D0E8000C */  stfs      f7, 0xc(r8)
/* 01C108 8001F108 C1010038 */  lfs       f8, 0x38(r1)
/* 01C10C 8001F10C C0F60014 */  lfs       f7, 0x14(r22)
/* 01C110 8001F110 C1210034 */  lfs       f9, 0x34(r1)
/* 01C114 8001F114 ECE801F2 */  fmuls     f7, f8, f7
/* 01C118 8001F118 C1160004 */  lfs       f8, 0x4(r22)
/* 01C11C 8001F11C C361003C */  lfs       f27, 0x3c(r1)
/* 01C120 8001F120 C1B60024 */  lfs       f13, 0x24(r22)
/* 01C124 8001F124 ECE93A3A */  fmadds    f7, f9, f8, f7
/* 01C128 8001F128 C1160034 */  lfs       f8, 0x34(r22)
/* 01C12C 8001F12C ECFB3B7A */  fmadds    f7, f27, f13, f7
/* 01C130 8001F130 ECE8382A */  fadds     f7, f8, f7
/* 01C134 8001F134 ECE601F2 */  fmuls     f7, f6, f7
/* 01C138 8001F138 D0E80010 */  stfs      f7, 0x10(r8)
/* 01C13C 8001F13C C1010038 */  lfs       f8, 0x38(r1)
/* 01C140 8001F140 C0F60018 */  lfs       f7, 0x18(r22)
/* 01C144 8001F144 C1210034 */  lfs       f9, 0x34(r1)
/* 01C148 8001F148 ECE801F2 */  fmuls     f7, f8, f7
/* 01C14C 8001F14C C1160008 */  lfs       f8, 0x8(r22)
/* 01C150 8001F150 C361003C */  lfs       f27, 0x3c(r1)
/* 01C154 8001F154 C1B60028 */  lfs       f13, 0x28(r22)
/* 01C158 8001F158 ECE93A3A */  fmadds    f7, f9, f8, f7
/* 01C15C 8001F15C C1160038 */  lfs       f8, 0x38(r22)
/* 01C160 8001F160 ECFB3B7A */  fmadds    f7, f27, f13, f7
/* 01C164 8001F164 ECE8382A */  fadds     f7, f8, f7
/* 01C168 8001F168 ECC601F2 */  fmuls     f6, f6, f7
/* 01C16C 8001F16C D0C80014 */  stfs      f6, 0x14(r8)
/* 01C170 8001F170 41820370 */  beq       lbl_8001F4E0
/* 01C174 8001F174 3958000C */  addi      r10, r24, 0xc
/* 01C178 8001F178 E02A6000 */  psq_l     f1, 0x0(r10), 0, qr6
/* 01C17C 8001F17C F0240000 */  psq_st    f1, 0x0(r4), 0, qr0
/* 01C180 8001F180 3958000E */  addi      r10, r24, 0xe
/* 01C184 8001F184 E02AE000 */  psq_l     f1, 0x0(r10), 1, qr6
/* 01C188 8001F188 D0210048 */  stfs      f1, 0x48(r1)
/* 01C18C 8001F18C 7F9DE378 */  mr        r29, r28
/* 01C190 8001F190 1D7D003C */  mulli     r11, r29, 0x3c
/* 01C194 8001F194 814D8914 */  lwz       r10, gpSystem@sda21(r0)
/* 01C198 8001F198 814A0020 */  lwz       r10, 0x20(r10)
/* 01C19C 8001F19C 7F3A5A14 */  add       r25, r26, r11
/* 01C1A0 8001F1A0 2C0A0003 */  cmpwi     r10, 0x3
/* 01C1A4 8001F1A4 4082003C */  bne       lbl_8001F1E0
/* 01C1A8 8001F1A8 48000004 */  b         lbl_8001F1AC
lbl_8001F1AC:
/* 01C1AC 8001F1AC 48000004 */  b         lbl_8001F1B0
lbl_8001F1B0:
/* 01C1B0 8001F1B0 48000008 */  b         lbl_8001F1B8
lbl_8001F1B4:
/* 01C1B4 8001F1B4 3B39003C */  addi      r25, r25, 0x3c
lbl_8001F1B8:
/* 01C1B8 8001F1B8 C0F90010 */  lfs       f7, 0x10(r25)
/* 01C1BC 8001F1BC C1190014 */  lfs       f8, 0x14(r25)
/* 01C1C0 8001F1C0 C1390018 */  lfs       f9, 0x18(r25)
/* 01C1C4 8001F1C4 ECC7402A */  fadds     f6, f7, f8
/* 01C1C8 8001F1C8 ECC9302A */  fadds     f6, f9, f6
/* 01C1CC 8001F1CC FC053000 */  fcmpu     cr0, f5, f6
/* 01C1D0 8001F1D0 4182FFE4 */  beq       lbl_8001F1B4
/* 01C1D4 8001F1D4 1D5D003C */  mulli     r10, r29, 0x3c
/* 01C1D8 8001F1D8 7F3A5214 */  add       r25, r26, r10
/* 01C1DC 8001F1DC 48000014 */  b         lbl_8001F1F0
lbl_8001F1E0:
/* 01C1E0 8001F1E0 C0F90010 */  lfs       f7, 0x10(r25)
/* 01C1E4 8001F1E4 C1190014 */  lfs       f8, 0x14(r25)
/* 01C1E8 8001F1E8 C1390018 */  lfs       f9, 0x18(r25)
/* 01C1EC 8001F1EC 48000004 */  b         lbl_8001F1F0
lbl_8001F1F0:
/* 01C1F0 8001F1F0 48000004 */  b         lbl_8001F1F4
lbl_8001F1F4:
/* 01C1F4 8001F1F4 48000228 */  b         lbl_8001F41C
lbl_8001F1F8:
/* 01C1F8 8001F1F8 815E0094 */  lwz       r10, 0x94(r30)
/* 01C1FC 8001F1FC 3B39FFC4 */  subi      r25, r25, 0x3c
/* 01C200 8001F200 554A0528 */  rlwinm    r10, r10, 0, 20, 20
/* 01C204 8001F204 280A0000 */  cmplwi    r10, 0x0
/* 01C208 8001F208 418201D0 */  beq       lbl_8001F3D8
/* 01C20C 8001F20C C0D90028 */  lfs       f6, 0x28(r25)
/* 01C210 8001F210 FC053000 */  fcmpu     cr0, f5, f6
/* 01C214 8001F214 418201C4 */  beq       lbl_8001F3D8
/* 01C218 8001F218 A9590036 */  lha       r10, 0x36(r25)
/* 01C21C 8001F21C A9790034 */  lha       r11, 0x34(r25)
/* 01C220 8001F220 6D4A8000 */  xoris     r10, r10, 0x8000
/* 01C224 8001F224 A9990038 */  lha       r12, 0x38(r25)
/* 01C228 8001F228 9141005C */  stw       r10, 0x5c(r1)
/* 01C22C 8001F22C 6D6B8000 */  xoris     r11, r11, 0x8000
/* 01C230 8001F230 6D8C8000 */  xoris     r12, r12, 0x8000
/* 01C234 8001F234 C3610038 */  lfs       f27, 0x38(r1)
/* 01C238 8001F238 91410054 */  stw       r10, 0x54(r1)
/* 01C23C 8001F23C C3810034 */  lfs       f28, 0x34(r1)
/* 01C240 8001F240 90010058 */  stw       r0, 0x58(r1)
/* 01C244 8001F244 C3C1003C */  lfs       f30, 0x3c(r1)
/* 01C248 8001F248 90010050 */  stw       r0, 0x50(r1)
/* 01C24C 8001F24C C9A10058 */  lfd       f13, 0x58(r1)
/* 01C250 8001F250 9161006C */  stw       r11, 0x6c(r1)
/* 01C254 8001F254 C8C10050 */  lfd       f6, 0x50(r1)
/* 01C258 8001F258 EDAD2028 */  fsubs     f13, f13, f4
/* 01C25C 8001F25C 91610064 */  stw       r11, 0x64(r1)
/* 01C260 8001F260 ECC62028 */  fsubs     f6, f6, f4
/* 01C264 8001F264 90010068 */  stw       r0, 0x68(r1)
/* 01C268 8001F268 EDADD828 */  fsubs     f13, f13, f27
/* 01C26C 8001F26C 90010060 */  stw       r0, 0x60(r1)
/* 01C270 8001F270 ECC6D828 */  fsubs     f6, f6, f27
/* 01C274 8001F274 CBA10068 */  lfd       f29, 0x68(r1)
/* 01C278 8001F278 9181007C */  stw       r12, 0x7c(r1)
/* 01C27C 8001F27C CB610060 */  lfd       f27, 0x60(r1)
/* 01C280 8001F280 EFBD2028 */  fsubs     f29, f29, f4
/* 01C284 8001F284 91810074 */  stw       r12, 0x74(r1)
/* 01C288 8001F288 ECCD01B2 */  fmuls     f6, f13, f6
/* 01C28C 8001F28C EDBB2028 */  fsubs     f13, f27, f4
/* 01C290 8001F290 90010078 */  stw       r0, 0x78(r1)
/* 01C294 8001F294 EF7DE028 */  fsubs     f27, f29, f28
/* 01C298 8001F298 90010070 */  stw       r0, 0x70(r1)
/* 01C29C 8001F29C EDADE028 */  fsubs     f13, f13, f28
/* 01C2A0 8001F2A0 CBA10078 */  lfd       f29, 0x78(r1)
/* 01C2A4 8001F2A4 CB810070 */  lfd       f28, 0x70(r1)
/* 01C2A8 8001F2A8 EFBD2028 */  fsubs     f29, f29, f4
/* 01C2AC 8001F2AC EF9C2028 */  fsubs     f28, f28, f4
/* 01C2B0 8001F2B0 ECDB337A */  fmadds    f6, f27, f13, f6
/* 01C2B4 8001F2B4 EF7DF028 */  fsubs     f27, f29, f30
/* 01C2B8 8001F2B8 EDBCF028 */  fsubs     f13, f28, f30
/* 01C2BC 8001F2BC ECDB337A */  fmadds    f6, f27, f13, f6
/* 01C2C0 8001F2C0 FC062840 */  fcmpo     cr0, f6, f5
/* 01C2C4 8001F2C4 4081004C */  ble       lbl_8001F310
/* 01C2C8 8001F2C8 FF603034 */  frsqrte   f27, f6
/* 01C2CC 8001F2CC FDBB06F2 */  fmul      f13, f27, f27
/* 01C2D0 8001F2D0 FF6306F2 */  fmul      f27, f3, f27
/* 01C2D4 8001F2D4 FDA6137C */  fnmsub    f13, f6, f13, f2
/* 01C2D8 8001F2D8 FF7B0372 */  fmul      f27, f27, f13
/* 01C2DC 8001F2DC FDBB06F2 */  fmul      f13, f27, f27
/* 01C2E0 8001F2E0 FF6306F2 */  fmul      f27, f3, f27
/* 01C2E4 8001F2E4 FDA6137C */  fnmsub    f13, f6, f13, f2
/* 01C2E8 8001F2E8 FF7B0372 */  fmul      f27, f27, f13
/* 01C2EC 8001F2EC FDBB06F2 */  fmul      f13, f27, f27
/* 01C2F0 8001F2F0 FF6306F2 */  fmul      f27, f3, f27
/* 01C2F4 8001F2F4 FDA6137C */  fnmsub    f13, f6, f13, f2
/* 01C2F8 8001F2F8 FF7B0372 */  fmul      f27, f27, f13
/* 01C2FC 8001F2FC FCC606F2 */  fmul      f6, f6, f27
/* 01C300 8001F300 FCC03018 */  frsp      f6, f6
/* 01C304 8001F304 D0C10024 */  stfs      f6, 0x24(r1)
/* 01C308 8001F308 C0C10024 */  lfs       f6, 0x24(r1)
/* 01C30C 8001F30C 48000004 */  b         lbl_8001F310
lbl_8001F310:
/* 01C310 8001F310 A9590034 */  lha       r10, 0x34(r25)
/* 01C314 8001F314 C1A10034 */  lfs       f13, 0x34(r1)
/* 01C318 8001F318 6D4A8000 */  xoris     r10, r10, 0x8000
/* 01C31C 8001F31C 91410054 */  stw       r10, 0x54(r1)
/* 01C320 8001F320 90010050 */  stw       r0, 0x50(r1)
/* 01C324 8001F324 CB610050 */  lfd       f27, 0x50(r1)
/* 01C328 8001F328 EF7B2028 */  fsubs     f27, f27, f4
/* 01C32C 8001F32C EDBB6828 */  fsubs     f13, f27, f13
/* 01C330 8001F330 EDAD3024 */  fdivs     f13, f13, f6
/* 01C334 8001F334 D1B9001C */  stfs      f13, 0x1c(r25)
/* 01C338 8001F338 A9590036 */  lha       r10, 0x36(r25)
/* 01C33C 8001F33C C1A10038 */  lfs       f13, 0x38(r1)
/* 01C340 8001F340 6D4A8000 */  xoris     r10, r10, 0x8000
/* 01C344 8001F344 9141005C */  stw       r10, 0x5c(r1)
/* 01C348 8001F348 90010058 */  stw       r0, 0x58(r1)
/* 01C34C 8001F34C CB610058 */  lfd       f27, 0x58(r1)
/* 01C350 8001F350 EF7B2028 */  fsubs     f27, f27, f4
/* 01C354 8001F354 EDBB6828 */  fsubs     f13, f27, f13
/* 01C358 8001F358 EDAD3024 */  fdivs     f13, f13, f6
/* 01C35C 8001F35C D1B90020 */  stfs      f13, 0x20(r25)
/* 01C360 8001F360 A9590038 */  lha       r10, 0x38(r25)
/* 01C364 8001F364 C1A1003C */  lfs       f13, 0x3c(r1)
/* 01C368 8001F368 6D4A8000 */  xoris     r10, r10, 0x8000
/* 01C36C 8001F36C 91410064 */  stw       r10, 0x64(r1)
/* 01C370 8001F370 90010060 */  stw       r0, 0x60(r1)
/* 01C374 8001F374 CB610060 */  lfd       f27, 0x60(r1)
/* 01C378 8001F378 EF7B2028 */  fsubs     f27, f27, f4
/* 01C37C 8001F37C EDBB6828 */  fsubs     f13, f27, f13
/* 01C380 8001F380 EDAD3024 */  fdivs     f13, f13, f6
/* 01C384 8001F384 D1B90024 */  stfs      f13, 0x24(r25)
/* 01C388 8001F388 C3D90020 */  lfs       f30, 0x20(r25)
/* 01C38C 8001F38C C3A10044 */  lfs       f29, 0x44(r1)
/* 01C390 8001F390 C1B90030 */  lfs       f13, 0x30(r25)
/* 01C394 8001F394 EFFE0772 */  fmuls     f31, f30, f29
/* 01C398 8001F398 C379001C */  lfs       f27, 0x1c(r25)
/* 01C39C 8001F39C C3810040 */  lfs       f28, 0x40(r1)
/* 01C3A0 8001F3A0 EFCD01B2 */  fmuls     f30, f13, f6
/* 01C3A4 8001F3A4 C3B9002C */  lfs       f29, 0x2c(r25)
/* 01C3A8 8001F3A8 C1B90028 */  lfs       f13, 0x28(r25)
/* 01C3AC 8001F3AC EFFBFF3A */  fmadds    f31, f27, f28, f31
/* 01C3B0 8001F3B0 C3990024 */  lfs       f28, 0x24(r25)
/* 01C3B4 8001F3B4 EDBD69BA */  fmadds    f13, f29, f6, f13
/* 01C3B8 8001F3B8 C3610048 */  lfs       f27, 0x48(r1)
/* 01C3BC 8001F3BC EFBCFEFA */  fmadds    f29, f28, f27, f31
/* 01C3C0 8001F3C0 ECC66FBA */  fmadds    f6, f6, f30, f13
/* 01C3C4 8001F3C4 EF7D3024 */  fdivs     f27, f29, f6
/* 01C3C8 8001F3C8 FC1B0040 */  fcmpo     cr0, f27, f0
/* 01C3CC 8001F3CC 40810030 */  ble       lbl_8001F3FC
/* 01C3D0 8001F3D0 FF600090 */  fmr       f27, f0
/* 01C3D4 8001F3D4 48000028 */  b         lbl_8001F3FC
lbl_8001F3D8:
/* 01C3D8 8001F3D8 C1B90020 */  lfs       f13, 0x20(r25)
/* 01C3DC 8001F3DC C0C10044 */  lfs       f6, 0x44(r1)
/* 01C3E0 8001F3E0 C3D9001C */  lfs       f30, 0x1c(r25)
/* 01C3E4 8001F3E4 ECCD01B2 */  fmuls     f6, f13, f6
/* 01C3E8 8001F3E8 C1A10040 */  lfs       f13, 0x40(r1)
/* 01C3EC 8001F3EC C3B90024 */  lfs       f29, 0x24(r25)
/* 01C3F0 8001F3F0 C3E10048 */  lfs       f31, 0x48(r1)
/* 01C3F4 8001F3F4 ECDE337A */  fmadds    f6, f30, f13, f6
/* 01C3F8 8001F3F8 EF7D37FA */  fmadds    f27, f29, f31, f6
lbl_8001F3FC:
/* 01C3FC 8001F3FC FC1B2840 */  fcmpo     cr0, f27, f5
/* 01C400 8001F400 4081001C */  ble       lbl_8001F41C
/* 01C404 8001F404 C3D90010 */  lfs       f30, 0x10(r25)
/* 01C408 8001F408 C1B90014 */  lfs       f13, 0x14(r25)
/* 01C40C 8001F40C C0D90018 */  lfs       f6, 0x18(r25)
/* 01C410 8001F410 ECFE3EFA */  fmadds    f7, f30, f27, f7
/* 01C414 8001F414 ED0D46FA */  fmadds    f8, f13, f27, f8
/* 01C418 8001F418 ED264EFA */  fmadds    f9, f6, f27, f9
lbl_8001F41C:
/* 01C41C 8001F41C 3BBDFFFF */  subi      r29, r29, 0x1
/* 01C420 8001F420 2C1D0000 */  cmpwi     r29, 0x0
/* 01C424 8001F424 4080FDD4 */  bge       lbl_8001F1F8
/* 01C428 8001F428 F0E5A000 */  psq_st    f7, 0x0(r5), 1, qr2
/* 01C42C 8001F42C 89410020 */  lbz       r10, 0x20(r1)
/* 01C430 8001F430 99480018 */  stb       r10, 0x18(r8)
/* 01C434 8001F434 F106A000 */  psq_st    f8, 0x0(r6), 1, qr2
/* 01C438 8001F438 8941001C */  lbz       r10, 0x1c(r1)
/* 01C43C 8001F43C 99480019 */  stb       r10, 0x19(r8)
/* 01C440 8001F440 F127A000 */  psq_st    f9, 0x0(r7), 1, qr2
/* 01C444 8001F444 89410018 */  lbz       r10, 0x18(r1)
/* 01C448 8001F448 2C1B0000 */  cmpwi     r27, 0x0
/* 01C44C 8001F44C 9948001A */  stb       r10, 0x1a(r8)
/* 01C450 8001F450 8958000F */  lbz       r10, 0xf(r24)
/* 01C454 8001F454 9948001B */  stb       r10, 0x1b(r8)
/* 01C458 8001F458 41820154 */  beq       lbl_8001F5AC
/* 01C45C 8001F45C C1210044 */  lfs       f9, 0x44(r1)
/* 01C460 8001F460 2C090000 */  cmpwi     r9, 0x0
/* 01C464 8001F464 C0FE0328 */  lfs       f7, 0x328(r30)
/* 01C468 8001F468 C0DE0334 */  lfs       f6, 0x334(r30)
/* 01C46C 8001F46C ED0901F2 */  fmuls     f8, f9, f7
/* 01C470 8001F470 C3C10040 */  lfs       f30, 0x40(r1)
/* 01C474 8001F474 C1BE0324 */  lfs       f13, 0x324(r30)
/* 01C478 8001F478 ECC901B2 */  fmuls     f6, f9, f6
/* 01C47C 8001F47C C0FE0330 */  lfs       f7, 0x330(r30)
/* 01C480 8001F480 ED1E437A */  fmadds    f8, f30, f13, f8
/* 01C484 8001F484 C1A10048 */  lfs       f13, 0x48(r1)
/* 01C488 8001F488 C13E032C */  lfs       f9, 0x32c(r30)
/* 01C48C 8001F48C ECDE31FA */  fmadds    f6, f30, f7, f6
/* 01C490 8001F490 C0FE0338 */  lfs       f7, 0x338(r30)
/* 01C494 8001F494 ED0D427A */  fmadds    f8, f13, f9, f8
/* 01C498 8001F498 ED2D31FA */  fmadds    f9, f13, f7, f6
/* 01C49C 8001F49C 41820028 */  beq       lbl_8001F4C4
/* 01C4A0 8001F4A0 ECE80232 */  fmuls     f7, f8, f8
/* 01C4A4 8001F4A4 ECC90272 */  fmuls     f6, f9, f9
/* 01C4A8 8001F4A8 ECE801F2 */  fmuls     f7, f8, f7
/* 01C4AC 8001F4AC ECC901B2 */  fmuls     f6, f9, f6
/* 01C4B0 8001F4B0 ECEC39FA */  fmadds    f7, f12, f7, f7
/* 01C4B4 8001F4B4 ECCC31BA */  fmadds    f6, f12, f6, f6
/* 01C4B8 8001F4B8 ED0B3A3A */  fmadds    f8, f11, f8, f7
/* 01C4BC 8001F4BC ED2B327A */  fmadds    f9, f11, f9, f6
/* 01C4C0 8001F4C0 4800000C */  b         lbl_8001F4CC
lbl_8001F4C4:
/* 01C4C4 8001F4C4 ED0802B2 */  fmuls     f8, f8, f10
/* 01C4C8 8001F4C8 ED2902B2 */  fmuls     f9, f9, f10
lbl_8001F4CC:
/* 01C4CC 8001F4CC ECEA402A */  fadds     f7, f10, f8
/* 01C4D0 8001F4D0 ECCA482A */  fadds     f6, f10, f9
/* 01C4D4 8001F4D4 D0E80004 */  stfs      f7, 0x4(r8)
/* 01C4D8 8001F4D8 D0C80008 */  stfs      f6, 0x8(r8)
/* 01C4DC 8001F4DC 480000D0 */  b         lbl_8001F5AC
lbl_8001F4E0:
/* 01C4E0 8001F4E0 8198000C */  lwz       r12, 0xc(r24)
/* 01C4E4 8001F4E4 2C1B0000 */  cmpwi     r27, 0x0
/* 01C4E8 8001F4E8 558B463E */  srwi      r11, r12, 24
/* 01C4EC 8001F4EC 558A843E */  srwi      r10, r12, 16
/* 01C4F0 8001F4F0 99680018 */  stb       r11, 0x18(r8)
/* 01C4F4 8001F4F4 554B063E */  clrlwi    r11, r10, 24
/* 01C4F8 8001F4F8 558AC23E */  srwi      r10, r12, 8
/* 01C4FC 8001F4FC 99680019 */  stb       r11, 0x19(r8)
/* 01C500 8001F500 554A063E */  clrlwi    r10, r10, 24
/* 01C504 8001F504 9948001A */  stb       r10, 0x1a(r8)
/* 01C508 8001F508 558A063E */  clrlwi    r10, r12, 24
/* 01C50C 8001F50C 9948001B */  stb       r10, 0x1b(r8)
/* 01C510 8001F510 4182009C */  beq       lbl_8001F5AC
/* 01C514 8001F514 3958000C */  addi      r10, r24, 0xc
/* 01C518 8001F518 E02A6000 */  psq_l     f1, 0x0(r10), 0, qr6
/* 01C51C 8001F51C F0240000 */  psq_st    f1, 0x0(r4), 0, qr0
/* 01C520 8001F520 3958000E */  addi      r10, r24, 0xe
/* 01C524 8001F524 E02AE000 */  psq_l     f1, 0x0(r10), 1, qr6
/* 01C528 8001F528 D0210048 */  stfs      f1, 0x48(r1)
/* 01C52C 8001F52C 2C090000 */  cmpwi     r9, 0x0
/* 01C530 8001F530 C1210044 */  lfs       f9, 0x44(r1)
/* 01C534 8001F534 C0FE0328 */  lfs       f7, 0x328(r30)
/* 01C538 8001F538 C0DE0334 */  lfs       f6, 0x334(r30)
/* 01C53C 8001F53C ED0901F2 */  fmuls     f8, f9, f7
/* 01C540 8001F540 C3C10040 */  lfs       f30, 0x40(r1)
/* 01C544 8001F544 C1BE0324 */  lfs       f13, 0x324(r30)
/* 01C548 8001F548 ECC901B2 */  fmuls     f6, f9, f6
/* 01C54C 8001F54C C0FE0330 */  lfs       f7, 0x330(r30)
/* 01C550 8001F550 ED1E437A */  fmadds    f8, f30, f13, f8
/* 01C554 8001F554 C1A10048 */  lfs       f13, 0x48(r1)
/* 01C558 8001F558 C13E032C */  lfs       f9, 0x32c(r30)
/* 01C55C 8001F55C ECDE31FA */  fmadds    f6, f30, f7, f6
/* 01C560 8001F560 C0FE0338 */  lfs       f7, 0x338(r30)
/* 01C564 8001F564 ED0D427A */  fmadds    f8, f13, f9, f8
/* 01C568 8001F568 ED2D31FA */  fmadds    f9, f13, f7, f6
/* 01C56C 8001F56C 41820028 */  beq       lbl_8001F594
/* 01C570 8001F570 ECE80232 */  fmuls     f7, f8, f8
/* 01C574 8001F574 ECC90272 */  fmuls     f6, f9, f9
/* 01C578 8001F578 ECE801F2 */  fmuls     f7, f8, f7
/* 01C57C 8001F57C ECC901B2 */  fmuls     f6, f9, f6
/* 01C580 8001F580 ECEC39FA */  fmadds    f7, f12, f7, f7
/* 01C584 8001F584 ECCC31BA */  fmadds    f6, f12, f6, f6
/* 01C588 8001F588 ED0B3A3A */  fmadds    f8, f11, f8, f7
/* 01C58C 8001F58C ED2B327A */  fmadds    f9, f11, f9, f6
/* 01C590 8001F590 4800000C */  b         lbl_8001F59C
lbl_8001F594:
/* 01C594 8001F594 ED0802B2 */  fmuls     f8, f8, f10
/* 01C598 8001F598 ED2902B2 */  fmuls     f9, f9, f10
lbl_8001F59C:
/* 01C59C 8001F59C ECEA402A */  fadds     f7, f10, f8
/* 01C5A0 8001F5A0 ECCA482A */  fadds     f6, f10, f9
/* 01C5A4 8001F5A4 D0E80004 */  stfs      f7, 0x4(r8)
/* 01C5A8 8001F5A8 D0C80008 */  stfs      f6, 0x8(r8)
lbl_8001F5AC:
/* 01C5AC 8001F5AC 2C1B0000 */  cmpwi     r27, 0x0
/* 01C5B0 8001F5B0 40820014 */  bne       lbl_8001F5C4
/* 01C5B4 8001F5B4 39680004 */  addi      r11, r8, 0x4
/* 01C5B8 8001F5B8 39570008 */  addi      r10, r23, 0x8
/* 01C5BC 8001F5BC E02A7000 */  psq_l     f1, 0x0(r10), 0, qr7
/* 01C5C0 8001F5C0 F02B0000 */  psq_st    f1, 0x0(r11), 0, qr0
lbl_8001F5C4:
/* 01C5C4 8001F5C4 3908001C */  addi      r8, r8, 0x1c
/* 01C5C8 8001F5C8 3B180010 */  addi      r24, r24, 0x10
/* 01C5CC 8001F5CC 3AF70010 */  addi      r23, r23, 0x10
/* 01C5D0 8001F5D0 4200FAB0 */  bdnz      lbl_8001F080
lbl_8001F5D4:
/* 01C5D4 8001F5D4 38600001 */  li        r3, 0x1
lbl_8001F5D8:
/* 01C5D8 8001F5D8 BA210084 */  lmw       r17, 0x84(r1)
/* 01C5DC 8001F5DC 800100EC */  lwz       r0, 0xec(r1)
/* 01C5E0 8001F5E0 CBE100E0 */  lfd       f31, 0xe0(r1)
/* 01C5E4 8001F5E4 CBC100D8 */  lfd       f30, 0xd8(r1)
/* 01C5E8 8001F5E8 7C0803A6 */  mtlr      r0
/* 01C5EC 8001F5EC CBA100D0 */  lfd       f29, 0xd0(r1)
/* 01C5F0 8001F5F0 CB8100C8 */  lfd       f28, 0xc8(r1)
/* 01C5F4 8001F5F4 CB6100C0 */  lfd       f27, 0xc0(r1)
/* 01C5F8 8001F5F8 382100E8 */  addi      r1, r1, 0xe8
/* 01C5FC 8001F5FC 4E800020 */  blr

glabel frameGetMatrix
/* 01C600 8001F600 7C0802A6 */  mflr      r0
/* 01C604 8001F604 90010004 */  stw       r0, 0x4(r1)
/* 01C608 8001F608 9421FFE0 */  stwu      r1, -0x20(r1)
/* 01C60C 8001F60C 93E1001C */  stw       r31, 0x1c(r1)
/* 01C610 8001F610 93C10018 */  stw       r30, 0x18(r1)
/* 01C614 8001F614 7C7E1B78 */  mr        r30, r3
/* 01C618 8001F618 7C872378 */  mr        r7, r4
/* 01C61C 8001F61C 7CDF3378 */  mr        r31, r6
/* 01C620 8001F620 2C050001 */  cmpwi     r5, 0x1
/* 01C624 8001F624 41820080 */  beq       lbl_8001F6A4
/* 01C628 8001F628 408000D4 */  bge       lbl_8001F6FC
/* 01C62C 8001F62C 2C050000 */  cmpwi     r5, 0x0
/* 01C630 8001F630 40800008 */  bge       lbl_8001F638
/* 01C634 8001F634 480000C8 */  b         lbl_8001F6FC
lbl_8001F638:
/* 01C638 8001F638 28070000 */  cmplwi    r7, 0x0
/* 01C63C 8001F63C 41820038 */  beq       lbl_8001F674
/* 01C640 8001F640 3C7E0004 */  addis     r3, r30, 0x4
/* 01C644 8001F644 8003C4CC */  lwz       r0, -0x3b34(r3)
/* 01C648 8001F648 7CE33B78 */  mr        r3, r7
/* 01C64C 8001F64C 38A00040 */  li        r5, 0x40
/* 01C650 8001F650 54043032 */  slwi      r4, r0, 6
/* 01C654 8001F654 3C840004 */  addis     r4, r4, 0x4
/* 01C658 8001F658 3884C520 */  subi      r4, r4, 0x3ae0
/* 01C65C 8001F65C 7C9E2214 */  add       r4, r30, r4
/* 01C660 8001F660 4BFE73F1 */  bl        xlHeapCopy
/* 01C664 8001F664 2C030000 */  cmpwi     r3, 0x0
/* 01C668 8001F668 4082000C */  bne       lbl_8001F674
/* 01C66C 8001F66C 38600000 */  li        r3, 0x0
/* 01C670 8001F670 48000098 */  b         lbl_8001F708
lbl_8001F674:
/* 01C674 8001F674 2C1F0000 */  cmpwi     r31, 0x0
/* 01C678 8001F678 4182008C */  beq       lbl_8001F704
/* 01C67C 8001F67C 3C9E0004 */  addis     r4, r30, 0x4
/* 01C680 8001F680 8064C4CC */  lwz       r3, -0x3b34(r4)
/* 01C684 8001F684 2C030000 */  cmpwi     r3, 0x0
/* 01C688 8001F688 4081007C */  ble       lbl_8001F704
/* 01C68C 8001F68C 3803FFFF */  subi      r0, r3, 0x1
/* 01C690 8001F690 9004C4CC */  stw       r0, -0x3b34(r4)
/* 01C694 8001F694 801E008C */  lwz       r0, 0x8c(r30)
/* 01C698 8001F698 540002D0 */  rlwinm    r0, r0, 0, 11, 8
/* 01C69C 8001F69C 901E008C */  stw       r0, 0x8c(r30)
/* 01C6A0 8001F6A0 48000064 */  b         lbl_8001F704
lbl_8001F6A4:
/* 01C6A4 8001F6A4 28070000 */  cmplwi    r7, 0x0
/* 01C6A8 8001F6A8 4182005C */  beq       lbl_8001F704
/* 01C6AC 8001F6AC 801E008C */  lwz       r0, 0x8c(r30)
/* 01C6B0 8001F6B0 54000108 */  rlwinm    r0, r0, 0, 4, 4
/* 01C6B4 8001F6B4 28000000 */  cmplwi    r0, 0x0
/* 01C6B8 8001F6B8 41820020 */  beq       lbl_8001F6D8
/* 01C6BC 8001F6BC 3C7E0004 */  addis     r3, r30, 0x4
/* 01C6C0 8001F6C0 3C9E0004 */  addis     r4, r30, 0x4
/* 01C6C4 8001F6C4 7CE53B78 */  mr        r5, r7
/* 01C6C8 8001F6C8 3863C7E0 */  subi      r3, r3, 0x3820
/* 01C6CC 8001F6CC 3884C7A0 */  subi      r4, r4, 0x3860
/* 01C6D0 8001F6D0 48087591 */  bl        fn_800A6C60
/* 01C6D4 8001F6D4 48000030 */  b         lbl_8001F704
lbl_8001F6D8:
/* 01C6D8 8001F6D8 3C9E0004 */  addis     r4, r30, 0x4
/* 01C6DC 8001F6DC 7CE33B78 */  mr        r3, r7
/* 01C6E0 8001F6E0 3884C7A0 */  subi      r4, r4, 0x3860
/* 01C6E4 8001F6E4 38A00040 */  li        r5, 0x40
/* 01C6E8 8001F6E8 4BFE7369 */  bl        xlHeapCopy
/* 01C6EC 8001F6EC 2C030000 */  cmpwi     r3, 0x0
/* 01C6F0 8001F6F0 40820014 */  bne       lbl_8001F704
/* 01C6F4 8001F6F4 38600000 */  li        r3, 0x0
/* 01C6F8 8001F6F8 48000010 */  b         lbl_8001F708
lbl_8001F6FC:
/* 01C6FC 8001F6FC 38600000 */  li        r3, 0x0
/* 01C700 8001F700 48000008 */  b         lbl_8001F708
lbl_8001F704:
/* 01C704 8001F704 38600001 */  li        r3, 0x1
lbl_8001F708:
/* 01C708 8001F708 80010024 */  lwz       r0, 0x24(r1)
/* 01C70C 8001F70C 83E1001C */  lwz       r31, 0x1c(r1)
/* 01C710 8001F710 83C10018 */  lwz       r30, 0x18(r1)
/* 01C714 8001F714 7C0803A6 */  mtlr      r0
/* 01C718 8001F718 38210020 */  addi      r1, r1, 0x20
/* 01C71C 8001F71C 4E800020 */  blr

glabel frameSetMatrix
/* 01C720 8001F720 7C0802A6 */  mflr      r0
/* 01C724 8001F724 90010004 */  stw       r0, 0x4(r1)
/* 01C728 8001F728 9421FF48 */  stwu      r1, -0xb8(r1)
/* 01C72C 8001F72C BF4100A0 */  stmw      r26, 0xa0(r1)
/* 01C730 8001F730 7C7D1B78 */  mr        r29, r3
/* 01C734 8001F734 7C9E2378 */  mr        r30, r4
/* 01C738 8001F738 7CBA2B78 */  mr        r26, r5
/* 01C73C 8001F73C 7CDC3378 */  mr        r28, r6
/* 01C740 8001F740 7CFB3B78 */  mr        r27, r7
/* 01C744 8001F744 7D1F4378 */  mr        r31, r8
/* 01C748 8001F748 48081DB1 */  bl        OSGetTick
/* 01C74C 8001F74C 2C1A0001 */  cmpwi     r26, 0x1
/* 01C750 8001F750 418201D4 */  beq       lbl_8001F924
/* 01C754 8001F754 40800638 */  bge       lbl_8001FD8C
/* 01C758 8001F758 2C1A0000 */  cmpwi     r26, 0x0
/* 01C75C 8001F75C 40800008 */  bge       lbl_8001F764
/* 01C760 8001F760 4800062C */  b         lbl_8001FD8C
lbl_8001F764:
/* 01C764 8001F764 2C1C0000 */  cmpwi     r28, 0x0
/* 01C768 8001F768 40820040 */  bne       lbl_8001F7A8
/* 01C76C 8001F76C 801D008C */  lwz       r0, 0x8c(r29)
/* 01C770 8001F770 54000210 */  rlwinm    r0, r0, 0, 8, 8
/* 01C774 8001F774 28000000 */  cmplwi    r0, 0x0
/* 01C778 8001F778 41820030 */  beq       lbl_8001F7A8
/* 01C77C 8001F77C 3C7D0004 */  addis     r3, r29, 0x4
/* 01C780 8001F780 8003C4CC */  lwz       r0, -0x3b34(r3)
/* 01C784 8001F784 7FC3F378 */  mr        r3, r30
/* 01C788 8001F788 38A10048 */  addi      r5, r1, 0x48
/* 01C78C 8001F78C 54043032 */  slwi      r4, r0, 6
/* 01C790 8001F790 3C840004 */  addis     r4, r4, 0x4
/* 01C794 8001F794 3884C520 */  subi      r4, r4, 0x3ae0
/* 01C798 8001F798 7C9D2214 */  add       r4, r29, r4
/* 01C79C 8001F79C 3B800001 */  li        r28, 0x1
/* 01C7A0 8001F7A0 480874C1 */  bl        fn_800A6C60
/* 01C7A4 8001F7A4 48000008 */  b         lbl_8001F7AC
lbl_8001F7A8:
/* 01C7A8 8001F7A8 3B800000 */  li        r28, 0x0
lbl_8001F7AC:
/* 01C7AC 8001F7AC 2C1B0000 */  cmpwi     r27, 0x0
/* 01C7B0 8001F7B0 4182001C */  beq       lbl_8001F7CC
/* 01C7B4 8001F7B4 3C9D0004 */  addis     r4, r29, 0x4
/* 01C7B8 8001F7B8 8064C4CC */  lwz       r3, -0x3b34(r4)
/* 01C7BC 8001F7BC 2C030009 */  cmpwi     r3, 0x9
/* 01C7C0 8001F7C0 4080000C */  bge       lbl_8001F7CC
/* 01C7C4 8001F7C4 38030001 */  addi      r0, r3, 0x1
/* 01C7C8 8001F7C8 9004C4CC */  stw       r0, -0x3b34(r4)
lbl_8001F7CC:
/* 01C7CC 8001F7CC 2C1C0000 */  cmpwi     r28, 0x0
/* 01C7D0 8001F7D0 418200A0 */  beq       lbl_8001F870
/* 01C7D4 8001F7D4 3C7D0004 */  addis     r3, r29, 0x4
/* 01C7D8 8001F7D8 C0010048 */  lfs       f0, 0x48(r1)
/* 01C7DC 8001F7DC 8003C4CC */  lwz       r0, -0x3b34(r3)
/* 01C7E0 8001F7E0 54033032 */  slwi      r3, r0, 6
/* 01C7E4 8001F7E4 3C630004 */  addis     r3, r3, 0x4
/* 01C7E8 8001F7E8 3863C520 */  subi      r3, r3, 0x3ae0
/* 01C7EC 8001F7EC 7C7D1A14 */  add       r3, r29, r3
/* 01C7F0 8001F7F0 D0030000 */  stfs      f0, 0x0(r3)
/* 01C7F4 8001F7F4 C001004C */  lfs       f0, 0x4c(r1)
/* 01C7F8 8001F7F8 D0030004 */  stfs      f0, 0x4(r3)
/* 01C7FC 8001F7FC C0010050 */  lfs       f0, 0x50(r1)
/* 01C800 8001F800 D0030008 */  stfs      f0, 0x8(r3)
/* 01C804 8001F804 C0010054 */  lfs       f0, 0x54(r1)
/* 01C808 8001F808 D003000C */  stfs      f0, 0xc(r3)
/* 01C80C 8001F80C C0010058 */  lfs       f0, 0x58(r1)
/* 01C810 8001F810 D0030010 */  stfs      f0, 0x10(r3)
/* 01C814 8001F814 C001005C */  lfs       f0, 0x5c(r1)
/* 01C818 8001F818 D0030014 */  stfs      f0, 0x14(r3)
/* 01C81C 8001F81C C0010060 */  lfs       f0, 0x60(r1)
/* 01C820 8001F820 D0030018 */  stfs      f0, 0x18(r3)
/* 01C824 8001F824 C0010064 */  lfs       f0, 0x64(r1)
/* 01C828 8001F828 D003001C */  stfs      f0, 0x1c(r3)
/* 01C82C 8001F82C C0010068 */  lfs       f0, 0x68(r1)
/* 01C830 8001F830 D0030020 */  stfs      f0, 0x20(r3)
/* 01C834 8001F834 C001006C */  lfs       f0, 0x6c(r1)
/* 01C838 8001F838 D0030024 */  stfs      f0, 0x24(r3)
/* 01C83C 8001F83C C0010070 */  lfs       f0, 0x70(r1)
/* 01C840 8001F840 D0030028 */  stfs      f0, 0x28(r3)
/* 01C844 8001F844 C0010074 */  lfs       f0, 0x74(r1)
/* 01C848 8001F848 D003002C */  stfs      f0, 0x2c(r3)
/* 01C84C 8001F84C C0010078 */  lfs       f0, 0x78(r1)
/* 01C850 8001F850 D0030030 */  stfs      f0, 0x30(r3)
/* 01C854 8001F854 C001007C */  lfs       f0, 0x7c(r1)
/* 01C858 8001F858 D0030034 */  stfs      f0, 0x34(r3)
/* 01C85C 8001F85C C0010080 */  lfs       f0, 0x80(r1)
/* 01C860 8001F860 D0030038 */  stfs      f0, 0x38(r3)
/* 01C864 8001F864 C0010084 */  lfs       f0, 0x84(r1)
/* 01C868 8001F868 D003003C */  stfs      f0, 0x3c(r3)
/* 01C86C 8001F86C 4800009C */  b         lbl_8001F908
lbl_8001F870:
/* 01C870 8001F870 3C7D0004 */  addis     r3, r29, 0x4
/* 01C874 8001F874 C01E0000 */  lfs       f0, 0x0(r30)
/* 01C878 8001F878 8003C4CC */  lwz       r0, -0x3b34(r3)
/* 01C87C 8001F87C 54033032 */  slwi      r3, r0, 6
/* 01C880 8001F880 3C630004 */  addis     r3, r3, 0x4
/* 01C884 8001F884 3863C520 */  subi      r3, r3, 0x3ae0
/* 01C888 8001F888 7C7D1A14 */  add       r3, r29, r3
/* 01C88C 8001F88C D0030000 */  stfs      f0, 0x0(r3)
/* 01C890 8001F890 C01E0004 */  lfs       f0, 0x4(r30)
/* 01C894 8001F894 D0030004 */  stfs      f0, 0x4(r3)
/* 01C898 8001F898 C01E0008 */  lfs       f0, 0x8(r30)
/* 01C89C 8001F89C D0030008 */  stfs      f0, 0x8(r3)
/* 01C8A0 8001F8A0 C01E000C */  lfs       f0, 0xc(r30)
/* 01C8A4 8001F8A4 D003000C */  stfs      f0, 0xc(r3)
/* 01C8A8 8001F8A8 C01E0010 */  lfs       f0, 0x10(r30)
/* 01C8AC 8001F8AC D0030010 */  stfs      f0, 0x10(r3)
/* 01C8B0 8001F8B0 C01E0014 */  lfs       f0, 0x14(r30)
/* 01C8B4 8001F8B4 D0030014 */  stfs      f0, 0x14(r3)
/* 01C8B8 8001F8B8 C01E0018 */  lfs       f0, 0x18(r30)
/* 01C8BC 8001F8BC D0030018 */  stfs      f0, 0x18(r3)
/* 01C8C0 8001F8C0 C01E001C */  lfs       f0, 0x1c(r30)
/* 01C8C4 8001F8C4 D003001C */  stfs      f0, 0x1c(r3)
/* 01C8C8 8001F8C8 C01E0020 */  lfs       f0, 0x20(r30)
/* 01C8CC 8001F8CC D0030020 */  stfs      f0, 0x20(r3)
/* 01C8D0 8001F8D0 C01E0024 */  lfs       f0, 0x24(r30)
/* 01C8D4 8001F8D4 D0030024 */  stfs      f0, 0x24(r3)
/* 01C8D8 8001F8D8 C01E0028 */  lfs       f0, 0x28(r30)
/* 01C8DC 8001F8DC D0030028 */  stfs      f0, 0x28(r3)
/* 01C8E0 8001F8E0 C01E002C */  lfs       f0, 0x2c(r30)
/* 01C8E4 8001F8E4 D003002C */  stfs      f0, 0x2c(r3)
/* 01C8E8 8001F8E8 C01E0030 */  lfs       f0, 0x30(r30)
/* 01C8EC 8001F8EC D0030030 */  stfs      f0, 0x30(r3)
/* 01C8F0 8001F8F0 C01E0034 */  lfs       f0, 0x34(r30)
/* 01C8F4 8001F8F4 D0030034 */  stfs      f0, 0x34(r3)
/* 01C8F8 8001F8F8 C01E0038 */  lfs       f0, 0x38(r30)
/* 01C8FC 8001F8FC D0030038 */  stfs      f0, 0x38(r3)
/* 01C900 8001F900 C01E003C */  lfs       f0, 0x3c(r30)
/* 01C904 8001F904 D003003C */  stfs      f0, 0x3c(r3)
lbl_8001F908:
/* 01C908 8001F908 801D008C */  lwz       r0, 0x8c(r29)
/* 01C90C 8001F90C 64000080 */  oris      r0, r0, 0x80
/* 01C910 8001F910 901D008C */  stw       r0, 0x8c(r29)
/* 01C914 8001F914 801D008C */  lwz       r0, 0x8c(r29)
/* 01C918 8001F918 540002D0 */  rlwinm    r0, r0, 0, 11, 8
/* 01C91C 8001F91C 901D008C */  stw       r0, 0x8c(r29)
/* 01C920 8001F920 48000474 */  b         lbl_8001FD94
lbl_8001F924:
/* 01C924 8001F924 801D008C */  lwz       r0, 0x8c(r29)
/* 01C928 8001F928 540000C2 */  rlwinm    r0, r0, 0, 3, 1
/* 01C92C 8001F92C 901D008C */  stw       r0, 0x8c(r29)
/* 01C930 8001F930 806D8914 */  lwz       r3, gpSystem@sda21(r0)
/* 01C934 8001F934 80030020 */  lwz       r0, 0x20(r3)
/* 01C938 8001F938 2C000006 */  cmpwi     r0, 0x6
/* 01C93C 8001F93C 4082010C */  bne       lbl_8001FA48
/* 01C940 8001F940 C03E0000 */  lfs       f1, 0x0(r30)
/* 01C944 8001F944 C0028158 */  lfs       f0, D_8018C098@sda21(r0)
/* 01C948 8001F948 FC010040 */  fcmpo     cr0, f1, f0
/* 01C94C 8001F94C 41800010 */  blt       lbl_8001F95C
/* 01C950 8001F950 C002815C */  lfs       f0, D_8018C09C@sda21(r0)
/* 01C954 8001F954 FC010040 */  fcmpo     cr0, f1, f0
/* 01C958 8001F958 408100F0 */  ble       lbl_8001FA48
lbl_8001F95C:
/* 01C95C 8001F95C 3C7D0004 */  addis     r3, r29, 0x4
/* 01C960 8001F960 801D008C */  lwz       r0, 0x8c(r29)
/* 01C964 8001F964 8083C518 */  lwz       r4, -0x3ae8(r3)
/* 01C968 8001F968 64002400 */  oris      r0, r0, 0x2400
/* 01C96C 8001F96C 901D008C */  stw       r0, 0x8c(r29)
/* 01C970 8001F970 1C840024 */  mulli     r4, r4, 0x24
/* 01C974 8001F974 801D008C */  lwz       r0, 0x8c(r29)
/* 01C978 8001F978 3F840004 */  addis     r28, r4, 0x4
/* 01C97C 8001F97C 54000144 */  rlwinm    r0, r0, 0, 5, 2
/* 01C980 8001F980 3B9CC820 */  subi      r28, r28, 0x37e0
/* 01C984 8001F984 901D008C */  stw       r0, 0x8c(r29)
/* 01C988 8001F988 7F9DE214 */  add       r28, r29, r28
/* 01C98C 8001F98C 801C0020 */  lwz       r0, 0x20(r28)
/* 01C990 8001F990 2C000000 */  cmpwi     r0, 0x0
/* 01C994 8001F994 40820020 */  bne       lbl_8001F9B4
/* 01C998 8001F998 C03C000C */  lfs       f1, 0xc(r28)
/* 01C99C 8001F99C 3863C7A0 */  subi      r3, r3, 0x3860
/* 01C9A0 8001F9A0 C05C0008 */  lfs       f2, 0x8(r28)
/* 01C9A4 8001F9A4 C07C0010 */  lfs       f3, 0x10(r28)
/* 01C9A8 8001F9A8 C09C0014 */  lfs       f4, 0x14(r28)
/* 01C9AC 8001F9AC 4808714D */  bl        fn_800A6AF8
/* 01C9B0 8001F9B0 48000074 */  b         lbl_8001FA24
lbl_8001F9B4:
/* 01C9B4 8001F9B4 2C000001 */  cmpwi     r0, 0x1
/* 01C9B8 8001F9B8 40820064 */  bne       lbl_8001FA1C
/* 01C9BC 8001F9BC 80A3C4C0 */  lwz       r5, -0x3b40(r3)
/* 01C9C0 8001F9C0 3C804330 */  lis       r4, 0x4330
/* 01C9C4 8001F9C4 8003C4B8 */  lwz       r0, -0x3b48(r3)
/* 01C9C8 8001F9C8 3863C7A0 */  subi      r3, r3, 0x3860
/* 01C9CC 8001F9CC 6CA58000 */  xoris     r5, r5, 0x8000
/* 01C9D0 8001F9D0 6C008000 */  xoris     r0, r0, 0x8000
/* 01C9D4 8001F9D4 90A1009C */  stw       r5, 0x9c(r1)
/* 01C9D8 8001F9D8 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 01C9DC 8001F9DC 90010094 */  stw       r0, 0x94(r1)
/* 01C9E0 8001F9E0 C8C28110 */  lfd       f6, D_8018C050@sda21(r0)
/* 01C9E4 8001F9E4 FC600890 */  fmr       f3, f1
/* 01C9E8 8001F9E8 90810098 */  stw       r4, 0x98(r1)
/* 01C9EC 8001F9EC C0828138 */  lfs       f4, D_8018C078@sda21(r0)
/* 01C9F0 8001F9F0 90810090 */  stw       r4, 0x90(r1)
/* 01C9F4 8001F9F4 C8410098 */  lfd       f2, 0x98(r1)
/* 01C9F8 8001F9F8 C8010090 */  lfd       f0, 0x90(r1)
/* 01C9FC 8001F9FC EC423028 */  fsubs     f2, f2, f6
/* 01CA00 8001FA00 C0BC0010 */  lfs       f5, 0x10(r28)
/* 01CA04 8001FA04 EC003028 */  fsubs     f0, f0, f6
/* 01CA08 8001FA08 C0DC0014 */  lfs       f6, 0x14(r28)
/* 01CA0C 8001FA0C EC422028 */  fsubs     f2, f2, f4
/* 01CA10 8001FA10 EC802028 */  fsubs     f4, f0, f4
/* 01CA14 8001FA14 480871B5 */  bl        C_MTXOrtho
/* 01CA18 8001FA18 4800000C */  b         lbl_8001FA24
lbl_8001FA1C:
/* 01CA1C 8001FA1C 38800000 */  li        r4, 0x0
/* 01CA20 8001FA20 48000014 */  b         lbl_8001FA34
lbl_8001FA24:
/* 01CA24 8001FA24 801C0020 */  lwz       r0, 0x20(r28)
/* 01CA28 8001FA28 3C7D0004 */  addis     r3, r29, 0x4
/* 01CA2C 8001FA2C 38800001 */  li        r4, 0x1
/* 01CA30 8001FA30 9003C51C */  stw       r0, -0x3ae4(r3)
lbl_8001FA34:
/* 01CA34 8001FA34 2C040000 */  cmpwi     r4, 0x0
/* 01CA38 8001FA38 4082000C */  bne       lbl_8001FA44
/* 01CA3C 8001FA3C 38600000 */  li        r3, 0x0
/* 01CA40 8001FA40 48000358 */  b         lbl_8001FD98
lbl_8001FA44:
/* 01CA44 8001FA44 3B800000 */  li        r28, 0x0
lbl_8001FA48:
/* 01CA48 8001FA48 2C1C0000 */  cmpwi     r28, 0x0
/* 01CA4C 8001FA4C 40820024 */  bne       lbl_8001FA70
/* 01CA50 8001FA50 801D008C */  lwz       r0, 0x8c(r29)
/* 01CA54 8001FA54 5400014A */  rlwinm    r0, r0, 0, 5, 5
/* 01CA58 8001FA58 28000000 */  cmplwi    r0, 0x0
/* 01CA5C 8001FA5C 41820014 */  beq       lbl_8001FA70
/* 01CA60 8001FA60 801D008C */  lwz       r0, 0x8c(r29)
/* 01CA64 8001FA64 540000C6 */  rlwinm    r0, r0, 0, 3, 3
/* 01CA68 8001FA68 28000000 */  cmplwi    r0, 0x0
/* 01CA6C 8001FA6C 41820214 */  beq       lbl_8001FC80
lbl_8001FA70:
/* 01CA70 8001FA70 C0428138 */  lfs       f2, D_8018C078@sda21(r0)
/* 01CA74 8001FA74 C01E0000 */  lfs       f0, 0x0(r30)
/* 01CA78 8001FA78 FC020000 */  fcmpu     cr0, f2, f0
/* 01CA7C 8001FA7C 408200CC */  bne       lbl_8001FB48
/* 01CA80 8001FA80 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 01CA84 8001FA84 C01E0004 */  lfs       f0, 0x4(r30)
/* 01CA88 8001FA88 FC010000 */  fcmpu     cr0, f1, f0
/* 01CA8C 8001FA8C 408200BC */  bne       lbl_8001FB48
/* 01CA90 8001FA90 C01E0008 */  lfs       f0, 0x8(r30)
/* 01CA94 8001FA94 FC010000 */  fcmpu     cr0, f1, f0
/* 01CA98 8001FA98 408200B0 */  bne       lbl_8001FB48
/* 01CA9C 8001FA9C C01E000C */  lfs       f0, 0xc(r30)
/* 01CAA0 8001FAA0 FC010000 */  fcmpu     cr0, f1, f0
/* 01CAA4 8001FAA4 408200A4 */  bne       lbl_8001FB48
/* 01CAA8 8001FAA8 C01E0010 */  lfs       f0, 0x10(r30)
/* 01CAAC 8001FAAC FC010000 */  fcmpu     cr0, f1, f0
/* 01CAB0 8001FAB0 40820098 */  bne       lbl_8001FB48
/* 01CAB4 8001FAB4 C01E0014 */  lfs       f0, 0x14(r30)
/* 01CAB8 8001FAB8 FC020000 */  fcmpu     cr0, f2, f0
/* 01CABC 8001FABC 4082008C */  bne       lbl_8001FB48
/* 01CAC0 8001FAC0 C01E0018 */  lfs       f0, 0x18(r30)
/* 01CAC4 8001FAC4 FC010000 */  fcmpu     cr0, f1, f0
/* 01CAC8 8001FAC8 40820080 */  bne       lbl_8001FB48
/* 01CACC 8001FACC C01E001C */  lfs       f0, 0x1c(r30)
/* 01CAD0 8001FAD0 FC010000 */  fcmpu     cr0, f1, f0
/* 01CAD4 8001FAD4 40820074 */  bne       lbl_8001FB48
/* 01CAD8 8001FAD8 C01E0020 */  lfs       f0, 0x20(r30)
/* 01CADC 8001FADC FC010000 */  fcmpu     cr0, f1, f0
/* 01CAE0 8001FAE0 40820068 */  bne       lbl_8001FB48
/* 01CAE4 8001FAE4 C01E0024 */  lfs       f0, 0x24(r30)
/* 01CAE8 8001FAE8 FC010000 */  fcmpu     cr0, f1, f0
/* 01CAEC 8001FAEC 4082005C */  bne       lbl_8001FB48
/* 01CAF0 8001FAF0 C01E0028 */  lfs       f0, 0x28(r30)
/* 01CAF4 8001FAF4 FC020000 */  fcmpu     cr0, f2, f0
/* 01CAF8 8001FAF8 40820050 */  bne       lbl_8001FB48
/* 01CAFC 8001FAFC C01E002C */  lfs       f0, 0x2c(r30)
/* 01CB00 8001FB00 FC010000 */  fcmpu     cr0, f1, f0
/* 01CB04 8001FB04 40820044 */  bne       lbl_8001FB48
/* 01CB08 8001FB08 C01E0030 */  lfs       f0, 0x30(r30)
/* 01CB0C 8001FB0C FC010000 */  fcmpu     cr0, f1, f0
/* 01CB10 8001FB10 40820038 */  bne       lbl_8001FB48
/* 01CB14 8001FB14 C01E0034 */  lfs       f0, 0x34(r30)
/* 01CB18 8001FB18 FC010000 */  fcmpu     cr0, f1, f0
/* 01CB1C 8001FB1C 4082002C */  bne       lbl_8001FB48
/* 01CB20 8001FB20 C01E0038 */  lfs       f0, 0x38(r30)
/* 01CB24 8001FB24 FC010000 */  fcmpu     cr0, f1, f0
/* 01CB28 8001FB28 40820020 */  bne       lbl_8001FB48
/* 01CB2C 8001FB2C C01E003C */  lfs       f0, 0x3c(r30)
/* 01CB30 8001FB30 FC020000 */  fcmpu     cr0, f2, f0
/* 01CB34 8001FB34 40820014 */  bne       lbl_8001FB48
/* 01CB38 8001FB38 801D008C */  lwz       r0, 0x8c(r29)
/* 01CB3C 8001FB3C 64001000 */  oris      r0, r0, 0x1000
/* 01CB40 8001FB40 901D008C */  stw       r0, 0x8c(r29)
/* 01CB44 8001FB44 48000010 */  b         lbl_8001FB54
lbl_8001FB48:
/* 01CB48 8001FB48 801D008C */  lwz       r0, 0x8c(r29)
/* 01CB4C 8001FB4C 54000104 */  rlwinm    r0, r0, 0, 4, 2
/* 01CB50 8001FB50 901D008C */  stw       r0, 0x8c(r29)
lbl_8001FB54:
/* 01CB54 8001FB54 3CFD0004 */  addis     r7, r29, 0x4
/* 01CB58 8001FB58 C01E0000 */  lfs       f0, 0x0(r30)
/* 01CB5C 8001FB5C 38E7C7A0 */  subi      r7, r7, 0x3860
/* 01CB60 8001FB60 D0070000 */  stfs      f0, 0x0(r7)
/* 01CB64 8001FB64 3C7D0004 */  addis     r3, r29, 0x4
/* 01CB68 8001FB68 7FA4EB78 */  mr        r4, r29
/* 01CB6C 8001FB6C C01E0004 */  lfs       f0, 0x4(r30)
/* 01CB70 8001FB70 67E68000 */  oris      r6, r31, 0x8000
/* 01CB74 8001FB74 38A00000 */  li        r5, 0x0
/* 01CB78 8001FB78 D0070004 */  stfs      f0, 0x4(r7)
/* 01CB7C 8001FB7C C01E0008 */  lfs       f0, 0x8(r30)
/* 01CB80 8001FB80 D0070008 */  stfs      f0, 0x8(r7)
/* 01CB84 8001FB84 C01E000C */  lfs       f0, 0xc(r30)
/* 01CB88 8001FB88 D007000C */  stfs      f0, 0xc(r7)
/* 01CB8C 8001FB8C C01E0010 */  lfs       f0, 0x10(r30)
/* 01CB90 8001FB90 D0070010 */  stfs      f0, 0x10(r7)
/* 01CB94 8001FB94 C01E0014 */  lfs       f0, 0x14(r30)
/* 01CB98 8001FB98 D0070014 */  stfs      f0, 0x14(r7)
/* 01CB9C 8001FB9C C01E0018 */  lfs       f0, 0x18(r30)
/* 01CBA0 8001FBA0 D0070018 */  stfs      f0, 0x18(r7)
/* 01CBA4 8001FBA4 C01E001C */  lfs       f0, 0x1c(r30)
/* 01CBA8 8001FBA8 D007001C */  stfs      f0, 0x1c(r7)
/* 01CBAC 8001FBAC C01E0020 */  lfs       f0, 0x20(r30)
/* 01CBB0 8001FBB0 D0070020 */  stfs      f0, 0x20(r7)
/* 01CBB4 8001FBB4 C01E0024 */  lfs       f0, 0x24(r30)
/* 01CBB8 8001FBB8 D0070024 */  stfs      f0, 0x24(r7)
/* 01CBBC 8001FBBC C01E0028 */  lfs       f0, 0x28(r30)
/* 01CBC0 8001FBC0 D0070028 */  stfs      f0, 0x28(r7)
/* 01CBC4 8001FBC4 C01E002C */  lfs       f0, 0x2c(r30)
/* 01CBC8 8001FBC8 D007002C */  stfs      f0, 0x2c(r7)
/* 01CBCC 8001FBCC C01E0030 */  lfs       f0, 0x30(r30)
/* 01CBD0 8001FBD0 D0070030 */  stfs      f0, 0x30(r7)
/* 01CBD4 8001FBD4 C01E0034 */  lfs       f0, 0x34(r30)
/* 01CBD8 8001FBD8 D0070034 */  stfs      f0, 0x34(r7)
/* 01CBDC 8001FBDC C01E0038 */  lfs       f0, 0x38(r30)
/* 01CBE0 8001FBE0 D0070038 */  stfs      f0, 0x38(r7)
/* 01CBE4 8001FBE4 C01E003C */  lfs       f0, 0x3c(r30)
/* 01CBE8 8001FBE8 D007003C */  stfs      f0, 0x3c(r7)
/* 01CBEC 8001FBEC 801D008C */  lwz       r0, 0x8c(r29)
/* 01CBF0 8001FBF0 64000400 */  oris      r0, r0, 0x400
/* 01CBF4 8001FBF4 901D008C */  stw       r0, 0x8c(r29)
/* 01CBF8 8001FBF8 801D008C */  lwz       r0, 0x8c(r29)
/* 01CBFC 8001FBFC 54000146 */  rlwinm    r0, r0, 0, 5, 3
/* 01CC00 8001FC00 901D008C */  stw       r0, 0x8c(r29)
/* 01CC04 8001FC04 8003C4C8 */  lwz       r0, -0x3b38(r3)
/* 01CC08 8001FC08 48000004 */  b         lbl_8001FC0C
lbl_8001FC0C:
/* 01CC0C 8001FC0C 2C000000 */  cmpwi     r0, 0x0
/* 01CC10 8001FC10 7C0903A6 */  mtctr     r0
/* 01CC14 8001FC14 40810050 */  ble       lbl_8001FC64
/* 01CC18 8001FC18 48000004 */  b         lbl_8001FC1C
lbl_8001FC1C:
/* 01CC1C 8001FC1C 3C640004 */  addis     r3, r4, 0x4
/* 01CC20 8001FC20 8003C83C */  lwz       r0, -0x37c4(r3)
/* 01CC24 8001FC24 7C003040 */  cmplw     r0, r6
/* 01CC28 8001FC28 40820030 */  bne       lbl_8001FC58
/* 01CC2C 8001FC2C 8003C820 */  lwz       r0, -0x37e0(r3)
/* 01CC30 8001FC30 2C000000 */  cmpwi     r0, 0x0
/* 01CC34 8001FC34 41800024 */  blt       lbl_8001FC58
/* 01CC38 8001FC38 1C050024 */  mulli     r0, r5, 0x24
/* 01CC3C 8001FC3C 3C9D0004 */  addis     r4, r29, 0x4
/* 01CC40 8001FC40 7C640214 */  add       r3, r4, r0
/* 01CC44 8001FC44 38000004 */  li        r0, 0x4
/* 01CC48 8001FC48 9003C820 */  stw       r0, -0x37e0(r3)
/* 01CC4C 8001FC4C 38000001 */  li        r0, 0x1
/* 01CC50 8001FC50 90A4C4D0 */  stw       r5, -0x3b30(r4)
/* 01CC54 8001FC54 48000014 */  b         lbl_8001FC68
lbl_8001FC58:
/* 01CC58 8001FC58 38840024 */  addi      r4, r4, 0x24
/* 01CC5C 8001FC5C 38A50001 */  addi      r5, r5, 0x1
/* 01CC60 8001FC60 4200FFBC */  bdnz      lbl_8001FC1C
lbl_8001FC64:
/* 01CC64 8001FC64 38000000 */  li        r0, 0x0
lbl_8001FC68:
/* 01CC68 8001FC68 2C000000 */  cmpwi     r0, 0x0
/* 01CC6C 8001FC6C 408200D4 */  bne       lbl_8001FD40
/* 01CC70 8001FC70 3C7D0004 */  addis     r3, r29, 0x4
/* 01CC74 8001FC74 3800FFFF */  li        r0, -0x1
/* 01CC78 8001FC78 9003C4D0 */  stw       r0, -0x3b30(r3)
/* 01CC7C 8001FC7C 480000C4 */  b         lbl_8001FD40
lbl_8001FC80:
/* 01CC80 8001FC80 801D008C */  lwz       r0, 0x8c(r29)
/* 01CC84 8001FC84 54000108 */  rlwinm    r0, r0, 0, 4, 4
/* 01CC88 8001FC88 28000000 */  cmplwi    r0, 0x0
/* 01CC8C 8001FC8C 41820020 */  beq       lbl_8001FCAC
/* 01CC90 8001FC90 3C9D0004 */  addis     r4, r29, 0x4
/* 01CC94 8001FC94 3CBD0004 */  addis     r5, r29, 0x4
/* 01CC98 8001FC98 7FC3F378 */  mr        r3, r30
/* 01CC9C 8001FC9C 3884C7E0 */  subi      r4, r4, 0x3820
/* 01CCA0 8001FCA0 38A5C7E0 */  subi      r5, r5, 0x3820
/* 01CCA4 8001FCA4 48086FBD */  bl        fn_800A6C60
/* 01CCA8 8001FCA8 48000098 */  b         lbl_8001FD40
lbl_8001FCAC:
/* 01CCAC 8001FCAC 801D008C */  lwz       r0, 0x8c(r29)
/* 01CCB0 8001FCB0 3C7D0004 */  addis     r3, r29, 0x4
/* 01CCB4 8001FCB4 3863C7E0 */  subi      r3, r3, 0x3820
/* 01CCB8 8001FCB8 64000800 */  oris      r0, r0, 0x800
/* 01CCBC 8001FCBC 901D008C */  stw       r0, 0x8c(r29)
/* 01CCC0 8001FCC0 C01E0000 */  lfs       f0, 0x0(r30)
/* 01CCC4 8001FCC4 D0030000 */  stfs      f0, 0x0(r3)
/* 01CCC8 8001FCC8 C01E0004 */  lfs       f0, 0x4(r30)
/* 01CCCC 8001FCCC D0030004 */  stfs      f0, 0x4(r3)
/* 01CCD0 8001FCD0 C01E0008 */  lfs       f0, 0x8(r30)
/* 01CCD4 8001FCD4 D0030008 */  stfs      f0, 0x8(r3)
/* 01CCD8 8001FCD8 C01E000C */  lfs       f0, 0xc(r30)
/* 01CCDC 8001FCDC D003000C */  stfs      f0, 0xc(r3)
/* 01CCE0 8001FCE0 C01E0010 */  lfs       f0, 0x10(r30)
/* 01CCE4 8001FCE4 D0030010 */  stfs      f0, 0x10(r3)
/* 01CCE8 8001FCE8 C01E0014 */  lfs       f0, 0x14(r30)
/* 01CCEC 8001FCEC D0030014 */  stfs      f0, 0x14(r3)
/* 01CCF0 8001FCF0 C01E0018 */  lfs       f0, 0x18(r30)
/* 01CCF4 8001FCF4 D0030018 */  stfs      f0, 0x18(r3)
/* 01CCF8 8001FCF8 C01E001C */  lfs       f0, 0x1c(r30)
/* 01CCFC 8001FCFC D003001C */  stfs      f0, 0x1c(r3)
/* 01CD00 8001FD00 C01E0020 */  lfs       f0, 0x20(r30)
/* 01CD04 8001FD04 D0030020 */  stfs      f0, 0x20(r3)
/* 01CD08 8001FD08 C01E0024 */  lfs       f0, 0x24(r30)
/* 01CD0C 8001FD0C D0030024 */  stfs      f0, 0x24(r3)
/* 01CD10 8001FD10 C01E0028 */  lfs       f0, 0x28(r30)
/* 01CD14 8001FD14 D0030028 */  stfs      f0, 0x28(r3)
/* 01CD18 8001FD18 C01E002C */  lfs       f0, 0x2c(r30)
/* 01CD1C 8001FD1C D003002C */  stfs      f0, 0x2c(r3)
/* 01CD20 8001FD20 C01E0030 */  lfs       f0, 0x30(r30)
/* 01CD24 8001FD24 D0030030 */  stfs      f0, 0x30(r3)
/* 01CD28 8001FD28 C01E0034 */  lfs       f0, 0x34(r30)
/* 01CD2C 8001FD2C D0030034 */  stfs      f0, 0x34(r3)
/* 01CD30 8001FD30 C01E0038 */  lfs       f0, 0x38(r30)
/* 01CD34 8001FD34 D0030038 */  stfs      f0, 0x38(r3)
/* 01CD38 8001FD38 C01E003C */  lfs       f0, 0x3c(r30)
/* 01CD3C 8001FD3C D003003C */  stfs      f0, 0x3c(r3)
lbl_8001FD40:
/* 01CD40 8001FD40 801D008C */  lwz       r0, 0x8c(r29)
/* 01CD44 8001FD44 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 01CD48 8001FD48 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 01CD4C 8001FD4C 54000290 */  rlwinm    r0, r0, 0, 10, 8
/* 01CD50 8001FD50 901D008C */  stw       r0, 0x8c(r29)
/* 01CD54 8001FD54 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 01CD58 8001FD58 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 01CD5C 8001FD5C 801D007C */  lwz       r0, 0x7c(r29)
/* 01CD60 8001FD60 38C66998 */  addi      r6, r6, frameDrawLine_Setup@l
/* 01CD64 8001FD64 38A57568 */  addi      r5, r5, frameDrawTriangle_Setup@l
/* 01CD68 8001FD68 64000004 */  oris      r0, r0, 0x4
/* 01CD6C 8001FD6C 901D007C */  stw       r0, 0x7c(r29)
/* 01CD70 8001FD70 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 01CD74 8001FD74 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 01CD78 8001FD78 90DD012C */  stw       r6, 0x12c(r29)
/* 01CD7C 8001FD7C 90BD0130 */  stw       r5, 0x130(r29)
/* 01CD80 8001FD80 909D0134 */  stw       r4, 0x134(r29)
/* 01CD84 8001FD84 901D0138 */  stw       r0, 0x138(r29)
/* 01CD88 8001FD88 4800000C */  b         lbl_8001FD94
lbl_8001FD8C:
/* 01CD8C 8001FD8C 38600000 */  li        r3, 0x0
/* 01CD90 8001FD90 48000008 */  b         lbl_8001FD98
lbl_8001FD94:
/* 01CD94 8001FD94 38600001 */  li        r3, 0x1
lbl_8001FD98:
/* 01CD98 8001FD98 BB4100A0 */  lmw       r26, 0xa0(r1)
/* 01CD9C 8001FD9C 800100BC */  lwz       r0, 0xbc(r1)
/* 01CDA0 8001FDA0 382100B8 */  addi      r1, r1, 0xb8
/* 01CDA4 8001FDA4 7C0803A6 */  mtlr      r0
/* 01CDA8 8001FDA8 4E800020 */  blr

glabel frameGetMode
/* 01CDAC 8001FDAC 5480103A */  slwi      r0, r4, 2
/* 01CDB0 8001FDB0 7C630214 */  add       r3, r3, r0
/* 01CDB4 8001FDB4 80030090 */  lwz       r0, 0x90(r3)
/* 01CDB8 8001FDB8 38600001 */  li        r3, 0x1
/* 01CDBC 8001FDBC 90050000 */  stw       r0, 0x0(r5)
/* 01CDC0 8001FDC0 4E800020 */  blr

glabel frameSetMode
/* 01CDC4 8001FDC4 38000001 */  li        r0, 0x1
/* 01CDC8 8001FDC8 80C3008C */  lwz       r6, 0x8c(r3)
/* 01CDCC 8001FDCC 7C072030 */  slw       r7, r0, r4
/* 01CDD0 8001FDD0 7CC03838 */  and       r0, r6, r7
/* 01CDD4 8001FDD4 28000000 */  cmplwi    r0, 0x0
/* 01CDD8 8001FDD8 41820018 */  beq       lbl_8001FDF0
/* 01CDDC 8001FDDC 5480103A */  slwi      r0, r4, 2
/* 01CDE0 8001FDE0 7CC30214 */  add       r6, r3, r0
/* 01CDE4 8001FDE4 80060090 */  lwz       r0, 0x90(r6)
/* 01CDE8 8001FDE8 7C092A78 */  xor       r9, r0, r5
/* 01CDEC 8001FDEC 48000014 */  b         lbl_8001FE00
lbl_8001FDF0:
/* 01CDF0 8001FDF0 8003008C */  lwz       r0, 0x8c(r3)
/* 01CDF4 8001FDF4 3920FFFF */  li        r9, -0x1
/* 01CDF8 8001FDF8 7C003B78 */  or        r0, r0, r7
/* 01CDFC 8001FDFC 9003008C */  stw       r0, 0x8c(r3)
lbl_8001FE00:
/* 01CE00 8001FE00 28040009 */  cmplwi    r4, 0x9
/* 01CE04 8001FE04 39000000 */  li        r8, 0x0
/* 01CE08 8001FE08 418100F8 */  bgt       lbl_8001FF00
/* 01CE0C 8001FE0C 3CC0800F */  lis       r6, jtbl_800EC648@ha
/* 01CE10 8001FE10 38C6C648 */  addi      r6, r6, jtbl_800EC648@l
/* 01CE14 8001FE14 5480103A */  slwi      r0, r4, 2
/* 01CE18 8001FE18 7C06002E */  lwzx      r0, r6, r0
/* 01CE1C 8001FE1C 7C0903A6 */  mtctr     r0
/* 01CE20 8001FE20 4E800420 */  bctr
lbl_8001FE24:
/* 01CE24 8001FE24 28090000 */  cmplwi    r9, 0x0
/* 01CE28 8001FE28 418200D8 */  beq       lbl_8001FF00
/* 01CE2C 8001FE2C 61080020 */  ori       r8, r8, 0x20
/* 01CE30 8001FE30 480000D0 */  b         lbl_8001FF00
lbl_8001FE34:
/* 01CE34 8001FE34 552006F6 */  rlwinm    r0, r9, 0, 27, 27
/* 01CE38 8001FE38 28000000 */  cmplwi    r0, 0x0
/* 01CE3C 8001FE3C 41820008 */  beq       lbl_8001FE44
/* 01CE40 8001FE40 61080020 */  ori       r8, r8, 0x20
lbl_8001FE44:
/* 01CE44 8001FE44 552007FE */  clrlwi    r0, r9, 31
/* 01CE48 8001FE48 28000000 */  cmplwi    r0, 0x0
/* 01CE4C 8001FE4C 41820008 */  beq       lbl_8001FE54
/* 01CE50 8001FE50 61080004 */  ori       r8, r8, 0x4
lbl_8001FE54:
/* 01CE54 8001FE54 5520073A */  rlwinm    r0, r9, 0, 28, 29
/* 01CE58 8001FE58 28000000 */  cmplwi    r0, 0x0
/* 01CE5C 8001FE5C 41820008 */  beq       lbl_8001FE64
/* 01CE60 8001FE60 61080008 */  ori       r8, r8, 0x8
lbl_8001FE64:
/* 01CE64 8001FE64 552005F0 */  rlwinm    r0, r9, 0, 23, 24
/* 01CE68 8001FE68 28000000 */  cmplwi    r0, 0x0
/* 01CE6C 8001FE6C 41820094 */  beq       lbl_8001FF00
/* 01CE70 8001FE70 61080002 */  ori       r8, r8, 0x2
/* 01CE74 8001FE74 4800008C */  b         lbl_8001FF00
lbl_8001FE78:
/* 01CE78 8001FE78 28090000 */  cmplwi    r9, 0x0
/* 01CE7C 8001FE7C 41820084 */  beq       lbl_8001FF00
/* 01CE80 8001FE80 61087C01 */  ori       r8, r8, 0x7c01
/* 01CE84 8001FE84 4800007C */  b         lbl_8001FF00
lbl_8001FE88:
/* 01CE88 8001FE88 28090000 */  cmplwi    r9, 0x0
/* 01CE8C 8001FE8C 41820074 */  beq       lbl_8001FF00
/* 01CE90 8001FE90 61087D01 */  ori       r8, r8, 0x7d01
/* 01CE94 8001FE94 4800006C */  b         lbl_8001FF00
lbl_8001FE98:
/* 01CE98 8001FE98 552007BE */  clrlwi    r0, r9, 30
/* 01CE9C 8001FE9C 28000000 */  cmplwi    r0, 0x0
/* 01CEA0 8001FEA0 61080200 */  ori       r8, r8, 0x200
/* 01CEA4 8001FEA4 41820008 */  beq       lbl_8001FEAC
/* 01CEA8 8001FEA8 61087C00 */  ori       r8, r8, 0x7c00
lbl_8001FEAC:
/* 01CEAC 8001FEAC 55200636 */  rlwinm    r0, r9, 0, 24, 27
/* 01CEB0 8001FEB0 28000000 */  cmplwi    r0, 0x0
/* 01CEB4 8001FEB4 41820008 */  beq       lbl_8001FEBC
/* 01CEB8 8001FEB8 61080004 */  ori       r8, r8, 0x4
lbl_8001FEBC:
/* 01CEBC 8001FEBC 5520052A */  rlwinm    r0, r9, 0, 20, 21
/* 01CEC0 8001FEC0 28000000 */  cmplwi    r0, 0x0
/* 01CEC4 8001FEC4 4182000C */  beq       lbl_8001FED0
/* 01CEC8 8001FEC8 65080004 */  oris      r8, r8, 0x4
/* 01CECC 8001FECC 61080004 */  ori       r8, r8, 0x4
lbl_8001FED0:
/* 01CED0 8001FED0 5520001E */  clrrwi    r0, r9, 16
/* 01CED4 8001FED4 28000000 */  cmplwi    r0, 0x0
/* 01CED8 8001FED8 41820028 */  beq       lbl_8001FF00
/* 01CEDC 8001FEDC 61087C00 */  ori       r8, r8, 0x7c00
/* 01CEE0 8001FEE0 48000020 */  b         lbl_8001FF00
lbl_8001FEE4:
/* 01CEE4 8001FEE4 28090000 */  cmplwi    r9, 0x0
/* 01CEE8 8001FEE8 41820018 */  beq       lbl_8001FF00
/* 01CEEC 8001FEEC 61087F01 */  ori       r8, r8, 0x7f01
/* 01CEF0 8001FEF0 48000010 */  b         lbl_8001FF00
lbl_8001FEF4:
/* 01CEF4 8001FEF4 28090000 */  cmplwi    r9, 0x0
/* 01CEF8 8001FEF8 41820008 */  beq       lbl_8001FF00
/* 01CEFC 8001FEFC 61087D00 */  ori       r8, r8, 0x7d00
lbl_8001FF00:
/* 01CF00 8001FF00 28080000 */  cmplwi    r8, 0x0
/* 01CF04 8001FF04 41820040 */  beq       lbl_8001FF44
/* 01CF08 8001FF08 8003007C */  lwz       r0, 0x7c(r3)
/* 01CF0C 8001FF0C 3CE08002 */  lis       r7, frameDrawLine_Setup@ha
/* 01CF10 8001FF10 3CC08002 */  lis       r6, frameDrawTriangle_Setup@ha
/* 01CF14 8001FF14 7C004378 */  or        r0, r0, r8
/* 01CF18 8001FF18 9003007C */  stw       r0, 0x7c(r3)
/* 01CF1C 8001FF1C 38076998 */  addi      r0, r7, frameDrawLine_Setup@l
/* 01CF20 8001FF20 3CE08002 */  lis       r7, frameDrawRectFill_Setup@ha
/* 01CF24 8001FF24 9003012C */  stw       r0, 0x12c(r3)
/* 01CF28 8001FF28 38067568 */  addi      r0, r6, frameDrawTriangle_Setup@l
/* 01CF2C 8001FF2C 3CC08002 */  lis       r6, frameDrawRectTexture_Setup@ha
/* 01CF30 8001FF30 90030130 */  stw       r0, 0x130(r3)
/* 01CF34 8001FF34 38E76654 */  addi      r7, r7, frameDrawRectFill_Setup@l
/* 01CF38 8001FF38 38065D88 */  addi      r0, r6, frameDrawRectTexture_Setup@l
/* 01CF3C 8001FF3C 90E30134 */  stw       r7, 0x134(r3)
/* 01CF40 8001FF40 90030138 */  stw       r0, 0x138(r3)
lbl_8001FF44:
/* 01CF44 8001FF44 5480103A */  slwi      r0, r4, 2
/* 01CF48 8001FF48 7C630214 */  add       r3, r3, r0
/* 01CF4C 8001FF4C 90A30090 */  stw       r5, 0x90(r3)
/* 01CF50 8001FF50 38600001 */  li        r3, 0x1
/* 01CF54 8001FF54 4E800020 */  blr

glabel frameSetSize
/* 01CF58 8001FF58 9421FFC8 */  stwu      r1, -0x38(r1)
/* 01CF5C 8001FF5C 2C050000 */  cmpwi     r5, 0x0
/* 01CF60 8001FF60 40810114 */  ble       lbl_80020074
/* 01CF64 8001FF64 2C060000 */  cmpwi     r6, 0x0
/* 01CF68 8001FF68 4081010C */  ble       lbl_80020074
/* 01CF6C 8001FF6C 3D030004 */  addis     r8, r3, 0x4
/* 01CF70 8001FF70 5480103A */  slwi      r0, r4, 2
/* 01CF74 8001FF74 7CE80214 */  add       r7, r8, r0
/* 01CF78 8001FF78 90A7C4B8 */  stw       r5, -0x3b48(r7)
/* 01CF7C 8001FF7C 2C040000 */  cmpwi     r4, 0x0
/* 01CF80 8001FF80 90C7C4C0 */  stw       r6, -0x3b40(r7)
/* 01CF84 8001FF84 40820078 */  bne       lbl_8001FFFC
/* 01CF88 8001FF88 80E8C4BC */  lwz       r7, -0x3b44(r8)
/* 01CF8C 8001FF8C 6CA48000 */  xoris     r4, r5, 0x8000
/* 01CF90 8001FF90 6CC08000 */  xoris     r0, r6, 0x8000
/* 01CF94 8001FF94 9081002C */  stw       r4, 0x2c(r1)
/* 01CF98 8001FF98 6CE48000 */  xoris     r4, r7, 0x8000
/* 01CF9C 8001FF9C 90810034 */  stw       r4, 0x34(r1)
/* 01CFA0 8001FFA0 3C804330 */  lis       r4, 0x4330
/* 01CFA4 8001FFA4 C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 01CFA8 8001FFA8 90810030 */  stw       r4, 0x30(r1)
/* 01CFAC 8001FFAC 90810028 */  stw       r4, 0x28(r1)
/* 01CFB0 8001FFB0 C8210030 */  lfd       f1, 0x30(r1)
/* 01CFB4 8001FFB4 C8010028 */  lfd       f0, 0x28(r1)
/* 01CFB8 8001FFB8 EC211028 */  fsubs     f1, f1, f2
/* 01CFBC 8001FFBC 9001001C */  stw       r0, 0x1c(r1)
/* 01CFC0 8001FFC0 EC001028 */  fsubs     f0, f0, f2
/* 01CFC4 8001FFC4 90810018 */  stw       r4, 0x18(r1)
/* 01CFC8 8001FFC8 EC210024 */  fdivs     f1, f1, f0
/* 01CFCC 8001FFCC C8010018 */  lfd       f0, 0x18(r1)
/* 01CFD0 8001FFD0 D0230080 */  stfs      f1, 0x80(r3)
/* 01CFD4 8001FFD4 EC001028 */  fsubs     f0, f0, f2
/* 01CFD8 8001FFD8 8008C4C4 */  lwz       r0, -0x3b3c(r8)
/* 01CFDC 8001FFDC 6C008000 */  xoris     r0, r0, 0x8000
/* 01CFE0 8001FFE0 90010024 */  stw       r0, 0x24(r1)
/* 01CFE4 8001FFE4 90810020 */  stw       r4, 0x20(r1)
/* 01CFE8 8001FFE8 C8210020 */  lfd       f1, 0x20(r1)
/* 01CFEC 8001FFEC EC211028 */  fsubs     f1, f1, f2
/* 01CFF0 8001FFF0 EC010024 */  fdivs     f0, f1, f0
/* 01CFF4 8001FFF4 D0030084 */  stfs      f0, 0x84(r3)
/* 01CFF8 8001FFF8 4800007C */  b         lbl_80020074
lbl_8001FFFC:
/* 01CFFC 8001FFFC 2C040001 */  cmpwi     r4, 0x1
/* 01D000 80020000 40820074 */  bne       lbl_80020074
/* 01D004 80020004 8088C4B8 */  lwz       r4, -0x3b48(r8)
/* 01D008 80020008 6CA58000 */  xoris     r5, r5, 0x8000
/* 01D00C 8002000C 6CC08000 */  xoris     r0, r6, 0x8000
/* 01D010 80020010 90A1001C */  stw       r5, 0x1c(r1)
/* 01D014 80020014 6C848000 */  xoris     r4, r4, 0x8000
/* 01D018 80020018 90810024 */  stw       r4, 0x24(r1)
/* 01D01C 8002001C 3C804330 */  lis       r4, 0x4330
/* 01D020 80020020 C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 01D024 80020024 90810018 */  stw       r4, 0x18(r1)
/* 01D028 80020028 90810020 */  stw       r4, 0x20(r1)
/* 01D02C 8002002C C8210018 */  lfd       f1, 0x18(r1)
/* 01D030 80020030 C8010020 */  lfd       f0, 0x20(r1)
/* 01D034 80020034 EC211028 */  fsubs     f1, f1, f2
/* 01D038 80020038 9001002C */  stw       r0, 0x2c(r1)
/* 01D03C 8002003C EC001028 */  fsubs     f0, f0, f2
/* 01D040 80020040 90810028 */  stw       r4, 0x28(r1)
/* 01D044 80020044 EC210024 */  fdivs     f1, f1, f0
/* 01D048 80020048 C8010028 */  lfd       f0, 0x28(r1)
/* 01D04C 8002004C D0230080 */  stfs      f1, 0x80(r3)
/* 01D050 80020050 EC201028 */  fsubs     f1, f0, f2
/* 01D054 80020054 8008C4C0 */  lwz       r0, -0x3b40(r8)
/* 01D058 80020058 6C008000 */  xoris     r0, r0, 0x8000
/* 01D05C 8002005C 90010034 */  stw       r0, 0x34(r1)
/* 01D060 80020060 90810030 */  stw       r4, 0x30(r1)
/* 01D064 80020064 C8010030 */  lfd       f0, 0x30(r1)
/* 01D068 80020068 EC001028 */  fsubs     f0, f0, f2
/* 01D06C 8002006C EC010024 */  fdivs     f0, f1, f0
/* 01D070 80020070 D0030084 */  stfs      f0, 0x84(r3)
lbl_80020074:
/* 01D074 80020074 38600001 */  li        r3, 0x1
/* 01D078 80020078 38210038 */  addi      r1, r1, 0x38
/* 01D07C 8002007C 4E800020 */  blr

glabel frameSetFill
/* 01D080 80020080 2C040000 */  cmpwi     r4, 0x0
/* 01D084 80020084 41820014 */  beq       lbl_80020098
/* 01D088 80020088 8003008C */  lwz       r0, 0x8c(r3)
/* 01D08C 8002008C 64000002 */  oris      r0, r0, 0x2
/* 01D090 80020090 9003008C */  stw       r0, 0x8c(r3)
/* 01D094 80020094 48000010 */  b         lbl_800200A4
lbl_80020098:
/* 01D098 80020098 8003008C */  lwz       r0, 0x8c(r3)
/* 01D09C 8002009C 540003DA */  rlwinm    r0, r0, 0, 15, 13
/* 01D0A0 800200A0 9003008C */  stw       r0, 0x8c(r3)
lbl_800200A4:
/* 01D0A4 800200A4 38600001 */  li        r3, 0x1
/* 01D0A8 800200A8 4E800020 */  blr

glabel frameDrawReset
/* 01D0AC 800200AC 8003007C */  lwz       r0, 0x7c(r3)
/* 01D0B0 800200B0 3CA08002 */  lis       r5, frameDrawLine_Setup@ha
/* 01D0B4 800200B4 3CC08002 */  lis       r6, frameDrawTriangle_Setup@ha
/* 01D0B8 800200B8 7C002378 */  or        r0, r0, r4
/* 01D0BC 800200BC 9003007C */  stw       r0, 0x7c(r3)
/* 01D0C0 800200C0 38056998 */  addi      r0, r5, frameDrawLine_Setup@l
/* 01D0C4 800200C4 3CA08002 */  lis       r5, frameDrawRectFill_Setup@ha
/* 01D0C8 800200C8 9003012C */  stw       r0, 0x12c(r3)
/* 01D0CC 800200CC 38067568 */  addi      r0, r6, frameDrawTriangle_Setup@l
/* 01D0D0 800200D0 3C808002 */  lis       r4, frameDrawRectTexture_Setup@ha
/* 01D0D4 800200D4 90030130 */  stw       r0, 0x130(r3)
/* 01D0D8 800200D8 38A56654 */  addi      r5, r5, frameDrawRectFill_Setup@l
/* 01D0DC 800200DC 38045D88 */  addi      r0, r4, frameDrawRectTexture_Setup@l
/* 01D0E0 800200E0 90A30134 */  stw       r5, 0x134(r3)
/* 01D0E4 800200E4 90030138 */  stw       r0, 0x138(r3)
/* 01D0E8 800200E8 38600001 */  li        r3, 0x1
/* 01D0EC 800200EC 4E800020 */  blr

glabel frameLoadTile
/* 01D0F0 800200F0 7C0802A6 */  mflr      r0
/* 01D0F4 800200F4 90010004 */  stw       r0, 0x4(r1)
/* 01D0F8 800200F8 9421FFB0 */  stwu      r1, -0x50(r1)
/* 01D0FC 800200FC BEA10024 */  stmw      r21, 0x24(r1)
/* 01D100 80020100 7C7D1B78 */  mr        r29, r3
/* 01D104 80020104 7C9E2378 */  mr        r30, r4
/* 01D108 80020108 7CBF2B78 */  mr        r31, r5
/* 01D10C 8002010C 57E0073E */  clrlwi    r0, r31, 28
/* 01D110 80020110 1C60002C */  mulli     r3, r0, 0x2c
/* 01D114 80020114 3C630004 */  addis     r3, r3, 0x4
/* 01D118 80020118 3863C358 */  subi      r3, r3, 0x3ca8
/* 01D11C 8002011C 7C7D1A14 */  add       r3, r29, r3
/* 01D120 80020120 A8030020 */  lha       r0, 0x20(r3)
/* 01D124 80020124 7C7A1B78 */  mr        r26, r3
/* 01D128 80020128 2C000000 */  cmpwi     r0, 0x0
/* 01D12C 8002012C 408200F8 */  bne       lbl_80020224
/* 01D130 80020130 A81A0022 */  lha       r0, 0x22(r26)
/* 01D134 80020134 2C000000 */  cmpwi     r0, 0x0
/* 01D138 80020138 408200EC */  bne       lbl_80020224
/* 01D13C 8002013C A81A0024 */  lha       r0, 0x24(r26)
/* 01D140 80020140 2C000000 */  cmpwi     r0, 0x0
/* 01D144 80020144 408200E0 */  bne       lbl_80020224
/* 01D148 80020148 A81A0026 */  lha       r0, 0x26(r26)
/* 01D14C 8002014C 2C000000 */  cmpwi     r0, 0x0
/* 01D150 80020150 408200D4 */  bne       lbl_80020224
/* 01D154 80020154 3CBD0004 */  addis     r5, r29, 0x4
/* 01D158 80020158 8005C340 */  lwz       r0, -0x3cc0(r5)
/* 01D15C 8002015C 3B600001 */  li        r27, 0x1
/* 01D160 80020160 1C00002C */  mulli     r0, r0, 0x2c
/* 01D164 80020164 7C650214 */  add       r3, r5, r0
/* 01D168 80020168 A803C378 */  lha       r0, -0x3c88(r3)
/* 01D16C 8002016C B01A0020 */  sth       r0, 0x20(r26)
/* 01D170 80020170 8005C340 */  lwz       r0, -0x3cc0(r5)
/* 01D174 80020174 1C00002C */  mulli     r0, r0, 0x2c
/* 01D178 80020178 7C650214 */  add       r3, r5, r0
/* 01D17C 8002017C A803C37A */  lha       r0, -0x3c86(r3)
/* 01D180 80020180 B01A0022 */  sth       r0, 0x22(r26)
/* 01D184 80020184 8005C340 */  lwz       r0, -0x3cc0(r5)
/* 01D188 80020188 1C00002C */  mulli     r0, r0, 0x2c
/* 01D18C 8002018C 7C650214 */  add       r3, r5, r0
/* 01D190 80020190 A803C37C */  lha       r0, -0x3c84(r3)
/* 01D194 80020194 B01A0024 */  sth       r0, 0x24(r26)
/* 01D198 80020198 8005C340 */  lwz       r0, -0x3cc0(r5)
/* 01D19C 8002019C 1C00002C */  mulli     r0, r0, 0x2c
/* 01D1A0 800201A0 7C650214 */  add       r3, r5, r0
/* 01D1A4 800201A4 A803C37E */  lha       r0, -0x3c82(r3)
/* 01D1A8 800201A8 B01A0026 */  sth       r0, 0x26(r26)
/* 01D1AC 800201AC 8005C340 */  lwz       r0, -0x3cc0(r5)
/* 01D1B0 800201B0 809A0000 */  lwz       r4, 0x0(r26)
/* 01D1B4 800201B4 1C00002C */  mulli     r0, r0, 0x2c
/* 01D1B8 800201B8 7C650214 */  add       r3, r5, r0
/* 01D1BC 800201BC 8003C358 */  lwz       r0, -0x3ca8(r3)
/* 01D1C0 800201C0 7C640050 */  subf      r3, r4, r0
/* 01D1C4 800201C4 2C030000 */  cmpwi     r3, 0x0
/* 01D1C8 800201C8 4080002C */  bge       lbl_800201F4
/* 01D1CC 800201CC A81A0020 */  lha       r0, 0x20(r26)
/* 01D1D0 800201D0 7C6300D0 */  neg       r3, r3
/* 01D1D4 800201D4 7C001E30 */  sraw      r0, r0, r3
/* 01D1D8 800201D8 7C000734 */  extsh     r0, r0
/* 01D1DC 800201DC B01A0020 */  sth       r0, 0x20(r26)
/* 01D1E0 800201E0 A81A0024 */  lha       r0, 0x24(r26)
/* 01D1E4 800201E4 7C001E30 */  sraw      r0, r0, r3
/* 01D1E8 800201E8 7C000734 */  extsh     r0, r0
/* 01D1EC 800201EC B01A0024 */  sth       r0, 0x24(r26)
/* 01D1F0 800201F0 48000024 */  b         lbl_80020214
lbl_800201F4:
/* 01D1F4 800201F4 A81A0020 */  lha       r0, 0x20(r26)
/* 01D1F8 800201F8 7C001830 */  slw       r0, r0, r3
/* 01D1FC 800201FC 7C000734 */  extsh     r0, r0
/* 01D200 80020200 B01A0020 */  sth       r0, 0x20(r26)
/* 01D204 80020204 A81A0024 */  lha       r0, 0x24(r26)
/* 01D208 80020208 7C001830 */  slw       r0, r0, r3
/* 01D20C 8002020C 7C000734 */  extsh     r0, r0
/* 01D210 80020210 B01A0024 */  sth       r0, 0x24(r26)
lbl_80020214:
/* 01D214 80020214 38000002 */  li        r0, 0x2
/* 01D218 80020218 B01A0018 */  sth       r0, 0x18(r26)
/* 01D21C 8002021C B01A001A */  sth       r0, 0x1a(r26)
/* 01D220 80020220 48000008 */  b         lbl_80020228
lbl_80020224:
/* 01D224 80020224 3B600000 */  li        r27, 0x0
lbl_80020228:
/* 01D228 80020228 A81A0016 */  lha       r0, 0x16(r26)
/* 01D22C 8002022C A87A0018 */  lha       r3, 0x18(r26)
/* 01D230 80020230 AB1A0014 */  lha       r24, 0x14(r26)
/* 01D234 80020234 5417073E */  clrlwi    r23, r0, 28
/* 01D238 80020238 A81A001A */  lha       r0, 0x1a(r26)
/* 01D23C 8002023C 5479077E */  clrlwi    r25, r3, 29
/* 01D240 80020240 A87A001C */  lha       r3, 0x1c(r26)
/* 01D244 80020244 541C077E */  clrlwi    r28, r0, 29
/* 01D248 80020248 A89A001E */  lha       r4, 0x1e(r26)
/* 01D24C 8002024C 5460073E */  clrlwi    r0, r3, 28
/* 01D250 80020250 80BA0000 */  lwz       r5, 0x0(r26)
/* 01D254 80020254 5483073E */  clrlwi    r3, r4, 28
/* 01D258 80020258 80DA0010 */  lwz       r6, 0x10(r26)
/* 01D25C 8002025C 817D21F8 */  lwz       r11, 0x21f8(r29)
/* 01D260 80020260 54A4077E */  clrlwi    r4, r5, 29
/* 01D264 80020264 A91A0024 */  lha       r8, 0x24(r26)
/* 01D268 80020268 54C5077E */  clrlwi    r5, r6, 29
/* 01D26C 8002026C A8FA0026 */  lha       r7, 0x26(r26)
/* 01D270 80020270 80DA0008 */  lwz       r6, 0x8(r26)
/* 01D274 80020274 3D8B0001 */  addis     r12, r11, 0x1
/* 01D278 80020278 82BA000C */  lwz       r21, 0xc(r26)
/* 01D27C 8002027C 5509043E */  clrlwi    r9, r8, 16
/* 01D280 80020280 A95A0020 */  lha       r10, 0x20(r26)
/* 01D284 80020284 A91A0022 */  lha       r8, 0x22(r26)
/* 01D288 80020288 54E7043E */  clrlwi    r7, r7, 16
/* 01D28C 8002028C 82DA0004 */  lwz       r22, 0x4(r26)
/* 01D290 80020290 54C6073E */  clrlwi    r6, r6, 28
/* 01D294 80020294 56B5043E */  clrlwi    r21, r21, 16
/* 01D298 80020298 5718073E */  clrlwi    r24, r24, 28
/* 01D29C 8002029C 56F72036 */  slwi      r23, r23, 4
/* 01D2A0 800202A0 5739402E */  slwi      r25, r25, 8
/* 01D2A4 800202A4 7F17BB78 */  or        r23, r24, r23
/* 01D2A8 800202A8 57985828 */  slwi      r24, r28, 11
/* 01D2AC 800202AC 7F37BB78 */  or        r23, r25, r23
/* 01D2B0 800202B0 54197022 */  slwi      r25, r0, 14
/* 01D2B4 800202B4 7F00BB78 */  or        r0, r24, r23
/* 01D2B8 800202B8 5463901A */  slwi      r3, r3, 18
/* 01D2BC 800202BC 7F200378 */  or        r0, r25, r0
/* 01D2C0 800202C0 5484B012 */  slwi      r4, r4, 22
/* 01D2C4 800202C4 7C600378 */  or        r0, r3, r0
/* 01D2C8 800202C8 280CFFFF */  cmplwi    r12, 0xffff
/* 01D2CC 800202CC 54A3C80C */  slwi      r3, r5, 25
/* 01D2D0 800202D0 7C800378 */  or        r0, r4, r0
/* 01D2D4 800202D4 554A043E */  clrlwi    r10, r10, 16
/* 01D2D8 800202D8 5529801E */  slwi      r9, r9, 16
/* 01D2DC 800202DC 5508043E */  clrlwi    r8, r8, 16
/* 01D2E0 800202E0 54E7801E */  slwi      r7, r7, 16
/* 01D2E4 800202E4 54C5E006 */  slwi      r5, r6, 28
/* 01D2E8 800202E8 7C640378 */  or        r4, r3, r0
/* 01D2EC 800202EC 56C3043E */  clrlwi    r3, r22, 16
/* 01D2F0 800202F0 56A0801E */  slwi      r0, r21, 16
/* 01D2F4 800202F4 7D584B78 */  or        r24, r10, r9
/* 01D2F8 800202F8 7D173B78 */  or        r23, r8, r7
/* 01D2FC 800202FC 7CB62378 */  or        r22, r5, r4
/* 01D300 80020300 7C750378 */  or        r21, r3, r0
/* 01D304 80020304 4082000C */  bne       lbl_80020310
/* 01D308 80020308 38000000 */  li        r0, 0x0
/* 01D30C 8002030C 48000008 */  b         lbl_80020314
lbl_80020310:
/* 01D310 80020310 5560AAFE */  srwi      r0, r11, 11
lbl_80020314:
/* 01D314 80020314 3C7D0004 */  addis     r3, r29, 0x4
/* 01D318 80020318 5400103A */  slwi      r0, r0, 2
/* 01D31C 8002031C 7F830214 */  add       r28, r3, r0
/* 01D320 80020320 3B9C8340 */  subi      r28, r28, 0x7cc0
/* 01D324 80020324 801C0000 */  lwz       r0, 0x0(r28)
/* 01D328 80020328 90010018 */  stw       r0, 0x18(r1)
/* 01D32C 8002032C 7C190378 */  mr        r25, r0
/* 01D330 80020330 48000004 */  b         lbl_80020334
lbl_80020334:
/* 01D334 80020334 48000004 */  b         lbl_80020338
lbl_80020338:
/* 01D338 80020338 48000060 */  b         lbl_80020398
lbl_8002033C:
/* 01D33C 8002033C 80040024 */  lwz       r0, 0x24(r4)
/* 01D340 80020340 7C00C040 */  cmplw     r0, r24
/* 01D344 80020344 40820048 */  bne       lbl_8002038C
/* 01D348 80020348 80040028 */  lwz       r0, 0x28(r4)
/* 01D34C 8002034C 7C00B840 */  cmplw     r0, r23
/* 01D350 80020350 4082003C */  bne       lbl_8002038C
/* 01D354 80020354 8004002C */  lwz       r0, 0x2c(r4)
/* 01D358 80020358 7C00B040 */  cmplw     r0, r22
/* 01D35C 8002035C 40820030 */  bne       lbl_8002038C
/* 01D360 80020360 80040030 */  lwz       r0, 0x30(r4)
/* 01D364 80020364 7C00A840 */  cmplw     r0, r21
/* 01D368 80020368 40820024 */  bne       lbl_8002038C
/* 01D36C 8002036C 80640018 */  lwz       r3, 0x18(r4)
/* 01D370 80020370 801A0028 */  lwz       r0, 0x28(r26)
/* 01D374 80020374 7C030040 */  cmplw     r3, r0
/* 01D378 80020378 40820014 */  bne       lbl_8002038C
/* 01D37C 8002037C 80640014 */  lwz       r3, 0x14(r4)
/* 01D380 80020380 801D21F8 */  lwz       r0, 0x21f8(r29)
/* 01D384 80020384 7C030040 */  cmplw     r3, r0
/* 01D388 80020388 4182001C */  beq       lbl_800203A4
lbl_8002038C:
/* 01D38C 8002038C 80040020 */  lwz       r0, 0x20(r4)
/* 01D390 80020390 7C992378 */  mr        r25, r4
/* 01D394 80020394 90010018 */  stw       r0, 0x18(r1)
lbl_80020398:
/* 01D398 80020398 80810018 */  lwz       r4, 0x18(r1)
/* 01D39C 8002039C 28040000 */  cmplwi    r4, 0x0
/* 01D3A0 800203A0 4082FF9C */  bne       lbl_8002033C
lbl_800203A4:
/* 01D3A4 800203A4 28040000 */  cmplwi    r4, 0x0
/* 01D3A8 800203A8 4082009C */  bne       lbl_80020444
/* 01D3AC 800203AC 7FA3EB78 */  mr        r3, r29
/* 01D3B0 800203B0 38810018 */  addi      r4, r1, 0x18
/* 01D3B4 800203B4 4800081D */  bl        frameMakeTexture
/* 01D3B8 800203B8 2C030000 */  cmpwi     r3, 0x0
/* 01D3BC 800203BC 4082000C */  bne       lbl_800203C8
/* 01D3C0 800203C0 38600000 */  li        r3, 0x0
/* 01D3C4 800203C4 4800013C */  b         lbl_80020500
lbl_800203C8:
/* 01D3C8 800203C8 80810018 */  lwz       r4, 0x18(r1)
/* 01D3CC 800203CC 7FA3EB78 */  mr        r3, r29
/* 01D3D0 800203D0 7F45D378 */  mr        r5, r26
/* 01D3D4 800203D4 38C00000 */  li        r6, 0x0
/* 01D3D8 800203D8 4800A015 */  bl        frameMakePixels
/* 01D3DC 800203DC 80610018 */  lwz       r3, 0x18(r1)
/* 01D3E0 800203E0 93030024 */  stw       r24, 0x24(r3)
/* 01D3E4 800203E4 80610018 */  lwz       r3, 0x18(r1)
/* 01D3E8 800203E8 92E30028 */  stw       r23, 0x28(r3)
/* 01D3EC 800203EC 80610018 */  lwz       r3, 0x18(r1)
/* 01D3F0 800203F0 92C3002C */  stw       r22, 0x2c(r3)
/* 01D3F4 800203F4 80610018 */  lwz       r3, 0x18(r1)
/* 01D3F8 800203F8 92A30030 */  stw       r21, 0x30(r3)
/* 01D3FC 800203FC 809D21F8 */  lwz       r4, 0x21f8(r29)
/* 01D400 80020400 3C040001 */  addis     r0, r4, 0x1
/* 01D404 80020404 2800FFFF */  cmplwi    r0, 0xffff
/* 01D408 80020408 40820014 */  bne       lbl_8002041C
/* 01D40C 8002040C 80610018 */  lwz       r3, 0x18(r1)
/* 01D410 80020410 38000000 */  li        r0, 0x0
/* 01D414 80020414 90030014 */  stw       r0, 0x14(r3)
/* 01D418 80020418 4800000C */  b         lbl_80020424
lbl_8002041C:
/* 01D41C 8002041C 80610018 */  lwz       r3, 0x18(r1)
/* 01D420 80020420 90830014 */  stw       r4, 0x14(r3)
lbl_80020424:
/* 01D424 80020424 28190000 */  cmplwi    r25, 0x0
/* 01D428 80020428 40820010 */  bne       lbl_80020438
/* 01D42C 8002042C 80010018 */  lwz       r0, 0x18(r1)
/* 01D430 80020430 901C0000 */  stw       r0, 0x0(r28)
/* 01D434 80020434 48000048 */  b         lbl_8002047C
lbl_80020438:
/* 01D438 80020438 80010018 */  lwz       r0, 0x18(r1)
/* 01D43C 8002043C 90190020 */  stw       r0, 0x20(r25)
/* 01D440 80020440 4800003C */  b         lbl_8002047C
lbl_80020444:
/* 01D444 80020444 80040008 */  lwz       r0, 0x8(r4)
/* 01D448 80020448 2C00FFFF */  cmpwi     r0, -0x1
/* 01D44C 8002044C 41820030 */  beq       lbl_8002047C
/* 01D450 80020450 801A0008 */  lwz       r0, 0x8(r26)
/* 01D454 80020454 80A4001C */  lwz       r5, 0x1c(r4)
/* 01D458 80020458 5400103A */  slwi      r0, r0, 2
/* 01D45C 8002045C 7C7D0214 */  add       r3, r29, r0
/* 01D460 80020460 80032200 */  lwz       r0, 0x2200(r3)
/* 01D464 80020464 7C050040 */  cmplw     r5, r0
/* 01D468 80020468 41820014 */  beq       lbl_8002047C
/* 01D46C 8002046C 7FA3EB78 */  mr        r3, r29
/* 01D470 80020470 7F45D378 */  mr        r5, r26
/* 01D474 80020474 38C00001 */  li        r6, 0x1
/* 01D478 80020478 48009F75 */  bl        frameMakePixels
lbl_8002047C:
/* 01D47C 8002047C 801D0088 */  lwz       r0, 0x88(r29)
/* 01D480 80020480 7FA3EB78 */  mr        r3, r29
/* 01D484 80020484 80810018 */  lwz       r4, 0x18(r1)
/* 01D488 80020488 7FE5FB78 */  mr        r5, r31
/* 01D48C 8002048C 7F46D378 */  mr        r6, r26
/* 01D490 80020490 9004000C */  stw       r0, 0xc(r4)
/* 01D494 80020494 801A0008 */  lwz       r0, 0x8(r26)
/* 01D498 80020498 80810018 */  lwz       r4, 0x18(r1)
/* 01D49C 8002049C 5400103A */  slwi      r0, r0, 2
/* 01D4A0 800204A0 7CFD0214 */  add       r7, r29, r0
/* 01D4A4 800204A4 80072200 */  lwz       r0, 0x2200(r7)
/* 01D4A8 800204A8 9004001C */  stw       r0, 0x1c(r4)
/* 01D4AC 800204AC 801A0028 */  lwz       r0, 0x28(r26)
/* 01D4B0 800204B0 80810018 */  lwz       r4, 0x18(r1)
/* 01D4B4 800204B4 90040018 */  stw       r0, 0x18(r4)
/* 01D4B8 800204B8 80810018 */  lwz       r4, 0x18(r1)
/* 01D4BC 800204BC 48009C55 */  bl        frameLoadTexture
/* 01D4C0 800204C0 2C030000 */  cmpwi     r3, 0x0
/* 01D4C4 800204C4 4082000C */  bne       lbl_800204D0
/* 01D4C8 800204C8 38600000 */  li        r3, 0x0
/* 01D4CC 800204CC 48000034 */  b         lbl_80020500
lbl_800204D0:
/* 01D4D0 800204D0 281E0000 */  cmplwi    r30, 0x0
/* 01D4D4 800204D4 4182000C */  beq       lbl_800204E0
/* 01D4D8 800204D8 80010018 */  lwz       r0, 0x18(r1)
/* 01D4DC 800204DC 901E0000 */  stw       r0, 0x0(r30)
lbl_800204E0:
/* 01D4E0 800204E0 2C1B0000 */  cmpwi     r27, 0x0
/* 01D4E4 800204E4 41820018 */  beq       lbl_800204FC
/* 01D4E8 800204E8 38000000 */  li        r0, 0x0
/* 01D4EC 800204EC B01A0026 */  sth       r0, 0x26(r26)
/* 01D4F0 800204F0 B01A0024 */  sth       r0, 0x24(r26)
/* 01D4F4 800204F4 B01A0022 */  sth       r0, 0x22(r26)
/* 01D4F8 800204F8 B01A0020 */  sth       r0, 0x20(r26)
lbl_800204FC:
/* 01D4FC 800204FC 38600001 */  li        r3, 0x1
lbl_80020500:
/* 01D500 80020500 BAA10024 */  lmw       r21, 0x24(r1)
/* 01D504 80020504 80010054 */  lwz       r0, 0x54(r1)
/* 01D508 80020508 38210050 */  addi      r1, r1, 0x50
/* 01D50C 8002050C 7C0803A6 */  mtlr      r0
/* 01D510 80020510 4E800020 */  blr

glabel frameUpdateCache
/* 01D514 80020514 7C0802A6 */  mflr      r0
/* 01D518 80020518 90010004 */  stw       r0, 0x4(r1)
/* 01D51C 8002051C 9421FFC0 */  stwu      r1, -0x40(r1)
/* 01D520 80020520 BEA10014 */  stmw      r21, 0x14(r1)
/* 01D524 80020524 7C771B78 */  mr        r23, r3
/* 01D528 80020528 83570088 */  lwz       r26, 0x88(r23)
/* 01D52C 8002052C 7EFDBB78 */  mr        r29, r23
/* 01D530 80020530 3B200000 */  li        r25, 0x0
/* 01D534 80020534 3B800000 */  li        r28, 0x0
/* 01D538 80020538 48000004 */  b         lbl_8002053C
lbl_8002053C:
/* 01D53C 8002053C 3C604BDA */  lis       r3, 0x4bda
/* 01D540 80020540 3BD72240 */  addi      r30, r23, 0x2240
/* 01D544 80020544 3BE312F7 */  addi      r31, r3, 0x12f7
/* 01D548 80020548 48000004 */  b         lbl_8002054C
lbl_8002054C:
/* 01D54C 8002054C 48000004 */  b         lbl_80020550
lbl_80020550:
/* 01D550 80020550 3C7D0004 */  addis     r3, r29, 0x4
/* 01D554 80020554 83638240 */  lwz       r27, -0x7dc0(r3)
/* 01D558 80020558 281B0000 */  cmplwi    r27, 0x0
/* 01D55C 8002055C 41820180 */  beq       lbl_800206DC
/* 01D560 80020560 48000004 */  b         lbl_80020564
lbl_80020564:
/* 01D564 80020564 1EDC006C */  mulli     r22, r28, 0x6c
/* 01D568 80020568 48000004 */  b         lbl_8002056C
lbl_8002056C:
/* 01D56C 8002056C 48000168 */  b         lbl_800206D4
lbl_80020570:
/* 01D570 80020570 576007FE */  clrlwi    r0, r27, 31
/* 01D574 80020574 28000000 */  cmplwi    r0, 0x0
/* 01D578 80020578 41820154 */  beq       lbl_800206CC
/* 01D57C 8002057C 7C77B214 */  add       r3, r23, r22
/* 01D580 80020580 8003224C */  lwz       r0, 0x224c(r3)
/* 01D584 80020584 3B032240 */  addi      r24, r3, 0x2240
/* 01D588 80020588 7C1A0050 */  subf      r0, r26, r0
/* 01D58C 8002058C 2C000000 */  cmpwi     r0, 0x0
/* 01D590 80020590 40800008 */  bge       lbl_80020598
/* 01D594 80020594 7C0000D0 */  neg       r0, r0
lbl_80020598:
/* 01D598 80020598 2C000001 */  cmpwi     r0, 0x1
/* 01D59C 8002059C 40810130 */  ble       lbl_800206CC
/* 01D5A0 800205A0 80180014 */  lwz       r0, 0x14(r24)
/* 01D5A4 800205A4 38A00000 */  li        r5, 0x0
/* 01D5A8 800205A8 5400AAFE */  srwi      r0, r0, 11
/* 01D5AC 800205AC 5403103A */  slwi      r3, r0, 2
/* 01D5B0 800205B0 3C630004 */  addis     r3, r3, 0x4
/* 01D5B4 800205B4 38638340 */  subi      r3, r3, 0x7cc0
/* 01D5B8 800205B8 7C97182E */  lwzx      r4, r23, r3
/* 01D5BC 800205BC 48000004 */  b         lbl_800205C0
lbl_800205C0:
/* 01D5C0 800205C0 48000004 */  b         lbl_800205C4
lbl_800205C4:
/* 01D5C4 800205C4 4800000C */  b         lbl_800205D0
lbl_800205C8:
/* 01D5C8 800205C8 7C852378 */  mr        r5, r4
/* 01D5CC 800205CC 80840020 */  lwz       r4, 0x20(r4)
lbl_800205D0:
/* 01D5D0 800205D0 28040000 */  cmplwi    r4, 0x0
/* 01D5D4 800205D4 4182000C */  beq       lbl_800205E0
/* 01D5D8 800205D8 7C04C040 */  cmplw     r4, r24
/* 01D5DC 800205DC 4082FFEC */  bne       lbl_800205C8
lbl_800205E0:
/* 01D5E0 800205E0 28050000 */  cmplwi    r5, 0x0
/* 01D5E4 800205E4 4082001C */  bne       lbl_80020600
/* 01D5E8 800205E8 5403103A */  slwi      r3, r0, 2
/* 01D5EC 800205EC 80040020 */  lwz       r0, 0x20(r4)
/* 01D5F0 800205F0 3C630004 */  addis     r3, r3, 0x4
/* 01D5F4 800205F4 38638340 */  subi      r3, r3, 0x7cc0
/* 01D5F8 800205F8 7C17192E */  stwx      r0, r23, r3
/* 01D5FC 800205FC 4800000C */  b         lbl_80020608
lbl_80020600:
/* 01D600 80020600 80040020 */  lwz       r0, 0x20(r4)
/* 01D604 80020604 90050020 */  stw       r0, 0x20(r5)
lbl_80020608:
/* 01D608 80020608 7EBEC050 */  subf      r21, r30, r24
/* 01D60C 8002060C 38780008 */  addi      r3, r24, 0x8
/* 01D610 80020610 38971CF8 */  addi      r4, r23, 0x1cf8
/* 01D614 80020614 38A00140 */  li        r5, 0x140
/* 01D618 80020618 480006D5 */  bl        packFreeBlocks
/* 01D61C 8002061C 2C030000 */  cmpwi     r3, 0x0
/* 01D620 80020620 4082000C */  bne       lbl_8002062C
/* 01D624 80020624 38000000 */  li        r0, 0x0
/* 01D628 80020628 48000008 */  b         lbl_80020630
lbl_8002062C:
/* 01D62C 8002062C 38000001 */  li        r0, 0x1
lbl_80020630:
/* 01D630 80020630 2C000000 */  cmpwi     r0, 0x0
/* 01D634 80020634 4082000C */  bne       lbl_80020640
/* 01D638 80020638 38000000 */  li        r0, 0x0
/* 01D63C 8002063C 48000028 */  b         lbl_80020664
lbl_80020640:
/* 01D640 80020640 38780004 */  addi      r3, r24, 0x4
/* 01D644 80020644 38971C38 */  addi      r4, r23, 0x1c38
/* 01D648 80020648 38A00030 */  li        r5, 0x30
/* 01D64C 8002064C 480006A1 */  bl        packFreeBlocks
/* 01D650 80020650 2C030000 */  cmpwi     r3, 0x0
/* 01D654 80020654 4082000C */  bne       lbl_80020660
/* 01D658 80020658 38000000 */  li        r0, 0x0
/* 01D65C 8002065C 48000008 */  b         lbl_80020664
lbl_80020660:
/* 01D660 80020660 38000001 */  li        r0, 0x1
lbl_80020664:
/* 01D664 80020664 2C000000 */  cmpwi     r0, 0x0
/* 01D668 80020668 4082000C */  bne       lbl_80020674
/* 01D66C 8002066C 38A00000 */  li        r5, 0x0
/* 01D670 80020670 4800004C */  b         lbl_800206BC
lbl_80020674:
/* 01D674 80020674 7C1FA896 */  mulhw     r0, r31, r21
/* 01D678 80020678 7C002E70 */  srawi     r0, r0, 5
/* 01D67C 8002067C 54030FFE */  srwi      r3, r0, 31
/* 01D680 80020680 7EA01A14 */  add       r21, r0, r3
/* 01D684 80020684 7EA02E70 */  srawi     r0, r21, 5
/* 01D688 80020688 5403103A */  slwi      r3, r0, 2
/* 01D68C 8002068C 3C830004 */  addis     r4, r3, 0x4
/* 01D690 80020690 38848240 */  subi      r4, r4, 0x7dc0
/* 01D694 80020694 38A00001 */  li        r5, 0x1
/* 01D698 80020698 7C77202E */  lwzx      r3, r23, r4
/* 01D69C 8002069C 56A006FE */  clrlwi    r0, r21, 27
/* 01D6A0 800206A0 7CA00030 */  slw       r0, r5, r0
/* 01D6A4 800206A4 7C0000F8 */  nor       r0, r0, r0
/* 01D6A8 800206A8 7C600038 */  and       r0, r3, r0
/* 01D6AC 800206AC 7C17212E */  stwx      r0, r23, r4
/* 01D6B0 800206B0 80771C30 */  lwz       r3, 0x1c30(r23)
/* 01D6B4 800206B4 3803FFFF */  subi      r0, r3, 0x1
/* 01D6B8 800206B8 90171C30 */  stw       r0, 0x1c30(r23)
lbl_800206BC:
/* 01D6BC 800206BC 2C050000 */  cmpwi     r5, 0x0
/* 01D6C0 800206C0 4082000C */  bne       lbl_800206CC
/* 01D6C4 800206C4 38600000 */  li        r3, 0x0
/* 01D6C8 800206C8 4800002C */  b         lbl_800206F4
lbl_800206CC:
/* 01D6CC 800206CC 3AD6006C */  addi      r22, r22, 0x6c
/* 01D6D0 800206D0 577BF87E */  srwi      r27, r27, 1
lbl_800206D4:
/* 01D6D4 800206D4 281B0000 */  cmplwi    r27, 0x0
/* 01D6D8 800206D8 4082FE98 */  bne       lbl_80020570
lbl_800206DC:
/* 01D6DC 800206DC 3BBD0004 */  addi      r29, r29, 0x4
/* 01D6E0 800206E0 3B9C0020 */  addi      r28, r28, 0x20
/* 01D6E4 800206E4 3B390001 */  addi      r25, r25, 0x1
/* 01D6E8 800206E8 28190040 */  cmplwi    r25, 0x40
/* 01D6EC 800206EC 4180FE64 */  blt       lbl_80020550
/* 01D6F0 800206F0 38600001 */  li        r3, 0x1
lbl_800206F4:
/* 01D6F4 800206F4 BAA10014 */  lmw       r21, 0x14(r1)
/* 01D6F8 800206F8 80010044 */  lwz       r0, 0x44(r1)
/* 01D6FC 800206FC 38210040 */  addi      r1, r1, 0x40
/* 01D700 80020700 7C0803A6 */  mtlr      r0
/* 01D704 80020704 4E800020 */  blr

glabel frameSetupCache
/* 01D708 80020708 7C0802A6 */  mflr      r0
/* 01D70C 8002070C 90010004 */  stw       r0, 0x4(r1)
/* 01D710 80020710 9421FFD0 */  stwu      r1, -0x30(r1)
/* 01D714 80020714 93E1002C */  stw       r31, 0x2c(r1)
/* 01D718 80020718 93C10028 */  stw       r30, 0x28(r1)
/* 01D71C 8002071C 7C7E1B78 */  mr        r30, r3
/* 01D720 80020720 38800000 */  li        r4, 0x0
/* 01D724 80020724 909E1C24 */  stw       r4, 0x1c24(r30)
/* 01D728 80020728 7FC5F378 */  mr        r5, r30
/* 01D72C 8002072C 909E1C20 */  stw       r4, 0x1c20(r30)
/* 01D730 80020730 909E1C2C */  stw       r4, 0x1c2c(r30)
/* 01D734 80020734 909E1C28 */  stw       r4, 0x1c28(r30)
/* 01D738 80020738 909E1C34 */  stw       r4, 0x1c34(r30)
/* 01D73C 8002073C 909E1C30 */  stw       r4, 0x1c30(r30)
/* 01D740 80020740 48000004 */  b         lbl_80020744
lbl_80020744:
/* 01D744 80020744 38000040 */  li        r0, 0x40
/* 01D748 80020748 7C0903A6 */  mtctr     r0
/* 01D74C 8002074C 48000004 */  b         lbl_80020750
lbl_80020750:
/* 01D750 80020750 48000004 */  b         lbl_80020754
lbl_80020754:
/* 01D754 80020754 3C650004 */  addis     r3, r5, 0x4
/* 01D758 80020758 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D75C 8002075C 38A50020 */  addi      r5, r5, 0x20
/* 01D760 80020760 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D764 80020764 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D768 80020768 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D76C 8002076C 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D770 80020770 90838354 */  stw       r4, -0x7cac(r3)
/* 01D774 80020774 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D778 80020778 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D77C 8002077C 3C650004 */  addis     r3, r5, 0x4
/* 01D780 80020780 38A50020 */  addi      r5, r5, 0x20
/* 01D784 80020784 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D788 80020788 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D78C 8002078C 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D790 80020790 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D794 80020794 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D798 80020798 90838354 */  stw       r4, -0x7cac(r3)
/* 01D79C 8002079C 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D7A0 800207A0 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D7A4 800207A4 3C650004 */  addis     r3, r5, 0x4
/* 01D7A8 800207A8 38A50020 */  addi      r5, r5, 0x20
/* 01D7AC 800207AC 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D7B0 800207B0 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D7B4 800207B4 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D7B8 800207B8 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D7BC 800207BC 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D7C0 800207C0 90838354 */  stw       r4, -0x7cac(r3)
/* 01D7C4 800207C4 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D7C8 800207C8 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D7CC 800207CC 3C650004 */  addis     r3, r5, 0x4
/* 01D7D0 800207D0 38A50020 */  addi      r5, r5, 0x20
/* 01D7D4 800207D4 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D7D8 800207D8 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D7DC 800207DC 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D7E0 800207E0 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D7E4 800207E4 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D7E8 800207E8 90838354 */  stw       r4, -0x7cac(r3)
/* 01D7EC 800207EC 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D7F0 800207F0 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D7F4 800207F4 3C650004 */  addis     r3, r5, 0x4
/* 01D7F8 800207F8 38A50020 */  addi      r5, r5, 0x20
/* 01D7FC 800207FC 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D800 80020800 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D804 80020804 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D808 80020808 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D80C 8002080C 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D810 80020810 90838354 */  stw       r4, -0x7cac(r3)
/* 01D814 80020814 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D818 80020818 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D81C 8002081C 3C650004 */  addis     r3, r5, 0x4
/* 01D820 80020820 38A50020 */  addi      r5, r5, 0x20
/* 01D824 80020824 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D828 80020828 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D82C 8002082C 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D830 80020830 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D834 80020834 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D838 80020838 90838354 */  stw       r4, -0x7cac(r3)
/* 01D83C 8002083C 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D840 80020840 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D844 80020844 3C650004 */  addis     r3, r5, 0x4
/* 01D848 80020848 38A50020 */  addi      r5, r5, 0x20
/* 01D84C 8002084C 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D850 80020850 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D854 80020854 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D858 80020858 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D85C 8002085C 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D860 80020860 90838354 */  stw       r4, -0x7cac(r3)
/* 01D864 80020864 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D868 80020868 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D86C 8002086C 3C650004 */  addis     r3, r5, 0x4
/* 01D870 80020870 38A50020 */  addi      r5, r5, 0x20
/* 01D874 80020874 90838340 */  stw       r4, -0x7cc0(r3)
/* 01D878 80020878 90838344 */  stw       r4, -0x7cbc(r3)
/* 01D87C 8002087C 90838348 */  stw       r4, -0x7cb8(r3)
/* 01D880 80020880 9083834C */  stw       r4, -0x7cb4(r3)
/* 01D884 80020884 90838350 */  stw       r4, -0x7cb0(r3)
/* 01D888 80020888 90838354 */  stw       r4, -0x7cac(r3)
/* 01D88C 8002088C 90838358 */  stw       r4, -0x7ca8(r3)
/* 01D890 80020890 9083835C */  stw       r4, -0x7ca4(r3)
/* 01D894 80020894 4200FEC0 */  bdnz      lbl_80020754
/* 01D898 80020898 7FC4F378 */  mr        r4, r30
/* 01D89C 8002089C 38A00000 */  li        r5, 0x0
/* 01D8A0 800208A0 48000004 */  b         lbl_800208A4
lbl_800208A4:
/* 01D8A4 800208A4 38000008 */  li        r0, 0x8
/* 01D8A8 800208A8 7C0903A6 */  mtctr     r0
/* 01D8AC 800208AC 48000004 */  b         lbl_800208B0
lbl_800208B0:
/* 01D8B0 800208B0 48000004 */  b         lbl_800208B4
lbl_800208B4:
/* 01D8B4 800208B4 3C640004 */  addis     r3, r4, 0x4
/* 01D8B8 800208B8 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D8BC 800208BC 38840004 */  addi      r4, r4, 0x4
/* 01D8C0 800208C0 3C640004 */  addis     r3, r4, 0x4
/* 01D8C4 800208C4 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D8C8 800208C8 38840004 */  addi      r4, r4, 0x4
/* 01D8CC 800208CC 3C640004 */  addis     r3, r4, 0x4
/* 01D8D0 800208D0 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D8D4 800208D4 38840004 */  addi      r4, r4, 0x4
/* 01D8D8 800208D8 3C640004 */  addis     r3, r4, 0x4
/* 01D8DC 800208DC 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D8E0 800208E0 38840004 */  addi      r4, r4, 0x4
/* 01D8E4 800208E4 3C640004 */  addis     r3, r4, 0x4
/* 01D8E8 800208E8 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D8EC 800208EC 38840004 */  addi      r4, r4, 0x4
/* 01D8F0 800208F0 3C640004 */  addis     r3, r4, 0x4
/* 01D8F4 800208F4 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D8F8 800208F8 38840004 */  addi      r4, r4, 0x4
/* 01D8FC 800208FC 3C640004 */  addis     r3, r4, 0x4
/* 01D900 80020900 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D904 80020904 38840004 */  addi      r4, r4, 0x4
/* 01D908 80020908 3C640004 */  addis     r3, r4, 0x4
/* 01D90C 8002090C 90A38240 */  stw       r5, -0x7dc0(r3)
/* 01D910 80020910 38840004 */  addi      r4, r4, 0x4
/* 01D914 80020914 4200FFA0 */  bdnz      lbl_800208B4
/* 01D918 80020918 3BE00000 */  li        r31, 0x0
/* 01D91C 8002091C 48000004 */  b         lbl_80020920
lbl_80020920:
/* 01D920 80020920 48000004 */  b         lbl_80020924
lbl_80020924:
/* 01D924 80020924 93FE1C38 */  stw       r31, 0x1c38(r30)
/* 01D928 80020928 387E0020 */  addi      r3, r30, 0x20
/* 01D92C 8002092C 93FE1C3C */  stw       r31, 0x1c3c(r30)
/* 01D930 80020930 93FE1C40 */  stw       r31, 0x1c40(r30)
/* 01D934 80020934 93FE1C44 */  stw       r31, 0x1c44(r30)
/* 01D938 80020938 93FE1C48 */  stw       r31, 0x1c48(r30)
/* 01D93C 8002093C 93FE1C4C */  stw       r31, 0x1c4c(r30)
/* 01D940 80020940 93FE1C50 */  stw       r31, 0x1c50(r30)
/* 01D944 80020944 93FE1C54 */  stw       r31, 0x1c54(r30)
/* 01D948 80020948 93E31C38 */  stw       r31, 0x1c38(r3)
/* 01D94C 8002094C 93E31C3C */  stw       r31, 0x1c3c(r3)
/* 01D950 80020950 93E31C40 */  stw       r31, 0x1c40(r3)
/* 01D954 80020954 93E31C44 */  stw       r31, 0x1c44(r3)
/* 01D958 80020958 93E31C48 */  stw       r31, 0x1c48(r3)
/* 01D95C 8002095C 93E31C4C */  stw       r31, 0x1c4c(r3)
/* 01D960 80020960 93E31C50 */  stw       r31, 0x1c50(r3)
/* 01D964 80020964 93E31C54 */  stw       r31, 0x1c54(r3)
/* 01D968 80020968 38630020 */  addi      r3, r3, 0x20
/* 01D96C 8002096C 93E31C38 */  stw       r31, 0x1c38(r3)
/* 01D970 80020970 93E31C3C */  stw       r31, 0x1c3c(r3)
/* 01D974 80020974 93E31C40 */  stw       r31, 0x1c40(r3)
/* 01D978 80020978 93E31C44 */  stw       r31, 0x1c44(r3)
/* 01D97C 8002097C 93E31C48 */  stw       r31, 0x1c48(r3)
/* 01D980 80020980 93E31C4C */  stw       r31, 0x1c4c(r3)
/* 01D984 80020984 93E31C50 */  stw       r31, 0x1c50(r3)
/* 01D988 80020988 93E31C54 */  stw       r31, 0x1c54(r3)
/* 01D98C 8002098C 38630020 */  addi      r3, r3, 0x20
/* 01D990 80020990 93E31C38 */  stw       r31, 0x1c38(r3)
/* 01D994 80020994 93E31C3C */  stw       r31, 0x1c3c(r3)
/* 01D998 80020998 93E31C40 */  stw       r31, 0x1c40(r3)
/* 01D99C 8002099C 93E31C44 */  stw       r31, 0x1c44(r3)
/* 01D9A0 800209A0 93E31C48 */  stw       r31, 0x1c48(r3)
/* 01D9A4 800209A4 93E31C4C */  stw       r31, 0x1c4c(r3)
/* 01D9A8 800209A8 93E31C50 */  stw       r31, 0x1c50(r3)
/* 01D9AC 800209AC 93E31C54 */  stw       r31, 0x1c54(r3)
/* 01D9B0 800209B0 38630020 */  addi      r3, r3, 0x20
/* 01D9B4 800209B4 93E31C38 */  stw       r31, 0x1c38(r3)
/* 01D9B8 800209B8 93E31C3C */  stw       r31, 0x1c3c(r3)
/* 01D9BC 800209BC 93E31C40 */  stw       r31, 0x1c40(r3)
/* 01D9C0 800209C0 93E31C44 */  stw       r31, 0x1c44(r3)
/* 01D9C4 800209C4 93E31C48 */  stw       r31, 0x1c48(r3)
/* 01D9C8 800209C8 93E31C4C */  stw       r31, 0x1c4c(r3)
/* 01D9CC 800209CC 93E31C50 */  stw       r31, 0x1c50(r3)
/* 01D9D0 800209D0 93E31C54 */  stw       r31, 0x1c54(r3)
/* 01D9D4 800209D4 38630020 */  addi      r3, r3, 0x20
/* 01D9D8 800209D8 93E31C38 */  stw       r31, 0x1c38(r3)
/* 01D9DC 800209DC 93E31C3C */  stw       r31, 0x1c3c(r3)
/* 01D9E0 800209E0 93E31C40 */  stw       r31, 0x1c40(r3)
/* 01D9E4 800209E4 93E31C44 */  stw       r31, 0x1c44(r3)
/* 01D9E8 800209E8 93E31C48 */  stw       r31, 0x1c48(r3)
/* 01D9EC 800209EC 93E31C4C */  stw       r31, 0x1c4c(r3)
/* 01D9F0 800209F0 93E31C50 */  stw       r31, 0x1c50(r3)
/* 01D9F4 800209F4 93E31C54 */  stw       r31, 0x1c54(r3)
/* 01D9F8 800209F8 387E1C18 */  addi      r3, r30, 0x1c18
/* 01D9FC 800209FC 3C803030 */  lis       r4, 0x3030
/* 01DA00 80020A00 4BFE6715 */  bl        xlHeapTake
/* 01DA04 80020A04 2C030000 */  cmpwi     r3, 0x0
/* 01DA08 80020A08 4082000C */  bne       lbl_80020A14
/* 01DA0C 80020A0C 38600000 */  li        r3, 0x0
/* 01DA10 80020A10 480001A8 */  b         lbl_80020BB8
lbl_80020A14:
/* 01DA14 80020A14 7FC3F378 */  mr        r3, r30
/* 01DA18 80020A18 48000004 */  b         lbl_80020A1C
lbl_80020A1C:
/* 01DA1C 80020A1C 38000004 */  li        r0, 0x4
/* 01DA20 80020A20 7C0903A6 */  mtctr     r0
/* 01DA24 80020A24 48000004 */  b         lbl_80020A28
lbl_80020A28:
/* 01DA28 80020A28 48000004 */  b         lbl_80020A2C
lbl_80020A2C:
/* 01DA2C 80020A2C 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DA30 80020A30 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DA34 80020A34 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DA38 80020A38 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DA3C 80020A3C 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DA40 80020A40 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DA44 80020A44 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DA48 80020A48 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DA4C 80020A4C 38630020 */  addi      r3, r3, 0x20
/* 01DA50 80020A50 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DA54 80020A54 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DA58 80020A58 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DA5C 80020A5C 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DA60 80020A60 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DA64 80020A64 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DA68 80020A68 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DA6C 80020A6C 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DA70 80020A70 38630020 */  addi      r3, r3, 0x20
/* 01DA74 80020A74 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DA78 80020A78 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DA7C 80020A7C 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DA80 80020A80 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DA84 80020A84 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DA88 80020A88 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DA8C 80020A8C 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DA90 80020A90 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DA94 80020A94 38630020 */  addi      r3, r3, 0x20
/* 01DA98 80020A98 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DA9C 80020A9C 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DAA0 80020AA0 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DAA4 80020AA4 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DAA8 80020AA8 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DAAC 80020AAC 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DAB0 80020AB0 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DAB4 80020AB4 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DAB8 80020AB8 38630020 */  addi      r3, r3, 0x20
/* 01DABC 80020ABC 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DAC0 80020AC0 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DAC4 80020AC4 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DAC8 80020AC8 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DACC 80020ACC 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DAD0 80020AD0 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DAD4 80020AD4 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DAD8 80020AD8 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DADC 80020ADC 38630020 */  addi      r3, r3, 0x20
/* 01DAE0 80020AE0 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DAE4 80020AE4 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DAE8 80020AE8 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DAEC 80020AEC 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DAF0 80020AF0 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DAF4 80020AF4 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DAF8 80020AF8 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DAFC 80020AFC 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DB00 80020B00 38630020 */  addi      r3, r3, 0x20
/* 01DB04 80020B04 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DB08 80020B08 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DB0C 80020B0C 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DB10 80020B10 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DB14 80020B14 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DB18 80020B18 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DB1C 80020B1C 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DB20 80020B20 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DB24 80020B24 38630020 */  addi      r3, r3, 0x20
/* 01DB28 80020B28 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DB2C 80020B2C 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DB30 80020B30 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DB34 80020B34 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DB38 80020B38 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DB3C 80020B3C 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DB40 80020B40 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DB44 80020B44 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DB48 80020B48 38630020 */  addi      r3, r3, 0x20
/* 01DB4C 80020B4C 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DB50 80020B50 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DB54 80020B54 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DB58 80020B58 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DB5C 80020B5C 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DB60 80020B60 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DB64 80020B64 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DB68 80020B68 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DB6C 80020B6C 38630020 */  addi      r3, r3, 0x20
/* 01DB70 80020B70 93E31CF8 */  stw       r31, 0x1cf8(r3)
/* 01DB74 80020B74 93E31CFC */  stw       r31, 0x1cfc(r3)
/* 01DB78 80020B78 93E31D00 */  stw       r31, 0x1d00(r3)
/* 01DB7C 80020B7C 93E31D04 */  stw       r31, 0x1d04(r3)
/* 01DB80 80020B80 93E31D08 */  stw       r31, 0x1d08(r3)
/* 01DB84 80020B84 93E31D0C */  stw       r31, 0x1d0c(r3)
/* 01DB88 80020B88 93E31D10 */  stw       r31, 0x1d10(r3)
/* 01DB8C 80020B8C 93E31D14 */  stw       r31, 0x1d14(r3)
/* 01DB90 80020B90 38630020 */  addi      r3, r3, 0x20
/* 01DB94 80020B94 4200FE98 */  bdnz      lbl_80020A2C
/* 01DB98 80020B98 387E1C1C */  addi      r3, r30, 0x1c1c
/* 01DB9C 80020B9C 3C803005 */  lis       r4, 0x3005
/* 01DBA0 80020BA0 4BFE6575 */  bl        xlHeapTake
/* 01DBA4 80020BA4 2C030000 */  cmpwi     r3, 0x0
/* 01DBA8 80020BA8 4082000C */  bne       lbl_80020BB4
/* 01DBAC 80020BAC 38600000 */  li        r3, 0x0
/* 01DBB0 80020BB0 48000008 */  b         lbl_80020BB8
lbl_80020BB4:
/* 01DBB4 80020BB4 38600001 */  li        r3, 0x1
lbl_80020BB8:
/* 01DBB8 80020BB8 80010034 */  lwz       r0, 0x34(r1)
/* 01DBBC 80020BBC 83E1002C */  lwz       r31, 0x2c(r1)
/* 01DBC0 80020BC0 83C10028 */  lwz       r30, 0x28(r1)
/* 01DBC4 80020BC4 7C0803A6 */  mtlr      r0
/* 01DBC8 80020BC8 38210030 */  addi      r1, r1, 0x30
/* 01DBCC 80020BCC 4E800020 */  blr

glabel frameMakeTexture
/* 01DBD0 80020BD0 7C0802A6 */  mflr      r0
/* 01DBD4 80020BD4 90010004 */  stw       r0, 0x4(r1)
/* 01DBD8 80020BD8 9421FFF8 */  stwu      r1, -0x8(r1)
/* 01DBDC 80020BDC 7C661B78 */  mr        r6, r3
/* 01DBE0 80020BE0 39000000 */  li        r8, 0x0
/* 01DBE4 80020BE4 48000004 */  b         lbl_80020BE8
lbl_80020BE8:
/* 01DBE8 80020BE8 48000004 */  b         lbl_80020BEC
lbl_80020BEC:
/* 01DBEC 80020BEC 4800000C */  b         lbl_80020BF8
lbl_80020BF0:
/* 01DBF0 80020BF0 38C60004 */  addi      r6, r6, 0x4
/* 01DBF4 80020BF4 39080001 */  addi      r8, r8, 0x1
lbl_80020BF8:
/* 01DBF8 80020BF8 28080040 */  cmplwi    r8, 0x40
/* 01DBFC 80020BFC 40800018 */  bge       lbl_80020C14
/* 01DC00 80020C00 3CA60004 */  addis     r5, r6, 0x4
/* 01DC04 80020C04 80A58240 */  lwz       r5, -0x7dc0(r5)
/* 01DC08 80020C08 3C050001 */  addis     r0, r5, 0x1
/* 01DC0C 80020C0C 2800FFFF */  cmplwi    r0, 0xffff
/* 01DC10 80020C10 4182FFE0 */  beq       lbl_80020BF0
lbl_80020C14:
/* 01DC14 80020C14 28080040 */  cmplwi    r8, 0x40
/* 01DC18 80020C18 40820024 */  bne       lbl_80020C3C
/* 01DC1C 80020C1C 3C60800F */  lis       r3, D_800EC78C@ha
/* 01DC20 80020C20 4CC63182 */  crclr     cr1eq
/* 01DC24 80020C24 3863C78C */  addi      r3, r3, D_800EC78C@l
/* 01DC28 80020C28 388D8178 */  li        r4, D_8018B0F8@sda21
/* 01DC2C 80020C2C 38A0022A */  li        r5, 0x22a
/* 01DC30 80020C30 4BFE5145 */  bl        xlPostText
/* 01DC34 80020C34 38600000 */  li        r3, 0x0
/* 01DC38 80020C38 480000A4 */  b         lbl_80020CDC
lbl_80020C3C:
/* 01DC3C 80020C3C 39200000 */  li        r9, 0x0
/* 01DC40 80020C40 48000004 */  b         lbl_80020C44
lbl_80020C44:
/* 01DC44 80020C44 48000004 */  b         lbl_80020C48
lbl_80020C48:
/* 01DC48 80020C48 4800000C */  b         lbl_80020C54
lbl_80020C4C:
/* 01DC4C 80020C4C 39290001 */  addi      r9, r9, 0x1
/* 01DC50 80020C50 54A5F87E */  srwi      r5, r5, 1
lbl_80020C54:
/* 01DC54 80020C54 54A007FE */  clrlwi    r0, r5, 31
/* 01DC58 80020C58 28000000 */  cmplwi    r0, 0x0
/* 01DC5C 80020C5C 4082FFF0 */  bne       lbl_80020C4C
/* 01DC60 80020C60 55002834 */  slwi      r0, r8, 5
/* 01DC64 80020C64 7C004A14 */  add       r0, r0, r9
/* 01DC68 80020C68 1CA0006C */  mulli     r5, r0, 0x6c
/* 01DC6C 80020C6C 38C00001 */  li        r6, 0x1
/* 01DC70 80020C70 38052240 */  addi      r0, r5, 0x2240
/* 01DC74 80020C74 3CE30004 */  addis     r7, r3, 0x4
/* 01DC78 80020C78 5505103A */  slwi      r5, r8, 2
/* 01DC7C 80020C7C 7D072A14 */  add       r8, r7, r5
/* 01DC80 80020C80 80E88240 */  lwz       r7, -0x7dc0(r8)
/* 01DC84 80020C84 7CC64830 */  slw       r6, r6, r9
/* 01DC88 80020C88 7CA30214 */  add       r5, r3, r0
/* 01DC8C 80020C8C 7CE03378 */  or        r0, r7, r6
/* 01DC90 80020C90 90088240 */  stw       r0, -0x7dc0(r8)
/* 01DC94 80020C94 38C0FFFF */  li        r6, -0x1
/* 01DC98 80020C98 38000000 */  li        r0, 0x0
/* 01DC9C 80020C9C 90A40000 */  stw       r5, 0x0(r4)
/* 01DCA0 80020CA0 80A40000 */  lwz       r5, 0x0(r4)
/* 01DCA4 80020CA4 90C50004 */  stw       r6, 0x4(r5)
/* 01DCA8 80020CA8 80A40000 */  lwz       r5, 0x0(r4)
/* 01DCAC 80020CAC 90C50008 */  stw       r6, 0x8(r5)
/* 01DCB0 80020CB0 80840000 */  lwz       r4, 0x0(r4)
/* 01DCB4 80020CB4 90040020 */  stw       r0, 0x20(r4)
/* 01DCB8 80020CB8 80831C30 */  lwz       r4, 0x1c30(r3)
/* 01DCBC 80020CBC 38840001 */  addi      r4, r4, 0x1
/* 01DCC0 80020CC0 90831C30 */  stw       r4, 0x1c30(r3)
/* 01DCC4 80020CC4 80031C34 */  lwz       r0, 0x1c34(r3)
/* 01DCC8 80020CC8 7C040000 */  cmpw      r4, r0
/* 01DCCC 80020CCC 4081000C */  ble       lbl_80020CD8
/* 01DCD0 80020CD0 80031C30 */  lwz       r0, 0x1c30(r3)
/* 01DCD4 80020CD4 90031C34 */  stw       r0, 0x1c34(r3)
lbl_80020CD8:
/* 01DCD8 80020CD8 38600001 */  li        r3, 0x1
lbl_80020CDC:
/* 01DCDC 80020CDC 8001000C */  lwz       r0, 0xc(r1)
/* 01DCE0 80020CE0 38210008 */  addi      r1, r1, 0x8
/* 01DCE4 80020CE4 7C0803A6 */  mtlr      r0
/* 01DCE8 80020CE8 4E800020 */  blr

glabel packFreeBlocks
/* 01DCEC 80020CEC 81030000 */  lwz       r8, 0x0(r3)
/* 01DCF0 80020CF0 2C08FFFF */  cmpwi     r8, -0x1
/* 01DCF4 80020CF4 4082000C */  bne       lbl_80020D00
/* 01DCF8 80020CF8 38600001 */  li        r3, 0x1
/* 01DCFC 80020CFC 48000054 */  b         lbl_80020D50
lbl_80020D00:
/* 01DD00 80020D00 7D058670 */  srawi     r5, r8, 16
/* 01DD04 80020D04 5500043E */  clrlwi    r0, r8, 16
/* 01DD08 80020D08 7C062E70 */  srawi     r6, r0, 5
/* 01DD0C 80020D0C 38000001 */  li        r0, 0x1
/* 01DD10 80020D10 7C052830 */  slw       r5, r0, r5
/* 01DD14 80020D14 54C6103A */  slwi      r6, r6, 2
/* 01DD18 80020D18 38E5FFFF */  subi      r7, r5, 0x1
/* 01DD1C 80020D1C 7CA4302E */  lwzx      r5, r4, r6
/* 01DD20 80020D20 550006FE */  clrlwi    r0, r8, 27
/* 01DD24 80020D24 7CE70030 */  slw       r7, r7, r0
/* 01DD28 80020D28 7CE02838 */  and       r0, r7, r5
/* 01DD2C 80020D2C 7C070040 */  cmplw     r7, r0
/* 01DD30 80020D30 4082001C */  bne       lbl_80020D4C
/* 01DD34 80020D34 7CA03878 */  andc      r0, r5, r7
/* 01DD38 80020D38 7C04312E */  stwx      r0, r4, r6
/* 01DD3C 80020D3C 3800FFFF */  li        r0, -0x1
/* 01DD40 80020D40 90030000 */  stw       r0, 0x0(r3)
/* 01DD44 80020D44 38600001 */  li        r3, 0x1
/* 01DD48 80020D48 48000008 */  b         lbl_80020D50
lbl_80020D4C:
/* 01DD4C 80020D4C 38600000 */  li        r3, 0x0
lbl_80020D50:
/* 01DD50 80020D50 4E800020 */  blr

glabel packTakeBlocks
/* 01DD54 80020D54 2C060020 */  cmpwi     r6, 0x20
/* 01DD58 80020D58 4080000C */  bge       lbl_80020D64
/* 01DD5C 80020D5C 2C060000 */  cmpwi     r6, 0x0
/* 01DD60 80020D60 4080000C */  bge       lbl_80020D6C
lbl_80020D64:
/* 01DD64 80020D64 38600000 */  li        r3, 0x0
/* 01DD68 80020D68 480000B4 */  b         lbl_80020E1C
lbl_80020D6C:
/* 01DD6C 80020D6C 38000001 */  li        r0, 0x1
/* 01DD70 80020D70 7C073030 */  slw       r7, r0, r6
/* 01DD74 80020D74 7C882378 */  mr        r8, r4
/* 01DD78 80020D78 21460021 */  subfic    r10, r6, 0x21
/* 01DD7C 80020D7C 38E7FFFF */  subi      r7, r7, 0x1
/* 01DD80 80020D80 39600000 */  li        r11, 0x0
/* 01DD84 80020D84 48000004 */  b         lbl_80020D88
lbl_80020D88:
/* 01DD88 80020D88 2C050000 */  cmpwi     r5, 0x0
/* 01DD8C 80020D8C 7CA903A6 */  mtctr     r5
/* 01DD90 80020D90 40810080 */  ble       lbl_80020E10
/* 01DD94 80020D94 48000004 */  b         lbl_80020D98
lbl_80020D98:
/* 01DD98 80020D98 80A80000 */  lwz       r5, 0x0(r8)
/* 01DD9C 80020D9C 3C050001 */  addis     r0, r5, 0x1
/* 01DDA0 80020DA0 2800FFFF */  cmplwi    r0, 0xffff
/* 01DDA4 80020DA4 41820060 */  beq       lbl_80020E04
/* 01DDA8 80020DA8 7CEC3B78 */  mr        r12, r7
/* 01DDAC 80020DAC 7D495378 */  mr        r9, r10
/* 01DDB0 80020DB0 48000004 */  b         lbl_80020DB4
lbl_80020DB4:
/* 01DDB4 80020DB4 48000004 */  b         lbl_80020DB8
lbl_80020DB8:
/* 01DDB8 80020DB8 7CA06038 */  and       r0, r5, r12
/* 01DDBC 80020DBC 28000000 */  cmplwi    r0, 0x0
/* 01DDC0 80020DC0 40820034 */  bne       lbl_80020DF4
/* 01DDC4 80020DC4 5568103A */  slwi      r8, r11, 2
/* 01DDC8 80020DC8 7CE4402E */  lwzx      r7, r4, r8
/* 01DDCC 80020DCC 55652834 */  slwi      r5, r11, 5
/* 01DDD0 80020DD0 7C095050 */  subf      r0, r9, r10
/* 01DDD4 80020DD4 7CE76378 */  or        r7, r7, r12
/* 01DDD8 80020DD8 7CE4412E */  stwx      r7, r4, r8
/* 01DDDC 80020DDC 54C4801E */  slwi      r4, r6, 16
/* 01DDE0 80020DE0 7C050214 */  add       r0, r5, r0
/* 01DDE4 80020DE4 7C800378 */  or        r0, r4, r0
/* 01DDE8 80020DE8 90030000 */  stw       r0, 0x0(r3)
/* 01DDEC 80020DEC 38600001 */  li        r3, 0x1
/* 01DDF0 80020DF0 4800002C */  b         lbl_80020E1C
lbl_80020DF4:
/* 01DDF4 80020DF4 3929FFFF */  subi      r9, r9, 0x1
/* 01DDF8 80020DF8 2C090000 */  cmpwi     r9, 0x0
/* 01DDFC 80020DFC 558C083C */  slwi      r12, r12, 1
/* 01DE00 80020E00 4082FFB8 */  bne       lbl_80020DB8
lbl_80020E04:
/* 01DE04 80020E04 39080004 */  addi      r8, r8, 0x4
/* 01DE08 80020E08 396B0001 */  addi      r11, r11, 0x1
/* 01DE0C 80020E0C 4200FF8C */  bdnz      lbl_80020D98
lbl_80020E10:
/* 01DE10 80020E10 3800FFFF */  li        r0, -0x1
/* 01DE14 80020E14 90030000 */  stw       r0, 0x0(r3)
/* 01DE18 80020E18 38600000 */  li        r3, 0x0
lbl_80020E1C:
/* 01DE1C 80020E1C 4E800020 */  blr

glabel frameConvertYUVtoRGB
/* 01DE20 80020E20 80E30000 */  lwz       r7, 0x0(r3)
/* 01DE24 80020E24 3CA00002 */  lis       r5, 0x2
/* 01DE28 80020E28 80C30004 */  lwz       r6, 0x4(r3)
/* 01DE2C 80020E2C 3805F694 */  subi      r0, r5, 0x96c
/* 01DE30 80020E30 38E7FFF0 */  subi      r7, r7, 0x10
/* 01DE34 80020E34 38A6FF80 */  subi      r5, r6, 0x80
/* 01DE38 80020E38 80630008 */  lwz       r3, 0x8(r3)
/* 01DE3C 80020E3C 1CC5515E */  mulli     r6, r5, 0x515e
/* 01DE40 80020E40 1CA72EEE */  mulli     r5, r7, 0x2eee
/* 01DE44 80020E44 7CA62A14 */  add       r5, r6, r5
/* 01DE48 80020E48 7CA88670 */  srawi     r8, r5, 16
/* 01DE4C 80020E4C 3863FF80 */  subi      r3, r3, 0x80
/* 01DE50 80020E50 1CA831B9 */  mulli     r5, r8, 0x31b9
/* 01DE54 80020E54 1C63E6B0 */  mulli     r3, r3, -0x1950
/* 01DE58 80020E58 1CC72B47 */  mulli     r6, r7, 0x2b47
/* 01DE5C 80020E5C 7C651850 */  subf      r3, r5, r3
/* 01DE60 80020E60 7C661A14 */  add       r3, r6, r3
/* 01DE64 80020E64 7C668670 */  srawi     r6, r3, 16
/* 01DE68 80020E68 7CA601D6 */  mullw     r5, r6, r0
/* 01DE6C 80020E6C 1C68619B */  mulli     r3, r8, 0x619b
/* 01DE70 80020E70 1C077932 */  mulli     r0, r7, 0x7932
/* 01DE74 80020E74 7C030050 */  subf      r0, r3, r0
/* 01DE78 80020E78 7C050050 */  subf      r0, r5, r0
/* 01DE7C 80020E7C 7C008670 */  srawi     r0, r0, 16
/* 01DE80 80020E80 2C00001F */  cmpwi     r0, 0x1f
/* 01DE84 80020E84 7CC53378 */  mr        r5, r6
/* 01DE88 80020E88 4081000C */  ble       lbl_80020E94
/* 01DE8C 80020E8C 3800001F */  li        r0, 0x1f
/* 01DE90 80020E90 48000010 */  b         lbl_80020EA0
lbl_80020E94:
/* 01DE94 80020E94 2C000000 */  cmpwi     r0, 0x0
/* 01DE98 80020E98 40800008 */  bge       lbl_80020EA0
/* 01DE9C 80020E9C 38000000 */  li        r0, 0x0
lbl_80020EA0:
/* 01DEA0 80020EA0 2C05001F */  cmpwi     r5, 0x1f
/* 01DEA4 80020EA4 4081000C */  ble       lbl_80020EB0
/* 01DEA8 80020EA8 38A0001F */  li        r5, 0x1f
/* 01DEAC 80020EAC 48000010 */  b         lbl_80020EBC
lbl_80020EB0:
/* 01DEB0 80020EB0 2C050000 */  cmpwi     r5, 0x0
/* 01DEB4 80020EB4 40800008 */  bge       lbl_80020EBC
/* 01DEB8 80020EB8 38A00000 */  li        r5, 0x0
lbl_80020EBC:
/* 01DEBC 80020EBC 2C08001F */  cmpwi     r8, 0x1f
/* 01DEC0 80020EC0 4081000C */  ble       lbl_80020ECC
/* 01DEC4 80020EC4 3900001F */  li        r8, 0x1f
/* 01DEC8 80020EC8 48000010 */  b         lbl_80020ED8
lbl_80020ECC:
/* 01DECC 80020ECC 2C080000 */  cmpwi     r8, 0x0
/* 01DED0 80020ED0 40800008 */  bge       lbl_80020ED8
/* 01DED4 80020ED4 39000000 */  li        r8, 0x0
lbl_80020ED8:
/* 01DED8 80020ED8 90040000 */  stw       r0, 0x0(r4)
/* 01DEDC 80020EDC 38600001 */  li        r3, 0x1
/* 01DEE0 80020EE0 90A40004 */  stw       r5, 0x4(r4)
/* 01DEE4 80020EE4 91040008 */  stw       r8, 0x8(r4)
/* 01DEE8 80020EE8 4E800020 */  blr

glabel frameScaleMatrix
/* 01DEEC 80020EEC C0040000 */  lfs       f0, 0x0(r4)
/* 01DEF0 80020EF0 EC000072 */  fmuls     f0, f0, f1
/* 01DEF4 80020EF4 D0030000 */  stfs      f0, 0x0(r3)
/* 01DEF8 80020EF8 C0040004 */  lfs       f0, 0x4(r4)
/* 01DEFC 80020EFC EC000072 */  fmuls     f0, f0, f1
/* 01DF00 80020F00 D0030004 */  stfs      f0, 0x4(r3)
/* 01DF04 80020F04 C0040008 */  lfs       f0, 0x8(r4)
/* 01DF08 80020F08 EC000072 */  fmuls     f0, f0, f1
/* 01DF0C 80020F0C D0030008 */  stfs      f0, 0x8(r3)
/* 01DF10 80020F10 C004000C */  lfs       f0, 0xc(r4)
/* 01DF14 80020F14 EC000072 */  fmuls     f0, f0, f1
/* 01DF18 80020F18 D003000C */  stfs      f0, 0xc(r3)
/* 01DF1C 80020F1C C0040010 */  lfs       f0, 0x10(r4)
/* 01DF20 80020F20 EC000072 */  fmuls     f0, f0, f1
/* 01DF24 80020F24 D0030010 */  stfs      f0, 0x10(r3)
/* 01DF28 80020F28 C0040014 */  lfs       f0, 0x14(r4)
/* 01DF2C 80020F2C EC000072 */  fmuls     f0, f0, f1
/* 01DF30 80020F30 D0030014 */  stfs      f0, 0x14(r3)
/* 01DF34 80020F34 C0040018 */  lfs       f0, 0x18(r4)
/* 01DF38 80020F38 EC000072 */  fmuls     f0, f0, f1
/* 01DF3C 80020F3C D0030018 */  stfs      f0, 0x18(r3)
/* 01DF40 80020F40 C004001C */  lfs       f0, 0x1c(r4)
/* 01DF44 80020F44 EC000072 */  fmuls     f0, f0, f1
/* 01DF48 80020F48 D003001C */  stfs      f0, 0x1c(r3)
/* 01DF4C 80020F4C C0040020 */  lfs       f0, 0x20(r4)
/* 01DF50 80020F50 EC000072 */  fmuls     f0, f0, f1
/* 01DF54 80020F54 D0030020 */  stfs      f0, 0x20(r3)
/* 01DF58 80020F58 C0040024 */  lfs       f0, 0x24(r4)
/* 01DF5C 80020F5C EC000072 */  fmuls     f0, f0, f1
/* 01DF60 80020F60 D0030024 */  stfs      f0, 0x24(r3)
/* 01DF64 80020F64 C0040028 */  lfs       f0, 0x28(r4)
/* 01DF68 80020F68 EC000072 */  fmuls     f0, f0, f1
/* 01DF6C 80020F6C D0030028 */  stfs      f0, 0x28(r3)
/* 01DF70 80020F70 C004002C */  lfs       f0, 0x2c(r4)
/* 01DF74 80020F74 EC000072 */  fmuls     f0, f0, f1
/* 01DF78 80020F78 D003002C */  stfs      f0, 0x2c(r3)
/* 01DF7C 80020F7C C0040030 */  lfs       f0, 0x30(r4)
/* 01DF80 80020F80 EC000072 */  fmuls     f0, f0, f1
/* 01DF84 80020F84 D0030030 */  stfs      f0, 0x30(r3)
/* 01DF88 80020F88 C0040034 */  lfs       f0, 0x34(r4)
/* 01DF8C 80020F8C EC000072 */  fmuls     f0, f0, f1
/* 01DF90 80020F90 D0030034 */  stfs      f0, 0x34(r3)
/* 01DF94 80020F94 C0040038 */  lfs       f0, 0x38(r4)
/* 01DF98 80020F98 EC000072 */  fmuls     f0, f0, f1
/* 01DF9C 80020F9C D0030038 */  stfs      f0, 0x38(r3)
/* 01DFA0 80020FA0 C004003C */  lfs       f0, 0x3c(r4)
/* 01DFA4 80020FA4 EC000072 */  fmuls     f0, f0, f1
/* 01DFA8 80020FA8 D003003C */  stfs      f0, 0x3c(r3)
/* 01DFAC 80020FAC 38600001 */  li        r3, 0x1
/* 01DFB0 80020FB0 4E800020 */  blr

glabel frameEvent
/* 01DFB4 80020FB4 7C0802A6 */  mflr      r0
/* 01DFB8 80020FB8 90010004 */  stw       r0, 0x4(r1)
/* 01DFBC 80020FBC 9421FFC0 */  stwu      r1, -0x40(r1)
/* 01DFC0 80020FC0 93E1003C */  stw       r31, 0x3c(r1)
/* 01DFC4 80020FC4 93C10038 */  stw       r30, 0x38(r1)
/* 01DFC8 80020FC8 93A10034 */  stw       r29, 0x34(r1)
/* 01DFCC 80020FCC 93810030 */  stw       r28, 0x30(r1)
/* 01DFD0 80020FD0 7C7F1B78 */  mr        r31, r3
/* 01DFD4 80020FD4 2C040003 */  cmpwi     r4, 0x3
/* 01DFD8 80020FD8 418201F0 */  beq       lbl_800211C8
/* 01DFDC 80020FDC 40800018 */  bge       lbl_80020FF4
/* 01DFE0 80020FE0 2C040002 */  cmpwi     r4, 0x2
/* 01DFE4 80020FE4 40800024 */  bge       lbl_80021008
/* 01DFE8 80020FE8 2C040000 */  cmpwi     r4, 0x0
/* 01DFEC 80020FEC 40800228 */  bge       lbl_80021214
/* 01DFF0 80020FF0 4800021C */  b         lbl_8002120C
lbl_80020FF4:
/* 01DFF4 80020FF4 2C040007 */  cmpwi     r4, 0x7
/* 01DFF8 80020FF8 40800214 */  bge       lbl_8002120C
/* 01DFFC 80020FFC 2C040005 */  cmpwi     r4, 0x5
/* 01E000 80021000 40800214 */  bge       lbl_80021214
/* 01E004 80021004 48000208 */  b         lbl_8002120C
lbl_80021008:
/* 01E008 80021008 3B800000 */  li        r28, 0x0
/* 01E00C 8002100C 939F007C */  stw       r28, 0x7c(r31)
/* 01E010 80021010 3C000002 */  lis       r0, 0x2
/* 01E014 80021014 3FBF0004 */  addis     r29, r31, 0x4
/* 01E018 80021018 901F008C */  stw       r0, 0x8c(r31)
/* 01E01C 8002101C 3BC00001 */  li        r30, 0x1
/* 01E020 80021020 7FE3FB78 */  mr        r3, r31
/* 01E024 80021024 939DC4C8 */  stw       r28, -0x3b38(r29)
/* 01E028 80021028 939F0088 */  stw       r28, 0x88(r31)
/* 01E02C 8002102C 93CD899C */  stw       r30, D_8018B91C@sda21(r0)
/* 01E030 80021030 938D8998 */  stw       r28, D_8018B918@sda21(r0)
/* 01E034 80021034 938D89D0 */  stw       r28, D_8018B950@sda21(r0)
/* 01E038 80021038 4BFFF6D1 */  bl        frameSetupCache
/* 01E03C 8002103C 2C030000 */  cmpwi     r3, 0x0
/* 01E040 80021040 4082000C */  bne       lbl_8002104C
/* 01E044 80021044 38600000 */  li        r3, 0x0
/* 01E048 80021048 480001D0 */  b         lbl_80021218
lbl_8002104C:
/* 01E04C 8002104C 3800FFFF */  li        r0, -0x1
/* 01E050 80021050 901F0118 */  stw       r0, 0x118(r31)
/* 01E054 80021054 38A000AA */  li        r5, 0xaa
/* 01E058 80021058 38800140 */  li        r4, 0x140
/* 01E05C 8002105C 901F011C */  stw       r0, 0x11c(r31)
/* 01E060 80021060 380000F0 */  li        r0, 0xf0
/* 01E064 80021064 3C604330 */  lis       r3, 0x4330
/* 01E068 80021068 C0028100 */  lfs       f0, D_8018C040@sda21(r0)
/* 01E06C 8002106C D01F00B8 */  stfs      f0, 0xb8(r31)
/* 01E070 80021070 D01F00BC */  stfs      f0, 0xbc(r31)
/* 01E074 80021074 939F002C */  stw       r28, 0x2c(r31)
/* 01E078 80021078 939F0024 */  stw       r28, 0x24(r31)
/* 01E07C 8002107C 939F0028 */  stw       r28, 0x28(r31)
/* 01E080 80021080 939F0030 */  stw       r28, 0x30(r31)
/* 01E084 80021084 B39F0020 */  sth       r28, 0x20(r31)
/* 01E088 80021088 939F0034 */  stw       r28, 0x34(r31)
/* 01E08C 8002108C 939F0038 */  stw       r28, 0x38(r31)
/* 01E090 80021090 939F003C */  stw       r28, 0x3c(r31)
/* 01E094 80021094 939F0040 */  stw       r28, 0x40(r31)
/* 01E098 80021098 939F0048 */  stw       r28, 0x48(r31)
/* 01E09C 8002109C 98BF004C */  stb       r5, 0x4c(r31)
/* 01E0A0 800210A0 939F0050 */  stw       r28, 0x50(r31)
/* 01E0A4 800210A4 939F0054 */  stw       r28, 0x54(r31)
/* 01E0A8 800210A8 939F0060 */  stw       r28, 0x60(r31)
/* 01E0AC 800210AC 939F0064 */  stw       r28, 0x64(r31)
/* 01E0B0 800210B0 939F0068 */  stw       r28, 0x68(r31)
/* 01E0B4 800210B4 939F006C */  stw       r28, 0x6c(r31)
/* 01E0B8 800210B8 939F0058 */  stw       r28, 0x58(r31)
/* 01E0BC 800210BC 939F005C */  stw       r28, 0x5c(r31)
/* 01E0C0 800210C0 C0028160 */  lfs       f0, D_8018C0A0@sda21(r0)
/* 01E0C4 800210C4 D01F00C0 */  stfs      f0, 0xc0(r31)
/* 01E0C8 800210C8 C0028164 */  lfs       f0, D_8018C0A4@sda21(r0)
/* 01E0CC 800210CC D01F00C4 */  stfs      f0, 0xc4(r31)
/* 01E0D0 800210D0 909DC4B8 */  stw       r4, -0x3b48(r29)
/* 01E0D4 800210D4 901DC4C0 */  stw       r0, -0x3b40(r29)
/* 01E0D8 800210D8 801DC4BC */  lwz       r0, -0x3b44(r29)
/* 01E0DC 800210DC C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 01E0E0 800210E0 6C008000 */  xoris     r0, r0, 0x8000
/* 01E0E4 800210E4 C0028168 */  lfs       f0, D_8018C0A8@sda21(r0)
/* 01E0E8 800210E8 9001002C */  stw       r0, 0x2c(r1)
/* 01E0EC 800210EC 90610028 */  stw       r3, 0x28(r1)
/* 01E0F0 800210F0 C8210028 */  lfd       f1, 0x28(r1)
/* 01E0F4 800210F4 EC211028 */  fsubs     f1, f1, f2
/* 01E0F8 800210F8 EC010024 */  fdivs     f0, f1, f0
/* 01E0FC 800210FC D01F0080 */  stfs      f0, 0x80(r31)
/* 01E100 80021100 801DC4C4 */  lwz       r0, -0x3b3c(r29)
/* 01E104 80021104 C002816C */  lfs       f0, D_8018C0AC@sda21(r0)
/* 01E108 80021108 6C008000 */  xoris     r0, r0, 0x8000
/* 01E10C 8002110C 90010024 */  stw       r0, 0x24(r1)
/* 01E110 80021110 90610020 */  stw       r3, 0x20(r1)
/* 01E114 80021114 C8210020 */  lfd       f1, 0x20(r1)
/* 01E118 80021118 EC211028 */  fsubs     f1, f1, f2
/* 01E11C 8002111C EC010024 */  fdivs     f0, f1, f0
/* 01E120 80021120 D01F0084 */  stfs      f0, 0x84(r31)
/* 01E124 80021124 4BFE4719 */  bl        xlCoreHiResolution
/* 01E128 80021128 2C030000 */  cmpwi     r3, 0x0
/* 01E12C 8002112C 41820008 */  beq       lbl_80021134
/* 01E130 80021130 48000008 */  b         lbl_80021138
lbl_80021134:
/* 01E134 80021134 7FDCF378 */  mr        r28, r30
lbl_80021138:
/* 01E138 80021138 380001E0 */  li        r0, 0x1e0
/* 01E13C 8002113C 7C04E630 */  sraw      r4, r0, r28
/* 01E140 80021140 2C040000 */  cmpwi     r4, 0x0
/* 01E144 80021144 40810074 */  ble       lbl_800211B8
/* 01E148 80021148 3CBF0004 */  addis     r5, r31, 0x4
/* 01E14C 8002114C 38000280 */  li        r0, 0x280
/* 01E150 80021150 9005C4BC */  stw       r0, -0x3b44(r5)
/* 01E154 80021154 6C808000 */  xoris     r0, r4, 0x8000
/* 01E158 80021158 3C604330 */  lis       r3, 0x4330
/* 01E15C 8002115C 9085C4C4 */  stw       r4, -0x3b3c(r5)
/* 01E160 80021160 8085C4B8 */  lwz       r4, -0x3b48(r5)
/* 01E164 80021164 9001002C */  stw       r0, 0x2c(r1)
/* 01E168 80021168 6C808000 */  xoris     r0, r4, 0x8000
/* 01E16C 8002116C C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 01E170 80021170 90010024 */  stw       r0, 0x24(r1)
/* 01E174 80021174 C0628160 */  lfs       f3, D_8018C0A0@sda21(r0)
/* 01E178 80021178 90610020 */  stw       r3, 0x20(r1)
/* 01E17C 8002117C C8010020 */  lfd       f0, 0x20(r1)
/* 01E180 80021180 90610028 */  stw       r3, 0x28(r1)
/* 01E184 80021184 EC201028 */  fsubs     f1, f0, f2
/* 01E188 80021188 C8010028 */  lfd       f0, 0x28(r1)
/* 01E18C 8002118C EC230824 */  fdivs     f1, f3, f1
/* 01E190 80021190 D03F0080 */  stfs      f1, 0x80(r31)
/* 01E194 80021194 EC201028 */  fsubs     f1, f0, f2
/* 01E198 80021198 8005C4C0 */  lwz       r0, -0x3b40(r5)
/* 01E19C 8002119C 6C008000 */  xoris     r0, r0, 0x8000
/* 01E1A0 800211A0 9001001C */  stw       r0, 0x1c(r1)
/* 01E1A4 800211A4 90610018 */  stw       r3, 0x18(r1)
/* 01E1A8 800211A8 C8010018 */  lfd       f0, 0x18(r1)
/* 01E1AC 800211AC EC001028 */  fsubs     f0, f0, f2
/* 01E1B0 800211B0 EC010024 */  fdivs     f0, f1, f0
/* 01E1B4 800211B4 D01F0084 */  stfs      f0, 0x84(r31)
lbl_800211B8:
/* 01E1B8 800211B8 3C608003 */  lis       r3, frameDrawDone@ha
/* 01E1BC 800211BC 3863BF4C */  addi      r3, r3, frameDrawDone@l
/* 01E1C0 800211C0 48088BC5 */  bl        fn_800A9D84
/* 01E1C4 800211C4 48000050 */  b         lbl_80021214
lbl_800211C8:
/* 01E1C8 800211C8 387F1C1C */  addi      r3, r31, 0x1c1c
/* 01E1CC 800211CC 4BFE5E2D */  bl        xlHeapFree
/* 01E1D0 800211D0 2C030000 */  cmpwi     r3, 0x0
/* 01E1D4 800211D4 4082000C */  bne       lbl_800211E0
/* 01E1D8 800211D8 38000000 */  li        r0, 0x0
/* 01E1DC 800211DC 48000020 */  b         lbl_800211FC
lbl_800211E0:
/* 01E1E0 800211E0 387F1C18 */  addi      r3, r31, 0x1c18
/* 01E1E4 800211E4 4BFE5E15 */  bl        xlHeapFree
/* 01E1E8 800211E8 2C030000 */  cmpwi     r3, 0x0
/* 01E1EC 800211EC 4082000C */  bne       lbl_800211F8
/* 01E1F0 800211F0 38000000 */  li        r0, 0x0
/* 01E1F4 800211F4 48000008 */  b         lbl_800211FC
lbl_800211F8:
/* 01E1F8 800211F8 38000001 */  li        r0, 0x1
lbl_800211FC:
/* 01E1FC 800211FC 2C000000 */  cmpwi     r0, 0x0
/* 01E200 80021200 40820014 */  bne       lbl_80021214
/* 01E204 80021204 38600000 */  li        r3, 0x0
/* 01E208 80021208 48000010 */  b         lbl_80021218
lbl_8002120C:
/* 01E20C 8002120C 38600000 */  li        r3, 0x0
/* 01E210 80021210 48000008 */  b         lbl_80021218
lbl_80021214:
/* 01E214 80021214 38600001 */  li        r3, 0x1
lbl_80021218:
/* 01E218 80021218 80010044 */  lwz       r0, 0x44(r1)
/* 01E21C 8002121C 83E1003C */  lwz       r31, 0x3c(r1)
/* 01E220 80021220 83C10038 */  lwz       r30, 0x38(r1)
/* 01E224 80021224 7C0803A6 */  mtlr      r0
/* 01E228 80021228 83A10034 */  lwz       r29, 0x34(r1)
/* 01E22C 8002122C 83810030 */  lwz       r28, 0x30(r1)
/* 01E230 80021230 38210040 */  addi      r1, r1, 0x40
/* 01E234 80021234 4E800020 */  blr

glabel frameGetDepth
/* 01E238 80021238 9421FF90 */  stwu      r1, -0x70(r1)
/* 01E23C 8002123C 3CC0800D */  lis       r6, D_800D1DA0@ha
/* 01E240 80021240 38E61DA0 */  addi      r7, r6, D_800D1DA0@l
/* 01E244 80021244 80C70000 */  lwz       r6, 0x0(r7)
/* 01E248 80021248 54A801BE */  clrlwi    r8, r5, 6
/* 01E24C 8002124C 80070004 */  lwz       r0, 0x4(r7)
/* 01E250 80021250 90C10014 */  stw       r6, 0x14(r1)
/* 01E254 80021254 90010018 */  stw       r0, 0x18(r1)
/* 01E258 80021258 80A70008 */  lwz       r5, 0x8(r7)
/* 01E25C 8002125C 8007000C */  lwz       r0, 0xc(r7)
/* 01E260 80021260 90A1001C */  stw       r5, 0x1c(r1)
/* 01E264 80021264 90010020 */  stw       r0, 0x20(r1)
/* 01E268 80021268 80A70010 */  lwz       r5, 0x10(r7)
/* 01E26C 8002126C 80070014 */  lwz       r0, 0x14(r7)
/* 01E270 80021270 90A10024 */  stw       r5, 0x24(r1)
/* 01E274 80021274 90010028 */  stw       r0, 0x28(r1)
/* 01E278 80021278 80A70018 */  lwz       r5, 0x18(r7)
/* 01E27C 8002127C 8007001C */  lwz       r0, 0x1c(r7)
/* 01E280 80021280 90A1002C */  stw       r5, 0x2c(r1)
/* 01E284 80021284 90010030 */  stw       r0, 0x30(r1)
/* 01E288 80021288 80A70020 */  lwz       r5, 0x20(r7)
/* 01E28C 8002128C 80070024 */  lwz       r0, 0x24(r7)
/* 01E290 80021290 90A10034 */  stw       r5, 0x34(r1)
/* 01E294 80021294 90010038 */  stw       r0, 0x38(r1)
/* 01E298 80021298 80A70028 */  lwz       r5, 0x28(r7)
/* 01E29C 8002129C 8007002C */  lwz       r0, 0x2c(r7)
/* 01E2A0 800212A0 90A1003C */  stw       r5, 0x3c(r1)
/* 01E2A4 800212A4 90010040 */  stw       r0, 0x40(r1)
/* 01E2A8 800212A8 80A70030 */  lwz       r5, 0x30(r7)
/* 01E2AC 800212AC 80070034 */  lwz       r0, 0x34(r7)
/* 01E2B0 800212B0 90A10044 */  stw       r5, 0x44(r1)
/* 01E2B4 800212B4 90010048 */  stw       r0, 0x48(r1)
/* 01E2B8 800212B8 80A70038 */  lwz       r5, 0x38(r7)
/* 01E2BC 800212BC 8007003C */  lwz       r0, 0x3c(r7)
/* 01E2C0 800212C0 90A1004C */  stw       r5, 0x4c(r1)
/* 01E2C4 800212C4 90010050 */  stw       r0, 0x50(r1)
/* 01E2C8 800212C8 80A30118 */  lwz       r5, 0x118(r3)
/* 01E2CC 800212CC 7C054040 */  cmplw     r5, r8
/* 01E2D0 800212D0 418101CC */  bgt       lbl_8002149C
/* 01E2D4 800212D4 8003011C */  lwz       r0, 0x11c(r3)
/* 01E2D8 800212D8 7C080040 */  cmplw     r8, r0
/* 01E2DC 800212DC 418101C0 */  bgt       lbl_8002149C
/* 01E2E0 800212E0 7C054050 */  subf      r0, r5, r8
/* 01E2E4 800212E4 C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 01E2E8 800212E8 3C60CCCD */  lis       r3, 0xcccd
/* 01E2EC 800212EC C8628178 */  lfd       f3, D_8018C0B8@sda21(r0)
/* 01E2F0 800212F0 5405F87E */  srwi      r5, r0, 1
/* 01E2F4 800212F4 C8028170 */  lfd       f0, D_8018C0B0@sda21(r0)
/* 01E2F8 800212F8 3803CCCD */  subi      r0, r3, 0x3333
/* 01E2FC 800212FC 7C602816 */  mulhwu    r3, r0, r5
/* 01E300 80021300 7C002816 */  mulhwu    r0, r0, r5
/* 01E304 80021304 5408C23E */  srwi      r8, r0, 8
/* 01E308 80021308 5463C23E */  srwi      r3, r3, 8
/* 01E30C 8002130C 1C030140 */  mulli     r0, r3, 0x140
/* 01E310 80021310 7CE02850 */  subf      r7, r0, r5
/* 01E314 80021314 5506F0BE */  srwi      r6, r8, 2
/* 01E318 80021318 3CA08011 */  lis       r5, D_80109920@ha
/* 01E31C 8002131C 550307BE */  clrlwi    r3, r8, 30
/* 01E320 80021320 54E007BE */  clrlwi    r0, r7, 30
/* 01E324 80021324 1CC60050 */  mulli     r6, r6, 0x50
/* 01E328 80021328 54E7F0BE */  srwi      r7, r7, 2
/* 01E32C 8002132C 7CC73214 */  add       r6, r7, r6
/* 01E330 80021330 54C62834 */  slwi      r6, r6, 5
/* 01E334 80021334 38A59920 */  addi      r5, r5, D_80109920@l
/* 01E338 80021338 7CA53214 */  add       r5, r5, r6
/* 01E33C 8002133C 54631838 */  slwi      r3, r3, 3
/* 01E340 80021340 7C651A14 */  add       r3, r5, r3
/* 01E344 80021344 5400083C */  slwi      r0, r0, 1
/* 01E348 80021348 7C630214 */  add       r3, r3, r0
/* 01E34C 8002134C A0E30000 */  lhz       r7, 0x0(r3)
/* 01E350 80021350 3C004330 */  lis       r0, 0x4330
/* 01E354 80021354 3C600004 */  lis       r3, 0x4
/* 01E358 80021358 54E5063E */  clrlwi    r5, r7, 24
/* 01E35C 8002135C 54A6402E */  slwi      r6, r5, 8
/* 01E360 80021360 7CE54670 */  srawi     r5, r7, 8
/* 01E364 80021364 7CC52B78 */  or        r5, r6, r5
/* 01E368 80021368 3CA5FFFF */  subis     r5, r5, 0x1
/* 01E36C 8002136C 38A50001 */  addi      r5, r5, 0x1
/* 01E370 80021370 6CA58000 */  xoris     r5, r5, 0x8000
/* 01E374 80021374 90A1006C */  stw       r5, 0x6c(r1)
/* 01E378 80021378 3863F800 */  subi      r3, r3, 0x800
/* 01E37C 8002137C 38E00007 */  li        r7, 0x7
/* 01E380 80021380 90010068 */  stw       r0, 0x68(r1)
/* 01E384 80021384 C8210068 */  lfd       f1, 0x68(r1)
/* 01E388 80021388 FC211028 */  fsub      f1, f1, f2
/* 01E38C 8002138C FC03007A */  fmadd     f0, f3, f1, f0
/* 01E390 80021390 FC00001E */  fctiwz    f0, f0
/* 01E394 80021394 D8010060 */  stfd      f0, 0x60(r1)
/* 01E398 80021398 80C10064 */  lwz       r6, 0x64(r1)
/* 01E39C 8002139C 48000004 */  b         lbl_800213A0
lbl_800213A0:
/* 01E3A0 800213A0 48000004 */  b         lbl_800213A4
lbl_800213A4:
/* 01E3A4 800213A4 7C603038 */  and       r0, r3, r6
/* 01E3A8 800213A8 7C030000 */  cmpw      r3, r0
/* 01E3AC 800213AC 418200B0 */  beq       lbl_8002145C
/* 01E3B0 800213B0 5460083C */  slwi      r0, r3, 1
/* 01E3B4 800213B4 540303BE */  clrlwi    r3, r0, 14
/* 01E3B8 800213B8 38E00006 */  li        r7, 0x6
/* 01E3BC 800213BC 7C603038 */  and       r0, r3, r6
/* 01E3C0 800213C0 7C030000 */  cmpw      r3, r0
/* 01E3C4 800213C4 41820098 */  beq       lbl_8002145C
/* 01E3C8 800213C8 5460083C */  slwi      r0, r3, 1
/* 01E3CC 800213CC 540303BE */  clrlwi    r3, r0, 14
/* 01E3D0 800213D0 38E00005 */  li        r7, 0x5
/* 01E3D4 800213D4 7C603038 */  and       r0, r3, r6
/* 01E3D8 800213D8 7C030000 */  cmpw      r3, r0
/* 01E3DC 800213DC 41820080 */  beq       lbl_8002145C
/* 01E3E0 800213E0 5460083C */  slwi      r0, r3, 1
/* 01E3E4 800213E4 540303BE */  clrlwi    r3, r0, 14
/* 01E3E8 800213E8 38E00004 */  li        r7, 0x4
/* 01E3EC 800213EC 7C603038 */  and       r0, r3, r6
/* 01E3F0 800213F0 7C030000 */  cmpw      r3, r0
/* 01E3F4 800213F4 41820068 */  beq       lbl_8002145C
/* 01E3F8 800213F8 5460083C */  slwi      r0, r3, 1
/* 01E3FC 800213FC 540303BE */  clrlwi    r3, r0, 14
/* 01E400 80021400 38E00003 */  li        r7, 0x3
/* 01E404 80021404 7C603038 */  and       r0, r3, r6
/* 01E408 80021408 7C030000 */  cmpw      r3, r0
/* 01E40C 8002140C 41820050 */  beq       lbl_8002145C
/* 01E410 80021410 5460083C */  slwi      r0, r3, 1
/* 01E414 80021414 540303BE */  clrlwi    r3, r0, 14
/* 01E418 80021418 38E00002 */  li        r7, 0x2
/* 01E41C 8002141C 7C603038 */  and       r0, r3, r6
/* 01E420 80021420 7C030000 */  cmpw      r3, r0
/* 01E424 80021424 41820038 */  beq       lbl_8002145C
/* 01E428 80021428 5460083C */  slwi      r0, r3, 1
/* 01E42C 8002142C 540303BE */  clrlwi    r3, r0, 14
/* 01E430 80021430 38E00001 */  li        r7, 0x1
/* 01E434 80021434 7C603038 */  and       r0, r3, r6
/* 01E438 80021438 7C030000 */  cmpw      r3, r0
/* 01E43C 8002143C 41820020 */  beq       lbl_8002145C
/* 01E440 80021440 5460083C */  slwi      r0, r3, 1
/* 01E444 80021444 540303BE */  clrlwi    r3, r0, 14
/* 01E448 80021448 38E00000 */  li        r7, 0x0
/* 01E44C 8002144C 7C603038 */  and       r0, r3, r6
/* 01E450 80021450 7C030000 */  cmpw      r3, r0
/* 01E454 80021454 41820008 */  beq       lbl_8002145C
/* 01E458 80021458 38E0FFFF */  li        r7, -0x1
lbl_8002145C:
/* 01E45C 8002145C 54E01838 */  slwi      r0, r7, 3
/* 01E460 80021460 38A10018 */  addi      r5, r1, 0x18
/* 01E464 80021464 38610014 */  addi      r3, r1, 0x14
/* 01E468 80021468 7CA5002E */  lwzx      r5, r5, r0
/* 01E46C 8002146C 7C63002E */  lwzx      r3, r3, r0
/* 01E470 80021470 38000000 */  li        r0, 0x0
/* 01E474 80021474 7CA53050 */  subf      r5, r5, r6
/* 01E478 80021478 7CA31E30 */  sraw      r3, r5, r3
/* 01E47C 8002147C B0040000 */  sth       r0, 0x0(r4)
/* 01E480 80021480 5460057E */  clrlwi    r0, r3, 21
/* 01E484 80021484 54E36C24 */  clrlslwi  r3, r7, 29, 13
/* 01E488 80021488 540014FA */  clrlslwi  r0, r0, 21, 2
/* 01E48C 8002148C 7C600378 */  or        r0, r3, r0
/* 01E490 80021490 B0040000 */  sth       r0, 0x0(r4)
/* 01E494 80021494 38600001 */  li        r3, 0x1
/* 01E498 80021498 48000008 */  b         lbl_800214A0
lbl_8002149C:
/* 01E49C 8002149C 38600000 */  li        r3, 0x0
lbl_800214A0:
/* 01E4A0 800214A0 38210070 */  addi      r1, r1, 0x70
/* 01E4A4 800214A4 4E800020 */  blr

glabel frameHackCIMG_Panel
/* 01E4A8 800214A8 7C0802A6 */  mflr      r0
/* 01E4AC 800214AC 90010004 */  stw       r0, 0x4(r1)
/* 01E4B0 800214B0 9421FEC8 */  stwu      r1, -0x138(r1)
/* 01E4B4 800214B4 BDC100F0 */  stmw      r14, 0xf0(r1)
/* 01E4B8 800214B8 7C7D1B78 */  mr        r29, r3
/* 01E4BC 800214BC 7C9E2378 */  mr        r30, r4
/* 01E4C0 800214C0 7CCE3378 */  mr        r14, r6
/* 01E4C4 800214C4 80650010 */  lwz       r3, 0x10(r5)
/* 01E4C8 800214C8 3CC0800F */  lis       r6, 0x800f
/* 01E4CC 800214CC 809D0008 */  lwz       r4, 0x8(r29)
/* 01E4D0 800214D0 38C6BCF0 */  subi      r6, r6, 0x4310
/* 01E4D4 800214D4 3C03FFCB */  subis     r0, r3, 0x35
/* 01E4D8 800214D8 28008800 */  cmplwi    r0, 0x8800
/* 01E4DC 800214DC 82240034 */  lwz       r17, 0x34(r4)
/* 01E4E0 800214E0 83EE0000 */  lwz       r31, 0x0(r14)
/* 01E4E4 800214E4 40820718 */  bne       lbl_80021BFC
/* 01E4E8 800214E8 38000001 */  li        r0, 0x1
/* 01E4EC 800214EC 901E006C */  stw       r0, 0x6c(r30)
/* 01E4F0 800214F0 3C608016 */  lis       r3, 0x8016
/* 01E4F4 800214F4 380317B0 */  addi      r0, r3, 0x17b0
/* 01E4F8 800214F8 80BF0038 */  lwz       r5, 0x38(r31)
/* 01E4FC 800214FC 7C1C0378 */  mr        r28, r0
/* 01E500 80021500 809F003C */  lwz       r4, 0x3c(r31)
/* 01E504 80021504 39FE00DC */  addi      r15, r30, 0xdc
/* 01E508 80021508 54A05F7E */  extrwi    r0, r5, 3, 8
/* 01E50C 8002150C 900F0008 */  stw       r0, 0x8(r15)
/* 01E510 80021510 54A06FBE */  extrwi    r0, r5, 2, 11
/* 01E514 80021514 54A3053E */  clrlwi    r3, r5, 20
/* 01E518 80021518 900F0000 */  stw       r0, 0x0(r15)
/* 01E51C 8002151C 38630001 */  addi      r3, r3, 0x1
/* 01E520 80021520 5480473E */  extrwi    r0, r4, 4, 4
/* 01E524 80021524 906F0004 */  stw       r3, 0x4(r15)
/* 01E528 80021528 5403103A */  slwi      r3, r0, 2
/* 01E52C 8002152C 5480023E */  clrlwi    r0, r4, 8
/* 01E530 80021530 80BD0008 */  lwz       r5, 0x8(r29)
/* 01E534 80021534 38633928 */  addi      r3, r3, 0x3928
/* 01E538 80021538 388F000C */  addi      r4, r15, 0xc
/* 01E53C 8002153C 80A50034 */  lwz       r5, 0x34(r5)
/* 01E540 80021540 38C00000 */  li        r6, 0x0
/* 01E544 80021544 7C65182E */  lwzx      r3, r5, r3
/* 01E548 80021548 7C030214 */  add       r0, r3, r0
/* 01E54C 8002154C 900F0010 */  stw       r0, 0x10(r15)
/* 01E550 80021550 7C050378 */  mr        r5, r0
/* 01E554 80021554 807D0008 */  lwz       r3, 0x8(r29)
/* 01E558 80021558 8063002C */  lwz       r3, 0x2c(r3)
/* 01E55C 8002155C 4804B3B5 */  bl        ramGetBuffer
/* 01E560 80021560 2C030000 */  cmpwi     r3, 0x0
/* 01E564 80021564 4082000C */  bne       lbl_80021570
/* 01E568 80021568 38600000 */  li        r3, 0x0
/* 01E56C 8002156C 48001774 */  b         lbl_80022CE0
lbl_80021570:
/* 01E570 80021570 801F005C */  lwz       r0, 0x5c(r31)
/* 01E574 80021574 7FC3F378 */  mr        r3, r30
/* 01E578 80021578 5405477E */  extrwi    r5, r0, 3, 5
/* 01E57C 8002157C 540495BE */  extrwi    r4, r0, 10, 8
/* 01E580 80021580 4BFFD3D1 */  bl        frameLoadTLUT
/* 01E584 80021584 2C030000 */  cmpwi     r3, 0x0
/* 01E588 80021588 4082000C */  bne       lbl_80021594
/* 01E58C 8002158C 38600000 */  li        r3, 0x0
/* 01E590 80021590 48001750 */  b         lbl_80022CE0
lbl_80021594:
/* 01E594 80021594 807F0080 */  lwz       r3, 0x80(r31)
/* 01E598 80021598 388F000C */  addi      r4, r15, 0xc
/* 01E59C 8002159C 80FF0084 */  lwz       r7, 0x84(r31)
/* 01E5A0 800215A0 38C00000 */  li        r6, 0x0
/* 01E5A4 800215A4 821E00E8 */  lwz       r16, 0xe8(r30)
/* 01E5A8 800215A8 54605F7E */  extrwi    r0, r3, 3, 8
/* 01E5AC 800215AC 900F0008 */  stw       r0, 0x8(r15)
/* 01E5B0 800215B0 54606FBE */  extrwi    r0, r3, 2, 11
/* 01E5B4 800215B4 5463053E */  clrlwi    r3, r3, 20
/* 01E5B8 800215B8 900F0000 */  stw       r0, 0x0(r15)
/* 01E5BC 800215BC 38630001 */  addi      r3, r3, 0x1
/* 01E5C0 800215C0 54E0473E */  extrwi    r0, r7, 4, 4
/* 01E5C4 800215C4 906F0004 */  stw       r3, 0x4(r15)
/* 01E5C8 800215C8 5403103A */  slwi      r3, r0, 2
/* 01E5CC 800215CC 38633928 */  addi      r3, r3, 0x3928
/* 01E5D0 800215D0 80BD0008 */  lwz       r5, 0x8(r29)
/* 01E5D4 800215D4 54E0023E */  clrlwi    r0, r7, 8
/* 01E5D8 800215D8 80A50034 */  lwz       r5, 0x34(r5)
/* 01E5DC 800215DC 7C65182E */  lwzx      r3, r5, r3
/* 01E5E0 800215E0 7CA30214 */  add       r5, r3, r0
/* 01E5E4 800215E4 90AF0010 */  stw       r5, 0x10(r15)
/* 01E5E8 800215E8 807D0008 */  lwz       r3, 0x8(r29)
/* 01E5EC 800215EC 8063002C */  lwz       r3, 0x2c(r3)
/* 01E5F0 800215F0 4804B321 */  bl        ramGetBuffer
/* 01E5F4 800215F4 2C030000 */  cmpwi     r3, 0x0
/* 01E5F8 800215F8 4082000C */  bne       lbl_80021604
/* 01E5FC 800215FC 38600000 */  li        r3, 0x0
/* 01E600 80021600 480016E0 */  b         lbl_80022CE0
lbl_80021604:
/* 01E604 80021604 815F0094 */  lwz       r10, 0x94(r31)
/* 01E608 80021608 3DFE0004 */  addis     r15, r30, 0x4
/* 01E60C 8002160C 813F0090 */  lwz       r9, 0x90(r31)
/* 01E610 80021610 3C6000FC */  lis       r3, 0xfc
/* 01E614 80021614 5545477E */  extrwi    r5, r10, 3, 5
/* 01E618 80021618 1C85002C */  mulli     r4, r5, 0x2c
/* 01E61C 8002161C 7CCF2214 */  add       r6, r15, r4
/* 01E620 80021620 5520A53E */  extrwi    r0, r9, 12, 8
/* 01E624 80021624 38C6C378 */  subi      r6, r6, 0x3c88
/* 01E628 80021628 7CEF2214 */  add       r7, r15, r4
/* 01E62C 8002162C B0060000 */  sth       r0, 0x0(r6)
/* 01E630 80021630 5520053E */  clrlwi    r0, r9, 20
/* 01E634 80021634 38E7C37A */  subi      r7, r7, 0x3c86
/* 01E638 80021638 7D0F2214 */  add       r8, r15, r4
/* 01E63C 8002163C B0070000 */  sth       r0, 0x0(r7)
/* 01E640 80021640 7D2F2214 */  add       r9, r15, r4
/* 01E644 80021644 5540A53E */  extrwi    r0, r10, 12, 8
/* 01E648 80021648 3908C37C */  subi      r8, r8, 0x3c84
/* 01E64C 8002164C B0080000 */  sth       r0, 0x0(r8)
/* 01E650 80021650 5540053E */  clrlwi    r0, r10, 20
/* 01E654 80021654 3929C37E */  subi      r9, r9, 0x3c82
/* 01E658 80021658 B0090000 */  sth       r0, 0x0(r9)
/* 01E65C 8002165C 38031034 */  addi      r0, r3, 0x1034
/* 01E660 80021660 7FC3F378 */  mr        r3, r30
/* 01E664 80021664 900FC344 */  stw       r0, -0x3cbc(r15)
/* 01E668 80021668 38800000 */  li        r4, 0x0
/* 01E66C 8002166C A8060000 */  lha       r0, 0x0(r6)
/* 01E670 80021670 900FC348 */  stw       r0, -0x3cb8(r15)
/* 01E674 80021674 A8070000 */  lha       r0, 0x0(r7)
/* 01E678 80021678 900FC34C */  stw       r0, -0x3cb4(r15)
/* 01E67C 8002167C A8080000 */  lha       r0, 0x0(r8)
/* 01E680 80021680 900FC350 */  stw       r0, -0x3cb0(r15)
/* 01E684 80021684 A8090000 */  lha       r0, 0x0(r9)
/* 01E688 80021688 900FC354 */  stw       r0, -0x3cac(r15)
/* 01E68C 8002168C 4BFFC37D */  bl        frameLoadTMEM
/* 01E690 80021690 2C030000 */  cmpwi     r3, 0x0
/* 01E694 80021694 4082000C */  bne       lbl_800216A0
/* 01E698 80021698 38600000 */  li        r3, 0x0
/* 01E69C 8002169C 48001644 */  b         lbl_80022CE0
lbl_800216A0:
/* 01E6A0 800216A0 880FD122 */  lbz       r0, -0x2ede(r15)
/* 01E6A4 800216A4 7F83E378 */  mr        r3, r28
/* 01E6A8 800216A8 80DE21FC */  lwz       r6, 0x21fc(r30)
/* 01E6AC 800216AC 7E048378 */  mr        r4, r16
/* 01E6B0 800216B0 1C00002C */  mulli     r0, r0, 0x2c
/* 01E6B4 800216B4 7CAF0214 */  add       r5, r15, r0
/* 01E6B8 800216B8 90C5C380 */  stw       r6, -0x3c80(r5)
/* 01E6BC 800216BC 38C00140 */  li        r6, 0x140
/* 01E6C0 800216C0 38E000E8 */  li        r7, 0xe8
/* 01E6C4 800216C4 80BE00E8 */  lwz       r5, 0xe8(r30)
/* 01E6C8 800216C8 39000000 */  li        r8, 0x0
/* 01E6CC 800216CC 39200007 */  li        r9, 0x7
/* 01E6D0 800216D0 39400001 */  li        r10, 0x1
/* 01E6D4 800216D4 480016C5 */  bl        PanelDrawFR3D
/* 01E6D8 800216D8 3BFF00A0 */  addi      r31, r31, 0xa0
/* 01E6DC 800216DC 48000004 */  b         lbl_800216E0
lbl_800216E0:
/* 01E6E0 800216E0 48000004 */  b         lbl_800216E4
lbl_800216E4:
/* 01E6E4 800216E4 801F0000 */  lwz       r0, 0x0(r31)
/* 01E6E8 800216E8 3BFF0008 */  addi      r31, r31, 0x8
/* 01E6EC 800216EC 5403000E */  clrrwi    r3, r0, 24
/* 01E6F0 800216F0 3C034600 */  addis     r0, r3, 0x4600
/* 01E6F4 800216F4 28000000 */  cmplwi    r0, 0x0
/* 01E6F8 800216F8 4082FFEC */  bne       lbl_800216E4
/* 01E6FC 800216FC 807F0000 */  lwz       r3, 0x0(r31)
/* 01E700 80021700 3A3E00DC */  addi      r17, r30, 0xdc
/* 01E704 80021704 80DF0004 */  lwz       r6, 0x4(r31)
/* 01E708 80021708 3891000C */  addi      r4, r17, 0xc
/* 01E70C 8002170C 54605F7E */  extrwi    r0, r3, 3, 8
/* 01E710 80021710 90110008 */  stw       r0, 0x8(r17)
/* 01E714 80021714 54606FBE */  extrwi    r0, r3, 2, 11
/* 01E718 80021718 5463053E */  clrlwi    r3, r3, 20
/* 01E71C 8002171C 90110000 */  stw       r0, 0x0(r17)
/* 01E720 80021720 38630001 */  addi      r3, r3, 0x1
/* 01E724 80021724 54C0473E */  extrwi    r0, r6, 4, 4
/* 01E728 80021728 90710004 */  stw       r3, 0x4(r17)
/* 01E72C 8002172C 5403103A */  slwi      r3, r0, 2
/* 01E730 80021730 54C0023E */  clrlwi    r0, r6, 8
/* 01E734 80021734 80BD0008 */  lwz       r5, 0x8(r29)
/* 01E738 80021738 38633928 */  addi      r3, r3, 0x3928
/* 01E73C 8002173C 38C00000 */  li        r6, 0x0
/* 01E740 80021740 80A50034 */  lwz       r5, 0x34(r5)
/* 01E744 80021744 7C65182E */  lwzx      r3, r5, r3
/* 01E748 80021748 7CA30214 */  add       r5, r3, r0
/* 01E74C 8002174C 90B10010 */  stw       r5, 0x10(r17)
/* 01E750 80021750 807D0008 */  lwz       r3, 0x8(r29)
/* 01E754 80021754 8063002C */  lwz       r3, 0x2c(r3)
/* 01E758 80021758 4804B1B9 */  bl        ramGetBuffer
/* 01E75C 8002175C 2C030000 */  cmpwi     r3, 0x0
/* 01E760 80021760 4082000C */  bne       lbl_8002176C
/* 01E764 80021764 38600000 */  li        r3, 0x0
/* 01E768 80021768 48001578 */  b         lbl_80022CE0
lbl_8002176C:
/* 01E76C 8002176C 801F0024 */  lwz       r0, 0x24(r31)
/* 01E770 80021770 7FC3F378 */  mr        r3, r30
/* 01E774 80021774 5405477E */  extrwi    r5, r0, 3, 5
/* 01E778 80021778 540495BE */  extrwi    r4, r0, 10, 8
/* 01E77C 8002177C 4BFFD1D5 */  bl        frameLoadTLUT
/* 01E780 80021780 2C030000 */  cmpwi     r3, 0x0
/* 01E784 80021784 4082000C */  bne       lbl_80021790
/* 01E788 80021788 38600000 */  li        r3, 0x0
/* 01E78C 8002178C 48001554 */  b         lbl_80022CE0
lbl_80021790:
/* 01E790 80021790 837E00E8 */  lwz       r27, 0xe8(r30)
/* 01E794 80021794 3BFF0028 */  addi      r31, r31, 0x28
/* 01E798 80021798 3C6000FC */  lis       r3, 0xfc
/* 01E79C 8002179C 3A031034 */  addi      r16, r3, 0x1034
/* 01E7A0 800217A0 3DFE0004 */  addis     r15, r30, 0x4
/* 01E7A4 800217A4 48000004 */  b         lbl_800217A8
lbl_800217A8:
/* 01E7A8 800217A8 48000004 */  b         lbl_800217AC
lbl_800217AC:
/* 01E7AC 800217AC 809F0000 */  lwz       r4, 0x0(r31)
/* 01E7B0 800217B0 80DF0004 */  lwz       r6, 0x4(r31)
/* 01E7B4 800217B4 5483000E */  clrrwi    r3, r4, 24
/* 01E7B8 800217B8 3C030300 */  addis     r0, r3, 0x300
/* 01E7BC 800217BC 28000000 */  cmplwi    r0, 0x0
/* 01E7C0 800217C0 40820188 */  bne       lbl_80021948
/* 01E7C4 800217C4 54805F7E */  extrwi    r0, r4, 3, 8
/* 01E7C8 800217C8 90110008 */  stw       r0, 0x8(r17)
/* 01E7CC 800217CC 54806FBE */  extrwi    r0, r4, 2, 11
/* 01E7D0 800217D0 5483053E */  clrlwi    r3, r4, 20
/* 01E7D4 800217D4 90110000 */  stw       r0, 0x0(r17)
/* 01E7D8 800217D8 38630001 */  addi      r3, r3, 0x1
/* 01E7DC 800217DC 54C0473E */  extrwi    r0, r6, 4, 4
/* 01E7E0 800217E0 90710004 */  stw       r3, 0x4(r17)
/* 01E7E4 800217E4 5403103A */  slwi      r3, r0, 2
/* 01E7E8 800217E8 54C0023E */  clrlwi    r0, r6, 8
/* 01E7EC 800217EC 80BD0008 */  lwz       r5, 0x8(r29)
/* 01E7F0 800217F0 38633928 */  addi      r3, r3, 0x3928
/* 01E7F4 800217F4 3891000C */  addi      r4, r17, 0xc
/* 01E7F8 800217F8 80A50034 */  lwz       r5, 0x34(r5)
/* 01E7FC 800217FC 38C00000 */  li        r6, 0x0
/* 01E800 80021800 7C65182E */  lwzx      r3, r5, r3
/* 01E804 80021804 7CA30214 */  add       r5, r3, r0
/* 01E808 80021808 90B10010 */  stw       r5, 0x10(r17)
/* 01E80C 8002180C 807D0008 */  lwz       r3, 0x8(r29)
/* 01E810 80021810 8063002C */  lwz       r3, 0x2c(r3)
/* 01E814 80021814 4804B0FD */  bl        ramGetBuffer
/* 01E818 80021818 2C030000 */  cmpwi     r3, 0x0
/* 01E81C 8002181C 4082000C */  bne       lbl_80021828
/* 01E820 80021820 38600000 */  li        r3, 0x0
/* 01E824 80021824 480014BC */  b         lbl_80022CE0
lbl_80021828:
/* 01E828 80021828 817F0014 */  lwz       r11, 0x14(r31)
/* 01E82C 8002182C 7FC3F378 */  mr        r3, r30
/* 01E830 80021830 815F0010 */  lwz       r10, 0x10(r31)
/* 01E834 80021834 38800000 */  li        r4, 0x0
/* 01E838 80021838 5565477E */  extrwi    r5, r11, 3, 5
/* 01E83C 8002183C 1C05002C */  mulli     r0, r5, 0x2c
/* 01E840 80021840 7CDE0214 */  add       r6, r30, r0
/* 01E844 80021844 3CE60004 */  addis     r7, r6, 0x4
/* 01E848 80021848 5540A53E */  extrwi    r0, r10, 12, 8
/* 01E84C 8002184C 38E7C378 */  subi      r7, r7, 0x3c88
/* 01E850 80021850 3D060004 */  addis     r8, r6, 0x4
/* 01E854 80021854 B0070000 */  sth       r0, 0x0(r7)
/* 01E858 80021858 3D260004 */  addis     r9, r6, 0x4
/* 01E85C 8002185C 5540053E */  clrlwi    r0, r10, 20
/* 01E860 80021860 3908C37A */  subi      r8, r8, 0x3c86
/* 01E864 80021864 B0080000 */  sth       r0, 0x0(r8)
/* 01E868 80021868 3CC60004 */  addis     r6, r6, 0x4
/* 01E86C 8002186C 5560A53E */  extrwi    r0, r11, 12, 8
/* 01E870 80021870 3929C37C */  subi      r9, r9, 0x3c84
/* 01E874 80021874 B0090000 */  sth       r0, 0x0(r9)
/* 01E878 80021878 5560053E */  clrlwi    r0, r11, 20
/* 01E87C 8002187C 38C6C37E */  subi      r6, r6, 0x3c82
/* 01E880 80021880 B0060000 */  sth       r0, 0x0(r6)
/* 01E884 80021884 920FC344 */  stw       r16, -0x3cbc(r15)
/* 01E888 80021888 A8070000 */  lha       r0, 0x0(r7)
/* 01E88C 8002188C 900FC348 */  stw       r0, -0x3cb8(r15)
/* 01E890 80021890 A8080000 */  lha       r0, 0x0(r8)
/* 01E894 80021894 900FC34C */  stw       r0, -0x3cb4(r15)
/* 01E898 80021898 A8090000 */  lha       r0, 0x0(r9)
/* 01E89C 8002189C 900FC350 */  stw       r0, -0x3cb0(r15)
/* 01E8A0 800218A0 A8060000 */  lha       r0, 0x0(r6)
/* 01E8A4 800218A4 900FC354 */  stw       r0, -0x3cac(r15)
/* 01E8A8 800218A8 4BFFC161 */  bl        frameLoadTMEM
/* 01E8AC 800218AC 2C030000 */  cmpwi     r3, 0x0
/* 01E8B0 800218B0 4082000C */  bne       lbl_800218BC
/* 01E8B4 800218B4 38600000 */  li        r3, 0x0
/* 01E8B8 800218B8 48001428 */  b         lbl_80022CE0
lbl_800218BC:
/* 01E8BC 800218BC 880FD122 */  lbz       r0, -0x2ede(r15)
/* 01E8C0 800218C0 809E21FC */  lwz       r4, 0x21fc(r30)
/* 01E8C4 800218C4 1C60002C */  mulli     r3, r0, 0x2c
/* 01E8C8 800218C8 3C630004 */  addis     r3, r3, 0x4
/* 01E8CC 800218CC 3863C380 */  subi      r3, r3, 0x3c80
/* 01E8D0 800218D0 7C9E192E */  stwx      r4, r30, r3
/* 01E8D4 800218D4 80FF0020 */  lwz       r7, 0x20(r31)
/* 01E8D8 800218D8 809F0024 */  lwz       r4, 0x24(r31)
/* 01E8DC 800218DC 54E0A53E */  extrwi    r0, r7, 12, 8
/* 01E8E0 800218E0 80BE00E8 */  lwz       r5, 0xe8(r30)
/* 01E8E4 800218E4 5488A53E */  extrwi    r8, r4, 12, 8
/* 01E8E8 800218E8 7C080050 */  subf      r0, r8, r0
/* 01E8EC 800218EC 7C031670 */  srawi     r3, r0, 2
/* 01E8F0 800218F0 7C602E70 */  srawi     r0, r3, 5
/* 01E8F4 800218F4 7C000194 */  addze     r0, r0
/* 01E8F8 800218F8 54002834 */  slwi      r0, r0, 5
/* 01E8FC 800218FC 7C001810 */  subfc     r0, r0, r3
/* 01E900 80021900 2C000000 */  cmpwi     r0, 0x0
/* 01E904 80021904 7C661B78 */  mr        r6, r3
/* 01E908 80021908 5484053E */  clrlwi    r4, r4, 20
/* 01E90C 8002190C 54E7053E */  clrlwi    r7, r7, 20
/* 01E910 80021910 41820014 */  beq       lbl_80021924
/* 01E914 80021914 7CC32E70 */  srawi     r3, r6, 5
/* 01E918 80021918 7C630194 */  addze     r3, r3
/* 01E91C 8002191C 38030001 */  addi      r0, r3, 0x1
/* 01E920 80021920 54062834 */  slwi      r6, r0, 5
lbl_80021924:
/* 01E924 80021924 7C043850 */  subf      r0, r4, r7
/* 01E928 80021928 7C071670 */  srawi     r7, r0, 2
/* 01E92C 8002192C 7D081670 */  srawi     r8, r8, 2
/* 01E930 80021930 7C891670 */  srawi     r9, r4, 2
/* 01E934 80021934 7F83E378 */  mr        r3, r28
/* 01E938 80021938 7F64DB78 */  mr        r4, r27
/* 01E93C 8002193C 39290007 */  addi      r9, r9, 0x7
/* 01E940 80021940 39400000 */  li        r10, 0x0
/* 01E944 80021944 48001455 */  bl        PanelDrawFR3D
lbl_80021948:
/* 01E948 80021948 801F0000 */  lwz       r0, 0x0(r31)
/* 01E94C 8002194C 3BFF0008 */  addi      r31, r31, 0x8
/* 01E950 80021950 5403000E */  clrrwi    r3, r0, 24
/* 01E954 80021954 3C034600 */  addis     r0, r3, 0x4600
/* 01E958 80021958 28000000 */  cmplwi    r0, 0x0
/* 01E95C 8002195C 4082FE50 */  bne       lbl_800217AC
/* 01E960 80021960 3C6000FC */  lis       r3, 0xfc
/* 01E964 80021964 3B3E00DC */  addi      r25, r30, 0xdc
/* 01E968 80021968 3B031034 */  addi      r24, r3, 0x1034
/* 01E96C 8002196C 3F5E0004 */  addis     r26, r30, 0x4
/* 01E970 80021970 48000004 */  b         lbl_80021974
lbl_80021974:
/* 01E974 80021974 48000004 */  b         lbl_80021978
lbl_80021978:
/* 01E978 80021978 809F0000 */  lwz       r4, 0x0(r31)
/* 01E97C 8002197C 5483000E */  clrrwi    r3, r4, 24
/* 01E980 80021980 3C030300 */  addis     r0, r3, 0x300
/* 01E984 80021984 28000000 */  cmplwi    r0, 0x0
/* 01E988 80021988 40820250 */  bne       lbl_80021BD8
/* 01E98C 8002198C 801F0020 */  lwz       r0, 0x20(r31)
/* 01E990 80021990 5403000E */  clrrwi    r3, r0, 24
/* 01E994 80021994 3C031000 */  addis     r0, r3, 0x1000
/* 01E998 80021998 28000000 */  cmplwi    r0, 0x0
/* 01E99C 8002199C 40820098 */  bne       lbl_80021A34
/* 01E9A0 800219A0 80BF0004 */  lwz       r5, 0x4(r31)
/* 01E9A4 800219A4 54805F7E */  extrwi    r0, r4, 3, 8
/* 01E9A8 800219A8 5483053E */  clrlwi    r3, r4, 20
/* 01E9AC 800219AC 90190008 */  stw       r0, 0x8(r25)
/* 01E9B0 800219B0 54846FBE */  extrwi    r4, r4, 2, 11
/* 01E9B4 800219B4 54A0473E */  extrwi    r0, r5, 4, 4
/* 01E9B8 800219B8 90990000 */  stw       r4, 0x0(r25)
/* 01E9BC 800219BC 38830001 */  addi      r4, r3, 0x1
/* 01E9C0 800219C0 5403103A */  slwi      r3, r0, 2
/* 01E9C4 800219C4 90990004 */  stw       r4, 0x4(r25)
/* 01E9C8 800219C8 54A0023E */  clrlwi    r0, r5, 8
/* 01E9CC 800219CC 38633928 */  addi      r3, r3, 0x3928
/* 01E9D0 800219D0 80BD0008 */  lwz       r5, 0x8(r29)
/* 01E9D4 800219D4 3899000C */  addi      r4, r25, 0xc
/* 01E9D8 800219D8 38C00000 */  li        r6, 0x0
/* 01E9DC 800219DC 80A50034 */  lwz       r5, 0x34(r5)
/* 01E9E0 800219E0 7C65182E */  lwzx      r3, r5, r3
/* 01E9E4 800219E4 7CA30214 */  add       r5, r3, r0
/* 01E9E8 800219E8 90B90010 */  stw       r5, 0x10(r25)
/* 01E9EC 800219EC 807D0008 */  lwz       r3, 0x8(r29)
/* 01E9F0 800219F0 8063002C */  lwz       r3, 0x2c(r3)
/* 01E9F4 800219F4 4804AF1D */  bl        ramGetBuffer
/* 01E9F8 800219F8 2C030000 */  cmpwi     r3, 0x0
/* 01E9FC 800219FC 4082000C */  bne       lbl_80021A08
/* 01EA00 80021A00 38600000 */  li        r3, 0x0
/* 01EA04 80021A04 480012DC */  b         lbl_80022CE0
lbl_80021A08:
/* 01EA08 80021A08 801F0024 */  lwz       r0, 0x24(r31)
/* 01EA0C 80021A0C 7FC3F378 */  mr        r3, r30
/* 01EA10 80021A10 5405477E */  extrwi    r5, r0, 3, 5
/* 01EA14 80021A14 540495BE */  extrwi    r4, r0, 10, 8
/* 01EA18 80021A18 4BFFCF39 */  bl        frameLoadTLUT
/* 01EA1C 80021A1C 2C030000 */  cmpwi     r3, 0x0
/* 01EA20 80021A20 4082000C */  bne       lbl_80021A2C
/* 01EA24 80021A24 38600000 */  li        r3, 0x0
/* 01EA28 80021A28 480012B8 */  b         lbl_80022CE0
lbl_80021A2C:
/* 01EA2C 80021A2C 837E00E8 */  lwz       r27, 0xe8(r30)
/* 01EA30 80021A30 480001A8 */  b         lbl_80021BD8
lbl_80021A34:
/* 01EA34 80021A34 80BF0004 */  lwz       r5, 0x4(r31)
/* 01EA38 80021A38 54805F7E */  extrwi    r0, r4, 3, 8
/* 01EA3C 80021A3C 5483053E */  clrlwi    r3, r4, 20
/* 01EA40 80021A40 90190008 */  stw       r0, 0x8(r25)
/* 01EA44 80021A44 54846FBE */  extrwi    r4, r4, 2, 11
/* 01EA48 80021A48 54A0473E */  extrwi    r0, r5, 4, 4
/* 01EA4C 80021A4C 90990000 */  stw       r4, 0x0(r25)
/* 01EA50 80021A50 38830001 */  addi      r4, r3, 0x1
/* 01EA54 80021A54 5403103A */  slwi      r3, r0, 2
/* 01EA58 80021A58 90990004 */  stw       r4, 0x4(r25)
/* 01EA5C 80021A5C 54A0023E */  clrlwi    r0, r5, 8
/* 01EA60 80021A60 38633928 */  addi      r3, r3, 0x3928
/* 01EA64 80021A64 80BD0008 */  lwz       r5, 0x8(r29)
/* 01EA68 80021A68 3899000C */  addi      r4, r25, 0xc
/* 01EA6C 80021A6C 38C00000 */  li        r6, 0x0
/* 01EA70 80021A70 80A50034 */  lwz       r5, 0x34(r5)
/* 01EA74 80021A74 7C65182E */  lwzx      r3, r5, r3
/* 01EA78 80021A78 7CA30214 */  add       r5, r3, r0
/* 01EA7C 80021A7C 90B90010 */  stw       r5, 0x10(r25)
/* 01EA80 80021A80 807D0008 */  lwz       r3, 0x8(r29)
/* 01EA84 80021A84 8063002C */  lwz       r3, 0x2c(r3)
/* 01EA88 80021A88 4804AE89 */  bl        ramGetBuffer
/* 01EA8C 80021A8C 2C030000 */  cmpwi     r3, 0x0
/* 01EA90 80021A90 4082000C */  bne       lbl_80021A9C
/* 01EA94 80021A94 38600000 */  li        r3, 0x0
/* 01EA98 80021A98 48001248 */  b         lbl_80022CE0
lbl_80021A9C:
/* 01EA9C 80021A9C 817F0014 */  lwz       r11, 0x14(r31)
/* 01EAA0 80021AA0 7FC3F378 */  mr        r3, r30
/* 01EAA4 80021AA4 815F0010 */  lwz       r10, 0x10(r31)
/* 01EAA8 80021AA8 38800000 */  li        r4, 0x0
/* 01EAAC 80021AAC 5565477E */  extrwi    r5, r11, 3, 5
/* 01EAB0 80021AB0 1C05002C */  mulli     r0, r5, 0x2c
/* 01EAB4 80021AB4 7CDE0214 */  add       r6, r30, r0
/* 01EAB8 80021AB8 3CE60004 */  addis     r7, r6, 0x4
/* 01EABC 80021ABC 5540A53E */  extrwi    r0, r10, 12, 8
/* 01EAC0 80021AC0 38E7C378 */  subi      r7, r7, 0x3c88
/* 01EAC4 80021AC4 3D060004 */  addis     r8, r6, 0x4
/* 01EAC8 80021AC8 B0070000 */  sth       r0, 0x0(r7)
/* 01EACC 80021ACC 3D260004 */  addis     r9, r6, 0x4
/* 01EAD0 80021AD0 5540053E */  clrlwi    r0, r10, 20
/* 01EAD4 80021AD4 3908C37A */  subi      r8, r8, 0x3c86
/* 01EAD8 80021AD8 B0080000 */  sth       r0, 0x0(r8)
/* 01EADC 80021ADC 3CC60004 */  addis     r6, r6, 0x4
/* 01EAE0 80021AE0 5560A53E */  extrwi    r0, r11, 12, 8
/* 01EAE4 80021AE4 3929C37C */  subi      r9, r9, 0x3c84
/* 01EAE8 80021AE8 B0090000 */  sth       r0, 0x0(r9)
/* 01EAEC 80021AEC 5560053E */  clrlwi    r0, r11, 20
/* 01EAF0 80021AF0 38C6C37E */  subi      r6, r6, 0x3c82
/* 01EAF4 80021AF4 B0060000 */  sth       r0, 0x0(r6)
/* 01EAF8 80021AF8 931AC344 */  stw       r24, -0x3cbc(r26)
/* 01EAFC 80021AFC A8070000 */  lha       r0, 0x0(r7)
/* 01EB00 80021B00 901AC348 */  stw       r0, -0x3cb8(r26)
/* 01EB04 80021B04 A8080000 */  lha       r0, 0x0(r8)
/* 01EB08 80021B08 901AC34C */  stw       r0, -0x3cb4(r26)
/* 01EB0C 80021B0C A8090000 */  lha       r0, 0x0(r9)
/* 01EB10 80021B10 901AC350 */  stw       r0, -0x3cb0(r26)
/* 01EB14 80021B14 A8060000 */  lha       r0, 0x0(r6)
/* 01EB18 80021B18 901AC354 */  stw       r0, -0x3cac(r26)
/* 01EB1C 80021B1C 4BFFBEED */  bl        frameLoadTMEM
/* 01EB20 80021B20 2C030000 */  cmpwi     r3, 0x0
/* 01EB24 80021B24 4082000C */  bne       lbl_80021B30
/* 01EB28 80021B28 38600000 */  li        r3, 0x0
/* 01EB2C 80021B2C 480011B4 */  b         lbl_80022CE0
lbl_80021B30:
/* 01EB30 80021B30 881AD122 */  lbz       r0, -0x2ede(r26)
/* 01EB34 80021B34 809E21FC */  lwz       r4, 0x21fc(r30)
/* 01EB38 80021B38 1C60002C */  mulli     r3, r0, 0x2c
/* 01EB3C 80021B3C 3C630004 */  addis     r3, r3, 0x4
/* 01EB40 80021B40 3863C380 */  subi      r3, r3, 0x3c80
/* 01EB44 80021B44 7C9E192E */  stwx      r4, r30, r3
/* 01EB48 80021B48 80FF0024 */  lwz       r7, 0x24(r31)
/* 01EB4C 80021B4C 807F0020 */  lwz       r3, 0x20(r31)
/* 01EB50 80021B50 54E4A53E */  extrwi    r4, r7, 12, 8
/* 01EB54 80021B54 80BE00E8 */  lwz       r5, 0xe8(r30)
/* 01EB58 80021B58 5460A53E */  extrwi    r0, r3, 12, 8
/* 01EB5C 80021B5C 7C040050 */  subf      r0, r4, r0
/* 01EB60 80021B60 7C061670 */  srawi     r6, r0, 2
/* 01EB64 80021B64 7CC02E70 */  srawi     r0, r6, 5
/* 01EB68 80021B68 7C000194 */  addze     r0, r0
/* 01EB6C 80021B6C 54002834 */  slwi      r0, r0, 5
/* 01EB70 80021B70 7C003010 */  subfc     r0, r0, r6
/* 01EB74 80021B74 2C000000 */  cmpwi     r0, 0x0
/* 01EB78 80021B78 54E9053E */  clrlwi    r9, r7, 20
/* 01EB7C 80021B7C 5467053E */  clrlwi    r7, r3, 20
/* 01EB80 80021B80 41820014 */  beq       lbl_80021B94
/* 01EB84 80021B84 7CC32E70 */  srawi     r3, r6, 5
/* 01EB88 80021B88 7C630194 */  addze     r3, r3
/* 01EB8C 80021B8C 38030001 */  addi      r0, r3, 0x1
/* 01EB90 80021B90 54062834 */  slwi      r6, r0, 5
lbl_80021B94:
/* 01EB94 80021B94 7C881670 */  srawi     r8, r4, 2
/* 01EB98 80021B98 2C0800FC */  cmpwi     r8, 0xfc
/* 01EB9C 80021B9C 4082001C */  bne       lbl_80021BB8
/* 01EBA0 80021BA0 7D201670 */  srawi     r0, r9, 2
/* 01EBA4 80021BA4 2C0000AA */  cmpwi     r0, 0xaa
/* 01EBA8 80021BA8 40820010 */  bne       lbl_80021BB8
/* 01EBAC 80021BAC 2C060040 */  cmpwi     r6, 0x40
/* 01EBB0 80021BB0 40820008 */  bne       lbl_80021BB8
/* 01EBB4 80021BB4 38C00060 */  li        r6, 0x60
lbl_80021BB8:
/* 01EBB8 80021BB8 7C093850 */  subf      r0, r9, r7
/* 01EBBC 80021BBC 7C071670 */  srawi     r7, r0, 2
/* 01EBC0 80021BC0 7D291670 */  srawi     r9, r9, 2
/* 01EBC4 80021BC4 7F83E378 */  mr        r3, r28
/* 01EBC8 80021BC8 7F64DB78 */  mr        r4, r27
/* 01EBCC 80021BCC 39290007 */  addi      r9, r9, 0x7
/* 01EBD0 80021BD0 39400000 */  li        r10, 0x0
/* 01EBD4 80021BD4 480011C5 */  bl        PanelDrawFR3D
lbl_80021BD8:
/* 01EBD8 80021BD8 801F0000 */  lwz       r0, 0x0(r31)
/* 01EBDC 80021BDC 3BFF0008 */  addi      r31, r31, 0x8
/* 01EBE0 80021BE0 5403000E */  clrrwi    r3, r0, 24
/* 01EBE4 80021BE4 3C03FA00 */  subis     r0, r3, 0x600
/* 01EBE8 80021BE8 28000000 */  cmplwi    r0, 0x0
/* 01EBEC 80021BEC 4082FD8C */  bne       lbl_80021978
/* 01EBF0 80021BF0 93EE0000 */  stw       r31, 0x0(r14)
/* 01EBF4 80021BF4 38600001 */  li        r3, 0x1
/* 01EBF8 80021BF8 480010E8 */  b         lbl_80022CE0
lbl_80021BFC:
/* 01EBFC 80021BFC 38860298 */  addi      r4, r6, 0x298
/* 01EC00 80021C00 39000000 */  li        r8, 0x0
/* 01EC04 80021C04 48000004 */  b         lbl_80021C08
lbl_80021C08:
/* 01EC08 80021C08 48000004 */  b         lbl_80021C0C
lbl_80021C0C:
/* 01EC0C 80021C0C 807F0000 */  lwz       r3, 0x0(r31)
/* 01EC10 80021C10 80040000 */  lwz       r0, 0x0(r4)
/* 01EC14 80021C14 5463000E */  clrrwi    r3, r3, 24
/* 01EC18 80021C18 7C030040 */  cmplw     r3, r0
/* 01EC1C 80021C1C 40820088 */  bne       lbl_80021CA4
/* 01EC20 80021C20 38840004 */  addi      r4, r4, 0x4
/* 01EC24 80021C24 38FF0008 */  addi      r7, r31, 0x8
/* 01EC28 80021C28 39000001 */  li        r8, 0x1
/* 01EC2C 80021C2C 80670000 */  lwz       r3, 0x0(r7)
/* 01EC30 80021C30 80040000 */  lwz       r0, 0x0(r4)
/* 01EC34 80021C34 5463000E */  clrrwi    r3, r3, 24
/* 01EC38 80021C38 7C030040 */  cmplw     r3, r0
/* 01EC3C 80021C3C 40820068 */  bne       lbl_80021CA4
/* 01EC40 80021C40 38840004 */  addi      r4, r4, 0x4
/* 01EC44 80021C44 38E70008 */  addi      r7, r7, 0x8
/* 01EC48 80021C48 39000002 */  li        r8, 0x2
/* 01EC4C 80021C4C 80670000 */  lwz       r3, 0x0(r7)
/* 01EC50 80021C50 80040000 */  lwz       r0, 0x0(r4)
/* 01EC54 80021C54 5463000E */  clrrwi    r3, r3, 24
/* 01EC58 80021C58 7C030040 */  cmplw     r3, r0
/* 01EC5C 80021C5C 40820048 */  bne       lbl_80021CA4
/* 01EC60 80021C60 38840004 */  addi      r4, r4, 0x4
/* 01EC64 80021C64 38E70008 */  addi      r7, r7, 0x8
/* 01EC68 80021C68 39000003 */  li        r8, 0x3
/* 01EC6C 80021C6C 80670000 */  lwz       r3, 0x0(r7)
/* 01EC70 80021C70 80040000 */  lwz       r0, 0x0(r4)
/* 01EC74 80021C74 5463000E */  clrrwi    r3, r3, 24
/* 01EC78 80021C78 7C030040 */  cmplw     r3, r0
/* 01EC7C 80021C7C 40820028 */  bne       lbl_80021CA4
/* 01EC80 80021C80 38840004 */  addi      r4, r4, 0x4
/* 01EC84 80021C84 38E70008 */  addi      r7, r7, 0x8
/* 01EC88 80021C88 39000004 */  li        r8, 0x4
/* 01EC8C 80021C8C 80670000 */  lwz       r3, 0x0(r7)
/* 01EC90 80021C90 80040000 */  lwz       r0, 0x0(r4)
/* 01EC94 80021C94 5463000E */  clrrwi    r3, r3, 24
/* 01EC98 80021C98 7C030040 */  cmplw     r3, r0
/* 01EC9C 80021C9C 40820008 */  bne       lbl_80021CA4
/* 01ECA0 80021CA0 39000005 */  li        r8, 0x5
lbl_80021CA4:
/* 01ECA4 80021CA4 2C080005 */  cmpwi     r8, 0x5
/* 01ECA8 80021CA8 40820364 */  bne       lbl_8002200C
/* 01ECAC 80021CAC 55001838 */  slwi      r0, r8, 3
/* 01ECB0 80021CB0 7C1F0214 */  add       r0, r31, r0
/* 01ECB4 80021CB4 900E0000 */  stw       r0, 0x0(r14)
/* 01ECB8 80021CB8 828E0000 */  lwz       r20, 0x0(r14)
/* 01ECBC 80021CBC 80740000 */  lwz       r3, 0x0(r20)
/* 01ECC0 80021CC0 80940004 */  lwz       r4, 0x4(r20)
/* 01ECC4 80021CC4 3CA000FC */  lis       r5, 0xfc
/* 01ECC8 80021CC8 3D208002 */  lis       r9, 0x8002
/* 01ECCC 80021CCC 3D008002 */  lis       r8, 0x8002
/* 01ECD0 80021CD0 3CE08002 */  lis       r7, 0x8002
/* 01ECD4 80021CD4 3CC08002 */  lis       r6, 0x8002
/* 01ECD8 80021CD8 3F1E0004 */  addis     r24, r30, 0x4
/* 01ECDC 80021CDC 39E51034 */  addi      r15, r5, 0x1034
/* 01ECE0 80021CE0 3ABE00DC */  addi      r21, r30, 0xdc
/* 01ECE4 80021CE4 3B896998 */  addi      r28, r9, 0x6998
/* 01ECE8 80021CE8 3B687568 */  addi      r27, r8, 0x7568
/* 01ECEC 80021CEC 3B476654 */  addi      r26, r7, 0x6654
/* 01ECF0 80021CF0 3B265D88 */  addi      r25, r6, 0x5d88
/* 01ECF4 80021CF4 3E00FD00 */  lis       r16, 0xfd00
/* 01ECF8 80021CF8 3E40F500 */  lis       r18, 0xf500
/* 01ECFC 80021CFC 3E20F400 */  lis       r17, 0xf400
/* 01ED00 80021D00 3E60F200 */  lis       r19, 0xf200
/* 01ED04 80021D04 3EC0F300 */  lis       r22, 0xf300
/* 01ED08 80021D08 3EE0F000 */  lis       r23, 0xf000
/* 01ED0C 80021D0C 3FE0E400 */  lis       r31, 0xe400
/* 01ED10 80021D10 48000004 */  b         lbl_80021D14
lbl_80021D14:
/* 01ED14 80021D14 48000004 */  b         lbl_80021D18
lbl_80021D18:
/* 01ED18 80021D18 3C0300F0 */  addis     r0, r3, 0xf0
/* 01ED1C 80021D1C 2800013F */  cmplwi    r0, 0x13f
/* 01ED20 80021D20 40820010 */  bne       lbl_80021D30
/* 01ED24 80021D24 3C047FDC */  addis     r0, r4, 0x7fdc
/* 01ED28 80021D28 28005D00 */  cmplwi    r0, 0x5d00
/* 01ED2C 80021D2C 418202D4 */  beq       lbl_80022000
lbl_80021D30:
/* 01ED30 80021D30 5460000E */  clrrwi    r0, r3, 24
/* 01ED34 80021D34 7C00B000 */  cmpw      r0, r22
/* 01ED38 80021D38 418201F4 */  beq       lbl_80021F2C
/* 01ED3C 80021D3C 40800028 */  bge       lbl_80021D64
/* 01ED40 80021D40 7C00B800 */  cmpw      r0, r23
/* 01ED44 80021D44 4182023C */  beq       lbl_80021F80
/* 01ED48 80021D48 40800010 */  bge       lbl_80021D58
/* 01ED4C 80021D4C 7C00F800 */  cmpw      r0, r31
/* 01ED50 80021D50 418202A0 */  beq       lbl_80021FF0
/* 01ED54 80021D54 4800029C */  b         lbl_80021FF0
lbl_80021D58:
/* 01ED58 80021D58 7C009800 */  cmpw      r0, r19
/* 01ED5C 80021D5C 41820244 */  beq       lbl_80021FA0
/* 01ED60 80021D60 48000290 */  b         lbl_80021FF0
lbl_80021D64:
/* 01ED64 80021D64 7C009000 */  cmpw      r0, r18
/* 01ED68 80021D68 41820084 */  beq       lbl_80021DEC
/* 01ED6C 80021D6C 40800010 */  bge       lbl_80021D7C
/* 01ED70 80021D70 7C008800 */  cmpw      r0, r17
/* 01ED74 80021D74 41820110 */  beq       lbl_80021E84
/* 01ED78 80021D78 48000278 */  b         lbl_80021FF0
lbl_80021D7C:
/* 01ED7C 80021D7C 7C008000 */  cmpw      r0, r16
/* 01ED80 80021D80 41820008 */  beq       lbl_80021D88
/* 01ED84 80021D84 4800026C */  b         lbl_80021FF0
lbl_80021D88:
/* 01ED88 80021D88 54605F7E */  extrwi    r0, r3, 3, 8
/* 01ED8C 80021D8C 90150008 */  stw       r0, 0x8(r21)
/* 01ED90 80021D90 54606FBE */  extrwi    r0, r3, 2, 11
/* 01ED94 80021D94 5463053E */  clrlwi    r3, r3, 20
/* 01ED98 80021D98 90150000 */  stw       r0, 0x0(r21)
/* 01ED9C 80021D9C 38630001 */  addi      r3, r3, 0x1
/* 01EDA0 80021DA0 5480473E */  extrwi    r0, r4, 4, 4
/* 01EDA4 80021DA4 90750004 */  stw       r3, 0x4(r21)
/* 01EDA8 80021DA8 5403103A */  slwi      r3, r0, 2
/* 01EDAC 80021DAC 5480023E */  clrlwi    r0, r4, 8
/* 01EDB0 80021DB0 80BD0008 */  lwz       r5, 0x8(r29)
/* 01EDB4 80021DB4 38633928 */  addi      r3, r3, 0x3928
/* 01EDB8 80021DB8 3895000C */  addi      r4, r21, 0xc
/* 01EDBC 80021DBC 80A50034 */  lwz       r5, 0x34(r5)
/* 01EDC0 80021DC0 38C00000 */  li        r6, 0x0
/* 01EDC4 80021DC4 7C65182E */  lwzx      r3, r5, r3
/* 01EDC8 80021DC8 7CA30214 */  add       r5, r3, r0
/* 01EDCC 80021DCC 90B50010 */  stw       r5, 0x10(r21)
/* 01EDD0 80021DD0 807D0008 */  lwz       r3, 0x8(r29)
/* 01EDD4 80021DD4 8063002C */  lwz       r3, 0x2c(r3)
/* 01EDD8 80021DD8 4804AB39 */  bl        ramGetBuffer
/* 01EDDC 80021DDC 2C030000 */  cmpwi     r3, 0x0
/* 01EDE0 80021DE0 40820210 */  bne       lbl_80021FF0
/* 01EDE4 80021DE4 38600000 */  li        r3, 0x0
/* 01EDE8 80021DE8 48000EF8 */  b         lbl_80022CE0
lbl_80021DEC:
/* 01EDEC 80021DEC 5480477E */  extrwi    r0, r4, 3, 5
/* 01EDF0 80021DF0 1CA0002C */  mulli     r5, r0, 0x2c
/* 01EDF4 80021DF4 3CA50004 */  addis     r5, r5, 0x4
/* 01EDF8 80021DF8 38A5C358 */  subi      r5, r5, 0x3ca8
/* 01EDFC 80021DFC 7CBE2A14 */  add       r5, r30, r5
/* 01EE00 80021E00 54666FBE */  extrwi    r6, r3, 2, 11
/* 01EE04 80021E04 90C50000 */  stw       r6, 0x0(r5)
/* 01EE08 80021E08 546605FE */  clrlwi    r6, r3, 23
/* 01EE0C 80021E0C 5487673E */  extrwi    r7, r4, 4, 8
/* 01EE10 80021E10 90C50004 */  stw       r6, 0x4(r5)
/* 01EE14 80021E14 5466BDFE */  extrwi    r6, r3, 9, 14
/* 01EE18 80021E18 54635F7E */  extrwi    r3, r3, 3, 8
/* 01EE1C 80021E1C 90E50008 */  stw       r7, 0x8(r5)
/* 01EE20 80021E20 548AE73E */  extrwi    r10, r4, 4, 24
/* 01EE24 80021E24 5489973E */  extrwi    r9, r4, 4, 14
/* 01EE28 80021E28 90C5000C */  stw       r6, 0xc(r5)
/* 01EE2C 80021E2C 5488C7BE */  extrwi    r8, r4, 2, 22
/* 01EE30 80021E30 548777BE */  extrwi    r7, r4, 2, 12
/* 01EE34 80021E34 90650010 */  stw       r3, 0x10(r5)
/* 01EE38 80021E38 5486073E */  clrlwi    r6, r4, 28
/* 01EE3C 80021E3C 5483B73E */  extrwi    r3, r4, 4, 18
/* 01EE40 80021E40 B1450014 */  sth       r10, 0x14(r5)
/* 01EE44 80021E44 B1250016 */  sth       r9, 0x16(r5)
/* 01EE48 80021E48 B1050018 */  sth       r8, 0x18(r5)
/* 01EE4C 80021E4C B0E5001A */  sth       r7, 0x1a(r5)
/* 01EE50 80021E50 B0C5001C */  sth       r6, 0x1c(r5)
/* 01EE54 80021E54 B065001E */  sth       r3, 0x1e(r5)
/* 01EE58 80021E58 807E21FC */  lwz       r3, 0x21fc(r30)
/* 01EE5C 80021E5C 90650028 */  stw       r3, 0x28(r5)
/* 01EE60 80021E60 9818D122 */  stb       r0, -0x2ede(r24)
/* 01EE64 80021E64 801E007C */  lwz       r0, 0x7c(r30)
/* 01EE68 80021E68 60000001 */  ori       r0, r0, 0x1
/* 01EE6C 80021E6C 901E007C */  stw       r0, 0x7c(r30)
/* 01EE70 80021E70 939E012C */  stw       r28, 0x12c(r30)
/* 01EE74 80021E74 937E0130 */  stw       r27, 0x130(r30)
/* 01EE78 80021E78 935E0134 */  stw       r26, 0x134(r30)
/* 01EE7C 80021E7C 933E0138 */  stw       r25, 0x138(r30)
/* 01EE80 80021E80 48000170 */  b         lbl_80021FF0
lbl_80021E84:
/* 01EE84 80021E84 5485477E */  extrwi    r5, r4, 3, 5
/* 01EE88 80021E88 1C05002C */  mulli     r0, r5, 0x2c
/* 01EE8C 80021E8C 7D3E0214 */  add       r9, r30, r0
/* 01EE90 80021E90 3CC90004 */  addis     r6, r9, 0x4
/* 01EE94 80021E94 5460A53E */  extrwi    r0, r3, 12, 8
/* 01EE98 80021E98 38C6C378 */  subi      r6, r6, 0x3c88
/* 01EE9C 80021E9C 3CE90004 */  addis     r7, r9, 0x4
/* 01EEA0 80021EA0 B0060000 */  sth       r0, 0x0(r6)
/* 01EEA4 80021EA4 3D090004 */  addis     r8, r9, 0x4
/* 01EEA8 80021EA8 5460053E */  clrlwi    r0, r3, 20
/* 01EEAC 80021EAC 38E7C37A */  subi      r7, r7, 0x3c86
/* 01EEB0 80021EB0 B0070000 */  sth       r0, 0x0(r7)
/* 01EEB4 80021EB4 3D290004 */  addis     r9, r9, 0x4
/* 01EEB8 80021EB8 5480A53E */  extrwi    r0, r4, 12, 8
/* 01EEBC 80021EBC 3908C37C */  subi      r8, r8, 0x3c84
/* 01EEC0 80021EC0 B0080000 */  sth       r0, 0x0(r8)
/* 01EEC4 80021EC4 5480053E */  clrlwi    r0, r4, 20
/* 01EEC8 80021EC8 3929C37E */  subi      r9, r9, 0x3c82
/* 01EECC 80021ECC B0090000 */  sth       r0, 0x0(r9)
/* 01EED0 80021ED0 7FC3F378 */  mr        r3, r30
/* 01EED4 80021ED4 38800000 */  li        r4, 0x0
/* 01EED8 80021ED8 91F8C344 */  stw       r15, -0x3cbc(r24)
/* 01EEDC 80021EDC A8060000 */  lha       r0, 0x0(r6)
/* 01EEE0 80021EE0 9018C348 */  stw       r0, -0x3cb8(r24)
/* 01EEE4 80021EE4 A8070000 */  lha       r0, 0x0(r7)
/* 01EEE8 80021EE8 9018C34C */  stw       r0, -0x3cb4(r24)
/* 01EEEC 80021EEC A8080000 */  lha       r0, 0x0(r8)
/* 01EEF0 80021EF0 9018C350 */  stw       r0, -0x3cb0(r24)
/* 01EEF4 80021EF4 A8090000 */  lha       r0, 0x0(r9)
/* 01EEF8 80021EF8 9018C354 */  stw       r0, -0x3cac(r24)
/* 01EEFC 80021EFC 4BFFBB0D */  bl        frameLoadTMEM
/* 01EF00 80021F00 2C030000 */  cmpwi     r3, 0x0
/* 01EF04 80021F04 4082000C */  bne       lbl_80021F10
/* 01EF08 80021F08 38600000 */  li        r3, 0x0
/* 01EF0C 80021F0C 48000DD4 */  b         lbl_80022CE0
lbl_80021F10:
/* 01EF10 80021F10 8818D122 */  lbz       r0, -0x2ede(r24)
/* 01EF14 80021F14 809E21FC */  lwz       r4, 0x21fc(r30)
/* 01EF18 80021F18 1C60002C */  mulli     r3, r0, 0x2c
/* 01EF1C 80021F1C 3C630004 */  addis     r3, r3, 0x4
/* 01EF20 80021F20 3863C380 */  subi      r3, r3, 0x3c80
/* 01EF24 80021F24 7C9E192E */  stwx      r4, r30, r3
/* 01EF28 80021F28 480000C8 */  b         lbl_80021FF0
lbl_80021F2C:
/* 01EF2C 80021F2C 5485477E */  extrwi    r5, r4, 3, 5
/* 01EF30 80021F30 1C05002C */  mulli     r0, r5, 0x2c
/* 01EF34 80021F34 7CDE0214 */  add       r6, r30, r0
/* 01EF38 80021F38 5460A53E */  extrwi    r0, r3, 12, 8
/* 01EF3C 80021F3C 3CC60004 */  addis     r6, r6, 0x4
/* 01EF40 80021F40 B006C378 */  sth       r0, -0x3c88(r6)
/* 01EF44 80021F44 5460053E */  clrlwi    r0, r3, 20
/* 01EF48 80021F48 5483A53E */  extrwi    r3, r4, 12, 8
/* 01EF4C 80021F4C B006C37A */  sth       r0, -0x3c86(r6)
/* 01EF50 80021F50 5484053E */  clrlwi    r4, r4, 20
/* 01EF54 80021F54 38001033 */  li        r0, 0x1033
/* 01EF58 80021F58 B066C37C */  sth       r3, -0x3c84(r6)
/* 01EF5C 80021F5C 7FC3F378 */  mr        r3, r30
/* 01EF60 80021F60 B086C37E */  sth       r4, -0x3c82(r6)
/* 01EF64 80021F64 38800001 */  li        r4, 0x1
/* 01EF68 80021F68 9018C344 */  stw       r0, -0x3cbc(r24)
/* 01EF6C 80021F6C 4BFFBA9D */  bl        frameLoadTMEM
/* 01EF70 80021F70 2C030000 */  cmpwi     r3, 0x0
/* 01EF74 80021F74 4082007C */  bne       lbl_80021FF0
/* 01EF78 80021F78 38600000 */  li        r3, 0x0
/* 01EF7C 80021F7C 48000D64 */  b         lbl_80022CE0
lbl_80021F80:
/* 01EF80 80021F80 5485477E */  extrwi    r5, r4, 3, 5
/* 01EF84 80021F84 548495BE */  extrwi    r4, r4, 10, 8
/* 01EF88 80021F88 7FC3F378 */  mr        r3, r30
/* 01EF8C 80021F8C 4BFFC9C5 */  bl        frameLoadTLUT
/* 01EF90 80021F90 2C030000 */  cmpwi     r3, 0x0
/* 01EF94 80021F94 4082005C */  bne       lbl_80021FF0
/* 01EF98 80021F98 38600000 */  li        r3, 0x0
/* 01EF9C 80021F9C 48000D44 */  b         lbl_80022CE0
lbl_80021FA0:
/* 01EFA0 80021FA0 5480477E */  extrwi    r0, r4, 3, 5
/* 01EFA4 80021FA4 1CA0002C */  mulli     r5, r0, 0x2c
/* 01EFA8 80021FA8 3CA50004 */  addis     r5, r5, 0x4
/* 01EFAC 80021FAC 38A5C358 */  subi      r5, r5, 0x3ca8
/* 01EFB0 80021FB0 7CBE2A14 */  add       r5, r30, r5
/* 01EFB4 80021FB4 5460A53E */  extrwi    r0, r3, 12, 8
/* 01EFB8 80021FB8 B0050020 */  sth       r0, 0x20(r5)
/* 01EFBC 80021FBC 5460053E */  clrlwi    r0, r3, 20
/* 01EFC0 80021FC0 5483A53E */  extrwi    r3, r4, 12, 8
/* 01EFC4 80021FC4 B0050022 */  sth       r0, 0x22(r5)
/* 01EFC8 80021FC8 5480053E */  clrlwi    r0, r4, 20
/* 01EFCC 80021FCC B0650024 */  sth       r3, 0x24(r5)
/* 01EFD0 80021FD0 B0050026 */  sth       r0, 0x26(r5)
/* 01EFD4 80021FD4 801E007C */  lwz       r0, 0x7c(r30)
/* 01EFD8 80021FD8 60000001 */  ori       r0, r0, 0x1
/* 01EFDC 80021FDC 901E007C */  stw       r0, 0x7c(r30)
/* 01EFE0 80021FE0 939E012C */  stw       r28, 0x12c(r30)
/* 01EFE4 80021FE4 937E0130 */  stw       r27, 0x130(r30)
/* 01EFE8 80021FE8 935E0134 */  stw       r26, 0x134(r30)
/* 01EFEC 80021FEC 933E0138 */  stw       r25, 0x138(r30)
lbl_80021FF0:
/* 01EFF0 80021FF0 80740000 */  lwz       r3, 0x0(r20)
/* 01EFF4 80021FF4 80940004 */  lwz       r4, 0x4(r20)
/* 01EFF8 80021FF8 3A940008 */  addi      r20, r20, 0x8
/* 01EFFC 80021FFC 4BFFFD1C */  b         lbl_80021D18
lbl_80022000:
/* 01F000 80022000 928E0000 */  stw       r20, 0x0(r14)
/* 01F004 80022004 38600001 */  li        r3, 0x1
/* 01F008 80022008 48000CD8 */  b         lbl_80022CE0
lbl_8002200C:
/* 01F00C 8002200C 388602AC */  addi      r4, r6, 0x2ac
/* 01F010 80022010 39000000 */  li        r8, 0x0
/* 01F014 80022014 48000004 */  b         lbl_80022018
lbl_80022018:
/* 01F018 80022018 48000004 */  b         lbl_8002201C
lbl_8002201C:
/* 01F01C 8002201C 807F0000 */  lwz       r3, 0x0(r31)
/* 01F020 80022020 80040000 */  lwz       r0, 0x0(r4)
/* 01F024 80022024 5463000E */  clrrwi    r3, r3, 24
/* 01F028 80022028 7C030040 */  cmplw     r3, r0
/* 01F02C 8002202C 408200A8 */  bne       lbl_800220D4
/* 01F030 80022030 38840004 */  addi      r4, r4, 0x4
/* 01F034 80022034 38FF0008 */  addi      r7, r31, 0x8
/* 01F038 80022038 39000001 */  li        r8, 0x1
/* 01F03C 8002203C 80670000 */  lwz       r3, 0x0(r7)
/* 01F040 80022040 80040000 */  lwz       r0, 0x0(r4)
/* 01F044 80022044 5463000E */  clrrwi    r3, r3, 24
/* 01F048 80022048 7C030040 */  cmplw     r3, r0
/* 01F04C 8002204C 40820088 */  bne       lbl_800220D4
/* 01F050 80022050 38840004 */  addi      r4, r4, 0x4
/* 01F054 80022054 38E70008 */  addi      r7, r7, 0x8
/* 01F058 80022058 39000002 */  li        r8, 0x2
/* 01F05C 8002205C 80670000 */  lwz       r3, 0x0(r7)
/* 01F060 80022060 80040000 */  lwz       r0, 0x0(r4)
/* 01F064 80022064 5463000E */  clrrwi    r3, r3, 24
/* 01F068 80022068 7C030040 */  cmplw     r3, r0
/* 01F06C 8002206C 40820068 */  bne       lbl_800220D4
/* 01F070 80022070 38840004 */  addi      r4, r4, 0x4
/* 01F074 80022074 38E70008 */  addi      r7, r7, 0x8
/* 01F078 80022078 39000003 */  li        r8, 0x3
/* 01F07C 8002207C 80670000 */  lwz       r3, 0x0(r7)
/* 01F080 80022080 80040000 */  lwz       r0, 0x0(r4)
/* 01F084 80022084 5463000E */  clrrwi    r3, r3, 24
/* 01F088 80022088 7C030040 */  cmplw     r3, r0
/* 01F08C 8002208C 40820048 */  bne       lbl_800220D4
/* 01F090 80022090 38840004 */  addi      r4, r4, 0x4
/* 01F094 80022094 38E70008 */  addi      r7, r7, 0x8
/* 01F098 80022098 39000004 */  li        r8, 0x4
/* 01F09C 8002209C 80670000 */  lwz       r3, 0x0(r7)
/* 01F0A0 800220A0 80040000 */  lwz       r0, 0x0(r4)
/* 01F0A4 800220A4 5463000E */  clrrwi    r3, r3, 24
/* 01F0A8 800220A8 7C030040 */  cmplw     r3, r0
/* 01F0AC 800220AC 40820028 */  bne       lbl_800220D4
/* 01F0B0 800220B0 38840004 */  addi      r4, r4, 0x4
/* 01F0B4 800220B4 38E70008 */  addi      r7, r7, 0x8
/* 01F0B8 800220B8 39000005 */  li        r8, 0x5
/* 01F0BC 800220BC 80670000 */  lwz       r3, 0x0(r7)
/* 01F0C0 800220C0 80040000 */  lwz       r0, 0x0(r4)
/* 01F0C4 800220C4 5463000E */  clrrwi    r3, r3, 24
/* 01F0C8 800220C8 7C030040 */  cmplw     r3, r0
/* 01F0CC 800220CC 40820008 */  bne       lbl_800220D4
/* 01F0D0 800220D0 39000006 */  li        r8, 0x6
lbl_800220D4:
/* 01F0D4 800220D4 2C080006 */  cmpwi     r8, 0x6
/* 01F0D8 800220D8 408208E0 */  bne       lbl_800229B8
/* 01F0DC 800220DC 807F0050 */  lwz       r3, 0x50(r31)
/* 01F0E0 800220E0 39FE00DC */  addi      r15, r30, 0xdc
/* 01F0E4 800220E4 80DF0054 */  lwz       r6, 0x54(r31)
/* 01F0E8 800220E8 388F000C */  addi      r4, r15, 0xc
/* 01F0EC 800220EC 8245000C */  lwz       r18, 0xc(r5)
/* 01F0F0 800220F0 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F0F4 800220F4 900F0008 */  stw       r0, 0x8(r15)
/* 01F0F8 800220F8 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F0FC 800220FC 5463053E */  clrlwi    r3, r3, 20
/* 01F100 80022100 900F0000 */  stw       r0, 0x0(r15)
/* 01F104 80022104 38630001 */  addi      r3, r3, 0x1
/* 01F108 80022108 54C0473E */  extrwi    r0, r6, 4, 4
/* 01F10C 8002210C 906F0004 */  stw       r3, 0x4(r15)
/* 01F110 80022110 5403103A */  slwi      r3, r0, 2
/* 01F114 80022114 54C0023E */  clrlwi    r0, r6, 8
/* 01F118 80022118 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F11C 8002211C 38633928 */  addi      r3, r3, 0x3928
/* 01F120 80022120 38C00000 */  li        r6, 0x0
/* 01F124 80022124 80A50034 */  lwz       r5, 0x34(r5)
/* 01F128 80022128 7C65182E */  lwzx      r3, r5, r3
/* 01F12C 8002212C 7CA30214 */  add       r5, r3, r0
/* 01F130 80022130 90AF0010 */  stw       r5, 0x10(r15)
/* 01F134 80022134 807D0008 */  lwz       r3, 0x8(r29)
/* 01F138 80022138 8063002C */  lwz       r3, 0x2c(r3)
/* 01F13C 8002213C 4804A7D5 */  bl        ramGetBuffer
/* 01F140 80022140 2C030000 */  cmpwi     r3, 0x0
/* 01F144 80022144 4082000C */  bne       lbl_80022150
/* 01F148 80022148 38600000 */  li        r3, 0x0
/* 01F14C 8002214C 48000B94 */  b         lbl_80022CE0
lbl_80022150:
/* 01F150 80022150 815F0064 */  lwz       r10, 0x64(r31)
/* 01F154 80022154 3C6000FC */  lis       r3, 0xfc
/* 01F158 80022158 813F0060 */  lwz       r9, 0x60(r31)
/* 01F15C 8002215C 3A231034 */  addi      r17, r3, 0x1034
/* 01F160 80022160 5545477E */  extrwi    r5, r10, 3, 5
/* 01F164 80022164 1C85002C */  mulli     r4, r5, 0x2c
/* 01F168 80022168 3E1E0004 */  addis     r16, r30, 0x4
/* 01F16C 8002216C 7CD02214 */  add       r6, r16, r4
/* 01F170 80022170 7CF02214 */  add       r7, r16, r4
/* 01F174 80022174 5520A53E */  extrwi    r0, r9, 12, 8
/* 01F178 80022178 38C6C378 */  subi      r6, r6, 0x3c88
/* 01F17C 8002217C B0060000 */  sth       r0, 0x0(r6)
/* 01F180 80022180 5520053E */  clrlwi    r0, r9, 20
/* 01F184 80022184 38E7C37A */  subi      r7, r7, 0x3c86
/* 01F188 80022188 7D102214 */  add       r8, r16, r4
/* 01F18C 8002218C B0070000 */  sth       r0, 0x0(r7)
/* 01F190 80022190 7D302214 */  add       r9, r16, r4
/* 01F194 80022194 5540A53E */  extrwi    r0, r10, 12, 8
/* 01F198 80022198 3908C37C */  subi      r8, r8, 0x3c84
/* 01F19C 8002219C B0080000 */  sth       r0, 0x0(r8)
/* 01F1A0 800221A0 5540053E */  clrlwi    r0, r10, 20
/* 01F1A4 800221A4 3929C37E */  subi      r9, r9, 0x3c82
/* 01F1A8 800221A8 B0090000 */  sth       r0, 0x0(r9)
/* 01F1AC 800221AC 7FC3F378 */  mr        r3, r30
/* 01F1B0 800221B0 38800000 */  li        r4, 0x0
/* 01F1B4 800221B4 9230C344 */  stw       r17, -0x3cbc(r16)
/* 01F1B8 800221B8 A8060000 */  lha       r0, 0x0(r6)
/* 01F1BC 800221BC 9010C348 */  stw       r0, -0x3cb8(r16)
/* 01F1C0 800221C0 A8070000 */  lha       r0, 0x0(r7)
/* 01F1C4 800221C4 9010C34C */  stw       r0, -0x3cb4(r16)
/* 01F1C8 800221C8 A8080000 */  lha       r0, 0x0(r8)
/* 01F1CC 800221CC 9010C350 */  stw       r0, -0x3cb0(r16)
/* 01F1D0 800221D0 A8090000 */  lha       r0, 0x0(r9)
/* 01F1D4 800221D4 9010C354 */  stw       r0, -0x3cac(r16)
/* 01F1D8 800221D8 4BFFB831 */  bl        frameLoadTMEM
/* 01F1DC 800221DC 2C030000 */  cmpwi     r3, 0x0
/* 01F1E0 800221E0 4082000C */  bne       lbl_800221EC
/* 01F1E4 800221E4 38600000 */  li        r3, 0x0
/* 01F1E8 800221E8 48000AF8 */  b         lbl_80022CE0
lbl_800221EC:
/* 01F1EC 800221EC 8810D122 */  lbz       r0, -0x2ede(r16)
/* 01F1F0 800221F0 7E439378 */  mr        r3, r18
/* 01F1F4 800221F4 80BE21FC */  lwz       r5, 0x21fc(r30)
/* 01F1F8 800221F8 39200001 */  li        r9, 0x1
/* 01F1FC 800221FC 1C00002C */  mulli     r0, r0, 0x2c
/* 01F200 80022200 7C900214 */  add       r4, r16, r0
/* 01F204 80022204 90A4C380 */  stw       r5, -0x3c80(r4)
/* 01F208 80022208 80DF0070 */  lwz       r6, 0x70(r31)
/* 01F20C 8002220C 811F0074 */  lwz       r8, 0x74(r31)
/* 01F210 80022210 54C0A53E */  extrwi    r0, r6, 12, 8
/* 01F214 80022214 809E00E8 */  lwz       r4, 0xe8(r30)
/* 01F218 80022218 5507A53E */  extrwi    r7, r8, 12, 8
/* 01F21C 8002221C 7C070050 */  subf      r0, r7, r0
/* 01F220 80022220 7C051670 */  srawi     r5, r0, 2
/* 01F224 80022224 5508053E */  clrlwi    r8, r8, 20
/* 01F228 80022228 54C0053E */  clrlwi    r0, r6, 20
/* 01F22C 8002222C 7C080050 */  subf      r0, r8, r0
/* 01F230 80022230 7C061670 */  srawi     r6, r0, 2
/* 01F234 80022234 7CE71670 */  srawi     r7, r7, 2
/* 01F238 80022238 38A50001 */  addi      r5, r5, 0x1
/* 01F23C 8002223C 38C60001 */  addi      r6, r6, 0x1
/* 01F240 80022240 7D081670 */  srawi     r8, r8, 2
/* 01F244 80022244 48000C09 */  bl        PanelDrawBG16
/* 01F248 80022248 807F00A0 */  lwz       r3, 0xa0(r31)
/* 01F24C 8002224C 388F000C */  addi      r4, r15, 0xc
/* 01F250 80022250 80FF00A4 */  lwz       r7, 0xa4(r31)
/* 01F254 80022254 38C00000 */  li        r6, 0x0
/* 01F258 80022258 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F25C 8002225C 900F0008 */  stw       r0, 0x8(r15)
/* 01F260 80022260 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F264 80022264 5463053E */  clrlwi    r3, r3, 20
/* 01F268 80022268 900F0000 */  stw       r0, 0x0(r15)
/* 01F26C 8002226C 38630001 */  addi      r3, r3, 0x1
/* 01F270 80022270 54E0473E */  extrwi    r0, r7, 4, 4
/* 01F274 80022274 906F0004 */  stw       r3, 0x4(r15)
/* 01F278 80022278 5403103A */  slwi      r3, r0, 2
/* 01F27C 8002227C 38633928 */  addi      r3, r3, 0x3928
/* 01F280 80022280 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F284 80022284 54E0023E */  clrlwi    r0, r7, 8
/* 01F288 80022288 80A50034 */  lwz       r5, 0x34(r5)
/* 01F28C 8002228C 7C65182E */  lwzx      r3, r5, r3
/* 01F290 80022290 7CA30214 */  add       r5, r3, r0
/* 01F294 80022294 90AF0010 */  stw       r5, 0x10(r15)
/* 01F298 80022298 807D0008 */  lwz       r3, 0x8(r29)
/* 01F29C 8002229C 8063002C */  lwz       r3, 0x2c(r3)
/* 01F2A0 800222A0 4804A671 */  bl        ramGetBuffer
/* 01F2A4 800222A4 2C030000 */  cmpwi     r3, 0x0
/* 01F2A8 800222A8 4082000C */  bne       lbl_800222B4
/* 01F2AC 800222AC 38600000 */  li        r3, 0x0
/* 01F2B0 800222B0 48000A30 */  b         lbl_80022CE0
lbl_800222B4:
/* 01F2B4 800222B4 817F00B4 */  lwz       r11, 0xb4(r31)
/* 01F2B8 800222B8 7FC3F378 */  mr        r3, r30
/* 01F2BC 800222BC 815F00B0 */  lwz       r10, 0xb0(r31)
/* 01F2C0 800222C0 38800000 */  li        r4, 0x0
/* 01F2C4 800222C4 5565477E */  extrwi    r5, r11, 3, 5
/* 01F2C8 800222C8 1CC5002C */  mulli     r6, r5, 0x2c
/* 01F2CC 800222CC 7CF03214 */  add       r7, r16, r6
/* 01F2D0 800222D0 5540A53E */  extrwi    r0, r10, 12, 8
/* 01F2D4 800222D4 38E7C378 */  subi      r7, r7, 0x3c88
/* 01F2D8 800222D8 7D103214 */  add       r8, r16, r6
/* 01F2DC 800222DC B0070000 */  sth       r0, 0x0(r7)
/* 01F2E0 800222E0 7D303214 */  add       r9, r16, r6
/* 01F2E4 800222E4 5540053E */  clrlwi    r0, r10, 20
/* 01F2E8 800222E8 3908C37A */  subi      r8, r8, 0x3c86
/* 01F2EC 800222EC B0080000 */  sth       r0, 0x0(r8)
/* 01F2F0 800222F0 7CD03214 */  add       r6, r16, r6
/* 01F2F4 800222F4 5560A53E */  extrwi    r0, r11, 12, 8
/* 01F2F8 800222F8 3929C37C */  subi      r9, r9, 0x3c84
/* 01F2FC 800222FC B0090000 */  sth       r0, 0x0(r9)
/* 01F300 80022300 5560053E */  clrlwi    r0, r11, 20
/* 01F304 80022304 38C6C37E */  subi      r6, r6, 0x3c82
/* 01F308 80022308 B0060000 */  sth       r0, 0x0(r6)
/* 01F30C 8002230C 9230C344 */  stw       r17, -0x3cbc(r16)
/* 01F310 80022310 A8070000 */  lha       r0, 0x0(r7)
/* 01F314 80022314 9010C348 */  stw       r0, -0x3cb8(r16)
/* 01F318 80022318 A8080000 */  lha       r0, 0x0(r8)
/* 01F31C 8002231C 9010C34C */  stw       r0, -0x3cb4(r16)
/* 01F320 80022320 A8090000 */  lha       r0, 0x0(r9)
/* 01F324 80022324 9010C350 */  stw       r0, -0x3cb0(r16)
/* 01F328 80022328 A8060000 */  lha       r0, 0x0(r6)
/* 01F32C 8002232C 9010C354 */  stw       r0, -0x3cac(r16)
/* 01F330 80022330 4BFFB6D9 */  bl        frameLoadTMEM
/* 01F334 80022334 2C030000 */  cmpwi     r3, 0x0
/* 01F338 80022338 4082000C */  bne       lbl_80022344
/* 01F33C 8002233C 38600000 */  li        r3, 0x0
/* 01F340 80022340 480009A0 */  b         lbl_80022CE0
lbl_80022344:
/* 01F344 80022344 8810D122 */  lbz       r0, -0x2ede(r16)
/* 01F348 80022348 7E439378 */  mr        r3, r18
/* 01F34C 8002234C 80BE21FC */  lwz       r5, 0x21fc(r30)
/* 01F350 80022350 39200000 */  li        r9, 0x0
/* 01F354 80022354 1C00002C */  mulli     r0, r0, 0x2c
/* 01F358 80022358 7C900214 */  add       r4, r16, r0
/* 01F35C 8002235C 90A4C380 */  stw       r5, -0x3c80(r4)
/* 01F360 80022360 80FF00C4 */  lwz       r7, 0xc4(r31)
/* 01F364 80022364 80DF00C0 */  lwz       r6, 0xc0(r31)
/* 01F368 80022368 54E8A53E */  extrwi    r8, r7, 12, 8
/* 01F36C 8002236C 809E00E8 */  lwz       r4, 0xe8(r30)
/* 01F370 80022370 54C0A53E */  extrwi    r0, r6, 12, 8
/* 01F374 80022374 7C080050 */  subf      r0, r8, r0
/* 01F378 80022378 7C051670 */  srawi     r5, r0, 2
/* 01F37C 8002237C 54EA053E */  clrlwi    r10, r7, 20
/* 01F380 80022380 54C0053E */  clrlwi    r0, r6, 20
/* 01F384 80022384 7C0A0050 */  subf      r0, r10, r0
/* 01F388 80022388 7C061670 */  srawi     r6, r0, 2
/* 01F38C 8002238C 7D071670 */  srawi     r7, r8, 2
/* 01F390 80022390 38A50001 */  addi      r5, r5, 0x1
/* 01F394 80022394 38C60001 */  addi      r6, r6, 0x1
/* 01F398 80022398 7D481670 */  srawi     r8, r10, 2
/* 01F39C 8002239C 48000AB1 */  bl        PanelDrawBG16
/* 01F3A0 800223A0 807F00E8 */  lwz       r3, 0xe8(r31)
/* 01F3A4 800223A4 388F000C */  addi      r4, r15, 0xc
/* 01F3A8 800223A8 80FF00EC */  lwz       r7, 0xec(r31)
/* 01F3AC 800223AC 38C00000 */  li        r6, 0x0
/* 01F3B0 800223B0 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F3B4 800223B4 900F0008 */  stw       r0, 0x8(r15)
/* 01F3B8 800223B8 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F3BC 800223BC 5463053E */  clrlwi    r3, r3, 20
/* 01F3C0 800223C0 900F0000 */  stw       r0, 0x0(r15)
/* 01F3C4 800223C4 38630001 */  addi      r3, r3, 0x1
/* 01F3C8 800223C8 54E0473E */  extrwi    r0, r7, 4, 4
/* 01F3CC 800223CC 906F0004 */  stw       r3, 0x4(r15)
/* 01F3D0 800223D0 5403103A */  slwi      r3, r0, 2
/* 01F3D4 800223D4 38633928 */  addi      r3, r3, 0x3928
/* 01F3D8 800223D8 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F3DC 800223DC 54E0023E */  clrlwi    r0, r7, 8
/* 01F3E0 800223E0 80A50034 */  lwz       r5, 0x34(r5)
/* 01F3E4 800223E4 7C65182E */  lwzx      r3, r5, r3
/* 01F3E8 800223E8 7CA30214 */  add       r5, r3, r0
/* 01F3EC 800223EC 90AF0010 */  stw       r5, 0x10(r15)
/* 01F3F0 800223F0 807D0008 */  lwz       r3, 0x8(r29)
/* 01F3F4 800223F4 8063002C */  lwz       r3, 0x2c(r3)
/* 01F3F8 800223F8 4804A519 */  bl        ramGetBuffer
/* 01F3FC 800223FC 2C030000 */  cmpwi     r3, 0x0
/* 01F400 80022400 4082000C */  bne       lbl_8002240C
/* 01F404 80022404 38600000 */  li        r3, 0x0
/* 01F408 80022408 480008D8 */  b         lbl_80022CE0
lbl_8002240C:
/* 01F40C 8002240C 801F010C */  lwz       r0, 0x10c(r31)
/* 01F410 80022410 7FC3F378 */  mr        r3, r30
/* 01F414 80022414 5405477E */  extrwi    r5, r0, 3, 5
/* 01F418 80022418 540495BE */  extrwi    r4, r0, 10, 8
/* 01F41C 8002241C 4BFFC535 */  bl        frameLoadTLUT
/* 01F420 80022420 2C030000 */  cmpwi     r3, 0x0
/* 01F424 80022424 4082000C */  bne       lbl_80022430
/* 01F428 80022428 38600000 */  li        r3, 0x0
/* 01F42C 8002242C 480008B4 */  b         lbl_80022CE0
lbl_80022430:
/* 01F430 80022430 807F0130 */  lwz       r3, 0x130(r31)
/* 01F434 80022434 388F000C */  addi      r4, r15, 0xc
/* 01F438 80022438 80FF0134 */  lwz       r7, 0x134(r31)
/* 01F43C 8002243C 38C00000 */  li        r6, 0x0
/* 01F440 80022440 827E00E8 */  lwz       r19, 0xe8(r30)
/* 01F444 80022444 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F448 80022448 900F0008 */  stw       r0, 0x8(r15)
/* 01F44C 8002244C 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F450 80022450 5463053E */  clrlwi    r3, r3, 20
/* 01F454 80022454 900F0000 */  stw       r0, 0x0(r15)
/* 01F458 80022458 38630001 */  addi      r3, r3, 0x1
/* 01F45C 8002245C 54E0473E */  extrwi    r0, r7, 4, 4
/* 01F460 80022460 906F0004 */  stw       r3, 0x4(r15)
/* 01F464 80022464 5403103A */  slwi      r3, r0, 2
/* 01F468 80022468 38633928 */  addi      r3, r3, 0x3928
/* 01F46C 8002246C 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F470 80022470 54E0023E */  clrlwi    r0, r7, 8
/* 01F474 80022474 80A50034 */  lwz       r5, 0x34(r5)
/* 01F478 80022478 7C65182E */  lwzx      r3, r5, r3
/* 01F47C 8002247C 7CA30214 */  add       r5, r3, r0
/* 01F480 80022480 90AF0010 */  stw       r5, 0x10(r15)
/* 01F484 80022484 807D0008 */  lwz       r3, 0x8(r29)
/* 01F488 80022488 8063002C */  lwz       r3, 0x2c(r3)
/* 01F48C 8002248C 4804A485 */  bl        ramGetBuffer
/* 01F490 80022490 2C030000 */  cmpwi     r3, 0x0
/* 01F494 80022494 4082000C */  bne       lbl_800224A0
/* 01F498 80022498 38600000 */  li        r3, 0x0
/* 01F49C 8002249C 48000844 */  b         lbl_80022CE0
lbl_800224A0:
/* 01F4A0 800224A0 817F0144 */  lwz       r11, 0x144(r31)
/* 01F4A4 800224A4 7FC3F378 */  mr        r3, r30
/* 01F4A8 800224A8 815F0140 */  lwz       r10, 0x140(r31)
/* 01F4AC 800224AC 38800000 */  li        r4, 0x0
/* 01F4B0 800224B0 5565477E */  extrwi    r5, r11, 3, 5
/* 01F4B4 800224B4 1CC5002C */  mulli     r6, r5, 0x2c
/* 01F4B8 800224B8 7CF03214 */  add       r7, r16, r6
/* 01F4BC 800224BC 5540A53E */  extrwi    r0, r10, 12, 8
/* 01F4C0 800224C0 38E7C378 */  subi      r7, r7, 0x3c88
/* 01F4C4 800224C4 7D103214 */  add       r8, r16, r6
/* 01F4C8 800224C8 B0070000 */  sth       r0, 0x0(r7)
/* 01F4CC 800224CC 7D303214 */  add       r9, r16, r6
/* 01F4D0 800224D0 5540053E */  clrlwi    r0, r10, 20
/* 01F4D4 800224D4 3908C37A */  subi      r8, r8, 0x3c86
/* 01F4D8 800224D8 B0080000 */  sth       r0, 0x0(r8)
/* 01F4DC 800224DC 7CD03214 */  add       r6, r16, r6
/* 01F4E0 800224E0 5560A53E */  extrwi    r0, r11, 12, 8
/* 01F4E4 800224E4 3929C37C */  subi      r9, r9, 0x3c84
/* 01F4E8 800224E8 B0090000 */  sth       r0, 0x0(r9)
/* 01F4EC 800224EC 5560053E */  clrlwi    r0, r11, 20
/* 01F4F0 800224F0 38C6C37E */  subi      r6, r6, 0x3c82
/* 01F4F4 800224F4 B0060000 */  sth       r0, 0x0(r6)
/* 01F4F8 800224F8 9230C344 */  stw       r17, -0x3cbc(r16)
/* 01F4FC 800224FC A8070000 */  lha       r0, 0x0(r7)
/* 01F500 80022500 9010C348 */  stw       r0, -0x3cb8(r16)
/* 01F504 80022504 A8080000 */  lha       r0, 0x0(r8)
/* 01F508 80022508 9010C34C */  stw       r0, -0x3cb4(r16)
/* 01F50C 8002250C A8090000 */  lha       r0, 0x0(r9)
/* 01F510 80022510 9010C350 */  stw       r0, -0x3cb0(r16)
/* 01F514 80022514 A8060000 */  lha       r0, 0x0(r6)
/* 01F518 80022518 9010C354 */  stw       r0, -0x3cac(r16)
/* 01F51C 8002251C 4BFFB4ED */  bl        frameLoadTMEM
/* 01F520 80022520 2C030000 */  cmpwi     r3, 0x0
/* 01F524 80022524 4082000C */  bne       lbl_80022530
/* 01F528 80022528 38600000 */  li        r3, 0x0
/* 01F52C 8002252C 480007B4 */  b         lbl_80022CE0
lbl_80022530:
/* 01F530 80022530 8810D122 */  lbz       r0, -0x2ede(r16)
/* 01F534 80022534 7E439378 */  mr        r3, r18
/* 01F538 80022538 80DE21FC */  lwz       r6, 0x21fc(r30)
/* 01F53C 8002253C 7E649B78 */  mr        r4, r19
/* 01F540 80022540 1C00002C */  mulli     r0, r0, 0x2c
/* 01F544 80022544 7CB00214 */  add       r5, r16, r0
/* 01F548 80022548 90C5C380 */  stw       r6, -0x3c80(r5)
/* 01F54C 8002254C 38C00080 */  li        r6, 0x80
/* 01F550 80022550 38E000C0 */  li        r7, 0xc0
/* 01F554 80022554 801F0154 */  lwz       r0, 0x154(r31)
/* 01F558 80022558 39400000 */  li        r10, 0x0
/* 01F55C 8002255C 80BE00E8 */  lwz       r5, 0xe8(r30)
/* 01F560 80022560 5408A53E */  extrwi    r8, r0, 12, 8
/* 01F564 80022564 5400053E */  clrlwi    r0, r0, 20
/* 01F568 80022568 7D081670 */  srawi     r8, r8, 2
/* 01F56C 8002256C 7C091670 */  srawi     r9, r0, 2
/* 01F570 80022570 48000999 */  bl        PanelDrawBG8
/* 01F574 80022574 3BFF0168 */  addi      r31, r31, 0x168
/* 01F578 80022578 48000004 */  b         lbl_8002257C
lbl_8002257C:
/* 01F57C 8002257C 48000004 */  b         lbl_80022580
lbl_80022580:
/* 01F580 80022580 801F0000 */  lwz       r0, 0x0(r31)
/* 01F584 80022584 3BFF0008 */  addi      r31, r31, 0x8
/* 01F588 80022588 5403000E */  clrrwi    r3, r0, 24
/* 01F58C 8002258C 3C034600 */  addis     r0, r3, 0x4600
/* 01F590 80022590 28000000 */  cmplwi    r0, 0x0
/* 01F594 80022594 4082FFEC */  bne       lbl_80022580
/* 01F598 80022598 807F0000 */  lwz       r3, 0x0(r31)
/* 01F59C 8002259C 39FE00DC */  addi      r15, r30, 0xdc
/* 01F5A0 800225A0 80DF0004 */  lwz       r6, 0x4(r31)
/* 01F5A4 800225A4 388F000C */  addi      r4, r15, 0xc
/* 01F5A8 800225A8 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F5AC 800225AC 900F0008 */  stw       r0, 0x8(r15)
/* 01F5B0 800225B0 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F5B4 800225B4 5463053E */  clrlwi    r3, r3, 20
/* 01F5B8 800225B8 900F0000 */  stw       r0, 0x0(r15)
/* 01F5BC 800225BC 38630001 */  addi      r3, r3, 0x1
/* 01F5C0 800225C0 54C0473E */  extrwi    r0, r6, 4, 4
/* 01F5C4 800225C4 906F0004 */  stw       r3, 0x4(r15)
/* 01F5C8 800225C8 5403103A */  slwi      r3, r0, 2
/* 01F5CC 800225CC 54C0023E */  clrlwi    r0, r6, 8
/* 01F5D0 800225D0 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F5D4 800225D4 38633928 */  addi      r3, r3, 0x3928
/* 01F5D8 800225D8 38C00000 */  li        r6, 0x0
/* 01F5DC 800225DC 80A50034 */  lwz       r5, 0x34(r5)
/* 01F5E0 800225E0 7C65182E */  lwzx      r3, r5, r3
/* 01F5E4 800225E4 7CA30214 */  add       r5, r3, r0
/* 01F5E8 800225E8 90AF0010 */  stw       r5, 0x10(r15)
/* 01F5EC 800225EC 807D0008 */  lwz       r3, 0x8(r29)
/* 01F5F0 800225F0 8063002C */  lwz       r3, 0x2c(r3)
/* 01F5F4 800225F4 4804A31D */  bl        ramGetBuffer
/* 01F5F8 800225F8 2C030000 */  cmpwi     r3, 0x0
/* 01F5FC 800225FC 4082000C */  bne       lbl_80022608
/* 01F600 80022600 38600000 */  li        r3, 0x0
/* 01F604 80022604 480006DC */  b         lbl_80022CE0
lbl_80022608:
/* 01F608 80022608 801F0024 */  lwz       r0, 0x24(r31)
/* 01F60C 8002260C 7FC3F378 */  mr        r3, r30
/* 01F610 80022610 5405477E */  extrwi    r5, r0, 3, 5
/* 01F614 80022614 540495BE */  extrwi    r4, r0, 10, 8
/* 01F618 80022618 4BFFC339 */  bl        frameLoadTLUT
/* 01F61C 8002261C 2C030000 */  cmpwi     r3, 0x0
/* 01F620 80022620 4082000C */  bne       lbl_8002262C
/* 01F624 80022624 38600000 */  li        r3, 0x0
/* 01F628 80022628 480006B8 */  b         lbl_80022CE0
lbl_8002262C:
/* 01F62C 8002262C 807F0048 */  lwz       r3, 0x48(r31)
/* 01F630 80022630 388F000C */  addi      r4, r15, 0xc
/* 01F634 80022634 80FF004C */  lwz       r7, 0x4c(r31)
/* 01F638 80022638 38C00000 */  li        r6, 0x0
/* 01F63C 8002263C 821E00E8 */  lwz       r16, 0xe8(r30)
/* 01F640 80022640 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F644 80022644 900F0008 */  stw       r0, 0x8(r15)
/* 01F648 80022648 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F64C 8002264C 5463053E */  clrlwi    r3, r3, 20
/* 01F650 80022650 900F0000 */  stw       r0, 0x0(r15)
/* 01F654 80022654 38630001 */  addi      r3, r3, 0x1
/* 01F658 80022658 54E0473E */  extrwi    r0, r7, 4, 4
/* 01F65C 8002265C 906F0004 */  stw       r3, 0x4(r15)
/* 01F660 80022660 5403103A */  slwi      r3, r0, 2
/* 01F664 80022664 38633928 */  addi      r3, r3, 0x3928
/* 01F668 80022668 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F66C 8002266C 54E0023E */  clrlwi    r0, r7, 8
/* 01F670 80022670 80A50034 */  lwz       r5, 0x34(r5)
/* 01F674 80022674 7C65182E */  lwzx      r3, r5, r3
/* 01F678 80022678 7CA30214 */  add       r5, r3, r0
/* 01F67C 8002267C 90AF0010 */  stw       r5, 0x10(r15)
/* 01F680 80022680 807D0008 */  lwz       r3, 0x8(r29)
/* 01F684 80022684 8063002C */  lwz       r3, 0x2c(r3)
/* 01F688 80022688 4804A289 */  bl        ramGetBuffer
/* 01F68C 8002268C 2C030000 */  cmpwi     r3, 0x0
/* 01F690 80022690 4082000C */  bne       lbl_8002269C
/* 01F694 80022694 38600000 */  li        r3, 0x0
/* 01F698 80022698 48000648 */  b         lbl_80022CE0
lbl_8002269C:
/* 01F69C 8002269C 815F005C */  lwz       r10, 0x5c(r31)
/* 01F6A0 800226A0 3DFE0004 */  addis     r15, r30, 0x4
/* 01F6A4 800226A4 813F0058 */  lwz       r9, 0x58(r31)
/* 01F6A8 800226A8 3C6000FC */  lis       r3, 0xfc
/* 01F6AC 800226AC 5545477E */  extrwi    r5, r10, 3, 5
/* 01F6B0 800226B0 1C85002C */  mulli     r4, r5, 0x2c
/* 01F6B4 800226B4 7CCF2214 */  add       r6, r15, r4
/* 01F6B8 800226B8 5520A53E */  extrwi    r0, r9, 12, 8
/* 01F6BC 800226BC 38C6C378 */  subi      r6, r6, 0x3c88
/* 01F6C0 800226C0 7CEF2214 */  add       r7, r15, r4
/* 01F6C4 800226C4 B0060000 */  sth       r0, 0x0(r6)
/* 01F6C8 800226C8 5520053E */  clrlwi    r0, r9, 20
/* 01F6CC 800226CC 38E7C37A */  subi      r7, r7, 0x3c86
/* 01F6D0 800226D0 7D0F2214 */  add       r8, r15, r4
/* 01F6D4 800226D4 B0070000 */  sth       r0, 0x0(r7)
/* 01F6D8 800226D8 7D2F2214 */  add       r9, r15, r4
/* 01F6DC 800226DC 5540A53E */  extrwi    r0, r10, 12, 8
/* 01F6E0 800226E0 3908C37C */  subi      r8, r8, 0x3c84
/* 01F6E4 800226E4 B0080000 */  sth       r0, 0x0(r8)
/* 01F6E8 800226E8 5540053E */  clrlwi    r0, r10, 20
/* 01F6EC 800226EC 3929C37E */  subi      r9, r9, 0x3c82
/* 01F6F0 800226F0 B0090000 */  sth       r0, 0x0(r9)
/* 01F6F4 800226F4 38031034 */  addi      r0, r3, 0x1034
/* 01F6F8 800226F8 7FC3F378 */  mr        r3, r30
/* 01F6FC 800226FC 900FC344 */  stw       r0, -0x3cbc(r15)
/* 01F700 80022700 38800000 */  li        r4, 0x0
/* 01F704 80022704 A8060000 */  lha       r0, 0x0(r6)
/* 01F708 80022708 900FC348 */  stw       r0, -0x3cb8(r15)
/* 01F70C 8002270C A8070000 */  lha       r0, 0x0(r7)
/* 01F710 80022710 900FC34C */  stw       r0, -0x3cb4(r15)
/* 01F714 80022714 A8080000 */  lha       r0, 0x0(r8)
/* 01F718 80022718 900FC350 */  stw       r0, -0x3cb0(r15)
/* 01F71C 8002271C A8090000 */  lha       r0, 0x0(r9)
/* 01F720 80022720 900FC354 */  stw       r0, -0x3cac(r15)
/* 01F724 80022724 4BFFB2E5 */  bl        frameLoadTMEM
/* 01F728 80022728 2C030000 */  cmpwi     r3, 0x0
/* 01F72C 8002272C 4082000C */  bne       lbl_80022738
/* 01F730 80022730 38600000 */  li        r3, 0x0
/* 01F734 80022734 480005AC */  b         lbl_80022CE0
lbl_80022738:
/* 01F738 80022738 880FD122 */  lbz       r0, -0x2ede(r15)
/* 01F73C 8002273C 7E439378 */  mr        r3, r18
/* 01F740 80022740 80DE21FC */  lwz       r6, 0x21fc(r30)
/* 01F744 80022744 7E048378 */  mr        r4, r16
/* 01F748 80022748 1C00002C */  mulli     r0, r0, 0x2c
/* 01F74C 8002274C 7CAF0214 */  add       r5, r15, r0
/* 01F750 80022750 90C5C380 */  stw       r6, -0x3c80(r5)
/* 01F754 80022754 38C00080 */  li        r6, 0x80
/* 01F758 80022758 38E000C0 */  li        r7, 0xc0
/* 01F75C 8002275C 801F006C */  lwz       r0, 0x6c(r31)
/* 01F760 80022760 39400001 */  li        r10, 0x1
/* 01F764 80022764 80BE00E8 */  lwz       r5, 0xe8(r30)
/* 01F768 80022768 5408A53E */  extrwi    r8, r0, 12, 8
/* 01F76C 8002276C 7D081670 */  srawi     r8, r8, 2
/* 01F770 80022770 5400053E */  clrlwi    r0, r0, 20
/* 01F774 80022774 3908FFEC */  subi      r8, r8, 0x14
/* 01F778 80022778 7C091670 */  srawi     r9, r0, 2
/* 01F77C 8002277C 4800078D */  bl        PanelDrawBG8
/* 01F780 80022780 3BFF0080 */  addi      r31, r31, 0x80
/* 01F784 80022784 48000004 */  b         lbl_80022788
lbl_80022788:
/* 01F788 80022788 48000004 */  b         lbl_8002278C
lbl_8002278C:
/* 01F78C 8002278C 801F0000 */  lwz       r0, 0x0(r31)
/* 01F790 80022790 3BFF0008 */  addi      r31, r31, 0x8
/* 01F794 80022794 5403000E */  clrrwi    r3, r0, 24
/* 01F798 80022798 3C034600 */  addis     r0, r3, 0x4600
/* 01F79C 8002279C 28000000 */  cmplwi    r0, 0x0
/* 01F7A0 800227A0 4082FFEC */  bne       lbl_8002278C
/* 01F7A4 800227A4 807F0000 */  lwz       r3, 0x0(r31)
/* 01F7A8 800227A8 39FE00DC */  addi      r15, r30, 0xdc
/* 01F7AC 800227AC 80DF0004 */  lwz       r6, 0x4(r31)
/* 01F7B0 800227B0 388F000C */  addi      r4, r15, 0xc
/* 01F7B4 800227B4 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F7B8 800227B8 900F0008 */  stw       r0, 0x8(r15)
/* 01F7BC 800227BC 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F7C0 800227C0 5463053E */  clrlwi    r3, r3, 20
/* 01F7C4 800227C4 900F0000 */  stw       r0, 0x0(r15)
/* 01F7C8 800227C8 38630001 */  addi      r3, r3, 0x1
/* 01F7CC 800227CC 54C0473E */  extrwi    r0, r6, 4, 4
/* 01F7D0 800227D0 906F0004 */  stw       r3, 0x4(r15)
/* 01F7D4 800227D4 5403103A */  slwi      r3, r0, 2
/* 01F7D8 800227D8 54C0023E */  clrlwi    r0, r6, 8
/* 01F7DC 800227DC 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F7E0 800227E0 38633928 */  addi      r3, r3, 0x3928
/* 01F7E4 800227E4 38C00000 */  li        r6, 0x0
/* 01F7E8 800227E8 80A50034 */  lwz       r5, 0x34(r5)
/* 01F7EC 800227EC 7C65182E */  lwzx      r3, r5, r3
/* 01F7F0 800227F0 7CA30214 */  add       r5, r3, r0
/* 01F7F4 800227F4 90AF0010 */  stw       r5, 0x10(r15)
/* 01F7F8 800227F8 807D0008 */  lwz       r3, 0x8(r29)
/* 01F7FC 800227FC 8063002C */  lwz       r3, 0x2c(r3)
/* 01F800 80022800 4804A111 */  bl        ramGetBuffer
/* 01F804 80022804 2C030000 */  cmpwi     r3, 0x0
/* 01F808 80022808 4082000C */  bne       lbl_80022814
/* 01F80C 8002280C 38600000 */  li        r3, 0x0
/* 01F810 80022810 480004D0 */  b         lbl_80022CE0
lbl_80022814:
/* 01F814 80022814 801F0024 */  lwz       r0, 0x24(r31)
/* 01F818 80022818 7FC3F378 */  mr        r3, r30
/* 01F81C 8002281C 5405477E */  extrwi    r5, r0, 3, 5
/* 01F820 80022820 540495BE */  extrwi    r4, r0, 10, 8
/* 01F824 80022824 4BFFC12D */  bl        frameLoadTLUT
/* 01F828 80022828 2C030000 */  cmpwi     r3, 0x0
/* 01F82C 8002282C 4082000C */  bne       lbl_80022838
/* 01F830 80022830 38600000 */  li        r3, 0x0
/* 01F834 80022834 480004AC */  b         lbl_80022CE0
lbl_80022838:
/* 01F838 80022838 807F0048 */  lwz       r3, 0x48(r31)
/* 01F83C 8002283C 388F000C */  addi      r4, r15, 0xc
/* 01F840 80022840 80FF004C */  lwz       r7, 0x4c(r31)
/* 01F844 80022844 38C00000 */  li        r6, 0x0
/* 01F848 80022848 821E00E8 */  lwz       r16, 0xe8(r30)
/* 01F84C 8002284C 54605F7E */  extrwi    r0, r3, 3, 8
/* 01F850 80022850 900F0008 */  stw       r0, 0x8(r15)
/* 01F854 80022854 54606FBE */  extrwi    r0, r3, 2, 11
/* 01F858 80022858 5463053E */  clrlwi    r3, r3, 20
/* 01F85C 8002285C 900F0000 */  stw       r0, 0x0(r15)
/* 01F860 80022860 38630001 */  addi      r3, r3, 0x1
/* 01F864 80022864 54E0473E */  extrwi    r0, r7, 4, 4
/* 01F868 80022868 906F0004 */  stw       r3, 0x4(r15)
/* 01F86C 8002286C 5403103A */  slwi      r3, r0, 2
/* 01F870 80022870 38633928 */  addi      r3, r3, 0x3928
/* 01F874 80022874 80BD0008 */  lwz       r5, 0x8(r29)
/* 01F878 80022878 54E0023E */  clrlwi    r0, r7, 8
/* 01F87C 8002287C 80A50034 */  lwz       r5, 0x34(r5)
/* 01F880 80022880 7C65182E */  lwzx      r3, r5, r3
/* 01F884 80022884 7CA30214 */  add       r5, r3, r0
/* 01F888 80022888 90AF0010 */  stw       r5, 0x10(r15)
/* 01F88C 8002288C 807D0008 */  lwz       r3, 0x8(r29)
/* 01F890 80022890 8063002C */  lwz       r3, 0x2c(r3)
/* 01F894 80022894 4804A07D */  bl        ramGetBuffer
/* 01F898 80022898 2C030000 */  cmpwi     r3, 0x0
/* 01F89C 8002289C 4082000C */  bne       lbl_800228A8
/* 01F8A0 800228A0 38600000 */  li        r3, 0x0
/* 01F8A4 800228A4 4800043C */  b         lbl_80022CE0
lbl_800228A8:
/* 01F8A8 800228A8 815F005C */  lwz       r10, 0x5c(r31)
/* 01F8AC 800228AC 3DFE0004 */  addis     r15, r30, 0x4
/* 01F8B0 800228B0 813F0058 */  lwz       r9, 0x58(r31)
/* 01F8B4 800228B4 3C6000FC */  lis       r3, 0xfc
/* 01F8B8 800228B8 5545477E */  extrwi    r5, r10, 3, 5
/* 01F8BC 800228BC 1C85002C */  mulli     r4, r5, 0x2c
/* 01F8C0 800228C0 7CCF2214 */  add       r6, r15, r4
/* 01F8C4 800228C4 5520A53E */  extrwi    r0, r9, 12, 8
/* 01F8C8 800228C8 38C6C378 */  subi      r6, r6, 0x3c88
/* 01F8CC 800228CC 7CEF2214 */  add       r7, r15, r4
/* 01F8D0 800228D0 B0060000 */  sth       r0, 0x0(r6)
/* 01F8D4 800228D4 5520053E */  clrlwi    r0, r9, 20
/* 01F8D8 800228D8 38E7C37A */  subi      r7, r7, 0x3c86
/* 01F8DC 800228DC 7D0F2214 */  add       r8, r15, r4
/* 01F8E0 800228E0 B0070000 */  sth       r0, 0x0(r7)
/* 01F8E4 800228E4 7D2F2214 */  add       r9, r15, r4
/* 01F8E8 800228E8 5540A53E */  extrwi    r0, r10, 12, 8
/* 01F8EC 800228EC 3908C37C */  subi      r8, r8, 0x3c84
/* 01F8F0 800228F0 B0080000 */  sth       r0, 0x0(r8)
/* 01F8F4 800228F4 5540053E */  clrlwi    r0, r10, 20
/* 01F8F8 800228F8 3929C37E */  subi      r9, r9, 0x3c82
/* 01F8FC 800228FC B0090000 */  sth       r0, 0x0(r9)
/* 01F900 80022900 38031034 */  addi      r0, r3, 0x1034
/* 01F904 80022904 7FC3F378 */  mr        r3, r30
/* 01F908 80022908 900FC344 */  stw       r0, -0x3cbc(r15)
/* 01F90C 8002290C 38800000 */  li        r4, 0x0
/* 01F910 80022910 A8060000 */  lha       r0, 0x0(r6)
/* 01F914 80022914 900FC348 */  stw       r0, -0x3cb8(r15)
/* 01F918 80022918 A8070000 */  lha       r0, 0x0(r7)
/* 01F91C 8002291C 900FC34C */  stw       r0, -0x3cb4(r15)
/* 01F920 80022920 A8080000 */  lha       r0, 0x0(r8)
/* 01F924 80022924 900FC350 */  stw       r0, -0x3cb0(r15)
/* 01F928 80022928 A8090000 */  lha       r0, 0x0(r9)
/* 01F92C 8002292C 900FC354 */  stw       r0, -0x3cac(r15)
/* 01F930 80022930 4BFFB0D9 */  bl        frameLoadTMEM
/* 01F934 80022934 2C030000 */  cmpwi     r3, 0x0
/* 01F938 80022938 4082000C */  bne       lbl_80022944
/* 01F93C 8002293C 38600000 */  li        r3, 0x0
/* 01F940 80022940 480003A0 */  b         lbl_80022CE0
lbl_80022944:
/* 01F944 80022944 880FD122 */  lbz       r0, -0x2ede(r15)
/* 01F948 80022948 7E439378 */  mr        r3, r18
/* 01F94C 8002294C 80DE21FC */  lwz       r6, 0x21fc(r30)
/* 01F950 80022950 7E048378 */  mr        r4, r16
/* 01F954 80022954 1C00002C */  mulli     r0, r0, 0x2c
/* 01F958 80022958 7CAF0214 */  add       r5, r15, r0
/* 01F95C 8002295C 90C5C380 */  stw       r6, -0x3c80(r5)
/* 01F960 80022960 38C00040 */  li        r6, 0x40
/* 01F964 80022964 38E00048 */  li        r7, 0x48
/* 01F968 80022968 801F006C */  lwz       r0, 0x6c(r31)
/* 01F96C 8002296C 39400000 */  li        r10, 0x0
/* 01F970 80022970 80BE00E8 */  lwz       r5, 0xe8(r30)
/* 01F974 80022974 5408A53E */  extrwi    r8, r0, 12, 8
/* 01F978 80022978 5400053E */  clrlwi    r0, r0, 20
/* 01F97C 8002297C 7D081670 */  srawi     r8, r8, 2
/* 01F980 80022980 7C091670 */  srawi     r9, r0, 2
/* 01F984 80022984 48000585 */  bl        PanelDrawBG8
/* 01F988 80022988 3BFF0080 */  addi      r31, r31, 0x80
/* 01F98C 8002298C 48000004 */  b         lbl_80022990
lbl_80022990:
/* 01F990 80022990 48000004 */  b         lbl_80022994
lbl_80022994:
/* 01F994 80022994 801F0000 */  lwz       r0, 0x0(r31)
/* 01F998 80022998 3BFF0008 */  addi      r31, r31, 0x8
/* 01F99C 8002299C 5403000E */  clrrwi    r3, r0, 24
/* 01F9A0 800229A0 3C034600 */  addis     r0, r3, 0x4600
/* 01F9A4 800229A4 28000000 */  cmplwi    r0, 0x0
/* 01F9A8 800229A8 4082FFEC */  bne       lbl_80022994
/* 01F9AC 800229AC 93EE0000 */  stw       r31, 0x0(r14)
/* 01F9B0 800229B0 38600001 */  li        r3, 0x1
/* 01F9B4 800229B4 4800032C */  b         lbl_80022CE0
lbl_800229B8:
/* 01F9B8 800229B8 3886027C */  addi      r4, r6, 0x27c
/* 01F9BC 800229BC 38E00000 */  li        r7, 0x0
/* 01F9C0 800229C0 48000004 */  b         lbl_800229C4
lbl_800229C4:
/* 01F9C4 800229C4 48000004 */  b         lbl_800229C8
lbl_800229C8:
/* 01F9C8 800229C8 807F0000 */  lwz       r3, 0x0(r31)
/* 01F9CC 800229CC 80040000 */  lwz       r0, 0x0(r4)
/* 01F9D0 800229D0 5463000E */  clrrwi    r3, r3, 24
/* 01F9D4 800229D4 7C030040 */  cmplw     r3, r0
/* 01F9D8 800229D8 408200C8 */  bne       lbl_80022AA0
/* 01F9DC 800229DC 38840004 */  addi      r4, r4, 0x4
/* 01F9E0 800229E0 38DF0008 */  addi      r6, r31, 0x8
/* 01F9E4 800229E4 38E00001 */  li        r7, 0x1
/* 01F9E8 800229E8 80660000 */  lwz       r3, 0x0(r6)
/* 01F9EC 800229EC 80040000 */  lwz       r0, 0x0(r4)
/* 01F9F0 800229F0 5463000E */  clrrwi    r3, r3, 24
/* 01F9F4 800229F4 7C030040 */  cmplw     r3, r0
/* 01F9F8 800229F8 408200A8 */  bne       lbl_80022AA0
/* 01F9FC 800229FC 38840004 */  addi      r4, r4, 0x4
/* 01FA00 80022A00 38C60008 */  addi      r6, r6, 0x8
/* 01FA04 80022A04 38E00002 */  li        r7, 0x2
/* 01FA08 80022A08 80660000 */  lwz       r3, 0x0(r6)
/* 01FA0C 80022A0C 80040000 */  lwz       r0, 0x0(r4)
/* 01FA10 80022A10 5463000E */  clrrwi    r3, r3, 24
/* 01FA14 80022A14 7C030040 */  cmplw     r3, r0
/* 01FA18 80022A18 40820088 */  bne       lbl_80022AA0
/* 01FA1C 80022A1C 38840004 */  addi      r4, r4, 0x4
/* 01FA20 80022A20 38C60008 */  addi      r6, r6, 0x8
/* 01FA24 80022A24 38E00003 */  li        r7, 0x3
/* 01FA28 80022A28 80660000 */  lwz       r3, 0x0(r6)
/* 01FA2C 80022A2C 80040000 */  lwz       r0, 0x0(r4)
/* 01FA30 80022A30 5463000E */  clrrwi    r3, r3, 24
/* 01FA34 80022A34 7C030040 */  cmplw     r3, r0
/* 01FA38 80022A38 40820068 */  bne       lbl_80022AA0
/* 01FA3C 80022A3C 38840004 */  addi      r4, r4, 0x4
/* 01FA40 80022A40 38C60008 */  addi      r6, r6, 0x8
/* 01FA44 80022A44 38E00004 */  li        r7, 0x4
/* 01FA48 80022A48 80660000 */  lwz       r3, 0x0(r6)
/* 01FA4C 80022A4C 80040000 */  lwz       r0, 0x0(r4)
/* 01FA50 80022A50 5463000E */  clrrwi    r3, r3, 24
/* 01FA54 80022A54 7C030040 */  cmplw     r3, r0
/* 01FA58 80022A58 40820048 */  bne       lbl_80022AA0
/* 01FA5C 80022A5C 38840004 */  addi      r4, r4, 0x4
/* 01FA60 80022A60 38C60008 */  addi      r6, r6, 0x8
/* 01FA64 80022A64 38E00005 */  li        r7, 0x5
/* 01FA68 80022A68 80660000 */  lwz       r3, 0x0(r6)
/* 01FA6C 80022A6C 80040000 */  lwz       r0, 0x0(r4)
/* 01FA70 80022A70 5463000E */  clrrwi    r3, r3, 24
/* 01FA74 80022A74 7C030040 */  cmplw     r3, r0
/* 01FA78 80022A78 40820028 */  bne       lbl_80022AA0
/* 01FA7C 80022A7C 38840004 */  addi      r4, r4, 0x4
/* 01FA80 80022A80 38C60008 */  addi      r6, r6, 0x8
/* 01FA84 80022A84 38E00006 */  li        r7, 0x6
/* 01FA88 80022A88 80660000 */  lwz       r3, 0x0(r6)
/* 01FA8C 80022A8C 80040000 */  lwz       r0, 0x0(r4)
/* 01FA90 80022A90 5463000E */  clrrwi    r3, r3, 24
/* 01FA94 80022A94 7C030040 */  cmplw     r3, r0
/* 01FA98 80022A98 40820008 */  bne       lbl_80022AA0
/* 01FA9C 80022A9C 38E00007 */  li        r7, 0x7
lbl_80022AA0:
/* 01FAA0 80022AA0 2C070007 */  cmpwi     r7, 0x7
/* 01FAA4 80022AA4 40820238 */  bne       lbl_80022CDC
/* 01FAA8 80022AA8 80DF0024 */  lwz       r6, 0x24(r31)
/* 01FAAC 80022AAC 7E238B78 */  mr        r3, r17
/* 01FAB0 80022AB0 8205000C */  lwz       r16, 0xc(r5)
/* 01FAB4 80022AB4 3A5E00DC */  addi      r18, r30, 0xdc
/* 01FAB8 80022AB8 54C0473E */  extrwi    r0, r6, 4, 4
/* 01FABC 80022ABC 5400103A */  slwi      r0, r0, 2
/* 01FAC0 80022AC0 7C910214 */  add       r4, r17, r0
/* 01FAC4 80022AC4 80843928 */  lwz       r4, 0x3928(r4)
/* 01FAC8 80022AC8 54C0023E */  clrlwi    r0, r6, 8
/* 01FACC 80022ACC 38A10038 */  addi      r5, r1, 0x38
/* 01FAD0 80022AD0 7C840214 */  add       r4, r4, r0
/* 01FAD4 80022AD4 38C10034 */  addi      r6, r1, 0x34
/* 01FAD8 80022AD8 48056911 */  bl        rspFillObjTxtr
/* 01FADC 80022ADC 2C030000 */  cmpwi     r3, 0x0
/* 01FAE0 80022AE0 4082000C */  bne       lbl_80022AEC
/* 01FAE4 80022AE4 38600000 */  li        r3, 0x0
/* 01FAE8 80022AE8 480001F8 */  b         lbl_80022CE0
lbl_80022AEC:
/* 01FAEC 80022AEC 8101003C */  lwz       r8, 0x3c(r1)
/* 01FAF0 80022AF0 7FC3F378 */  mr        r3, r30
/* 01FAF4 80022AF4 7E248B78 */  mr        r4, r17
/* 01FAF8 80022AF8 38A00000 */  li        r5, 0x0
/* 01FAFC 80022AFC 38C00001 */  li        r6, 0x1
/* 01FB00 80022B00 38E00002 */  li        r7, 0x2
/* 01FB04 80022B04 480575B1 */  bl        rspSetImage
/* 01FB08 80022B08 2C030000 */  cmpwi     r3, 0x0
/* 01FB0C 80022B0C 4082000C */  bne       lbl_80022B18
/* 01FB10 80022B10 38600000 */  li        r3, 0x0
/* 01FB14 80022B14 480001CC */  b         lbl_80022CE0
lbl_80022B18:
/* 01FB18 80022B18 80DF0034 */  lwz       r6, 0x34(r31)
/* 01FB1C 80022B1C 7E238B78 */  mr        r3, r17
/* 01FB20 80022B20 81FE00E8 */  lwz       r15, 0xe8(r30)
/* 01FB24 80022B24 38A10050 */  addi      r5, r1, 0x50
/* 01FB28 80022B28 54C0473E */  extrwi    r0, r6, 4, 4
/* 01FB2C 80022B2C 5400103A */  slwi      r0, r0, 2
/* 01FB30 80022B30 7C910214 */  add       r4, r17, r0
/* 01FB34 80022B34 80843928 */  lwz       r4, 0x3928(r4)
/* 01FB38 80022B38 54C0023E */  clrlwi    r0, r6, 8
/* 01FB3C 80022B3C 7C840214 */  add       r4, r4, r0
/* 01FB40 80022B40 48057609 */  bl        rspFillObjBg
/* 01FB44 80022B44 80A10060 */  lwz       r5, 0x60(r1)
/* 01FB48 80022B48 3892000C */  addi      r4, r18, 0xc
/* 01FB4C 80022B4C 38C00000 */  li        r6, 0x0
/* 01FB50 80022B50 54A0473E */  extrwi    r0, r5, 4, 4
/* 01FB54 80022B54 5400103A */  slwi      r0, r0, 2
/* 01FB58 80022B58 7C710214 */  add       r3, r17, r0
/* 01FB5C 80022B5C 80633928 */  lwz       r3, 0x3928(r3)
/* 01FB60 80022B60 54A0023E */  clrlwi    r0, r5, 8
/* 01FB64 80022B64 7CA30214 */  add       r5, r3, r0
/* 01FB68 80022B68 90B20010 */  stw       r5, 0x10(r18)
/* 01FB6C 80022B6C 807138E8 */  lwz       r3, 0x38e8(r17)
/* 01FB70 80022B70 8063002C */  lwz       r3, 0x2c(r3)
/* 01FB74 80022B74 48049D9D */  bl        ramGetBuffer
/* 01FB78 80022B78 2C030000 */  cmpwi     r3, 0x0
/* 01FB7C 80022B7C 4082000C */  bne       lbl_80022B88
/* 01FB80 80022B80 38600000 */  li        r3, 0x0
/* 01FB84 80022B84 4800015C */  b         lbl_80022CE0
lbl_80022B88:
/* 01FB88 80022B88 A0A10052 */  lhz       r5, 0x52(r1)
/* 01FB8C 80022B8C 7E038378 */  mr        r3, r16
/* 01FB90 80022B90 A001005A */  lhz       r0, 0x5a(r1)
/* 01FB94 80022B94 7DE47B78 */  mr        r4, r15
/* 01FB98 80022B98 7CA61670 */  srawi     r6, r5, 2
/* 01FB9C 80022B9C 7C071670 */  srawi     r7, r0, 2
/* 01FBA0 80022BA0 A9010054 */  lha       r8, 0x54(r1)
/* 01FBA4 80022BA4 A801005C */  lha       r0, 0x5c(r1)
/* 01FBA8 80022BA8 7D081670 */  srawi     r8, r8, 2
/* 01FBAC 80022BAC 80B2000C */  lwz       r5, 0xc(r18)
/* 01FBB0 80022BB0 A141006A */  lhz       r10, 0x6a(r1)
/* 01FBB4 80022BB4 7C091670 */  srawi     r9, r0, 2
/* 01FBB8 80022BB8 48000351 */  bl        PanelDrawBG8
/* 01FBBC 80022BBC 80DF004C */  lwz       r6, 0x4c(r31)
/* 01FBC0 80022BC0 7E238B78 */  mr        r3, r17
/* 01FBC4 80022BC4 38A10038 */  addi      r5, r1, 0x38
/* 01FBC8 80022BC8 54C0473E */  extrwi    r0, r6, 4, 4
/* 01FBCC 80022BCC 5400103A */  slwi      r0, r0, 2
/* 01FBD0 80022BD0 7C910214 */  add       r4, r17, r0
/* 01FBD4 80022BD4 80843928 */  lwz       r4, 0x3928(r4)
/* 01FBD8 80022BD8 54C0023E */  clrlwi    r0, r6, 8
/* 01FBDC 80022BDC 38C10034 */  addi      r6, r1, 0x34
/* 01FBE0 80022BE0 7C840214 */  add       r4, r4, r0
/* 01FBE4 80022BE4 48056805 */  bl        rspFillObjTxtr
/* 01FBE8 80022BE8 2C030000 */  cmpwi     r3, 0x0
/* 01FBEC 80022BEC 4082000C */  bne       lbl_80022BF8
/* 01FBF0 80022BF0 38600000 */  li        r3, 0x0
/* 01FBF4 80022BF4 480000EC */  b         lbl_80022CE0
lbl_80022BF8:
/* 01FBF8 80022BF8 8101003C */  lwz       r8, 0x3c(r1)
/* 01FBFC 80022BFC 7FC3F378 */  mr        r3, r30
/* 01FC00 80022C00 7E248B78 */  mr        r4, r17
/* 01FC04 80022C04 38A00000 */  li        r5, 0x0
/* 01FC08 80022C08 38C00001 */  li        r6, 0x1
/* 01FC0C 80022C0C 38E00002 */  li        r7, 0x2
/* 01FC10 80022C10 480574A5 */  bl        rspSetImage
/* 01FC14 80022C14 2C030000 */  cmpwi     r3, 0x0
/* 01FC18 80022C18 4082000C */  bne       lbl_80022C24
/* 01FC1C 80022C1C 38600000 */  li        r3, 0x0
/* 01FC20 80022C20 480000C0 */  b         lbl_80022CE0
lbl_80022C24:
/* 01FC24 80022C24 80DF005C */  lwz       r6, 0x5c(r31)
/* 01FC28 80022C28 7E238B78 */  mr        r3, r17
/* 01FC2C 80022C2C 81FE00E8 */  lwz       r15, 0xe8(r30)
/* 01FC30 80022C30 38A10050 */  addi      r5, r1, 0x50
/* 01FC34 80022C34 54C0473E */  extrwi    r0, r6, 4, 4
/* 01FC38 80022C38 5400103A */  slwi      r0, r0, 2
/* 01FC3C 80022C3C 7C910214 */  add       r4, r17, r0
/* 01FC40 80022C40 80843928 */  lwz       r4, 0x3928(r4)
/* 01FC44 80022C44 54C0023E */  clrlwi    r0, r6, 8
/* 01FC48 80022C48 7C840214 */  add       r4, r4, r0
/* 01FC4C 80022C4C 480574FD */  bl        rspFillObjBg
/* 01FC50 80022C50 80A10060 */  lwz       r5, 0x60(r1)
/* 01FC54 80022C54 3892000C */  addi      r4, r18, 0xc
/* 01FC58 80022C58 38C00000 */  li        r6, 0x0
/* 01FC5C 80022C5C 54A0473E */  extrwi    r0, r5, 4, 4
/* 01FC60 80022C60 5400103A */  slwi      r0, r0, 2
/* 01FC64 80022C64 7C710214 */  add       r3, r17, r0
/* 01FC68 80022C68 80633928 */  lwz       r3, 0x3928(r3)
/* 01FC6C 80022C6C 54A0023E */  clrlwi    r0, r5, 8
/* 01FC70 80022C70 7CA30214 */  add       r5, r3, r0
/* 01FC74 80022C74 90B20010 */  stw       r5, 0x10(r18)
/* 01FC78 80022C78 807138E8 */  lwz       r3, 0x38e8(r17)
/* 01FC7C 80022C7C 8063002C */  lwz       r3, 0x2c(r3)
/* 01FC80 80022C80 48049C91 */  bl        ramGetBuffer
/* 01FC84 80022C84 2C030000 */  cmpwi     r3, 0x0
/* 01FC88 80022C88 4082000C */  bne       lbl_80022C94
/* 01FC8C 80022C8C 38600000 */  li        r3, 0x0
/* 01FC90 80022C90 48000050 */  b         lbl_80022CE0
lbl_80022C94:
/* 01FC94 80022C94 A0A10052 */  lhz       r5, 0x52(r1)
/* 01FC98 80022C98 7E038378 */  mr        r3, r16
/* 01FC9C 80022C9C A001005A */  lhz       r0, 0x5a(r1)
/* 01FCA0 80022CA0 7DE47B78 */  mr        r4, r15
/* 01FCA4 80022CA4 7CA61670 */  srawi     r6, r5, 2
/* 01FCA8 80022CA8 7C071670 */  srawi     r7, r0, 2
/* 01FCAC 80022CAC A9010054 */  lha       r8, 0x54(r1)
/* 01FCB0 80022CB0 A801005C */  lha       r0, 0x5c(r1)
/* 01FCB4 80022CB4 7D081670 */  srawi     r8, r8, 2
/* 01FCB8 80022CB8 80B2000C */  lwz       r5, 0xc(r18)
/* 01FCBC 80022CBC A141006A */  lhz       r10, 0x6a(r1)
/* 01FCC0 80022CC0 3908FFEC */  subi      r8, r8, 0x14
/* 01FCC4 80022CC4 7C091670 */  srawi     r9, r0, 2
/* 01FCC8 80022CC8 48000241 */  bl        PanelDrawBG8
/* 01FCCC 80022CCC 381F0060 */  addi      r0, r31, 0x60
/* 01FCD0 80022CD0 900E0000 */  stw       r0, 0x0(r14)
/* 01FCD4 80022CD4 38600001 */  li        r3, 0x1
/* 01FCD8 80022CD8 48000008 */  b         lbl_80022CE0
lbl_80022CDC:
/* 01FCDC 80022CDC 38600000 */  li        r3, 0x0
lbl_80022CE0:
/* 01FCE0 80022CE0 B9C100F0 */  lmw       r14, 0xf0(r1)
/* 01FCE4 80022CE4 8001013C */  lwz       r0, 0x13c(r1)
/* 01FCE8 80022CE8 38210138 */  addi      r1, r1, 0x138
/* 01FCEC 80022CEC 7C0803A6 */  mtlr      r0
/* 01FCF0 80022CF0 4E800020 */  blr

glabel frameHackTIMG_Panel
/* 01FCF4 80022CF4 8003006C */  lwz       r0, 0x6c(r3)
/* 01FCF8 80022CF8 2C000000 */  cmpwi     r0, 0x0
/* 01FCFC 80022CFC 4082000C */  bne       lbl_80022D08
/* 01FD00 80022D00 38600000 */  li        r3, 0x0
/* 01FD04 80022D04 48000090 */  b         lbl_80022D94
lbl_80022D08:
/* 01FD08 80022D08 3CA00036 */  lis       r5, 0x36
/* 01FD0C 80022D0C 80C40010 */  lwz       r6, 0x10(r4)
/* 01FD10 80022D10 38058800 */  subi      r0, r5, 0x7800
/* 01FD14 80022D14 7C060000 */  cmpw      r6, r0
/* 01FD18 80022D18 41800078 */  blt       lbl_80022D90
/* 01FD1C 80022D1C 3CA00038 */  lis       r5, 0x38
/* 01FD20 80022D20 3805B800 */  subi      r0, r5, 0x4800
/* 01FD24 80022D24 7C060000 */  cmpw      r6, r0
/* 01FD28 80022D28 41810068 */  bgt       lbl_80022D90
/* 01FD2C 80022D2C 80040008 */  lwz       r0, 0x8(r4)
/* 01FD30 80022D30 2C000000 */  cmpwi     r0, 0x0
/* 01FD34 80022D34 4082004C */  bne       lbl_80022D80
/* 01FD38 80022D38 80040004 */  lwz       r0, 0x4(r4)
/* 01FD3C 80022D3C 2C000001 */  cmpwi     r0, 0x1
/* 01FD40 80022D40 40820040 */  bne       lbl_80022D80
/* 01FD44 80022D44 80040000 */  lwz       r0, 0x0(r4)
/* 01FD48 80022D48 2C000002 */  cmpwi     r0, 0x2
/* 01FD4C 80022D4C 40820034 */  bne       lbl_80022D80
/* 01FD50 80022D50 3C66FFCA */  subis     r3, r6, 0x36
/* 01FD54 80022D54 38037800 */  addi      r0, r3, 0x7800
/* 01FD58 80022D58 7C030E70 */  srawi     r3, r0, 1
/* 01FD5C 80022D5C 7C630194 */  addze     r3, r3
/* 01FD60 80022D60 380308C0 */  addi      r0, r3, 0x8c0
/* 01FD64 80022D64 3C608016 */  lis       r3, 0x8016
/* 01FD68 80022D68 5405083C */  slwi      r5, r0, 1
/* 01FD6C 80022D6C 380317B0 */  addi      r0, r3, 0x17b0
/* 01FD70 80022D70 7C002A14 */  add       r0, r0, r5
/* 01FD74 80022D74 9004000C */  stw       r0, 0xc(r4)
/* 01FD78 80022D78 38600001 */  li        r3, 0x1
/* 01FD7C 80022D7C 48000018 */  b         lbl_80022D94
lbl_80022D80:
/* 01FD80 80022D80 38000000 */  li        r0, 0x0
/* 01FD84 80022D84 9003006C */  stw       r0, 0x6c(r3)
/* 01FD88 80022D88 38600000 */  li        r3, 0x0
/* 01FD8C 80022D8C 48000008 */  b         lbl_80022D94
lbl_80022D90:
/* 01FD90 80022D90 38600000 */  li        r3, 0x0
lbl_80022D94:
/* 01FD94 80022D94 4E800020 */  blr

glabel PanelDrawFR3D
/* 01FD98 80022D98 9421FFB8 */  stwu      r1, -0x48(r1)
/* 01FD9C 80022D9C 93E10044 */  stw       r31, 0x44(r1)
/* 01FDA0 80022DA0 93C10040 */  stw       r30, 0x40(r1)
/* 01FDA4 80022DA4 93A1003C */  stw       r29, 0x3c(r1)
/* 01FDA8 80022DA8 3BC00000 */  li        r30, 0x0
/* 01FDAC 80022DAC 3BE00000 */  li        r31, 0x0
/* 01FDB0 80022DB0 48000004 */  b         lbl_80022DB4
lbl_80022DB4:
/* 01FDB4 80022DB4 48000004 */  b         lbl_80022DB8
lbl_80022DB8:
/* 01FDB8 80022DB8 48000078 */  b         lbl_80022E30
lbl_80022DBC:
/* 01FDBC 80022DBC 7C09F214 */  add       r0, r9, r30
/* 01FDC0 80022DC0 1C000140 */  mulli     r0, r0, 0x140
/* 01FDC4 80022DC4 7D85FA14 */  add       r12, r5, r31
/* 01FDC8 80022DC8 7C080214 */  add       r0, r8, r0
/* 01FDCC 80022DCC 48000004 */  b         lbl_80022DD0
lbl_80022DD0:
/* 01FDD0 80022DD0 2C060000 */  cmpwi     r6, 0x0
/* 01FDD4 80022DD4 7CC903A6 */  mtctr     r6
/* 01FDD8 80022DD8 540B083C */  slwi      r11, r0, 1
/* 01FDDC 80022DDC 4081004C */  ble       lbl_80022E28
/* 01FDE0 80022DE0 48000004 */  b         lbl_80022DE4
lbl_80022DE4:
/* 01FDE4 80022DE4 880C0000 */  lbz       r0, 0x0(r12)
/* 01FDE8 80022DE8 2C0A0000 */  cmpwi     r10, 0x0
/* 01FDEC 80022DEC 5400083C */  slwi      r0, r0, 1
/* 01FDF0 80022DF0 7FA4022E */  lhzx      r29, r4, r0
/* 01FDF4 80022DF4 41820018 */  beq       lbl_80022E0C
/* 01FDF8 80022DF8 281D6D3F */  cmplwi    r29, 0x6d3f
/* 01FDFC 80022DFC 40820008 */  bne       lbl_80022E04
/* 01FE00 80022E00 3BA06D3E */  li        r29, 0x6d3e
lbl_80022E04:
/* 01FE04 80022E04 7FA35B2E */  sthx      r29, r3, r11
/* 01FE08 80022E08 48000014 */  b         lbl_80022E1C
lbl_80022E0C:
/* 01FE0C 80022E0C 57A007FE */  clrlwi    r0, r29, 31
/* 01FE10 80022E10 2C000000 */  cmpwi     r0, 0x0
/* 01FE14 80022E14 41820008 */  beq       lbl_80022E1C
/* 01FE18 80022E18 7FA35B2E */  sthx      r29, r3, r11
lbl_80022E1C:
/* 01FE1C 80022E1C 398C0001 */  addi      r12, r12, 0x1
/* 01FE20 80022E20 396B0002 */  addi      r11, r11, 0x2
/* 01FE24 80022E24 4200FFC0 */  bdnz      lbl_80022DE4
lbl_80022E28:
/* 01FE28 80022E28 7FFF3214 */  add       r31, r31, r6
/* 01FE2C 80022E2C 3BDE0001 */  addi      r30, r30, 0x1
lbl_80022E30:
/* 01FE30 80022E30 7C1E3800 */  cmpw      r30, r7
/* 01FE34 80022E34 4180FF88 */  blt       lbl_80022DBC
/* 01FE38 80022E38 83E10044 */  lwz       r31, 0x44(r1)
/* 01FE3C 80022E3C 83C10040 */  lwz       r30, 0x40(r1)
/* 01FE40 80022E40 83A1003C */  lwz       r29, 0x3c(r1)
/* 01FE44 80022E44 38210048 */  addi      r1, r1, 0x48
/* 01FE48 80022E48 4E800020 */  blr

glabel PanelDrawBG16
/* 01FE4C 80022E4C 9421FFC0 */  stwu      r1, -0x40(r1)
/* 01FE50 80022E50 93E1003C */  stw       r31, 0x3c(r1)
/* 01FE54 80022E54 93C10038 */  stw       r30, 0x38(r1)
/* 01FE58 80022E58 93A10034 */  stw       r29, 0x34(r1)
/* 01FE5C 80022E5C 93810030 */  stw       r28, 0x30(r1)
/* 01FE60 80022E60 3BA00000 */  li        r29, 0x0
/* 01FE64 80022E64 39800000 */  li        r12, 0x0
/* 01FE68 80022E68 48000004 */  b         lbl_80022E6C
lbl_80022E6C:
/* 01FE6C 80022E6C 48000004 */  b         lbl_80022E70
lbl_80022E70:
/* 01FE70 80022E70 48000078 */  b         lbl_80022EE8
lbl_80022E74:
/* 01FE74 80022E74 7C08EA14 */  add       r0, r8, r29
/* 01FE78 80022E78 1C000140 */  mulli     r0, r0, 0x140
/* 01FE7C 80022E7C 7FE70214 */  add       r31, r7, r0
/* 01FE80 80022E80 3B800000 */  li        r28, 0x0
/* 01FE84 80022E84 48000004 */  b         lbl_80022E88
lbl_80022E88:
/* 01FE88 80022E88 2C050000 */  cmpwi     r5, 0x0
/* 01FE8C 80022E8C 7CA903A6 */  mtctr     r5
/* 01FE90 80022E90 57EB083C */  slwi      r11, r31, 1
/* 01FE94 80022E94 558A083C */  slwi      r10, r12, 1
/* 01FE98 80022E98 40810048 */  ble       lbl_80022EE0
/* 01FE9C 80022E9C 48000004 */  b         lbl_80022EA0
lbl_80022EA0:
/* 01FEA0 80022EA0 7FC4522E */  lhzx      r30, r4, r10
/* 01FEA4 80022EA4 57C007FE */  clrlwi    r0, r30, 31
/* 01FEA8 80022EA8 2C000000 */  cmpwi     r0, 0x0
/* 01FEAC 80022EAC 41820024 */  beq       lbl_80022ED0
/* 01FEB0 80022EB0 2C090000 */  cmpwi     r9, 0x0
/* 01FEB4 80022EB4 4082000C */  bne       lbl_80022EC0
/* 01FEB8 80022EB8 7FC35B2E */  sthx      r30, r3, r11
/* 01FEBC 80022EBC 48000014 */  b         lbl_80022ED0
lbl_80022EC0:
/* 01FEC0 80022EC0 7C1C2850 */  subf      r0, r28, r5
/* 01FEC4 80022EC4 7C00FA14 */  add       r0, r0, r31
/* 01FEC8 80022EC8 5400083C */  slwi      r0, r0, 1
/* 01FECC 80022ECC 7FC3032E */  sthx      r30, r3, r0
lbl_80022ED0:
/* 01FED0 80022ED0 394A0002 */  addi      r10, r10, 0x2
/* 01FED4 80022ED4 396B0002 */  addi      r11, r11, 0x2
/* 01FED8 80022ED8 3B9C0001 */  addi      r28, r28, 0x1
/* 01FEDC 80022EDC 4200FFC4 */  bdnz      lbl_80022EA0
lbl_80022EE0:
/* 01FEE0 80022EE0 7D8C2A14 */  add       r12, r12, r5
/* 01FEE4 80022EE4 3BBD0001 */  addi      r29, r29, 0x1
lbl_80022EE8:
/* 01FEE8 80022EE8 7C1D3000 */  cmpw      r29, r6
/* 01FEEC 80022EEC 4180FF88 */  blt       lbl_80022E74
/* 01FEF0 80022EF0 83E1003C */  lwz       r31, 0x3c(r1)
/* 01FEF4 80022EF4 83C10038 */  lwz       r30, 0x38(r1)
/* 01FEF8 80022EF8 83A10034 */  lwz       r29, 0x34(r1)
/* 01FEFC 80022EFC 83810030 */  lwz       r28, 0x30(r1)
/* 01FF00 80022F00 38210040 */  addi      r1, r1, 0x40
/* 01FF04 80022F04 4E800020 */  blr

glabel PanelDrawBG8
/* 01FF08 80022F08 9421FFB0 */  stwu      r1, -0x50(r1)
/* 01FF0C 80022F0C BF61003C */  stmw      r27, 0x3c(r1)
/* 01FF10 80022F10 3B800000 */  li        r28, 0x0
/* 01FF14 80022F14 3BE00000 */  li        r31, 0x0
/* 01FF18 80022F18 48000004 */  b         lbl_80022F1C
lbl_80022F1C:
/* 01FF1C 80022F1C 48000004 */  b         lbl_80022F20
lbl_80022F20:
/* 01FF20 80022F20 48000080 */  b         lbl_80022FA0
lbl_80022F24:
/* 01FF24 80022F24 7C09E214 */  add       r0, r9, r28
/* 01FF28 80022F28 1C000140 */  mulli     r0, r0, 0x140
/* 01FF2C 80022F2C 7D85FA14 */  add       r12, r5, r31
/* 01FF30 80022F30 7FC80214 */  add       r30, r8, r0
/* 01FF34 80022F34 3B600000 */  li        r27, 0x0
/* 01FF38 80022F38 48000004 */  b         lbl_80022F3C
lbl_80022F3C:
/* 01FF3C 80022F3C 2C060000 */  cmpwi     r6, 0x0
/* 01FF40 80022F40 7CC903A6 */  mtctr     r6
/* 01FF44 80022F44 57CB083C */  slwi      r11, r30, 1
/* 01FF48 80022F48 40810050 */  ble       lbl_80022F98
/* 01FF4C 80022F4C 48000004 */  b         lbl_80022F50
lbl_80022F50:
/* 01FF50 80022F50 880C0000 */  lbz       r0, 0x0(r12)
/* 01FF54 80022F54 5400083C */  slwi      r0, r0, 1
/* 01FF58 80022F58 7FA4022E */  lhzx      r29, r4, r0
/* 01FF5C 80022F5C 57A007FE */  clrlwi    r0, r29, 31
/* 01FF60 80022F60 2C000000 */  cmpwi     r0, 0x0
/* 01FF64 80022F64 41820024 */  beq       lbl_80022F88
/* 01FF68 80022F68 2C0A0000 */  cmpwi     r10, 0x0
/* 01FF6C 80022F6C 4082000C */  bne       lbl_80022F78
/* 01FF70 80022F70 7FA35B2E */  sthx      r29, r3, r11
/* 01FF74 80022F74 48000014 */  b         lbl_80022F88
lbl_80022F78:
/* 01FF78 80022F78 7C1B3050 */  subf      r0, r27, r6
/* 01FF7C 80022F7C 7C00F214 */  add       r0, r0, r30
/* 01FF80 80022F80 5400083C */  slwi      r0, r0, 1
/* 01FF84 80022F84 7FA3032E */  sthx      r29, r3, r0
lbl_80022F88:
/* 01FF88 80022F88 398C0001 */  addi      r12, r12, 0x1
/* 01FF8C 80022F8C 396B0002 */  addi      r11, r11, 0x2
/* 01FF90 80022F90 3B7B0001 */  addi      r27, r27, 0x1
/* 01FF94 80022F94 4200FFBC */  bdnz      lbl_80022F50
lbl_80022F98:
/* 01FF98 80022F98 7FFF3214 */  add       r31, r31, r6
/* 01FF9C 80022F9C 3B9C0001 */  addi      r28, r28, 0x1
lbl_80022FA0:
/* 01FFA0 80022FA0 7C1C3800 */  cmpw      r28, r7
/* 01FFA4 80022FA4 4180FF80 */  blt       lbl_80022F24
/* 01FFA8 80022FA8 BB61003C */  lmw       r27, 0x3c(r1)
/* 01FFAC 80022FAC 38210050 */  addi      r1, r1, 0x50
/* 01FFB0 80022FB0 4E800020 */  blr

glabel frameHackCIMG_Zelda2_Camera
/* 01FFB4 80022FB4 7C0802A6 */  mflr      r0
/* 01FFB8 80022FB8 90010004 */  stw       r0, 0x4(r1)
/* 01FFBC 80022FBC 9421FFE0 */  stwu      r1, -0x20(r1)
/* 01FFC0 80022FC0 93E1001C */  stw       r31, 0x1c(r1)
/* 01FFC4 80022FC4 93C10018 */  stw       r30, 0x18(r1)
/* 01FFC8 80022FC8 7C7F1B78 */  mr        r31, r3
/* 01FFCC 80022FCC 28040000 */  cmplwi    r4, 0x0
/* 01FFD0 80022FD0 41820064 */  beq       lbl_80023034
/* 01FFD4 80022FD4 80640010 */  lwz       r3, 0x10(r4)
/* 01FFD8 80022FD8 3C03FF88 */  subis     r0, r3, 0x78
/* 01FFDC 80022FDC 28004600 */  cmplwi    r0, 0x4600
/* 01FFE0 80022FE0 40820018 */  bne       lbl_80022FF8
/* 01FFE4 80022FE4 801F0044 */  lwz       r0, 0x44(r31)
/* 01FFE8 80022FE8 38600001 */  li        r3, 0x1
/* 01FFEC 80022FEC 60000010 */  ori       r0, r0, 0x10
/* 01FFF0 80022FF0 901F0044 */  stw       r0, 0x44(r31)
/* 01FFF4 80022FF4 480000DC */  b         lbl_800230D0
lbl_80022FF8:
/* 01FFF8 80022FF8 801F0044 */  lwz       r0, 0x44(r31)
/* 01FFFC 80022FFC 5400052E */  rlwinm    r0, r0, 0, 20, 23
/* 020000 80023000 2C000000 */  cmpwi     r0, 0x0
/* 020004 80023004 41820028 */  beq       lbl_8002302C
/* 020008 80023008 3C608013 */  lis       r3, 0x8013
/* 02000C 8002300C 38831FB0 */  addi      r4, r3, 0x1fb0
/* 020010 80023010 7FE3FB78 */  mr        r3, r31
/* 020014 80023014 48000E59 */  bl        ZeldaDrawFrameCamera
/* 020018 80023018 801F0044 */  lwz       r0, 0x44(r31)
/* 02001C 8002301C 38600001 */  li        r3, 0x1
/* 020020 80023020 54000626 */  rlwinm    r0, r0, 0, 24, 19
/* 020024 80023024 901F0044 */  stw       r0, 0x44(r31)
/* 020028 80023028 480000A8 */  b         lbl_800230D0
lbl_8002302C:
/* 02002C 8002302C 38600000 */  li        r3, 0x0
/* 020030 80023030 480000A0 */  b         lbl_800230D0
lbl_80023034:
/* 020034 80023034 3C0509C2 */  addis     r0, r5, 0x9c2
/* 020038 80023038 2800C25C */  cmplwi    r0, 0xc25c
/* 02003C 8002303C 40820090 */  bne       lbl_800230CC
/* 020040 80023040 3C06FFEF */  subis     r0, r6, 0x11
/* 020044 80023044 28008058 */  cmplwi    r0, 0x8058
/* 020048 80023048 40820084 */  bne       lbl_800230CC
/* 02004C 8002304C 801F0044 */  lwz       r0, 0x44(r31)
/* 020050 80023050 60000001 */  ori       r0, r0, 0x1
/* 020054 80023054 901F0044 */  stw       r0, 0x44(r31)
/* 020058 80023058 801F0044 */  lwz       r0, 0x44(r31)
/* 02005C 8002305C 54000636 */  rlwinm    r0, r0, 0, 24, 27
/* 020060 80023060 2C000000 */  cmpwi     r0, 0x0
/* 020064 80023064 41820060 */  beq       lbl_800230C4
/* 020068 80023068 386000A0 */  li        r3, 0xa0
/* 02006C 8002306C 38800076 */  li        r4, 0x76
/* 020070 80023070 38A00140 */  li        r5, 0x140
/* 020074 80023074 38C00100 */  li        r6, 0x100
/* 020078 80023078 480873B5 */  bl        GXSetTexCopySrc
/* 02007C 8002307C 386000A0 */  li        r3, 0xa0
/* 020080 80023080 38800080 */  li        r4, 0x80
/* 020084 80023084 38A00001 */  li        r5, 0x1
/* 020088 80023088 38C00001 */  li        r6, 0x1
/* 02008C 8002308C 4808746D */  bl        GXSetTexCopyDst
/* 020090 80023090 3C608013 */  lis       r3, 0x8013
/* 020094 80023094 3BC31FB0 */  addi      r30, r3, 0x1fb0
/* 020098 80023098 3C800001 */  lis       r4, 0x1
/* 02009C 8002309C 7FC3F378 */  mr        r3, r30
/* 0200A0 800230A0 3884A000 */  subi      r4, r4, 0x6000
/* 0200A4 800230A4 48079BF5 */  bl        DCInvalidateRange
/* 0200A8 800230A8 7FC3F378 */  mr        r3, r30
/* 0200AC 800230AC 38800000 */  li        r4, 0x0
/* 0200B0 800230B0 48087D35 */  bl        GXCopyTex
/* 0200B4 800230B4 48086AA1 */  bl        fn_800A9B54
/* 0200B8 800230B8 801F0044 */  lwz       r0, 0x44(r31)
/* 0200BC 800230BC 54000626 */  rlwinm    r0, r0, 0, 24, 19
/* 0200C0 800230C0 901F0044 */  stw       r0, 0x44(r31)
lbl_800230C4:
/* 0200C4 800230C4 38600001 */  li        r3, 0x1
/* 0200C8 800230C8 48000008 */  b         lbl_800230D0
lbl_800230CC:
/* 0200CC 800230CC 38600000 */  li        r3, 0x0
lbl_800230D0:
/* 0200D0 800230D0 80010024 */  lwz       r0, 0x24(r1)
/* 0200D4 800230D4 83E1001C */  lwz       r31, 0x1c(r1)
/* 0200D8 800230D8 83C10018 */  lwz       r30, 0x18(r1)
/* 0200DC 800230DC 7C0803A6 */  mtlr      r0
/* 0200E0 800230E0 38210020 */  addi      r1, r1, 0x20
/* 0200E4 800230E4 4E800020 */  blr

glabel frameHackCIMG_Zelda2_Shrink
/* 0200E8 800230E8 7C0802A6 */  mflr      r0
/* 0200EC 800230EC 90010004 */  stw       r0, 0x4(r1)
/* 0200F0 800230F0 9421FFA8 */  stwu      r1, -0x58(r1)
/* 0200F4 800230F4 BF610044 */  stmw      r27, 0x44(r1)
/* 0200F8 800230F8 7C9B2378 */  mr        r27, r4
/* 0200FC 800230FC 7CBC2B78 */  mr        r28, r5
/* 020100 80023100 3C80800F */  lis       r4, D_800EBF60@ha
/* 020104 80023104 80FC0000 */  lwz       r7, 0x0(r28)
/* 020108 80023108 38A4BF60 */  addi      r5, r4, D_800EBF60@l
/* 02010C 8002310C 39000000 */  li        r8, 0x0
/* 020110 80023110 48000004 */  b         lbl_80023114
lbl_80023114:
/* 020114 80023114 48000004 */  b         lbl_80023118
lbl_80023118:
/* 020118 80023118 80870000 */  lwz       r4, 0x0(r7)
/* 02011C 8002311C 80050000 */  lwz       r0, 0x0(r5)
/* 020120 80023120 7C040040 */  cmplw     r4, r0
/* 020124 80023124 40820040 */  bne       lbl_80023164
/* 020128 80023128 38A50004 */  addi      r5, r5, 0x4
/* 02012C 8002312C 38C70008 */  addi      r6, r7, 0x8
/* 020130 80023130 39000001 */  li        r8, 0x1
/* 020134 80023134 80860000 */  lwz       r4, 0x0(r6)
/* 020138 80023138 80050000 */  lwz       r0, 0x0(r5)
/* 02013C 8002313C 7C040040 */  cmplw     r4, r0
/* 020140 80023140 40820024 */  bne       lbl_80023164
/* 020144 80023144 38A50004 */  addi      r5, r5, 0x4
/* 020148 80023148 38C60008 */  addi      r6, r6, 0x8
/* 02014C 8002314C 39000002 */  li        r8, 0x2
/* 020150 80023150 80860000 */  lwz       r4, 0x0(r6)
/* 020154 80023154 80050000 */  lwz       r0, 0x0(r5)
/* 020158 80023158 7C040040 */  cmplw     r4, r0
/* 02015C 8002315C 40820008 */  bne       lbl_80023164
/* 020160 80023160 39000003 */  li        r8, 0x3
lbl_80023164:
/* 020164 80023164 2C080003 */  cmpwi     r8, 0x3
/* 020168 80023168 408200CC */  bne       lbl_80023234
/* 02016C 8002316C 80630008 */  lwz       r3, 0x8(r3)
/* 020170 80023170 55001838 */  slwi      r0, r8, 3
/* 020174 80023174 7FC70214 */  add       r30, r7, r0
/* 020178 80023178 83A30034 */  lwz       r29, 0x34(r3)
/* 02017C 8002317C 38600000 */  li        r3, 0x0
/* 020180 80023180 48000004 */  b         lbl_80023184
lbl_80023184:
/* 020184 80023184 48000004 */  b         lbl_80023188
lbl_80023188:
/* 020188 80023188 83FE0000 */  lwz       r31, 0x0(r30)
/* 02018C 8002318C 3C1FF700 */  subis     r0, r31, 0x900
/* 020190 80023190 28000000 */  cmplwi    r0, 0x0
/* 020194 80023194 40820084 */  bne       lbl_80023218
/* 020198 80023198 80DE0004 */  lwz       r6, 0x4(r30)
/* 02019C 8002319C 7FA3EB78 */  mr        r3, r29
/* 0201A0 800231A0 38A10018 */  addi      r5, r1, 0x18
/* 0201A4 800231A4 54C0473E */  extrwi    r0, r6, 4, 4
/* 0201A8 800231A8 5404103A */  slwi      r4, r0, 2
/* 0201AC 800231AC 38043928 */  addi      r0, r4, 0x3928
/* 0201B0 800231B0 7C9D002E */  lwzx      r4, r29, r0
/* 0201B4 800231B4 54C0023E */  clrlwi    r0, r6, 8
/* 0201B8 800231B8 7C840214 */  add       r4, r4, r0
/* 0201BC 800231BC 48057085 */  bl        rspFillObjBgScale
/* 0201C0 800231C0 801B0040 */  lwz       r0, 0x40(r27)
/* 0201C4 800231C4 60000001 */  ori       r0, r0, 0x1
/* 0201C8 800231C8 901B0040 */  stw       r0, 0x40(r27)
/* 0201CC 800231CC 801B0040 */  lwz       r0, 0x40(r27)
/* 0201D0 800231D0 60000100 */  ori       r0, r0, 0x100
/* 0201D4 800231D4 901B0040 */  stw       r0, 0x40(r27)
/* 0201D8 800231D8 807B0040 */  lwz       r3, 0x40(r27)
/* 0201DC 800231DC 5460001E */  clrrwi    r0, r3, 16
/* 0201E0 800231E0 28000000 */  cmplwi    r0, 0x0
/* 0201E4 800231E4 40820014 */  bne       lbl_800231F8
/* 0201E8 800231E8 A0010034 */  lhz       r0, 0x34(r1)
/* 0201EC 800231EC 5400801E */  slwi      r0, r0, 16
/* 0201F0 800231F0 7C600378 */  or        r0, r3, r0
/* 0201F4 800231F4 901B0040 */  stw       r0, 0x40(r27)
lbl_800231F8:
/* 0201F8 800231F8 A881001C */  lha       r4, 0x1c(r1)
/* 0201FC 800231FC 7F63DB78 */  mr        r3, r27
/* 020200 80023200 A8010024 */  lha       r0, 0x24(r1)
/* 020204 80023204 7C841670 */  srawi     r4, r4, 2
/* 020208 80023208 A0C10034 */  lhz       r6, 0x34(r1)
/* 02020C 8002320C 7C051670 */  srawi     r5, r0, 2
/* 020210 80023210 48000F51 */  bl        ZeldaDrawFrameShrink
/* 020214 80023214 38600001 */  li        r3, 0x1
lbl_80023218:
/* 020218 80023218 2C030000 */  cmpwi     r3, 0x0
/* 02021C 8002321C 41820010 */  beq       lbl_8002322C
/* 020220 80023220 3C1F2100 */  addis     r0, r31, 0x2100
/* 020224 80023224 28000000 */  cmplwi    r0, 0x0
/* 020228 80023228 41820014 */  beq       lbl_8002323C
lbl_8002322C:
/* 02022C 8002322C 3BDE0008 */  addi      r30, r30, 0x8
/* 020230 80023230 4BFFFF58 */  b         lbl_80023188
lbl_80023234:
/* 020234 80023234 38600000 */  li        r3, 0x0
/* 020238 80023238 48000010 */  b         lbl_80023248
lbl_8002323C:
/* 02023C 8002323C 3BDE0008 */  addi      r30, r30, 0x8
/* 020240 80023240 93DC0000 */  stw       r30, 0x0(r28)
/* 020244 80023244 38600001 */  li        r3, 0x1
lbl_80023248:
/* 020248 80023248 BB610044 */  lmw       r27, 0x44(r1)
/* 02024C 8002324C 8001005C */  lwz       r0, 0x5c(r1)
/* 020250 80023250 38210058 */  addi      r1, r1, 0x58
/* 020254 80023254 7C0803A6 */  mtlr      r0
/* 020258 80023258 4E800020 */  blr

glabel frameHackCIMG_Zelda
/* 02025C 8002325C 7C0802A6 */  mflr      r0
/* 020260 80023260 90010004 */  stw       r0, 0x4(r1)
/* 020264 80023264 9421FFC0 */  stwu      r1, -0x40(r1)
/* 020268 80023268 BF61002C */  stmw      r27, 0x2c(r1)
/* 02026C 8002326C 7C9C2378 */  mr        r28, r4
/* 020270 80023270 7CDD3378 */  mr        r29, r6
/* 020274 80023274 3C808011 */  lis       r4, D_80109900@ha
/* 020278 80023278 800D89C4 */  lwz       r0, D_8018B944@sda21(r0)
/* 02027C 8002327C 3BE49900 */  addi      r31, r4, D_80109900@l
/* 020280 80023280 7FE4FB78 */  mr        r4, r31
/* 020284 80023284 3BC00000 */  li        r30, 0x0
/* 020288 80023288 48000004 */  b         lbl_8002328C
lbl_8002328C:
/* 02028C 8002328C 28000000 */  cmplwi    r0, 0x0
/* 020290 80023290 7C0903A6 */  mtctr     r0
/* 020294 80023294 40810020 */  ble       lbl_800232B4
/* 020298 80023298 48000004 */  b         lbl_8002329C
lbl_8002329C:
/* 02029C 8002329C 80040000 */  lwz       r0, 0x0(r4)
/* 0202A0 800232A0 7C1D0040 */  cmplw     r29, r0
/* 0202A4 800232A4 41820010 */  beq       lbl_800232B4
/* 0202A8 800232A8 38840004 */  addi      r4, r4, 0x4
/* 0202AC 800232AC 3BDE0001 */  addi      r30, r30, 0x1
/* 0202B0 800232B0 4200FFEC */  bdnz      lbl_8002329C
lbl_800232B4:
/* 0202B4 800232B4 809C0010 */  lwz       r4, 0x10(r28)
/* 0202B8 800232B8 800300D8 */  lwz       r0, 0xd8(r3)
/* 0202BC 800232BC 7C040000 */  cmpw      r4, r0
/* 0202C0 800232C0 40820098 */  bne       lbl_80023358
/* 0202C4 800232C4 801C0004 */  lwz       r0, 0x4(r28)
/* 0202C8 800232C8 2C000140 */  cmpwi     r0, 0x140
/* 0202CC 800232CC 4082008C */  bne       lbl_80023358
/* 0202D0 800232D0 8365000C */  lwz       r27, 0xc(r5)
/* 0202D4 800232D4 80650008 */  lwz       r3, 0x8(r5)
/* 0202D8 800232D8 38A00020 */  li        r5, 0x20
/* 0202DC 800232DC 7F64DB78 */  mr        r4, r27
/* 0202E0 800232E0 480A9661 */  bl        __shr2u
/* 0202E4 800232E4 3C0402F0 */  addis     r0, r4, 0x2f0
/* 0202E8 800232E8 2800013F */  cmplwi    r0, 0x13f
/* 0202EC 800232EC 4082006C */  bne       lbl_80023358
/* 0202F0 800232F0 80CD8914 */  lwz       r6, gpSystem@sda21(r0)
/* 0202F4 800232F4 5760473E */  extrwi    r0, r27, 4, 4
/* 0202F8 800232F8 5403103A */  slwi      r3, r0, 2
/* 0202FC 800232FC 80A60034 */  lwz       r5, 0x34(r6)
/* 020300 80023300 38833928 */  addi      r4, r3, 0x3928
/* 020304 80023304 5760023E */  clrlwi    r0, r27, 8
/* 020308 80023308 8066002C */  lwz       r3, 0x2c(r6)
/* 02030C 8002330C 7CA5202E */  lwzx      r5, r5, r4
/* 020310 80023310 38810020 */  addi      r4, r1, 0x20
/* 020314 80023314 7F650214 */  add       r27, r5, r0
/* 020318 80023318 7F65DB78 */  mr        r5, r27
/* 02031C 8002331C 38C00000 */  li        r6, 0x0
/* 020320 80023320 480495F1 */  bl        ramGetBuffer
/* 020324 80023324 2C030000 */  cmpwi     r3, 0x0
/* 020328 80023328 4082000C */  bne       lbl_80023334
/* 02032C 8002332C 38600000 */  li        r3, 0x0
/* 020330 80023330 48000358 */  b         lbl_80023688
lbl_80023334:
/* 020334 80023334 936D89BC */  stw       r27, D_8018B93C@sda21(r0)
/* 020338 80023338 80610020 */  lwz       r3, 0x20(r1)
/* 02033C 8002333C 801C0010 */  lwz       r0, 0x10(r28)
/* 020340 80023340 900D89C0 */  stw       r0, D_8018B940@sda21(r0)
/* 020344 80023344 480016B9 */  bl        CopyAndConvertCFB
/* 020348 80023348 3860FFFF */  li        r3, -0x1
/* 02034C 8002334C 38000001 */  li        r0, 0x1
/* 020350 80023350 906D89D0 */  stw       r3, D_8018B950@sda21(r0)
/* 020354 80023354 900D89CC */  stw       r0, D_8018B94C@sda21(r0)
lbl_80023358:
/* 020358 80023358 806D89C4 */  lwz       r3, D_8018B944@sda21(r0)
/* 02035C 8002335C 7C1E1840 */  cmplw     r30, r3
/* 020360 80023360 41800324 */  blt       lbl_80023684
/* 020364 80023364 28030006 */  cmplwi    r3, 0x6
/* 020368 80023368 40800030 */  bge       lbl_80023398
/* 02036C 8002336C 38030001 */  addi      r0, r3, 0x1
/* 020370 80023370 900D89C4 */  stw       r0, D_8018B944@sda21(r0)
/* 020374 80023374 5460103A */  slwi      r0, r3, 2
/* 020378 80023378 389D3800 */  addi      r4, r29, 0x3800
/* 02037C 8002337C 7FBF012E */  stwx      r29, r31, r0
/* 020380 80023380 806D89C4 */  lwz       r3, D_8018B944@sda21(r0)
/* 020384 80023384 38030001 */  addi      r0, r3, 0x1
/* 020388 80023388 900D89C4 */  stw       r0, D_8018B944@sda21(r0)
/* 02038C 8002338C 5460103A */  slwi      r0, r3, 2
/* 020390 80023390 7C9F012E */  stwx      r4, r31, r0
/* 020394 80023394 480002F0 */  b         lbl_80023684
lbl_80023398:
/* 020398 80023398 801C0004 */  lwz       r0, 0x4(r28)
/* 02039C 8002339C 2C000040 */  cmpwi     r0, 0x40
/* 0203A0 800233A0 408202E4 */  bne       lbl_80023684
/* 0203A4 800233A4 38000001 */  li        r0, 0x1
/* 0203A8 800233A8 900D89CC */  stw       r0, D_8018B94C@sda21(r0)
/* 0203AC 800233AC 801C0000 */  lwz       r0, 0x0(r28)
/* 0203B0 800233B0 2C000002 */  cmpwi     r0, 0x2
/* 0203B4 800233B4 408202A4 */  bne       lbl_80023658
/* 0203B8 800233B8 80BC000C */  lwz       r5, 0xc(r28)
/* 0203BC 800233BC 38600000 */  li        r3, 0x0
/* 0203C0 800233C0 38800000 */  li        r4, 0x0
/* 0203C4 800233C4 7CBB2B78 */  mr        r27, r5
/* 0203C8 800233C8 3BA53800 */  addi      r29, r5, 0x3800
/* 0203CC 800233CC 38A00080 */  li        r5, 0x80
/* 0203D0 800233D0 38C000E0 */  li        r6, 0xe0
/* 0203D4 800233D4 48087059 */  bl        GXSetTexCopySrc
/* 0203D8 800233D8 38600040 */  li        r3, 0x40
/* 0203DC 800233DC 38800070 */  li        r4, 0x70
/* 0203E0 800233E0 38A00005 */  li        r5, 0x5
/* 0203E4 800233E4 38C00001 */  li        r6, 0x1
/* 0203E8 800233E8 48087111 */  bl        GXSetTexCopyDst
/* 0203EC 800233EC 807C000C */  lwz       r3, 0xc(r28)
/* 0203F0 800233F0 38803800 */  li        r4, 0x3800
/* 0203F4 800233F4 480798A5 */  bl        DCInvalidateRange
/* 0203F8 800233F8 807C000C */  lwz       r3, 0xc(r28)
/* 0203FC 800233FC 38800000 */  li        r4, 0x0
/* 020400 80023400 480879E5 */  bl        GXCopyTex
/* 020404 80023404 38000000 */  li        r0, 0x0
/* 020408 80023408 900D89B4 */  stw       r0, D_8018B934@sda21(r0)
/* 02040C 8002340C 38607D00 */  li        r3, 0x7d00
/* 020410 80023410 48086569 */  bl        GXSetDrawSync
/* 020414 80023414 48000004 */  b         lbl_80023418
lbl_80023418:
/* 020418 80023418 48000004 */  b         lbl_8002341C
lbl_8002341C:
/* 02041C 8002341C 800D89B4 */  lwz       r0, D_8018B934@sda21(r0)
/* 020420 80023420 2C000000 */  cmpwi     r0, 0x0
/* 020424 80023424 4182FFF8 */  beq       lbl_8002341C
/* 020428 80023428 48000004 */  b         lbl_8002342C
lbl_8002342C:
/* 02042C 8002342C 48000004 */  b         lbl_80023430
lbl_80023430:
/* 020430 80023430 4800021C */  b         lbl_8002364C
lbl_80023434:
/* 020434 80023434 3C7F0003 */  addis     r3, r31, 0x3
/* 020438 80023438 7F64DB78 */  mr        r4, r27
/* 02043C 8002343C 38638140 */  subi      r3, r3, 0x7ec0
/* 020440 80023440 38A00200 */  li        r5, 0x200
/* 020444 80023444 4BFE360D */  bl        xlHeapCopy
/* 020448 80023448 38E00000 */  li        r7, 0x0
/* 02044C 8002344C 38A00000 */  li        r5, 0x0
/* 020450 80023450 48000004 */  b         lbl_80023454
lbl_80023454:
/* 020454 80023454 48000004 */  b         lbl_80023458
lbl_80023458:
/* 020458 80023458 48000004 */  b         lbl_8002345C
lbl_8002345C:
/* 02045C 8002345C 3C9F0003 */  addis     r4, r31, 0x3
/* 020460 80023460 38848140 */  subi      r4, r4, 0x7ec0
/* 020464 80023464 38C00000 */  li        r6, 0x0
/* 020468 80023468 48000004 */  b         lbl_8002346C
lbl_8002346C:
/* 02046C 8002346C 38000004 */  li        r0, 0x4
/* 020470 80023470 7C0903A6 */  mtctr     r0
/* 020474 80023474 48000004 */  b         lbl_80023478
lbl_80023478:
/* 020478 80023478 48000004 */  b         lbl_8002347C
lbl_8002347C:
/* 02047C 8002347C 7C642A14 */  add       r3, r4, r5
/* 020480 80023480 48000004 */  b         lbl_80023484
lbl_80023484:
/* 020484 80023484 48000004 */  b         lbl_80023488
lbl_80023488:
/* 020488 80023488 A0030000 */  lhz       r0, 0x0(r3)
/* 02048C 8002348C 38630002 */  addi      r3, r3, 0x2
/* 020490 80023490 5400083C */  slwi      r0, r0, 1
/* 020494 80023494 60000001 */  ori       r0, r0, 0x1
/* 020498 80023498 B01B0000 */  sth       r0, 0x0(r27)
/* 02049C 8002349C 3B7B0002 */  addi      r27, r27, 0x2
/* 0204A0 800234A0 A0030000 */  lhz       r0, 0x0(r3)
/* 0204A4 800234A4 38630002 */  addi      r3, r3, 0x2
/* 0204A8 800234A8 5400083C */  slwi      r0, r0, 1
/* 0204AC 800234AC 60000001 */  ori       r0, r0, 0x1
/* 0204B0 800234B0 B01B0000 */  sth       r0, 0x0(r27)
/* 0204B4 800234B4 3B7B0002 */  addi      r27, r27, 0x2
/* 0204B8 800234B8 A0030000 */  lhz       r0, 0x0(r3)
/* 0204BC 800234BC 38630002 */  addi      r3, r3, 0x2
/* 0204C0 800234C0 5400083C */  slwi      r0, r0, 1
/* 0204C4 800234C4 60000001 */  ori       r0, r0, 0x1
/* 0204C8 800234C8 B01B0000 */  sth       r0, 0x0(r27)
/* 0204CC 800234CC 3B7B0002 */  addi      r27, r27, 0x2
/* 0204D0 800234D0 A0030000 */  lhz       r0, 0x0(r3)
/* 0204D4 800234D4 5400083C */  slwi      r0, r0, 1
/* 0204D8 800234D8 60000001 */  ori       r0, r0, 0x1
/* 0204DC 800234DC B01B0000 */  sth       r0, 0x0(r27)
/* 0204E0 800234E0 3B7B0002 */  addi      r27, r27, 0x2
/* 0204E4 800234E4 38840020 */  addi      r4, r4, 0x20
/* 0204E8 800234E8 7C642A14 */  add       r3, r4, r5
/* 0204EC 800234EC 48000004 */  b         lbl_800234F0
lbl_800234F0:
/* 0204F0 800234F0 48000004 */  b         lbl_800234F4
lbl_800234F4:
/* 0204F4 800234F4 A0030000 */  lhz       r0, 0x0(r3)
/* 0204F8 800234F8 38630002 */  addi      r3, r3, 0x2
/* 0204FC 800234FC 5400083C */  slwi      r0, r0, 1
/* 020500 80023500 60000001 */  ori       r0, r0, 0x1
/* 020504 80023504 B01B0000 */  sth       r0, 0x0(r27)
/* 020508 80023508 3B7B0002 */  addi      r27, r27, 0x2
/* 02050C 8002350C A0030000 */  lhz       r0, 0x0(r3)
/* 020510 80023510 38630002 */  addi      r3, r3, 0x2
/* 020514 80023514 5400083C */  slwi      r0, r0, 1
/* 020518 80023518 60000001 */  ori       r0, r0, 0x1
/* 02051C 8002351C B01B0000 */  sth       r0, 0x0(r27)
/* 020520 80023520 3B7B0002 */  addi      r27, r27, 0x2
/* 020524 80023524 A0030000 */  lhz       r0, 0x0(r3)
/* 020528 80023528 38630002 */  addi      r3, r3, 0x2
/* 02052C 8002352C 5400083C */  slwi      r0, r0, 1
/* 020530 80023530 60000001 */  ori       r0, r0, 0x1
/* 020534 80023534 B01B0000 */  sth       r0, 0x0(r27)
/* 020538 80023538 3B7B0002 */  addi      r27, r27, 0x2
/* 02053C 8002353C A0030000 */  lhz       r0, 0x0(r3)
/* 020540 80023540 5400083C */  slwi      r0, r0, 1
/* 020544 80023544 60000001 */  ori       r0, r0, 0x1
/* 020548 80023548 B01B0000 */  sth       r0, 0x0(r27)
/* 02054C 8002354C 3B7B0002 */  addi      r27, r27, 0x2
/* 020550 80023550 38840020 */  addi      r4, r4, 0x20
/* 020554 80023554 38C60001 */  addi      r6, r6, 0x1
/* 020558 80023558 7C642A14 */  add       r3, r4, r5
/* 02055C 8002355C 48000004 */  b         lbl_80023560
lbl_80023560:
/* 020560 80023560 48000004 */  b         lbl_80023564
lbl_80023564:
/* 020564 80023564 A0030000 */  lhz       r0, 0x0(r3)
/* 020568 80023568 38630002 */  addi      r3, r3, 0x2
/* 02056C 8002356C 5400083C */  slwi      r0, r0, 1
/* 020570 80023570 60000001 */  ori       r0, r0, 0x1
/* 020574 80023574 B01B0000 */  sth       r0, 0x0(r27)
/* 020578 80023578 3B7B0002 */  addi      r27, r27, 0x2
/* 02057C 8002357C A0030000 */  lhz       r0, 0x0(r3)
/* 020580 80023580 38630002 */  addi      r3, r3, 0x2
/* 020584 80023584 5400083C */  slwi      r0, r0, 1
/* 020588 80023588 60000001 */  ori       r0, r0, 0x1
/* 02058C 8002358C B01B0000 */  sth       r0, 0x0(r27)
/* 020590 80023590 3B7B0002 */  addi      r27, r27, 0x2
/* 020594 80023594 A0030000 */  lhz       r0, 0x0(r3)
/* 020598 80023598 38630002 */  addi      r3, r3, 0x2
/* 02059C 8002359C 5400083C */  slwi      r0, r0, 1
/* 0205A0 800235A0 60000001 */  ori       r0, r0, 0x1
/* 0205A4 800235A4 B01B0000 */  sth       r0, 0x0(r27)
/* 0205A8 800235A8 3B7B0002 */  addi      r27, r27, 0x2
/* 0205AC 800235AC A0030000 */  lhz       r0, 0x0(r3)
/* 0205B0 800235B0 5400083C */  slwi      r0, r0, 1
/* 0205B4 800235B4 60000001 */  ori       r0, r0, 0x1
/* 0205B8 800235B8 B01B0000 */  sth       r0, 0x0(r27)
/* 0205BC 800235BC 3B7B0002 */  addi      r27, r27, 0x2
/* 0205C0 800235C0 38840020 */  addi      r4, r4, 0x20
/* 0205C4 800235C4 38C60001 */  addi      r6, r6, 0x1
/* 0205C8 800235C8 7C642A14 */  add       r3, r4, r5
/* 0205CC 800235CC 48000004 */  b         lbl_800235D0
lbl_800235D0:
/* 0205D0 800235D0 48000004 */  b         lbl_800235D4
lbl_800235D4:
/* 0205D4 800235D4 A0030000 */  lhz       r0, 0x0(r3)
/* 0205D8 800235D8 38630002 */  addi      r3, r3, 0x2
/* 0205DC 800235DC 5400083C */  slwi      r0, r0, 1
/* 0205E0 800235E0 60000001 */  ori       r0, r0, 0x1
/* 0205E4 800235E4 B01B0000 */  sth       r0, 0x0(r27)
/* 0205E8 800235E8 3B7B0002 */  addi      r27, r27, 0x2
/* 0205EC 800235EC A0030000 */  lhz       r0, 0x0(r3)
/* 0205F0 800235F0 38630002 */  addi      r3, r3, 0x2
/* 0205F4 800235F4 5400083C */  slwi      r0, r0, 1
/* 0205F8 800235F8 60000001 */  ori       r0, r0, 0x1
/* 0205FC 800235FC B01B0000 */  sth       r0, 0x0(r27)
/* 020600 80023600 3B7B0002 */  addi      r27, r27, 0x2
/* 020604 80023604 A0030000 */  lhz       r0, 0x0(r3)
/* 020608 80023608 38630002 */  addi      r3, r3, 0x2
/* 02060C 8002360C 5400083C */  slwi      r0, r0, 1
/* 020610 80023610 60000001 */  ori       r0, r0, 0x1
/* 020614 80023614 B01B0000 */  sth       r0, 0x0(r27)
/* 020618 80023618 3B7B0002 */  addi      r27, r27, 0x2
/* 02061C 8002361C A0030000 */  lhz       r0, 0x0(r3)
/* 020620 80023620 5400083C */  slwi      r0, r0, 1
/* 020624 80023624 60000001 */  ori       r0, r0, 0x1
/* 020628 80023628 B01B0000 */  sth       r0, 0x0(r27)
/* 02062C 8002362C 3B7B0002 */  addi      r27, r27, 0x2
/* 020630 80023630 38840020 */  addi      r4, r4, 0x20
/* 020634 80023634 38C60001 */  addi      r6, r6, 0x1
/* 020638 80023638 4200FE44 */  bdnz      lbl_8002347C
/* 02063C 8002363C 38A50008 */  addi      r5, r5, 0x8
/* 020640 80023640 38E70001 */  addi      r7, r7, 0x1
/* 020644 80023644 2C070004 */  cmpwi     r7, 0x4
/* 020648 80023648 4180FE14 */  blt       lbl_8002345C
lbl_8002364C:
/* 02064C 8002364C 7C1BE840 */  cmplw     r27, r29
/* 020650 80023650 4180FDE4 */  blt       lbl_80023434
/* 020654 80023654 48000030 */  b         lbl_80023684
lbl_80023658:
/* 020658 80023658 807C000C */  lwz       r3, 0xc(r28)
/* 02065C 8002365C 38831C00 */  addi      r4, r3, 0x1c00
/* 020660 80023660 48000004 */  b         lbl_80023664
lbl_80023664:
/* 020664 80023664 38000000 */  li        r0, 0x0
/* 020668 80023668 48000004 */  b         lbl_8002366C
lbl_8002366C:
/* 02066C 8002366C 48000010 */  b         lbl_8002367C
lbl_80023670:
/* 020670 80023670 98030000 */  stb       r0, 0x0(r3)
/* 020674 80023674 38630001 */  addi      r3, r3, 0x1
/* 020678 80023678 38630001 */  addi      r3, r3, 0x1
lbl_8002367C:
/* 02067C 8002367C 7C032040 */  cmplw     r3, r4
/* 020680 80023680 4180FFF0 */  blt       lbl_80023670
lbl_80023684:
/* 020684 80023684 38600001 */  li        r3, 0x1
lbl_80023688:
/* 020688 80023688 BB61002C */  lmw       r27, 0x2c(r1)
/* 02068C 8002368C 80010044 */  lwz       r0, 0x44(r1)
/* 020690 80023690 38210040 */  addi      r1, r1, 0x40
/* 020694 80023694 7C0803A6 */  mtlr      r0
/* 020698 80023698 4E800020 */  blr

glabel frameHackCIMG_Zelda2
/* 02069C 8002369C 7C0802A6 */  mflr      r0
/* 0206A0 800236A0 90010004 */  stw       r0, 0x4(r1)
/* 0206A4 800236A4 9421FFC0 */  stwu      r1, -0x40(r1)
/* 0206A8 800236A8 93E1003C */  stw       r31, 0x3c(r1)
/* 0206AC 800236AC 93C10038 */  stw       r30, 0x38(r1)
/* 0206B0 800236B0 93A10034 */  stw       r29, 0x34(r1)
/* 0206B4 800236B4 7C7E1B78 */  mr        r30, r3
/* 0206B8 800236B8 7C9F2378 */  mr        r31, r4
/* 0206BC 800236BC 807F0010 */  lwz       r3, 0x10(r31)
/* 0206C0 800236C0 801E00D8 */  lwz       r0, 0xd8(r30)
/* 0206C4 800236C4 7C030000 */  cmpw      r3, r0
/* 0206C8 800236C8 40820010 */  bne       lbl_800236D8
/* 0206CC 800236CC 807E002C */  lwz       r3, 0x2c(r30)
/* 0206D0 800236D0 38030001 */  addi      r0, r3, 0x1
/* 0206D4 800236D4 901E002C */  stw       r0, 0x2c(r30)
lbl_800236D8:
/* 0206D8 800236D8 807E0054 */  lwz       r3, 0x54(r30)
/* 0206DC 800236DC 38030001 */  addi      r0, r3, 0x1
/* 0206E0 800236E0 901E0054 */  stw       r0, 0x54(r30)
/* 0206E4 800236E4 801E002C */  lwz       r0, 0x2c(r30)
/* 0206E8 800236E8 2C000001 */  cmpwi     r0, 0x1
/* 0206EC 800236EC 40810184 */  ble       lbl_80023870
/* 0206F0 800236F0 3C60800F */  lis       r3, 0x800f
/* 0206F4 800236F4 3905FFD8 */  subi      r8, r5, 0x28
/* 0206F8 800236F8 3883BF10 */  subi      r4, r3, 0x40f0
/* 0206FC 800236FC 7D064378 */  mr        r6, r8
/* 020700 80023700 38E00000 */  li        r7, 0x0
/* 020704 80023704 48000004 */  b         lbl_80023708
lbl_80023708:
/* 020708 80023708 38000002 */  li        r0, 0x2
/* 02070C 8002370C 7C0903A6 */  mtctr     r0
/* 020710 80023710 48000004 */  b         lbl_80023714
lbl_80023714:
/* 020714 80023714 48000004 */  b         lbl_80023718
lbl_80023718:
/* 020718 80023718 80660000 */  lwz       r3, 0x0(r6)
/* 02071C 8002371C 80040000 */  lwz       r0, 0x0(r4)
/* 020720 80023720 7C030040 */  cmplw     r3, r0
/* 020724 80023724 41820024 */  beq       lbl_80023748
/* 020728 80023728 28070009 */  cmplwi    r7, 0x9
/* 02072C 8002372C 4082011C */  bne       lbl_80023848
/* 020730 80023730 80680024 */  lwz       r3, 0x24(r8)
/* 020734 80023734 3C037FC8 */  addis     r0, r3, 0x7fc8
/* 020738 80023738 28003C80 */  cmplwi    r0, 0x3c80
/* 02073C 8002373C 4182000C */  beq       lbl_80023748
/* 020740 80023740 28003AC0 */  cmplwi    r0, 0x3ac0
/* 020744 80023744 40820104 */  bne       lbl_80023848
lbl_80023748:
/* 020748 80023748 38840004 */  addi      r4, r4, 0x4
/* 02074C 8002374C 38C60004 */  addi      r6, r6, 0x4
/* 020750 80023750 38E70001 */  addi      r7, r7, 0x1
/* 020754 80023754 80660000 */  lwz       r3, 0x0(r6)
/* 020758 80023758 80040000 */  lwz       r0, 0x0(r4)
/* 02075C 8002375C 7C030040 */  cmplw     r3, r0
/* 020760 80023760 41820024 */  beq       lbl_80023784
/* 020764 80023764 28070009 */  cmplwi    r7, 0x9
/* 020768 80023768 408200E0 */  bne       lbl_80023848
/* 02076C 8002376C 80680024 */  lwz       r3, 0x24(r8)
/* 020770 80023770 3C037FC8 */  addis     r0, r3, 0x7fc8
/* 020774 80023774 28003C80 */  cmplwi    r0, 0x3c80
/* 020778 80023778 4182000C */  beq       lbl_80023784
/* 02077C 8002377C 28003AC0 */  cmplwi    r0, 0x3ac0
/* 020780 80023780 408200C8 */  bne       lbl_80023848
lbl_80023784:
/* 020784 80023784 38840004 */  addi      r4, r4, 0x4
/* 020788 80023788 38C60004 */  addi      r6, r6, 0x4
/* 02078C 8002378C 38E70001 */  addi      r7, r7, 0x1
/* 020790 80023790 80660000 */  lwz       r3, 0x0(r6)
/* 020794 80023794 80040000 */  lwz       r0, 0x0(r4)
/* 020798 80023798 7C030040 */  cmplw     r3, r0
/* 02079C 8002379C 41820024 */  beq       lbl_800237C0
/* 0207A0 800237A0 28070009 */  cmplwi    r7, 0x9
/* 0207A4 800237A4 408200A4 */  bne       lbl_80023848
/* 0207A8 800237A8 80680024 */  lwz       r3, 0x24(r8)
/* 0207AC 800237AC 3C037FC8 */  addis     r0, r3, 0x7fc8
/* 0207B0 800237B0 28003C80 */  cmplwi    r0, 0x3c80
/* 0207B4 800237B4 4182000C */  beq       lbl_800237C0
/* 0207B8 800237B8 28003AC0 */  cmplwi    r0, 0x3ac0
/* 0207BC 800237BC 4082008C */  bne       lbl_80023848
lbl_800237C0:
/* 0207C0 800237C0 38840004 */  addi      r4, r4, 0x4
/* 0207C4 800237C4 38C60004 */  addi      r6, r6, 0x4
/* 0207C8 800237C8 38E70001 */  addi      r7, r7, 0x1
/* 0207CC 800237CC 80660000 */  lwz       r3, 0x0(r6)
/* 0207D0 800237D0 80040000 */  lwz       r0, 0x0(r4)
/* 0207D4 800237D4 7C030040 */  cmplw     r3, r0
/* 0207D8 800237D8 41820024 */  beq       lbl_800237FC
/* 0207DC 800237DC 28070009 */  cmplwi    r7, 0x9
/* 0207E0 800237E0 40820068 */  bne       lbl_80023848
/* 0207E4 800237E4 80680024 */  lwz       r3, 0x24(r8)
/* 0207E8 800237E8 3C037FC8 */  addis     r0, r3, 0x7fc8
/* 0207EC 800237EC 28003C80 */  cmplwi    r0, 0x3c80
/* 0207F0 800237F0 4182000C */  beq       lbl_800237FC
/* 0207F4 800237F4 28003AC0 */  cmplwi    r0, 0x3ac0
/* 0207F8 800237F8 40820050 */  bne       lbl_80023848
lbl_800237FC:
/* 0207FC 800237FC 38840004 */  addi      r4, r4, 0x4
/* 020800 80023800 38C60004 */  addi      r6, r6, 0x4
/* 020804 80023804 38E70001 */  addi      r7, r7, 0x1
/* 020808 80023808 80660000 */  lwz       r3, 0x0(r6)
/* 02080C 8002380C 80040000 */  lwz       r0, 0x0(r4)
/* 020810 80023810 7C030040 */  cmplw     r3, r0
/* 020814 80023814 41820024 */  beq       lbl_80023838
/* 020818 80023818 28070009 */  cmplwi    r7, 0x9
/* 02081C 8002381C 4082002C */  bne       lbl_80023848
/* 020820 80023820 80680024 */  lwz       r3, 0x24(r8)
/* 020824 80023824 3C037FC8 */  addis     r0, r3, 0x7fc8
/* 020828 80023828 28003C80 */  cmplwi    r0, 0x3c80
/* 02082C 8002382C 4182000C */  beq       lbl_80023838
/* 020830 80023830 28003AC0 */  cmplwi    r0, 0x3ac0
/* 020834 80023834 40820014 */  bne       lbl_80023848
lbl_80023838:
/* 020838 80023838 38840004 */  addi      r4, r4, 0x4
/* 02083C 8002383C 38C60004 */  addi      r6, r6, 0x4
/* 020840 80023840 38E70001 */  addi      r7, r7, 0x1
/* 020844 80023844 4200FED4 */  bdnz      lbl_80023718
lbl_80023848:
/* 020848 80023848 2807000A */  cmplwi    r7, 0xa
/* 02084C 8002384C 4082001C */  bne       lbl_80023868
/* 020850 80023850 801E0028 */  lwz       r0, 0x28(r30)
/* 020854 80023854 2C000000 */  cmpwi     r0, 0x0
/* 020858 80023858 40820018 */  bne       lbl_80023870
/* 02085C 8002385C 38000001 */  li        r0, 0x1
/* 020860 80023860 900D89E0 */  stw       r0, -0x7620(r13)
/* 020864 80023864 4800000C */  b         lbl_80023870
lbl_80023868:
/* 020868 80023868 38000000 */  li        r0, 0x0
/* 02086C 8002386C 901E0034 */  stw       r0, 0x34(r30)
lbl_80023870:
/* 020870 80023870 800D89E0 */  lwz       r0, -0x7620(r13)
/* 020874 80023874 2C000000 */  cmpwi     r0, 0x0
/* 020878 80023878 418201E4 */  beq       lbl_80023A5C
/* 02087C 8002387C 3C60800F */  lis       r3, 0x800f
/* 020880 80023880 3883BF38 */  subi      r4, r3, 0x40c8
/* 020884 80023884 38A5FFD8 */  subi      r5, r5, 0x28
/* 020888 80023888 38C00000 */  li        r6, 0x0
/* 02088C 8002388C 48000004 */  b         lbl_80023890
lbl_80023890:
/* 020890 80023890 48000004 */  b         lbl_80023894
lbl_80023894:
/* 020894 80023894 80650000 */  lwz       r3, 0x0(r5)
/* 020898 80023898 80040000 */  lwz       r0, 0x0(r4)
/* 02089C 8002389C 7C030040 */  cmplw     r3, r0
/* 0208A0 800238A0 40820104 */  bne       lbl_800239A4
/* 0208A4 800238A4 38840004 */  addi      r4, r4, 0x4
/* 0208A8 800238A8 38A50004 */  addi      r5, r5, 0x4
/* 0208AC 800238AC 38C00001 */  li        r6, 0x1
/* 0208B0 800238B0 80650000 */  lwz       r3, 0x0(r5)
/* 0208B4 800238B4 80040000 */  lwz       r0, 0x0(r4)
/* 0208B8 800238B8 7C030040 */  cmplw     r3, r0
/* 0208BC 800238BC 408200E8 */  bne       lbl_800239A4
/* 0208C0 800238C0 38840004 */  addi      r4, r4, 0x4
/* 0208C4 800238C4 38A50004 */  addi      r5, r5, 0x4
/* 0208C8 800238C8 38C00002 */  li        r6, 0x2
/* 0208CC 800238CC 80650000 */  lwz       r3, 0x0(r5)
/* 0208D0 800238D0 80040000 */  lwz       r0, 0x0(r4)
/* 0208D4 800238D4 7C030040 */  cmplw     r3, r0
/* 0208D8 800238D8 408200CC */  bne       lbl_800239A4
/* 0208DC 800238DC 38840004 */  addi      r4, r4, 0x4
/* 0208E0 800238E0 38A50004 */  addi      r5, r5, 0x4
/* 0208E4 800238E4 38C00003 */  li        r6, 0x3
/* 0208E8 800238E8 80650000 */  lwz       r3, 0x0(r5)
/* 0208EC 800238EC 80040000 */  lwz       r0, 0x0(r4)
/* 0208F0 800238F0 7C030040 */  cmplw     r3, r0
/* 0208F4 800238F4 408200B0 */  bne       lbl_800239A4
/* 0208F8 800238F8 38840004 */  addi      r4, r4, 0x4
/* 0208FC 800238FC 38A50004 */  addi      r5, r5, 0x4
/* 020900 80023900 38C00004 */  li        r6, 0x4
/* 020904 80023904 80650000 */  lwz       r3, 0x0(r5)
/* 020908 80023908 80040000 */  lwz       r0, 0x0(r4)
/* 02090C 8002390C 7C030040 */  cmplw     r3, r0
/* 020910 80023910 40820094 */  bne       lbl_800239A4
/* 020914 80023914 38840004 */  addi      r4, r4, 0x4
/* 020918 80023918 38A50004 */  addi      r5, r5, 0x4
/* 02091C 8002391C 38C00005 */  li        r6, 0x5
/* 020920 80023920 80650000 */  lwz       r3, 0x0(r5)
/* 020924 80023924 80040000 */  lwz       r0, 0x0(r4)
/* 020928 80023928 7C030040 */  cmplw     r3, r0
/* 02092C 8002392C 40820078 */  bne       lbl_800239A4
/* 020930 80023930 38840004 */  addi      r4, r4, 0x4
/* 020934 80023934 38A50004 */  addi      r5, r5, 0x4
/* 020938 80023938 38C00006 */  li        r6, 0x6
/* 02093C 8002393C 80650000 */  lwz       r3, 0x0(r5)
/* 020940 80023940 80040000 */  lwz       r0, 0x0(r4)
/* 020944 80023944 7C030040 */  cmplw     r3, r0
/* 020948 80023948 4082005C */  bne       lbl_800239A4
/* 02094C 8002394C 38840004 */  addi      r4, r4, 0x4
/* 020950 80023950 38A50004 */  addi      r5, r5, 0x4
/* 020954 80023954 38C00007 */  li        r6, 0x7
/* 020958 80023958 80650000 */  lwz       r3, 0x0(r5)
/* 02095C 8002395C 80040000 */  lwz       r0, 0x0(r4)
/* 020960 80023960 7C030040 */  cmplw     r3, r0
/* 020964 80023964 40820040 */  bne       lbl_800239A4
/* 020968 80023968 38840004 */  addi      r4, r4, 0x4
/* 02096C 8002396C 38A50004 */  addi      r5, r5, 0x4
/* 020970 80023970 38C00008 */  li        r6, 0x8
/* 020974 80023974 80650000 */  lwz       r3, 0x0(r5)
/* 020978 80023978 80040000 */  lwz       r0, 0x0(r4)
/* 02097C 8002397C 7C030040 */  cmplw     r3, r0
/* 020980 80023980 40820024 */  bne       lbl_800239A4
/* 020984 80023984 38840004 */  addi      r4, r4, 0x4
/* 020988 80023988 38A50004 */  addi      r5, r5, 0x4
/* 02098C 8002398C 38C00009 */  li        r6, 0x9
/* 020990 80023990 80650000 */  lwz       r3, 0x0(r5)
/* 020994 80023994 80040000 */  lwz       r0, 0x0(r4)
/* 020998 80023998 7C030040 */  cmplw     r3, r0
/* 02099C 8002399C 40820008 */  bne       lbl_800239A4
/* 0209A0 800239A0 38C0000A */  li        r6, 0xa
lbl_800239A4:
/* 0209A4 800239A4 2806000A */  cmplwi    r6, 0xa
/* 0209A8 800239A8 408200AC */  bne       lbl_80023A54
/* 0209AC 800239AC 801E0028 */  lwz       r0, 0x28(r30)
/* 0209B0 800239B0 2C000000 */  cmpwi     r0, 0x0
/* 0209B4 800239B4 40820084 */  bne       lbl_80023A38
/* 0209B8 800239B8 3C808016 */  lis       r4, 0x8016
/* 0209BC 800239BC 3C608014 */  lis       r3, 0x8014
/* 0209C0 800239C0 388417B0 */  addi      r4, r4, 0x17b0
/* 0209C4 800239C4 38A3BFB0 */  subi      r5, r3, 0x4050
/* 0209C8 800239C8 48000004 */  b         lbl_800239CC
lbl_800239CC:
/* 0209CC 800239CC 3C600001 */  lis       r3, 0x1
/* 0209D0 800239D0 38632C00 */  addi      r3, r3, 0x2c00
/* 0209D4 800239D4 38030007 */  addi      r0, r3, 0x7
/* 0209D8 800239D8 5400E8FE */  srwi      r0, r0, 3
/* 0209DC 800239DC 28030000 */  cmplwi    r3, 0x0
/* 0209E0 800239E0 7C0903A6 */  mtctr     r0
/* 0209E4 800239E4 40810054 */  ble       lbl_80023A38
/* 0209E8 800239E8 48000004 */  b         lbl_800239EC
lbl_800239EC:
/* 0209EC 800239EC A0040000 */  lhz       r0, 0x0(r4)
/* 0209F0 800239F0 B0050000 */  sth       r0, 0x0(r5)
/* 0209F4 800239F4 A0040002 */  lhz       r0, 0x2(r4)
/* 0209F8 800239F8 B0050002 */  sth       r0, 0x2(r5)
/* 0209FC 800239FC A0040004 */  lhz       r0, 0x4(r4)
/* 020A00 80023A00 B0050004 */  sth       r0, 0x4(r5)
/* 020A04 80023A04 A0040006 */  lhz       r0, 0x6(r4)
/* 020A08 80023A08 B0050006 */  sth       r0, 0x6(r5)
/* 020A0C 80023A0C A0040008 */  lhz       r0, 0x8(r4)
/* 020A10 80023A10 B0050008 */  sth       r0, 0x8(r5)
/* 020A14 80023A14 A004000A */  lhz       r0, 0xa(r4)
/* 020A18 80023A18 B005000A */  sth       r0, 0xa(r5)
/* 020A1C 80023A1C A004000C */  lhz       r0, 0xc(r4)
/* 020A20 80023A20 B005000C */  sth       r0, 0xc(r5)
/* 020A24 80023A24 A004000E */  lhz       r0, 0xe(r4)
/* 020A28 80023A28 38840010 */  addi      r4, r4, 0x10
/* 020A2C 80023A2C B005000E */  sth       r0, 0xe(r5)
/* 020A30 80023A30 38A50010 */  addi      r5, r5, 0x10
/* 020A34 80023A34 4200FFB8 */  bdnz      lbl_800239EC
lbl_80023A38:
/* 020A38 80023A38 38600001 */  li        r3, 0x1
/* 020A3C 80023A3C 907E0028 */  stw       r3, 0x28(r30)
/* 020A40 80023A40 38000000 */  li        r0, 0x0
/* 020A44 80023A44 901E002C */  stw       r0, 0x2c(r30)
/* 020A48 80023A48 907E0034 */  stw       r3, 0x34(r30)
/* 020A4C 80023A4C 900D89E0 */  stw       r0, -0x7620(r13)
/* 020A50 80023A50 4800000C */  b         lbl_80023A5C
lbl_80023A54:
/* 020A54 80023A54 38000000 */  li        r0, 0x0
/* 020A58 80023A58 901E0034 */  stw       r0, 0x34(r30)
lbl_80023A5C:
/* 020A5C 80023A5C 801E0028 */  lwz       r0, 0x28(r30)
/* 020A60 80023A60 2C000000 */  cmpwi     r0, 0x0
/* 020A64 80023A64 41820030 */  beq       lbl_80023A94
/* 020A68 80023A68 800D89DC */  lwz       r0, -0x7624(r13)
/* 020A6C 80023A6C 807E0030 */  lwz       r3, 0x30(r30)
/* 020A70 80023A70 7C001850 */  subf      r0, r0, r3
/* 020A74 80023A74 2C000002 */  cmpwi     r0, 0x2
/* 020A78 80023A78 41800010 */  blt       lbl_80023A88
/* 020A7C 80023A7C 38000001 */  li        r0, 0x1
/* 020A80 80023A80 906D89DC */  stw       r3, -0x7624(r13)
/* 020A84 80023A84 900D89CC */  stw       r0, -0x7634(r13)
lbl_80023A88:
/* 020A88 80023A88 38000000 */  li        r0, 0x0
/* 020A8C 80023A8C 901E0028 */  stw       r0, 0x28(r30)
/* 020A90 80023A90 48000134 */  b         lbl_80023BC4
lbl_80023A94:
/* 020A94 80023A94 807E0040 */  lwz       r3, 0x40(r30)
/* 020A98 80023A98 5460043E */  clrlwi    r0, r3, 16
/* 020A9C 80023A9C 2C000000 */  cmpwi     r0, 0x0
/* 020AA0 80023AA0 418200A8 */  beq       lbl_80023B48
/* 020AA4 80023AA4 801E0024 */  lwz       r0, 0x24(r30)
/* 020AA8 80023AA8 2C000000 */  cmpwi     r0, 0x0
/* 020AAC 80023AAC 4182000C */  beq       lbl_80023AB8
/* 020AB0 80023AB0 60600010 */  ori       r0, r3, 0x10
/* 020AB4 80023AB4 901E0040 */  stw       r0, 0x40(r30)
lbl_80023AB8:
/* 020AB8 80023AB8 801E0024 */  lwz       r0, 0x24(r30)
/* 020ABC 80023ABC 2C000000 */  cmpwi     r0, 0x0
/* 020AC0 80023AC0 40820104 */  bne       lbl_80023BC4
/* 020AC4 80023AC4 801E0040 */  lwz       r0, 0x40(r30)
/* 020AC8 80023AC8 54000636 */  rlwinm    r0, r0, 0, 24, 27
/* 020ACC 80023ACC 2C000000 */  cmpwi     r0, 0x0
/* 020AD0 80023AD0 408200F4 */  bne       lbl_80023BC4
/* 020AD4 80023AD4 38600000 */  li        r3, 0x0
/* 020AD8 80023AD8 38800000 */  li        r4, 0x0
/* 020ADC 80023ADC 38A00280 */  li        r5, 0x280
/* 020AE0 80023AE0 38C001E0 */  li        r6, 0x1e0
/* 020AE4 80023AE4 48086949 */  bl        GXSetTexCopySrc
/* 020AE8 80023AE8 38600140 */  li        r3, 0x140
/* 020AEC 80023AEC 388000F0 */  li        r4, 0xf0
/* 020AF0 80023AF0 38A00004 */  li        r5, 0x4
/* 020AF4 80023AF4 38C00001 */  li        r6, 0x1
/* 020AF8 80023AF8 48086A01 */  bl        GXSetTexCopyDst
/* 020AFC 80023AFC 3C608016 */  lis       r3, 0x8016
/* 020B00 80023B00 3BA317B0 */  addi      r29, r3, 0x17b0
/* 020B04 80023B04 3C800002 */  lis       r4, 0x2
/* 020B08 80023B08 7FA3EB78 */  mr        r3, r29
/* 020B0C 80023B0C 38845800 */  addi      r4, r4, 0x5800
/* 020B10 80023B10 48079189 */  bl        DCInvalidateRange
/* 020B14 80023B14 7FA3EB78 */  mr        r3, r29
/* 020B18 80023B18 38800000 */  li        r4, 0x0
/* 020B1C 80023B1C 480872C9 */  bl        GXCopyTex
/* 020B20 80023B20 38000000 */  li        r0, 0x0
/* 020B24 80023B24 900D89B4 */  stw       r0, -0x764c(r13)
/* 020B28 80023B28 38607D00 */  li        r3, 0x7d00
/* 020B2C 80023B2C 48085E4D */  bl        GXSetDrawSync
/* 020B30 80023B30 48000004 */  b         lbl_80023B34
lbl_80023B34:
/* 020B34 80023B34 48000004 */  b         lbl_80023B38
lbl_80023B38:
/* 020B38 80023B38 800D89B4 */  lwz       r0, -0x764c(r13)
/* 020B3C 80023B3C 2C000000 */  cmpwi     r0, 0x0
/* 020B40 80023B40 4182FFF8 */  beq       lbl_80023B38
/* 020B44 80023B44 48000080 */  b         lbl_80023BC4
lbl_80023B48:
/* 020B48 80023B48 801E0024 */  lwz       r0, 0x24(r30)
/* 020B4C 80023B4C 2C000000 */  cmpwi     r0, 0x0
/* 020B50 80023B50 40820074 */  bne       lbl_80023BC4
/* 020B54 80023B54 38600000 */  li        r3, 0x0
/* 020B58 80023B58 38800000 */  li        r4, 0x0
/* 020B5C 80023B5C 38A00280 */  li        r5, 0x280
/* 020B60 80023B60 38C001E0 */  li        r6, 0x1e0
/* 020B64 80023B64 480868C9 */  bl        GXSetTexCopySrc
/* 020B68 80023B68 38600140 */  li        r3, 0x140
/* 020B6C 80023B6C 388000F0 */  li        r4, 0xf0
/* 020B70 80023B70 38A00004 */  li        r5, 0x4
/* 020B74 80023B74 38C00001 */  li        r6, 0x1
/* 020B78 80023B78 48086981 */  bl        GXSetTexCopyDst
/* 020B7C 80023B7C 3C608016 */  lis       r3, 0x8016
/* 020B80 80023B80 3BA317B0 */  addi      r29, r3, 0x17b0
/* 020B84 80023B84 3C800002 */  lis       r4, 0x2
/* 020B88 80023B88 7FA3EB78 */  mr        r3, r29
/* 020B8C 80023B8C 38845800 */  addi      r4, r4, 0x5800
/* 020B90 80023B90 48079109 */  bl        DCInvalidateRange
/* 020B94 80023B94 7FA3EB78 */  mr        r3, r29
/* 020B98 80023B98 38800000 */  li        r4, 0x0
/* 020B9C 80023B9C 48087249 */  bl        GXCopyTex
/* 020BA0 80023BA0 38000000 */  li        r0, 0x0
/* 020BA4 80023BA4 900D89B4 */  stw       r0, -0x764c(r13)
/* 020BA8 80023BA8 38607D00 */  li        r3, 0x7d00
/* 020BAC 80023BAC 48085DCD */  bl        GXSetDrawSync
/* 020BB0 80023BB0 48000004 */  b         lbl_80023BB4
lbl_80023BB4:
/* 020BB4 80023BB4 48000004 */  b         lbl_80023BB8
lbl_80023BB8:
/* 020BB8 80023BB8 800D89B4 */  lwz       r0, -0x764c(r13)
/* 020BBC 80023BBC 2C000000 */  cmpwi     r0, 0x0
/* 020BC0 80023BC0 4182FFF8 */  beq       lbl_80023BB8
lbl_80023BC4:
/* 020BC4 80023BC4 807F0010 */  lwz       r3, 0x10(r31)
/* 020BC8 80023BC8 3C03FFBE */  subis     r0, r3, 0x42
/* 020BCC 80023BCC 2800EEC0 */  cmplwi    r0, 0xeec0
/* 020BD0 80023BD0 41820018 */  beq       lbl_80023BE8
/* 020BD4 80023BD4 3C03FFC6 */  subis     r0, r3, 0x3a
/* 020BD8 80023BD8 28009480 */  cmplwi    r0, 0x9480
/* 020BDC 80023BDC 4182000C */  beq       lbl_80023BE8
/* 020BE0 80023BE0 280092C0 */  cmplwi    r0, 0x92c0
/* 020BE4 80023BE4 408200A0 */  bne       lbl_80023C84
lbl_80023BE8:
/* 020BE8 80023BE8 801E0024 */  lwz       r0, 0x24(r30)
/* 020BEC 80023BEC 2C000000 */  cmpwi     r0, 0x0
/* 020BF0 80023BF0 41820094 */  beq       lbl_80023C84
/* 020BF4 80023BF4 801E0050 */  lwz       r0, 0x50(r30)
/* 020BF8 80023BF8 2C000000 */  cmpwi     r0, 0x0
/* 020BFC 80023BFC 40820088 */  bne       lbl_80023C84
/* 020C00 80023C00 3C608016 */  lis       r3, 0x8016
/* 020C04 80023C04 3BE317B0 */  addi      r31, r3, 0x17b0
/* 020C08 80023C08 7FC3F378 */  mr        r3, r30
/* 020C0C 80023C0C 7FE4FB78 */  mr        r4, r31
/* 020C10 80023C10 48001411 */  bl        ZeldaDrawFrameBlur
/* 020C14 80023C14 38600000 */  li        r3, 0x0
/* 020C18 80023C18 38800000 */  li        r4, 0x0
/* 020C1C 80023C1C 38A00280 */  li        r5, 0x280
/* 020C20 80023C20 38C001E0 */  li        r6, 0x1e0
/* 020C24 80023C24 48086809 */  bl        GXSetTexCopySrc
/* 020C28 80023C28 38600140 */  li        r3, 0x140
/* 020C2C 80023C2C 388000F0 */  li        r4, 0xf0
/* 020C30 80023C30 38A00004 */  li        r5, 0x4
/* 020C34 80023C34 38C00001 */  li        r6, 0x1
/* 020C38 80023C38 480868C1 */  bl        GXSetTexCopyDst
/* 020C3C 80023C3C 3C800002 */  lis       r4, 0x2
/* 020C40 80023C40 7FE3FB78 */  mr        r3, r31
/* 020C44 80023C44 38845800 */  addi      r4, r4, 0x5800
/* 020C48 80023C48 48079051 */  bl        DCInvalidateRange
/* 020C4C 80023C4C 7FE3FB78 */  mr        r3, r31
/* 020C50 80023C50 38800000 */  li        r4, 0x0
/* 020C54 80023C54 48087191 */  bl        GXCopyTex
/* 020C58 80023C58 38000000 */  li        r0, 0x0
/* 020C5C 80023C5C 900D89B4 */  stw       r0, -0x764c(r13)
/* 020C60 80023C60 38607D00 */  li        r3, 0x7d00
/* 020C64 80023C64 48085D15 */  bl        GXSetDrawSync
/* 020C68 80023C68 48000004 */  b         lbl_80023C6C
lbl_80023C6C:
/* 020C6C 80023C6C 48000004 */  b         lbl_80023C70
lbl_80023C70:
/* 020C70 80023C70 800D89B4 */  lwz       r0, -0x764c(r13)
/* 020C74 80023C74 2C000000 */  cmpwi     r0, 0x0
/* 020C78 80023C78 4182FFF8 */  beq       lbl_80023C70
/* 020C7C 80023C7C 38000001 */  li        r0, 0x1
/* 020C80 80023C80 901E0050 */  stw       r0, 0x50(r30)
lbl_80023C84:
/* 020C84 80023C84 38600001 */  li        r3, 0x1
/* 020C88 80023C88 80010044 */  lwz       r0, 0x44(r1)
/* 020C8C 80023C8C 83E1003C */  lwz       r31, 0x3c(r1)
/* 020C90 80023C90 83C10038 */  lwz       r30, 0x38(r1)
/* 020C94 80023C94 7C0803A6 */  mtlr      r0
/* 020C98 80023C98 83A10034 */  lwz       r29, 0x34(r1)
/* 020C9C 80023C9C 38210040 */  addi      r1, r1, 0x40
/* 020CA0 80023CA0 4E800020 */  blr

glabel frameHackTIMG_Zelda
/* 020CA4 80023CA4 7C0802A6 */  mflr      r0
/* 020CA8 80023CA8 90010004 */  stw       r0, 0x4(r1)
/* 020CAC 80023CAC 9421FFD8 */  stwu      r1, -0x28(r1)
/* 020CB0 80023CB0 93E10024 */  stw       r31, 0x24(r1)
/* 020CB4 80023CB4 93C10020 */  stw       r30, 0x20(r1)
/* 020CB8 80023CB8 7C9E2378 */  mr        r30, r4
/* 020CBC 80023CBC 7CBF2B78 */  mr        r31, r5
/* 020CC0 80023CC0 809F0000 */  lwz       r4, 0x0(r31)
/* 020CC4 80023CC4 3C04F100 */  subis     r0, r4, 0xf00
/* 020CC8 80023CC8 28000000 */  cmplwi    r0, 0x0
/* 020CCC 80023CCC 40820118 */  bne       lbl_80023DE4
/* 020CD0 80023CD0 80860000 */  lwz       r4, 0x0(r6)
/* 020CD4 80023CD4 3C0402B0 */  addis     r0, r4, 0x2b0
/* 020CD8 80023CD8 28000000 */  cmplwi    r0, 0x0
/* 020CDC 80023CDC 40820108 */  bne       lbl_80023DE4
/* 020CE0 80023CE0 3C80800F */  lis       r4, D_800EBEF0@ha
/* 020CE4 80023CE4 80DE0000 */  lwz       r6, 0x0(r30)
/* 020CE8 80023CE8 38A4BEF0 */  addi      r5, r4, D_800EBEF0@l
/* 020CEC 80023CEC 38E00000 */  li        r7, 0x0
/* 020CF0 80023CF0 48000004 */  b         lbl_80023CF4
lbl_80023CF4:
/* 020CF4 80023CF4 48000004 */  b         lbl_80023CF8
lbl_80023CF8:
/* 020CF8 80023CF8 80860000 */  lwz       r4, 0x0(r6)
/* 020CFC 80023CFC 80050000 */  lwz       r0, 0x0(r5)
/* 020D00 80023D00 7C040040 */  cmplw     r4, r0
/* 020D04 80023D04 408200CC */  bne       lbl_80023DD0
/* 020D08 80023D08 38A50004 */  addi      r5, r5, 0x4
/* 020D0C 80023D0C 38C60004 */  addi      r6, r6, 0x4
/* 020D10 80023D10 38E00001 */  li        r7, 0x1
/* 020D14 80023D14 80860000 */  lwz       r4, 0x0(r6)
/* 020D18 80023D18 80050000 */  lwz       r0, 0x0(r5)
/* 020D1C 80023D1C 7C040040 */  cmplw     r4, r0
/* 020D20 80023D20 408200B0 */  bne       lbl_80023DD0
/* 020D24 80023D24 38A50004 */  addi      r5, r5, 0x4
/* 020D28 80023D28 38C60004 */  addi      r6, r6, 0x4
/* 020D2C 80023D2C 38E00002 */  li        r7, 0x2
/* 020D30 80023D30 80860000 */  lwz       r4, 0x0(r6)
/* 020D34 80023D34 80050000 */  lwz       r0, 0x0(r5)
/* 020D38 80023D38 7C040040 */  cmplw     r4, r0
/* 020D3C 80023D3C 40820094 */  bne       lbl_80023DD0
/* 020D40 80023D40 38A50004 */  addi      r5, r5, 0x4
/* 020D44 80023D44 38C60004 */  addi      r6, r6, 0x4
/* 020D48 80023D48 38E00003 */  li        r7, 0x3
/* 020D4C 80023D4C 80860000 */  lwz       r4, 0x0(r6)
/* 020D50 80023D50 80050000 */  lwz       r0, 0x0(r5)
/* 020D54 80023D54 7C040040 */  cmplw     r4, r0
/* 020D58 80023D58 40820078 */  bne       lbl_80023DD0
/* 020D5C 80023D5C 38A50004 */  addi      r5, r5, 0x4
/* 020D60 80023D60 38C60004 */  addi      r6, r6, 0x4
/* 020D64 80023D64 38E00004 */  li        r7, 0x4
/* 020D68 80023D68 80860000 */  lwz       r4, 0x0(r6)
/* 020D6C 80023D6C 80050000 */  lwz       r0, 0x0(r5)
/* 020D70 80023D70 7C040040 */  cmplw     r4, r0
/* 020D74 80023D74 4082005C */  bne       lbl_80023DD0
/* 020D78 80023D78 38A50004 */  addi      r5, r5, 0x4
/* 020D7C 80023D7C 38C60004 */  addi      r6, r6, 0x4
/* 020D80 80023D80 38E00005 */  li        r7, 0x5
/* 020D84 80023D84 80860000 */  lwz       r4, 0x0(r6)
/* 020D88 80023D88 80050000 */  lwz       r0, 0x0(r5)
/* 020D8C 80023D8C 7C040040 */  cmplw     r4, r0
/* 020D90 80023D90 40820040 */  bne       lbl_80023DD0
/* 020D94 80023D94 38A50004 */  addi      r5, r5, 0x4
/* 020D98 80023D98 38C60004 */  addi      r6, r6, 0x4
/* 020D9C 80023D9C 38E00006 */  li        r7, 0x6
/* 020DA0 80023DA0 80860000 */  lwz       r4, 0x0(r6)
/* 020DA4 80023DA4 80050000 */  lwz       r0, 0x0(r5)
/* 020DA8 80023DA8 7C040040 */  cmplw     r4, r0
/* 020DAC 80023DAC 40820024 */  bne       lbl_80023DD0
/* 020DB0 80023DB0 38A50004 */  addi      r5, r5, 0x4
/* 020DB4 80023DB4 38C60004 */  addi      r6, r6, 0x4
/* 020DB8 80023DB8 38E00007 */  li        r7, 0x7
/* 020DBC 80023DBC 80860000 */  lwz       r4, 0x0(r6)
/* 020DC0 80023DC0 80050000 */  lwz       r0, 0x0(r5)
/* 020DC4 80023DC4 7C040040 */  cmplw     r4, r0
/* 020DC8 80023DC8 40820008 */  bne       lbl_80023DD0
/* 020DCC 80023DCC 38E00008 */  li        r7, 0x8
lbl_80023DD0:
/* 020DD0 80023DD0 28070008 */  cmplwi    r7, 0x8
/* 020DD4 80023DD4 40820010 */  bne       lbl_80023DE4
/* 020DD8 80023DD8 48000895 */  bl        ZeldaGreyScaleConvert
/* 020DDC 80023DDC 38000001 */  li        r0, 0x1
/* 020DE0 80023DE0 980D89B8 */  stb       r0, D_8018B938@sda21(r0)
lbl_80023DE4:
/* 020DE4 80023DE4 880D89B8 */  lbz       r0, D_8018B938@sda21(r0)
/* 020DE8 80023DE8 28000000 */  cmplwi    r0, 0x0
/* 020DEC 80023DEC 41820020 */  beq       lbl_80023E0C
/* 020DF0 80023DF0 801F0000 */  lwz       r0, 0x0(r31)
/* 020DF4 80023DF4 5403000E */  clrrwi    r3, r0, 24
/* 020DF8 80023DF8 3C03F100 */  subis     r0, r3, 0xf00
/* 020DFC 80023DFC 28000000 */  cmplwi    r0, 0x0
/* 020E00 80023E00 4182000C */  beq       lbl_80023E0C
/* 020E04 80023E04 38000000 */  li        r0, 0x0
/* 020E08 80023E08 980D89B8 */  stb       r0, D_8018B938@sda21(r0)
lbl_80023E0C:
/* 020E0C 80023E0C 80DF0000 */  lwz       r6, 0x0(r31)
/* 020E10 80023E10 808D8914 */  lwz       r4, gpSystem@sda21(r0)
/* 020E14 80023E14 54C0473E */  extrwi    r0, r6, 4, 4
/* 020E18 80023E18 80AD89C0 */  lwz       r5, D_8018B940@sda21(r0)
/* 020E1C 80023E1C 5403103A */  slwi      r3, r0, 2
/* 020E20 80023E20 80840034 */  lwz       r4, 0x34(r4)
/* 020E24 80023E24 38033928 */  addi      r0, r3, 0x3928
/* 020E28 80023E28 7C64002E */  lwzx      r3, r4, r0
/* 020E2C 80023E2C 54C0023E */  clrlwi    r0, r6, 8
/* 020E30 80023E30 7C030214 */  add       r0, r3, r0
/* 020E34 80023E34 7C050040 */  cmplw     r5, r0
/* 020E38 80023E38 40820018 */  bne       lbl_80023E50
/* 020E3C 80023E3C 800D89BC */  lwz       r0, D_8018B93C@sda21(r0)
/* 020E40 80023E40 901F0000 */  stw       r0, 0x0(r31)
/* 020E44 80023E44 807E0000 */  lwz       r3, 0x0(r30)
/* 020E48 80023E48 38030040 */  addi      r0, r3, 0x40
/* 020E4C 80023E4C 901E0000 */  stw       r0, 0x0(r30)
lbl_80023E50:
/* 020E50 80023E50 38600001 */  li        r3, 0x1
/* 020E54 80023E54 8001002C */  lwz       r0, 0x2c(r1)
/* 020E58 80023E58 83E10024 */  lwz       r31, 0x24(r1)
/* 020E5C 80023E5C 83C10020 */  lwz       r30, 0x20(r1)
/* 020E60 80023E60 7C0803A6 */  mtlr      r0
/* 020E64 80023E64 38210028 */  addi      r1, r1, 0x28
/* 020E68 80023E68 4E800020 */  blr

glabel ZeldaDrawFrameCamera
/* 020E6C 80023E6C 7C0802A6 */  mflr      r0
/* 020E70 80023E70 90010004 */  stw       r0, 0x4(r1)
/* 020E74 80023E74 9421FF90 */  stwu      r1, -0x70(r1)
/* 020E78 80023E78 93E1006C */  stw       r31, 0x6c(r1)
/* 020E7C 80023E7C 93C10068 */  stw       r30, 0x68(r1)
/* 020E80 80023E80 93A10064 */  stw       r29, 0x64(r1)
/* 020E84 80023E84 7C7F1B78 */  mr        r31, r3
/* 020E88 80023E88 7C9D2378 */  mr        r29, r4
/* 020E8C 80023E8C 3C808011 */  lis       r4, D_80109900@ha
/* 020E90 80023E90 7FE3FB78 */  mr        r3, r31
/* 020E94 80023E94 3BC49900 */  addi      r30, r4, D_80109900@l
/* 020E98 80023E98 480060CD */  bl        frameDrawSetup2D
/* 020E9C 80023E9C 388000FF */  li        r4, 0xff
/* 020EA0 80023EA0 9881002C */  stb       r4, 0x2c(r1)
/* 020EA4 80023EA4 386000A7 */  li        r3, 0xa7
/* 020EA8 80023EA8 380000B0 */  li        r0, 0xb0
/* 020EAC 80023EAC 9861002D */  stb       r3, 0x2d(r1)
/* 020EB0 80023EB0 38600001 */  li        r3, 0x1
/* 020EB4 80023EB4 9801002E */  stb       r0, 0x2e(r1)
/* 020EB8 80023EB8 9881002F */  stb       r4, 0x2f(r1)
/* 020EBC 80023EBC 48088D49 */  bl        GXSetNumTevStages
/* 020EC0 80023EC0 38600000 */  li        r3, 0x0
/* 020EC4 80023EC4 480872BD */  bl        GXSetNumChans
/* 020EC8 80023EC8 38600001 */  li        r3, 0x1
/* 020ECC 80023ECC 480858F1 */  bl        GXSetNumTexGens
/* 020ED0 80023ED0 8001002C */  lwz       r0, 0x2c(r1)
/* 020ED4 80023ED4 38810010 */  addi      r4, r1, 0x10
/* 020ED8 80023ED8 38600001 */  li        r3, 0x1
/* 020EDC 80023EDC 90010010 */  stw       r0, 0x10(r1)
/* 020EE0 80023EE0 48088755 */  bl        GXSetTevColor
/* 020EE4 80023EE4 38600000 */  li        r3, 0x0
/* 020EE8 80023EE8 38800000 */  li        r4, 0x0
/* 020EEC 80023EEC 38A00000 */  li        r5, 0x0
/* 020EF0 80023EF0 38C00000 */  li        r6, 0x0
/* 020EF4 80023EF4 38E00000 */  li        r7, 0x0
/* 020EF8 80023EF8 39000000 */  li        r8, 0x0
/* 020EFC 80023EFC 48088669 */  bl        GXSetTevColorOp
/* 020F00 80023F00 38600000 */  li        r3, 0x0
/* 020F04 80023F04 38800000 */  li        r4, 0x0
/* 020F08 80023F08 38A00000 */  li        r5, 0x0
/* 020F0C 80023F0C 38C00000 */  li        r6, 0x0
/* 020F10 80023F10 38E00000 */  li        r7, 0x0
/* 020F14 80023F14 39000000 */  li        r8, 0x0
/* 020F18 80023F18 480886B5 */  bl        GXSetTevAlphaOp
/* 020F1C 80023F1C 38600000 */  li        r3, 0x0
/* 020F20 80023F20 3880000F */  li        r4, 0xf
/* 020F24 80023F24 38A00008 */  li        r5, 0x8
/* 020F28 80023F28 38C00002 */  li        r6, 0x2
/* 020F2C 80023F2C 38E0000F */  li        r7, 0xf
/* 020F30 80023F30 480885AD */  bl        GXSetTevColorIn
/* 020F34 80023F34 38600000 */  li        r3, 0x0
/* 020F38 80023F38 38800007 */  li        r4, 0x7
/* 020F3C 80023F3C 38A00007 */  li        r5, 0x7
/* 020F40 80023F40 38C00007 */  li        r6, 0x7
/* 020F44 80023F44 38E00001 */  li        r7, 0x1
/* 020F48 80023F48 480885D9 */  bl        GXSetTevAlphaIn
/* 020F4C 80023F4C 38600000 */  li        r3, 0x0
/* 020F50 80023F50 38800000 */  li        r4, 0x0
/* 020F54 80023F54 38A00000 */  li        r5, 0x0
/* 020F58 80023F58 38C000FF */  li        r6, 0xff
/* 020F5C 80023F5C 48088AD1 */  bl        GXSetTevOrder
/* 020F60 80023F60 38600001 */  li        r3, 0x1
/* 020F64 80023F64 38800004 */  li        r4, 0x4
/* 020F68 80023F68 38A00005 */  li        r5, 0x5
/* 020F6C 80023F6C 38C00005 */  li        r6, 0x5
/* 020F70 80023F70 4808913D */  bl        fn_800AD0AC
/* 020F74 80023F74 38600007 */  li        r3, 0x7
/* 020F78 80023F78 38800000 */  li        r4, 0x0
/* 020F7C 80023F7C 38A00000 */  li        r5, 0x0
/* 020F80 80023F80 38C00007 */  li        r6, 0x7
/* 020F84 80023F84 38E00000 */  li        r7, 0x0
/* 020F88 80023F88 480889CD */  bl        GXSetAlphaCompare
/* 020F8C 80023F8C 38600000 */  li        r3, 0x0
/* 020F90 80023F90 38800003 */  li        r4, 0x3
/* 020F94 80023F94 38A00000 */  li        r5, 0x0
/* 020F98 80023F98 480891C1 */  bl        GXSetZMode
/* 020F9C 80023F9C 38600001 */  li        r3, 0x1
/* 020FA0 80023FA0 480891ED */  bl        fn_800AD18C
/* 020FA4 80023FA4 38610030 */  addi      r3, r1, 0x30
/* 020FA8 80023FA8 48082905 */  bl        PSMTXIdentity
/* 020FAC 80023FAC 38610030 */  addi      r3, r1, 0x30
/* 020FB0 80023FB0 3880001E */  li        r4, 0x1e
/* 020FB4 80023FB4 38A00001 */  li        r5, 0x1
/* 020FB8 80023FB8 48089669 */  bl        fn_800AD620
/* 020FBC 80023FBC 3C7E0003 */  addis     r3, r30, 0x3
/* 020FC0 80023FC0 7FA4EB78 */  mr        r4, r29
/* 020FC4 80023FC4 38638120 */  subi      r3, r3, 0x7ee0
/* 020FC8 80023FC8 38A000A0 */  li        r5, 0xa0
/* 020FCC 80023FCC 38C00080 */  li        r6, 0x80
/* 020FD0 80023FD0 38E00001 */  li        r7, 0x1
/* 020FD4 80023FD4 39000000 */  li        r8, 0x0
/* 020FD8 80023FD8 39200000 */  li        r9, 0x0
/* 020FDC 80023FDC 39400000 */  li        r10, 0x0
/* 020FE0 80023FE0 48087379 */  bl        GXInitTexObj
/* 020FE4 80023FE4 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 020FE8 80023FE8 3C7E0003 */  addis     r3, r30, 0x3
/* 020FEC 80023FEC 38638120 */  subi      r3, r3, 0x7ee0
/* 020FF0 80023FF0 FC400890 */  fmr       f2, f1
/* 020FF4 80023FF4 38800000 */  li        r4, 0x0
/* 020FF8 80023FF8 FC600890 */  fmr       f3, f1
/* 020FFC 80023FFC 38A00000 */  li        r5, 0x0
/* 021000 80024000 38C00000 */  li        r6, 0x0
/* 021004 80024004 38E00000 */  li        r7, 0x0
/* 021008 80024008 39000000 */  li        r8, 0x0
/* 02100C 8002400C 48087609 */  bl        fn_800AB614
/* 021010 80024010 3C7E0003 */  addis     r3, r30, 0x3
/* 021014 80024014 38638120 */  subi      r3, r3, 0x7ee0
/* 021018 80024018 38800000 */  li        r4, 0x0
/* 02101C 8002401C 48087939 */  bl        GXLoadTexObj
/* 021020 80024020 48084C8D */  bl        GXClearVtxDesc
/* 021024 80024024 38600009 */  li        r3, 0x9
/* 021028 80024028 38800001 */  li        r4, 0x1
/* 02102C 8002402C 480847B9 */  bl        GXSetVtxDesc
/* 021030 80024030 3860000D */  li        r3, 0xd
/* 021034 80024034 38800001 */  li        r4, 0x1
/* 021038 80024038 480847AD */  bl        GXSetVtxDesc
/* 02103C 8002403C 38600000 */  li        r3, 0x0
/* 021040 80024040 38800009 */  li        r4, 0x9
/* 021044 80024044 38A00001 */  li        r5, 0x1
/* 021048 80024048 38C00004 */  li        r6, 0x4
/* 02104C 8002404C 38E00000 */  li        r7, 0x0
/* 021050 80024050 48084C95 */  bl        GXSetVtxAttrFmt
/* 021054 80024054 38600000 */  li        r3, 0x0
/* 021058 80024058 3880000D */  li        r4, 0xd
/* 02105C 8002405C 38A00001 */  li        r5, 0x1
/* 021060 80024060 38C00004 */  li        r6, 0x4
/* 021064 80024064 38E00000 */  li        r7, 0x0
/* 021068 80024068 48084C7D */  bl        GXSetVtxAttrFmt
/* 02106C 8002406C 38600080 */  li        r3, 0x80
/* 021070 80024070 38800000 */  li        r4, 0x0
/* 021074 80024074 38A00004 */  li        r5, 0x4
/* 021078 80024078 48085EF5 */  bl        GXBegin
/* 02107C 8002407C C0E28180 */  lfs       f7, D_8018C0C0@sda21(r0)
/* 021080 80024080 3D40CC01 */  lis       r10, 0xcc01
/* 021084 80024084 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 021088 80024088 C0C28184 */  lfs       f6, D_8018C0C4@sda21(r0)
/* 02108C 8002408C D0EA8000 */  stfs      f7, -0x8000(r10)
/* 021090 80024090 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 021094 80024094 C0A28100 */  lfs       f5, D_8018C040@sda21(r0)
/* 021098 80024098 D0CA8000 */  stfs      f6, -0x8000(r10)
/* 02109C 8002409C 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 0210A0 800240A0 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 0210A4 800240A4 C0828188 */  lfs       f4, D_8018C0C8@sda21(r0)
/* 0210A8 800240A8 D0AA8000 */  stfs      f5, -0x8000(r10)
/* 0210AC 800240AC C062816C */  lfs       f3, D_8018C0AC@sda21(r0)
/* 0210B0 800240B0 39200000 */  li        r9, 0x0
/* 0210B4 800240B4 D0AA8000 */  stfs      f5, -0x8000(r10)
/* 0210B8 800240B8 3CFF0004 */  addis     r7, r31, 0x4
/* 0210BC 800240BC C0428138 */  lfs       f2, D_8018C078@sda21(r0)
/* 0210C0 800240C0 D08A8000 */  stfs      f4, -0x8000(r10)
/* 0210C4 800240C4 3900FFFF */  li        r8, -0x1
/* 0210C8 800240C8 C022818C */  lfs       f1, D_8018C0CC@sda21(r0)
/* 0210CC 800240CC 38C66998 */  addi      r6, r6, frameDrawLine_Setup@l
/* 0210D0 800240D0 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0210D4 800240D4 C0028190 */  lfs       f0, D_8018C0D0@sda21(r0)
/* 0210D8 800240D8 38A57568 */  addi      r5, r5, frameDrawTriangle_Setup@l
/* 0210DC 800240DC D0CA8000 */  stfs      f6, -0x8000(r10)
/* 0210E0 800240E0 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 0210E4 800240E4 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 0210E8 800240E8 D0AA8000 */  stfs      f5, -0x8000(r10)
/* 0210EC 800240EC D04A8000 */  stfs      f2, -0x8000(r10)
/* 0210F0 800240F0 D08A8000 */  stfs      f4, -0x8000(r10)
/* 0210F4 800240F4 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0210F8 800240F8 D02A8000 */  stfs      f1, -0x8000(r10)
/* 0210FC 800240FC D0AA8000 */  stfs      f5, -0x8000(r10)
/* 021100 80024100 D04A8000 */  stfs      f2, -0x8000(r10)
/* 021104 80024104 D00A8000 */  stfs      f0, -0x8000(r10)
/* 021108 80024108 D0EA8000 */  stfs      f7, -0x8000(r10)
/* 02110C 8002410C D02A8000 */  stfs      f1, -0x8000(r10)
/* 021110 80024110 D0AA8000 */  stfs      f5, -0x8000(r10)
/* 021114 80024114 D0AA8000 */  stfs      f5, -0x8000(r10)
/* 021118 80024118 D00A8000 */  stfs      f0, -0x8000(r10)
/* 02111C 8002411C 913F008C */  stw       r9, 0x8c(r31)
/* 021120 80024120 9107D138 */  stw       r8, -0x2ec8(r7)
/* 021124 80024124 807F007C */  lwz       r3, 0x7c(r31)
/* 021128 80024128 64630004 */  oris      r3, r3, 0x4
/* 02112C 8002412C 60637F2D */  ori       r3, r3, 0x7f2d
/* 021130 80024130 907F007C */  stw       r3, 0x7c(r31)
/* 021134 80024134 90DF012C */  stw       r6, 0x12c(r31)
/* 021138 80024138 90BF0130 */  stw       r5, 0x130(r31)
/* 02113C 8002413C 909F0134 */  stw       r4, 0x134(r31)
/* 021140 80024140 901F0138 */  stw       r0, 0x138(r31)
/* 021144 80024144 80010074 */  lwz       r0, 0x74(r1)
/* 021148 80024148 83E1006C */  lwz       r31, 0x6c(r1)
/* 02114C 8002414C 83C10068 */  lwz       r30, 0x68(r1)
/* 021150 80024150 7C0803A6 */  mtlr      r0
/* 021154 80024154 83A10064 */  lwz       r29, 0x64(r1)
/* 021158 80024158 38210070 */  addi      r1, r1, 0x70
/* 02115C 8002415C 4E800020 */  blr

glabel ZeldaDrawFrameShrink
/* 021160 80024160 7C0802A6 */  mflr      r0
/* 021164 80024164 90010004 */  stw       r0, 0x4(r1)
/* 021168 80024168 9421FF60 */  stwu      r1, -0xa0(r1)
/* 02116C 8002416C DBE10098 */  stfd      f31, 0x98(r1)
/* 021170 80024170 DBC10090 */  stfd      f30, 0x90(r1)
/* 021174 80024174 DBA10088 */  stfd      f29, 0x88(r1)
/* 021178 80024178 DB810080 */  stfd      f28, 0x80(r1)
/* 02117C 8002417C BF410068 */  stmw      r26, 0x68(r1)
/* 021180 80024180 7C7E1B78 */  mr        r30, r3
/* 021184 80024184 6C838000 */  xoris     r3, r4, 0x8000
/* 021188 80024188 C8628110 */  lfd       f3, D_8018C050@sda21(r0)
/* 02118C 8002418C 6CA08000 */  xoris     r0, r5, 0x8000
/* 021190 80024190 90610064 */  stw       r3, 0x64(r1)
/* 021194 80024194 3C604330 */  lis       r3, 0x4330
/* 021198 80024198 C0028108 */  lfs       f0, D_8018C048@sda21(r0)
/* 02119C 8002419C 9001005C */  stw       r0, 0x5c(r1)
/* 0211A0 800241A0 3C808011 */  lis       r4, D_80109900@ha
/* 0211A4 800241A4 2C0604B4 */  cmpwi     r6, 0x4b4
/* 0211A8 800241A8 834D8D48 */  lwz       r26, DemoCurrentBuffer@sda21(r0)
/* 0211AC 800241AC 90610060 */  stw       r3, 0x60(r1)
/* 0211B0 800241B0 C3C28168 */  lfs       f30, D_8018C0A8@sda21(r0)
/* 0211B4 800241B4 3B649900 */  addi      r27, r4, D_80109900@l
/* 0211B8 800241B8 90610058 */  stw       r3, 0x58(r1)
/* 0211BC 800241BC C8410060 */  lfd       f2, 0x60(r1)
/* 0211C0 800241C0 C8210058 */  lfd       f1, 0x58(r1)
/* 0211C4 800241C4 EFE21828 */  fsubs     f31, f2, f3
/* 0211C8 800241C8 C382816C */  lfs       f28, D_8018C0AC@sda21(r0)
/* 0211CC 800241CC EFA11828 */  fsubs     f29, f1, f3
/* 0211D0 800241D0 EFFF0032 */  fmuls     f31, f31, f0
/* 0211D4 800241D4 EFBD0032 */  fmuls     f29, f29, f0
/* 0211D8 800241D8 4182003C */  beq       lbl_80024214
/* 0211DC 800241DC 4080001C */  bge       lbl_800241F8
/* 0211E0 800241E0 2C060471 */  cmpwi     r6, 0x471
/* 0211E4 800241E4 41820028 */  beq       lbl_8002420C
/* 0211E8 800241E8 40800038 */  bge       lbl_80024220
/* 0211EC 800241EC 2C060435 */  cmpwi     r6, 0x435
/* 0211F0 800241F0 41820014 */  beq       lbl_80024204
/* 0211F4 800241F4 4800002C */  b         lbl_80024220
lbl_800241F8:
/* 0211F8 800241F8 2C060500 */  cmpwi     r6, 0x500
/* 0211FC 800241FC 41820020 */  beq       lbl_8002421C
/* 021200 80024200 48000020 */  b         lbl_80024220
lbl_80024204:
/* 021204 80024204 C0828194 */  lfs       f4, D_8018C0D4@sda21(r0)
/* 021208 80024208 48000018 */  b         lbl_80024220
lbl_8002420C:
/* 02120C 8002420C C0828198 */  lfs       f4, D_8018C0D8@sda21(r0)
/* 021210 80024210 48000010 */  b         lbl_80024220
lbl_80024214:
/* 021214 80024214 C082819C */  lfs       f4, D_8018C0DC@sda21(r0)
/* 021218 80024218 48000008 */  b         lbl_80024220
lbl_8002421C:
/* 02121C 8002421C C08281A0 */  lfs       f4, D_8018C0E0@sda21(r0)
lbl_80024220:
/* 021220 80024220 EFDE0132 */  fmuls     f30, f30, f4
/* 021224 80024224 38600000 */  li        r3, 0x0
/* 021228 80024228 EF9C0132 */  fmuls     f28, f28, f4
/* 02122C 8002422C 38800000 */  li        r4, 0x0
/* 021230 80024230 38A00280 */  li        r5, 0x280
/* 021234 80024234 38C001E0 */  li        r6, 0x1e0
/* 021238 80024238 480861F5 */  bl        GXSetTexCopySrc
/* 02123C 8002423C 38600280 */  li        r3, 0x280
/* 021240 80024240 388001E0 */  li        r4, 0x1e0
/* 021244 80024244 38A00004 */  li        r5, 0x4
/* 021248 80024248 38C00000 */  li        r6, 0x0
/* 02124C 8002424C 480862AD */  bl        GXSetTexCopyDst
/* 021250 80024250 7F43D378 */  mr        r3, r26
/* 021254 80024254 38800000 */  li        r4, 0x0
/* 021258 80024258 48086B8D */  bl        GXCopyTex
/* 02125C 8002425C 480858F9 */  bl        fn_800A9B54
/* 021260 80024260 7FC3F378 */  mr        r3, r30
/* 021264 80024264 48005D01 */  bl        frameDrawSetup2D
/* 021268 80024268 38600000 */  li        r3, 0x0
/* 02126C 8002426C 38800003 */  li        r4, 0x3
/* 021270 80024270 38A00000 */  li        r5, 0x0
/* 021274 80024274 48088EE5 */  bl        GXSetZMode
/* 021278 80024278 38600001 */  li        r3, 0x1
/* 02127C 8002427C 48088F11 */  bl        fn_800AD18C
/* 021280 80024280 38600001 */  li        r3, 0x1
/* 021284 80024284 48088981 */  bl        GXSetNumTevStages
/* 021288 80024288 38600001 */  li        r3, 0x1
/* 02128C 8002428C 48086EF5 */  bl        GXSetNumChans
/* 021290 80024290 38600000 */  li        r3, 0x0
/* 021294 80024294 48085529 */  bl        GXSetNumTexGens
/* 021298 80024298 3BE00000 */  li        r31, 0x0
/* 02129C 8002429C 9BE10020 */  stb       r31, 0x20(r1)
/* 0212A0 800242A0 3B8000FF */  li        r28, 0xff
/* 0212A4 800242A4 3881001C */  addi      r4, r1, 0x1c
/* 0212A8 800242A8 9BE10021 */  stb       r31, 0x21(r1)
/* 0212AC 800242AC 38600001 */  li        r3, 0x1
/* 0212B0 800242B0 9BE10022 */  stb       r31, 0x22(r1)
/* 0212B4 800242B4 9B810023 */  stb       r28, 0x23(r1)
/* 0212B8 800242B8 80010020 */  lwz       r0, 0x20(r1)
/* 0212BC 800242BC 9001001C */  stw       r0, 0x1c(r1)
/* 0212C0 800242C0 48088375 */  bl        GXSetTevColor
/* 0212C4 800242C4 38600000 */  li        r3, 0x0
/* 0212C8 800242C8 38800000 */  li        r4, 0x0
/* 0212CC 800242CC 38A00000 */  li        r5, 0x0
/* 0212D0 800242D0 38C00000 */  li        r6, 0x0
/* 0212D4 800242D4 38E00000 */  li        r7, 0x0
/* 0212D8 800242D8 39000000 */  li        r8, 0x0
/* 0212DC 800242DC 48088289 */  bl        GXSetTevColorOp
/* 0212E0 800242E0 38600000 */  li        r3, 0x0
/* 0212E4 800242E4 38800000 */  li        r4, 0x0
/* 0212E8 800242E8 38A00000 */  li        r5, 0x0
/* 0212EC 800242EC 38C00000 */  li        r6, 0x0
/* 0212F0 800242F0 38E00000 */  li        r7, 0x0
/* 0212F4 800242F4 39000000 */  li        r8, 0x0
/* 0212F8 800242F8 480882D5 */  bl        GXSetTevAlphaOp
/* 0212FC 800242FC 38600000 */  li        r3, 0x0
/* 021300 80024300 3880000F */  li        r4, 0xf
/* 021304 80024304 38A0000F */  li        r5, 0xf
/* 021308 80024308 38C0000F */  li        r6, 0xf
/* 02130C 8002430C 38E00002 */  li        r7, 0x2
/* 021310 80024310 480881CD */  bl        GXSetTevColorIn
/* 021314 80024314 38600000 */  li        r3, 0x0
/* 021318 80024318 38800007 */  li        r4, 0x7
/* 02131C 8002431C 38A00007 */  li        r5, 0x7
/* 021320 80024320 38C00007 */  li        r6, 0x7
/* 021324 80024324 38E00006 */  li        r7, 0x6
/* 021328 80024328 480881F9 */  bl        GXSetTevAlphaIn
/* 02132C 8002432C 38600000 */  li        r3, 0x0
/* 021330 80024330 388000FF */  li        r4, 0xff
/* 021334 80024334 38A000FF */  li        r5, 0xff
/* 021338 80024338 38C000FF */  li        r6, 0xff
/* 02133C 8002433C 480886F1 */  bl        GXSetTevOrder
/* 021340 80024340 38600000 */  li        r3, 0x0
/* 021344 80024344 38800004 */  li        r4, 0x4
/* 021348 80024348 38A00005 */  li        r5, 0x5
/* 02134C 8002434C 38C00005 */  li        r6, 0x5
/* 021350 80024350 48088D5D */  bl        fn_800AD0AC
/* 021354 80024354 48084959 */  bl        GXClearVtxDesc
/* 021358 80024358 38600009 */  li        r3, 0x9
/* 02135C 8002435C 38800001 */  li        r4, 0x1
/* 021360 80024360 48084485 */  bl        GXSetVtxDesc
/* 021364 80024364 38600000 */  li        r3, 0x0
/* 021368 80024368 38800009 */  li        r4, 0x9
/* 02136C 8002436C 38A00001 */  li        r5, 0x1
/* 021370 80024370 38C00004 */  li        r6, 0x4
/* 021374 80024374 38E00000 */  li        r7, 0x0
/* 021378 80024378 4808496D */  bl        GXSetVtxAttrFmt
/* 02137C 8002437C 38600080 */  li        r3, 0x80
/* 021380 80024380 38800000 */  li        r4, 0x0
/* 021384 80024384 38A00004 */  li        r5, 0x4
/* 021388 80024388 48085BE5 */  bl        GXBegin
/* 02138C 8002438C C0428100 */  lfs       f2, D_8018C040@sda21(r0)
/* 021390 80024390 3FA0CC01 */  lis       r29, 0xcc01
/* 021394 80024394 C0228168 */  lfs       f1, D_8018C0A8@sda21(r0)
/* 021398 80024398 38600001 */  li        r3, 0x1
/* 02139C 8002439C D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213A0 800243A0 C002816C */  lfs       f0, D_8018C0AC@sda21(r0)
/* 0213A4 800243A4 D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213A8 800243A8 D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213AC 800243AC D03D8000 */  stfs      f1, -0x8000(r29)
/* 0213B0 800243B0 D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213B4 800243B4 D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213B8 800243B8 D03D8000 */  stfs      f1, -0x8000(r29)
/* 0213BC 800243BC D01D8000 */  stfs      f0, -0x8000(r29)
/* 0213C0 800243C0 D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213C4 800243C4 D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213C8 800243C8 D01D8000 */  stfs      f0, -0x8000(r29)
/* 0213CC 800243CC D05D8000 */  stfs      f2, -0x8000(r29)
/* 0213D0 800243D0 9B810020 */  stb       r28, 0x20(r1)
/* 0213D4 800243D4 9B810021 */  stb       r28, 0x21(r1)
/* 0213D8 800243D8 9B810022 */  stb       r28, 0x22(r1)
/* 0213DC 800243DC 9B810023 */  stb       r28, 0x23(r1)
/* 0213E0 800243E0 48088825 */  bl        GXSetNumTevStages
/* 0213E4 800243E4 38600000 */  li        r3, 0x0
/* 0213E8 800243E8 48086D99 */  bl        GXSetNumChans
/* 0213EC 800243EC 38600001 */  li        r3, 0x1
/* 0213F0 800243F0 480853CD */  bl        GXSetNumTexGens
/* 0213F4 800243F4 80010020 */  lwz       r0, 0x20(r1)
/* 0213F8 800243F8 38810018 */  addi      r4, r1, 0x18
/* 0213FC 800243FC 38600001 */  li        r3, 0x1
/* 021400 80024400 90010018 */  stw       r0, 0x18(r1)
/* 021404 80024404 48088231 */  bl        GXSetTevColor
/* 021408 80024408 38600000 */  li        r3, 0x0
/* 02140C 8002440C 38800000 */  li        r4, 0x0
/* 021410 80024410 38A00000 */  li        r5, 0x0
/* 021414 80024414 38C00000 */  li        r6, 0x0
/* 021418 80024418 38E00000 */  li        r7, 0x0
/* 02141C 8002441C 39000000 */  li        r8, 0x0
/* 021420 80024420 48088145 */  bl        GXSetTevColorOp
/* 021424 80024424 38600000 */  li        r3, 0x0
/* 021428 80024428 38800000 */  li        r4, 0x0
/* 02142C 8002442C 38A00000 */  li        r5, 0x0
/* 021430 80024430 38C00000 */  li        r6, 0x0
/* 021434 80024434 38E00000 */  li        r7, 0x0
/* 021438 80024438 39000000 */  li        r8, 0x0
/* 02143C 8002443C 48088191 */  bl        GXSetTevAlphaOp
/* 021440 80024440 38600000 */  li        r3, 0x0
/* 021444 80024444 3880000F */  li        r4, 0xf
/* 021448 80024448 38A00008 */  li        r5, 0x8
/* 02144C 8002444C 38C00002 */  li        r6, 0x2
/* 021450 80024450 38E0000F */  li        r7, 0xf
/* 021454 80024454 48088089 */  bl        GXSetTevColorIn
/* 021458 80024458 38600000 */  li        r3, 0x0
/* 02145C 8002445C 38800007 */  li        r4, 0x7
/* 021460 80024460 38A00007 */  li        r5, 0x7
/* 021464 80024464 38C00007 */  li        r6, 0x7
/* 021468 80024468 38E00001 */  li        r7, 0x1
/* 02146C 8002446C 480880B5 */  bl        GXSetTevAlphaIn
/* 021470 80024470 38600000 */  li        r3, 0x0
/* 021474 80024474 38800000 */  li        r4, 0x0
/* 021478 80024478 38A00000 */  li        r5, 0x0
/* 02147C 8002447C 38C000FF */  li        r6, 0xff
/* 021480 80024480 480885AD */  bl        GXSetTevOrder
/* 021484 80024484 38600001 */  li        r3, 0x1
/* 021488 80024488 38800004 */  li        r4, 0x4
/* 02148C 8002448C 38A00005 */  li        r5, 0x5
/* 021490 80024490 38C00005 */  li        r6, 0x5
/* 021494 80024494 48088C19 */  bl        fn_800AD0AC
/* 021498 80024498 38600007 */  li        r3, 0x7
/* 02149C 8002449C 38800000 */  li        r4, 0x0
/* 0214A0 800244A0 38A00000 */  li        r5, 0x0
/* 0214A4 800244A4 38C00007 */  li        r6, 0x7
/* 0214A8 800244A8 38E00000 */  li        r7, 0x0
/* 0214AC 800244AC 480884A9 */  bl        GXSetAlphaCompare
/* 0214B0 800244B0 38600000 */  li        r3, 0x0
/* 0214B4 800244B4 38800003 */  li        r4, 0x3
/* 0214B8 800244B8 38A00000 */  li        r5, 0x0
/* 0214BC 800244BC 48088C9D */  bl        GXSetZMode
/* 0214C0 800244C0 38600001 */  li        r3, 0x1
/* 0214C4 800244C4 48088CC9 */  bl        fn_800AD18C
/* 0214C8 800244C8 38610028 */  addi      r3, r1, 0x28
/* 0214CC 800244CC 480823E1 */  bl        PSMTXIdentity
/* 0214D0 800244D0 38610028 */  addi      r3, r1, 0x28
/* 0214D4 800244D4 3880001E */  li        r4, 0x1e
/* 0214D8 800244D8 38A00001 */  li        r5, 0x1
/* 0214DC 800244DC 48089145 */  bl        fn_800AD620
/* 0214E0 800244E0 3C7B0003 */  addis     r3, r27, 0x3
/* 0214E4 800244E4 7F44D378 */  mr        r4, r26
/* 0214E8 800244E8 38638100 */  subi      r3, r3, 0x7f00
/* 0214EC 800244EC 38A00280 */  li        r5, 0x280
/* 0214F0 800244F0 38C001E0 */  li        r6, 0x1e0
/* 0214F4 800244F4 38E00004 */  li        r7, 0x4
/* 0214F8 800244F8 39000000 */  li        r8, 0x0
/* 0214FC 800244FC 39200000 */  li        r9, 0x0
/* 021500 80024500 39400000 */  li        r10, 0x0
/* 021504 80024504 48086E55 */  bl        GXInitTexObj
/* 021508 80024508 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 02150C 8002450C 3C7B0003 */  addis     r3, r27, 0x3
/* 021510 80024510 38638100 */  subi      r3, r3, 0x7f00
/* 021514 80024514 FC400890 */  fmr       f2, f1
/* 021518 80024518 38800000 */  li        r4, 0x0
/* 02151C 8002451C FC600890 */  fmr       f3, f1
/* 021520 80024520 38A00000 */  li        r5, 0x0
/* 021524 80024524 38C00000 */  li        r6, 0x0
/* 021528 80024528 38E00000 */  li        r7, 0x0
/* 02152C 8002452C 39000000 */  li        r8, 0x0
/* 021530 80024530 480870E5 */  bl        fn_800AB614
/* 021534 80024534 3C7B0003 */  addis     r3, r27, 0x3
/* 021538 80024538 38638100 */  subi      r3, r3, 0x7f00
/* 02153C 8002453C 38800000 */  li        r4, 0x0
/* 021540 80024540 48087415 */  bl        GXLoadTexObj
/* 021544 80024544 48084769 */  bl        GXClearVtxDesc
/* 021548 80024548 38600009 */  li        r3, 0x9
/* 02154C 8002454C 38800001 */  li        r4, 0x1
/* 021550 80024550 48084295 */  bl        GXSetVtxDesc
/* 021554 80024554 3860000D */  li        r3, 0xd
/* 021558 80024558 38800001 */  li        r4, 0x1
/* 02155C 8002455C 48084289 */  bl        GXSetVtxDesc
/* 021560 80024560 38600000 */  li        r3, 0x0
/* 021564 80024564 38800009 */  li        r4, 0x9
/* 021568 80024568 38A00001 */  li        r5, 0x1
/* 02156C 8002456C 38C00004 */  li        r6, 0x4
/* 021570 80024570 38E00000 */  li        r7, 0x0
/* 021574 80024574 48084771 */  bl        GXSetVtxAttrFmt
/* 021578 80024578 38600000 */  li        r3, 0x0
/* 02157C 8002457C 3880000D */  li        r4, 0xd
/* 021580 80024580 38A00001 */  li        r5, 0x1
/* 021584 80024584 38C00004 */  li        r6, 0x4
/* 021588 80024588 38E00000 */  li        r7, 0x0
/* 02158C 8002458C 48084759 */  bl        GXSetVtxAttrFmt
/* 021590 80024590 38600080 */  li        r3, 0x80
/* 021594 80024594 38800000 */  li        r4, 0x0
/* 021598 80024598 38A00004 */  li        r5, 0x4
/* 02159C 8002459C 480859D1 */  bl        GXBegin
/* 0215A0 800245A0 D3FD8000 */  stfs      f31, -0x8000(r29)
/* 0215A4 800245A4 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 0215A8 800245A8 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 0215AC 800245AC C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 0215B0 800245B0 D3BD8000 */  stfs      f29, -0x8000(r29)
/* 0215B4 800245B4 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 0215B8 800245B8 C0028138 */  lfs       f0, D_8018C078@sda21(r0)
/* 0215BC 800245BC D03D8000 */  stfs      f1, -0x8000(r29)
/* 0215C0 800245C0 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 0215C4 800245C4 3CFE0004 */  addis     r7, r30, 0x4
/* 0215C8 800245C8 D03D8000 */  stfs      f1, -0x8000(r29)
/* 0215CC 800245CC 3900FFFF */  li        r8, -0x1
/* 0215D0 800245D0 38C66998 */  addi      r6, r6, frameDrawLine_Setup@l
/* 0215D4 800245D4 D03D8000 */  stfs      f1, -0x8000(r29)
/* 0215D8 800245D8 38A57568 */  addi      r5, r5, frameDrawTriangle_Setup@l
/* 0215DC 800245DC 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 0215E0 800245E0 D3DD8000 */  stfs      f30, -0x8000(r29)
/* 0215E4 800245E4 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 0215E8 800245E8 D3BD8000 */  stfs      f29, -0x8000(r29)
/* 0215EC 800245EC D03D8000 */  stfs      f1, -0x8000(r29)
/* 0215F0 800245F0 D01D8000 */  stfs      f0, -0x8000(r29)
/* 0215F4 800245F4 D03D8000 */  stfs      f1, -0x8000(r29)
/* 0215F8 800245F8 D3DD8000 */  stfs      f30, -0x8000(r29)
/* 0215FC 800245FC D39D8000 */  stfs      f28, -0x8000(r29)
/* 021600 80024600 D03D8000 */  stfs      f1, -0x8000(r29)
/* 021604 80024604 D01D8000 */  stfs      f0, -0x8000(r29)
/* 021608 80024608 D01D8000 */  stfs      f0, -0x8000(r29)
/* 02160C 8002460C D3FD8000 */  stfs      f31, -0x8000(r29)
/* 021610 80024610 D39D8000 */  stfs      f28, -0x8000(r29)
/* 021614 80024614 D03D8000 */  stfs      f1, -0x8000(r29)
/* 021618 80024618 D03D8000 */  stfs      f1, -0x8000(r29)
/* 02161C 8002461C D01D8000 */  stfs      f0, -0x8000(r29)
/* 021620 80024620 93FE008C */  stw       r31, 0x8c(r30)
/* 021624 80024624 9107D138 */  stw       r8, -0x2ec8(r7)
/* 021628 80024628 807E007C */  lwz       r3, 0x7c(r30)
/* 02162C 8002462C 64630004 */  oris      r3, r3, 0x4
/* 021630 80024630 60637F2D */  ori       r3, r3, 0x7f2d
/* 021634 80024634 907E007C */  stw       r3, 0x7c(r30)
/* 021638 80024638 90DE012C */  stw       r6, 0x12c(r30)
/* 02163C 8002463C 90BE0130 */  stw       r5, 0x130(r30)
/* 021640 80024640 909E0134 */  stw       r4, 0x134(r30)
/* 021644 80024644 901E0138 */  stw       r0, 0x138(r30)
/* 021648 80024648 BB410068 */  lmw       r26, 0x68(r1)
/* 02164C 8002464C 800100A4 */  lwz       r0, 0xa4(r1)
/* 021650 80024650 CBE10098 */  lfd       f31, 0x98(r1)
/* 021654 80024654 CBC10090 */  lfd       f30, 0x90(r1)
/* 021658 80024658 7C0803A6 */  mtlr      r0
/* 02165C 8002465C CBA10088 */  lfd       f29, 0x88(r1)
/* 021660 80024660 CB810080 */  lfd       f28, 0x80(r1)
/* 021664 80024664 382100A0 */  addi      r1, r1, 0xa0
/* 021668 80024668 4E800020 */  blr

glabel ZeldaGreyScaleConvert
/* 02166C 8002466C 7C0802A6 */  mflr      r0
/* 021670 80024670 90010004 */  stw       r0, 0x4(r1)
/* 021674 80024674 9421FF88 */  stwu      r1, -0x78(r1)
/* 021678 80024678 93E10074 */  stw       r31, 0x74(r1)
/* 02167C 8002467C 93C10070 */  stw       r30, 0x70(r1)
/* 021680 80024680 93A1006C */  stw       r29, 0x6c(r1)
/* 021684 80024684 7C7F1B78 */  mr        r31, r3
/* 021688 80024688 386000C0 */  li        r3, 0xc0
/* 02168C 8002468C 880D8176 */  lbz       r0, D_8018B0F6@sda21(r0)
/* 021690 80024690 98610010 */  stb       r3, 0x10(r1)
/* 021694 80024694 386000A1 */  li        r3, 0xa1
/* 021698 80024698 3C808011 */  lis       r4, D_80109900@ha
/* 02169C 8002469C 83AD8D48 */  lwz       r29, DemoCurrentBuffer@sda21(r0)
/* 0216A0 800246A0 98610011 */  stb       r3, 0x11(r1)
/* 0216A4 800246A4 38600055 */  li        r3, 0x55
/* 0216A8 800246A8 98610012 */  stb       r3, 0x12(r1)
/* 0216AC 800246AC 3BC49900 */  addi      r30, r4, D_80109900@l
/* 0216B0 800246B0 38600000 */  li        r3, 0x0
/* 0216B4 800246B4 98010013 */  stb       r0, 0x13(r1)
/* 0216B8 800246B8 38800000 */  li        r4, 0x0
/* 0216BC 800246BC 38A00280 */  li        r5, 0x280
/* 0216C0 800246C0 38C001E0 */  li        r6, 0x1e0
/* 0216C4 800246C4 48085D69 */  bl        GXSetTexCopySrc
/* 0216C8 800246C8 38600280 */  li        r3, 0x280
/* 0216CC 800246CC 388001E0 */  li        r4, 0x1e0
/* 0216D0 800246D0 38A00001 */  li        r5, 0x1
/* 0216D4 800246D4 38C00000 */  li        r6, 0x0
/* 0216D8 800246D8 48085E21 */  bl        GXSetTexCopyDst
/* 0216DC 800246DC 7FA3EB78 */  mr        r3, r29
/* 0216E0 800246E0 38800000 */  li        r4, 0x0
/* 0216E4 800246E4 48086701 */  bl        GXCopyTex
/* 0216E8 800246E8 4808546D */  bl        fn_800A9B54
/* 0216EC 800246EC 7FE3FB78 */  mr        r3, r31
/* 0216F0 800246F0 48005875 */  bl        frameDrawSetup2D
/* 0216F4 800246F4 800D89C8 */  lwz       r0, D_8018B948@sda21(r0)
/* 0216F8 800246F8 28000000 */  cmplwi    r0, 0x0
/* 0216FC 800246FC 418200D8 */  beq       lbl_800247D4
/* 021700 80024700 38600001 */  li        r3, 0x1
/* 021704 80024704 48088501 */  bl        GXSetNumTevStages
/* 021708 80024708 38600000 */  li        r3, 0x0
/* 02170C 8002470C 48086A75 */  bl        GXSetNumChans
/* 021710 80024710 38600001 */  li        r3, 0x1
/* 021714 80024714 480850A9 */  bl        GXSetNumTexGens
/* 021718 80024718 80010010 */  lwz       r0, 0x10(r1)
/* 02171C 8002471C 3881000C */  addi      r4, r1, 0xc
/* 021720 80024720 38600001 */  li        r3, 0x1
/* 021724 80024724 9001000C */  stw       r0, 0xc(r1)
/* 021728 80024728 48087F0D */  bl        GXSetTevColor
/* 02172C 8002472C 38600000 */  li        r3, 0x0
/* 021730 80024730 38800000 */  li        r4, 0x0
/* 021734 80024734 38A00000 */  li        r5, 0x0
/* 021738 80024738 38C00000 */  li        r6, 0x0
/* 02173C 8002473C 38E00000 */  li        r7, 0x0
/* 021740 80024740 39000000 */  li        r8, 0x0
/* 021744 80024744 48087E21 */  bl        GXSetTevColorOp
/* 021748 80024748 38600000 */  li        r3, 0x0
/* 02174C 8002474C 38800000 */  li        r4, 0x0
/* 021750 80024750 38A00000 */  li        r5, 0x0
/* 021754 80024754 38C00000 */  li        r6, 0x0
/* 021758 80024758 38E00000 */  li        r7, 0x0
/* 02175C 8002475C 39000000 */  li        r8, 0x0
/* 021760 80024760 48087E6D */  bl        GXSetTevAlphaOp
/* 021764 80024764 38600000 */  li        r3, 0x0
/* 021768 80024768 3880000F */  li        r4, 0xf
/* 02176C 8002476C 38A00008 */  li        r5, 0x8
/* 021770 80024770 38C00002 */  li        r6, 0x2
/* 021774 80024774 38E0000F */  li        r7, 0xf
/* 021778 80024778 48087D65 */  bl        GXSetTevColorIn
/* 02177C 8002477C 38600000 */  li        r3, 0x0
/* 021780 80024780 38800007 */  li        r4, 0x7
/* 021784 80024784 38A00007 */  li        r5, 0x7
/* 021788 80024788 38C00007 */  li        r6, 0x7
/* 02178C 8002478C 38E00001 */  li        r7, 0x1
/* 021790 80024790 48087D91 */  bl        GXSetTevAlphaIn
/* 021794 80024794 38600000 */  li        r3, 0x0
/* 021798 80024798 38800000 */  li        r4, 0x0
/* 02179C 8002479C 38A00000 */  li        r5, 0x0
/* 0217A0 800247A0 38C000FF */  li        r6, 0xff
/* 0217A4 800247A4 48088289 */  bl        GXSetTevOrder
/* 0217A8 800247A8 38600001 */  li        r3, 0x1
/* 0217AC 800247AC 38800004 */  li        r4, 0x4
/* 0217B0 800247B0 38A00005 */  li        r5, 0x5
/* 0217B4 800247B4 38C00005 */  li        r6, 0x5
/* 0217B8 800247B8 480888F5 */  bl        fn_800AD0AC
/* 0217BC 800247BC 886D8176 */  lbz       r3, D_8018B0F6@sda21(r0)
/* 0217C0 800247C0 280300FF */  cmplwi    r3, 0xff
/* 0217C4 800247C4 4080005C */  bge       lbl_80024820
/* 0217C8 800247C8 38030014 */  addi      r0, r3, 0x14
/* 0217CC 800247CC 980D8176 */  stb       r0, D_8018B0F6@sda21(r0)
/* 0217D0 800247D0 48000050 */  b         lbl_80024820
lbl_800247D4:
/* 0217D4 800247D4 38600001 */  li        r3, 0x1
/* 0217D8 800247D8 4808842D */  bl        GXSetNumTevStages
/* 0217DC 800247DC 38600000 */  li        r3, 0x0
/* 0217E0 800247E0 480869A1 */  bl        GXSetNumChans
/* 0217E4 800247E4 38600001 */  li        r3, 0x1
/* 0217E8 800247E8 48084FD5 */  bl        GXSetNumTexGens
/* 0217EC 800247EC 38600000 */  li        r3, 0x0
/* 0217F0 800247F0 38800003 */  li        r4, 0x3
/* 0217F4 800247F4 48087C5D */  bl        GXSetTevOp
/* 0217F8 800247F8 38600000 */  li        r3, 0x0
/* 0217FC 800247FC 38800000 */  li        r4, 0x0
/* 021800 80024800 38A00000 */  li        r5, 0x0
/* 021804 80024804 38C000FF */  li        r6, 0xff
/* 021808 80024808 48088225 */  bl        GXSetTevOrder
/* 02180C 8002480C 38600000 */  li        r3, 0x0
/* 021810 80024810 38800004 */  li        r4, 0x4
/* 021814 80024814 38A00005 */  li        r5, 0x5
/* 021818 80024818 38C00005 */  li        r6, 0x5
/* 02181C 8002481C 48088891 */  bl        fn_800AD0AC
lbl_80024820:
/* 021820 80024820 38600007 */  li        r3, 0x7
/* 021824 80024824 38800000 */  li        r4, 0x0
/* 021828 80024828 38A00000 */  li        r5, 0x0
/* 02182C 8002482C 38C00007 */  li        r6, 0x7
/* 021830 80024830 38E00000 */  li        r7, 0x0
/* 021834 80024834 48088121 */  bl        GXSetAlphaCompare
/* 021838 80024838 38600000 */  li        r3, 0x0
/* 02183C 8002483C 38800003 */  li        r4, 0x3
/* 021840 80024840 38A00000 */  li        r5, 0x0
/* 021844 80024844 48088915 */  bl        GXSetZMode
/* 021848 80024848 38600001 */  li        r3, 0x1
/* 02184C 8002484C 48088941 */  bl        fn_800AD18C
/* 021850 80024850 38610038 */  addi      r3, r1, 0x38
/* 021854 80024854 48082059 */  bl        PSMTXIdentity
/* 021858 80024858 38610038 */  addi      r3, r1, 0x38
/* 02185C 8002485C 3880001E */  li        r4, 0x1e
/* 021860 80024860 38A00001 */  li        r5, 0x1
/* 021864 80024864 48088DBD */  bl        fn_800AD620
/* 021868 80024868 3C7E0003 */  addis     r3, r30, 0x3
/* 02186C 8002486C 7FA4EB78 */  mr        r4, r29
/* 021870 80024870 386380C0 */  subi      r3, r3, 0x7f40
/* 021874 80024874 38A00280 */  li        r5, 0x280
/* 021878 80024878 38C001E0 */  li        r6, 0x1e0
/* 02187C 8002487C 38E00001 */  li        r7, 0x1
/* 021880 80024880 39000000 */  li        r8, 0x0
/* 021884 80024884 39200000 */  li        r9, 0x0
/* 021888 80024888 39400000 */  li        r10, 0x0
/* 02188C 8002488C 48086ACD */  bl        GXInitTexObj
/* 021890 80024890 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 021894 80024894 3C7E0003 */  addis     r3, r30, 0x3
/* 021898 80024898 386380C0 */  subi      r3, r3, 0x7f40
/* 02189C 8002489C FC400890 */  fmr       f2, f1
/* 0218A0 800248A0 38800000 */  li        r4, 0x0
/* 0218A4 800248A4 FC600890 */  fmr       f3, f1
/* 0218A8 800248A8 38A00000 */  li        r5, 0x0
/* 0218AC 800248AC 38C00000 */  li        r6, 0x0
/* 0218B0 800248B0 38E00000 */  li        r7, 0x0
/* 0218B4 800248B4 39000000 */  li        r8, 0x0
/* 0218B8 800248B8 48086D5D */  bl        fn_800AB614
/* 0218BC 800248BC 3C7E0003 */  addis     r3, r30, 0x3
/* 0218C0 800248C0 386380C0 */  subi      r3, r3, 0x7f40
/* 0218C4 800248C4 38800000 */  li        r4, 0x0
/* 0218C8 800248C8 4808708D */  bl        GXLoadTexObj
/* 0218CC 800248CC 480843E1 */  bl        GXClearVtxDesc
/* 0218D0 800248D0 38600009 */  li        r3, 0x9
/* 0218D4 800248D4 38800001 */  li        r4, 0x1
/* 0218D8 800248D8 48083F0D */  bl        GXSetVtxDesc
/* 0218DC 800248DC 3860000D */  li        r3, 0xd
/* 0218E0 800248E0 38800001 */  li        r4, 0x1
/* 0218E4 800248E4 48083F01 */  bl        GXSetVtxDesc
/* 0218E8 800248E8 38600000 */  li        r3, 0x0
/* 0218EC 800248EC 38800009 */  li        r4, 0x9
/* 0218F0 800248F0 38A00001 */  li        r5, 0x1
/* 0218F4 800248F4 38C00004 */  li        r6, 0x4
/* 0218F8 800248F8 38E00000 */  li        r7, 0x0
/* 0218FC 800248FC 480843E9 */  bl        GXSetVtxAttrFmt
/* 021900 80024900 38600000 */  li        r3, 0x0
/* 021904 80024904 3880000D */  li        r4, 0xd
/* 021908 80024908 38A00001 */  li        r5, 0x1
/* 02190C 8002490C 38C00004 */  li        r6, 0x4
/* 021910 80024910 38E00000 */  li        r7, 0x0
/* 021914 80024914 480843D1 */  bl        GXSetVtxAttrFmt
/* 021918 80024918 38600080 */  li        r3, 0x80
/* 02191C 8002491C 38800000 */  li        r4, 0x0
/* 021920 80024920 38A00004 */  li        r5, 0x4
/* 021924 80024924 48085649 */  bl        GXBegin
/* 021928 80024928 C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 02192C 8002492C 3D40CC01 */  lis       r10, 0xcc01
/* 021930 80024930 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 021934 80024934 C0428168 */  lfs       f2, D_8018C0A8@sda21(r0)
/* 021938 80024938 D06A8000 */  stfs      f3, -0x8000(r10)
/* 02193C 8002493C 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 021940 80024940 C0228138 */  lfs       f1, D_8018C078@sda21(r0)
/* 021944 80024944 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021948 80024948 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 02194C 8002494C 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 021950 80024950 C002816C */  lfs       f0, D_8018C0AC@sda21(r0)
/* 021954 80024954 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021958 80024958 39200000 */  li        r9, 0x0
/* 02195C 8002495C D06A8000 */  stfs      f3, -0x8000(r10)
/* 021960 80024960 3CFF0004 */  addis     r7, r31, 0x4
/* 021964 80024964 3900FFFF */  li        r8, -0x1
/* 021968 80024968 D06A8000 */  stfs      f3, -0x8000(r10)
/* 02196C 8002496C 38C66998 */  addi      r6, r6, frameDrawLine_Setup@l
/* 021970 80024970 38A57568 */  addi      r5, r5, frameDrawTriangle_Setup@l
/* 021974 80024974 D04A8000 */  stfs      f2, -0x8000(r10)
/* 021978 80024978 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 02197C 8002497C 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 021980 80024980 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021984 80024984 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021988 80024988 D02A8000 */  stfs      f1, -0x8000(r10)
/* 02198C 8002498C D06A8000 */  stfs      f3, -0x8000(r10)
/* 021990 80024990 D04A8000 */  stfs      f2, -0x8000(r10)
/* 021994 80024994 D00A8000 */  stfs      f0, -0x8000(r10)
/* 021998 80024998 D06A8000 */  stfs      f3, -0x8000(r10)
/* 02199C 8002499C D02A8000 */  stfs      f1, -0x8000(r10)
/* 0219A0 800249A0 D02A8000 */  stfs      f1, -0x8000(r10)
/* 0219A4 800249A4 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0219A8 800249A8 D00A8000 */  stfs      f0, -0x8000(r10)
/* 0219AC 800249AC D06A8000 */  stfs      f3, -0x8000(r10)
/* 0219B0 800249B0 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0219B4 800249B4 D02A8000 */  stfs      f1, -0x8000(r10)
/* 0219B8 800249B8 913F008C */  stw       r9, 0x8c(r31)
/* 0219BC 800249BC 9107D138 */  stw       r8, -0x2ec8(r7)
/* 0219C0 800249C0 807F007C */  lwz       r3, 0x7c(r31)
/* 0219C4 800249C4 64630004 */  oris      r3, r3, 0x4
/* 0219C8 800249C8 60637F2D */  ori       r3, r3, 0x7f2d
/* 0219CC 800249CC 907F007C */  stw       r3, 0x7c(r31)
/* 0219D0 800249D0 90DF012C */  stw       r6, 0x12c(r31)
/* 0219D4 800249D4 90BF0130 */  stw       r5, 0x130(r31)
/* 0219D8 800249D8 909F0134 */  stw       r4, 0x134(r31)
/* 0219DC 800249DC 901F0138 */  stw       r0, 0x138(r31)
/* 0219E0 800249E0 8001007C */  lwz       r0, 0x7c(r1)
/* 0219E4 800249E4 83E10074 */  lwz       r31, 0x74(r1)
/* 0219E8 800249E8 83C10070 */  lwz       r30, 0x70(r1)
/* 0219EC 800249EC 7C0803A6 */  mtlr      r0
/* 0219F0 800249F0 83A1006C */  lwz       r29, 0x6c(r1)
/* 0219F4 800249F4 38210078 */  addi      r1, r1, 0x78
/* 0219F8 800249F8 4E800020 */  blr

glabel CopyAndConvertCFB
/* 0219FC 800249FC 7C0802A6 */  mflr      r0
/* 021A00 80024A00 90010004 */  stw       r0, 0x4(r1)
/* 021A04 80024A04 9421FFE0 */  stwu      r1, -0x20(r1)
/* 021A08 80024A08 93E1001C */  stw       r31, 0x1c(r1)
/* 021A0C 80024A0C 93C10018 */  stw       r30, 0x18(r1)
/* 021A10 80024A10 93A10014 */  stw       r29, 0x14(r1)
/* 021A14 80024A14 7C7D1B78 */  mr        r29, r3
/* 021A18 80024A18 38600000 */  li        r3, 0x0
/* 021A1C 80024A1C 38800000 */  li        r4, 0x0
/* 021A20 80024A20 38A00280 */  li        r5, 0x280
/* 021A24 80024A24 38C001E0 */  li        r6, 0x1e0
/* 021A28 80024A28 48085A05 */  bl        GXSetTexCopySrc
/* 021A2C 80024A2C 38600140 */  li        r3, 0x140
/* 021A30 80024A30 388000F0 */  li        r4, 0xf0
/* 021A34 80024A34 38A00005 */  li        r5, 0x5
/* 021A38 80024A38 38C00001 */  li        r6, 0x1
/* 021A3C 80024A3C 48085ABD */  bl        GXSetTexCopyDst
/* 021A40 80024A40 3C800002 */  lis       r4, 0x2
/* 021A44 80024A44 7FA3EB78 */  mr        r3, r29
/* 021A48 80024A48 38845800 */  addi      r4, r4, 0x5800
/* 021A4C 80024A4C 4807824D */  bl        DCInvalidateRange
/* 021A50 80024A50 7FA3EB78 */  mr        r3, r29
/* 021A54 80024A54 38800000 */  li        r4, 0x0
/* 021A58 80024A58 4808638D */  bl        GXCopyTex
/* 021A5C 80024A5C 38000000 */  li        r0, 0x0
/* 021A60 80024A60 900D89B4 */  stw       r0, D_8018B934@sda21(r0)
/* 021A64 80024A64 38607D00 */  li        r3, 0x7d00
/* 021A68 80024A68 48084F11 */  bl        GXSetDrawSync
/* 021A6C 80024A6C 48000004 */  b         lbl_80024A70
lbl_80024A70:
/* 021A70 80024A70 48000004 */  b         lbl_80024A74
lbl_80024A74:
/* 021A74 80024A74 800D89B4 */  lwz       r0, D_8018B934@sda21(r0)
/* 021A78 80024A78 2C000000 */  cmpwi     r0, 0x0
/* 021A7C 80024A7C 4182FFF8 */  beq       lbl_80024A74
/* 021A80 80024A80 3FDD0002 */  addis     r30, r29, 0x2
/* 021A84 80024A84 3BDE5800 */  addi      r30, r30, 0x5800
/* 021A88 80024A88 48000004 */  b         lbl_80024A8C
lbl_80024A8C:
/* 021A8C 80024A8C 3C608013 */  lis       r3, D_80130FC0@ha
/* 021A90 80024A90 3BE30FC0 */  addi      r31, r3, D_80130FC0@l
/* 021A94 80024A94 48000004 */  b         lbl_80024A98
lbl_80024A98:
/* 021A98 80024A98 48000284 */  b         lbl_80024D1C
lbl_80024A9C:
/* 021A9C 80024A9C 7FE3FB78 */  mr        r3, r31
/* 021AA0 80024AA0 7FA4EB78 */  mr        r4, r29
/* 021AA4 80024AA4 38A00A00 */  li        r5, 0xa00
/* 021AA8 80024AA8 4BFE1FA9 */  bl        xlHeapCopy
/* 021AAC 80024AAC 38E00000 */  li        r7, 0x0
/* 021AB0 80024AB0 38A00000 */  li        r5, 0x0
/* 021AB4 80024AB4 48000004 */  b         lbl_80024AB8
lbl_80024AB8:
/* 021AB8 80024AB8 48000004 */  b         lbl_80024ABC
lbl_80024ABC:
/* 021ABC 80024ABC 48000004 */  b         lbl_80024AC0
lbl_80024AC0:
/* 021AC0 80024AC0 7FE4FB78 */  mr        r4, r31
/* 021AC4 80024AC4 38C00000 */  li        r6, 0x0
/* 021AC8 80024AC8 48000004 */  b         lbl_80024ACC
lbl_80024ACC:
/* 021ACC 80024ACC 38000010 */  li        r0, 0x10
/* 021AD0 80024AD0 7C0903A6 */  mtctr     r0
/* 021AD4 80024AD4 48000004 */  b         lbl_80024AD8
lbl_80024AD8:
/* 021AD8 80024AD8 48000004 */  b         lbl_80024ADC
lbl_80024ADC:
/* 021ADC 80024ADC 7C642A14 */  add       r3, r4, r5
/* 021AE0 80024AE0 48000004 */  b         lbl_80024AE4
lbl_80024AE4:
/* 021AE4 80024AE4 48000004 */  b         lbl_80024AE8
lbl_80024AE8:
/* 021AE8 80024AE8 A0030000 */  lhz       r0, 0x0(r3)
/* 021AEC 80024AEC 38630002 */  addi      r3, r3, 0x2
/* 021AF0 80024AF0 5400083C */  slwi      r0, r0, 1
/* 021AF4 80024AF4 60000001 */  ori       r0, r0, 0x1
/* 021AF8 80024AF8 B01D0000 */  sth       r0, 0x0(r29)
/* 021AFC 80024AFC 3BBD0002 */  addi      r29, r29, 0x2
/* 021B00 80024B00 A0030000 */  lhz       r0, 0x0(r3)
/* 021B04 80024B04 38630002 */  addi      r3, r3, 0x2
/* 021B08 80024B08 5400083C */  slwi      r0, r0, 1
/* 021B0C 80024B0C 60000001 */  ori       r0, r0, 0x1
/* 021B10 80024B10 B01D0000 */  sth       r0, 0x0(r29)
/* 021B14 80024B14 3BBD0002 */  addi      r29, r29, 0x2
/* 021B18 80024B18 A0030000 */  lhz       r0, 0x0(r3)
/* 021B1C 80024B1C 38630002 */  addi      r3, r3, 0x2
/* 021B20 80024B20 5400083C */  slwi      r0, r0, 1
/* 021B24 80024B24 60000001 */  ori       r0, r0, 0x1
/* 021B28 80024B28 B01D0000 */  sth       r0, 0x0(r29)
/* 021B2C 80024B2C 3BBD0002 */  addi      r29, r29, 0x2
/* 021B30 80024B30 A0030000 */  lhz       r0, 0x0(r3)
/* 021B34 80024B34 5400083C */  slwi      r0, r0, 1
/* 021B38 80024B38 60000001 */  ori       r0, r0, 0x1
/* 021B3C 80024B3C B01D0000 */  sth       r0, 0x0(r29)
/* 021B40 80024B40 3BBD0002 */  addi      r29, r29, 0x2
/* 021B44 80024B44 38840020 */  addi      r4, r4, 0x20
/* 021B48 80024B48 7C642A14 */  add       r3, r4, r5
/* 021B4C 80024B4C 48000004 */  b         lbl_80024B50
lbl_80024B50:
/* 021B50 80024B50 48000004 */  b         lbl_80024B54
lbl_80024B54:
/* 021B54 80024B54 A0030000 */  lhz       r0, 0x0(r3)
/* 021B58 80024B58 38630002 */  addi      r3, r3, 0x2
/* 021B5C 80024B5C 5400083C */  slwi      r0, r0, 1
/* 021B60 80024B60 60000001 */  ori       r0, r0, 0x1
/* 021B64 80024B64 B01D0000 */  sth       r0, 0x0(r29)
/* 021B68 80024B68 3BBD0002 */  addi      r29, r29, 0x2
/* 021B6C 80024B6C A0030000 */  lhz       r0, 0x0(r3)
/* 021B70 80024B70 38630002 */  addi      r3, r3, 0x2
/* 021B74 80024B74 5400083C */  slwi      r0, r0, 1
/* 021B78 80024B78 60000001 */  ori       r0, r0, 0x1
/* 021B7C 80024B7C B01D0000 */  sth       r0, 0x0(r29)
/* 021B80 80024B80 3BBD0002 */  addi      r29, r29, 0x2
/* 021B84 80024B84 A0030000 */  lhz       r0, 0x0(r3)
/* 021B88 80024B88 38630002 */  addi      r3, r3, 0x2
/* 021B8C 80024B8C 5400083C */  slwi      r0, r0, 1
/* 021B90 80024B90 60000001 */  ori       r0, r0, 0x1
/* 021B94 80024B94 B01D0000 */  sth       r0, 0x0(r29)
/* 021B98 80024B98 3BBD0002 */  addi      r29, r29, 0x2
/* 021B9C 80024B9C A0030000 */  lhz       r0, 0x0(r3)
/* 021BA0 80024BA0 5400083C */  slwi      r0, r0, 1
/* 021BA4 80024BA4 60000001 */  ori       r0, r0, 0x1
/* 021BA8 80024BA8 B01D0000 */  sth       r0, 0x0(r29)
/* 021BAC 80024BAC 3BBD0002 */  addi      r29, r29, 0x2
/* 021BB0 80024BB0 38840020 */  addi      r4, r4, 0x20
/* 021BB4 80024BB4 38C60001 */  addi      r6, r6, 0x1
/* 021BB8 80024BB8 7C642A14 */  add       r3, r4, r5
/* 021BBC 80024BBC 48000004 */  b         lbl_80024BC0
lbl_80024BC0:
/* 021BC0 80024BC0 48000004 */  b         lbl_80024BC4
lbl_80024BC4:
/* 021BC4 80024BC4 A0030000 */  lhz       r0, 0x0(r3)
/* 021BC8 80024BC8 38630002 */  addi      r3, r3, 0x2
/* 021BCC 80024BCC 5400083C */  slwi      r0, r0, 1
/* 021BD0 80024BD0 60000001 */  ori       r0, r0, 0x1
/* 021BD4 80024BD4 B01D0000 */  sth       r0, 0x0(r29)
/* 021BD8 80024BD8 3BBD0002 */  addi      r29, r29, 0x2
/* 021BDC 80024BDC A0030000 */  lhz       r0, 0x0(r3)
/* 021BE0 80024BE0 38630002 */  addi      r3, r3, 0x2
/* 021BE4 80024BE4 5400083C */  slwi      r0, r0, 1
/* 021BE8 80024BE8 60000001 */  ori       r0, r0, 0x1
/* 021BEC 80024BEC B01D0000 */  sth       r0, 0x0(r29)
/* 021BF0 80024BF0 3BBD0002 */  addi      r29, r29, 0x2
/* 021BF4 80024BF4 A0030000 */  lhz       r0, 0x0(r3)
/* 021BF8 80024BF8 38630002 */  addi      r3, r3, 0x2
/* 021BFC 80024BFC 5400083C */  slwi      r0, r0, 1
/* 021C00 80024C00 60000001 */  ori       r0, r0, 0x1
/* 021C04 80024C04 B01D0000 */  sth       r0, 0x0(r29)
/* 021C08 80024C08 3BBD0002 */  addi      r29, r29, 0x2
/* 021C0C 80024C0C A0030000 */  lhz       r0, 0x0(r3)
/* 021C10 80024C10 5400083C */  slwi      r0, r0, 1
/* 021C14 80024C14 60000001 */  ori       r0, r0, 0x1
/* 021C18 80024C18 B01D0000 */  sth       r0, 0x0(r29)
/* 021C1C 80024C1C 3BBD0002 */  addi      r29, r29, 0x2
/* 021C20 80024C20 38840020 */  addi      r4, r4, 0x20
/* 021C24 80024C24 38C60001 */  addi      r6, r6, 0x1
/* 021C28 80024C28 7C642A14 */  add       r3, r4, r5
/* 021C2C 80024C2C 48000004 */  b         lbl_80024C30
lbl_80024C30:
/* 021C30 80024C30 48000004 */  b         lbl_80024C34
lbl_80024C34:
/* 021C34 80024C34 A0030000 */  lhz       r0, 0x0(r3)
/* 021C38 80024C38 38630002 */  addi      r3, r3, 0x2
/* 021C3C 80024C3C 5400083C */  slwi      r0, r0, 1
/* 021C40 80024C40 60000001 */  ori       r0, r0, 0x1
/* 021C44 80024C44 B01D0000 */  sth       r0, 0x0(r29)
/* 021C48 80024C48 3BBD0002 */  addi      r29, r29, 0x2
/* 021C4C 80024C4C A0030000 */  lhz       r0, 0x0(r3)
/* 021C50 80024C50 38630002 */  addi      r3, r3, 0x2
/* 021C54 80024C54 5400083C */  slwi      r0, r0, 1
/* 021C58 80024C58 60000001 */  ori       r0, r0, 0x1
/* 021C5C 80024C5C B01D0000 */  sth       r0, 0x0(r29)
/* 021C60 80024C60 3BBD0002 */  addi      r29, r29, 0x2
/* 021C64 80024C64 A0030000 */  lhz       r0, 0x0(r3)
/* 021C68 80024C68 38630002 */  addi      r3, r3, 0x2
/* 021C6C 80024C6C 5400083C */  slwi      r0, r0, 1
/* 021C70 80024C70 60000001 */  ori       r0, r0, 0x1
/* 021C74 80024C74 B01D0000 */  sth       r0, 0x0(r29)
/* 021C78 80024C78 3BBD0002 */  addi      r29, r29, 0x2
/* 021C7C 80024C7C A0030000 */  lhz       r0, 0x0(r3)
/* 021C80 80024C80 5400083C */  slwi      r0, r0, 1
/* 021C84 80024C84 60000001 */  ori       r0, r0, 0x1
/* 021C88 80024C88 B01D0000 */  sth       r0, 0x0(r29)
/* 021C8C 80024C8C 3BBD0002 */  addi      r29, r29, 0x2
/* 021C90 80024C90 38840020 */  addi      r4, r4, 0x20
/* 021C94 80024C94 38C60001 */  addi      r6, r6, 0x1
/* 021C98 80024C98 7C642A14 */  add       r3, r4, r5
/* 021C9C 80024C9C 48000004 */  b         lbl_80024CA0
lbl_80024CA0:
/* 021CA0 80024CA0 48000004 */  b         lbl_80024CA4
lbl_80024CA4:
/* 021CA4 80024CA4 A0030000 */  lhz       r0, 0x0(r3)
/* 021CA8 80024CA8 38630002 */  addi      r3, r3, 0x2
/* 021CAC 80024CAC 5400083C */  slwi      r0, r0, 1
/* 021CB0 80024CB0 60000001 */  ori       r0, r0, 0x1
/* 021CB4 80024CB4 B01D0000 */  sth       r0, 0x0(r29)
/* 021CB8 80024CB8 3BBD0002 */  addi      r29, r29, 0x2
/* 021CBC 80024CBC A0030000 */  lhz       r0, 0x0(r3)
/* 021CC0 80024CC0 38630002 */  addi      r3, r3, 0x2
/* 021CC4 80024CC4 5400083C */  slwi      r0, r0, 1
/* 021CC8 80024CC8 60000001 */  ori       r0, r0, 0x1
/* 021CCC 80024CCC B01D0000 */  sth       r0, 0x0(r29)
/* 021CD0 80024CD0 3BBD0002 */  addi      r29, r29, 0x2
/* 021CD4 80024CD4 A0030000 */  lhz       r0, 0x0(r3)
/* 021CD8 80024CD8 38630002 */  addi      r3, r3, 0x2
/* 021CDC 80024CDC 5400083C */  slwi      r0, r0, 1
/* 021CE0 80024CE0 60000001 */  ori       r0, r0, 0x1
/* 021CE4 80024CE4 B01D0000 */  sth       r0, 0x0(r29)
/* 021CE8 80024CE8 3BBD0002 */  addi      r29, r29, 0x2
/* 021CEC 80024CEC A0030000 */  lhz       r0, 0x0(r3)
/* 021CF0 80024CF0 5400083C */  slwi      r0, r0, 1
/* 021CF4 80024CF4 60000001 */  ori       r0, r0, 0x1
/* 021CF8 80024CF8 B01D0000 */  sth       r0, 0x0(r29)
/* 021CFC 80024CFC 3BBD0002 */  addi      r29, r29, 0x2
/* 021D00 80024D00 38840020 */  addi      r4, r4, 0x20
/* 021D04 80024D04 38C60001 */  addi      r6, r6, 0x1
/* 021D08 80024D08 4200FDD4 */  bdnz      lbl_80024ADC
/* 021D0C 80024D0C 38A50008 */  addi      r5, r5, 0x8
/* 021D10 80024D10 38E70001 */  addi      r7, r7, 0x1
/* 021D14 80024D14 2C070004 */  cmpwi     r7, 0x4
/* 021D18 80024D18 4180FDA8 */  blt       lbl_80024AC0
lbl_80024D1C:
/* 021D1C 80024D1C 7C1DF040 */  cmplw     r29, r30
/* 021D20 80024D20 4180FD7C */  blt       lbl_80024A9C
/* 021D24 80024D24 80010024 */  lwz       r0, 0x24(r1)
/* 021D28 80024D28 83E1001C */  lwz       r31, 0x1c(r1)
/* 021D2C 80024D2C 83C10018 */  lwz       r30, 0x18(r1)
/* 021D30 80024D30 7C0803A6 */  mtlr      r0
/* 021D34 80024D34 83A10014 */  lwz       r29, 0x14(r1)
/* 021D38 80024D38 38210020 */  addi      r1, r1, 0x20
/* 021D3C 80024D3C 4E800020 */  blr

glabel ZeldaDrawFrame
/* 021D40 80024D40 7C0802A6 */  mflr      r0
/* 021D44 80024D44 90010004 */  stw       r0, 0x4(r1)
/* 021D48 80024D48 9421FF88 */  stwu      r1, -0x78(r1)
/* 021D4C 80024D4C 93E10074 */  stw       r31, 0x74(r1)
/* 021D50 80024D50 93C10070 */  stw       r30, 0x70(r1)
/* 021D54 80024D54 93A1006C */  stw       r29, 0x6c(r1)
/* 021D58 80024D58 7C7F1B78 */  mr        r31, r3
/* 021D5C 80024D5C 7C9D2378 */  mr        r29, r4
/* 021D60 80024D60 380000FF */  li        r0, 0xff
/* 021D64 80024D64 98010014 */  stb       r0, 0x14(r1)
/* 021D68 80024D68 3C808011 */  lis       r4, D_80109900@ha
/* 021D6C 80024D6C 7FE3FB78 */  mr        r3, r31
/* 021D70 80024D70 98010015 */  stb       r0, 0x15(r1)
/* 021D74 80024D74 3BC49900 */  addi      r30, r4, D_80109900@l
/* 021D78 80024D78 98010016 */  stb       r0, 0x16(r1)
/* 021D7C 80024D7C 881F004C */  lbz       r0, 0x4c(r31)
/* 021D80 80024D80 98010017 */  stb       r0, 0x17(r1)
/* 021D84 80024D84 480051E1 */  bl        frameDrawSetup2D
/* 021D88 80024D88 38600001 */  li        r3, 0x1
/* 021D8C 80024D8C 48087E79 */  bl        GXSetNumTevStages
/* 021D90 80024D90 38600000 */  li        r3, 0x0
/* 021D94 80024D94 480863ED */  bl        GXSetNumChans
/* 021D98 80024D98 38600001 */  li        r3, 0x1
/* 021D9C 80024D9C 48084A21 */  bl        GXSetNumTexGens
/* 021DA0 80024DA0 80010014 */  lwz       r0, 0x14(r1)
/* 021DA4 80024DA4 38810010 */  addi      r4, r1, 0x10
/* 021DA8 80024DA8 38600001 */  li        r3, 0x1
/* 021DAC 80024DAC 90010010 */  stw       r0, 0x10(r1)
/* 021DB0 80024DB0 48087885 */  bl        GXSetTevColor
/* 021DB4 80024DB4 38600000 */  li        r3, 0x0
/* 021DB8 80024DB8 38800000 */  li        r4, 0x0
/* 021DBC 80024DBC 38A00000 */  li        r5, 0x0
/* 021DC0 80024DC0 38C00000 */  li        r6, 0x0
/* 021DC4 80024DC4 38E00000 */  li        r7, 0x0
/* 021DC8 80024DC8 39000000 */  li        r8, 0x0
/* 021DCC 80024DCC 48087799 */  bl        GXSetTevColorOp
/* 021DD0 80024DD0 38600000 */  li        r3, 0x0
/* 021DD4 80024DD4 38800000 */  li        r4, 0x0
/* 021DD8 80024DD8 38A00000 */  li        r5, 0x0
/* 021DDC 80024DDC 38C00000 */  li        r6, 0x0
/* 021DE0 80024DE0 38E00000 */  li        r7, 0x0
/* 021DE4 80024DE4 39000000 */  li        r8, 0x0
/* 021DE8 80024DE8 480877E5 */  bl        GXSetTevAlphaOp
/* 021DEC 80024DEC 38600000 */  li        r3, 0x0
/* 021DF0 80024DF0 3880000F */  li        r4, 0xf
/* 021DF4 80024DF4 38A00008 */  li        r5, 0x8
/* 021DF8 80024DF8 38C00002 */  li        r6, 0x2
/* 021DFC 80024DFC 38E0000F */  li        r7, 0xf
/* 021E00 80024E00 480876DD */  bl        GXSetTevColorIn
/* 021E04 80024E04 38600000 */  li        r3, 0x0
/* 021E08 80024E08 38800007 */  li        r4, 0x7
/* 021E0C 80024E0C 38A00007 */  li        r5, 0x7
/* 021E10 80024E10 38C00007 */  li        r6, 0x7
/* 021E14 80024E14 38E00001 */  li        r7, 0x1
/* 021E18 80024E18 48087709 */  bl        GXSetTevAlphaIn
/* 021E1C 80024E1C 38600000 */  li        r3, 0x0
/* 021E20 80024E20 38800000 */  li        r4, 0x0
/* 021E24 80024E24 38A00000 */  li        r5, 0x0
/* 021E28 80024E28 38C000FF */  li        r6, 0xff
/* 021E2C 80024E2C 48087C01 */  bl        GXSetTevOrder
/* 021E30 80024E30 38600001 */  li        r3, 0x1
/* 021E34 80024E34 38800004 */  li        r4, 0x4
/* 021E38 80024E38 38A00005 */  li        r5, 0x5
/* 021E3C 80024E3C 38C00005 */  li        r6, 0x5
/* 021E40 80024E40 4808826D */  bl        fn_800AD0AC
/* 021E44 80024E44 38600007 */  li        r3, 0x7
/* 021E48 80024E48 38800000 */  li        r4, 0x0
/* 021E4C 80024E4C 38A00000 */  li        r5, 0x0
/* 021E50 80024E50 38C00007 */  li        r6, 0x7
/* 021E54 80024E54 38E00000 */  li        r7, 0x0
/* 021E58 80024E58 48087AFD */  bl        GXSetAlphaCompare
/* 021E5C 80024E5C 38600000 */  li        r3, 0x0
/* 021E60 80024E60 38800003 */  li        r4, 0x3
/* 021E64 80024E64 38A00000 */  li        r5, 0x0
/* 021E68 80024E68 480882F1 */  bl        GXSetZMode
/* 021E6C 80024E6C 38600001 */  li        r3, 0x1
/* 021E70 80024E70 4808831D */  bl        fn_800AD18C
/* 021E74 80024E74 38610038 */  addi      r3, r1, 0x38
/* 021E78 80024E78 48081A35 */  bl        PSMTXIdentity
/* 021E7C 80024E7C 38610038 */  addi      r3, r1, 0x38
/* 021E80 80024E80 3880001E */  li        r4, 0x1e
/* 021E84 80024E84 38A00001 */  li        r5, 0x1
/* 021E88 80024E88 48088799 */  bl        fn_800AD620
/* 021E8C 80024E8C 3C7E0002 */  addis     r3, r30, 0x2
/* 021E90 80024E90 7FA4EB78 */  mr        r4, r29
/* 021E94 80024E94 386358A0 */  addi      r3, r3, 0x58a0
/* 021E98 80024E98 38A00140 */  li        r5, 0x140
/* 021E9C 80024E9C 38C000F0 */  li        r6, 0xf0
/* 021EA0 80024EA0 38E00004 */  li        r7, 0x4
/* 021EA4 80024EA4 39000000 */  li        r8, 0x0
/* 021EA8 80024EA8 39200000 */  li        r9, 0x0
/* 021EAC 80024EAC 39400000 */  li        r10, 0x0
/* 021EB0 80024EB0 480864A9 */  bl        GXInitTexObj
/* 021EB4 80024EB4 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 021EB8 80024EB8 3C7E0002 */  addis     r3, r30, 0x2
/* 021EBC 80024EBC 386358A0 */  addi      r3, r3, 0x58a0
/* 021EC0 80024EC0 FC400890 */  fmr       f2, f1
/* 021EC4 80024EC4 38800000 */  li        r4, 0x0
/* 021EC8 80024EC8 FC600890 */  fmr       f3, f1
/* 021ECC 80024ECC 38A00000 */  li        r5, 0x0
/* 021ED0 80024ED0 38C00000 */  li        r6, 0x0
/* 021ED4 80024ED4 38E00000 */  li        r7, 0x0
/* 021ED8 80024ED8 39000000 */  li        r8, 0x0
/* 021EDC 80024EDC 48086739 */  bl        fn_800AB614
/* 021EE0 80024EE0 3C7E0002 */  addis     r3, r30, 0x2
/* 021EE4 80024EE4 386358A0 */  addi      r3, r3, 0x58a0
/* 021EE8 80024EE8 38800000 */  li        r4, 0x0
/* 021EEC 80024EEC 48086A69 */  bl        GXLoadTexObj
/* 021EF0 80024EF0 48083DBD */  bl        GXClearVtxDesc
/* 021EF4 80024EF4 38600009 */  li        r3, 0x9
/* 021EF8 80024EF8 38800001 */  li        r4, 0x1
/* 021EFC 80024EFC 480838E9 */  bl        GXSetVtxDesc
/* 021F00 80024F00 3860000D */  li        r3, 0xd
/* 021F04 80024F04 38800001 */  li        r4, 0x1
/* 021F08 80024F08 480838DD */  bl        GXSetVtxDesc
/* 021F0C 80024F0C 38600000 */  li        r3, 0x0
/* 021F10 80024F10 38800009 */  li        r4, 0x9
/* 021F14 80024F14 38A00001 */  li        r5, 0x1
/* 021F18 80024F18 38C00004 */  li        r6, 0x4
/* 021F1C 80024F1C 38E00000 */  li        r7, 0x0
/* 021F20 80024F20 48083DC5 */  bl        GXSetVtxAttrFmt
/* 021F24 80024F24 38600000 */  li        r3, 0x0
/* 021F28 80024F28 3880000D */  li        r4, 0xd
/* 021F2C 80024F2C 38A00001 */  li        r5, 0x1
/* 021F30 80024F30 38C00004 */  li        r6, 0x4
/* 021F34 80024F34 38E00000 */  li        r7, 0x0
/* 021F38 80024F38 48083DAD */  bl        GXSetVtxAttrFmt
/* 021F3C 80024F3C 38600080 */  li        r3, 0x80
/* 021F40 80024F40 38800000 */  li        r4, 0x0
/* 021F44 80024F44 38A00004 */  li        r5, 0x4
/* 021F48 80024F48 48085025 */  bl        GXBegin
/* 021F4C 80024F4C C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 021F50 80024F50 3D40CC01 */  lis       r10, 0xcc01
/* 021F54 80024F54 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 021F58 80024F58 C0428168 */  lfs       f2, D_8018C0A8@sda21(r0)
/* 021F5C 80024F5C D06A8000 */  stfs      f3, -0x8000(r10)
/* 021F60 80024F60 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 021F64 80024F64 C0228138 */  lfs       f1, D_8018C078@sda21(r0)
/* 021F68 80024F68 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021F6C 80024F6C 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 021F70 80024F70 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 021F74 80024F74 C002816C */  lfs       f0, D_8018C0AC@sda21(r0)
/* 021F78 80024F78 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021F7C 80024F7C 39200000 */  li        r9, 0x0
/* 021F80 80024F80 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021F84 80024F84 3CFF0004 */  addis     r7, r31, 0x4
/* 021F88 80024F88 3900FFFF */  li        r8, -0x1
/* 021F8C 80024F8C D06A8000 */  stfs      f3, -0x8000(r10)
/* 021F90 80024F90 38C66998 */  addi      r6, r6, frameDrawLine_Setup@l
/* 021F94 80024F94 38A57568 */  addi      r5, r5, frameDrawTriangle_Setup@l
/* 021F98 80024F98 D04A8000 */  stfs      f2, -0x8000(r10)
/* 021F9C 80024F9C 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 021FA0 80024FA0 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 021FA4 80024FA4 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FA8 80024FA8 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FAC 80024FAC D02A8000 */  stfs      f1, -0x8000(r10)
/* 021FB0 80024FB0 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FB4 80024FB4 D04A8000 */  stfs      f2, -0x8000(r10)
/* 021FB8 80024FB8 D00A8000 */  stfs      f0, -0x8000(r10)
/* 021FBC 80024FBC D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FC0 80024FC0 D02A8000 */  stfs      f1, -0x8000(r10)
/* 021FC4 80024FC4 D02A8000 */  stfs      f1, -0x8000(r10)
/* 021FC8 80024FC8 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FCC 80024FCC D00A8000 */  stfs      f0, -0x8000(r10)
/* 021FD0 80024FD0 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FD4 80024FD4 D06A8000 */  stfs      f3, -0x8000(r10)
/* 021FD8 80024FD8 D02A8000 */  stfs      f1, -0x8000(r10)
/* 021FDC 80024FDC 913F008C */  stw       r9, 0x8c(r31)
/* 021FE0 80024FE0 9107D138 */  stw       r8, -0x2ec8(r7)
/* 021FE4 80024FE4 807F007C */  lwz       r3, 0x7c(r31)
/* 021FE8 80024FE8 64630004 */  oris      r3, r3, 0x4
/* 021FEC 80024FEC 60637F2D */  ori       r3, r3, 0x7f2d
/* 021FF0 80024FF0 907F007C */  stw       r3, 0x7c(r31)
/* 021FF4 80024FF4 90DF012C */  stw       r6, 0x12c(r31)
/* 021FF8 80024FF8 90BF0130 */  stw       r5, 0x130(r31)
/* 021FFC 80024FFC 909F0134 */  stw       r4, 0x134(r31)
/* 022000 80025000 901F0138 */  stw       r0, 0x138(r31)
/* 022004 80025004 8001007C */  lwz       r0, 0x7c(r1)
/* 022008 80025008 83E10074 */  lwz       r31, 0x74(r1)
/* 02200C 8002500C 83C10070 */  lwz       r30, 0x70(r1)
/* 022010 80025010 7C0803A6 */  mtlr      r0
/* 022014 80025014 83A1006C */  lwz       r29, 0x6c(r1)
/* 022018 80025018 38210078 */  addi      r1, r1, 0x78
/* 02201C 8002501C 4E800020 */  blr

glabel ZeldaDrawFrameBlur
/* 022020 80025020 7C0802A6 */  mflr      r0
/* 022024 80025024 90010004 */  stw       r0, 0x4(r1)
/* 022028 80025028 9421FF88 */  stwu      r1, -0x78(r1)
/* 02202C 8002502C 93E10074 */  stw       r31, 0x74(r1)
/* 022030 80025030 93C10070 */  stw       r30, 0x70(r1)
/* 022034 80025034 93A1006C */  stw       r29, 0x6c(r1)
/* 022038 80025038 7C7F1B78 */  mr        r31, r3
/* 02203C 8002503C 7C9D2378 */  mr        r29, r4
/* 022040 80025040 380000FF */  li        r0, 0xff
/* 022044 80025044 98010014 */  stb       r0, 0x14(r1)
/* 022048 80025048 3C808011 */  lis       r4, D_80109900@ha
/* 02204C 8002504C 7FE3FB78 */  mr        r3, r31
/* 022050 80025050 98010015 */  stb       r0, 0x15(r1)
/* 022054 80025054 3BC49900 */  addi      r30, r4, D_80109900@l
/* 022058 80025058 98010016 */  stb       r0, 0x16(r1)
/* 02205C 8002505C 881F004C */  lbz       r0, 0x4c(r31)
/* 022060 80025060 98010017 */  stb       r0, 0x17(r1)
/* 022064 80025064 48004F01 */  bl        frameDrawSetup2D
/* 022068 80025068 38600001 */  li        r3, 0x1
/* 02206C 8002506C 48087B99 */  bl        GXSetNumTevStages
/* 022070 80025070 38600000 */  li        r3, 0x0
/* 022074 80025074 4808610D */  bl        GXSetNumChans
/* 022078 80025078 38600001 */  li        r3, 0x1
/* 02207C 8002507C 48084741 */  bl        GXSetNumTexGens
/* 022080 80025080 80010014 */  lwz       r0, 0x14(r1)
/* 022084 80025084 38810010 */  addi      r4, r1, 0x10
/* 022088 80025088 38600001 */  li        r3, 0x1
/* 02208C 8002508C 90010010 */  stw       r0, 0x10(r1)
/* 022090 80025090 480875A5 */  bl        GXSetTevColor
/* 022094 80025094 38600000 */  li        r3, 0x0
/* 022098 80025098 38800000 */  li        r4, 0x0
/* 02209C 8002509C 38A00000 */  li        r5, 0x0
/* 0220A0 800250A0 38C00000 */  li        r6, 0x0
/* 0220A4 800250A4 38E00000 */  li        r7, 0x0
/* 0220A8 800250A8 39000000 */  li        r8, 0x0
/* 0220AC 800250AC 480874B9 */  bl        GXSetTevColorOp
/* 0220B0 800250B0 38600000 */  li        r3, 0x0
/* 0220B4 800250B4 38800000 */  li        r4, 0x0
/* 0220B8 800250B8 38A00000 */  li        r5, 0x0
/* 0220BC 800250BC 38C00000 */  li        r6, 0x0
/* 0220C0 800250C0 38E00000 */  li        r7, 0x0
/* 0220C4 800250C4 39000000 */  li        r8, 0x0
/* 0220C8 800250C8 48087505 */  bl        GXSetTevAlphaOp
/* 0220CC 800250CC 38600000 */  li        r3, 0x0
/* 0220D0 800250D0 3880000F */  li        r4, 0xf
/* 0220D4 800250D4 38A00008 */  li        r5, 0x8
/* 0220D8 800250D8 38C00002 */  li        r6, 0x2
/* 0220DC 800250DC 38E0000F */  li        r7, 0xf
/* 0220E0 800250E0 480873FD */  bl        GXSetTevColorIn
/* 0220E4 800250E4 38600000 */  li        r3, 0x0
/* 0220E8 800250E8 38800007 */  li        r4, 0x7
/* 0220EC 800250EC 38A00007 */  li        r5, 0x7
/* 0220F0 800250F0 38C00007 */  li        r6, 0x7
/* 0220F4 800250F4 38E00001 */  li        r7, 0x1
/* 0220F8 800250F8 48087429 */  bl        GXSetTevAlphaIn
/* 0220FC 800250FC 38600000 */  li        r3, 0x0
/* 022100 80025100 38800000 */  li        r4, 0x0
/* 022104 80025104 38A00000 */  li        r5, 0x0
/* 022108 80025108 38C000FF */  li        r6, 0xff
/* 02210C 8002510C 48087921 */  bl        GXSetTevOrder
/* 022110 80025110 38600001 */  li        r3, 0x1
/* 022114 80025114 38800004 */  li        r4, 0x4
/* 022118 80025118 38A00005 */  li        r5, 0x5
/* 02211C 8002511C 38C00005 */  li        r6, 0x5
/* 022120 80025120 48087F8D */  bl        fn_800AD0AC
/* 022124 80025124 38600007 */  li        r3, 0x7
/* 022128 80025128 38800000 */  li        r4, 0x0
/* 02212C 8002512C 38A00000 */  li        r5, 0x0
/* 022130 80025130 38C00007 */  li        r6, 0x7
/* 022134 80025134 38E00000 */  li        r7, 0x0
/* 022138 80025138 4808781D */  bl        GXSetAlphaCompare
/* 02213C 8002513C 38600000 */  li        r3, 0x0
/* 022140 80025140 38800003 */  li        r4, 0x3
/* 022144 80025144 38A00000 */  li        r5, 0x0
/* 022148 80025148 48088011 */  bl        GXSetZMode
/* 02214C 8002514C 38600001 */  li        r3, 0x1
/* 022150 80025150 4808803D */  bl        fn_800AD18C
/* 022154 80025154 38610038 */  addi      r3, r1, 0x38
/* 022158 80025158 48081755 */  bl        PSMTXIdentity
/* 02215C 8002515C 38610038 */  addi      r3, r1, 0x38
/* 022160 80025160 3880001E */  li        r4, 0x1e
/* 022164 80025164 38A00001 */  li        r5, 0x1
/* 022168 80025168 480884B9 */  bl        fn_800AD620
/* 02216C 8002516C 3C7E0002 */  addis     r3, r30, 0x2
/* 022170 80025170 7FA4EB78 */  mr        r4, r29
/* 022174 80025174 38635880 */  addi      r3, r3, 0x5880
/* 022178 80025178 38A00140 */  li        r5, 0x140
/* 02217C 8002517C 38C000F0 */  li        r6, 0xf0
/* 022180 80025180 38E00004 */  li        r7, 0x4
/* 022184 80025184 39000000 */  li        r8, 0x0
/* 022188 80025188 39200000 */  li        r9, 0x0
/* 02218C 8002518C 39400000 */  li        r10, 0x0
/* 022190 80025190 480861C9 */  bl        GXInitTexObj
/* 022194 80025194 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 022198 80025198 3C7E0002 */  addis     r3, r30, 0x2
/* 02219C 8002519C 38635880 */  addi      r3, r3, 0x5880
/* 0221A0 800251A0 FC400890 */  fmr       f2, f1
/* 0221A4 800251A4 38800000 */  li        r4, 0x0
/* 0221A8 800251A8 FC600890 */  fmr       f3, f1
/* 0221AC 800251AC 38A00000 */  li        r5, 0x0
/* 0221B0 800251B0 38C00000 */  li        r6, 0x0
/* 0221B4 800251B4 38E00000 */  li        r7, 0x0
/* 0221B8 800251B8 39000000 */  li        r8, 0x0
/* 0221BC 800251BC 48086459 */  bl        fn_800AB614
/* 0221C0 800251C0 3C7E0002 */  addis     r3, r30, 0x2
/* 0221C4 800251C4 38635880 */  addi      r3, r3, 0x5880
/* 0221C8 800251C8 38800000 */  li        r4, 0x0
/* 0221CC 800251CC 48086789 */  bl        GXLoadTexObj
/* 0221D0 800251D0 48083ADD */  bl        GXClearVtxDesc
/* 0221D4 800251D4 38600009 */  li        r3, 0x9
/* 0221D8 800251D8 38800001 */  li        r4, 0x1
/* 0221DC 800251DC 48083609 */  bl        GXSetVtxDesc
/* 0221E0 800251E0 3860000D */  li        r3, 0xd
/* 0221E4 800251E4 38800001 */  li        r4, 0x1
/* 0221E8 800251E8 480835FD */  bl        GXSetVtxDesc
/* 0221EC 800251EC 38600000 */  li        r3, 0x0
/* 0221F0 800251F0 38800009 */  li        r4, 0x9
/* 0221F4 800251F4 38A00001 */  li        r5, 0x1
/* 0221F8 800251F8 38C00004 */  li        r6, 0x4
/* 0221FC 800251FC 38E00000 */  li        r7, 0x0
/* 022200 80025200 48083AE5 */  bl        GXSetVtxAttrFmt
/* 022204 80025204 38600000 */  li        r3, 0x0
/* 022208 80025208 3880000D */  li        r4, 0xd
/* 02220C 8002520C 38A00001 */  li        r5, 0x1
/* 022210 80025210 38C00004 */  li        r6, 0x4
/* 022214 80025214 38E00000 */  li        r7, 0x0
/* 022218 80025218 48083ACD */  bl        GXSetVtxAttrFmt
/* 02221C 8002521C 38600080 */  li        r3, 0x80
/* 022220 80025220 38800000 */  li        r4, 0x0
/* 022224 80025224 38A00004 */  li        r5, 0x4
/* 022228 80025228 48084D45 */  bl        GXBegin
/* 02222C 8002522C C08281A4 */  lfs       f4, D_8018C0E4@sda21(r0)
/* 022230 80025230 3D40CC01 */  lis       r10, 0xcc01
/* 022234 80025234 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 022238 80025238 C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 02223C 8002523C D08A8000 */  stfs      f4, -0x8000(r10)
/* 022240 80025240 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 022244 80025244 C04281A8 */  lfs       f2, D_8018C0E8@sda21(r0)
/* 022248 80025248 D08A8000 */  stfs      f4, -0x8000(r10)
/* 02224C 8002524C 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 022250 80025250 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 022254 80025254 C0228138 */  lfs       f1, D_8018C078@sda21(r0)
/* 022258 80025258 D06A8000 */  stfs      f3, -0x8000(r10)
/* 02225C 8002525C C00281AC */  lfs       f0, D_8018C0EC@sda21(r0)
/* 022260 80025260 39200000 */  li        r9, 0x0
/* 022264 80025264 D06A8000 */  stfs      f3, -0x8000(r10)
/* 022268 80025268 3CFF0004 */  addis     r7, r31, 0x4
/* 02226C 8002526C 3900FFFF */  li        r8, -0x1
/* 022270 80025270 D06A8000 */  stfs      f3, -0x8000(r10)
/* 022274 80025274 38C66998 */  addi      r6, r6, frameDrawLine_Setup@l
/* 022278 80025278 38A57568 */  addi      r5, r5, frameDrawTriangle_Setup@l
/* 02227C 8002527C D04A8000 */  stfs      f2, -0x8000(r10)
/* 022280 80025280 38846654 */  addi      r4, r4, frameDrawRectFill_Setup@l
/* 022284 80025284 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 022288 80025288 D08A8000 */  stfs      f4, -0x8000(r10)
/* 02228C 8002528C D06A8000 */  stfs      f3, -0x8000(r10)
/* 022290 80025290 D02A8000 */  stfs      f1, -0x8000(r10)
/* 022294 80025294 D06A8000 */  stfs      f3, -0x8000(r10)
/* 022298 80025298 D04A8000 */  stfs      f2, -0x8000(r10)
/* 02229C 8002529C D00A8000 */  stfs      f0, -0x8000(r10)
/* 0222A0 800252A0 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0222A4 800252A4 D02A8000 */  stfs      f1, -0x8000(r10)
/* 0222A8 800252A8 D02A8000 */  stfs      f1, -0x8000(r10)
/* 0222AC 800252AC D08A8000 */  stfs      f4, -0x8000(r10)
/* 0222B0 800252B0 D00A8000 */  stfs      f0, -0x8000(r10)
/* 0222B4 800252B4 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0222B8 800252B8 D06A8000 */  stfs      f3, -0x8000(r10)
/* 0222BC 800252BC D02A8000 */  stfs      f1, -0x8000(r10)
/* 0222C0 800252C0 913F008C */  stw       r9, 0x8c(r31)
/* 0222C4 800252C4 9107D138 */  stw       r8, -0x2ec8(r7)
/* 0222C8 800252C8 807F007C */  lwz       r3, 0x7c(r31)
/* 0222CC 800252CC 64630004 */  oris      r3, r3, 0x4
/* 0222D0 800252D0 60637F2D */  ori       r3, r3, 0x7f2d
/* 0222D4 800252D4 907F007C */  stw       r3, 0x7c(r31)
/* 0222D8 800252D8 90DF012C */  stw       r6, 0x12c(r31)
/* 0222DC 800252DC 90BF0130 */  stw       r5, 0x130(r31)
/* 0222E0 800252E0 909F0134 */  stw       r4, 0x134(r31)
/* 0222E4 800252E4 901F0138 */  stw       r0, 0x138(r31)
/* 0222E8 800252E8 8001007C */  lwz       r0, 0x7c(r1)
/* 0222EC 800252EC 83E10074 */  lwz       r31, 0x74(r1)
/* 0222F0 800252F0 83C10070 */  lwz       r30, 0x70(r1)
/* 0222F4 800252F4 7C0803A6 */  mtlr      r0
/* 0222F8 800252F8 83A1006C */  lwz       r29, 0x6c(r1)
/* 0222FC 800252FC 38210078 */  addi      r1, r1, 0x78
/* 022300 80025300 4E800020 */  blr

glabel ZeldaDrawFrameNoBlend
/* 022304 80025304 7C0802A6 */  mflr      r0
/* 022308 80025308 90010004 */  stw       r0, 0x4(r1)
/* 02230C 8002530C 9421FF98 */  stwu      r1, -0x68(r1)
/* 022310 80025310 93E10064 */  stw       r31, 0x64(r1)
/* 022314 80025314 93C10060 */  stw       r30, 0x60(r1)
/* 022318 80025318 7C9E2378 */  mr        r30, r4
/* 02231C 8002531C 3C808011 */  lis       r4, D_80109900@ha
/* 022320 80025320 3BE49900 */  addi      r31, r4, D_80109900@l
/* 022324 80025324 48004C41 */  bl        frameDrawSetup2D
/* 022328 80025328 38600001 */  li        r3, 0x1
/* 02232C 8002532C 480878D9 */  bl        GXSetNumTevStages
/* 022330 80025330 38600000 */  li        r3, 0x0
/* 022334 80025334 48085E4D */  bl        GXSetNumChans
/* 022338 80025338 38600001 */  li        r3, 0x1
/* 02233C 8002533C 48084481 */  bl        GXSetNumTexGens
/* 022340 80025340 38600000 */  li        r3, 0x0
/* 022344 80025344 38800003 */  li        r4, 0x3
/* 022348 80025348 48087109 */  bl        GXSetTevOp
/* 02234C 8002534C 38600000 */  li        r3, 0x0
/* 022350 80025350 38800000 */  li        r4, 0x0
/* 022354 80025354 38A00000 */  li        r5, 0x0
/* 022358 80025358 38C000FF */  li        r6, 0xff
/* 02235C 8002535C 480876D1 */  bl        GXSetTevOrder
/* 022360 80025360 38600000 */  li        r3, 0x0
/* 022364 80025364 38800004 */  li        r4, 0x4
/* 022368 80025368 38A00005 */  li        r5, 0x5
/* 02236C 8002536C 38C00005 */  li        r6, 0x5
/* 022370 80025370 48087D3D */  bl        fn_800AD0AC
/* 022374 80025374 38600007 */  li        r3, 0x7
/* 022378 80025378 38800000 */  li        r4, 0x0
/* 02237C 8002537C 38A00000 */  li        r5, 0x0
/* 022380 80025380 38C00007 */  li        r6, 0x7
/* 022384 80025384 38E00000 */  li        r7, 0x0
/* 022388 80025388 480875CD */  bl        GXSetAlphaCompare
/* 02238C 8002538C 38600000 */  li        r3, 0x0
/* 022390 80025390 38800003 */  li        r4, 0x3
/* 022394 80025394 38A00000 */  li        r5, 0x0
/* 022398 80025398 48087DC1 */  bl        GXSetZMode
/* 02239C 8002539C 38600001 */  li        r3, 0x1
/* 0223A0 800253A0 48087DED */  bl        fn_800AD18C
/* 0223A4 800253A4 38610030 */  addi      r3, r1, 0x30
/* 0223A8 800253A8 48081505 */  bl        PSMTXIdentity
/* 0223AC 800253AC 38610030 */  addi      r3, r1, 0x30
/* 0223B0 800253B0 3880001E */  li        r4, 0x1e
/* 0223B4 800253B4 38A00001 */  li        r5, 0x1
/* 0223B8 800253B8 48088269 */  bl        fn_800AD620
/* 0223BC 800253BC 3C7F0002 */  addis     r3, r31, 0x2
/* 0223C0 800253C0 7FC4F378 */  mr        r4, r30
/* 0223C4 800253C4 38635860 */  addi      r3, r3, 0x5860
/* 0223C8 800253C8 38A00140 */  li        r5, 0x140
/* 0223CC 800253CC 38C000F0 */  li        r6, 0xf0
/* 0223D0 800253D0 38E00004 */  li        r7, 0x4
/* 0223D4 800253D4 39000000 */  li        r8, 0x0
/* 0223D8 800253D8 39200000 */  li        r9, 0x0
/* 0223DC 800253DC 39400000 */  li        r10, 0x0
/* 0223E0 800253E0 48085F79 */  bl        GXInitTexObj
/* 0223E4 800253E4 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 0223E8 800253E8 3C7F0002 */  addis     r3, r31, 0x2
/* 0223EC 800253EC 38635860 */  addi      r3, r3, 0x5860
/* 0223F0 800253F0 FC400890 */  fmr       f2, f1
/* 0223F4 800253F4 38800000 */  li        r4, 0x0
/* 0223F8 800253F8 FC600890 */  fmr       f3, f1
/* 0223FC 800253FC 38A00000 */  li        r5, 0x0
/* 022400 80025400 38C00000 */  li        r6, 0x0
/* 022404 80025404 38E00000 */  li        r7, 0x0
/* 022408 80025408 39000000 */  li        r8, 0x0
/* 02240C 8002540C 48086209 */  bl        fn_800AB614
/* 022410 80025410 3C7F0002 */  addis     r3, r31, 0x2
/* 022414 80025414 38635860 */  addi      r3, r3, 0x5860
/* 022418 80025418 38800000 */  li        r4, 0x0
/* 02241C 8002541C 48086539 */  bl        GXLoadTexObj
/* 022420 80025420 4808388D */  bl        GXClearVtxDesc
/* 022424 80025424 38600009 */  li        r3, 0x9
/* 022428 80025428 38800001 */  li        r4, 0x1
/* 02242C 8002542C 480833B9 */  bl        GXSetVtxDesc
/* 022430 80025430 3860000D */  li        r3, 0xd
/* 022434 80025434 38800001 */  li        r4, 0x1
/* 022438 80025438 480833AD */  bl        GXSetVtxDesc
/* 02243C 8002543C 38600000 */  li        r3, 0x0
/* 022440 80025440 38800009 */  li        r4, 0x9
/* 022444 80025444 38A00001 */  li        r5, 0x1
/* 022448 80025448 38C00004 */  li        r6, 0x4
/* 02244C 8002544C 38E00000 */  li        r7, 0x0
/* 022450 80025450 48083895 */  bl        GXSetVtxAttrFmt
/* 022454 80025454 38600000 */  li        r3, 0x0
/* 022458 80025458 3880000D */  li        r4, 0xd
/* 02245C 8002545C 38A00001 */  li        r5, 0x1
/* 022460 80025460 38C00004 */  li        r6, 0x4
/* 022464 80025464 38E00000 */  li        r7, 0x0
/* 022468 80025468 4808387D */  bl        GXSetVtxAttrFmt
/* 02246C 8002546C 38600080 */  li        r3, 0x80
/* 022470 80025470 38800000 */  li        r4, 0x0
/* 022474 80025474 38A00004 */  li        r5, 0x4
/* 022478 80025478 48084AF5 */  bl        GXBegin
/* 02247C 8002547C C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 022480 80025480 3C60CC01 */  lis       r3, 0xcc01
/* 022484 80025484 C0428168 */  lfs       f2, D_8018C0A8@sda21(r0)
/* 022488 80025488 D0638000 */  stfs      f3, -0x8000(r3)
/* 02248C 8002548C C0228138 */  lfs       f1, D_8018C078@sda21(r0)
/* 022490 80025490 D0638000 */  stfs      f3, -0x8000(r3)
/* 022494 80025494 C002816C */  lfs       f0, D_8018C0AC@sda21(r0)
/* 022498 80025498 D0638000 */  stfs      f3, -0x8000(r3)
/* 02249C 8002549C D0638000 */  stfs      f3, -0x8000(r3)
/* 0224A0 800254A0 D0638000 */  stfs      f3, -0x8000(r3)
/* 0224A4 800254A4 D0438000 */  stfs      f2, -0x8000(r3)
/* 0224A8 800254A8 D0638000 */  stfs      f3, -0x8000(r3)
/* 0224AC 800254AC D0638000 */  stfs      f3, -0x8000(r3)
/* 0224B0 800254B0 D0238000 */  stfs      f1, -0x8000(r3)
/* 0224B4 800254B4 D0638000 */  stfs      f3, -0x8000(r3)
/* 0224B8 800254B8 D0438000 */  stfs      f2, -0x8000(r3)
/* 0224BC 800254BC D0038000 */  stfs      f0, -0x8000(r3)
/* 0224C0 800254C0 D0638000 */  stfs      f3, -0x8000(r3)
/* 0224C4 800254C4 D0238000 */  stfs      f1, -0x8000(r3)
/* 0224C8 800254C8 D0238000 */  stfs      f1, -0x8000(r3)
/* 0224CC 800254CC D0638000 */  stfs      f3, -0x8000(r3)
/* 0224D0 800254D0 D0038000 */  stfs      f0, -0x8000(r3)
/* 0224D4 800254D4 D0638000 */  stfs      f3, -0x8000(r3)
/* 0224D8 800254D8 D0638000 */  stfs      f3, -0x8000(r3)
/* 0224DC 800254DC D0238000 */  stfs      f1, -0x8000(r3)
/* 0224E0 800254E0 8001006C */  lwz       r0, 0x6c(r1)
/* 0224E4 800254E4 83E10064 */  lwz       r31, 0x64(r1)
/* 0224E8 800254E8 83C10060 */  lwz       r30, 0x60(r1)
/* 0224EC 800254EC 7C0803A6 */  mtlr      r0
/* 0224F0 800254F0 38210068 */  addi      r1, r1, 0x68
/* 0224F4 800254F4 4E800020 */  blr

glabel _frameDrawRectangle
/* 0224F8 800254F8 800D8D48 */  lwz       r0, DemoCurrentBuffer@sda21(r0)
/* 0224FC 800254FC 3D230004 */  addis     r9, r3, 0x4
/* 022500 80025500 814D8D50 */  lwz       r10, DemoFrameBuffer1@sda21(r0)
/* 022504 80025504 38A50001 */  addi      r5, r5, 0x1
/* 022508 80025508 38670001 */  addi      r3, r7, 0x1
/* 02250C 8002550C 7C005040 */  cmplw     r0, r10
/* 022510 80025510 8129C4BC */  lwz       r9, -0x3b44(r9)
/* 022514 80025514 54AB003C */  clrrwi    r11, r5, 1
/* 022518 80025518 5467003C */  clrrwi    r7, r3, 1
/* 02251C 8002551C 40820020 */  bne       lbl_8002553C
/* 022520 80025520 7C0649D6 */  mullw     r0, r6, r9
/* 022524 80025524 80AD8D4C */  lwz       r5, DemoFrameBuffer2@sda21(r0)
/* 022528 80025528 5403083C */  slwi      r3, r0, 1
/* 02252C 8002552C 5560083C */  slwi      r0, r11, 1
/* 022530 80025530 7C630214 */  add       r3, r3, r0
/* 022534 80025534 7C651A14 */  add       r3, r5, r3
/* 022538 80025538 48000018 */  b         lbl_80025550
lbl_8002553C:
/* 02253C 8002553C 7C0649D6 */  mullw     r0, r6, r9
/* 022540 80025540 5403083C */  slwi      r3, r0, 1
/* 022544 80025544 5560083C */  slwi      r0, r11, 1
/* 022548 80025548 7C630214 */  add       r3, r3, r0
/* 02254C 8002554C 7C6A1A14 */  add       r3, r10, r3
lbl_80025550:
/* 022550 80025550 7CE70E70 */  srawi     r7, r7, 1
/* 022554 80025554 7D200E70 */  srawi     r0, r9, 1
/* 022558 80025558 3D234000 */  addis     r9, r3, 0x4000
/* 02255C 8002555C 38A7FFF8 */  subi      r5, r7, 0x8
/* 022560 80025560 5406103A */  slwi      r6, r0, 2
/* 022564 80025564 39400000 */  li        r10, 0x0
/* 022568 80025568 48000004 */  b         lbl_8002556C
lbl_8002556C:
/* 02256C 8002556C 48000004 */  b         lbl_80025570
lbl_80025570:
/* 022570 80025570 48000090 */  b         lbl_80025600
lbl_80025574:
/* 022574 80025574 2C070000 */  cmpwi     r7, 0x0
/* 022578 80025578 39600000 */  li        r11, 0x0
/* 02257C 8002557C 4081007C */  ble       lbl_800255F8
/* 022580 80025580 2C070008 */  cmpwi     r7, 0x8
/* 022584 80025584 4081008C */  ble       lbl_80025610
/* 022588 80025588 7D234B78 */  mr        r3, r9
/* 02258C 8002558C 48000004 */  b         lbl_80025590
lbl_80025590:
/* 022590 80025590 38050007 */  addi      r0, r5, 0x7
/* 022594 80025594 5400E8FE */  srwi      r0, r0, 3
/* 022598 80025598 2C050000 */  cmpwi     r5, 0x0
/* 02259C 8002559C 7C0903A6 */  mtctr     r0
/* 0225A0 800255A0 40810034 */  ble       lbl_800255D4
/* 0225A4 800255A4 48000004 */  b         lbl_800255A8
lbl_800255A8:
/* 0225A8 800255A8 90830000 */  stw       r4, 0x0(r3)
/* 0225AC 800255AC 396B0008 */  addi      r11, r11, 0x8
/* 0225B0 800255B0 90830004 */  stw       r4, 0x4(r3)
/* 0225B4 800255B4 90830008 */  stw       r4, 0x8(r3)
/* 0225B8 800255B8 9083000C */  stw       r4, 0xc(r3)
/* 0225BC 800255BC 90830010 */  stw       r4, 0x10(r3)
/* 0225C0 800255C0 90830014 */  stw       r4, 0x14(r3)
/* 0225C4 800255C4 90830018 */  stw       r4, 0x18(r3)
/* 0225C8 800255C8 9083001C */  stw       r4, 0x1c(r3)
/* 0225CC 800255CC 38630020 */  addi      r3, r3, 0x20
/* 0225D0 800255D0 4200FFD8 */  bdnz      lbl_800255A8
lbl_800255D4:
/* 0225D4 800255D4 4800003C */  b         lbl_80025610
lbl_800255D8:
/* 0225D8 800255D8 7C0B3850 */  subf      r0, r11, r7
/* 0225DC 800255DC 7C0B3800 */  cmpw      r11, r7
/* 0225E0 800255E0 7C0903A6 */  mtctr     r0
/* 0225E4 800255E4 40800014 */  bge       lbl_800255F8
/* 0225E8 800255E8 48000004 */  b         lbl_800255EC
lbl_800255EC:
/* 0225EC 800255EC 90830000 */  stw       r4, 0x0(r3)
/* 0225F0 800255F0 38630004 */  addi      r3, r3, 0x4
/* 0225F4 800255F4 4200FFF8 */  bdnz      lbl_800255EC
lbl_800255F8:
/* 0225F8 800255F8 7D293214 */  add       r9, r9, r6
/* 0225FC 800255FC 394A0001 */  addi      r10, r10, 0x1
lbl_80025600:
/* 022600 80025600 7C0A4000 */  cmpw      r10, r8
/* 022604 80025604 4180FF70 */  blt       lbl_80025574
/* 022608 80025608 38600001 */  li        r3, 0x1
/* 02260C 8002560C 48000010 */  b         lbl_8002561C
lbl_80025610:
/* 022610 80025610 5560103A */  slwi      r0, r11, 2
/* 022614 80025614 7C690214 */  add       r3, r9, r0
/* 022618 80025618 4BFFFFC0 */  b         lbl_800255D8
lbl_8002561C:
/* 02261C 8002561C 4E800020 */  blr

glabel frameEnd
/* 022620 80025620 7C0802A6 */  mflr      r0
/* 022624 80025624 90010004 */  stw       r0, 0x4(r1)
/* 022628 80025628 9421FFE0 */  stwu      r1, -0x20(r1)
/* 02262C 8002562C 93E1001C */  stw       r31, 0x1c(r1)
/* 022630 80025630 93C10018 */  stw       r30, 0x18(r1)
/* 022634 80025634 93A10014 */  stw       r29, 0x14(r1)
/* 022638 80025638 7C7E1B78 */  mr        r30, r3
/* 02263C 8002563C 800D899C */  lwz       r0, -0x7664(r13)
/* 022640 80025640 806D8914 */  lwz       r3, -0x76ec(r13)
/* 022644 80025644 2C000000 */  cmpwi     r0, 0x0
/* 022648 80025648 83E30024 */  lwz       r31, 0x24(r3)
/* 02264C 8002564C 41820014 */  beq       lbl_80025660
/* 022650 80025650 3C60800F */  lis       r3, 0x800f
/* 022654 80025654 4CC63182 */  crclr     cr1eq
/* 022658 80025658 3863C670 */  subi      r3, r3, 0x3990
/* 02265C 8002565C 480784E9 */  bl        OSReport
lbl_80025660:
/* 022660 80025660 38000001 */  li        r0, 0x1
/* 022664 80025664 900D899C */  stw       r0, -0x7664(r13)
/* 022668 80025668 7FC6F378 */  mr        r6, r30
/* 02266C 8002566C 38E00000 */  li        r7, 0x0
/* 022670 80025670 48000004 */  b         lbl_80025674
lbl_80025674:
/* 022674 80025674 3C7E0004 */  addis     r3, r30, 0x4
/* 022678 80025678 48000004 */  b         lbl_8002567C
lbl_8002567C:
/* 02267C 8002567C 48000024 */  b         lbl_800256A0
lbl_80025680:
/* 022680 80025680 3CA60004 */  addis     r5, r6, 0x4
/* 022684 80025684 8085C820 */  lwz       r4, -0x37e0(r5)
/* 022688 80025688 2C040000 */  cmpwi     r4, 0x0
/* 02268C 8002568C 4180000C */  blt       lbl_80025698
/* 022690 80025690 3804FFFF */  subi      r0, r4, 0x1
/* 022694 80025694 9005C820 */  stw       r0, -0x37e0(r5)
lbl_80025698:
/* 022698 80025698 38C60024 */  addi      r6, r6, 0x24
/* 02269C 8002569C 38E70001 */  addi      r7, r7, 0x1
lbl_800256A0:
/* 0226A0 800256A0 8003C4C8 */  lwz       r0, -0x3b38(r3)
/* 0226A4 800256A4 7C070000 */  cmpw      r7, r0
/* 0226A8 800256A8 4180FFD8 */  blt       lbl_80025680
/* 0226AC 800256AC 807E0088 */  lwz       r3, 0x88(r30)
/* 0226B0 800256B0 38000001 */  li        r0, 0x1
/* 0226B4 800256B4 38630001 */  addi      r3, r3, 0x1
/* 0226B8 800256B8 907E0088 */  stw       r3, 0x88(r30)
/* 0226BC 800256BC 900D8998 */  stw       r0, -0x7668(r13)
/* 0226C0 800256C0 801E00D8 */  lwz       r0, 0xd8(r30)
/* 0226C4 800256C4 2C000000 */  cmpwi     r0, 0x0
/* 0226C8 800256C8 41820054 */  beq       lbl_8002571C
/* 0226CC 800256CC 3C608011 */  lis       r3, 0x8011
/* 0226D0 800256D0 38039920 */  subi      r0, r3, 0x66e0
/* 0226D4 800256D4 7C1D0378 */  mr        r29, r0
/* 0226D8 800256D8 38600000 */  li        r3, 0x0
/* 0226DC 800256DC 38800000 */  li        r4, 0x0
/* 0226E0 800256E0 38A00280 */  li        r5, 0x280
/* 0226E4 800256E4 38C001E0 */  li        r6, 0x1e0
/* 0226E8 800256E8 48084D45 */  bl        GXSetTexCopySrc
/* 0226EC 800256EC 38600140 */  li        r3, 0x140
/* 0226F0 800256F0 388000F0 */  li        r4, 0xf0
/* 0226F4 800256F4 38A00013 */  li        r5, 0x13
/* 0226F8 800256F8 38C00001 */  li        r6, 0x1
/* 0226FC 800256FC 48084DFD */  bl        GXSetTexCopyDst
/* 022700 80025700 7FA3EB78 */  mr        r3, r29
/* 022704 80025704 38800000 */  li        r4, 0x0
/* 022708 80025708 480856DD */  bl        GXCopyTex
/* 02270C 8002570C 3C800002 */  lis       r4, 0x2
/* 022710 80025710 7FA3EB78 */  mr        r3, r29
/* 022714 80025714 38845800 */  addi      r4, r4, 0x5800
/* 022718 80025718 48077581 */  bl        DCInvalidateRange
lbl_8002571C:
/* 02271C 8002571C 806D8914 */  lwz       r3, -0x76ec(r13)
/* 022720 80025720 80030020 */  lwz       r0, 0x20(r3)
/* 022724 80025724 2C00000B */  cmpwi     r0, 0xb
/* 022728 80025728 40820088 */  bne       lbl_800257B0
/* 02272C 8002572C 801E0074 */  lwz       r0, 0x74(r30)
/* 022730 80025730 2C000000 */  cmpwi     r0, 0x0
/* 022734 80025734 4182007C */  beq       lbl_800257B0
/* 022738 80025738 38600000 */  li        r3, 0x0
/* 02273C 8002573C 38800000 */  li        r4, 0x0
/* 022740 80025740 38A00280 */  li        r5, 0x280
/* 022744 80025744 38C001E0 */  li        r6, 0x1e0
/* 022748 80025748 48084CE5 */  bl        GXSetTexCopySrc
/* 02274C 8002574C 38600140 */  li        r3, 0x140
/* 022750 80025750 388000F0 */  li        r4, 0xf0
/* 022754 80025754 38A00004 */  li        r5, 0x4
/* 022758 80025758 38C00001 */  li        r6, 0x1
/* 02275C 8002575C 48084D9D */  bl        GXSetTexCopyDst
/* 022760 80025760 3C608016 */  lis       r3, 0x8016
/* 022764 80025764 3BA317B0 */  addi      r29, r3, 0x17b0
/* 022768 80025768 3C800002 */  lis       r4, 0x2
/* 02276C 8002576C 7FA3EB78 */  mr        r3, r29
/* 022770 80025770 38845800 */  addi      r4, r4, 0x5800
/* 022774 80025774 48077525 */  bl        DCInvalidateRange
/* 022778 80025778 7FA3EB78 */  mr        r3, r29
/* 02277C 8002577C 38800000 */  li        r4, 0x0
/* 022780 80025780 48085665 */  bl        GXCopyTex
/* 022784 80025784 38000000 */  li        r0, 0x0
/* 022788 80025788 900D89B4 */  stw       r0, -0x764c(r13)
/* 02278C 8002578C 38607D00 */  li        r3, 0x7d00
/* 022790 80025790 480841E9 */  bl        GXSetDrawSync
/* 022794 80025794 48000004 */  b         lbl_80025798
lbl_80025798:
/* 022798 80025798 48000004 */  b         lbl_8002579C
lbl_8002579C:
/* 02279C 8002579C 800D89B4 */  lwz       r0, -0x764c(r13)
/* 0227A0 800257A0 2C000000 */  cmpwi     r0, 0x0
/* 0227A4 800257A4 4182FFF8 */  beq       lbl_8002579C
/* 0227A8 800257A8 38000000 */  li        r0, 0x0
/* 0227AC 800257AC 901E0074 */  stw       r0, 0x74(r30)
lbl_800257B0:
/* 0227B0 800257B0 38600001 */  li        r3, 0x1
/* 0227B4 800257B4 38800003 */  li        r4, 0x3
/* 0227B8 800257B8 38A00001 */  li        r5, 0x1
/* 0227BC 800257BC 4808799D */  bl        GXSetZMode
/* 0227C0 800257C0 38600001 */  li        r3, 0x1
/* 0227C4 800257C4 4808793D */  bl        fn_800AD100
/* 0227C8 800257C8 806D8D48 */  lwz       r3, -0x72b8(r13)
/* 0227CC 800257CC 38800001 */  li        r4, 0x1
/* 0227D0 800257D0 480854B9 */  bl        GXCopyDisp
/* 0227D4 800257D4 48084269 */  bl        fn_800A9A3C
/* 0227D8 800257D8 48084091 */  bl        fn_800A9868
/* 0227DC 800257DC 806D8914 */  lwz       r3, -0x76ec(r13)
/* 0227E0 800257E0 80030020 */  lwz       r0, 0x20(r3)
/* 0227E4 800257E4 2C000005 */  cmpwi     r0, 0x5
/* 0227E8 800257E8 40820078 */  bne       lbl_80025860
/* 0227EC 800257EC 38E00000 */  li        r7, 0x0
/* 0227F0 800257F0 90FE002C */  stw       r7, 0x2c(r30)
/* 0227F4 800257F4 38600000 */  li        r3, 0x0
/* 0227F8 800257F8 38800016 */  li        r4, 0x16
/* 0227FC 800257FC 80DE0030 */  lwz       r6, 0x30(r30)
/* 022800 80025800 38A00000 */  li        r5, 0x0
/* 022804 80025804 38060001 */  addi      r0, r6, 0x1
/* 022808 80025808 901E0030 */  stw       r0, 0x30(r30)
/* 02280C 8002580C 90FE0050 */  stw       r7, 0x50(r30)
/* 022810 80025810 90FE0054 */  stw       r7, 0x54(r30)
/* 022814 80025814 90FE0048 */  stw       r7, 0x48(r30)
/* 022818 80025818 90FE0058 */  stw       r7, 0x58(r30)
/* 02281C 8002581C 90FE005C */  stw       r7, 0x5c(r30)
/* 022820 80025820 801E0060 */  lwz       r0, 0x60(r30)
/* 022824 80025824 901E0064 */  stw       r0, 0x64(r30)
/* 022828 80025828 90FE0060 */  stw       r7, 0x60(r30)
/* 02282C 8002582C 90FE0068 */  stw       r7, 0x68(r30)
/* 022830 80025830 48087179 */  bl        GXSetZTexture
/* 022834 80025834 807E0040 */  lwz       r3, 0x40(r30)
/* 022838 80025838 5460073E */  clrlwi    r0, r3, 28
/* 02283C 8002583C 2C000000 */  cmpwi     r0, 0x0
/* 022840 80025840 4082000C */  bne       lbl_8002584C
/* 022844 80025844 5460001E */  clrrwi    r0, r3, 16
/* 022848 80025848 901E0040 */  stw       r0, 0x40(r30)
lbl_8002584C:
/* 02284C 8002584C 807E0040 */  lwz       r3, 0x40(r30)
/* 022850 80025850 38000000 */  li        r0, 0x0
/* 022854 80025854 5463002E */  clrrwi    r3, r3, 8
/* 022858 80025858 907E0040 */  stw       r3, 0x40(r30)
/* 02285C 8002585C 901E0044 */  stw       r0, 0x44(r30)
lbl_80025860:
/* 022860 80025860 806D8914 */  lwz       r3, -0x76ec(r13)
/* 022864 80025864 80030020 */  lwz       r0, 0x20(r3)
/* 022868 80025868 2C00000B */  cmpwi     r0, 0xb
/* 02286C 8002586C 4082000C */  bne       lbl_80025878
/* 022870 80025870 38000000 */  li        r0, 0x0
/* 022874 80025874 901E0070 */  stw       r0, 0x70(r30)
lbl_80025878:
/* 022878 80025878 3C7F0001 */  addis     r3, r31, 0x1
/* 02287C 8002587C 808312A0 */  lwz       r4, 0x12a0(r3)
/* 022880 80025880 38000000 */  li        r0, 0x0
/* 022884 80025884 38600001 */  li        r3, 0x1
/* 022888 80025888 90040074 */  stw       r0, 0x74(r4)
/* 02288C 8002588C 80010024 */  lwz       r0, 0x24(r1)
/* 022890 80025890 83E1001C */  lwz       r31, 0x1c(r1)
/* 022894 80025894 83C10018 */  lwz       r30, 0x18(r1)
/* 022898 80025898 7C0803A6 */  mtlr      r0
/* 02289C 8002589C 83A10014 */  lwz       r29, 0x14(r1)
/* 0228A0 800258A0 38210020 */  addi      r1, r1, 0x20
/* 0228A4 800258A4 4E800020 */  blr

glabel frameBegin
/* 0228A8 800258A8 7C0802A6 */  mflr      r0
/* 0228AC 800258AC 90010004 */  stw       r0, 0x4(r1)
/* 0228B0 800258B0 9421FFA8 */  stwu      r1, -0x58(r1)
/* 0228B4 800258B4 93E10054 */  stw       r31, 0x54(r1)
/* 0228B8 800258B8 93C10050 */  stw       r30, 0x50(r1)
/* 0228BC 800258BC 93A1004C */  stw       r29, 0x4c(r1)
/* 0228C0 800258C0 93810048 */  stw       r28, 0x48(r1)
/* 0228C4 800258C4 7C7F1B78 */  mr        r31, r3
/* 0228C8 800258C8 7C9C2378 */  mr        r28, r4
/* 0228CC 800258CC 800D899C */  lwz       r0, D_8018B91C@sda21(r0)
/* 0228D0 800258D0 3C60800F */  lis       r3, D_800EBCF0@ha
/* 0228D4 800258D4 3BC3BCF0 */  addi      r30, r3, D_800EBCF0@l
/* 0228D8 800258D8 2C000000 */  cmpwi     r0, 0x0
/* 0228DC 800258DC 41820148 */  beq       lbl_80025A24
/* 0228E0 800258E0 38000000 */  li        r0, 0x0
/* 0228E4 800258E4 900D899C */  stw       r0, D_8018B91C@sda21(r0)
/* 0228E8 800258E8 48000004 */  b         lbl_800258EC
lbl_800258EC:
/* 0228EC 800258EC 48000004 */  b         lbl_800258F0
lbl_800258F0:
/* 0228F0 800258F0 48000010 */  b         lbl_80025900
lbl_800258F4:
/* 0228F4 800258F4 387E09C0 */  addi      r3, r30, 0x9c0
/* 0228F8 800258F8 4CC63182 */  crclr     cr1eq
/* 0228FC 800258FC 48078249 */  bl        OSReport
lbl_80025900:
/* 022900 80025900 800D8998 */  lwz       r0, D_8018B918@sda21(r0)
/* 022904 80025904 2C000000 */  cmpwi     r0, 0x0
/* 022908 80025908 4082FFEC */  bne       lbl_800258F4
/* 02290C 8002590C 38600000 */  li        r3, 0x0
/* 022910 80025910 38800000 */  li        r4, 0x0
/* 022914 80025914 38A00001 */  li        r5, 0x1
/* 022918 80025918 4BFE3159 */  bl        simulatorTestReset
/* 02291C 8002591C 2C030000 */  cmpwi     r3, 0x0
/* 022920 80025920 4082000C */  bne       lbl_8002592C
/* 022924 80025924 38600000 */  li        r3, 0x0
/* 022928 80025928 480001E8 */  b         lbl_80025B10
lbl_8002592C:
/* 02292C 8002592C 7FE3FB78 */  mr        r3, r31
/* 022930 80025930 4BFFABE5 */  bl        frameUpdateCache
/* 022934 80025934 2C030000 */  cmpwi     r3, 0x0
/* 022938 80025938 4082000C */  bne       lbl_80025944
/* 02293C 8002593C 38600000 */  li        r3, 0x0
/* 022940 80025940 480001D0 */  b         lbl_80025B10
lbl_80025944:
/* 022944 80025944 4BFDFBBD */  bl        xlCoreBeforeRender
/* 022948 80025948 801F008C */  lwz       r0, 0x8c(r31)
/* 02294C 8002594C 38600001 */  li        r3, 0x1
/* 022950 80025950 38800008 */  li        r4, 0x8
/* 022954 80025954 54000354 */  rlwinm    r0, r0, 0, 13, 10
/* 022958 80025958 901F008C */  stw       r0, 0x8c(r31)
/* 02295C 8002595C 48083EA1 */  bl        GXSetMisc
/* 022960 80025960 38610014 */  addi      r3, r1, 0x14
/* 022964 80025964 48080F49 */  bl        PSMTXIdentity
/* 022968 80025968 38610014 */  addi      r3, r1, 0x14
/* 02296C 8002596C 38800000 */  li        r4, 0x0
/* 022970 80025970 48087BD9 */  bl        fn_800AD548
/* 022974 80025974 939F0354 */  stw       r28, 0x354(r31)
/* 022978 80025978 38600005 */  li        r3, 0x5
/* 02297C 8002597C 38800000 */  li        r4, 0x0
/* 022980 80025980 38A00000 */  li        r5, 0x0
/* 022984 80025984 38C00000 */  li        r6, 0x0
/* 022988 80025988 38E00000 */  li        r7, 0x0
/* 02298C 8002598C 39000000 */  li        r8, 0x0
/* 022990 80025990 39200002 */  li        r9, 0x2
/* 022994 80025994 48085831 */  bl        GXSetChanCtrl
/* 022998 80025998 38600004 */  li        r3, 0x4
/* 02299C 8002599C 38800000 */  li        r4, 0x0
/* 0229A0 800259A0 38A00001 */  li        r5, 0x1
/* 0229A4 800259A4 38C00001 */  li        r6, 0x1
/* 0229A8 800259A8 38E00000 */  li        r7, 0x0
/* 0229AC 800259AC 39000000 */  li        r8, 0x0
/* 0229B0 800259B0 39200002 */  li        r9, 0x2
/* 0229B4 800259B4 48085811 */  bl        GXSetChanCtrl
/* 0229B8 800259B8 3C608003 */  lis       r3, frameDrawSyncCallback@ha
/* 0229BC 800259BC 3863BFC8 */  addi      r3, r3, frameDrawSyncCallback@l
/* 0229C0 800259C0 480842F9 */  bl        fn_800A9CB8
/* 0229C4 800259C4 3BBE0060 */  addi      r29, r30, 0x60
/* 0229C8 800259C8 3BDE0080 */  addi      r30, r30, 0x80
/* 0229CC 800259CC 3B800000 */  li        r28, 0x0
/* 0229D0 800259D0 48000004 */  b         lbl_800259D4
lbl_800259D4:
/* 0229D4 800259D4 48000004 */  b         lbl_800259D8
lbl_800259D8:
/* 0229D8 800259D8 48000004 */  b         lbl_800259DC
lbl_800259DC:
/* 0229DC 800259DC 80DD0000 */  lwz       r6, 0x0(r29)
/* 0229E0 800259E0 38800001 */  li        r4, 0x1
/* 0229E4 800259E4 807E0000 */  lwz       r3, 0x0(r30)
/* 0229E8 800259E8 38A00004 */  li        r5, 0x4
/* 0229EC 800259EC 38E00000 */  li        r7, 0x0
/* 0229F0 800259F0 3900007D */  li        r8, 0x7d
/* 0229F4 800259F4 48083AF9 */  bl        fn_800A94EC
/* 0229F8 800259F8 3BBD0004 */  addi      r29, r29, 0x4
/* 0229FC 800259FC 3BDE0004 */  addi      r30, r30, 0x4
/* 022A00 80025A00 3B9C0001 */  addi      r28, r28, 0x1
/* 022A04 80025A04 2C1C0008 */  cmpwi     r28, 0x8
/* 022A08 80025A08 4180FFD4 */  blt       lbl_800259DC
/* 022A0C 80025A0C 3C9F0004 */  addis     r4, r31, 0x4
/* 022A10 80025A10 80A4C4BC */  lwz       r5, -0x3b44(r4)
/* 022A14 80025A14 38600000 */  li        r3, 0x0
/* 022A18 80025A18 80C4C4C4 */  lwz       r6, -0x3b3c(r4)
/* 022A1C 80025A1C 38800000 */  li        r4, 0x0
/* 022A20 80025A20 48087DDD */  bl        GXSetScissor
lbl_80025A24:
/* 022A24 80025A24 3C9F0004 */  addis     r4, r31, 0x4
/* 022A28 80025A28 38A00000 */  li        r5, 0x0
/* 022A2C 80025A2C 90A4C4CC */  stw       r5, -0x3b34(r4)
/* 022A30 80025A30 3800FFFF */  li        r0, -0x1
/* 022A34 80025A34 807F008C */  lwz       r3, 0x8c(r31)
/* 022A38 80025A38 74639C1F */  andis.    r3, r3, 0x9c1f
/* 022A3C 80025A3C 907F008C */  stw       r3, 0x8c(r31)
/* 022A40 80025A40 807F008C */  lwz       r3, 0x8c(r31)
/* 022A44 80025A44 54630184 */  rlwinm    r3, r3, 0, 6, 2
/* 022A48 80025A48 907F008C */  stw       r3, 0x8c(r31)
/* 022A4C 80025A4C 9004C4D0 */  stw       r0, -0x3b30(r4)
/* 022A50 80025A50 48000004 */  b         lbl_80025A54
lbl_80025A54:
/* 022A54 80025A54 48000004 */  b         lbl_80025A58
lbl_80025A58:
/* 022A58 80025A58 90BF0090 */  stw       r5, 0x90(r31)
/* 022A5C 80025A5C 38600008 */  li        r3, 0x8
/* 022A60 80025A60 90BF0094 */  stw       r5, 0x94(r31)
/* 022A64 80025A64 90BF0098 */  stw       r5, 0x98(r31)
/* 022A68 80025A68 90BF009C */  stw       r5, 0x9c(r31)
/* 022A6C 80025A6C 90BF00A0 */  stw       r5, 0xa0(r31)
/* 022A70 80025A70 90BF00A4 */  stw       r5, 0xa4(r31)
/* 022A74 80025A74 90BF00A8 */  stw       r5, 0xa8(r31)
/* 022A78 80025A78 90BF00AC */  stw       r5, 0xac(r31)
/* 022A7C 80025A7C 48000088 */  b         lbl_80025B04
lbl_80025A80:
/* 022A80 80025A80 2003000A */  subfic    r0, r3, 0xa
/* 022A84 80025A84 2C03000A */  cmpwi     r3, 0xa
/* 022A88 80025A88 7C0903A6 */  mtctr     r0
/* 022A8C 80025A8C 40800014 */  bge       lbl_80025AA0
/* 022A90 80025A90 48000004 */  b         lbl_80025A94
lbl_80025A94:
/* 022A94 80025A94 90A40090 */  stw       r5, 0x90(r4)
/* 022A98 80025A98 38840004 */  addi      r4, r4, 0x4
/* 022A9C 80025A9C 4200FFF8 */  bdnz      lbl_80025A94
lbl_80025AA0:
/* 022AA0 80025AA0 3900FFFF */  li        r8, -0x1
/* 022AA4 80025AA4 911F0120 */  stw       r8, 0x120(r31)
/* 022AA8 80025AA8 38000000 */  li        r0, 0x0
/* 022AAC 80025AAC 3CC08002 */  lis       r6, frameDrawLine_Setup@ha
/* 022AB0 80025AB0 901F013C */  stw       r0, 0x13c(r31)
/* 022AB4 80025AB4 3CA08002 */  lis       r5, frameDrawTriangle_Setup@ha
/* 022AB8 80025AB8 3C808002 */  lis       r4, frameDrawRectFill_Setup@ha
/* 022ABC 80025ABC 80FF007C */  lwz       r7, 0x7c(r31)
/* 022AC0 80025AC0 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 022AC4 80025AC4 38066998 */  addi      r0, r6, frameDrawLine_Setup@l
/* 022AC8 80025AC8 64E60004 */  oris      r6, r7, 0x4
/* 022ACC 80025ACC 60C67F2D */  ori       r6, r6, 0x7f2d
/* 022AD0 80025AD0 90DF007C */  stw       r6, 0x7c(r31)
/* 022AD4 80025AD4 38C57568 */  addi      r6, r5, frameDrawTriangle_Setup@l
/* 022AD8 80025AD8 38A46654 */  addi      r5, r4, frameDrawRectFill_Setup@l
/* 022ADC 80025ADC 901F012C */  stw       r0, 0x12c(r31)
/* 022AE0 80025AE0 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 022AE4 80025AE4 3C9F0004 */  addis     r4, r31, 0x4
/* 022AE8 80025AE8 90DF0130 */  stw       r6, 0x130(r31)
/* 022AEC 80025AEC 38600001 */  li        r3, 0x1
/* 022AF0 80025AF0 90BF0134 */  stw       r5, 0x134(r31)
/* 022AF4 80025AF4 901F0138 */  stw       r0, 0x138(r31)
/* 022AF8 80025AF8 9104D138 */  stw       r8, -0x2ec8(r4)
/* 022AFC 80025AFC 911F21F8 */  stw       r8, 0x21f8(r31)
/* 022B00 80025B00 48000010 */  b         lbl_80025B10
lbl_80025B04:
/* 022B04 80025B04 5460103A */  slwi      r0, r3, 2
/* 022B08 80025B08 7C9F0214 */  add       r4, r31, r0
/* 022B0C 80025B0C 4BFFFF74 */  b         lbl_80025A80
lbl_80025B10:
/* 022B10 80025B10 8001005C */  lwz       r0, 0x5c(r1)
/* 022B14 80025B14 83E10054 */  lwz       r31, 0x54(r1)
/* 022B18 80025B18 83C10050 */  lwz       r30, 0x50(r1)
/* 022B1C 80025B1C 7C0803A6 */  mtlr      r0
/* 022B20 80025B20 83A1004C */  lwz       r29, 0x4c(r1)
/* 022B24 80025B24 83810048 */  lwz       r28, 0x48(r1)
/* 022B28 80025B28 38210058 */  addi      r1, r1, 0x58
/* 022B2C 80025B2C 4E800020 */  blr

glabel frameBeginOK
/* 022B30 80025B30 800D8998 */  lwz       r0, D_8018B918@sda21(r0)
/* 022B34 80025B34 2C000000 */  cmpwi     r0, 0x0
/* 022B38 80025B38 4182000C */  beq       lbl_80025B44
/* 022B3C 80025B3C 38600000 */  li        r3, 0x0
/* 022B40 80025B40 48000008 */  b         lbl_80025B48
lbl_80025B44:
/* 022B44 80025B44 38600001 */  li        r3, 0x1
lbl_80025B48:
/* 022B48 80025B48 4E800020 */  blr

glabel frameSetColor
/* 022B4C 80025B4C 7C0802A6 */  mflr      r0
/* 022B50 80025B50 90010004 */  stw       r0, 0x4(r1)
/* 022B54 80025B54 9421FFD8 */  stwu      r1, -0x28(r1)
/* 022B58 80025B58 93E10024 */  stw       r31, 0x24(r1)
/* 022B5C 80025B5C 93C10020 */  stw       r30, 0x20(r1)
/* 022B60 80025B60 7C7F1B78 */  mr        r31, r3
/* 022B64 80025B64 7C9E2378 */  mr        r30, r4
/* 022B68 80025B68 3C7F0004 */  addis     r3, r31, 0x4
/* 022B6C 80025B6C 57C4103A */  slwi      r4, r30, 2
/* 022B70 80025B70 7CC32214 */  add       r6, r3, r4
/* 022B74 80025B74 54A0463E */  srwi      r0, r5, 24
/* 022B78 80025B78 38C6D124 */  subi      r6, r6, 0x2edc
/* 022B7C 80025B7C 98060000 */  stb       r0, 0x0(r6)
/* 022B80 80025B80 54A0863E */  extrwi    r0, r5, 8, 8
/* 022B84 80025B84 7C632214 */  add       r3, r3, r4
/* 022B88 80025B88 9803D125 */  stb       r0, -0x2edb(r3)
/* 022B8C 80025B8C 54A0C63E */  extrwi    r0, r5, 8, 16
/* 022B90 80025B90 2C1E0003 */  cmpwi     r30, 0x3
/* 022B94 80025B94 9803D126 */  stb       r0, -0x2eda(r3)
/* 022B98 80025B98 54A0063E */  clrlwi    r0, r5, 24
/* 022B9C 80025B9C 9803D127 */  stb       r0, -0x2ed9(r3)
/* 022BA0 80025BA0 4082001C */  bne       lbl_80025BBC
/* 022BA4 80025BA4 80060000 */  lwz       r0, 0x0(r6)
/* 022BA8 80025BA8 38810018 */  addi      r4, r1, 0x18
/* 022BAC 80025BAC 38600003 */  li        r3, 0x3
/* 022BB0 80025BB0 90010018 */  stw       r0, 0x18(r1)
/* 022BB4 80025BB4 48086A81 */  bl        GXSetTevColor
/* 022BB8 80025BB8 48000020 */  b         lbl_80025BD8
lbl_80025BBC:
/* 022BBC 80025BBC 2C1E0004 */  cmpwi     r30, 0x4
/* 022BC0 80025BC0 40820018 */  bne       lbl_80025BD8
/* 022BC4 80025BC4 80060000 */  lwz       r0, 0x0(r6)
/* 022BC8 80025BC8 38810014 */  addi      r4, r1, 0x14
/* 022BCC 80025BCC 38600001 */  li        r3, 0x1
/* 022BD0 80025BD0 90010014 */  stw       r0, 0x14(r1)
/* 022BD4 80025BD4 48086B49 */  bl        GXSetTevKColor
lbl_80025BD8:
/* 022BD8 80025BD8 2C1E0000 */  cmpwi     r30, 0x0
/* 022BDC 80025BDC 4082000C */  bne       lbl_80025BE8
/* 022BE0 80025BE0 38000020 */  li        r0, 0x20
/* 022BE4 80025BE4 48000008 */  b         lbl_80025BEC
lbl_80025BE8:
/* 022BE8 80025BE8 38000000 */  li        r0, 0x0
lbl_80025BEC:
/* 022BEC 80025BEC 809F007C */  lwz       r4, 0x7c(r31)
/* 022BF0 80025BF0 60007F00 */  ori       r0, r0, 0x7f00
/* 022BF4 80025BF4 3C608002 */  lis       r3, frameDrawLine_Setup@ha
/* 022BF8 80025BF8 7C800378 */  or        r0, r4, r0
/* 022BFC 80025BFC 901F007C */  stw       r0, 0x7c(r31)
/* 022C00 80025C00 38036998 */  addi      r0, r3, frameDrawLine_Setup@l
/* 022C04 80025C04 3C608002 */  lis       r3, frameDrawTriangle_Setup@ha
/* 022C08 80025C08 901F012C */  stw       r0, 0x12c(r31)
/* 022C0C 80025C0C 38037568 */  addi      r0, r3, frameDrawTriangle_Setup@l
/* 022C10 80025C10 3C608002 */  lis       r3, frameDrawRectFill_Setup@ha
/* 022C14 80025C14 901F0130 */  stw       r0, 0x130(r31)
/* 022C18 80025C18 38036654 */  addi      r0, r3, frameDrawRectFill_Setup@l
/* 022C1C 80025C1C 3C608002 */  lis       r3, frameDrawRectTexture_Setup@ha
/* 022C20 80025C20 901F0134 */  stw       r0, 0x134(r31)
/* 022C24 80025C24 38035D88 */  addi      r0, r3, frameDrawRectTexture_Setup@l
/* 022C28 80025C28 38600001 */  li        r3, 0x1
/* 022C2C 80025C2C 901F0138 */  stw       r0, 0x138(r31)
/* 022C30 80025C30 8001002C */  lwz       r0, 0x2c(r1)
/* 022C34 80025C34 83E10024 */  lwz       r31, 0x24(r1)
/* 022C38 80025C38 83C10020 */  lwz       r30, 0x20(r1)
/* 022C3C 80025C3C 7C0803A6 */  mtlr      r0
/* 022C40 80025C40 38210028 */  addi      r1, r1, 0x28
/* 022C44 80025C44 4E800020 */  blr

glabel frameSetDepth
/* 022C48 80025C48 D0230124 */  stfs      f1, 0x124(r3)
/* 022C4C 80025C4C D0430128 */  stfs      f2, 0x128(r3)
/* 022C50 80025C50 38600001 */  li        r3, 0x1
/* 022C54 80025C54 4E800020 */  blr

glabel frameSetScissor
/* 022C58 80025C58 7C0802A6 */  mflr      r0
/* 022C5C 80025C5C 90010004 */  stw       r0, 0x4(r1)
/* 022C60 80025C60 9421FFA0 */  stwu      r1, -0x60(r1)
/* 022C64 80025C64 80A40008 */  lwz       r5, 0x8(r4)
/* 022C68 80025C68 3CE04330 */  lis       r7, 0x4330
/* 022C6C 80025C6C 80040010 */  lwz       r0, 0x10(r4)
/* 022C70 80025C70 6CA88000 */  xoris     r8, r5, 0x8000
/* 022C74 80025C74 80C4000C */  lwz       r6, 0xc(r4)
/* 022C78 80025C78 6C058000 */  xoris     r5, r0, 0x8000
/* 022C7C 80025C7C 9101005C */  stw       r8, 0x5c(r1)
/* 022C80 80025C80 80040014 */  lwz       r0, 0x14(r4)
/* 022C84 80025C84 6CC48000 */  xoris     r4, r6, 0x8000
/* 022C88 80025C88 90A1003C */  stw       r5, 0x3c(r1)
/* 022C8C 80025C8C 6C008000 */  xoris     r0, r0, 0x8000
/* 022C90 80025C90 C8A28110 */  lfd       f5, D_8018C050@sda21(r0)
/* 022C94 80025C94 90E10058 */  stw       r7, 0x58(r1)
/* 022C98 80025C98 C0828104 */  lfs       f4, D_8018C044@sda21(r0)
/* 022C9C 80025C9C 90E10038 */  stw       r7, 0x38(r1)
/* 022CA0 80025CA0 C8210058 */  lfd       f1, 0x58(r1)
/* 022CA4 80025CA4 9081004C */  stw       r4, 0x4c(r1)
/* 022CA8 80025CA8 C8010038 */  lfd       f0, 0x38(r1)
/* 022CAC 80025CAC EC212828 */  fsubs     f1, f1, f5
/* 022CB0 80025CB0 9001002C */  stw       r0, 0x2c(r1)
/* 022CB4 80025CB4 EC002828 */  fsubs     f0, f0, f5
/* 022CB8 80025CB8 C0C30080 */  lfs       f6, 0x80(r3)
/* 022CBC 80025CBC 90E10048 */  stw       r7, 0x48(r1)
/* 022CC0 80025CC0 EC610132 */  fmuls     f3, f1, f4
/* 022CC4 80025CC4 C0E30084 */  lfs       f7, 0x84(r3)
/* 022CC8 80025CC8 90E10028 */  stw       r7, 0x28(r1)
/* 022CCC 80025CCC EC200132 */  fmuls     f1, f0, f4
/* 022CD0 80025CD0 C8410048 */  lfd       f2, 0x48(r1)
/* 022CD4 80025CD4 C8010028 */  lfd       f0, 0x28(r1)
/* 022CD8 80025CD8 EC6301B2 */  fmuls     f3, f3, f6
/* 022CDC 80025CDC EC422828 */  fsubs     f2, f2, f5
/* 022CE0 80025CE0 EC002828 */  fsubs     f0, f0, f5
/* 022CE4 80025CE4 FC60181E */  fctiwz    f3, f3
/* 022CE8 80025CE8 EC420132 */  fmuls     f2, f2, f4
/* 022CEC 80025CEC EC2101B2 */  fmuls     f1, f1, f6
/* 022CF0 80025CF0 EC000132 */  fmuls     f0, f0, f4
/* 022CF4 80025CF4 D8610010 */  stfd      f3, 0x10(r1)
/* 022CF8 80025CF8 EC4201F2 */  fmuls     f2, f2, f7
/* 022CFC 80025CFC FC20081E */  fctiwz    f1, f1
/* 022D00 80025D00 EC0001F2 */  fmuls     f0, f0, f7
/* 022D04 80025D04 FC40101E */  fctiwz    f2, f2
/* 022D08 80025D08 D8610050 */  stfd      f3, 0x50(r1)
/* 022D0C 80025D0C 80010014 */  lwz       r0, 0x14(r1)
/* 022D10 80025D10 D8210018 */  stfd      f1, 0x18(r1)
/* 022D14 80025D14 FC00001E */  fctiwz    f0, f0
/* 022D18 80025D18 8061001C */  lwz       r3, 0x1c(r1)
/* 022D1C 80025D1C D8410040 */  stfd      f2, 0x40(r1)
/* 022D20 80025D20 7C030000 */  cmpw      r3, r0
/* 022D24 80025D24 80610054 */  lwz       r3, 0x54(r1)
/* 022D28 80025D28 D8210030 */  stfd      f1, 0x30(r1)
/* 022D2C 80025D2C 80810044 */  lwz       r4, 0x44(r1)
/* 022D30 80025D30 D8010020 */  stfd      f0, 0x20(r1)
/* 022D34 80025D34 80A10034 */  lwz       r5, 0x34(r1)
/* 022D38 80025D38 80C10024 */  lwz       r6, 0x24(r1)
/* 022D3C 80025D3C 40800010 */  bge       lbl_80025D4C
/* 022D40 80025D40 7CA02B78 */  mr        r0, r5
/* 022D44 80025D44 7C651B78 */  mr        r5, r3
/* 022D48 80025D48 7C030378 */  mr        r3, r0
lbl_80025D4C:
/* 022D4C 80025D4C 7C062000 */  cmpw      r6, r4
/* 022D50 80025D50 40800010 */  bge       lbl_80025D60
/* 022D54 80025D54 7CC03378 */  mr        r0, r6
/* 022D58 80025D58 7C862378 */  mr        r6, r4
/* 022D5C 80025D5C 7C040378 */  mr        r4, r0
lbl_80025D60:
/* 022D60 80025D60 7CA32850 */  subf      r5, r3, r5
/* 022D64 80025D64 7CC43050 */  subf      r6, r4, r6
/* 022D68 80025D68 48087A95 */  bl        GXSetScissor
/* 022D6C 80025D6C 38600001 */  li        r3, 0x1
/* 022D70 80025D70 80010064 */  lwz       r0, 0x64(r1)
/* 022D74 80025D74 38210060 */  addi      r1, r1, 0x60
/* 022D78 80025D78 7C0803A6 */  mtlr      r0
/* 022D7C 80025D7C 4E800020 */  blr

glabel frameShow
/* 022D80 80025D80 38600001 */  li        r3, 0x1
/* 022D84 80025D84 4E800020 */  blr

glabel frameDrawRectTexture_Setup
/* 022D88 80025D88 7C0802A6 */  mflr      r0
/* 022D8C 80025D8C 90010004 */  stw       r0, 0x4(r1)
/* 022D90 80025D90 9421FEC0 */  stwu      r1, -0x140(r1)
/* 022D94 80025D94 DBE10138 */  stfd      f31, 0x138(r1)
/* 022D98 80025D98 DBC10130 */  stfd      f30, 0x130(r1)
/* 022D9C 80025D9C DBA10128 */  stfd      f29, 0x128(r1)
/* 022DA0 80025DA0 DB810120 */  stfd      f28, 0x120(r1)
/* 022DA4 80025DA4 DB610118 */  stfd      f27, 0x118(r1)
/* 022DA8 80025DA8 BE8100E8 */  stmw      r20, 0xe8(r1)
/* 022DAC 80025DAC 7C761B78 */  mr        r22, r3
/* 022DB0 80025DB0 7C972378 */  mr        r23, r4
/* 022DB4 80025DB4 880D89B8 */  lbz       r0, -0x7648(r13)
/* 022DB8 80025DB8 80770004 */  lwz       r3, 0x4(r23)
/* 022DBC 80025DBC 28000000 */  cmplwi    r0, 0x0
/* 022DC0 80025DC0 7C791B78 */  mr        r25, r3
/* 022DC4 80025DC4 4182000C */  beq       lbl_80025DD0
/* 022DC8 80025DC8 38600001 */  li        r3, 0x1
/* 022DCC 80025DCC 48000388 */  b         lbl_80026154
lbl_80025DD0:
/* 022DD0 80025DD0 7EC3B378 */  mr        r3, r22
/* 022DD4 80025DD4 48004191 */  bl        frameDrawSetup2D
/* 022DD8 80025DD8 2C030000 */  cmpwi     r3, 0x0
/* 022DDC 80025DDC 4082000C */  bne       lbl_80025DE8
/* 022DE0 80025DE0 38600000 */  li        r3, 0x0
/* 022DE4 80025DE4 48000370 */  b         lbl_80026154
lbl_80025DE8:
/* 022DE8 80025DE8 3B000000 */  li        r24, 0x0
/* 022DEC 80025DEC 3AA00001 */  li        r21, 0x1
/* 022DF0 80025DF0 93010010 */  stw       r24, 0x10(r1)
/* 022DF4 80025DF4 7EC3B378 */  mr        r3, r22
/* 022DF8 80025DF8 92A10014 */  stw       r21, 0x14(r1)
/* 022DFC 80025DFC 38810010 */  addi      r4, r1, 0x10
/* 022E00 80025E00 38A10014 */  addi      r5, r1, 0x14
/* 022E04 80025E04 38C00001 */  li        r6, 0x1
/* 022E08 80025E08 480030B1 */  bl        frameDrawSetupDP
/* 022E0C 80025E0C 2C030000 */  cmpwi     r3, 0x0
/* 022E10 80025E10 4082000C */  bne       lbl_80025E1C
/* 022E14 80025E14 38600000 */  li        r3, 0x0
/* 022E18 80025E18 4800033C */  b         lbl_80026154
lbl_80025E1C:
/* 022E1C 80025E1C 2C190007 */  cmpwi     r25, 0x7
/* 022E20 80025E20 40800020 */  bge       lbl_80025E40
/* 022E24 80025E24 1C19002C */  mulli     r0, r25, 0x2c
/* 022E28 80025E28 3C760004 */  addis     r3, r22, 0x4
/* 022E2C 80025E2C 7C630214 */  add       r3, r3, r0
/* 022E30 80025E30 8003C390 */  lwz       r0, -0x3c70(r3)
/* 022E34 80025E34 2C000000 */  cmpwi     r0, 0x0
/* 022E38 80025E38 41820008 */  beq       lbl_80025E40
/* 022E3C 80025E3C 7EB8AB78 */  mr        r24, r21
lbl_80025E40:
/* 022E40 80025E40 2C180000 */  cmpwi     r24, 0x0
/* 022E44 80025E44 4182000C */  beq       lbl_80025E50
/* 022E48 80025E48 38600001 */  li        r3, 0x1
/* 022E4C 80025E4C 48000008 */  b         lbl_80025E54
lbl_80025E50:
/* 022E50 80025E50 38600000 */  li        r3, 0x0
lbl_80025E54:
/* 022E54 80025E54 80010014 */  lwz       r0, 0x14(r1)
/* 022E58 80025E58 7F191A14 */  add       r24, r25, r3
/* 022E5C 80025E5C 28000000 */  cmplwi    r0, 0x0
/* 022E60 80025E60 418202F0 */  beq       lbl_80026150
/* 022E64 80025E64 38C00000 */  li        r6, 0x0
/* 022E68 80025E68 1CB9002C */  mulli     r5, r25, 0x2c
/* 022E6C 80025E6C 3C60800F */  lis       r3, 0x800f
/* 022E70 80025E70 54C4103A */  slwi      r4, r6, 2
/* 022E74 80025E74 3803BD50 */  subi      r0, r3, 0x42b0
/* 022E78 80025E78 7F402214 */  add       r26, r0, r4
/* 022E7C 80025E7C 5720103A */  slwi      r0, r25, 2
/* 022E80 80025E80 3B810018 */  addi      r28, r1, 0x18
/* 022E84 80025E84 54DD2036 */  slwi      r29, r6, 4
/* 022E88 80025E88 7F9C0214 */  add       r28, r28, r0
/* 022E8C 80025E8C 7F762A14 */  add       r27, r22, r5
/* 022E90 80025E90 48000004 */  b         lbl_80025E94
lbl_80025E94:
/* 022E94 80025E94 3C608014 */  lis       r3, 0x8014
/* 022E98 80025E98 C3C28138 */  lfs       f30, -0x7ec8(r2)
/* 022E9C 80025E9C CBE28110 */  lfd       f31, -0x7ef0(r2)
/* 022EA0 80025EA0 3BC3BFB0 */  subi      r30, r3, 0x4050
/* 022EA4 80025EA4 C3628104 */  lfs       f27, -0x7efc(r2)
/* 022EA8 80025EA8 3FE04330 */  lis       r31, 0x4330
/* 022EAC 80025EAC 48000004 */  b         lbl_80025EB0
lbl_80025EB0:
/* 022EB0 80025EB0 48000268 */  b         lbl_80026118
lbl_80025EB4:
/* 022EB4 80025EB4 7EC3B378 */  mr        r3, r22
/* 022EB8 80025EB8 7F84E378 */  mr        r4, r28
/* 022EBC 80025EBC 7F25EB78 */  or        r5, r25, r29
/* 022EC0 80025EC0 4BFFA231 */  bl        frameLoadTile
/* 022EC4 80025EC4 2C030000 */  cmpwi     r3, 0x0
/* 022EC8 80025EC8 4182023C */  beq       lbl_80026104
/* 022ECC 80025ECC 806D8914 */  lwz       r3, -0x76ec(r13)
/* 022ED0 80025ED0 80030020 */  lwz       r0, 0x20(r3)
/* 022ED4 80025ED4 2C000005 */  cmpwi     r0, 0x5
/* 022ED8 80025ED8 4082005C */  bne       lbl_80025F34
/* 022EDC 80025EDC 807C0000 */  lwz       r3, 0x0(r28)
/* 022EE0 80025EE0 80630014 */  lwz       r3, 0x14(r3)
/* 022EE4 80025EE4 3C03FF88 */  subis     r0, r3, 0x78
/* 022EE8 80025EE8 28004600 */  cmplwi    r0, 0x4600
/* 022EEC 80025EEC 40820048 */  bne       lbl_80025F34
/* 022EF0 80025EF0 80170010 */  lwz       r0, 0x10(r23)
/* 022EF4 80025EF4 2C000500 */  cmpwi     r0, 0x500
/* 022EF8 80025EF8 4082003C */  bne       lbl_80025F34
/* 022EFC 80025EFC 3AA00001 */  li        r21, 0x1
/* 022F00 80025F00 92AD89D8 */  stw       r21, -0x7628(r13)
/* 022F04 80025F04 80160068 */  lwz       r0, 0x68(r22)
/* 022F08 80025F08 2C000000 */  cmpwi     r0, 0x0
/* 022F0C 80025F0C 40820028 */  bne       lbl_80025F34
/* 022F10 80025F10 8A96004C */  lbz       r20, 0x4c(r22)
/* 022F14 80025F14 380000DC */  li        r0, 0xdc
/* 022F18 80025F18 7EC3B378 */  mr        r3, r22
/* 022F1C 80025F1C 9816004C */  stb       r0, 0x4c(r22)
/* 022F20 80025F20 7FC4F378 */  mr        r4, r30
/* 022F24 80025F24 4BFFEE1D */  bl        ZeldaDrawFrame
/* 022F28 80025F28 9A96004C */  stb       r20, 0x4c(r22)
/* 022F2C 80025F2C 92B60068 */  stw       r21, 0x68(r22)
/* 022F30 80025F30 92AD89D8 */  stw       r21, -0x7628(r13)
lbl_80025F34:
/* 022F34 80025F34 800D89D8 */  lwz       r0, -0x7628(r13)
/* 022F38 80025F38 2C000000 */  cmpwi     r0, 0x0
/* 022F3C 80025F3C 41820028 */  beq       lbl_80025F64
/* 022F40 80025F40 80170014 */  lwz       r0, 0x14(r23)
/* 022F44 80025F44 2C0003C0 */  cmpwi     r0, 0x3c0
/* 022F48 80025F48 40820014 */  bne       lbl_80025F5C
/* 022F4C 80025F4C 38000000 */  li        r0, 0x0
/* 022F50 80025F50 900D89D8 */  stw       r0, -0x7628(r13)
/* 022F54 80025F54 38600001 */  li        r3, 0x1
/* 022F58 80025F58 480001FC */  b         lbl_80026154
lbl_80025F5C:
/* 022F5C 80025F5C 38600001 */  li        r3, 0x1
/* 022F60 80025F60 480001F4 */  b         lbl_80026154
lbl_80025F64:
/* 022F64 80025F64 80BC0000 */  lwz       r5, 0x0(r28)
/* 022F68 80025F68 3C7B0004 */  addis     r3, r27, 0x4
/* 022F6C 80025F6C A883C374 */  lha       r4, -0x3c8c(r3)
/* 022F70 80025F70 A8050010 */  lha       r0, 0x10(r5)
/* 022F74 80025F74 2C04000B */  cmpwi     r4, 0xb
/* 022F78 80025F78 6C038000 */  xoris     r3, r0, 0x8000
/* 022F7C 80025F7C 906100E4 */  stw       r3, 0xe4(r1)
/* 022F80 80025F80 93E100E0 */  stw       r31, 0xe0(r1)
/* 022F84 80025F84 C80100E0 */  lfd       f0, 0xe0(r1)
/* 022F88 80025F88 EC00F828 */  fsubs     f0, f0, f31
/* 022F8C 80025F8C EFBE0024 */  fdivs     f29, f30, f0
/* 022F90 80025F90 40800028 */  bge       lbl_80025FB8
/* 022F94 80025F94 38600001 */  li        r3, 0x1
/* 022F98 80025F98 7C632030 */  slw       r3, r3, r4
/* 022F9C 80025F9C 6C638000 */  xoris     r3, r3, 0x8000
/* 022FA0 80025FA0 906100E4 */  stw       r3, 0xe4(r1)
/* 022FA4 80025FA4 93E100E0 */  stw       r31, 0xe0(r1)
/* 022FA8 80025FA8 C80100E0 */  lfd       f0, 0xe0(r1)
/* 022FAC 80025FAC EC00F828 */  fsubs     f0, f0, f31
/* 022FB0 80025FB0 EFBD0024 */  fdivs     f29, f29, f0
/* 022FB4 80025FB4 48000028 */  b         lbl_80025FDC
lbl_80025FB8:
/* 022FB8 80025FB8 20640010 */  subfic    r3, r4, 0x10
/* 022FBC 80025FBC 38800001 */  li        r4, 0x1
/* 022FC0 80025FC0 7C831830 */  slw       r3, r4, r3
/* 022FC4 80025FC4 6C638000 */  xoris     r3, r3, 0x8000
/* 022FC8 80025FC8 906100E4 */  stw       r3, 0xe4(r1)
/* 022FCC 80025FCC 93E100E0 */  stw       r31, 0xe0(r1)
/* 022FD0 80025FD0 C80100E0 */  lfd       f0, 0xe0(r1)
/* 022FD4 80025FD4 EC00F828 */  fsubs     f0, f0, f31
/* 022FD8 80025FD8 EFBD0032 */  fmuls     f29, f29, f0
lbl_80025FDC:
/* 022FDC 80025FDC A8C50012 */  lha       r6, 0x12(r5)
/* 022FE0 80025FE0 3C7B0004 */  addis     r3, r27, 0x4
/* 022FE4 80025FE4 A883C376 */  lha       r4, -0x3c8a(r3)
/* 022FE8 80025FE8 6CC38000 */  xoris     r3, r6, 0x8000
/* 022FEC 80025FEC 906100E4 */  stw       r3, 0xe4(r1)
/* 022FF0 80025FF0 2C04000B */  cmpwi     r4, 0xb
/* 022FF4 80025FF4 93E100E0 */  stw       r31, 0xe0(r1)
/* 022FF8 80025FF8 C80100E0 */  lfd       f0, 0xe0(r1)
/* 022FFC 80025FFC EC00F828 */  fsubs     f0, f0, f31
/* 023000 80026000 EF9E0024 */  fdivs     f28, f30, f0
/* 023004 80026004 40800028 */  bge       lbl_8002602C
/* 023008 80026008 38600001 */  li        r3, 0x1
/* 02300C 8002600C 7C632030 */  slw       r3, r3, r4
/* 023010 80026010 6C638000 */  xoris     r3, r3, 0x8000
/* 023014 80026014 906100E4 */  stw       r3, 0xe4(r1)
/* 023018 80026018 93E100E0 */  stw       r31, 0xe0(r1)
/* 02301C 8002601C C80100E0 */  lfd       f0, 0xe0(r1)
/* 023020 80026020 EC00F828 */  fsubs     f0, f0, f31
/* 023024 80026024 EF9C0024 */  fdivs     f28, f28, f0
/* 023028 80026028 48000028 */  b         lbl_80026050
lbl_8002602C:
/* 02302C 8002602C 20640010 */  subfic    r3, r4, 0x10
/* 023030 80026030 38800001 */  li        r4, 0x1
/* 023034 80026034 7C831830 */  slw       r3, r4, r3
/* 023038 80026038 6C638000 */  xoris     r3, r3, 0x8000
/* 02303C 8002603C 906100E4 */  stw       r3, 0xe4(r1)
/* 023040 80026040 93E100E0 */  stw       r31, 0xe0(r1)
/* 023044 80026044 C80100E0 */  lfd       f0, 0xe0(r1)
/* 023048 80026048 EC00F828 */  fsubs     f0, f0, f31
/* 02304C 8002604C EF9C0032 */  fmuls     f28, f28, f0
lbl_80026050:
/* 023050 80026050 3C7B0004 */  addis     r3, r27, 0x4
/* 023054 80026054 C0628100 */  lfs       f3, -0x7f00(r2)
/* 023058 80026058 A883C378 */  lha       r4, -0x3c88(r3)
/* 02305C 8002605C 6C058000 */  xoris     r5, r0, 0x8000
/* 023060 80026060 A863C37A */  lha       r3, -0x3c86(r3)
/* 023064 80026064 6CC08000 */  xoris     r0, r6, 0x8000
/* 023068 80026068 6C868000 */  xoris     r6, r4, 0x8000
/* 02306C 8002606C 6C648000 */  xoris     r4, r3, 0x8000
/* 023070 80026070 90C100E4 */  stw       r6, 0xe4(r1)
/* 023074 80026074 38610068 */  addi      r3, r1, 0x68
/* 023078 80026078 908100D4 */  stw       r4, 0xd4(r1)
/* 02307C 8002607C 93E100E0 */  stw       r31, 0xe0(r1)
/* 023080 80026080 93E100D0 */  stw       r31, 0xd0(r1)
/* 023084 80026084 C82100E0 */  lfd       f1, 0xe0(r1)
/* 023088 80026088 90A100DC */  stw       r5, 0xdc(r1)
/* 02308C 8002608C C80100D0 */  lfd       f0, 0xd0(r1)
/* 023090 80026090 EC21F828 */  fsubs     f1, f1, f31
/* 023094 80026094 900100CC */  stw       r0, 0xcc(r1)
/* 023098 80026098 EC00F828 */  fsubs     f0, f0, f31
/* 02309C 8002609C 93E100D8 */  stw       r31, 0xd8(r1)
/* 0230A0 800260A0 EC8106F2 */  fmuls     f4, f1, f27
/* 0230A4 800260A4 93E100C8 */  stw       r31, 0xc8(r1)
/* 0230A8 800260A8 EC2006F2 */  fmuls     f1, f0, f27
/* 0230AC 800260AC C84100D8 */  lfd       f2, 0xd8(r1)
/* 0230B0 800260B0 C80100C8 */  lfd       f0, 0xc8(r1)
/* 0230B4 800260B4 EC42F828 */  fsubs     f2, f2, f31
/* 0230B8 800260B8 EC00F828 */  fsubs     f0, f0, f31
/* 0230BC 800260BC EC441024 */  fdivs     f2, f4, f2
/* 0230C0 800260C0 EC010024 */  fdivs     f0, f1, f0
/* 0230C4 800260C4 FC201050 */  fneg      f1, f2
/* 0230C8 800260C8 FC400050 */  fneg      f2, f0
/* 0230CC 800260CC 480808D9 */  bl        PSMTXTrans
/* 0230D0 800260D0 FC20E890 */  fmr       f1, f29
/* 0230D4 800260D4 C0628100 */  lfs       f3, -0x7f00(r2)
/* 0230D8 800260D8 FC40E090 */  fmr       f2, f28
/* 0230DC 800260DC 38610038 */  addi      r3, r1, 0x38
/* 0230E0 800260E0 48080945 */  bl        PSMTXScale
/* 0230E4 800260E4 38610068 */  addi      r3, r1, 0x68
/* 0230E8 800260E8 38810038 */  addi      r4, r1, 0x38
/* 0230EC 800260EC 38A10098 */  addi      r5, r1, 0x98
/* 0230F0 800260F0 480807E9 */  bl        PSMTXConcat
/* 0230F4 800260F4 809A0000 */  lwz       r4, 0x0(r26)
/* 0230F8 800260F8 38610098 */  addi      r3, r1, 0x98
/* 0230FC 800260FC 38A00001 */  li        r5, 0x1
/* 023100 80026100 48087521 */  bl        fn_800AD620
lbl_80026104:
/* 023104 80026104 3B9C0004 */  addi      r28, r28, 0x4
/* 023108 80026108 3B7B002C */  addi      r27, r27, 0x2c
/* 02310C 8002610C 3B390001 */  addi      r25, r25, 0x1
/* 023110 80026110 3BBD0010 */  addi      r29, r29, 0x10
/* 023114 80026114 3B5A0004 */  addi      r26, r26, 0x4
lbl_80026118:
/* 023118 80026118 7C19C000 */  cmpw      r25, r24
/* 02311C 8002611C 4081FD98 */  ble       lbl_80025EB4
/* 023120 80026120 3C608002 */  lis       r3, 0x8002
/* 023124 80026124 3803617C */  addi      r0, r3, 0x617c
/* 023128 80026128 90160138 */  stw       r0, 0x138(r22)
/* 02312C 8002612C 7EC3B378 */  mr        r3, r22
/* 023130 80026130 7EE4BB78 */  mr        r4, r23
/* 023134 80026134 81960138 */  lwz       r12, 0x138(r22)
/* 023138 80026138 7D8803A6 */  mtlr      r12
/* 02313C 8002613C 4E800021 */  blrl
/* 023140 80026140 2C030000 */  cmpwi     r3, 0x0
/* 023144 80026144 4082000C */  bne       lbl_80026150
/* 023148 80026148 38600000 */  li        r3, 0x0
/* 02314C 8002614C 48000008 */  b         lbl_80026154
lbl_80026150:
/* 023150 80026150 38600001 */  li        r3, 0x1
lbl_80026154:
/* 023154 80026154 BA8100E8 */  lmw       r20, 0xe8(r1)
/* 023158 80026158 80010144 */  lwz       r0, 0x144(r1)
/* 02315C 8002615C CBE10138 */  lfd       f31, 0x138(r1)
/* 023160 80026160 CBC10130 */  lfd       f30, 0x130(r1)
/* 023164 80026164 7C0803A6 */  mtlr      r0
/* 023168 80026168 CBA10128 */  lfd       f29, 0x128(r1)
/* 02316C 8002616C CB810120 */  lfd       f28, 0x120(r1)
/* 023170 80026170 CB610118 */  lfd       f27, 0x118(r1)
/* 023174 80026174 38210140 */  addi      r1, r1, 0x140
/* 023178 80026178 4E800020 */  blr

glabel frameDrawRectTexture
/* 02317C 8002617C 7C0802A6 */  mflr      r0
/* 023180 80026180 90010004 */  stw       r0, 0x4(r1)
/* 023184 80026184 9421FF78 */  stwu      r1, -0x88(r1)
/* 023188 80026188 DBE10080 */  stfd      f31, 0x80(r1)
/* 02318C 8002618C DBC10078 */  stfd      f30, 0x78(r1)
/* 023190 80026190 DBA10070 */  stfd      f29, 0x70(r1)
/* 023194 80026194 DB810068 */  stfd      f28, 0x68(r1)
/* 023198 80026198 DB610060 */  stfd      f27, 0x60(r1)
/* 02319C 8002619C DB410058 */  stfd      f26, 0x58(r1)
/* 0231A0 800261A0 DB210050 */  stfd      f25, 0x50(r1)
/* 0231A4 800261A4 DB010048 */  stfd      f24, 0x48(r1)
/* 0231A8 800261A8 DAE10040 */  stfd      f23, 0x40(r1)
/* 0231AC 800261AC 93E1003C */  stw       r31, 0x3c(r1)
/* 0231B0 800261B0 93C10038 */  stw       r30, 0x38(r1)
/* 0231B4 800261B4 7C7E1B78 */  mr        r30, r3
/* 0231B8 800261B8 7C9F2378 */  mr        r31, r4
/* 0231BC 800261BC 806D8914 */  lwz       r3, -0x76ec(r13)
/* 0231C0 800261C0 80030020 */  lwz       r0, 0x20(r3)
/* 0231C4 800261C4 2C00000B */  cmpwi     r0, 0xb
/* 0231C8 800261C8 408200A8 */  bne       lbl_80026270
/* 0231CC 800261CC 801F0008 */  lwz       r0, 0x8(r31)
/* 0231D0 800261D0 2C000000 */  cmpwi     r0, 0x0
/* 0231D4 800261D4 40820070 */  bne       lbl_80026244
/* 0231D8 800261D8 801F000C */  lwz       r0, 0xc(r31)
/* 0231DC 800261DC 2C000000 */  cmpwi     r0, 0x0
/* 0231E0 800261E0 40820064 */  bne       lbl_80026244
/* 0231E4 800261E4 801F0010 */  lwz       r0, 0x10(r31)
/* 0231E8 800261E8 2C00051C */  cmpwi     r0, 0x51c
/* 0231EC 800261EC 40820058 */  bne       lbl_80026244
/* 0231F0 800261F0 801F0014 */  lwz       r0, 0x14(r31)
/* 0231F4 800261F4 2C000014 */  cmpwi     r0, 0x14
/* 0231F8 800261F8 4082004C */  bne       lbl_80026244
/* 0231FC 800261FC 807E00EC */  lwz       r3, 0xec(r30)
/* 023200 80026200 3C03FFC5 */  subis     r0, r3, 0x3b
/* 023204 80026204 28005000 */  cmplwi    r0, 0x5000
/* 023208 80026208 4182003C */  beq       lbl_80026244
/* 02320C 8002620C 3C03FFC3 */  subis     r0, r3, 0x3d
/* 023210 80026210 2800A800 */  cmplwi    r0, 0xa800
/* 023214 80026214 41820030 */  beq       lbl_80026244
/* 023218 80026218 801E0070 */  lwz       r0, 0x70(r30)
/* 02321C 8002621C 2C000000 */  cmpwi     r0, 0x0
/* 023220 80026220 40820024 */  bne       lbl_80026244
/* 023224 80026224 3C608016 */  lis       r3, 0x8016
/* 023228 80026228 388317B0 */  addi      r4, r3, 0x17b0
/* 02322C 8002622C 7FC3F378 */  mr        r3, r30
/* 023230 80026230 4BFFF0D5 */  bl        ZeldaDrawFrameNoBlend
/* 023234 80026234 38000001 */  li        r0, 0x1
/* 023238 80026238 901E0070 */  stw       r0, 0x70(r30)
/* 02323C 8002623C 38000000 */  li        r0, 0x0
/* 023240 80026240 900D89D4 */  stw       r0, -0x762c(r13)
lbl_80026244:
/* 023244 80026244 801E0070 */  lwz       r0, 0x70(r30)
/* 023248 80026248 2C000001 */  cmpwi     r0, 0x1
/* 02324C 8002624C 40820024 */  bne       lbl_80026270
/* 023250 80026250 806D89D4 */  lwz       r3, -0x762c(r13)
/* 023254 80026254 38030001 */  addi      r0, r3, 0x1
/* 023258 80026258 900D89D4 */  stw       r0, -0x762c(r13)
/* 02325C 8002625C 800D89D4 */  lwz       r0, -0x762c(r13)
/* 023260 80026260 2C000028 */  cmpwi     r0, 0x28
/* 023264 80026264 4080000C */  bge       lbl_80026270
/* 023268 80026268 38600001 */  li        r3, 0x1
/* 02326C 8002626C 480003AC */  b         lbl_80026618
lbl_80026270:
/* 023270 80026270 880D89B8 */  lbz       r0, -0x7648(r13)
/* 023274 80026274 28000000 */  cmplwi    r0, 0x0
/* 023278 80026278 4182000C */  beq       lbl_80026284
/* 02327C 8002627C 38600001 */  li        r3, 0x1
/* 023280 80026280 48000398 */  b         lbl_80026618
lbl_80026284:
/* 023284 80026284 801E00A4 */  lwz       r0, 0xa4(r30)
/* 023288 80026288 54030296 */  rlwinm    r3, r0, 0, 10, 11
/* 02328C 8002628C 3C03FFD0 */  subis     r0, r3, 0x30
/* 023290 80026290 28000000 */  cmplwi    r0, 0x0
/* 023294 80026294 41820010 */  beq       lbl_800262A4
/* 023298 80026298 3C03FFE0 */  subis     r0, r3, 0x20
/* 02329C 8002629C 28000000 */  cmplwi    r0, 0x0
/* 0232A0 800262A0 4082000C */  bne       lbl_800262AC
lbl_800262A4:
/* 0232A4 800262A4 39600001 */  li        r11, 0x1
/* 0232A8 800262A8 48000008 */  b         lbl_800262B0
lbl_800262AC:
/* 0232AC 800262AC 39600000 */  li        r11, 0x0
lbl_800262B0:
/* 0232B0 800262B0 2C0B0000 */  cmpwi     r11, 0x0
/* 0232B4 800262B4 41820014 */  beq       lbl_800262C8
/* 0232B8 800262B8 C03F0020 */  lfs       f1, 0x20(r31)
/* 0232BC 800262BC C0028104 */  lfs       f0, -0x7efc(r2)
/* 0232C0 800262C0 EC610032 */  fmuls     f3, f1, f0
/* 0232C4 800262C4 48000008 */  b         lbl_800262CC
lbl_800262C8:
/* 0232C8 800262C8 C07F0020 */  lfs       f3, 0x20(r31)
lbl_800262CC:
/* 0232CC 800262CC 813F0008 */  lwz       r9, 0x8(r31)
/* 0232D0 800262D0 3CE04330 */  lis       r7, 0x4330
/* 0232D4 800262D4 807F0010 */  lwz       r3, 0x10(r31)
/* 0232D8 800262D8 38090003 */  addi      r0, r9, 0x3
/* 0232DC 800262DC 815F000C */  lwz       r10, 0xc(r31)
/* 0232E0 800262E0 7C081670 */  srawi     r8, r0, 2
/* 0232E4 800262E4 809F0014 */  lwz       r4, 0x14(r31)
/* 0232E8 800262E8 38030003 */  addi      r0, r3, 0x3
/* 0232EC 800262EC 806D8914 */  lwz       r3, -0x76ec(r13)
/* 0232F0 800262F0 7C061670 */  srawi     r6, r0, 2
/* 0232F4 800262F4 C8428110 */  lfd       f2, -0x7ef0(r2)
/* 0232F8 800262F8 38AA0003 */  addi      r5, r10, 0x3
/* 0232FC 800262FC 80030020 */  lwz       r0, 0x20(r3)
/* 023300 80026300 7CA51670 */  srawi     r5, r5, 2
/* 023304 80026304 C0BF0024 */  lfs       f5, 0x24(r31)
/* 023308 80026308 38640003 */  addi      r3, r4, 0x3
/* 02330C 8002630C 7C631670 */  srawi     r3, r3, 2
/* 023310 80026310 6D048000 */  xoris     r4, r8, 0x8000
/* 023314 80026314 6CC68000 */  xoris     r6, r6, 0x8000
/* 023318 80026318 90810034 */  stw       r4, 0x34(r1)
/* 02331C 8002631C 6CA48000 */  xoris     r4, r5, 0x8000
/* 023320 80026320 6C638000 */  xoris     r3, r3, 0x8000
/* 023324 80026324 90C1002C */  stw       r6, 0x2c(r1)
/* 023328 80026328 2C000004 */  cmpwi     r0, 0x4
/* 02332C 8002632C 90810024 */  stw       r4, 0x24(r1)
/* 023330 80026330 9061001C */  stw       r3, 0x1c(r1)
/* 023334 80026334 90E10030 */  stw       r7, 0x30(r1)
/* 023338 80026338 90E10028 */  stw       r7, 0x28(r1)
/* 02333C 8002633C C8210030 */  lfd       f1, 0x30(r1)
/* 023340 80026340 90E10020 */  stw       r7, 0x20(r1)
/* 023344 80026344 C8010028 */  lfd       f0, 0x28(r1)
/* 023348 80026348 EFC11028 */  fsubs     f30, f1, f2
/* 02334C 8002634C 90E10018 */  stw       r7, 0x18(r1)
/* 023350 80026350 C8210020 */  lfd       f1, 0x20(r1)
/* 023354 80026354 EF801028 */  fsubs     f28, f0, f2
/* 023358 80026358 C8010018 */  lfd       f0, 0x18(r1)
/* 02335C 8002635C EFA11028 */  fsubs     f29, f1, f2
/* 023360 80026360 EF601028 */  fsubs     f27, f0, f2
/* 023364 80026364 40820058 */  bne       lbl_800263BC
/* 023368 80026368 2C090330 */  cmpwi     r9, 0x330
/* 02336C 8002636C 40820050 */  bne       lbl_800263BC
/* 023370 80026370 2C0A0230 */  cmpwi     r10, 0x230
/* 023374 80026374 40820048 */  bne       lbl_800263BC
/* 023378 80026378 806D89D0 */  lwz       r3, -0x7630(r13)
/* 02337C 8002637C 2C030000 */  cmpwi     r3, 0x0
/* 023380 80026380 40800020 */  bge       lbl_800263A0
/* 023384 80026384 38030001 */  addi      r0, r3, 0x1
/* 023388 80026388 2C000000 */  cmpwi     r0, 0x0
/* 02338C 8002638C 900D89D0 */  stw       r0, -0x7630(r13)
/* 023390 80026390 40820010 */  bne       lbl_800263A0
/* 023394 80026394 38000001 */  li        r0, 0x1
/* 023398 80026398 900D89D0 */  stw       r0, -0x7630(r13)
/* 02339C 8002639C 48000020 */  b         lbl_800263BC
lbl_800263A0:
/* 0233A0 800263A0 806D89D0 */  lwz       r3, -0x7630(r13)
/* 0233A4 800263A4 2C030000 */  cmpwi     r3, 0x0
/* 0233A8 800263A8 40810014 */  ble       lbl_800263BC
/* 0233AC 800263AC 3803FFFF */  subi      r0, r3, 0x1
/* 0233B0 800263B0 900D89D0 */  stw       r0, -0x7630(r13)
/* 0233B4 800263B4 38600001 */  li        r3, 0x1
/* 0233B8 800263B8 48000260 */  b         lbl_80026618
lbl_800263BC:
/* 0233BC 800263BC 801F0000 */  lwz       r0, 0x0(r31)
/* 0233C0 800263C0 2C000000 */  cmpwi     r0, 0x0
/* 0233C4 800263C4 41820028 */  beq       lbl_800263EC
/* 0233C8 800263C8 EC3BE828 */  fsubs     f1, f27, f29
/* 0233CC 800263CC C05F0018 */  lfs       f2, 0x18(r31)
/* 0233D0 800263D0 C09F001C */  lfs       f4, 0x1c(r31)
/* 0233D4 800263D4 EC1CF028 */  fsubs     f0, f28, f30
/* 0233D8 800263D8 FF401090 */  fmr       f26, f2
/* 0233DC 800263DC FF202090 */  fmr       f25, f4
/* 0233E0 800263E0 EF03107A */  fmadds    f24, f3, f1, f2
/* 0233E4 800263E4 EEE5203A */  fmadds    f23, f5, f0, f4
/* 0233E8 800263E8 48000024 */  b         lbl_8002640C
lbl_800263EC:
/* 0233EC 800263EC EC3CF028 */  fsubs     f1, f28, f30
/* 0233F0 800263F0 C05F0018 */  lfs       f2, 0x18(r31)
/* 0233F4 800263F4 C09F001C */  lfs       f4, 0x1c(r31)
/* 0233F8 800263F8 EC1BE828 */  fsubs     f0, f27, f29
/* 0233FC 800263FC FF401090 */  fmr       f26, f2
/* 023400 80026400 FF202090 */  fmr       f25, f4
/* 023404 80026404 EF03107A */  fmadds    f24, f3, f1, f2
/* 023408 80026408 EEE5203A */  fmadds    f23, f5, f0, f4
lbl_8002640C:
/* 02340C 8002640C 2C0B0000 */  cmpwi     r11, 0x0
/* 023410 80026410 41820018 */  beq       lbl_80026428
/* 023414 80026414 C0028138 */  lfs       f0, -0x7ec8(r2)
/* 023418 80026418 EF9C002A */  fadds     f28, f28, f0
/* 02341C 8002641C EF18002A */  fadds     f24, f24, f0
/* 023420 80026420 EF7B002A */  fadds     f27, f27, f0
/* 023424 80026424 EEF7002A */  fadds     f23, f23, f0
lbl_80026428:
/* 023428 80026428 801E005C */  lwz       r0, 0x5c(r30)
/* 02342C 8002642C C3E28100 */  lfs       f31, -0x7f00(r2)
/* 023430 80026430 2C000000 */  cmpwi     r0, 0x0
/* 023434 80026434 41820008 */  beq       lbl_8002643C
/* 023438 80026438 C3E281B0 */  lfs       f31, -0x7e50(r2)
lbl_8002643C:
/* 02343C 8002643C 3FDE0004 */  addis     r30, r30, 0x4
/* 023440 80026440 801ED138 */  lwz       r0, -0x2ec8(r30)
/* 023444 80026444 2800000F */  cmplwi    r0, 0xf
/* 023448 80026448 4182007C */  beq       lbl_800264C4
/* 02344C 8002644C 48082861 */  bl        GXClearVtxDesc
/* 023450 80026450 38600009 */  li        r3, 0x9
/* 023454 80026454 38800001 */  li        r4, 0x1
/* 023458 80026458 4808238D */  bl        GXSetVtxDesc
/* 02345C 8002645C 3860000B */  li        r3, 0xb
/* 023460 80026460 38800001 */  li        r4, 0x1
/* 023464 80026464 48082381 */  bl        GXSetVtxDesc
/* 023468 80026468 3860000D */  li        r3, 0xd
/* 02346C 8002646C 38800001 */  li        r4, 0x1
/* 023470 80026470 48082375 */  bl        GXSetVtxDesc
/* 023474 80026474 38600000 */  li        r3, 0x0
/* 023478 80026478 38800009 */  li        r4, 0x9
/* 02347C 8002647C 38A00001 */  li        r5, 0x1
/* 023480 80026480 38C00004 */  li        r6, 0x4
/* 023484 80026484 38E00000 */  li        r7, 0x0
/* 023488 80026488 4808285D */  bl        GXSetVtxAttrFmt
/* 02348C 8002648C 38600000 */  li        r3, 0x0
/* 023490 80026490 3880000B */  li        r4, 0xb
/* 023494 80026494 38A00001 */  li        r5, 0x1
/* 023498 80026498 38C00005 */  li        r6, 0x5
/* 02349C 8002649C 38E00000 */  li        r7, 0x0
/* 0234A0 800264A0 48082845 */  bl        GXSetVtxAttrFmt
/* 0234A4 800264A4 38600000 */  li        r3, 0x0
/* 0234A8 800264A8 3880000D */  li        r4, 0xd
/* 0234AC 800264AC 38A00001 */  li        r5, 0x1
/* 0234B0 800264B0 38C00004 */  li        r6, 0x4
/* 0234B4 800264B4 38E00000 */  li        r7, 0x0
/* 0234B8 800264B8 4808282D */  bl        GXSetVtxAttrFmt
/* 0234BC 800264BC 3800000F */  li        r0, 0xf
/* 0234C0 800264C0 901ED138 */  stw       r0, -0x2ec8(r30)
lbl_800264C4:
/* 0234C4 800264C4 38600080 */  li        r3, 0x80
/* 0234C8 800264C8 38800000 */  li        r4, 0x0
/* 0234CC 800264CC 38A00004 */  li        r5, 0x4
/* 0234D0 800264D0 48083A9D */  bl        GXBegin
/* 0234D4 800264D4 801F0000 */  lwz       r0, 0x0(r31)
/* 0234D8 800264D8 2C000000 */  cmpwi     r0, 0x0
/* 0234DC 800264DC 418200A0 */  beq       lbl_8002657C
/* 0234E0 800264E0 3C60CC01 */  lis       r3, 0xcc01
/* 0234E4 800264E4 D3C38000 */  stfs      f30, -0x8000(r3)
/* 0234E8 800264E8 38000000 */  li        r0, 0x0
/* 0234EC 800264EC D3A38000 */  stfs      f29, -0x8000(r3)
/* 0234F0 800264F0 D3E38000 */  stfs      f31, -0x8000(r3)
/* 0234F4 800264F4 98038000 */  stb       r0, -0x8000(r3)
/* 0234F8 800264F8 98038000 */  stb       r0, -0x8000(r3)
/* 0234FC 800264FC 98038000 */  stb       r0, -0x8000(r3)
/* 023500 80026500 98038000 */  stb       r0, -0x8000(r3)
/* 023504 80026504 D3438000 */  stfs      f26, -0x8000(r3)
/* 023508 80026508 D3238000 */  stfs      f25, -0x8000(r3)
/* 02350C 8002650C D3C38000 */  stfs      f30, -0x8000(r3)
/* 023510 80026510 D3638000 */  stfs      f27, -0x8000(r3)
/* 023514 80026514 D3E38000 */  stfs      f31, -0x8000(r3)
/* 023518 80026518 98038000 */  stb       r0, -0x8000(r3)
/* 02351C 8002651C 98038000 */  stb       r0, -0x8000(r3)
/* 023520 80026520 98038000 */  stb       r0, -0x8000(r3)
/* 023524 80026524 98038000 */  stb       r0, -0x8000(r3)
/* 023528 80026528 D3038000 */  stfs      f24, -0x8000(r3)
/* 02352C 8002652C D3238000 */  stfs      f25, -0x8000(r3)
/* 023530 80026530 D3838000 */  stfs      f28, -0x8000(r3)
/* 023534 80026534 D3638000 */  stfs      f27, -0x8000(r3)
/* 023538 80026538 D3E38000 */  stfs      f31, -0x8000(r3)
/* 02353C 8002653C 98038000 */  stb       r0, -0x8000(r3)
/* 023540 80026540 98038000 */  stb       r0, -0x8000(r3)
/* 023544 80026544 98038000 */  stb       r0, -0x8000(r3)
/* 023548 80026548 98038000 */  stb       r0, -0x8000(r3)
/* 02354C 8002654C D3038000 */  stfs      f24, -0x8000(r3)
/* 023550 80026550 D2E38000 */  stfs      f23, -0x8000(r3)
/* 023554 80026554 D3838000 */  stfs      f28, -0x8000(r3)
/* 023558 80026558 D3A38000 */  stfs      f29, -0x8000(r3)
/* 02355C 8002655C D3E38000 */  stfs      f31, -0x8000(r3)
/* 023560 80026560 98038000 */  stb       r0, -0x8000(r3)
/* 023564 80026564 98038000 */  stb       r0, -0x8000(r3)
/* 023568 80026568 98038000 */  stb       r0, -0x8000(r3)
/* 02356C 8002656C 98038000 */  stb       r0, -0x8000(r3)
/* 023570 80026570 D3438000 */  stfs      f26, -0x8000(r3)
/* 023574 80026574 D2E38000 */  stfs      f23, -0x8000(r3)
/* 023578 80026578 4800009C */  b         lbl_80026614
lbl_8002657C:
/* 02357C 8002657C 3C60CC01 */  lis       r3, 0xcc01
/* 023580 80026580 D3C38000 */  stfs      f30, -0x8000(r3)
/* 023584 80026584 38000000 */  li        r0, 0x0
/* 023588 80026588 D3A38000 */  stfs      f29, -0x8000(r3)
/* 02358C 8002658C D3E38000 */  stfs      f31, -0x8000(r3)
/* 023590 80026590 98038000 */  stb       r0, -0x8000(r3)
/* 023594 80026594 98038000 */  stb       r0, -0x8000(r3)
/* 023598 80026598 98038000 */  stb       r0, -0x8000(r3)
/* 02359C 8002659C 98038000 */  stb       r0, -0x8000(r3)
/* 0235A0 800265A0 D3438000 */  stfs      f26, -0x8000(r3)
/* 0235A4 800265A4 D3238000 */  stfs      f25, -0x8000(r3)
/* 0235A8 800265A8 D3838000 */  stfs      f28, -0x8000(r3)
/* 0235AC 800265AC D3A38000 */  stfs      f29, -0x8000(r3)
/* 0235B0 800265B0 D3E38000 */  stfs      f31, -0x8000(r3)
/* 0235B4 800265B4 98038000 */  stb       r0, -0x8000(r3)
/* 0235B8 800265B8 98038000 */  stb       r0, -0x8000(r3)
/* 0235BC 800265BC 98038000 */  stb       r0, -0x8000(r3)
/* 0235C0 800265C0 98038000 */  stb       r0, -0x8000(r3)
/* 0235C4 800265C4 D3038000 */  stfs      f24, -0x8000(r3)
/* 0235C8 800265C8 D3238000 */  stfs      f25, -0x8000(r3)
/* 0235CC 800265CC D3838000 */  stfs      f28, -0x8000(r3)
/* 0235D0 800265D0 D3638000 */  stfs      f27, -0x8000(r3)
/* 0235D4 800265D4 D3E38000 */  stfs      f31, -0x8000(r3)
/* 0235D8 800265D8 98038000 */  stb       r0, -0x8000(r3)
/* 0235DC 800265DC 98038000 */  stb       r0, -0x8000(r3)
/* 0235E0 800265E0 98038000 */  stb       r0, -0x8000(r3)
/* 0235E4 800265E4 98038000 */  stb       r0, -0x8000(r3)
/* 0235E8 800265E8 D3038000 */  stfs      f24, -0x8000(r3)
/* 0235EC 800265EC D2E38000 */  stfs      f23, -0x8000(r3)
/* 0235F0 800265F0 D3C38000 */  stfs      f30, -0x8000(r3)
/* 0235F4 800265F4 D3638000 */  stfs      f27, -0x8000(r3)
/* 0235F8 800265F8 D3E38000 */  stfs      f31, -0x8000(r3)
/* 0235FC 800265FC 98038000 */  stb       r0, -0x8000(r3)
/* 023600 80026600 98038000 */  stb       r0, -0x8000(r3)
/* 023604 80026604 98038000 */  stb       r0, -0x8000(r3)
/* 023608 80026608 98038000 */  stb       r0, -0x8000(r3)
/* 02360C 8002660C D3438000 */  stfs      f26, -0x8000(r3)
/* 023610 80026610 D2E38000 */  stfs      f23, -0x8000(r3)
lbl_80026614:
/* 023614 80026614 38600001 */  li        r3, 0x1
lbl_80026618:
/* 023618 80026618 8001008C */  lwz       r0, 0x8c(r1)
/* 02361C 8002661C CBE10080 */  lfd       f31, 0x80(r1)
/* 023620 80026620 CBC10078 */  lfd       f30, 0x78(r1)
/* 023624 80026624 7C0803A6 */  mtlr      r0
/* 023628 80026628 CBA10070 */  lfd       f29, 0x70(r1)
/* 02362C 8002662C CB810068 */  lfd       f28, 0x68(r1)
/* 023630 80026630 CB610060 */  lfd       f27, 0x60(r1)
/* 023634 80026634 CB410058 */  lfd       f26, 0x58(r1)
/* 023638 80026638 CB210050 */  lfd       f25, 0x50(r1)
/* 02363C 8002663C CB010048 */  lfd       f24, 0x48(r1)
/* 023640 80026640 CAE10040 */  lfd       f23, 0x40(r1)
/* 023644 80026644 83E1003C */  lwz       r31, 0x3c(r1)
/* 023648 80026648 83C10038 */  lwz       r30, 0x38(r1)
/* 02364C 8002664C 38210088 */  addi      r1, r1, 0x88
/* 023650 80026650 4E800020 */  blr

glabel frameDrawRectFill_Setup
/* 023654 80026654 7C0802A6 */  mflr      r0
/* 023658 80026658 90010004 */  stw       r0, 0x4(r1)
/* 02365C 8002665C 9421FFE0 */  stwu      r1, -0x20(r1)
/* 023660 80026660 93E1001C */  stw       r31, 0x1c(r1)
/* 023664 80026664 93C10018 */  stw       r30, 0x18(r1)
/* 023668 80026668 7C7E1B78 */  mr        r30, r3
/* 02366C 8002666C 7C9F2378 */  mr        r31, r4
/* 023670 80026670 7FC3F378 */  mr        r3, r30
/* 023674 80026674 480038F1 */  bl        frameDrawSetup2D
/* 023678 80026678 2C030000 */  cmpwi     r3, 0x0
/* 02367C 8002667C 4082000C */  bne       lbl_80026688
/* 023680 80026680 38600000 */  li        r3, 0x0
/* 023684 80026684 48000068 */  b         lbl_800266EC
lbl_80026688:
/* 023688 80026688 38000000 */  li        r0, 0x0
/* 02368C 8002668C 90010014 */  stw       r0, 0x14(r1)
/* 023690 80026690 7FC3F378 */  mr        r3, r30
/* 023694 80026694 38810010 */  addi      r4, r1, 0x10
/* 023698 80026698 90010010 */  stw       r0, 0x10(r1)
/* 02369C 8002669C 38A10014 */  addi      r5, r1, 0x14
/* 0236A0 800266A0 38C00001 */  li        r6, 0x1
/* 0236A4 800266A4 48002815 */  bl        frameDrawSetupDP
/* 0236A8 800266A8 2C030000 */  cmpwi     r3, 0x0
/* 0236AC 800266AC 4082000C */  bne       lbl_800266B8
/* 0236B0 800266B0 38600000 */  li        r3, 0x0
/* 0236B4 800266B4 48000038 */  b         lbl_800266EC
lbl_800266B8:
/* 0236B8 800266B8 3C608002 */  lis       r3, frameDrawRectFill@ha
/* 0236BC 800266BC 38036704 */  addi      r0, r3, frameDrawRectFill@l
/* 0236C0 800266C0 901E0134 */  stw       r0, 0x134(r30)
/* 0236C4 800266C4 7FC3F378 */  mr        r3, r30
/* 0236C8 800266C8 7FE4FB78 */  mr        r4, r31
/* 0236CC 800266CC 819E0134 */  lwz       r12, 0x134(r30)
/* 0236D0 800266D0 7D8803A6 */  mtlr      r12
/* 0236D4 800266D4 4E800021 */  blrl
/* 0236D8 800266D8 2C030000 */  cmpwi     r3, 0x0
/* 0236DC 800266DC 4082000C */  bne       lbl_800266E8
/* 0236E0 800266E0 38600000 */  li        r3, 0x0
/* 0236E4 800266E4 48000008 */  b         lbl_800266EC
lbl_800266E8:
/* 0236E8 800266E8 38600001 */  li        r3, 0x1
lbl_800266EC:
/* 0236EC 800266EC 80010024 */  lwz       r0, 0x24(r1)
/* 0236F0 800266F0 83E1001C */  lwz       r31, 0x1c(r1)
/* 0236F4 800266F4 83C10018 */  lwz       r30, 0x18(r1)
/* 0236F8 800266F8 7C0803A6 */  mtlr      r0
/* 0236FC 800266FC 38210020 */  addi      r1, r1, 0x20
/* 023700 80026700 4E800020 */  blr

glabel frameDrawRectFill
/* 023704 80026704 7C0802A6 */  mflr      r0
/* 023708 80026708 90010004 */  stw       r0, 0x4(r1)
/* 02370C 8002670C 9421FFA0 */  stwu      r1, -0x60(r1)
/* 023710 80026710 DBE10058 */  stfd      f31, 0x58(r1)
/* 023714 80026714 DBC10050 */  stfd      f30, 0x50(r1)
/* 023718 80026718 DBA10048 */  stfd      f29, 0x48(r1)
/* 02371C 8002671C DB810040 */  stfd      f28, 0x40(r1)
/* 023720 80026720 DB610038 */  stfd      f27, 0x38(r1)
/* 023724 80026724 93E10034 */  stw       r31, 0x34(r1)
/* 023728 80026728 800300A4 */  lwz       r0, 0xa4(r3)
/* 02372C 8002672C 54050296 */  rlwinm    r5, r0, 0, 10, 11
/* 023730 80026730 3C05FFD0 */  subis     r0, r5, 0x30
/* 023734 80026734 28000000 */  cmplwi    r0, 0x0
/* 023738 80026738 408200D0 */  bne       lbl_80026808
/* 02373C 8002673C 80040008 */  lwz       r0, 0x8(r4)
/* 023740 80026740 2C000010 */  cmpwi     r0, 0x10
/* 023744 80026744 418100C4 */  bgt       lbl_80026808
/* 023748 80026748 8004000C */  lwz       r0, 0xc(r4)
/* 02374C 8002674C 2C000020 */  cmpwi     r0, 0x20
/* 023750 80026750 418100B8 */  bgt       lbl_80026808
/* 023754 80026754 80040010 */  lwz       r0, 0x10(r4)
/* 023758 80026758 2C000130 */  cmpwi     r0, 0x130
/* 02375C 8002675C 418000AC */  blt       lbl_80026808
/* 023760 80026760 80040014 */  lwz       r0, 0x14(r4)
/* 023764 80026764 2C0000D0 */  cmpwi     r0, 0xd0
/* 023768 80026768 418000A0 */  blt       lbl_80026808
/* 02376C 8002676C 3CC30004 */  addis     r6, r3, 0x4
/* 023770 80026770 88E6D128 */  lbz       r7, -0x2ed8(r6)
/* 023774 80026774 39000000 */  li        r8, 0x0
/* 023778 80026778 280700FF */  cmplwi    r7, 0xff
/* 02377C 8002677C 4082002C */  bne       lbl_800267A8
/* 023780 80026780 8806D129 */  lbz       r0, -0x2ed7(r6)
/* 023784 80026784 280000FC */  cmplwi    r0, 0xfc
/* 023788 80026788 40820020 */  bne       lbl_800267A8
/* 02378C 8002678C 8806D12A */  lbz       r0, -0x2ed6(r6)
/* 023790 80026790 280000FF */  cmplwi    r0, 0xff
/* 023794 80026794 40820014 */  bne       lbl_800267A8
/* 023798 80026798 8806D12B */  lbz       r0, -0x2ed5(r6)
/* 02379C 8002679C 280000FC */  cmplwi    r0, 0xfc
/* 0237A0 800267A0 40820008 */  bne       lbl_800267A8
/* 0237A4 800267A4 39000001 */  li        r8, 0x1
lbl_800267A8:
/* 0237A8 800267A8 280700F8 */  cmplwi    r7, 0xf8
/* 0237AC 800267AC 40820030 */  bne       lbl_800267DC
/* 0237B0 800267B0 3CC30004 */  addis     r6, r3, 0x4
/* 0237B4 800267B4 8806D129 */  lbz       r0, -0x2ed7(r6)
/* 0237B8 800267B8 280000F8 */  cmplwi    r0, 0xf8
/* 0237BC 800267BC 40820020 */  bne       lbl_800267DC
/* 0237C0 800267C0 8806D12A */  lbz       r0, -0x2ed6(r6)
/* 0237C4 800267C4 280000F0 */  cmplwi    r0, 0xf0
/* 0237C8 800267C8 40820014 */  bne       lbl_800267DC
/* 0237CC 800267CC 8806D12B */  lbz       r0, -0x2ed5(r6)
/* 0237D0 800267D0 28000000 */  cmplwi    r0, 0x0
/* 0237D4 800267D4 40820008 */  bne       lbl_800267DC
/* 0237D8 800267D8 39000001 */  li        r8, 0x1
lbl_800267DC:
/* 0237DC 800267DC 2C080000 */  cmpwi     r8, 0x0
/* 0237E0 800267E0 41820028 */  beq       lbl_80026808
/* 0237E4 800267E4 8003008C */  lwz       r0, 0x8c(r3)
/* 0237E8 800267E8 540002D6 */  rlwinm    r0, r0, 0, 11, 11
/* 0237EC 800267EC 28000000 */  cmplwi    r0, 0x0
/* 0237F0 800267F0 40820018 */  bne       lbl_80026808
/* 0237F4 800267F4 8003008C */  lwz       r0, 0x8c(r3)
/* 0237F8 800267F8 64000010 */  oris      r0, r0, 0x10
/* 0237FC 800267FC 9003008C */  stw       r0, 0x8c(r3)
/* 023800 80026800 38600001 */  li        r3, 0x1
/* 023804 80026804 4800016C */  b         lbl_80026970
lbl_80026808:
/* 023808 80026808 81240008 */  lwz       r9, 0x8(r4)
/* 02380C 8002680C 3C05FFD0 */  subis     r0, r5, 0x30
/* 023810 80026810 80E40010 */  lwz       r7, 0x10(r4)
/* 023814 80026814 3D004330 */  lis       r8, 0x4330
/* 023818 80026818 80C4000C */  lwz       r6, 0xc(r4)
/* 02381C 8002681C 80840014 */  lwz       r4, 0x14(r4)
/* 023820 80026820 6D298000 */  xoris     r9, r9, 0x8000
/* 023824 80026824 6CE78000 */  xoris     r7, r7, 0x8000
/* 023828 80026828 9121002C */  stw       r9, 0x2c(r1)
/* 02382C 8002682C 6CC68000 */  xoris     r6, r6, 0x8000
/* 023830 80026830 6C848000 */  xoris     r4, r4, 0x8000
/* 023834 80026834 90E10024 */  stw       r7, 0x24(r1)
/* 023838 80026838 C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 02383C 8002683C 28000000 */  cmplwi    r0, 0x0
/* 023840 80026840 90C1001C */  stw       r6, 0x1c(r1)
/* 023844 80026844 90810014 */  stw       r4, 0x14(r1)
/* 023848 80026848 91010028 */  stw       r8, 0x28(r1)
/* 02384C 8002684C 91010020 */  stw       r8, 0x20(r1)
/* 023850 80026850 C8210028 */  lfd       f1, 0x28(r1)
/* 023854 80026854 91010018 */  stw       r8, 0x18(r1)
/* 023858 80026858 C8010020 */  lfd       f0, 0x20(r1)
/* 02385C 8002685C EFC11028 */  fsubs     f30, f1, f2
/* 023860 80026860 91010010 */  stw       r8, 0x10(r1)
/* 023864 80026864 C8210018 */  lfd       f1, 0x18(r1)
/* 023868 80026868 EF801028 */  fsubs     f28, f0, f2
/* 02386C 8002686C C8010010 */  lfd       f0, 0x10(r1)
/* 023870 80026870 EFA11028 */  fsubs     f29, f1, f2
/* 023874 80026874 EF601028 */  fsubs     f27, f0, f2
/* 023878 80026878 41820010 */  beq       lbl_80026888
/* 02387C 8002687C 3C05FFE0 */  subis     r0, r5, 0x20
/* 023880 80026880 28000000 */  cmplwi    r0, 0x0
/* 023884 80026884 40820010 */  bne       lbl_80026894
lbl_80026888:
/* 023888 80026888 C0028138 */  lfs       f0, D_8018C078@sda21(r0)
/* 02388C 8002688C EF9C002A */  fadds     f28, f28, f0
/* 023890 80026890 EF7B002A */  fadds     f27, f27, f0
lbl_80026894:
/* 023894 80026894 800300A0 */  lwz       r0, 0xa0(r3)
/* 023898 80026898 5400077A */  rlwinm    r0, r0, 0, 29, 29
/* 02389C 8002689C 28000004 */  cmplwi    r0, 0x4
/* 0238A0 800268A0 4082000C */  bne       lbl_800268AC
/* 0238A4 800268A4 C3E30124 */  lfs       f31, 0x124(r3)
/* 0238A8 800268A8 48000008 */  b         lbl_800268B0
lbl_800268AC:
/* 0238AC 800268AC C3E28100 */  lfs       f31, D_8018C040@sda21(r0)
lbl_800268B0:
/* 0238B0 800268B0 3FE30004 */  addis     r31, r3, 0x4
/* 0238B4 800268B4 801FD138 */  lwz       r0, -0x2ec8(r31)
/* 0238B8 800268B8 2800000B */  cmplwi    r0, 0xb
/* 0238BC 800268BC 41820058 */  beq       lbl_80026914
/* 0238C0 800268C0 480823ED */  bl        GXClearVtxDesc
/* 0238C4 800268C4 38600009 */  li        r3, 0x9
/* 0238C8 800268C8 38800001 */  li        r4, 0x1
/* 0238CC 800268CC 48081F19 */  bl        GXSetVtxDesc
/* 0238D0 800268D0 3860000B */  li        r3, 0xb
/* 0238D4 800268D4 38800001 */  li        r4, 0x1
/* 0238D8 800268D8 48081F0D */  bl        GXSetVtxDesc
/* 0238DC 800268DC 38600000 */  li        r3, 0x0
/* 0238E0 800268E0 38800009 */  li        r4, 0x9
/* 0238E4 800268E4 38A00001 */  li        r5, 0x1
/* 0238E8 800268E8 38C00004 */  li        r6, 0x4
/* 0238EC 800268EC 38E00000 */  li        r7, 0x0
/* 0238F0 800268F0 480823F5 */  bl        GXSetVtxAttrFmt
/* 0238F4 800268F4 38600000 */  li        r3, 0x0
/* 0238F8 800268F8 3880000B */  li        r4, 0xb
/* 0238FC 800268FC 38A00001 */  li        r5, 0x1
/* 023900 80026900 38C00005 */  li        r6, 0x5
/* 023904 80026904 38E00000 */  li        r7, 0x0
/* 023908 80026908 480823DD */  bl        GXSetVtxAttrFmt
/* 02390C 8002690C 3800000B */  li        r0, 0xb
/* 023910 80026910 901FD138 */  stw       r0, -0x2ec8(r31)
lbl_80026914:
/* 023914 80026914 38600080 */  li        r3, 0x80
/* 023918 80026918 38800000 */  li        r4, 0x0
/* 02391C 8002691C 38A00004 */  li        r5, 0x4
/* 023920 80026920 4808364D */  bl        GXBegin
/* 023924 80026924 3C80CC01 */  lis       r4, 0xcc01
/* 023928 80026928 D3C48000 */  stfs      f30, -0x8000(r4)
/* 02392C 8002692C 38000000 */  li        r0, 0x0
/* 023930 80026930 38600001 */  li        r3, 0x1
/* 023934 80026934 D3A48000 */  stfs      f29, -0x8000(r4)
/* 023938 80026938 D3E48000 */  stfs      f31, -0x8000(r4)
/* 02393C 8002693C 90048000 */  stw       r0, -0x8000(r4)
/* 023940 80026940 D3848000 */  stfs      f28, -0x8000(r4)
/* 023944 80026944 D3A48000 */  stfs      f29, -0x8000(r4)
/* 023948 80026948 D3E48000 */  stfs      f31, -0x8000(r4)
/* 02394C 8002694C 90048000 */  stw       r0, -0x8000(r4)
/* 023950 80026950 D3848000 */  stfs      f28, -0x8000(r4)
/* 023954 80026954 D3648000 */  stfs      f27, -0x8000(r4)
/* 023958 80026958 D3E48000 */  stfs      f31, -0x8000(r4)
/* 02395C 8002695C 90048000 */  stw       r0, -0x8000(r4)
/* 023960 80026960 D3C48000 */  stfs      f30, -0x8000(r4)
/* 023964 80026964 D3648000 */  stfs      f27, -0x8000(r4)
/* 023968 80026968 D3E48000 */  stfs      f31, -0x8000(r4)
/* 02396C 8002696C 90048000 */  stw       r0, -0x8000(r4)
lbl_80026970:
/* 023970 80026970 80010064 */  lwz       r0, 0x64(r1)
/* 023974 80026974 CBE10058 */  lfd       f31, 0x58(r1)
/* 023978 80026978 CBC10050 */  lfd       f30, 0x50(r1)
/* 02397C 8002697C 7C0803A6 */  mtlr      r0
/* 023980 80026980 CBA10048 */  lfd       f29, 0x48(r1)
/* 023984 80026984 CB810040 */  lfd       f28, 0x40(r1)
/* 023988 80026988 CB610038 */  lfd       f27, 0x38(r1)
/* 02398C 8002698C 83E10034 */  lwz       r31, 0x34(r1)
/* 023990 80026990 38210060 */  addi      r1, r1, 0x60
/* 023994 80026994 4E800020 */  blr

glabel frameDrawLine_Setup
/* 023998 80026998 7C0802A6 */  mflr      r0
/* 02399C 8002699C 90010004 */  stw       r0, 0x4(r1)
/* 0239A0 800269A0 9421FFE0 */  stwu      r1, -0x20(r1)
/* 0239A4 800269A4 93E1001C */  stw       r31, 0x1c(r1)
/* 0239A8 800269A8 93C10018 */  stw       r30, 0x18(r1)
/* 0239AC 800269AC 7C7E1B78 */  mr        r30, r3
/* 0239B0 800269B0 7C9F2378 */  mr        r31, r4
/* 0239B4 800269B4 7FC3F378 */  mr        r3, r30
/* 0239B8 800269B8 38810010 */  addi      r4, r1, 0x10
/* 0239BC 800269BC 38A10014 */  addi      r5, r1, 0x14
/* 0239C0 800269C0 38C00002 */  li        r6, 0x2
/* 0239C4 800269C4 48002BED */  bl        frameDrawSetupSP
/* 0239C8 800269C8 2C030000 */  cmpwi     r3, 0x0
/* 0239CC 800269CC 4082000C */  bne       lbl_800269D8
/* 0239D0 800269D0 38600000 */  li        r3, 0x0
/* 0239D4 800269D4 48000088 */  b         lbl_80026A5C
lbl_800269D8:
/* 0239D8 800269D8 7FC3F378 */  mr        r3, r30
/* 0239DC 800269DC 38810010 */  addi      r4, r1, 0x10
/* 0239E0 800269E0 38A10014 */  addi      r5, r1, 0x14
/* 0239E4 800269E4 38C00000 */  li        r6, 0x0
/* 0239E8 800269E8 480024D1 */  bl        frameDrawSetupDP
/* 0239EC 800269EC 2C030000 */  cmpwi     r3, 0x0
/* 0239F0 800269F0 4082000C */  bne       lbl_800269FC
/* 0239F4 800269F4 38600000 */  li        r3, 0x0
/* 0239F8 800269F8 48000064 */  b         lbl_80026A5C
lbl_800269FC:
/* 0239FC 800269FC 80010014 */  lwz       r0, 0x14(r1)
/* 023A00 80026A00 2C000000 */  cmpwi     r0, 0x0
/* 023A04 80026A04 4182000C */  beq       lbl_80026A10
/* 023A08 80026A08 38A00003 */  li        r5, 0x3
/* 023A0C 80026A0C 48000008 */  b         lbl_80026A14
lbl_80026A10:
/* 023A10 80026A10 38A00000 */  li        r5, 0x0
lbl_80026A14:
/* 023A14 80026A14 80810010 */  lwz       r4, 0x10(r1)
/* 023A18 80026A18 3C60800F */  lis       r3, D_800EBE6C@ha
/* 023A1C 80026A1C 3803BE6C */  addi      r0, r3, D_800EBE6C@l
/* 023A20 80026A20 7C642A14 */  add       r3, r4, r5
/* 023A24 80026A24 5463103A */  slwi      r3, r3, 2
/* 023A28 80026A28 7C601A14 */  add       r3, r0, r3
/* 023A2C 80026A2C 80030000 */  lwz       r0, 0x0(r3)
/* 023A30 80026A30 7FC3F378 */  mr        r3, r30
/* 023A34 80026A34 7FE4FB78 */  mr        r4, r31
/* 023A38 80026A38 901E012C */  stw       r0, 0x12c(r30)
/* 023A3C 80026A3C 819E012C */  lwz       r12, 0x12c(r30)
/* 023A40 80026A40 7D8803A6 */  mtlr      r12
/* 023A44 80026A44 4E800021 */  blrl
/* 023A48 80026A48 2C030000 */  cmpwi     r3, 0x0
/* 023A4C 80026A4C 4082000C */  bne       lbl_80026A58
/* 023A50 80026A50 38600000 */  li        r3, 0x0
/* 023A54 80026A54 48000008 */  b         lbl_80026A5C
lbl_80026A58:
/* 023A58 80026A58 38600001 */  li        r3, 0x1
lbl_80026A5C:
/* 023A5C 80026A5C 80010024 */  lwz       r0, 0x24(r1)
/* 023A60 80026A60 83E1001C */  lwz       r31, 0x1c(r1)
/* 023A64 80026A64 83C10018 */  lwz       r30, 0x18(r1)
/* 023A68 80026A68 7C0803A6 */  mtlr      r0
/* 023A6C 80026A6C 38210020 */  addi      r1, r1, 0x20
/* 023A70 80026A70 4E800020 */  blr

glabel frameDrawLine_C2T2
/* 023A74 80026A74 7C0802A6 */  mflr      r0
/* 023A78 80026A78 90010004 */  stw       r0, 0x4(r1)
/* 023A7C 80026A7C 9421FFC0 */  stwu      r1, -0x40(r1)
/* 023A80 80026A80 93E1003C */  stw       r31, 0x3c(r1)
/* 023A84 80026A84 93C10038 */  stw       r30, 0x38(r1)
/* 023A88 80026A88 93A10034 */  stw       r29, 0x34(r1)
/* 023A8C 80026A8C 93810030 */  stw       r28, 0x30(r1)
/* 023A90 80026A90 7C7D1B78 */  mr        r29, r3
/* 023A94 80026A94 7C9E2378 */  mr        r30, r4
/* 023A98 80026A98 807D0120 */  lwz       r3, 0x120(r29)
/* 023A9C 80026A9C 3BFE0004 */  addi      r31, r30, 0x4
/* 023AA0 80026AA0 881E0006 */  lbz       r0, 0x6(r30)
/* 023AA4 80026AA4 7C030000 */  cmpw      r3, r0
/* 023AA8 80026AA8 41820038 */  beq       lbl_80026AE0
/* 023AAC 80026AAC 881F0002 */  lbz       r0, 0x2(r31)
/* 023AB0 80026AB0 38800000 */  li        r4, 0x0
/* 023AB4 80026AB4 901D0120 */  stw       r0, 0x120(r29)
/* 023AB8 80026AB8 C03D0080 */  lfs       f1, 0x80(r29)
/* 023ABC 80026ABC C0028130 */  lfs       f0, D_8018C070@sda21(r0)
/* 023AC0 80026AC0 881F0002 */  lbz       r0, 0x2(r31)
/* 023AC4 80026AC4 EC010032 */  fmuls     f0, f1, f0
/* 023AC8 80026AC8 1C000003 */  mulli     r0, r0, 0x3
/* 023ACC 80026ACC FC00001E */  fctiwz    f0, f0
/* 023AD0 80026AD0 D8010028 */  stfd      f0, 0x28(r1)
/* 023AD4 80026AD4 8061002C */  lwz       r3, 0x2c(r1)
/* 023AD8 80026AD8 7C6301D6 */  mullw     r3, r3, r0
/* 023ADC 80026ADC 48083609 */  bl        GXSetLineWidth
lbl_80026AE0:
/* 023AE0 80026AE0 3F9D0004 */  addis     r28, r29, 0x4
/* 023AE4 80026AE4 801CD138 */  lwz       r0, -0x2ec8(r28)
/* 023AE8 80026AE8 28000027 */  cmplwi    r0, 0x27
/* 023AEC 80026AEC 4182007C */  beq       lbl_80026B68
/* 023AF0 80026AF0 480821BD */  bl        GXClearVtxDesc
/* 023AF4 80026AF4 38600009 */  li        r3, 0x9
/* 023AF8 80026AF8 38800001 */  li        r4, 0x1
/* 023AFC 80026AFC 48081CE9 */  bl        GXSetVtxDesc
/* 023B00 80026B00 3860000B */  li        r3, 0xb
/* 023B04 80026B04 38800001 */  li        r4, 0x1
/* 023B08 80026B08 48081CDD */  bl        GXSetVtxDesc
/* 023B0C 80026B0C 3860000D */  li        r3, 0xd
/* 023B10 80026B10 38800001 */  li        r4, 0x1
/* 023B14 80026B14 48081CD1 */  bl        GXSetVtxDesc
/* 023B18 80026B18 38600000 */  li        r3, 0x0
/* 023B1C 80026B1C 38800009 */  li        r4, 0x9
/* 023B20 80026B20 38A00001 */  li        r5, 0x1
/* 023B24 80026B24 38C00004 */  li        r6, 0x4
/* 023B28 80026B28 38E00000 */  li        r7, 0x0
/* 023B2C 80026B2C 480821B9 */  bl        GXSetVtxAttrFmt
/* 023B30 80026B30 38600000 */  li        r3, 0x0
/* 023B34 80026B34 3880000B */  li        r4, 0xb
/* 023B38 80026B38 38A00001 */  li        r5, 0x1
/* 023B3C 80026B3C 38C00005 */  li        r6, 0x5
/* 023B40 80026B40 38E00000 */  li        r7, 0x0
/* 023B44 80026B44 480821A1 */  bl        GXSetVtxAttrFmt
/* 023B48 80026B48 38600000 */  li        r3, 0x0
/* 023B4C 80026B4C 3880000D */  li        r4, 0xd
/* 023B50 80026B50 38A00001 */  li        r5, 0x1
/* 023B54 80026B54 38C00004 */  li        r6, 0x4
/* 023B58 80026B58 38E00000 */  li        r7, 0x0
/* 023B5C 80026B5C 48082189 */  bl        GXSetVtxAttrFmt
/* 023B60 80026B60 38000027 */  li        r0, 0x27
/* 023B64 80026B64 901CD138 */  stw       r0, -0x2ec8(r28)
lbl_80026B68:
/* 023B68 80026B68 801E0000 */  lwz       r0, 0x0(r30)
/* 023B6C 80026B6C 3C605555 */  lis       r3, 0x5555
/* 023B70 80026B70 38635556 */  addi      r3, r3, 0x5556
/* 023B74 80026B74 5400083C */  slwi      r0, r0, 1
/* 023B78 80026B78 7C630096 */  mulhw     r3, r3, r0
/* 023B7C 80026B7C 54600FFE */  srwi      r0, r3, 31
/* 023B80 80026B80 7C030214 */  add       r0, r3, r0
/* 023B84 80026B84 5405043E */  clrlwi    r5, r0, 16
/* 023B88 80026B88 386000A8 */  li        r3, 0xa8
/* 023B8C 80026B8C 38800000 */  li        r4, 0x0
/* 023B90 80026B90 480833DD */  bl        GXBegin
/* 023B94 80026B94 39000000 */  li        r8, 0x0
/* 023B98 80026B98 48000004 */  b         lbl_80026B9C
lbl_80026B9C:
/* 023B9C 80026B9C 3C80CC01 */  lis       r4, 0xcc01
/* 023BA0 80026BA0 48000004 */  b         lbl_80026BA4
lbl_80026BA4:
/* 023BA4 80026BA4 480000BC */  b         lbl_80026C60
lbl_80026BA8:
/* 023BA8 80026BA8 7CFF4214 */  add       r7, r31, r8
/* 023BAC 80026BAC 88070000 */  lbz       r0, 0x0(r7)
/* 023BB0 80026BB0 39080003 */  addi      r8, r8, 0x3
/* 023BB4 80026BB4 1C60001C */  mulli     r3, r0, 0x1c
/* 023BB8 80026BB8 39230358 */  addi      r9, r3, 0x358
/* 023BBC 80026BBC 7D3D4A14 */  add       r9, r29, r9
/* 023BC0 80026BC0 C0490014 */  lfs       f2, 0x14(r9)
/* 023BC4 80026BC4 C0290010 */  lfs       f1, 0x10(r9)
/* 023BC8 80026BC8 C009000C */  lfs       f0, 0xc(r9)
/* 023BCC 80026BCC D0048000 */  stfs      f0, -0x8000(r4)
/* 023BD0 80026BD0 D0248000 */  stfs      f1, -0x8000(r4)
/* 023BD4 80026BD4 D0448000 */  stfs      f2, -0x8000(r4)
/* 023BD8 80026BD8 88C9001B */  lbz       r6, 0x1b(r9)
/* 023BDC 80026BDC 88A9001A */  lbz       r5, 0x1a(r9)
/* 023BE0 80026BE0 88690019 */  lbz       r3, 0x19(r9)
/* 023BE4 80026BE4 88090018 */  lbz       r0, 0x18(r9)
/* 023BE8 80026BE8 98048000 */  stb       r0, -0x8000(r4)
/* 023BEC 80026BEC 98648000 */  stb       r3, -0x8000(r4)
/* 023BF0 80026BF0 98A48000 */  stb       r5, -0x8000(r4)
/* 023BF4 80026BF4 98C48000 */  stb       r6, -0x8000(r4)
/* 023BF8 80026BF8 C0290008 */  lfs       f1, 0x8(r9)
/* 023BFC 80026BFC C0090004 */  lfs       f0, 0x4(r9)
/* 023C00 80026C00 D0048000 */  stfs      f0, -0x8000(r4)
/* 023C04 80026C04 D0248000 */  stfs      f1, -0x8000(r4)
/* 023C08 80026C08 88070001 */  lbz       r0, 0x1(r7)
/* 023C0C 80026C0C 1C60001C */  mulli     r3, r0, 0x1c
/* 023C10 80026C10 38E30358 */  addi      r7, r3, 0x358
/* 023C14 80026C14 7CFD3A14 */  add       r7, r29, r7
/* 023C18 80026C18 C0470014 */  lfs       f2, 0x14(r7)
/* 023C1C 80026C1C C0270010 */  lfs       f1, 0x10(r7)
/* 023C20 80026C20 C007000C */  lfs       f0, 0xc(r7)
/* 023C24 80026C24 D0048000 */  stfs      f0, -0x8000(r4)
/* 023C28 80026C28 D0248000 */  stfs      f1, -0x8000(r4)
/* 023C2C 80026C2C D0448000 */  stfs      f2, -0x8000(r4)
/* 023C30 80026C30 88C7001B */  lbz       r6, 0x1b(r7)
/* 023C34 80026C34 88A7001A */  lbz       r5, 0x1a(r7)
/* 023C38 80026C38 88670019 */  lbz       r3, 0x19(r7)
/* 023C3C 80026C3C 88070018 */  lbz       r0, 0x18(r7)
/* 023C40 80026C40 98048000 */  stb       r0, -0x8000(r4)
/* 023C44 80026C44 98648000 */  stb       r3, -0x8000(r4)
/* 023C48 80026C48 98A48000 */  stb       r5, -0x8000(r4)
/* 023C4C 80026C4C 98C48000 */  stb       r6, -0x8000(r4)
/* 023C50 80026C50 C0270008 */  lfs       f1, 0x8(r7)
/* 023C54 80026C54 C0070004 */  lfs       f0, 0x4(r7)
/* 023C58 80026C58 D0048000 */  stfs      f0, -0x8000(r4)
/* 023C5C 80026C5C D0248000 */  stfs      f1, -0x8000(r4)
lbl_80026C60:
/* 023C60 80026C60 801E0000 */  lwz       r0, 0x0(r30)
/* 023C64 80026C64 7C080000 */  cmpw      r8, r0
/* 023C68 80026C68 4180FF40 */  blt       lbl_80026BA8
/* 023C6C 80026C6C 38600001 */  li        r3, 0x1
/* 023C70 80026C70 80010044 */  lwz       r0, 0x44(r1)
/* 023C74 80026C74 83E1003C */  lwz       r31, 0x3c(r1)
/* 023C78 80026C78 83C10038 */  lwz       r30, 0x38(r1)
/* 023C7C 80026C7C 7C0803A6 */  mtlr      r0
/* 023C80 80026C80 83A10034 */  lwz       r29, 0x34(r1)
/* 023C84 80026C84 83810030 */  lwz       r28, 0x30(r1)
/* 023C88 80026C88 38210040 */  addi      r1, r1, 0x40
/* 023C8C 80026C8C 4E800020 */  blr

glabel frameDrawLine_C1T2
/* 023C90 80026C90 7C0802A6 */  mflr      r0
/* 023C94 80026C94 90010004 */  stw       r0, 0x4(r1)
/* 023C98 80026C98 9421FFC0 */  stwu      r1, -0x40(r1)
/* 023C9C 80026C9C 93E1003C */  stw       r31, 0x3c(r1)
/* 023CA0 80026CA0 93C10038 */  stw       r30, 0x38(r1)
/* 023CA4 80026CA4 93A10034 */  stw       r29, 0x34(r1)
/* 023CA8 80026CA8 93810030 */  stw       r28, 0x30(r1)
/* 023CAC 80026CAC 7C7D1B78 */  mr        r29, r3
/* 023CB0 80026CB0 7C9E2378 */  mr        r30, r4
/* 023CB4 80026CB4 807D0120 */  lwz       r3, 0x120(r29)
/* 023CB8 80026CB8 3BFE0004 */  addi      r31, r30, 0x4
/* 023CBC 80026CBC 881E0006 */  lbz       r0, 0x6(r30)
/* 023CC0 80026CC0 7C030000 */  cmpw      r3, r0
/* 023CC4 80026CC4 41820038 */  beq       lbl_80026CFC
/* 023CC8 80026CC8 881F0002 */  lbz       r0, 0x2(r31)
/* 023CCC 80026CCC 38800000 */  li        r4, 0x0
/* 023CD0 80026CD0 901D0120 */  stw       r0, 0x120(r29)
/* 023CD4 80026CD4 C03D0080 */  lfs       f1, 0x80(r29)
/* 023CD8 80026CD8 C0028130 */  lfs       f0, D_8018C070@sda21(r0)
/* 023CDC 80026CDC 881F0002 */  lbz       r0, 0x2(r31)
/* 023CE0 80026CE0 EC010032 */  fmuls     f0, f1, f0
/* 023CE4 80026CE4 1C000003 */  mulli     r0, r0, 0x3
/* 023CE8 80026CE8 FC00001E */  fctiwz    f0, f0
/* 023CEC 80026CEC D8010028 */  stfd      f0, 0x28(r1)
/* 023CF0 80026CF0 8061002C */  lwz       r3, 0x2c(r1)
/* 023CF4 80026CF4 7C6301D6 */  mullw     r3, r3, r0
/* 023CF8 80026CF8 480833ED */  bl        GXSetLineWidth
lbl_80026CFC:
/* 023CFC 80026CFC 3F9D0004 */  addis     r28, r29, 0x4
/* 023D00 80026D00 801CD138 */  lwz       r0, -0x2ec8(r28)
/* 023D04 80026D04 28000027 */  cmplwi    r0, 0x27
/* 023D08 80026D08 4182007C */  beq       lbl_80026D84
/* 023D0C 80026D0C 48081FA1 */  bl        GXClearVtxDesc
/* 023D10 80026D10 38600009 */  li        r3, 0x9
/* 023D14 80026D14 38800001 */  li        r4, 0x1
/* 023D18 80026D18 48081ACD */  bl        GXSetVtxDesc
/* 023D1C 80026D1C 3860000B */  li        r3, 0xb
/* 023D20 80026D20 38800001 */  li        r4, 0x1
/* 023D24 80026D24 48081AC1 */  bl        GXSetVtxDesc
/* 023D28 80026D28 3860000D */  li        r3, 0xd
/* 023D2C 80026D2C 38800001 */  li        r4, 0x1
/* 023D30 80026D30 48081AB5 */  bl        GXSetVtxDesc
/* 023D34 80026D34 38600000 */  li        r3, 0x0
/* 023D38 80026D38 38800009 */  li        r4, 0x9
/* 023D3C 80026D3C 38A00001 */  li        r5, 0x1
/* 023D40 80026D40 38C00004 */  li        r6, 0x4
/* 023D44 80026D44 38E00000 */  li        r7, 0x0
/* 023D48 80026D48 48081F9D */  bl        GXSetVtxAttrFmt
/* 023D4C 80026D4C 38600000 */  li        r3, 0x0
/* 023D50 80026D50 3880000B */  li        r4, 0xb
/* 023D54 80026D54 38A00001 */  li        r5, 0x1
/* 023D58 80026D58 38C00005 */  li        r6, 0x5
/* 023D5C 80026D5C 38E00000 */  li        r7, 0x0
/* 023D60 80026D60 48081F85 */  bl        GXSetVtxAttrFmt
/* 023D64 80026D64 38600000 */  li        r3, 0x0
/* 023D68 80026D68 3880000D */  li        r4, 0xd
/* 023D6C 80026D6C 38A00001 */  li        r5, 0x1
/* 023D70 80026D70 38C00004 */  li        r6, 0x4
/* 023D74 80026D74 38E00000 */  li        r7, 0x0
/* 023D78 80026D78 48081F6D */  bl        GXSetVtxAttrFmt
/* 023D7C 80026D7C 38000027 */  li        r0, 0x27
/* 023D80 80026D80 901CD138 */  stw       r0, -0x2ec8(r28)
lbl_80026D84:
/* 023D84 80026D84 801E0000 */  lwz       r0, 0x0(r30)
/* 023D88 80026D88 3C605555 */  lis       r3, 0x5555
/* 023D8C 80026D8C 38635556 */  addi      r3, r3, 0x5556
/* 023D90 80026D90 5400083C */  slwi      r0, r0, 1
/* 023D94 80026D94 7C630096 */  mulhw     r3, r3, r0
/* 023D98 80026D98 54600FFE */  srwi      r0, r3, 31
/* 023D9C 80026D9C 7C030214 */  add       r0, r3, r0
/* 023DA0 80026DA0 5405043E */  clrlwi    r5, r0, 16
/* 023DA4 80026DA4 386000A8 */  li        r3, 0xa8
/* 023DA8 80026DA8 38800000 */  li        r4, 0x0
/* 023DAC 80026DAC 480831C1 */  bl        GXBegin
/* 023DB0 80026DB0 39400000 */  li        r10, 0x0
/* 023DB4 80026DB4 48000004 */  b         lbl_80026DB8
lbl_80026DB8:
/* 023DB8 80026DB8 3CA0CC01 */  lis       r5, 0xcc01
/* 023DBC 80026DBC 48000004 */  b         lbl_80026DC0
lbl_80026DC0:
/* 023DC0 80026DC0 480000AC */  b         lbl_80026E6C
lbl_80026DC4:
/* 023DC4 80026DC4 7D3F5214 */  add       r9, r31, r10
/* 023DC8 80026DC8 88090000 */  lbz       r0, 0x0(r9)
/* 023DCC 80026DCC 394A0003 */  addi      r10, r10, 0x3
/* 023DD0 80026DD0 1C60001C */  mulli     r3, r0, 0x1c
/* 023DD4 80026DD4 38630358 */  addi      r3, r3, 0x358
/* 023DD8 80026DD8 7C7D1A14 */  add       r3, r29, r3
/* 023DDC 80026DDC C0430014 */  lfs       f2, 0x14(r3)
/* 023DE0 80026DE0 C0230010 */  lfs       f1, 0x10(r3)
/* 023DE4 80026DE4 C003000C */  lfs       f0, 0xc(r3)
/* 023DE8 80026DE8 D0058000 */  stfs      f0, -0x8000(r5)
/* 023DEC 80026DEC D0258000 */  stfs      f1, -0x8000(r5)
/* 023DF0 80026DF0 D0458000 */  stfs      f2, -0x8000(r5)
/* 023DF4 80026DF4 8903001B */  lbz       r8, 0x1b(r3)
/* 023DF8 80026DF8 88E3001A */  lbz       r7, 0x1a(r3)
/* 023DFC 80026DFC 88C30019 */  lbz       r6, 0x19(r3)
/* 023E00 80026E00 88830018 */  lbz       r4, 0x18(r3)
/* 023E04 80026E04 98858000 */  stb       r4, -0x8000(r5)
/* 023E08 80026E08 98C58000 */  stb       r6, -0x8000(r5)
/* 023E0C 80026E0C 98E58000 */  stb       r7, -0x8000(r5)
/* 023E10 80026E10 99058000 */  stb       r8, -0x8000(r5)
/* 023E14 80026E14 C0230008 */  lfs       f1, 0x8(r3)
/* 023E18 80026E18 C0030004 */  lfs       f0, 0x4(r3)
/* 023E1C 80026E1C D0058000 */  stfs      f0, -0x8000(r5)
/* 023E20 80026E20 D0258000 */  stfs      f1, -0x8000(r5)
/* 023E24 80026E24 88090001 */  lbz       r0, 0x1(r9)
/* 023E28 80026E28 1C60001C */  mulli     r3, r0, 0x1c
/* 023E2C 80026E2C 38630358 */  addi      r3, r3, 0x358
/* 023E30 80026E30 7C7D1A14 */  add       r3, r29, r3
/* 023E34 80026E34 C0430014 */  lfs       f2, 0x14(r3)
/* 023E38 80026E38 C0230010 */  lfs       f1, 0x10(r3)
/* 023E3C 80026E3C C003000C */  lfs       f0, 0xc(r3)
/* 023E40 80026E40 D0058000 */  stfs      f0, -0x8000(r5)
/* 023E44 80026E44 D0258000 */  stfs      f1, -0x8000(r5)
/* 023E48 80026E48 D0458000 */  stfs      f2, -0x8000(r5)
/* 023E4C 80026E4C 98858000 */  stb       r4, -0x8000(r5)
/* 023E50 80026E50 98C58000 */  stb       r6, -0x8000(r5)
/* 023E54 80026E54 98E58000 */  stb       r7, -0x8000(r5)
/* 023E58 80026E58 99058000 */  stb       r8, -0x8000(r5)
/* 023E5C 80026E5C C0230008 */  lfs       f1, 0x8(r3)
/* 023E60 80026E60 C0030004 */  lfs       f0, 0x4(r3)
/* 023E64 80026E64 D0058000 */  stfs      f0, -0x8000(r5)
/* 023E68 80026E68 D0258000 */  stfs      f1, -0x8000(r5)
lbl_80026E6C:
/* 023E6C 80026E6C 801E0000 */  lwz       r0, 0x0(r30)
/* 023E70 80026E70 7C0A0000 */  cmpw      r10, r0
/* 023E74 80026E74 4180FF50 */  blt       lbl_80026DC4
/* 023E78 80026E78 38600001 */  li        r3, 0x1
/* 023E7C 80026E7C 80010044 */  lwz       r0, 0x44(r1)
/* 023E80 80026E80 83E1003C */  lwz       r31, 0x3c(r1)
/* 023E84 80026E84 83C10038 */  lwz       r30, 0x38(r1)
/* 023E88 80026E88 7C0803A6 */  mtlr      r0
/* 023E8C 80026E8C 83A10034 */  lwz       r29, 0x34(r1)
/* 023E90 80026E90 83810030 */  lwz       r28, 0x30(r1)
/* 023E94 80026E94 38210040 */  addi      r1, r1, 0x40
/* 023E98 80026E98 4E800020 */  blr

glabel frameDrawLine_C0T2
/* 023E9C 80026E9C 7C0802A6 */  mflr      r0
/* 023EA0 80026EA0 90010004 */  stw       r0, 0x4(r1)
/* 023EA4 80026EA4 9421FFC8 */  stwu      r1, -0x38(r1)
/* 023EA8 80026EA8 93E10034 */  stw       r31, 0x34(r1)
/* 023EAC 80026EAC 93C10030 */  stw       r30, 0x30(r1)
/* 023EB0 80026EB0 93A1002C */  stw       r29, 0x2c(r1)
/* 023EB4 80026EB4 93810028 */  stw       r28, 0x28(r1)
/* 023EB8 80026EB8 7C7D1B78 */  mr        r29, r3
/* 023EBC 80026EBC 7C9E2378 */  mr        r30, r4
/* 023EC0 80026EC0 807D0120 */  lwz       r3, 0x120(r29)
/* 023EC4 80026EC4 3BFE0004 */  addi      r31, r30, 0x4
/* 023EC8 80026EC8 881E0006 */  lbz       r0, 0x6(r30)
/* 023ECC 80026ECC 7C030000 */  cmpw      r3, r0
/* 023ED0 80026ED0 41820038 */  beq       lbl_80026F08
/* 023ED4 80026ED4 881F0002 */  lbz       r0, 0x2(r31)
/* 023ED8 80026ED8 38800000 */  li        r4, 0x0
/* 023EDC 80026EDC 901D0120 */  stw       r0, 0x120(r29)
/* 023EE0 80026EE0 C03D0080 */  lfs       f1, 0x80(r29)
/* 023EE4 80026EE4 C0028130 */  lfs       f0, D_8018C070@sda21(r0)
/* 023EE8 80026EE8 881F0002 */  lbz       r0, 0x2(r31)
/* 023EEC 80026EEC EC010032 */  fmuls     f0, f1, f0
/* 023EF0 80026EF0 1C000003 */  mulli     r0, r0, 0x3
/* 023EF4 80026EF4 FC00001E */  fctiwz    f0, f0
/* 023EF8 80026EF8 D8010020 */  stfd      f0, 0x20(r1)
/* 023EFC 80026EFC 80610024 */  lwz       r3, 0x24(r1)
/* 023F00 80026F00 7C6301D6 */  mullw     r3, r3, r0
/* 023F04 80026F04 480831E1 */  bl        GXSetLineWidth
lbl_80026F08:
/* 023F08 80026F08 3F9D0004 */  addis     r28, r29, 0x4
/* 023F0C 80026F0C 801CD138 */  lwz       r0, -0x2ec8(r28)
/* 023F10 80026F10 28000025 */  cmplwi    r0, 0x25
/* 023F14 80026F14 41820058 */  beq       lbl_80026F6C
/* 023F18 80026F18 48081D95 */  bl        GXClearVtxDesc
/* 023F1C 80026F1C 38600009 */  li        r3, 0x9
/* 023F20 80026F20 38800001 */  li        r4, 0x1
/* 023F24 80026F24 480818C1 */  bl        GXSetVtxDesc
/* 023F28 80026F28 3860000D */  li        r3, 0xd
/* 023F2C 80026F2C 38800001 */  li        r4, 0x1
/* 023F30 80026F30 480818B5 */  bl        GXSetVtxDesc
/* 023F34 80026F34 38600000 */  li        r3, 0x0
/* 023F38 80026F38 38800009 */  li        r4, 0x9
/* 023F3C 80026F3C 38A00001 */  li        r5, 0x1
/* 023F40 80026F40 38C00004 */  li        r6, 0x4
/* 023F44 80026F44 38E00000 */  li        r7, 0x0
/* 023F48 80026F48 48081D9D */  bl        GXSetVtxAttrFmt
/* 023F4C 80026F4C 38600000 */  li        r3, 0x0
/* 023F50 80026F50 3880000D */  li        r4, 0xd
/* 023F54 80026F54 38A00001 */  li        r5, 0x1
/* 023F58 80026F58 38C00004 */  li        r6, 0x4
/* 023F5C 80026F5C 38E00000 */  li        r7, 0x0
/* 023F60 80026F60 48081D85 */  bl        GXSetVtxAttrFmt
/* 023F64 80026F64 38000025 */  li        r0, 0x25
/* 023F68 80026F68 901CD138 */  stw       r0, -0x2ec8(r28)
lbl_80026F6C:
/* 023F6C 80026F6C 801E0000 */  lwz       r0, 0x0(r30)
/* 023F70 80026F70 3C605555 */  lis       r3, 0x5555
/* 023F74 80026F74 38635556 */  addi      r3, r3, 0x5556
/* 023F78 80026F78 5400083C */  slwi      r0, r0, 1
/* 023F7C 80026F7C 7C630096 */  mulhw     r3, r3, r0
/* 023F80 80026F80 54600FFE */  srwi      r0, r3, 31
/* 023F84 80026F84 7C030214 */  add       r0, r3, r0
/* 023F88 80026F88 5405043E */  clrlwi    r5, r0, 16
/* 023F8C 80026F8C 386000A8 */  li        r3, 0xa8
/* 023F90 80026F90 38800000 */  li        r4, 0x0
/* 023F94 80026F94 48082FD9 */  bl        GXBegin
/* 023F98 80026F98 38C00000 */  li        r6, 0x0
/* 023F9C 80026F9C 48000004 */  b         lbl_80026FA0
lbl_80026FA0:
/* 023FA0 80026FA0 3C80CC01 */  lis       r4, 0xcc01
/* 023FA4 80026FA4 48000004 */  b         lbl_80026FA8
lbl_80026FA8:
/* 023FA8 80026FA8 4800007C */  b         lbl_80027024
lbl_80026FAC:
/* 023FAC 80026FAC 7CBF3214 */  add       r5, r31, r6
/* 023FB0 80026FB0 88050000 */  lbz       r0, 0x0(r5)
/* 023FB4 80026FB4 38C60003 */  addi      r6, r6, 0x3
/* 023FB8 80026FB8 1C60001C */  mulli     r3, r0, 0x1c
/* 023FBC 80026FBC 38630358 */  addi      r3, r3, 0x358
/* 023FC0 80026FC0 7C7D1A14 */  add       r3, r29, r3
/* 023FC4 80026FC4 C0430014 */  lfs       f2, 0x14(r3)
/* 023FC8 80026FC8 C0230010 */  lfs       f1, 0x10(r3)
/* 023FCC 80026FCC C003000C */  lfs       f0, 0xc(r3)
/* 023FD0 80026FD0 D0048000 */  stfs      f0, -0x8000(r4)
/* 023FD4 80026FD4 D0248000 */  stfs      f1, -0x8000(r4)
/* 023FD8 80026FD8 D0448000 */  stfs      f2, -0x8000(r4)
/* 023FDC 80026FDC C0230008 */  lfs       f1, 0x8(r3)
/* 023FE0 80026FE0 C0030004 */  lfs       f0, 0x4(r3)
/* 023FE4 80026FE4 D0048000 */  stfs      f0, -0x8000(r4)
/* 023FE8 80026FE8 D0248000 */  stfs      f1, -0x8000(r4)
/* 023FEC 80026FEC 88050001 */  lbz       r0, 0x1(r5)
/* 023FF0 80026FF0 1C60001C */  mulli     r3, r0, 0x1c
/* 023FF4 80026FF4 38630358 */  addi      r3, r3, 0x358
/* 023FF8 80026FF8 7C7D1A14 */  add       r3, r29, r3
/* 023FFC 80026FFC C0430014 */  lfs       f2, 0x14(r3)
/* 024000 80027000 C0230010 */  lfs       f1, 0x10(r3)
/* 024004 80027004 C003000C */  lfs       f0, 0xc(r3)
/* 024008 80027008 D0048000 */  stfs      f0, -0x8000(r4)
/* 02400C 8002700C D0248000 */  stfs      f1, -0x8000(r4)
/* 024010 80027010 D0448000 */  stfs      f2, -0x8000(r4)
/* 024014 80027014 C0230008 */  lfs       f1, 0x8(r3)
/* 024018 80027018 C0030004 */  lfs       f0, 0x4(r3)
/* 02401C 8002701C D0048000 */  stfs      f0, -0x8000(r4)
/* 024020 80027020 D0248000 */  stfs      f1, -0x8000(r4)
lbl_80027024:
/* 024024 80027024 801E0000 */  lwz       r0, 0x0(r30)
/* 024028 80027028 7C060000 */  cmpw      r6, r0
/* 02402C 8002702C 4180FF80 */  blt       lbl_80026FAC
/* 024030 80027030 38600001 */  li        r3, 0x1
/* 024034 80027034 8001003C */  lwz       r0, 0x3c(r1)
/* 024038 80027038 83E10034 */  lwz       r31, 0x34(r1)
/* 02403C 8002703C 83C10030 */  lwz       r30, 0x30(r1)
/* 024040 80027040 7C0803A6 */  mtlr      r0
/* 024044 80027044 83A1002C */  lwz       r29, 0x2c(r1)
/* 024048 80027048 83810028 */  lwz       r28, 0x28(r1)
/* 02404C 8002704C 38210038 */  addi      r1, r1, 0x38
/* 024050 80027050 4E800020 */  blr

glabel frameDrawLine_C2T0
/* 024054 80027054 7C0802A6 */  mflr      r0
/* 024058 80027058 90010004 */  stw       r0, 0x4(r1)
/* 02405C 8002705C 9421FFC8 */  stwu      r1, -0x38(r1)
/* 024060 80027060 93E10034 */  stw       r31, 0x34(r1)
/* 024064 80027064 93C10030 */  stw       r30, 0x30(r1)
/* 024068 80027068 93A1002C */  stw       r29, 0x2c(r1)
/* 02406C 8002706C 93810028 */  stw       r28, 0x28(r1)
/* 024070 80027070 7C7D1B78 */  mr        r29, r3
/* 024074 80027074 7C9E2378 */  mr        r30, r4
/* 024078 80027078 807D0120 */  lwz       r3, 0x120(r29)
/* 02407C 8002707C 3BFE0004 */  addi      r31, r30, 0x4
/* 024080 80027080 881E0006 */  lbz       r0, 0x6(r30)
/* 024084 80027084 7C030000 */  cmpw      r3, r0
/* 024088 80027088 41820038 */  beq       lbl_800270C0
/* 02408C 8002708C 881F0002 */  lbz       r0, 0x2(r31)
/* 024090 80027090 38800000 */  li        r4, 0x0
/* 024094 80027094 901D0120 */  stw       r0, 0x120(r29)
/* 024098 80027098 C03D0080 */  lfs       f1, 0x80(r29)
/* 02409C 8002709C C0028130 */  lfs       f0, D_8018C070@sda21(r0)
/* 0240A0 800270A0 881F0002 */  lbz       r0, 0x2(r31)
/* 0240A4 800270A4 EC010032 */  fmuls     f0, f1, f0
/* 0240A8 800270A8 1C000003 */  mulli     r0, r0, 0x3
/* 0240AC 800270AC FC00001E */  fctiwz    f0, f0
/* 0240B0 800270B0 D8010020 */  stfd      f0, 0x20(r1)
/* 0240B4 800270B4 80610024 */  lwz       r3, 0x24(r1)
/* 0240B8 800270B8 7C6301D6 */  mullw     r3, r3, r0
/* 0240BC 800270BC 48083029 */  bl        GXSetLineWidth
lbl_800270C0:
/* 0240C0 800270C0 3F9D0004 */  addis     r28, r29, 0x4
/* 0240C4 800270C4 801CD138 */  lwz       r0, -0x2ec8(r28)
/* 0240C8 800270C8 28000023 */  cmplwi    r0, 0x23
/* 0240CC 800270CC 41820058 */  beq       lbl_80027124
/* 0240D0 800270D0 48081BDD */  bl        GXClearVtxDesc
/* 0240D4 800270D4 38600009 */  li        r3, 0x9
/* 0240D8 800270D8 38800001 */  li        r4, 0x1
/* 0240DC 800270DC 48081709 */  bl        GXSetVtxDesc
/* 0240E0 800270E0 3860000B */  li        r3, 0xb
/* 0240E4 800270E4 38800001 */  li        r4, 0x1
/* 0240E8 800270E8 480816FD */  bl        GXSetVtxDesc
/* 0240EC 800270EC 38600000 */  li        r3, 0x0
/* 0240F0 800270F0 38800009 */  li        r4, 0x9
/* 0240F4 800270F4 38A00001 */  li        r5, 0x1
/* 0240F8 800270F8 38C00004 */  li        r6, 0x4
/* 0240FC 800270FC 38E00000 */  li        r7, 0x0
/* 024100 80027100 48081BE5 */  bl        GXSetVtxAttrFmt
/* 024104 80027104 38600000 */  li        r3, 0x0
/* 024108 80027108 3880000B */  li        r4, 0xb
/* 02410C 8002710C 38A00001 */  li        r5, 0x1
/* 024110 80027110 38C00005 */  li        r6, 0x5
/* 024114 80027114 38E00000 */  li        r7, 0x0
/* 024118 80027118 48081BCD */  bl        GXSetVtxAttrFmt
/* 02411C 8002711C 38000023 */  li        r0, 0x23
/* 024120 80027120 901CD138 */  stw       r0, -0x2ec8(r28)
lbl_80027124:
/* 024124 80027124 801E0000 */  lwz       r0, 0x0(r30)
/* 024128 80027128 3C605555 */  lis       r3, 0x5555
/* 02412C 8002712C 38635556 */  addi      r3, r3, 0x5556
/* 024130 80027130 5400083C */  slwi      r0, r0, 1
/* 024134 80027134 7C630096 */  mulhw     r3, r3, r0
/* 024138 80027138 54600FFE */  srwi      r0, r3, 31
/* 02413C 8002713C 7C030214 */  add       r0, r3, r0
/* 024140 80027140 5405043E */  clrlwi    r5, r0, 16
/* 024144 80027144 386000A8 */  li        r3, 0xa8
/* 024148 80027148 38800000 */  li        r4, 0x0
/* 02414C 8002714C 48082E21 */  bl        GXBegin
/* 024150 80027150 39000000 */  li        r8, 0x0
/* 024154 80027154 48000004 */  b         lbl_80027158
lbl_80027158:
/* 024158 80027158 3C80CC01 */  lis       r4, 0xcc01
/* 02415C 8002715C 48000004 */  b         lbl_80027160
lbl_80027160:
/* 024160 80027160 4800009C */  b         lbl_800271FC
lbl_80027164:
/* 024164 80027164 7CFF4214 */  add       r7, r31, r8
/* 024168 80027168 88070000 */  lbz       r0, 0x0(r7)
/* 02416C 8002716C 39080003 */  addi      r8, r8, 0x3
/* 024170 80027170 1C60001C */  mulli     r3, r0, 0x1c
/* 024174 80027174 39230358 */  addi      r9, r3, 0x358
/* 024178 80027178 7D3D4A14 */  add       r9, r29, r9
/* 02417C 8002717C C0490014 */  lfs       f2, 0x14(r9)
/* 024180 80027180 C0290010 */  lfs       f1, 0x10(r9)
/* 024184 80027184 C009000C */  lfs       f0, 0xc(r9)
/* 024188 80027188 D0048000 */  stfs      f0, -0x8000(r4)
/* 02418C 8002718C D0248000 */  stfs      f1, -0x8000(r4)
/* 024190 80027190 D0448000 */  stfs      f2, -0x8000(r4)
/* 024194 80027194 88C9001B */  lbz       r6, 0x1b(r9)
/* 024198 80027198 88A9001A */  lbz       r5, 0x1a(r9)
/* 02419C 8002719C 88690019 */  lbz       r3, 0x19(r9)
/* 0241A0 800271A0 88090018 */  lbz       r0, 0x18(r9)
/* 0241A4 800271A4 98048000 */  stb       r0, -0x8000(r4)
/* 0241A8 800271A8 98648000 */  stb       r3, -0x8000(r4)
/* 0241AC 800271AC 98A48000 */  stb       r5, -0x8000(r4)
/* 0241B0 800271B0 98C48000 */  stb       r6, -0x8000(r4)
/* 0241B4 800271B4 88070001 */  lbz       r0, 0x1(r7)
/* 0241B8 800271B8 1C60001C */  mulli     r3, r0, 0x1c
/* 0241BC 800271BC 38E30358 */  addi      r7, r3, 0x358
/* 0241C0 800271C0 7CFD3A14 */  add       r7, r29, r7
/* 0241C4 800271C4 C0470014 */  lfs       f2, 0x14(r7)
/* 0241C8 800271C8 C0270010 */  lfs       f1, 0x10(r7)
/* 0241CC 800271CC C007000C */  lfs       f0, 0xc(r7)
/* 0241D0 800271D0 D0048000 */  stfs      f0, -0x8000(r4)
/* 0241D4 800271D4 D0248000 */  stfs      f1, -0x8000(r4)
/* 0241D8 800271D8 D0448000 */  stfs      f2, -0x8000(r4)
/* 0241DC 800271DC 88C7001B */  lbz       r6, 0x1b(r7)
/* 0241E0 800271E0 88A7001A */  lbz       r5, 0x1a(r7)
/* 0241E4 800271E4 88670019 */  lbz       r3, 0x19(r7)
/* 0241E8 800271E8 88070018 */  lbz       r0, 0x18(r7)
/* 0241EC 800271EC 98048000 */  stb       r0, -0x8000(r4)
/* 0241F0 800271F0 98648000 */  stb       r3, -0x8000(r4)
/* 0241F4 800271F4 98A48000 */  stb       r5, -0x8000(r4)
/* 0241F8 800271F8 98C48000 */  stb       r6, -0x8000(r4)
lbl_800271FC:
/* 0241FC 800271FC 801E0000 */  lwz       r0, 0x0(r30)
/* 024200 80027200 7C080000 */  cmpw      r8, r0
/* 024204 80027204 4180FF60 */  blt       lbl_80027164
/* 024208 80027208 38600001 */  li        r3, 0x1
/* 02420C 8002720C 8001003C */  lwz       r0, 0x3c(r1)
/* 024210 80027210 83E10034 */  lwz       r31, 0x34(r1)
/* 024214 80027214 83C10030 */  lwz       r30, 0x30(r1)
/* 024218 80027218 7C0803A6 */  mtlr      r0
/* 02421C 8002721C 83A1002C */  lwz       r29, 0x2c(r1)
/* 024220 80027220 83810028 */  lwz       r28, 0x28(r1)
/* 024224 80027224 38210038 */  addi      r1, r1, 0x38
/* 024228 80027228 4E800020 */  blr

glabel frameDrawLine_C1T0
/* 02422C 8002722C 7C0802A6 */  mflr      r0
/* 024230 80027230 90010004 */  stw       r0, 0x4(r1)
/* 024234 80027234 9421FFC8 */  stwu      r1, -0x38(r1)
/* 024238 80027238 93E10034 */  stw       r31, 0x34(r1)
/* 02423C 8002723C 93C10030 */  stw       r30, 0x30(r1)
/* 024240 80027240 93A1002C */  stw       r29, 0x2c(r1)
/* 024244 80027244 93810028 */  stw       r28, 0x28(r1)
/* 024248 80027248 7C7D1B78 */  mr        r29, r3
/* 02424C 8002724C 7C9E2378 */  mr        r30, r4
/* 024250 80027250 807D0120 */  lwz       r3, 0x120(r29)
/* 024254 80027254 3BFE0004 */  addi      r31, r30, 0x4
/* 024258 80027258 881E0006 */  lbz       r0, 0x6(r30)
/* 02425C 8002725C 7C030000 */  cmpw      r3, r0
/* 024260 80027260 41820038 */  beq       lbl_80027298
/* 024264 80027264 881F0002 */  lbz       r0, 0x2(r31)
/* 024268 80027268 38800000 */  li        r4, 0x0
/* 02426C 8002726C 901D0120 */  stw       r0, 0x120(r29)
/* 024270 80027270 C03D0080 */  lfs       f1, 0x80(r29)
/* 024274 80027274 C0028130 */  lfs       f0, D_8018C070@sda21(r0)
/* 024278 80027278 881F0002 */  lbz       r0, 0x2(r31)
/* 02427C 8002727C EC010032 */  fmuls     f0, f1, f0
/* 024280 80027280 1C000003 */  mulli     r0, r0, 0x3
/* 024284 80027284 FC00001E */  fctiwz    f0, f0
/* 024288 80027288 D8010020 */  stfd      f0, 0x20(r1)
/* 02428C 8002728C 80610024 */  lwz       r3, 0x24(r1)
/* 024290 80027290 7C6301D6 */  mullw     r3, r3, r0
/* 024294 80027294 48082E51 */  bl        GXSetLineWidth
lbl_80027298:
/* 024298 80027298 3F9D0004 */  addis     r28, r29, 0x4
/* 02429C 8002729C 801CD138 */  lwz       r0, -0x2ec8(r28)
/* 0242A0 800272A0 28000023 */  cmplwi    r0, 0x23
/* 0242A4 800272A4 41820058 */  beq       lbl_800272FC
/* 0242A8 800272A8 48081A05 */  bl        GXClearVtxDesc
/* 0242AC 800272AC 38600009 */  li        r3, 0x9
/* 0242B0 800272B0 38800001 */  li        r4, 0x1
/* 0242B4 800272B4 48081531 */  bl        GXSetVtxDesc
/* 0242B8 800272B8 3860000B */  li        r3, 0xb
/* 0242BC 800272BC 38800001 */  li        r4, 0x1
/* 0242C0 800272C0 48081525 */  bl        GXSetVtxDesc
/* 0242C4 800272C4 38600000 */  li        r3, 0x0
/* 0242C8 800272C8 38800009 */  li        r4, 0x9
/* 0242CC 800272CC 38A00001 */  li        r5, 0x1
/* 0242D0 800272D0 38C00004 */  li        r6, 0x4
/* 0242D4 800272D4 38E00000 */  li        r7, 0x0
/* 0242D8 800272D8 48081A0D */  bl        GXSetVtxAttrFmt
/* 0242DC 800272DC 38600000 */  li        r3, 0x0
/* 0242E0 800272E0 3880000B */  li        r4, 0xb
/* 0242E4 800272E4 38A00001 */  li        r5, 0x1
/* 0242E8 800272E8 38C00005 */  li        r6, 0x5
/* 0242EC 800272EC 38E00000 */  li        r7, 0x0
/* 0242F0 800272F0 480819F5 */  bl        GXSetVtxAttrFmt
/* 0242F4 800272F4 38000023 */  li        r0, 0x23
/* 0242F8 800272F8 901CD138 */  stw       r0, -0x2ec8(r28)
lbl_800272FC:
/* 0242FC 800272FC 801E0000 */  lwz       r0, 0x0(r30)
/* 024300 80027300 3C605555 */  lis       r3, 0x5555
/* 024304 80027304 38635556 */  addi      r3, r3, 0x5556
/* 024308 80027308 5400083C */  slwi      r0, r0, 1
/* 02430C 8002730C 7C630096 */  mulhw     r3, r3, r0
/* 024310 80027310 54600FFE */  srwi      r0, r3, 31
/* 024314 80027314 7C030214 */  add       r0, r3, r0
/* 024318 80027318 5405043E */  clrlwi    r5, r0, 16
/* 02431C 8002731C 386000A8 */  li        r3, 0xa8
/* 024320 80027320 38800000 */  li        r4, 0x0
/* 024324 80027324 48082C49 */  bl        GXBegin
/* 024328 80027328 39400000 */  li        r10, 0x0
/* 02432C 8002732C 48000004 */  b         lbl_80027330
lbl_80027330:
/* 024330 80027330 3CA0CC01 */  lis       r5, 0xcc01
/* 024334 80027334 48000004 */  b         lbl_80027338
lbl_80027338:
/* 024338 80027338 4800008C */  b         lbl_800273C4
lbl_8002733C:
/* 02433C 8002733C 7D3F5214 */  add       r9, r31, r10
/* 024340 80027340 88090000 */  lbz       r0, 0x0(r9)
/* 024344 80027344 394A0003 */  addi      r10, r10, 0x3
/* 024348 80027348 1C60001C */  mulli     r3, r0, 0x1c
/* 02434C 8002734C 38630358 */  addi      r3, r3, 0x358
/* 024350 80027350 7C7D1A14 */  add       r3, r29, r3
/* 024354 80027354 C0430014 */  lfs       f2, 0x14(r3)
/* 024358 80027358 C0230010 */  lfs       f1, 0x10(r3)
/* 02435C 8002735C C003000C */  lfs       f0, 0xc(r3)
/* 024360 80027360 D0058000 */  stfs      f0, -0x8000(r5)
/* 024364 80027364 D0258000 */  stfs      f1, -0x8000(r5)
/* 024368 80027368 D0458000 */  stfs      f2, -0x8000(r5)
/* 02436C 8002736C 8903001B */  lbz       r8, 0x1b(r3)
/* 024370 80027370 88E3001A */  lbz       r7, 0x1a(r3)
/* 024374 80027374 88C30019 */  lbz       r6, 0x19(r3)
/* 024378 80027378 88830018 */  lbz       r4, 0x18(r3)
/* 02437C 8002737C 98858000 */  stb       r4, -0x8000(r5)
/* 024380 80027380 98C58000 */  stb       r6, -0x8000(r5)
/* 024384 80027384 98E58000 */  stb       r7, -0x8000(r5)
/* 024388 80027388 99058000 */  stb       r8, -0x8000(r5)
/* 02438C 8002738C 88090001 */  lbz       r0, 0x1(r9)
/* 024390 80027390 1C60001C */  mulli     r3, r0, 0x1c
/* 024394 80027394 38630358 */  addi      r3, r3, 0x358
/* 024398 80027398 7C7D1A14 */  add       r3, r29, r3
/* 02439C 8002739C C0430014 */  lfs       f2, 0x14(r3)
/* 0243A0 800273A0 C0230010 */  lfs       f1, 0x10(r3)
/* 0243A4 800273A4 C003000C */  lfs       f0, 0xc(r3)
/* 0243A8 800273A8 D0058000 */  stfs      f0, -0x8000(r5)
/* 0243AC 800273AC D0258000 */  stfs      f1, -0x8000(r5)
/* 0243B0 800273B0 D0458000 */  stfs      f2, -0x8000(r5)
/* 0243B4 800273B4 98858000 */  stb       r4, -0x8000(r5)
/* 0243B8 800273B8 98C58000 */  stb       r6, -0x8000(r5)
/* 0243BC 800273BC 98E58000 */  stb       r7, -0x8000(r5)
/* 0243C0 800273C0 99058000 */  stb       r8, -0x8000(r5)
lbl_800273C4:
/* 0243C4 800273C4 801E0000 */  lwz       r0, 0x0(r30)
/* 0243C8 800273C8 7C0A0000 */  cmpw      r10, r0
/* 0243CC 800273CC 4180FF70 */  blt       lbl_8002733C
/* 0243D0 800273D0 38600001 */  li        r3, 0x1
/* 0243D4 800273D4 8001003C */  lwz       r0, 0x3c(r1)
/* 0243D8 800273D8 83E10034 */  lwz       r31, 0x34(r1)
/* 0243DC 800273DC 83C10030 */  lwz       r30, 0x30(r1)
/* 0243E0 800273E0 7C0803A6 */  mtlr      r0
/* 0243E4 800273E4 83A1002C */  lwz       r29, 0x2c(r1)
/* 0243E8 800273E8 83810028 */  lwz       r28, 0x28(r1)
/* 0243EC 800273EC 38210038 */  addi      r1, r1, 0x38
/* 0243F0 800273F0 4E800020 */  blr

glabel frameDrawLine_C0T0
/* 0243F4 800273F4 7C0802A6 */  mflr      r0
/* 0243F8 800273F8 90010004 */  stw       r0, 0x4(r1)
/* 0243FC 800273FC 9421FFD0 */  stwu      r1, -0x30(r1)
/* 024400 80027400 93E1002C */  stw       r31, 0x2c(r1)
/* 024404 80027404 93C10028 */  stw       r30, 0x28(r1)
/* 024408 80027408 93A10024 */  stw       r29, 0x24(r1)
/* 02440C 8002740C 93810020 */  stw       r28, 0x20(r1)
/* 024410 80027410 7C7D1B78 */  mr        r29, r3
/* 024414 80027414 7C9E2378 */  mr        r30, r4
/* 024418 80027418 807D0120 */  lwz       r3, 0x120(r29)
/* 02441C 8002741C 3BFE0004 */  addi      r31, r30, 0x4
/* 024420 80027420 881E0006 */  lbz       r0, 0x6(r30)
/* 024424 80027424 7C030000 */  cmpw      r3, r0
/* 024428 80027428 41820038 */  beq       lbl_80027460
/* 02442C 8002742C 881F0002 */  lbz       r0, 0x2(r31)
/* 024430 80027430 38800000 */  li        r4, 0x0
/* 024434 80027434 901D0120 */  stw       r0, 0x120(r29)
/* 024438 80027438 C03D0080 */  lfs       f1, 0x80(r29)
/* 02443C 8002743C C0028130 */  lfs       f0, D_8018C070@sda21(r0)
/* 024440 80027440 881F0002 */  lbz       r0, 0x2(r31)
/* 024444 80027444 EC010032 */  fmuls     f0, f1, f0
/* 024448 80027448 1C000003 */  mulli     r0, r0, 0x3
/* 02444C 8002744C FC00001E */  fctiwz    f0, f0
/* 024450 80027450 D8010018 */  stfd      f0, 0x18(r1)
/* 024454 80027454 8061001C */  lwz       r3, 0x1c(r1)
/* 024458 80027458 7C6301D6 */  mullw     r3, r3, r0
/* 02445C 8002745C 48082C89 */  bl        GXSetLineWidth
lbl_80027460:
/* 024460 80027460 3F9D0004 */  addis     r28, r29, 0x4
/* 024464 80027464 801CD138 */  lwz       r0, -0x2ec8(r28)
/* 024468 80027468 28000021 */  cmplwi    r0, 0x21
/* 02446C 8002746C 41820034 */  beq       lbl_800274A0
/* 024470 80027470 4808183D */  bl        GXClearVtxDesc
/* 024474 80027474 38600009 */  li        r3, 0x9
/* 024478 80027478 38800001 */  li        r4, 0x1
/* 02447C 8002747C 48081369 */  bl        GXSetVtxDesc
/* 024480 80027480 38600000 */  li        r3, 0x0
/* 024484 80027484 38800009 */  li        r4, 0x9
/* 024488 80027488 38A00001 */  li        r5, 0x1
/* 02448C 8002748C 38C00004 */  li        r6, 0x4
/* 024490 80027490 38E00000 */  li        r7, 0x0
/* 024494 80027494 48081851 */  bl        GXSetVtxAttrFmt
/* 024498 80027498 38000021 */  li        r0, 0x21
/* 02449C 8002749C 901CD138 */  stw       r0, -0x2ec8(r28)
lbl_800274A0:
/* 0244A0 800274A0 801E0000 */  lwz       r0, 0x0(r30)
/* 0244A4 800274A4 3C605555 */  lis       r3, 0x5555
/* 0244A8 800274A8 38635556 */  addi      r3, r3, 0x5556
/* 0244AC 800274AC 5400083C */  slwi      r0, r0, 1
/* 0244B0 800274B0 7C630096 */  mulhw     r3, r3, r0
/* 0244B4 800274B4 54600FFE */  srwi      r0, r3, 31
/* 0244B8 800274B8 7C030214 */  add       r0, r3, r0
/* 0244BC 800274BC 5405043E */  clrlwi    r5, r0, 16
/* 0244C0 800274C0 386000A8 */  li        r3, 0xa8
/* 0244C4 800274C4 38800000 */  li        r4, 0x0
/* 0244C8 800274C8 48082AA5 */  bl        GXBegin
/* 0244CC 800274CC 38C00000 */  li        r6, 0x0
/* 0244D0 800274D0 48000004 */  b         lbl_800274D4
lbl_800274D4:
/* 0244D4 800274D4 3C80CC01 */  lis       r4, 0xcc01
/* 0244D8 800274D8 48000004 */  b         lbl_800274DC
lbl_800274DC:
/* 0244DC 800274DC 4800005C */  b         lbl_80027538
lbl_800274E0:
/* 0244E0 800274E0 7CBF3214 */  add       r5, r31, r6
/* 0244E4 800274E4 88050000 */  lbz       r0, 0x0(r5)
/* 0244E8 800274E8 38C60003 */  addi      r6, r6, 0x3
/* 0244EC 800274EC 1C60001C */  mulli     r3, r0, 0x1c
/* 0244F0 800274F0 38630358 */  addi      r3, r3, 0x358
/* 0244F4 800274F4 7C7D1A14 */  add       r3, r29, r3
/* 0244F8 800274F8 C0430014 */  lfs       f2, 0x14(r3)
/* 0244FC 800274FC C0230010 */  lfs       f1, 0x10(r3)
/* 024500 80027500 C003000C */  lfs       f0, 0xc(r3)
/* 024504 80027504 D0048000 */  stfs      f0, -0x8000(r4)
/* 024508 80027508 D0248000 */  stfs      f1, -0x8000(r4)
/* 02450C 8002750C D0448000 */  stfs      f2, -0x8000(r4)
/* 024510 80027510 88050001 */  lbz       r0, 0x1(r5)
/* 024514 80027514 1C60001C */  mulli     r3, r0, 0x1c
/* 024518 80027518 38630358 */  addi      r3, r3, 0x358
/* 02451C 8002751C 7C7D1A14 */  add       r3, r29, r3
/* 024520 80027520 C0430014 */  lfs       f2, 0x14(r3)
/* 024524 80027524 C0230010 */  lfs       f1, 0x10(r3)
/* 024528 80027528 C003000C */  lfs       f0, 0xc(r3)
/* 02452C 8002752C D0048000 */  stfs      f0, -0x8000(r4)
/* 024530 80027530 D0248000 */  stfs      f1, -0x8000(r4)
/* 024534 80027534 D0448000 */  stfs      f2, -0x8000(r4)
lbl_80027538:
/* 024538 80027538 801E0000 */  lwz       r0, 0x0(r30)
/* 02453C 8002753C 7C060000 */  cmpw      r6, r0
/* 024540 80027540 4180FFA0 */  blt       lbl_800274E0
/* 024544 80027544 38600001 */  li        r3, 0x1
/* 024548 80027548 80010034 */  lwz       r0, 0x34(r1)
/* 02454C 8002754C 83E1002C */  lwz       r31, 0x2c(r1)
/* 024550 80027550 83C10028 */  lwz       r30, 0x28(r1)
/* 024554 80027554 7C0803A6 */  mtlr      r0
/* 024558 80027558 83A10024 */  lwz       r29, 0x24(r1)
/* 02455C 8002755C 83810020 */  lwz       r28, 0x20(r1)
/* 024560 80027560 38210030 */  addi      r1, r1, 0x30
/* 024564 80027564 4E800020 */  blr

glabel frameDrawTriangle_Setup
/* 024568 80027568 7C0802A6 */  mflr      r0
/* 02456C 8002756C 90010004 */  stw       r0, 0x4(r1)
/* 024570 80027570 9421FFE0 */  stwu      r1, -0x20(r1)
/* 024574 80027574 93E1001C */  stw       r31, 0x1c(r1)
/* 024578 80027578 93C10018 */  stw       r30, 0x18(r1)
/* 02457C 8002757C 7C7E1B78 */  mr        r30, r3
/* 024580 80027580 7C9F2378 */  mr        r31, r4
/* 024584 80027584 7FC3F378 */  mr        r3, r30
/* 024588 80027588 38810010 */  addi      r4, r1, 0x10
/* 02458C 8002758C 38A10014 */  addi      r5, r1, 0x14
/* 024590 80027590 38C00003 */  li        r6, 0x3
/* 024594 80027594 4800201D */  bl        frameDrawSetupSP
/* 024598 80027598 2C030000 */  cmpwi     r3, 0x0
/* 02459C 8002759C 4082000C */  bne       lbl_800275A8
/* 0245A0 800275A0 38600000 */  li        r3, 0x0
/* 0245A4 800275A4 48000088 */  b         lbl_8002762C
lbl_800275A8:
/* 0245A8 800275A8 7FC3F378 */  mr        r3, r30
/* 0245AC 800275AC 38810010 */  addi      r4, r1, 0x10
/* 0245B0 800275B0 38A10014 */  addi      r5, r1, 0x14
/* 0245B4 800275B4 38C00000 */  li        r6, 0x0
/* 0245B8 800275B8 48001901 */  bl        frameDrawSetupDP
/* 0245BC 800275BC 2C030000 */  cmpwi     r3, 0x0
/* 0245C0 800275C0 4082000C */  bne       lbl_800275CC
/* 0245C4 800275C4 38600000 */  li        r3, 0x0
/* 0245C8 800275C8 48000064 */  b         lbl_8002762C
lbl_800275CC:
/* 0245CC 800275CC 80010014 */  lwz       r0, 0x14(r1)
/* 0245D0 800275D0 2C000000 */  cmpwi     r0, 0x0
/* 0245D4 800275D4 4182000C */  beq       lbl_800275E0
/* 0245D8 800275D8 38A00004 */  li        r5, 0x4
/* 0245DC 800275DC 48000008 */  b         lbl_800275E4
lbl_800275E0:
/* 0245E0 800275E0 38A00000 */  li        r5, 0x0
lbl_800275E4:
/* 0245E4 800275E4 80810010 */  lwz       r4, 0x10(r1)
/* 0245E8 800275E8 3C60800F */  lis       r3, D_800EBE4C@ha
/* 0245EC 800275EC 3803BE4C */  addi      r0, r3, D_800EBE4C@l
/* 0245F0 800275F0 7C642A14 */  add       r3, r4, r5
/* 0245F4 800275F4 5463103A */  slwi      r3, r3, 2
/* 0245F8 800275F8 7C601A14 */  add       r3, r0, r3
/* 0245FC 800275FC 80030000 */  lwz       r0, 0x0(r3)
/* 024600 80027600 7FC3F378 */  mr        r3, r30
/* 024604 80027604 7FE4FB78 */  mr        r4, r31
/* 024608 80027608 901E0130 */  stw       r0, 0x130(r30)
/* 02460C 8002760C 819E0130 */  lwz       r12, 0x130(r30)
/* 024610 80027610 7D8803A6 */  mtlr      r12
/* 024614 80027614 4E800021 */  blrl
/* 024618 80027618 2C030000 */  cmpwi     r3, 0x0
/* 02461C 8002761C 4082000C */  bne       lbl_80027628
/* 024620 80027620 38600000 */  li        r3, 0x0
/* 024624 80027624 48000008 */  b         lbl_8002762C
lbl_80027628:
/* 024628 80027628 38600001 */  li        r3, 0x1
lbl_8002762C:
/* 02462C 8002762C 80010024 */  lwz       r0, 0x24(r1)
/* 024630 80027630 83E1001C */  lwz       r31, 0x1c(r1)
/* 024634 80027634 83C10018 */  lwz       r30, 0x18(r1)
/* 024638 80027638 7C0803A6 */  mtlr      r0
/* 02463C 8002763C 38210020 */  addi      r1, r1, 0x20
/* 024640 80027640 4E800020 */  blr

glabel frameDrawTriangle_C3T3
/* 024644 80027644 7C0802A6 */  mflr      r0
/* 024648 80027648 90010004 */  stw       r0, 0x4(r1)
/* 02464C 8002764C 9421FF88 */  stwu      r1, -0x78(r1)
/* 024650 80027650 93E10074 */  stw       r31, 0x74(r1)
/* 024654 80027654 93C10070 */  stw       r30, 0x70(r1)
/* 024658 80027658 93A1006C */  stw       r29, 0x6c(r1)
/* 02465C 8002765C 7C7D1B78 */  mr        r29, r3
/* 024660 80027660 7C9E2378 */  mr        r30, r4
/* 024664 80027664 806D8914 */  lwz       r3, gpSystem@sda21(r0)
/* 024668 80027668 80030020 */  lwz       r0, 0x20(r3)
/* 02466C 8002766C 2C000004 */  cmpwi     r0, 0x4
/* 024670 80027670 408200C4 */  bne       lbl_80027734
/* 024674 80027674 801E0000 */  lwz       r0, 0x0(r30)
/* 024678 80027678 2C000003 */  cmpwi     r0, 0x3
/* 02467C 8002767C 408200B8 */  bne       lbl_80027734
/* 024680 80027680 801D00A0 */  lwz       r0, 0xa0(r29)
/* 024684 80027684 5400052A */  rlwinm    r0, r0, 0, 20, 21
/* 024688 80027688 28000C00 */  cmplwi    r0, 0xc00
/* 02468C 8002768C 408200A8 */  bne       lbl_80027734
/* 024690 80027690 881E0004 */  lbz       r0, 0x4(r30)
/* 024694 80027694 3C7D0004 */  addis     r3, r29, 0x4
/* 024698 80027698 8083C4CC */  lwz       r4, -0x3b34(r3)
/* 02469C 8002769C 1C60001C */  mulli     r3, r0, 0x1c
/* 0246A0 800276A0 C02281B4 */  lfs       f1, D_8018C0F4@sda21(r0)
/* 0246A4 800276A4 38030358 */  addi      r0, r3, 0x358
/* 0246A8 800276A8 7C1D042E */  lfsx      f0, r29, r0
/* 0246AC 800276AC 54833032 */  slwi      r3, r4, 6
/* 0246B0 800276B0 3C630004 */  addis     r3, r3, 0x4
/* 0246B4 800276B4 FC010000 */  fcmpu     cr0, f1, f0
/* 0246B8 800276B8 3863C520 */  subi      r3, r3, 0x3ae0
/* 0246BC 800276BC 7C7D1A14 */  add       r3, r29, r3
/* 0246C0 800276C0 40820024 */  bne       lbl_800276E4
/* 0246C4 800276C4 C02281B8 */  lfs       f1, D_8018C0F8@sda21(r0)
/* 0246C8 800276C8 C0030030 */  lfs       f0, 0x30(r3)
/* 0246CC 800276CC FC010000 */  fcmpu     cr0, f1, f0
/* 0246D0 800276D0 40820014 */  bne       lbl_800276E4
/* 0246D4 800276D4 C02281BC */  lfs       f1, D_8018C0FC@sda21(r0)
/* 0246D8 800276D8 C0030038 */  lfs       f0, 0x38(r3)
/* 0246DC 800276DC FC010000 */  fcmpu     cr0, f1, f0
/* 0246E0 800276E0 41820024 */  beq       lbl_80027704
lbl_800276E4:
/* 0246E4 800276E4 C02281C0 */  lfs       f1, D_8018C100@sda21(r0)
/* 0246E8 800276E8 C0030030 */  lfs       f0, 0x30(r3)
/* 0246EC 800276EC FC010000 */  fcmpu     cr0, f1, f0
/* 0246F0 800276F0 40820044 */  bne       lbl_80027734
/* 0246F4 800276F4 C02281C4 */  lfs       f1, D_8018C104@sda21(r0)
/* 0246F8 800276F8 C0030038 */  lfs       f0, 0x38(r3)
/* 0246FC 800276FC FC010000 */  fcmpu     cr0, f1, f0
/* 024700 80027700 40820034 */  bne       lbl_80027734
lbl_80027704:
/* 024704 80027704 C02281C0 */  lfs       f1, D_8018C100@sda21(r0)
/* 024708 80027708 C0030030 */  lfs       f0, 0x30(r3)
/* 02470C 8002770C FC010000 */  fcmpu     cr0, f1, f0
/* 024710 80027710 4082001C */  bne       lbl_8002772C
/* 024714 80027714 C02281C4 */  lfs       f1, D_8018C104@sda21(r0)
/* 024718 80027718 C0030038 */  lfs       f0, 0x38(r3)
/* 02471C 8002771C FC010000 */  fcmpu     cr0, f1, f0
/* 024720 80027720 4082000C */  bne       lbl_8002772C
/* 024724 80027724 38000001 */  li        r0, 0x1
/* 024728 80027728 900D89C8 */  stw       r0, D_8018B948@sda21(r0)
lbl_8002772C:
/* 02472C 8002772C 38600001 */  li        r3, 0x1
/* 024730 80027730 4800009C */  b         lbl_800277CC
lbl_80027734:
/* 024734 80027734 3FFD0004 */  addis     r31, r29, 0x4
/* 024738 80027738 801FD138 */  lwz       r0, -0x2ec8(r31)
/* 02473C 8002773C 28000017 */  cmplwi    r0, 0x17
/* 024740 80027740 4182007C */  beq       lbl_800277BC
/* 024744 80027744 48081569 */  bl        GXClearVtxDesc
/* 024748 80027748 38600009 */  li        r3, 0x9
/* 02474C 8002774C 38800001 */  li        r4, 0x1
/* 024750 80027750 48081095 */  bl        GXSetVtxDesc
/* 024754 80027754 3860000B */  li        r3, 0xb
/* 024758 80027758 38800001 */  li        r4, 0x1
/* 02475C 8002775C 48081089 */  bl        GXSetVtxDesc
/* 024760 80027760 3860000D */  li        r3, 0xd
/* 024764 80027764 38800001 */  li        r4, 0x1
/* 024768 80027768 4808107D */  bl        GXSetVtxDesc
/* 02476C 8002776C 38600000 */  li        r3, 0x0
/* 024770 80027770 38800009 */  li        r4, 0x9
/* 024774 80027774 38A00001 */  li        r5, 0x1
/* 024778 80027778 38C00004 */  li        r6, 0x4
/* 02477C 8002777C 38E00000 */  li        r7, 0x0
/* 024780 80027780 48081565 */  bl        GXSetVtxAttrFmt
/* 024784 80027784 38600000 */  li        r3, 0x0
/* 024788 80027788 3880000B */  li        r4, 0xb
/* 02478C 8002778C 38A00001 */  li        r5, 0x1
/* 024790 80027790 38C00005 */  li        r6, 0x5
/* 024794 80027794 38E00000 */  li        r7, 0x0
/* 024798 80027798 4808154D */  bl        GXSetVtxAttrFmt
/* 02479C 8002779C 38600000 */  li        r3, 0x0
/* 0247A0 800277A0 3880000D */  li        r4, 0xd
/* 0247A4 800277A4 38A00001 */  li        r5, 0x1
/* 0247A8 800277A8 38C00004 */  li        r6, 0x4
/* 0247AC 800277AC 38E00000 */  li        r7, 0x0
/* 0247B0 800277B0 48081535 */  bl        GXSetVtxAttrFmt
/* 0247B4 800277B4 38000017 */  li        r0, 0x17
/* 0247B8 800277B8 901FD138 */  stw       r0, -0x2ec8(r31)
lbl_800277BC:
/* 0247BC 800277BC 7FA3EB78 */  mr        r3, r29
/* 0247C0 800277C0 7FC4F378 */  mr        r4, r30
/* 0247C4 800277C4 48000025 */  bl        frameCheckTriangleDivide
/* 0247C8 800277C8 38600001 */  li        r3, 0x1
lbl_800277CC:
/* 0247CC 800277CC 8001007C */  lwz       r0, 0x7c(r1)
/* 0247D0 800277D0 83E10074 */  lwz       r31, 0x74(r1)
/* 0247D4 800277D4 83C10070 */  lwz       r30, 0x70(r1)
/* 0247D8 800277D8 7C0803A6 */  mtlr      r0
/* 0247DC 800277DC 83A1006C */  lwz       r29, 0x6c(r1)
/* 0247E0 800277E0 38210078 */  addi      r1, r1, 0x78
/* 0247E4 800277E4 4E800020 */  blr

glabel frameCheckTriangleDivide
/* 0247E8 800277E8 7C0802A6 */  mflr      r0
/* 0247EC 800277EC 90010004 */  stw       r0, 0x4(r1)
/* 0247F0 800277F0 9421FCF0 */  stwu      r1, -0x310(r1)
/* 0247F4 800277F4 DBE10308 */  stfd      f31, 0x308(r1)
/* 0247F8 800277F8 DBC10300 */  stfd      f30, 0x300(r1)
/* 0247FC 800277FC DBA102F8 */  stfd      f29, 0x2f8(r1)
/* 024800 80027800 BEC102D0 */  stmw      r22, 0x2d0(r1)
/* 024804 80027804 7C761B78 */  mr        r22, r3
/* 024808 80027808 7C972378 */  mr        r23, r4
/* 02480C 8002780C 3B170004 */  addi      r24, r23, 0x4
/* 024810 80027810 3B200000 */  li        r25, 0x0
/* 024814 80027814 48000004 */  b         lbl_80027818
lbl_80027818:
/* 024818 80027818 C3E28100 */  lfs       f31, D_8018C040@sda21(r0)
/* 02481C 8002781C 3BA10184 */  addi      r29, r1, 0x184
/* 024820 80027820 CBC28128 */  lfd       f30, D_8018C068@sda21(r0)
/* 024824 80027824 3FE0CC01 */  lis       r31, 0xcc01
/* 024828 80027828 3FC04330 */  lis       r30, 0x4330
/* 02482C 8002782C 48000004 */  b         lbl_80027830
lbl_80027830:
/* 024830 80027830 48000E4C */  b         lbl_8002867C
lbl_80027834:
/* 024834 80027834 7CD8CA14 */  add       r6, r24, r25
/* 024838 80027838 88860000 */  lbz       r4, 0x0(r6)
/* 02483C 8002783C 38000003 */  li        r0, 0x3
/* 024840 80027840 7C030378 */  mr        r3, r0
/* 024844 80027844 1C84001C */  mulli     r4, r4, 0x1c
/* 024848 80027848 7CB62214 */  add       r5, r22, r4
/* 02484C 8002784C C005036C */  lfs       f0, 0x36c(r5)
/* 024850 80027850 7C040378 */  mr        r4, r0
/* 024854 80027854 3B850358 */  addi      r28, r5, 0x358
/* 024858 80027858 FC00F840 */  fcmpo     cr0, f0, f31
/* 02485C 8002785C 38E00000 */  li        r7, 0x0
/* 024860 80027860 39000000 */  li        r8, 0x0
/* 024864 80027864 40800010 */  bge       lbl_80027874
/* 024868 80027868 38000000 */  li        r0, 0x0
/* 02486C 8002786C 39000001 */  li        r8, 0x1
/* 024870 80027870 48000018 */  b         lbl_80027888
lbl_80027874:
/* 024874 80027874 C01C0014 */  lfs       f0, 0x14(r28)
/* 024878 80027878 FC00F840 */  fcmpo     cr0, f0, f31
/* 02487C 8002787C 4081000C */  ble       lbl_80027888
/* 024880 80027880 38000001 */  li        r0, 0x1
/* 024884 80027884 38E00001 */  li        r7, 0x1
lbl_80027888:
/* 024888 80027888 88A60001 */  lbz       r5, 0x1(r6)
/* 02488C 8002788C 1CA5001C */  mulli     r5, r5, 0x1c
/* 024890 80027890 7CB62A14 */  add       r5, r22, r5
/* 024894 80027894 C005036C */  lfs       f0, 0x36c(r5)
/* 024898 80027898 3B650358 */  addi      r27, r5, 0x358
/* 02489C 8002789C FC00F840 */  fcmpo     cr0, f0, f31
/* 0248A0 800278A0 40800010 */  bge       lbl_800278B0
/* 0248A4 800278A4 38600000 */  li        r3, 0x0
/* 0248A8 800278A8 39000001 */  li        r8, 0x1
/* 0248AC 800278AC 48000018 */  b         lbl_800278C4
lbl_800278B0:
/* 0248B0 800278B0 C01B0014 */  lfs       f0, 0x14(r27)
/* 0248B4 800278B4 FC00F840 */  fcmpo     cr0, f0, f31
/* 0248B8 800278B8 4081000C */  ble       lbl_800278C4
/* 0248BC 800278BC 38600001 */  li        r3, 0x1
/* 0248C0 800278C0 38E00001 */  li        r7, 0x1
lbl_800278C4:
/* 0248C4 800278C4 88A60002 */  lbz       r5, 0x2(r6)
/* 0248C8 800278C8 1CA5001C */  mulli     r5, r5, 0x1c
/* 0248CC 800278CC 7CB62A14 */  add       r5, r22, r5
/* 0248D0 800278D0 C005036C */  lfs       f0, 0x36c(r5)
/* 0248D4 800278D4 3B450358 */  addi      r26, r5, 0x358
/* 0248D8 800278D8 FC00F840 */  fcmpo     cr0, f0, f31
/* 0248DC 800278DC 40800010 */  bge       lbl_800278EC
/* 0248E0 800278E0 38800000 */  li        r4, 0x0
/* 0248E4 800278E4 39000001 */  li        r8, 0x1
/* 0248E8 800278E8 48000018 */  b         lbl_80027900
lbl_800278EC:
/* 0248EC 800278EC C01A0014 */  lfs       f0, 0x14(r26)
/* 0248F0 800278F0 FC00F840 */  fcmpo     cr0, f0, f31
/* 0248F4 800278F4 4081000C */  ble       lbl_80027900
/* 0248F8 800278F8 38800001 */  li        r4, 0x1
/* 0248FC 800278FC 38E00001 */  li        r7, 0x1
lbl_80027900:
/* 024900 80027900 28080000 */  cmplwi    r8, 0x0
/* 024904 80027904 4182000C */  beq       lbl_80027910
/* 024908 80027908 28070000 */  cmplwi    r7, 0x0
/* 02490C 8002790C 408200F4 */  bne       lbl_80027A00
lbl_80027910:
/* 024910 80027910 38600090 */  li        r3, 0x90
/* 024914 80027914 38800000 */  li        r4, 0x0
/* 024918 80027918 38A00003 */  li        r5, 0x3
/* 02491C 8002791C 48082651 */  bl        GXBegin
/* 024920 80027920 C05C0014 */  lfs       f2, 0x14(r28)
/* 024924 80027924 3B390003 */  addi      r25, r25, 0x3
/* 024928 80027928 C03C0010 */  lfs       f1, 0x10(r28)
/* 02492C 8002792C C01C000C */  lfs       f0, 0xc(r28)
/* 024930 80027930 D01F8000 */  stfs      f0, -0x8000(r31)
/* 024934 80027934 D03F8000 */  stfs      f1, -0x8000(r31)
/* 024938 80027938 D05F8000 */  stfs      f2, -0x8000(r31)
/* 02493C 8002793C 88BC001B */  lbz       r5, 0x1b(r28)
/* 024940 80027940 889C001A */  lbz       r4, 0x1a(r28)
/* 024944 80027944 887C0019 */  lbz       r3, 0x19(r28)
/* 024948 80027948 881C0018 */  lbz       r0, 0x18(r28)
/* 02494C 8002794C 981F8000 */  stb       r0, -0x8000(r31)
/* 024950 80027950 987F8000 */  stb       r3, -0x8000(r31)
/* 024954 80027954 989F8000 */  stb       r4, -0x8000(r31)
/* 024958 80027958 98BF8000 */  stb       r5, -0x8000(r31)
/* 02495C 8002795C C03C0008 */  lfs       f1, 0x8(r28)
/* 024960 80027960 C01C0004 */  lfs       f0, 0x4(r28)
/* 024964 80027964 D01F8000 */  stfs      f0, -0x8000(r31)
/* 024968 80027968 D03F8000 */  stfs      f1, -0x8000(r31)
/* 02496C 8002796C C05B0014 */  lfs       f2, 0x14(r27)
/* 024970 80027970 C03B0010 */  lfs       f1, 0x10(r27)
/* 024974 80027974 C01B000C */  lfs       f0, 0xc(r27)
/* 024978 80027978 D01F8000 */  stfs      f0, -0x8000(r31)
/* 02497C 8002797C D03F8000 */  stfs      f1, -0x8000(r31)
/* 024980 80027980 D05F8000 */  stfs      f2, -0x8000(r31)
/* 024984 80027984 88BB001B */  lbz       r5, 0x1b(r27)
/* 024988 80027988 889B001A */  lbz       r4, 0x1a(r27)
/* 02498C 8002798C 887B0019 */  lbz       r3, 0x19(r27)
/* 024990 80027990 881B0018 */  lbz       r0, 0x18(r27)
/* 024994 80027994 981F8000 */  stb       r0, -0x8000(r31)
/* 024998 80027998 987F8000 */  stb       r3, -0x8000(r31)
/* 02499C 8002799C 989F8000 */  stb       r4, -0x8000(r31)
/* 0249A0 800279A0 98BF8000 */  stb       r5, -0x8000(r31)
/* 0249A4 800279A4 C03B0008 */  lfs       f1, 0x8(r27)
/* 0249A8 800279A8 C01B0004 */  lfs       f0, 0x4(r27)
/* 0249AC 800279AC D01F8000 */  stfs      f0, -0x8000(r31)
/* 0249B0 800279B0 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0249B4 800279B4 C05A0014 */  lfs       f2, 0x14(r26)
/* 0249B8 800279B8 C03A0010 */  lfs       f1, 0x10(r26)
/* 0249BC 800279BC C01A000C */  lfs       f0, 0xc(r26)
/* 0249C0 800279C0 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0249C4 800279C4 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0249C8 800279C8 D05F8000 */  stfs      f2, -0x8000(r31)
/* 0249CC 800279CC 88BA001B */  lbz       r5, 0x1b(r26)
/* 0249D0 800279D0 889A001A */  lbz       r4, 0x1a(r26)
/* 0249D4 800279D4 887A0019 */  lbz       r3, 0x19(r26)
/* 0249D8 800279D8 881A0018 */  lbz       r0, 0x18(r26)
/* 0249DC 800279DC 981F8000 */  stb       r0, -0x8000(r31)
/* 0249E0 800279E0 987F8000 */  stb       r3, -0x8000(r31)
/* 0249E4 800279E4 989F8000 */  stb       r4, -0x8000(r31)
/* 0249E8 800279E8 98BF8000 */  stb       r5, -0x8000(r31)
/* 0249EC 800279EC C03A0008 */  lfs       f1, 0x8(r26)
/* 0249F0 800279F0 C01A0004 */  lfs       f0, 0x4(r26)
/* 0249F4 800279F4 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0249F8 800279F8 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0249FC 800279FC 48000C80 */  b         lbl_8002867C
lbl_80027A00:
/* 024A00 80027A00 38C00000 */  li        r6, 0x0
/* 024A04 80027A04 80BC0000 */  lwz       r5, 0x0(r28)
/* 024A08 80027A08 1CE6001C */  mulli     r7, r6, 0x1c
/* 024A0C 80027A0C 80DC0004 */  lwz       r6, 0x4(r28)
/* 024A10 80027A10 7D1D3A14 */  add       r8, r29, r7
/* 024A14 80027A14 90A80000 */  stw       r5, 0x0(r8)
/* 024A18 80027A18 28000000 */  cmplwi    r0, 0x0
/* 024A1C 80027A1C 38A00001 */  li        r5, 0x1
/* 024A20 80027A20 90C80004 */  stw       r6, 0x4(r8)
/* 024A24 80027A24 80FC0008 */  lwz       r7, 0x8(r28)
/* 024A28 80027A28 80DC000C */  lwz       r6, 0xc(r28)
/* 024A2C 80027A2C 90E80008 */  stw       r7, 0x8(r8)
/* 024A30 80027A30 90C8000C */  stw       r6, 0xc(r8)
/* 024A34 80027A34 80FC0010 */  lwz       r7, 0x10(r28)
/* 024A38 80027A38 80DC0014 */  lwz       r6, 0x14(r28)
/* 024A3C 80027A3C 90E80010 */  stw       r7, 0x10(r8)
/* 024A40 80027A40 90C80014 */  stw       r6, 0x14(r8)
/* 024A44 80027A44 80DC0018 */  lwz       r6, 0x18(r28)
/* 024A48 80027A48 90C80018 */  stw       r6, 0x18(r8)
/* 024A4C 80027A4C 4082000C */  bne       lbl_80027A58
/* 024A50 80027A50 28030001 */  cmplwi    r3, 0x1
/* 024A54 80027A54 41820014 */  beq       lbl_80027A68
lbl_80027A58:
/* 024A58 80027A58 28000001 */  cmplwi    r0, 0x1
/* 024A5C 80027A5C 40820198 */  bne       lbl_80027BF4
/* 024A60 80027A60 28030000 */  cmplwi    r3, 0x0
/* 024A64 80027A64 40820190 */  bne       lbl_80027BF4
lbl_80027A68:
/* 024A68 80027A68 C05C0014 */  lfs       f2, 0x14(r28)
/* 024A6C 80027A6C C01B0014 */  lfs       f0, 0x14(r27)
/* 024A70 80027A70 FC201050 */  fneg      f1, f2
/* 024A74 80027A74 EC001028 */  fsubs     f0, f0, f2
/* 024A78 80027A78 D3E101B4 */  stfs      f31, 0x1b4(r1)
/* 024A7C 80027A7C C05C0010 */  lfs       f2, 0x10(r28)
/* 024A80 80027A80 EC010024 */  fdivs     f0, f1, f0
/* 024A84 80027A84 C03B0010 */  lfs       f1, 0x10(r27)
/* 024A88 80027A88 FC020800 */  fcmpu     cr0, f2, f1
/* 024A8C 80027A8C 4082000C */  bne       lbl_80027A98
/* 024A90 80027A90 D04101B0 */  stfs      f2, 0x1b0(r1)
/* 024A94 80027A94 48000010 */  b         lbl_80027AA4
lbl_80027A98:
/* 024A98 80027A98 EC211028 */  fsubs     f1, f1, f2
/* 024A9C 80027A9C EC20107A */  fmadds    f1, f0, f1, f2
/* 024AA0 80027AA0 D02101B0 */  stfs      f1, 0x1b0(r1)
lbl_80027AA4:
/* 024AA4 80027AA4 C05C000C */  lfs       f2, 0xc(r28)
/* 024AA8 80027AA8 C03B000C */  lfs       f1, 0xc(r27)
/* 024AAC 80027AAC FC020800 */  fcmpu     cr0, f2, f1
/* 024AB0 80027AB0 4082000C */  bne       lbl_80027ABC
/* 024AB4 80027AB4 D04101AC */  stfs      f2, 0x1ac(r1)
/* 024AB8 80027AB8 48000010 */  b         lbl_80027AC8
lbl_80027ABC:
/* 024ABC 80027ABC EC211028 */  fsubs     f1, f1, f2
/* 024AC0 80027AC0 EC20107A */  fmadds    f1, f0, f1, f2
/* 024AC4 80027AC4 D02101AC */  stfs      f1, 0x1ac(r1)
lbl_80027AC8:
/* 024AC8 80027AC8 C05C0004 */  lfs       f2, 0x4(r28)
/* 024ACC 80027ACC 38A00002 */  li        r5, 0x2
/* 024AD0 80027AD0 C03B0004 */  lfs       f1, 0x4(r27)
/* 024AD4 80027AD4 EC211028 */  fsubs     f1, f1, f2
/* 024AD8 80027AD8 EC20107A */  fmadds    f1, f0, f1, f2
/* 024ADC 80027ADC D02101A4 */  stfs      f1, 0x1a4(r1)
/* 024AE0 80027AE0 C05C0008 */  lfs       f2, 0x8(r28)
/* 024AE4 80027AE4 C03B0008 */  lfs       f1, 0x8(r27)
/* 024AE8 80027AE8 EC211028 */  fsubs     f1, f1, f2
/* 024AEC 80027AEC EC20107A */  fmadds    f1, f0, f1, f2
/* 024AF0 80027AF0 D02101A8 */  stfs      f1, 0x1a8(r1)
/* 024AF4 80027AF4 88FB0018 */  lbz       r7, 0x18(r27)
/* 024AF8 80027AF8 88DC0018 */  lbz       r6, 0x18(r28)
/* 024AFC 80027AFC 90E102CC */  stw       r7, 0x2cc(r1)
/* 024B00 80027B00 90C102C4 */  stw       r6, 0x2c4(r1)
/* 024B04 80027B04 93C102C8 */  stw       r30, 0x2c8(r1)
/* 024B08 80027B08 93C102C0 */  stw       r30, 0x2c0(r1)
/* 024B0C 80027B0C C84102C8 */  lfd       f2, 0x2c8(r1)
/* 024B10 80027B10 C82102C0 */  lfd       f1, 0x2c0(r1)
/* 024B14 80027B14 EC42F028 */  fsubs     f2, f2, f30
/* 024B18 80027B18 EC61F028 */  fsubs     f3, f1, f30
/* 024B1C 80027B1C EC221828 */  fsubs     f1, f2, f3
/* 024B20 80027B20 EC20187A */  fmadds    f1, f0, f1, f3
/* 024B24 80027B24 FC20081E */  fctiwz    f1, f1
/* 024B28 80027B28 D82102B8 */  stfd      f1, 0x2b8(r1)
/* 024B2C 80027B2C 80C102BC */  lwz       r6, 0x2bc(r1)
/* 024B30 80027B30 98C101B8 */  stb       r6, 0x1b8(r1)
/* 024B34 80027B34 88FB0019 */  lbz       r7, 0x19(r27)
/* 024B38 80027B38 88DC0019 */  lbz       r6, 0x19(r28)
/* 024B3C 80027B3C 90E102B4 */  stw       r7, 0x2b4(r1)
/* 024B40 80027B40 90C102AC */  stw       r6, 0x2ac(r1)
/* 024B44 80027B44 93C102B0 */  stw       r30, 0x2b0(r1)
/* 024B48 80027B48 93C102A8 */  stw       r30, 0x2a8(r1)
/* 024B4C 80027B4C C84102B0 */  lfd       f2, 0x2b0(r1)
/* 024B50 80027B50 C82102A8 */  lfd       f1, 0x2a8(r1)
/* 024B54 80027B54 EC42F028 */  fsubs     f2, f2, f30
/* 024B58 80027B58 EC61F028 */  fsubs     f3, f1, f30
/* 024B5C 80027B5C EC221828 */  fsubs     f1, f2, f3
/* 024B60 80027B60 EC20187A */  fmadds    f1, f0, f1, f3
/* 024B64 80027B64 FC20081E */  fctiwz    f1, f1
/* 024B68 80027B68 D82102A0 */  stfd      f1, 0x2a0(r1)
/* 024B6C 80027B6C 80C102A4 */  lwz       r6, 0x2a4(r1)
/* 024B70 80027B70 98C101B9 */  stb       r6, 0x1b9(r1)
/* 024B74 80027B74 88FC001A */  lbz       r7, 0x1a(r28)
/* 024B78 80027B78 88DB001A */  lbz       r6, 0x1a(r27)
/* 024B7C 80027B7C 90E1029C */  stw       r7, 0x29c(r1)
/* 024B80 80027B80 90C10294 */  stw       r6, 0x294(r1)
/* 024B84 80027B84 93C10298 */  stw       r30, 0x298(r1)
/* 024B88 80027B88 93C10290 */  stw       r30, 0x290(r1)
/* 024B8C 80027B8C C8410298 */  lfd       f2, 0x298(r1)
/* 024B90 80027B90 C8210290 */  lfd       f1, 0x290(r1)
/* 024B94 80027B94 EC42F028 */  fsubs     f2, f2, f30
/* 024B98 80027B98 EC21F028 */  fsubs     f1, f1, f30
/* 024B9C 80027B9C EC211028 */  fsubs     f1, f1, f2
/* 024BA0 80027BA0 EC20107A */  fmadds    f1, f0, f1, f2
/* 024BA4 80027BA4 FC20081E */  fctiwz    f1, f1
/* 024BA8 80027BA8 D8210288 */  stfd      f1, 0x288(r1)
/* 024BAC 80027BAC 80C1028C */  lwz       r6, 0x28c(r1)
/* 024BB0 80027BB0 98C101BA */  stb       r6, 0x1ba(r1)
/* 024BB4 80027BB4 88FC001B */  lbz       r7, 0x1b(r28)
/* 024BB8 80027BB8 88DB001B */  lbz       r6, 0x1b(r27)
/* 024BBC 80027BBC 90E10284 */  stw       r7, 0x284(r1)
/* 024BC0 80027BC0 90C1027C */  stw       r6, 0x27c(r1)
/* 024BC4 80027BC4 93C10280 */  stw       r30, 0x280(r1)
/* 024BC8 80027BC8 93C10278 */  stw       r30, 0x278(r1)
/* 024BCC 80027BCC C8410280 */  lfd       f2, 0x280(r1)
/* 024BD0 80027BD0 C8210278 */  lfd       f1, 0x278(r1)
/* 024BD4 80027BD4 EC42F028 */  fsubs     f2, f2, f30
/* 024BD8 80027BD8 EC21F028 */  fsubs     f1, f1, f30
/* 024BDC 80027BDC EC211028 */  fsubs     f1, f1, f2
/* 024BE0 80027BE0 EC00107A */  fmadds    f0, f0, f1, f2
/* 024BE4 80027BE4 FC00001E */  fctiwz    f0, f0
/* 024BE8 80027BE8 D8010270 */  stfd      f0, 0x270(r1)
/* 024BEC 80027BEC 80C10274 */  lwz       r6, 0x274(r1)
/* 024BF0 80027BF0 98C101BB */  stb       r6, 0x1bb(r1)
lbl_80027BF4:
/* 024BF4 80027BF4 1D05001C */  mulli     r8, r5, 0x1c
/* 024BF8 80027BF8 80FB0000 */  lwz       r7, 0x0(r27)
/* 024BFC 80027BFC 80DB0004 */  lwz       r6, 0x4(r27)
/* 024C00 80027C00 7D1D4214 */  add       r8, r29, r8
/* 024C04 80027C04 90E80000 */  stw       r7, 0x0(r8)
/* 024C08 80027C08 28030001 */  cmplwi    r3, 0x1
/* 024C0C 80027C0C 38A50001 */  addi      r5, r5, 0x1
/* 024C10 80027C10 90C80004 */  stw       r6, 0x4(r8)
/* 024C14 80027C14 80FB0008 */  lwz       r7, 0x8(r27)
/* 024C18 80027C18 80DB000C */  lwz       r6, 0xc(r27)
/* 024C1C 80027C1C 90E80008 */  stw       r7, 0x8(r8)
/* 024C20 80027C20 90C8000C */  stw       r6, 0xc(r8)
/* 024C24 80027C24 80FB0010 */  lwz       r7, 0x10(r27)
/* 024C28 80027C28 80DB0014 */  lwz       r6, 0x14(r27)
/* 024C2C 80027C2C 90E80010 */  stw       r7, 0x10(r8)
/* 024C30 80027C30 90C80014 */  stw       r6, 0x14(r8)
/* 024C34 80027C34 80DB0018 */  lwz       r6, 0x18(r27)
/* 024C38 80027C38 90C80018 */  stw       r6, 0x18(r8)
/* 024C3C 80027C3C 4082000C */  bne       lbl_80027C48
/* 024C40 80027C40 28040000 */  cmplwi    r4, 0x0
/* 024C44 80027C44 41820014 */  beq       lbl_80027C58
lbl_80027C48:
/* 024C48 80027C48 28030000 */  cmplwi    r3, 0x0
/* 024C4C 80027C4C 408201A4 */  bne       lbl_80027DF0
/* 024C50 80027C50 28040001 */  cmplwi    r4, 0x1
/* 024C54 80027C54 4082019C */  bne       lbl_80027DF0
lbl_80027C58:
/* 024C58 80027C58 C05B0014 */  lfs       f2, 0x14(r27)
/* 024C5C 80027C5C 1C65001C */  mulli     r3, r5, 0x1c
/* 024C60 80027C60 C01A0014 */  lfs       f0, 0x14(r26)
/* 024C64 80027C64 FC201050 */  fneg      f1, f2
/* 024C68 80027C68 EC001028 */  fsubs     f0, f0, f2
/* 024C6C 80027C6C 38E10184 */  addi      r7, r1, 0x184
/* 024C70 80027C70 7CE71A14 */  add       r7, r7, r3
/* 024C74 80027C74 D3E70014 */  stfs      f31, 0x14(r7)
/* 024C78 80027C78 EC010024 */  fdivs     f0, f1, f0
/* 024C7C 80027C7C C05B0010 */  lfs       f2, 0x10(r27)
/* 024C80 80027C80 C03A0010 */  lfs       f1, 0x10(r26)
/* 024C84 80027C84 FC020800 */  fcmpu     cr0, f2, f1
/* 024C88 80027C88 4082000C */  bne       lbl_80027C94
/* 024C8C 80027C8C D0470010 */  stfs      f2, 0x10(r7)
/* 024C90 80027C90 48000010 */  b         lbl_80027CA0
lbl_80027C94:
/* 024C94 80027C94 EC211028 */  fsubs     f1, f1, f2
/* 024C98 80027C98 EC20107A */  fmadds    f1, f0, f1, f2
/* 024C9C 80027C9C D0270010 */  stfs      f1, 0x10(r7)
lbl_80027CA0:
/* 024CA0 80027CA0 C05B000C */  lfs       f2, 0xc(r27)
/* 024CA4 80027CA4 C03A000C */  lfs       f1, 0xc(r26)
/* 024CA8 80027CA8 FC020800 */  fcmpu     cr0, f2, f1
/* 024CAC 80027CAC 4082000C */  bne       lbl_80027CB8
/* 024CB0 80027CB0 D047000C */  stfs      f2, 0xc(r7)
/* 024CB4 80027CB4 48000010 */  b         lbl_80027CC4
lbl_80027CB8:
/* 024CB8 80027CB8 EC211028 */  fsubs     f1, f1, f2
/* 024CBC 80027CBC EC20107A */  fmadds    f1, f0, f1, f2
/* 024CC0 80027CC0 D027000C */  stfs      f1, 0xc(r7)
lbl_80027CC4:
/* 024CC4 80027CC4 C05B0004 */  lfs       f2, 0x4(r27)
/* 024CC8 80027CC8 38A50001 */  addi      r5, r5, 0x1
/* 024CCC 80027CCC C03A0004 */  lfs       f1, 0x4(r26)
/* 024CD0 80027CD0 EC211028 */  fsubs     f1, f1, f2
/* 024CD4 80027CD4 EC20107A */  fmadds    f1, f0, f1, f2
/* 024CD8 80027CD8 D0270004 */  stfs      f1, 0x4(r7)
/* 024CDC 80027CDC C05B0008 */  lfs       f2, 0x8(r27)
/* 024CE0 80027CE0 C03A0008 */  lfs       f1, 0x8(r26)
/* 024CE4 80027CE4 EC211028 */  fsubs     f1, f1, f2
/* 024CE8 80027CE8 EC20107A */  fmadds    f1, f0, f1, f2
/* 024CEC 80027CEC D0270008 */  stfs      f1, 0x8(r7)
/* 024CF0 80027CF0 88DA0018 */  lbz       r6, 0x18(r26)
/* 024CF4 80027CF4 887B0018 */  lbz       r3, 0x18(r27)
/* 024CF8 80027CF8 90C10274 */  stw       r6, 0x274(r1)
/* 024CFC 80027CFC 9061027C */  stw       r3, 0x27c(r1)
/* 024D00 80027D00 93C10270 */  stw       r30, 0x270(r1)
/* 024D04 80027D04 93C10278 */  stw       r30, 0x278(r1)
/* 024D08 80027D08 C8410270 */  lfd       f2, 0x270(r1)
/* 024D0C 80027D0C C8210278 */  lfd       f1, 0x278(r1)
/* 024D10 80027D10 EC42F028 */  fsubs     f2, f2, f30
/* 024D14 80027D14 EC61F028 */  fsubs     f3, f1, f30
/* 024D18 80027D18 EC221828 */  fsubs     f1, f2, f3
/* 024D1C 80027D1C EC20187A */  fmadds    f1, f0, f1, f3
/* 024D20 80027D20 FC20081E */  fctiwz    f1, f1
/* 024D24 80027D24 D8210280 */  stfd      f1, 0x280(r1)
/* 024D28 80027D28 80610284 */  lwz       r3, 0x284(r1)
/* 024D2C 80027D2C 98670018 */  stb       r3, 0x18(r7)
/* 024D30 80027D30 88DA0019 */  lbz       r6, 0x19(r26)
/* 024D34 80027D34 887B0019 */  lbz       r3, 0x19(r27)
/* 024D38 80027D38 90C1028C */  stw       r6, 0x28c(r1)
/* 024D3C 80027D3C 90610294 */  stw       r3, 0x294(r1)
/* 024D40 80027D40 93C10288 */  stw       r30, 0x288(r1)
/* 024D44 80027D44 93C10290 */  stw       r30, 0x290(r1)
/* 024D48 80027D48 C8410288 */  lfd       f2, 0x288(r1)
/* 024D4C 80027D4C C8210290 */  lfd       f1, 0x290(r1)
/* 024D50 80027D50 EC42F028 */  fsubs     f2, f2, f30
/* 024D54 80027D54 EC61F028 */  fsubs     f3, f1, f30
/* 024D58 80027D58 EC221828 */  fsubs     f1, f2, f3
/* 024D5C 80027D5C EC20187A */  fmadds    f1, f0, f1, f3
/* 024D60 80027D60 FC20081E */  fctiwz    f1, f1
/* 024D64 80027D64 D8210298 */  stfd      f1, 0x298(r1)
/* 024D68 80027D68 8061029C */  lwz       r3, 0x29c(r1)
/* 024D6C 80027D6C 98670019 */  stb       r3, 0x19(r7)
/* 024D70 80027D70 88DB001A */  lbz       r6, 0x1a(r27)
/* 024D74 80027D74 887A001A */  lbz       r3, 0x1a(r26)
/* 024D78 80027D78 90C102A4 */  stw       r6, 0x2a4(r1)
/* 024D7C 80027D7C 906102AC */  stw       r3, 0x2ac(r1)
/* 024D80 80027D80 93C102A0 */  stw       r30, 0x2a0(r1)
/* 024D84 80027D84 93C102A8 */  stw       r30, 0x2a8(r1)
/* 024D88 80027D88 C84102A0 */  lfd       f2, 0x2a0(r1)
/* 024D8C 80027D8C C82102A8 */  lfd       f1, 0x2a8(r1)
/* 024D90 80027D90 EC42F028 */  fsubs     f2, f2, f30
/* 024D94 80027D94 EC21F028 */  fsubs     f1, f1, f30
/* 024D98 80027D98 EC211028 */  fsubs     f1, f1, f2
/* 024D9C 80027D9C EC20107A */  fmadds    f1, f0, f1, f2
/* 024DA0 80027DA0 FC20081E */  fctiwz    f1, f1
/* 024DA4 80027DA4 D82102B0 */  stfd      f1, 0x2b0(r1)
/* 024DA8 80027DA8 806102B4 */  lwz       r3, 0x2b4(r1)
/* 024DAC 80027DAC 9867001A */  stb       r3, 0x1a(r7)
/* 024DB0 80027DB0 88DB001B */  lbz       r6, 0x1b(r27)
/* 024DB4 80027DB4 887A001B */  lbz       r3, 0x1b(r26)
/* 024DB8 80027DB8 90C102BC */  stw       r6, 0x2bc(r1)
/* 024DBC 80027DBC 906102C4 */  stw       r3, 0x2c4(r1)
/* 024DC0 80027DC0 93C102B8 */  stw       r30, 0x2b8(r1)
/* 024DC4 80027DC4 93C102C0 */  stw       r30, 0x2c0(r1)
/* 024DC8 80027DC8 C84102B8 */  lfd       f2, 0x2b8(r1)
/* 024DCC 80027DCC C82102C0 */  lfd       f1, 0x2c0(r1)
/* 024DD0 80027DD0 EC42F028 */  fsubs     f2, f2, f30
/* 024DD4 80027DD4 EC21F028 */  fsubs     f1, f1, f30
/* 024DD8 80027DD8 EC211028 */  fsubs     f1, f1, f2
/* 024DDC 80027DDC EC00107A */  fmadds    f0, f0, f1, f2
/* 024DE0 80027DE0 FC00001E */  fctiwz    f0, f0
/* 024DE4 80027DE4 D80102C8 */  stfd      f0, 0x2c8(r1)
/* 024DE8 80027DE8 806102CC */  lwz       r3, 0x2cc(r1)
/* 024DEC 80027DEC 9867001B */  stb       r3, 0x1b(r7)
lbl_80027DF0:
/* 024DF0 80027DF0 7CA32B78 */  mr        r3, r5
/* 024DF4 80027DF4 80DA0000 */  lwz       r6, 0x0(r26)
/* 024DF8 80027DF8 1CE3001C */  mulli     r7, r3, 0x1c
/* 024DFC 80027DFC 807A0004 */  lwz       r3, 0x4(r26)
/* 024E00 80027E00 7CFD3A14 */  add       r7, r29, r7
/* 024E04 80027E04 90C70000 */  stw       r6, 0x0(r7)
/* 024E08 80027E08 28000000 */  cmplwi    r0, 0x0
/* 024E0C 80027E0C 38A50001 */  addi      r5, r5, 0x1
/* 024E10 80027E10 90670004 */  stw       r3, 0x4(r7)
/* 024E14 80027E14 80DA0008 */  lwz       r6, 0x8(r26)
/* 024E18 80027E18 807A000C */  lwz       r3, 0xc(r26)
/* 024E1C 80027E1C 90C70008 */  stw       r6, 0x8(r7)
/* 024E20 80027E20 9067000C */  stw       r3, 0xc(r7)
/* 024E24 80027E24 80DA0010 */  lwz       r6, 0x10(r26)
/* 024E28 80027E28 807A0014 */  lwz       r3, 0x14(r26)
/* 024E2C 80027E2C 90C70010 */  stw       r6, 0x10(r7)
/* 024E30 80027E30 90670014 */  stw       r3, 0x14(r7)
/* 024E34 80027E34 807A0018 */  lwz       r3, 0x18(r26)
/* 024E38 80027E38 90670018 */  stw       r3, 0x18(r7)
/* 024E3C 80027E3C 4082000C */  bne       lbl_80027E48
/* 024E40 80027E40 28040001 */  cmplwi    r4, 0x1
/* 024E44 80027E44 41820014 */  beq       lbl_80027E58
lbl_80027E48:
/* 024E48 80027E48 28000001 */  cmplwi    r0, 0x1
/* 024E4C 80027E4C 408201A4 */  bne       lbl_80027FF0
/* 024E50 80027E50 28040000 */  cmplwi    r4, 0x0
/* 024E54 80027E54 4082019C */  bne       lbl_80027FF0
lbl_80027E58:
/* 024E58 80027E58 C05C0014 */  lfs       f2, 0x14(r28)
/* 024E5C 80027E5C 1C05001C */  mulli     r0, r5, 0x1c
/* 024E60 80027E60 C01A0014 */  lfs       f0, 0x14(r26)
/* 024E64 80027E64 FC201050 */  fneg      f1, f2
/* 024E68 80027E68 EC001028 */  fsubs     f0, f0, f2
/* 024E6C 80027E6C 38810184 */  addi      r4, r1, 0x184
/* 024E70 80027E70 7C840214 */  add       r4, r4, r0
/* 024E74 80027E74 D3E40014 */  stfs      f31, 0x14(r4)
/* 024E78 80027E78 EC010024 */  fdivs     f0, f1, f0
/* 024E7C 80027E7C C05C0010 */  lfs       f2, 0x10(r28)
/* 024E80 80027E80 C03A0010 */  lfs       f1, 0x10(r26)
/* 024E84 80027E84 FC020800 */  fcmpu     cr0, f2, f1
/* 024E88 80027E88 4082000C */  bne       lbl_80027E94
/* 024E8C 80027E8C D0440010 */  stfs      f2, 0x10(r4)
/* 024E90 80027E90 48000010 */  b         lbl_80027EA0
lbl_80027E94:
/* 024E94 80027E94 EC211028 */  fsubs     f1, f1, f2
/* 024E98 80027E98 EC20107A */  fmadds    f1, f0, f1, f2
/* 024E9C 80027E9C D0240010 */  stfs      f1, 0x10(r4)
lbl_80027EA0:
/* 024EA0 80027EA0 C05C000C */  lfs       f2, 0xc(r28)
/* 024EA4 80027EA4 C03A000C */  lfs       f1, 0xc(r26)
/* 024EA8 80027EA8 FC020800 */  fcmpu     cr0, f2, f1
/* 024EAC 80027EAC 4082000C */  bne       lbl_80027EB8
/* 024EB0 80027EB0 D044000C */  stfs      f2, 0xc(r4)
/* 024EB4 80027EB4 48000010 */  b         lbl_80027EC4
lbl_80027EB8:
/* 024EB8 80027EB8 EC211028 */  fsubs     f1, f1, f2
/* 024EBC 80027EBC EC20107A */  fmadds    f1, f0, f1, f2
/* 024EC0 80027EC0 D024000C */  stfs      f1, 0xc(r4)
lbl_80027EC4:
/* 024EC4 80027EC4 C05C0004 */  lfs       f2, 0x4(r28)
/* 024EC8 80027EC8 38A50001 */  addi      r5, r5, 0x1
/* 024ECC 80027ECC C03A0004 */  lfs       f1, 0x4(r26)
/* 024ED0 80027ED0 EC211028 */  fsubs     f1, f1, f2
/* 024ED4 80027ED4 EC20107A */  fmadds    f1, f0, f1, f2
/* 024ED8 80027ED8 D0240004 */  stfs      f1, 0x4(r4)
/* 024EDC 80027EDC C05C0008 */  lfs       f2, 0x8(r28)
/* 024EE0 80027EE0 C03A0008 */  lfs       f1, 0x8(r26)
/* 024EE4 80027EE4 EC211028 */  fsubs     f1, f1, f2
/* 024EE8 80027EE8 EC20107A */  fmadds    f1, f0, f1, f2
/* 024EEC 80027EEC D0240008 */  stfs      f1, 0x8(r4)
/* 024EF0 80027EF0 887A0018 */  lbz       r3, 0x18(r26)
/* 024EF4 80027EF4 881C0018 */  lbz       r0, 0x18(r28)
/* 024EF8 80027EF8 90610274 */  stw       r3, 0x274(r1)
/* 024EFC 80027EFC 9001027C */  stw       r0, 0x27c(r1)
/* 024F00 80027F00 93C10270 */  stw       r30, 0x270(r1)
/* 024F04 80027F04 93C10278 */  stw       r30, 0x278(r1)
/* 024F08 80027F08 C8410270 */  lfd       f2, 0x270(r1)
/* 024F0C 80027F0C C8210278 */  lfd       f1, 0x278(r1)
/* 024F10 80027F10 EC42F028 */  fsubs     f2, f2, f30
/* 024F14 80027F14 EC61F028 */  fsubs     f3, f1, f30
/* 024F18 80027F18 EC221828 */  fsubs     f1, f2, f3
/* 024F1C 80027F1C EC20187A */  fmadds    f1, f0, f1, f3
/* 024F20 80027F20 FC20081E */  fctiwz    f1, f1
/* 024F24 80027F24 D8210280 */  stfd      f1, 0x280(r1)
/* 024F28 80027F28 80010284 */  lwz       r0, 0x284(r1)
/* 024F2C 80027F2C 98040018 */  stb       r0, 0x18(r4)
/* 024F30 80027F30 887A0019 */  lbz       r3, 0x19(r26)
/* 024F34 80027F34 881C0019 */  lbz       r0, 0x19(r28)
/* 024F38 80027F38 9061028C */  stw       r3, 0x28c(r1)
/* 024F3C 80027F3C 90010294 */  stw       r0, 0x294(r1)
/* 024F40 80027F40 93C10288 */  stw       r30, 0x288(r1)
/* 024F44 80027F44 93C10290 */  stw       r30, 0x290(r1)
/* 024F48 80027F48 C8410288 */  lfd       f2, 0x288(r1)
/* 024F4C 80027F4C C8210290 */  lfd       f1, 0x290(r1)
/* 024F50 80027F50 EC42F028 */  fsubs     f2, f2, f30
/* 024F54 80027F54 EC61F028 */  fsubs     f3, f1, f30
/* 024F58 80027F58 EC221828 */  fsubs     f1, f2, f3
/* 024F5C 80027F5C EC20187A */  fmadds    f1, f0, f1, f3
/* 024F60 80027F60 FC20081E */  fctiwz    f1, f1
/* 024F64 80027F64 D8210298 */  stfd      f1, 0x298(r1)
/* 024F68 80027F68 8001029C */  lwz       r0, 0x29c(r1)
/* 024F6C 80027F6C 98040019 */  stb       r0, 0x19(r4)
/* 024F70 80027F70 887C001A */  lbz       r3, 0x1a(r28)
/* 024F74 80027F74 881A001A */  lbz       r0, 0x1a(r26)
/* 024F78 80027F78 906102A4 */  stw       r3, 0x2a4(r1)
/* 024F7C 80027F7C 900102AC */  stw       r0, 0x2ac(r1)
/* 024F80 80027F80 93C102A0 */  stw       r30, 0x2a0(r1)
/* 024F84 80027F84 93C102A8 */  stw       r30, 0x2a8(r1)
/* 024F88 80027F88 C84102A0 */  lfd       f2, 0x2a0(r1)
/* 024F8C 80027F8C C82102A8 */  lfd       f1, 0x2a8(r1)
/* 024F90 80027F90 EC42F028 */  fsubs     f2, f2, f30
/* 024F94 80027F94 EC21F028 */  fsubs     f1, f1, f30
/* 024F98 80027F98 EC211028 */  fsubs     f1, f1, f2
/* 024F9C 80027F9C EC20107A */  fmadds    f1, f0, f1, f2
/* 024FA0 80027FA0 FC20081E */  fctiwz    f1, f1
/* 024FA4 80027FA4 D82102B0 */  stfd      f1, 0x2b0(r1)
/* 024FA8 80027FA8 800102B4 */  lwz       r0, 0x2b4(r1)
/* 024FAC 80027FAC 9804001A */  stb       r0, 0x1a(r4)
/* 024FB0 80027FB0 887C001B */  lbz       r3, 0x1b(r28)
/* 024FB4 80027FB4 881A001B */  lbz       r0, 0x1b(r26)
/* 024FB8 80027FB8 906102BC */  stw       r3, 0x2bc(r1)
/* 024FBC 80027FBC 900102C4 */  stw       r0, 0x2c4(r1)
/* 024FC0 80027FC0 93C102B8 */  stw       r30, 0x2b8(r1)
/* 024FC4 80027FC4 93C102C0 */  stw       r30, 0x2c0(r1)
/* 024FC8 80027FC8 C84102B8 */  lfd       f2, 0x2b8(r1)
/* 024FCC 80027FCC C82102C0 */  lfd       f1, 0x2c0(r1)
/* 024FD0 80027FD0 EC42F028 */  fsubs     f2, f2, f30
/* 024FD4 80027FD4 EC21F028 */  fsubs     f1, f1, f30
/* 024FD8 80027FD8 EC211028 */  fsubs     f1, f1, f2
/* 024FDC 80027FDC EC00107A */  fmadds    f0, f0, f1, f2
/* 024FE0 80027FE0 FC00001E */  fctiwz    f0, f0
/* 024FE4 80027FE4 D80102C8 */  stfd      f0, 0x2c8(r1)
/* 024FE8 80027FE8 800102CC */  lwz       r0, 0x2cc(r1)
/* 024FEC 80027FEC 9804001B */  stb       r0, 0x1b(r4)
lbl_80027FF0:
/* 024FF0 80027FF0 28050005 */  cmplwi    r5, 0x5
/* 024FF4 80027FF4 40820684 */  bne       lbl_80028678
/* 024FF8 80027FF8 C03B000C */  lfs       f1, 0xc(r27)
/* 024FFC 80027FFC C00101AC */  lfs       f0, 0x1ac(r1)
/* 025000 80028000 FC010000 */  fcmpu     cr0, f1, f0
/* 025004 80028004 40820230 */  bne       lbl_80028234
/* 025008 80028008 C03B0010 */  lfs       f1, 0x10(r27)
/* 02500C 8002800C C00101B0 */  lfs       f0, 0x1b0(r1)
/* 025010 80028010 FC010000 */  fcmpu     cr0, f1, f0
/* 025014 80028014 40820220 */  bne       lbl_80028234
/* 025018 80028018 C03B0014 */  lfs       f1, 0x14(r27)
/* 02501C 8002801C C00101B4 */  lfs       f0, 0x1b4(r1)
/* 025020 80028020 FC010000 */  fcmpu     cr0, f1, f0
/* 025024 80028024 40820210 */  bne       lbl_80028234
/* 025028 80028028 38600090 */  li        r3, 0x90
/* 02502C 8002802C 38800000 */  li        r4, 0x0
/* 025030 80028030 38A00009 */  li        r5, 0x9
/* 025034 80028034 48081F39 */  bl        GXBegin
/* 025038 80028038 C0E10198 */  lfs       f7, 0x198(r1)
/* 02503C 8002803C C0C10194 */  lfs       f6, 0x194(r1)
/* 025040 80028040 C0A10190 */  lfs       f5, 0x190(r1)
/* 025044 80028044 880101B8 */  lbz       r0, 0x1b8(r1)
/* 025048 80028048 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 02504C 8002804C 886101B9 */  lbz       r3, 0x1b9(r1)
/* 025050 80028050 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 025054 80028054 890101BA */  lbz       r8, 0x1ba(r1)
/* 025058 80028058 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 02505C 8002805C 892101BB */  lbz       r9, 0x1bb(r1)
/* 025060 80028060 88E1019F */  lbz       r7, 0x19f(r1)
/* 025064 80028064 88C1019E */  lbz       r6, 0x19e(r1)
/* 025068 80028068 88A1019D */  lbz       r5, 0x19d(r1)
/* 02506C 8002806C 8881019C */  lbz       r4, 0x19c(r1)
/* 025070 80028070 C00101A4 */  lfs       f0, 0x1a4(r1)
/* 025074 80028074 989F8000 */  stb       r4, -0x8000(r31)
/* 025078 80028078 C12101A8 */  lfs       f9, 0x1a8(r1)
/* 02507C 8002807C 98BF8000 */  stb       r5, -0x8000(r31)
/* 025080 80028080 98DF8000 */  stb       r6, -0x8000(r31)
/* 025084 80028084 98FF8000 */  stb       r7, -0x8000(r31)
/* 025088 80028088 C101018C */  lfs       f8, 0x18c(r1)
/* 02508C 8002808C C0810188 */  lfs       f4, 0x188(r1)
/* 025090 80028090 D09F8000 */  stfs      f4, -0x8000(r31)
/* 025094 80028094 D11F8000 */  stfs      f8, -0x8000(r31)
/* 025098 80028098 C06101B4 */  lfs       f3, 0x1b4(r1)
/* 02509C 8002809C C04101B0 */  lfs       f2, 0x1b0(r1)
/* 0250A0 800280A0 C02101AC */  lfs       f1, 0x1ac(r1)
/* 0250A4 800280A4 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0250A8 800280A8 D05F8000 */  stfs      f2, -0x8000(r31)
/* 0250AC 800280AC D07F8000 */  stfs      f3, -0x8000(r31)
/* 0250B0 800280B0 981F8000 */  stb       r0, -0x8000(r31)
/* 0250B4 800280B4 987F8000 */  stb       r3, -0x8000(r31)
/* 0250B8 800280B8 991F8000 */  stb       r8, -0x8000(r31)
/* 0250BC 800280BC 993F8000 */  stb       r9, -0x8000(r31)
/* 0250C0 800280C0 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0250C4 800280C4 D13F8000 */  stfs      f9, -0x8000(r31)
/* 0250C8 800280C8 C14101D0 */  lfs       f10, 0x1d0(r1)
/* 0250CC 800280CC C12101CC */  lfs       f9, 0x1cc(r1)
/* 0250D0 800280D0 C06101C8 */  lfs       f3, 0x1c8(r1)
/* 0250D4 800280D4 D07F8000 */  stfs      f3, -0x8000(r31)
/* 0250D8 800280D8 D13F8000 */  stfs      f9, -0x8000(r31)
/* 0250DC 800280DC D15F8000 */  stfs      f10, -0x8000(r31)
/* 0250E0 800280E0 894101D7 */  lbz       r10, 0x1d7(r1)
/* 0250E4 800280E4 892101D6 */  lbz       r9, 0x1d6(r1)
/* 0250E8 800280E8 890101D5 */  lbz       r8, 0x1d5(r1)
/* 0250EC 800280EC 886101D4 */  lbz       r3, 0x1d4(r1)
/* 0250F0 800280F0 987F8000 */  stb       r3, -0x8000(r31)
/* 0250F4 800280F4 991F8000 */  stb       r8, -0x8000(r31)
/* 0250F8 800280F8 993F8000 */  stb       r9, -0x8000(r31)
/* 0250FC 800280FC 995F8000 */  stb       r10, -0x8000(r31)
/* 025100 80028100 C16101C4 */  lfs       f11, 0x1c4(r1)
/* 025104 80028104 C04101C0 */  lfs       f2, 0x1c0(r1)
/* 025108 80028108 D05F8000 */  stfs      f2, -0x8000(r31)
/* 02510C 8002810C D17F8000 */  stfs      f11, -0x8000(r31)
/* 025110 80028110 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 025114 80028114 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 025118 80028118 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 02511C 8002811C 989F8000 */  stb       r4, -0x8000(r31)
/* 025120 80028120 98BF8000 */  stb       r5, -0x8000(r31)
/* 025124 80028124 98DF8000 */  stb       r6, -0x8000(r31)
/* 025128 80028128 98FF8000 */  stb       r7, -0x8000(r31)
/* 02512C 8002812C D09F8000 */  stfs      f4, -0x8000(r31)
/* 025130 80028130 D11F8000 */  stfs      f8, -0x8000(r31)
/* 025134 80028134 D07F8000 */  stfs      f3, -0x8000(r31)
/* 025138 80028138 D13F8000 */  stfs      f9, -0x8000(r31)
/* 02513C 8002813C D15F8000 */  stfs      f10, -0x8000(r31)
/* 025140 80028140 987F8000 */  stb       r3, -0x8000(r31)
/* 025144 80028144 991F8000 */  stb       r8, -0x8000(r31)
/* 025148 80028148 993F8000 */  stb       r9, -0x8000(r31)
/* 02514C 8002814C 995F8000 */  stb       r10, -0x8000(r31)
/* 025150 80028150 D05F8000 */  stfs      f2, -0x8000(r31)
/* 025154 80028154 D17F8000 */  stfs      f11, -0x8000(r31)
/* 025158 80028158 C0A10208 */  lfs       f5, 0x208(r1)
/* 02515C 8002815C C0810204 */  lfs       f4, 0x204(r1)
/* 025160 80028160 C0210200 */  lfs       f1, 0x200(r1)
/* 025164 80028164 D03F8000 */  stfs      f1, -0x8000(r31)
/* 025168 80028168 D09F8000 */  stfs      f4, -0x8000(r31)
/* 02516C 8002816C D0BF8000 */  stfs      f5, -0x8000(r31)
/* 025170 80028170 88C1020F */  lbz       r6, 0x20f(r1)
/* 025174 80028174 88A1020E */  lbz       r5, 0x20e(r1)
/* 025178 80028178 8881020D */  lbz       r4, 0x20d(r1)
/* 02517C 8002817C 8801020C */  lbz       r0, 0x20c(r1)
/* 025180 80028180 981F8000 */  stb       r0, -0x8000(r31)
/* 025184 80028184 989F8000 */  stb       r4, -0x8000(r31)
/* 025188 80028188 98BF8000 */  stb       r5, -0x8000(r31)
/* 02518C 8002818C 98DF8000 */  stb       r6, -0x8000(r31)
/* 025190 80028190 C0C101FC */  lfs       f6, 0x1fc(r1)
/* 025194 80028194 C00101F8 */  lfs       f0, 0x1f8(r1)
/* 025198 80028198 D01F8000 */  stfs      f0, -0x8000(r31)
/* 02519C 8002819C D0DF8000 */  stfs      f6, -0x8000(r31)
/* 0251A0 800281A0 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0251A4 800281A4 D09F8000 */  stfs      f4, -0x8000(r31)
/* 0251A8 800281A8 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 0251AC 800281AC 981F8000 */  stb       r0, -0x8000(r31)
/* 0251B0 800281B0 989F8000 */  stb       r4, -0x8000(r31)
/* 0251B4 800281B4 C02101E4 */  lfs       f1, 0x1e4(r1)
/* 0251B8 800281B8 98BF8000 */  stb       r5, -0x8000(r31)
/* 0251BC 800281BC C08101E8 */  lfs       f4, 0x1e8(r1)
/* 0251C0 800281C0 98DF8000 */  stb       r6, -0x8000(r31)
/* 0251C4 800281C4 C0A101EC */  lfs       f5, 0x1ec(r1)
/* 0251C8 800281C8 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0251CC 800281CC 880101F0 */  lbz       r0, 0x1f0(r1)
/* 0251D0 800281D0 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 0251D4 800281D4 888101F1 */  lbz       r4, 0x1f1(r1)
/* 0251D8 800281D8 D07F8000 */  stfs      f3, -0x8000(r31)
/* 0251DC 800281DC 88A101F2 */  lbz       r5, 0x1f2(r1)
/* 0251E0 800281E0 D13F8000 */  stfs      f9, -0x8000(r31)
/* 0251E4 800281E4 88C101F3 */  lbz       r6, 0x1f3(r1)
/* 0251E8 800281E8 D15F8000 */  stfs      f10, -0x8000(r31)
/* 0251EC 800281EC C00101DC */  lfs       f0, 0x1dc(r1)
/* 0251F0 800281F0 987F8000 */  stb       r3, -0x8000(r31)
/* 0251F4 800281F4 C06101E0 */  lfs       f3, 0x1e0(r1)
/* 0251F8 800281F8 991F8000 */  stb       r8, -0x8000(r31)
/* 0251FC 800281FC 993F8000 */  stb       r9, -0x8000(r31)
/* 025200 80028200 995F8000 */  stb       r10, -0x8000(r31)
/* 025204 80028204 D05F8000 */  stfs      f2, -0x8000(r31)
/* 025208 80028208 D17F8000 */  stfs      f11, -0x8000(r31)
/* 02520C 8002820C D03F8000 */  stfs      f1, -0x8000(r31)
/* 025210 80028210 D09F8000 */  stfs      f4, -0x8000(r31)
/* 025214 80028214 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 025218 80028218 981F8000 */  stb       r0, -0x8000(r31)
/* 02521C 8002821C 989F8000 */  stb       r4, -0x8000(r31)
/* 025220 80028220 98BF8000 */  stb       r5, -0x8000(r31)
/* 025224 80028224 98DF8000 */  stb       r6, -0x8000(r31)
/* 025228 80028228 D01F8000 */  stfs      f0, -0x8000(r31)
/* 02522C 8002822C D07F8000 */  stfs      f3, -0x8000(r31)
/* 025230 80028230 48000448 */  b         lbl_80028678
lbl_80028234:
/* 025234 80028234 C03A000C */  lfs       f1, 0xc(r26)
/* 025238 80028238 C00101E4 */  lfs       f0, 0x1e4(r1)
/* 02523C 8002823C FC010000 */  fcmpu     cr0, f1, f0
/* 025240 80028240 40820230 */  bne       lbl_80028470
/* 025244 80028244 C03A0010 */  lfs       f1, 0x10(r26)
/* 025248 80028248 C00101E8 */  lfs       f0, 0x1e8(r1)
/* 02524C 8002824C FC010000 */  fcmpu     cr0, f1, f0
/* 025250 80028250 40820220 */  bne       lbl_80028470
/* 025254 80028254 C03A0014 */  lfs       f1, 0x14(r26)
/* 025258 80028258 C00101EC */  lfs       f0, 0x1ec(r1)
/* 02525C 8002825C FC010000 */  fcmpu     cr0, f1, f0
/* 025260 80028260 40820210 */  bne       lbl_80028470
/* 025264 80028264 38600090 */  li        r3, 0x90
/* 025268 80028268 38800000 */  li        r4, 0x0
/* 02526C 8002826C 38A00009 */  li        r5, 0x9
/* 025270 80028270 48081CFD */  bl        GXBegin
/* 025274 80028274 C0010190 */  lfs       f0, 0x190(r1)
/* 025278 80028278 C0210194 */  lfs       f1, 0x194(r1)
/* 02527C 8002827C D01F8000 */  stfs      f0, -0x8000(r31)
/* 025280 80028280 C0010198 */  lfs       f0, 0x198(r1)
/* 025284 80028284 D03F8000 */  stfs      f1, -0x8000(r31)
/* 025288 80028288 8801019C */  lbz       r0, 0x19c(r1)
/* 02528C 8002828C D01F8000 */  stfs      f0, -0x8000(r31)
/* 025290 80028290 8861019D */  lbz       r3, 0x19d(r1)
/* 025294 80028294 981F8000 */  stb       r0, -0x8000(r31)
/* 025298 80028298 8801019E */  lbz       r0, 0x19e(r1)
/* 02529C 8002829C 987F8000 */  stb       r3, -0x8000(r31)
/* 0252A0 800282A0 8861019F */  lbz       r3, 0x19f(r1)
/* 0252A4 800282A4 981F8000 */  stb       r0, -0x8000(r31)
/* 0252A8 800282A8 C0010188 */  lfs       f0, 0x188(r1)
/* 0252AC 800282AC 987F8000 */  stb       r3, -0x8000(r31)
/* 0252B0 800282B0 C021018C */  lfs       f1, 0x18c(r1)
/* 0252B4 800282B4 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0252B8 800282B8 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0252BC 800282BC C0C101B4 */  lfs       f6, 0x1b4(r1)
/* 0252C0 800282C0 C0A101B0 */  lfs       f5, 0x1b0(r1)
/* 0252C4 800282C4 C08101AC */  lfs       f4, 0x1ac(r1)
/* 0252C8 800282C8 D09F8000 */  stfs      f4, -0x8000(r31)
/* 0252CC 800282CC D0BF8000 */  stfs      f5, -0x8000(r31)
/* 0252D0 800282D0 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 0252D4 800282D4 88E101BB */  lbz       r7, 0x1bb(r1)
/* 0252D8 800282D8 88C101BA */  lbz       r6, 0x1ba(r1)
/* 0252DC 800282DC 88A101B9 */  lbz       r5, 0x1b9(r1)
/* 0252E0 800282E0 888101B8 */  lbz       r4, 0x1b8(r1)
/* 0252E4 800282E4 989F8000 */  stb       r4, -0x8000(r31)
/* 0252E8 800282E8 98BF8000 */  stb       r5, -0x8000(r31)
/* 0252EC 800282EC 98DF8000 */  stb       r6, -0x8000(r31)
/* 0252F0 800282F0 98FF8000 */  stb       r7, -0x8000(r31)
/* 0252F4 800282F4 C0E101A8 */  lfs       f7, 0x1a8(r1)
/* 0252F8 800282F8 C06101A4 */  lfs       f3, 0x1a4(r1)
/* 0252FC 800282FC D07F8000 */  stfs      f3, -0x8000(r31)
/* 025300 80028300 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 025304 80028304 C1010208 */  lfs       f8, 0x208(r1)
/* 025308 80028308 C0410204 */  lfs       f2, 0x204(r1)
/* 02530C 8002830C C0210200 */  lfs       f1, 0x200(r1)
/* 025310 80028310 D03F8000 */  stfs      f1, -0x8000(r31)
/* 025314 80028314 D05F8000 */  stfs      f2, -0x8000(r31)
/* 025318 80028318 D11F8000 */  stfs      f8, -0x8000(r31)
/* 02531C 8002831C 8921020F */  lbz       r9, 0x20f(r1)
/* 025320 80028320 8901020E */  lbz       r8, 0x20e(r1)
/* 025324 80028324 8861020D */  lbz       r3, 0x20d(r1)
/* 025328 80028328 8801020C */  lbz       r0, 0x20c(r1)
/* 02532C 8002832C 981F8000 */  stb       r0, -0x8000(r31)
/* 025330 80028330 987F8000 */  stb       r3, -0x8000(r31)
/* 025334 80028334 991F8000 */  stb       r8, -0x8000(r31)
/* 025338 80028338 993F8000 */  stb       r9, -0x8000(r31)
/* 02533C 8002833C C12101FC */  lfs       f9, 0x1fc(r1)
/* 025340 80028340 C00101F8 */  lfs       f0, 0x1f8(r1)
/* 025344 80028344 D01F8000 */  stfs      f0, -0x8000(r31)
/* 025348 80028348 D13F8000 */  stfs      f9, -0x8000(r31)
/* 02534C 8002834C D03F8000 */  stfs      f1, -0x8000(r31)
/* 025350 80028350 D05F8000 */  stfs      f2, -0x8000(r31)
/* 025354 80028354 D11F8000 */  stfs      f8, -0x8000(r31)
/* 025358 80028358 981F8000 */  stb       r0, -0x8000(r31)
/* 02535C 8002835C 987F8000 */  stb       r3, -0x8000(r31)
/* 025360 80028360 991F8000 */  stb       r8, -0x8000(r31)
/* 025364 80028364 993F8000 */  stb       r9, -0x8000(r31)
/* 025368 80028368 D01F8000 */  stfs      f0, -0x8000(r31)
/* 02536C 8002836C D13F8000 */  stfs      f9, -0x8000(r31)
/* 025370 80028370 D09F8000 */  stfs      f4, -0x8000(r31)
/* 025374 80028374 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 025378 80028378 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 02537C 8002837C 989F8000 */  stb       r4, -0x8000(r31)
/* 025380 80028380 98BF8000 */  stb       r5, -0x8000(r31)
/* 025384 80028384 98DF8000 */  stb       r6, -0x8000(r31)
/* 025388 80028388 98FF8000 */  stb       r7, -0x8000(r31)
/* 02538C 8002838C D07F8000 */  stfs      f3, -0x8000(r31)
/* 025390 80028390 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 025394 80028394 C12101EC */  lfs       f9, 0x1ec(r1)
/* 025398 80028398 C10101E8 */  lfs       f8, 0x1e8(r1)
/* 02539C 8002839C C04101E4 */  lfs       f2, 0x1e4(r1)
/* 0253A0 800283A0 D05F8000 */  stfs      f2, -0x8000(r31)
/* 0253A4 800283A4 D11F8000 */  stfs      f8, -0x8000(r31)
/* 0253A8 800283A8 D13F8000 */  stfs      f9, -0x8000(r31)
/* 0253AC 800283AC 894101F3 */  lbz       r10, 0x1f3(r1)
/* 0253B0 800283B0 892101F2 */  lbz       r9, 0x1f2(r1)
/* 0253B4 800283B4 890101F1 */  lbz       r8, 0x1f1(r1)
/* 0253B8 800283B8 886101F0 */  lbz       r3, 0x1f0(r1)
/* 0253BC 800283BC 987F8000 */  stb       r3, -0x8000(r31)
/* 0253C0 800283C0 991F8000 */  stb       r8, -0x8000(r31)
/* 0253C4 800283C4 993F8000 */  stb       r9, -0x8000(r31)
/* 0253C8 800283C8 995F8000 */  stb       r10, -0x8000(r31)
/* 0253CC 800283CC C14101E0 */  lfs       f10, 0x1e0(r1)
/* 0253D0 800283D0 C02101DC */  lfs       f1, 0x1dc(r1)
/* 0253D4 800283D4 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0253D8 800283D8 D15F8000 */  stfs      f10, -0x8000(r31)
/* 0253DC 800283DC D09F8000 */  stfs      f4, -0x8000(r31)
/* 0253E0 800283E0 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 0253E4 800283E4 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 0253E8 800283E8 989F8000 */  stb       r4, -0x8000(r31)
/* 0253EC 800283EC 98BF8000 */  stb       r5, -0x8000(r31)
/* 0253F0 800283F0 98DF8000 */  stb       r6, -0x8000(r31)
/* 0253F4 800283F4 98FF8000 */  stb       r7, -0x8000(r31)
/* 0253F8 800283F8 C00101C8 */  lfs       f0, 0x1c8(r1)
/* 0253FC 800283FC D07F8000 */  stfs      f3, -0x8000(r31)
/* 025400 80028400 C06101CC */  lfs       f3, 0x1cc(r1)
/* 025404 80028404 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 025408 80028408 C08101D0 */  lfs       f4, 0x1d0(r1)
/* 02540C 8002840C D01F8000 */  stfs      f0, -0x8000(r31)
/* 025410 80028410 880101D4 */  lbz       r0, 0x1d4(r1)
/* 025414 80028414 D07F8000 */  stfs      f3, -0x8000(r31)
/* 025418 80028418 888101D5 */  lbz       r4, 0x1d5(r1)
/* 02541C 8002841C D09F8000 */  stfs      f4, -0x8000(r31)
/* 025420 80028420 88A101D6 */  lbz       r5, 0x1d6(r1)
/* 025424 80028424 981F8000 */  stb       r0, -0x8000(r31)
/* 025428 80028428 880101D7 */  lbz       r0, 0x1d7(r1)
/* 02542C 8002842C 989F8000 */  stb       r4, -0x8000(r31)
/* 025430 80028430 C00101C0 */  lfs       f0, 0x1c0(r1)
/* 025434 80028434 98BF8000 */  stb       r5, -0x8000(r31)
/* 025438 80028438 C06101C4 */  lfs       f3, 0x1c4(r1)
/* 02543C 8002843C 981F8000 */  stb       r0, -0x8000(r31)
/* 025440 80028440 D01F8000 */  stfs      f0, -0x8000(r31)
/* 025444 80028444 D07F8000 */  stfs      f3, -0x8000(r31)
/* 025448 80028448 D05F8000 */  stfs      f2, -0x8000(r31)
/* 02544C 8002844C D11F8000 */  stfs      f8, -0x8000(r31)
/* 025450 80028450 D13F8000 */  stfs      f9, -0x8000(r31)
/* 025454 80028454 987F8000 */  stb       r3, -0x8000(r31)
/* 025458 80028458 991F8000 */  stb       r8, -0x8000(r31)
/* 02545C 8002845C 993F8000 */  stb       r9, -0x8000(r31)
/* 025460 80028460 995F8000 */  stb       r10, -0x8000(r31)
/* 025464 80028464 D03F8000 */  stfs      f1, -0x8000(r31)
/* 025468 80028468 D15F8000 */  stfs      f10, -0x8000(r31)
/* 02546C 8002846C 4800020C */  b         lbl_80028678
lbl_80028470:
/* 025470 80028470 38600090 */  li        r3, 0x90
/* 025474 80028474 38800000 */  li        r4, 0x0
/* 025478 80028478 38A00009 */  li        r5, 0x9
/* 02547C 8002847C 48081AF1 */  bl        GXBegin
/* 025480 80028480 C0010190 */  lfs       f0, 0x190(r1)
/* 025484 80028484 C0210194 */  lfs       f1, 0x194(r1)
/* 025488 80028488 D01F8000 */  stfs      f0, -0x8000(r31)
/* 02548C 8002848C C0010198 */  lfs       f0, 0x198(r1)
/* 025490 80028490 D03F8000 */  stfs      f1, -0x8000(r31)
/* 025494 80028494 8801019C */  lbz       r0, 0x19c(r1)
/* 025498 80028498 D01F8000 */  stfs      f0, -0x8000(r31)
/* 02549C 8002849C 8861019D */  lbz       r3, 0x19d(r1)
/* 0254A0 800284A0 981F8000 */  stb       r0, -0x8000(r31)
/* 0254A4 800284A4 8801019E */  lbz       r0, 0x19e(r1)
/* 0254A8 800284A8 987F8000 */  stb       r3, -0x8000(r31)
/* 0254AC 800284AC 8861019F */  lbz       r3, 0x19f(r1)
/* 0254B0 800284B0 981F8000 */  stb       r0, -0x8000(r31)
/* 0254B4 800284B4 C0010188 */  lfs       f0, 0x188(r1)
/* 0254B8 800284B8 987F8000 */  stb       r3, -0x8000(r31)
/* 0254BC 800284BC C021018C */  lfs       f1, 0x18c(r1)
/* 0254C0 800284C0 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0254C4 800284C4 D03F8000 */  stfs      f1, -0x8000(r31)
/* 0254C8 800284C8 C0E101B4 */  lfs       f7, 0x1b4(r1)
/* 0254CC 800284CC C0C101B0 */  lfs       f6, 0x1b0(r1)
/* 0254D0 800284D0 C0A101AC */  lfs       f5, 0x1ac(r1)
/* 0254D4 800284D4 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 0254D8 800284D8 D0DF8000 */  stfs      f6, -0x8000(r31)
/* 0254DC 800284DC D0FF8000 */  stfs      f7, -0x8000(r31)
/* 0254E0 800284E0 88E101BB */  lbz       r7, 0x1bb(r1)
/* 0254E4 800284E4 88C101BA */  lbz       r6, 0x1ba(r1)
/* 0254E8 800284E8 88A101B9 */  lbz       r5, 0x1b9(r1)
/* 0254EC 800284EC 888101B8 */  lbz       r4, 0x1b8(r1)
/* 0254F0 800284F0 989F8000 */  stb       r4, -0x8000(r31)
/* 0254F4 800284F4 98BF8000 */  stb       r5, -0x8000(r31)
/* 0254F8 800284F8 98DF8000 */  stb       r6, -0x8000(r31)
/* 0254FC 800284FC 98FF8000 */  stb       r7, -0x8000(r31)
/* 025500 80028500 C10101A8 */  lfs       f8, 0x1a8(r1)
/* 025504 80028504 C08101A4 */  lfs       f4, 0x1a4(r1)
/* 025508 80028508 D09F8000 */  stfs      f4, -0x8000(r31)
/* 02550C 8002850C D11F8000 */  stfs      f8, -0x8000(r31)
/* 025510 80028510 C1410208 */  lfs       f10, 0x208(r1)
/* 025514 80028514 C1210204 */  lfs       f9, 0x204(r1)
/* 025518 80028518 C0610200 */  lfs       f3, 0x200(r1)
/* 02551C 8002851C D07F8000 */  stfs      f3, -0x8000(r31)
/* 025520 80028520 D13F8000 */  stfs      f9, -0x8000(r31)
/* 025524 80028524 D15F8000 */  stfs      f10, -0x8000(r31)
/* 025528 80028528 8941020F */  lbz       r10, 0x20f(r1)
/* 02552C 8002852C 8921020E */  lbz       r9, 0x20e(r1)
/* 025530 80028530 8901020D */  lbz       r8, 0x20d(r1)
/* 025534 80028534 8801020C */  lbz       r0, 0x20c(r1)
/* 025538 80028538 981F8000 */  stb       r0, -0x8000(r31)
/* 02553C 8002853C 991F8000 */  stb       r8, -0x8000(r31)
/* 025540 80028540 993F8000 */  stb       r9, -0x8000(r31)
/* 025544 80028544 995F8000 */  stb       r10, -0x8000(r31)
/* 025548 80028548 C16101FC */  lfs       f11, 0x1fc(r1)
/* 02554C 8002854C C00101F8 */  lfs       f0, 0x1f8(r1)
/* 025550 80028550 D01F8000 */  stfs      f0, -0x8000(r31)
/* 025554 80028554 D17F8000 */  stfs      f11, -0x8000(r31)
/* 025558 80028558 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 02555C 8002855C D0DF8000 */  stfs      f6, -0x8000(r31)
/* 025560 80028560 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 025564 80028564 989F8000 */  stb       r4, -0x8000(r31)
/* 025568 80028568 98BF8000 */  stb       r5, -0x8000(r31)
/* 02556C 8002856C 98DF8000 */  stb       r6, -0x8000(r31)
/* 025570 80028570 98FF8000 */  stb       r7, -0x8000(r31)
/* 025574 80028574 D09F8000 */  stfs      f4, -0x8000(r31)
/* 025578 80028578 D11F8000 */  stfs      f8, -0x8000(r31)
/* 02557C 8002857C C1A101EC */  lfs       f13, 0x1ec(r1)
/* 025580 80028580 C18101E8 */  lfs       f12, 0x1e8(r1)
/* 025584 80028584 C04101E4 */  lfs       f2, 0x1e4(r1)
/* 025588 80028588 D05F8000 */  stfs      f2, -0x8000(r31)
/* 02558C 8002858C D19F8000 */  stfs      f12, -0x8000(r31)
/* 025590 80028590 D1BF8000 */  stfs      f13, -0x8000(r31)
/* 025594 80028594 8B4101F3 */  lbz       r26, 0x1f3(r1)
/* 025598 80028598 898101F2 */  lbz       r12, 0x1f2(r1)
/* 02559C 8002859C 896101F1 */  lbz       r11, 0x1f1(r1)
/* 0255A0 800285A0 886101F0 */  lbz       r3, 0x1f0(r1)
/* 0255A4 800285A4 987F8000 */  stb       r3, -0x8000(r31)
/* 0255A8 800285A8 997F8000 */  stb       r11, -0x8000(r31)
/* 0255AC 800285AC 999F8000 */  stb       r12, -0x8000(r31)
/* 0255B0 800285B0 9B5F8000 */  stb       r26, -0x8000(r31)
/* 0255B4 800285B4 C3A101E0 */  lfs       f29, 0x1e0(r1)
/* 0255B8 800285B8 C02101DC */  lfs       f1, 0x1dc(r1)
/* 0255BC 800285BC D03F8000 */  stfs      f1, -0x8000(r31)
/* 0255C0 800285C0 D3BF8000 */  stfs      f29, -0x8000(r31)
/* 0255C4 800285C4 D07F8000 */  stfs      f3, -0x8000(r31)
/* 0255C8 800285C8 D13F8000 */  stfs      f9, -0x8000(r31)
/* 0255CC 800285CC D15F8000 */  stfs      f10, -0x8000(r31)
/* 0255D0 800285D0 981F8000 */  stb       r0, -0x8000(r31)
/* 0255D4 800285D4 991F8000 */  stb       r8, -0x8000(r31)
/* 0255D8 800285D8 993F8000 */  stb       r9, -0x8000(r31)
/* 0255DC 800285DC 995F8000 */  stb       r10, -0x8000(r31)
/* 0255E0 800285E0 D01F8000 */  stfs      f0, -0x8000(r31)
/* 0255E4 800285E4 D17F8000 */  stfs      f11, -0x8000(r31)
/* 0255E8 800285E8 D0BF8000 */  stfs      f5, -0x8000(r31)
/* 0255EC 800285EC D0DF8000 */  stfs      f6, -0x8000(r31)
/* 0255F0 800285F0 D0FF8000 */  stfs      f7, -0x8000(r31)
/* 0255F4 800285F4 989F8000 */  stb       r4, -0x8000(r31)
/* 0255F8 800285F8 98BF8000 */  stb       r5, -0x8000(r31)
/* 0255FC 800285FC 98DF8000 */  stb       r6, -0x8000(r31)
/* 025600 80028600 C00101C8 */  lfs       f0, 0x1c8(r1)
/* 025604 80028604 98FF8000 */  stb       r7, -0x8000(r31)
/* 025608 80028608 C06101CC */  lfs       f3, 0x1cc(r1)
/* 02560C 8002860C D09F8000 */  stfs      f4, -0x8000(r31)
/* 025610 80028610 C08101D0 */  lfs       f4, 0x1d0(r1)
/* 025614 80028614 D11F8000 */  stfs      f8, -0x8000(r31)
/* 025618 80028618 880101D4 */  lbz       r0, 0x1d4(r1)
/* 02561C 8002861C D01F8000 */  stfs      f0, -0x8000(r31)
/* 025620 80028620 888101D5 */  lbz       r4, 0x1d5(r1)
/* 025624 80028624 D07F8000 */  stfs      f3, -0x8000(r31)
/* 025628 80028628 88A101D6 */  lbz       r5, 0x1d6(r1)
/* 02562C 8002862C D09F8000 */  stfs      f4, -0x8000(r31)
/* 025630 80028630 88C101D7 */  lbz       r6, 0x1d7(r1)
/* 025634 80028634 981F8000 */  stb       r0, -0x8000(r31)
/* 025638 80028638 C00101C0 */  lfs       f0, 0x1c0(r1)
/* 02563C 8002863C 989F8000 */  stb       r4, -0x8000(r31)
/* 025640 80028640 C06101C4 */  lfs       f3, 0x1c4(r1)
/* 025644 80028644 98BF8000 */  stb       r5, -0x8000(r31)
/* 025648 80028648 98DF8000 */  stb       r6, -0x8000(r31)
/* 02564C 8002864C D01F8000 */  stfs      f0, -0x8000(r31)
/* 025650 80028650 D07F8000 */  stfs      f3, -0x8000(r31)
/* 025654 80028654 D05F8000 */  stfs      f2, -0x8000(r31)
/* 025658 80028658 D19F8000 */  stfs      f12, -0x8000(r31)
/* 02565C 8002865C D1BF8000 */  stfs      f13, -0x8000(r31)
/* 025660 80028660 987F8000 */  stb       r3, -0x8000(r31)
/* 025664 80028664 997F8000 */  stb       r11, -0x8000(r31)
/* 025668 80028668 999F8000 */  stb       r12, -0x8000(r31)
/* 02566C 8002866C 9B5F8000 */  stb       r26, -0x8000(r31)
/* 025670 80028670 D03F8000 */  stfs      f1, -0x8000(r31)
/* 025674 80028674 D3BF8000 */  stfs      f29, -0x8000(r31)
lbl_80028678:
/* 025678 80028678 3B390003 */  addi      r25, r25, 0x3
lbl_8002867C:
/* 02567C 8002867C 80170000 */  lwz       r0, 0x0(r23)
/* 025680 80028680 7C190000 */  cmpw      r25, r0
/* 025684 80028684 4180F1B0 */  blt       lbl_80027834
/* 025688 80028688 38600001 */  li        r3, 0x1
/* 02568C 8002868C BAC102D0 */  lmw       r22, 0x2d0(r1)
/* 025690 80028690 80010314 */  lwz       r0, 0x314(r1)
/* 025694 80028694 CBE10308 */  lfd       f31, 0x308(r1)
/* 025698 80028698 CBC10300 */  lfd       f30, 0x300(r1)
/* 02569C 8002869C 7C0803A6 */  mtlr      r0
/* 0256A0 800286A0 CBA102F8 */  lfd       f29, 0x2f8(r1)
/* 0256A4 800286A4 38210310 */  addi      r1, r1, 0x310
/* 0256A8 800286A8 4E800020 */  blr

glabel frameDrawTriangle_C1T3
/* 0256AC 800286AC 7C0802A6 */  mflr      r0
/* 0256B0 800286B0 90010004 */  stw       r0, 0x4(r1)
/* 0256B4 800286B4 9421FFB8 */  stwu      r1, -0x48(r1)
/* 0256B8 800286B8 93E10044 */  stw       r31, 0x44(r1)
/* 0256BC 800286BC 93C10040 */  stw       r30, 0x40(r1)
/* 0256C0 800286C0 93A1003C */  stw       r29, 0x3c(r1)
/* 0256C4 800286C4 7C7E1B78 */  mr        r30, r3
/* 0256C8 800286C8 7C9F2378 */  mr        r31, r4
/* 0256CC 800286CC 3FBE0004 */  addis     r29, r30, 0x4
/* 0256D0 800286D0 801DD138 */  lwz       r0, -0x2ec8(r29)
/* 0256D4 800286D4 28000017 */  cmplwi    r0, 0x17
/* 0256D8 800286D8 4182007C */  beq       lbl_80028754
/* 0256DC 800286DC 480805D1 */  bl        GXClearVtxDesc
/* 0256E0 800286E0 38600009 */  li        r3, 0x9
/* 0256E4 800286E4 38800001 */  li        r4, 0x1
/* 0256E8 800286E8 480800FD */  bl        GXSetVtxDesc
/* 0256EC 800286EC 3860000B */  li        r3, 0xb
/* 0256F0 800286F0 38800001 */  li        r4, 0x1
/* 0256F4 800286F4 480800F1 */  bl        GXSetVtxDesc
/* 0256F8 800286F8 3860000D */  li        r3, 0xd
/* 0256FC 800286FC 38800001 */  li        r4, 0x1
/* 025700 80028700 480800E5 */  bl        GXSetVtxDesc
/* 025704 80028704 38600000 */  li        r3, 0x0
/* 025708 80028708 38800009 */  li        r4, 0x9
/* 02570C 8002870C 38A00001 */  li        r5, 0x1
/* 025710 80028710 38C00004 */  li        r6, 0x4
/* 025714 80028714 38E00000 */  li        r7, 0x0
/* 025718 80028718 480805CD */  bl        GXSetVtxAttrFmt
/* 02571C 8002871C 38600000 */  li        r3, 0x0
/* 025720 80028720 3880000B */  li        r4, 0xb
/* 025724 80028724 38A00001 */  li        r5, 0x1
/* 025728 80028728 38C00005 */  li        r6, 0x5
/* 02572C 8002872C 38E00000 */  li        r7, 0x0
/* 025730 80028730 480805B5 */  bl        GXSetVtxAttrFmt
/* 025734 80028734 38600000 */  li        r3, 0x0
/* 025738 80028738 3880000D */  li        r4, 0xd
/* 02573C 8002873C 38A00001 */  li        r5, 0x1
/* 025740 80028740 38C00004 */  li        r6, 0x4
/* 025744 80028744 38E00000 */  li        r7, 0x0
/* 025748 80028748 4808059D */  bl        GXSetVtxAttrFmt
/* 02574C 8002874C 38000017 */  li        r0, 0x17
/* 025750 80028750 901DD138 */  stw       r0, -0x2ec8(r29)
lbl_80028754:
/* 025754 80028754 801F0000 */  lwz       r0, 0x0(r31)
/* 025758 80028758 38600090 */  li        r3, 0x90
/* 02575C 8002875C 38800000 */  li        r4, 0x0
/* 025760 80028760 5405043E */  clrlwi    r5, r0, 16
/* 025764 80028764 48081809 */  bl        GXBegin
/* 025768 80028768 397F0004 */  addi      r11, r31, 0x4
/* 02576C 8002876C 39400000 */  li        r10, 0x0
/* 025770 80028770 48000004 */  b         lbl_80028774
lbl_80028774:
/* 025774 80028774 3CA0CC01 */  lis       r5, 0xcc01
/* 025778 80028778 48000004 */  b         lbl_8002877C
lbl_8002877C:
/* 02577C 8002877C 480000F4 */  b         lbl_80028870
lbl_80028780:
/* 025780 80028780 7D2B5214 */  add       r9, r11, r10
/* 025784 80028784 88090000 */  lbz       r0, 0x0(r9)
/* 025788 80028788 394A0003 */  addi      r10, r10, 0x3
/* 02578C 8002878C 1C60001C */  mulli     r3, r0, 0x1c
/* 025790 80028790 38630358 */  addi      r3, r3, 0x358
/* 025794 80028794 7C7E1A14 */  add       r3, r30, r3
/* 025798 80028798 C0430014 */  lfs       f2, 0x14(r3)
/* 02579C 8002879C C0230010 */  lfs       f1, 0x10(r3)
/* 0257A0 800287A0 C003000C */  lfs       f0, 0xc(r3)
/* 0257A4 800287A4 D0058000 */  stfs      f0, -0x8000(r5)
/* 0257A8 800287A8 D0258000 */  stfs      f1, -0x8000(r5)
/* 0257AC 800287AC D0458000 */  stfs      f2, -0x8000(r5)
/* 0257B0 800287B0 8903001B */  lbz       r8, 0x1b(r3)
/* 0257B4 800287B4 88E3001A */  lbz       r7, 0x1a(r3)
/* 0257B8 800287B8 88C30019 */  lbz       r6, 0x19(r3)
/* 0257BC 800287BC 88830018 */  lbz       r4, 0x18(r3)
/* 0257C0 800287C0 98858000 */  stb       r4, -0x8000(r5)
/* 0257C4 800287C4 98C58000 */  stb       r6, -0x8000(r5)
/* 0257C8 800287C8 98E58000 */  stb       r7, -0x8000(r5)
/* 0257CC 800287CC 99058000 */  stb       r8, -0x8000(r5)
/* 0257D0 800287D0 C0230008 */  lfs       f1, 0x8(r3)
/* 0257D4 800287D4 C0030004 */  lfs       f0, 0x4(r3)
/* 0257D8 800287D8 D0058000 */  stfs      f0, -0x8000(r5)
/* 0257DC 800287DC D0258000 */  stfs      f1, -0x8000(r5)
/* 0257E0 800287E0 88090001 */  lbz       r0, 0x1(r9)
/* 0257E4 800287E4 1C60001C */  mulli     r3, r0, 0x1c
/* 0257E8 800287E8 38630358 */  addi      r3, r3, 0x358
/* 0257EC 800287EC 7C7E1A14 */  add       r3, r30, r3
/* 0257F0 800287F0 C0430014 */  lfs       f2, 0x14(r3)
/* 0257F4 800287F4 C0230010 */  lfs       f1, 0x10(r3)
/* 0257F8 800287F8 C003000C */  lfs       f0, 0xc(r3)
/* 0257FC 800287FC D0058000 */  stfs      f0, -0x8000(r5)
/* 025800 80028800 D0258000 */  stfs      f1, -0x8000(r5)
/* 025804 80028804 D0458000 */  stfs      f2, -0x8000(r5)
/* 025808 80028808 98858000 */  stb       r4, -0x8000(r5)
/* 02580C 8002880C 98C58000 */  stb       r6, -0x8000(r5)
/* 025810 80028810 98E58000 */  stb       r7, -0x8000(r5)
/* 025814 80028814 99058000 */  stb       r8, -0x8000(r5)
/* 025818 80028818 C0230008 */  lfs       f1, 0x8(r3)
/* 02581C 8002881C C0030004 */  lfs       f0, 0x4(r3)
/* 025820 80028820 D0058000 */  stfs      f0, -0x8000(r5)
/* 025824 80028824 D0258000 */  stfs      f1, -0x8000(r5)
/* 025828 80028828 88090002 */  lbz       r0, 0x2(r9)
/* 02582C 8002882C 1C60001C */  mulli     r3, r0, 0x1c
/* 025830 80028830 38630358 */  addi      r3, r3, 0x358
/* 025834 80028834 7C7E1A14 */  add       r3, r30, r3
/* 025838 80028838 C0430014 */  lfs       f2, 0x14(r3)
/* 02583C 8002883C C0230010 */  lfs       f1, 0x10(r3)
/* 025840 80028840 C003000C */  lfs       f0, 0xc(r3)
/* 025844 80028844 D0058000 */  stfs      f0, -0x8000(r5)
/* 025848 80028848 D0258000 */  stfs      f1, -0x8000(r5)
/* 02584C 8002884C D0458000 */  stfs      f2, -0x8000(r5)
/* 025850 80028850 98858000 */  stb       r4, -0x8000(r5)
/* 025854 80028854 98C58000 */  stb       r6, -0x8000(r5)
/* 025858 80028858 98E58000 */  stb       r7, -0x8000(r5)
/* 02585C 8002885C 99058000 */  stb       r8, -0x8000(r5)
/* 025860 80028860 C0230008 */  lfs       f1, 0x8(r3)
/* 025864 80028864 C0030004 */  lfs       f0, 0x4(r3)
/* 025868 80028868 D0058000 */  stfs      f0, -0x8000(r5)
/* 02586C 8002886C D0258000 */  stfs      f1, -0x8000(r5)
lbl_80028870:
/* 025870 80028870 801F0000 */  lwz       r0, 0x0(r31)
/* 025874 80028874 7C0A0000 */  cmpw      r10, r0
/* 025878 80028878 4180FF08 */  blt       lbl_80028780
/* 02587C 8002887C 38600001 */  li        r3, 0x1
/* 025880 80028880 8001004C */  lwz       r0, 0x4c(r1)
/* 025884 80028884 83E10044 */  lwz       r31, 0x44(r1)
/* 025888 80028888 83C10040 */  lwz       r30, 0x40(r1)
/* 02588C 8002888C 7C0803A6 */  mtlr      r0
/* 025890 80028890 83A1003C */  lwz       r29, 0x3c(r1)
/* 025894 80028894 38210048 */  addi      r1, r1, 0x48
/* 025898 80028898 4E800020 */  blr

glabel frameDrawTriangle_C0T3
/* 02589C 8002889C 7C0802A6 */  mflr      r0
/* 0258A0 800288A0 90010004 */  stw       r0, 0x4(r1)
/* 0258A4 800288A4 9421FFC8 */  stwu      r1, -0x38(r1)
/* 0258A8 800288A8 93E10034 */  stw       r31, 0x34(r1)
/* 0258AC 800288AC 93C10030 */  stw       r30, 0x30(r1)
/* 0258B0 800288B0 93A1002C */  stw       r29, 0x2c(r1)
/* 0258B4 800288B4 7C7E1B78 */  mr        r30, r3
/* 0258B8 800288B8 7C9F2378 */  mr        r31, r4
/* 0258BC 800288BC 3FBE0004 */  addis     r29, r30, 0x4
/* 0258C0 800288C0 801DD138 */  lwz       r0, -0x2ec8(r29)
/* 0258C4 800288C4 28000015 */  cmplwi    r0, 0x15
/* 0258C8 800288C8 41820058 */  beq       lbl_80028920
/* 0258CC 800288CC 480803E1 */  bl        GXClearVtxDesc
/* 0258D0 800288D0 38600009 */  li        r3, 0x9
/* 0258D4 800288D4 38800001 */  li        r4, 0x1
/* 0258D8 800288D8 4807FF0D */  bl        GXSetVtxDesc
/* 0258DC 800288DC 3860000D */  li        r3, 0xd
/* 0258E0 800288E0 38800001 */  li        r4, 0x1
/* 0258E4 800288E4 4807FF01 */  bl        GXSetVtxDesc
/* 0258E8 800288E8 38600000 */  li        r3, 0x0
/* 0258EC 800288EC 38800009 */  li        r4, 0x9
/* 0258F0 800288F0 38A00001 */  li        r5, 0x1
/* 0258F4 800288F4 38C00004 */  li        r6, 0x4
/* 0258F8 800288F8 38E00000 */  li        r7, 0x0
/* 0258FC 800288FC 480803E9 */  bl        GXSetVtxAttrFmt
/* 025900 80028900 38600000 */  li        r3, 0x0
/* 025904 80028904 3880000D */  li        r4, 0xd
/* 025908 80028908 38A00001 */  li        r5, 0x1
/* 02590C 8002890C 38C00004 */  li        r6, 0x4
/* 025910 80028910 38E00000 */  li        r7, 0x0
/* 025914 80028914 480803D1 */  bl        GXSetVtxAttrFmt
/* 025918 80028918 38000015 */  li        r0, 0x15
/* 02591C 8002891C 901DD138 */  stw       r0, -0x2ec8(r29)
lbl_80028920:
/* 025920 80028920 801F0000 */  lwz       r0, 0x0(r31)
/* 025924 80028924 38600090 */  li        r3, 0x90
/* 025928 80028928 38800000 */  li        r4, 0x0
/* 02592C 8002892C 5405043E */  clrlwi    r5, r0, 16
/* 025930 80028930 4808163D */  bl        GXBegin
/* 025934 80028934 38FF0004 */  addi      r7, r31, 0x4
/* 025938 80028938 38C00000 */  li        r6, 0x0
/* 02593C 8002893C 48000004 */  b         lbl_80028940
lbl_80028940:
/* 025940 80028940 3C80CC01 */  lis       r4, 0xcc01
/* 025944 80028944 48000004 */  b         lbl_80028948
lbl_80028948:
/* 025948 80028948 480000B4 */  b         lbl_800289FC
lbl_8002894C:
/* 02594C 8002894C 7CA73214 */  add       r5, r7, r6
/* 025950 80028950 88050000 */  lbz       r0, 0x0(r5)
/* 025954 80028954 38C60003 */  addi      r6, r6, 0x3
/* 025958 80028958 1C60001C */  mulli     r3, r0, 0x1c
/* 02595C 8002895C 38630358 */  addi      r3, r3, 0x358
/* 025960 80028960 7C7E1A14 */  add       r3, r30, r3
/* 025964 80028964 C0430014 */  lfs       f2, 0x14(r3)
/* 025968 80028968 C0230010 */  lfs       f1, 0x10(r3)
/* 02596C 8002896C C003000C */  lfs       f0, 0xc(r3)
/* 025970 80028970 D0048000 */  stfs      f0, -0x8000(r4)
/* 025974 80028974 D0248000 */  stfs      f1, -0x8000(r4)
/* 025978 80028978 D0448000 */  stfs      f2, -0x8000(r4)
/* 02597C 8002897C C0230008 */  lfs       f1, 0x8(r3)
/* 025980 80028980 C0030004 */  lfs       f0, 0x4(r3)
/* 025984 80028984 D0048000 */  stfs      f0, -0x8000(r4)
/* 025988 80028988 D0248000 */  stfs      f1, -0x8000(r4)
/* 02598C 8002898C 88050001 */  lbz       r0, 0x1(r5)
/* 025990 80028990 1C60001C */  mulli     r3, r0, 0x1c
/* 025994 80028994 38630358 */  addi      r3, r3, 0x358
/* 025998 80028998 7C7E1A14 */  add       r3, r30, r3
/* 02599C 8002899C C0430014 */  lfs       f2, 0x14(r3)
/* 0259A0 800289A0 C0230010 */  lfs       f1, 0x10(r3)
/* 0259A4 800289A4 C003000C */  lfs       f0, 0xc(r3)
/* 0259A8 800289A8 D0048000 */  stfs      f0, -0x8000(r4)
/* 0259AC 800289AC D0248000 */  stfs      f1, -0x8000(r4)
/* 0259B0 800289B0 D0448000 */  stfs      f2, -0x8000(r4)
/* 0259B4 800289B4 C0230008 */  lfs       f1, 0x8(r3)
/* 0259B8 800289B8 C0030004 */  lfs       f0, 0x4(r3)
/* 0259BC 800289BC D0048000 */  stfs      f0, -0x8000(r4)
/* 0259C0 800289C0 D0248000 */  stfs      f1, -0x8000(r4)
/* 0259C4 800289C4 88050002 */  lbz       r0, 0x2(r5)
/* 0259C8 800289C8 1C60001C */  mulli     r3, r0, 0x1c
/* 0259CC 800289CC 38630358 */  addi      r3, r3, 0x358
/* 0259D0 800289D0 7C7E1A14 */  add       r3, r30, r3
/* 0259D4 800289D4 C0430014 */  lfs       f2, 0x14(r3)
/* 0259D8 800289D8 C0230010 */  lfs       f1, 0x10(r3)
/* 0259DC 800289DC C003000C */  lfs       f0, 0xc(r3)
/* 0259E0 800289E0 D0048000 */  stfs      f0, -0x8000(r4)
/* 0259E4 800289E4 D0248000 */  stfs      f1, -0x8000(r4)
/* 0259E8 800289E8 D0448000 */  stfs      f2, -0x8000(r4)
/* 0259EC 800289EC C0230008 */  lfs       f1, 0x8(r3)
/* 0259F0 800289F0 C0030004 */  lfs       f0, 0x4(r3)
/* 0259F4 800289F4 D0048000 */  stfs      f0, -0x8000(r4)
/* 0259F8 800289F8 D0248000 */  stfs      f1, -0x8000(r4)
lbl_800289FC:
/* 0259FC 800289FC 801F0000 */  lwz       r0, 0x0(r31)
/* 025A00 80028A00 7C060000 */  cmpw      r6, r0
/* 025A04 80028A04 4180FF48 */  blt       lbl_8002894C
/* 025A08 80028A08 38600001 */  li        r3, 0x1
/* 025A0C 80028A0C 8001003C */  lwz       r0, 0x3c(r1)
/* 025A10 80028A10 83E10034 */  lwz       r31, 0x34(r1)
/* 025A14 80028A14 83C10030 */  lwz       r30, 0x30(r1)
/* 025A18 80028A18 7C0803A6 */  mtlr      r0
/* 025A1C 80028A1C 83A1002C */  lwz       r29, 0x2c(r1)
/* 025A20 80028A20 38210038 */  addi      r1, r1, 0x38
/* 025A24 80028A24 4E800020 */  blr

glabel frameDrawTriangle_C3T0
/* 025A28 80028A28 7C0802A6 */  mflr      r0
/* 025A2C 80028A2C 90010004 */  stw       r0, 0x4(r1)
/* 025A30 80028A30 9421FFC8 */  stwu      r1, -0x38(r1)
/* 025A34 80028A34 93E10034 */  stw       r31, 0x34(r1)
/* 025A38 80028A38 93C10030 */  stw       r30, 0x30(r1)
/* 025A3C 80028A3C 93A1002C */  stw       r29, 0x2c(r1)
/* 025A40 80028A40 7C7E1B78 */  mr        r30, r3
/* 025A44 80028A44 7C9F2378 */  mr        r31, r4
/* 025A48 80028A48 3FBE0004 */  addis     r29, r30, 0x4
/* 025A4C 80028A4C 801DD138 */  lwz       r0, -0x2ec8(r29)
/* 025A50 80028A50 28000013 */  cmplwi    r0, 0x13
/* 025A54 80028A54 41820058 */  beq       lbl_80028AAC
/* 025A58 80028A58 48080255 */  bl        GXClearVtxDesc
/* 025A5C 80028A5C 38600009 */  li        r3, 0x9
/* 025A60 80028A60 38800001 */  li        r4, 0x1
/* 025A64 80028A64 4807FD81 */  bl        GXSetVtxDesc
/* 025A68 80028A68 3860000B */  li        r3, 0xb
/* 025A6C 80028A6C 38800001 */  li        r4, 0x1
/* 025A70 80028A70 4807FD75 */  bl        GXSetVtxDesc
/* 025A74 80028A74 38600000 */  li        r3, 0x0
/* 025A78 80028A78 38800009 */  li        r4, 0x9
/* 025A7C 80028A7C 38A00001 */  li        r5, 0x1
/* 025A80 80028A80 38C00004 */  li        r6, 0x4
/* 025A84 80028A84 38E00000 */  li        r7, 0x0
/* 025A88 80028A88 4808025D */  bl        GXSetVtxAttrFmt
/* 025A8C 80028A8C 38600000 */  li        r3, 0x0
/* 025A90 80028A90 3880000B */  li        r4, 0xb
/* 025A94 80028A94 38A00001 */  li        r5, 0x1
/* 025A98 80028A98 38C00005 */  li        r6, 0x5
/* 025A9C 80028A9C 38E00000 */  li        r7, 0x0
/* 025AA0 80028AA0 48080245 */  bl        GXSetVtxAttrFmt
/* 025AA4 80028AA4 38000013 */  li        r0, 0x13
/* 025AA8 80028AA8 901DD138 */  stw       r0, -0x2ec8(r29)
lbl_80028AAC:
/* 025AAC 80028AAC 801F0000 */  lwz       r0, 0x0(r31)
/* 025AB0 80028AB0 38600090 */  li        r3, 0x90
/* 025AB4 80028AB4 38800000 */  li        r4, 0x0
/* 025AB8 80028AB8 5405043E */  clrlwi    r5, r0, 16
/* 025ABC 80028ABC 480814B1 */  bl        GXBegin
/* 025AC0 80028AC0 395F0004 */  addi      r10, r31, 0x4
/* 025AC4 80028AC4 39200000 */  li        r9, 0x0
/* 025AC8 80028AC8 48000004 */  b         lbl_80028ACC
lbl_80028ACC:
/* 025ACC 80028ACC 3C80CC01 */  lis       r4, 0xcc01
/* 025AD0 80028AD0 48000004 */  b         lbl_80028AD4
lbl_80028AD4:
/* 025AD4 80028AD4 480000E4 */  b         lbl_80028BB8
lbl_80028AD8:
/* 025AD8 80028AD8 7CEA4A14 */  add       r7, r10, r9
/* 025ADC 80028ADC 88070000 */  lbz       r0, 0x0(r7)
/* 025AE0 80028AE0 39290003 */  addi      r9, r9, 0x3
/* 025AE4 80028AE4 1C60001C */  mulli     r3, r0, 0x1c
/* 025AE8 80028AE8 39030358 */  addi      r8, r3, 0x358
/* 025AEC 80028AEC 7D1E4214 */  add       r8, r30, r8
/* 025AF0 80028AF0 C0480014 */  lfs       f2, 0x14(r8)
/* 025AF4 80028AF4 C0280010 */  lfs       f1, 0x10(r8)
/* 025AF8 80028AF8 C008000C */  lfs       f0, 0xc(r8)
/* 025AFC 80028AFC D0048000 */  stfs      f0, -0x8000(r4)
/* 025B00 80028B00 D0248000 */  stfs      f1, -0x8000(r4)
/* 025B04 80028B04 D0448000 */  stfs      f2, -0x8000(r4)
/* 025B08 80028B08 88C8001B */  lbz       r6, 0x1b(r8)
/* 025B0C 80028B0C 88A8001A */  lbz       r5, 0x1a(r8)
/* 025B10 80028B10 88680019 */  lbz       r3, 0x19(r8)
/* 025B14 80028B14 88080018 */  lbz       r0, 0x18(r8)
/* 025B18 80028B18 98048000 */  stb       r0, -0x8000(r4)
/* 025B1C 80028B1C 98648000 */  stb       r3, -0x8000(r4)
/* 025B20 80028B20 98A48000 */  stb       r5, -0x8000(r4)
/* 025B24 80028B24 98C48000 */  stb       r6, -0x8000(r4)
/* 025B28 80028B28 88070001 */  lbz       r0, 0x1(r7)
/* 025B2C 80028B2C 1C60001C */  mulli     r3, r0, 0x1c
/* 025B30 80028B30 39030358 */  addi      r8, r3, 0x358
/* 025B34 80028B34 7D1E4214 */  add       r8, r30, r8
/* 025B38 80028B38 C0480014 */  lfs       f2, 0x14(r8)
/* 025B3C 80028B3C C0280010 */  lfs       f1, 0x10(r8)
/* 025B40 80028B40 C008000C */  lfs       f0, 0xc(r8)
/* 025B44 80028B44 D0048000 */  stfs      f0, -0x8000(r4)
/* 025B48 80028B48 D0248000 */  stfs      f1, -0x8000(r4)
/* 025B4C 80028B4C D0448000 */  stfs      f2, -0x8000(r4)
/* 025B50 80028B50 88C8001B */  lbz       r6, 0x1b(r8)
/* 025B54 80028B54 88A8001A */  lbz       r5, 0x1a(r8)
/* 025B58 80028B58 88680019 */  lbz       r3, 0x19(r8)
/* 025B5C 80028B5C 88080018 */  lbz       r0, 0x18(r8)
/* 025B60 80028B60 98048000 */  stb       r0, -0x8000(r4)
/* 025B64 80028B64 98648000 */  stb       r3, -0x8000(r4)
/* 025B68 80028B68 98A48000 */  stb       r5, -0x8000(r4)
/* 025B6C 80028B6C 98C48000 */  stb       r6, -0x8000(r4)
/* 025B70 80028B70 88070002 */  lbz       r0, 0x2(r7)
/* 025B74 80028B74 1C60001C */  mulli     r3, r0, 0x1c
/* 025B78 80028B78 38E30358 */  addi      r7, r3, 0x358
/* 025B7C 80028B7C 7CFE3A14 */  add       r7, r30, r7
/* 025B80 80028B80 C0470014 */  lfs       f2, 0x14(r7)
/* 025B84 80028B84 C0270010 */  lfs       f1, 0x10(r7)
/* 025B88 80028B88 C007000C */  lfs       f0, 0xc(r7)
/* 025B8C 80028B8C D0048000 */  stfs      f0, -0x8000(r4)
/* 025B90 80028B90 D0248000 */  stfs      f1, -0x8000(r4)
/* 025B94 80028B94 D0448000 */  stfs      f2, -0x8000(r4)
/* 025B98 80028B98 88C7001B */  lbz       r6, 0x1b(r7)
/* 025B9C 80028B9C 88A7001A */  lbz       r5, 0x1a(r7)
/* 025BA0 80028BA0 88670019 */  lbz       r3, 0x19(r7)
/* 025BA4 80028BA4 88070018 */  lbz       r0, 0x18(r7)
/* 025BA8 80028BA8 98048000 */  stb       r0, -0x8000(r4)
/* 025BAC 80028BAC 98648000 */  stb       r3, -0x8000(r4)
/* 025BB0 80028BB0 98A48000 */  stb       r5, -0x8000(r4)
/* 025BB4 80028BB4 98C48000 */  stb       r6, -0x8000(r4)
lbl_80028BB8:
/* 025BB8 80028BB8 801F0000 */  lwz       r0, 0x0(r31)
/* 025BBC 80028BBC 7C090000 */  cmpw      r9, r0
/* 025BC0 80028BC0 4180FF18 */  blt       lbl_80028AD8
/* 025BC4 80028BC4 38600001 */  li        r3, 0x1
/* 025BC8 80028BC8 8001003C */  lwz       r0, 0x3c(r1)
/* 025BCC 80028BCC 83E10034 */  lwz       r31, 0x34(r1)
/* 025BD0 80028BD0 83C10030 */  lwz       r30, 0x30(r1)
/* 025BD4 80028BD4 7C0803A6 */  mtlr      r0
/* 025BD8 80028BD8 83A1002C */  lwz       r29, 0x2c(r1)
/* 025BDC 80028BDC 38210038 */  addi      r1, r1, 0x38
/* 025BE0 80028BE0 4E800020 */  blr

glabel frameDrawTriangle_C1T0
/* 025BE4 80028BE4 7C0802A6 */  mflr      r0
/* 025BE8 80028BE8 90010004 */  stw       r0, 0x4(r1)
/* 025BEC 80028BEC 9421FFC8 */  stwu      r1, -0x38(r1)
/* 025BF0 80028BF0 93E10034 */  stw       r31, 0x34(r1)
/* 025BF4 80028BF4 93C10030 */  stw       r30, 0x30(r1)
/* 025BF8 80028BF8 93A1002C */  stw       r29, 0x2c(r1)
/* 025BFC 80028BFC 7C7E1B78 */  mr        r30, r3
/* 025C00 80028C00 7C9F2378 */  mr        r31, r4
/* 025C04 80028C04 3FBE0004 */  addis     r29, r30, 0x4
/* 025C08 80028C08 801DD138 */  lwz       r0, -0x2ec8(r29)
/* 025C0C 80028C0C 28000013 */  cmplwi    r0, 0x13
/* 025C10 80028C10 41820058 */  beq       lbl_80028C68
/* 025C14 80028C14 48080099 */  bl        GXClearVtxDesc
/* 025C18 80028C18 38600009 */  li        r3, 0x9
/* 025C1C 80028C1C 38800001 */  li        r4, 0x1
/* 025C20 80028C20 4807FBC5 */  bl        GXSetVtxDesc
/* 025C24 80028C24 3860000B */  li        r3, 0xb
/* 025C28 80028C28 38800001 */  li        r4, 0x1
/* 025C2C 80028C2C 4807FBB9 */  bl        GXSetVtxDesc
/* 025C30 80028C30 38600000 */  li        r3, 0x0
/* 025C34 80028C34 38800009 */  li        r4, 0x9
/* 025C38 80028C38 38A00001 */  li        r5, 0x1
/* 025C3C 80028C3C 38C00004 */  li        r6, 0x4
/* 025C40 80028C40 38E00000 */  li        r7, 0x0
/* 025C44 80028C44 480800A1 */  bl        GXSetVtxAttrFmt
/* 025C48 80028C48 38600000 */  li        r3, 0x0
/* 025C4C 80028C4C 3880000B */  li        r4, 0xb
/* 025C50 80028C50 38A00001 */  li        r5, 0x1
/* 025C54 80028C54 38C00005 */  li        r6, 0x5
/* 025C58 80028C58 38E00000 */  li        r7, 0x0
/* 025C5C 80028C5C 48080089 */  bl        GXSetVtxAttrFmt
/* 025C60 80028C60 38000013 */  li        r0, 0x13
/* 025C64 80028C64 901DD138 */  stw       r0, -0x2ec8(r29)
lbl_80028C68:
/* 025C68 80028C68 801F0000 */  lwz       r0, 0x0(r31)
/* 025C6C 80028C6C 38600090 */  li        r3, 0x90
/* 025C70 80028C70 38800000 */  li        r4, 0x0
/* 025C74 80028C74 5405043E */  clrlwi    r5, r0, 16
/* 025C78 80028C78 480812F5 */  bl        GXBegin
/* 025C7C 80028C7C 397F0004 */  addi      r11, r31, 0x4
/* 025C80 80028C80 39400000 */  li        r10, 0x0
/* 025C84 80028C84 48000004 */  b         lbl_80028C88
lbl_80028C88:
/* 025C88 80028C88 3CA0CC01 */  lis       r5, 0xcc01
/* 025C8C 80028C8C 48000004 */  b         lbl_80028C90
lbl_80028C90:
/* 025C90 80028C90 480000C4 */  b         lbl_80028D54
lbl_80028C94:
/* 025C94 80028C94 7D2B5214 */  add       r9, r11, r10
/* 025C98 80028C98 88090000 */  lbz       r0, 0x0(r9)
/* 025C9C 80028C9C 394A0003 */  addi      r10, r10, 0x3
/* 025CA0 80028CA0 1C60001C */  mulli     r3, r0, 0x1c
/* 025CA4 80028CA4 38630358 */  addi      r3, r3, 0x358
/* 025CA8 80028CA8 7C7E1A14 */  add       r3, r30, r3
/* 025CAC 80028CAC C0430014 */  lfs       f2, 0x14(r3)
/* 025CB0 80028CB0 C0230010 */  lfs       f1, 0x10(r3)
/* 025CB4 80028CB4 C003000C */  lfs       f0, 0xc(r3)
/* 025CB8 80028CB8 D0058000 */  stfs      f0, -0x8000(r5)
/* 025CBC 80028CBC D0258000 */  stfs      f1, -0x8000(r5)
/* 025CC0 80028CC0 D0458000 */  stfs      f2, -0x8000(r5)
/* 025CC4 80028CC4 8903001B */  lbz       r8, 0x1b(r3)
/* 025CC8 80028CC8 88E3001A */  lbz       r7, 0x1a(r3)
/* 025CCC 80028CCC 88C30019 */  lbz       r6, 0x19(r3)
/* 025CD0 80028CD0 88830018 */  lbz       r4, 0x18(r3)
/* 025CD4 80028CD4 98858000 */  stb       r4, -0x8000(r5)
/* 025CD8 80028CD8 98C58000 */  stb       r6, -0x8000(r5)
/* 025CDC 80028CDC 98E58000 */  stb       r7, -0x8000(r5)
/* 025CE0 80028CE0 99058000 */  stb       r8, -0x8000(r5)
/* 025CE4 80028CE4 88090001 */  lbz       r0, 0x1(r9)
/* 025CE8 80028CE8 1C60001C */  mulli     r3, r0, 0x1c
/* 025CEC 80028CEC 38630358 */  addi      r3, r3, 0x358
/* 025CF0 80028CF0 7C7E1A14 */  add       r3, r30, r3
/* 025CF4 80028CF4 C0430014 */  lfs       f2, 0x14(r3)
/* 025CF8 80028CF8 C0230010 */  lfs       f1, 0x10(r3)
/* 025CFC 80028CFC C003000C */  lfs       f0, 0xc(r3)
/* 025D00 80028D00 D0058000 */  stfs      f0, -0x8000(r5)
/* 025D04 80028D04 D0258000 */  stfs      f1, -0x8000(r5)
/* 025D08 80028D08 D0458000 */  stfs      f2, -0x8000(r5)
/* 025D0C 80028D0C 98858000 */  stb       r4, -0x8000(r5)
/* 025D10 80028D10 98C58000 */  stb       r6, -0x8000(r5)
/* 025D14 80028D14 98E58000 */  stb       r7, -0x8000(r5)
/* 025D18 80028D18 99058000 */  stb       r8, -0x8000(r5)
/* 025D1C 80028D1C 88090002 */  lbz       r0, 0x2(r9)
/* 025D20 80028D20 1C60001C */  mulli     r3, r0, 0x1c
/* 025D24 80028D24 38630358 */  addi      r3, r3, 0x358
/* 025D28 80028D28 7C7E1A14 */  add       r3, r30, r3
/* 025D2C 80028D2C C0430014 */  lfs       f2, 0x14(r3)
/* 025D30 80028D30 C0230010 */  lfs       f1, 0x10(r3)
/* 025D34 80028D34 C003000C */  lfs       f0, 0xc(r3)
/* 025D38 80028D38 D0058000 */  stfs      f0, -0x8000(r5)
/* 025D3C 80028D3C D0258000 */  stfs      f1, -0x8000(r5)
/* 025D40 80028D40 D0458000 */  stfs      f2, -0x8000(r5)
/* 025D44 80028D44 98858000 */  stb       r4, -0x8000(r5)
/* 025D48 80028D48 98C58000 */  stb       r6, -0x8000(r5)
/* 025D4C 80028D4C 98E58000 */  stb       r7, -0x8000(r5)
/* 025D50 80028D50 99058000 */  stb       r8, -0x8000(r5)
lbl_80028D54:
/* 025D54 80028D54 801F0000 */  lwz       r0, 0x0(r31)
/* 025D58 80028D58 7C0A0000 */  cmpw      r10, r0
/* 025D5C 80028D5C 4180FF38 */  blt       lbl_80028C94
/* 025D60 80028D60 38600001 */  li        r3, 0x1
/* 025D64 80028D64 8001003C */  lwz       r0, 0x3c(r1)
/* 025D68 80028D68 83E10034 */  lwz       r31, 0x34(r1)
/* 025D6C 80028D6C 83C10030 */  lwz       r30, 0x30(r1)
/* 025D70 80028D70 7C0803A6 */  mtlr      r0
/* 025D74 80028D74 83A1002C */  lwz       r29, 0x2c(r1)
/* 025D78 80028D78 38210038 */  addi      r1, r1, 0x38
/* 025D7C 80028D7C 4E800020 */  blr

glabel frameDrawTriangle_C0T0
/* 025D80 80028D80 7C0802A6 */  mflr      r0
/* 025D84 80028D84 90010004 */  stw       r0, 0x4(r1)
/* 025D88 80028D88 9421FFD0 */  stwu      r1, -0x30(r1)
/* 025D8C 80028D8C 93E1002C */  stw       r31, 0x2c(r1)
/* 025D90 80028D90 93C10028 */  stw       r30, 0x28(r1)
/* 025D94 80028D94 93A10024 */  stw       r29, 0x24(r1)
/* 025D98 80028D98 7C7E1B78 */  mr        r30, r3
/* 025D9C 80028D9C 7C9F2378 */  mr        r31, r4
/* 025DA0 80028DA0 3FBE0004 */  addis     r29, r30, 0x4
/* 025DA4 80028DA4 801DD138 */  lwz       r0, -0x2ec8(r29)
/* 025DA8 80028DA8 28000011 */  cmplwi    r0, 0x11
/* 025DAC 80028DAC 41820034 */  beq       lbl_80028DE0
/* 025DB0 80028DB0 4807FEFD */  bl        GXClearVtxDesc
/* 025DB4 80028DB4 38600009 */  li        r3, 0x9
/* 025DB8 80028DB8 38800001 */  li        r4, 0x1
/* 025DBC 80028DBC 4807FA29 */  bl        GXSetVtxDesc
/* 025DC0 80028DC0 38600000 */  li        r3, 0x0
/* 025DC4 80028DC4 38800009 */  li        r4, 0x9
/* 025DC8 80028DC8 38A00001 */  li        r5, 0x1
/* 025DCC 80028DCC 38C00004 */  li        r6, 0x4
/* 025DD0 80028DD0 38E00000 */  li        r7, 0x0
/* 025DD4 80028DD4 4807FF11 */  bl        GXSetVtxAttrFmt
/* 025DD8 80028DD8 38000011 */  li        r0, 0x11
/* 025DDC 80028DDC 901DD138 */  stw       r0, -0x2ec8(r29)
lbl_80028DE0:
/* 025DE0 80028DE0 801F0000 */  lwz       r0, 0x0(r31)
/* 025DE4 80028DE4 38600090 */  li        r3, 0x90
/* 025DE8 80028DE8 38800000 */  li        r4, 0x0
/* 025DEC 80028DEC 5405043E */  clrlwi    r5, r0, 16
/* 025DF0 80028DF0 4808117D */  bl        GXBegin
/* 025DF4 80028DF4 38FF0004 */  addi      r7, r31, 0x4
/* 025DF8 80028DF8 38C00000 */  li        r6, 0x0
/* 025DFC 80028DFC 48000004 */  b         lbl_80028E00
lbl_80028E00:
/* 025E00 80028E00 3C80CC01 */  lis       r4, 0xcc01
/* 025E04 80028E04 48000004 */  b         lbl_80028E08
lbl_80028E08:
/* 025E08 80028E08 48000084 */  b         lbl_80028E8C
lbl_80028E0C:
/* 025E0C 80028E0C 7CA73214 */  add       r5, r7, r6
/* 025E10 80028E10 88050000 */  lbz       r0, 0x0(r5)
/* 025E14 80028E14 38C60003 */  addi      r6, r6, 0x3
/* 025E18 80028E18 1C60001C */  mulli     r3, r0, 0x1c
/* 025E1C 80028E1C 38630358 */  addi      r3, r3, 0x358
/* 025E20 80028E20 7C7E1A14 */  add       r3, r30, r3
/* 025E24 80028E24 C0430014 */  lfs       f2, 0x14(r3)
/* 025E28 80028E28 C0230010 */  lfs       f1, 0x10(r3)
/* 025E2C 80028E2C C003000C */  lfs       f0, 0xc(r3)
/* 025E30 80028E30 D0048000 */  stfs      f0, -0x8000(r4)
/* 025E34 80028E34 D0248000 */  stfs      f1, -0x8000(r4)
/* 025E38 80028E38 D0448000 */  stfs      f2, -0x8000(r4)
/* 025E3C 80028E3C 88050001 */  lbz       r0, 0x1(r5)
/* 025E40 80028E40 1C60001C */  mulli     r3, r0, 0x1c
/* 025E44 80028E44 38630358 */  addi      r3, r3, 0x358
/* 025E48 80028E48 7C7E1A14 */  add       r3, r30, r3
/* 025E4C 80028E4C C0430014 */  lfs       f2, 0x14(r3)
/* 025E50 80028E50 C0230010 */  lfs       f1, 0x10(r3)
/* 025E54 80028E54 C003000C */  lfs       f0, 0xc(r3)
/* 025E58 80028E58 D0048000 */  stfs      f0, -0x8000(r4)
/* 025E5C 80028E5C D0248000 */  stfs      f1, -0x8000(r4)
/* 025E60 80028E60 D0448000 */  stfs      f2, -0x8000(r4)
/* 025E64 80028E64 88050002 */  lbz       r0, 0x2(r5)
/* 025E68 80028E68 1C60001C */  mulli     r3, r0, 0x1c
/* 025E6C 80028E6C 38630358 */  addi      r3, r3, 0x358
/* 025E70 80028E70 7C7E1A14 */  add       r3, r30, r3
/* 025E74 80028E74 C0430014 */  lfs       f2, 0x14(r3)
/* 025E78 80028E78 C0230010 */  lfs       f1, 0x10(r3)
/* 025E7C 80028E7C C003000C */  lfs       f0, 0xc(r3)
/* 025E80 80028E80 D0048000 */  stfs      f0, -0x8000(r4)
/* 025E84 80028E84 D0248000 */  stfs      f1, -0x8000(r4)
/* 025E88 80028E88 D0448000 */  stfs      f2, -0x8000(r4)
lbl_80028E8C:
/* 025E8C 80028E8C 801F0000 */  lwz       r0, 0x0(r31)
/* 025E90 80028E90 7C060000 */  cmpw      r6, r0
/* 025E94 80028E94 4180FF78 */  blt       lbl_80028E0C
/* 025E98 80028E98 38600001 */  li        r3, 0x1
/* 025E9C 80028E9C 80010034 */  lwz       r0, 0x34(r1)
/* 025EA0 80028EA0 83E1002C */  lwz       r31, 0x2c(r1)
/* 025EA4 80028EA4 83C10028 */  lwz       r30, 0x28(r1)
/* 025EA8 80028EA8 7C0803A6 */  mtlr      r0
/* 025EAC 80028EAC 83A10024 */  lwz       r29, 0x24(r1)
/* 025EB0 80028EB0 38210030 */  addi      r1, r1, 0x30
/* 025EB4 80028EB4 4E800020 */  blr

glabel frameDrawSetupDP
/* 025EB8 80028EB8 7C0802A6 */  mflr      r0
/* 025EBC 80028EBC 90010004 */  stw       r0, 0x4(r1)
/* 025EC0 80028EC0 9421FFC8 */  stwu      r1, -0x38(r1)
/* 025EC4 80028EC4 93E10034 */  stw       r31, 0x34(r1)
/* 025EC8 80028EC8 93C10030 */  stw       r30, 0x30(r1)
/* 025ECC 80028ECC 7C7F1B78 */  mr        r31, r3
/* 025ED0 80028ED0 807F007C */  lwz       r3, 0x7c(r31)
/* 025ED4 80028ED4 546005EE */  rlwinm    r0, r3, 0, 23, 23
/* 025ED8 80028ED8 28000000 */  cmplwi    r0, 0x0
/* 025EDC 80028EDC 41820188 */  beq       lbl_80029064
/* 025EE0 80028EE0 5460062C */  rlwinm    r0, r3, 0, 24, 22
/* 025EE4 80028EE4 901F007C */  stw       r0, 0x7c(r31)
/* 025EE8 80028EE8 801F00A4 */  lwz       r0, 0xa4(r31)
/* 025EEC 80028EEC 54030296 */  rlwinm    r3, r0, 0, 10, 11
/* 025EF0 80028EF0 3C03FFD0 */  subis     r0, r3, 0x30
/* 025EF4 80028EF4 28000000 */  cmplwi    r0, 0x0
/* 025EF8 80028EF8 408200C0 */  bne       lbl_80028FB8
/* 025EFC 80028EFC 38000000 */  li        r0, 0x0
/* 025F00 80028F00 90040000 */  stw       r0, 0x0(r4)
/* 025F04 80028F04 38600001 */  li        r3, 0x1
/* 025F08 80028F08 90050000 */  stw       r0, 0x0(r5)
/* 025F0C 80028F0C 48083CF9 */  bl        GXSetNumTevStages
/* 025F10 80028F10 38600001 */  li        r3, 0x1
/* 025F14 80028F14 4808226D */  bl        GXSetNumChans
/* 025F18 80028F18 38600000 */  li        r3, 0x0
/* 025F1C 80028F1C 480808A1 */  bl        GXSetNumTexGens
/* 025F20 80028F20 38600000 */  li        r3, 0x0
/* 025F24 80028F24 3880000F */  li        r4, 0xf
/* 025F28 80028F28 38A0000F */  li        r5, 0xf
/* 025F2C 80028F2C 38C0000F */  li        r6, 0xf
/* 025F30 80028F30 38E00006 */  li        r7, 0x6
/* 025F34 80028F34 480835A9 */  bl        GXSetTevColorIn
/* 025F38 80028F38 38600000 */  li        r3, 0x0
/* 025F3C 80028F3C 38800007 */  li        r4, 0x7
/* 025F40 80028F40 38A00007 */  li        r5, 0x7
/* 025F44 80028F44 38C00007 */  li        r6, 0x7
/* 025F48 80028F48 38E00003 */  li        r7, 0x3
/* 025F4C 80028F4C 480835D5 */  bl        GXSetTevAlphaIn
/* 025F50 80028F50 38600000 */  li        r3, 0x0
/* 025F54 80028F54 38800000 */  li        r4, 0x0
/* 025F58 80028F58 38A00000 */  li        r5, 0x0
/* 025F5C 80028F5C 38C00000 */  li        r6, 0x0
/* 025F60 80028F60 38E00000 */  li        r7, 0x0
/* 025F64 80028F64 39000000 */  li        r8, 0x0
/* 025F68 80028F68 480835FD */  bl        GXSetTevColorOp
/* 025F6C 80028F6C 38600000 */  li        r3, 0x0
/* 025F70 80028F70 38800000 */  li        r4, 0x0
/* 025F74 80028F74 38A00000 */  li        r5, 0x0
/* 025F78 80028F78 38C00000 */  li        r6, 0x0
/* 025F7C 80028F7C 38E00000 */  li        r7, 0x0
/* 025F80 80028F80 39000000 */  li        r8, 0x0
/* 025F84 80028F84 48083649 */  bl        GXSetTevAlphaOp
/* 025F88 80028F88 3C7F0004 */  addis     r3, r31, 0x4
/* 025F8C 80028F8C 8003D128 */  lwz       r0, -0x2ed8(r3)
/* 025F90 80028F90 3881001C */  addi      r4, r1, 0x1c
/* 025F94 80028F94 38600003 */  li        r3, 0x3
/* 025F98 80028F98 9001001C */  stw       r0, 0x1c(r1)
/* 025F9C 80028F9C 48083699 */  bl        GXSetTevColor
/* 025FA0 80028FA0 38600000 */  li        r3, 0x0
/* 025FA4 80028FA4 388000FF */  li        r4, 0xff
/* 025FA8 80028FA8 38A000FF */  li        r5, 0xff
/* 025FAC 80028FAC 38C000FF */  li        r6, 0xff
/* 025FB0 80028FB0 48083A7D */  bl        GXSetTevOrder
/* 025FB4 80028FB4 480000B0 */  b         lbl_80029064
lbl_80028FB8:
/* 025FB8 80028FB8 3C03FFE0 */  subis     r0, r3, 0x20
/* 025FBC 80028FBC 28000000 */  cmplwi    r0, 0x0
/* 025FC0 80028FC0 40820040 */  bne       lbl_80029000
/* 025FC4 80028FC4 38600001 */  li        r3, 0x1
/* 025FC8 80028FC8 48083C3D */  bl        GXSetNumTevStages
/* 025FCC 80028FCC 38600000 */  li        r3, 0x0
/* 025FD0 80028FD0 480821B1 */  bl        GXSetNumChans
/* 025FD4 80028FD4 38600001 */  li        r3, 0x1
/* 025FD8 80028FD8 480807E5 */  bl        GXSetNumTexGens
/* 025FDC 80028FDC 38600000 */  li        r3, 0x0
/* 025FE0 80028FE0 38800003 */  li        r4, 0x3
/* 025FE4 80028FE4 4808346D */  bl        GXSetTevOp
/* 025FE8 80028FE8 38600000 */  li        r3, 0x0
/* 025FEC 80028FEC 38800000 */  li        r4, 0x0
/* 025FF0 80028FF0 38A00000 */  li        r5, 0x0
/* 025FF4 80028FF4 38C000FF */  li        r6, 0xff
/* 025FF8 80028FF8 48083A35 */  bl        GXSetTevOrder
/* 025FFC 80028FFC 48000068 */  b         lbl_80029064
lbl_80029000:
/* 026000 80029000 3C000010 */  lis       r0, 0x10
/* 026004 80029004 7C030050 */  subf      r0, r3, r0
/* 026008 80029008 7C000034 */  cntlzw    r0, r0
/* 02600C 8002900C 5403D97E */  srwi      r3, r0, 5
/* 026010 80029010 3BC30001 */  addi      r30, r3, 0x1
/* 026014 80029014 7FE3FB78 */  mr        r3, r31
/* 026018 80029018 7FC4F378 */  mr        r4, r30
/* 02601C 8002901C 4806E549 */  bl        SetTevStageTable
/* 026020 80029020 2C030000 */  cmpwi     r3, 0x0
/* 026024 80029024 40820040 */  bne       lbl_80029064
/* 026028 80029028 1C7E0005 */  mulli     r3, r30, 0x5
/* 02602C 8002902C 48083BD9 */  bl        GXSetNumTevStages
/* 026030 80029030 7FE3FB78 */  mr        r3, r31
/* 026034 80029034 7FC4F378 */  mr        r4, r30
/* 026038 80029038 4806E971 */  bl        SetNumTexGensChans
/* 02603C 8002903C 7FE3FB78 */  mr        r3, r31
/* 026040 80029040 7FC5F378 */  mr        r5, r30
/* 026044 80029044 38800000 */  li        r4, 0x0
/* 026048 80029048 4806E5DD */  bl        SetTevStages
/* 02604C 8002904C 2C1E0002 */  cmpwi     r30, 0x2
/* 026050 80029050 40820014 */  bne       lbl_80029064
/* 026054 80029054 7FE3FB78 */  mr        r3, r31
/* 026058 80029058 7FC5F378 */  mr        r5, r30
/* 02605C 8002905C 38800001 */  li        r4, 0x1
/* 026060 80029060 4806E5C5 */  bl        SetTevStages
lbl_80029064:
/* 026064 80029064 807F007C */  lwz       r3, 0x7c(r31)
/* 026068 80029068 70600220 */  andi.     r0, r3, 0x220
/* 02606C 8002906C 28000000 */  cmplwi    r0, 0x0
/* 026070 80029070 4182009C */  beq       lbl_8002910C
/* 026074 80029074 546006F2 */  rlwinm    r0, r3, 0, 27, 25
/* 026078 80029078 901F007C */  stw       r0, 0x7c(r31)
/* 02607C 8002907C 801F0094 */  lwz       r0, 0x94(r31)
/* 026080 80029080 540006F6 */  rlwinm    r0, r0, 0, 27, 27
/* 026084 80029084 28000000 */  cmplwi    r0, 0x0
/* 026088 80029088 41820050 */  beq       lbl_800290D8
/* 02608C 8002908C 806D8914 */  lwz       r3, gpSystem@sda21(r0)
/* 026090 80029090 80030020 */  lwz       r0, 0x20(r3)
/* 026094 80029094 2C000006 */  cmpwi     r0, 0x6
/* 026098 80029098 40800028 */  bge       lbl_800290C0
/* 02609C 8002909C 2C000004 */  cmpwi     r0, 0x4
/* 0260A0 800290A0 40800008 */  bge       lbl_800290A8
/* 0260A4 800290A4 4800001C */  b         lbl_800290C0
lbl_800290A8:
/* 0260A8 800290A8 7FE3FB78 */  mr        r3, r31
/* 0260AC 800290AC 48003239 */  bl        frameDrawSetupFog_Zelda1
/* 0260B0 800290B0 2C030000 */  cmpwi     r3, 0x0
/* 0260B4 800290B4 4082004C */  bne       lbl_80029100
/* 0260B8 800290B8 38600000 */  li        r3, 0x0
/* 0260BC 800290BC 48000350 */  b         lbl_8002940C
lbl_800290C0:
/* 0260C0 800290C0 7FE3FB78 */  mr        r3, r31
/* 0260C4 800290C4 48002F1D */  bl        frameDrawSetupFog_Default
/* 0260C8 800290C8 2C030000 */  cmpwi     r3, 0x0
/* 0260CC 800290CC 40820034 */  bne       lbl_80029100
/* 0260D0 800290D0 38600000 */  li        r3, 0x0
/* 0260D4 800290D4 48000338 */  b         lbl_8002940C
lbl_800290D8:
/* 0260D8 800290D8 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 0260DC 800290DC 3C7F0004 */  addis     r3, r31, 0x4
/* 0260E0 800290E0 8003D124 */  lwz       r0, -0x2edc(r3)
/* 0260E4 800290E4 38810018 */  addi      r4, r1, 0x18
/* 0260E8 800290E8 FC400890 */  fmr       f2, f1
/* 0260EC 800290EC FC600890 */  fmr       f3, f1
/* 0260F0 800290F0 90010018 */  stw       r0, 0x18(r1)
/* 0260F4 800290F4 C08281C8 */  lfs       f4, D_8018C108@sda21(r0)
/* 0260F8 800290F8 38600000 */  li        r3, 0x0
/* 0260FC 800290FC 48083B39 */  bl        fn_800ACC34
lbl_80029100:
/* 026100 80029100 801F008C */  lwz       r0, 0x8c(r31)
/* 026104 80029104 54000080 */  rlwinm    r0, r0, 0, 2, 0
/* 026108 80029108 901F008C */  stw       r0, 0x8c(r31)
lbl_8002910C:
/* 02610C 8002910C 807F007C */  lwz       r3, 0x7c(r31)
/* 026110 80029110 546005AC */  rlwinm    r0, r3, 0, 22, 22
/* 026114 80029114 28000000 */  cmplwi    r0, 0x0
/* 026118 80029118 418202F0 */  beq       lbl_80029408
/* 02611C 8002911C 546005EA */  rlwinm    r0, r3, 0, 23, 21
/* 026120 80029120 901F007C */  stw       r0, 0x7c(r31)
/* 026124 80029124 83DF00A0 */  lwz       r30, 0xa0(r31)
/* 026128 80029128 57C3001E */  clrrwi    r3, r30, 16
/* 02612C 8002912C 3C0350B0 */  addis     r0, r3, 0x50b0
/* 026130 80029130 28000000 */  cmplwi    r0, 0x0
/* 026134 80029134 40820010 */  bne       lbl_80029144
/* 026138 80029138 38600000 */  li        r3, 0x0
/* 02613C 8002913C 48083FC5 */  bl        fn_800AD100
/* 026140 80029140 4800000C */  b         lbl_8002914C
lbl_80029144:
/* 026144 80029144 38600001 */  li        r3, 0x1
/* 026148 80029148 48083FB9 */  bl        fn_800AD100
lbl_8002914C:
/* 02614C 8002914C 77C33333 */  andis.    r3, r30, 0x3333
/* 026150 80029150 801F00A4 */  lwz       r0, 0xa4(r31)
/* 026154 80029154 54040296 */  rlwinm    r4, r0, 0, 10, 11
/* 026158 80029158 3C03FFF0 */  subis     r0, r3, 0x10
/* 02615C 8002915C 28000000 */  cmplwi    r0, 0x0
/* 026160 80029160 40820010 */  bne       lbl_80029170
/* 026164 80029164 3C04FFF0 */  subis     r0, r4, 0x10
/* 026168 80029168 28000000 */  cmplwi    r0, 0x0
/* 02616C 8002916C 41820014 */  beq       lbl_80029180
lbl_80029170:
/* 026170 80029170 77C3CCCC */  andis.    r3, r30, 0xcccc
/* 026174 80029174 3C03FFC0 */  subis     r0, r3, 0x40
/* 026178 80029178 28000000 */  cmplwi    r0, 0x0
/* 02617C 8002917C 40820090 */  bne       lbl_8002920C
lbl_80029180:
/* 026180 80029180 38600000 */  li        r3, 0x0
/* 026184 80029184 48084009 */  bl        fn_800AD18C
/* 026188 80029188 38600001 */  li        r3, 0x1
/* 02618C 8002918C 38800004 */  li        r4, 0x4
/* 026190 80029190 38A00005 */  li        r5, 0x5
/* 026194 80029194 38C00005 */  li        r6, 0x5
/* 026198 80029198 48083F15 */  bl        fn_800AD0AC
/* 02619C 8002919C 57C007BE */  clrlwi    r0, r30, 30
/* 0261A0 800291A0 28000001 */  cmplwi    r0, 0x1
/* 0261A4 800291A4 40820024 */  bne       lbl_800291C8
/* 0261A8 800291A8 3C7F0004 */  addis     r3, r31, 0x4
/* 0261AC 800291AC 8883D12F */  lbz       r4, -0x2ed1(r3)
/* 0261B0 800291B0 38600004 */  li        r3, 0x4
/* 0261B4 800291B4 38A00000 */  li        r5, 0x0
/* 0261B8 800291B8 7C872378 */  mr        r7, r4
/* 0261BC 800291BC 38C00004 */  li        r6, 0x4
/* 0261C0 800291C0 48083795 */  bl        GXSetAlphaCompare
/* 0261C4 800291C4 4800012C */  b         lbl_800292F0
lbl_800291C8:
/* 0261C8 800291C8 57C004E6 */  rlwinm    r0, r30, 0, 19, 19
/* 0261CC 800291CC 28000000 */  cmplwi    r0, 0x0
/* 0261D0 800291D0 41820020 */  beq       lbl_800291F0
/* 0261D4 800291D4 38600004 */  li        r3, 0x4
/* 0261D8 800291D8 38800010 */  li        r4, 0x10
/* 0261DC 800291DC 38A00000 */  li        r5, 0x0
/* 0261E0 800291E0 38C00004 */  li        r6, 0x4
/* 0261E4 800291E4 38E00010 */  li        r7, 0x10
/* 0261E8 800291E8 4808376D */  bl        GXSetAlphaCompare
/* 0261EC 800291EC 48000104 */  b         lbl_800292F0
lbl_800291F0:
/* 0261F0 800291F0 38600007 */  li        r3, 0x7
/* 0261F4 800291F4 38800000 */  li        r4, 0x0
/* 0261F8 800291F8 38A00000 */  li        r5, 0x0
/* 0261FC 800291FC 38C00007 */  li        r6, 0x7
/* 026200 80029200 38E00000 */  li        r7, 0x0
/* 026204 80029204 48083751 */  bl        GXSetAlphaCompare
/* 026208 80029208 480000E8 */  b         lbl_800292F0
lbl_8002920C:
/* 02620C 8002920C 57C004E6 */  rlwinm    r0, r30, 0, 19, 19
/* 026210 80029210 28000000 */  cmplwi    r0, 0x0
/* 026214 80029214 40820010 */  bne       lbl_80029224
/* 026218 80029218 57C007FE */  clrlwi    r0, r30, 31
/* 02621C 8002921C 28000000 */  cmplwi    r0, 0x0
/* 026220 80029220 41820068 */  beq       lbl_80029288
lbl_80029224:
/* 026224 80029224 38600000 */  li        r3, 0x0
/* 026228 80029228 48083F65 */  bl        fn_800AD18C
/* 02622C 8002922C 38600000 */  li        r3, 0x0
/* 026230 80029230 38800004 */  li        r4, 0x4
/* 026234 80029234 38A00005 */  li        r5, 0x5
/* 026238 80029238 38C00005 */  li        r6, 0x5
/* 02623C 8002923C 48083E71 */  bl        fn_800AD0AC
/* 026240 80029240 57C007BE */  clrlwi    r0, r30, 30
/* 026244 80029244 28000001 */  cmplwi    r0, 0x1
/* 026248 80029248 40820024 */  bne       lbl_8002926C
/* 02624C 8002924C 3C7F0004 */  addis     r3, r31, 0x4
/* 026250 80029250 8883D12F */  lbz       r4, -0x2ed1(r3)
/* 026254 80029254 38600004 */  li        r3, 0x4
/* 026258 80029258 38A00000 */  li        r5, 0x0
/* 02625C 8002925C 7C872378 */  mr        r7, r4
/* 026260 80029260 38C00004 */  li        r6, 0x4
/* 026264 80029264 480836F1 */  bl        GXSetAlphaCompare
/* 026268 80029268 48000088 */  b         lbl_800292F0
lbl_8002926C:
/* 02626C 8002926C 38600004 */  li        r3, 0x4
/* 026270 80029270 38800010 */  li        r4, 0x10
/* 026274 80029274 38A00000 */  li        r5, 0x0
/* 026278 80029278 38C00004 */  li        r6, 0x4
/* 02627C 8002927C 38E00010 */  li        r7, 0x10
/* 026280 80029280 480836D5 */  bl        GXSetAlphaCompare
/* 026284 80029284 4800006C */  b         lbl_800292F0
lbl_80029288:
/* 026288 80029288 57C007BE */  clrlwi    r0, r30, 30
/* 02628C 8002928C 28000001 */  cmplwi    r0, 0x1
/* 026290 80029290 4082002C */  bne       lbl_800292BC
/* 026294 80029294 38600000 */  li        r3, 0x0
/* 026298 80029298 48083EF5 */  bl        fn_800AD18C
/* 02629C 8002929C 3C7F0004 */  addis     r3, r31, 0x4
/* 0262A0 800292A0 8883D12F */  lbz       r4, -0x2ed1(r3)
/* 0262A4 800292A4 38600004 */  li        r3, 0x4
/* 0262A8 800292A8 38A00000 */  li        r5, 0x0
/* 0262AC 800292AC 7C872378 */  mr        r7, r4
/* 0262B0 800292B0 38C00004 */  li        r6, 0x4
/* 0262B4 800292B4 480836A1 */  bl        GXSetAlphaCompare
/* 0262B8 800292B8 48000024 */  b         lbl_800292DC
lbl_800292BC:
/* 0262BC 800292BC 38600001 */  li        r3, 0x1
/* 0262C0 800292C0 48083ECD */  bl        fn_800AD18C
/* 0262C4 800292C4 38600007 */  li        r3, 0x7
/* 0262C8 800292C8 38800000 */  li        r4, 0x0
/* 0262CC 800292CC 38A00000 */  li        r5, 0x0
/* 0262D0 800292D0 38C00007 */  li        r6, 0x7
/* 0262D4 800292D4 38E00000 */  li        r7, 0x0
/* 0262D8 800292D8 4808367D */  bl        GXSetAlphaCompare
lbl_800292DC:
/* 0262DC 800292DC 38600000 */  li        r3, 0x0
/* 0262E0 800292E0 38800004 */  li        r4, 0x4
/* 0262E4 800292E4 38A00005 */  li        r5, 0x5
/* 0262E8 800292E8 38C00005 */  li        r6, 0x5
/* 0262EC 800292EC 48083DC1 */  bl        fn_800AD0AC
lbl_800292F0:
/* 0262F0 800292F0 801F0094 */  lwz       r0, 0x94(r31)
/* 0262F4 800292F4 807F00A0 */  lwz       r3, 0xa0(r31)
/* 0262F8 800292F8 540007FE */  clrlwi    r0, r0, 31
/* 0262FC 800292FC 28000000 */  cmplwi    r0, 0x0
/* 026300 80029300 41820078 */  beq       lbl_80029378
/* 026304 80029304 546006F6 */  rlwinm    r0, r3, 0, 27, 27
/* 026308 80029308 28000000 */  cmplwi    r0, 0x0
/* 02630C 8002930C 41820038 */  beq       lbl_80029344
/* 026310 80029310 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 026314 80029314 28000000 */  cmplwi    r0, 0x0
/* 026318 80029318 41820018 */  beq       lbl_80029330
/* 02631C 8002931C 38600001 */  li        r3, 0x1
/* 026320 80029320 38800003 */  li        r4, 0x3
/* 026324 80029324 38A00001 */  li        r5, 0x1
/* 026328 80029328 48083E31 */  bl        GXSetZMode
/* 02632C 8002932C 480000DC */  b         lbl_80029408
lbl_80029330:
/* 026330 80029330 38600001 */  li        r3, 0x1
/* 026334 80029334 38800003 */  li        r4, 0x3
/* 026338 80029338 38A00000 */  li        r5, 0x0
/* 02633C 8002933C 48083E1D */  bl        GXSetZMode
/* 026340 80029340 480000C8 */  b         lbl_80029408
lbl_80029344:
/* 026344 80029344 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 026348 80029348 28000000 */  cmplwi    r0, 0x0
/* 02634C 8002934C 41820018 */  beq       lbl_80029364
/* 026350 80029350 38600001 */  li        r3, 0x1
/* 026354 80029354 38800007 */  li        r4, 0x7
/* 026358 80029358 38A00001 */  li        r5, 0x1
/* 02635C 8002935C 48083DFD */  bl        GXSetZMode
/* 026360 80029360 480000A8 */  b         lbl_80029408
lbl_80029364:
/* 026364 80029364 38600000 */  li        r3, 0x0
/* 026368 80029368 38800003 */  li        r4, 0x3
/* 02636C 8002936C 38A00000 */  li        r5, 0x0
/* 026370 80029370 48083DE9 */  bl        GXSetZMode
/* 026374 80029374 48000094 */  b         lbl_80029408
lbl_80029378:
/* 026378 80029378 801F0058 */  lwz       r0, 0x58(r31)
/* 02637C 8002937C 2C000000 */  cmpwi     r0, 0x0
/* 026380 80029380 41820078 */  beq       lbl_800293F8
/* 026384 80029384 546006F6 */  rlwinm    r0, r3, 0, 27, 27
/* 026388 80029388 28000000 */  cmplwi    r0, 0x0
/* 02638C 8002938C 41820038 */  beq       lbl_800293C4
/* 026390 80029390 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 026394 80029394 28000000 */  cmplwi    r0, 0x0
/* 026398 80029398 41820018 */  beq       lbl_800293B0
/* 02639C 8002939C 38600001 */  li        r3, 0x1
/* 0263A0 800293A0 38800003 */  li        r4, 0x3
/* 0263A4 800293A4 38A00001 */  li        r5, 0x1
/* 0263A8 800293A8 48083DB1 */  bl        GXSetZMode
/* 0263AC 800293AC 4800005C */  b         lbl_80029408
lbl_800293B0:
/* 0263B0 800293B0 38600001 */  li        r3, 0x1
/* 0263B4 800293B4 38800003 */  li        r4, 0x3
/* 0263B8 800293B8 38A00000 */  li        r5, 0x0
/* 0263BC 800293BC 48083D9D */  bl        GXSetZMode
/* 0263C0 800293C0 48000048 */  b         lbl_80029408
lbl_800293C4:
/* 0263C4 800293C4 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 0263C8 800293C8 28000000 */  cmplwi    r0, 0x0
/* 0263CC 800293CC 41820018 */  beq       lbl_800293E4
/* 0263D0 800293D0 38600001 */  li        r3, 0x1
/* 0263D4 800293D4 38800007 */  li        r4, 0x7
/* 0263D8 800293D8 38A00001 */  li        r5, 0x1
/* 0263DC 800293DC 48083D7D */  bl        GXSetZMode
/* 0263E0 800293E0 48000028 */  b         lbl_80029408
lbl_800293E4:
/* 0263E4 800293E4 38600000 */  li        r3, 0x0
/* 0263E8 800293E8 38800003 */  li        r4, 0x3
/* 0263EC 800293EC 38A00000 */  li        r5, 0x0
/* 0263F0 800293F0 48083D69 */  bl        GXSetZMode
/* 0263F4 800293F4 48000014 */  b         lbl_80029408
lbl_800293F8:
/* 0263F8 800293F8 38600000 */  li        r3, 0x0
/* 0263FC 800293FC 38800003 */  li        r4, 0x3
/* 026400 80029400 38A00000 */  li        r5, 0x0
/* 026404 80029404 48083D55 */  bl        GXSetZMode
lbl_80029408:
/* 026408 80029408 38600001 */  li        r3, 0x1
lbl_8002940C:
/* 02640C 8002940C 8001003C */  lwz       r0, 0x3c(r1)
/* 026410 80029410 83E10034 */  lwz       r31, 0x34(r1)
/* 026414 80029414 83C10030 */  lwz       r30, 0x30(r1)
/* 026418 80029418 7C0803A6 */  mtlr      r0
/* 02641C 8002941C 38210038 */  addi      r1, r1, 0x38
/* 026420 80029420 4E800020 */  blr

glabel frameGetCombineAlpha
/* 026424 80029424 28050007 */  cmplwi    r5, 0x7
/* 026428 80029428 4181007C */  bgt       lbl_800294A4
/* 02642C 8002942C 3C60800F */  lis       r3, jtbl_800EC6C4@ha
/* 026430 80029430 3863C6C4 */  addi      r3, r3, jtbl_800EC6C4@l
/* 026434 80029434 54A0103A */  slwi      r0, r5, 2
/* 026438 80029438 7C03002E */  lwzx      r0, r3, r0
/* 02643C 8002943C 7C0903A6 */  mtctr     r0
/* 026440 80029440 4E800420 */  bctr
lbl_80029444:
/* 026444 80029444 38000004 */  li        r0, 0x4
/* 026448 80029448 90040000 */  stw       r0, 0x0(r4)
/* 02644C 8002944C 48000060 */  b         lbl_800294AC
lbl_80029450:
/* 026450 80029450 38000004 */  li        r0, 0x4
/* 026454 80029454 90040000 */  stw       r0, 0x0(r4)
/* 026458 80029458 48000054 */  b         lbl_800294AC
lbl_8002945C:
/* 02645C 8002945C 38000004 */  li        r0, 0x4
/* 026460 80029460 90040000 */  stw       r0, 0x0(r4)
/* 026464 80029464 48000048 */  b         lbl_800294AC
lbl_80029468:
/* 026468 80029468 38000001 */  li        r0, 0x1
/* 02646C 8002946C 90040000 */  stw       r0, 0x0(r4)
/* 026470 80029470 4800003C */  b         lbl_800294AC
lbl_80029474:
/* 026474 80029474 38000005 */  li        r0, 0x5
/* 026478 80029478 90040000 */  stw       r0, 0x0(r4)
/* 02647C 8002947C 48000030 */  b         lbl_800294AC
lbl_80029480:
/* 026480 80029480 38000002 */  li        r0, 0x2
/* 026484 80029484 90040000 */  stw       r0, 0x0(r4)
/* 026488 80029488 48000024 */  b         lbl_800294AC
lbl_8002948C:
/* 02648C 8002948C 38000006 */  li        r0, 0x6
/* 026490 80029490 90040000 */  stw       r0, 0x0(r4)
/* 026494 80029494 48000018 */  b         lbl_800294AC
lbl_80029498:
/* 026498 80029498 38000007 */  li        r0, 0x7
/* 02649C 8002949C 90040000 */  stw       r0, 0x0(r4)
/* 0264A0 800294A0 4800000C */  b         lbl_800294AC
lbl_800294A4:
/* 0264A4 800294A4 38600000 */  li        r3, 0x0
/* 0264A8 800294A8 48000008 */  b         lbl_800294B0
lbl_800294AC:
/* 0264AC 800294AC 38600001 */  li        r3, 0x1
lbl_800294B0:
/* 0264B0 800294B0 4E800020 */  blr

glabel frameGetCombineColor
/* 0264B4 800294B4 2805001F */  cmplwi    r5, 0x1f
/* 0264B8 800294B8 418100E8 */  bgt       lbl_800295A0
/* 0264BC 800294BC 3C60800F */  lis       r3, jtbl_800EC6E4@ha
/* 0264C0 800294C0 3863C6E4 */  addi      r3, r3, jtbl_800EC6E4@l
/* 0264C4 800294C4 54A0103A */  slwi      r0, r5, 2
/* 0264C8 800294C8 7C03002E */  lwzx      r0, r3, r0
/* 0264CC 800294CC 7C0903A6 */  mtctr     r0
/* 0264D0 800294D0 4E800420 */  bctr
lbl_800294D4:
/* 0264D4 800294D4 38000008 */  li        r0, 0x8
/* 0264D8 800294D8 90040000 */  stw       r0, 0x0(r4)
/* 0264DC 800294DC 480000CC */  b         lbl_800295A8
lbl_800294E0:
/* 0264E0 800294E0 38000008 */  li        r0, 0x8
/* 0264E4 800294E4 90040000 */  stw       r0, 0x0(r4)
/* 0264E8 800294E8 480000C0 */  b         lbl_800295A8
lbl_800294EC:
/* 0264EC 800294EC 38000008 */  li        r0, 0x8
/* 0264F0 800294F0 90040000 */  stw       r0, 0x0(r4)
/* 0264F4 800294F4 480000B4 */  b         lbl_800295A8
lbl_800294F8:
/* 0264F8 800294F8 38000002 */  li        r0, 0x2
/* 0264FC 800294FC 90040000 */  stw       r0, 0x0(r4)
/* 026500 80029500 480000A8 */  b         lbl_800295A8
lbl_80029504:
/* 026504 80029504 3800000A */  li        r0, 0xa
/* 026508 80029508 90040000 */  stw       r0, 0x0(r4)
/* 02650C 8002950C 4800009C */  b         lbl_800295A8
lbl_80029510:
/* 026510 80029510 38000004 */  li        r0, 0x4
/* 026514 80029514 90040000 */  stw       r0, 0x0(r4)
/* 026518 80029518 48000090 */  b         lbl_800295A8
lbl_8002951C:
/* 02651C 8002951C 38000009 */  li        r0, 0x9
/* 026520 80029520 90040000 */  stw       r0, 0x0(r4)
/* 026524 80029524 48000084 */  b         lbl_800295A8
lbl_80029528:
/* 026528 80029528 38000009 */  li        r0, 0x9
/* 02652C 8002952C 90040000 */  stw       r0, 0x0(r4)
/* 026530 80029530 48000078 */  b         lbl_800295A8
lbl_80029534:
/* 026534 80029534 38000009 */  li        r0, 0x9
/* 026538 80029538 90040000 */  stw       r0, 0x0(r4)
/* 02653C 8002953C 4800006C */  b         lbl_800295A8
lbl_80029540:
/* 026540 80029540 38000003 */  li        r0, 0x3
/* 026544 80029544 90040000 */  stw       r0, 0x0(r4)
/* 026548 80029548 48000060 */  b         lbl_800295A8
lbl_8002954C:
/* 02654C 8002954C 3800000B */  li        r0, 0xb
/* 026550 80029550 90040000 */  stw       r0, 0x0(r4)
/* 026554 80029554 48000054 */  b         lbl_800295A8
lbl_80029558:
/* 026558 80029558 38000005 */  li        r0, 0x5
/* 02655C 8002955C 90040000 */  stw       r0, 0x0(r4)
/* 026560 80029560 48000048 */  b         lbl_800295A8
lbl_80029564:
/* 026564 80029564 38000008 */  li        r0, 0x8
/* 026568 80029568 90040000 */  stw       r0, 0x0(r4)
/* 02656C 8002956C 4800003C */  b         lbl_800295A8
lbl_80029570:
/* 026570 80029570 38000008 */  li        r0, 0x8
/* 026574 80029574 90040000 */  stw       r0, 0x0(r4)
/* 026578 80029578 48000030 */  b         lbl_800295A8
lbl_8002957C:
/* 02657C 8002957C 38000006 */  li        r0, 0x6
/* 026580 80029580 90040000 */  stw       r0, 0x0(r4)
/* 026584 80029584 48000024 */  b         lbl_800295A8
lbl_80029588:
/* 026588 80029588 3800000C */  li        r0, 0xc
/* 02658C 8002958C 90040000 */  stw       r0, 0x0(r4)
/* 026590 80029590 48000018 */  b         lbl_800295A8
lbl_80029594:
/* 026594 80029594 3800000F */  li        r0, 0xf
/* 026598 80029598 90040000 */  stw       r0, 0x0(r4)
/* 02659C 8002959C 4800000C */  b         lbl_800295A8
lbl_800295A0:
/* 0265A0 800295A0 38600000 */  li        r3, 0x0
/* 0265A4 800295A4 48000008 */  b         lbl_800295AC
lbl_800295A8:
/* 0265A8 800295A8 38600001 */  li        r3, 0x1
lbl_800295AC:
/* 0265AC 800295AC 4E800020 */  blr

glabel frameDrawSetupSP
/* 0265B0 800295B0 7C0802A6 */  mflr      r0
/* 0265B4 800295B4 90010004 */  stw       r0, 0x4(r1)
/* 0265B8 800295B8 9421FDF8 */  stwu      r1, -0x208(r1)
/* 0265BC 800295BC DBE10200 */  stfd      f31, 0x200(r1)
/* 0265C0 800295C0 DBC101F8 */  stfd      f30, 0x1f8(r1)
/* 0265C4 800295C4 DBA101F0 */  stfd      f29, 0x1f0(r1)
/* 0265C8 800295C8 DB8101E8 */  stfd      f28, 0x1e8(r1)
/* 0265CC 800295CC DB6101E0 */  stfd      f27, 0x1e0(r1)
/* 0265D0 800295D0 DB4101D8 */  stfd      f26, 0x1d8(r1)
/* 0265D4 800295D4 DB2101D0 */  stfd      f25, 0x1d0(r1)
/* 0265D8 800295D8 DB0101C8 */  stfd      f24, 0x1c8(r1)
/* 0265DC 800295DC BE410190 */  stmw      r18, 0x190(r1)
/* 0265E0 800295E0 7C7C1B78 */  mr        r28, r3
/* 0265E4 800295E4 7C9D2378 */  mr        r29, r4
/* 0265E8 800295E8 7CBE2B78 */  mr        r30, r5
/* 0265EC 800295EC 7CDF3378 */  mr        r31, r6
/* 0265F0 800295F0 807C0094 */  lwz       r3, 0x94(r28)
/* 0265F4 800295F4 3AA00000 */  li        r21, 0x0
/* 0265F8 800295F8 801C007C */  lwz       r0, 0x7c(r28)
/* 0265FC 800295FC 706300A0 */  andi.     r3, r3, 0xa0
/* 026600 80029600 540003DE */  rlwinm    r0, r0, 0, 15, 15
/* 026604 80029604 3863FF60 */  subi      r3, r3, 0xa0
/* 026608 80029608 7C630034 */  cntlzw    r3, r3
/* 02660C 8002960C 28000000 */  cmplwi    r0, 0x0
/* 026610 80029610 5476D97E */  srwi      r22, r3, 5
/* 026614 80029614 418200D0 */  beq       lbl_800296E4
/* 026618 80029618 38000000 */  li        r0, 0x0
/* 02661C 8002961C 900D89A0 */  stw       r0, D_8018B920@sda21(r0)
/* 026620 80029620 801C007C */  lwz       r0, 0x7c(r28)
/* 026624 80029624 5400041C */  rlwinm    r0, r0, 0, 16, 14
/* 026628 80029628 901C007C */  stw       r0, 0x7c(r28)
/* 02662C 8002962C C03C00B8 */  lfs       f1, 0xb8(r28)
/* 026630 80029630 C05C00BC */  lfs       f2, 0xbc(r28)
/* 026634 80029634 C07C00C0 */  lfs       f3, 0xc0(r28)
/* 026638 80029638 C09C00C4 */  lfs       f4, 0xc4(r28)
/* 02663C 8002963C C0A28100 */  lfs       f5, D_8018C040@sda21(r0)
/* 026640 80029640 C0C28138 */  lfs       f6, D_8018C078@sda21(r0)
/* 026644 80029644 48084195 */  bl        GXSetViewport
/* 026648 80029648 C03C00C0 */  lfs       f1, 0xc0(r28)
/* 02664C 8002964C C0028160 */  lfs       f0, D_8018C0A0@sda21(r0)
/* 026650 80029650 FC010040 */  fcmpo     cr0, f1, f0
/* 026654 80029654 40800084 */  bge       lbl_800296D8
/* 026658 80029658 386D89A4 */  li        r3, D_8018B924@sda21
/* 02665C 8002965C 388D89A8 */  li        r4, D_8018B928@sda21
/* 026660 80029660 38AD89AC */  li        r5, D_8018B92C@sda21
/* 026664 80029664 38CD89B0 */  li        r6, D_8018B930@sda21
/* 026668 80029668 48084225 */  bl        fn_800AD88C
/* 02666C 8002966C 806D89AC */  lwz       r3, D_8018B92C@sda21(r0)
/* 026670 80029670 3C004330 */  lis       r0, 0x4330
/* 026674 80029674 C8228128 */  lfd       f1, D_8018C068@sda21(r0)
/* 026678 80029678 9061018C */  stw       r3, 0x18c(r1)
/* 02667C 8002967C C31C00C0 */  lfs       f24, 0xc0(r28)
/* 026680 80029680 90010188 */  stw       r0, 0x188(r1)
/* 026684 80029684 C8010188 */  lfd       f0, 0x188(r1)
/* 026688 80029688 EC000828 */  fsubs     f0, f0, f1
/* 02668C 8002968C FC00C040 */  fcmpo     cr0, f0, f24
/* 026690 80029690 40810048 */  ble       lbl_800296D8
/* 026694 80029694 C03C00C4 */  lfs       f1, 0xc4(r28)
/* 026698 80029698 480A2E15 */  bl        __cvt_fp2unsigned
/* 02669C 8002969C 7C741B78 */  mr        r20, r3
/* 0266A0 800296A0 FC20C090 */  fmr       f1, f24
/* 0266A4 800296A4 480A2E09 */  bl        __cvt_fp2unsigned
/* 0266A8 800296A8 7C731B78 */  mr        r19, r3
/* 0266AC 800296AC C03C00BC */  lfs       f1, 0xbc(r28)
/* 0266B0 800296B0 480A2DFD */  bl        __cvt_fp2unsigned
/* 0266B4 800296B4 7C721B78 */  mr        r18, r3
/* 0266B8 800296B8 C03C00B8 */  lfs       f1, 0xb8(r28)
/* 0266BC 800296BC 480A2DF1 */  bl        __cvt_fp2unsigned
/* 0266C0 800296C0 7E449378 */  mr        r4, r18
/* 0266C4 800296C4 7E659B78 */  mr        r5, r19
/* 0266C8 800296C8 7E86A378 */  mr        r6, r20
/* 0266CC 800296CC 48084131 */  bl        GXSetScissor
/* 0266D0 800296D0 38000001 */  li        r0, 0x1
/* 0266D4 800296D4 900D89A0 */  stw       r0, D_8018B920@sda21(r0)
lbl_800296D8:
/* 0266D8 800296D8 801C008C */  lwz       r0, 0x8c(r28)
/* 0266DC 800296DC 54000080 */  rlwinm    r0, r0, 0, 2, 0
/* 0266E0 800296E0 901C008C */  stw       r0, 0x8c(r28)
lbl_800296E4:
/* 0266E4 800296E4 807C007C */  lwz       r3, 0x7c(r28)
/* 0266E8 800296E8 5460077A */  rlwinm    r0, r3, 0, 29, 29
/* 0266EC 800296EC 28000000 */  cmplwi    r0, 0x0
/* 0266F0 800296F0 41820130 */  beq       lbl_80029820
/* 0266F4 800296F4 546007B8 */  rlwinm    r0, r3, 0, 30, 28
/* 0266F8 800296F8 901C007C */  stw       r0, 0x7c(r28)
/* 0266FC 800296FC 801C0094 */  lwz       r0, 0x94(r28)
/* 026700 80029700 807C00A0 */  lwz       r3, 0xa0(r28)
/* 026704 80029704 540007FE */  clrlwi    r0, r0, 31
/* 026708 80029708 28000000 */  cmplwi    r0, 0x0
/* 02670C 8002970C 41820078 */  beq       lbl_80029784
/* 026710 80029710 546006F6 */  rlwinm    r0, r3, 0, 27, 27
/* 026714 80029714 28000000 */  cmplwi    r0, 0x0
/* 026718 80029718 41820038 */  beq       lbl_80029750
/* 02671C 8002971C 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 026720 80029720 28000000 */  cmplwi    r0, 0x0
/* 026724 80029724 41820018 */  beq       lbl_8002973C
/* 026728 80029728 38600001 */  li        r3, 0x1
/* 02672C 8002972C 38800003 */  li        r4, 0x3
/* 026730 80029730 38A00001 */  li        r5, 0x1
/* 026734 80029734 48083A25 */  bl        GXSetZMode
/* 026738 80029738 480000DC */  b         lbl_80029814
lbl_8002973C:
/* 02673C 8002973C 38600001 */  li        r3, 0x1
/* 026740 80029740 38800003 */  li        r4, 0x3
/* 026744 80029744 38A00000 */  li        r5, 0x0
/* 026748 80029748 48083A11 */  bl        GXSetZMode
/* 02674C 8002974C 480000C8 */  b         lbl_80029814
lbl_80029750:
/* 026750 80029750 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 026754 80029754 28000000 */  cmplwi    r0, 0x0
/* 026758 80029758 41820018 */  beq       lbl_80029770
/* 02675C 8002975C 38600001 */  li        r3, 0x1
/* 026760 80029760 38800007 */  li        r4, 0x7
/* 026764 80029764 38A00001 */  li        r5, 0x1
/* 026768 80029768 480839F1 */  bl        GXSetZMode
/* 02676C 8002976C 480000A8 */  b         lbl_80029814
lbl_80029770:
/* 026770 80029770 38600000 */  li        r3, 0x0
/* 026774 80029774 38800003 */  li        r4, 0x3
/* 026778 80029778 38A00000 */  li        r5, 0x0
/* 02677C 8002977C 480839DD */  bl        GXSetZMode
/* 026780 80029780 48000094 */  b         lbl_80029814
lbl_80029784:
/* 026784 80029784 801C0058 */  lwz       r0, 0x58(r28)
/* 026788 80029788 2C000000 */  cmpwi     r0, 0x0
/* 02678C 8002978C 41820078 */  beq       lbl_80029804
/* 026790 80029790 546006F6 */  rlwinm    r0, r3, 0, 27, 27
/* 026794 80029794 28000000 */  cmplwi    r0, 0x0
/* 026798 80029798 41820038 */  beq       lbl_800297D0
/* 02679C 8002979C 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 0267A0 800297A0 28000000 */  cmplwi    r0, 0x0
/* 0267A4 800297A4 41820018 */  beq       lbl_800297BC
/* 0267A8 800297A8 38600001 */  li        r3, 0x1
/* 0267AC 800297AC 38800003 */  li        r4, 0x3
/* 0267B0 800297B0 38A00001 */  li        r5, 0x1
/* 0267B4 800297B4 480839A5 */  bl        GXSetZMode
/* 0267B8 800297B8 4800005C */  b         lbl_80029814
lbl_800297BC:
/* 0267BC 800297BC 38600001 */  li        r3, 0x1
/* 0267C0 800297C0 38800003 */  li        r4, 0x3
/* 0267C4 800297C4 38A00000 */  li        r5, 0x0
/* 0267C8 800297C8 48083991 */  bl        GXSetZMode
/* 0267CC 800297CC 48000048 */  b         lbl_80029814
lbl_800297D0:
/* 0267D0 800297D0 546006B4 */  rlwinm    r0, r3, 0, 26, 26
/* 0267D4 800297D4 28000000 */  cmplwi    r0, 0x0
/* 0267D8 800297D8 41820018 */  beq       lbl_800297F0
/* 0267DC 800297DC 38600001 */  li        r3, 0x1
/* 0267E0 800297E0 38800007 */  li        r4, 0x7
/* 0267E4 800297E4 38A00001 */  li        r5, 0x1
/* 0267E8 800297E8 48083971 */  bl        GXSetZMode
/* 0267EC 800297EC 48000028 */  b         lbl_80029814
lbl_800297F0:
/* 0267F0 800297F0 38600000 */  li        r3, 0x0
/* 0267F4 800297F4 38800003 */  li        r4, 0x3
/* 0267F8 800297F8 38A00000 */  li        r5, 0x0
/* 0267FC 800297FC 4808395D */  bl        GXSetZMode
/* 026800 80029800 48000014 */  b         lbl_80029814
lbl_80029804:
/* 026804 80029804 38600000 */  li        r3, 0x0
/* 026808 80029808 38800003 */  li        r4, 0x3
/* 02680C 8002980C 38A00000 */  li        r5, 0x0
/* 026810 80029810 48083949 */  bl        GXSetZMode
lbl_80029814:
/* 026814 80029814 801C008C */  lwz       r0, 0x8c(r28)
/* 026818 80029818 54000080 */  rlwinm    r0, r0, 0, 2, 0
/* 02681C 8002981C 901C008C */  stw       r0, 0x8c(r28)
lbl_80029820:
/* 026820 80029820 807C007C */  lwz       r3, 0x7c(r28)
/* 026824 80029824 54600738 */  rlwinm    r0, r3, 0, 28, 28
/* 026828 80029828 28000000 */  cmplwi    r0, 0x0
/* 02682C 8002982C 41820070 */  beq       lbl_8002989C
/* 026830 80029830 54600776 */  rlwinm    r0, r3, 0, 29, 27
/* 026834 80029834 901C007C */  stw       r0, 0x7c(r28)
/* 026838 80029838 801C0094 */  lwz       r0, 0x94(r28)
/* 02683C 8002983C 5400073A */  rlwinm    r0, r0, 0, 28, 29
/* 026840 80029840 2C000008 */  cmpwi     r0, 0x8
/* 026844 80029844 41820020 */  beq       lbl_80029864
/* 026848 80029848 40800010 */  bge       lbl_80029858
/* 02684C 8002984C 2C000004 */  cmpwi     r0, 0x4
/* 026850 80029850 41820020 */  beq       lbl_80029870
/* 026854 80029854 48000034 */  b         lbl_80029888
lbl_80029858:
/* 026858 80029858 2C00000C */  cmpwi     r0, 0xc
/* 02685C 8002985C 41820020 */  beq       lbl_8002987C
/* 026860 80029860 48000028 */  b         lbl_80029888
lbl_80029864:
/* 026864 80029864 38600001 */  li        r3, 0x1
/* 026868 80029868 48080969 */  bl        GXSetCullMode
/* 02686C 8002986C 48000024 */  b         lbl_80029890
lbl_80029870:
/* 026870 80029870 38600002 */  li        r3, 0x2
/* 026874 80029874 4808095D */  bl        GXSetCullMode
/* 026878 80029878 48000018 */  b         lbl_80029890
lbl_8002987C:
/* 02687C 8002987C 38600003 */  li        r3, 0x3
/* 026880 80029880 48080951 */  bl        GXSetCullMode
/* 026884 80029884 4800000C */  b         lbl_80029890
lbl_80029888:
/* 026888 80029888 38600000 */  li        r3, 0x0
/* 02688C 8002988C 48080945 */  bl        GXSetCullMode
lbl_80029890:
/* 026890 80029890 801C008C */  lwz       r0, 0x8c(r28)
/* 026894 80029894 54000080 */  rlwinm    r0, r0, 0, 2, 0
/* 026898 80029898 901C008C */  stw       r0, 0x8c(r28)
lbl_8002989C:
/* 02689C 8002989C 807C007C */  lwz       r3, 0x7c(r28)
/* 0268A0 800298A0 5460035A */  rlwinm    r0, r3, 0, 13, 13
/* 0268A4 800298A4 28000000 */  cmplwi    r0, 0x0
/* 0268A8 800298A8 4182027C */  beq       lbl_80029B24
/* 0268AC 800298AC 801C008C */  lwz       r0, 0x8c(r28)
/* 0268B0 800298B0 5400014A */  rlwinm    r0, r0, 0, 5, 5
/* 0268B4 800298B4 28000000 */  cmplwi    r0, 0x0
/* 0268B8 800298B8 4182026C */  beq       lbl_80029B24
/* 0268BC 800298BC 54600398 */  rlwinm    r0, r3, 0, 14, 12
/* 0268C0 800298C0 901C007C */  stw       r0, 0x7c(r28)
/* 0268C4 800298C4 801C008C */  lwz       r0, 0x8c(r28)
/* 0268C8 800298C8 54000084 */  rlwinm    r0, r0, 0, 2, 2
/* 0268CC 800298CC 28000000 */  cmplwi    r0, 0x0
/* 0268D0 800298D0 4182005C */  beq       lbl_8002992C
/* 0268D4 800298D4 3C7C0004 */  addis     r3, r28, 0x4
/* 0268D8 800298D8 8003C51C */  lwz       r0, -0x3ae4(r3)
/* 0268DC 800298DC 2C000000 */  cmpwi     r0, 0x0
/* 0268E0 800298E0 4082000C */  bne       lbl_800298EC
/* 0268E4 800298E4 38600000 */  li        r3, 0x0
/* 0268E8 800298E8 48000008 */  b         lbl_800298F0
lbl_800298EC:
/* 0268EC 800298EC 38600001 */  li        r3, 0x1
lbl_800298F0:
/* 0268F0 800298F0 801C00A0 */  lwz       r0, 0xa0(r28)
/* 0268F4 800298F4 7C641B78 */  mr        r4, r3
/* 0268F8 800298F8 5400052A */  rlwinm    r0, r0, 0, 20, 21
/* 0268FC 800298FC 28000C00 */  cmplwi    r0, 0xc00
/* 026900 80029900 4082001C */  bne       lbl_8002991C
/* 026904 80029904 2C040000 */  cmpwi     r4, 0x0
/* 026908 80029908 40820014 */  bne       lbl_8002991C
/* 02690C 8002990C 3C7C0004 */  addis     r3, r28, 0x4
/* 026910 80029910 3863C7A0 */  subi      r3, r3, 0x3860
/* 026914 80029914 48083AC1 */  bl        GXSetProjection
/* 026918 80029918 48000200 */  b         lbl_80029B18
lbl_8002991C:
/* 02691C 8002991C 3C7C0004 */  addis     r3, r28, 0x4
/* 026920 80029920 3863C7A0 */  subi      r3, r3, 0x3860
/* 026924 80029924 48083AB1 */  bl        GXSetProjection
/* 026928 80029928 480001F0 */  b         lbl_80029B18
lbl_8002992C:
/* 02692C 8002992C 3C7C0004 */  addis     r3, r28, 0x4
/* 026930 80029930 C003C7A0 */  lfs       f0, -0x3860(r3)
/* 026934 80029934 D001005C */  stfs      f0, 0x5c(r1)
/* 026938 80029938 C003C7B0 */  lfs       f0, -0x3850(r3)
/* 02693C 8002993C D0010060 */  stfs      f0, 0x60(r1)
/* 026940 80029940 C003C7C0 */  lfs       f0, -0x3840(r3)
/* 026944 80029944 D0010064 */  stfs      f0, 0x64(r1)
/* 026948 80029948 C003C7D0 */  lfs       f0, -0x3830(r3)
/* 02694C 8002994C D0010068 */  stfs      f0, 0x68(r1)
/* 026950 80029950 C003C7A4 */  lfs       f0, -0x385c(r3)
/* 026954 80029954 D001006C */  stfs      f0, 0x6c(r1)
/* 026958 80029958 C003C7B4 */  lfs       f0, -0x384c(r3)
/* 02695C 8002995C D0010070 */  stfs      f0, 0x70(r1)
/* 026960 80029960 C003C7C4 */  lfs       f0, -0x383c(r3)
/* 026964 80029964 D0010074 */  stfs      f0, 0x74(r1)
/* 026968 80029968 C003C7D4 */  lfs       f0, -0x382c(r3)
/* 02696C 8002996C D0010078 */  stfs      f0, 0x78(r1)
/* 026970 80029970 C003C7A8 */  lfs       f0, -0x3858(r3)
/* 026974 80029974 D001007C */  stfs      f0, 0x7c(r1)
/* 026978 80029978 C003C7B8 */  lfs       f0, -0x3848(r3)
/* 02697C 8002997C D0010080 */  stfs      f0, 0x80(r1)
/* 026980 80029980 C003C7C8 */  lfs       f0, -0x3838(r3)
/* 026984 80029984 D0010084 */  stfs      f0, 0x84(r1)
/* 026988 80029988 C003C7D8 */  lfs       f0, -0x3828(r3)
/* 02698C 8002998C D0010088 */  stfs      f0, 0x88(r1)
/* 026990 80029990 C003C7AC */  lfs       f0, -0x3854(r3)
/* 026994 80029994 D001008C */  stfs      f0, 0x8c(r1)
/* 026998 80029998 C003C7BC */  lfs       f0, -0x3844(r3)
/* 02699C 8002999C D0010090 */  stfs      f0, 0x90(r1)
/* 0269A0 800299A0 C003C7CC */  lfs       f0, -0x3834(r3)
/* 0269A4 800299A4 D0010094 */  stfs      f0, 0x94(r1)
/* 0269A8 800299A8 C003C7DC */  lfs       f0, -0x3824(r3)
/* 0269AC 800299AC D0010098 */  stfs      f0, 0x98(r1)
/* 0269B0 800299B0 8003C4D0 */  lwz       r0, -0x3b30(r3)
/* 0269B4 800299B4 2C00FFFF */  cmpwi     r0, -0x1
/* 0269B8 800299B8 41820038 */  beq       lbl_800299F0
/* 0269BC 800299BC 1C800024 */  mulli     r4, r0, 0x24
/* 0269C0 800299C0 7C632214 */  add       r3, r3, r4
/* 0269C4 800299C4 8003C840 */  lwz       r0, -0x37c0(r3)
/* 0269C8 800299C8 2C000000 */  cmpwi     r0, 0x0
/* 0269CC 800299CC 4082000C */  bne       lbl_800299D8
/* 0269D0 800299D0 3AE00000 */  li        r23, 0x0
/* 0269D4 800299D4 48000008 */  b         lbl_800299DC
lbl_800299D8:
/* 0269D8 800299D8 3AE00001 */  li        r23, 0x1
lbl_800299DC:
/* 0269DC 800299DC 3C1C0004 */  addis     r0, r28, 0x4
/* 0269E0 800299E0 7C602214 */  add       r3, r0, r4
/* 0269E4 800299E4 C303C830 */  lfs       f24, -0x37d0(r3)
/* 0269E8 800299E8 C083C834 */  lfs       f4, -0x37cc(r3)
/* 0269EC 800299EC 48000030 */  b         lbl_80029A1C
lbl_800299F0:
/* 0269F0 800299F0 C0228138 */  lfs       f1, D_8018C078@sda21(r0)
/* 0269F4 800299F4 C003C7DC */  lfs       f0, -0x3824(r3)
/* 0269F8 800299F8 FC010000 */  fcmpu     cr0, f1, f0
/* 0269FC 800299FC 40820014 */  bne       lbl_80029A10
/* 026A00 80029A00 C3028100 */  lfs       f24, D_8018C040@sda21(r0)
/* 026A04 80029A04 3AE00001 */  li        r23, 0x1
/* 026A08 80029A08 C08281CC */  lfs       f4, D_8018C10C@sda21(r0)
/* 026A0C 80029A0C 48000010 */  b         lbl_80029A1C
lbl_80029A10:
/* 026A10 80029A10 FF000890 */  fmr       f24, f1
/* 026A14 80029A14 C08281CC */  lfs       f4, D_8018C10C@sda21(r0)
/* 026A18 80029A18 3AE00000 */  li        r23, 0x0
lbl_80029A1C:
/* 026A1C 80029A1C 2C170000 */  cmpwi     r23, 0x0
/* 026A20 80029A20 40820020 */  bne       lbl_80029A40
/* 026A24 80029A24 C00281D8 */  lfs       f0, D_8018C118@sda21(r0)
/* 026A28 80029A28 3861001C */  addi      r3, r1, 0x1c
/* 026A2C 80029A2C C02281D0 */  lfs       f1, D_8018C110@sda21(r0)
/* 026A30 80029A30 EC600632 */  fmuls     f3, f0, f24
/* 026A34 80029A34 C04281D4 */  lfs       f2, D_8018C114@sda21(r0)
/* 026A38 80029A38 4807D0C1 */  bl        fn_800A6AF8
/* 026A3C 80029A3C 480000A0 */  b         lbl_80029ADC
lbl_80029A40:
/* 026A40 80029A40 3C7C0004 */  addis     r3, r28, 0x4
/* 026A44 80029A44 FF002050 */  fneg      f24, f4
/* 026A48 80029A48 8003C4B8 */  lwz       r0, -0x3b48(r3)
/* 026A4C 80029A4C 3C804330 */  lis       r4, 0x4330
/* 026A50 80029A50 8063C4C0 */  lwz       r3, -0x3b40(r3)
/* 026A54 80029A54 FCC02090 */  fmr       f6, f4
/* 026A58 80029A58 6C658000 */  xoris     r5, r3, 0x8000
/* 026A5C 80029A5C C9028110 */  lfd       f8, D_8018C050@sda21(r0)
/* 026A60 80029A60 6C008000 */  xoris     r0, r0, 0x8000
/* 026A64 80029A64 90A10184 */  stw       r5, 0x184(r1)
/* 026A68 80029A68 C8828140 */  lfd       f4, D_8018C080@sda21(r0)
/* 026A6C 80029A6C FCA0C090 */  fmr       f5, f24
/* 026A70 80029A70 9001017C */  stw       r0, 0x17c(r1)
/* 026A74 80029A74 3861001C */  addi      r3, r1, 0x1c
/* 026A78 80029A78 90810180 */  stw       r4, 0x180(r1)
/* 026A7C 80029A7C 90810178 */  stw       r4, 0x178(r1)
/* 026A80 80029A80 C8210180 */  lfd       f1, 0x180(r1)
/* 026A84 80029A84 90A1018C */  stw       r5, 0x18c(r1)
/* 026A88 80029A88 C8010178 */  lfd       f0, 0x178(r1)
/* 026A8C 80029A8C EC214028 */  fsubs     f1, f1, f8
/* 026A90 80029A90 90010174 */  stw       r0, 0x174(r1)
/* 026A94 80029A94 EC004028 */  fsubs     f0, f0, f8
/* 026A98 80029A98 90810188 */  stw       r4, 0x188(r1)
/* 026A9C 80029A9C FC400850 */  fneg      f2, f1
/* 026AA0 80029AA0 90810170 */  stw       r4, 0x170(r1)
/* 026AA4 80029AA4 FC200050 */  fneg      f1, f0
/* 026AA8 80029AA8 C8610188 */  lfd       f3, 0x188(r1)
/* 026AAC 80029AAC FC420132 */  fmul      f2, f2, f4
/* 026AB0 80029AB0 C8010170 */  lfd       f0, 0x170(r1)
/* 026AB4 80029AB4 ECE34028 */  fsubs     f7, f3, f8
/* 026AB8 80029AB8 EC004028 */  fsubs     f0, f0, f8
/* 026ABC 80029ABC FC610132 */  fmul      f3, f1, f4
/* 026AC0 80029AC0 FC270132 */  fmul      f1, f7, f4
/* 026AC4 80029AC4 FC800132 */  fmul      f4, f0, f4
/* 026AC8 80029AC8 FC200818 */  frsp      f1, f1
/* 026ACC 80029ACC FC401018 */  frsp      f2, f2
/* 026AD0 80029AD0 FC601818 */  frsp      f3, f3
/* 026AD4 80029AD4 FC802018 */  frsp      f4, f4
/* 026AD8 80029AD8 4807D0F1 */  bl        C_MTXOrtho
lbl_80029ADC:
/* 026ADC 80029ADC 801C00A0 */  lwz       r0, 0xa0(r28)
/* 026AE0 80029AE0 C0210048 */  lfs       f1, 0x48(r1)
/* 026AE4 80029AE4 5400052A */  rlwinm    r0, r0, 0, 20, 21
/* 026AE8 80029AE8 28000C00 */  cmplwi    r0, 0xc00
/* 026AEC 80029AEC 40820014 */  bne       lbl_80029B00
/* 026AF0 80029AF0 2C170000 */  cmpwi     r23, 0x0
/* 026AF4 80029AF4 4082000C */  bne       lbl_80029B00
/* 026AF8 80029AF8 C00281DC */  lfs       f0, D_8018C11C@sda21(r0)
/* 026AFC 80029AFC EC200E3C */  fnmsubs   f1, f0, f24, f1
lbl_80029B00:
/* 026B00 80029B00 C0010044 */  lfs       f0, 0x44(r1)
/* 026B04 80029B04 7EE4BB78 */  mr        r4, r23
/* 026B08 80029B08 3861005C */  addi      r3, r1, 0x5c
/* 026B0C 80029B0C D0010084 */  stfs      f0, 0x84(r1)
/* 026B10 80029B10 D0210088 */  stfs      f1, 0x88(r1)
/* 026B14 80029B14 480838C1 */  bl        GXSetProjection
lbl_80029B18:
/* 026B18 80029B18 801C008C */  lwz       r0, 0x8c(r28)
/* 026B1C 80029B1C 54000080 */  rlwinm    r0, r0, 0, 2, 0
/* 026B20 80029B20 901C008C */  stw       r0, 0x8c(r28)
lbl_80029B24:
/* 026B24 80029B24 807C009C */  lwz       r3, 0x9c(r28)
/* 026B28 80029B28 546007FE */  clrlwi    r0, r3, 31
/* 026B2C 80029B2C 28000000 */  cmplwi    r0, 0x0
/* 026B30 80029B30 418203C8 */  beq       lbl_80029EF8
/* 026B34 80029B34 801C00A4 */  lwz       r0, 0xa4(r28)
/* 026B38 80029B38 3A800001 */  li        r20, 0x1
/* 026B3C 80029B3C 54000318 */  rlwinm    r0, r0, 0, 12, 12
/* 026B40 80029B40 28000000 */  cmplwi    r0, 0x0
/* 026B44 80029B44 4082000C */  bne       lbl_80029B50
/* 026B48 80029B48 C3428130 */  lfs       f26, D_8018C070@sda21(r0)
/* 026B4C 80029B4C 48000008 */  b         lbl_80029B54
lbl_80029B50:
/* 026B50 80029B50 C3428138 */  lfs       f26, D_8018C078@sda21(r0)
lbl_80029B54:
/* 026B54 80029B54 5460C77E */  extrwi    r0, r3, 3, 21
/* 026B58 80029B58 2C000007 */  cmpwi     r0, 0x7
/* 026B5C 80029B5C 7C130378 */  mr        r19, r0
/* 026B60 80029B60 38800000 */  li        r4, 0x0
/* 026B64 80029B64 40800020 */  bge       lbl_80029B84
/* 026B68 80029B68 1C13002C */  mulli     r0, r19, 0x2c
/* 026B6C 80029B6C 3C7C0004 */  addis     r3, r28, 0x4
/* 026B70 80029B70 7C630214 */  add       r3, r3, r0
/* 026B74 80029B74 8003C390 */  lwz       r0, -0x3c70(r3)
/* 026B78 80029B78 2C000000 */  cmpwi     r0, 0x0
/* 026B7C 80029B7C 41820008 */  beq       lbl_80029B84
/* 026B80 80029B80 38800001 */  li        r4, 0x1
lbl_80029B84:
/* 026B84 80029B84 2C040000 */  cmpwi     r4, 0x0
/* 026B88 80029B88 4182000C */  beq       lbl_80029B94
/* 026B8C 80029B8C 38600001 */  li        r3, 0x1
/* 026B90 80029B90 48000008 */  b         lbl_80029B98
lbl_80029B94:
/* 026B94 80029B94 38600000 */  li        r3, 0x0
lbl_80029B98:
/* 026B98 80029B98 801C007C */  lwz       r0, 0x7c(r28)
/* 026B9C 80029B9C 7E531A14 */  add       r18, r19, r3
/* 026BA0 80029BA0 540007FE */  clrlwi    r0, r0, 31
/* 026BA4 80029BA4 28000000 */  cmplwi    r0, 0x0
/* 026BA8 80029BA8 41820354 */  beq       lbl_80029EFC
/* 026BAC 80029BAC 38C00000 */  li        r6, 0x0
/* 026BB0 80029BB0 1CB3002C */  mulli     r5, r19, 0x2c
/* 026BB4 80029BB4 3C60800F */  lis       r3, D_800EBD50@ha
/* 026BB8 80029BB8 54C4103A */  slwi      r4, r6, 2
/* 026BBC 80029BBC 3803BD50 */  addi      r0, r3, D_800EBD50@l
/* 026BC0 80029BC0 7EE02214 */  add       r23, r0, r4
/* 026BC4 80029BC4 5660103A */  slwi      r0, r19, 2
/* 026BC8 80029BC8 3B21012C */  addi      r25, r1, 0x12c
/* 026BCC 80029BCC 54DA2036 */  slwi      r26, r6, 4
/* 026BD0 80029BD0 7F390214 */  add       r25, r25, r0
/* 026BD4 80029BD4 7F1C2A14 */  add       r24, r28, r5
/* 026BD8 80029BD8 48000004 */  b         lbl_80029BDC
lbl_80029BDC:
/* 026BDC 80029BDC CB628110 */  lfd       f27, D_8018C050@sda21(r0)
/* 026BE0 80029BE0 3F604330 */  lis       r27, 0x4330
/* 026BE4 80029BE4 C3828104 */  lfs       f28, D_8018C044@sda21(r0)
/* 026BE8 80029BE8 C3A281E0 */  lfs       f29, D_8018C120@sda21(r0)
/* 026BEC 80029BEC CBC28128 */  lfd       f30, D_8018C068@sda21(r0)
/* 026BF0 80029BF0 C3E28130 */  lfs       f31, D_8018C070@sda21(r0)
/* 026BF4 80029BF4 48000004 */  b         lbl_80029BF8
lbl_80029BF8:
/* 026BF8 80029BF8 480002F4 */  b         lbl_80029EEC
lbl_80029BFC:
/* 026BFC 80029BFC 7F83E378 */  mr        r3, r28
/* 026C00 80029C00 7F24CB78 */  mr        r4, r25
/* 026C04 80029C04 7E65D378 */  or        r5, r19, r26
/* 026C08 80029C08 4BFF64E9 */  bl        frameLoadTile
/* 026C0C 80029C0C 2C030000 */  cmpwi     r3, 0x0
/* 026C10 80029C10 418202C8 */  beq       lbl_80029ED8
/* 026C14 80029C14 2C160000 */  cmpwi     r22, 0x0
/* 026C18 80029C18 418200F4 */  beq       lbl_80029D0C
/* 026C1C 80029C1C 801C0098 */  lwz       r0, 0x98(r28)
/* 026C20 80029C20 3CB80004 */  addis     r5, r24, 0x4
/* 026C24 80029C24 80D90000 */  lwz       r6, 0x0(r25)
/* 026C28 80029C28 5403843E */  srwi      r3, r0, 16
/* 026C2C 80029C2C A885C378 */  lha       r4, -0x3c88(r5)
/* 026C30 80029C30 5400043E */  clrlwi    r0, r0, 16
/* 026C34 80029C34 9061016C */  stw       r3, 0x16c(r1)
/* 026C38 80029C38 A9060010 */  lha       r8, 0x10(r6)
/* 026C3C 80029C3C 6C878000 */  xoris     r7, r4, 0x8000
/* 026C40 80029C40 9001015C */  stw       r0, 0x15c(r1)
/* 026C44 80029C44 A9260012 */  lha       r9, 0x12(r6)
/* 026C48 80029C48 55033032 */  slwi      r3, r8, 6
/* 026C4C 80029C4C 93610168 */  stw       r27, 0x168(r1)
/* 026C50 80029C50 6D068000 */  xoris     r6, r8, 0x8000
/* 026C54 80029C54 A885C37A */  lha       r4, -0x3c86(r5)
/* 026C58 80029C58 93610158 */  stw       r27, 0x158(r1)
/* 026C5C 80029C5C 55203032 */  slwi      r0, r9, 6
/* 026C60 80029C60 C8210168 */  lfd       f1, 0x168(r1)
/* 026C64 80029C64 6C858000 */  xoris     r5, r4, 0x8000
/* 026C68 80029C68 C8010158 */  lfd       f0, 0x158(r1)
/* 026C6C 80029C6C EC21F028 */  fsubs     f1, f1, f30
/* 026C70 80029C70 90E10174 */  stw       r7, 0x174(r1)
/* 026C74 80029C74 EC00F028 */  fsubs     f0, f0, f30
/* 026C78 80029C78 6D248000 */  xoris     r4, r9, 0x8000
/* 026C7C 80029C7C 90A10184 */  stw       r5, 0x184(r1)
/* 026C80 80029C80 EC21E824 */  fdivs     f1, f1, f29
/* 026C84 80029C84 93610170 */  stw       r27, 0x170(r1)
/* 026C88 80029C88 6C638000 */  xoris     r3, r3, 0x8000
/* 026C8C 80029C8C 93610180 */  stw       r27, 0x180(r1)
/* 026C90 80029C90 6C008000 */  xoris     r0, r0, 0x8000
/* 026C94 80029C94 EC00E824 */  fdivs     f0, f0, f29
/* 026C98 80029C98 90C1017C */  stw       r6, 0x17c(r1)
/* 026C9C 80029C9C C8610170 */  lfd       f3, 0x170(r1)
/* 026CA0 80029CA0 9081018C */  stw       r4, 0x18c(r1)
/* 026CA4 80029CA4 C8410180 */  lfd       f2, 0x180(r1)
/* 026CA8 80029CA8 90610164 */  stw       r3, 0x164(r1)
/* 026CAC 80029CAC EC63D828 */  fsubs     f3, f3, f27
/* 026CB0 80029CB0 EC42D828 */  fsubs     f2, f2, f27
/* 026CB4 80029CB4 90010154 */  stw       r0, 0x154(r1)
/* 026CB8 80029CB8 EF3D0072 */  fmuls     f25, f29, f1
/* 026CBC 80029CBC ECA30732 */  fmuls     f5, f3, f28
/* 026CC0 80029CC0 93610178 */  stw       r27, 0x178(r1)
/* 026CC4 80029CC4 EC620732 */  fmuls     f3, f2, f28
/* 026CC8 80029CC8 93610188 */  stw       r27, 0x188(r1)
/* 026CCC 80029CCC EF1D0032 */  fmuls     f24, f29, f0
/* 026CD0 80029CD0 C8210178 */  lfd       f1, 0x178(r1)
/* 026CD4 80029CD4 93610160 */  stw       r27, 0x160(r1)
/* 026CD8 80029CD8 C8010188 */  lfd       f0, 0x188(r1)
/* 026CDC 80029CDC EC81D828 */  fsubs     f4, f1, f27
/* 026CE0 80029CE0 93610150 */  stw       r27, 0x150(r1)
/* 026CE4 80029CE4 C8210160 */  lfd       f1, 0x160(r1)
/* 026CE8 80029CE8 EC40D828 */  fsubs     f2, f0, f27
/* 026CEC 80029CEC C8010150 */  lfd       f0, 0x150(r1)
/* 026CF0 80029CF0 EC21D828 */  fsubs     f1, f1, f27
/* 026CF4 80029CF4 EC00D828 */  fsubs     f0, f0, f27
/* 026CF8 80029CF8 EC852024 */  fdivs     f4, f5, f4
/* 026CFC 80029CFC EC431024 */  fdivs     f2, f3, f2
/* 026D00 80029D00 EF390824 */  fdivs     f25, f25, f1
/* 026D04 80029D04 EF180024 */  fdivs     f24, f24, f0
/* 026D08 80029D08 480000D8 */  b         lbl_80029DE0
lbl_80029D0C:
/* 026D0C 80029D0C 801C0098 */  lwz       r0, 0x98(r28)
/* 026D10 80029D10 3CB80004 */  addis     r5, r24, 0x4
/* 026D14 80029D14 80D90000 */  lwz       r6, 0x0(r25)
/* 026D18 80029D18 5403843E */  srwi      r3, r0, 16
/* 026D1C 80029D1C A885C378 */  lha       r4, -0x3c88(r5)
/* 026D20 80029D20 5400043E */  clrlwi    r0, r0, 16
/* 026D24 80029D24 90610174 */  stw       r3, 0x174(r1)
/* 026D28 80029D28 A865C37A */  lha       r3, -0x3c86(r5)
/* 026D2C 80029D2C 6C858000 */  xoris     r5, r4, 0x8000
/* 026D30 80029D30 90010184 */  stw       r0, 0x184(r1)
/* 026D34 80029D34 6C638000 */  xoris     r3, r3, 0x8000
/* 026D38 80029D38 A8060010 */  lha       r0, 0x10(r6)
/* 026D3C 80029D3C 93610170 */  stw       r27, 0x170(r1)
/* 026D40 80029D40 6C048000 */  xoris     r4, r0, 0x8000
/* 026D44 80029D44 A8060012 */  lha       r0, 0x12(r6)
/* 026D48 80029D48 93610180 */  stw       r27, 0x180(r1)
/* 026D4C 80029D4C C8210170 */  lfd       f1, 0x170(r1)
/* 026D50 80029D50 6C008000 */  xoris     r0, r0, 0x8000
/* 026D54 80029D54 C8010180 */  lfd       f0, 0x180(r1)
/* 026D58 80029D58 EC21F028 */  fsubs     f1, f1, f30
/* 026D5C 80029D5C 90A10154 */  stw       r5, 0x154(r1)
/* 026D60 80029D60 EC00F028 */  fsubs     f0, f0, f30
/* 026D64 80029D64 90610164 */  stw       r3, 0x164(r1)
/* 026D68 80029D68 EF21E824 */  fdivs     f25, f1, f29
/* 026D6C 80029D6C 93610150 */  stw       r27, 0x150(r1)
/* 026D70 80029D70 93610160 */  stw       r27, 0x160(r1)
/* 026D74 80029D74 C8210150 */  lfd       f1, 0x150(r1)
/* 026D78 80029D78 9081015C */  stw       r4, 0x15c(r1)
/* 026D7C 80029D7C 9001016C */  stw       r0, 0x16c(r1)
/* 026D80 80029D80 EC41D828 */  fsubs     f2, f1, f27
/* 026D84 80029D84 C8210160 */  lfd       f1, 0x160(r1)
/* 026D88 80029D88 EF00E824 */  fdivs     f24, f0, f29
/* 026D8C 80029D8C 9081017C */  stw       r4, 0x17c(r1)
/* 026D90 80029D90 9001018C */  stw       r0, 0x18c(r1)
/* 026D94 80029D94 93610158 */  stw       r27, 0x158(r1)
/* 026D98 80029D98 93610168 */  stw       r27, 0x168(r1)
/* 026D9C 80029D9C 93610178 */  stw       r27, 0x178(r1)
/* 026DA0 80029DA0 EC61D828 */  fsubs     f3, f1, f27
/* 026DA4 80029DA4 C8010158 */  lfd       f0, 0x158(r1)
/* 026DA8 80029DA8 ECA2FF38 */  fmsubs    f5, f2, f28, f31
/* 026DAC 80029DAC 93610188 */  stw       r27, 0x188(r1)
/* 026DB0 80029DB0 C8410168 */  lfd       f2, 0x168(r1)
/* 026DB4 80029DB4 C8210178 */  lfd       f1, 0x178(r1)
/* 026DB8 80029DB8 EC80D828 */  fsubs     f4, f0, f27
/* 026DBC 80029DBC C8010188 */  lfd       f0, 0x188(r1)
/* 026DC0 80029DC0 EC63FF38 */  fmsubs    f3, f3, f28, f31
/* 026DC4 80029DC4 EC42D828 */  fsubs     f2, f2, f27
/* 026DC8 80029DC8 EC21D828 */  fsubs     f1, f1, f27
/* 026DCC 80029DCC EC00D828 */  fsubs     f0, f0, f27
/* 026DD0 80029DD0 EC852024 */  fdivs     f4, f5, f4
/* 026DD4 80029DD4 EC431024 */  fdivs     f2, f3, f2
/* 026DD8 80029DD8 EF390824 */  fdivs     f25, f25, f1
/* 026DDC 80029DDC EF180024 */  fdivs     f24, f24, f0
lbl_80029DE0:
/* 026DE0 80029DE0 3C780004 */  addis     r3, r24, 0x4
/* 026DE4 80029DE4 A863C374 */  lha       r3, -0x3c8c(r3)
/* 026DE8 80029DE8 2C03000B */  cmpwi     r3, 0xb
/* 026DEC 80029DEC 40800028 */  bge       lbl_80029E14
/* 026DF0 80029DF0 38000001 */  li        r0, 0x1
/* 026DF4 80029DF4 7C001830 */  slw       r0, r0, r3
/* 026DF8 80029DF8 6C008000 */  xoris     r0, r0, 0x8000
/* 026DFC 80029DFC 90010154 */  stw       r0, 0x154(r1)
/* 026E00 80029E00 93610150 */  stw       r27, 0x150(r1)
/* 026E04 80029E04 C8010150 */  lfd       f0, 0x150(r1)
/* 026E08 80029E08 EC00D828 */  fsubs     f0, f0, f27
/* 026E0C 80029E0C EF390024 */  fdivs     f25, f25, f0
/* 026E10 80029E10 48000028 */  b         lbl_80029E38
lbl_80029E14:
/* 026E14 80029E14 20030010 */  subfic    r0, r3, 0x10
/* 026E18 80029E18 38600001 */  li        r3, 0x1
/* 026E1C 80029E1C 7C600030 */  slw       r0, r3, r0
/* 026E20 80029E20 6C008000 */  xoris     r0, r0, 0x8000
/* 026E24 80029E24 90010154 */  stw       r0, 0x154(r1)
/* 026E28 80029E28 93610150 */  stw       r27, 0x150(r1)
/* 026E2C 80029E2C C8010150 */  lfd       f0, 0x150(r1)
/* 026E30 80029E30 EC00D828 */  fsubs     f0, f0, f27
/* 026E34 80029E34 EF390032 */  fmuls     f25, f25, f0
lbl_80029E38:
/* 026E38 80029E38 3C780004 */  addis     r3, r24, 0x4
/* 026E3C 80029E3C A863C376 */  lha       r3, -0x3c8a(r3)
/* 026E40 80029E40 2C03000B */  cmpwi     r3, 0xb
/* 026E44 80029E44 40800028 */  bge       lbl_80029E6C
/* 026E48 80029E48 38000001 */  li        r0, 0x1
/* 026E4C 80029E4C 7C001830 */  slw       r0, r0, r3
/* 026E50 80029E50 6C008000 */  xoris     r0, r0, 0x8000
/* 026E54 80029E54 90010154 */  stw       r0, 0x154(r1)
/* 026E58 80029E58 93610150 */  stw       r27, 0x150(r1)
/* 026E5C 80029E5C C8010150 */  lfd       f0, 0x150(r1)
/* 026E60 80029E60 EC00D828 */  fsubs     f0, f0, f27
/* 026E64 80029E64 EF180024 */  fdivs     f24, f24, f0
/* 026E68 80029E68 48000028 */  b         lbl_80029E90
lbl_80029E6C:
/* 026E6C 80029E6C 20030010 */  subfic    r0, r3, 0x10
/* 026E70 80029E70 38600001 */  li        r3, 0x1
/* 026E74 80029E74 7C600030 */  slw       r0, r3, r0
/* 026E78 80029E78 6C008000 */  xoris     r0, r0, 0x8000
/* 026E7C 80029E7C 90010154 */  stw       r0, 0x154(r1)
/* 026E80 80029E80 93610150 */  stw       r27, 0x150(r1)
/* 026E84 80029E84 C8010150 */  lfd       f0, 0x150(r1)
/* 026E88 80029E88 EC00D828 */  fsubs     f0, f0, f27
/* 026E8C 80029E8C EF180032 */  fmuls     f24, f24, f0
lbl_80029E90:
/* 026E90 80029E90 FC202050 */  fneg      f1, f4
/* 026E94 80029E94 C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 026E98 80029E98 FC401050 */  fneg      f2, f2
/* 026E9C 80029E9C 386100CC */  addi      r3, r1, 0xcc
/* 026EA0 80029EA0 4807CB05 */  bl        PSMTXTrans
/* 026EA4 80029EA4 EC3906B2 */  fmuls     f1, f25, f26
/* 026EA8 80029EA8 C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 026EAC 80029EAC EC5806B2 */  fmuls     f2, f24, f26
/* 026EB0 80029EB0 3861009C */  addi      r3, r1, 0x9c
/* 026EB4 80029EB4 4807CB71 */  bl        PSMTXScale
/* 026EB8 80029EB8 386100CC */  addi      r3, r1, 0xcc
/* 026EBC 80029EBC 3881009C */  addi      r4, r1, 0x9c
/* 026EC0 80029EC0 38A100FC */  addi      r5, r1, 0xfc
/* 026EC4 80029EC4 4807CA15 */  bl        PSMTXConcat
/* 026EC8 80029EC8 80970000 */  lwz       r4, 0x0(r23)
/* 026ECC 80029ECC 386100FC */  addi      r3, r1, 0xfc
/* 026ED0 80029ED0 38A00001 */  li        r5, 0x1
/* 026ED4 80029ED4 4808374D */  bl        fn_800AD620
lbl_80029ED8:
/* 026ED8 80029ED8 3B390004 */  addi      r25, r25, 0x4
/* 026EDC 80029EDC 3B18002C */  addi      r24, r24, 0x2c
/* 026EE0 80029EE0 3A730001 */  addi      r19, r19, 0x1
/* 026EE4 80029EE4 3B5A0010 */  addi      r26, r26, 0x10
/* 026EE8 80029EE8 3AF70004 */  addi      r23, r23, 0x4
lbl_80029EEC:
/* 026EEC 80029EEC 7C139000 */  cmpw      r19, r18
/* 026EF0 80029EF0 4081FD0C */  ble       lbl_80029BFC
/* 026EF4 80029EF4 48000008 */  b         lbl_80029EFC
lbl_80029EF8:
/* 026EF8 80029EF8 3A800000 */  li        r20, 0x0
lbl_80029EFC:
/* 026EFC 80029EFC 807C0094 */  lwz       r3, 0x94(r28)
/* 026F00 80029F00 546007BC */  rlwinm    r0, r3, 0, 30, 30
/* 026F04 80029F04 28000000 */  cmplwi    r0, 0x0
/* 026F08 80029F08 4182001C */  beq       lbl_80029F24
/* 026F0C 80029F0C 546005AC */  rlwinm    r0, r3, 0, 22, 22
/* 026F10 80029F10 28000000 */  cmplwi    r0, 0x0
/* 026F14 80029F14 4182000C */  beq       lbl_80029F20
/* 026F18 80029F18 7FF5FB78 */  mr        r21, r31
/* 026F1C 80029F1C 48000008 */  b         lbl_80029F24
lbl_80029F20:
/* 026F20 80029F20 3AA00001 */  li        r21, 0x1
lbl_80029F24:
/* 026F24 80029F24 929E0000 */  stw       r20, 0x0(r30)
/* 026F28 80029F28 38600001 */  li        r3, 0x1
/* 026F2C 80029F2C 92BD0000 */  stw       r21, 0x0(r29)
/* 026F30 80029F30 BA410190 */  lmw       r18, 0x190(r1)
/* 026F34 80029F34 8001020C */  lwz       r0, 0x20c(r1)
/* 026F38 80029F38 CBE10200 */  lfd       f31, 0x200(r1)
/* 026F3C 80029F3C CBC101F8 */  lfd       f30, 0x1f8(r1)
/* 026F40 80029F40 7C0803A6 */  mtlr      r0
/* 026F44 80029F44 CBA101F0 */  lfd       f29, 0x1f0(r1)
/* 026F48 80029F48 CB8101E8 */  lfd       f28, 0x1e8(r1)
/* 026F4C 80029F4C CB6101E0 */  lfd       f27, 0x1e0(r1)
/* 026F50 80029F50 CB4101D8 */  lfd       f26, 0x1d8(r1)
/* 026F54 80029F54 CB2101D0 */  lfd       f25, 0x1d0(r1)
/* 026F58 80029F58 CB0101C8 */  lfd       f24, 0x1c8(r1)
/* 026F5C 80029F5C 38210208 */  addi      r1, r1, 0x208
/* 026F60 80029F60 4E800020 */  blr

glabel frameDrawSetup2D
/* 026F64 80029F64 7C0802A6 */  mflr      r0
/* 026F68 80029F68 90010004 */  stw       r0, 0x4(r1)
/* 026F6C 80029F6C 9421FF98 */  stwu      r1, -0x68(r1)
/* 026F70 80029F70 93E10064 */  stw       r31, 0x64(r1)
/* 026F74 80029F74 93C10060 */  stw       r30, 0x60(r1)
/* 026F78 80029F78 7C7F1B78 */  mr        r31, r3
/* 026F7C 80029F7C 801F008C */  lwz       r0, 0x8c(r31)
/* 026F80 80029F80 54000042 */  rlwinm    r0, r0, 0, 1, 1
/* 026F84 80029F84 28000000 */  cmplwi    r0, 0x0
/* 026F88 80029F88 4082016C */  bne       lbl_8002A0F4
/* 026F8C 80029F8C 801F008C */  lwz       r0, 0x8c(r31)
/* 026F90 80029F90 3CBF0004 */  addis     r5, r31, 0x4
/* 026F94 80029F94 3C604330 */  lis       r3, 0x4330
/* 026F98 80029F98 64004000 */  oris      r0, r0, 0x4000
/* 026F9C 80029F9C 901F008C */  stw       r0, 0x8c(r31)
/* 026FA0 80029FA0 8085C4BC */  lwz       r4, -0x3b44(r5)
/* 026FA4 80029FA4 8005C4C4 */  lwz       r0, -0x3b3c(r5)
/* 026FA8 80029FA8 6C848000 */  xoris     r4, r4, 0x8000
/* 026FAC 80029FAC C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 026FB0 80029FB0 6C008000 */  xoris     r0, r0, 0x8000
/* 026FB4 80029FB4 9081005C */  stw       r4, 0x5c(r1)
/* 026FB8 80029FB8 C8828110 */  lfd       f4, D_8018C050@sda21(r0)
/* 026FBC 80029FBC FC400890 */  fmr       f2, f1
/* 026FC0 80029FC0 90010054 */  stw       r0, 0x54(r1)
/* 026FC4 80029FC4 FCA00890 */  fmr       f5, f1
/* 026FC8 80029FC8 C0C28138 */  lfs       f6, D_8018C078@sda21(r0)
/* 026FCC 80029FCC 90610058 */  stw       r3, 0x58(r1)
/* 026FD0 80029FD0 90610050 */  stw       r3, 0x50(r1)
/* 026FD4 80029FD4 C8610058 */  lfd       f3, 0x58(r1)
/* 026FD8 80029FD8 C8010050 */  lfd       f0, 0x50(r1)
/* 026FDC 80029FDC EC632028 */  fsubs     f3, f3, f4
/* 026FE0 80029FE0 EC802028 */  fsubs     f4, f0, f4
/* 026FE4 80029FE4 480837F5 */  bl        GXSetViewport
/* 026FE8 80029FE8 801F007C */  lwz       r0, 0x7c(r31)
/* 026FEC 80029FEC 64000001 */  oris      r0, r0, 0x1
/* 026FF0 80029FF0 901F007C */  stw       r0, 0x7c(r31)
/* 026FF4 80029FF4 800D89A0 */  lwz       r0, D_8018B920@sda21(r0)
/* 026FF8 80029FF8 2C000000 */  cmpwi     r0, 0x0
/* 026FFC 80029FFC 41820020 */  beq       lbl_8002A01C
/* 027000 8002A000 806D89A4 */  lwz       r3, D_8018B924@sda21(r0)
/* 027004 8002A004 808D89A8 */  lwz       r4, D_8018B928@sda21(r0)
/* 027008 8002A008 80AD89AC */  lwz       r5, D_8018B92C@sda21(r0)
/* 02700C 8002A00C 80CD89B0 */  lwz       r6, D_8018B930@sda21(r0)
/* 027010 8002A010 480837ED */  bl        GXSetScissor
/* 027014 8002A014 38000000 */  li        r0, 0x0
/* 027018 8002A018 900D89A0 */  stw       r0, D_8018B920@sda21(r0)
lbl_8002A01C:
/* 02701C 8002A01C C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 027020 8002A020 3FDF0004 */  addis     r30, r31, 0x4
/* 027024 8002A024 801ED124 */  lwz       r0, -0x2edc(r30)
/* 027028 8002A028 3881000C */  addi      r4, r1, 0xc
/* 02702C 8002A02C FC400890 */  fmr       f2, f1
/* 027030 8002A030 FC600890 */  fmr       f3, f1
/* 027034 8002A034 9001000C */  stw       r0, 0xc(r1)
/* 027038 8002A038 C08281C8 */  lfs       f4, D_8018C108@sda21(r0)
/* 02703C 8002A03C 38600000 */  li        r3, 0x0
/* 027040 8002A040 48082BF5 */  bl        fn_800ACC34
/* 027044 8002A044 801F007C */  lwz       r0, 0x7c(r31)
/* 027048 8002A048 3C804330 */  lis       r4, 0x4330
/* 02704C 8002A04C 38610010 */  addi      r3, r1, 0x10
/* 027050 8002A050 60000020 */  ori       r0, r0, 0x20
/* 027054 8002A054 901F007C */  stw       r0, 0x7c(r31)
/* 027058 8002A058 80BEC4C0 */  lwz       r5, -0x3b40(r30)
/* 02705C 8002A05C 801EC4B8 */  lwz       r0, -0x3b48(r30)
/* 027060 8002A060 6CA58000 */  xoris     r5, r5, 0x8000
/* 027064 8002A064 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 027068 8002A068 6C008000 */  xoris     r0, r0, 0x8000
/* 02706C 8002A06C 90A10054 */  stw       r5, 0x54(r1)
/* 027070 8002A070 C8E28110 */  lfd       f7, D_8018C050@sda21(r0)
/* 027074 8002A074 FC600890 */  fmr       f3, f1
/* 027078 8002A078 9001005C */  stw       r0, 0x5c(r1)
/* 02707C 8002A07C FCA00890 */  fmr       f5, f1
/* 027080 8002A080 C0828138 */  lfs       f4, D_8018C078@sda21(r0)
/* 027084 8002A084 90810050 */  stw       r4, 0x50(r1)
/* 027088 8002A088 C0C281E4 */  lfs       f6, D_8018C124@sda21(r0)
/* 02708C 8002A08C 90810058 */  stw       r4, 0x58(r1)
/* 027090 8002A090 C8410050 */  lfd       f2, 0x50(r1)
/* 027094 8002A094 C8010058 */  lfd       f0, 0x58(r1)
/* 027098 8002A098 EC423828 */  fsubs     f2, f2, f7
/* 02709C 8002A09C EC003828 */  fsubs     f0, f0, f7
/* 0270A0 8002A0A0 EC422028 */  fsubs     f2, f2, f4
/* 0270A4 8002A0A4 EC802028 */  fsubs     f4, f0, f4
/* 0270A8 8002A0A8 4807CB21 */  bl        C_MTXOrtho
/* 0270AC 8002A0AC 38610010 */  addi      r3, r1, 0x10
/* 0270B0 8002A0B0 38800001 */  li        r4, 0x1
/* 0270B4 8002A0B4 48083321 */  bl        GXSetProjection
/* 0270B8 8002A0B8 801F007C */  lwz       r0, 0x7c(r31)
/* 0270BC 8002A0BC 38600000 */  li        r3, 0x0
/* 0270C0 8002A0C0 64000004 */  oris      r0, r0, 0x4
/* 0270C4 8002A0C4 901F007C */  stw       r0, 0x7c(r31)
/* 0270C8 8002A0C8 48080109 */  bl        GXSetCullMode
/* 0270CC 8002A0CC 801F007C */  lwz       r0, 0x7c(r31)
/* 0270D0 8002A0D0 38600000 */  li        r3, 0x0
/* 0270D4 8002A0D4 38800003 */  li        r4, 0x3
/* 0270D8 8002A0D8 60000008 */  ori       r0, r0, 0x8
/* 0270DC 8002A0DC 901F007C */  stw       r0, 0x7c(r31)
/* 0270E0 8002A0E0 38A00001 */  li        r5, 0x1
/* 0270E4 8002A0E4 48083075 */  bl        GXSetZMode
/* 0270E8 8002A0E8 801F007C */  lwz       r0, 0x7c(r31)
/* 0270EC 8002A0EC 60000004 */  ori       r0, r0, 0x4
/* 0270F0 8002A0F0 901F007C */  stw       r0, 0x7c(r31)
lbl_8002A0F4:
/* 0270F4 8002A0F4 38600001 */  li        r3, 0x1
/* 0270F8 8002A0F8 8001006C */  lwz       r0, 0x6c(r1)
/* 0270FC 8002A0FC 83E10064 */  lwz       r31, 0x64(r1)
/* 027100 8002A100 83C10060 */  lwz       r30, 0x60(r1)
/* 027104 8002A104 7C0803A6 */  mtlr      r0
/* 027108 8002A108 38210068 */  addi      r1, r1, 0x68
/* 02710C 8002A10C 4E800020 */  blr

glabel frameLoadTexture
/* 027110 8002A110 7C0802A6 */  mflr      r0
/* 027114 8002A114 90010004 */  stw       r0, 0x4(r1)
/* 027118 8002A118 9421FFC0 */  stwu      r1, -0x40(r1)
/* 02711C 8002A11C BF410028 */  stmw      r26, 0x28(r1)
/* 027120 8002A120 7C7A1B78 */  mr        r26, r3
/* 027124 8002A124 7C9B2378 */  mr        r27, r4
/* 027128 8002A128 801A0088 */  lwz       r0, 0x88(r26)
/* 02712C 8002A12C 3C60800F */  lis       r3, D_800EBCF0@ha
/* 027130 8002A130 3BE3BCF0 */  addi      r31, r3, D_800EBCF0@l
/* 027134 8002A134 901B000C */  stw       r0, 0xc(r27)
/* 027138 8002A138 7CBE2670 */  srawi     r30, r5, 4
/* 02713C 8002A13C A8660018 */  lha       r3, 0x18(r6)
/* 027140 8002A140 546007BC */  rlwinm    r0, r3, 0, 30, 30
/* 027144 8002A144 2C000000 */  cmpwi     r0, 0x0
/* 027148 8002A148 40820010 */  bne       lbl_8002A158
/* 02714C 8002A14C A8060014 */  lha       r0, 0x14(r6)
/* 027150 8002A150 2C000000 */  cmpwi     r0, 0x0
/* 027154 8002A154 4082001C */  bne       lbl_8002A170
lbl_8002A158:
/* 027158 8002A158 801B0000 */  lwz       r0, 0x0(r27)
/* 02715C 8002A15C 540007FE */  clrlwi    r0, r0, 31
/* 027160 8002A160 2C000000 */  cmpwi     r0, 0x0
/* 027164 8002A164 4082000C */  bne       lbl_8002A170
/* 027168 8002A168 3BA00000 */  li        r29, 0x0
/* 02716C 8002A16C 4800001C */  b         lbl_8002A188
lbl_8002A170:
/* 027170 8002A170 546007FE */  clrlwi    r0, r3, 31
/* 027174 8002A174 2C000000 */  cmpwi     r0, 0x0
/* 027178 8002A178 4182000C */  beq       lbl_8002A184
/* 02717C 8002A17C 3BA00002 */  li        r29, 0x2
/* 027180 8002A180 48000008 */  b         lbl_8002A188
lbl_8002A184:
/* 027184 8002A184 3BA00001 */  li        r29, 0x1
lbl_8002A188:
/* 027188 8002A188 A866001A */  lha       r3, 0x1a(r6)
/* 02718C 8002A18C 546007BC */  rlwinm    r0, r3, 0, 30, 30
/* 027190 8002A190 2C000000 */  cmpwi     r0, 0x0
/* 027194 8002A194 40820010 */  bne       lbl_8002A1A4
/* 027198 8002A198 A8060016 */  lha       r0, 0x16(r6)
/* 02719C 8002A19C 2C000000 */  cmpwi     r0, 0x0
/* 0271A0 8002A1A0 4082001C */  bne       lbl_8002A1BC
lbl_8002A1A4:
/* 0271A4 8002A1A4 801B0000 */  lwz       r0, 0x0(r27)
/* 0271A8 8002A1A8 540007BC */  rlwinm    r0, r0, 0, 30, 30
/* 0271AC 8002A1AC 2C000000 */  cmpwi     r0, 0x0
/* 0271B0 8002A1B0 4082000C */  bne       lbl_8002A1BC
/* 0271B4 8002A1B4 3B800000 */  li        r28, 0x0
/* 0271B8 8002A1B8 4800001C */  b         lbl_8002A1D4
lbl_8002A1BC:
/* 0271BC 8002A1BC 546007FE */  clrlwi    r0, r3, 31
/* 0271C0 8002A1C0 2C000000 */  cmpwi     r0, 0x0
/* 0271C4 8002A1C4 4182000C */  beq       lbl_8002A1D0
/* 0271C8 8002A1C8 3B800002 */  li        r28, 0x2
/* 0271CC 8002A1CC 48000008 */  b         lbl_8002A1D4
lbl_8002A1D0:
/* 0271D0 8002A1D0 3B800001 */  li        r28, 0x1
lbl_8002A1D4:
/* 0271D4 8002A1D4 801B0064 */  lwz       r0, 0x64(r27)
/* 0271D8 8002A1D8 7C00E800 */  cmpw      r0, r29
/* 0271DC 8002A1DC 40820010 */  bne       lbl_8002A1EC
/* 0271E0 8002A1E0 801B0068 */  lwz       r0, 0x68(r27)
/* 0271E4 8002A1E4 7C00E000 */  cmpw      r0, r28
/* 0271E8 8002A1E8 418200FC */  beq       lbl_8002A2E4
lbl_8002A1EC:
/* 0271EC 8002A1EC 93BB0064 */  stw       r29, 0x64(r27)
/* 0271F0 8002A1F0 939B0068 */  stw       r28, 0x68(r27)
/* 0271F4 8002A1F4 80BB0034 */  lwz       r5, 0x34(r27)
/* 0271F8 8002A1F8 2C050008 */  cmpwi     r5, 0x8
/* 0271FC 8002A1FC 4182000C */  beq       lbl_8002A208
/* 027200 8002A200 2C050009 */  cmpwi     r5, 0x9
/* 027204 8002A204 4082009C */  bne       lbl_8002A2A0
lbl_8002A208:
/* 027208 8002A208 801B0008 */  lwz       r0, 0x8(r27)
/* 02720C 8002A20C 2C00FFFF */  cmpwi     r0, -0x1
/* 027210 8002A210 4082000C */  bne       lbl_8002A21C
/* 027214 8002A214 38800000 */  li        r4, 0x0
/* 027218 8002A218 48000014 */  b         lbl_8002A22C
lbl_8002A21C:
/* 02721C 8002A21C 5400043E */  clrlwi    r0, r0, 16
/* 027220 8002A220 807A1C1C */  lwz       r3, 0x1c1c(r26)
/* 027224 8002A224 54002834 */  slwi      r0, r0, 5
/* 027228 8002A228 7C830214 */  add       r4, r3, r0
lbl_8002A22C:
/* 02722C 8002A22C 2C050008 */  cmpwi     r5, 0x8
/* 027230 8002A230 4082000C */  bne       lbl_8002A23C
/* 027234 8002A234 38000010 */  li        r0, 0x10
/* 027238 8002A238 48000008 */  b         lbl_8002A240
lbl_8002A23C:
/* 02723C 8002A23C 38000100 */  li        r0, 0x100
lbl_8002A240:
/* 027240 8002A240 387B0038 */  addi      r3, r27, 0x38
/* 027244 8002A244 5406043E */  clrlwi    r6, r0, 16
/* 027248 8002A248 38A00002 */  li        r5, 0x2
/* 02724C 8002A24C 4808175D */  bl        fn_800AB9A8
/* 027250 8002A250 801B0004 */  lwz       r0, 0x4(r27)
/* 027254 8002A254 2C00FFFF */  cmpwi     r0, -0x1
/* 027258 8002A258 4082000C */  bne       lbl_8002A264
/* 02725C 8002A25C 38800000 */  li        r4, 0x0
/* 027260 8002A260 48000014 */  b         lbl_8002A274
lbl_8002A264:
/* 027264 8002A264 5400043E */  clrlwi    r0, r0, 16
/* 027268 8002A268 807A1C18 */  lwz       r3, 0x1c18(r26)
/* 02726C 8002A26C 54005828 */  slwi      r0, r0, 11
/* 027270 8002A270 7C830214 */  add       r4, r3, r0
lbl_8002A274:
/* 027274 8002A274 38000000 */  li        r0, 0x0
/* 027278 8002A278 90010008 */  stw       r0, 0x8(r1)
/* 02727C 8002A27C 7FA8EB78 */  mr        r8, r29
/* 027280 8002A280 7F89E378 */  mr        r9, r28
/* 027284 8002A284 A0BB0010 */  lhz       r5, 0x10(r27)
/* 027288 8002A288 387B0044 */  addi      r3, r27, 0x44
/* 02728C 8002A28C A0DB0012 */  lhz       r6, 0x12(r27)
/* 027290 8002A290 39400000 */  li        r10, 0x0
/* 027294 8002A294 80FB0034 */  lwz       r7, 0x34(r27)
/* 027298 8002A298 48081335 */  bl        fn_800AB5CC
/* 02729C 8002A29C 48000048 */  b         lbl_8002A2E4
lbl_8002A2A0:
/* 0272A0 8002A2A0 801B0004 */  lwz       r0, 0x4(r27)
/* 0272A4 8002A2A4 2C00FFFF */  cmpwi     r0, -0x1
/* 0272A8 8002A2A8 4082000C */  bne       lbl_8002A2B4
/* 0272AC 8002A2AC 38800000 */  li        r4, 0x0
/* 0272B0 8002A2B0 48000014 */  b         lbl_8002A2C4
lbl_8002A2B4:
/* 0272B4 8002A2B4 5400043E */  clrlwi    r0, r0, 16
/* 0272B8 8002A2B8 807A1C18 */  lwz       r3, 0x1c18(r26)
/* 0272BC 8002A2BC 54005828 */  slwi      r0, r0, 11
/* 0272C0 8002A2C0 7C830214 */  add       r4, r3, r0
lbl_8002A2C4:
/* 0272C4 8002A2C4 A0BB0010 */  lhz       r5, 0x10(r27)
/* 0272C8 8002A2C8 7FA8EB78 */  mr        r8, r29
/* 0272CC 8002A2CC A0DB0012 */  lhz       r6, 0x12(r27)
/* 0272D0 8002A2D0 7F89E378 */  mr        r9, r28
/* 0272D4 8002A2D4 80FB0034 */  lwz       r7, 0x34(r27)
/* 0272D8 8002A2D8 387B0044 */  addi      r3, r27, 0x44
/* 0272DC 8002A2DC 39400000 */  li        r10, 0x0
/* 0272E0 8002A2E0 48081079 */  bl        GXInitTexObj
lbl_8002A2E4:
/* 0272E4 8002A2E4 801A00A4 */  lwz       r0, 0xa4(r26)
/* 0272E8 8002A2E8 807B0000 */  lwz       r3, 0x0(r27)
/* 0272EC 8002A2EC 540404A6 */  rlwinm    r4, r0, 0, 18, 19
/* 0272F0 8002A2F0 546004A6 */  rlwinm    r0, r3, 0, 18, 19
/* 0272F4 8002A2F4 7C002000 */  cmpw      r0, r4
/* 0272F8 8002A2F8 418200A0 */  beq       lbl_8002A398
/* 0272FC 8002A2FC 54600522 */  rlwinm    r0, r3, 0, 20, 17
/* 027300 8002A300 901B0000 */  stw       r0, 0x0(r27)
/* 027304 8002A304 2C042000 */  cmpwi     r4, 0x2000
/* 027308 8002A308 801B0000 */  lwz       r0, 0x0(r27)
/* 02730C 8002A30C 7C002378 */  or        r0, r0, r4
/* 027310 8002A310 901B0000 */  stw       r0, 0x0(r27)
/* 027314 8002A314 4182004C */  beq       lbl_8002A360
/* 027318 8002A318 40800010 */  bge       lbl_8002A328
/* 02731C 8002A31C 2C040000 */  cmpwi     r4, 0x0
/* 027320 8002A320 41820014 */  beq       lbl_8002A334
/* 027324 8002A324 48000068 */  b         lbl_8002A38C
lbl_8002A328:
/* 027328 8002A328 2C043000 */  cmpwi     r4, 0x3000
/* 02732C 8002A32C 41820034 */  beq       lbl_8002A360
/* 027330 8002A330 4800005C */  b         lbl_8002A38C
lbl_8002A334:
/* 027334 8002A334 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 027338 8002A338 387B0044 */  addi      r3, r27, 0x44
/* 02733C 8002A33C 38800000 */  li        r4, 0x0
/* 027340 8002A340 FC400890 */  fmr       f2, f1
/* 027344 8002A344 38A00000 */  li        r5, 0x0
/* 027348 8002A348 FC600890 */  fmr       f3, f1
/* 02734C 8002A34C 38C00000 */  li        r6, 0x0
/* 027350 8002A350 38E00000 */  li        r7, 0x0
/* 027354 8002A354 39000000 */  li        r8, 0x0
/* 027358 8002A358 480812BD */  bl        fn_800AB614
/* 02735C 8002A35C 4800003C */  b         lbl_8002A398
lbl_8002A360:
/* 027360 8002A360 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 027364 8002A364 387B0044 */  addi      r3, r27, 0x44
/* 027368 8002A368 38800001 */  li        r4, 0x1
/* 02736C 8002A36C FC400890 */  fmr       f2, f1
/* 027370 8002A370 38A00001 */  li        r5, 0x1
/* 027374 8002A374 FC600890 */  fmr       f3, f1
/* 027378 8002A378 38C00000 */  li        r6, 0x0
/* 02737C 8002A37C 38E00000 */  li        r7, 0x0
/* 027380 8002A380 39000000 */  li        r8, 0x0
/* 027384 8002A384 48081291 */  bl        fn_800AB614
/* 027388 8002A388 48000010 */  b         lbl_8002A398
lbl_8002A38C:
/* 02738C 8002A38C 4CC63182 */  crclr     cr1eq
/* 027390 8002A390 387F0A74 */  addi      r3, r31, 0xa74
/* 027394 8002A394 480737B1 */  bl        OSReport
lbl_8002A398:
/* 027398 8002A398 801B0034 */  lwz       r0, 0x34(r27)
/* 02739C 8002A39C 2C000008 */  cmpwi     r0, 0x8
/* 0273A0 8002A3A0 4182000C */  beq       lbl_8002A3AC
/* 0273A4 8002A3A4 2C000009 */  cmpwi     r0, 0x9
/* 0273A8 8002A3A8 40820018 */  bne       lbl_8002A3C0
lbl_8002A3AC:
/* 0273AC 8002A3AC 57C0103A */  slwi      r0, r30, 2
/* 0273B0 8002A3B0 7C7F0214 */  add       r3, r31, r0
/* 0273B4 8002A3B4 80830020 */  lwz       r4, 0x20(r3)
/* 0273B8 8002A3B8 387B0038 */  addi      r3, r27, 0x38
/* 0273BC 8002A3BC 48081635 */  bl        fn_800AB9F0
lbl_8002A3C0:
/* 0273C0 8002A3C0 57C0103A */  slwi      r0, r30, 2
/* 0273C4 8002A3C4 7C7F0214 */  add       r3, r31, r0
/* 0273C8 8002A3C8 80830040 */  lwz       r4, 0x40(r3)
/* 0273CC 8002A3CC 387B0044 */  addi      r3, r27, 0x44
/* 0273D0 8002A3D0 48081585 */  bl        GXLoadTexObj
/* 0273D4 8002A3D4 38600001 */  li        r3, 0x1
/* 0273D8 8002A3D8 BB410028 */  lmw       r26, 0x28(r1)
/* 0273DC 8002A3DC 80010044 */  lwz       r0, 0x44(r1)
/* 0273E0 8002A3E0 38210040 */  addi      r1, r1, 0x40
/* 0273E4 8002A3E4 7C0803A6 */  mtlr      r0
/* 0273E8 8002A3E8 4E800020 */  blr

glabel frameMakePixels
/* 0273EC 8002A3EC 7C0802A6 */  mflr      r0
/* 0273F0 8002A3F0 90010004 */  stw       r0, 0x4(r1)
/* 0273F4 8002A3F4 9421FF58 */  stwu      r1, -0xa8(r1)
/* 0273F8 8002A3F8 BDC10060 */  stmw      r14, 0x60(r1)
/* 0273FC 8002A3FC 7C731B78 */  mr        r19, r3
/* 027400 8002A400 7C902378 */  mr        r16, r4
/* 027404 8002A404 7CBA2B78 */  mr        r26, r5
/* 027408 8002A408 7CD13378 */  mr        r17, r6
/* 02740C 8002A40C 2C110000 */  cmpwi     r17, 0x0
/* 027410 8002A410 41820010 */  beq       lbl_8002A420
/* 027414 8002A414 ABD00010 */  lha       r30, 0x10(r16)
/* 027418 8002A418 A9F00012 */  lha       r15, 0x12(r16)
/* 02741C 8002A41C 48000180 */  b         lbl_8002A59C
lbl_8002A420:
/* 027420 8002A420 38001000 */  li        r0, 0x1000
/* 027424 8002A424 90100000 */  stw       r0, 0x0(r16)
/* 027428 8002A428 38600003 */  li        r3, 0x3
/* 02742C 8002A42C 38000000 */  li        r0, 0x0
/* 027430 8002A430 90700068 */  stw       r3, 0x68(r16)
/* 027434 8002A434 90700064 */  stw       r3, 0x64(r16)
/* 027438 8002A438 A87A0018 */  lha       r3, 0x18(r26)
/* 02743C 8002A43C 546307BC */  rlwinm    r3, r3, 0, 30, 30
/* 027440 8002A440 2C030000 */  cmpwi     r3, 0x0
/* 027444 8002A444 40820010 */  bne       lbl_8002A454
/* 027448 8002A448 A89A0014 */  lha       r4, 0x14(r26)
/* 02744C 8002A44C 2C040000 */  cmpwi     r4, 0x0
/* 027450 8002A450 40820030 */  bne       lbl_8002A480
lbl_8002A454:
/* 027454 8002A454 A87A0020 */  lha       r3, 0x20(r26)
/* 027458 8002A458 60000001 */  ori       r0, r0, 0x1
/* 02745C 8002A45C A89A0024 */  lha       r4, 0x24(r26)
/* 027460 8002A460 7C631670 */  srawi     r3, r3, 2
/* 027464 8002A464 7C841670 */  srawi     r4, r4, 2
/* 027468 8002A468 7C632050 */  subf      r3, r3, r4
/* 02746C 8002A46C 3BC30001 */  addi      r30, r3, 0x1
/* 027470 8002A470 2C1E0000 */  cmpwi     r30, 0x0
/* 027474 8002A474 40800014 */  bge       lbl_8002A488
/* 027478 8002A478 7FDE00D0 */  neg       r30, r30
/* 02747C 8002A47C 4800000C */  b         lbl_8002A488
lbl_8002A480:
/* 027480 8002A480 38600001 */  li        r3, 0x1
/* 027484 8002A484 7C7E2030 */  slw       r30, r3, r4
lbl_8002A488:
/* 027488 8002A488 A87A001A */  lha       r3, 0x1a(r26)
/* 02748C 8002A48C 546307BC */  rlwinm    r3, r3, 0, 30, 30
/* 027490 8002A490 2C030000 */  cmpwi     r3, 0x0
/* 027494 8002A494 40820010 */  bne       lbl_8002A4A4
/* 027498 8002A498 A87A0016 */  lha       r3, 0x16(r26)
/* 02749C 8002A49C 2C030000 */  cmpwi     r3, 0x0
/* 0274A0 8002A4A0 40820030 */  bne       lbl_8002A4D0
lbl_8002A4A4:
/* 0274A4 8002A4A4 A87A0022 */  lha       r3, 0x22(r26)
/* 0274A8 8002A4A8 60000002 */  ori       r0, r0, 0x2
/* 0274AC 8002A4AC A89A0026 */  lha       r4, 0x26(r26)
/* 0274B0 8002A4B0 7C631670 */  srawi     r3, r3, 2
/* 0274B4 8002A4B4 7C841670 */  srawi     r4, r4, 2
/* 0274B8 8002A4B8 7C632050 */  subf      r3, r3, r4
/* 0274BC 8002A4BC 39E30001 */  addi      r15, r3, 0x1
/* 0274C0 8002A4C0 2C0F0000 */  cmpwi     r15, 0x0
/* 0274C4 8002A4C4 40800014 */  bge       lbl_8002A4D8
/* 0274C8 8002A4C8 7DEF00D0 */  neg       r15, r15
/* 0274CC 8002A4CC 4800000C */  b         lbl_8002A4D8
lbl_8002A4D0:
/* 0274D0 8002A4D0 38800001 */  li        r4, 0x1
/* 0274D4 8002A4D4 7C8F1830 */  slw       r15, r4, r3
lbl_8002A4D8:
/* 0274D8 8002A4D8 7C7E7A14 */  add       r3, r30, r15
/* 0274DC 8002A4DC 2C03018F */  cmpwi     r3, 0x18f
/* 0274E0 8002A4E0 408100BC */  ble       lbl_8002A59C
/* 0274E4 8002A4E4 540307FE */  clrlwi    r3, r0, 31
/* 0274E8 8002A4E8 2C030000 */  cmpwi     r3, 0x0
/* 0274EC 8002A4EC 7FC5F378 */  mr        r5, r30
/* 0274F0 8002A4F0 7DE67B78 */  mr        r6, r15
/* 0274F4 8002A4F4 41820014 */  beq       lbl_8002A508
/* 0274F8 8002A4F8 A87A0014 */  lha       r3, 0x14(r26)
/* 0274FC 8002A4FC 38800001 */  li        r4, 0x1
/* 027500 8002A500 7C9E1830 */  slw       r30, r4, r3
/* 027504 8002A504 4800001C */  b         lbl_8002A520
lbl_8002A508:
/* 027508 8002A508 A87A0020 */  lha       r3, 0x20(r26)
/* 02750C 8002A50C A89A0024 */  lha       r4, 0x24(r26)
/* 027510 8002A510 7C631670 */  srawi     r3, r3, 2
/* 027514 8002A514 7C841670 */  srawi     r4, r4, 2
/* 027518 8002A518 7C632050 */  subf      r3, r3, r4
/* 02751C 8002A51C 3BC30001 */  addi      r30, r3, 0x1
lbl_8002A520:
/* 027520 8002A520 2C1E0000 */  cmpwi     r30, 0x0
/* 027524 8002A524 4081000C */  ble       lbl_8002A530
/* 027528 8002A528 2C1E0080 */  cmpwi     r30, 0x80
/* 02752C 8002A52C 4081000C */  ble       lbl_8002A538
lbl_8002A530:
/* 027530 8002A530 7CBE2B78 */  mr        r30, r5
/* 027534 8002A534 48000010 */  b         lbl_8002A544
lbl_8002A538:
/* 027538 8002A538 80700000 */  lwz       r3, 0x0(r16)
/* 02753C 8002A53C 60630001 */  ori       r3, r3, 0x1
/* 027540 8002A540 90700000 */  stw       r3, 0x0(r16)
lbl_8002A544:
/* 027544 8002A544 540007BC */  rlwinm    r0, r0, 0, 30, 30
/* 027548 8002A548 2C000000 */  cmpwi     r0, 0x0
/* 02754C 8002A54C 41820014 */  beq       lbl_8002A560
/* 027550 8002A550 A81A0016 */  lha       r0, 0x16(r26)
/* 027554 8002A554 38600001 */  li        r3, 0x1
/* 027558 8002A558 7C6F0030 */  slw       r15, r3, r0
/* 02755C 8002A55C 4800001C */  b         lbl_8002A578
lbl_8002A560:
/* 027560 8002A560 A81A0022 */  lha       r0, 0x22(r26)
/* 027564 8002A564 A87A0026 */  lha       r3, 0x26(r26)
/* 027568 8002A568 7C001670 */  srawi     r0, r0, 2
/* 02756C 8002A56C 7C631670 */  srawi     r3, r3, 2
/* 027570 8002A570 7C601850 */  subf      r3, r0, r3
/* 027574 8002A574 39E30001 */  addi      r15, r3, 0x1
lbl_8002A578:
/* 027578 8002A578 2C0F0000 */  cmpwi     r15, 0x0
/* 02757C 8002A57C 4081000C */  ble       lbl_8002A588
/* 027580 8002A580 2C0F0080 */  cmpwi     r15, 0x80
/* 027584 8002A584 4081000C */  ble       lbl_8002A590
lbl_8002A588:
/* 027588 8002A588 7CCF3378 */  mr        r15, r6
/* 02758C 8002A58C 48000010 */  b         lbl_8002A59C
lbl_8002A590:
/* 027590 8002A590 80100000 */  lwz       r0, 0x0(r16)
/* 027594 8002A594 60000002 */  ori       r0, r0, 0x2
/* 027598 8002A598 90100000 */  stw       r0, 0x0(r16)
lbl_8002A59C:
/* 02759C 8002A59C A81A0014 */  lha       r0, 0x14(r26)
/* 0275A0 8002A5A0 2C000000 */  cmpwi     r0, 0x0
/* 0275A4 8002A5A4 40810010 */  ble       lbl_8002A5B4
/* 0275A8 8002A5A8 38600001 */  li        r3, 0x1
/* 0275AC 8002A5AC 7C7B0030 */  slw       r27, r3, r0
/* 0275B0 8002A5B0 48000008 */  b         lbl_8002A5B8
lbl_8002A5B4:
/* 0275B4 8002A5B4 3B7E0001 */  addi      r27, r30, 0x1
lbl_8002A5B8:
/* 0275B8 8002A5B8 A81A0016 */  lha       r0, 0x16(r26)
/* 0275BC 8002A5BC 2C000000 */  cmpwi     r0, 0x0
/* 0275C0 8002A5C0 40810010 */  ble       lbl_8002A5D0
/* 0275C4 8002A5C4 38600001 */  li        r3, 0x1
/* 0275C8 8002A5C8 7C7C0030 */  slw       r28, r3, r0
/* 0275CC 8002A5CC 48000008 */  b         lbl_8002A5D4
lbl_8002A5D0:
/* 0275D0 8002A5D0 3B8F0001 */  addi      r28, r15, 0x1
lbl_8002A5D4:
/* 0275D4 8002A5D4 A81A0018 */  lha       r0, 0x18(r26)
/* 0275D8 8002A5D8 540007FE */  clrlwi    r0, r0, 31
/* 0275DC 8002A5DC 2C000000 */  cmpwi     r0, 0x0
/* 0275E0 8002A5E0 4182000C */  beq       lbl_8002A5EC
/* 0275E4 8002A5E4 3BA00001 */  li        r29, 0x1
/* 0275E8 8002A5E8 48000008 */  b         lbl_8002A5F0
lbl_8002A5EC:
/* 0275EC 8002A5EC 3BA00000 */  li        r29, 0x0
lbl_8002A5F0:
/* 0275F0 8002A5F0 A81A001A */  lha       r0, 0x1a(r26)
/* 0275F4 8002A5F4 540007FE */  clrlwi    r0, r0, 31
/* 0275F8 8002A5F8 2C000000 */  cmpwi     r0, 0x0
/* 0275FC 8002A5FC 4182000C */  beq       lbl_8002A608
/* 027600 8002A600 39C00001 */  li        r14, 0x1
/* 027604 8002A604 48000008 */  b         lbl_8002A60C
lbl_8002A608:
/* 027608 8002A608 39C00000 */  li        r14, 0x0
lbl_8002A60C:
/* 02760C 8002A60C 7FC00734 */  extsh     r0, r30
/* 027610 8002A610 2C000000 */  cmpwi     r0, 0x0
/* 027614 8002A614 B0100010 */  sth       r0, 0x10(r16)
/* 027618 8002A618 40810014 */  ble       lbl_8002A62C
/* 02761C 8002A61C 7DE00734 */  extsh     r0, r15
/* 027620 8002A620 2C000000 */  cmpwi     r0, 0x0
/* 027624 8002A624 B0100012 */  sth       r0, 0x12(r16)
/* 027628 8002A628 41810018 */  bgt       lbl_8002A640
lbl_8002A62C:
/* 02762C 8002A62C 38000000 */  li        r0, 0x0
/* 027630 8002A630 B0100012 */  sth       r0, 0x12(r16)
/* 027634 8002A634 38600000 */  li        r3, 0x0
/* 027638 8002A638 B0100010 */  sth       r0, 0x10(r16)
/* 02763C 8002A63C 48001790 */  b         lbl_8002BDCC
lbl_8002A640:
/* 027640 8002A640 801A0010 */  lwz       r0, 0x10(r26)
/* 027644 8002A644 2C000000 */  cmpwi     r0, 0x0
/* 027648 8002A648 40820018 */  bne       lbl_8002A660
/* 02764C 8002A64C 801A0000 */  lwz       r0, 0x0(r26)
/* 027650 8002A650 2C000000 */  cmpwi     r0, 0x0
/* 027654 8002A654 4082000C */  bne       lbl_8002A660
/* 027658 8002A658 38000003 */  li        r0, 0x3
/* 02765C 8002A65C 901A0010 */  stw       r0, 0x10(r26)
lbl_8002A660:
/* 027660 8002A660 801A0010 */  lwz       r0, 0x10(r26)
/* 027664 8002A664 2C000004 */  cmpwi     r0, 0x4
/* 027668 8002A668 40820018 */  bne       lbl_8002A680
/* 02766C 8002A66C 801A0000 */  lwz       r0, 0x0(r26)
/* 027670 8002A670 2C000002 */  cmpwi     r0, 0x2
/* 027674 8002A674 4082000C */  bne       lbl_8002A680
/* 027678 8002A678 38000003 */  li        r0, 0x3
/* 02767C 8002A67C 901A0010 */  stw       r0, 0x10(r26)
lbl_8002A680:
/* 027680 8002A680 801A0010 */  lwz       r0, 0x10(r26)
/* 027684 8002A684 2C000000 */  cmpwi     r0, 0x0
/* 027688 8002A688 408204C0 */  bne       lbl_8002AB48
/* 02768C 8002A68C 801A0000 */  lwz       r0, 0x0(r26)
/* 027690 8002A690 2C000002 */  cmpwi     r0, 0x2
/* 027694 8002A694 4082026C */  bne       lbl_8002A900
/* 027698 8002A698 38000002 */  li        r0, 0x2
/* 02769C 8002A69C 2C110000 */  cmpwi     r17, 0x0
/* 0276A0 8002A6A0 90010040 */  stw       r0, 0x40(r1)
/* 0276A4 8002A6A4 4182001C */  beq       lbl_8002A6C0
/* 0276A8 8002A6A8 80100004 */  lwz       r0, 0x4(r16)
/* 0276AC 8002A6AC 80731C18 */  lwz       r3, 0x1c18(r19)
/* 0276B0 8002A6B0 5400043E */  clrlwi    r0, r0, 16
/* 0276B4 8002A6B4 54005828 */  slwi      r0, r0, 11
/* 0276B8 8002A6B8 7F030214 */  add       r24, r3, r0
/* 0276BC 8002A6BC 48000094 */  b         lbl_8002A750
lbl_8002A6C0:
/* 0276C0 8002A6C0 38000005 */  li        r0, 0x5
/* 0276C4 8002A6C4 90100034 */  stw       r0, 0x34(r16)
/* 0276C8 8002A6C8 A8700010 */  lha       r3, 0x10(r16)
/* 0276CC 8002A6CC 546007BE */  clrlwi    r0, r3, 30
/* 0276D0 8002A6D0 2C000000 */  cmpwi     r0, 0x0
/* 0276D4 8002A6D4 41820010 */  beq       lbl_8002A6E4
/* 0276D8 8002A6D8 38030003 */  addi      r0, r3, 0x3
/* 0276DC 8002A6DC 5400003A */  clrrwi    r0, r0, 2
/* 0276E0 8002A6E0 B0100010 */  sth       r0, 0x10(r16)
lbl_8002A6E4:
/* 0276E4 8002A6E4 A8700012 */  lha       r3, 0x12(r16)
/* 0276E8 8002A6E8 546007BE */  clrlwi    r0, r3, 30
/* 0276EC 8002A6EC 2C000000 */  cmpwi     r0, 0x0
/* 0276F0 8002A6F0 41820010 */  beq       lbl_8002A700
/* 0276F4 8002A6F4 38030003 */  addi      r0, r3, 0x3
/* 0276F8 8002A6F8 5400003A */  clrrwi    r0, r0, 2
/* 0276FC 8002A6FC B0100012 */  sth       r0, 0x12(r16)
lbl_8002A700:
/* 027700 8002A700 A8100010 */  lha       r0, 0x10(r16)
/* 027704 8002A704 38700004 */  addi      r3, r16, 0x4
/* 027708 8002A708 A8D00012 */  lha       r6, 0x12(r16)
/* 02770C 8002A70C 38931C38 */  addi      r4, r19, 0x1c38
/* 027710 8002A710 38A00030 */  li        r5, 0x30
/* 027714 8002A714 7C0031D6 */  mullw     r0, r0, r6
/* 027718 8002A718 5406083C */  slwi      r6, r0, 1
/* 02771C 8002A71C 380607FF */  addi      r0, r6, 0x7ff
/* 027720 8002A720 7C065E70 */  srawi     r6, r0, 11
/* 027724 8002A724 7CC60194 */  addze     r6, r6
/* 027728 8002A728 4BFF662D */  bl        packTakeBlocks
/* 02772C 8002A72C 2C030000 */  cmpwi     r3, 0x0
/* 027730 8002A730 4082000C */  bne       lbl_8002A73C
/* 027734 8002A734 38600000 */  li        r3, 0x0
/* 027738 8002A738 48001694 */  b         lbl_8002BDCC
lbl_8002A73C:
/* 02773C 8002A73C 80100004 */  lwz       r0, 0x4(r16)
/* 027740 8002A740 80731C18 */  lwz       r3, 0x1c18(r19)
/* 027744 8002A744 5400043E */  clrlwi    r0, r0, 16
/* 027748 8002A748 54005828 */  slwi      r0, r0, 11
/* 02774C 8002A74C 7F030214 */  add       r24, r3, r0
lbl_8002A750:
/* 027750 8002A750 801A000C */  lwz       r0, 0xc(r26)
/* 027754 8002A754 39200000 */  li        r9, 0x0
/* 027758 8002A758 807A0004 */  lwz       r3, 0x4(r26)
/* 02775C 8002A75C 3A800000 */  li        r20, 0x0
/* 027760 8002A760 5400103A */  slwi      r0, r0, 2
/* 027764 8002A764 AA300010 */  lha       r17, 0x10(r16)
/* 027768 8002A768 546A103A */  slwi      r10, r3, 2
/* 02776C 8002A76C 7C60E1D6 */  mullw     r3, r0, r28
/* 027770 8002A770 AB500012 */  lha       r26, 0x12(r16)
/* 027774 8002A774 7D555378 */  mr        r21, r10
/* 027778 8002A778 7E3C1670 */  srawi     r28, r17, 2
/* 02777C 8002A77C 7EB60E70 */  srawi     r22, r21, 1
/* 027780 8002A780 7ED60194 */  addze     r22, r22
/* 027784 8002A784 56D6083C */  slwi      r22, r22, 1
/* 027788 8002A788 7C120378 */  mr        r18, r0
/* 02778C 8002A78C 7EF51A14 */  add       r23, r21, r3
/* 027790 8002A790 7ED6A810 */  subfc     r22, r22, r21
/* 027794 8002A794 48000004 */  b         lbl_8002A798
lbl_8002A798:
/* 027798 8002A798 48000004 */  b         lbl_8002A79C
lbl_8002A79C:
/* 02779C 8002A79C 48000158 */  b         lbl_8002A8F4
lbl_8002A7A0:
/* 0277A0 8002A7A0 7E801670 */  srawi     r0, r20, 2
/* 0277A4 8002A7A4 7D60E1D6 */  mullw     r11, r0, r28
/* 0277A8 8002A7A8 568007BE */  clrlwi    r0, r20, 30
/* 0277AC 8002A7AC 5559057E */  clrlwi    r25, r10, 21
/* 0277B0 8002A7B0 540C103A */  slwi      r12, r0, 2
/* 0277B4 8002A7B4 38600000 */  li        r3, 0x0
/* 0277B8 8002A7B8 38800000 */  li        r4, 0x0
/* 0277BC 8002A7BC 38A00001 */  li        r5, 0x1
/* 0277C0 8002A7C0 48000004 */  b         lbl_8002A7C4
lbl_8002A7C4:
/* 0277C4 8002A7C4 2C110000 */  cmpwi     r17, 0x0
/* 0277C8 8002A7C8 7E2903A6 */  mtctr     r17
/* 0277CC 8002A7CC 408100CC */  ble       lbl_8002A898
/* 0277D0 8002A7D0 48000004 */  b         lbl_8002A7D4
lbl_8002A7D4:
/* 0277D4 8002A7D4 7C03F000 */  cmpw      r3, r30
/* 0277D8 8002A7D8 40800044 */  bge       lbl_8002A81C
/* 0277DC 8002A7DC 7C804A78 */  xor       r0, r4, r9
/* 0277E0 8002A7E0 7C190214 */  add       r0, r25, r0
/* 0277E4 8002A7E4 5406083C */  slwi      r6, r0, 1
/* 0277E8 8002A7E8 7C842A14 */  add       r4, r4, r5
/* 0277EC 8002A7EC 38060C18 */  addi      r0, r6, 0xc18
/* 0277F0 8002A7F0 7C04D800 */  cmpw      r4, r27
/* 0277F4 8002A7F4 7FF3022E */  lhzx      r31, r19, r0
/* 0277F8 8002A7F8 4080000C */  bge       lbl_8002A804
/* 0277FC 8002A7FC 2C040000 */  cmpwi     r4, 0x0
/* 027800 8002A800 4080001C */  bge       lbl_8002A81C
lbl_8002A804:
/* 027804 8002A804 2C1D0000 */  cmpwi     r29, 0x0
/* 027808 8002A808 41820010 */  beq       lbl_8002A818
/* 02780C 8002A80C 7CA500D0 */  neg       r5, r5
/* 027810 8002A810 7C842A14 */  add       r4, r4, r5
/* 027814 8002A814 48000008 */  b         lbl_8002A81C
lbl_8002A818:
/* 027818 8002A818 38800000 */  li        r4, 0x0
lbl_8002A81C:
/* 02781C 8002A81C 7C601670 */  srawi     r0, r3, 2
/* 027820 8002A820 7C0B0214 */  add       r0, r11, r0
/* 027824 8002A824 57E607FE */  clrlwi    r6, r31, 31
/* 027828 8002A828 54002036 */  slwi      r0, r0, 4
/* 02782C 8002A82C 2C060000 */  cmpwi     r6, 0x0
/* 027830 8002A830 546607BE */  clrlwi    r6, r3, 30
/* 027834 8002A834 7C0C0214 */  add       r0, r12, r0
/* 027838 8002A838 7C060214 */  add       r0, r6, r0
/* 02783C 8002A83C 41820030 */  beq       lbl_8002A86C
/* 027840 8002A840 57E7AEFE */  extrwi    r7, r31, 5, 16
/* 027844 8002A844 57E6D6FE */  extrwi    r6, r31, 5, 21
/* 027848 8002A848 54E7502A */  slwi      r7, r7, 10
/* 02784C 8002A84C 54C62834 */  slwi      r6, r6, 5
/* 027850 8002A850 57E8FEFE */  extrwi    r8, r31, 5, 26
/* 027854 8002A854 7CE63378 */  or        r6, r7, r6
/* 027858 8002A858 7D063378 */  or        r6, r8, r6
/* 02785C 8002A85C 60C68000 */  ori       r6, r6, 0x8000
/* 027860 8002A860 5400083C */  slwi      r0, r0, 1
/* 027864 8002A864 7CD8032E */  sthx      r6, r24, r0
/* 027868 8002A868 48000028 */  b         lbl_8002A890
lbl_8002A86C:
/* 02786C 8002A86C 57E7A73E */  extrwi    r7, r31, 4, 16
/* 027870 8002A870 57E6CF3E */  extrwi    r6, r31, 4, 21
/* 027874 8002A874 54E7402E */  slwi      r7, r7, 8
/* 027878 8002A878 54C62036 */  slwi      r6, r6, 4
/* 02787C 8002A87C 57E8F73E */  extrwi    r8, r31, 4, 26
/* 027880 8002A880 7CE63378 */  or        r6, r7, r6
/* 027884 8002A884 7D063378 */  or        r6, r8, r6
/* 027888 8002A888 5400083C */  slwi      r0, r0, 1
/* 02788C 8002A88C 7CD8032E */  sthx      r6, r24, r0
lbl_8002A890:
/* 027890 8002A890 38630001 */  addi      r3, r3, 0x1
/* 027894 8002A894 4200FF40 */  bdnz      lbl_8002A7D4
lbl_8002A898:
/* 027898 8002A898 3A940001 */  addi      r20, r20, 0x1
/* 02789C 8002A89C 7C147800 */  cmpw      r20, r15
/* 0278A0 8002A8A0 40800054 */  bge       lbl_8002A8F4
/* 0278A4 8002A8A4 7D4A9214 */  add       r10, r10, r18
/* 0278A8 8002A8A8 7C0AB800 */  cmpw      r10, r23
/* 0278AC 8002A8AC 4080000C */  bge       lbl_8002A8B8
/* 0278B0 8002A8B0 7C0AA800 */  cmpw      r10, r21
/* 0278B4 8002A8B4 4080003C */  bge       lbl_8002A8F0
lbl_8002A8B8:
/* 0278B8 8002A8B8 2C0E0000 */  cmpwi     r14, 0x0
/* 0278BC 8002A8BC 41820010 */  beq       lbl_8002A8CC
/* 0278C0 8002A8C0 7E5200D0 */  neg       r18, r18
/* 0278C4 8002A8C4 7D4A9214 */  add       r10, r10, r18
/* 0278C8 8002A8C8 4800002C */  b         lbl_8002A8F4
lbl_8002A8CC:
/* 0278CC 8002A8CC 7D400E70 */  srawi     r0, r10, 1
/* 0278D0 8002A8D0 7C000194 */  addze     r0, r0
/* 0278D4 8002A8D4 5400083C */  slwi      r0, r0, 1
/* 0278D8 8002A8D8 7C005010 */  subfc     r0, r0, r10
/* 0278DC 8002A8DC 7C00B000 */  cmpw      r0, r22
/* 0278E0 8002A8E0 40820008 */  bne       lbl_8002A8E8
/* 0278E4 8002A8E4 69290002 */  xori      r9, r9, 0x2
lbl_8002A8E8:
/* 0278E8 8002A8E8 7EAAAB78 */  mr        r10, r21
/* 0278EC 8002A8EC 48000008 */  b         lbl_8002A8F4
lbl_8002A8F0:
/* 0278F0 8002A8F0 69290002 */  xori      r9, r9, 0x2
lbl_8002A8F4:
/* 0278F4 8002A8F4 7C14D000 */  cmpw      r20, r26
/* 0278F8 8002A8F8 4180FEA8 */  blt       lbl_8002A7A0
/* 0278FC 8002A8FC 480014B0 */  b         lbl_8002BDAC
lbl_8002A900:
/* 027900 8002A900 2C000003 */  cmpwi     r0, 0x3
/* 027904 8002A904 4082023C */  bne       lbl_8002AB40
/* 027908 8002A908 38000004 */  li        r0, 0x4
/* 02790C 8002A90C 2C110000 */  cmpwi     r17, 0x0
/* 027910 8002A910 90010040 */  stw       r0, 0x40(r1)
/* 027914 8002A914 4182001C */  beq       lbl_8002A930
/* 027918 8002A918 80100004 */  lwz       r0, 0x4(r16)
/* 02791C 8002A91C 80731C18 */  lwz       r3, 0x1c18(r19)
/* 027920 8002A920 5400043E */  clrlwi    r0, r0, 16
/* 027924 8002A924 54005828 */  slwi      r0, r0, 11
/* 027928 8002A928 7F030214 */  add       r24, r3, r0
/* 02792C 8002A92C 48000094 */  b         lbl_8002A9C0
lbl_8002A930:
/* 027930 8002A930 38000006 */  li        r0, 0x6
/* 027934 8002A934 90100034 */  stw       r0, 0x34(r16)
/* 027938 8002A938 A8700010 */  lha       r3, 0x10(r16)
/* 02793C 8002A93C 546007BE */  clrlwi    r0, r3, 30
/* 027940 8002A940 2C000000 */  cmpwi     r0, 0x0
/* 027944 8002A944 41820010 */  beq       lbl_8002A954
/* 027948 8002A948 38030003 */  addi      r0, r3, 0x3
/* 02794C 8002A94C 5400003A */  clrrwi    r0, r0, 2
/* 027950 8002A950 B0100010 */  sth       r0, 0x10(r16)
lbl_8002A954:
/* 027954 8002A954 A8700012 */  lha       r3, 0x12(r16)
/* 027958 8002A958 546007BE */  clrlwi    r0, r3, 30
/* 02795C 8002A95C 2C000000 */  cmpwi     r0, 0x0
/* 027960 8002A960 41820010 */  beq       lbl_8002A970
/* 027964 8002A964 38030003 */  addi      r0, r3, 0x3
/* 027968 8002A968 5400003A */  clrrwi    r0, r0, 2
/* 02796C 8002A96C B0100012 */  sth       r0, 0x12(r16)
lbl_8002A970:
/* 027970 8002A970 A8100010 */  lha       r0, 0x10(r16)
/* 027974 8002A974 38700004 */  addi      r3, r16, 0x4
/* 027978 8002A978 A8D00012 */  lha       r6, 0x12(r16)
/* 02797C 8002A97C 38931C38 */  addi      r4, r19, 0x1c38
/* 027980 8002A980 38A00030 */  li        r5, 0x30
/* 027984 8002A984 7C0031D6 */  mullw     r0, r0, r6
/* 027988 8002A988 5406103A */  slwi      r6, r0, 2
/* 02798C 8002A98C 380607FF */  addi      r0, r6, 0x7ff
/* 027990 8002A990 7C065E70 */  srawi     r6, r0, 11
/* 027994 8002A994 7CC60194 */  addze     r6, r6
/* 027998 8002A998 4BFF63BD */  bl        packTakeBlocks
/* 02799C 8002A99C 2C030000 */  cmpwi     r3, 0x0
/* 0279A0 8002A9A0 4082000C */  bne       lbl_8002A9AC
/* 0279A4 8002A9A4 38600000 */  li        r3, 0x0
/* 0279A8 8002A9A8 48001424 */  b         lbl_8002BDCC
lbl_8002A9AC:
/* 0279AC 8002A9AC 80100004 */  lwz       r0, 0x4(r16)
/* 0279B0 8002A9B0 80731C18 */  lwz       r3, 0x1c18(r19)
/* 0279B4 8002A9B4 5400043E */  clrlwi    r0, r0, 16
/* 0279B8 8002A9B8 54005828 */  slwi      r0, r0, 11
/* 0279BC 8002A9BC 7F030214 */  add       r24, r3, r0
lbl_8002A9C0:
/* 0279C0 8002A9C0 801A000C */  lwz       r0, 0xc(r26)
/* 0279C4 8002A9C4 39200000 */  li        r9, 0x0
/* 0279C8 8002A9C8 807A0004 */  lwz       r3, 0x4(r26)
/* 0279CC 8002A9CC 3A800000 */  li        r20, 0x0
/* 0279D0 8002A9D0 5415103A */  slwi      r21, r0, 2
/* 0279D4 8002A9D4 546A103A */  slwi      r10, r3, 2
/* 0279D8 8002A9D8 AAD00010 */  lha       r22, 0x10(r16)
/* 0279DC 8002A9DC 7C15E1D6 */  mullw     r0, r21, r28
/* 0279E0 8002A9E0 AAF00012 */  lha       r23, 0x12(r16)
/* 0279E4 8002A9E4 7D525378 */  mr        r18, r10
/* 0279E8 8002A9E8 7EDC1670 */  srawi     r28, r22, 2
/* 0279EC 8002A9EC 7E510E70 */  srawi     r17, r18, 1
/* 0279F0 8002A9F0 7E310194 */  addze     r17, r17
/* 0279F4 8002A9F4 5631083C */  slwi      r17, r17, 1
/* 0279F8 8002A9F8 7F520214 */  add       r26, r18, r0
/* 0279FC 8002A9FC 7E319010 */  subfc     r17, r17, r18
/* 027A00 8002AA00 48000004 */  b         lbl_8002AA04
lbl_8002AA04:
/* 027A04 8002AA04 48000004 */  b         lbl_8002AA08
lbl_8002AA08:
/* 027A08 8002AA08 4800012C */  b         lbl_8002AB34
lbl_8002AA0C:
/* 027A0C 8002AA0C 7E801670 */  srawi     r0, r20, 2
/* 027A10 8002AA10 7D60E1D6 */  mullw     r11, r0, r28
/* 027A14 8002AA14 568407BE */  clrlwi    r4, r20, 30
/* 027A18 8002AA18 38600000 */  li        r3, 0x0
/* 027A1C 8002AA1C 7C601B78 */  mr        r0, r3
/* 027A20 8002AA20 555905BE */  clrlwi    r25, r10, 22
/* 027A24 8002AA24 548C103A */  slwi      r12, r4, 2
/* 027A28 8002AA28 38800001 */  li        r4, 0x1
/* 027A2C 8002AA2C 48000004 */  b         lbl_8002AA30
lbl_8002AA30:
/* 027A30 8002AA30 2C160000 */  cmpwi     r22, 0x0
/* 027A34 8002AA34 7EC903A6 */  mtctr     r22
/* 027A38 8002AA38 408100A0 */  ble       lbl_8002AAD8
/* 027A3C 8002AA3C 48000004 */  b         lbl_8002AA40
lbl_8002AA40:
/* 027A40 8002AA40 7C03F000 */  cmpw      r3, r30
/* 027A44 8002AA44 40800044 */  bge       lbl_8002AA88
/* 027A48 8002AA48 7C054A78 */  xor       r5, r0, r9
/* 027A4C 8002AA4C 7CB92A14 */  add       r5, r25, r5
/* 027A50 8002AA50 54A5103A */  slwi      r5, r5, 2
/* 027A54 8002AA54 7C002214 */  add       r0, r0, r4
/* 027A58 8002AA58 38A50C18 */  addi      r5, r5, 0xc18
/* 027A5C 8002AA5C 7C00D800 */  cmpw      r0, r27
/* 027A60 8002AA60 7FF3282E */  lwzx      r31, r19, r5
/* 027A64 8002AA64 4080000C */  bge       lbl_8002AA70
/* 027A68 8002AA68 2C000000 */  cmpwi     r0, 0x0
/* 027A6C 8002AA6C 4080001C */  bge       lbl_8002AA88
lbl_8002AA70:
/* 027A70 8002AA70 2C1D0000 */  cmpwi     r29, 0x0
/* 027A74 8002AA74 41820010 */  beq       lbl_8002AA84
/* 027A78 8002AA78 7C8400D0 */  neg       r4, r4
/* 027A7C 8002AA7C 7C002214 */  add       r0, r0, r4
/* 027A80 8002AA80 48000008 */  b         lbl_8002AA88
lbl_8002AA84:
/* 027A84 8002AA84 38000000 */  li        r0, 0x0
lbl_8002AA88:
/* 027A88 8002AA88 7C651670 */  srawi     r5, r3, 2
/* 027A8C 8002AA8C 7CAB2A14 */  add       r5, r11, r5
/* 027A90 8002AA90 54A52834 */  slwi      r5, r5, 5
/* 027A94 8002AA94 546607BE */  clrlwi    r6, r3, 30
/* 027A98 8002AA98 7CAC2A14 */  add       r5, r12, r5
/* 027A9C 8002AA9C 57E7063E */  clrlwi    r7, r31, 24
/* 027AA0 8002AAA0 7CA62A14 */  add       r5, r6, r5
/* 027AA4 8002AAA4 54A6083C */  slwi      r6, r5, 1
/* 027AA8 8002AAA8 57E5863E */  extrwi    r5, r31, 8, 8
/* 027AAC 8002AAAC 54E8402E */  slwi      r8, r7, 8
/* 027AB0 8002AAB0 57E7463E */  srwi      r7, r31, 24
/* 027AB4 8002AAB4 7D073B78 */  or        r7, r8, r7
/* 027AB8 8002AAB8 7CD83214 */  add       r6, r24, r6
/* 027ABC 8002AABC B0E60000 */  sth       r7, 0x0(r6)
/* 027AC0 8002AAC0 54A7402E */  slwi      r7, r5, 8
/* 027AC4 8002AAC4 57E5C63E */  extrwi    r5, r31, 8, 16
/* 027AC8 8002AAC8 7CE52B78 */  or        r5, r7, r5
/* 027ACC 8002AACC B0A60020 */  sth       r5, 0x20(r6)
/* 027AD0 8002AAD0 38630001 */  addi      r3, r3, 0x1
/* 027AD4 8002AAD4 4200FF6C */  bdnz      lbl_8002AA40
lbl_8002AAD8:
/* 027AD8 8002AAD8 3A940001 */  addi      r20, r20, 0x1
/* 027ADC 8002AADC 7C147800 */  cmpw      r20, r15
/* 027AE0 8002AAE0 40800054 */  bge       lbl_8002AB34
/* 027AE4 8002AAE4 7D4AAA14 */  add       r10, r10, r21
/* 027AE8 8002AAE8 7C0AD000 */  cmpw      r10, r26
/* 027AEC 8002AAEC 4080000C */  bge       lbl_8002AAF8
/* 027AF0 8002AAF0 7C0A9000 */  cmpw      r10, r18
/* 027AF4 8002AAF4 4080003C */  bge       lbl_8002AB30
lbl_8002AAF8:
/* 027AF8 8002AAF8 2C0E0000 */  cmpwi     r14, 0x0
/* 027AFC 8002AAFC 41820010 */  beq       lbl_8002AB0C
/* 027B00 8002AB00 7EB500D0 */  neg       r21, r21
/* 027B04 8002AB04 7D4AAA14 */  add       r10, r10, r21
/* 027B08 8002AB08 4800002C */  b         lbl_8002AB34
lbl_8002AB0C:
/* 027B0C 8002AB0C 7D400E70 */  srawi     r0, r10, 1
/* 027B10 8002AB10 7C000194 */  addze     r0, r0
/* 027B14 8002AB14 5400083C */  slwi      r0, r0, 1
/* 027B18 8002AB18 7C005010 */  subfc     r0, r0, r10
/* 027B1C 8002AB1C 7C008800 */  cmpw      r0, r17
/* 027B20 8002AB20 40820008 */  bne       lbl_8002AB28
/* 027B24 8002AB24 69290002 */  xori      r9, r9, 0x2
lbl_8002AB28:
/* 027B28 8002AB28 7E4A9378 */  mr        r10, r18
/* 027B2C 8002AB2C 48000008 */  b         lbl_8002AB34
lbl_8002AB30:
/* 027B30 8002AB30 69290002 */  xori      r9, r9, 0x2
lbl_8002AB34:
/* 027B34 8002AB34 7C14B800 */  cmpw      r20, r23
/* 027B38 8002AB38 4180FED4 */  blt       lbl_8002AA0C
/* 027B3C 8002AB3C 48001270 */  b         lbl_8002BDAC
lbl_8002AB40:
/* 027B40 8002AB40 38600000 */  li        r3, 0x0
/* 027B44 8002AB44 48001288 */  b         lbl_8002BDCC
lbl_8002AB48:
/* 027B48 8002AB48 2C000002 */  cmpwi     r0, 0x2
/* 027B4C 8002AB4C 408204B0 */  bne       lbl_8002AFFC
/* 027B50 8002AB50 801A0000 */  lwz       r0, 0x0(r26)
/* 027B54 8002AB54 2C000001 */  cmpwi     r0, 0x1
/* 027B58 8002AB58 40820230 */  bne       lbl_8002AD88
/* 027B5C 8002AB5C 38000001 */  li        r0, 0x1
/* 027B60 8002AB60 2C110000 */  cmpwi     r17, 0x0
/* 027B64 8002AB64 90010040 */  stw       r0, 0x40(r1)
/* 027B68 8002AB68 4182001C */  beq       lbl_8002AB84
/* 027B6C 8002AB6C 80100004 */  lwz       r0, 0x4(r16)
/* 027B70 8002AB70 80731C18 */  lwz       r3, 0x1c18(r19)
/* 027B74 8002AB74 5400043E */  clrlwi    r0, r0, 16
/* 027B78 8002AB78 54005828 */  slwi      r0, r0, 11
/* 027B7C 8002AB7C 7F030214 */  add       r24, r3, r0
/* 027B80 8002AB80 48000090 */  b         lbl_8002AC10
lbl_8002AB84:
/* 027B84 8002AB84 38000009 */  li        r0, 0x9
/* 027B88 8002AB88 90100034 */  stw       r0, 0x34(r16)
/* 027B8C 8002AB8C A8700010 */  lha       r3, 0x10(r16)
/* 027B90 8002AB90 5460077E */  clrlwi    r0, r3, 29
/* 027B94 8002AB94 2C000000 */  cmpwi     r0, 0x0
/* 027B98 8002AB98 41820010 */  beq       lbl_8002ABA8
/* 027B9C 8002AB9C 38030007 */  addi      r0, r3, 0x7
/* 027BA0 8002ABA0 54000038 */  clrrwi    r0, r0, 3
/* 027BA4 8002ABA4 B0100010 */  sth       r0, 0x10(r16)
lbl_8002ABA8:
/* 027BA8 8002ABA8 A8700012 */  lha       r3, 0x12(r16)
/* 027BAC 8002ABAC 546007BE */  clrlwi    r0, r3, 30
/* 027BB0 8002ABB0 2C000000 */  cmpwi     r0, 0x0
/* 027BB4 8002ABB4 41820010 */  beq       lbl_8002ABC4
/* 027BB8 8002ABB8 38030003 */  addi      r0, r3, 0x3
/* 027BBC 8002ABBC 5400003A */  clrrwi    r0, r0, 2
/* 027BC0 8002ABC0 B0100012 */  sth       r0, 0x12(r16)
lbl_8002ABC4:
/* 027BC4 8002ABC4 A8100010 */  lha       r0, 0x10(r16)
/* 027BC8 8002ABC8 38700004 */  addi      r3, r16, 0x4
/* 027BCC 8002ABCC A8D00012 */  lha       r6, 0x12(r16)
/* 027BD0 8002ABD0 38931C38 */  addi      r4, r19, 0x1c38
/* 027BD4 8002ABD4 38A00030 */  li        r5, 0x30
/* 027BD8 8002ABD8 7CC031D6 */  mullw     r6, r0, r6
/* 027BDC 8002ABDC 380607FF */  addi      r0, r6, 0x7ff
/* 027BE0 8002ABE0 7C065E70 */  srawi     r6, r0, 11
/* 027BE4 8002ABE4 7CC60194 */  addze     r6, r6
/* 027BE8 8002ABE8 4BFF616D */  bl        packTakeBlocks
/* 027BEC 8002ABEC 2C030000 */  cmpwi     r3, 0x0
/* 027BF0 8002ABF0 4082000C */  bne       lbl_8002ABFC
/* 027BF4 8002ABF4 38600000 */  li        r3, 0x0
/* 027BF8 8002ABF8 480011D4 */  b         lbl_8002BDCC
lbl_8002ABFC:
/* 027BFC 8002ABFC 80100004 */  lwz       r0, 0x4(r16)
/* 027C00 8002AC00 80731C18 */  lwz       r3, 0x1c18(r19)
/* 027C04 8002AC04 5400043E */  clrlwi    r0, r0, 16
/* 027C08 8002AC08 54005828 */  slwi      r0, r0, 11
/* 027C0C 8002AC0C 7F030214 */  add       r24, r3, r0
lbl_8002AC10:
/* 027C10 8002AC10 80BA000C */  lwz       r5, 0xc(r26)
/* 027C14 8002AC14 7E639B78 */  mr        r3, r19
/* 027C18 8002AC18 801A0004 */  lwz       r0, 0x4(r26)
/* 027C1C 8002AC1C 7E048378 */  mr        r4, r16
/* 027C20 8002AC20 54B41838 */  slwi      r20, r5, 3
/* 027C24 8002AC24 7CB4E1D6 */  mullw     r5, r20, r28
/* 027C28 8002AC28 54191838 */  slwi      r25, r0, 3
/* 027C2C 8002AC2C 7F32CB78 */  mr        r18, r25
/* 027C30 8002AC30 7EF22A14 */  add       r23, r18, r5
/* 027C34 8002AC34 7E278B78 */  mr        r7, r17
/* 027C38 8002AC38 38A00100 */  li        r5, 0x100
/* 027C3C 8002AC3C 38C00000 */  li        r6, 0x0
/* 027C40 8002AC40 480011A1 */  bl        frameMakeTLUT
/* 027C44 8002AC44 2C030000 */  cmpwi     r3, 0x0
/* 027C48 8002AC48 4082000C */  bne       lbl_8002AC54
/* 027C4C 8002AC4C 38600000 */  li        r3, 0x0
/* 027C50 8002AC50 4800117C */  b         lbl_8002BDCC
lbl_8002AC54:
/* 027C54 8002AC54 A9900010 */  lha       r12, 0x10(r16)
/* 027C58 8002AC58 38000000 */  li        r0, 0x0
/* 027C5C 8002AC5C AA300012 */  lha       r17, 0x12(r16)
/* 027C60 8002AC60 39600000 */  li        r11, 0x0
/* 027C64 8002AC64 7D961E70 */  srawi     r22, r12, 3
/* 027C68 8002AC68 7E550E70 */  srawi     r21, r18, 1
/* 027C6C 8002AC6C 7EB50194 */  addze     r21, r21
/* 027C70 8002AC70 56B5083C */  slwi      r21, r21, 1
/* 027C74 8002AC74 7EB59010 */  subfc     r21, r21, r18
/* 027C78 8002AC78 48000004 */  b         lbl_8002AC7C
lbl_8002AC7C:
/* 027C7C 8002AC7C 48000004 */  b         lbl_8002AC80
lbl_8002AC80:
/* 027C80 8002AC80 480000FC */  b         lbl_8002AD7C
lbl_8002AC84:
/* 027C84 8002AC84 7D631670 */  srawi     r3, r11, 2
/* 027C88 8002AC88 7C63B1D6 */  mullw     r3, r3, r22
/* 027C8C 8002AC8C 556407BE */  clrlwi    r4, r11, 30
/* 027C90 8002AC90 5726053E */  clrlwi    r6, r25, 20
/* 027C94 8002AC94 54871838 */  slwi      r7, r4, 3
/* 027C98 8002AC98 38800000 */  li        r4, 0x0
/* 027C9C 8002AC9C 7C852378 */  mr        r5, r4
/* 027CA0 8002ACA0 7D533214 */  add       r10, r19, r6
/* 027CA4 8002ACA4 7D27C214 */  add       r9, r7, r24
/* 027CA8 8002ACA8 38C00001 */  li        r6, 0x1
/* 027CAC 8002ACAC 48000004 */  b         lbl_8002ACB0
lbl_8002ACB0:
/* 027CB0 8002ACB0 2C0C0000 */  cmpwi     r12, 0x0
/* 027CB4 8002ACB4 7D8903A6 */  mtctr     r12
/* 027CB8 8002ACB8 40810068 */  ble       lbl_8002AD20
/* 027CBC 8002ACBC 48000004 */  b         lbl_8002ACC0
lbl_8002ACC0:
/* 027CC0 8002ACC0 7C04F000 */  cmpw      r4, r30
/* 027CC4 8002ACC4 4080003C */  bge       lbl_8002AD00
/* 027CC8 8002ACC8 7CA70278 */  xor       r7, r5, r0
/* 027CCC 8002ACCC 7CA53214 */  add       r5, r5, r6
/* 027CD0 8002ACD0 38E70C18 */  addi      r7, r7, 0xc18
/* 027CD4 8002ACD4 7C05D800 */  cmpw      r5, r27
/* 027CD8 8002ACD8 7FEA38AE */  lbzx      r31, r10, r7
/* 027CDC 8002ACDC 4080000C */  bge       lbl_8002ACE8
/* 027CE0 8002ACE0 2C050000 */  cmpwi     r5, 0x0
/* 027CE4 8002ACE4 4080001C */  bge       lbl_8002AD00
lbl_8002ACE8:
/* 027CE8 8002ACE8 2C1D0000 */  cmpwi     r29, 0x0
/* 027CEC 8002ACEC 41820010 */  beq       lbl_8002ACFC
/* 027CF0 8002ACF0 7CC600D0 */  neg       r6, r6
/* 027CF4 8002ACF4 7CA53214 */  add       r5, r5, r6
/* 027CF8 8002ACF8 48000008 */  b         lbl_8002AD00
lbl_8002ACFC:
/* 027CFC 8002ACFC 38A00000 */  li        r5, 0x0
lbl_8002AD00:
/* 027D00 8002AD00 7C871E70 */  srawi     r7, r4, 3
/* 027D04 8002AD04 7D033A14 */  add       r8, r3, r7
/* 027D08 8002AD08 5487077E */  clrlwi    r7, r4, 29
/* 027D0C 8002AD0C 55082834 */  slwi      r8, r8, 5
/* 027D10 8002AD10 7CE83A14 */  add       r7, r8, r7
/* 027D14 8002AD14 7FE939AE */  stbx      r31, r9, r7
/* 027D18 8002AD18 38840001 */  addi      r4, r4, 0x1
/* 027D1C 8002AD1C 4200FFA4 */  bdnz      lbl_8002ACC0
lbl_8002AD20:
/* 027D20 8002AD20 396B0001 */  addi      r11, r11, 0x1
/* 027D24 8002AD24 7C0B7800 */  cmpw      r11, r15
/* 027D28 8002AD28 40800054 */  bge       lbl_8002AD7C
/* 027D2C 8002AD2C 7F39A214 */  add       r25, r25, r20
/* 027D30 8002AD30 7C19B800 */  cmpw      r25, r23
/* 027D34 8002AD34 4080000C */  bge       lbl_8002AD40
/* 027D38 8002AD38 7C199000 */  cmpw      r25, r18
/* 027D3C 8002AD3C 4080003C */  bge       lbl_8002AD78
lbl_8002AD40:
/* 027D40 8002AD40 2C0E0000 */  cmpwi     r14, 0x0
/* 027D44 8002AD44 41820010 */  beq       lbl_8002AD54
/* 027D48 8002AD48 7E9400D0 */  neg       r20, r20
/* 027D4C 8002AD4C 7F39A214 */  add       r25, r25, r20
/* 027D50 8002AD50 4800002C */  b         lbl_8002AD7C
lbl_8002AD54:
/* 027D54 8002AD54 7F230E70 */  srawi     r3, r25, 1
/* 027D58 8002AD58 7C630194 */  addze     r3, r3
/* 027D5C 8002AD5C 5463083C */  slwi      r3, r3, 1
/* 027D60 8002AD60 7C63C810 */  subfc     r3, r3, r25
/* 027D64 8002AD64 7C03A800 */  cmpw      r3, r21
/* 027D68 8002AD68 40820008 */  bne       lbl_8002AD70
/* 027D6C 8002AD6C 68000004 */  xori      r0, r0, 0x4
lbl_8002AD70:
/* 027D70 8002AD70 7E599378 */  mr        r25, r18
/* 027D74 8002AD74 48000008 */  b         lbl_8002AD7C
lbl_8002AD78:
/* 027D78 8002AD78 68000004 */  xori      r0, r0, 0x4
lbl_8002AD7C:
/* 027D7C 8002AD7C 7C0B8800 */  cmpw      r11, r17
/* 027D80 8002AD80 4180FF04 */  blt       lbl_8002AC84
/* 027D84 8002AD84 48001028 */  b         lbl_8002BDAC
lbl_8002AD88:
/* 027D88 8002AD88 2C000000 */  cmpwi     r0, 0x0
/* 027D8C 8002AD8C 40820268 */  bne       lbl_8002AFF4
/* 027D90 8002AD90 38000001 */  li        r0, 0x1
/* 027D94 8002AD94 2C110000 */  cmpwi     r17, 0x0
/* 027D98 8002AD98 90010040 */  stw       r0, 0x40(r1)
/* 027D9C 8002AD9C 4182001C */  beq       lbl_8002ADB8
/* 027DA0 8002ADA0 80100004 */  lwz       r0, 0x4(r16)
/* 027DA4 8002ADA4 80731C18 */  lwz       r3, 0x1c18(r19)
/* 027DA8 8002ADA8 5400043E */  clrlwi    r0, r0, 16
/* 027DAC 8002ADAC 54005828 */  slwi      r0, r0, 11
/* 027DB0 8002ADB0 7F030214 */  add       r24, r3, r0
/* 027DB4 8002ADB4 48000098 */  b         lbl_8002AE4C
lbl_8002ADB8:
/* 027DB8 8002ADB8 38000008 */  li        r0, 0x8
/* 027DBC 8002ADBC 90100034 */  stw       r0, 0x34(r16)
/* 027DC0 8002ADC0 A8700010 */  lha       r3, 0x10(r16)
/* 027DC4 8002ADC4 5460077E */  clrlwi    r0, r3, 29
/* 027DC8 8002ADC8 2C000000 */  cmpwi     r0, 0x0
/* 027DCC 8002ADCC 41820010 */  beq       lbl_8002ADDC
/* 027DD0 8002ADD0 38030007 */  addi      r0, r3, 0x7
/* 027DD4 8002ADD4 54000038 */  clrrwi    r0, r0, 3
/* 027DD8 8002ADD8 B0100010 */  sth       r0, 0x10(r16)
lbl_8002ADDC:
/* 027DDC 8002ADDC A8700012 */  lha       r3, 0x12(r16)
/* 027DE0 8002ADE0 5460077E */  clrlwi    r0, r3, 29
/* 027DE4 8002ADE4 2C000000 */  cmpwi     r0, 0x0
/* 027DE8 8002ADE8 41820010 */  beq       lbl_8002ADF8
/* 027DEC 8002ADEC 38030007 */  addi      r0, r3, 0x7
/* 027DF0 8002ADF0 54000038 */  clrrwi    r0, r0, 3
/* 027DF4 8002ADF4 B0100012 */  sth       r0, 0x12(r16)
lbl_8002ADF8:
/* 027DF8 8002ADF8 A8B00010 */  lha       r5, 0x10(r16)
/* 027DFC 8002ADFC 38700004 */  addi      r3, r16, 0x4
/* 027E00 8002AE00 A8D00012 */  lha       r6, 0x12(r16)
/* 027E04 8002AE04 38931C38 */  addi      r4, r19, 0x1c38
/* 027E08 8002AE08 38050001 */  addi      r0, r5, 0x1
/* 027E0C 8002AE0C 7C000E70 */  srawi     r0, r0, 1
/* 027E10 8002AE10 7CA031D6 */  mullw     r5, r0, r6
/* 027E14 8002AE14 380507FF */  addi      r0, r5, 0x7ff
/* 027E18 8002AE18 7C065E70 */  srawi     r6, r0, 11
/* 027E1C 8002AE1C 7CC60194 */  addze     r6, r6
/* 027E20 8002AE20 38A00030 */  li        r5, 0x30
/* 027E24 8002AE24 4BFF5F31 */  bl        packTakeBlocks
/* 027E28 8002AE28 2C030000 */  cmpwi     r3, 0x0
/* 027E2C 8002AE2C 4082000C */  bne       lbl_8002AE38
/* 027E30 8002AE30 38600000 */  li        r3, 0x0
/* 027E34 8002AE34 48000F98 */  b         lbl_8002BDCC
lbl_8002AE38:
/* 027E38 8002AE38 80100004 */  lwz       r0, 0x4(r16)
/* 027E3C 8002AE3C 80731C18 */  lwz       r3, 0x1c18(r19)
/* 027E40 8002AE40 5400043E */  clrlwi    r0, r0, 16
/* 027E44 8002AE44 54005828 */  slwi      r0, r0, 11
/* 027E48 8002AE48 7F030214 */  add       r24, r3, r0
lbl_8002AE4C:
/* 027E4C 8002AE4C 801A000C */  lwz       r0, 0xc(r26)
/* 027E50 8002AE50 7E639B78 */  mr        r3, r19
/* 027E54 8002AE54 80BA0004 */  lwz       r5, 0x4(r26)
/* 027E58 8002AE58 7E048378 */  mr        r4, r16
/* 027E5C 8002AE5C 54121838 */  slwi      r18, r0, 3
/* 027E60 8002AE60 7C12E1D6 */  mullw     r0, r18, r28
/* 027E64 8002AE64 80DA0008 */  lwz       r6, 0x8(r26)
/* 027E68 8002AE68 54B91838 */  slwi      r25, r5, 3
/* 027E6C 8002AE6C 7F35CB78 */  mr        r21, r25
/* 027E70 8002AE70 7E278B78 */  mr        r7, r17
/* 027E74 8002AE74 7F550214 */  add       r26, r21, r0
/* 027E78 8002AE78 54C62036 */  slwi      r6, r6, 4
/* 027E7C 8002AE7C 38A00010 */  li        r5, 0x10
/* 027E80 8002AE80 48000F61 */  bl        frameMakeTLUT
/* 027E84 8002AE84 2C030000 */  cmpwi     r3, 0x0
/* 027E88 8002AE88 4082000C */  bne       lbl_8002AE94
/* 027E8C 8002AE8C 38600000 */  li        r3, 0x0
/* 027E90 8002AE90 48000F3C */  b         lbl_8002BDCC
lbl_8002AE94:
/* 027E94 8002AE94 AA900010 */  lha       r20, 0x10(r16)
/* 027E98 8002AE98 38000000 */  li        r0, 0x0
/* 027E9C 8002AE9C AAD00012 */  lha       r22, 0x12(r16)
/* 027EA0 8002AEA0 39800000 */  li        r12, 0x0
/* 027EA4 8002AEA4 7E971E70 */  srawi     r23, r20, 3
/* 027EA8 8002AEA8 7EB10E70 */  srawi     r17, r21, 1
/* 027EAC 8002AEAC 7E310194 */  addze     r17, r17
/* 027EB0 8002AEB0 5631083C */  slwi      r17, r17, 1
/* 027EB4 8002AEB4 7E31A810 */  subfc     r17, r17, r21
/* 027EB8 8002AEB8 48000004 */  b         lbl_8002AEBC
lbl_8002AEBC:
/* 027EBC 8002AEBC 48000004 */  b         lbl_8002AEC0
lbl_8002AEC0:
/* 027EC0 8002AEC0 48000128 */  b         lbl_8002AFE8
lbl_8002AEC4:
/* 027EC4 8002AEC4 7D831E70 */  srawi     r3, r12, 3
/* 027EC8 8002AEC8 7D23B9D6 */  mullw     r9, r3, r23
/* 027ECC 8002AECC 38800000 */  li        r4, 0x0
/* 027ED0 8002AED0 5583077E */  clrlwi    r3, r12, 29
/* 027ED4 8002AED4 5726053E */  clrlwi    r6, r25, 20
/* 027ED8 8002AED8 5467103A */  slwi      r7, r3, 2
/* 027EDC 8002AEDC 7C852378 */  mr        r5, r4
/* 027EE0 8002AEE0 7C832378 */  mr        r3, r4
/* 027EE4 8002AEE4 7D733214 */  add       r11, r19, r6
/* 027EE8 8002AEE8 7D47C214 */  add       r10, r7, r24
/* 027EEC 8002AEEC 38C00002 */  li        r6, 0x2
/* 027EF0 8002AEF0 48000004 */  b         lbl_8002AEF4
lbl_8002AEF4:
/* 027EF4 8002AEF4 38F40001 */  addi      r7, r20, 0x1
/* 027EF8 8002AEF8 54E7F87E */  srwi      r7, r7, 1
/* 027EFC 8002AEFC 2C140000 */  cmpwi     r20, 0x0
/* 027F00 8002AF00 7CE903A6 */  mtctr     r7
/* 027F04 8002AF04 40810088 */  ble       lbl_8002AF8C
/* 027F08 8002AF08 48000004 */  b         lbl_8002AF0C
lbl_8002AF0C:
/* 027F0C 8002AF0C 7C04F000 */  cmpw      r4, r30
/* 027F10 8002AF10 40800058 */  bge       lbl_8002AF68
/* 027F14 8002AF14 7CA70278 */  xor       r7, r5, r0
/* 027F18 8002AF18 7CE70E70 */  srawi     r7, r7, 1
/* 027F1C 8002AF1C 38E70C18 */  addi      r7, r7, 0xc18
/* 027F20 8002AF20 2C060000 */  cmpwi     r6, 0x0
/* 027F24 8002AF24 7FEB38AE */  lbzx      r31, r11, r7
/* 027F28 8002AF28 7CA53214 */  add       r5, r5, r6
/* 027F2C 8002AF2C 40800014 */  bge       lbl_8002AF40
/* 027F30 8002AF30 57E72036 */  slwi      r7, r31, 4
/* 027F34 8002AF34 7FE82670 */  srawi     r8, r31, 4
/* 027F38 8002AF38 7CE74378 */  or        r7, r7, r8
/* 027F3C 8002AF3C 54FF063E */  clrlwi    r31, r7, 24
lbl_8002AF40:
/* 027F40 8002AF40 7C05D800 */  cmpw      r5, r27
/* 027F44 8002AF44 4080000C */  bge       lbl_8002AF50
/* 027F48 8002AF48 2C050000 */  cmpwi     r5, 0x0
/* 027F4C 8002AF4C 4080001C */  bge       lbl_8002AF68
lbl_8002AF50:
/* 027F50 8002AF50 2C1D0000 */  cmpwi     r29, 0x0
/* 027F54 8002AF54 41820010 */  beq       lbl_8002AF64
/* 027F58 8002AF58 7CC600D0 */  neg       r6, r6
/* 027F5C 8002AF5C 7CA53214 */  add       r5, r5, r6
/* 027F60 8002AF60 48000008 */  b         lbl_8002AF68
lbl_8002AF64:
/* 027F64 8002AF64 38A00000 */  li        r5, 0x0
lbl_8002AF68:
/* 027F68 8002AF68 7C871E70 */  srawi     r7, r4, 3
/* 027F6C 8002AF6C 7D093A14 */  add       r8, r9, r7
/* 027F70 8002AF70 546707BE */  clrlwi    r7, r3, 30
/* 027F74 8002AF74 55082834 */  slwi      r8, r8, 5
/* 027F78 8002AF78 7CE83A14 */  add       r7, r8, r7
/* 027F7C 8002AF7C 7FEA39AE */  stbx      r31, r10, r7
/* 027F80 8002AF80 38630001 */  addi      r3, r3, 0x1
/* 027F84 8002AF84 38840002 */  addi      r4, r4, 0x2
/* 027F88 8002AF88 4200FF84 */  bdnz      lbl_8002AF0C
lbl_8002AF8C:
/* 027F8C 8002AF8C 398C0001 */  addi      r12, r12, 0x1
/* 027F90 8002AF90 7C0C7800 */  cmpw      r12, r15
/* 027F94 8002AF94 40800054 */  bge       lbl_8002AFE8
/* 027F98 8002AF98 7F399214 */  add       r25, r25, r18
/* 027F9C 8002AF9C 7C19D000 */  cmpw      r25, r26
/* 027FA0 8002AFA0 4080000C */  bge       lbl_8002AFAC
/* 027FA4 8002AFA4 7C19A800 */  cmpw      r25, r21
/* 027FA8 8002AFA8 4080003C */  bge       lbl_8002AFE4
lbl_8002AFAC:
/* 027FAC 8002AFAC 2C0E0000 */  cmpwi     r14, 0x0
/* 027FB0 8002AFB0 41820010 */  beq       lbl_8002AFC0
/* 027FB4 8002AFB4 7E5200D0 */  neg       r18, r18
/* 027FB8 8002AFB8 7F399214 */  add       r25, r25, r18
/* 027FBC 8002AFBC 4800002C */  b         lbl_8002AFE8
lbl_8002AFC0:
/* 027FC0 8002AFC0 7F230E70 */  srawi     r3, r25, 1
/* 027FC4 8002AFC4 7C630194 */  addze     r3, r3
/* 027FC8 8002AFC8 5463083C */  slwi      r3, r3, 1
/* 027FCC 8002AFCC 7C63C810 */  subfc     r3, r3, r25
/* 027FD0 8002AFD0 7C038800 */  cmpw      r3, r17
/* 027FD4 8002AFD4 40820008 */  bne       lbl_8002AFDC
/* 027FD8 8002AFD8 68000008 */  xori      r0, r0, 0x8
lbl_8002AFDC:
/* 027FDC 8002AFDC 7EB9AB78 */  mr        r25, r21
/* 027FE0 8002AFE0 48000008 */  b         lbl_8002AFE8
lbl_8002AFE4:
/* 027FE4 8002AFE4 68000008 */  xori      r0, r0, 0x8
lbl_8002AFE8:
/* 027FE8 8002AFE8 7C0CB000 */  cmpw      r12, r22
/* 027FEC 8002AFEC 4180FED8 */  blt       lbl_8002AEC4
/* 027FF0 8002AFF0 48000DBC */  b         lbl_8002BDAC
lbl_8002AFF4:
/* 027FF4 8002AFF4 38600000 */  li        r3, 0x0
/* 027FF8 8002AFF8 48000DD4 */  b         lbl_8002BDCC
lbl_8002AFFC:
/* 027FFC 8002AFFC 2C000003 */  cmpwi     r0, 0x3
/* 028000 8002B000 40820740 */  bne       lbl_8002B740
/* 028004 8002B004 801A0000 */  lwz       r0, 0x0(r26)
/* 028008 8002B008 2C000002 */  cmpwi     r0, 0x2
/* 02800C 8002B00C 40820228 */  bne       lbl_8002B234
/* 028010 8002B010 38000002 */  li        r0, 0x2
/* 028014 8002B014 2C110000 */  cmpwi     r17, 0x0
/* 028018 8002B018 90010040 */  stw       r0, 0x40(r1)
/* 02801C 8002B01C 4182001C */  beq       lbl_8002B038
/* 028020 8002B020 80100004 */  lwz       r0, 0x4(r16)
/* 028024 8002B024 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028028 8002B028 5400043E */  clrlwi    r0, r0, 16
/* 02802C 8002B02C 54005828 */  slwi      r0, r0, 11
/* 028030 8002B030 7F030214 */  add       r24, r3, r0
/* 028034 8002B034 48000094 */  b         lbl_8002B0C8
lbl_8002B038:
/* 028038 8002B038 38000003 */  li        r0, 0x3
/* 02803C 8002B03C 90100034 */  stw       r0, 0x34(r16)
/* 028040 8002B040 A8700010 */  lha       r3, 0x10(r16)
/* 028044 8002B044 546007BE */  clrlwi    r0, r3, 30
/* 028048 8002B048 2C000000 */  cmpwi     r0, 0x0
/* 02804C 8002B04C 41820010 */  beq       lbl_8002B05C
/* 028050 8002B050 38030003 */  addi      r0, r3, 0x3
/* 028054 8002B054 5400003A */  clrrwi    r0, r0, 2
/* 028058 8002B058 B0100010 */  sth       r0, 0x10(r16)
lbl_8002B05C:
/* 02805C 8002B05C A8700012 */  lha       r3, 0x12(r16)
/* 028060 8002B060 546007BE */  clrlwi    r0, r3, 30
/* 028064 8002B064 2C000000 */  cmpwi     r0, 0x0
/* 028068 8002B068 41820010 */  beq       lbl_8002B078
/* 02806C 8002B06C 38030003 */  addi      r0, r3, 0x3
/* 028070 8002B070 5400003A */  clrrwi    r0, r0, 2
/* 028074 8002B074 B0100012 */  sth       r0, 0x12(r16)
lbl_8002B078:
/* 028078 8002B078 A8100010 */  lha       r0, 0x10(r16)
/* 02807C 8002B07C 38700004 */  addi      r3, r16, 0x4
/* 028080 8002B080 A8D00012 */  lha       r6, 0x12(r16)
/* 028084 8002B084 38931C38 */  addi      r4, r19, 0x1c38
/* 028088 8002B088 38A00030 */  li        r5, 0x30
/* 02808C 8002B08C 7C0031D6 */  mullw     r0, r0, r6
/* 028090 8002B090 5406083C */  slwi      r6, r0, 1
/* 028094 8002B094 380607FF */  addi      r0, r6, 0x7ff
/* 028098 8002B098 7C065E70 */  srawi     r6, r0, 11
/* 02809C 8002B09C 7CC60194 */  addze     r6, r6
/* 0280A0 8002B0A0 4BFF5CB5 */  bl        packTakeBlocks
/* 0280A4 8002B0A4 2C030000 */  cmpwi     r3, 0x0
/* 0280A8 8002B0A8 4082000C */  bne       lbl_8002B0B4
/* 0280AC 8002B0AC 38600000 */  li        r3, 0x0
/* 0280B0 8002B0B0 48000D1C */  b         lbl_8002BDCC
lbl_8002B0B4:
/* 0280B4 8002B0B4 80100004 */  lwz       r0, 0x4(r16)
/* 0280B8 8002B0B8 80731C18 */  lwz       r3, 0x1c18(r19)
/* 0280BC 8002B0BC 5400043E */  clrlwi    r0, r0, 16
/* 0280C0 8002B0C0 54005828 */  slwi      r0, r0, 11
/* 0280C4 8002B0C4 7F030214 */  add       r24, r3, r0
lbl_8002B0C8:
/* 0280C8 8002B0C8 801A000C */  lwz       r0, 0xc(r26)
/* 0280CC 8002B0CC 38600000 */  li        r3, 0x0
/* 0280D0 8002B0D0 809A0004 */  lwz       r4, 0x4(r26)
/* 0280D4 8002B0D4 3AC00000 */  li        r22, 0x0
/* 0280D8 8002B0D8 5414103A */  slwi      r20, r0, 2
/* 0280DC 8002B0DC AAB00010 */  lha       r21, 0x10(r16)
/* 0280E0 8002B0E0 5489103A */  slwi      r9, r4, 2
/* 0280E4 8002B0E4 7C14E1D6 */  mullw     r0, r20, r28
/* 0280E8 8002B0E8 AAF00012 */  lha       r23, 0x12(r16)
/* 0280EC 8002B0EC 7D324B78 */  mr        r18, r9
/* 0280F0 8002B0F0 7EBA1670 */  srawi     r26, r21, 2
/* 0280F4 8002B0F4 7E510E70 */  srawi     r17, r18, 1
/* 0280F8 8002B0F8 7E310194 */  addze     r17, r17
/* 0280FC 8002B0FC 5631083C */  slwi      r17, r17, 1
/* 028100 8002B100 7F320214 */  add       r25, r18, r0
/* 028104 8002B104 7E319010 */  subfc     r17, r17, r18
/* 028108 8002B108 48000004 */  b         lbl_8002B10C
lbl_8002B10C:
/* 02810C 8002B10C 48000004 */  b         lbl_8002B110
lbl_8002B110:
/* 028110 8002B110 48000118 */  b         lbl_8002B228
lbl_8002B114:
/* 028114 8002B114 7EC01670 */  srawi     r0, r22, 2
/* 028118 8002B118 7D40D1D6 */  mullw     r10, r0, r26
/* 02811C 8002B11C 56C007BE */  clrlwi    r0, r22, 30
/* 028120 8002B120 38800000 */  li        r4, 0x0
/* 028124 8002B124 7C852378 */  mr        r5, r4
/* 028128 8002B128 552C057E */  clrlwi    r12, r9, 21
/* 02812C 8002B12C 540B103A */  slwi      r11, r0, 2
/* 028130 8002B130 38C00001 */  li        r6, 0x1
/* 028134 8002B134 48000004 */  b         lbl_8002B138
lbl_8002B138:
/* 028138 8002B138 2C150000 */  cmpwi     r21, 0x0
/* 02813C 8002B13C 7EA903A6 */  mtctr     r21
/* 028140 8002B140 4081008C */  ble       lbl_8002B1CC
/* 028144 8002B144 48000004 */  b         lbl_8002B148
lbl_8002B148:
/* 028148 8002B148 7C04F000 */  cmpw      r4, r30
/* 02814C 8002B14C 40800044 */  bge       lbl_8002B190
/* 028150 8002B150 7CA01A78 */  xor       r0, r5, r3
/* 028154 8002B154 7C0C0214 */  add       r0, r12, r0
/* 028158 8002B158 5407083C */  slwi      r7, r0, 1
/* 02815C 8002B15C 7CA53214 */  add       r5, r5, r6
/* 028160 8002B160 38070C18 */  addi      r0, r7, 0xc18
/* 028164 8002B164 7C05D800 */  cmpw      r5, r27
/* 028168 8002B168 7FF3022E */  lhzx      r31, r19, r0
/* 02816C 8002B16C 4080000C */  bge       lbl_8002B178
/* 028170 8002B170 2C050000 */  cmpwi     r5, 0x0
/* 028174 8002B174 4080001C */  bge       lbl_8002B190
lbl_8002B178:
/* 028178 8002B178 2C1D0000 */  cmpwi     r29, 0x0
/* 02817C 8002B17C 41820010 */  beq       lbl_8002B18C
/* 028180 8002B180 7CC600D0 */  neg       r6, r6
/* 028184 8002B184 7CA53214 */  add       r5, r5, r6
/* 028188 8002B188 48000008 */  b         lbl_8002B190
lbl_8002B18C:
/* 02818C 8002B18C 38A00000 */  li        r5, 0x0
lbl_8002B190:
/* 028190 8002B190 7C801670 */  srawi     r0, r4, 2
/* 028194 8002B194 7CEA0214 */  add       r7, r10, r0
/* 028198 8002B198 57E0063E */  clrlwi    r0, r31, 24
/* 02819C 8002B19C 54E72036 */  slwi      r7, r7, 4
/* 0281A0 8002B1A0 548807BE */  clrlwi    r8, r4, 30
/* 0281A4 8002B1A4 7CEB3A14 */  add       r7, r11, r7
/* 0281A8 8002B1A8 7CE83A14 */  add       r7, r8, r7
/* 0281AC 8002B1AC 5408402E */  slwi      r8, r0, 8
/* 0281B0 8002B1B0 57E0C63E */  extrwi    r0, r31, 8, 16
/* 0281B4 8002B1B4 7D000378 */  or        r0, r8, r0
/* 0281B8 8002B1B8 5400043E */  clrlwi    r0, r0, 16
/* 0281BC 8002B1BC 54E7083C */  slwi      r7, r7, 1
/* 0281C0 8002B1C0 7C183B2E */  sthx      r0, r24, r7
/* 0281C4 8002B1C4 38840001 */  addi      r4, r4, 0x1
/* 0281C8 8002B1C8 4200FF80 */  bdnz      lbl_8002B148
lbl_8002B1CC:
/* 0281CC 8002B1CC 3AD60001 */  addi      r22, r22, 0x1
/* 0281D0 8002B1D0 7C167800 */  cmpw      r22, r15
/* 0281D4 8002B1D4 40800054 */  bge       lbl_8002B228
/* 0281D8 8002B1D8 7D29A214 */  add       r9, r9, r20
/* 0281DC 8002B1DC 7C09C800 */  cmpw      r9, r25
/* 0281E0 8002B1E0 4080000C */  bge       lbl_8002B1EC
/* 0281E4 8002B1E4 7C099000 */  cmpw      r9, r18
/* 0281E8 8002B1E8 4080003C */  bge       lbl_8002B224
lbl_8002B1EC:
/* 0281EC 8002B1EC 2C0E0000 */  cmpwi     r14, 0x0
/* 0281F0 8002B1F0 41820010 */  beq       lbl_8002B200
/* 0281F4 8002B1F4 7E9400D0 */  neg       r20, r20
/* 0281F8 8002B1F8 7D29A214 */  add       r9, r9, r20
/* 0281FC 8002B1FC 4800002C */  b         lbl_8002B228
lbl_8002B200:
/* 028200 8002B200 7D200E70 */  srawi     r0, r9, 1
/* 028204 8002B204 7C000194 */  addze     r0, r0
/* 028208 8002B208 5400083C */  slwi      r0, r0, 1
/* 02820C 8002B20C 7C004810 */  subfc     r0, r0, r9
/* 028210 8002B210 7C008800 */  cmpw      r0, r17
/* 028214 8002B214 40820008 */  bne       lbl_8002B21C
/* 028218 8002B218 68630002 */  xori      r3, r3, 0x2
lbl_8002B21C:
/* 02821C 8002B21C 7E499378 */  mr        r9, r18
/* 028220 8002B220 48000008 */  b         lbl_8002B228
lbl_8002B224:
/* 028224 8002B224 68630002 */  xori      r3, r3, 0x2
lbl_8002B228:
/* 028228 8002B228 7C16B800 */  cmpw      r22, r23
/* 02822C 8002B22C 4180FEE8 */  blt       lbl_8002B114
/* 028230 8002B230 48000B7C */  b         lbl_8002BDAC
lbl_8002B234:
/* 028234 8002B234 2C000001 */  cmpwi     r0, 0x1
/* 028238 8002B238 4082021C */  bne       lbl_8002B454
/* 02823C 8002B23C 38000001 */  li        r0, 0x1
/* 028240 8002B240 2C110000 */  cmpwi     r17, 0x0
/* 028244 8002B244 90010040 */  stw       r0, 0x40(r1)
/* 028248 8002B248 4182001C */  beq       lbl_8002B264
/* 02824C 8002B24C 80100004 */  lwz       r0, 0x4(r16)
/* 028250 8002B250 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028254 8002B254 5400043E */  clrlwi    r0, r0, 16
/* 028258 8002B258 54005828 */  slwi      r0, r0, 11
/* 02825C 8002B25C 7F030214 */  add       r24, r3, r0
/* 028260 8002B260 48000090 */  b         lbl_8002B2F0
lbl_8002B264:
/* 028264 8002B264 38000002 */  li        r0, 0x2
/* 028268 8002B268 90100034 */  stw       r0, 0x34(r16)
/* 02826C 8002B26C A8700010 */  lha       r3, 0x10(r16)
/* 028270 8002B270 5460077E */  clrlwi    r0, r3, 29
/* 028274 8002B274 2C000000 */  cmpwi     r0, 0x0
/* 028278 8002B278 41820010 */  beq       lbl_8002B288
/* 02827C 8002B27C 38030007 */  addi      r0, r3, 0x7
/* 028280 8002B280 54000038 */  clrrwi    r0, r0, 3
/* 028284 8002B284 B0100010 */  sth       r0, 0x10(r16)
lbl_8002B288:
/* 028288 8002B288 A8700012 */  lha       r3, 0x12(r16)
/* 02828C 8002B28C 546007BE */  clrlwi    r0, r3, 30
/* 028290 8002B290 2C000000 */  cmpwi     r0, 0x0
/* 028294 8002B294 41820010 */  beq       lbl_8002B2A4
/* 028298 8002B298 38030003 */  addi      r0, r3, 0x3
/* 02829C 8002B29C 5400003A */  clrrwi    r0, r0, 2
/* 0282A0 8002B2A0 B0100012 */  sth       r0, 0x12(r16)
lbl_8002B2A4:
/* 0282A4 8002B2A4 A8100010 */  lha       r0, 0x10(r16)
/* 0282A8 8002B2A8 38700004 */  addi      r3, r16, 0x4
/* 0282AC 8002B2AC A8D00012 */  lha       r6, 0x12(r16)
/* 0282B0 8002B2B0 38931C38 */  addi      r4, r19, 0x1c38
/* 0282B4 8002B2B4 38A00030 */  li        r5, 0x30
/* 0282B8 8002B2B8 7CC031D6 */  mullw     r6, r0, r6
/* 0282BC 8002B2BC 380607FF */  addi      r0, r6, 0x7ff
/* 0282C0 8002B2C0 7C065E70 */  srawi     r6, r0, 11
/* 0282C4 8002B2C4 7CC60194 */  addze     r6, r6
/* 0282C8 8002B2C8 4BFF5A8D */  bl        packTakeBlocks
/* 0282CC 8002B2CC 2C030000 */  cmpwi     r3, 0x0
/* 0282D0 8002B2D0 4082000C */  bne       lbl_8002B2DC
/* 0282D4 8002B2D4 38600000 */  li        r3, 0x0
/* 0282D8 8002B2D8 48000AF4 */  b         lbl_8002BDCC
lbl_8002B2DC:
/* 0282DC 8002B2DC 80100004 */  lwz       r0, 0x4(r16)
/* 0282E0 8002B2E0 80731C18 */  lwz       r3, 0x1c18(r19)
/* 0282E4 8002B2E4 5400043E */  clrlwi    r0, r0, 16
/* 0282E8 8002B2E8 54005828 */  slwi      r0, r0, 11
/* 0282EC 8002B2EC 7F030214 */  add       r24, r3, r0
lbl_8002B2F0:
/* 0282F0 8002B2F0 801A000C */  lwz       r0, 0xc(r26)
/* 0282F4 8002B2F4 39200000 */  li        r9, 0x0
/* 0282F8 8002B2F8 807A0004 */  lwz       r3, 0x4(r26)
/* 0282FC 8002B2FC 3B400000 */  li        r26, 0x0
/* 028300 8002B300 54141838 */  slwi      r20, r0, 3
/* 028304 8002B304 546A1838 */  slwi      r10, r3, 3
/* 028308 8002B308 AAB00010 */  lha       r21, 0x10(r16)
/* 02830C 8002B30C 7C14E1D6 */  mullw     r0, r20, r28
/* 028310 8002B310 AAD00012 */  lha       r22, 0x12(r16)
/* 028314 8002B314 7D525378 */  mr        r18, r10
/* 028318 8002B318 7EBC1E70 */  srawi     r28, r21, 3
/* 02831C 8002B31C 7E510E70 */  srawi     r17, r18, 1
/* 028320 8002B320 7E310194 */  addze     r17, r17
/* 028324 8002B324 5631083C */  slwi      r17, r17, 1
/* 028328 8002B328 7EF20214 */  add       r23, r18, r0
/* 02832C 8002B32C 7E319010 */  subfc     r17, r17, r18
/* 028330 8002B330 48000004 */  b         lbl_8002B334
lbl_8002B334:
/* 028334 8002B334 48000004 */  b         lbl_8002B338
lbl_8002B338:
/* 028338 8002B338 48000110 */  b         lbl_8002B448
lbl_8002B33C:
/* 02833C 8002B33C 7F401670 */  srawi     r0, r26, 2
/* 028340 8002B340 7D60E1D6 */  mullw     r11, r0, r28
/* 028344 8002B344 574007BE */  clrlwi    r0, r26, 30
/* 028348 8002B348 5543053E */  clrlwi    r3, r10, 20
/* 02834C 8002B34C 54001838 */  slwi      r0, r0, 3
/* 028350 8002B350 38C00000 */  li        r6, 0x0
/* 028354 8002B354 7CC73378 */  mr        r7, r6
/* 028358 8002B358 7F331A14 */  add       r25, r19, r3
/* 02835C 8002B35C 7D80C214 */  add       r12, r0, r24
/* 028360 8002B360 39000001 */  li        r8, 0x1
/* 028364 8002B364 48000004 */  b         lbl_8002B368
lbl_8002B368:
/* 028368 8002B368 2C150000 */  cmpwi     r21, 0x0
/* 02836C 8002B36C 7EA903A6 */  mtctr     r21
/* 028370 8002B370 4081007C */  ble       lbl_8002B3EC
/* 028374 8002B374 48000004 */  b         lbl_8002B378
lbl_8002B378:
/* 028378 8002B378 7C06F000 */  cmpw      r6, r30
/* 02837C 8002B37C 4080003C */  bge       lbl_8002B3B8
/* 028380 8002B380 7CE34A78 */  xor       r3, r7, r9
/* 028384 8002B384 7CE74214 */  add       r7, r7, r8
/* 028388 8002B388 38030C18 */  addi      r0, r3, 0xc18
/* 02838C 8002B38C 7C07D800 */  cmpw      r7, r27
/* 028390 8002B390 7FF900AE */  lbzx      r31, r25, r0
/* 028394 8002B394 4080000C */  bge       lbl_8002B3A0
/* 028398 8002B398 2C070000 */  cmpwi     r7, 0x0
/* 02839C 8002B39C 4080001C */  bge       lbl_8002B3B8
lbl_8002B3A0:
/* 0283A0 8002B3A0 2C1D0000 */  cmpwi     r29, 0x0
/* 0283A4 8002B3A4 41820010 */  beq       lbl_8002B3B4
/* 0283A8 8002B3A8 7D0800D0 */  neg       r8, r8
/* 0283AC 8002B3AC 7CE74214 */  add       r7, r7, r8
/* 0283B0 8002B3B0 48000008 */  b         lbl_8002B3B8
lbl_8002B3B4:
/* 0283B4 8002B3B4 38E00000 */  li        r7, 0x0
lbl_8002B3B8:
/* 0283B8 8002B3B8 57E4073E */  clrlwi    r4, r31, 28
/* 0283BC 8002B3BC 7CC01E70 */  srawi     r0, r6, 3
/* 0283C0 8002B3C0 7C6B0214 */  add       r3, r11, r0
/* 0283C4 8002B3C4 54C0077E */  clrlwi    r0, r6, 29
/* 0283C8 8002B3C8 54632834 */  slwi      r3, r3, 5
/* 0283CC 8002B3CC 54852036 */  slwi      r5, r4, 4
/* 0283D0 8002B3D0 57E4E73E */  extrwi    r4, r31, 4, 24
/* 0283D4 8002B3D4 7CA42378 */  or        r4, r5, r4
/* 0283D8 8002B3D8 5484063E */  clrlwi    r4, r4, 24
/* 0283DC 8002B3DC 7C030214 */  add       r0, r3, r0
/* 0283E0 8002B3E0 7C8C01AE */  stbx      r4, r12, r0
/* 0283E4 8002B3E4 38C60001 */  addi      r6, r6, 0x1
/* 0283E8 8002B3E8 4200FF90 */  bdnz      lbl_8002B378
lbl_8002B3EC:
/* 0283EC 8002B3EC 3B5A0001 */  addi      r26, r26, 0x1
/* 0283F0 8002B3F0 7C1A7800 */  cmpw      r26, r15
/* 0283F4 8002B3F4 40800054 */  bge       lbl_8002B448
/* 0283F8 8002B3F8 7D4AA214 */  add       r10, r10, r20
/* 0283FC 8002B3FC 7C0AB800 */  cmpw      r10, r23
/* 028400 8002B400 4080000C */  bge       lbl_8002B40C
/* 028404 8002B404 7C0A9000 */  cmpw      r10, r18
/* 028408 8002B408 4080003C */  bge       lbl_8002B444
lbl_8002B40C:
/* 02840C 8002B40C 2C0E0000 */  cmpwi     r14, 0x0
/* 028410 8002B410 41820010 */  beq       lbl_8002B420
/* 028414 8002B414 7E9400D0 */  neg       r20, r20
/* 028418 8002B418 7D4AA214 */  add       r10, r10, r20
/* 02841C 8002B41C 4800002C */  b         lbl_8002B448
lbl_8002B420:
/* 028420 8002B420 7D400E70 */  srawi     r0, r10, 1
/* 028424 8002B424 7C000194 */  addze     r0, r0
/* 028428 8002B428 5400083C */  slwi      r0, r0, 1
/* 02842C 8002B42C 7C005010 */  subfc     r0, r0, r10
/* 028430 8002B430 7C008800 */  cmpw      r0, r17
/* 028434 8002B434 40820008 */  bne       lbl_8002B43C
/* 028438 8002B438 69290004 */  xori      r9, r9, 0x4
lbl_8002B43C:
/* 02843C 8002B43C 7E4A9378 */  mr        r10, r18
/* 028440 8002B440 48000008 */  b         lbl_8002B448
lbl_8002B444:
/* 028444 8002B444 69290004 */  xori      r9, r9, 0x4
lbl_8002B448:
/* 028448 8002B448 7C1AB000 */  cmpw      r26, r22
/* 02844C 8002B44C 4180FEF0 */  blt       lbl_8002B33C
/* 028450 8002B450 4800095C */  b         lbl_8002BDAC
lbl_8002B454:
/* 028454 8002B454 2C000000 */  cmpwi     r0, 0x0
/* 028458 8002B458 408202E0 */  bne       lbl_8002B738
/* 02845C 8002B45C 38000001 */  li        r0, 0x1
/* 028460 8002B460 2C110000 */  cmpwi     r17, 0x0
/* 028464 8002B464 90010040 */  stw       r0, 0x40(r1)
/* 028468 8002B468 4182001C */  beq       lbl_8002B484
/* 02846C 8002B46C 80100004 */  lwz       r0, 0x4(r16)
/* 028470 8002B470 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028474 8002B474 5400043E */  clrlwi    r0, r0, 16
/* 028478 8002B478 54005828 */  slwi      r0, r0, 11
/* 02847C 8002B47C 7F030214 */  add       r24, r3, r0
/* 028480 8002B480 48000090 */  b         lbl_8002B510
lbl_8002B484:
/* 028484 8002B484 38000002 */  li        r0, 0x2
/* 028488 8002B488 90100034 */  stw       r0, 0x34(r16)
/* 02848C 8002B48C A8700010 */  lha       r3, 0x10(r16)
/* 028490 8002B490 5460077E */  clrlwi    r0, r3, 29
/* 028494 8002B494 2C000000 */  cmpwi     r0, 0x0
/* 028498 8002B498 41820010 */  beq       lbl_8002B4A8
/* 02849C 8002B49C 38030007 */  addi      r0, r3, 0x7
/* 0284A0 8002B4A0 54000038 */  clrrwi    r0, r0, 3
/* 0284A4 8002B4A4 B0100010 */  sth       r0, 0x10(r16)
lbl_8002B4A8:
/* 0284A8 8002B4A8 A8700012 */  lha       r3, 0x12(r16)
/* 0284AC 8002B4AC 5460077E */  clrlwi    r0, r3, 29
/* 0284B0 8002B4B0 2C000000 */  cmpwi     r0, 0x0
/* 0284B4 8002B4B4 41820010 */  beq       lbl_8002B4C4
/* 0284B8 8002B4B8 38030007 */  addi      r0, r3, 0x7
/* 0284BC 8002B4BC 54000038 */  clrrwi    r0, r0, 3
/* 0284C0 8002B4C0 B0100012 */  sth       r0, 0x12(r16)
lbl_8002B4C4:
/* 0284C4 8002B4C4 A8100010 */  lha       r0, 0x10(r16)
/* 0284C8 8002B4C8 38700004 */  addi      r3, r16, 0x4
/* 0284CC 8002B4CC A8D00012 */  lha       r6, 0x12(r16)
/* 0284D0 8002B4D0 38931C38 */  addi      r4, r19, 0x1c38
/* 0284D4 8002B4D4 38A00030 */  li        r5, 0x30
/* 0284D8 8002B4D8 7CC031D6 */  mullw     r6, r0, r6
/* 0284DC 8002B4DC 380607FF */  addi      r0, r6, 0x7ff
/* 0284E0 8002B4E0 7C065E70 */  srawi     r6, r0, 11
/* 0284E4 8002B4E4 7CC60194 */  addze     r6, r6
/* 0284E8 8002B4E8 4BFF586D */  bl        packTakeBlocks
/* 0284EC 8002B4EC 2C030000 */  cmpwi     r3, 0x0
/* 0284F0 8002B4F0 4082000C */  bne       lbl_8002B4FC
/* 0284F4 8002B4F4 38600000 */  li        r3, 0x0
/* 0284F8 8002B4F8 480008D4 */  b         lbl_8002BDCC
lbl_8002B4FC:
/* 0284FC 8002B4FC 80100004 */  lwz       r0, 0x4(r16)
/* 028500 8002B500 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028504 8002B504 5400043E */  clrlwi    r0, r0, 16
/* 028508 8002B508 54005828 */  slwi      r0, r0, 11
/* 02850C 8002B50C 7F030214 */  add       r24, r3, r0
lbl_8002B510:
/* 028510 8002B510 801A000C */  lwz       r0, 0xc(r26)
/* 028514 8002B514 3B200000 */  li        r25, 0x0
/* 028518 8002B518 807A0004 */  lwz       r3, 0x4(r26)
/* 02851C 8002B51C 3A400000 */  li        r18, 0x0
/* 028520 8002B520 54111838 */  slwi      r17, r0, 3
/* 028524 8002B524 A8100010 */  lha       r0, 0x10(r16)
/* 028528 8002B528 54761838 */  slwi      r22, r3, 3
/* 02852C 8002B52C 92C1004C */  stw       r22, 0x4c(r1)
/* 028530 8002B530 7C71E1D6 */  mullw     r3, r17, r28
/* 028534 8002B534 90010050 */  stw       r0, 0x50(r1)
/* 028538 8002B538 A8100012 */  lha       r0, 0x12(r16)
/* 02853C 8002B53C 90010044 */  stw       r0, 0x44(r1)
/* 028540 8002B540 80010050 */  lwz       r0, 0x50(r1)
/* 028544 8002B544 7C001E70 */  srawi     r0, r0, 3
/* 028548 8002B548 90010058 */  stw       r0, 0x58(r1)
/* 02854C 8002B54C 8001004C */  lwz       r0, 0x4c(r1)
/* 028550 8002B550 7C000E70 */  srawi     r0, r0, 1
/* 028554 8002B554 90010054 */  stw       r0, 0x54(r1)
/* 028558 8002B558 80010054 */  lwz       r0, 0x54(r1)
/* 02855C 8002B55C 7C000194 */  addze     r0, r0
/* 028560 8002B560 90010054 */  stw       r0, 0x54(r1)
/* 028564 8002B564 80010054 */  lwz       r0, 0x54(r1)
/* 028568 8002B568 5400083C */  slwi      r0, r0, 1
/* 02856C 8002B56C 90010054 */  stw       r0, 0x54(r1)
/* 028570 8002B570 8001004C */  lwz       r0, 0x4c(r1)
/* 028574 8002B574 7C001A14 */  add       r0, r0, r3
/* 028578 8002B578 80610054 */  lwz       r3, 0x54(r1)
/* 02857C 8002B57C 90010048 */  stw       r0, 0x48(r1)
/* 028580 8002B580 8001004C */  lwz       r0, 0x4c(r1)
/* 028584 8002B584 7C630010 */  subfc     r3, r3, r0
/* 028588 8002B588 90610054 */  stw       r3, 0x54(r1)
/* 02858C 8002B58C 48000004 */  b         lbl_8002B590
lbl_8002B590:
/* 028590 8002B590 48000004 */  b         lbl_8002B594
lbl_8002B594:
/* 028594 8002B594 48000194 */  b         lbl_8002B728
lbl_8002B598:
/* 028598 8002B598 80010058 */  lwz       r0, 0x58(r1)
/* 02859C 8002B59C 7E431670 */  srawi     r3, r18, 2
/* 0285A0 8002B5A0 38C00000 */  li        r6, 0x0
/* 0285A4 8002B5A4 7D6301D6 */  mullw     r11, r3, r0
/* 0285A8 8002B5A8 564007BE */  clrlwi    r0, r18, 30
/* 0285AC 8002B5AC 56C3053E */  clrlwi    r3, r22, 20
/* 0285B0 8002B5B0 54171838 */  slwi      r23, r0, 3
/* 0285B4 8002B5B4 7CC73378 */  mr        r7, r6
/* 0285B8 8002B5B8 7E931A14 */  add       r20, r19, r3
/* 0285BC 8002B5BC 7EB7C214 */  add       r21, r23, r24
/* 0285C0 8002B5C0 39000002 */  li        r8, 0x2
/* 0285C4 8002B5C4 48000004 */  b         lbl_8002B5C8
lbl_8002B5C8:
/* 0285C8 8002B5C8 80610050 */  lwz       r3, 0x50(r1)
/* 0285CC 8002B5CC 80010050 */  lwz       r0, 0x50(r1)
/* 0285D0 8002B5D0 38630001 */  addi      r3, r3, 0x1
/* 0285D4 8002B5D4 5463F87E */  srwi      r3, r3, 1
/* 0285D8 8002B5D8 2C000000 */  cmpwi     r0, 0x0
/* 0285DC 8002B5DC 7C6903A6 */  mtctr     r3
/* 0285E0 8002B5E0 408100E0 */  ble       lbl_8002B6C0
/* 0285E4 8002B5E4 48000004 */  b         lbl_8002B5E8
lbl_8002B5E8:
/* 0285E8 8002B5E8 7C06F000 */  cmpw      r6, r30
/* 0285EC 8002B5EC 40800058 */  bge       lbl_8002B644
/* 0285F0 8002B5F0 7CE0CA78 */  xor       r0, r7, r25
/* 0285F4 8002B5F4 7C030E70 */  srawi     r3, r0, 1
/* 0285F8 8002B5F8 38030C18 */  addi      r0, r3, 0xc18
/* 0285FC 8002B5FC 2C080000 */  cmpwi     r8, 0x0
/* 028600 8002B600 7FF400AE */  lbzx      r31, r20, r0
/* 028604 8002B604 40800014 */  bge       lbl_8002B618
/* 028608 8002B608 7FE02670 */  srawi     r0, r31, 4
/* 02860C 8002B60C 57E32036 */  slwi      r3, r31, 4
/* 028610 8002B610 7C001B78 */  or        r0, r0, r3
/* 028614 8002B614 541F063E */  clrlwi    r31, r0, 24
lbl_8002B618:
/* 028618 8002B618 7CE74214 */  add       r7, r7, r8
/* 02861C 8002B61C 7C07D800 */  cmpw      r7, r27
/* 028620 8002B620 4080000C */  bge       lbl_8002B62C
/* 028624 8002B624 2C070000 */  cmpwi     r7, 0x0
/* 028628 8002B628 4080001C */  bge       lbl_8002B644
lbl_8002B62C:
/* 02862C 8002B62C 2C1D0000 */  cmpwi     r29, 0x0
/* 028630 8002B630 41820010 */  beq       lbl_8002B640
/* 028634 8002B634 7D0800D0 */  neg       r8, r8
/* 028638 8002B638 7CE74214 */  add       r7, r7, r8
/* 02863C 8002B63C 48000008 */  b         lbl_8002B644
lbl_8002B640:
/* 028640 8002B640 38E00000 */  li        r7, 0x0
lbl_8002B644:
/* 028644 8002B644 57E5063E */  clrlwi    r5, r31, 24
/* 028648 8002B648 54A0E7FE */  extrwi    r0, r5, 1, 27
/* 02864C 8002B64C 1D20000F */  mulli     r9, r0, 0xf
/* 028650 8002B650 7CC01E70 */  srawi     r0, r6, 3
/* 028654 8002B654 7C0B0214 */  add       r0, r11, r0
/* 028658 8002B658 54032834 */  slwi      r3, r0, 5
/* 02865C 8002B65C 38060001 */  addi      r0, r6, 0x1
/* 028660 8002B660 7D571A14 */  add       r10, r23, r3
/* 028664 8002B664 54DC077E */  clrlwi    r28, r6, 29
/* 028668 8002B668 54A307FE */  clrlwi    r3, r5, 31
/* 02866C 8002B66C 1D83000F */  mulli     r12, r3, 0xf
/* 028670 8002B670 7C031E70 */  srawi     r3, r0, 3
/* 028674 8002B674 7F4B1A14 */  add       r26, r11, r3
/* 028678 8002B678 54A3DF7E */  extrwi    r3, r5, 3, 24
/* 02867C 8002B67C 388D80F8 */  li        r4, D_8018B078@sda21
/* 028680 8002B680 7C6418AE */  lbzx      r3, r4, r3
/* 028684 8002B684 55292036 */  slwi      r9, r9, 4
/* 028688 8002B688 7D4AC214 */  add       r10, r10, r24
/* 02868C 8002B68C 7C634B78 */  or        r3, r3, r9
/* 028690 8002B690 5463063E */  clrlwi    r3, r3, 24
/* 028694 8002B694 7C7C51AE */  stbx      r3, r28, r10
/* 028698 8002B698 54A3FF7E */  extrwi    r3, r5, 3, 28
/* 02869C 8002B69C 55852036 */  slwi      r5, r12, 4
/* 0286A0 8002B6A0 7C8418AE */  lbzx      r4, r4, r3
/* 0286A4 8002B6A4 57432834 */  slwi      r3, r26, 5
/* 0286A8 8002B6A8 5400077E */  clrlwi    r0, r0, 29
/* 0286AC 8002B6AC 7C842B78 */  or        r4, r4, r5
/* 0286B0 8002B6B0 7C030214 */  add       r0, r3, r0
/* 0286B4 8002B6B4 7C9501AE */  stbx      r4, r21, r0
/* 0286B8 8002B6B8 38C60002 */  addi      r6, r6, 0x2
/* 0286BC 8002B6BC 4200FF2C */  bdnz      lbl_8002B5E8
lbl_8002B6C0:
/* 0286C0 8002B6C0 3A520001 */  addi      r18, r18, 0x1
/* 0286C4 8002B6C4 7C127800 */  cmpw      r18, r15
/* 0286C8 8002B6C8 40800060 */  bge       lbl_8002B728
/* 0286CC 8002B6CC 80010048 */  lwz       r0, 0x48(r1)
/* 0286D0 8002B6D0 7ED68A14 */  add       r22, r22, r17
/* 0286D4 8002B6D4 7C160000 */  cmpw      r22, r0
/* 0286D8 8002B6D8 40800010 */  bge       lbl_8002B6E8
/* 0286DC 8002B6DC 8001004C */  lwz       r0, 0x4c(r1)
/* 0286E0 8002B6E0 7C160000 */  cmpw      r22, r0
/* 0286E4 8002B6E4 40800040 */  bge       lbl_8002B724
lbl_8002B6E8:
/* 0286E8 8002B6E8 2C0E0000 */  cmpwi     r14, 0x0
/* 0286EC 8002B6EC 41820010 */  beq       lbl_8002B6FC
/* 0286F0 8002B6F0 7E3100D0 */  neg       r17, r17
/* 0286F4 8002B6F4 7ED68A14 */  add       r22, r22, r17
/* 0286F8 8002B6F8 48000030 */  b         lbl_8002B728
lbl_8002B6FC:
/* 0286FC 8002B6FC 7EC00E70 */  srawi     r0, r22, 1
/* 028700 8002B700 80610054 */  lwz       r3, 0x54(r1)
/* 028704 8002B704 7C000194 */  addze     r0, r0
/* 028708 8002B708 5400083C */  slwi      r0, r0, 1
/* 02870C 8002B70C 7C00B010 */  subfc     r0, r0, r22
/* 028710 8002B710 7C001800 */  cmpw      r0, r3
/* 028714 8002B714 40820008 */  bne       lbl_8002B71C
/* 028718 8002B718 6B390008 */  xori      r25, r25, 0x8
lbl_8002B71C:
/* 02871C 8002B71C 82C1004C */  lwz       r22, 0x4c(r1)
/* 028720 8002B720 48000008 */  b         lbl_8002B728
lbl_8002B724:
/* 028724 8002B724 6B390008 */  xori      r25, r25, 0x8
lbl_8002B728:
/* 028728 8002B728 80010044 */  lwz       r0, 0x44(r1)
/* 02872C 8002B72C 7C120000 */  cmpw      r18, r0
/* 028730 8002B730 4180FE68 */  blt       lbl_8002B598
/* 028734 8002B734 48000678 */  b         lbl_8002BDAC
lbl_8002B738:
/* 028738 8002B738 38600000 */  li        r3, 0x0
/* 02873C 8002B73C 48000690 */  b         lbl_8002BDCC
lbl_8002B740:
/* 028740 8002B740 2C000004 */  cmpwi     r0, 0x4
/* 028744 8002B744 40820460 */  bne       lbl_8002BBA4
/* 028748 8002B748 801A0000 */  lwz       r0, 0x0(r26)
/* 02874C 8002B74C 2C000001 */  cmpwi     r0, 0x1
/* 028750 8002B750 40820208 */  bne       lbl_8002B958
/* 028754 8002B754 38000001 */  li        r0, 0x1
/* 028758 8002B758 2C110000 */  cmpwi     r17, 0x0
/* 02875C 8002B75C 90010040 */  stw       r0, 0x40(r1)
/* 028760 8002B760 4182001C */  beq       lbl_8002B77C
/* 028764 8002B764 80100004 */  lwz       r0, 0x4(r16)
/* 028768 8002B768 80731C18 */  lwz       r3, 0x1c18(r19)
/* 02876C 8002B76C 5400043E */  clrlwi    r0, r0, 16
/* 028770 8002B770 54005828 */  slwi      r0, r0, 11
/* 028774 8002B774 7F030214 */  add       r24, r3, r0
/* 028778 8002B778 48000090 */  b         lbl_8002B808
lbl_8002B77C:
/* 02877C 8002B77C 38000001 */  li        r0, 0x1
/* 028780 8002B780 90100034 */  stw       r0, 0x34(r16)
/* 028784 8002B784 A8700010 */  lha       r3, 0x10(r16)
/* 028788 8002B788 5460077E */  clrlwi    r0, r3, 29
/* 02878C 8002B78C 2C000000 */  cmpwi     r0, 0x0
/* 028790 8002B790 41820010 */  beq       lbl_8002B7A0
/* 028794 8002B794 38030007 */  addi      r0, r3, 0x7
/* 028798 8002B798 54000038 */  clrrwi    r0, r0, 3
/* 02879C 8002B79C B0100010 */  sth       r0, 0x10(r16)
lbl_8002B7A0:
/* 0287A0 8002B7A0 A8700012 */  lha       r3, 0x12(r16)
/* 0287A4 8002B7A4 546007BE */  clrlwi    r0, r3, 30
/* 0287A8 8002B7A8 2C000000 */  cmpwi     r0, 0x0
/* 0287AC 8002B7AC 41820010 */  beq       lbl_8002B7BC
/* 0287B0 8002B7B0 38030003 */  addi      r0, r3, 0x3
/* 0287B4 8002B7B4 5400003A */  clrrwi    r0, r0, 2
/* 0287B8 8002B7B8 B0100012 */  sth       r0, 0x12(r16)
lbl_8002B7BC:
/* 0287BC 8002B7BC A8100010 */  lha       r0, 0x10(r16)
/* 0287C0 8002B7C0 38700004 */  addi      r3, r16, 0x4
/* 0287C4 8002B7C4 A8D00012 */  lha       r6, 0x12(r16)
/* 0287C8 8002B7C8 38931C38 */  addi      r4, r19, 0x1c38
/* 0287CC 8002B7CC 38A00030 */  li        r5, 0x30
/* 0287D0 8002B7D0 7CC031D6 */  mullw     r6, r0, r6
/* 0287D4 8002B7D4 380607FF */  addi      r0, r6, 0x7ff
/* 0287D8 8002B7D8 7C065E70 */  srawi     r6, r0, 11
/* 0287DC 8002B7DC 7CC60194 */  addze     r6, r6
/* 0287E0 8002B7E0 4BFF5575 */  bl        packTakeBlocks
/* 0287E4 8002B7E4 2C030000 */  cmpwi     r3, 0x0
/* 0287E8 8002B7E8 4082000C */  bne       lbl_8002B7F4
/* 0287EC 8002B7EC 38600000 */  li        r3, 0x0
/* 0287F0 8002B7F0 480005DC */  b         lbl_8002BDCC
lbl_8002B7F4:
/* 0287F4 8002B7F4 80100004 */  lwz       r0, 0x4(r16)
/* 0287F8 8002B7F8 80731C18 */  lwz       r3, 0x1c18(r19)
/* 0287FC 8002B7FC 5400043E */  clrlwi    r0, r0, 16
/* 028800 8002B800 54005828 */  slwi      r0, r0, 11
/* 028804 8002B804 7F030214 */  add       r24, r3, r0
lbl_8002B808:
/* 028808 8002B808 801A000C */  lwz       r0, 0xc(r26)
/* 02880C 8002B80C 38600000 */  li        r3, 0x0
/* 028810 8002B810 809A0004 */  lwz       r4, 0x4(r26)
/* 028814 8002B814 39800000 */  li        r12, 0x0
/* 028818 8002B818 54151838 */  slwi      r21, r0, 3
/* 02881C 8002B81C 54801838 */  slwi      r0, r4, 3
/* 028820 8002B820 AA900010 */  lha       r20, 0x10(r16)
/* 028824 8002B824 7C95E1D6 */  mullw     r4, r21, r28
/* 028828 8002B828 AA300012 */  lha       r17, 0x12(r16)
/* 02882C 8002B82C 7C120378 */  mr        r18, r0
/* 028830 8002B830 7E991E70 */  srawi     r25, r20, 3
/* 028834 8002B834 7E560E70 */  srawi     r22, r18, 1
/* 028838 8002B838 7ED60194 */  addze     r22, r22
/* 02883C 8002B83C 56D6083C */  slwi      r22, r22, 1
/* 028840 8002B840 7EF22214 */  add       r23, r18, r4
/* 028844 8002B844 7ED69010 */  subfc     r22, r22, r18
/* 028848 8002B848 48000004 */  b         lbl_8002B84C
lbl_8002B84C:
/* 02884C 8002B84C 48000004 */  b         lbl_8002B850
lbl_8002B850:
/* 028850 8002B850 480000FC */  b         lbl_8002B94C
lbl_8002B854:
/* 028854 8002B854 7D841670 */  srawi     r4, r12, 2
/* 028858 8002B858 7D24C9D6 */  mullw     r9, r4, r25
/* 02885C 8002B85C 558407BE */  clrlwi    r4, r12, 30
/* 028860 8002B860 5406053E */  clrlwi    r6, r0, 20
/* 028864 8002B864 54871838 */  slwi      r7, r4, 3
/* 028868 8002B868 38800000 */  li        r4, 0x0
/* 02886C 8002B86C 7C852378 */  mr        r5, r4
/* 028870 8002B870 7D733214 */  add       r11, r19, r6
/* 028874 8002B874 7D47C214 */  add       r10, r7, r24
/* 028878 8002B878 38C00001 */  li        r6, 0x1
/* 02887C 8002B87C 48000004 */  b         lbl_8002B880
lbl_8002B880:
/* 028880 8002B880 2C140000 */  cmpwi     r20, 0x0
/* 028884 8002B884 7E8903A6 */  mtctr     r20
/* 028888 8002B888 40810068 */  ble       lbl_8002B8F0
/* 02888C 8002B88C 48000004 */  b         lbl_8002B890
lbl_8002B890:
/* 028890 8002B890 7C04F000 */  cmpw      r4, r30
/* 028894 8002B894 4080003C */  bge       lbl_8002B8D0
/* 028898 8002B898 7CA71A78 */  xor       r7, r5, r3
/* 02889C 8002B89C 7CA53214 */  add       r5, r5, r6
/* 0288A0 8002B8A0 38E70C18 */  addi      r7, r7, 0xc18
/* 0288A4 8002B8A4 7C05D800 */  cmpw      r5, r27
/* 0288A8 8002B8A8 7FEB38AE */  lbzx      r31, r11, r7
/* 0288AC 8002B8AC 4080000C */  bge       lbl_8002B8B8
/* 0288B0 8002B8B0 2C050000 */  cmpwi     r5, 0x0
/* 0288B4 8002B8B4 4080001C */  bge       lbl_8002B8D0
lbl_8002B8B8:
/* 0288B8 8002B8B8 2C1D0000 */  cmpwi     r29, 0x0
/* 0288BC 8002B8BC 41820010 */  beq       lbl_8002B8CC
/* 0288C0 8002B8C0 7CC600D0 */  neg       r6, r6
/* 0288C4 8002B8C4 7CA53214 */  add       r5, r5, r6
/* 0288C8 8002B8C8 48000008 */  b         lbl_8002B8D0
lbl_8002B8CC:
/* 0288CC 8002B8CC 38A00000 */  li        r5, 0x0
lbl_8002B8D0:
/* 0288D0 8002B8D0 7C871E70 */  srawi     r7, r4, 3
/* 0288D4 8002B8D4 7D093A14 */  add       r8, r9, r7
/* 0288D8 8002B8D8 5487077E */  clrlwi    r7, r4, 29
/* 0288DC 8002B8DC 55082834 */  slwi      r8, r8, 5
/* 0288E0 8002B8E0 7CE83A14 */  add       r7, r8, r7
/* 0288E4 8002B8E4 7FEA39AE */  stbx      r31, r10, r7
/* 0288E8 8002B8E8 38840001 */  addi      r4, r4, 0x1
/* 0288EC 8002B8EC 4200FFA4 */  bdnz      lbl_8002B890
lbl_8002B8F0:
/* 0288F0 8002B8F0 398C0001 */  addi      r12, r12, 0x1
/* 0288F4 8002B8F4 7C0C7800 */  cmpw      r12, r15
/* 0288F8 8002B8F8 40800054 */  bge       lbl_8002B94C
/* 0288FC 8002B8FC 7C00AA14 */  add       r0, r0, r21
/* 028900 8002B900 7C00B800 */  cmpw      r0, r23
/* 028904 8002B904 4080000C */  bge       lbl_8002B910
/* 028908 8002B908 7C009000 */  cmpw      r0, r18
/* 02890C 8002B90C 4080003C */  bge       lbl_8002B948
lbl_8002B910:
/* 028910 8002B910 2C0E0000 */  cmpwi     r14, 0x0
/* 028914 8002B914 41820010 */  beq       lbl_8002B924
/* 028918 8002B918 7EB500D0 */  neg       r21, r21
/* 02891C 8002B91C 7C00AA14 */  add       r0, r0, r21
/* 028920 8002B920 4800002C */  b         lbl_8002B94C
lbl_8002B924:
/* 028924 8002B924 7C040E70 */  srawi     r4, r0, 1
/* 028928 8002B928 7C840194 */  addze     r4, r4
/* 02892C 8002B92C 5484083C */  slwi      r4, r4, 1
/* 028930 8002B930 7C840010 */  subfc     r4, r4, r0
/* 028934 8002B934 7C04B000 */  cmpw      r4, r22
/* 028938 8002B938 40820008 */  bne       lbl_8002B940
/* 02893C 8002B93C 68630004 */  xori      r3, r3, 0x4
lbl_8002B940:
/* 028940 8002B940 7E409378 */  mr        r0, r18
/* 028944 8002B944 48000008 */  b         lbl_8002B94C
lbl_8002B948:
/* 028948 8002B948 68630004 */  xori      r3, r3, 0x4
lbl_8002B94C:
/* 02894C 8002B94C 7C0C8800 */  cmpw      r12, r17
/* 028950 8002B950 4180FF04 */  blt       lbl_8002B854
/* 028954 8002B954 48000458 */  b         lbl_8002BDAC
lbl_8002B958:
/* 028958 8002B958 2C000000 */  cmpwi     r0, 0x0
/* 02895C 8002B95C 40820240 */  bne       lbl_8002BB9C
/* 028960 8002B960 38000001 */  li        r0, 0x1
/* 028964 8002B964 2C110000 */  cmpwi     r17, 0x0
/* 028968 8002B968 90010040 */  stw       r0, 0x40(r1)
/* 02896C 8002B96C 4182001C */  beq       lbl_8002B988
/* 028970 8002B970 80100004 */  lwz       r0, 0x4(r16)
/* 028974 8002B974 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028978 8002B978 5400043E */  clrlwi    r0, r0, 16
/* 02897C 8002B97C 54005828 */  slwi      r0, r0, 11
/* 028980 8002B980 7F030214 */  add       r24, r3, r0
/* 028984 8002B984 48000098 */  b         lbl_8002BA1C
lbl_8002B988:
/* 028988 8002B988 38000000 */  li        r0, 0x0
/* 02898C 8002B98C 90100034 */  stw       r0, 0x34(r16)
/* 028990 8002B990 A8700010 */  lha       r3, 0x10(r16)
/* 028994 8002B994 5460077E */  clrlwi    r0, r3, 29
/* 028998 8002B998 2C000000 */  cmpwi     r0, 0x0
/* 02899C 8002B99C 41820010 */  beq       lbl_8002B9AC
/* 0289A0 8002B9A0 38030007 */  addi      r0, r3, 0x7
/* 0289A4 8002B9A4 54000038 */  clrrwi    r0, r0, 3
/* 0289A8 8002B9A8 B0100010 */  sth       r0, 0x10(r16)
lbl_8002B9AC:
/* 0289AC 8002B9AC A8700012 */  lha       r3, 0x12(r16)
/* 0289B0 8002B9B0 5460077E */  clrlwi    r0, r3, 29
/* 0289B4 8002B9B4 2C000000 */  cmpwi     r0, 0x0
/* 0289B8 8002B9B8 41820010 */  beq       lbl_8002B9C8
/* 0289BC 8002B9BC 38030007 */  addi      r0, r3, 0x7
/* 0289C0 8002B9C0 54000038 */  clrrwi    r0, r0, 3
/* 0289C4 8002B9C4 B0100012 */  sth       r0, 0x12(r16)
lbl_8002B9C8:
/* 0289C8 8002B9C8 A8B00010 */  lha       r5, 0x10(r16)
/* 0289CC 8002B9CC 38700004 */  addi      r3, r16, 0x4
/* 0289D0 8002B9D0 A8D00012 */  lha       r6, 0x12(r16)
/* 0289D4 8002B9D4 38931C38 */  addi      r4, r19, 0x1c38
/* 0289D8 8002B9D8 38050001 */  addi      r0, r5, 0x1
/* 0289DC 8002B9DC 7C000E70 */  srawi     r0, r0, 1
/* 0289E0 8002B9E0 7CA031D6 */  mullw     r5, r0, r6
/* 0289E4 8002B9E4 380507FF */  addi      r0, r5, 0x7ff
/* 0289E8 8002B9E8 7C065E70 */  srawi     r6, r0, 11
/* 0289EC 8002B9EC 7CC60194 */  addze     r6, r6
/* 0289F0 8002B9F0 38A00030 */  li        r5, 0x30
/* 0289F4 8002B9F4 4BFF5361 */  bl        packTakeBlocks
/* 0289F8 8002B9F8 2C030000 */  cmpwi     r3, 0x0
/* 0289FC 8002B9FC 4082000C */  bne       lbl_8002BA08
/* 028A00 8002BA00 38600000 */  li        r3, 0x0
/* 028A04 8002BA04 480003C8 */  b         lbl_8002BDCC
lbl_8002BA08:
/* 028A08 8002BA08 80100004 */  lwz       r0, 0x4(r16)
/* 028A0C 8002BA0C 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028A10 8002BA10 5400043E */  clrlwi    r0, r0, 16
/* 028A14 8002BA14 54005828 */  slwi      r0, r0, 11
/* 028A18 8002BA18 7F030214 */  add       r24, r3, r0
lbl_8002BA1C:
/* 028A1C 8002BA1C 801A000C */  lwz       r0, 0xc(r26)
/* 028A20 8002BA20 39200000 */  li        r9, 0x0
/* 028A24 8002BA24 807A0004 */  lwz       r3, 0x4(r26)
/* 028A28 8002BA28 3AE00000 */  li        r23, 0x0
/* 028A2C 8002BA2C 54141838 */  slwi      r20, r0, 3
/* 028A30 8002BA30 546A1838 */  slwi      r10, r3, 3
/* 028A34 8002BA34 AAB00010 */  lha       r21, 0x10(r16)
/* 028A38 8002BA38 7C14E1D6 */  mullw     r0, r20, r28
/* 028A3C 8002BA3C AAD00012 */  lha       r22, 0x12(r16)
/* 028A40 8002BA40 7D525378 */  mr        r18, r10
/* 028A44 8002BA44 7EBC1E70 */  srawi     r28, r21, 3
/* 028A48 8002BA48 7E510E70 */  srawi     r17, r18, 1
/* 028A4C 8002BA4C 7E310194 */  addze     r17, r17
/* 028A50 8002BA50 5631083C */  slwi      r17, r17, 1
/* 028A54 8002BA54 7F520214 */  add       r26, r18, r0
/* 028A58 8002BA58 7E319010 */  subfc     r17, r17, r18
/* 028A5C 8002BA5C 48000004 */  b         lbl_8002BA60
lbl_8002BA60:
/* 028A60 8002BA60 48000004 */  b         lbl_8002BA64
lbl_8002BA64:
/* 028A64 8002BA64 4800012C */  b         lbl_8002BB90
lbl_8002BA68:
/* 028A68 8002BA68 7EE01E70 */  srawi     r0, r23, 3
/* 028A6C 8002BA6C 7D60E1D6 */  mullw     r11, r0, r28
/* 028A70 8002BA70 38C00000 */  li        r6, 0x0
/* 028A74 8002BA74 56E0077E */  clrlwi    r0, r23, 29
/* 028A78 8002BA78 5543053E */  clrlwi    r3, r10, 20
/* 028A7C 8002BA7C 5400103A */  slwi      r0, r0, 2
/* 028A80 8002BA80 7CC73378 */  mr        r7, r6
/* 028A84 8002BA84 7CC53378 */  mr        r5, r6
/* 028A88 8002BA88 7F331A14 */  add       r25, r19, r3
/* 028A8C 8002BA8C 7D80C214 */  add       r12, r0, r24
/* 028A90 8002BA90 39000002 */  li        r8, 0x2
/* 028A94 8002BA94 48000004 */  b         lbl_8002BA98
lbl_8002BA98:
/* 028A98 8002BA98 38150001 */  addi      r0, r21, 0x1
/* 028A9C 8002BA9C 5400F87E */  srwi      r0, r0, 1
/* 028AA0 8002BAA0 2C150000 */  cmpwi     r21, 0x0
/* 028AA4 8002BAA4 7C0903A6 */  mtctr     r0
/* 028AA8 8002BAA8 4081008C */  ble       lbl_8002BB34
/* 028AAC 8002BAAC 48000004 */  b         lbl_8002BAB0
lbl_8002BAB0:
/* 028AB0 8002BAB0 7C06F000 */  cmpw      r6, r30
/* 028AB4 8002BAB4 40800058 */  bge       lbl_8002BB0C
/* 028AB8 8002BAB8 7CE04A78 */  xor       r0, r7, r9
/* 028ABC 8002BABC 7C030E70 */  srawi     r3, r0, 1
/* 028AC0 8002BAC0 38030C18 */  addi      r0, r3, 0xc18
/* 028AC4 8002BAC4 2C080000 */  cmpwi     r8, 0x0
/* 028AC8 8002BAC8 7FF900AE */  lbzx      r31, r25, r0
/* 028ACC 8002BACC 7CE74214 */  add       r7, r7, r8
/* 028AD0 8002BAD0 40800014 */  bge       lbl_8002BAE4
/* 028AD4 8002BAD4 7FE02670 */  srawi     r0, r31, 4
/* 028AD8 8002BAD8 57E32036 */  slwi      r3, r31, 4
/* 028ADC 8002BADC 7C001B78 */  or        r0, r0, r3
/* 028AE0 8002BAE0 541F063E */  clrlwi    r31, r0, 24
lbl_8002BAE4:
/* 028AE4 8002BAE4 7C07D800 */  cmpw      r7, r27
/* 028AE8 8002BAE8 4080000C */  bge       lbl_8002BAF4
/* 028AEC 8002BAEC 2C070000 */  cmpwi     r7, 0x0
/* 028AF0 8002BAF0 4080001C */  bge       lbl_8002BB0C
lbl_8002BAF4:
/* 028AF4 8002BAF4 2C1D0000 */  cmpwi     r29, 0x0
/* 028AF8 8002BAF8 41820010 */  beq       lbl_8002BB08
/* 028AFC 8002BAFC 7D0800D0 */  neg       r8, r8
/* 028B00 8002BB00 7CE74214 */  add       r7, r7, r8
/* 028B04 8002BB04 48000008 */  b         lbl_8002BB0C
lbl_8002BB08:
/* 028B08 8002BB08 38E00000 */  li        r7, 0x0
lbl_8002BB0C:
/* 028B0C 8002BB0C 7CC01E70 */  srawi     r0, r6, 3
/* 028B10 8002BB10 7C6B0214 */  add       r3, r11, r0
/* 028B14 8002BB14 54A007BE */  clrlwi    r0, r5, 30
/* 028B18 8002BB18 54632834 */  slwi      r3, r3, 5
/* 028B1C 8002BB1C 57E4063E */  clrlwi    r4, r31, 24
/* 028B20 8002BB20 7C030214 */  add       r0, r3, r0
/* 028B24 8002BB24 7C8C01AE */  stbx      r4, r12, r0
/* 028B28 8002BB28 38A50001 */  addi      r5, r5, 0x1
/* 028B2C 8002BB2C 38C60002 */  addi      r6, r6, 0x2
/* 028B30 8002BB30 4200FF80 */  bdnz      lbl_8002BAB0
lbl_8002BB34:
/* 028B34 8002BB34 3AF70001 */  addi      r23, r23, 0x1
/* 028B38 8002BB38 7C177800 */  cmpw      r23, r15
/* 028B3C 8002BB3C 40800054 */  bge       lbl_8002BB90
/* 028B40 8002BB40 7D4AA214 */  add       r10, r10, r20
/* 028B44 8002BB44 7C0AD000 */  cmpw      r10, r26
/* 028B48 8002BB48 4080000C */  bge       lbl_8002BB54
/* 028B4C 8002BB4C 7C0A9000 */  cmpw      r10, r18
/* 028B50 8002BB50 4080003C */  bge       lbl_8002BB8C
lbl_8002BB54:
/* 028B54 8002BB54 2C0E0000 */  cmpwi     r14, 0x0
/* 028B58 8002BB58 41820010 */  beq       lbl_8002BB68
/* 028B5C 8002BB5C 7E9400D0 */  neg       r20, r20
/* 028B60 8002BB60 7D4AA214 */  add       r10, r10, r20
/* 028B64 8002BB64 4800002C */  b         lbl_8002BB90
lbl_8002BB68:
/* 028B68 8002BB68 7D400E70 */  srawi     r0, r10, 1
/* 028B6C 8002BB6C 7C000194 */  addze     r0, r0
/* 028B70 8002BB70 5400083C */  slwi      r0, r0, 1
/* 028B74 8002BB74 7C005010 */  subfc     r0, r0, r10
/* 028B78 8002BB78 7C008800 */  cmpw      r0, r17
/* 028B7C 8002BB7C 40820008 */  bne       lbl_8002BB84
/* 028B80 8002BB80 69290008 */  xori      r9, r9, 0x8
lbl_8002BB84:
/* 028B84 8002BB84 7E4A9378 */  mr        r10, r18
/* 028B88 8002BB88 48000008 */  b         lbl_8002BB90
lbl_8002BB8C:
/* 028B8C 8002BB8C 69290008 */  xori      r9, r9, 0x8
lbl_8002BB90:
/* 028B90 8002BB90 7C17B000 */  cmpw      r23, r22
/* 028B94 8002BB94 4180FED4 */  blt       lbl_8002BA68
/* 028B98 8002BB98 48000214 */  b         lbl_8002BDAC
lbl_8002BB9C:
/* 028B9C 8002BB9C 38600000 */  li        r3, 0x0
/* 028BA0 8002BBA0 4800022C */  b         lbl_8002BDCC
lbl_8002BBA4:
/* 028BA4 8002BBA4 2C000001 */  cmpwi     r0, 0x1
/* 028BA8 8002BBA8 40820204 */  bne       lbl_8002BDAC
/* 028BAC 8002BBAC 38000002 */  li        r0, 0x2
/* 028BB0 8002BBB0 2C110000 */  cmpwi     r17, 0x0
/* 028BB4 8002BBB4 90010040 */  stw       r0, 0x40(r1)
/* 028BB8 8002BBB8 4182001C */  beq       lbl_8002BBD4
/* 028BBC 8002BBBC 80100004 */  lwz       r0, 0x4(r16)
/* 028BC0 8002BBC0 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028BC4 8002BBC4 5400043E */  clrlwi    r0, r0, 16
/* 028BC8 8002BBC8 54005828 */  slwi      r0, r0, 11
/* 028BCC 8002BBCC 7F030214 */  add       r24, r3, r0
/* 028BD0 8002BBD0 48000094 */  b         lbl_8002BC64
lbl_8002BBD4:
/* 028BD4 8002BBD4 38000005 */  li        r0, 0x5
/* 028BD8 8002BBD8 90100034 */  stw       r0, 0x34(r16)
/* 028BDC 8002BBDC A8700010 */  lha       r3, 0x10(r16)
/* 028BE0 8002BBE0 546007BE */  clrlwi    r0, r3, 30
/* 028BE4 8002BBE4 2C000000 */  cmpwi     r0, 0x0
/* 028BE8 8002BBE8 41820010 */  beq       lbl_8002BBF8
/* 028BEC 8002BBEC 38030003 */  addi      r0, r3, 0x3
/* 028BF0 8002BBF0 5400003A */  clrrwi    r0, r0, 2
/* 028BF4 8002BBF4 B0100010 */  sth       r0, 0x10(r16)
lbl_8002BBF8:
/* 028BF8 8002BBF8 A8700012 */  lha       r3, 0x12(r16)
/* 028BFC 8002BBFC 546007BE */  clrlwi    r0, r3, 30
/* 028C00 8002BC00 2C000000 */  cmpwi     r0, 0x0
/* 028C04 8002BC04 41820010 */  beq       lbl_8002BC14
/* 028C08 8002BC08 38030003 */  addi      r0, r3, 0x3
/* 028C0C 8002BC0C 5400003A */  clrrwi    r0, r0, 2
/* 028C10 8002BC10 B0100012 */  sth       r0, 0x12(r16)
lbl_8002BC14:
/* 028C14 8002BC14 A8D00010 */  lha       r6, 0x10(r16)
/* 028C18 8002BC18 38700004 */  addi      r3, r16, 0x4
/* 028C1C 8002BC1C A8100012 */  lha       r0, 0x12(r16)
/* 028C20 8002BC20 38931C38 */  addi      r4, r19, 0x1c38
/* 028C24 8002BC24 38A00030 */  li        r5, 0x30
/* 028C28 8002BC28 7C0601D6 */  mullw     r0, r6, r0
/* 028C2C 8002BC2C 5406083C */  slwi      r6, r0, 1
/* 028C30 8002BC30 380607FF */  addi      r0, r6, 0x7ff
/* 028C34 8002BC34 7C065E70 */  srawi     r6, r0, 11
/* 028C38 8002BC38 7CC60194 */  addze     r6, r6
/* 028C3C 8002BC3C 4BFF5119 */  bl        packTakeBlocks
/* 028C40 8002BC40 2C030000 */  cmpwi     r3, 0x0
/* 028C44 8002BC44 4082000C */  bne       lbl_8002BC50
/* 028C48 8002BC48 38600000 */  li        r3, 0x0
/* 028C4C 8002BC4C 48000180 */  b         lbl_8002BDCC
lbl_8002BC50:
/* 028C50 8002BC50 80100004 */  lwz       r0, 0x4(r16)
/* 028C54 8002BC54 80731C18 */  lwz       r3, 0x1c18(r19)
/* 028C58 8002BC58 5400043E */  clrlwi    r0, r0, 16
/* 028C5C 8002BC5C 54005828 */  slwi      r0, r0, 11
/* 028C60 8002BC60 7F030214 */  add       r24, r3, r0
lbl_8002BC64:
/* 028C64 8002BC64 801A0004 */  lwz       r0, 0x4(r26)
/* 028C68 8002BC68 3B600000 */  li        r27, 0x0
/* 028C6C 8002BC6C 807A000C */  lwz       r3, 0xc(r26)
/* 028C70 8002BC70 7DEF0E70 */  srawi     r15, r15, 1
/* 028C74 8002BC74 A8900010 */  lha       r4, 0x10(r16)
/* 028C78 8002BC78 7F72DB78 */  mr        r18, r27
/* 028C7C 8002BC7C 7F71DB78 */  mr        r17, r27
/* 028C80 8002BC80 5415103A */  slwi      r21, r0, 2
/* 028C84 8002BC84 546E103A */  slwi      r14, r3, 2
/* 028C88 8002BC88 7C941670 */  srawi     r20, r4, 2
/* 028C8C 8002BC8C 48000004 */  b         lbl_8002BC90
lbl_8002BC90:
/* 028C90 8002BC90 48000004 */  b         lbl_8002BC94
lbl_8002BC94:
/* 028C94 8002BC94 48000110 */  b         lbl_8002BDA4
lbl_8002BC98:
/* 028C98 8002BC98 7E401670 */  srawi     r0, r18, 2
/* 028C9C 8002BC9C 7F40A1D6 */  mullw     r26, r0, r20
/* 028CA0 8002BCA0 564007BE */  clrlwi    r0, r18, 30
/* 028CA4 8002BCA4 5419103A */  slwi      r25, r0, 2
/* 028CA8 8002BCA8 3BA00000 */  li        r29, 0x0
/* 028CAC 8002BCAC 48000004 */  b         lbl_8002BCB0
lbl_8002BCB0:
/* 028CB0 8002BCB0 7ED1AA14 */  add       r22, r17, r21
/* 028CB4 8002BCB4 48000004 */  b         lbl_8002BCB8
lbl_8002BCB8:
/* 028CB8 8002BCB8 480000D8 */  b         lbl_8002BD90
lbl_8002BCBC:
/* 028CBC 8002BCBC 7FA0DA78 */  xor       r0, r29, r27
/* 028CC0 8002BCC0 7C00B214 */  add       r0, r0, r22
/* 028CC4 8002BCC4 5400083C */  slwi      r0, r0, 1
/* 028CC8 8002BCC8 7CB30214 */  add       r5, r19, r0
/* 028CCC 8002BCCC A3E50C18 */  lhz       r31, 0xc18(r5)
/* 028CD0 8002BCD0 38610018 */  addi      r3, r1, 0x18
/* 028CD4 8002BCD4 38810024 */  addi      r4, r1, 0x24
/* 028CD8 8002BCD8 57E0063E */  clrlwi    r0, r31, 24
/* 028CDC 8002BCDC 90010018 */  stw       r0, 0x18(r1)
/* 028CE0 8002BCE0 57E0C63E */  extrwi    r0, r31, 8, 16
/* 028CE4 8002BCE4 9001001C */  stw       r0, 0x1c(r1)
/* 028CE8 8002BCE8 A3850C1A */  lhz       r28, 0xc1a(r5)
/* 028CEC 8002BCEC 5780C63E */  extrwi    r0, r28, 8, 16
/* 028CF0 8002BCF0 90010020 */  stw       r0, 0x20(r1)
/* 028CF4 8002BCF4 4BFF512D */  bl        frameConvertYUVtoRGB
/* 028CF8 8002BCF8 7FA41670 */  srawi     r4, r29, 2
/* 028CFC 8002BCFC 80610024 */  lwz       r3, 0x24(r1)
/* 028D00 8002BD00 80010028 */  lwz       r0, 0x28(r1)
/* 028D04 8002BD04 7CBA2214 */  add       r5, r26, r4
/* 028D08 8002BD08 5463FF3E */  extrwi    r3, r3, 4, 27
/* 028D0C 8002BD0C 8081002C */  lwz       r4, 0x2c(r1)
/* 028D10 8002BD10 5400FF3E */  extrwi    r0, r0, 4, 27
/* 028D14 8002BD14 54A52036 */  slwi      r5, r5, 4
/* 028D18 8002BD18 5463402E */  slwi      r3, r3, 8
/* 028D1C 8002BD1C 54002036 */  slwi      r0, r0, 4
/* 028D20 8002BD20 57A607BE */  clrlwi    r6, r29, 30
/* 028D24 8002BD24 7CB92A14 */  add       r5, r25, r5
/* 028D28 8002BD28 7CA62A14 */  add       r5, r6, r5
/* 028D2C 8002BD2C 54A5083C */  slwi      r5, r5, 1
/* 028D30 8002BD30 5484FF3E */  extrwi    r4, r4, 4, 27
/* 028D34 8002BD34 7C600378 */  or        r0, r3, r0
/* 028D38 8002BD38 7C800378 */  or        r0, r4, r0
/* 028D3C 8002BD3C 60007000 */  ori       r0, r0, 0x7000
/* 028D40 8002BD40 7FF82A14 */  add       r31, r24, r5
/* 028D44 8002BD44 B01F0000 */  sth       r0, 0x0(r31)
/* 028D48 8002BD48 5780063E */  clrlwi    r0, r28, 24
/* 028D4C 8002BD4C 38610018 */  addi      r3, r1, 0x18
/* 028D50 8002BD50 90010018 */  stw       r0, 0x18(r1)
/* 028D54 8002BD54 38810024 */  addi      r4, r1, 0x24
/* 028D58 8002BD58 4BFF50C9 */  bl        frameConvertYUVtoRGB
/* 028D5C 8002BD5C 80010024 */  lwz       r0, 0x24(r1)
/* 028D60 8002BD60 3BBD0002 */  addi      r29, r29, 0x2
/* 028D64 8002BD64 80610028 */  lwz       r3, 0x28(r1)
/* 028D68 8002BD68 5404FF3E */  extrwi    r4, r0, 4, 27
/* 028D6C 8002BD6C 8001002C */  lwz       r0, 0x2c(r1)
/* 028D70 8002BD70 5463FF3E */  extrwi    r3, r3, 4, 27
/* 028D74 8002BD74 5484402E */  slwi      r4, r4, 8
/* 028D78 8002BD78 54632036 */  slwi      r3, r3, 4
/* 028D7C 8002BD7C 5400FF3E */  extrwi    r0, r0, 4, 27
/* 028D80 8002BD80 7C831B78 */  or        r3, r4, r3
/* 028D84 8002BD84 7C001B78 */  or        r0, r0, r3
/* 028D88 8002BD88 60007000 */  ori       r0, r0, 0x7000
/* 028D8C 8002BD8C B01F0002 */  sth       r0, 0x2(r31)
lbl_8002BD90:
/* 028D90 8002BD90 7C1DF000 */  cmpw      r29, r30
/* 028D94 8002BD94 4180FF28 */  blt       lbl_8002BCBC
/* 028D98 8002BD98 6B7B0002 */  xori      r27, r27, 0x2
/* 028D9C 8002BD9C 7E317214 */  add       r17, r17, r14
/* 028DA0 8002BDA0 3A520001 */  addi      r18, r18, 0x1
lbl_8002BDA4:
/* 028DA4 8002BDA4 7C127800 */  cmpw      r18, r15
/* 028DA8 8002BDA8 4180FEF0 */  blt       lbl_8002BC98
lbl_8002BDAC:
/* 028DAC 8002BDAC A8900010 */  lha       r4, 0x10(r16)
/* 028DB0 8002BDB0 7F03C378 */  mr        r3, r24
/* 028DB4 8002BDB4 A8100012 */  lha       r0, 0x12(r16)
/* 028DB8 8002BDB8 7C8401D6 */  mullw     r4, r4, r0
/* 028DBC 8002BDBC 80010040 */  lwz       r0, 0x40(r1)
/* 028DC0 8002BDC0 7C8021D6 */  mullw     r4, r0, r4
/* 028DC4 8002BDC4 48070F31 */  bl        DCStoreRange
/* 028DC8 8002BDC8 38600001 */  li        r3, 0x1
lbl_8002BDCC:
/* 028DCC 8002BDCC B9C10060 */  lmw       r14, 0x60(r1)
/* 028DD0 8002BDD0 800100AC */  lwz       r0, 0xac(r1)
/* 028DD4 8002BDD4 382100A8 */  addi      r1, r1, 0xa8
/* 028DD8 8002BDD8 7C0803A6 */  mtlr      r0
/* 028DDC 8002BDDC 4E800020 */  blr

glabel frameMakeTLUT
/* 028DE0 8002BDE0 7C0802A6 */  mflr      r0
/* 028DE4 8002BDE4 90010004 */  stw       r0, 0x4(r1)
/* 028DE8 8002BDE8 9421FFD0 */  stwu      r1, -0x30(r1)
/* 028DEC 8002BDEC 93E1002C */  stw       r31, 0x2c(r1)
/* 028DF0 8002BDF0 93C10028 */  stw       r30, 0x28(r1)
/* 028DF4 8002BDF4 93A10024 */  stw       r29, 0x24(r1)
/* 028DF8 8002BDF8 93810020 */  stw       r28, 0x20(r1)
/* 028DFC 8002BDFC 7C7D1B78 */  mr        r29, r3
/* 028E00 8002BE00 7C9C2378 */  mr        r28, r4
/* 028E04 8002BE04 7CBE2B78 */  mr        r30, r5
/* 028E08 8002BE08 7CDF3378 */  mr        r31, r6
/* 028E0C 8002BE0C 2C070000 */  cmpwi     r7, 0x0
/* 028E10 8002BE10 4182002C */  beq       lbl_8002BE3C
/* 028E14 8002BE14 801C0008 */  lwz       r0, 0x8(r28)
/* 028E18 8002BE18 2C00FFFF */  cmpwi     r0, -0x1
/* 028E1C 8002BE1C 4082000C */  bne       lbl_8002BE28
/* 028E20 8002BE20 38600001 */  li        r3, 0x1
/* 028E24 8002BE24 48000108 */  b         lbl_8002BF2C
lbl_8002BE28:
/* 028E28 8002BE28 5400043E */  clrlwi    r0, r0, 16
/* 028E2C 8002BE2C 807D1C1C */  lwz       r3, 0x1c1c(r29)
/* 028E30 8002BE30 54002834 */  slwi      r0, r0, 5
/* 028E34 8002BE34 7C630214 */  add       r3, r3, r0
/* 028E38 8002BE38 48000040 */  b         lbl_8002BE78
lbl_8002BE3C:
/* 028E3C 8002BE3C 57C0083C */  slwi      r0, r30, 1
/* 028E40 8002BE40 387C0008 */  addi      r3, r28, 0x8
/* 028E44 8002BE44 389D1CF8 */  addi      r4, r29, 0x1cf8
/* 028E48 8002BE48 5406D97E */  srwi      r6, r0, 5
/* 028E4C 8002BE4C 38A00140 */  li        r5, 0x140
/* 028E50 8002BE50 4BFF4F05 */  bl        packTakeBlocks
/* 028E54 8002BE54 2C030000 */  cmpwi     r3, 0x0
/* 028E58 8002BE58 4082000C */  bne       lbl_8002BE64
/* 028E5C 8002BE5C 38600000 */  li        r3, 0x0
/* 028E60 8002BE60 480000CC */  b         lbl_8002BF2C
lbl_8002BE64:
/* 028E64 8002BE64 801C0008 */  lwz       r0, 0x8(r28)
/* 028E68 8002BE68 807D1C1C */  lwz       r3, 0x1c1c(r29)
/* 028E6C 8002BE6C 5400043E */  clrlwi    r0, r0, 16
/* 028E70 8002BE70 54002834 */  slwi      r0, r0, 5
/* 028E74 8002BE74 7C630214 */  add       r3, r3, r0
lbl_8002BE78:
/* 028E78 8002BE78 7C641B78 */  mr        r4, r3
/* 028E7C 8002BE7C 38A00000 */  li        r5, 0x0
/* 028E80 8002BE80 48000004 */  b         lbl_8002BE84
lbl_8002BE84:
/* 028E84 8002BE84 2C1E0000 */  cmpwi     r30, 0x0
/* 028E88 8002BE88 7FC903A6 */  mtctr     r30
/* 028E8C 8002BE8C 3CC00001 */  lis       r6, 0x1
/* 028E90 8002BE90 3906FFFF */  subi      r8, r6, 0x1
/* 028E94 8002BE94 4081008C */  ble       lbl_8002BF20
/* 028E98 8002BE98 48000004 */  b         lbl_8002BE9C
lbl_8002BE9C:
/* 028E9C 8002BE9C 7CDF2A14 */  add       r6, r31, r5
/* 028EA0 8002BEA0 38060100 */  addi      r0, r6, 0x100
/* 028EA4 8002BEA4 54061838 */  slwi      r6, r0, 3
/* 028EA8 8002BEA8 38060C18 */  addi      r0, r6, 0xc18
/* 028EAC 8002BEAC 7CDD0214 */  add       r6, r29, r0
/* 028EB0 8002BEB0 80C60004 */  lwz       r6, 0x4(r6)
/* 028EB4 8002BEB4 7CC04038 */  and       r0, r6, r8
/* 028EB8 8002BEB8 5407043E */  clrlwi    r7, r0, 16
/* 028EBC 8002BEBC 54E007FE */  clrlwi    r0, r7, 31
/* 028EC0 8002BEC0 2C000000 */  cmpwi     r0, 0x0
/* 028EC4 8002BEC4 4182002C */  beq       lbl_8002BEF0
/* 028EC8 8002BEC8 54E6AEFE */  extrwi    r6, r7, 5, 16
/* 028ECC 8002BECC 54E0D6FE */  extrwi    r0, r7, 5, 21
/* 028ED0 8002BED0 54C6502A */  slwi      r6, r6, 10
/* 028ED4 8002BED4 54002834 */  slwi      r0, r0, 5
/* 028ED8 8002BED8 54E7FEFE */  extrwi    r7, r7, 5, 26
/* 028EDC 8002BEDC 7CC00378 */  or        r0, r6, r0
/* 028EE0 8002BEE0 7CE00378 */  or        r0, r7, r0
/* 028EE4 8002BEE4 60008000 */  ori       r0, r0, 0x8000
/* 028EE8 8002BEE8 B0040000 */  sth       r0, 0x0(r4)
/* 028EEC 8002BEEC 48000028 */  b         lbl_8002BF14
lbl_8002BEF0:
/* 028EF0 8002BEF0 54E6A73E */  extrwi    r6, r7, 4, 16
/* 028EF4 8002BEF4 54E0CF3E */  extrwi    r0, r7, 4, 21
/* 028EF8 8002BEF8 54C6402E */  slwi      r6, r6, 8
/* 028EFC 8002BEFC 54002036 */  slwi      r0, r0, 4
/* 028F00 8002BF00 54E7F73E */  extrwi    r7, r7, 4, 26
/* 028F04 8002BF04 7CC00378 */  or        r0, r6, r0
/* 028F08 8002BF08 7CE00378 */  or        r0, r7, r0
/* 028F0C 8002BF0C 5400043E */  clrlwi    r0, r0, 16
/* 028F10 8002BF10 B0040000 */  sth       r0, 0x0(r4)
lbl_8002BF14:
/* 028F14 8002BF14 38840002 */  addi      r4, r4, 0x2
/* 028F18 8002BF18 38A50001 */  addi      r5, r5, 0x1
/* 028F1C 8002BF1C 4200FF80 */  bdnz      lbl_8002BE9C
lbl_8002BF20:
/* 028F20 8002BF20 57C4083C */  slwi      r4, r30, 1
/* 028F24 8002BF24 48070DD1 */  bl        DCStoreRange
/* 028F28 8002BF28 38600001 */  li        r3, 0x1
lbl_8002BF2C:
/* 028F2C 8002BF2C 80010034 */  lwz       r0, 0x34(r1)
/* 028F30 8002BF30 83E1002C */  lwz       r31, 0x2c(r1)
/* 028F34 8002BF34 83C10028 */  lwz       r30, 0x28(r1)
/* 028F38 8002BF38 7C0803A6 */  mtlr      r0
/* 028F3C 8002BF3C 83A10024 */  lwz       r29, 0x24(r1)
/* 028F40 8002BF40 83810020 */  lwz       r28, 0x20(r1)
/* 028F44 8002BF44 38210030 */  addi      r1, r1, 0x30
/* 028F48 8002BF48 4E800020 */  blr

glabel frameDrawDone
/* 028F4C 8002BF4C 7C0802A6 */  mflr      r0
/* 028F50 8002BF50 90010004 */  stw       r0, 0x4(r1)
/* 028F54 8002BF54 9421FFF0 */  stwu      r1, -0x10(r1)
/* 028F58 8002BF58 93E1000C */  stw       r31, 0xc(r1)
/* 028F5C 8002BF5C 800D8998 */  lwz       r0, D_8018B918@sda21(r0)
/* 028F60 8002BF60 2C000000 */  cmpwi     r0, 0x0
/* 028F64 8002BF64 41820050 */  beq       lbl_8002BFB4
/* 028F68 8002BF68 800D89CC */  lwz       r0, D_8018B94C@sda21(r0)
/* 028F6C 8002BF6C 3BE00000 */  li        r31, 0x0
/* 028F70 8002BF70 93ED8998 */  stw       r31, D_8018B918@sda21(r0)
/* 028F74 8002BF74 2C000000 */  cmpwi     r0, 0x0
/* 028F78 8002BF78 40820034 */  bne       lbl_8002BFAC
/* 028F7C 8002BF7C 806D8D48 */  lwz       r3, DemoCurrentBuffer@sda21(r0)
/* 028F80 8002BF80 4807A549 */  bl        VISetNextFrameBuffer
/* 028F84 8002BF84 4807A415 */  bl        VIFlush
/* 028F88 8002BF88 800D8D48 */  lwz       r0, DemoCurrentBuffer@sda21(r0)
/* 028F8C 8002BF8C 806D8D50 */  lwz       r3, DemoFrameBuffer1@sda21(r0)
/* 028F90 8002BF90 7C001840 */  cmplw     r0, r3
/* 028F94 8002BF94 40820010 */  bne       lbl_8002BFA4
/* 028F98 8002BF98 800D8D4C */  lwz       r0, DemoFrameBuffer2@sda21(r0)
/* 028F9C 8002BF9C 900D8D48 */  stw       r0, DemoCurrentBuffer@sda21(r0)
/* 028FA0 8002BFA0 48000014 */  b         lbl_8002BFB4
lbl_8002BFA4:
/* 028FA4 8002BFA4 906D8D48 */  stw       r3, DemoCurrentBuffer@sda21(r0)
/* 028FA8 8002BFA8 4800000C */  b         lbl_8002BFB4
lbl_8002BFAC:
/* 028FAC 8002BFAC 4807A3ED */  bl        VIFlush
/* 028FB0 8002BFB0 93ED89CC */  stw       r31, D_8018B94C@sda21(r0)
lbl_8002BFB4:
/* 028FB4 8002BFB4 80010014 */  lwz       r0, 0x14(r1)
/* 028FB8 8002BFB8 83E1000C */  lwz       r31, 0xc(r1)
/* 028FBC 8002BFBC 38210010 */  addi      r1, r1, 0x10
/* 028FC0 8002BFC0 7C0803A6 */  mtlr      r0
/* 028FC4 8002BFC4 4E800020 */  blr

glabel frameDrawSyncCallback
/* 028FC8 8002BFC8 5460043E */  clrlwi    r0, r3, 16
/* 028FCC 8002BFCC 28007D00 */  cmplwi    r0, 0x7d00
/* 028FD0 8002BFD0 4082000C */  bne       lbl_8002BFDC
/* 028FD4 8002BFD4 38000001 */  li        r0, 0x1
/* 028FD8 8002BFD8 900D89B4 */  stw       r0, D_8018B934@sda21(r0)
lbl_8002BFDC:
/* 028FDC 8002BFDC 4E800020 */  blr

glabel frameDrawSetupFog_Default
/* 028FE0 8002BFE0 7C0802A6 */  mflr      r0
/* 028FE4 8002BFE4 90010004 */  stw       r0, 0x4(r1)
/* 028FE8 8002BFE8 9421FF50 */  stwu      r1, -0xb0(r1)
/* 028FEC 8002BFEC DBE100A8 */  stfd      f31, 0xa8(r1)
/* 028FF0 8002BFF0 DBC100A0 */  stfd      f30, 0xa0(r1)
/* 028FF4 8002BFF4 DBA10098 */  stfd      f29, 0x98(r1)
/* 028FF8 8002BFF8 DB810090 */  stfd      f28, 0x90(r1)
/* 028FFC 8002BFFC 93E1008C */  stw       r31, 0x8c(r1)
/* 029000 8002C000 7C7F1B78 */  mr        r31, r3
/* 029004 8002C004 801F0090 */  lwz       r0, 0x90(r31)
/* 029008 8002C008 3C7F0004 */  addis     r3, r31, 0x4
/* 02900C 8002C00C 80C3C4D0 */  lwz       r6, -0x3b30(r3)
/* 029010 8002C010 3C804330 */  lis       r4, 0x4330
/* 029014 8002C014 5405843E */  srwi      r5, r0, 16
/* 029018 8002C018 5400043E */  clrlwi    r0, r0, 16
/* 02901C 8002C01C C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 029020 8002C020 7CA50734 */  extsh     r5, r5
/* 029024 8002C024 7C000734 */  extsh     r0, r0
/* 029028 8002C028 6CA58000 */  xoris     r5, r5, 0x8000
/* 02902C 8002C02C 6C008000 */  xoris     r0, r0, 0x8000
/* 029030 8002C030 90A10084 */  stw       r5, 0x84(r1)
/* 029034 8002C034 2C06FFFF */  cmpwi     r6, -0x1
/* 029038 8002C038 9001007C */  stw       r0, 0x7c(r1)
/* 02903C 8002C03C 90810080 */  stw       r4, 0x80(r1)
/* 029040 8002C040 90810078 */  stw       r4, 0x78(r1)
/* 029044 8002C044 C8210080 */  lfd       f1, 0x80(r1)
/* 029048 8002C048 C8010078 */  lfd       f0, 0x78(r1)
/* 02904C 8002C04C EC611028 */  fsubs     f3, f1, f2
/* 029050 8002C050 EC001028 */  fsubs     f0, f0, f2
/* 029054 8002C054 4182001C */  beq       lbl_8002C070
/* 029058 8002C058 1C060024 */  mulli     r0, r6, 0x24
/* 02905C 8002C05C 7C630214 */  add       r3, r3, r0
/* 029060 8002C060 C3C3C834 */  lfs       f30, -0x37cc(r3)
/* 029064 8002C064 C3E3C830 */  lfs       f31, -0x37d0(r3)
/* 029068 8002C068 C3A3C82C */  lfs       f29, -0x37d4(r3)
/* 02906C 8002C06C 48000010 */  b         lbl_8002C07C
lbl_8002C070:
/* 029070 8002C070 C3C281CC */  lfs       f30, D_8018C10C@sda21(r0)
/* 029074 8002C074 C3E28138 */  lfs       f31, D_8018C078@sda21(r0)
/* 029078 8002C078 C3A281D0 */  lfs       f29, D_8018C110@sda21(r0)
lbl_8002C07C:
/* 02907C 8002C07C C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 029080 8002C080 FC011800 */  fcmpu     cr0, f1, f3
/* 029084 8002C084 4082002C */  bne       lbl_8002C0B0
/* 029088 8002C088 3C7F0004 */  addis     r3, r31, 0x4
/* 02908C 8002C08C FC400890 */  fmr       f2, f1
/* 029090 8002C090 8003D124 */  lwz       r0, -0x2edc(r3)
/* 029094 8002C094 FC600890 */  fmr       f3, f1
/* 029098 8002C098 C08281C8 */  lfs       f4, D_8018C108@sda21(r0)
/* 02909C 8002C09C 38810018 */  addi      r4, r1, 0x18
/* 0290A0 8002C0A0 90010018 */  stw       r0, 0x18(r1)
/* 0290A4 8002C0A4 38600000 */  li        r3, 0x0
/* 0290A8 8002C0A8 48080B8D */  bl        fn_800ACC34
/* 0290AC 8002C0AC 48000210 */  b         lbl_8002C2BC
lbl_8002C0B0:
/* 0290B0 8002C0B0 EC201824 */  fdivs     f1, f0, f3
/* 0290B4 8002C0B4 C0428138 */  lfs       f2, D_8018C078@sda21(r0)
/* 0290B8 8002C0B8 C00281D8 */  lfs       f0, D_8018C118@sda21(r0)
/* 0290BC 8002C0BC 38610034 */  addi      r3, r1, 0x34
/* 0290C0 8002C0C0 C0C281E8 */  lfs       f6, D_8018C128@sda21(r0)
/* 0290C4 8002C0C4 ECA20828 */  fsubs     f5, f2, f1
/* 0290C8 8002C0C8 C02281D0 */  lfs       f1, D_8018C110@sda21(r0)
/* 0290CC 8002C0CC FC80F090 */  fmr       f4, f30
/* 0290D0 8002C0D0 C04281D4 */  lfs       f2, D_8018C114@sda21(r0)
/* 0290D4 8002C0D4 EC6007F2 */  fmuls     f3, f0, f31
/* 0290D8 8002C0D8 EF860172 */  fmuls     f28, f6, f5
/* 0290DC 8002C0DC 4807AA1D */  bl        fn_800A6AF8
/* 0290E0 8002C0E0 38610020 */  addi      r3, r1, 0x20
/* 0290E4 8002C0E4 38A10034 */  addi      r5, r1, 0x34
/* 0290E8 8002C0E8 38800280 */  li        r4, 0x280
/* 0290EC 8002C0EC 48080CF9 */  bl        fn_800ACDE4
/* 0290F0 8002C0F0 C05F00C0 */  lfs       f2, 0xc0(r31)
/* 0290F4 8002C0F4 38A10020 */  addi      r5, r1, 0x20
/* 0290F8 8002C0F8 C0228130 */  lfs       f1, D_8018C070@sda21(r0)
/* 0290FC 8002C0FC 38600001 */  li        r3, 0x1
/* 029100 8002C100 C01F00B8 */  lfs       f0, 0xb8(r31)
/* 029104 8002C104 EC02007A */  fmadds    f0, f2, f1, f0
/* 029108 8002C108 FC00001E */  fctiwz    f0, f0
/* 02910C 8002C10C D8010078 */  stfd      f0, 0x78(r1)
/* 029110 8002C110 8081007C */  lwz       r4, 0x7c(r1)
/* 029114 8002C114 48080E99 */  bl        fn_800ACFAC
/* 029118 8002C118 C00281EC */  lfs       f0, D_8018C12C@sda21(r0)
/* 02911C 8002C11C FC1C0040 */  fcmpo     cr0, f28, f0
/* 029120 8002C120 4081013C */  ble       lbl_8002C25C
/* 029124 8002C124 C00281F0 */  lfs       f0, D_8018C130@sda21(r0)
/* 029128 8002C128 FC1D0040 */  fcmpo     cr0, f29, f0
/* 02912C 8002C12C 41810010 */  bgt       lbl_8002C13C
/* 029130 8002C130 C00281F4 */  lfs       f0, D_8018C134@sda21(r0)
/* 029134 8002C134 FC1C0040 */  fcmpo     cr0, f28, f0
/* 029138 8002C138 4081005C */  ble       lbl_8002C194
lbl_8002C13C:
/* 02913C 8002C13C C00281FC */  lfs       f0, D_8018C13C@sda21(r0)
/* 029140 8002C140 C04281F8 */  lfs       f2, D_8018C138@sda21(r0)
/* 029144 8002C144 EC2007F2 */  fmuls     f1, f0, f31
/* 029148 8002C148 EC1E0828 */  fsubs     f0, f30, f1
/* 02914C 8002C14C EC020032 */  fmuls     f0, f2, f0
/* 029150 8002C150 FC000840 */  fcmpo     cr0, f0, f1
/* 029154 8002C154 40800008 */  bge       lbl_8002C15C
/* 029158 8002C158 48000008 */  b         lbl_8002C160
lbl_8002C15C:
/* 02915C 8002C15C FC200090 */  fmr       f1, f0
lbl_8002C160:
/* 029160 8002C160 C00281F0 */  lfs       f0, D_8018C130@sda21(r0)
/* 029164 8002C164 FC1D0040 */  fcmpo     cr0, f29, f0
/* 029168 8002C168 40800020 */  bge       lbl_8002C188
/* 02916C 8002C16C C0028200 */  lfs       f0, D_8018C140@sda21(r0)
/* 029170 8002C170 FC1E0040 */  fcmpo     cr0, f30, f0
/* 029174 8002C174 4C411382 */  cror      eq, gt, eq
/* 029178 8002C178 40820010 */  bne       lbl_8002C188
/* 02917C 8002C17C C0028204 */  lfs       f0, D_8018C144@sda21(r0)
/* 029180 8002C180 EC4007B2 */  fmuls     f2, f0, f30
/* 029184 8002C184 480000B0 */  b         lbl_8002C234
lbl_8002C188:
/* 029188 8002C188 C0028208 */  lfs       f0, D_8018C148@sda21(r0)
/* 02918C 8002C18C EC4007B2 */  fmuls     f2, f0, f30
/* 029190 8002C190 480000A4 */  b         lbl_8002C234
lbl_8002C194:
/* 029194 8002C194 C002820C */  lfs       f0, D_8018C14C@sda21(r0)
/* 029198 8002C198 FC1D0040 */  fcmpo     cr0, f29, f0
/* 02919C 8002C19C 4081006C */  ble       lbl_8002C208
/* 0291A0 8002C1A0 C00281FC */  lfs       f0, D_8018C13C@sda21(r0)
/* 0291A4 8002C1A4 C0428210 */  lfs       f2, D_8018C150@sda21(r0)
/* 0291A8 8002C1A8 EC2007F2 */  fmuls     f1, f0, f31
/* 0291AC 8002C1AC EC1E0828 */  fsubs     f0, f30, f1
/* 0291B0 8002C1B0 EC020032 */  fmuls     f0, f2, f0
/* 0291B4 8002C1B4 FC000840 */  fcmpo     cr0, f0, f1
/* 0291B8 8002C1B8 40800008 */  bge       lbl_8002C1C0
/* 0291BC 8002C1BC 48000008 */  b         lbl_8002C1C4
lbl_8002C1C0:
/* 0291C0 8002C1C0 FC200090 */  fmr       f1, f0
lbl_8002C1C4:
/* 0291C4 8002C1C4 C0028214 */  lfs       f0, D_8018C154@sda21(r0)
/* 0291C8 8002C1C8 C0628100 */  lfs       f3, D_8018C040@sda21(r0)
/* 0291CC 8002C1CC EC1D0028 */  fsubs     f0, f29, f0
/* 0291D0 8002C1D0 FC001840 */  fcmpo     cr0, f0, f3
/* 0291D4 8002C1D4 40800008 */  bge       lbl_8002C1DC
/* 0291D8 8002C1D8 48000008 */  b         lbl_8002C1E0
lbl_8002C1DC:
/* 0291DC 8002C1DC FC600090 */  fmr       f3, f0
lbl_8002C1E0:
/* 0291E0 8002C1E0 C0028218 */  lfs       f0, D_8018C158@sda21(r0)
/* 0291E4 8002C1E4 C0428138 */  lfs       f2, D_8018C078@sda21(r0)
/* 0291E8 8002C1E8 EC830024 */  fdivs     f4, f3, f0
/* 0291EC 8002C1EC C0028208 */  lfs       f0, D_8018C148@sda21(r0)
/* 0291F0 8002C1F0 C0628204 */  lfs       f3, D_8018C144@sda21(r0)
/* 0291F4 8002C1F4 EC422028 */  fsubs     f2, f2, f4
/* 0291F8 8002C1F8 EC000132 */  fmuls     f0, f0, f4
/* 0291FC 8002C1FC EC0300BA */  fmadds    f0, f3, f2, f0
/* 029200 8002C200 EC5E0032 */  fmuls     f2, f30, f0
/* 029204 8002C204 48000030 */  b         lbl_8002C234
lbl_8002C208:
/* 029208 8002C208 C00281FC */  lfs       f0, D_8018C13C@sda21(r0)
/* 02920C 8002C20C C04281D8 */  lfs       f2, D_8018C118@sda21(r0)
/* 029210 8002C210 EC2007F2 */  fmuls     f1, f0, f31
/* 029214 8002C214 EC1E0828 */  fsubs     f0, f30, f1
/* 029218 8002C218 EC020032 */  fmuls     f0, f2, f0
/* 02921C 8002C21C FC000840 */  fcmpo     cr0, f0, f1
/* 029220 8002C220 40800008 */  bge       lbl_8002C228
/* 029224 8002C224 48000008 */  b         lbl_8002C22C
lbl_8002C228:
/* 029228 8002C228 FC200090 */  fmr       f1, f0
lbl_8002C22C:
/* 02922C 8002C22C C002821C */  lfs       f0, D_8018C15C@sda21(r0)
/* 029230 8002C230 EC4007B2 */  fmuls     f2, f0, f30
lbl_8002C234:
/* 029234 8002C234 3C7F0004 */  addis     r3, r31, 0x4
/* 029238 8002C238 C00281FC */  lfs       f0, D_8018C13C@sda21(r0)
/* 02923C 8002C23C 8003D124 */  lwz       r0, -0x2edc(r3)
/* 029240 8002C240 FC80F090 */  fmr       f4, f30
/* 029244 8002C244 EC6007F2 */  fmuls     f3, f0, f31
/* 029248 8002C248 38810014 */  addi      r4, r1, 0x14
/* 02924C 8002C24C 90010014 */  stw       r0, 0x14(r1)
/* 029250 8002C250 38600002 */  li        r3, 0x2
/* 029254 8002C254 480809E1 */  bl        fn_800ACC34
/* 029258 8002C258 48000064 */  b         lbl_8002C2BC
lbl_8002C25C:
/* 02925C 8002C25C C0028220 */  lfs       f0, D_8018C160@sda21(r0)
/* 029260 8002C260 FC1C0040 */  fcmpo     cr0, f28, f0
/* 029264 8002C264 40810030 */  ble       lbl_8002C294
/* 029268 8002C268 3C7F0004 */  addis     r3, r31, 0x4
/* 02926C 8002C26C C04281E8 */  lfs       f2, D_8018C128@sda21(r0)
/* 029270 8002C270 8003D124 */  lwz       r0, -0x2edc(r3)
/* 029274 8002C274 38810010 */  addi      r4, r1, 0x10
/* 029278 8002C278 FC801090 */  fmr       f4, f2
/* 02927C 8002C27C C0228224 */  lfs       f1, D_8018C164@sda21(r0)
/* 029280 8002C280 90010010 */  stw       r0, 0x10(r1)
/* 029284 8002C284 C0628228 */  lfs       f3, D_8018C168@sda21(r0)
/* 029288 8002C288 38600002 */  li        r3, 0x2
/* 02928C 8002C28C 480809A9 */  bl        fn_800ACC34
/* 029290 8002C290 4800002C */  b         lbl_8002C2BC
lbl_8002C294:
/* 029294 8002C294 3C7F0004 */  addis     r3, r31, 0x4
/* 029298 8002C298 C0228228 */  lfs       f1, D_8018C168@sda21(r0)
/* 02929C 8002C29C 8003D124 */  lwz       r0, -0x2edc(r3)
/* 0292A0 8002C2A0 3881000C */  addi      r4, r1, 0xc
/* 0292A4 8002C2A4 C042822C */  lfs       f2, D_8018C16C@sda21(r0)
/* 0292A8 8002C2A8 FC600890 */  fmr       f3, f1
/* 0292AC 8002C2AC 9001000C */  stw       r0, 0xc(r1)
/* 0292B0 8002C2B0 FC801090 */  fmr       f4, f2
/* 0292B4 8002C2B4 38600002 */  li        r3, 0x2
/* 0292B8 8002C2B8 4808097D */  bl        fn_800ACC34
lbl_8002C2BC:
/* 0292BC 8002C2BC 38600001 */  li        r3, 0x1
/* 0292C0 8002C2C0 800100B4 */  lwz       r0, 0xb4(r1)
/* 0292C4 8002C2C4 CBE100A8 */  lfd       f31, 0xa8(r1)
/* 0292C8 8002C2C8 CBC100A0 */  lfd       f30, 0xa0(r1)
/* 0292CC 8002C2CC 7C0803A6 */  mtlr      r0
/* 0292D0 8002C2D0 CBA10098 */  lfd       f29, 0x98(r1)
/* 0292D4 8002C2D4 CB810090 */  lfd       f28, 0x90(r1)
/* 0292D8 8002C2D8 83E1008C */  lwz       r31, 0x8c(r1)
/* 0292DC 8002C2DC 382100B0 */  addi      r1, r1, 0xb0
/* 0292E0 8002C2E0 4E800020 */  blr

glabel frameDrawSetupFog_Zelda1
/* 0292E4 8002C2E4 7C0802A6 */  mflr      r0
/* 0292E8 8002C2E8 90010004 */  stw       r0, 0x4(r1)
/* 0292EC 8002C2EC 9421FFC0 */  stwu      r1, -0x40(r1)
/* 0292F0 8002C2F0 80030090 */  lwz       r0, 0x90(r3)
/* 0292F4 8002C2F4 3C830004 */  addis     r4, r3, 0x4
/* 0292F8 8002C2F8 8104C4D0 */  lwz       r8, -0x3b30(r4)
/* 0292FC 8002C2FC 3CC04330 */  lis       r6, 0x4330
/* 029300 8002C300 5405843E */  srwi      r5, r0, 16
/* 029304 8002C304 5400043E */  clrlwi    r0, r0, 16
/* 029308 8002C308 C8428110 */  lfd       f2, D_8018C050@sda21(r0)
/* 02930C 8002C30C 7CA50734 */  extsh     r5, r5
/* 029310 8002C310 7C000734 */  extsh     r0, r0
/* 029314 8002C314 6CA78000 */  xoris     r7, r5, 0x8000
/* 029318 8002C318 6C058000 */  xoris     r5, r0, 0x8000
/* 02931C 8002C31C 90E1003C */  stw       r7, 0x3c(r1)
/* 029320 8002C320 3C080001 */  addis     r0, r8, 0x1
/* 029324 8002C324 90A10034 */  stw       r5, 0x34(r1)
/* 029328 8002C328 2800FFFF */  cmplwi    r0, 0xffff
/* 02932C 8002C32C 90C10038 */  stw       r6, 0x38(r1)
/* 029330 8002C330 90C10030 */  stw       r6, 0x30(r1)
/* 029334 8002C334 C8210038 */  lfd       f1, 0x38(r1)
/* 029338 8002C338 C8010030 */  lfd       f0, 0x30(r1)
/* 02933C 8002C33C ECC11028 */  fsubs     f6, f1, f2
/* 029340 8002C340 ECE01028 */  fsubs     f7, f0, f2
/* 029344 8002C344 41820020 */  beq       lbl_8002C364
/* 029348 8002C348 1C080024 */  mulli     r0, r8, 0x24
/* 02934C 8002C34C C02281D8 */  lfs       f1, D_8018C118@sda21(r0)
/* 029350 8002C350 7C840214 */  add       r4, r4, r0
/* 029354 8002C354 C004C830 */  lfs       f0, -0x37d0(r4)
/* 029358 8002C358 C044C834 */  lfs       f2, -0x37cc(r4)
/* 02935C 8002C35C EC010032 */  fmuls     f0, f1, f0
/* 029360 8002C360 4800000C */  b         lbl_8002C36C
lbl_8002C364:
/* 029364 8002C364 C04281CC */  lfs       f2, D_8018C10C@sda21(r0)
/* 029368 8002C368 C0028138 */  lfs       f0, D_8018C078@sda21(r0)
lbl_8002C36C:
/* 02936C 8002C36C C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 029370 8002C370 FC013000 */  fcmpu     cr0, f1, f6
/* 029374 8002C374 4082002C */  bne       lbl_8002C3A0
/* 029378 8002C378 3C630004 */  addis     r3, r3, 0x4
/* 02937C 8002C37C FC400890 */  fmr       f2, f1
/* 029380 8002C380 8003D124 */  lwz       r0, -0x2edc(r3)
/* 029384 8002C384 FC600890 */  fmr       f3, f1
/* 029388 8002C388 C08281C8 */  lfs       f4, D_8018C108@sda21(r0)
/* 02938C 8002C38C 38810014 */  addi      r4, r1, 0x14
/* 029390 8002C390 90010014 */  stw       r0, 0x14(r1)
/* 029394 8002C394 38600000 */  li        r3, 0x0
/* 029398 8002C398 4808089D */  bl        fn_800ACC34
/* 02939C 8002C39C 480002CC */  b         lbl_8002C668
lbl_8002C3A0:
/* 0293A0 8002C3A0 FC073000 */  fcmpu     cr0, f7, f6
/* 0293A4 8002C3A4 40820030 */  bne       lbl_8002C3D4
/* 0293A8 8002C3A8 EC273024 */  fdivs     f1, f7, f6
/* 0293AC 8002C3AC C0028230 */  lfs       f0, D_8018C170@sda21(r0)
/* 0293B0 8002C3B0 C0428138 */  lfs       f2, D_8018C078@sda21(r0)
/* 0293B4 8002C3B4 38A00002 */  li        r5, 0x2
/* 0293B8 8002C3B8 C06281E8 */  lfs       f3, D_8018C128@sda21(r0)
/* 0293BC 8002C3BC EC220828 */  fsubs     f1, f2, f1
/* 0293C0 8002C3C0 C08281C8 */  lfs       f4, D_8018C108@sda21(r0)
/* 0293C4 8002C3C4 EC003024 */  fdivs     f0, f0, f6
/* 0293C8 8002C3C8 EC230072 */  fmuls     f1, f3, f1
/* 0293CC 8002C3CC EC40082A */  fadds     f2, f0, f1
/* 0293D0 8002C3D0 4800022C */  b         lbl_8002C5FC
lbl_8002C3D4:
/* 0293D4 8002C3D4 C0228234 */  lfs       f1, D_8018C174@sda21(r0)
/* 0293D8 8002C3D8 FC013800 */  fcmpu     cr0, f1, f7
/* 0293DC 8002C3DC 40820040 */  bne       lbl_8002C41C
/* 0293E0 8002C3E0 C0228238 */  lfs       f1, D_8018C178@sda21(r0)
/* 0293E4 8002C3E4 FC013000 */  fcmpu     cr0, f1, f6
/* 0293E8 8002C3E8 40820034 */  bne       lbl_8002C41C
/* 0293EC 8002C3EC C022823C */  lfs       f1, D_8018C17C@sda21(r0)
/* 0293F0 8002C3F0 FC011000 */  fcmpu     cr0, f1, f2
/* 0293F4 8002C3F4 40820028 */  bne       lbl_8002C41C
/* 0293F8 8002C3F8 ECC20028 */  fsubs     f6, f2, f0
/* 0293FC 8002C3FC C0228240 */  lfs       f1, D_8018C180@sda21(r0)
/* 029400 8002C400 C0A28244 */  lfs       f5, D_8018C184@sda21(r0)
/* 029404 8002C404 FC600090 */  fmr       f3, f0
/* 029408 8002C408 FC801090 */  fmr       f4, f2
/* 02940C 8002C40C EC2101BA */  fmadds    f1, f1, f6, f0
/* 029410 8002C410 38A00004 */  li        r5, 0x4
/* 029414 8002C414 EC4501BA */  fmadds    f2, f5, f6, f0
/* 029418 8002C418 480001E4 */  b         lbl_8002C5FC
lbl_8002C41C:
/* 02941C 8002C41C C0228248 */  lfs       f1, D_8018C188@sda21(r0)
/* 029420 8002C420 FC013800 */  fcmpu     cr0, f1, f7
/* 029424 8002C424 4082003C */  bne       lbl_8002C460
/* 029428 8002C428 C022824C */  lfs       f1, D_8018C18C@sda21(r0)
/* 02942C 8002C42C FC013000 */  fcmpu     cr0, f1, f6
/* 029430 8002C430 40820030 */  bne       lbl_8002C460
/* 029434 8002C434 C0228200 */  lfs       f1, D_8018C140@sda21(r0)
/* 029438 8002C438 FC011000 */  fcmpu     cr0, f1, f2
/* 02943C 8002C43C 40820024 */  bne       lbl_8002C460
/* 029440 8002C440 ECA20028 */  fsubs     f5, f2, f0
/* 029444 8002C444 C02281D8 */  lfs       f1, D_8018C118@sda21(r0)
/* 029448 8002C448 FC600090 */  fmr       f3, f0
/* 02944C 8002C44C 38A00004 */  li        r5, 0x4
/* 029450 8002C450 FC801090 */  fmr       f4, f2
/* 029454 8002C454 EC21017A */  fmadds    f1, f1, f5, f0
/* 029458 8002C458 EC45002A */  fadds     f2, f5, f0
/* 02945C 8002C45C 480001A0 */  b         lbl_8002C5FC
lbl_8002C460:
/* 029460 8002C460 808D8914 */  lwz       r4, gpSystem@sda21(r0)
/* 029464 8002C464 80040020 */  lwz       r0, 0x20(r4)
/* 029468 8002C468 2C000005 */  cmpwi     r0, 0x5
/* 02946C 8002C46C 40820048 */  bne       lbl_8002C4B4
/* 029470 8002C470 C0228250 */  lfs       f1, D_8018C190@sda21(r0)
/* 029474 8002C474 FC013800 */  fcmpu     cr0, f1, f7
/* 029478 8002C478 4082003C */  bne       lbl_8002C4B4
/* 02947C 8002C47C C0228254 */  lfs       f1, D_8018C194@sda21(r0)
/* 029480 8002C480 FC013000 */  fcmpu     cr0, f1, f6
/* 029484 8002C484 40820030 */  bne       lbl_8002C4B4
/* 029488 8002C488 C0228200 */  lfs       f1, D_8018C140@sda21(r0)
/* 02948C 8002C48C FC011000 */  fcmpu     cr0, f1, f2
/* 029490 8002C490 40820024 */  bne       lbl_8002C4B4
/* 029494 8002C494 ECA20028 */  fsubs     f5, f2, f0
/* 029498 8002C498 C0228258 */  lfs       f1, D_8018C198@sda21(r0)
/* 02949C 8002C49C FC600090 */  fmr       f3, f0
/* 0294A0 8002C4A0 38A00004 */  li        r5, 0x4
/* 0294A4 8002C4A4 FC801090 */  fmr       f4, f2
/* 0294A8 8002C4A8 EC21017A */  fmadds    f1, f1, f5, f0
/* 0294AC 8002C4AC EC45002A */  fadds     f2, f5, f0
/* 0294B0 8002C4B0 4800014C */  b         lbl_8002C5FC
lbl_8002C4B4:
/* 0294B4 8002C4B4 2C000005 */  cmpwi     r0, 0x5
/* 0294B8 8002C4B8 40820048 */  bne       lbl_8002C500
/* 0294BC 8002C4BC C022825C */  lfs       f1, D_8018C19C@sda21(r0)
/* 0294C0 8002C4C0 FC013800 */  fcmpu     cr0, f1, f7
/* 0294C4 8002C4C4 4082003C */  bne       lbl_8002C500
/* 0294C8 8002C4C8 C0228260 */  lfs       f1, D_8018C1A0@sda21(r0)
/* 0294CC 8002C4CC FC013000 */  fcmpu     cr0, f1, f6
/* 0294D0 8002C4D0 40820030 */  bne       lbl_8002C500
/* 0294D4 8002C4D4 C0228200 */  lfs       f1, D_8018C140@sda21(r0)
/* 0294D8 8002C4D8 FC011000 */  fcmpu     cr0, f1, f2
/* 0294DC 8002C4DC 40820024 */  bne       lbl_8002C500
/* 0294E0 8002C4E0 ECA20028 */  fsubs     f5, f2, f0
/* 0294E4 8002C4E4 C0228258 */  lfs       f1, D_8018C198@sda21(r0)
/* 0294E8 8002C4E8 FC600090 */  fmr       f3, f0
/* 0294EC 8002C4EC 38A00004 */  li        r5, 0x4
/* 0294F0 8002C4F0 FC801090 */  fmr       f4, f2
/* 0294F4 8002C4F4 EC21017A */  fmadds    f1, f1, f5, f0
/* 0294F8 8002C4F8 EC45002A */  fadds     f2, f5, f0
/* 0294FC 8002C4FC 48000100 */  b         lbl_8002C5FC
lbl_8002C500:
/* 029500 8002C500 C0228230 */  lfs       f1, D_8018C170@sda21(r0)
/* 029504 8002C504 ECA20028 */  fsubs     f5, f2, f0
/* 029508 8002C508 C0828264 */  lfs       f4, D_8018C1A4@sda21(r0)
/* 02950C 8002C50C ECC13024 */  fdivs     f6, f1, f6
/* 029510 8002C510 C06281E8 */  lfs       f3, D_8018C128@sda21(r0)
/* 029514 8002C514 C0228268 */  lfs       f1, D_8018C1A8@sda21(r0)
/* 029518 8002C518 ECC701B2 */  fmuls     f6, f7, f6
/* 02951C 8002C51C EC66193C */  fnmsubs   f3, f6, f4, f3
/* 029520 8002C520 FC030840 */  fcmpo     cr0, f3, f1
/* 029524 8002C524 4C401382 */  cror      eq, lt, eq
/* 029528 8002C528 40820010 */  bne       lbl_8002C538
/* 02952C 8002C52C C0E28100 */  lfs       f7, D_8018C040@sda21(r0)
/* 029530 8002C530 C122826C */  lfs       f9, D_8018C1AC@sda21(r0)
/* 029534 8002C534 4800003C */  b         lbl_8002C570
lbl_8002C538:
/* 029538 8002C538 ECC30828 */  fsubs     f6, f3, f1
/* 02953C 8002C53C C0628270 */  lfs       f3, D_8018C1B0@sda21(r0)
/* 029540 8002C540 C0828278 */  lfs       f4, D_8018C1B8@sda21(r0)
/* 029544 8002C544 C022827C */  lfs       f1, D_8018C1BC@sda21(r0)
/* 029548 8002C548 ECE61824 */  fdivs     f7, f6, f3
/* 02954C 8002C54C C0628274 */  lfs       f3, D_8018C1B4@sda21(r0)
/* 029550 8002C550 EC8401F2 */  fmuls     f4, f4, f7
/* 029554 8002C554 EC2101F2 */  fmuls     f1, f1, f7
/* 029558 8002C558 EC8401F2 */  fmuls     f4, f4, f7
/* 02955C 8002C55C EC2101F2 */  fmuls     f1, f1, f7
/* 029560 8002C560 EC870132 */  fmuls     f4, f7, f4
/* 029564 8002C564 EC270072 */  fmuls     f1, f7, f1
/* 029568 8002C568 ED27193A */  fmadds    f9, f7, f4, f3
/* 02956C 8002C56C ECE70072 */  fmuls     f7, f7, f1
lbl_8002C570:
/* 029570 8002C570 C0228200 */  lfs       f1, D_8018C140@sda21(r0)
/* 029574 8002C574 ED400032 */  fmuls     f10, f0, f0
/* 029578 8002C578 C0C28138 */  lfs       f6, D_8018C078@sda21(r0)
/* 02957C 8002C57C ED020824 */  fdivs     f8, f2, f1
/* 029580 8002C580 C08281D8 */  lfs       f4, D_8018C118@sda21(r0)
/* 029584 8002C584 C0628280 */  lfs       f3, D_8018C1C0@sda21(r0)
/* 029588 8002C588 C8228288 */  lfd       f1, D_8018C1C8@sda21(r0)
/* 02958C 8002C58C ED064028 */  fsubs     f8, f6, f8
/* 029590 8002C590 ED080232 */  fmuls     f8, f8, f8
/* 029594 8002C594 ED080232 */  fmuls     f8, f8, f8
/* 029598 8002C598 ED080232 */  fmuls     f8, f8, f8
/* 02959C 8002C59C EC840232 */  fmuls     f4, f4, f8
/* 0295A0 8002C5A0 ED0800F2 */  fmuls     f8, f8, f3
/* 0295A4 8002C5A4 ED4A0132 */  fmuls     f10, f10, f4
/* 0295A8 8002C5A8 ED08302A */  fadds     f8, f8, f6
/* 0295AC 8002C5AC FD4A0072 */  fmul      f10, f10, f1
/* 0295B0 8002C5B0 ED290232 */  fmuls     f9, f9, f8
/* 0295B4 8002C5B4 FD405018 */  frsp      f10, f10
/* 0295B8 8002C5B8 FC093040 */  fcmpo     cr0, f9, f6
/* 0295BC 8002C5BC ED4A302A */  fadds     f10, f10, f6
/* 0295C0 8002C5C0 40810008 */  ble       lbl_8002C5C8
/* 0295C4 8002C5C4 FD203090 */  fmr       f9, f6
lbl_8002C5C8:
/* 0295C8 8002C5C8 ECE702B2 */  fmuls     f7, f7, f10
/* 0295CC 8002C5CC C0228138 */  lfs       f1, D_8018C078@sda21(r0)
/* 0295D0 8002C5D0 FC070840 */  fcmpo     cr0, f7, f1
/* 0295D4 8002C5D4 40810008 */  ble       lbl_8002C5DC
/* 0295D8 8002C5D8 FCE00890 */  fmr       f7, f1
lbl_8002C5DC:
/* 0295DC 8002C5DC FC074840 */  fcmpo     cr0, f7, f9
/* 0295E0 8002C5E0 40810008 */  ble       lbl_8002C5E8
/* 0295E4 8002C5E4 FCE04890 */  fmr       f7, f9
lbl_8002C5E8:
/* 0295E8 8002C5E8 FC600090 */  fmr       f3, f0
/* 0295EC 8002C5EC 38A00004 */  li        r5, 0x4
/* 0295F0 8002C5F0 FC801090 */  fmr       f4, f2
/* 0295F4 8002C5F4 EC27017A */  fmadds    f1, f7, f5, f0
/* 0295F8 8002C5F8 EC49017A */  fmadds    f2, f9, f5, f0
lbl_8002C5FC:
/* 0295FC 8002C5FC 808300A0 */  lwz       r4, 0xa0(r3)
/* 029600 8002C600 548037BE */  extrwi    r0, r4, 2, 4
/* 029604 8002C604 28000001 */  cmplwi    r0, 0x1
/* 029608 8002C608 4182001C */  beq       lbl_8002C624
/* 02960C 8002C60C 548017BE */  srwi      r0, r4, 30
/* 029610 8002C610 28000003 */  cmplwi    r0, 0x3
/* 029614 8002C614 41820010 */  beq       lbl_8002C624
/* 029618 8002C618 548057BE */  extrwi    r0, r4, 2, 8
/* 02961C 8002C61C 28000003 */  cmplwi    r0, 0x3
/* 029620 8002C620 40820020 */  bne       lbl_8002C640
lbl_8002C624:
/* 029624 8002C624 3C630004 */  addis     r3, r3, 0x4
/* 029628 8002C628 8003D124 */  lwz       r0, -0x2edc(r3)
/* 02962C 8002C62C 38810010 */  addi      r4, r1, 0x10
/* 029630 8002C630 7CA32B78 */  mr        r3, r5
/* 029634 8002C634 90010010 */  stw       r0, 0x10(r1)
/* 029638 8002C638 480805FD */  bl        fn_800ACC34
/* 02963C 8002C63C 4800002C */  b         lbl_8002C668
lbl_8002C640:
/* 029640 8002C640 C0228100 */  lfs       f1, D_8018C040@sda21(r0)
/* 029644 8002C644 3C630004 */  addis     r3, r3, 0x4
/* 029648 8002C648 8003D124 */  lwz       r0, -0x2edc(r3)
/* 02964C 8002C64C 3881000C */  addi      r4, r1, 0xc
/* 029650 8002C650 FC400890 */  fmr       f2, f1
/* 029654 8002C654 FC600890 */  fmr       f3, f1
/* 029658 8002C658 C08281C8 */  lfs       f4, D_8018C108@sda21(r0)
/* 02965C 8002C65C 9001000C */  stw       r0, 0xc(r1)
/* 029660 8002C660 38600000 */  li        r3, 0x0
/* 029664 8002C664 480805D1 */  bl        fn_800ACC34
lbl_8002C668:
/* 029668 8002C668 38600001 */  li        r3, 0x1
/* 02966C 8002C66C 80010044 */  lwz       r0, 0x44(r1)
/* 029670 8002C670 38210040 */  addi      r1, r1, 0x40
/* 029674 8002C674 7C0803A6 */  mtlr      r0
/* 029678 8002C678 4E800020 */  blr

# 0x800D1DA0 - 0x800D1DE0
.section .rodata, "a"

.balign 8

glabel D_800D1DA0
	.long 0x00000006
	.long 0x00000000
	.long 0x00000005
	.long 0x00020000
	.long 0x00000004
	.long 0x00030000
	.long 0x00000003
	.long 0x00038000
	.long 0x00000002
	.long 0x0003C000
	.long 0x00000001
	.long 0x0003E000
	.long 0x00000000
	.long 0x0003F000
	.long 0x00000000
	.long 0x0003F800

# 0x800EBCF0 - 0x800EC7B8
.section .data, "wa"

.balign 8

glabel D_800EBCF0
	.string "Frame-Buffer"

glabel gap_05_800EBCFD_data
.hidden gap_05_800EBCFD_data
	.byte 0x00, 0x00, 0x00

glabel D_800EBD00
	.long D_800EBCF0
	.long 0x0003D140
	.long 0x00000000
	.long frameEvent

glabel D_800EBD10
	.long 0x00000000
	.long 0x00000001
	.long 0x00000002
	.long 0x00000003
	.long 0x00000004
	.long 0x00000005
	.long 0x00000006
	.long 0x00000007

glabel D_800EBD30
	.long 0x00000000
	.long 0x00000001
	.long 0x00000002
	.long 0x00000003
	.long 0x00000004
	.long 0x00000005
	.long 0x00000006
	.long 0x00000007

glabel D_800EBD50
	.long 0x0000001E
	.long 0x00000021
	.long 0x00000024
	.long 0x00000027
	.long 0x0000002A
	.long 0x0000002D
	.long 0x00000030
	.long 0x00000033

glabel D_800EBD70
	.long 0x00000000
	.long 0x00000001
	.long 0x00000002
	.long 0x00000003
	.long 0x00000004
	.long 0x00000005
	.long 0x00000006
	.long 0x00000007

glabel D_800EBD90
	.string "TEXRRR (obsolete)"

glabel gap_05_800EBDA2_data
.hidden gap_05_800EBDA2_data
	.2byte 0x0000

glabel D_800EBDA4
	.string "TEXGGG (obsolete)"

glabel gap_05_800EBDB6_data
.hidden gap_05_800EBDB6_data
	.2byte 0x0000

glabel D_800EBDB8
	.string "TEXBBB (obsolete)"

glabel gap_05_800EBDCA_data
.hidden gap_05_800EBDCA_data
	.2byte 0x0000

glabel D_800EBDCC
	.string "GX_CC_KONST"

glabel D_800EBDD8
	.long D_8018B080
	.long D_8018B088
	.long D_8018B090
	.long D_8018B094
	.long D_8018B098
	.long D_8018B09C
	.long D_8018B0A0
	.long D_8018B0A4
	.long D_8018B0A8
	.long D_8018B0B0
	.long D_8018B0B8
	.long D_8018B0C0
	.long D_8018B0C8
	.long D_8018B0CC
	.long D_8018B0D4
	.long D_8018B0DC
	.long D_800EBD90
	.long D_800EBDA4
	.long D_800EBDB8
	.long D_800EBDCC

glabel D_800EBE28
	.long D_8018B088
	.long D_8018B094
	.long D_8018B09C
	.long D_8018B0A4
	.long D_8018B0B0
	.long D_8018B0C0
	.long D_8018B0D4
	.long D_8018B0DC
	.long D_8018B0D4

glabel D_800EBE4C
	.long frameDrawTriangle_C0T0
	.long frameDrawTriangle_C1T0
	.long 0x00000000
	.long frameDrawTriangle_C3T0
	.long frameDrawTriangle_C0T3
	.long frameDrawTriangle_C1T3
	.long 0x00000000
	.long frameDrawTriangle_C3T3

glabel D_800EBE6C
	.long frameDrawLine_C0T0
	.long frameDrawLine_C1T0
	.long frameDrawLine_C2T0
	.long frameDrawLine_C0T2
	.long frameDrawLine_C1T2
	.long frameDrawLine_C2T2

glabel D_800EBE84
	.long 0x0003F800
	.long 0x00000000
	.long 0x0003F000
	.long 0x00000000
	.long 0x0003E000
	.long 0x00000001
	.long 0x0003C000
	.long 0x00000002
	.long 0x00038000
	.long 0x00000003
	.long 0x00030000
	.long 0x00000004
	.long 0x00020000
	.long 0x00000005
	.long 0x00000000
	.long 0x00000006

glabel D_800EBEC4
	.string "PRIMITIVE"

glabel gap_05_800EBECE_data
.hidden gap_05_800EBECE_data
	.2byte 0x0000

glabel D_800EBED0
	.string "ENVIRONMENT"

glabel D_800EBEDC
	.long D_8018B0E4
	.long D_8018B0E8
	.long D_8018B0F0
	.long D_800EBEC4
	.long D_800EBED0

glabel D_800EBEF0
	.long 0xF5500000
	.long 0x07080200
	.long 0xE6000000
	.long 0x00000000
	.long 0xF3000000
	.long 0x073BF01A
	.long 0xE7000000
	.long 0x00000000

glabel D_800EBF10
	.long 0xE7000000
	.long 0x00000000
	.long 0xEF000CF0
	.long 0x0F0A4004
	.long 0xFB000000
	.long 0xFFFFFFFF
	.long 0xFC12FE25
	.long 0xFFFFFBFD
	.long 0xFF10013F
	.long 0x804096C0

glabel D_800EBF38
	.long 0xE7000000
	.long 0x00000000
	.long 0xE7000000
	.long 0x00000000
	.long 0xEF000CF0
	.long 0x0F0A0004
	.long 0xFCFFFFFF
	.long 0xFFFCFE7F
	.long 0xFF88013F
	.long 0x80784600

glabel D_800EBF60
	.long 0xED000000
	.long 0x0B000000
	.long 0x0A000000

glabel D_800EBF6C
	.long 0xB9000000
	.long 0xBA000000
	.long 0xE7000000
	.long 0xBA000000
	.long 0xC1000000
	.long 0xE7000000
	.long 0x02000000

glabel D_800EBF88
	.long 0xBA000000
	.long 0xFC000000
	.long 0xB9000000
	.long 0xBA000000
	.long 0xB9000000

glabel D_800EBF9C
	.long 0xE7000000
	.long 0xBA000000
	.long 0xFC000000
	.long 0xB9000000
	.long 0xBA000000
	.long 0xB9000000

glabel D_800EBFB4
	.long 0x0C192078
	.long 0x00552078
	.long 0x0C184F50
	.long 0x00504A50
	.long 0x0F0A4000
	.long 0xC8112078
	.long 0x0C187858
	.long 0x00442078
	.long 0x00553078
	.long 0xC8113078
	.long 0x00443078
	.long 0x00552D58
	.long 0xC8112D58
	.long 0x005049D8
	.long 0xC81049D8
	.long 0x0C193078
	.long 0x00504240
	.long 0x5F505240
	.long 0x0C184240
	.long 0x0C182048
	.long 0x0C183048
	.long 0x0C182078
	.long 0x0C192D58
	.long 0x0C1849D8
	.long 0x0F0A7008
	.long 0x0C1841C8
	.long 0x0C184DD8
	.long 0x0C183078
	.long 0x0C1845D8
	.long 0x00504241
	.long 0x0C184341
	.long 0x0C184241
	.long 0xC8104DD8
	.long 0xC8104F50
	.long 0x00504341
	.long 0xC8104A50
	.long 0x00504340
	.long 0x0C184340
	.long 0xC8104B50
	.long 0x0C184B50
	.long 0x0C184B51
	.long 0x00504B51
	.long 0x0F0A4004
	.long 0x0F0A3231
	.long 0x00504B50
	.long 0xC81049F8
	.long 0xC8103478
	.long 0x005041C8
	.long 0xC4104240
	.long 0x00552038
	.long 0x0F0A100C
	.long 0x0C184A50
	.long 0xC8104A51
	.long 0xC8112479
	.long 0xC81045D8
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000

glabel D_800EC144
	.long 0x0F0A7008
	.long 0x00000001
	.long 0x0F0A4001
	.long 0x00442478
	.long 0x00442479
	.long 0x005041C9
	.long 0x00552079
	.long 0x00552078
	.long 0x005045D8
	.long 0x005045D9
	.long 0x00504DD8
	.long 0x00504DD9
	.long 0x00553078
	.long 0x00553079
	.long 0x0F0A4000
	.long 0x005049D8
	.long 0x005049D9
	.long 0x00442078
	.long 0x00442079
	.long 0x0F0A7009
	.long 0x00504240
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000

glabel D_800EC2D4
	.long 0x0F0A4000
	.long 0x0C084000
	.long 0x00000001
	.long 0x0F0A4001
	.long 0x00504240
	.long 0xC8112078
	.long 0x00504341
	.long 0x00504244
	.long 0x00504340
	.long 0x00504241
	.long 0x00504B50
	.long 0x0C184241
	.long 0x0F0A4004
	.long 0x00553049
	.long 0x00552078
	.long 0x0F0A100C
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000

glabel D_800EC464
	.long 0x0F0A4000
	.long 0x00552048
	.long 0x0F0A7008
	.long 0x00552078
	.long 0x0C084000
	.long 0x00504241
	.long 0x00504240
	.long 0x0F0A4001
	.long 0x005041C8
	.long 0x00552D58
	.long 0x0C184F50
	.long 0x00504F50
	.long 0x0C192078
	.long 0x00504A50
	.long 0x00000001
	.long 0x005049D8
	.long 0xC8112078
	.long 0x0C187858
	.long 0x00552230
	.long 0x00442478
	.long 0x00443078
	.long 0x00442479
	.long 0x00443079
	.long 0x005041C9
	.long 0x00553048
	.long 0x00553078
	.long 0x00504DD8
	.long 0x005045D8
	.long 0x004049F8
	.long 0x004049D8
	.long 0x00442078
	.long 0xC8113078
	.long 0x005049DB
	.long 0x00442D58
	.long 0xC8112D58
	.long 0x004049F8
	.long 0xC81049D8
	.long 0x0C193078
	.long 0x00504B50
	.long 0x00504340
	.long 0x5F505240
	.long 0x0C182078
	.long 0x0C182048
	.long 0x0F0A7009
	.long 0x0C1841C8
	.long 0x0C184240
	.long 0x0C1849D8
	.long 0x00504244
	.long 0x0C184340
	.long 0x00504B51
	.long 0x0C184B50
	.long 0x0F0A4004
	.long 0x0F0A4044
	.long 0x0F0A0004
	.long 0xC8104B50
	.long 0x0FA54044
	.long 0x00504341
	.long 0x00553049
	.long 0x0F0A3231
	.long 0xC8104F50
	.long 0x00552038
	.long 0xC4104240
	.long 0x00504344
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000

glabel D_800EC5F4
	.string "GetTextureInfo: Unknown texture-format: %d\n"

jtbl_800EC620:
	.long frameGetTextureInfo, lbl_8001D1AC
	.long frameGetTextureInfo, lbl_8001D1C8
	.long frameGetTextureInfo, lbl_8001D1C8
	.long frameGetTextureInfo, lbl_8001D1DC
	.long frameGetTextureInfo, lbl_8001D1DC
	.long frameGetTextureInfo, lbl_8001D1DC
	.long frameGetTextureInfo, lbl_8001D1F4
	.long frameGetTextureInfo, lbl_8001D20C
	.long frameGetTextureInfo, lbl_8001D1AC
	.long frameGetTextureInfo, lbl_8001D1C8

jtbl_800EC648:
	.long frameSetMode, lbl_8001FE24
	.long frameSetMode, lbl_8001FE34
	.long frameSetMode, lbl_8001FE78
	.long frameSetMode, lbl_8001FE88
	.long frameSetMode, lbl_8001FE98
	.long frameSetMode, lbl_8001FEE4
	.long frameSetMode, lbl_8001FEF4
	.long frameSetMode, lbl_8001FEF4
	.long frameSetMode, lbl_8001FEF4
	.long frameSetMode, lbl_8001FEF4

glabel D_800EC670
	.string "frameEnd: INTERNAL ERROR: Called when 'gbFrameBegin' is TRUE!\n"

glabel gap_05_800EC6AF_data
.hidden gap_05_800EC6AF_data
	.byte 0x00

glabel D_800EC6B0
	.string "Waiting for valid?\n"

jtbl_800EC6C4:
	.long frameGetCombineAlpha, lbl_80029444
	.long frameGetCombineAlpha, lbl_80029450
	.long frameGetCombineAlpha, lbl_8002945C
	.long frameGetCombineAlpha, lbl_80029468
	.long frameGetCombineAlpha, lbl_80029474
	.long frameGetCombineAlpha, lbl_80029480
	.long frameGetCombineAlpha, lbl_8002948C
	.long frameGetCombineAlpha, lbl_80029498

jtbl_800EC6E4:
	.long frameGetCombineColor, lbl_800294D4
	.long frameGetCombineColor, lbl_800294E0
	.long frameGetCombineColor, lbl_800294EC
	.long frameGetCombineColor, lbl_800294F8
	.long frameGetCombineColor, lbl_80029504
	.long frameGetCombineColor, lbl_80029510
	.long frameGetCombineColor, lbl_80029588
	.long frameGetCombineColor, lbl_8002951C
	.long frameGetCombineColor, lbl_80029528
	.long frameGetCombineColor, lbl_80029534
	.long frameGetCombineColor, lbl_80029540
	.long frameGetCombineColor, lbl_8002954C
	.long frameGetCombineColor, lbl_80029558
	.long frameGetCombineColor, lbl_80029564
	.long frameGetCombineColor, lbl_80029570
	.long frameGetCombineColor, lbl_8002957C
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_800295A0
	.long frameGetCombineColor, lbl_80029594

glabel D_800EC764
	.string "LoadTexture: Unknown FILTER mode (%d)\n"

glabel gap_05_800EC78B_data
.hidden gap_05_800EC78B_data
	.byte 0x00

glabel D_800EC78C
	.string "MakeTexture: 'aTexture' is exhausted!"

glabel gap_05_800EC7B2_data
.hidden gap_05_800EC7B2_data
	.long 0x00000000
	.2byte 0x0000

# 0x80109900 - 0x80131C40
.section .bss, "wa"

glabel D_80109900
	.skip 0x18

glabel gap_06_80109918_bss
.hidden gap_06_80109918_bss
	.skip 0x8

glabel D_80109920
	.skip 0x25800

glabel D_8012F120
	.skip 0x20

glabel D_8012F140
	.skip 0x20

glabel D_8012F160
	.skip 0x20

glabel D_8012F180
	.skip 0x20

glabel D_8012F1A0
	.skip 0x20

glabel D_8012F1C0
	.skip 0x1400

glabel D_801305C0
	.skip 0xA00

glabel D_80130FC0
	.skip 0xA00

glabel D_801319C0
	.skip 0x20

glabel D_801319E0
	.skip 0x20

glabel D_80131A00
	.skip 0x20

glabel D_80131A20
	.skip 0x20

glabel D_80131A40
	.skip 0x200

# 0x8018B078 - 0x8018B100
.section .sdata, "wa"

glabel D_8018B078
	.long 0x00020406
	.long 0x080A0C0F

glabel D_8018B080
	.string "CPREV"

glabel gap_07_8018B086_sdata
.hidden gap_07_8018B086_sdata
	.2byte 0x0000

glabel D_8018B088
	.string "APREV"

glabel gap_07_8018B08E_sdata
.hidden gap_07_8018B08E_sdata
	.2byte 0x0000

glabel D_8018B090
	.string "C0"

glabel gap_07_8018B093_sdata
.hidden gap_07_8018B093_sdata
	.byte 0x00

glabel D_8018B094
	.string "A0"

glabel gap_07_8018B097_sdata
.hidden gap_07_8018B097_sdata
	.byte 0x00

glabel D_8018B098
	.string "C1"

glabel gap_07_8018B09B_sdata
.hidden gap_07_8018B09B_sdata
	.byte 0x00

glabel D_8018B09C
	.string "A1"

glabel gap_07_8018B09F_sdata
.hidden gap_07_8018B09F_sdata
	.byte 0x00

glabel D_8018B0A0
	.string "C2"

glabel gap_07_8018B0A3_sdata
.hidden gap_07_8018B0A3_sdata
	.byte 0x00

glabel D_8018B0A4
	.string "A2"

glabel gap_07_8018B0A7_sdata
.hidden gap_07_8018B0A7_sdata
	.byte 0x00

glabel D_8018B0A8
	.string "TEXC"

glabel gap_07_8018B0AD_sdata
.hidden gap_07_8018B0AD_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0B0
	.string "TEXA"

glabel gap_07_8018B0B5_sdata
.hidden gap_07_8018B0B5_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0B8
	.string "RASC"

glabel gap_07_8018B0BD_sdata
.hidden gap_07_8018B0BD_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0C0
	.string "RASA"

glabel gap_07_8018B0C5_sdata
.hidden gap_07_8018B0C5_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0C8
	.string "ONE"

glabel D_8018B0CC
	.string "HALF"

glabel gap_07_8018B0D1_sdata
.hidden gap_07_8018B0D1_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0D4
	.string "KONST"

glabel gap_07_8018B0DA_sdata
.hidden gap_07_8018B0DA_sdata
	.2byte 0x0000

glabel D_8018B0DC
	.string "ZERO"

glabel gap_07_8018B0E1_sdata
.hidden gap_07_8018B0E1_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0E4
	.string "FOG"

glabel D_8018B0E8
	.string "FILL"

glabel gap_07_8018B0ED_sdata
.hidden gap_07_8018B0ED_sdata
	.byte 0x00, 0x00, 0x00

glabel D_8018B0F0
	.string "BLEND"

glabel D_8018B0F6
	.byte 0x0F

glabel gap_07_8018B0F7_sdata
.hidden gap_07_8018B0F7_sdata
	.byte 0x00

glabel D_8018B0F8
	.string "frame.c"

# 0x8018B918 - 0x8018B968
.section .sbss, "wa"

glabel D_8018B918
	.skip 0x4

glabel D_8018B91C
	.skip 0x4

glabel D_8018B920
	.skip 0x4

glabel D_8018B924
	.skip 0x4

glabel D_8018B928
	.skip 0x4

glabel D_8018B92C
	.skip 0x4

glabel D_8018B930
	.skip 0x4

glabel D_8018B934
	.skip 0x4

glabel D_8018B938
	.skip 0x1

glabel gap_08_8018B939_sbss
.hidden gap_08_8018B939_sbss
	.skip 0x3

glabel D_8018B93C
	.skip 0x4

glabel D_8018B940
	.skip 0x4

glabel D_8018B944
	.skip 0x4

glabel D_8018B948
	.skip 0x4

glabel D_8018B94C
	.skip 0x4

glabel D_8018B950
	.skip 0x4

glabel D_8018B954
	.skip 0x4

glabel D_8018B958
	.skip 0x4

glabel D_8018B95C
	.skip 0x4

glabel D_8018B960
	.skip 0x8

# 0x8018C040 - 0x8018C1D0
.section .sdata2, "a"

glabel D_8018C040
	.float 0

glabel D_8018C044
	.float 0.25

glabel D_8018C048
	.float 2

glabel gap_09_8018C04C_sdata2
.hidden gap_09_8018C04C_sdata2
	.long 0x00000000

glabel D_8018C050
	.double 4503601774854144

glabel D_8018C058
	.float 0.0625

glabel D_8018C05C
	.float 0.0078125

glabel D_8018C060
	.float 4096

glabel D_8018C064
	.float 4194304

glabel D_8018C068
	.double 4503599627370496

glabel D_8018C070
	.float 0.5

glabel D_8018C074
	.float 3

glabel D_8018C078
	.float 1

glabel gap_09_8018C07C_sdata2
.hidden gap_09_8018C07C_sdata2
	.long 0x00000000

glabel D_8018C080
	.double 0.5

glabel D_8018C088
	.double 3

glabel D_8018C090
	.float 0.22673035

glabel D_8018C094
	.float 0.3183136

glabel D_8018C098
	.float 0.00624

glabel D_8018C09C
	.float 0.006242

glabel D_8018C0A0
	.float 640

glabel D_8018C0A4
	.float 480

glabel D_8018C0A8
	.float 320

glabel D_8018C0AC
	.float 240

glabel D_8018C0B0
	.double 262143

glabel D_8018C0B8
	.double 43.52

glabel D_8018C0C0
	.float 80

glabel D_8018C0C4
	.float 31

glabel D_8018C0C8
	.float 0.015625

glabel D_8018C0CC
	.float 143

glabel D_8018C0D0
	.float 0.859375

glabel D_8018C0D4
	.float 0.95

glabel D_8018C0D8
	.float 0.9

glabel D_8018C0DC
	.float 0.85

glabel D_8018C0E0
	.float 0.8

glabel D_8018C0E4
	.float -1

glabel D_8018C0E8
	.float 319

glabel D_8018C0EC
	.float 239

glabel D_8018C0F0
	.float -1001

glabel D_8018C0F4
	.float -53

glabel D_8018C0F8
	.float -3080

glabel D_8018C0FC
	.float 6067

glabel D_8018C100
	.float -31

glabel D_8018C104
	.float 1669

glabel D_8018C108
	.float 1000

glabel D_8018C10C
	.float 32000

glabel D_8018C110
	.float 30

glabel D_8018C114
	.float 1.3333334

glabel D_8018C118
	.float 0.1

glabel D_8018C11C
	.float 0.0015

glabel D_8018C120
	.float 65536

glabel D_8018C124
	.float 1001

glabel D_8018C128
	.float 500

glabel D_8018C12C
	.float 970

glabel D_8018C130
	.float 59

glabel D_8018C134
	.float 990

glabel D_8018C138
	.float 0.21

glabel D_8018C13C
	.float 0.35

glabel D_8018C140
	.float 12800

glabel D_8018C144
	.float 0.6

glabel D_8018C148
	.float 0.7

glabel D_8018C14C
	.float 44

glabel D_8018C150
	.float 0.13

glabel D_8018C154
	.float 45

glabel D_8018C158
	.float 15

glabel D_8018C15C
	.float 0.38

glabel D_8018C160
	.float 900

glabel D_8018C164
	.float 350

glabel D_8018C168
	.float 10

glabel D_8018C16C
	.float 200

glabel D_8018C170
	.float 128000

glabel D_8018C174
	.float -25344

glabel D_8018C178
	.float 25600

glabel D_8018C17C
	.float 2200

glabel D_8018C180
	.float 0.575

glabel D_8018C184
	.float 0.75

glabel D_8018C188
	.float -21077

glabel D_8018C18C
	.float 21333

glabel D_8018C190
	.float -90

glabel D_8018C194
	.float 258

glabel D_8018C198
	.float 0.45

glabel D_8018C19C
	.float -667

glabel D_8018C1A0
	.float 688

glabel D_8018C1A4
	.float 0.00390625

glabel D_8018C1A8
	.float 860

glabel D_8018C1AC
	.float 0.15

glabel D_8018C1B0
	.float 140

glabel D_8018C1B4
	.float 0.28

glabel D_8018C1B8
	.float 0.72

glabel D_8018C1BC
	.float 0.26

glabel D_8018C1C0
	.float 8.44

glabel gap_09_8018C1C4_sdata2
.hidden gap_09_8018C1C4_sdata2
	.long 0x00000000

glabel D_8018C1C8
	.double 8.44
