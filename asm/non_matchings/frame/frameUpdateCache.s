glabel frameUpdateCache
/* 01B1C4 80020764 7C0802A6 */  mflr    r0
/* 01B1C8 80020768 90010004 */  stw     r0, 4(r1)
/* 01B1CC 8002076C 9421FFC0 */  stwu    r1, -0x40(r1)
/* 01B1D0 80020770 BEA10014 */  stmw    r21, 0x14(r1)
/* 01B1D4 80020774 7C771B78 */  mr      r23, r3
/* 01B1D8 80020778 83570088 */  lwz     r26, 0x88(r23)
/* 01B1DC 8002077C 7EFDBB78 */  mr      r29, r23
/* 01B1E0 80020780 3B200000 */  li      r25, 0
/* 01B1E4 80020784 3B800000 */  li      r28, 0
/* 01B1E8 80020788 48000004 */  b       lbl_8002078C
lbl_8002078C:
/* 01B1EC 8002078C 3C604BDA */  lis     r3, 0x4bda
/* 01B1F0 80020790 3BD72240 */  addi    r30, r23, 0x2240
/* 01B1F4 80020794 3BE312F7 */  addi    r31, r3, 0x12f7
/* 01B1F8 80020798 48000004 */  b       lbl_8002079C
lbl_8002079C:
/* 01B1FC 8002079C 48000004 */  b       lbl_800207A0
lbl_800207A0:
/* 01B200 800207A0 3C7D0004 */  addis   r3, r29, 4
/* 01B204 800207A4 83638240 */  lwz     r27, -0x7dc0(r3)
/* 01B208 800207A8 281B0000 */  cmplwi  r27, 0
/* 01B20C 800207AC 41820180 */  beq     lbl_8002092C
/* 01B210 800207B0 48000004 */  b       lbl_800207B4
lbl_800207B4:
/* 01B214 800207B4 1EDC006C */  mulli   r22, r28, 0x6c
/* 01B218 800207B8 48000004 */  b       lbl_800207BC
lbl_800207BC:
/* 01B21C 800207BC 48000168 */  b       lbl_80020924
lbl_800207C0:
/* 01B220 800207C0 576007FE */  clrlwi  r0, r27, 0x1f
/* 01B224 800207C4 28000000 */  cmplwi  r0, 0
/* 01B228 800207C8 41820154 */  beq     lbl_8002091C
/* 01B22C 800207CC 7C77B214 */  add     r3, r23, r22
/* 01B230 800207D0 8003224C */  lwz     r0, 0x224c(r3)
/* 01B234 800207D4 3B032240 */  addi    r24, r3, 0x2240
/* 01B238 800207D8 7C1A0050 */  subf    r0, r26, r0
/* 01B23C 800207DC 2C000000 */  cmpwi   r0, 0
/* 01B240 800207E0 40800008 */  bge     lbl_800207E8
/* 01B244 800207E4 7C0000D0 */  neg     r0, r0
lbl_800207E8:
/* 01B248 800207E8 2C000001 */  cmpwi   r0, 1
/* 01B24C 800207EC 40810130 */  ble     lbl_8002091C
/* 01B250 800207F0 80180014 */  lwz     r0, 0x14(r24)
/* 01B254 800207F4 38A00000 */  li      r5, 0
/* 01B258 800207F8 5400AAFE */  srwi    r0, r0, 0xb
/* 01B25C 800207FC 5403103A */  slwi    r3, r0, 2
/* 01B260 80020800 3C630004 */  addis   r3, r3, 4
/* 01B264 80020804 38638340 */  addi    r3, r3, -31936
/* 01B268 80020808 7C97182E */  lwzx    r4, r23, r3
/* 01B26C 8002080C 48000004 */  b       lbl_80020810
lbl_80020810:
/* 01B270 80020810 48000004 */  b       lbl_80020814
lbl_80020814:
/* 01B274 80020814 4800000C */  b       lbl_80020820
lbl_80020818:
/* 01B278 80020818 7C852378 */  mr      r5, r4
/* 01B27C 8002081C 80840020 */  lwz     r4, 0x20(r4)
lbl_80020820:
/* 01B280 80020820 28040000 */  cmplwi  r4, 0
/* 01B284 80020824 4182000C */  beq     lbl_80020830
/* 01B288 80020828 7C04C040 */  cmplw   r4, r24
/* 01B28C 8002082C 4082FFEC */  bne     lbl_80020818
lbl_80020830:
/* 01B290 80020830 28050000 */  cmplwi  r5, 0
/* 01B294 80020834 4082001C */  bne     lbl_80020850
/* 01B298 80020838 5403103A */  slwi    r3, r0, 2
/* 01B29C 8002083C 80040020 */  lwz     r0, 0x20(r4)
/* 01B2A0 80020840 3C630004 */  addis   r3, r3, 4
/* 01B2A4 80020844 38638340 */  addi    r3, r3, -31936
/* 01B2A8 80020848 7C17192E */  stwx    r0, r23, r3
/* 01B2AC 8002084C 4800000C */  b       lbl_80020858
lbl_80020850:
/* 01B2B0 80020850 80040020 */  lwz     r0, 0x20(r4)
/* 01B2B4 80020854 90050020 */  stw     r0, 0x20(r5)
lbl_80020858:
/* 01B2B8 80020858 7EBEC050 */  subf    r21, r30, r24
/* 01B2BC 8002085C 38780008 */  addi    r3, r24, 8
/* 01B2C0 80020860 38971CF8 */  addi    r4, r23, 0x1cf8
/* 01B2C4 80020864 38A00140 */  li      r5, 0x140
/* 01B2C8 80020868 480006D5 */  bl      packFreeBlocks
/* 01B2CC 8002086C 2C030000 */  cmpwi   r3, 0
/* 01B2D0 80020870 4082000C */  bne     lbl_8002087C
/* 01B2D4 80020874 38000000 */  li      r0, 0
/* 01B2D8 80020878 48000008 */  b       lbl_80020880
lbl_8002087C:
/* 01B2DC 8002087C 38000001 */  li      r0, 1
lbl_80020880:
/* 01B2E0 80020880 2C000000 */  cmpwi   r0, 0
/* 01B2E4 80020884 4082000C */  bne     lbl_80020890
/* 01B2E8 80020888 38000000 */  li      r0, 0
/* 01B2EC 8002088C 48000028 */  b       lbl_800208B4
lbl_80020890:
/* 01B2F0 80020890 38780004 */  addi    r3, r24, 4
/* 01B2F4 80020894 38971C38 */  addi    r4, r23, 0x1c38
/* 01B2F8 80020898 38A00030 */  li      r5, 0x30
/* 01B2FC 8002089C 480006A1 */  bl      packFreeBlocks
/* 01B300 800208A0 2C030000 */  cmpwi   r3, 0
/* 01B304 800208A4 4082000C */  bne     lbl_800208B0
/* 01B308 800208A8 38000000 */  li      r0, 0
/* 01B30C 800208AC 48000008 */  b       lbl_800208B4
lbl_800208B0:
/* 01B310 800208B0 38000001 */  li      r0, 1
lbl_800208B4:
/* 01B314 800208B4 2C000000 */  cmpwi   r0, 0
/* 01B318 800208B8 4082000C */  bne     lbl_800208C4
/* 01B31C 800208BC 38A00000 */  li      r5, 0
/* 01B320 800208C0 4800004C */  b       lbl_8002090C
lbl_800208C4:
/* 01B324 800208C4 7C1FA896 */  mulhw   r0, r31, r21
/* 01B328 800208C8 7C002E70 */  srawi   r0, r0, 5
/* 01B32C 800208CC 54030FFE */  srwi    r3, r0, 0x1f
/* 01B330 800208D0 7EA01A14 */  add     r21, r0, r3
/* 01B334 800208D4 7EA02E70 */  srawi   r0, r21, 5
/* 01B338 800208D8 5403103A */  slwi    r3, r0, 2
/* 01B33C 800208DC 3C830004 */  addis   r4, r3, 4
/* 01B340 800208E0 38848240 */  addi    r4, r4, -32192
/* 01B344 800208E4 38A00001 */  li      r5, 1
/* 01B348 800208E8 7C77202E */  lwzx    r3, r23, r4
/* 01B34C 800208EC 56A006FE */  clrlwi  r0, r21, 0x1b
/* 01B350 800208F0 7CA00030 */  slw     r0, r5, r0
/* 01B354 800208F4 7C0000F8 */  nor     r0, r0, r0
/* 01B358 800208F8 7C600038 */  and     r0, r3, r0
/* 01B35C 800208FC 7C17212E */  stwx    r0, r23, r4
/* 01B360 80020900 80771C30 */  lwz     r3, 0x1c30(r23)
/* 01B364 80020904 3803FFFF */  addi    r0, r3, -1
/* 01B368 80020908 90171C30 */  stw     r0, 0x1c30(r23)
lbl_8002090C:
/* 01B36C 8002090C 2C050000 */  cmpwi   r5, 0
/* 01B370 80020910 4082000C */  bne     lbl_8002091C
/* 01B374 80020914 38600000 */  li      r3, 0
/* 01B378 80020918 4800002C */  b       lbl_80020944
lbl_8002091C:
/* 01B37C 8002091C 3AD6006C */  addi    r22, r22, 0x6c
/* 01B380 80020920 577BF87E */  srwi    r27, r27, 1
lbl_80020924:
/* 01B384 80020924 281B0000 */  cmplwi  r27, 0
/* 01B388 80020928 4082FE98 */  bne     lbl_800207C0
lbl_8002092C:
/* 01B38C 8002092C 3BBD0004 */  addi    r29, r29, 4
/* 01B390 80020930 3B9C0020 */  addi    r28, r28, 0x20
/* 01B394 80020934 3B390001 */  addi    r25, r25, 1
/* 01B398 80020938 28190040 */  cmplwi  r25, 0x40
/* 01B39C 8002093C 4180FE64 */  blt     lbl_800207A0
/* 01B3A0 80020940 38600001 */  li      r3, 1
lbl_80020944:
/* 01B3A4 80020944 BAA10014 */  lmw     r21, 0x14(r1)
/* 01B3A8 80020948 80010044 */  lwz     r0, 0x44(r1)
/* 01B3AC 8002094C 38210040 */  addi    r1, r1, 0x40
/* 01B3B0 80020950 7C0803A6 */  mtlr    r0
/* 01B3B4 80020954 4E800020 */  blr     
