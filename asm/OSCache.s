# OSCache.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel DCEnable
/* 09819C 8009D73C 7C0004AC */  sync	0
/* 0981A0 8009D740 7C70FAA6 */  mfspr	r3, 0x3f0
/* 0981A4 8009D744 60634000 */  ori		r3, r3, 0x4000
/* 0981A8 8009D748 7C70FBA6 */  mtspr	0x3f0, r3
/* 0981AC 8009D74C 4E800020 */  blr		

glabel DCInvalidateRange
/* 0981B0 8009D750 28040000 */  cmplwi	r4, 0
/* 0981B4 8009D754 4C810020 */  blelr	
/* 0981B8 8009D758 546506FE */  clrlwi	r5, r3, 0x1b
/* 0981BC 8009D75C 7C842A14 */  add		r4, r4, r5
/* 0981C0 8009D760 3884001F */  addi	r4, r4, 0x1f
/* 0981C4 8009D764 5484D97E */  srwi	r4, r4, 5
/* 0981C8 8009D768 7C8903A6 */  mtctr	r4
lbl_8009D76C:
/* 0981CC 8009D76C 7C001BAC */  dcbi	0, r3
/* 0981D0 8009D770 38630020 */  addi	r3, r3, 0x20
/* 0981D4 8009D774 4200FFF8 */  bdnz	lbl_8009D76C
/* 0981D8 8009D778 4E800020 */  blr		

glabel DCFlushRange
/* 0981DC 8009D77C 28040000 */  cmplwi	r4, 0
/* 0981E0 8009D780 4C810020 */  blelr	
/* 0981E4 8009D784 546506FE */  clrlwi	r5, r3, 0x1b
/* 0981E8 8009D788 7C842A14 */  add		r4, r4, r5
/* 0981EC 8009D78C 3884001F */  addi	r4, r4, 0x1f
/* 0981F0 8009D790 5484D97E */  srwi	r4, r4, 5
/* 0981F4 8009D794 7C8903A6 */  mtctr	r4
lbl_8009D798:
/* 0981F8 8009D798 7C0018AC */  dcbf	0, r3
/* 0981FC 8009D79C 38630020 */  addi	r3, r3, 0x20
/* 098200 8009D7A0 4200FFF8 */  bdnz	lbl_8009D798
/* 098204 8009D7A4 44000002 */  sc		
/* 098208 8009D7A8 4E800020 */  blr		

glabel DCStoreRange
/* 09820C 8009D7AC 28040000 */  cmplwi	r4, 0
/* 098210 8009D7B0 4C810020 */  blelr	
/* 098214 8009D7B4 546506FE */  clrlwi	r5, r3, 0x1b
/* 098218 8009D7B8 7C842A14 */  add		r4, r4, r5
/* 09821C 8009D7BC 3884001F */  addi	r4, r4, 0x1f
/* 098220 8009D7C0 5484D97E */  srwi	r4, r4, 5
/* 098224 8009D7C4 7C8903A6 */  mtctr	r4
lbl_8009D7C8:
/* 098228 8009D7C8 7C00186C */  dcbst	0, r3
/* 09822C 8009D7CC 38630020 */  addi	r3, r3, 0x20
/* 098230 8009D7D0 4200FFF8 */  bdnz	lbl_8009D7C8
/* 098234 8009D7D4 44000002 */  sc		
/* 098238 8009D7D8 4E800020 */  blr		

glabel DCFlushRangeNoSync
/* 09823C 8009D7DC 28040000 */  cmplwi	r4, 0
/* 098240 8009D7E0 4C810020 */  blelr	
/* 098244 8009D7E4 546506FE */  clrlwi	r5, r3, 0x1b
/* 098248 8009D7E8 7C842A14 */  add		r4, r4, r5
/* 09824C 8009D7EC 3884001F */  addi	r4, r4, 0x1f
/* 098250 8009D7F0 5484D97E */  srwi	r4, r4, 5
/* 098254 8009D7F4 7C8903A6 */  mtctr	r4
lbl_8009D7F8:
/* 098258 8009D7F8 7C0018AC */  dcbf	0, r3
/* 09825C 8009D7FC 38630020 */  addi	r3, r3, 0x20
/* 098260 8009D800 4200FFF8 */  bdnz	lbl_8009D7F8
/* 098264 8009D804 4E800020 */  blr		

glabel DCZeroRange
/* 098268 8009D808 28040000 */  cmplwi	r4, 0
/* 09826C 8009D80C 4C810020 */  blelr	
/* 098270 8009D810 546506FE */  clrlwi	r5, r3, 0x1b
/* 098274 8009D814 7C842A14 */  add		r4, r4, r5
/* 098278 8009D818 3884001F */  addi	r4, r4, 0x1f
/* 09827C 8009D81C 5484D97E */  srwi	r4, r4, 5
/* 098280 8009D820 7C8903A6 */  mtctr	r4
lbl_8009D824:
/* 098284 8009D824 7C001FEC */  dcbz	0, r3
/* 098288 8009D828 38630020 */  addi	r3, r3, 0x20
/* 09828C 8009D82C 4200FFF8 */  bdnz	lbl_8009D824
/* 098290 8009D830 4E800020 */  blr		

glabel ICInvalidateRange
/* 098294 8009D834 28040000 */  cmplwi	r4, 0
/* 098298 8009D838 4C810020 */  blelr	
/* 09829C 8009D83C 546506FE */  clrlwi	r5, r3, 0x1b
/* 0982A0 8009D840 7C842A14 */  add		r4, r4, r5
/* 0982A4 8009D844 3884001F */  addi	r4, r4, 0x1f
/* 0982A8 8009D848 5484D97E */  srwi	r4, r4, 5
/* 0982AC 8009D84C 7C8903A6 */  mtctr	r4
lbl_8009D850:
/* 0982B0 8009D850 7C001FAC */  icbi	0, r3
/* 0982B4 8009D854 38630020 */  addi	r3, r3, 0x20
/* 0982B8 8009D858 4200FFF8 */  bdnz	lbl_8009D850
/* 0982BC 8009D85C 7C0004AC */  sync	0
/* 0982C0 8009D860 4C00012C */  isync	
/* 0982C4 8009D864 4E800020 */  blr		

glabel ICFlashInvalidate
/* 0982C8 8009D868 7C70FAA6 */  mfspr	r3, 0x3f0
/* 0982CC 8009D86C 60630800 */  ori		r3, r3, 0x800
/* 0982D0 8009D870 7C70FBA6 */  mtspr	0x3f0, r3
/* 0982D4 8009D874 4E800020 */  blr		

glabel ICEnable
/* 0982D8 8009D878 4C00012C */  isync	
/* 0982DC 8009D87C 7C70FAA6 */  mfspr	r3, 0x3f0
/* 0982E0 8009D880 60638000 */  ori		r3, r3, 0x8000
/* 0982E4 8009D884 7C70FBA6 */  mtspr	0x3f0, r3
/* 0982E8 8009D888 4E800020 */  blr		

__LCEnable:
/* 0982EC 8009D88C 7CA000A6 */  mfmsr	r5
/* 0982F0 8009D890 60A51000 */  ori		r5, r5, 0x1000
/* 0982F4 8009D894 7CA00124 */  mtmsr	r5
/* 0982F8 8009D898 3C608000 */  lis		r3, 0x8000
/* 0982FC 8009D89C 38800400 */  li		r4, 0x400
/* 098300 8009D8A0 7C8903A6 */  mtctr	r4
lbl_8009D8A4:
/* 098304 8009D8A4 7C001A2C */  dcbt	0, r3
/* 098308 8009D8A8 7C00186C */  dcbst	0, r3
/* 09830C 8009D8AC 38630020 */  addi	r3, r3, 0x20
/* 098310 8009D8B0 4200FFF4 */  bdnz	lbl_8009D8A4
/* 098314 8009D8B4 7C98E2A6 */  mfspr	r4, 0x398
/* 098318 8009D8B8 6484100F */  oris	r4, r4, 0x100f
/* 09831C 8009D8BC 7C98E3A6 */  mtspr	0x398, r4
/* 098320 8009D8C0 60000000 */  nop		
/* 098324 8009D8C4 60000000 */  nop		
/* 098328 8009D8C8 60000000 */  nop		
/* 09832C 8009D8CC 60000000 */  nop		
/* 098330 8009D8D0 60000000 */  nop		
/* 098334 8009D8D4 60000000 */  nop		
/* 098338 8009D8D8 60000000 */  nop		
/* 09833C 8009D8DC 60000000 */  nop		
/* 098340 8009D8E0 60000000 */  nop		
/* 098344 8009D8E4 60000000 */  nop		
/* 098348 8009D8E8 60000000 */  nop		
/* 09834C 8009D8EC 60000000 */  nop		
/* 098350 8009D8F0 3C60E000 */  lis		r3, 0xe000
/* 098354 8009D8F4 60630002 */  ori		r3, r3, 2
/* 098358 8009D8F8 7C7F83A6 */  mtdbatl	3, r3
/* 09835C 8009D8FC 606301FE */  ori		r3, r3, 0x1fe
/* 098360 8009D900 7C7E83A6 */  mtdbatu	3, r3
/* 098364 8009D904 4C00012C */  isync	
/* 098368 8009D908 3C60E000 */  lis		r3, 0xe000
/* 09836C 8009D90C 38C00200 */  li		r6, 0x200
/* 098370 8009D910 7CC903A6 */  mtctr	r6
/* 098374 8009D914 38C00000 */  li		r6, 0
lbl_8009D918:
/* 098378 8009D918 10061FEC */  dcbz_l	r6, r3
/* 09837C 8009D91C 38630020 */  addi	r3, r3, 0x20
/* 098380 8009D920 4200FFF8 */  bdnz	lbl_8009D918
/* 098384 8009D924 60000000 */  nop		
/* 098388 8009D928 60000000 */  nop		
/* 09838C 8009D92C 60000000 */  nop		
/* 098390 8009D930 60000000 */  nop		
/* 098394 8009D934 60000000 */  nop		
/* 098398 8009D938 60000000 */  nop		
/* 09839C 8009D93C 60000000 */  nop		
/* 0983A0 8009D940 60000000 */  nop		
/* 0983A4 8009D944 60000000 */  nop		
/* 0983A8 8009D948 60000000 */  nop		
/* 0983AC 8009D94C 60000000 */  nop		
/* 0983B0 8009D950 60000000 */  nop		
/* 0983B4 8009D954 4E800020 */  blr		

glabel LCEnable
/* 0983B8 8009D958 7C0802A6 */  mflr	r0
/* 0983BC 8009D95C 90010004 */  stw		r0, 4(r1)
/* 0983C0 8009D960 9421FFF0 */  stwu	r1, -0x10(r1)
/* 0983C4 8009D964 93E1000C */  stw		r31, 0xc(r1)
/* 0983C8 8009D968 48001395 */  bl		OSDisableInterrupts
/* 0983CC 8009D96C 7C7F1B78 */  mr		r31, r3
/* 0983D0 8009D970 4BFFFF1D */  bl		__LCEnable
/* 0983D4 8009D974 7FE3FB78 */  mr		r3, r31
/* 0983D8 8009D978 480013AD */  bl		OSRestoreInterrupts
/* 0983DC 8009D97C 80010014 */  lwz		r0, 0x14(r1)
/* 0983E0 8009D980 83E1000C */  lwz		r31, 0xc(r1)
/* 0983E4 8009D984 38210010 */  addi	r1, r1, 0x10
/* 0983E8 8009D988 7C0803A6 */  mtlr	r0
/* 0983EC 8009D98C 4E800020 */  blr		

glabel LCDisable
/* 0983F0 8009D990 3C60E000 */  lis		r3, 0xe000
/* 0983F4 8009D994 38800200 */  li		r4, 0x200
/* 0983F8 8009D998 7C8903A6 */  mtctr	r4
lbl_8009D99C:
/* 0983FC 8009D99C 7C001BAC */  dcbi	0, r3
/* 098400 8009D9A0 38630020 */  addi	r3, r3, 0x20
/* 098404 8009D9A4 4200FFF8 */  bdnz	lbl_8009D99C
/* 098408 8009D9A8 7C98E2A6 */  mfspr	r4, 0x398
/* 09840C 8009D9AC 54840104 */  rlwinm	r4, r4, 0, 4, 2
/* 098410 8009D9B0 7C98E3A6 */  mtspr	0x398, r4
/* 098414 8009D9B4 4E800020 */  blr		

glabel LCStoreBlocks
/* 098418 8009D9B8 54A6F6FE */  rlwinm	r6, r5, 0x1e, 0x1b, 0x1f
/* 09841C 8009D9BC 5463013E */  clrlwi	r3, r3, 4
/* 098420 8009D9C0 7CC61B78 */  or		r6, r6, r3
/* 098424 8009D9C4 7CDAE3A6 */  mtspr	0x39a, r6
/* 098428 8009D9C8 54A6173A */  rlwinm	r6, r5, 2, 0x1c, 0x1d
/* 09842C 8009D9CC 7CC62378 */  or		r6, r6, r4
/* 098430 8009D9D0 60C60002 */  ori		r6, r6, 2
/* 098434 8009D9D4 7CDBE3A6 */  mtspr	0x39b, r6
/* 098438 8009D9D8 4E800020 */  blr		

glabel LCStoreData
/* 09843C 8009D9DC 7C0802A6 */  mflr	r0
/* 098440 8009D9E0 90010004 */  stw		r0, 4(r1)
/* 098444 8009D9E4 9421FFD8 */  stwu	r1, -0x28(r1)
/* 098448 8009D9E8 93E10024 */  stw		r31, 0x24(r1)
/* 09844C 8009D9EC 93C10020 */  stw		r30, 0x20(r1)
/* 098450 8009D9F0 93A1001C */  stw		r29, 0x1c(r1)
/* 098454 8009D9F4 93810018 */  stw		r28, 0x18(r1)
/* 098458 8009D9F8 7C7C1B78 */  mr		r28, r3
/* 09845C 8009D9FC 7C9D2378 */  mr		r29, r4
/* 098460 8009DA00 3805001F */  addi	r0, r5, 0x1f
/* 098464 8009DA04 5403D97E */  srwi	r3, r0, 5
/* 098468 8009DA08 3803007F */  addi	r0, r3, 0x7f
/* 09846C 8009DA0C 7C7F1B78 */  mr		r31, r3
/* 098470 8009DA10 541EC9FE */  srwi	r30, r0, 7
/* 098474 8009DA14 48000004 */  b		lbl_8009DA18
lbl_8009DA18:
/* 098478 8009DA18 48000004 */  b		lbl_8009DA1C
lbl_8009DA1C:
/* 09847C 8009DA1C 48000040 */  b		lbl_8009DA5C
lbl_8009DA20:
/* 098480 8009DA20 281F0080 */  cmplwi	r31, 0x80
/* 098484 8009DA24 4080001C */  bge		lbl_8009DA40
/* 098488 8009DA28 7F83E378 */  mr		r3, r28
/* 09848C 8009DA2C 7FA4EB78 */  mr		r4, r29
/* 098490 8009DA30 7FE5FB78 */  mr		r5, r31
/* 098494 8009DA34 4BFFFF85 */  bl		LCStoreBlocks
/* 098498 8009DA38 3BE00000 */  li		r31, 0
/* 09849C 8009DA3C 48000020 */  b		lbl_8009DA5C
lbl_8009DA40:
/* 0984A0 8009DA40 7F83E378 */  mr		r3, r28
/* 0984A4 8009DA44 7FA4EB78 */  mr		r4, r29
/* 0984A8 8009DA48 38A00000 */  li		r5, 0
/* 0984AC 8009DA4C 4BFFFF6D */  bl		LCStoreBlocks
/* 0984B0 8009DA50 3BFFFF80 */  addi	r31, r31, -128
/* 0984B4 8009DA54 3B9C1000 */  addi	r28, r28, 0x1000
/* 0984B8 8009DA58 3BBD1000 */  addi	r29, r29, 0x1000
lbl_8009DA5C:
/* 0984BC 8009DA5C 281F0000 */  cmplwi	r31, 0
/* 0984C0 8009DA60 4082FFC0 */  bne		lbl_8009DA20
/* 0984C4 8009DA64 7FC3F378 */  mr		r3, r30
/* 0984C8 8009DA68 8001002C */  lwz		r0, 0x2c(r1)
/* 0984CC 8009DA6C 83E10024 */  lwz		r31, 0x24(r1)
/* 0984D0 8009DA70 83C10020 */  lwz		r30, 0x20(r1)
/* 0984D4 8009DA74 83A1001C */  lwz		r29, 0x1c(r1)
/* 0984D8 8009DA78 83810018 */  lwz		r28, 0x18(r1)
/* 0984DC 8009DA7C 38210028 */  addi	r1, r1, 0x28
/* 0984E0 8009DA80 7C0803A6 */  mtlr	r0
/* 0984E4 8009DA84 4E800020 */  blr		

glabel LCQueueWait
/* 0984E8 8009DA88 7C98E2A6 */  mfspr	r4, 0x398
/* 0984EC 8009DA8C 5484473E */  rlwinm	r4, r4, 8, 0x1c, 0x1f
/* 0984F0 8009DA90 7C041800 */  cmpw	r4, r3
/* 0984F4 8009DA94 4181FFF4 */  bgt		LCQueueWait
/* 0984F8 8009DA98 4E800020 */  blr		

glabel L2GlobalInvalidate
/* 0984FC 8009DA9C 7C0802A6 */  mflr	r0
/* 098500 8009DAA0 90010004 */  stw		r0, 4(r1)
/* 098504 8009DAA4 9421FFF0 */  stwu	r1, -0x10(r1)
/* 098508 8009DAA8 93E1000C */  stw		r31, 0xc(r1)
/* 09850C 8009DAAC 7C0004AC */  sync	0
/* 098510 8009DAB0 4BFFE02D */  bl		PPCMfl2cr
/* 098514 8009DAB4 5463007E */  clrlwi	r3, r3, 1
/* 098518 8009DAB8 4BFFE02D */  bl		PPCMtl2cr
/* 09851C 8009DABC 7C0004AC */  sync	0
/* 098520 8009DAC0 4BFFE01D */  bl		PPCMfl2cr
/* 098524 8009DAC4 64630020 */  oris	r3, r3, 0x20
/* 098528 8009DAC8 4BFFE01D */  bl		PPCMtl2cr
/* 09852C 8009DACC 48000004 */  b		lbl_8009DAD0
lbl_8009DAD0:
/* 098530 8009DAD0 48000004 */  b		lbl_8009DAD4
lbl_8009DAD4:
/* 098534 8009DAD4 4BFFE009 */  bl		PPCMfl2cr
/* 098538 8009DAD8 546007FE */  clrlwi	r0, r3, 0x1f
/* 09853C 8009DADC 28000000 */  cmplwi	r0, 0
/* 098540 8009DAE0 4082FFF4 */  bne		lbl_8009DAD4
/* 098544 8009DAE4 4BFFDFF9 */  bl		PPCMfl2cr
/* 098548 8009DAE8 546302D2 */  rlwinm	r3, r3, 0, 0xb, 9
/* 09854C 8009DAEC 4BFFDFF9 */  bl		PPCMtl2cr
/* 098550 8009DAF0 48000004 */  b		lbl_8009DAF4
lbl_8009DAF4:
/* 098554 8009DAF4 3C60800F */  lis		r3, D_800F0C48@ha
/* 098558 8009DAF8 3BE30C48 */  addi	r31, r3, D_800F0C48@l
/* 09855C 8009DAFC 48000004 */  b		lbl_8009DB00
lbl_8009DB00:
/* 098560 8009DB00 48000010 */  b		lbl_8009DB10
lbl_8009DB04:
/* 098564 8009DB04 7FE3FB78 */  mr		r3, r31
/* 098568 8009DB08 4CC63182 */  crclr	6
/* 09856C 8009DB0C 4800A271 */  bl		DBPrintf
lbl_8009DB10:
/* 098570 8009DB10 4BFFDFCD */  bl		PPCMfl2cr
/* 098574 8009DB14 546007FE */  clrlwi	r0, r3, 0x1f
/* 098578 8009DB18 28000000 */  cmplwi	r0, 0
/* 09857C 8009DB1C 4082FFE8 */  bne		lbl_8009DB04
/* 098580 8009DB20 80010014 */  lwz		r0, 0x14(r1)
/* 098584 8009DB24 83E1000C */  lwz		r31, 0xc(r1)
/* 098588 8009DB28 38210010 */  addi	r1, r1, 0x10
/* 09858C 8009DB2C 7C0803A6 */  mtlr	r0
/* 098590 8009DB30 4E800020 */  blr		

glabel DMAErrorHandler
/* 098594 8009DB34 7C0802A6 */  mflr	r0
/* 098598 8009DB38 90010004 */  stw		r0, 4(r1)
/* 09859C 8009DB3C 9421FF80 */  stwu	r1, -0x80(r1)
/* 0985A0 8009DB40 93E1007C */  stw		r31, 0x7c(r1)
/* 0985A4 8009DB44 93C10078 */  stw		r30, 0x78(r1)
/* 0985A8 8009DB48 93A10074 */  stw		r29, 0x74(r1)
/* 0985AC 8009DB4C 40860024 */  bne		cr1, lbl_8009DB70
/* 0985B0 8009DB50 D8210028 */  stfd	f1, 0x28(r1)
/* 0985B4 8009DB54 D8410030 */  stfd	f2, 0x30(r1)
/* 0985B8 8009DB58 D8610038 */  stfd	f3, 0x38(r1)
/* 0985BC 8009DB5C D8810040 */  stfd	f4, 0x40(r1)
/* 0985C0 8009DB60 D8A10048 */  stfd	f5, 0x48(r1)
/* 0985C4 8009DB64 D8C10050 */  stfd	f6, 0x50(r1)
/* 0985C8 8009DB68 D8E10058 */  stfd	f7, 0x58(r1)
/* 0985CC 8009DB6C D9010060 */  stfd	f8, 0x60(r1)
lbl_8009DB70:
/* 0985D0 8009DB70 90610008 */  stw		r3, 8(r1)
/* 0985D4 8009DB74 9081000C */  stw		r4, 0xc(r1)
/* 0985D8 8009DB78 90A10010 */  stw		r5, 0x10(r1)
/* 0985DC 8009DB7C 90C10014 */  stw		r6, 0x14(r1)
/* 0985E0 8009DB80 90E10018 */  stw		r7, 0x18(r1)
/* 0985E4 8009DB84 9101001C */  stw		r8, 0x1c(r1)
/* 0985E8 8009DB88 91210020 */  stw		r9, 0x20(r1)
/* 0985EC 8009DB8C 91410024 */  stw		r10, 0x24(r1)
/* 0985F0 8009DB90 7C9D2378 */  mr		r29, r4
/* 0985F4 8009DB94 3C60800F */  lis		r3, D_800F0C48@ha
/* 0985F8 8009DB98 3BE30C48 */  addi	r31, r3, D_800F0C48@l
/* 0985FC 8009DB9C 4BFFDFED */  bl		PPCMfhid2
/* 098600 8009DBA0 7C7E1B78 */  mr		r30, r3
/* 098604 8009DBA4 4CC63182 */  crclr	6
/* 098608 8009DBA8 387F002C */  addi	r3, r31, 0x2c
/* 09860C 8009DBAC 48000A4D */  bl		OSReport
/* 098610 8009DBB0 80BD019C */  lwz		r5, 0x19c(r29)
/* 098614 8009DBB4 7FC4F378 */  mr		r4, r30
/* 098618 8009DBB8 387F0044 */  addi	r3, r31, 0x44
/* 09861C 8009DBBC 4CC63182 */  crclr	6
/* 098620 8009DBC0 48000A39 */  bl		OSReport
/* 098624 8009DBC4 57C00216 */  rlwinm	r0, r30, 0, 8, 0xb
/* 098628 8009DBC8 28000000 */  cmplwi	r0, 0
/* 09862C 8009DBCC 41820014 */  beq		lbl_8009DBE0
/* 098630 8009DBD0 801D019C */  lwz		r0, 0x19c(r29)
/* 098634 8009DBD4 54000294 */  rlwinm	r0, r0, 0, 0xa, 0xa
/* 098638 8009DBD8 28000000 */  cmplwi	r0, 0
/* 09863C 8009DBDC 4082001C */  bne		lbl_8009DBF8
lbl_8009DBE0:
/* 098640 8009DBE0 387F0060 */  addi	r3, r31, 0x60
/* 098644 8009DBE4 4CC63182 */  crclr	6
/* 098648 8009DBE8 48000A11 */  bl		OSReport
/* 09864C 8009DBEC 7FA3EB78 */  mr		r3, r29
/* 098650 8009DBF0 48000695 */  bl		OSDumpContext
/* 098654 8009DBF4 4BFFDF09 */  bl		PPCHalt
lbl_8009DBF8:
/* 098658 8009DBF8 387F0090 */  addi	r3, r31, 0x90
/* 09865C 8009DBFC 4CC63182 */  crclr	6
/* 098660 8009DC00 480009F9 */  bl		OSReport
/* 098664 8009DC04 387F00CC */  addi	r3, r31, 0xcc
/* 098668 8009DC08 4CC63182 */  crclr	6
/* 09866C 8009DC0C 480009ED */  bl		OSReport
/* 098670 8009DC10 57C00210 */  rlwinm	r0, r30, 0, 8, 8
/* 098674 8009DC14 28000000 */  cmplwi	r0, 0
/* 098678 8009DC18 41820010 */  beq		lbl_8009DC28
/* 09867C 8009DC1C 387F0104 */  addi	r3, r31, 0x104
/* 098680 8009DC20 4CC63182 */  crclr	6
/* 098684 8009DC24 480009D5 */  bl		OSReport
lbl_8009DC28:
/* 098688 8009DC28 57C00252 */  rlwinm	r0, r30, 0, 9, 9
/* 09868C 8009DC2C 28000000 */  cmplwi	r0, 0
/* 098690 8009DC30 41820010 */  beq		lbl_8009DC40
/* 098694 8009DC34 387F0144 */  addi	r3, r31, 0x144
/* 098698 8009DC38 4CC63182 */  crclr	6
/* 09869C 8009DC3C 480009BD */  bl		OSReport
lbl_8009DC40:
/* 0986A0 8009DC40 57C00294 */  rlwinm	r0, r30, 0, 0xa, 0xa
/* 0986A4 8009DC44 28000000 */  cmplwi	r0, 0
/* 0986A8 8009DC48 41820010 */  beq		lbl_8009DC58
/* 0986AC 8009DC4C 387F0170 */  addi	r3, r31, 0x170
/* 0986B0 8009DC50 4CC63182 */  crclr	6
/* 0986B4 8009DC54 480009A5 */  bl		OSReport
lbl_8009DC58:
/* 0986B8 8009DC58 57C002D6 */  rlwinm	r0, r30, 0, 0xb, 0xb
/* 0986BC 8009DC5C 28000000 */  cmplwi	r0, 0
/* 0986C0 8009DC60 41820010 */  beq		lbl_8009DC70
/* 0986C4 8009DC64 387F0190 */  addi	r3, r31, 0x190
/* 0986C8 8009DC68 4CC63182 */  crclr	6
/* 0986CC 8009DC6C 4800098D */  bl		OSReport
lbl_8009DC70:
/* 0986D0 8009DC70 7FC3F378 */  mr		r3, r30
/* 0986D4 8009DC74 4BFFDF1D */  bl		PPCMthid2
/* 0986D8 8009DC78 80010084 */  lwz		r0, 0x84(r1)
/* 0986DC 8009DC7C 83E1007C */  lwz		r31, 0x7c(r1)
/* 0986E0 8009DC80 83C10078 */  lwz		r30, 0x78(r1)
/* 0986E4 8009DC84 83A10074 */  lwz		r29, 0x74(r1)
/* 0986E8 8009DC88 38210080 */  addi	r1, r1, 0x80
/* 0986EC 8009DC8C 7C0803A6 */  mtlr	r0
/* 0986F0 8009DC90 4E800020 */  blr		

glabel __OSCacheInit
/* 0986F4 8009DC94 7C0802A6 */  mflr	r0
/* 0986F8 8009DC98 90010004 */  stw		r0, 4(r1)
/* 0986FC 8009DC9C 9421FFF0 */  stwu	r1, -0x10(r1)
/* 098700 8009DCA0 93E1000C */  stw		r31, 0xc(r1)
/* 098704 8009DCA4 93C10008 */  stw		r30, 8(r1)
/* 098708 8009DCA8 3C60800F */  lis		r3, D_800F0C48@ha
/* 09870C 8009DCAC 3BE30C48 */  addi	r31, r3, D_800F0C48@l
/* 098710 8009DCB0 4BFFDE1D */  bl		PPCMfhid0
/* 098714 8009DCB4 54600420 */  rlwinm	r0, r3, 0, 0x10, 0x10
/* 098718 8009DCB8 28000000 */  cmplwi	r0, 0
/* 09871C 8009DCBC 40820014 */  bne		lbl_8009DCD0
/* 098720 8009DCC0 4BFFFBB9 */  bl		ICEnable
/* 098724 8009DCC4 387F01AC */  addi	r3, r31, 0x1ac
/* 098728 8009DCC8 4CC63182 */  crclr	6
/* 09872C 8009DCCC 4800A0B1 */  bl		DBPrintf
lbl_8009DCD0:
/* 098730 8009DCD0 4BFFDDFD */  bl		PPCMfhid0
/* 098734 8009DCD4 54600462 */  rlwinm	r0, r3, 0, 0x11, 0x11
/* 098738 8009DCD8 28000000 */  cmplwi	r0, 0
/* 09873C 8009DCDC 40820014 */  bne		lbl_8009DCF0
/* 098740 8009DCE0 4BFFFA5D */  bl		DCEnable
/* 098744 8009DCE4 387F01C8 */  addi	r3, r31, 0x1c8
/* 098748 8009DCE8 4CC63182 */  crclr	6
/* 09874C 8009DCEC 4800A091 */  bl		DBPrintf
lbl_8009DCF0:
/* 098750 8009DCF0 4BFFDDED */  bl		PPCMfl2cr
/* 098754 8009DCF4 54600000 */  rlwinm	r0, r3, 0, 0, 0
/* 098758 8009DCF8 28000000 */  cmplwi	r0, 0
/* 09875C 8009DCFC 40820058 */  bne		lbl_8009DD54
/* 098760 8009DD00 4BFFDDBD */  bl		PPCMfmsr
/* 098764 8009DD04 7C7E1B78 */  mr		r30, r3
/* 098768 8009DD08 7C0004AC */  sync	0
/* 09876C 8009DD0C 38600030 */  li		r3, 0x30
/* 098770 8009DD10 4BFFDDB5 */  bl		PPCMtmsr
/* 098774 8009DD14 7C0004AC */  sync	0
/* 098778 8009DD18 7C0004AC */  sync	0
/* 09877C 8009DD1C 4BFFDDC1 */  bl		PPCMfl2cr
/* 098780 8009DD20 5463007E */  clrlwi	r3, r3, 1
/* 098784 8009DD24 4BFFDDC1 */  bl		PPCMtl2cr
/* 098788 8009DD28 7C0004AC */  sync	0
/* 09878C 8009DD2C 4BFFFD71 */  bl		L2GlobalInvalidate
/* 098790 8009DD30 7FC3F378 */  mr		r3, r30
/* 098794 8009DD34 4BFFDD91 */  bl		PPCMtmsr
/* 098798 8009DD38 4BFFDDA5 */  bl		PPCMfl2cr
/* 09879C 8009DD3C 64608000 */  oris	r0, r3, 0x8000
/* 0987A0 8009DD40 540302D2 */  rlwinm	r3, r0, 0, 0xb, 9
/* 0987A4 8009DD44 4BFFDDA1 */  bl		PPCMtl2cr
/* 0987A8 8009DD48 387F01E4 */  addi	r3, r31, 0x1e4
/* 0987AC 8009DD4C 4CC63182 */  crclr	6
/* 0987B0 8009DD50 4800A02D */  bl		DBPrintf
lbl_8009DD54:
/* 0987B4 8009DD54 3C60800A */  lis		r3, DMAErrorHandler@ha
/* 0987B8 8009DD58 3883DB34 */  addi	r4, r3, DMAErrorHandler@l
/* 0987BC 8009DD5C 38600001 */  li		r3, 1
/* 0987C0 8009DD60 48000A45 */  bl		OSSetErrorHandler
/* 0987C4 8009DD64 387F01FC */  addi	r3, r31, 0x1fc
/* 0987C8 8009DD68 4CC63182 */  crclr	6
/* 0987CC 8009DD6C 4800A011 */  bl		DBPrintf
/* 0987D0 8009DD70 80010014 */  lwz		r0, 0x14(r1)
/* 0987D4 8009DD74 83E1000C */  lwz		r31, 0xc(r1)
/* 0987D8 8009DD78 83C10008 */  lwz		r30, 8(r1)
/* 0987DC 8009DD7C 38210010 */  addi	r1, r1, 0x10
/* 0987E0 8009DD80 7C0803A6 */  mtlr	r0
/* 0987E4 8009DD84 4E800020 */  blr		


.section .data, "wa"

.balign 8

/* 000EDCC8 800F0C48 0029 */
D_800F0C48:
    .asciz ">>> L2 INVALIDATE : SHOULD NEVER HAPPEN\n"

.balign 4

/* 000EDCF4 800F0C74 0018 */
D_800F0C74:
    .asciz "Machine check received\n"

.balign 4

/* 000EDD0C 800F0C8C 001B */
D_800F0C8C:
    .asciz "HID2 = 0x%x   SRR1 = 0x%x\n"

.balign 4

/* 000EDD28 800F0CA8 0030 */
D_800F0CA8:
    .asciz "Machine check was not DMA/locked cache related\n"

.balign 4

/* 000EDD58 800F0CD8 003C */
D_800F0CD8:
    .asciz "DMAErrorHandler(): An error occurred while processing DMA.\n"

.balign 4

/* 000EDD94 800F0D14 0037 */
D_800F0D14:
    .asciz "The following errors have been detected and cleared :\n"

.balign 4

/* 000EDDCC 800F0D4C 003F */
D_800F0D4C:
    .asciz "\t- Requested a locked cache tag that was already in the cache\n"

.balign 4

/* 000EDE0C 800F0D8C 0029 */
D_800F0D8C:
    .asciz "\t- DMA attempted to access normal cache\n"

.balign 4

/* 000EDE38 800F0DB8 001D */
D_800F0DB8:
    .asciz "\t- DMA missed in data cache\n"

.balign 4

/* 000EDE58 800F0DD8 0019 */
D_800F0DD8:
    .asciz "\t- DMA queue overflowed\n"

.balign 4

/* 000EDE74 800F0DF4 0019 */
D_800F0DF4:
    .asciz "L1 i-caches initialized\n"

.balign 4

/* 000EDE90 800F0E10 0019 */
D_800F0E10:
    .asciz "L1 d-caches initialized\n"

.balign 4

/* 000EDEAC 800F0E2C 0016 */
D_800F0E2C:
    .asciz "L2 cache initialized\n"

.balign 4

/* 000EDEC4 800F0E44 002E */
D_800F0E44:
    .asciz "Locked cache machine check handler installed\n"


