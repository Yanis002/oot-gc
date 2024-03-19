# strtoul.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x800CF654 - 0x800CFA60

glabel atoi
/* 0CC654 800CF654 7C0802A6 */  mflr      r0
/* 0CC658 800CF658 90010004 */  stw       r0, 0x4(r1)
/* 0CC65C 800CF65C 38000000 */  li        r0, 0x0
/* 0CC660 800CF660 9421FFD0 */  stwu      r1, -0x30(r1)
/* 0CC664 800CF664 93E1002C */  stw       r31, 0x2c(r1)
/* 0CC668 800CF668 3FE08000 */  lis       r31, 0x8000
/* 0CC66C 800CF66C 389FFFFF */  subi      r4, r31, 0x1
/* 0CC670 800CF670 90610018 */  stw       r3, 0x18(r1)
/* 0CC674 800CF674 3C60800D */  lis       r3, __StringRead@ha
/* 0CC678 800CF678 38A3F318 */  addi      r5, r3, __StringRead@l
/* 0CC67C 800CF67C 9001001C */  stw       r0, 0x1c(r1)
/* 0CC680 800CF680 38C10018 */  addi      r6, r1, 0x18
/* 0CC684 800CF684 38E1000C */  addi      r7, r1, 0xc
/* 0CC688 800CF688 39010010 */  addi      r8, r1, 0x10
/* 0CC68C 800CF68C 39210014 */  addi      r9, r1, 0x14
/* 0CC690 800CF690 3860000A */  li        r3, 0xa
/* 0CC694 800CF694 48000085 */  bl        __strtoul
/* 0CC698 800CF698 80010014 */  lwz       r0, 0x14(r1)
/* 0CC69C 800CF69C 2C000000 */  cmpwi     r0, 0x0
/* 0CC6A0 800CF6A0 40820030 */  bne       lbl_800CF6D0
/* 0CC6A4 800CF6A4 80810010 */  lwz       r4, 0x10(r1)
/* 0CC6A8 800CF6A8 2C040000 */  cmpwi     r4, 0x0
/* 0CC6AC 800CF6AC 40820010 */  bne       lbl_800CF6BC
/* 0CC6B0 800CF6B0 381FFFFF */  subi      r0, r31, 0x1
/* 0CC6B4 800CF6B4 7C030040 */  cmplw     r3, r0
/* 0CC6B8 800CF6B8 41810018 */  bgt       lbl_800CF6D0
lbl_800CF6BC:
/* 0CC6BC 800CF6BC 2C040000 */  cmpwi     r4, 0x0
/* 0CC6C0 800CF6C0 41820038 */  beq       lbl_800CF6F8
/* 0CC6C4 800CF6C4 3C008000 */  lis       r0, 0x8000
/* 0CC6C8 800CF6C8 7C030040 */  cmplw     r3, r0
/* 0CC6CC 800CF6CC 4081002C */  ble       lbl_800CF6F8
lbl_800CF6D0:
/* 0CC6D0 800CF6D0 80010010 */  lwz       r0, 0x10(r1)
/* 0CC6D4 800CF6D4 2C000000 */  cmpwi     r0, 0x0
/* 0CC6D8 800CF6D8 4182000C */  beq       lbl_800CF6E4
/* 0CC6DC 800CF6DC 3C608000 */  lis       r3, 0x8000
/* 0CC6E0 800CF6E0 4800000C */  b         lbl_800CF6EC
lbl_800CF6E4:
/* 0CC6E4 800CF6E4 3C608000 */  lis       r3, 0x8000
/* 0CC6E8 800CF6E8 3863FFFF */  subi      r3, r3, 0x1
lbl_800CF6EC:
/* 0CC6EC 800CF6EC 38000022 */  li        r0, 0x22
/* 0CC6F0 800CF6F0 900D8F98 */  stw       r0, D_8018BF18@sda21(r0)
/* 0CC6F4 800CF6F4 48000010 */  b         lbl_800CF704
lbl_800CF6F8:
/* 0CC6F8 800CF6F8 2C040000 */  cmpwi     r4, 0x0
/* 0CC6FC 800CF6FC 41820008 */  beq       lbl_800CF704
/* 0CC700 800CF700 7C6300D0 */  neg       r3, r3
lbl_800CF704:
/* 0CC704 800CF704 80010034 */  lwz       r0, 0x34(r1)
/* 0CC708 800CF708 83E1002C */  lwz       r31, 0x2c(r1)
/* 0CC70C 800CF70C 38210030 */  addi      r1, r1, 0x30
/* 0CC710 800CF710 7C0803A6 */  mtlr      r0
/* 0CC714 800CF714 4E800020 */  blr

glabel __strtoul
/* 0CC718 800CF718 7C0802A6 */  mflr      r0
/* 0CC71C 800CF71C 90010004 */  stw       r0, 0x4(r1)
/* 0CC720 800CF720 38000000 */  li        r0, 0x0
/* 0CC724 800CF724 9421FFA0 */  stwu      r1, -0x60(r1)
/* 0CC728 800CF728 BE410028 */  stmw      r18, 0x28(r1)
/* 0CC72C 800CF72C 7C7C1B79 */  mr.       r28, r3
/* 0CC730 800CF730 3AE90000 */  addi      r23, r9, 0x0
/* 0CC734 800CF734 7D154378 */  mr        r21, r8
/* 0CC738 800CF738 3AC40000 */  addi      r22, r4, 0x0
/* 0CC73C 800CF73C 3BA50000 */  addi      r29, r5, 0x0
/* 0CC740 800CF740 3BC60000 */  addi      r30, r6, 0x0
/* 0CC744 800CF744 3A670000 */  addi      r19, r7, 0x0
/* 0CC748 800CF748 3B000001 */  li        r24, 0x1
/* 0CC74C 800CF74C 3BE00000 */  li        r31, 0x0
/* 0CC750 800CF750 3B600000 */  li        r27, 0x0
/* 0CC754 800CF754 3B400000 */  li        r26, 0x0
/* 0CC758 800CF758 90090000 */  stw       r0, 0x0(r9)
/* 0CC75C 800CF75C 90080000 */  stw       r0, 0x0(r8)
/* 0CC760 800CF760 4180001C */  blt       lbl_800CF77C
/* 0CC764 800CF764 2C1C0001 */  cmpwi     r28, 0x1
/* 0CC768 800CF768 41820014 */  beq       lbl_800CF77C
/* 0CC76C 800CF76C 2C1C0024 */  cmpwi     r28, 0x24
/* 0CC770 800CF770 4181000C */  bgt       lbl_800CF77C
/* 0CC774 800CF774 2C160001 */  cmpwi     r22, 0x1
/* 0CC778 800CF778 4080000C */  bge       lbl_800CF784
lbl_800CF77C:
/* 0CC77C 800CF77C 3B000040 */  li        r24, 0x40
/* 0CC780 800CF780 48000024 */  b         lbl_800CF7A4
lbl_800CF784:
/* 0CC784 800CF784 399D0000 */  addi      r12, r29, 0x0
/* 0CC788 800CF788 7D8803A6 */  mtlr      r12
/* 0CC78C 800CF78C 387E0000 */  addi      r3, r30, 0x0
/* 0CC790 800CF790 3BE00001 */  li        r31, 0x1
/* 0CC794 800CF794 38800000 */  li        r4, 0x0
/* 0CC798 800CF798 38A00000 */  li        r5, 0x0
/* 0CC79C 800CF79C 4E800021 */  blrl
/* 0CC7A0 800CF7A0 7C721B78 */  mr        r18, r3
lbl_800CF7A4:
/* 0CC7A4 800CF7A4 2C1C0000 */  cmpwi     r28, 0x0
/* 0CC7A8 800CF7A8 4182000C */  beq       lbl_800CF7B4
/* 0CC7AC 800CF7AC 3800FFFF */  li        r0, -0x1
/* 0CC7B0 800CF7B0 7F40E396 */  divwu     r26, r0, r28
lbl_800CF7B4:
/* 0CC7B4 800CF7B4 3C60800D */  lis       r3, D_800D1F90@ha
/* 0CC7B8 800CF7B8 3C80800F */  lis       r4, jtbl_800F5190@ha
/* 0CC7BC 800CF7BC 3B231F90 */  addi      r25, r3, D_800D1F90@l
/* 0CC7C0 800CF7C0 3A845190 */  addi      r20, r4, jtbl_800F5190@l
/* 0CC7C4 800CF7C4 48000238 */  b         lbl_800CF9FC
lbl_800CF7C8:
/* 0CC7C8 800CF7C8 28180010 */  cmplwi    r24, 0x10
/* 0CC7CC 800CF7CC 41810230 */  bgt       lbl_800CF9FC
/* 0CC7D0 800CF7D0 5700103A */  slwi      r0, r24, 2
/* 0CC7D4 800CF7D4 7C14002E */  lwzx      r0, r20, r0
/* 0CC7D8 800CF7D8 7C0903A6 */  mtctr     r0
/* 0CC7DC 800CF7DC 4E800420 */  bctr
lbl_800CF7E0:
/* 0CC7E0 800CF7E0 5640063E */  clrlwi    r0, r18, 24
/* 0CC7E4 800CF7E4 7C790214 */  add       r3, r25, r0
/* 0CC7E8 800CF7E8 88030000 */  lbz       r0, 0x0(r3)
/* 0CC7EC 800CF7EC 5400077D */  rlwinm.   r0, r0, 0, 29, 30
/* 0CC7F0 800CF7F0 41820028 */  beq       lbl_800CF818
/* 0CC7F4 800CF7F4 399D0000 */  addi      r12, r29, 0x0
/* 0CC7F8 800CF7F8 7D8803A6 */  mtlr      r12
/* 0CC7FC 800CF7FC 387E0000 */  addi      r3, r30, 0x0
/* 0CC800 800CF800 38800000 */  li        r4, 0x0
/* 0CC804 800CF804 38A00000 */  li        r5, 0x0
/* 0CC808 800CF808 3BFF0001 */  addi      r31, r31, 0x1
/* 0CC80C 800CF80C 4E800021 */  blrl
/* 0CC810 800CF810 7C721B78 */  mr        r18, r3
/* 0CC814 800CF814 480001E8 */  b         lbl_800CF9FC
lbl_800CF818:
/* 0CC818 800CF818 2C12002B */  cmpwi     r18, 0x2b
/* 0CC81C 800CF81C 40820028 */  bne       lbl_800CF844
/* 0CC820 800CF820 399D0000 */  addi      r12, r29, 0x0
/* 0CC824 800CF824 7D8803A6 */  mtlr      r12
/* 0CC828 800CF828 387E0000 */  addi      r3, r30, 0x0
/* 0CC82C 800CF82C 38800000 */  li        r4, 0x0
/* 0CC830 800CF830 38A00000 */  li        r5, 0x0
/* 0CC834 800CF834 3BFF0001 */  addi      r31, r31, 0x1
/* 0CC838 800CF838 4E800021 */  blrl
/* 0CC83C 800CF83C 7C721B78 */  mr        r18, r3
/* 0CC840 800CF840 48000034 */  b         lbl_800CF874
lbl_800CF844:
/* 0CC844 800CF844 2C12002D */  cmpwi     r18, 0x2d
/* 0CC848 800CF848 4082002C */  bne       lbl_800CF874
/* 0CC84C 800CF84C 399D0000 */  addi      r12, r29, 0x0
/* 0CC850 800CF850 7D8803A6 */  mtlr      r12
/* 0CC854 800CF854 387E0000 */  addi      r3, r30, 0x0
/* 0CC858 800CF858 38800000 */  li        r4, 0x0
/* 0CC85C 800CF85C 38A00000 */  li        r5, 0x0
/* 0CC860 800CF860 3BFF0001 */  addi      r31, r31, 0x1
/* 0CC864 800CF864 4E800021 */  blrl
/* 0CC868 800CF868 38000001 */  li        r0, 0x1
/* 0CC86C 800CF86C 90150000 */  stw       r0, 0x0(r21)
/* 0CC870 800CF870 7C721B78 */  mr        r18, r3
lbl_800CF874:
/* 0CC874 800CF874 3B000002 */  li        r24, 0x2
/* 0CC878 800CF878 48000184 */  b         lbl_800CF9FC
lbl_800CF87C:
/* 0CC87C 800CF87C 2C1C0000 */  cmpwi     r28, 0x0
/* 0CC880 800CF880 4182000C */  beq       lbl_800CF88C
/* 0CC884 800CF884 2C1C0010 */  cmpwi     r28, 0x10
/* 0CC888 800CF888 40820034 */  bne       lbl_800CF8BC
lbl_800CF88C:
/* 0CC88C 800CF88C 2C120030 */  cmpwi     r18, 0x30
/* 0CC890 800CF890 4082002C */  bne       lbl_800CF8BC
/* 0CC894 800CF894 399D0000 */  addi      r12, r29, 0x0
/* 0CC898 800CF898 7D8803A6 */  mtlr      r12
/* 0CC89C 800CF89C 387E0000 */  addi      r3, r30, 0x0
/* 0CC8A0 800CF8A0 3B000004 */  li        r24, 0x4
/* 0CC8A4 800CF8A4 38800000 */  li        r4, 0x0
/* 0CC8A8 800CF8A8 38A00000 */  li        r5, 0x0
/* 0CC8AC 800CF8AC 3BFF0001 */  addi      r31, r31, 0x1
/* 0CC8B0 800CF8B0 4E800021 */  blrl
/* 0CC8B4 800CF8B4 7C721B78 */  mr        r18, r3
/* 0CC8B8 800CF8B8 48000144 */  b         lbl_800CF9FC
lbl_800CF8BC:
/* 0CC8BC 800CF8BC 3B000008 */  li        r24, 0x8
/* 0CC8C0 800CF8C0 4800013C */  b         lbl_800CF9FC
lbl_800CF8C4:
/* 0CC8C4 800CF8C4 2C120058 */  cmpwi     r18, 0x58
/* 0CC8C8 800CF8C8 4182000C */  beq       lbl_800CF8D4
/* 0CC8CC 800CF8CC 2C120078 */  cmpwi     r18, 0x78
/* 0CC8D0 800CF8D0 40820030 */  bne       lbl_800CF900
lbl_800CF8D4:
/* 0CC8D4 800CF8D4 399D0000 */  addi      r12, r29, 0x0
/* 0CC8D8 800CF8D8 7D8803A6 */  mtlr      r12
/* 0CC8DC 800CF8DC 387E0000 */  addi      r3, r30, 0x0
/* 0CC8E0 800CF8E0 3B800010 */  li        r28, 0x10
/* 0CC8E4 800CF8E4 3B000008 */  li        r24, 0x8
/* 0CC8E8 800CF8E8 38800000 */  li        r4, 0x0
/* 0CC8EC 800CF8EC 38A00000 */  li        r5, 0x0
/* 0CC8F0 800CF8F0 3BFF0001 */  addi      r31, r31, 0x1
/* 0CC8F4 800CF8F4 4E800021 */  blrl
/* 0CC8F8 800CF8F8 7C721B78 */  mr        r18, r3
/* 0CC8FC 800CF8FC 48000100 */  b         lbl_800CF9FC
lbl_800CF900:
/* 0CC900 800CF900 2C1C0000 */  cmpwi     r28, 0x0
/* 0CC904 800CF904 40820008 */  bne       lbl_800CF90C
/* 0CC908 800CF908 3B800008 */  li        r28, 0x8
lbl_800CF90C:
/* 0CC90C 800CF90C 3B000010 */  li        r24, 0x10
/* 0CC910 800CF910 480000EC */  b         lbl_800CF9FC
lbl_800CF914:
/* 0CC914 800CF914 2C1C0000 */  cmpwi     r28, 0x0
/* 0CC918 800CF918 40820008 */  bne       lbl_800CF920
/* 0CC91C 800CF91C 3B80000A */  li        r28, 0xa
lbl_800CF920:
/* 0CC920 800CF920 281A0000 */  cmplwi    r26, 0x0
/* 0CC924 800CF924 4082000C */  bne       lbl_800CF930
/* 0CC928 800CF928 3800FFFF */  li        r0, -0x1
/* 0CC92C 800CF92C 7F40E396 */  divwu     r26, r0, r28
lbl_800CF930:
/* 0CC930 800CF930 5640063E */  clrlwi    r0, r18, 24
/* 0CC934 800CF934 7C790214 */  add       r3, r25, r0
/* 0CC938 800CF938 88630000 */  lbz       r3, 0x0(r3)
/* 0CC93C 800CF93C 546006F7 */  rlwinm.   r0, r3, 0, 27, 27
/* 0CC940 800CF940 4182002C */  beq       lbl_800CF96C
/* 0CC944 800CF944 3A52FFD0 */  subi      r18, r18, 0x30
/* 0CC948 800CF948 7C12E000 */  cmpw      r18, r28
/* 0CC94C 800CF94C 41800060 */  blt       lbl_800CF9AC
/* 0CC950 800CF950 2C180010 */  cmpwi     r24, 0x10
/* 0CC954 800CF954 4082000C */  bne       lbl_800CF960
/* 0CC958 800CF958 3B000020 */  li        r24, 0x20
/* 0CC95C 800CF95C 48000008 */  b         lbl_800CF964
lbl_800CF960:
/* 0CC960 800CF960 3B000040 */  li        r24, 0x40
lbl_800CF964:
/* 0CC964 800CF964 3A520030 */  addi      r18, r18, 0x30
/* 0CC968 800CF968 48000094 */  b         lbl_800CF9FC
lbl_800CF96C:
/* 0CC96C 800CF96C 54600633 */  rlwinm.   r0, r3, 0, 24, 25
/* 0CC970 800CF970 41820018 */  beq       lbl_800CF988
/* 0CC974 800CF974 7E439378 */  mr        r3, r18
/* 0CC978 800CF978 4BFFD809 */  bl        toupper
/* 0CC97C 800CF97C 3803FFC9 */  subi      r0, r3, 0x37
/* 0CC980 800CF980 7C00E000 */  cmpw      r0, r28
/* 0CC984 800CF984 4180001C */  blt       lbl_800CF9A0
lbl_800CF988:
/* 0CC988 800CF988 2C180010 */  cmpwi     r24, 0x10
/* 0CC98C 800CF98C 4082000C */  bne       lbl_800CF998
/* 0CC990 800CF990 3B000020 */  li        r24, 0x20
/* 0CC994 800CF994 48000068 */  b         lbl_800CF9FC
lbl_800CF998:
/* 0CC998 800CF998 3B000040 */  li        r24, 0x40
/* 0CC99C 800CF99C 48000060 */  b         lbl_800CF9FC
lbl_800CF9A0:
/* 0CC9A0 800CF9A0 7E439378 */  mr        r3, r18
/* 0CC9A4 800CF9A4 4BFFD7DD */  bl        toupper
/* 0CC9A8 800CF9A8 3A43FFC9 */  subi      r18, r3, 0x37
lbl_800CF9AC:
/* 0CC9AC 800CF9AC 7C1BD040 */  cmplw     r27, r26
/* 0CC9B0 800CF9B0 4081000C */  ble       lbl_800CF9BC
/* 0CC9B4 800CF9B4 38000001 */  li        r0, 0x1
/* 0CC9B8 800CF9B8 90170000 */  stw       r0, 0x0(r23)
lbl_800CF9BC:
/* 0CC9BC 800CF9BC 7F7BE1D6 */  mullw     r27, r27, r28
/* 0CC9C0 800CF9C0 201BFFFF */  subfic    r0, r27, -0x1
/* 0CC9C4 800CF9C4 7C120040 */  cmplw     r18, r0
/* 0CC9C8 800CF9C8 4081000C */  ble       lbl_800CF9D4
/* 0CC9CC 800CF9CC 38000001 */  li        r0, 0x1
/* 0CC9D0 800CF9D0 90170000 */  stw       r0, 0x0(r23)
lbl_800CF9D4:
/* 0CC9D4 800CF9D4 399D0000 */  addi      r12, r29, 0x0
/* 0CC9D8 800CF9D8 7D8803A6 */  mtlr      r12
/* 0CC9DC 800CF9DC 387E0000 */  addi      r3, r30, 0x0
/* 0CC9E0 800CF9E0 7F7B9214 */  add       r27, r27, r18
/* 0CC9E4 800CF9E4 3B000010 */  li        r24, 0x10
/* 0CC9E8 800CF9E8 38800000 */  li        r4, 0x0
/* 0CC9EC 800CF9EC 38A00000 */  li        r5, 0x0
/* 0CC9F0 800CF9F0 3BFF0001 */  addi      r31, r31, 0x1
/* 0CC9F4 800CF9F4 4E800021 */  blrl
/* 0CC9F8 800CF9F8 7C721B78 */  mr        r18, r3
lbl_800CF9FC:
/* 0CC9FC 800CF9FC 7C1FB000 */  cmpw      r31, r22
/* 0CCA00 800CFA00 41810014 */  bgt       lbl_800CFA14
/* 0CCA04 800CFA04 2C12FFFF */  cmpwi     r18, -0x1
/* 0CCA08 800CFA08 4182000C */  beq       lbl_800CFA14
/* 0CCA0C 800CFA0C 57000675 */  rlwinm.   r0, r24, 0, 25, 26
/* 0CCA10 800CFA10 4182FDB8 */  beq       lbl_800CF7C8
lbl_800CFA14:
/* 0CCA14 800CFA14 73000034 */  andi.     r0, r24, 0x34
/* 0CCA18 800CFA18 40820010 */  bne       lbl_800CFA28
/* 0CCA1C 800CFA1C 3B600000 */  li        r27, 0x0
/* 0CCA20 800CFA20 3BE00000 */  li        r31, 0x0
/* 0CCA24 800CFA24 48000008 */  b         lbl_800CFA2C
lbl_800CFA28:
/* 0CCA28 800CFA28 3BFFFFFF */  subi      r31, r31, 0x1
lbl_800CFA2C:
/* 0CCA2C 800CFA2C 7FACEB78 */  mr        r12, r29
/* 0CCA30 800CFA30 93F30000 */  stw       r31, 0x0(r19)
/* 0CCA34 800CFA34 7D8803A6 */  mtlr      r12
/* 0CCA38 800CFA38 387E0000 */  addi      r3, r30, 0x0
/* 0CCA3C 800CFA3C 38920000 */  addi      r4, r18, 0x0
/* 0CCA40 800CFA40 38A00001 */  li        r5, 0x1
/* 0CCA44 800CFA44 4E800021 */  blrl
/* 0CCA48 800CFA48 7F63DB78 */  mr        r3, r27
/* 0CCA4C 800CFA4C BA410028 */  lmw       r18, 0x28(r1)
/* 0CCA50 800CFA50 80010064 */  lwz       r0, 0x64(r1)
/* 0CCA54 800CFA54 38210060 */  addi      r1, r1, 0x60
/* 0CCA58 800CFA58 7C0803A6 */  mtlr      r0
/* 0CCA5C 800CFA5C 4E800020 */  blr

# 0x800F5190 - 0x800F51D8
.section .data, "wa"

.balign 8

jtbl_800F5190:
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF7E0
	.long __strtoul, lbl_800CF87C
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF8C4
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF914
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF9FC
	.long __strtoul, lbl_800CF914

glabel gap_05_800F51D4_data
.hidden gap_05_800F51D4_data
	.long 0x00000000
