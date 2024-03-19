# library.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x8008E814 - 0x80096F70

glabel libraryEvent
/* 08B814 8008E814 2C040003 */  cmpwi     r4, 0x3
/* 08B818 8008E818 41820060 */  beq       lbl_8008E878
/* 08B81C 8008E81C 40800018 */  bge       lbl_8008E834
/* 08B820 8008E820 2C040002 */  cmpwi     r4, 0x2
/* 08B824 8008E824 4080001C */  bge       lbl_8008E840
/* 08B828 8008E828 2C040000 */  cmpwi     r4, 0x0
/* 08B82C 8008E82C 4080004C */  bge       lbl_8008E878
/* 08B830 8008E830 48000040 */  b         lbl_8008E870
lbl_8008E834:
/* 08B834 8008E834 2C041002 */  cmpwi     r4, 0x1002
/* 08B838 8008E838 41820040 */  beq       lbl_8008E878
/* 08B83C 8008E83C 48000034 */  b         lbl_8008E870
lbl_8008E840:
/* 08B840 8008E840 38E00000 */  li        r7, 0x0
/* 08B844 8008E844 90E30000 */  stw       r7, 0x0(r3)
/* 08B848 8008E848 3C80800F */  lis       r4, D_800F03EC@ha
/* 08B84C 8008E84C 38C0FFFF */  li        r6, -0x1
/* 08B850 8008E850 90A30004 */  stw       r5, 0x4(r3)
/* 08B854 8008E854 388403EC */  addi      r4, r4, D_800F03EC@l
/* 08B858 8008E858 38000036 */  li        r0, 0x36
/* 08B85C 8008E85C 90C30010 */  stw       r6, 0x10(r3)
/* 08B860 8008E860 90E30008 */  stw       r7, 0x8(r3)
/* 08B864 8008E864 90830014 */  stw       r4, 0x14(r3)
/* 08B868 8008E868 9003000C */  stw       r0, 0xc(r3)
/* 08B86C 8008E86C 4800000C */  b         lbl_8008E878
lbl_8008E870:
/* 08B870 8008E870 38600000 */  li        r3, 0x0
/* 08B874 8008E874 4E800020 */  blr
lbl_8008E878:
/* 08B878 8008E878 38600001 */  li        r3, 0x1
/* 08B87C 8008E87C 4E800020 */  blr

glabel libraryCall
/* 08B880 8008E880 7C0802A6 */  mflr      r0
/* 08B884 8008E884 90010004 */  stw       r0, 0x4(r1)
/* 08B888 8008E888 9421FFD8 */  stwu      r1, -0x28(r1)
/* 08B88C 8008E88C 93E10024 */  stw       r31, 0x24(r1)
/* 08B890 8008E890 3BE50000 */  addi      r31, r5, 0x0
/* 08B894 8008E894 93C10020 */  stw       r30, 0x20(r1)
/* 08B898 8008E898 3BC40000 */  addi      r30, r4, 0x0
/* 08B89C 8008E89C 93A1001C */  stw       r29, 0x1c(r1)
/* 08B8A0 8008E8A0 7C7D1B78 */  mr        r29, r3
/* 08B8A4 8008E8A4 80030000 */  lwz       r0, 0x0(r3)
/* 08B8A8 8008E8A8 540007FF */  clrlwi.   r0, r0, 31
/* 08B8AC 8008E8AC 40820058 */  bne       lbl_8008E904
/* 08B8B0 8008E8B0 2C1FFFFF */  cmpwi     r31, -0x1
/* 08B8B4 8008E8B4 4082000C */  bne       lbl_8008E8C0
/* 08B8B8 8008E8B8 38800001 */  li        r4, 0x1
/* 08B8BC 8008E8BC 48000008 */  b         lbl_8008E8C4
lbl_8008E8C0:
/* 08B8C0 8008E8C0 38800000 */  li        r4, 0x0
lbl_8008E8C4:
/* 08B8C4 8008E8C4 7FA3EB78 */  mr        r3, r29
/* 08B8C8 8008E8C8 480016BD */  bl        libraryFindException
/* 08B8CC 8008E8CC 2C030000 */  cmpwi     r3, 0x0
/* 08B8D0 8008E8D0 41820034 */  beq       lbl_8008E904
/* 08B8D4 8008E8D4 801D0000 */  lwz       r0, 0x0(r29)
/* 08B8D8 8008E8D8 387D0000 */  addi      r3, r29, 0x0
/* 08B8DC 8008E8DC 60000001 */  ori       r0, r0, 0x1
/* 08B8E0 8008E8E0 901D0000 */  stw       r0, 0x0(r29)
/* 08B8E4 8008E8E4 48000F6D */  bl        libraryFindVariables
/* 08B8E8 8008E8E8 2C030000 */  cmpwi     r3, 0x0
/* 08B8EC 8008E8EC 41820018 */  beq       lbl_8008E904
/* 08B8F0 8008E8F0 801D0000 */  lwz       r0, 0x0(r29)
/* 08B8F4 8008E8F4 387D0000 */  addi      r3, r29, 0x0
/* 08B8F8 8008E8F8 60000002 */  ori       r0, r0, 0x2
/* 08B8FC 8008E8FC 901D0000 */  stw       r0, 0x0(r29)
/* 08B900 8008E900 48000A41 */  bl        libraryFindFunctions
lbl_8008E904:
/* 08B904 8008E904 2C1FFFFF */  cmpwi     r31, -0x1
/* 08B908 8008E908 40820028 */  bne       lbl_8008E930
/* 08B90C 8008E90C 801D0000 */  lwz       r0, 0x0(r29)
/* 08B910 8008E910 60000001 */  ori       r0, r0, 0x1
/* 08B914 8008E914 901D0000 */  stw       r0, 0x0(r29)
/* 08B918 8008E918 801D0000 */  lwz       r0, 0x0(r29)
/* 08B91C 8008E91C 540007BD */  rlwinm.   r0, r0, 0, 30, 30
/* 08B920 8008E920 41820038 */  beq       lbl_8008E958
/* 08B924 8008E924 7FC3F378 */  mr        r3, r30
/* 08B928 8008E928 48007965 */  bl        __osException
/* 08B92C 8008E92C 4800002C */  b         lbl_8008E958
lbl_8008E930:
/* 08B930 8008E930 1C1F004C */  mulli     r0, r31, 0x4c
/* 08B934 8008E934 3C60800F */  lis       r3, D_800F03EC@ha
/* 08B938 8008E938 386303EC */  addi      r3, r3, D_800F03EC@l
/* 08B93C 8008E93C 7C630214 */  add       r3, r3, r0
/* 08B940 8008E940 81830004 */  lwz       r12, 0x4(r3)
/* 08B944 8008E944 280C0000 */  cmplwi    r12, 0x0
/* 08B948 8008E948 41820010 */  beq       lbl_8008E958
/* 08B94C 8008E94C 7D8803A6 */  mtlr      r12
/* 08B950 8008E950 387E0000 */  addi      r3, r30, 0x0
/* 08B954 8008E954 4E800021 */  blrl
lbl_8008E958:
/* 08B958 8008E958 8001002C */  lwz       r0, 0x2c(r1)
/* 08B95C 8008E95C 38600001 */  li        r3, 0x1
/* 08B960 8008E960 83E10024 */  lwz       r31, 0x24(r1)
/* 08B964 8008E964 83C10020 */  lwz       r30, 0x20(r1)
/* 08B968 8008E968 7C0803A6 */  mtlr      r0
/* 08B96C 8008E96C 83A1001C */  lwz       r29, 0x1c(r1)
/* 08B970 8008E970 38210028 */  addi      r1, r1, 0x28
/* 08B974 8008E974 4E800020 */  blr

glabel libraryFunctionReplaced
/* 08B978 8008E978 1C04004C */  mulli     r0, r4, 0x4c
/* 08B97C 8008E97C 3C60800F */  lis       r3, D_800F03EC@ha
/* 08B980 8008E980 386303EC */  addi      r3, r3, D_800F03EC@l
/* 08B984 8008E984 7C830214 */  add       r4, r3, r0
/* 08B988 8008E988 3C608009 */  lis       r3, send_mesg@ha
/* 08B98C 8008E98C 80840004 */  lwz       r4, 0x4(r4)
/* 08B990 8008E990 38035EFC */  addi      r0, r3, send_mesg@l
/* 08B994 8008E994 7C040040 */  cmplw     r4, r0
/* 08B998 8008E998 4082000C */  bne       lbl_8008E9A4
/* 08B99C 8008E99C 38600000 */  li        r3, 0x0
/* 08B9A0 8008E9A0 4E800020 */  blr
lbl_8008E9A4:
/* 08B9A4 8008E9A4 3C608009 */  lis       r3, __osEnqueueAndYield@ha
/* 08B9A8 8008E9A8 38035C10 */  addi      r0, r3, __osEnqueueAndYield@l
/* 08B9AC 8008E9AC 7C040040 */  cmplw     r4, r0
/* 08B9B0 8008E9B0 4082000C */  bne       lbl_8008E9BC
/* 08B9B4 8008E9B4 38600000 */  li        r3, 0x0
/* 08B9B8 8008E9B8 4E800020 */  blr
lbl_8008E9BC:
/* 08B9BC 8008E9BC 3C608009 */  lis       r3, __osEnqueueThread@ha
/* 08B9C0 8008E9C0 380359E8 */  addi      r0, r3, __osEnqueueThread@l
/* 08B9C4 8008E9C4 7C040040 */  cmplw     r4, r0
/* 08B9C8 8008E9C8 4082000C */  bne       lbl_8008E9D4
/* 08B9CC 8008E9CC 38600000 */  li        r3, 0x0
/* 08B9D0 8008E9D0 4E800020 */  blr
lbl_8008E9D4:
/* 08B9D4 8008E9D4 3C608009 */  lis       r3, __osPopThread@ha
/* 08B9D8 8008E9D8 38035914 */  addi      r0, r3, __osPopThread@l
/* 08B9DC 8008E9DC 7C040040 */  cmplw     r4, r0
/* 08B9E0 8008E9E0 4082000C */  bne       lbl_8008E9EC
/* 08B9E4 8008E9E4 38600000 */  li        r3, 0x0
/* 08B9E8 8008E9E8 4E800020 */  blr
lbl_8008E9EC:
/* 08B9EC 8008E9EC 3C608009 */  lis       r3, __osDispatchThread@ha
/* 08B9F0 8008E9F0 38035370 */  addi      r0, r3, __osDispatchThread@l
/* 08B9F4 8008E9F4 7C040040 */  cmplw     r4, r0
/* 08B9F8 8008E9F8 4082000C */  bne       lbl_8008EA04
/* 08B9FC 8008E9FC 38600000 */  li        r3, 0x0
/* 08BA00 8008EA00 4E800020 */  blr
lbl_8008EA04:
/* 08BA04 8008EA04 3C608009 */  lis       r3, __sinf@ha
/* 08BA08 8008EA08 380350C0 */  addi      r0, r3, __sinf@l
/* 08BA0C 8008EA0C 7C040040 */  cmplw     r4, r0
/* 08BA10 8008EA10 4082000C */  bne       lbl_8008EA1C
/* 08BA14 8008EA14 38600000 */  li        r3, 0x0
/* 08BA18 8008EA18 4E800020 */  blr
lbl_8008EA1C:
/* 08BA1C 8008EA1C 3C608009 */  lis       r3, osViSwapBuffer_Entry@ha
/* 08BA20 8008EA20 380302AC */  addi      r0, r3, osViSwapBuffer_Entry@l
/* 08BA24 8008EA24 7C040040 */  cmplw     r4, r0
/* 08BA28 8008EA28 4082000C */  bne       lbl_8008EA34
/* 08BA2C 8008EA2C 38600000 */  li        r3, 0x0
/* 08BA30 8008EA30 4E800020 */  blr
lbl_8008EA34:
/* 08BA34 8008EA34 3C608009 */  lis       r3, zeldaLoadSZS_Entry@ha
/* 08BA38 8008EA38 38030298 */  addi      r0, r3, zeldaLoadSZS_Entry@l
/* 08BA3C 8008EA3C 7C040040 */  cmplw     r4, r0
/* 08BA40 8008EA40 4082000C */  bne       lbl_8008EA4C
/* 08BA44 8008EA44 38600000 */  li        r3, 0x0
/* 08BA48 8008EA48 4E800020 */  blr
lbl_8008EA4C:
/* 08BA4C 8008EA4C 3C608009 */  lis       r3, zeldaLoadSZS_Exit@ha
/* 08BA50 8008EA50 38030284 */  addi      r0, r3, zeldaLoadSZS_Exit@l
/* 08BA54 8008EA54 7C040040 */  cmplw     r4, r0
/* 08BA58 8008EA58 4082000C */  bne       lbl_8008EA64
/* 08BA5C 8008EA5C 38600000 */  li        r3, 0x0
/* 08BA60 8008EA60 4E800020 */  blr
lbl_8008EA64:
/* 08BA64 8008EA64 38600001 */  li        r3, 0x1
/* 08BA68 8008EA68 4E800020 */  blr

glabel libraryUpdate
/* 08BA6C 8008EA6C 7C0802A6 */  mflr      r0
/* 08BA70 8008EA70 90010004 */  stw       r0, 0x4(r1)
/* 08BA74 8008EA74 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08BA78 8008EA78 93E1001C */  stw       r31, 0x1c(r1)
/* 08BA7C 8008EA7C 7C7F1B78 */  mr        r31, r3
/* 08BA80 8008EA80 93C10018 */  stw       r30, 0x18(r1)
/* 08BA84 8008EA84 93A10014 */  stw       r29, 0x14(r1)
/* 08BA88 8008EA88 80630004 */  lwz       r3, 0x4(r3)
/* 08BA8C 8008EA8C 80830024 */  lwz       r4, 0x24(r3)
/* 08BA90 8008EA90 3C640001 */  addis     r3, r4, 0x1
/* 08BA94 8008EA94 800312A0 */  lwz       r0, 0x12a0(r3)
/* 08BA98 8008EA98 3BA40000 */  addi      r29, r4, 0x0
/* 08BA9C 8008EA9C 28000000 */  cmplwi    r0, 0x0
/* 08BAA0 8008EAA0 40820014 */  bne       lbl_8008EAB4
/* 08BAA4 8008EAA4 809D0028 */  lwz       r4, 0x28(r29)
/* 08BAA8 8008EAA8 387D0000 */  addi      r3, r29, 0x0
/* 08BAAC 8008EAAC 38A1000C */  addi      r5, r1, 0xc
/* 08BAB0 8008EAB0 4BFA4109 */  bl        cpuFindFunction
lbl_8008EAB4:
/* 08BAB4 8008EAB4 3C7D0001 */  addis     r3, r29, 0x1
/* 08BAB8 8008EAB8 806312A0 */  lwz       r3, 0x12a0(r3)
/* 08BABC 8008EABC 28030000 */  cmplwi    r3, 0x0
/* 08BAC0 8008EAC0 41820114 */  beq       lbl_8008EBD4
/* 08BAC4 8008EAC4 83C30068 */  lwz       r30, 0x68(r3)
/* 08BAC8 8008EAC8 281E0000 */  cmplwi    r30, 0x0
/* 08BACC 8008EACC 4182007C */  beq       lbl_8008EB48
/* 08BAD0 8008EAD0 809E0040 */  lwz       r4, 0x40(r30)
/* 08BAD4 8008EAD4 28040000 */  cmplwi    r4, 0x0
/* 08BAD8 8008EAD8 4182001C */  beq       lbl_8008EAF4
/* 08BADC 8008EADC 7FE3FB78 */  mr        r3, r31
/* 08BAE0 8008EAE0 48000115 */  bl        librarySearch
/* 08BAE4 8008EAE4 2C030000 */  cmpwi     r3, 0x0
/* 08BAE8 8008EAE8 4082000C */  bne       lbl_8008EAF4
/* 08BAEC 8008EAEC 38000000 */  li        r0, 0x0
/* 08BAF0 8008EAF0 48000048 */  b         lbl_8008EB38
lbl_8008EAF4:
/* 08BAF4 8008EAF4 809E0044 */  lwz       r4, 0x44(r30)
/* 08BAF8 8008EAF8 28040000 */  cmplwi    r4, 0x0
/* 08BAFC 8008EAFC 4182001C */  beq       lbl_8008EB18
/* 08BB00 8008EB00 7FE3FB78 */  mr        r3, r31
/* 08BB04 8008EB04 480000F1 */  bl        librarySearch
/* 08BB08 8008EB08 2C030000 */  cmpwi     r3, 0x0
/* 08BB0C 8008EB0C 4082000C */  bne       lbl_8008EB18
/* 08BB10 8008EB10 38000000 */  li        r0, 0x0
/* 08BB14 8008EB14 48000024 */  b         lbl_8008EB38
lbl_8008EB18:
/* 08BB18 8008EB18 387F0000 */  addi      r3, r31, 0x0
/* 08BB1C 8008EB1C 389E0000 */  addi      r4, r30, 0x0
/* 08BB20 8008EB20 48000239 */  bl        libraryTestFunction
/* 08BB24 8008EB24 2C030000 */  cmpwi     r3, 0x0
/* 08BB28 8008EB28 4082000C */  bne       lbl_8008EB34
/* 08BB2C 8008EB2C 38000000 */  li        r0, 0x0
/* 08BB30 8008EB30 48000008 */  b         lbl_8008EB38
lbl_8008EB34:
/* 08BB34 8008EB34 38000001 */  li        r0, 0x1
lbl_8008EB38:
/* 08BB38 8008EB38 2C000000 */  cmpwi     r0, 0x0
/* 08BB3C 8008EB3C 4082000C */  bne       lbl_8008EB48
/* 08BB40 8008EB40 38600000 */  li        r3, 0x0
/* 08BB44 8008EB44 48000094 */  b         lbl_8008EBD8
lbl_8008EB48:
/* 08BB48 8008EB48 3C7D0001 */  addis     r3, r29, 0x1
/* 08BB4C 8008EB4C 806312A0 */  lwz       r3, 0x12a0(r3)
/* 08BB50 8008EB50 83C3006C */  lwz       r30, 0x6c(r3)
/* 08BB54 8008EB54 281E0000 */  cmplwi    r30, 0x0
/* 08BB58 8008EB58 4182007C */  beq       lbl_8008EBD4
/* 08BB5C 8008EB5C 809E0040 */  lwz       r4, 0x40(r30)
/* 08BB60 8008EB60 28040000 */  cmplwi    r4, 0x0
/* 08BB64 8008EB64 4182001C */  beq       lbl_8008EB80
/* 08BB68 8008EB68 7FE3FB78 */  mr        r3, r31
/* 08BB6C 8008EB6C 48000089 */  bl        librarySearch
/* 08BB70 8008EB70 2C030000 */  cmpwi     r3, 0x0
/* 08BB74 8008EB74 4082000C */  bne       lbl_8008EB80
/* 08BB78 8008EB78 38000000 */  li        r0, 0x0
/* 08BB7C 8008EB7C 48000048 */  b         lbl_8008EBC4
lbl_8008EB80:
/* 08BB80 8008EB80 809E0044 */  lwz       r4, 0x44(r30)
/* 08BB84 8008EB84 28040000 */  cmplwi    r4, 0x0
/* 08BB88 8008EB88 4182001C */  beq       lbl_8008EBA4
/* 08BB8C 8008EB8C 7FE3FB78 */  mr        r3, r31
/* 08BB90 8008EB90 48000065 */  bl        librarySearch
/* 08BB94 8008EB94 2C030000 */  cmpwi     r3, 0x0
/* 08BB98 8008EB98 4082000C */  bne       lbl_8008EBA4
/* 08BB9C 8008EB9C 38000000 */  li        r0, 0x0
/* 08BBA0 8008EBA0 48000024 */  b         lbl_8008EBC4
lbl_8008EBA4:
/* 08BBA4 8008EBA4 387F0000 */  addi      r3, r31, 0x0
/* 08BBA8 8008EBA8 389E0000 */  addi      r4, r30, 0x0
/* 08BBAC 8008EBAC 480001AD */  bl        libraryTestFunction
/* 08BBB0 8008EBB0 2C030000 */  cmpwi     r3, 0x0
/* 08BBB4 8008EBB4 4082000C */  bne       lbl_8008EBC0
/* 08BBB8 8008EBB8 38000000 */  li        r0, 0x0
/* 08BBBC 8008EBBC 48000008 */  b         lbl_8008EBC4
lbl_8008EBC0:
/* 08BBC0 8008EBC0 38000001 */  li        r0, 0x1
lbl_8008EBC4:
/* 08BBC4 8008EBC4 2C000000 */  cmpwi     r0, 0x0
/* 08BBC8 8008EBC8 4082000C */  bne       lbl_8008EBD4
/* 08BBCC 8008EBCC 38600000 */  li        r3, 0x0
/* 08BBD0 8008EBD0 48000008 */  b         lbl_8008EBD8
lbl_8008EBD4:
/* 08BBD4 8008EBD4 38600001 */  li        r3, 0x1
lbl_8008EBD8:
/* 08BBD8 8008EBD8 80010024 */  lwz       r0, 0x24(r1)
/* 08BBDC 8008EBDC 83E1001C */  lwz       r31, 0x1c(r1)
/* 08BBE0 8008EBE0 83C10018 */  lwz       r30, 0x18(r1)
/* 08BBE4 8008EBE4 7C0803A6 */  mtlr      r0
/* 08BBE8 8008EBE8 83A10014 */  lwz       r29, 0x14(r1)
/* 08BBEC 8008EBEC 38210020 */  addi      r1, r1, 0x20
/* 08BBF0 8008EBF0 4E800020 */  blr

glabel librarySearch
/* 08BBF4 8008EBF4 7C0802A6 */  mflr      r0
/* 08BBF8 8008EBF8 90010004 */  stw       r0, 0x4(r1)
/* 08BBFC 8008EBFC 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08BC00 8008EC00 93E1001C */  stw       r31, 0x1c(r1)
/* 08BC04 8008EC04 93C10018 */  stw       r30, 0x18(r1)
/* 08BC08 8008EC08 7C9E2378 */  mr        r30, r4
/* 08BC0C 8008EC0C 93A10014 */  stw       r29, 0x14(r1)
/* 08BC10 8008EC10 3BA30000 */  addi      r29, r3, 0x0
/* 08BC14 8008EC14 83E40040 */  lwz       r31, 0x40(r4)
/* 08BC18 8008EC18 281F0000 */  cmplwi    r31, 0x0
/* 08BC1C 8008EC1C 4182007C */  beq       lbl_8008EC98
/* 08BC20 8008EC20 809F0040 */  lwz       r4, 0x40(r31)
/* 08BC24 8008EC24 28040000 */  cmplwi    r4, 0x0
/* 08BC28 8008EC28 4182001C */  beq       lbl_8008EC44
/* 08BC2C 8008EC2C 7FA3EB78 */  mr        r3, r29
/* 08BC30 8008EC30 4BFFFFC5 */  bl        librarySearch
/* 08BC34 8008EC34 2C030000 */  cmpwi     r3, 0x0
/* 08BC38 8008EC38 4082000C */  bne       lbl_8008EC44
/* 08BC3C 8008EC3C 38000000 */  li        r0, 0x0
/* 08BC40 8008EC40 48000048 */  b         lbl_8008EC88
lbl_8008EC44:
/* 08BC44 8008EC44 809F0044 */  lwz       r4, 0x44(r31)
/* 08BC48 8008EC48 28040000 */  cmplwi    r4, 0x0
/* 08BC4C 8008EC4C 4182001C */  beq       lbl_8008EC68
/* 08BC50 8008EC50 7FA3EB78 */  mr        r3, r29
/* 08BC54 8008EC54 4BFFFFA1 */  bl        librarySearch
/* 08BC58 8008EC58 2C030000 */  cmpwi     r3, 0x0
/* 08BC5C 8008EC5C 4082000C */  bne       lbl_8008EC68
/* 08BC60 8008EC60 38000000 */  li        r0, 0x0
/* 08BC64 8008EC64 48000024 */  b         lbl_8008EC88
lbl_8008EC68:
/* 08BC68 8008EC68 387D0000 */  addi      r3, r29, 0x0
/* 08BC6C 8008EC6C 389F0000 */  addi      r4, r31, 0x0
/* 08BC70 8008EC70 480000E9 */  bl        libraryTestFunction
/* 08BC74 8008EC74 2C030000 */  cmpwi     r3, 0x0
/* 08BC78 8008EC78 4082000C */  bne       lbl_8008EC84
/* 08BC7C 8008EC7C 38000000 */  li        r0, 0x0
/* 08BC80 8008EC80 48000008 */  b         lbl_8008EC88
lbl_8008EC84:
/* 08BC84 8008EC84 38000001 */  li        r0, 0x1
lbl_8008EC88:
/* 08BC88 8008EC88 2C000000 */  cmpwi     r0, 0x0
/* 08BC8C 8008EC8C 4082000C */  bne       lbl_8008EC98
/* 08BC90 8008EC90 38600000 */  li        r3, 0x0
/* 08BC94 8008EC94 480000A8 */  b         lbl_8008ED3C
lbl_8008EC98:
/* 08BC98 8008EC98 83FE0044 */  lwz       r31, 0x44(r30)
/* 08BC9C 8008EC9C 281F0000 */  cmplwi    r31, 0x0
/* 08BCA0 8008ECA0 4182007C */  beq       lbl_8008ED1C
/* 08BCA4 8008ECA4 809F0040 */  lwz       r4, 0x40(r31)
/* 08BCA8 8008ECA8 28040000 */  cmplwi    r4, 0x0
/* 08BCAC 8008ECAC 4182001C */  beq       lbl_8008ECC8
/* 08BCB0 8008ECB0 7FA3EB78 */  mr        r3, r29
/* 08BCB4 8008ECB4 4BFFFF41 */  bl        librarySearch
/* 08BCB8 8008ECB8 2C030000 */  cmpwi     r3, 0x0
/* 08BCBC 8008ECBC 4082000C */  bne       lbl_8008ECC8
/* 08BCC0 8008ECC0 38000000 */  li        r0, 0x0
/* 08BCC4 8008ECC4 48000048 */  b         lbl_8008ED0C
lbl_8008ECC8:
/* 08BCC8 8008ECC8 809F0044 */  lwz       r4, 0x44(r31)
/* 08BCCC 8008ECCC 28040000 */  cmplwi    r4, 0x0
/* 08BCD0 8008ECD0 4182001C */  beq       lbl_8008ECEC
/* 08BCD4 8008ECD4 7FA3EB78 */  mr        r3, r29
/* 08BCD8 8008ECD8 4BFFFF1D */  bl        librarySearch
/* 08BCDC 8008ECDC 2C030000 */  cmpwi     r3, 0x0
/* 08BCE0 8008ECE0 4082000C */  bne       lbl_8008ECEC
/* 08BCE4 8008ECE4 38000000 */  li        r0, 0x0
/* 08BCE8 8008ECE8 48000024 */  b         lbl_8008ED0C
lbl_8008ECEC:
/* 08BCEC 8008ECEC 387D0000 */  addi      r3, r29, 0x0
/* 08BCF0 8008ECF0 389F0000 */  addi      r4, r31, 0x0
/* 08BCF4 8008ECF4 48000065 */  bl        libraryTestFunction
/* 08BCF8 8008ECF8 2C030000 */  cmpwi     r3, 0x0
/* 08BCFC 8008ECFC 4082000C */  bne       lbl_8008ED08
/* 08BD00 8008ED00 38000000 */  li        r0, 0x0
/* 08BD04 8008ED04 48000008 */  b         lbl_8008ED0C
lbl_8008ED08:
/* 08BD08 8008ED08 38000001 */  li        r0, 0x1
lbl_8008ED0C:
/* 08BD0C 8008ED0C 2C000000 */  cmpwi     r0, 0x0
/* 08BD10 8008ED10 4082000C */  bne       lbl_8008ED1C
/* 08BD14 8008ED14 38600000 */  li        r3, 0x0
/* 08BD18 8008ED18 48000024 */  b         lbl_8008ED3C
lbl_8008ED1C:
/* 08BD1C 8008ED1C 387D0000 */  addi      r3, r29, 0x0
/* 08BD20 8008ED20 389E0000 */  addi      r4, r30, 0x0
/* 08BD24 8008ED24 48000035 */  bl        libraryTestFunction
/* 08BD28 8008ED28 2C030000 */  cmpwi     r3, 0x0
/* 08BD2C 8008ED2C 4082000C */  bne       lbl_8008ED38
/* 08BD30 8008ED30 38600000 */  li        r3, 0x0
/* 08BD34 8008ED34 48000008 */  b         lbl_8008ED3C
lbl_8008ED38:
/* 08BD38 8008ED38 38600001 */  li        r3, 0x1
lbl_8008ED3C:
/* 08BD3C 8008ED3C 80010024 */  lwz       r0, 0x24(r1)
/* 08BD40 8008ED40 83E1001C */  lwz       r31, 0x1c(r1)
/* 08BD44 8008ED44 83C10018 */  lwz       r30, 0x18(r1)
/* 08BD48 8008ED48 7C0803A6 */  mtlr      r0
/* 08BD4C 8008ED4C 83A10014 */  lwz       r29, 0x14(r1)
/* 08BD50 8008ED50 38210020 */  addi      r1, r1, 0x20
/* 08BD54 8008ED54 4E800020 */  blr

glabel libraryTestFunction
/* 08BD58 8008ED58 7C0802A6 */  mflr      r0
/* 08BD5C 8008ED5C 90010004 */  stw       r0, 0x4(r1)
/* 08BD60 8008ED60 9421FF88 */  stwu      r1, -0x78(r1)
/* 08BD64 8008ED64 BDC10030 */  stmw      r14, 0x30(r1)
/* 08BD68 8008ED68 3B440000 */  addi      r26, r4, 0x0
/* 08BD6C 8008ED6C 7C7E1B78 */  mr        r30, r3
/* 08BD70 8008ED70 3C80800F */  lis       r4, D_800EFFC0@ha
/* 08BD74 8008ED74 3B24FFC0 */  addi      r25, r4, D_800EFFC0@l
/* 08BD78 8008ED78 38BA0000 */  addi      r5, r26, 0x0
/* 08BD7C 8008ED7C 38810014 */  addi      r4, r1, 0x14
/* 08BD80 8008ED80 80630004 */  lwz       r3, 0x4(r3)
/* 08BD84 8008ED84 80630024 */  lwz       r3, 0x24(r3)
/* 08BD88 8008ED88 4BFA4E51 */  bl        cpuGetFunctionChecksum
/* 08BD8C 8008ED8C 2C030000 */  cmpwi     r3, 0x0
/* 08BD90 8008ED90 4082000C */  bne       lbl_8008ED9C
/* 08BD94 8008ED94 38600000 */  li        r3, 0x0
/* 08BD98 8008ED98 48000594 */  b         lbl_8008F32C
lbl_8008ED9C:
/* 08BD9C 8008ED9C 807A0010 */  lwz       r3, 0x10(r26)
/* 08BDA0 8008EDA0 3CE08009 */  lis       r7, GenPerspective_1080@ha
/* 08BDA4 8008EDA4 801A0014 */  lwz       r0, 0x14(r26)
/* 08BDA8 8008EDA8 3C808009 */  lis       r4, __osDisableInt@ha
/* 08BDAC 8008EDAC 3CA08009 */  lis       r5, zeldaLoadSZS_Entry@ha
/* 08BDB0 8008EDB0 7C030050 */  subf      r0, r3, r0
/* 08BDB4 8008EDB4 7C031670 */  srawi     r3, r0, 2
/* 08BDB8 8008EDB8 38050298 */  addi      r0, r5, zeldaLoadSZS_Entry@l
/* 08BDBC 8008EDBC 3B830001 */  addi      r28, r3, 0x1
/* 08BDC0 8008EDC0 90010024 */  stw       r0, 0x24(r1)
/* 08BDC4 8008EDC4 3CC08009 */  lis       r6, pictureSnap_Zelda2@ha
/* 08BDC8 8008EDC8 3806043C */  addi      r0, r6, pictureSnap_Zelda2@l
/* 08BDCC 8008EDCC 3C608009 */  lis       r3, osViSwapBuffer_Entry@ha
/* 08BDD0 8008EDD0 90010020 */  stw       r0, 0x20(r1)
/* 08BDD4 8008EDD4 3D808009 */  lis       r12, dmaSoundRomHandler_ZELDA1@ha
/* 08BDD8 8008EDD8 380C0314 */  addi      r0, r12, dmaSoundRomHandler_ZELDA1@l
/* 08BDDC 8008EDDC 3D008009 */  lis       r8, osInvalICache@ha
/* 08BDE0 8008EDE0 90010028 */  stw       r0, 0x28(r1)
/* 08BDE4 8008EDE4 3D208009 */  lis       r9, __osSpSetStatus@ha
/* 08BDE8 8008EDE8 3D408009 */  lis       r10, osEepromLongWrite@ha
/* 08BDEC 8008EDEC 3D608009 */  lis       r11, osEepromLongRead@ha
/* 08BDF0 8008EDF0 39C73D7C */  addi      r14, r7, GenPerspective_1080@l
/* 08BDF4 8008EDF4 39E302AC */  addi      r15, r3, osViSwapBuffer_Entry@l
/* 08BDF8 8008EDF8 3A045204 */  addi      r16, r4, __osDisableInt@l
/* 08BDFC 8008EDFC 3A285294 */  addi      r17, r8, osInvalICache@l
/* 08BE00 8008EE00 3ADCFFF8 */  subi      r22, r28, 0x8
/* 08BE04 8008EE04 3A495128 */  addi      r18, r9, __osSpSetStatus@l
/* 08BE08 8008EE08 3A6A05B4 */  addi      r19, r10, osEepromLongWrite@l
/* 08BE0C 8008EE0C 3A8B0660 */  addi      r20, r11, osEepromLongRead@l
/* 08BE10 8008EE10 3BE00000 */  li        r31, 0x0
/* 08BE14 8008EE14 480004FC */  b         lbl_8008F310
lbl_8008EE18:
/* 08BE18 8008EE18 3B000000 */  li        r24, 0x0
/* 08BE1C 8008EE1C 3AE00000 */  li        r23, 0x0
/* 08BE20 8008EE20 480004D0 */  b         lbl_8008F2F0
lbl_8008EE24:
/* 08BE24 8008EE24 80010014 */  lwz       r0, 0x14(r1)
/* 08BE28 8008EE28 8063000C */  lwz       r3, 0xc(r3)
/* 08BE2C 8008EE2C 7C001840 */  cmplw     r0, r3
/* 08BE30 8008EE30 408204B8 */  bne       lbl_8008F2E8
/* 08BE34 8008EE34 7C1C2040 */  cmplw     r28, r4
/* 08BE38 8008EE38 408204B0 */  bne       lbl_8008F2E8
/* 08BE3C 8008EE3C 807E0004 */  lwz       r3, 0x4(r30)
/* 08BE40 8008EE40 3881001C */  addi      r4, r1, 0x1c
/* 08BE44 8008EE44 80BA0010 */  lwz       r5, 0x10(r26)
/* 08BE48 8008EE48 3B600000 */  li        r27, 0x0
/* 08BE4C 8008EE4C 80630024 */  lwz       r3, 0x24(r3)
/* 08BE50 8008EE50 3AA00001 */  li        r21, 0x1
/* 08BE54 8008EE54 4BFA51E1 */  bl        cpuGetAddressBuffer
/* 08BE58 8008EE58 2C030000 */  cmpwi     r3, 0x0
/* 08BE5C 8008EE5C 4082000C */  bne       lbl_8008EE68
/* 08BE60 8008EE60 38600000 */  li        r3, 0x0
/* 08BE64 8008EE64 480004C8 */  b         lbl_8008F32C
lbl_8008EE68:
/* 08BE68 8008EE68 8061001C */  lwz       r3, 0x1c(r1)
/* 08BE6C 8008EE6C 80C30000 */  lwz       r6, 0x0(r3)
/* 08BE70 8008EE70 54C036BE */  srwi      r0, r6, 26
/* 08BE74 8008EE74 2800001F */  cmplwi    r0, 0x1f
/* 08BE78 8008EE78 4082000C */  bne       lbl_8008EE84
/* 08BE7C 8008EE7C 38000000 */  li        r0, 0x0
/* 08BE80 8008EE80 48000008 */  b         lbl_8008EE88
lbl_8008EE84:
/* 08BE84 8008EE84 38000001 */  li        r0, 0x1
lbl_8008EE88:
/* 08BE88 8008EE88 809D0004 */  lwz       r4, 0x4(r29)
/* 08BE8C 8008EE8C 7C1D0378 */  mr        r29, r0
/* 08BE90 8008EE90 7C04A040 */  cmplw     r4, r20
/* 08BE94 8008EE94 40820064 */  bne       lbl_8008EEF8
/* 08BE98 8008EE98 80A10014 */  lwz       r5, 0x14(r1)
/* 08BE9C 8008EE9C 3CA5A46F */  subis     r5, r5, 0x5b91
/* 08BEA0 8008EEA0 28059EF9 */  cmplwi    r5, 0x9ef9
/* 08BEA4 8008EEA4 40820054 */  bne       lbl_8008EEF8
/* 08BEA8 8008EEA8 80A30044 */  lwz       r5, 0x44(r3)
/* 08BEAC 8008EEAC 38810018 */  addi      r4, r1, 0x18
/* 08BEB0 8008EEB0 807E0004 */  lwz       r3, 0x4(r30)
/* 08BEB4 8008EEB4 801A0010 */  lwz       r0, 0x10(r26)
/* 08BEB8 8008EEB8 54A5113A */  clrlslwi  r5, r5, 6, 2
/* 08BEBC 8008EEBC 80630024 */  lwz       r3, 0x24(r3)
/* 08BEC0 8008EEC0 50050006 */  rlwimi    r5, r0, 0, 0, 3
/* 08BEC4 8008EEC4 4BFA5171 */  bl        cpuGetAddressBuffer
/* 08BEC8 8008EEC8 2C030000 */  cmpwi     r3, 0x0
/* 08BECC 8008EECC 4082000C */  bne       lbl_8008EED8
/* 08BED0 8008EED0 38600000 */  li        r3, 0x0
/* 08BED4 8008EED4 48000458 */  b         lbl_8008F32C
lbl_8008EED8:
/* 08BED8 8008EED8 80610018 */  lwz       r3, 0x18(r1)
/* 08BEDC 8008EEDC 80630028 */  lwz       r3, 0x28(r3)
/* 08BEE0 8008EEE0 3C035060 */  addis     r0, r3, 0x5060
/* 08BEE4 8008EEE4 28000030 */  cmplwi    r0, 0x30
/* 08BEE8 8008EEE8 41820394 */  beq       lbl_8008F27C
/* 08BEEC 8008EEEC 3B600001 */  li        r27, 0x1
/* 08BEF0 8008EEF0 3BFF0001 */  addi      r31, r31, 0x1
/* 08BEF4 8008EEF4 48000388 */  b         lbl_8008F27C
lbl_8008EEF8:
/* 08BEF8 8008EEF8 7C049840 */  cmplw     r4, r19
/* 08BEFC 8008EEFC 40820064 */  bne       lbl_8008EF60
/* 08BF00 8008EF00 80A10014 */  lwz       r5, 0x14(r1)
/* 08BF04 8008EF04 3CA5A46F */  subis     r5, r5, 0x5b91
/* 08BF08 8008EF08 28059EF9 */  cmplwi    r5, 0x9ef9
/* 08BF0C 8008EF0C 40820054 */  bne       lbl_8008EF60
/* 08BF10 8008EF10 80A30044 */  lwz       r5, 0x44(r3)
/* 08BF14 8008EF14 38810018 */  addi      r4, r1, 0x18
/* 08BF18 8008EF18 807E0004 */  lwz       r3, 0x4(r30)
/* 08BF1C 8008EF1C 801A0010 */  lwz       r0, 0x10(r26)
/* 08BF20 8008EF20 54A5113A */  clrlslwi  r5, r5, 6, 2
/* 08BF24 8008EF24 80630024 */  lwz       r3, 0x24(r3)
/* 08BF28 8008EF28 50050006 */  rlwimi    r5, r0, 0, 0, 3
/* 08BF2C 8008EF2C 4BFA5109 */  bl        cpuGetAddressBuffer
/* 08BF30 8008EF30 2C030000 */  cmpwi     r3, 0x0
/* 08BF34 8008EF34 4082000C */  bne       lbl_8008EF40
/* 08BF38 8008EF38 38600000 */  li        r3, 0x0
/* 08BF3C 8008EF3C 480003F0 */  b         lbl_8008F32C
lbl_8008EF40:
/* 08BF40 8008EF40 80610018 */  lwz       r3, 0x18(r1)
/* 08BF44 8008EF44 80630028 */  lwz       r3, 0x28(r3)
/* 08BF48 8008EF48 3C035060 */  addis     r0, r3, 0x5060
/* 08BF4C 8008EF4C 28000030 */  cmplwi    r0, 0x30
/* 08BF50 8008EF50 4082032C */  bne       lbl_8008F27C
/* 08BF54 8008EF54 3B600001 */  li        r27, 0x1
/* 08BF58 8008EF58 3BFFFFFF */  subi      r31, r31, 0x1
/* 08BF5C 8008EF5C 48000320 */  b         lbl_8008F27C
lbl_8008EF60:
/* 08BF60 8008EF60 7C049040 */  cmplw     r4, r18
/* 08BF64 8008EF64 40820120 */  bne       lbl_8008F084
/* 08BF68 8008EF68 38000000 */  li        r0, 0x0
/* 08BF6C 8008EF6C 281C0000 */  cmplwi    r28, 0x0
/* 08BF70 8008EF70 90010014 */  stw       r0, 0x14(r1)
/* 08BF74 8008EF74 38A00000 */  li        r5, 0x0
/* 08BF78 8008EF78 408100DC */  ble       lbl_8008F054
/* 08BF7C 8008EF7C 281C0008 */  cmplwi    r28, 0x8
/* 08BF80 8008EF80 408103A0 */  ble       lbl_8008F320
/* 08BF84 8008EF84 38160007 */  addi      r0, r22, 0x7
/* 08BF88 8008EF88 5400E8FE */  srwi      r0, r0, 3
/* 08BF8C 8008EF8C 28160000 */  cmplwi    r22, 0x0
/* 08BF90 8008EF90 7C0903A6 */  mtctr     r0
/* 08BF94 8008EF94 38830000 */  addi      r4, r3, 0x0
/* 08BF98 8008EF98 40810388 */  ble       lbl_8008F320
lbl_8008EF9C:
/* 08BF9C 8008EF9C 80C10014 */  lwz       r6, 0x14(r1)
/* 08BFA0 8008EFA0 38A50008 */  addi      r5, r5, 0x8
/* 08BFA4 8008EFA4 80040000 */  lwz       r0, 0x0(r4)
/* 08BFA8 8008EFA8 7C060214 */  add       r0, r6, r0
/* 08BFAC 8008EFAC 90010014 */  stw       r0, 0x14(r1)
/* 08BFB0 8008EFB0 80C10014 */  lwz       r6, 0x14(r1)
/* 08BFB4 8008EFB4 80040004 */  lwz       r0, 0x4(r4)
/* 08BFB8 8008EFB8 7C060214 */  add       r0, r6, r0
/* 08BFBC 8008EFBC 90010014 */  stw       r0, 0x14(r1)
/* 08BFC0 8008EFC0 80C10014 */  lwz       r6, 0x14(r1)
/* 08BFC4 8008EFC4 80040008 */  lwz       r0, 0x8(r4)
/* 08BFC8 8008EFC8 7C060214 */  add       r0, r6, r0
/* 08BFCC 8008EFCC 90010014 */  stw       r0, 0x14(r1)
/* 08BFD0 8008EFD0 80C10014 */  lwz       r6, 0x14(r1)
/* 08BFD4 8008EFD4 8004000C */  lwz       r0, 0xc(r4)
/* 08BFD8 8008EFD8 7C060214 */  add       r0, r6, r0
/* 08BFDC 8008EFDC 90010014 */  stw       r0, 0x14(r1)
/* 08BFE0 8008EFE0 80C10014 */  lwz       r6, 0x14(r1)
/* 08BFE4 8008EFE4 80040010 */  lwz       r0, 0x10(r4)
/* 08BFE8 8008EFE8 7C060214 */  add       r0, r6, r0
/* 08BFEC 8008EFEC 90010014 */  stw       r0, 0x14(r1)
/* 08BFF0 8008EFF0 80C10014 */  lwz       r6, 0x14(r1)
/* 08BFF4 8008EFF4 80040014 */  lwz       r0, 0x14(r4)
/* 08BFF8 8008EFF8 7C060214 */  add       r0, r6, r0
/* 08BFFC 8008EFFC 90010014 */  stw       r0, 0x14(r1)
/* 08C000 8008F000 80C10014 */  lwz       r6, 0x14(r1)
/* 08C004 8008F004 80040018 */  lwz       r0, 0x18(r4)
/* 08C008 8008F008 7C060214 */  add       r0, r6, r0
/* 08C00C 8008F00C 90010014 */  stw       r0, 0x14(r1)
/* 08C010 8008F010 8004001C */  lwz       r0, 0x1c(r4)
/* 08C014 8008F014 38840020 */  addi      r4, r4, 0x20
/* 08C018 8008F018 80C10014 */  lwz       r6, 0x14(r1)
/* 08C01C 8008F01C 7C060214 */  add       r0, r6, r0
/* 08C020 8008F020 90010014 */  stw       r0, 0x14(r1)
/* 08C024 8008F024 4200FF78 */  bdnz      lbl_8008EF9C
/* 08C028 8008F028 480002F8 */  b         lbl_8008F320
lbl_8008F02C:
/* 08C02C 8008F02C 7C05E050 */  subf      r0, r5, r28
/* 08C030 8008F030 7C05E040 */  cmplw     r5, r28
/* 08C034 8008F034 7C0903A6 */  mtctr     r0
/* 08C038 8008F038 4080001C */  bge       lbl_8008F054
lbl_8008F03C:
/* 08C03C 8008F03C 80030000 */  lwz       r0, 0x0(r3)
/* 08C040 8008F040 38630004 */  addi      r3, r3, 0x4
/* 08C044 8008F044 80810014 */  lwz       r4, 0x14(r1)
/* 08C048 8008F048 7C040214 */  add       r0, r4, r0
/* 08C04C 8008F04C 90010014 */  stw       r0, 0x14(r1)
/* 08C050 8008F050 4200FFEC */  bdnz      lbl_8008F03C
lbl_8008F054:
/* 08C054 8008F054 80610014 */  lwz       r3, 0x14(r1)
/* 08C058 8008F058 3C033E1E */  addis     r0, r3, 0x3e1e
/* 08C05C 8008F05C 28007C6E */  cmplwi    r0, 0x7c6e
/* 08C060 8008F060 4182021C */  beq       lbl_8008F27C
/* 08C064 8008F064 3C03124E */  addis     r0, r3, 0x124e
/* 08C068 8008F068 2800A41C */  cmplwi    r0, 0xa41c
/* 08C06C 8008F06C 41820210 */  beq       lbl_8008F27C
/* 08C070 8008F070 3C03DF98 */  subis     r0, r3, 0x2068
/* 08C074 8008F074 2800A41C */  cmplwi    r0, 0xa41c
/* 08C078 8008F078 41820204 */  beq       lbl_8008F27C
/* 08C07C 8008F07C 3BA00000 */  li        r29, 0x0
/* 08C080 8008F080 480001FC */  b         lbl_8008F27C
lbl_8008F084:
/* 08C084 8008F084 7C048840 */  cmplw     r4, r17
/* 08C088 8008F088 40820020 */  bne       lbl_8008F0A8
/* 08C08C 8008F08C 80030008 */  lwz       r0, 0x8(r3)
/* 08C090 8008F090 5400043E */  clrlwi    r0, r0, 16
/* 08C094 8008F094 28002000 */  cmplwi    r0, 0x2000
/* 08C098 8008F098 408201E4 */  bne       lbl_8008F27C
/* 08C09C 8008F09C 3B600001 */  li        r27, 0x1
/* 08C0A0 8008F0A0 3BFF0001 */  addi      r31, r31, 0x1
/* 08C0A4 8008F0A4 480001D8 */  b         lbl_8008F27C
lbl_8008F0A8:
/* 08C0A8 8008F0A8 28040000 */  cmplwi    r4, 0x0
/* 08C0AC 8008F0AC 40820030 */  bne       lbl_8008F0DC
/* 08C0B0 8008F0B0 80A10014 */  lwz       r5, 0x14(r1)
/* 08C0B4 8008F0B4 3CA5C897 */  subis     r5, r5, 0x3769
/* 08C0B8 8008F0B8 280579EF */  cmplwi    r5, 0x79ef
/* 08C0BC 8008F0BC 40820020 */  bne       lbl_8008F0DC
/* 08C0C0 8008F0C0 80030008 */  lwz       r0, 0x8(r3)
/* 08C0C4 8008F0C4 5400043E */  clrlwi    r0, r0, 16
/* 08C0C8 8008F0C8 28004000 */  cmplwi    r0, 0x4000
/* 08C0CC 8008F0CC 408201B0 */  bne       lbl_8008F27C
/* 08C0D0 8008F0D0 3B600001 */  li        r27, 0x1
/* 08C0D4 8008F0D4 3BFFFFFF */  subi      r31, r31, 0x1
/* 08C0D8 8008F0D8 480001A4 */  b         lbl_8008F27C
lbl_8008F0DC:
/* 08C0DC 8008F0DC 7C048040 */  cmplw     r4, r16
/* 08C0E0 8008F0E0 40820068 */  bne       lbl_8008F148
/* 08C0E4 8008F0E4 80030008 */  lwz       r0, 0x8(r3)
/* 08C0E8 8008F0E8 28000000 */  cmplwi    r0, 0x0
/* 08C0EC 8008F0EC 40820190 */  bne       lbl_8008F27C
/* 08C0F0 8008F0F0 8003000C */  lwz       r0, 0xc(r3)
/* 08C0F4 8008F0F4 28000000 */  cmplwi    r0, 0x0
/* 08C0F8 8008F0F8 40820184 */  bne       lbl_8008F27C
/* 08C0FC 8008F0FC 8061001C */  lwz       r3, 0x1c(r1)
/* 08C100 8008F100 38030010 */  addi      r0, r3, 0x10
/* 08C104 8008F104 9001001C */  stw       r0, 0x1c(r1)
/* 08C108 8008F108 48000010 */  b         lbl_8008F118
lbl_8008F10C:
/* 08C10C 8008F10C 8061001C */  lwz       r3, 0x1c(r1)
/* 08C110 8008F110 38030004 */  addi      r0, r3, 0x4
/* 08C114 8008F114 9001001C */  stw       r0, 0x1c(r1)
lbl_8008F118:
/* 08C118 8008F118 8061001C */  lwz       r3, 0x1c(r1)
/* 08C11C 8008F11C 80030000 */  lwz       r0, 0x0(r3)
/* 08C120 8008F120 28000000 */  cmplwi    r0, 0x0
/* 08C124 8008F124 4182FFE8 */  beq       lbl_8008F10C
/* 08C128 8008F128 540036BE */  srwi      r0, r0, 26
/* 08C12C 8008F12C 2800001F */  cmplwi    r0, 0x1f
/* 08C130 8008F130 4082000C */  bne       lbl_8008F13C
/* 08C134 8008F134 38000000 */  li        r0, 0x0
/* 08C138 8008F138 48000008 */  b         lbl_8008F140
lbl_8008F13C:
/* 08C13C 8008F13C 38000001 */  li        r0, 0x1
lbl_8008F140:
/* 08C140 8008F140 7C1D0378 */  mr        r29, r0
/* 08C144 8008F144 48000138 */  b         lbl_8008F27C
lbl_8008F148:
/* 08C148 8008F148 7C047840 */  cmplw     r4, r15
/* 08C14C 8008F14C 40820048 */  bne       lbl_8008F194
/* 08C150 8008F150 2C000000 */  cmpwi     r0, 0x0
/* 08C154 8008F154 41820128 */  beq       lbl_8008F27C
/* 08C158 8008F158 54C3001E */  clrrwi    r3, r6, 16
/* 08C15C 8008F15C 3C03D843 */  subis     r0, r3, 0x27bd
/* 08C160 8008F160 28000000 */  cmplwi    r0, 0x0
/* 08C164 8008F164 3AA00000 */  li        r21, 0x0
/* 08C168 8008F168 4182001C */  beq       lbl_8008F184
/* 08C16C 8008F16C 4CC63182 */  crclr     cr1eq
/* 08C170 8008F170 38791434 */  addi      r3, r25, 0x1434
/* 08C174 8008F174 3899147C */  addi      r4, r25, 0x147c
/* 08C178 8008F178 38A01B3B */  li        r5, 0x1b3b
/* 08C17C 8008F17C 4BF76BF9 */  bl        xlPostText
/* 08C180 8008F180 480000FC */  b         lbl_8008F27C
lbl_8008F184:
/* 08C184 8008F184 54C0043E */  clrlwi    r0, r6, 16
/* 08C188 8008F188 7C000734 */  extsh     r0, r0
/* 08C18C 8008F18C 901E0008 */  stw       r0, 0x8(r30)
/* 08C190 8008F190 480000EC */  b         lbl_8008F27C
lbl_8008F194:
/* 08C194 8008F194 7C047040 */  cmplw     r4, r14
/* 08C198 8008F198 4082001C */  bne       lbl_8008F1B4
/* 08C19C 8008F19C 807E0004 */  lwz       r3, 0x4(r30)
/* 08C1A0 8008F1A0 80030020 */  lwz       r0, 0x20(r3)
/* 08C1A4 8008F1A4 2C000006 */  cmpwi     r0, 0x6
/* 08C1A8 8008F1A8 418200D4 */  beq       lbl_8008F27C
/* 08C1AC 8008F1AC 3BA00000 */  li        r29, 0x0
/* 08C1B0 8008F1B0 480000CC */  b         lbl_8008F27C
lbl_8008F1B4:
/* 08C1B4 8008F1B4 80010020 */  lwz       r0, 0x20(r1)
/* 08C1B8 8008F1B8 7C040040 */  cmplw     r4, r0
/* 08C1BC 8008F1BC 4082001C */  bne       lbl_8008F1D8
/* 08C1C0 8008F1C0 807E0004 */  lwz       r3, 0x4(r30)
/* 08C1C4 8008F1C4 80030020 */  lwz       r0, 0x20(r3)
/* 08C1C8 8008F1C8 2C000005 */  cmpwi     r0, 0x5
/* 08C1CC 8008F1CC 418200B0 */  beq       lbl_8008F27C
/* 08C1D0 8008F1D0 3BA00000 */  li        r29, 0x0
/* 08C1D4 8008F1D4 480000A8 */  b         lbl_8008F27C
lbl_8008F1D8:
/* 08C1D8 8008F1D8 80010024 */  lwz       r0, 0x24(r1)
/* 08C1DC 8008F1DC 7C040040 */  cmplw     r4, r0
/* 08C1E0 8008F1E0 4082005C */  bne       lbl_8008F23C
/* 08C1E4 8008F1E4 809E0004 */  lwz       r4, 0x4(r30)
/* 08C1E8 8008F1E8 80040020 */  lwz       r0, 0x20(r4)
/* 08C1EC 8008F1EC 2C000004 */  cmpwi     r0, 0x4
/* 08C1F0 8008F1F0 41820008 */  beq       lbl_8008F1F8
/* 08C1F4 8008F1F4 3BA00000 */  li        r29, 0x0
lbl_8008F1F8:
/* 08C1F8 8008F1F8 2C1D0000 */  cmpwi     r29, 0x0
/* 08C1FC 8008F1FC 41820080 */  beq       lbl_8008F27C
/* 08C200 8008F200 90610018 */  stw       r3, 0x18(r1)
/* 08C204 8008F204 3AA00000 */  li        r21, 0x0
/* 08C208 8008F208 48000010 */  b         lbl_8008F218
lbl_8008F20C:
/* 08C20C 8008F20C 80610018 */  lwz       r3, 0x18(r1)
/* 08C210 8008F210 38030004 */  addi      r0, r3, 0x4
/* 08C214 8008F214 90010018 */  stw       r0, 0x18(r1)
lbl_8008F218:
/* 08C218 8008F218 80810018 */  lwz       r4, 0x18(r1)
/* 08C21C 8008F21C 80640000 */  lwz       r3, 0x0(r4)
/* 08C220 8008F220 3C03D843 */  subis     r0, r3, 0x27bd
/* 08C224 8008F224 28000040 */  cmplwi    r0, 0x40
/* 08C228 8008F228 4082FFE4 */  bne       lbl_8008F20C
/* 08C22C 8008F22C 381F0001 */  addi      r0, r31, 0x1
/* 08C230 8008F230 64007C00 */  oris      r0, r0, 0x7c00
/* 08C234 8008F234 90040000 */  stw       r0, 0x0(r4)
/* 08C238 8008F238 48000044 */  b         lbl_8008F27C
lbl_8008F23C:
/* 08C23C 8008F23C 80010028 */  lwz       r0, 0x28(r1)
/* 08C240 8008F240 7C040040 */  cmplw     r4, r0
/* 08C244 8008F244 40820038 */  bne       lbl_8008F27C
/* 08C248 8008F248 809E0004 */  lwz       r4, 0x4(r30)
/* 08C24C 8008F24C 80040020 */  lwz       r0, 0x20(r4)
/* 08C250 8008F250 2C000004 */  cmpwi     r0, 0x4
/* 08C254 8008F254 4182000C */  beq       lbl_8008F260
/* 08C258 8008F258 3BA00000 */  li        r29, 0x0
/* 08C25C 8008F25C 48000020 */  b         lbl_8008F27C
lbl_8008F260:
/* 08C260 8008F260 2C180000 */  cmpwi     r24, 0x0
/* 08C264 8008F264 80630008 */  lwz       r3, 0x8(r3)
/* 08C268 8008F268 41820014 */  beq       lbl_8008F27C
/* 08C26C 8008F26C 3C03F400 */  subis     r0, r3, 0xc00
/* 08C270 8008F270 28000F3C */  cmplwi    r0, 0xf3c
/* 08C274 8008F274 41820008 */  beq       lbl_8008F27C
/* 08C278 8008F278 3BA00000 */  li        r29, 0x0
lbl_8008F27C:
/* 08C27C 8008F27C 2C1D0000 */  cmpwi     r29, 0x0
/* 08C280 8008F280 41820058 */  beq       lbl_8008F2D8
/* 08C284 8008F284 38000000 */  li        r0, 0x0
/* 08C288 8008F288 901A0028 */  stw       r0, 0x28(r26)
/* 08C28C 8008F28C 2C150000 */  cmpwi     r21, 0x0
/* 08C290 8008F290 67E57C00 */  oris      r5, r31, 0x7c00
/* 08C294 8008F294 8081001C */  lwz       r4, 0x1c(r1)
/* 08C298 8008F298 38640004 */  addi      r3, r4, 0x4
/* 08C29C 8008F29C 9061001C */  stw       r3, 0x1c(r1)
/* 08C2A0 8008F2A0 90A40000 */  stw       r5, 0x0(r4)
/* 08C2A4 8008F2A4 4182002C */  beq       lbl_8008F2D0
/* 08C2A8 8008F2A8 8081001C */  lwz       r4, 0x1c(r1)
/* 08C2AC 8008F2AC 3C6003E0 */  lis       r3, 0x3e0
/* 08C2B0 8008F2B0 38A30008 */  addi      r5, r3, 0x8
/* 08C2B4 8008F2B4 38640004 */  addi      r3, r4, 0x4
/* 08C2B8 8008F2B8 9061001C */  stw       r3, 0x1c(r1)
/* 08C2BC 8008F2BC 90A40000 */  stw       r5, 0x0(r4)
/* 08C2C0 8008F2C0 8081001C */  lwz       r4, 0x1c(r1)
/* 08C2C4 8008F2C4 38640004 */  addi      r3, r4, 0x4
/* 08C2C8 8008F2C8 9061001C */  stw       r3, 0x1c(r1)
/* 08C2CC 8008F2CC 90040000 */  stw       r0, 0x0(r4)
lbl_8008F2D0:
/* 08C2D0 8008F2D0 38600001 */  li        r3, 0x1
/* 08C2D4 8008F2D4 48000058 */  b         lbl_8008F32C
lbl_8008F2D8:
/* 08C2D8 8008F2D8 2C1B0000 */  cmpwi     r27, 0x0
/* 08C2DC 8008F2DC 4182000C */  beq       lbl_8008F2E8
/* 08C2E0 8008F2E0 38600001 */  li        r3, 0x1
/* 08C2E4 8008F2E4 48000048 */  b         lbl_8008F32C
lbl_8008F2E8:
/* 08C2E8 8008F2E8 3AF70008 */  addi      r23, r23, 0x8
/* 08C2EC 8008F2EC 3B180002 */  addi      r24, r24, 0x2
lbl_8008F2F0:
/* 08C2F0 8008F2F0 1C1F004C */  mulli     r0, r31, 0x4c
/* 08C2F4 8008F2F4 7FB90214 */  add       r29, r25, r0
/* 08C2F8 8008F2F8 3BBD042C */  addi      r29, r29, 0x42c
/* 08C2FC 8008F2FC 7C7DBA14 */  add       r3, r29, r23
/* 08C300 8008F300 80830008 */  lwz       r4, 0x8(r3)
/* 08C304 8008F304 28040000 */  cmplwi    r4, 0x0
/* 08C308 8008F308 4082FB1C */  bne       lbl_8008EE24
/* 08C30C 8008F30C 3BFF0001 */  addi      r31, r31, 0x1
lbl_8008F310:
/* 08C310 8008F310 281F0036 */  cmplwi    r31, 0x36
/* 08C314 8008F314 4180FB04 */  blt       lbl_8008EE18
/* 08C318 8008F318 38600001 */  li        r3, 0x1
/* 08C31C 8008F31C 48000010 */  b         lbl_8008F32C
lbl_8008F320:
/* 08C320 8008F320 54A0103A */  slwi      r0, r5, 2
/* 08C324 8008F324 7C630214 */  add       r3, r3, r0
/* 08C328 8008F328 4BFFFD04 */  b         lbl_8008F02C
lbl_8008F32C:
/* 08C32C 8008F32C B9C10030 */  lmw       r14, 0x30(r1)
/* 08C330 8008F330 8001007C */  lwz       r0, 0x7c(r1)
/* 08C334 8008F334 38210078 */  addi      r1, r1, 0x78
/* 08C338 8008F338 7C0803A6 */  mtlr      r0
/* 08C33C 8008F33C 4E800020 */  blr

glabel libraryFindFunctions
/* 08C340 8008F340 7C0802A6 */  mflr      r0
/* 08C344 8008F344 90010004 */  stw       r0, 0x4(r1)
/* 08C348 8008F348 9421FFC8 */  stwu      r1, -0x38(r1)
/* 08C34C 8008F34C BF010018 */  stmw      r24, 0x18(r1)
/* 08C350 8008F350 7C781B78 */  mr        r24, r3
/* 08C354 8008F354 3B40FFFF */  li        r26, -0x1
/* 08C358 8008F358 3B20FFFF */  li        r25, -0x1
/* 08C35C 8008F35C 80630004 */  lwz       r3, 0x4(r3)
/* 08C360 8008F360 83B80010 */  lwz       r29, 0x10(r24)
/* 08C364 8008F364 80630024 */  lwz       r3, 0x24(r3)
/* 08C368 8008F368 3B830B64 */  addi      r28, r3, 0xb64
/* 08C36C 8008F36C 3B630F64 */  addi      r27, r3, 0xf64
lbl_8008F370:
/* 08C370 8008F370 57A0843E */  srwi      r0, r29, 16
/* 08C374 8008F374 7C1B00AE */  lbzx      r0, r27, r0
/* 08C378 8008F378 38A10010 */  addi      r5, r1, 0x10
/* 08C37C 8008F37C 5400103A */  slwi      r0, r0, 2
/* 08C380 8008F380 7C7C002E */  lwzx      r3, r28, r0
/* 08C384 8008F384 81830014 */  lwz       r12, 0x14(r3)
/* 08C388 8008F388 80030008 */  lwz       r0, 0x8(r3)
/* 08C38C 8008F38C 7D8803A6 */  mtlr      r12
/* 08C390 8008F390 80630004 */  lwz       r3, 0x4(r3)
/* 08C394 8008F394 7C9D0214 */  add       r4, r29, r0
/* 08C398 8008F398 4E800021 */  blrl
/* 08C39C 8008F39C 80610010 */  lwz       r3, 0x10(r1)
/* 08C3A0 8008F3A0 546036BE */  srwi      r0, r3, 26
/* 08C3A4 8008F3A4 28000003 */  cmplwi    r0, 0x3
/* 08C3A8 8008F3A8 40820064 */  bne       lbl_8008F40C
/* 08C3AC 8008F3AC 381D0008 */  addi      r0, r29, 0x8
/* 08C3B0 8008F3B0 5400843E */  srwi      r0, r0, 16
/* 08C3B4 8008F3B4 7C1B00AE */  lbzx      r0, r27, r0
/* 08C3B8 8008F3B8 57BE0006 */  clrrwi    r30, r29, 28
/* 08C3BC 8008F3BC 38A10010 */  addi      r5, r1, 0x10
/* 08C3C0 8008F3C0 5400103A */  slwi      r0, r0, 2
/* 08C3C4 8008F3C4 7CDC002E */  lwzx      r6, r28, r0
/* 08C3C8 8008F3C8 5460113A */  clrlslwi  r0, r3, 6, 2
/* 08C3CC 8008F3CC 7C1F0378 */  mr        r31, r0
/* 08C3D0 8008F3D0 80060008 */  lwz       r0, 0x8(r6)
/* 08C3D4 8008F3D4 53BF0006 */  rlwimi    r31, r29, 0, 0, 3
/* 08C3D8 8008F3D8 81860014 */  lwz       r12, 0x14(r6)
/* 08C3DC 8008F3DC 7C9D0214 */  add       r4, r29, r0
/* 08C3E0 8008F3E0 80660004 */  lwz       r3, 0x4(r6)
/* 08C3E4 8008F3E4 7D8803A6 */  mtlr      r12
/* 08C3E8 8008F3E8 38840008 */  addi      r4, r4, 0x8
/* 08C3EC 8008F3EC 4E800021 */  blrl
/* 08C3F0 8008F3F0 80610010 */  lwz       r3, 0x10(r1)
/* 08C3F4 8008F3F4 546036BE */  srwi      r0, r3, 26
/* 08C3F8 8008F3F8 28000002 */  cmplwi    r0, 0x2
/* 08C3FC 8008F3FC 40820010 */  bne       lbl_8008F40C
/* 08C400 8008F400 5460113A */  clrlslwi  r0, r3, 6, 2
/* 08C404 8008F404 3B5F0000 */  addi      r26, r31, 0x0
/* 08C408 8008F408 7FD90378 */  or        r25, r30, r0
lbl_8008F40C:
/* 08C40C 8008F40C 80610010 */  lwz       r3, 0x10(r1)
/* 08C410 8008F410 3BBD0004 */  addi      r29, r29, 0x4
/* 08C414 8008F414 3C03BFF6 */  subis     r0, r3, 0x400a
/* 08C418 8008F418 28004000 */  cmplwi    r0, 0x4000
/* 08C41C 8008F41C 4082FF54 */  bne       lbl_8008F370
/* 08C420 8008F420 3C60800F */  lis       r3, D_800F03EC@ha
/* 08C424 8008F424 3BE303EC */  addi      r31, r3, D_800F03EC@l
/* 08C428 8008F428 3C608009 */  lis       r3, send_mesg@ha
/* 08C42C 8008F42C 389F0000 */  addi      r4, r31, 0x0
/* 08C430 8008F430 38035EFC */  addi      r0, r3, send_mesg@l
/* 08C434 8008F434 3BA00000 */  li        r29, 0x0
/* 08C438 8008F438 4800000C */  b         lbl_8008F444
lbl_8008F43C:
/* 08C43C 8008F43C 3884004C */  addi      r4, r4, 0x4c
/* 08C440 8008F440 3BBD0001 */  addi      r29, r29, 0x1
lbl_8008F444:
/* 08C444 8008F444 281D0036 */  cmplwi    r29, 0x36
/* 08C448 8008F448 40800010 */  bge       lbl_8008F458
/* 08C44C 8008F44C 80640004 */  lwz       r3, 0x4(r4)
/* 08C450 8008F450 7C030040 */  cmplw     r3, r0
/* 08C454 8008F454 4082FFE8 */  bne       lbl_8008F43C
lbl_8008F458:
/* 08C458 8008F458 281D0036 */  cmplwi    r29, 0x36
/* 08C45C 8008F45C 408000AC */  bge       lbl_8008F508
/* 08C460 8008F460 83D80010 */  lwz       r30, 0x10(r24)
lbl_8008F464:
/* 08C464 8008F464 57C0843E */  srwi      r0, r30, 16
/* 08C468 8008F468 7C1B00AE */  lbzx      r0, r27, r0
/* 08C46C 8008F46C 38A10010 */  addi      r5, r1, 0x10
/* 08C470 8008F470 5400103A */  slwi      r0, r0, 2
/* 08C474 8008F474 7C7C002E */  lwzx      r3, r28, r0
/* 08C478 8008F478 81830014 */  lwz       r12, 0x14(r3)
/* 08C47C 8008F47C 80030008 */  lwz       r0, 0x8(r3)
/* 08C480 8008F480 7D8803A6 */  mtlr      r12
/* 08C484 8008F484 80630004 */  lwz       r3, 0x4(r3)
/* 08C488 8008F488 7C9E0214 */  add       r4, r30, r0
/* 08C48C 8008F48C 4E800021 */  blrl
/* 08C490 8008F490 80610010 */  lwz       r3, 0x10(r1)
/* 08C494 8008F494 3BDE0004 */  addi      r30, r30, 0x4
/* 08C498 8008F498 3C03BFF6 */  subis     r0, r3, 0x400a
/* 08C49C 8008F49C 28004000 */  cmplwi    r0, 0x4000
/* 08C4A0 8008F4A0 4082FFC4 */  bne       lbl_8008F464
/* 08C4A4 8008F4A4 80780004 */  lwz       r3, 0x4(r24)
/* 08C4A8 8008F4A8 3881000C */  addi      r4, r1, 0xc
/* 08C4AC 8008F4AC 38BE0014 */  addi      r5, r30, 0x14
/* 08C4B0 8008F4B0 80630024 */  lwz       r3, 0x24(r3)
/* 08C4B4 8008F4B4 4BFA4B81 */  bl        cpuGetAddressBuffer
/* 08C4B8 8008F4B8 2C030000 */  cmpwi     r3, 0x0
/* 08C4BC 8008F4BC 4082000C */  bne       lbl_8008F4C8
/* 08C4C0 8008F4C0 38600000 */  li        r3, 0x0
/* 08C4C4 8008F4C4 48000378 */  b         lbl_8008F83C
lbl_8008F4C8:
/* 08C4C8 8008F4C8 80C1000C */  lwz       r6, 0xc(r1)
/* 08C4CC 8008F4CC 3C6003E0 */  lis       r3, 0x3e0
/* 08C4D0 8008F4D0 67A77C00 */  oris      r7, r29, 0x7c00
/* 08C4D4 8008F4D4 38060004 */  addi      r0, r6, 0x4
/* 08C4D8 8008F4D8 9001000C */  stw       r0, 0xc(r1)
/* 08C4DC 8008F4DC 38A30008 */  addi      r5, r3, 0x8
/* 08C4E0 8008F4E0 38800000 */  li        r4, 0x0
/* 08C4E4 8008F4E4 90E60000 */  stw       r7, 0x0(r6)
/* 08C4E8 8008F4E8 8061000C */  lwz       r3, 0xc(r1)
/* 08C4EC 8008F4EC 38030004 */  addi      r0, r3, 0x4
/* 08C4F0 8008F4F0 9001000C */  stw       r0, 0xc(r1)
/* 08C4F4 8008F4F4 90A30000 */  stw       r5, 0x0(r3)
/* 08C4F8 8008F4F8 8061000C */  lwz       r3, 0xc(r1)
/* 08C4FC 8008F4FC 38030004 */  addi      r0, r3, 0x4
/* 08C500 8008F500 9001000C */  stw       r0, 0xc(r1)
/* 08C504 8008F504 90830000 */  stw       r4, 0x0(r3)
lbl_8008F508:
/* 08C508 8008F508 3C608009 */  lis       r3, __osEnqueueAndYield@ha
/* 08C50C 8008F50C 389F0000 */  addi      r4, r31, 0x0
/* 08C510 8008F510 38035C10 */  addi      r0, r3, __osEnqueueAndYield@l
/* 08C514 8008F514 3BA00000 */  li        r29, 0x0
/* 08C518 8008F518 4800000C */  b         lbl_8008F524
lbl_8008F51C:
/* 08C51C 8008F51C 3884004C */  addi      r4, r4, 0x4c
/* 08C520 8008F520 3BBD0001 */  addi      r29, r29, 0x1
lbl_8008F524:
/* 08C524 8008F524 281D0036 */  cmplwi    r29, 0x36
/* 08C528 8008F528 40800010 */  bge       lbl_8008F538
/* 08C52C 8008F52C 80640004 */  lwz       r3, 0x4(r4)
/* 08C530 8008F530 7C030040 */  cmplw     r3, r0
/* 08C534 8008F534 4082FFE8 */  bne       lbl_8008F51C
lbl_8008F538:
/* 08C538 8008F538 281D0036 */  cmplwi    r29, 0x36
/* 08C53C 8008F53C 408000F0 */  bge       lbl_8008F62C
/* 08C540 8008F540 3BDA0000 */  addi      r30, r26, 0x0
/* 08C544 8008F544 3C1E0001 */  addis     r0, r30, 0x1
/* 08C548 8008F548 2800FFFF */  cmplwi    r0, 0xffff
/* 08C54C 8008F54C 418200E0 */  beq       lbl_8008F62C
lbl_8008F550:
/* 08C550 8008F550 3BDEFFFC */  subi      r30, r30, 0x4
/* 08C554 8008F554 57C0843E */  srwi      r0, r30, 16
/* 08C558 8008F558 7C1B00AE */  lbzx      r0, r27, r0
/* 08C55C 8008F55C 38A10010 */  addi      r5, r1, 0x10
/* 08C560 8008F560 5400103A */  slwi      r0, r0, 2
/* 08C564 8008F564 7C7C002E */  lwzx      r3, r28, r0
/* 08C568 8008F568 81830014 */  lwz       r12, 0x14(r3)
/* 08C56C 8008F56C 80030008 */  lwz       r0, 0x8(r3)
/* 08C570 8008F570 7D8803A6 */  mtlr      r12
/* 08C574 8008F574 80630004 */  lwz       r3, 0x4(r3)
/* 08C578 8008F578 7C9E0214 */  add       r4, r30, r0
/* 08C57C 8008F57C 4E800021 */  blrl
/* 08C580 8008F580 80610010 */  lwz       r3, 0x10(r1)
/* 08C584 8008F584 3C03BFF8 */  subis     r0, r3, 0x4008
/* 08C588 8008F588 28006000 */  cmplwi    r0, 0x6000
/* 08C58C 8008F58C 4082FFC4 */  bne       lbl_8008F550
lbl_8008F590:
/* 08C590 8008F590 3BDEFFFC */  subi      r30, r30, 0x4
/* 08C594 8008F594 57C0843E */  srwi      r0, r30, 16
/* 08C598 8008F598 7C1B00AE */  lbzx      r0, r27, r0
/* 08C59C 8008F59C 38A10010 */  addi      r5, r1, 0x10
/* 08C5A0 8008F5A0 5400103A */  slwi      r0, r0, 2
/* 08C5A4 8008F5A4 7C7C002E */  lwzx      r3, r28, r0
/* 08C5A8 8008F5A8 81830014 */  lwz       r12, 0x14(r3)
/* 08C5AC 8008F5AC 80030008 */  lwz       r0, 0x8(r3)
/* 08C5B0 8008F5B0 7D8803A6 */  mtlr      r12
/* 08C5B4 8008F5B4 80630004 */  lwz       r3, 0x4(r3)
/* 08C5B8 8008F5B8 7C9E0214 */  add       r4, r30, r0
/* 08C5BC 8008F5BC 4E800021 */  blrl
/* 08C5C0 8008F5C0 80810010 */  lwz       r4, 0x10(r1)
/* 08C5C4 8008F5C4 548536BE */  srwi      r5, r4, 26
/* 08C5C8 8008F5C8 28050002 */  cmplwi    r5, 0x2
/* 08C5CC 8008F5CC 41820028 */  beq       lbl_8008F5F4
/* 08C5D0 8008F5D0 5483001E */  clrrwi    r3, r4, 16
/* 08C5D4 8008F5D4 3C03F000 */  subis     r0, r3, 0x1000
/* 08C5D8 8008F5D8 28000000 */  cmplwi    r0, 0x0
/* 08C5DC 8008F5DC 41820018 */  beq       lbl_8008F5F4
/* 08C5E0 8008F5E0 28050000 */  cmplwi    r5, 0x0
/* 08C5E4 8008F5E4 41820010 */  beq       lbl_8008F5F4
/* 08C5E8 8008F5E8 548006BE */  clrlwi    r0, r4, 26
/* 08C5EC 8008F5EC 28000008 */  cmplwi    r0, 0x8
/* 08C5F0 8008F5F0 4082FFA0 */  bne       lbl_8008F590
lbl_8008F5F4:
/* 08C5F4 8008F5F4 80780004 */  lwz       r3, 0x4(r24)
/* 08C5F8 8008F5F8 3881000C */  addi      r4, r1, 0xc
/* 08C5FC 8008F5FC 38BE0008 */  addi      r5, r30, 0x8
/* 08C600 8008F600 80630024 */  lwz       r3, 0x24(r3)
/* 08C604 8008F604 4BFA4A31 */  bl        cpuGetAddressBuffer
/* 08C608 8008F608 2C030000 */  cmpwi     r3, 0x0
/* 08C60C 8008F60C 4082000C */  bne       lbl_8008F618
/* 08C610 8008F610 38600000 */  li        r3, 0x0
/* 08C614 8008F614 48000228 */  b         lbl_8008F83C
lbl_8008F618:
/* 08C618 8008F618 8061000C */  lwz       r3, 0xc(r1)
/* 08C61C 8008F61C 67A47C00 */  oris      r4, r29, 0x7c00
/* 08C620 8008F620 38030004 */  addi      r0, r3, 0x4
/* 08C624 8008F624 9001000C */  stw       r0, 0xc(r1)
/* 08C628 8008F628 90830000 */  stw       r4, 0x0(r3)
lbl_8008F62C:
/* 08C62C 8008F62C 3C608009 */  lis       r3, __osEnqueueThread@ha
/* 08C630 8008F630 389F0000 */  addi      r4, r31, 0x0
/* 08C634 8008F634 380359E8 */  addi      r0, r3, __osEnqueueThread@l
/* 08C638 8008F638 3BA00000 */  li        r29, 0x0
/* 08C63C 8008F63C 4800000C */  b         lbl_8008F648
lbl_8008F640:
/* 08C640 8008F640 3884004C */  addi      r4, r4, 0x4c
/* 08C644 8008F644 3BBD0001 */  addi      r29, r29, 0x1
lbl_8008F648:
/* 08C648 8008F648 281D0036 */  cmplwi    r29, 0x36
/* 08C64C 8008F64C 40800010 */  bge       lbl_8008F65C
/* 08C650 8008F650 80640004 */  lwz       r3, 0x4(r4)
/* 08C654 8008F654 7C030040 */  cmplw     r3, r0
/* 08C658 8008F658 4082FFE8 */  bne       lbl_8008F640
lbl_8008F65C:
/* 08C65C 8008F65C 281D0036 */  cmplwi    r29, 0x36
/* 08C660 8008F660 40800074 */  bge       lbl_8008F6D4
/* 08C664 8008F664 3C1A0001 */  addis     r0, r26, 0x1
/* 08C668 8008F668 2800FFFF */  cmplwi    r0, 0xffff
/* 08C66C 8008F66C 41820068 */  beq       lbl_8008F6D4
/* 08C670 8008F670 80780004 */  lwz       r3, 0x4(r24)
/* 08C674 8008F674 38BA0000 */  addi      r5, r26, 0x0
/* 08C678 8008F678 3881000C */  addi      r4, r1, 0xc
/* 08C67C 8008F67C 80630024 */  lwz       r3, 0x24(r3)
/* 08C680 8008F680 4BFA49B5 */  bl        cpuGetAddressBuffer
/* 08C684 8008F684 2C030000 */  cmpwi     r3, 0x0
/* 08C688 8008F688 4082000C */  bne       lbl_8008F694
/* 08C68C 8008F68C 38600000 */  li        r3, 0x0
/* 08C690 8008F690 480001AC */  b         lbl_8008F83C
lbl_8008F694:
/* 08C694 8008F694 80C1000C */  lwz       r6, 0xc(r1)
/* 08C698 8008F698 3C6003E0 */  lis       r3, 0x3e0
/* 08C69C 8008F69C 67A77C00 */  oris      r7, r29, 0x7c00
/* 08C6A0 8008F6A0 38060004 */  addi      r0, r6, 0x4
/* 08C6A4 8008F6A4 9001000C */  stw       r0, 0xc(r1)
/* 08C6A8 8008F6A8 38A30008 */  addi      r5, r3, 0x8
/* 08C6AC 8008F6AC 38800000 */  li        r4, 0x0
/* 08C6B0 8008F6B0 90E60000 */  stw       r7, 0x0(r6)
/* 08C6B4 8008F6B4 8061000C */  lwz       r3, 0xc(r1)
/* 08C6B8 8008F6B8 38030004 */  addi      r0, r3, 0x4
/* 08C6BC 8008F6BC 9001000C */  stw       r0, 0xc(r1)
/* 08C6C0 8008F6C0 90A30000 */  stw       r5, 0x0(r3)
/* 08C6C4 8008F6C4 8061000C */  lwz       r3, 0xc(r1)
/* 08C6C8 8008F6C8 38030004 */  addi      r0, r3, 0x4
/* 08C6CC 8008F6CC 9001000C */  stw       r0, 0xc(r1)
/* 08C6D0 8008F6D0 90830000 */  stw       r4, 0x0(r3)
lbl_8008F6D4:
/* 08C6D4 8008F6D4 3C608009 */  lis       r3, __osPopThread@ha
/* 08C6D8 8008F6D8 389F0000 */  addi      r4, r31, 0x0
/* 08C6DC 8008F6DC 38035914 */  addi      r0, r3, __osPopThread@l
/* 08C6E0 8008F6E0 3BC00000 */  li        r30, 0x0
/* 08C6E4 8008F6E4 4800000C */  b         lbl_8008F6F0
lbl_8008F6E8:
/* 08C6E8 8008F6E8 3884004C */  addi      r4, r4, 0x4c
/* 08C6EC 8008F6EC 3BDE0001 */  addi      r30, r30, 0x1
lbl_8008F6F0:
/* 08C6F0 8008F6F0 281E0036 */  cmplwi    r30, 0x36
/* 08C6F4 8008F6F4 40800010 */  bge       lbl_8008F704
/* 08C6F8 8008F6F8 80640004 */  lwz       r3, 0x4(r4)
/* 08C6FC 8008F6FC 7C030040 */  cmplw     r3, r0
/* 08C700 8008F700 4082FFE8 */  bne       lbl_8008F6E8
lbl_8008F704:
/* 08C704 8008F704 281E0036 */  cmplwi    r30, 0x36
/* 08C708 8008F708 408000B8 */  bge       lbl_8008F7C0
/* 08C70C 8008F70C 3B5A0008 */  addi      r26, r26, 0x8
/* 08C710 8008F710 3C1A0001 */  addis     r0, r26, 0x1
/* 08C714 8008F714 2800FFFF */  cmplwi    r0, 0xffff
/* 08C718 8008F718 418200A8 */  beq       lbl_8008F7C0
lbl_8008F71C:
/* 08C71C 8008F71C 5740843E */  srwi      r0, r26, 16
/* 08C720 8008F720 7C1B00AE */  lbzx      r0, r27, r0
/* 08C724 8008F724 38A10010 */  addi      r5, r1, 0x10
/* 08C728 8008F728 5400103A */  slwi      r0, r0, 2
/* 08C72C 8008F72C 7C7C002E */  lwzx      r3, r28, r0
/* 08C730 8008F730 81830014 */  lwz       r12, 0x14(r3)
/* 08C734 8008F734 80030008 */  lwz       r0, 0x8(r3)
/* 08C738 8008F738 7D8803A6 */  mtlr      r12
/* 08C73C 8008F73C 80630004 */  lwz       r3, 0x4(r3)
/* 08C740 8008F740 7C9A0214 */  add       r4, r26, r0
/* 08C744 8008F744 4E800021 */  blrl
/* 08C748 8008F748 80610010 */  lwz       r3, 0x10(r1)
/* 08C74C 8008F74C 3B5A0004 */  addi      r26, r26, 0x4
/* 08C750 8008F750 3C03FC20 */  subis     r0, r3, 0x3e0
/* 08C754 8008F754 28000008 */  cmplwi    r0, 0x8
/* 08C758 8008F758 4082FFC4 */  bne       lbl_8008F71C
/* 08C75C 8008F75C 80780004 */  lwz       r3, 0x4(r24)
/* 08C760 8008F760 3881000C */  addi      r4, r1, 0xc
/* 08C764 8008F764 38BA0004 */  addi      r5, r26, 0x4
/* 08C768 8008F768 80630024 */  lwz       r3, 0x24(r3)
/* 08C76C 8008F76C 4BFA48C9 */  bl        cpuGetAddressBuffer
/* 08C770 8008F770 2C030000 */  cmpwi     r3, 0x0
/* 08C774 8008F774 4082000C */  bne       lbl_8008F780
/* 08C778 8008F778 38600000 */  li        r3, 0x0
/* 08C77C 8008F77C 480000C0 */  b         lbl_8008F83C
lbl_8008F780:
/* 08C780 8008F780 80C1000C */  lwz       r6, 0xc(r1)
/* 08C784 8008F784 3C6003E0 */  lis       r3, 0x3e0
/* 08C788 8008F788 67C77C00 */  oris      r7, r30, 0x7c00
/* 08C78C 8008F78C 38060004 */  addi      r0, r6, 0x4
/* 08C790 8008F790 9001000C */  stw       r0, 0xc(r1)
/* 08C794 8008F794 38A30008 */  addi      r5, r3, 0x8
/* 08C798 8008F798 38800000 */  li        r4, 0x0
/* 08C79C 8008F79C 90E60000 */  stw       r7, 0x0(r6)
/* 08C7A0 8008F7A0 8061000C */  lwz       r3, 0xc(r1)
/* 08C7A4 8008F7A4 38030004 */  addi      r0, r3, 0x4
/* 08C7A8 8008F7A8 9001000C */  stw       r0, 0xc(r1)
/* 08C7AC 8008F7AC 90A30000 */  stw       r5, 0x0(r3)
/* 08C7B0 8008F7B0 8061000C */  lwz       r3, 0xc(r1)
/* 08C7B4 8008F7B4 38030004 */  addi      r0, r3, 0x4
/* 08C7B8 8008F7B8 9001000C */  stw       r0, 0xc(r1)
/* 08C7BC 8008F7BC 90830000 */  stw       r4, 0x0(r3)
lbl_8008F7C0:
/* 08C7C0 8008F7C0 3C608009 */  lis       r3, __osDispatchThread@ha
/* 08C7C4 8008F7C4 38035370 */  addi      r0, r3, __osDispatchThread@l
/* 08C7C8 8008F7C8 3B400000 */  li        r26, 0x0
/* 08C7CC 8008F7CC 4800000C */  b         lbl_8008F7D8
lbl_8008F7D0:
/* 08C7D0 8008F7D0 3BFF004C */  addi      r31, r31, 0x4c
/* 08C7D4 8008F7D4 3B5A0001 */  addi      r26, r26, 0x1
lbl_8008F7D8:
/* 08C7D8 8008F7D8 281A0036 */  cmplwi    r26, 0x36
/* 08C7DC 8008F7DC 40800010 */  bge       lbl_8008F7EC
/* 08C7E0 8008F7E0 807F0004 */  lwz       r3, 0x4(r31)
/* 08C7E4 8008F7E4 7C030040 */  cmplw     r3, r0
/* 08C7E8 8008F7E8 4082FFE8 */  bne       lbl_8008F7D0
lbl_8008F7EC:
/* 08C7EC 8008F7EC 281A0036 */  cmplwi    r26, 0x36
/* 08C7F0 8008F7F0 40800048 */  bge       lbl_8008F838
/* 08C7F4 8008F7F4 3C190001 */  addis     r0, r25, 0x1
/* 08C7F8 8008F7F8 2800FFFF */  cmplwi    r0, 0xffff
/* 08C7FC 8008F7FC 4182003C */  beq       lbl_8008F838
/* 08C800 8008F800 80780004 */  lwz       r3, 0x4(r24)
/* 08C804 8008F804 38B90000 */  addi      r5, r25, 0x0
/* 08C808 8008F808 3881000C */  addi      r4, r1, 0xc
/* 08C80C 8008F80C 80630024 */  lwz       r3, 0x24(r3)
/* 08C810 8008F810 4BFA4825 */  bl        cpuGetAddressBuffer
/* 08C814 8008F814 2C030000 */  cmpwi     r3, 0x0
/* 08C818 8008F818 4082000C */  bne       lbl_8008F824
/* 08C81C 8008F81C 38600000 */  li        r3, 0x0
/* 08C820 8008F820 4800001C */  b         lbl_8008F83C
lbl_8008F824:
/* 08C824 8008F824 8061000C */  lwz       r3, 0xc(r1)
/* 08C828 8008F828 67447C00 */  oris      r4, r26, 0x7c00
/* 08C82C 8008F82C 38030004 */  addi      r0, r3, 0x4
/* 08C830 8008F830 9001000C */  stw       r0, 0xc(r1)
/* 08C834 8008F834 90830000 */  stw       r4, 0x0(r3)
lbl_8008F838:
/* 08C838 8008F838 38600001 */  li        r3, 0x1
lbl_8008F83C:
/* 08C83C 8008F83C BB010018 */  lmw       r24, 0x18(r1)
/* 08C840 8008F840 8001003C */  lwz       r0, 0x3c(r1)
/* 08C844 8008F844 38210038 */  addi      r1, r1, 0x38
/* 08C848 8008F848 7C0803A6 */  mtlr      r0
/* 08C84C 8008F84C 4E800020 */  blr

glabel libraryFindVariables
/* 08C850 8008F850 7C0802A6 */  mflr      r0
/* 08C854 8008F854 90010004 */  stw       r0, 0x4(r1)
/* 08C858 8008F858 9421FFA8 */  stwu      r1, -0x58(r1)
/* 08C85C 8008F85C BEE10034 */  stmw      r23, 0x34(r1)
/* 08C860 8008F860 7C781B78 */  mr        r24, r3
/* 08C864 8008F864 38A1000C */  addi      r5, r1, 0xc
/* 08C868 8008F868 80630004 */  lwz       r3, 0x4(r3)
/* 08C86C 8008F86C 80980010 */  lwz       r4, 0x10(r24)
/* 08C870 8008F870 83630024 */  lwz       r27, 0x24(r3)
/* 08C874 8008F874 5480843E */  srwi      r0, r4, 16
/* 08C878 8008F878 3B3B0F64 */  addi      r25, r27, 0xf64
/* 08C87C 8008F87C 7C1900AE */  lbzx      r0, r25, r0
/* 08C880 8008F880 3B5B0B64 */  addi      r26, r27, 0xb64
/* 08C884 8008F884 5400103A */  slwi      r0, r0, 2
/* 08C888 8008F888 7C7A002E */  lwzx      r3, r26, r0
/* 08C88C 8008F88C 81830014 */  lwz       r12, 0x14(r3)
/* 08C890 8008F890 80030008 */  lwz       r0, 0x8(r3)
/* 08C894 8008F894 7D8803A6 */  mtlr      r12
/* 08C898 8008F898 80630004 */  lwz       r3, 0x4(r3)
/* 08C89C 8008F89C 7C840214 */  add       r4, r4, r0
/* 08C8A0 8008F8A0 4E800021 */  blrl
/* 08C8A4 8008F8A4 80780010 */  lwz       r3, 0x10(r24)
/* 08C8A8 8008F8A8 3BE10010 */  addi      r31, r1, 0x10
/* 08C8AC 8008F8AC 38BF0000 */  addi      r5, r31, 0x0
/* 08C8B0 8008F8B0 38830004 */  addi      r4, r3, 0x4
/* 08C8B4 8008F8B4 5480843E */  srwi      r0, r4, 16
/* 08C8B8 8008F8B8 7C1900AE */  lbzx      r0, r25, r0
/* 08C8BC 8008F8BC 5400103A */  slwi      r0, r0, 2
/* 08C8C0 8008F8C0 7C7A002E */  lwzx      r3, r26, r0
/* 08C8C4 8008F8C4 81830014 */  lwz       r12, 0x14(r3)
/* 08C8C8 8008F8C8 80030008 */  lwz       r0, 0x8(r3)
/* 08C8CC 8008F8CC 7D8803A6 */  mtlr      r12
/* 08C8D0 8008F8D0 80630004 */  lwz       r3, 0x4(r3)
/* 08C8D4 8008F8D4 7C840214 */  add       r4, r4, r0
/* 08C8D8 8008F8D8 4E800021 */  blrl
/* 08C8DC 8008F8DC 8081000C */  lwz       r4, 0xc(r1)
/* 08C8E0 8008F8E0 548036BE */  srwi      r0, r4, 26
/* 08C8E4 8008F8E4 2800000F */  cmplwi    r0, 0xf
/* 08C8E8 8008F8E8 40820074 */  bne       lbl_8008F95C
/* 08C8EC 8008F8EC 80610010 */  lwz       r3, 0x10(r1)
/* 08C8F0 8008F8F0 546036BE */  srwi      r0, r3, 26
/* 08C8F4 8008F8F4 28000009 */  cmplwi    r0, 0x9
/* 08C8F8 8008F8F8 40820064 */  bne       lbl_8008F95C
/* 08C8FC 8008F8FC 5460043E */  clrlwi    r0, r3, 16
/* 08C900 8008F900 5483801E */  slwi      r3, r4, 16
/* 08C904 8008F904 7C000734 */  extsh     r0, r0
/* 08C908 8008F908 7EE30214 */  add       r23, r3, r0
/* 08C90C 8008F90C 387B0000 */  addi      r3, r27, 0x0
/* 08C910 8008F910 38B70000 */  addi      r5, r23, 0x0
/* 08C914 8008F914 38810028 */  addi      r4, r1, 0x28
/* 08C918 8008F918 4BFA4795 */  bl        cpuGetAddressOffset
/* 08C91C 8008F91C 2C030000 */  cmpwi     r3, 0x0
/* 08C920 8008F920 4082000C */  bne       lbl_8008F92C
/* 08C924 8008F924 38600000 */  li        r3, 0x0
/* 08C928 8008F928 48000648 */  b         lbl_8008FF70
lbl_8008F92C:
/* 08C92C 8008F92C 66E08000 */  oris      r0, r23, 0x8000
/* 08C930 8008F930 90180058 */  stw       r0, 0x58(r24)
/* 08C934 8008F934 38980030 */  addi      r4, r24, 0x30
/* 08C938 8008F938 38C00000 */  li        r6, 0x0
/* 08C93C 8008F93C 80780004 */  lwz       r3, 0x4(r24)
/* 08C940 8008F940 80A10028 */  lwz       r5, 0x28(r1)
/* 08C944 8008F944 8063002C */  lwz       r3, 0x2c(r3)
/* 08C948 8008F948 4BFDCFC9 */  bl        ramGetBuffer
/* 08C94C 8008F94C 2C030000 */  cmpwi     r3, 0x0
/* 08C950 8008F950 40820014 */  bne       lbl_8008F964
/* 08C954 8008F954 38600000 */  li        r3, 0x0
/* 08C958 8008F958 48000618 */  b         lbl_8008FF70
lbl_8008F95C:
/* 08C95C 8008F95C 38600000 */  li        r3, 0x0
/* 08C960 8008F960 48000610 */  b         lbl_8008FF70
lbl_8008F964:
/* 08C964 8008F964 80780010 */  lwz       r3, 0x10(r24)
/* 08C968 8008F968 3BA30008 */  addi      r29, r3, 0x8
lbl_8008F96C:
/* 08C96C 8008F96C 57A0843E */  srwi      r0, r29, 16
/* 08C970 8008F970 7C1900AE */  lbzx      r0, r25, r0
/* 08C974 8008F974 38A10024 */  addi      r5, r1, 0x24
/* 08C978 8008F978 5400103A */  slwi      r0, r0, 2
/* 08C97C 8008F97C 7C7A002E */  lwzx      r3, r26, r0
/* 08C980 8008F980 81830014 */  lwz       r12, 0x14(r3)
/* 08C984 8008F984 80030008 */  lwz       r0, 0x8(r3)
/* 08C988 8008F988 7D8803A6 */  mtlr      r12
/* 08C98C 8008F98C 80630004 */  lwz       r3, 0x4(r3)
/* 08C990 8008F990 7C9D0214 */  add       r4, r29, r0
/* 08C994 8008F994 4E800021 */  blrl
/* 08C998 8008F998 80610024 */  lwz       r3, 0x24(r1)
/* 08C99C 8008F99C 3BBD0004 */  addi      r29, r29, 0x4
/* 08C9A0 8008F9A0 3C03FCC0 */  subis     r0, r3, 0x340
/* 08C9A4 8008F9A4 28004021 */  cmplwi    r0, 0x4021
/* 08C9A8 8008F9A8 4182000C */  beq       lbl_8008F9B4
/* 08C9AC 8008F9AC 28004025 */  cmplwi    r0, 0x4025
/* 08C9B0 8008F9B0 4082FFBC */  bne       lbl_8008F96C
lbl_8008F9B4:
/* 08C9B4 8008F9B4 57A0843E */  srwi      r0, r29, 16
/* 08C9B8 8008F9B8 7C1900AE */  lbzx      r0, r25, r0
/* 08C9BC 8008F9BC 38A1000C */  addi      r5, r1, 0xc
/* 08C9C0 8008F9C0 5400103A */  slwi      r0, r0, 2
/* 08C9C4 8008F9C4 7C7A002E */  lwzx      r3, r26, r0
/* 08C9C8 8008F9C8 81830014 */  lwz       r12, 0x14(r3)
/* 08C9CC 8008F9CC 80030008 */  lwz       r0, 0x8(r3)
/* 08C9D0 8008F9D0 7D8803A6 */  mtlr      r12
/* 08C9D4 8008F9D4 80630004 */  lwz       r3, 0x4(r3)
/* 08C9D8 8008F9D8 7C9D0214 */  add       r4, r29, r0
/* 08C9DC 8008F9DC 4E800021 */  blrl
/* 08C9E0 8008F9E0 381D0004 */  addi      r0, r29, 0x4
/* 08C9E4 8008F9E4 5400843E */  srwi      r0, r0, 16
/* 08C9E8 8008F9E8 7C1900AE */  lbzx      r0, r25, r0
/* 08C9EC 8008F9EC 38BF0000 */  addi      r5, r31, 0x0
/* 08C9F0 8008F9F0 5400103A */  slwi      r0, r0, 2
/* 08C9F4 8008F9F4 7C7A002E */  lwzx      r3, r26, r0
/* 08C9F8 8008F9F8 80030008 */  lwz       r0, 0x8(r3)
/* 08C9FC 8008F9FC 81830014 */  lwz       r12, 0x14(r3)
/* 08CA00 8008FA00 7C9D0214 */  add       r4, r29, r0
/* 08CA04 8008FA04 80630004 */  lwz       r3, 0x4(r3)
/* 08CA08 8008FA08 7D8803A6 */  mtlr      r12
/* 08CA0C 8008FA0C 38840004 */  addi      r4, r4, 0x4
/* 08CA10 8008FA10 4E800021 */  blrl
/* 08CA14 8008FA14 381D0008 */  addi      r0, r29, 0x8
/* 08CA18 8008FA18 5400843E */  srwi      r0, r0, 16
/* 08CA1C 8008FA1C 7C1900AE */  lbzx      r0, r25, r0
/* 08CA20 8008FA20 3BC10014 */  addi      r30, r1, 0x14
/* 08CA24 8008FA24 38BE0000 */  addi      r5, r30, 0x0
/* 08CA28 8008FA28 5400103A */  slwi      r0, r0, 2
/* 08CA2C 8008FA2C 7C7A002E */  lwzx      r3, r26, r0
/* 08CA30 8008FA30 80030008 */  lwz       r0, 0x8(r3)
/* 08CA34 8008FA34 81830014 */  lwz       r12, 0x14(r3)
/* 08CA38 8008FA38 7C9D0214 */  add       r4, r29, r0
/* 08CA3C 8008FA3C 80630004 */  lwz       r3, 0x4(r3)
/* 08CA40 8008FA40 7D8803A6 */  mtlr      r12
/* 08CA44 8008FA44 38840008 */  addi      r4, r4, 0x8
/* 08CA48 8008FA48 4E800021 */  blrl
/* 08CA4C 8008FA4C 8061000C */  lwz       r3, 0xc(r1)
/* 08CA50 8008FA50 3B9D0000 */  addi      r28, r29, 0x0
/* 08CA54 8008FA54 546036BE */  srwi      r0, r3, 26
/* 08CA58 8008FA58 2800000F */  cmplwi    r0, 0xf
/* 08CA5C 8008FA5C 4082001C */  bne       lbl_8008FA78
/* 08CA60 8008FA60 80010010 */  lwz       r0, 0x10(r1)
/* 08CA64 8008FA64 5463801E */  slwi      r3, r3, 16
/* 08CA68 8008FA68 5400043E */  clrlwi    r0, r0, 16
/* 08CA6C 8008FA6C 7C000734 */  extsh     r0, r0
/* 08CA70 8008FA70 7FA30214 */  add       r29, r3, r0
/* 08CA74 8008FA74 4800001C */  b         lbl_8008FA90
lbl_8008FA78:
/* 08CA78 8008FA78 80010014 */  lwz       r0, 0x14(r1)
/* 08CA7C 8008FA7C 80610010 */  lwz       r3, 0x10(r1)
/* 08CA80 8008FA80 5400043E */  clrlwi    r0, r0, 16
/* 08CA84 8008FA84 5463801E */  slwi      r3, r3, 16
/* 08CA88 8008FA88 7C000734 */  extsh     r0, r0
/* 08CA8C 8008FA8C 7FA30214 */  add       r29, r3, r0
lbl_8008FA90:
/* 08CA90 8008FA90 387B0000 */  addi      r3, r27, 0x0
/* 08CA94 8008FA94 38BD0000 */  addi      r5, r29, 0x0
/* 08CA98 8008FA98 38810028 */  addi      r4, r1, 0x28
/* 08CA9C 8008FA9C 4BFA4611 */  bl        cpuGetAddressOffset
/* 08CAA0 8008FAA0 2C030000 */  cmpwi     r3, 0x0
/* 08CAA4 8008FAA4 4082000C */  bne       lbl_8008FAB0
/* 08CAA8 8008FAA8 38600000 */  li        r3, 0x0
/* 08CAAC 8008FAAC 480004C4 */  b         lbl_8008FF70
lbl_8008FAB0:
/* 08CAB0 8008FAB0 67A08000 */  oris      r0, r29, 0x8000
/* 08CAB4 8008FAB4 90180060 */  stw       r0, 0x60(r24)
/* 08CAB8 8008FAB8 38980038 */  addi      r4, r24, 0x38
/* 08CABC 8008FABC 38C00000 */  li        r6, 0x0
/* 08CAC0 8008FAC0 80780004 */  lwz       r3, 0x4(r24)
/* 08CAC4 8008FAC4 80A10028 */  lwz       r5, 0x28(r1)
/* 08CAC8 8008FAC8 8063002C */  lwz       r3, 0x2c(r3)
/* 08CACC 8008FACC 4BFDCE45 */  bl        ramGetBuffer
/* 08CAD0 8008FAD0 2C030000 */  cmpwi     r3, 0x0
/* 08CAD4 8008FAD4 4082000C */  bne       lbl_8008FAE0
/* 08CAD8 8008FAD8 38600000 */  li        r3, 0x0
/* 08CADC 8008FADC 48000494 */  b         lbl_8008FF70
lbl_8008FAE0:
/* 08CAE0 8008FAE0 381D0004 */  addi      r0, r29, 0x4
/* 08CAE4 8008FAE4 64008000 */  oris      r0, r0, 0x8000
/* 08CAE8 8008FAE8 9018005C */  stw       r0, 0x5c(r24)
/* 08CAEC 8008FAEC 38980034 */  addi      r4, r24, 0x34
/* 08CAF0 8008FAF0 38C00000 */  li        r6, 0x0
/* 08CAF4 8008FAF4 80780004 */  lwz       r3, 0x4(r24)
/* 08CAF8 8008FAF8 80A10028 */  lwz       r5, 0x28(r1)
/* 08CAFC 8008FAFC 8063002C */  lwz       r3, 0x2c(r3)
/* 08CB00 8008FB00 38A50004 */  addi      r5, r5, 0x4
/* 08CB04 8008FB04 4BFDCE0D */  bl        ramGetBuffer
/* 08CB08 8008FB08 2C030000 */  cmpwi     r3, 0x0
/* 08CB0C 8008FB0C 4082000C */  bne       lbl_8008FB18
/* 08CB10 8008FB10 38600000 */  li        r3, 0x0
/* 08CB14 8008FB14 4800045C */  b         lbl_8008FF70
lbl_8008FB18:
/* 08CB18 8008FB18 381DFFFC */  subi      r0, r29, 0x4
/* 08CB1C 8008FB1C 64008000 */  oris      r0, r0, 0x8000
/* 08CB20 8008FB20 90180054 */  stw       r0, 0x54(r24)
/* 08CB24 8008FB24 3898002C */  addi      r4, r24, 0x2c
/* 08CB28 8008FB28 38C00000 */  li        r6, 0x0
/* 08CB2C 8008FB2C 80780004 */  lwz       r3, 0x4(r24)
/* 08CB30 8008FB30 80A10028 */  lwz       r5, 0x28(r1)
/* 08CB34 8008FB34 8063002C */  lwz       r3, 0x2c(r3)
/* 08CB38 8008FB38 38A5FFFC */  subi      r5, r5, 0x4
/* 08CB3C 8008FB3C 4BFDCDD5 */  bl        ramGetBuffer
/* 08CB40 8008FB40 2C030000 */  cmpwi     r3, 0x0
/* 08CB44 8008FB44 4082000C */  bne       lbl_8008FB50
/* 08CB48 8008FB48 38600000 */  li        r3, 0x0
/* 08CB4C 8008FB4C 48000424 */  b         lbl_8008FF70
lbl_8008FB50:
/* 08CB50 8008FB50 381DFFF8 */  subi      r0, r29, 0x8
/* 08CB54 8008FB54 64008000 */  oris      r0, r0, 0x8000
/* 08CB58 8008FB58 90180050 */  stw       r0, 0x50(r24)
/* 08CB5C 8008FB5C 38980028 */  addi      r4, r24, 0x28
/* 08CB60 8008FB60 38C00000 */  li        r6, 0x0
/* 08CB64 8008FB64 80780004 */  lwz       r3, 0x4(r24)
/* 08CB68 8008FB68 80A10028 */  lwz       r5, 0x28(r1)
/* 08CB6C 8008FB6C 8063002C */  lwz       r3, 0x2c(r3)
/* 08CB70 8008FB70 38A5FFF8 */  subi      r5, r5, 0x8
/* 08CB74 8008FB74 4BFDCD9D */  bl        ramGetBuffer
/* 08CB78 8008FB78 2C030000 */  cmpwi     r3, 0x0
/* 08CB7C 8008FB7C 4082000C */  bne       lbl_8008FB88
/* 08CB80 8008FB80 38600000 */  li        r3, 0x0
/* 08CB84 8008FB84 480003EC */  b         lbl_8008FF70
lbl_8008FB88:
/* 08CB88 8008FB88 5780843E */  srwi      r0, r28, 16
/* 08CB8C 8008FB8C 7C1900AE */  lbzx      r0, r25, r0
/* 08CB90 8008FB90 38A10024 */  addi      r5, r1, 0x24
/* 08CB94 8008FB94 5400103A */  slwi      r0, r0, 2
/* 08CB98 8008FB98 7C7A002E */  lwzx      r3, r26, r0
/* 08CB9C 8008FB9C 81830014 */  lwz       r12, 0x14(r3)
/* 08CBA0 8008FBA0 80030008 */  lwz       r0, 0x8(r3)
/* 08CBA4 8008FBA4 7D8803A6 */  mtlr      r12
/* 08CBA8 8008FBA8 80630004 */  lwz       r3, 0x4(r3)
/* 08CBAC 8008FBAC 7C9C0214 */  add       r4, r28, r0
/* 08CBB0 8008FBB0 4E800021 */  blrl
/* 08CBB4 8008FBB4 80610024 */  lwz       r3, 0x24(r1)
/* 08CBB8 8008FBB8 3B9C0004 */  addi      r28, r28, 0x4
/* 08CBBC 8008FBBC 3C03EEE0 */  subis     r0, r3, 0x1120
/* 08CBC0 8008FBC0 28000013 */  cmplwi    r0, 0x13
/* 08CBC4 8008FBC4 41820024 */  beq       lbl_8008FBE8
/* 08CBC8 8008FBC8 28000011 */  cmplwi    r0, 0x11
/* 08CBCC 8008FBCC 4182001C */  beq       lbl_8008FBE8
/* 08CBD0 8008FBD0 2800000D */  cmplwi    r0, 0xd
/* 08CBD4 8008FBD4 41820014 */  beq       lbl_8008FBE8
/* 08CBD8 8008FBD8 2800000B */  cmplwi    r0, 0xb
/* 08CBDC 8008FBDC 4182000C */  beq       lbl_8008FBE8
/* 08CBE0 8008FBE0 28000009 */  cmplwi    r0, 0x9
/* 08CBE4 8008FBE4 4082FFA4 */  bne       lbl_8008FB88
lbl_8008FBE8:
/* 08CBE8 8008FBE8 381C0004 */  addi      r0, r28, 0x4
/* 08CBEC 8008FBEC 5400843E */  srwi      r0, r0, 16
/* 08CBF0 8008FBF0 7C1900AE */  lbzx      r0, r25, r0
/* 08CBF4 8008FBF4 38A1000C */  addi      r5, r1, 0xc
/* 08CBF8 8008FBF8 5400103A */  slwi      r0, r0, 2
/* 08CBFC 8008FBFC 7C7A002E */  lwzx      r3, r26, r0
/* 08CC00 8008FC00 80030008 */  lwz       r0, 0x8(r3)
/* 08CC04 8008FC04 81830014 */  lwz       r12, 0x14(r3)
/* 08CC08 8008FC08 7C9C0214 */  add       r4, r28, r0
/* 08CC0C 8008FC0C 80630004 */  lwz       r3, 0x4(r3)
/* 08CC10 8008FC10 7D8803A6 */  mtlr      r12
/* 08CC14 8008FC14 38840004 */  addi      r4, r4, 0x4
/* 08CC18 8008FC18 4E800021 */  blrl
/* 08CC1C 8008FC1C 381C0008 */  addi      r0, r28, 0x8
/* 08CC20 8008FC20 5400843E */  srwi      r0, r0, 16
/* 08CC24 8008FC24 7C1900AE */  lbzx      r0, r25, r0
/* 08CC28 8008FC28 38BF0000 */  addi      r5, r31, 0x0
/* 08CC2C 8008FC2C 5400103A */  slwi      r0, r0, 2
/* 08CC30 8008FC30 7C7A002E */  lwzx      r3, r26, r0
/* 08CC34 8008FC34 80030008 */  lwz       r0, 0x8(r3)
/* 08CC38 8008FC38 81830014 */  lwz       r12, 0x14(r3)
/* 08CC3C 8008FC3C 7C9C0214 */  add       r4, r28, r0
/* 08CC40 8008FC40 80630004 */  lwz       r3, 0x4(r3)
/* 08CC44 8008FC44 7D8803A6 */  mtlr      r12
/* 08CC48 8008FC48 38840008 */  addi      r4, r4, 0x8
/* 08CC4C 8008FC4C 4E800021 */  blrl
/* 08CC50 8008FC50 80010010 */  lwz       r0, 0x10(r1)
/* 08CC54 8008FC54 8061000C */  lwz       r3, 0xc(r1)
/* 08CC58 8008FC58 5400043E */  clrlwi    r0, r0, 16
/* 08CC5C 8008FC5C 5463801E */  slwi      r3, r3, 16
/* 08CC60 8008FC60 7C000734 */  extsh     r0, r0
/* 08CC64 8008FC64 7FA30214 */  add       r29, r3, r0
/* 08CC68 8008FC68 3C1D4000 */  addis     r0, r29, 0x4000
/* 08CC6C 8008FC6C 28000008 */  cmplwi    r0, 0x8
/* 08CC70 8008FC70 4082000C */  bne       lbl_8008FC7C
/* 08CC74 8008FC74 38600000 */  li        r3, 0x0
/* 08CC78 8008FC78 480002F8 */  b         lbl_8008FF70
lbl_8008FC7C:
/* 08CC7C 8008FC7C 387B0000 */  addi      r3, r27, 0x0
/* 08CC80 8008FC80 38BD0000 */  addi      r5, r29, 0x0
/* 08CC84 8008FC84 38810028 */  addi      r4, r1, 0x28
/* 08CC88 8008FC88 4BFA4425 */  bl        cpuGetAddressOffset
/* 08CC8C 8008FC8C 2C030000 */  cmpwi     r3, 0x0
/* 08CC90 8008FC90 4082000C */  bne       lbl_8008FC9C
/* 08CC94 8008FC94 38600000 */  li        r3, 0x0
/* 08CC98 8008FC98 480002D8 */  b         lbl_8008FF70
lbl_8008FC9C:
/* 08CC9C 8008FC9C 67A08000 */  oris      r0, r29, 0x8000
/* 08CCA0 8008FCA0 9018004C */  stw       r0, 0x4c(r24)
/* 08CCA4 8008FCA4 38980024 */  addi      r4, r24, 0x24
/* 08CCA8 8008FCA8 38C00000 */  li        r6, 0x0
/* 08CCAC 8008FCAC 80780004 */  lwz       r3, 0x4(r24)
/* 08CCB0 8008FCB0 80A10028 */  lwz       r5, 0x28(r1)
/* 08CCB4 8008FCB4 8063002C */  lwz       r3, 0x2c(r3)
/* 08CCB8 8008FCB8 4BFDCC59 */  bl        ramGetBuffer
/* 08CCBC 8008FCBC 2C030000 */  cmpwi     r3, 0x0
/* 08CCC0 8008FCC0 4082000C */  bne       lbl_8008FCCC
/* 08CCC4 8008FCC4 38600000 */  li        r3, 0x0
/* 08CCC8 8008FCC8 480002A8 */  b         lbl_8008FF70
lbl_8008FCCC:
/* 08CCCC 8008FCCC 381DFFFC */  subi      r0, r29, 0x4
/* 08CCD0 8008FCD0 64008000 */  oris      r0, r0, 0x8000
/* 08CCD4 8008FCD4 90180048 */  stw       r0, 0x48(r24)
/* 08CCD8 8008FCD8 38980020 */  addi      r4, r24, 0x20
/* 08CCDC 8008FCDC 38C00000 */  li        r6, 0x0
/* 08CCE0 8008FCE0 80780004 */  lwz       r3, 0x4(r24)
/* 08CCE4 8008FCE4 80A10028 */  lwz       r5, 0x28(r1)
/* 08CCE8 8008FCE8 8063002C */  lwz       r3, 0x2c(r3)
/* 08CCEC 8008FCEC 38A5FFFC */  subi      r5, r5, 0x4
/* 08CCF0 8008FCF0 4BFDCC21 */  bl        ramGetBuffer
/* 08CCF4 8008FCF4 2C030000 */  cmpwi     r3, 0x0
/* 08CCF8 8008FCF8 4082000C */  bne       lbl_8008FD04
/* 08CCFC 8008FCFC 38600000 */  li        r3, 0x0
/* 08CD00 8008FD00 48000270 */  b         lbl_8008FF70
lbl_8008FD04:
/* 08CD04 8008FD04 381DFFF8 */  subi      r0, r29, 0x8
/* 08CD08 8008FD08 64008000 */  oris      r0, r0, 0x8000
/* 08CD0C 8008FD0C 90180044 */  stw       r0, 0x44(r24)
/* 08CD10 8008FD10 3898001C */  addi      r4, r24, 0x1c
/* 08CD14 8008FD14 38C00000 */  li        r6, 0x0
/* 08CD18 8008FD18 80780004 */  lwz       r3, 0x4(r24)
/* 08CD1C 8008FD1C 80A10028 */  lwz       r5, 0x28(r1)
/* 08CD20 8008FD20 8063002C */  lwz       r3, 0x2c(r3)
/* 08CD24 8008FD24 38A5FFF8 */  subi      r5, r5, 0x8
/* 08CD28 8008FD28 4BFDCBE9 */  bl        ramGetBuffer
/* 08CD2C 8008FD2C 2C030000 */  cmpwi     r3, 0x0
/* 08CD30 8008FD30 4082000C */  bne       lbl_8008FD3C
/* 08CD34 8008FD34 38600000 */  li        r3, 0x0
/* 08CD38 8008FD38 48000238 */  b         lbl_8008FF70
lbl_8008FD3C:
/* 08CD3C 8008FD3C 381DFFF0 */  subi      r0, r29, 0x10
/* 08CD40 8008FD40 64008000 */  oris      r0, r0, 0x8000
/* 08CD44 8008FD44 90180040 */  stw       r0, 0x40(r24)
/* 08CD48 8008FD48 38980018 */  addi      r4, r24, 0x18
/* 08CD4C 8008FD4C 38C00000 */  li        r6, 0x0
/* 08CD50 8008FD50 80780004 */  lwz       r3, 0x4(r24)
/* 08CD54 8008FD54 80A10028 */  lwz       r5, 0x28(r1)
/* 08CD58 8008FD58 8063002C */  lwz       r3, 0x2c(r3)
/* 08CD5C 8008FD5C 38A5FFF0 */  subi      r5, r5, 0x10
/* 08CD60 8008FD60 4BFDCBB1 */  bl        ramGetBuffer
/* 08CD64 8008FD64 2C030000 */  cmpwi     r3, 0x0
/* 08CD68 8008FD68 4082000C */  bne       lbl_8008FD74
/* 08CD6C 8008FD6C 38600000 */  li        r3, 0x0
/* 08CD70 8008FD70 48000200 */  b         lbl_8008FF70
lbl_8008FD74:
/* 08CD74 8008FD74 5780843E */  srwi      r0, r28, 16
/* 08CD78 8008FD78 7C1900AE */  lbzx      r0, r25, r0
/* 08CD7C 8008FD7C 38A10024 */  addi      r5, r1, 0x24
/* 08CD80 8008FD80 5400103A */  slwi      r0, r0, 2
/* 08CD84 8008FD84 7C7A002E */  lwzx      r3, r26, r0
/* 08CD88 8008FD88 81830014 */  lwz       r12, 0x14(r3)
/* 08CD8C 8008FD8C 80030008 */  lwz       r0, 0x8(r3)
/* 08CD90 8008FD90 7D8803A6 */  mtlr      r12
/* 08CD94 8008FD94 80630004 */  lwz       r3, 0x4(r3)
/* 08CD98 8008FD98 7C9C0214 */  add       r4, r28, r0
/* 08CD9C 8008FD9C 4E800021 */  blrl
/* 08CDA0 8008FDA0 80610024 */  lwz       r3, 0x24(r1)
/* 08CDA4 8008FDA4 3B9C0004 */  addi      r28, r28, 0x4
/* 08CDA8 8008FDA8 3C03BF77 */  subis     r0, r3, 0x4089
/* 08CDAC 8008FDAC 28005800 */  cmplwi    r0, 0x5800
/* 08CDB0 8008FDB0 4082FFC4 */  bne       lbl_8008FD74
/* 08CDB4 8008FDB4 5780843E */  srwi      r0, r28, 16
/* 08CDB8 8008FDB8 7C1900AE */  lbzx      r0, r25, r0
/* 08CDBC 8008FDBC 38A1000C */  addi      r5, r1, 0xc
/* 08CDC0 8008FDC0 5400103A */  slwi      r0, r0, 2
/* 08CDC4 8008FDC4 7C7A002E */  lwzx      r3, r26, r0
/* 08CDC8 8008FDC8 81830014 */  lwz       r12, 0x14(r3)
/* 08CDCC 8008FDCC 80030008 */  lwz       r0, 0x8(r3)
/* 08CDD0 8008FDD0 7D8803A6 */  mtlr      r12
/* 08CDD4 8008FDD4 80630004 */  lwz       r3, 0x4(r3)
/* 08CDD8 8008FDD8 7C9C0214 */  add       r4, r28, r0
/* 08CDDC 8008FDDC 4E800021 */  blrl
/* 08CDE0 8008FDE0 3AFC0004 */  addi      r23, r28, 0x4
/* 08CDE4 8008FDE4 56E0843E */  srwi      r0, r23, 16
/* 08CDE8 8008FDE8 7C1900AE */  lbzx      r0, r25, r0
/* 08CDEC 8008FDEC 38BF0000 */  addi      r5, r31, 0x0
/* 08CDF0 8008FDF0 5400103A */  slwi      r0, r0, 2
/* 08CDF4 8008FDF4 7C7A002E */  lwzx      r3, r26, r0
/* 08CDF8 8008FDF8 80030008 */  lwz       r0, 0x8(r3)
/* 08CDFC 8008FDFC 81830014 */  lwz       r12, 0x14(r3)
/* 08CE00 8008FE00 7C9C0214 */  add       r4, r28, r0
/* 08CE04 8008FE04 80630004 */  lwz       r3, 0x4(r3)
/* 08CE08 8008FE08 7D8803A6 */  mtlr      r12
/* 08CE0C 8008FE0C 38840004 */  addi      r4, r4, 0x4
/* 08CE10 8008FE10 4E800021 */  blrl
/* 08CE14 8008FE14 8061000C */  lwz       r3, 0xc(r1)
/* 08CE18 8008FE18 546036BE */  srwi      r0, r3, 26
/* 08CE1C 8008FE1C 28000003 */  cmplwi    r0, 0x3
/* 08CE20 8008FE20 40820010 */  bne       lbl_8008FE30
/* 08CE24 8008FE24 547D113A */  clrlslwi  r29, r3, 6, 2
/* 08CE28 8008FE28 539D0006 */  rlwimi    r29, r28, 0, 0, 3
/* 08CE2C 8008FE2C 48000010 */  b         lbl_8008FE3C
lbl_8008FE30:
/* 08CE30 8008FE30 80010010 */  lwz       r0, 0x10(r1)
/* 08CE34 8008FE34 541D113A */  clrlslwi  r29, r0, 6, 2
/* 08CE38 8008FE38 52FD0006 */  rlwimi    r29, r23, 0, 0, 3
lbl_8008FE3C:
/* 08CE3C 8008FE3C 57A0843E */  srwi      r0, r29, 16
/* 08CE40 8008FE40 7C1900AE */  lbzx      r0, r25, r0
/* 08CE44 8008FE44 38A1000C */  addi      r5, r1, 0xc
/* 08CE48 8008FE48 5400103A */  slwi      r0, r0, 2
/* 08CE4C 8008FE4C 7C7A002E */  lwzx      r3, r26, r0
/* 08CE50 8008FE50 81830014 */  lwz       r12, 0x14(r3)
/* 08CE54 8008FE54 80030008 */  lwz       r0, 0x8(r3)
/* 08CE58 8008FE58 7D8803A6 */  mtlr      r12
/* 08CE5C 8008FE5C 80630004 */  lwz       r3, 0x4(r3)
/* 08CE60 8008FE60 7C9D0214 */  add       r4, r29, r0
/* 08CE64 8008FE64 4E800021 */  blrl
/* 08CE68 8008FE68 381D0004 */  addi      r0, r29, 0x4
/* 08CE6C 8008FE6C 5400843E */  srwi      r0, r0, 16
/* 08CE70 8008FE70 7C1900AE */  lbzx      r0, r25, r0
/* 08CE74 8008FE74 38BF0000 */  addi      r5, r31, 0x0
/* 08CE78 8008FE78 5400103A */  slwi      r0, r0, 2
/* 08CE7C 8008FE7C 7C7A002E */  lwzx      r3, r26, r0
/* 08CE80 8008FE80 80030008 */  lwz       r0, 0x8(r3)
/* 08CE84 8008FE84 81830014 */  lwz       r12, 0x14(r3)
/* 08CE88 8008FE88 7C9D0214 */  add       r4, r29, r0
/* 08CE8C 8008FE8C 80630004 */  lwz       r3, 0x4(r3)
/* 08CE90 8008FE90 7D8803A6 */  mtlr      r12
/* 08CE94 8008FE94 38840004 */  addi      r4, r4, 0x4
/* 08CE98 8008FE98 4E800021 */  blrl
/* 08CE9C 8008FE9C 381D0008 */  addi      r0, r29, 0x8
/* 08CEA0 8008FEA0 5400843E */  srwi      r0, r0, 16
/* 08CEA4 8008FEA4 7C1900AE */  lbzx      r0, r25, r0
/* 08CEA8 8008FEA8 38BE0000 */  addi      r5, r30, 0x0
/* 08CEAC 8008FEAC 5400103A */  slwi      r0, r0, 2
/* 08CEB0 8008FEB0 7C7A002E */  lwzx      r3, r26, r0
/* 08CEB4 8008FEB4 80030008 */  lwz       r0, 0x8(r3)
/* 08CEB8 8008FEB8 81830014 */  lwz       r12, 0x14(r3)
/* 08CEBC 8008FEBC 7C9D0214 */  add       r4, r29, r0
/* 08CEC0 8008FEC0 80630004 */  lwz       r3, 0x4(r3)
/* 08CEC4 8008FEC4 7D8803A6 */  mtlr      r12
/* 08CEC8 8008FEC8 38840008 */  addi      r4, r4, 0x8
/* 08CECC 8008FECC 4E800021 */  blrl
/* 08CED0 8008FED0 8061000C */  lwz       r3, 0xc(r1)
/* 08CED4 8008FED4 546036BE */  srwi      r0, r3, 26
/* 08CED8 8008FED8 2800000F */  cmplwi    r0, 0xf
/* 08CEDC 8008FEDC 4082001C */  bne       lbl_8008FEF8
/* 08CEE0 8008FEE0 80010010 */  lwz       r0, 0x10(r1)
/* 08CEE4 8008FEE4 5463801E */  slwi      r3, r3, 16
/* 08CEE8 8008FEE8 5400043E */  clrlwi    r0, r0, 16
/* 08CEEC 8008FEEC 7C000734 */  extsh     r0, r0
/* 08CEF0 8008FEF0 7EE30214 */  add       r23, r3, r0
/* 08CEF4 8008FEF4 4800001C */  b         lbl_8008FF10
lbl_8008FEF8:
/* 08CEF8 8008FEF8 80010014 */  lwz       r0, 0x14(r1)
/* 08CEFC 8008FEFC 80610010 */  lwz       r3, 0x10(r1)
/* 08CF00 8008FF00 5400043E */  clrlwi    r0, r0, 16
/* 08CF04 8008FF04 5463801E */  slwi      r3, r3, 16
/* 08CF08 8008FF08 7C000734 */  extsh     r0, r0
/* 08CF0C 8008FF0C 7EE30214 */  add       r23, r3, r0
lbl_8008FF10:
/* 08CF10 8008FF10 387B0000 */  addi      r3, r27, 0x0
/* 08CF14 8008FF14 38B70000 */  addi      r5, r23, 0x0
/* 08CF18 8008FF18 38810028 */  addi      r4, r1, 0x28
/* 08CF1C 8008FF1C 4BFA4191 */  bl        cpuGetAddressOffset
/* 08CF20 8008FF20 2C030000 */  cmpwi     r3, 0x0
/* 08CF24 8008FF24 4082000C */  bne       lbl_8008FF30
/* 08CF28 8008FF28 38600000 */  li        r3, 0x0
/* 08CF2C 8008FF2C 48000044 */  b         lbl_8008FF70
lbl_8008FF30:
/* 08CF30 8008FF30 66E08000 */  oris      r0, r23, 0x8000
/* 08CF34 8008FF34 90180064 */  stw       r0, 0x64(r24)
/* 08CF38 8008FF38 3898003C */  addi      r4, r24, 0x3c
/* 08CF3C 8008FF3C 38C00000 */  li        r6, 0x0
/* 08CF40 8008FF40 80780004 */  lwz       r3, 0x4(r24)
/* 08CF44 8008FF44 80A10028 */  lwz       r5, 0x28(r1)
/* 08CF48 8008FF48 8063002C */  lwz       r3, 0x2c(r3)
/* 08CF4C 8008FF4C 4BFDC9C5 */  bl        ramGetBuffer
/* 08CF50 8008FF50 2C030000 */  cmpwi     r3, 0x0
/* 08CF54 8008FF54 4082000C */  bne       lbl_8008FF60
/* 08CF58 8008FF58 38600000 */  li        r3, 0x0
/* 08CF5C 8008FF5C 48000014 */  b         lbl_8008FF70
lbl_8008FF60:
/* 08CF60 8008FF60 80180000 */  lwz       r0, 0x0(r24)
/* 08CF64 8008FF64 38600001 */  li        r3, 0x1
/* 08CF68 8008FF68 60000004 */  ori       r0, r0, 0x4
/* 08CF6C 8008FF6C 90180000 */  stw       r0, 0x0(r24)
lbl_8008FF70:
/* 08CF70 8008FF70 BAE10034 */  lmw       r23, 0x34(r1)
/* 08CF74 8008FF74 8001005C */  lwz       r0, 0x5c(r1)
/* 08CF78 8008FF78 38210058 */  addi      r1, r1, 0x58
/* 08CF7C 8008FF7C 7C0803A6 */  mtlr      r0
/* 08CF80 8008FF80 4E800020 */  blr

glabel libraryFindException
/* 08CF84 8008FF84 7C0802A6 */  mflr      r0
/* 08CF88 8008FF88 90010004 */  stw       r0, 0x4(r1)
/* 08CF8C 8008FF8C 9421FFC0 */  stwu      r1, -0x40(r1)
/* 08CF90 8008FF90 BF61002C */  stmw      r27, 0x2c(r1)
/* 08CF94 8008FF94 7C7B1B78 */  mr        r27, r3
/* 08CF98 8008FF98 7C9C2379 */  mr.       r28, r4
/* 08CF9C 8008FF9C 80630004 */  lwz       r3, 0x4(r3)
/* 08CFA0 8008FFA0 83C30024 */  lwz       r30, 0x24(r3)
/* 08CFA4 8008FFA4 3BBE0B64 */  addi      r29, r30, 0xb64
/* 08CFA8 8008FFA8 3BFE0F64 */  addi      r31, r30, 0xf64
/* 08CFAC 8008FFAC 4182013C */  beq       lbl_800900E8
/* 08CFB0 8008FFB0 809E0028 */  lwz       r4, 0x28(r30)
/* 08CFB4 8008FFB4 38A10010 */  addi      r5, r1, 0x10
/* 08CFB8 8008FFB8 5480843E */  srwi      r0, r4, 16
/* 08CFBC 8008FFBC 7C1F00AE */  lbzx      r0, r31, r0
/* 08CFC0 8008FFC0 5400103A */  slwi      r0, r0, 2
/* 08CFC4 8008FFC4 7C7D002E */  lwzx      r3, r29, r0
/* 08CFC8 8008FFC8 81830014 */  lwz       r12, 0x14(r3)
/* 08CFCC 8008FFCC 80030008 */  lwz       r0, 0x8(r3)
/* 08CFD0 8008FFD0 7D8803A6 */  mtlr      r12
/* 08CFD4 8008FFD4 80630004 */  lwz       r3, 0x4(r3)
/* 08CFD8 8008FFD8 7C840214 */  add       r4, r4, r0
/* 08CFDC 8008FFDC 4E800021 */  blrl
/* 08CFE0 8008FFE0 807E0028 */  lwz       r3, 0x28(r30)
/* 08CFE4 8008FFE4 38A10014 */  addi      r5, r1, 0x14
/* 08CFE8 8008FFE8 38830004 */  addi      r4, r3, 0x4
/* 08CFEC 8008FFEC 5480843E */  srwi      r0, r4, 16
/* 08CFF0 8008FFF0 7C1F00AE */  lbzx      r0, r31, r0
/* 08CFF4 8008FFF4 5400103A */  slwi      r0, r0, 2
/* 08CFF8 8008FFF8 7C7D002E */  lwzx      r3, r29, r0
/* 08CFFC 8008FFFC 81830014 */  lwz       r12, 0x14(r3)
/* 08D000 80090000 80030008 */  lwz       r0, 0x8(r3)
/* 08D004 80090004 7D8803A6 */  mtlr      r12
/* 08D008 80090008 80630004 */  lwz       r3, 0x4(r3)
/* 08D00C 8009000C 7C840214 */  add       r4, r4, r0
/* 08D010 80090010 4E800021 */  blrl
/* 08D014 80090014 807E0028 */  lwz       r3, 0x28(r30)
/* 08D018 80090018 38A10018 */  addi      r5, r1, 0x18
/* 08D01C 8009001C 38830008 */  addi      r4, r3, 0x8
/* 08D020 80090020 5480843E */  srwi      r0, r4, 16
/* 08D024 80090024 7C1F00AE */  lbzx      r0, r31, r0
/* 08D028 80090028 5400103A */  slwi      r0, r0, 2
/* 08D02C 8009002C 7C7D002E */  lwzx      r3, r29, r0
/* 08D030 80090030 81830014 */  lwz       r12, 0x14(r3)
/* 08D034 80090034 80030008 */  lwz       r0, 0x8(r3)
/* 08D038 80090038 7D8803A6 */  mtlr      r12
/* 08D03C 8009003C 80630004 */  lwz       r3, 0x4(r3)
/* 08D040 80090040 7C840214 */  add       r4, r4, r0
/* 08D044 80090044 4E800021 */  blrl
/* 08D048 80090048 807E0028 */  lwz       r3, 0x28(r30)
/* 08D04C 8009004C 38A1001C */  addi      r5, r1, 0x1c
/* 08D050 80090050 3883000C */  addi      r4, r3, 0xc
/* 08D054 80090054 5480843E */  srwi      r0, r4, 16
/* 08D058 80090058 7C1F00AE */  lbzx      r0, r31, r0
/* 08D05C 8009005C 5400103A */  slwi      r0, r0, 2
/* 08D060 80090060 7C7D002E */  lwzx      r3, r29, r0
/* 08D064 80090064 81830014 */  lwz       r12, 0x14(r3)
/* 08D068 80090068 80030008 */  lwz       r0, 0x8(r3)
/* 08D06C 8009006C 7D8803A6 */  mtlr      r12
/* 08D070 80090070 80630004 */  lwz       r3, 0x4(r3)
/* 08D074 80090074 7C840214 */  add       r4, r4, r0
/* 08D078 80090078 4E800021 */  blrl
/* 08D07C 8009007C 807E0028 */  lwz       r3, 0x28(r30)
/* 08D080 80090080 38A10020 */  addi      r5, r1, 0x20
/* 08D084 80090084 38830010 */  addi      r4, r3, 0x10
/* 08D088 80090088 5480843E */  srwi      r0, r4, 16
/* 08D08C 8009008C 7C1F00AE */  lbzx      r0, r31, r0
/* 08D090 80090090 5400103A */  slwi      r0, r0, 2
/* 08D094 80090094 7C7D002E */  lwzx      r3, r29, r0
/* 08D098 80090098 81830014 */  lwz       r12, 0x14(r3)
/* 08D09C 8009009C 80030008 */  lwz       r0, 0x8(r3)
/* 08D0A0 800900A0 7D8803A6 */  mtlr      r12
/* 08D0A4 800900A4 80630004 */  lwz       r3, 0x4(r3)
/* 08D0A8 800900A8 7C840214 */  add       r4, r4, r0
/* 08D0AC 800900AC 4E800021 */  blrl
/* 08D0B0 800900B0 807E0028 */  lwz       r3, 0x28(r30)
/* 08D0B4 800900B4 38A10024 */  addi      r5, r1, 0x24
/* 08D0B8 800900B8 38830014 */  addi      r4, r3, 0x14
/* 08D0BC 800900BC 5480843E */  srwi      r0, r4, 16
/* 08D0C0 800900C0 7C1F00AE */  lbzx      r0, r31, r0
/* 08D0C4 800900C4 5400103A */  slwi      r0, r0, 2
/* 08D0C8 800900C8 7C7D002E */  lwzx      r3, r29, r0
/* 08D0CC 800900CC 81830014 */  lwz       r12, 0x14(r3)
/* 08D0D0 800900D0 80030008 */  lwz       r0, 0x8(r3)
/* 08D0D4 800900D4 7D8803A6 */  mtlr      r12
/* 08D0D8 800900D8 80630004 */  lwz       r3, 0x4(r3)
/* 08D0DC 800900DC 7C840214 */  add       r4, r4, r0
/* 08D0E0 800900E0 4E800021 */  blrl
/* 08D0E4 800900E4 48000110 */  b         lbl_800901F4
lbl_800900E8:
/* 08D0E8 800900E8 3FFF0001 */  addis     r31, r31, 0x1
/* 08D0EC 800900EC 881F8000 */  lbz       r0, -0x8000(r31)
/* 08D0F0 800900F0 38A10010 */  addi      r5, r1, 0x10
/* 08D0F4 800900F4 5400103A */  slwi      r0, r0, 2
/* 08D0F8 800900F8 7CDD002E */  lwzx      r6, r29, r0
/* 08D0FC 800900FC 80660008 */  lwz       r3, 0x8(r6)
/* 08D100 80090100 81860014 */  lwz       r12, 0x14(r6)
/* 08D104 80090104 3C838000 */  addis     r4, r3, 0x8000
/* 08D108 80090108 80660004 */  lwz       r3, 0x4(r6)
/* 08D10C 8009010C 7D8803A6 */  mtlr      r12
/* 08D110 80090110 38840180 */  addi      r4, r4, 0x180
/* 08D114 80090114 4E800021 */  blrl
/* 08D118 80090118 881F8000 */  lbz       r0, -0x8000(r31)
/* 08D11C 8009011C 38A10014 */  addi      r5, r1, 0x14
/* 08D120 80090120 5400103A */  slwi      r0, r0, 2
/* 08D124 80090124 7CDD002E */  lwzx      r6, r29, r0
/* 08D128 80090128 80660008 */  lwz       r3, 0x8(r6)
/* 08D12C 8009012C 81860014 */  lwz       r12, 0x14(r6)
/* 08D130 80090130 3C838000 */  addis     r4, r3, 0x8000
/* 08D134 80090134 80660004 */  lwz       r3, 0x4(r6)
/* 08D138 80090138 7D8803A6 */  mtlr      r12
/* 08D13C 8009013C 38840184 */  addi      r4, r4, 0x184
/* 08D140 80090140 4E800021 */  blrl
/* 08D144 80090144 881F8000 */  lbz       r0, -0x8000(r31)
/* 08D148 80090148 38A10018 */  addi      r5, r1, 0x18
/* 08D14C 8009014C 5400103A */  slwi      r0, r0, 2
/* 08D150 80090150 7CDD002E */  lwzx      r6, r29, r0
/* 08D154 80090154 80660008 */  lwz       r3, 0x8(r6)
/* 08D158 80090158 81860014 */  lwz       r12, 0x14(r6)
/* 08D15C 8009015C 3C838000 */  addis     r4, r3, 0x8000
/* 08D160 80090160 80660004 */  lwz       r3, 0x4(r6)
/* 08D164 80090164 7D8803A6 */  mtlr      r12
/* 08D168 80090168 38840188 */  addi      r4, r4, 0x188
/* 08D16C 8009016C 4E800021 */  blrl
/* 08D170 80090170 881F8000 */  lbz       r0, -0x8000(r31)
/* 08D174 80090174 38A1001C */  addi      r5, r1, 0x1c
/* 08D178 80090178 5400103A */  slwi      r0, r0, 2
/* 08D17C 8009017C 7CDD002E */  lwzx      r6, r29, r0
/* 08D180 80090180 80660008 */  lwz       r3, 0x8(r6)
/* 08D184 80090184 81860014 */  lwz       r12, 0x14(r6)
/* 08D188 80090188 3C838000 */  addis     r4, r3, 0x8000
/* 08D18C 8009018C 80660004 */  lwz       r3, 0x4(r6)
/* 08D190 80090190 7D8803A6 */  mtlr      r12
/* 08D194 80090194 3884018C */  addi      r4, r4, 0x18c
/* 08D198 80090198 4E800021 */  blrl
/* 08D19C 8009019C 881F8000 */  lbz       r0, -0x8000(r31)
/* 08D1A0 800901A0 38A10020 */  addi      r5, r1, 0x20
/* 08D1A4 800901A4 5400103A */  slwi      r0, r0, 2
/* 08D1A8 800901A8 7CDD002E */  lwzx      r6, r29, r0
/* 08D1AC 800901AC 80660008 */  lwz       r3, 0x8(r6)
/* 08D1B0 800901B0 81860014 */  lwz       r12, 0x14(r6)
/* 08D1B4 800901B4 3C838000 */  addis     r4, r3, 0x8000
/* 08D1B8 800901B8 80660004 */  lwz       r3, 0x4(r6)
/* 08D1BC 800901BC 7D8803A6 */  mtlr      r12
/* 08D1C0 800901C0 38840190 */  addi      r4, r4, 0x190
/* 08D1C4 800901C4 4E800021 */  blrl
/* 08D1C8 800901C8 881F8000 */  lbz       r0, -0x8000(r31)
/* 08D1CC 800901CC 38A10024 */  addi      r5, r1, 0x24
/* 08D1D0 800901D0 5400103A */  slwi      r0, r0, 2
/* 08D1D4 800901D4 7CDD002E */  lwzx      r6, r29, r0
/* 08D1D8 800901D8 80660008 */  lwz       r3, 0x8(r6)
/* 08D1DC 800901DC 81860014 */  lwz       r12, 0x14(r6)
/* 08D1E0 800901E0 3C838000 */  addis     r4, r3, 0x8000
/* 08D1E4 800901E4 80660004 */  lwz       r3, 0x4(r6)
/* 08D1E8 800901E8 7D8803A6 */  mtlr      r12
/* 08D1EC 800901EC 38840194 */  addi      r4, r4, 0x194
/* 08D1F0 800901F0 4E800021 */  blrl
lbl_800901F4:
/* 08D1F4 800901F4 80A10010 */  lwz       r5, 0x10(r1)
/* 08D1F8 800901F8 54A036BE */  srwi      r0, r5, 26
/* 08D1FC 800901FC 2800000F */  cmplwi    r0, 0xf
/* 08D200 80090200 40820054 */  bne       lbl_80090254
/* 08D204 80090204 80810014 */  lwz       r4, 0x14(r1)
/* 08D208 80090208 548036BE */  srwi      r0, r4, 26
/* 08D20C 8009020C 28000009 */  cmplwi    r0, 0x9
/* 08D210 80090210 40820044 */  bne       lbl_80090254
/* 08D214 80090214 80610018 */  lwz       r3, 0x18(r1)
/* 08D218 80090218 546036BF */  srwi.     r0, r3, 26
/* 08D21C 8009021C 40820038 */  bne       lbl_80090254
/* 08D220 80090220 546006FE */  clrlwi    r0, r3, 27
/* 08D224 80090224 28000008 */  cmplwi    r0, 0x8
/* 08D228 80090228 4082002C */  bne       lbl_80090254
/* 08D22C 8009022C 8001001C */  lwz       r0, 0x1c(r1)
/* 08D230 80090230 28000000 */  cmplwi    r0, 0x0
/* 08D234 80090234 40820020 */  bne       lbl_80090254
/* 08D238 80090238 5480043E */  clrlwi    r0, r4, 16
/* 08D23C 8009023C 54A3801E */  slwi      r3, r5, 16
/* 08D240 80090240 7C000734 */  extsh     r0, r0
/* 08D244 80090244 7C030214 */  add       r0, r3, r0
/* 08D248 80090248 901B0010 */  stw       r0, 0x10(r27)
/* 08D24C 8009024C 38600001 */  li        r3, 0x1
/* 08D250 80090250 48000020 */  b         lbl_80090270
lbl_80090254:
/* 08D254 80090254 2C1C0000 */  cmpwi     r28, 0x0
/* 08D258 80090258 4082000C */  bne       lbl_80090264
/* 08D25C 8009025C 38600000 */  li        r3, 0x0
/* 08D260 80090260 48000010 */  b         lbl_80090270
lbl_80090264:
/* 08D264 80090264 7FC3F378 */  mr        r3, r30
/* 08D268 80090268 4BFA485D */  bl        __cpuBreak
/* 08D26C 8009026C 38600000 */  li        r3, 0x0
lbl_80090270:
/* 08D270 80090270 BB61002C */  lmw       r27, 0x2c(r1)
/* 08D274 80090274 80010044 */  lwz       r0, 0x44(r1)
/* 08D278 80090278 38210040 */  addi      r1, r1, 0x40
/* 08D27C 8009027C 7C0803A6 */  mtlr      r0
/* 08D280 80090280 4E800020 */  blr

glabel zeldaLoadSZS_Exit
/* 08D284 80090284 8083012C */  lwz       r4, 0x12c(r3)
/* 08D288 80090288 38040040 */  addi      r0, r4, 0x40
/* 08D28C 8009028C 9003012C */  stw       r0, 0x12c(r3)
/* 08D290 80090290 38600001 */  li        r3, 0x1
/* 08D294 80090294 4E800020 */  blr

glabel zeldaLoadSZS_Entry
/* 08D298 80090298 8083012C */  lwz       r4, 0x12c(r3)
/* 08D29C 8009029C 3804FFC0 */  subi      r0, r4, 0x40
/* 08D2A0 800902A0 9003012C */  stw       r0, 0x12c(r3)
/* 08D2A4 800902A4 38600001 */  li        r3, 0x1
/* 08D2A8 800902A8 4E800020 */  blr

glabel osViSwapBuffer_Entry
/* 08D2AC 800902AC 7C0802A6 */  mflr      r0
/* 08D2B0 800902B0 90010004 */  stw       r0, 0x4(r1)
/* 08D2B4 800902B4 9421FFF8 */  stwu      r1, -0x8(r1)
/* 08D2B8 800902B8 80830008 */  lwz       r4, 0x8(r3)
/* 08D2BC 800902BC 80A3012C */  lwz       r5, 0x12c(r3)
/* 08D2C0 800902C0 80840058 */  lwz       r4, 0x58(r4)
/* 08D2C4 800902C4 80040008 */  lwz       r0, 0x8(r4)
/* 08D2C8 800902C8 7C050214 */  add       r0, r5, r0
/* 08D2CC 800902CC 9003012C */  stw       r0, 0x12c(r3)
/* 08D2D0 800902D0 800D8640 */  lwz       r0, D_8018B5C0@sda21(r0)
/* 08D2D4 800902D4 80830064 */  lwz       r4, 0x64(r3)
/* 08D2D8 800902D8 7C002040 */  cmplw     r0, r4
/* 08D2DC 800902DC 41820024 */  beq       lbl_80090300
/* 08D2E0 800902E0 908D8640 */  stw       r4, D_8018B5C0@sda21(r0)
/* 08D2E4 800902E4 80630008 */  lwz       r3, 0x8(r3)
/* 08D2E8 800902E8 80630034 */  lwz       r3, 0x34(r3)
/* 08D2EC 800902EC 4BFE146D */  bl        rspFrameComplete
/* 08D2F0 800902F0 2C030000 */  cmpwi     r3, 0x0
/* 08D2F4 800902F4 4082000C */  bne       lbl_80090300
/* 08D2F8 800902F8 38600000 */  li        r3, 0x0
/* 08D2FC 800902FC 48000008 */  b         lbl_80090304
lbl_80090300:
/* 08D300 80090300 38600001 */  li        r3, 0x1
lbl_80090304:
/* 08D304 80090304 8001000C */  lwz       r0, 0xc(r1)
/* 08D308 80090308 38210008 */  addi      r1, r1, 0x8
/* 08D30C 8009030C 7C0803A6 */  mtlr      r0
/* 08D310 80090310 4E800020 */  blr

glabel dmaSoundRomHandler_ZELDA1
/* 08D314 80090314 7C0802A6 */  mflr      r0
/* 08D318 80090318 90010004 */  stw       r0, 0x4(r1)
/* 08D31C 8009031C 9421FFD0 */  stwu      r1, -0x30(r1)
/* 08D320 80090320 93E1002C */  stw       r31, 0x2c(r1)
/* 08D324 80090324 7C7F1B78 */  mr        r31, r3
/* 08D328 80090328 3881000C */  addi      r4, r1, 0xc
/* 08D32C 8009032C 93C10028 */  stw       r30, 0x28(r1)
/* 08D330 80090330 93A10024 */  stw       r29, 0x24(r1)
/* 08D334 80090334 93810020 */  stw       r28, 0x20(r1)
/* 08D338 80090338 80A3006C */  lwz       r5, 0x6c(r3)
/* 08D33C 8009033C 4BFA3CF9 */  bl        cpuGetAddressBuffer
/* 08D340 80090340 2C030000 */  cmpwi     r3, 0x0
/* 08D344 80090344 4082000C */  bne       lbl_80090350
/* 08D348 80090348 38600000 */  li        r3, 0x0
/* 08D34C 8009034C 480000D0 */  b         lbl_8009041C
lbl_80090350:
/* 08D350 80090350 80A1000C */  lwz       r5, 0xc(r1)
/* 08D354 80090354 387F0000 */  addi      r3, r31, 0x0
/* 08D358 80090358 38810014 */  addi      r4, r1, 0x14
/* 08D35C 8009035C 80A50004 */  lwz       r5, 0x4(r5)
/* 08D360 80090360 4BFA3CD5 */  bl        cpuGetAddressBuffer
/* 08D364 80090364 2C030000 */  cmpwi     r3, 0x0
/* 08D368 80090368 4082000C */  bne       lbl_80090374
/* 08D36C 8009036C 38600000 */  li        r3, 0x0
/* 08D370 80090370 480000AC */  b         lbl_8009041C
lbl_80090374:
/* 08D374 80090374 80C10014 */  lwz       r6, 0x14(r1)
/* 08D378 80090378 387F0000 */  addi      r3, r31, 0x0
/* 08D37C 8009037C 38810010 */  addi      r4, r1, 0x10
/* 08D380 80090380 80A60014 */  lwz       r5, 0x14(r6)
/* 08D384 80090384 83C6000C */  lwz       r30, 0xc(r6)
/* 08D388 80090388 83A60010 */  lwz       r29, 0x10(r6)
/* 08D38C 8009038C 83860008 */  lwz       r28, 0x8(r6)
/* 08D390 80090390 4BFA3CA5 */  bl        cpuGetAddressBuffer
/* 08D394 80090394 2C030000 */  cmpwi     r3, 0x0
/* 08D398 80090398 4082000C */  bne       lbl_800903A4
/* 08D39C 8009039C 38600000 */  li        r3, 0x0
/* 08D3A0 800903A0 4800007C */  b         lbl_8009041C
lbl_800903A4:
/* 08D3A4 800903A4 7C7EE214 */  add       r3, r30, r28
/* 08D3A8 800903A8 80BF006C */  lwz       r5, 0x6c(r31)
/* 08D3AC 800903AC 7C03EBD6 */  divw      r0, r3, r29
/* 08D3B0 800903B0 80810010 */  lwz       r4, 0x10(r1)
/* 08D3B4 800903B4 7C00E9D6 */  mullw     r0, r0, r29
/* 08D3B8 800903B8 7C001850 */  subf      r0, r0, r3
/* 08D3BC 800903BC 5400103A */  slwi      r0, r0, 2
/* 08D3C0 800903C0 7CA4012E */  stwx      r5, r4, r0
/* 08D3C4 800903C4 381C0001 */  addi      r0, r28, 0x1
/* 08D3C8 800903C8 387F0000 */  addi      r3, r31, 0x0
/* 08D3CC 800903CC 80A10014 */  lwz       r5, 0x14(r1)
/* 08D3D0 800903D0 38810018 */  addi      r4, r1, 0x18
/* 08D3D4 800903D4 90050008 */  stw       r0, 0x8(r5)
/* 08D3D8 800903D8 80A1000C */  lwz       r5, 0xc(r1)
/* 08D3DC 800903DC 80A50008 */  lwz       r5, 0x8(r5)
/* 08D3E0 800903E0 4BFA3C55 */  bl        cpuGetAddressBuffer
/* 08D3E4 800903E4 2C030000 */  cmpwi     r3, 0x0
/* 08D3E8 800903E8 4082000C */  bne       lbl_800903F4
/* 08D3EC 800903EC 38600000 */  li        r3, 0x0
/* 08D3F0 800903F0 4800002C */  b         lbl_8009041C
lbl_800903F4:
/* 08D3F4 800903F4 8081000C */  lwz       r4, 0xc(r1)
/* 08D3F8 800903F8 807F0008 */  lwz       r3, 0x8(r31)
/* 08D3FC 800903FC 80A4000C */  lwz       r5, 0xc(r4)
/* 08D400 80090400 80C40010 */  lwz       r6, 0x10(r4)
/* 08D404 80090404 80630030 */  lwz       r3, 0x30(r3)
/* 08D408 80090408 80810018 */  lwz       r4, 0x18(r1)
/* 08D40C 8009040C 4BFDCDE9 */  bl        romCopyImmediate
/* 08D410 80090410 38000000 */  li        r0, 0x0
/* 08D414 80090414 901F0054 */  stw       r0, 0x54(r31)
/* 08D418 80090418 38600001 */  li        r3, 0x1
lbl_8009041C:
/* 08D41C 8009041C 80010034 */  lwz       r0, 0x34(r1)
/* 08D420 80090420 83E1002C */  lwz       r31, 0x2c(r1)
/* 08D424 80090424 83C10028 */  lwz       r30, 0x28(r1)
/* 08D428 80090428 7C0803A6 */  mtlr      r0
/* 08D42C 8009042C 83A10024 */  lwz       r29, 0x24(r1)
/* 08D430 80090430 83810020 */  lwz       r28, 0x20(r1)
/* 08D434 80090434 38210030 */  addi      r1, r1, 0x30
/* 08D438 80090438 4E800020 */  blr

glabel pictureSnap_Zelda2
/* 08D43C 8009043C 3C00FFFA */  lis       r0, 0xfffa
/* 08D440 80090440 9003010C */  stw       r0, 0x10c(r3)
/* 08D444 80090444 38600001 */  li        r3, 0x1
/* 08D448 80090448 4E800020 */  blr

glabel starfoxCopy
/* 08D44C 8009044C 7C0802A6 */  mflr      r0
/* 08D450 80090450 90010004 */  stw       r0, 0x4(r1)
/* 08D454 80090454 9421FFB8 */  stwu      r1, -0x48(r1)
/* 08D458 80090458 BEE10024 */  stmw      r23, 0x24(r1)
/* 08D45C 8009045C 7C791B78 */  mr        r25, r3
/* 08D460 80090460 38810018 */  addi      r4, r1, 0x18
/* 08D464 80090464 83E3006C */  lwz       r31, 0x6c(r3)
/* 08D468 80090468 80B90064 */  lwz       r5, 0x64(r25)
/* 08D46C 8009046C 4BFA3BC9 */  bl        cpuGetAddressBuffer
/* 08D470 80090470 81010018 */  lwz       r8, 0x18(r1)
/* 08D474 80090474 7F23CB78 */  mr        r3, r25
/* 08D478 80090478 80F90064 */  lwz       r7, 0x64(r25)
/* 08D47C 8009047C 7FE4FB78 */  mr        r4, r31
/* 08D480 80090480 80C80008 */  lwz       r6, 0x8(r8)
/* 08D484 80090484 80A8000C */  lwz       r5, 0xc(r8)
/* 08D488 80090488 38080010 */  addi      r0, r8, 0x10
/* 08D48C 8009048C 83680004 */  lwz       r27, 0x4(r8)
/* 08D490 80090490 7FA63A14 */  add       r29, r6, r7
/* 08D494 80090494 7F453A14 */  add       r26, r5, r7
/* 08D498 80090498 7F7BFA14 */  add       r27, r27, r31
/* 08D49C 8009049C 90010018 */  stw       r0, 0x18(r1)
/* 08D4A0 800904A0 38BB0000 */  addi      r5, r27, 0x0
/* 08D4A4 800904A4 3BC00000 */  li        r30, 0x0
/* 08D4A8 800904A8 4BFA3971 */  bl        cpuInvalidateCache
lbl_800904AC:
/* 08D4AC 800904AC 2C1E0000 */  cmpwi     r30, 0x0
/* 08D4B0 800904B0 40820018 */  bne       lbl_800904C8
/* 08D4B4 800904B4 80610018 */  lwz       r3, 0x18(r1)
/* 08D4B8 800904B8 3BC00020 */  li        r30, 0x20
/* 08D4BC 800904BC 83830000 */  lwz       r28, 0x0(r3)
/* 08D4C0 800904C0 38030004 */  addi      r0, r3, 0x4
/* 08D4C4 800904C4 90010018 */  stw       r0, 0x18(r1)
lbl_800904C8:
/* 08D4C8 800904C8 2C1C0000 */  cmpwi     r28, 0x0
/* 08D4CC 800904CC 4080000C */  bge       lbl_800904D8
/* 08D4D0 800904D0 38000001 */  li        r0, 0x1
/* 08D4D4 800904D4 48000008 */  b         lbl_800904DC
lbl_800904D8:
/* 08D4D8 800904D8 38000000 */  li        r0, 0x0
lbl_800904DC:
/* 08D4DC 800904DC 2C000000 */  cmpwi     r0, 0x0
/* 08D4E0 800904E0 41820040 */  beq       lbl_80090520
/* 08D4E4 800904E4 38790000 */  addi      r3, r25, 0x0
/* 08D4E8 800904E8 38BA0000 */  addi      r5, r26, 0x0
/* 08D4EC 800904EC 38810010 */  addi      r4, r1, 0x10
/* 08D4F0 800904F0 4BFA3B45 */  bl        cpuGetAddressBuffer
/* 08D4F4 800904F4 38790000 */  addi      r3, r25, 0x0
/* 08D4F8 800904F8 38BF0000 */  addi      r5, r31, 0x0
/* 08D4FC 800904FC 3881000C */  addi      r4, r1, 0xc
/* 08D500 80090500 4BFA3B35 */  bl        cpuGetAddressBuffer
/* 08D504 80090504 80810010 */  lwz       r4, 0x10(r1)
/* 08D508 80090508 3B5A0001 */  addi      r26, r26, 0x1
/* 08D50C 8009050C 8061000C */  lwz       r3, 0xc(r1)
/* 08D510 80090510 3BFF0001 */  addi      r31, r31, 0x1
/* 08D514 80090514 88040000 */  lbz       r0, 0x0(r4)
/* 08D518 80090518 98030000 */  stb       r0, 0x0(r3)
/* 08D51C 8009051C 48000070 */  b         lbl_8009058C
lbl_80090520:
/* 08D520 80090520 38790000 */  addi      r3, r25, 0x0
/* 08D524 80090524 38BD0000 */  addi      r5, r29, 0x0
/* 08D528 80090528 38810014 */  addi      r4, r1, 0x14
/* 08D52C 8009052C 4BFA3B09 */  bl        cpuGetAddressBuffer
/* 08D530 80090530 80610014 */  lwz       r3, 0x14(r1)
/* 08D534 80090534 3BBD0002 */  addi      r29, r29, 0x2
/* 08D538 80090538 A8030000 */  lha       r0, 0x0(r3)
/* 08D53C 8009053C 5403A73E */  extrwi    r3, r0, 4, 16
/* 08D540 80090540 5400053E */  clrlwi    r0, r0, 20
/* 08D544 80090544 3AE30003 */  addi      r23, r3, 0x3
/* 08D548 80090548 7F00F850 */  subf      r24, r0, r31
lbl_8009054C:
/* 08D54C 8009054C 38790000 */  addi      r3, r25, 0x0
/* 08D550 80090550 38810010 */  addi      r4, r1, 0x10
/* 08D554 80090554 38B8FFFF */  subi      r5, r24, 0x1
/* 08D558 80090558 4BFA3ADD */  bl        cpuGetAddressBuffer
/* 08D55C 8009055C 38790000 */  addi      r3, r25, 0x0
/* 08D560 80090560 38BF0000 */  addi      r5, r31, 0x0
/* 08D564 80090564 3881000C */  addi      r4, r1, 0xc
/* 08D568 80090568 4BFA3ACD */  bl        cpuGetAddressBuffer
/* 08D56C 8009056C 80810010 */  lwz       r4, 0x10(r1)
/* 08D570 80090570 36F7FFFF */  subic.    r23, r23, 0x1
/* 08D574 80090574 8061000C */  lwz       r3, 0xc(r1)
/* 08D578 80090578 3B180001 */  addi      r24, r24, 0x1
/* 08D57C 8009057C 88040000 */  lbz       r0, 0x0(r4)
/* 08D580 80090580 3BFF0001 */  addi      r31, r31, 0x1
/* 08D584 80090584 98030000 */  stb       r0, 0x0(r3)
/* 08D588 80090588 4082FFC4 */  bne       lbl_8009054C
lbl_8009058C:
/* 08D58C 8009058C 7C1FD800 */  cmpw      r31, r27
/* 08D590 80090590 579C083C */  slwi      r28, r28, 1
/* 08D594 80090594 3BDEFFFF */  subi      r30, r30, 0x1
/* 08D598 80090598 4082FF14 */  bne       lbl_800904AC
/* 08D59C 8009059C BAE10024 */  lmw       r23, 0x24(r1)
/* 08D5A0 800905A0 38600001 */  li        r3, 0x1
/* 08D5A4 800905A4 8001004C */  lwz       r0, 0x4c(r1)
/* 08D5A8 800905A8 38210048 */  addi      r1, r1, 0x48
/* 08D5AC 800905AC 7C0803A6 */  mtlr      r0
/* 08D5B0 800905B0 4E800020 */  blr

glabel osEepromLongWrite
/* 08D5B4 800905B4 7C0802A6 */  mflr      r0
/* 08D5B8 800905B8 90010004 */  stw       r0, 0x4(r1)
/* 08D5BC 800905BC 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08D5C0 800905C0 93E1001C */  stw       r31, 0x1c(r1)
/* 08D5C4 800905C4 3881000C */  addi      r4, r1, 0xc
/* 08D5C8 800905C8 93C10018 */  stw       r30, 0x18(r1)
/* 08D5CC 800905CC 3BC00000 */  li        r30, 0x0
/* 08D5D0 800905D0 93A10014 */  stw       r29, 0x14(r1)
/* 08D5D4 800905D4 93810010 */  stw       r28, 0x10(r1)
/* 08D5D8 800905D8 7C7C1B78 */  mr        r28, r3
/* 08D5DC 800905DC 8BA3006F */  lbz       r29, 0x6f(r3)
/* 08D5E0 800905E0 80BC0074 */  lwz       r5, 0x74(r28)
/* 08D5E4 800905E4 4BFA3A51 */  bl        cpuGetAddressBuffer
/* 08D5E8 800905E8 2C030000 */  cmpwi     r3, 0x0
/* 08D5EC 800905EC 4082000C */  bne       lbl_800905F8
/* 08D5F0 800905F0 38600000 */  li        r3, 0x0
/* 08D5F4 800905F4 4800004C */  b         lbl_80090640
lbl_800905F8:
/* 08D5F8 800905F8 83FC007C */  lwz       r31, 0x7c(r28)
/* 08D5FC 800905FC 48000034 */  b         lbl_80090630
lbl_80090600:
/* 08D600 80090600 7FA3EB78 */  mr        r3, r29
/* 08D604 80090604 8081000C */  lwz       r4, 0xc(r1)
/* 08D608 80090608 4BF786E5 */  bl        simulatorWriteEEPROM
/* 08D60C 8009060C 2C030000 */  cmpwi     r3, 0x0
/* 08D610 80090610 4082000C */  bne       lbl_8009061C
/* 08D614 80090614 3BC0FFFF */  li        r30, -0x1
/* 08D618 80090618 48000020 */  b         lbl_80090638
lbl_8009061C:
/* 08D61C 8009061C 8061000C */  lwz       r3, 0xc(r1)
/* 08D620 80090620 3BFFFFF8 */  subi      r31, r31, 0x8
/* 08D624 80090624 3BBD0001 */  addi      r29, r29, 0x1
/* 08D628 80090628 38030008 */  addi      r0, r3, 0x8
/* 08D62C 8009062C 9001000C */  stw       r0, 0xc(r1)
lbl_80090630:
/* 08D630 80090630 2C1F0000 */  cmpwi     r31, 0x0
/* 08D634 80090634 4181FFCC */  bgt       lbl_80090600
lbl_80090638:
/* 08D638 80090638 93DC0054 */  stw       r30, 0x54(r28)
/* 08D63C 8009063C 38600001 */  li        r3, 0x1
lbl_80090640:
/* 08D640 80090640 80010024 */  lwz       r0, 0x24(r1)
/* 08D644 80090644 83E1001C */  lwz       r31, 0x1c(r1)
/* 08D648 80090648 83C10018 */  lwz       r30, 0x18(r1)
/* 08D64C 8009064C 7C0803A6 */  mtlr      r0
/* 08D650 80090650 83A10014 */  lwz       r29, 0x14(r1)
/* 08D654 80090654 83810010 */  lwz       r28, 0x10(r1)
/* 08D658 80090658 38210020 */  addi      r1, r1, 0x20
/* 08D65C 8009065C 4E800020 */  blr

glabel osEepromLongRead
/* 08D660 80090660 7C0802A6 */  mflr      r0
/* 08D664 80090664 90010004 */  stw       r0, 0x4(r1)
/* 08D668 80090668 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08D66C 8009066C 93E1001C */  stw       r31, 0x1c(r1)
/* 08D670 80090670 3881000C */  addi      r4, r1, 0xc
/* 08D674 80090674 93C10018 */  stw       r30, 0x18(r1)
/* 08D678 80090678 3BC00000 */  li        r30, 0x0
/* 08D67C 8009067C 93A10014 */  stw       r29, 0x14(r1)
/* 08D680 80090680 93810010 */  stw       r28, 0x10(r1)
/* 08D684 80090684 7C7C1B78 */  mr        r28, r3
/* 08D688 80090688 8BA3006F */  lbz       r29, 0x6f(r3)
/* 08D68C 8009068C 80BC0074 */  lwz       r5, 0x74(r28)
/* 08D690 80090690 4BFA39A5 */  bl        cpuGetAddressBuffer
/* 08D694 80090694 2C030000 */  cmpwi     r3, 0x0
/* 08D698 80090698 4082000C */  bne       lbl_800906A4
/* 08D69C 8009069C 38600000 */  li        r3, 0x0
/* 08D6A0 800906A0 4800004C */  b         lbl_800906EC
lbl_800906A4:
/* 08D6A4 800906A4 83FC007C */  lwz       r31, 0x7c(r28)
/* 08D6A8 800906A8 48000034 */  b         lbl_800906DC
lbl_800906AC:
/* 08D6AC 800906AC 7FA3EB78 */  mr        r3, r29
/* 08D6B0 800906B0 8081000C */  lwz       r4, 0xc(r1)
/* 08D6B4 800906B4 4BF786A9 */  bl        simulatorReadEEPROM
/* 08D6B8 800906B8 2C030000 */  cmpwi     r3, 0x0
/* 08D6BC 800906BC 4082000C */  bne       lbl_800906C8
/* 08D6C0 800906C0 3BC0FFFF */  li        r30, -0x1
/* 08D6C4 800906C4 48000020 */  b         lbl_800906E4
lbl_800906C8:
/* 08D6C8 800906C8 8061000C */  lwz       r3, 0xc(r1)
/* 08D6CC 800906CC 3BFFFFF8 */  subi      r31, r31, 0x8
/* 08D6D0 800906D0 3BBD0001 */  addi      r29, r29, 0x1
/* 08D6D4 800906D4 38030008 */  addi      r0, r3, 0x8
/* 08D6D8 800906D8 9001000C */  stw       r0, 0xc(r1)
lbl_800906DC:
/* 08D6DC 800906DC 2C1F0000 */  cmpwi     r31, 0x0
/* 08D6E0 800906E0 4181FFCC */  bgt       lbl_800906AC
lbl_800906E4:
/* 08D6E4 800906E4 93DC0054 */  stw       r30, 0x54(r28)
/* 08D6E8 800906E8 38600001 */  li        r3, 0x1
lbl_800906EC:
/* 08D6EC 800906EC 80010024 */  lwz       r0, 0x24(r1)
/* 08D6F0 800906F0 83E1001C */  lwz       r31, 0x1c(r1)
/* 08D6F4 800906F4 83C10018 */  lwz       r30, 0x18(r1)
/* 08D6F8 800906F8 7C0803A6 */  mtlr      r0
/* 08D6FC 800906FC 83A10014 */  lwz       r29, 0x14(r1)
/* 08D700 80090700 83810010 */  lwz       r28, 0x10(r1)
/* 08D704 80090704 38210020 */  addi      r1, r1, 0x20
/* 08D708 80090708 4E800020 */  blr

glabel osEepromWrite
/* 08D70C 8009070C 7C0802A6 */  mflr      r0
/* 08D710 80090710 90010004 */  stw       r0, 0x4(r1)
/* 08D714 80090714 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08D718 80090718 93E1001C */  stw       r31, 0x1c(r1)
/* 08D71C 8009071C 3881000C */  addi      r4, r1, 0xc
/* 08D720 80090720 93C10018 */  stw       r30, 0x18(r1)
/* 08D724 80090724 7C7E1B78 */  mr        r30, r3
/* 08D728 80090728 8BE3006F */  lbz       r31, 0x6f(r3)
/* 08D72C 8009072C 80BE0074 */  lwz       r5, 0x74(r30)
/* 08D730 80090730 4BFA3905 */  bl        cpuGetAddressBuffer
/* 08D734 80090734 2C030000 */  cmpwi     r3, 0x0
/* 08D738 80090738 4082000C */  bne       lbl_80090744
/* 08D73C 8009073C 38600000 */  li        r3, 0x0
/* 08D740 80090740 4800002C */  b         lbl_8009076C
lbl_80090744:
/* 08D744 80090744 7FE3FB78 */  mr        r3, r31
/* 08D748 80090748 8081000C */  lwz       r4, 0xc(r1)
/* 08D74C 8009074C 4BF785A1 */  bl        simulatorWriteEEPROM
/* 08D750 80090750 2C030000 */  cmpwi     r3, 0x0
/* 08D754 80090754 4182000C */  beq       lbl_80090760
/* 08D758 80090758 38000000 */  li        r0, 0x0
/* 08D75C 8009075C 48000008 */  b         lbl_80090764
lbl_80090760:
/* 08D760 80090760 3800FFFF */  li        r0, -0x1
lbl_80090764:
/* 08D764 80090764 901E0054 */  stw       r0, 0x54(r30)
/* 08D768 80090768 38600001 */  li        r3, 0x1
lbl_8009076C:
/* 08D76C 8009076C 80010024 */  lwz       r0, 0x24(r1)
/* 08D770 80090770 83E1001C */  lwz       r31, 0x1c(r1)
/* 08D774 80090774 83C10018 */  lwz       r30, 0x18(r1)
/* 08D778 80090778 7C0803A6 */  mtlr      r0
/* 08D77C 8009077C 38210020 */  addi      r1, r1, 0x20
/* 08D780 80090780 4E800020 */  blr

glabel osEepromRead
/* 08D784 80090784 7C0802A6 */  mflr      r0
/* 08D788 80090788 90010004 */  stw       r0, 0x4(r1)
/* 08D78C 8009078C 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08D790 80090790 93E1001C */  stw       r31, 0x1c(r1)
/* 08D794 80090794 3881000C */  addi      r4, r1, 0xc
/* 08D798 80090798 93C10018 */  stw       r30, 0x18(r1)
/* 08D79C 8009079C 7C7E1B78 */  mr        r30, r3
/* 08D7A0 800907A0 8BE3006F */  lbz       r31, 0x6f(r3)
/* 08D7A4 800907A4 80BE0074 */  lwz       r5, 0x74(r30)
/* 08D7A8 800907A8 4BFA388D */  bl        cpuGetAddressBuffer
/* 08D7AC 800907AC 2C030000 */  cmpwi     r3, 0x0
/* 08D7B0 800907B0 4082000C */  bne       lbl_800907BC
/* 08D7B4 800907B4 38600000 */  li        r3, 0x0
/* 08D7B8 800907B8 4800002C */  b         lbl_800907E4
lbl_800907BC:
/* 08D7BC 800907BC 7FE3FB78 */  mr        r3, r31
/* 08D7C0 800907C0 8081000C */  lwz       r4, 0xc(r1)
/* 08D7C4 800907C4 4BF78599 */  bl        simulatorReadEEPROM
/* 08D7C8 800907C8 2C030000 */  cmpwi     r3, 0x0
/* 08D7CC 800907CC 4182000C */  beq       lbl_800907D8
/* 08D7D0 800907D0 38000000 */  li        r0, 0x0
/* 08D7D4 800907D4 48000008 */  b         lbl_800907DC
lbl_800907D8:
/* 08D7D8 800907D8 3800FFFF */  li        r0, -0x1
lbl_800907DC:
/* 08D7DC 800907DC 901E0054 */  stw       r0, 0x54(r30)
/* 08D7E0 800907E0 38600001 */  li        r3, 0x1
lbl_800907E4:
/* 08D7E4 800907E4 80010024 */  lwz       r0, 0x24(r1)
/* 08D7E8 800907E8 83E1001C */  lwz       r31, 0x1c(r1)
/* 08D7EC 800907EC 83C10018 */  lwz       r30, 0x18(r1)
/* 08D7F0 800907F0 7C0803A6 */  mtlr      r0
/* 08D7F4 800907F4 38210020 */  addi      r1, r1, 0x20
/* 08D7F8 800907F8 4E800020 */  blr

glabel __osEepStatus
/* 08D7FC 800907FC 7C0802A6 */  mflr      r0
/* 08D800 80090800 90010004 */  stw       r0, 0x4(r1)
/* 08D804 80090804 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08D808 80090808 93E1001C */  stw       r31, 0x1c(r1)
/* 08D80C 8009080C 7C7F1B78 */  mr        r31, r3
/* 08D810 80090810 3881000C */  addi      r4, r1, 0xc
/* 08D814 80090814 80A3006C */  lwz       r5, 0x6c(r3)
/* 08D818 80090818 4BFA381D */  bl        cpuGetAddressBuffer
/* 08D81C 8009081C 2C030000 */  cmpwi     r3, 0x0
/* 08D820 80090820 4082000C */  bne       lbl_8009082C
/* 08D824 80090824 38600000 */  li        r3, 0x0
/* 08D828 80090828 48000098 */  b         lbl_800908C0
lbl_8009082C:
/* 08D82C 8009082C 807F0008 */  lwz       r3, 0x8(r31)
/* 08D830 80090830 38810010 */  addi      r4, r1, 0x10
/* 08D834 80090834 80630028 */  lwz       r3, 0x28(r3)
/* 08D838 80090838 4BFDB919 */  bl        pifGetEEPROMSize
/* 08D83C 8009083C 2C030000 */  cmpwi     r3, 0x0
/* 08D840 80090840 4182004C */  beq       lbl_8009088C
/* 08D844 80090844 80010010 */  lwz       r0, 0x10(r1)
/* 08D848 80090848 2C000800 */  cmpwi     r0, 0x800
/* 08D84C 8009084C 4082000C */  bne       lbl_80090858
/* 08D850 80090850 38000040 */  li        r0, 0x40
/* 08D854 80090854 48000008 */  b         lbl_8009085C
lbl_80090858:
/* 08D858 80090858 38000000 */  li        r0, 0x0
lbl_8009085C:
/* 08D85C 8009085C 8061000C */  lwz       r3, 0xc(r1)
/* 08D860 80090860 60040080 */  ori       r4, r0, 0x80
/* 08D864 80090864 38000000 */  li        r0, 0x0
/* 08D868 80090868 98830000 */  stb       r4, 0x0(r3)
/* 08D86C 8009086C 38A00000 */  li        r5, 0x0
/* 08D870 80090870 8061000C */  lwz       r3, 0xc(r1)
/* 08D874 80090874 98030001 */  stb       r0, 0x1(r3)
/* 08D878 80090878 8061000C */  lwz       r3, 0xc(r1)
/* 08D87C 8009087C 98030002 */  stb       r0, 0x2(r3)
/* 08D880 80090880 8061000C */  lwz       r3, 0xc(r1)
/* 08D884 80090884 98030003 */  stb       r0, 0x3(r3)
/* 08D888 80090888 48000030 */  b         lbl_800908B8
lbl_8009088C:
/* 08D88C 8009088C 8061000C */  lwz       r3, 0xc(r1)
/* 08D890 80090890 38800000 */  li        r4, 0x0
/* 08D894 80090894 380000FF */  li        r0, 0xff
/* 08D898 80090898 98830000 */  stb       r4, 0x0(r3)
/* 08D89C 8009089C 38A0FFFF */  li        r5, -0x1
/* 08D8A0 800908A0 8061000C */  lwz       r3, 0xc(r1)
/* 08D8A4 800908A4 98830001 */  stb       r4, 0x1(r3)
/* 08D8A8 800908A8 8061000C */  lwz       r3, 0xc(r1)
/* 08D8AC 800908AC 98830002 */  stb       r4, 0x2(r3)
/* 08D8B0 800908B0 8061000C */  lwz       r3, 0xc(r1)
/* 08D8B4 800908B4 98030003 */  stb       r0, 0x3(r3)
lbl_800908B8:
/* 08D8B8 800908B8 90BF0054 */  stw       r5, 0x54(r31)
/* 08D8BC 800908BC 38600001 */  li        r3, 0x1
lbl_800908C0:
/* 08D8C0 800908C0 80010024 */  lwz       r0, 0x24(r1)
/* 08D8C4 800908C4 83E1001C */  lwz       r31, 0x1c(r1)
/* 08D8C8 800908C8 38210020 */  addi      r1, r1, 0x20
/* 08D8CC 800908CC 7C0803A6 */  mtlr      r0
/* 08D8D0 800908D0 4E800020 */  blr

glabel osAiSetNextBuffer
/* 08D8D4 800908D4 7C0802A6 */  mflr      r0
/* 08D8D8 800908D8 90010004 */  stw       r0, 0x4(r1)
/* 08D8DC 800908DC 3C008000 */  lis       r0, 0x8000
/* 08D8E0 800908E0 9421FFD8 */  stwu      r1, -0x28(r1)
/* 08D8E4 800908E4 93E10024 */  stw       r31, 0x24(r1)
/* 08D8E8 800908E8 93C10020 */  stw       r30, 0x20(r1)
/* 08D8EC 800908EC 7C7E1B78 */  mr        r30, r3
/* 08D8F0 800908F0 809E0064 */  lwz       r4, 0x64(r30)
/* 08D8F4 800908F4 83E3006C */  lwz       r31, 0x6c(r3)
/* 08D8F8 800908F8 7C040040 */  cmplw     r4, r0
/* 08D8FC 800908FC 80630064 */  lwz       r3, 0x64(r3)
/* 08D900 80090900 4180001C */  blt       lbl_8009091C
/* 08D904 80090904 3C00A000 */  lis       r0, 0xa000
/* 08D908 80090908 7C040040 */  cmplw     r4, r0
/* 08D90C 8009090C 40800010 */  bge       lbl_8009091C
/* 08D910 80090910 548000FE */  clrlwi    r0, r4, 3
/* 08D914 80090914 901E0054 */  stw       r0, 0x54(r30)
/* 08D918 80090918 4800004C */  b         lbl_80090964
lbl_8009091C:
/* 08D91C 8009091C 3C00A000 */  lis       r0, 0xa000
/* 08D920 80090920 7C040040 */  cmplw     r4, r0
/* 08D924 80090924 4180001C */  blt       lbl_80090940
/* 08D928 80090928 3C00C000 */  lis       r0, 0xc000
/* 08D92C 8009092C 7C040040 */  cmplw     r4, r0
/* 08D930 80090930 40800010 */  bge       lbl_80090940
/* 08D934 80090934 548000FE */  clrlwi    r0, r4, 3
/* 08D938 80090938 901E0054 */  stw       r0, 0x54(r30)
/* 08D93C 8009093C 48000028 */  b         lbl_80090964
lbl_80090940:
/* 08D940 80090940 5480843E */  srwi      r0, r4, 16
/* 08D944 80090944 7C7E0214 */  add       r3, r30, r0
/* 08D948 80090948 88030F64 */  lbz       r0, 0xf64(r3)
/* 08D94C 8009094C 5400103A */  slwi      r0, r0, 2
/* 08D950 80090950 7C7E0214 */  add       r3, r30, r0
/* 08D954 80090954 80630B64 */  lwz       r3, 0xb64(r3)
/* 08D958 80090958 80030008 */  lwz       r0, 0x8(r3)
/* 08D95C 8009095C 7C040214 */  add       r0, r4, r0
/* 08D960 80090960 901E0054 */  stw       r0, 0x54(r30)
lbl_80090964:
/* 08D964 80090964 801E0054 */  lwz       r0, 0x54(r30)
/* 08D968 80090968 38A10010 */  addi      r5, r1, 0x10
/* 08D96C 8009096C 3C80A450 */  lis       r4, 0xa450
/* 08D970 80090970 90010010 */  stw       r0, 0x10(r1)
/* 08D974 80090974 807E0008 */  lwz       r3, 0x8(r30)
/* 08D978 80090978 8063004C */  lwz       r3, 0x4c(r3)
/* 08D97C 8009097C 4BFFD505 */  bl        audioPut32
/* 08D980 80090980 2C030000 */  cmpwi     r3, 0x0
/* 08D984 80090984 4082000C */  bne       lbl_80090990
/* 08D988 80090988 38600000 */  li        r3, 0x0
/* 08D98C 8009098C 4800003C */  b         lbl_800909C8
lbl_80090990:
/* 08D990 80090990 93E10010 */  stw       r31, 0x10(r1)
/* 08D994 80090994 3C60A450 */  lis       r3, 0xa450
/* 08D998 80090998 38830004 */  addi      r4, r3, 0x4
/* 08D99C 8009099C 807E0008 */  lwz       r3, 0x8(r30)
/* 08D9A0 800909A0 38A10010 */  addi      r5, r1, 0x10
/* 08D9A4 800909A4 8063004C */  lwz       r3, 0x4c(r3)
/* 08D9A8 800909A8 4BFFD4D9 */  bl        audioPut32
/* 08D9AC 800909AC 2C030000 */  cmpwi     r3, 0x0
/* 08D9B0 800909B0 4082000C */  bne       lbl_800909BC
/* 08D9B4 800909B4 38600000 */  li        r3, 0x0
/* 08D9B8 800909B8 48000010 */  b         lbl_800909C8
lbl_800909BC:
/* 08D9BC 800909BC 38000000 */  li        r0, 0x0
/* 08D9C0 800909C0 901E0054 */  stw       r0, 0x54(r30)
/* 08D9C4 800909C4 38600001 */  li        r3, 0x1
lbl_800909C8:
/* 08D9C8 800909C8 8001002C */  lwz       r0, 0x2c(r1)
/* 08D9CC 800909CC 83E10024 */  lwz       r31, 0x24(r1)
/* 08D9D0 800909D0 83C10020 */  lwz       r30, 0x20(r1)
/* 08D9D4 800909D4 7C0803A6 */  mtlr      r0
/* 08D9D8 800909D8 38210028 */  addi      r1, r1, 0x28
/* 08D9DC 800909DC 4E800020 */  blr

glabel osAiSetFrequency
/* 08D9E0 800909E0 7C0802A6 */  mflr      r0
/* 08D9E4 800909E4 90010004 */  stw       r0, 0x4(r1)
/* 08D9E8 800909E8 3C004330 */  lis       r0, 0x4330
/* 08D9EC 800909EC 9421FFC0 */  stwu      r1, -0x40(r1)
/* 08D9F0 800909F0 DBE10038 */  stfd      f31, 0x38(r1)
/* 08D9F4 800909F4 93E10034 */  stw       r31, 0x34(r1)
/* 08D9F8 800909F8 7C7F1B78 */  mr        r31, r3
/* 08D9FC 800909FC 93C10030 */  stw       r30, 0x30(r1)
/* 08DA00 80090A00 93A1002C */  stw       r29, 0x2c(r1)
/* 08DA04 80090A04 93810028 */  stw       r28, 0x28(r1)
/* 08DA08 80090A08 80630064 */  lwz       r3, 0x64(r3)
/* 08DA0C 80090A0C C8228380 */  lfd       f1, D_8018C2C0@sda21(r0)
/* 08DA10 80090A10 90610024 */  stw       r3, 0x24(r1)
/* 08DA14 80090A14 C042837C */  lfs       f2, D_8018C2BC@sda21(r0)
/* 08DA18 80090A18 90010020 */  stw       r0, 0x20(r1)
/* 08DA1C 80090A1C C0628378 */  lfs       f3, D_8018C2B8@sda21(r0)
/* 08DA20 80090A20 C8010020 */  lfd       f0, 0x20(r1)
/* 08DA24 80090A24 EC000828 */  fsubs     f0, f0, f1
/* 08DA28 80090A28 EC020024 */  fdivs     f0, f2, f0
/* 08DA2C 80090A2C EFE3002A */  fadds     f31, f3, f0
/* 08DA30 80090A30 FC20F890 */  fmr       f1, f31
/* 08DA34 80090A34 4803BA79 */  bl        __cvt_fp2unsigned
/* 08DA38 80090A38 7C7D1B78 */  mr        r29, r3
/* 08DA3C 80090A3C FC20F890 */  fmr       f1, f31
/* 08DA40 80090A40 4803BA6D */  bl        __cvt_fp2unsigned
/* 08DA44 80090A44 28030084 */  cmplwi    r3, 0x84
/* 08DA48 80090A48 40810094 */  ble       lbl_80090ADC
/* 08DA4C 80090A4C 3C603E10 */  lis       r3, 0x3e10
/* 08DA50 80090A50 380383E1 */  subi      r0, r3, 0x7c1f
/* 08DA54 80090A54 7C00E816 */  mulhwu    r0, r0, r29
/* 08DA58 80090A58 541CE63E */  extrwi    r28, r0, 8, 20
/* 08DA5C 80090A5C 281C0010 */  cmplwi    r28, 0x10
/* 08DA60 80090A60 40810008 */  ble       lbl_80090A68
/* 08DA64 80090A64 3B800010 */  li        r28, 0x10
lbl_80090A68:
/* 08DA68 80090A68 381DFFFF */  subi      r0, r29, 0x1
/* 08DA6C 80090A6C 90010010 */  stw       r0, 0x10(r1)
/* 08DA70 80090A70 3FC0A450 */  lis       r30, 0xa450
/* 08DA74 80090A74 389E0010 */  addi      r4, r30, 0x10
/* 08DA78 80090A78 807F0008 */  lwz       r3, 0x8(r31)
/* 08DA7C 80090A7C 38A10010 */  addi      r5, r1, 0x10
/* 08DA80 80090A80 8063004C */  lwz       r3, 0x4c(r3)
/* 08DA84 80090A84 4BFFD3FD */  bl        audioPut32
/* 08DA88 80090A88 2C030000 */  cmpwi     r3, 0x0
/* 08DA8C 80090A8C 4082000C */  bne       lbl_80090A98
/* 08DA90 80090A90 38600000 */  li        r3, 0x0
/* 08DA94 80090A94 48000054 */  b         lbl_80090AE8
lbl_80090A98:
/* 08DA98 80090A98 5783063E */  clrlwi    r3, r28, 24
/* 08DA9C 80090A9C 3803FFFF */  subi      r0, r3, 0x1
/* 08DAA0 80090AA0 90010010 */  stw       r0, 0x10(r1)
/* 08DAA4 80090AA4 389E0014 */  addi      r4, r30, 0x14
/* 08DAA8 80090AA8 38A10010 */  addi      r5, r1, 0x10
/* 08DAAC 80090AAC 807F0008 */  lwz       r3, 0x8(r31)
/* 08DAB0 80090AB0 8063004C */  lwz       r3, 0x4c(r3)
/* 08DAB4 80090AB4 4BFFD3CD */  bl        audioPut32
/* 08DAB8 80090AB8 2C030000 */  cmpwi     r3, 0x0
/* 08DABC 80090ABC 4082000C */  bne       lbl_80090AC8
/* 08DAC0 80090AC0 38600000 */  li        r3, 0x0
/* 08DAC4 80090AC4 48000024 */  b         lbl_80090AE8
lbl_80090AC8:
/* 08DAC8 80090AC8 3C6002E7 */  lis       r3, 0x2e7
/* 08DACC 80090ACC 3803D354 */  subi      r0, r3, 0x2cac
/* 08DAD0 80090AD0 7C00EBD6 */  divw      r0, r0, r29
/* 08DAD4 80090AD4 901F0054 */  stw       r0, 0x54(r31)
/* 08DAD8 80090AD8 4800000C */  b         lbl_80090AE4
lbl_80090ADC:
/* 08DADC 80090ADC 3800FFFF */  li        r0, -0x1
/* 08DAE0 80090AE0 901F0054 */  stw       r0, 0x54(r31)
lbl_80090AE4:
/* 08DAE4 80090AE4 38600001 */  li        r3, 0x1
lbl_80090AE8:
/* 08DAE8 80090AE8 80010044 */  lwz       r0, 0x44(r1)
/* 08DAEC 80090AEC CBE10038 */  lfd       f31, 0x38(r1)
/* 08DAF0 80090AF0 83E10034 */  lwz       r31, 0x34(r1)
/* 08DAF4 80090AF4 7C0803A6 */  mtlr      r0
/* 08DAF8 80090AF8 83C10030 */  lwz       r30, 0x30(r1)
/* 08DAFC 80090AFC 83A1002C */  lwz       r29, 0x2c(r1)
/* 08DB00 80090B00 83810028 */  lwz       r28, 0x28(r1)
/* 08DB04 80090B04 38210040 */  addi      r1, r1, 0x40
/* 08DB08 80090B08 4E800020 */  blr

glabel guLookAtReflect
/* 08DB0C 80090B0C 7C0802A6 */  mflr      r0
/* 08DB10 80090B10 90010004 */  stw       r0, 0x4(r1)
/* 08DB14 80090B14 9421FF58 */  stwu      r1, -0xa8(r1)
/* 08DB18 80090B18 DBE100A0 */  stfd      f31, 0xa0(r1)
/* 08DB1C 80090B1C 38810024 */  addi      r4, r1, 0x24
/* 08DB20 80090B20 DBC10098 */  stfd      f30, 0x98(r1)
/* 08DB24 80090B24 DBA10090 */  stfd      f29, 0x90(r1)
/* 08DB28 80090B28 93E1008C */  stw       r31, 0x8c(r1)
/* 08DB2C 80090B2C 7C7F1B78 */  mr        r31, r3
/* 08DB30 80090B30 80A30064 */  lwz       r5, 0x64(r3)
/* 08DB34 80090B34 4BFA3501 */  bl        cpuGetAddressBuffer
/* 08DB38 80090B38 80BF006C */  lwz       r5, 0x6c(r31)
/* 08DB3C 80090B3C 387F0000 */  addi      r3, r31, 0x0
/* 08DB40 80090B40 38810070 */  addi      r4, r1, 0x70
/* 08DB44 80090B44 4BFA34F1 */  bl        cpuGetAddressBuffer
/* 08DB48 80090B48 80BF012C */  lwz       r5, 0x12c(r31)
/* 08DB4C 80090B4C 387F0000 */  addi      r3, r31, 0x0
/* 08DB50 80090B50 38810020 */  addi      r4, r1, 0x20
/* 08DB54 80090B54 4BFA34E1 */  bl        cpuGetAddressBuffer
/* 08DB58 80090B58 801F0074 */  lwz       r0, 0x74(r31)
/* 08DB5C 80090B5C 9001006C */  stw       r0, 0x6c(r1)
/* 08DB60 80090B60 C061006C */  lfs       f3, 0x6c(r1)
/* 08DB64 80090B64 801F007C */  lwz       r0, 0x7c(r31)
/* 08DB68 80090B68 9001006C */  stw       r0, 0x6c(r1)
/* 08DB6C 80090B6C 80610020 */  lwz       r3, 0x20(r1)
/* 08DB70 80090B70 C081006C */  lfs       f4, 0x6c(r1)
/* 08DB74 80090B74 80030010 */  lwz       r0, 0x10(r3)
/* 08DB78 80090B78 9001006C */  stw       r0, 0x6c(r1)
/* 08DB7C 80090B7C C0A1006C */  lfs       f5, 0x6c(r1)
/* 08DB80 80090B80 80030014 */  lwz       r0, 0x14(r3)
/* 08DB84 80090B84 9001006C */  stw       r0, 0x6c(r1)
/* 08DB88 80090B88 C001006C */  lfs       f0, 0x6c(r1)
/* 08DB8C 80090B8C 80030018 */  lwz       r0, 0x18(r3)
/* 08DB90 80090B90 ECC01828 */  fsubs     f6, f0, f3
/* 08DB94 80090B94 9001006C */  stw       r0, 0x6c(r1)
/* 08DB98 80090B98 C001006C */  lfs       f0, 0x6c(r1)
/* 08DB9C 80090B9C 8003001C */  lwz       r0, 0x1c(r3)
/* 08DBA0 80090BA0 ECE02028 */  fsubs     f7, f0, f4
/* 08DBA4 80090BA4 9001006C */  stw       r0, 0x6c(r1)
/* 08DBA8 80090BA8 C021006C */  lfs       f1, 0x6c(r1)
/* 08DBAC 80090BAC EC0701F2 */  fmuls     f0, f7, f7
/* 08DBB0 80090BB0 80030020 */  lwz       r0, 0x20(r3)
/* 08DBB4 80090BB4 ED012828 */  fsubs     f8, f1, f5
/* 08DBB8 80090BB8 9001006C */  stw       r0, 0x6c(r1)
/* 08DBBC 80090BBC EC2601BA */  fmadds    f1, f6, f6, f0
/* 08DBC0 80090BC0 C001006C */  lfs       f0, 0x6c(r1)
/* 08DBC4 80090BC4 80030024 */  lwz       r0, 0x24(r3)
/* 08DBC8 80090BC8 EDA80A3A */  fmadds    f13, f8, f8, f1
/* 08DBCC 80090BCC 9001006C */  stw       r0, 0x6c(r1)
/* 08DBD0 80090BD0 C021006C */  lfs       f1, 0x6c(r1)
/* 08DBD4 80090BD4 80030028 */  lwz       r0, 0x28(r3)
/* 08DBD8 80090BD8 9001006C */  stw       r0, 0x6c(r1)
/* 08DBDC 80090BDC C1228388 */  lfs       f9, D_8018C2C8@sda21(r0)
/* 08DBE0 80090BE0 C041006C */  lfs       f2, 0x6c(r1)
/* 08DBE4 80090BE4 FC0D4840 */  fcmpo     cr0, f13, f9
/* 08DBE8 80090BE8 40810050 */  ble       lbl_80090C38
/* 08DBEC 80090BEC FD406834 */  frsqrte   f10, f13
/* 08DBF0 80090BF0 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08DBF4 80090BF4 C9628398 */  lfd       f11, D_8018C2D8@sda21(r0)
/* 08DBF8 80090BF8 FD2A02B2 */  fmul      f9, f10, f10
/* 08DBFC 80090BFC FD4C02B2 */  fmul      f10, f12, f10
/* 08DC00 80090C00 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08DC04 80090C04 FD4A0272 */  fmul      f10, f10, f9
/* 08DC08 80090C08 FD2A02B2 */  fmul      f9, f10, f10
/* 08DC0C 80090C0C FD4C02B2 */  fmul      f10, f12, f10
/* 08DC10 80090C10 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08DC14 80090C14 FD4A0272 */  fmul      f10, f10, f9
/* 08DC18 80090C18 FD2A02B2 */  fmul      f9, f10, f10
/* 08DC1C 80090C1C FD4C02B2 */  fmul      f10, f12, f10
/* 08DC20 80090C20 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08DC24 80090C24 FD2A0272 */  fmul      f9, f10, f9
/* 08DC28 80090C28 FD2D0272 */  fmul      f9, f13, f9
/* 08DC2C 80090C2C FD204818 */  frsp      f9, f9
/* 08DC30 80090C30 D1210014 */  stfs      f9, 0x14(r1)
/* 08DC34 80090C34 C1A10014 */  lfs       f13, 0x14(r1)
lbl_80090C38:
/* 08DC38 80090C38 C12283A0 */  lfs       f9, D_8018C2E0@sda21(r0)
/* 08DC3C 80090C3C C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08DC40 80090C40 ED296824 */  fdivs     f9, f9, f13
/* 08DC44 80090C44 ED080272 */  fmuls     f8, f8, f9
/* 08DC48 80090C48 ECC60272 */  fmuls     f6, f6, f9
/* 08DC4C 80090C4C ECE70272 */  fmuls     f7, f7, f9
/* 08DC50 80090C50 ED400232 */  fmuls     f10, f0, f8
/* 08DC54 80090C54 ED2101B2 */  fmuls     f9, f1, f6
/* 08DC58 80090C58 EDA201F2 */  fmuls     f13, f2, f7
/* 08DC5C 80090C5C ED4251B8 */  fmsubs    f10, f2, f6, f10
/* 08DC60 80090C60 ED6049F8 */  fmsubs    f11, f0, f7, f9
/* 08DC64 80090C64 ED216A38 */  fmsubs    f9, f1, f8, f13
/* 08DC68 80090C68 EC0A02B2 */  fmuls     f0, f10, f10
/* 08DC6C 80090C6C EC09027A */  fmadds    f0, f9, f9, f0
/* 08DC70 80090C70 EDAB02FA */  fmadds    f13, f11, f11, f0
/* 08DC74 80090C74 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DC78 80090C78 40810050 */  ble       lbl_80090CC8
/* 08DC7C 80090C7C FC206834 */  frsqrte   f1, f13
/* 08DC80 80090C80 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08DC84 80090C84 C8428398 */  lfd       f2, D_8018C2D8@sda21(r0)
/* 08DC88 80090C88 FC010072 */  fmul      f0, f1, f1
/* 08DC8C 80090C8C FC2C0072 */  fmul      f1, f12, f1
/* 08DC90 80090C90 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08DC94 80090C94 FC210032 */  fmul      f1, f1, f0
/* 08DC98 80090C98 FC010072 */  fmul      f0, f1, f1
/* 08DC9C 80090C9C FC2C0072 */  fmul      f1, f12, f1
/* 08DCA0 80090CA0 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08DCA4 80090CA4 FC210032 */  fmul      f1, f1, f0
/* 08DCA8 80090CA8 FC010072 */  fmul      f0, f1, f1
/* 08DCAC 80090CAC FC2C0072 */  fmul      f1, f12, f1
/* 08DCB0 80090CB0 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08DCB4 80090CB4 FC010032 */  fmul      f0, f1, f0
/* 08DCB8 80090CB8 FC0D0032 */  fmul      f0, f13, f0
/* 08DCBC 80090CBC FC000018 */  frsp      f0, f0
/* 08DCC0 80090CC0 D0010010 */  stfs      f0, 0x10(r1)
/* 08DCC4 80090CC4 C1A10010 */  lfs       f13, 0x10(r1)
lbl_80090CC8:
/* 08DCC8 80090CC8 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08DCCC 80090CCC C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08DCD0 80090CD0 EC006824 */  fdivs     f0, f0, f13
/* 08DCD4 80090CD4 ED6B0032 */  fmuls     f11, f11, f0
/* 08DCD8 80090CD8 ED290032 */  fmuls     f9, f9, f0
/* 08DCDC 80090CDC ED4A0032 */  fmuls     f10, f10, f0
/* 08DCE0 80090CE0 EC2602F2 */  fmuls     f1, f6, f11
/* 08DCE4 80090CE4 EC070272 */  fmuls     f0, f7, f9
/* 08DCE8 80090CE8 EDA802B2 */  fmuls     f13, f8, f10
/* 08DCEC 80090CEC EC280A78 */  fmsubs    f1, f8, f9, f1
/* 08DCF0 80090CF0 EC4602B8 */  fmsubs    f2, f6, f10, f0
/* 08DCF4 80090CF4 EC076AF8 */  fmsubs    f0, f7, f11, f13
/* 08DCF8 80090CF8 EDA10072 */  fmuls     f13, f1, f1
/* 08DCFC 80090CFC EDA0683A */  fmadds    f13, f0, f0, f13
/* 08DD00 80090D00 EFA268BA */  fmadds    f29, f2, f2, f13
/* 08DD04 80090D04 FC1D6040 */  fcmpo     cr0, f29, f12
/* 08DD08 80090D08 40810050 */  ble       lbl_80090D58
/* 08DD0C 80090D0C FDA0E834 */  frsqrte   f13, f29
/* 08DD10 80090D10 CBC28390 */  lfd       f30, D_8018C2D0@sda21(r0)
/* 08DD14 80090D14 CBE28398 */  lfd       f31, D_8018C2D8@sda21(r0)
/* 08DD18 80090D18 FD8D0372 */  fmul      f12, f13, f13
/* 08DD1C 80090D1C FDBE0372 */  fmul      f13, f30, f13
/* 08DD20 80090D20 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08DD24 80090D24 FDAD0332 */  fmul      f13, f13, f12
/* 08DD28 80090D28 FD8D0372 */  fmul      f12, f13, f13
/* 08DD2C 80090D2C FDBE0372 */  fmul      f13, f30, f13
/* 08DD30 80090D30 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08DD34 80090D34 FDAD0332 */  fmul      f13, f13, f12
/* 08DD38 80090D38 FD8D0372 */  fmul      f12, f13, f13
/* 08DD3C 80090D3C FDBE0372 */  fmul      f13, f30, f13
/* 08DD40 80090D40 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08DD44 80090D44 FD8D0332 */  fmul      f12, f13, f12
/* 08DD48 80090D48 FD9D0332 */  fmul      f12, f29, f12
/* 08DD4C 80090D4C FD806018 */  frsp      f12, f12
/* 08DD50 80090D50 D181000C */  stfs      f12, 0xc(r1)
/* 08DD54 80090D54 C3A1000C */  lfs       f29, 0xc(r1)
lbl_80090D58:
/* 08DD58 80090D58 C18283A4 */  lfs       f12, D_8018C2E4@sda21(r0)
/* 08DD5C 80090D5C C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08DD60 80090D60 EFACE824 */  fdivs     f29, f12, f29
/* 08DD64 80090D64 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08DD68 80090D68 EDAD0272 */  fmuls     f13, f13, f9
/* 08DD6C 80090D6C EC000772 */  fmuls     f0, f0, f29
/* 08DD70 80090D70 EC210772 */  fmuls     f1, f1, f29
/* 08DD74 80090D74 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DD78 80090D78 EC420772 */  fmuls     f2, f2, f29
/* 08DD7C 80090D7C 40800008 */  bge       lbl_80090D84
/* 08DD80 80090D80 48000008 */  b         lbl_80090D88
lbl_80090D84:
/* 08DD84 80090D84 FDA06090 */  fmr       f13, f12
lbl_80090D88:
/* 08DD88 80090D88 FD80681E */  fctiwz    f12, f13
/* 08DD8C 80090D8C 80610070 */  lwz       r3, 0x70(r1)
/* 08DD90 80090D90 D9810080 */  stfd      f12, 0x80(r1)
/* 08DD94 80090D94 80010084 */  lwz       r0, 0x84(r1)
/* 08DD98 80090D98 98030008 */  stb       r0, 0x8(r3)
/* 08DD9C 80090D9C C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08DDA0 80090DA0 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08DDA4 80090DA4 EDAD02B2 */  fmuls     f13, f13, f10
/* 08DDA8 80090DA8 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DDAC 80090DAC 40800008 */  bge       lbl_80090DB4
/* 08DDB0 80090DB0 48000008 */  b         lbl_80090DB8
lbl_80090DB4:
/* 08DDB4 80090DB4 FDA06090 */  fmr       f13, f12
lbl_80090DB8:
/* 08DDB8 80090DB8 FD80681E */  fctiwz    f12, f13
/* 08DDBC 80090DBC 80610070 */  lwz       r3, 0x70(r1)
/* 08DDC0 80090DC0 D9810080 */  stfd      f12, 0x80(r1)
/* 08DDC4 80090DC4 80010084 */  lwz       r0, 0x84(r1)
/* 08DDC8 80090DC8 98030009 */  stb       r0, 0x9(r3)
/* 08DDCC 80090DCC C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08DDD0 80090DD0 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08DDD4 80090DD4 EDAD02F2 */  fmuls     f13, f13, f11
/* 08DDD8 80090DD8 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DDDC 80090DDC 40800008 */  bge       lbl_80090DE4
/* 08DDE0 80090DE0 48000008 */  b         lbl_80090DE8
lbl_80090DE4:
/* 08DDE4 80090DE4 FDA06090 */  fmr       f13, f12
lbl_80090DE8:
/* 08DDE8 80090DE8 FD80681E */  fctiwz    f12, f13
/* 08DDEC 80090DEC 80610070 */  lwz       r3, 0x70(r1)
/* 08DDF0 80090DF0 D9810080 */  stfd      f12, 0x80(r1)
/* 08DDF4 80090DF4 80010084 */  lwz       r0, 0x84(r1)
/* 08DDF8 80090DF8 9803000A */  stb       r0, 0xa(r3)
/* 08DDFC 80090DFC C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08DE00 80090E00 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08DE04 80090E04 EDAD0032 */  fmuls     f13, f13, f0
/* 08DE08 80090E08 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DE0C 80090E0C 40800008 */  bge       lbl_80090E14
/* 08DE10 80090E10 48000008 */  b         lbl_80090E18
lbl_80090E14:
/* 08DE14 80090E14 FDA06090 */  fmr       f13, f12
lbl_80090E18:
/* 08DE18 80090E18 FD80681E */  fctiwz    f12, f13
/* 08DE1C 80090E1C 80610070 */  lwz       r3, 0x70(r1)
/* 08DE20 80090E20 D9810080 */  stfd      f12, 0x80(r1)
/* 08DE24 80090E24 80010084 */  lwz       r0, 0x84(r1)
/* 08DE28 80090E28 98030018 */  stb       r0, 0x18(r3)
/* 08DE2C 80090E2C C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08DE30 80090E30 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08DE34 80090E34 EDAD0072 */  fmuls     f13, f13, f1
/* 08DE38 80090E38 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DE3C 80090E3C 40800008 */  bge       lbl_80090E44
/* 08DE40 80090E40 48000008 */  b         lbl_80090E48
lbl_80090E44:
/* 08DE44 80090E44 FDA06090 */  fmr       f13, f12
lbl_80090E48:
/* 08DE48 80090E48 FD80681E */  fctiwz    f12, f13
/* 08DE4C 80090E4C 80610070 */  lwz       r3, 0x70(r1)
/* 08DE50 80090E50 D9810080 */  stfd      f12, 0x80(r1)
/* 08DE54 80090E54 80010084 */  lwz       r0, 0x84(r1)
/* 08DE58 80090E58 98030019 */  stb       r0, 0x19(r3)
/* 08DE5C 80090E5C C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08DE60 80090E60 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08DE64 80090E64 EDAD00B2 */  fmuls     f13, f13, f2
/* 08DE68 80090E68 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08DE6C 80090E6C 40800008 */  bge       lbl_80090E74
/* 08DE70 80090E70 48000008 */  b         lbl_80090E78
lbl_80090E74:
/* 08DE74 80090E74 FDA06090 */  fmr       f13, f12
lbl_80090E78:
/* 08DE78 80090E78 FFE0681E */  fctiwz    f31, f13
/* 08DE7C 80090E7C 38000002 */  li        r0, 0x2
/* 08DE80 80090E80 EDA402B2 */  fmuls     f13, f4, f10
/* 08DE84 80090E84 80610070 */  lwz       r3, 0x70(r1)
/* 08DE88 80090E88 ED840072 */  fmuls     f12, f4, f1
/* 08DE8C 80090E8C DBE10080 */  stfd      f31, 0x80(r1)
/* 08DE90 80090E90 EDA36A7A */  fmadds    f13, f3, f9, f13
/* 08DE94 80090E94 38A00000 */  li        r5, 0x0
/* 08DE98 80090E98 ED83603A */  fmadds    f12, f3, f0, f12
/* 08DE9C 80090E9C 80810084 */  lwz       r4, 0x84(r1)
/* 08DEA0 80090EA0 EFE56AFE */  fnmadds   f31, f5, f11, f13
/* 08DEA4 80090EA4 9883001A */  stb       r4, 0x1a(r3)
/* 08DEA8 80090EA8 EC8401F2 */  fmuls     f4, f4, f7
/* 08DEAC 80090EAC 38800080 */  li        r4, 0x80
/* 08DEB0 80090EB0 EDA560BE */  fnmadds   f13, f5, f2, f12
/* 08DEB4 80090EB4 80610070 */  lwz       r3, 0x70(r1)
/* 08DEB8 80090EB8 EC6321BA */  fmadds    f3, f3, f6, f4
/* 08DEBC 80090EBC 7C0903A6 */  mtctr     r0
/* 08DEC0 80090EC0 38C10028 */  addi      r6, r1, 0x28
/* 08DEC4 80090EC4 98A30000 */  stb       r5, 0x0(r3)
/* 08DEC8 80090EC8 ED851A3E */  fnmadds   f12, f5, f8, f3
/* 08DECC 80090ECC 80610070 */  lwz       r3, 0x70(r1)
/* 08DED0 80090ED0 38E00000 */  li        r7, 0x0
/* 08DED4 80090ED4 98A30001 */  stb       r5, 0x1(r3)
/* 08DED8 80090ED8 80610070 */  lwz       r3, 0x70(r1)
/* 08DEDC 80090EDC 98A30002 */  stb       r5, 0x2(r3)
/* 08DEE0 80090EE0 80610070 */  lwz       r3, 0x70(r1)
/* 08DEE4 80090EE4 98A30003 */  stb       r5, 0x3(r3)
/* 08DEE8 80090EE8 80610070 */  lwz       r3, 0x70(r1)
/* 08DEEC 80090EEC 98A30004 */  stb       r5, 0x4(r3)
/* 08DEF0 80090EF0 80610070 */  lwz       r3, 0x70(r1)
/* 08DEF4 80090EF4 98A30005 */  stb       r5, 0x5(r3)
/* 08DEF8 80090EF8 80610070 */  lwz       r3, 0x70(r1)
/* 08DEFC 80090EFC 98A30006 */  stb       r5, 0x6(r3)
/* 08DF00 80090F00 80610070 */  lwz       r3, 0x70(r1)
/* 08DF04 80090F04 98A30007 */  stb       r5, 0x7(r3)
/* 08DF08 80090F08 80610070 */  lwz       r3, 0x70(r1)
/* 08DF0C 80090F0C 98A30010 */  stb       r5, 0x10(r3)
/* 08DF10 80090F10 80610070 */  lwz       r3, 0x70(r1)
/* 08DF14 80090F14 98830011 */  stb       r4, 0x11(r3)
/* 08DF18 80090F18 80610070 */  lwz       r3, 0x70(r1)
/* 08DF1C 80090F1C 98A30012 */  stb       r5, 0x12(r3)
/* 08DF20 80090F20 80610070 */  lwz       r3, 0x70(r1)
/* 08DF24 80090F24 98A30013 */  stb       r5, 0x13(r3)
/* 08DF28 80090F28 80610070 */  lwz       r3, 0x70(r1)
/* 08DF2C 80090F2C 98A30014 */  stb       r5, 0x14(r3)
/* 08DF30 80090F30 80610070 */  lwz       r3, 0x70(r1)
/* 08DF34 80090F34 98830015 */  stb       r4, 0x15(r3)
/* 08DF38 80090F38 80610070 */  lwz       r3, 0x70(r1)
/* 08DF3C 80090F3C 98A30016 */  stb       r5, 0x16(r3)
/* 08DF40 80090F40 80610070 */  lwz       r3, 0x70(r1)
/* 08DF44 80090F44 98A30017 */  stb       r5, 0x17(r3)
/* 08DF48 80090F48 D1210028 */  stfs      f9, 0x28(r1)
/* 08DF4C 80090F4C 80610024 */  lwz       r3, 0x24(r1)
/* 08DF50 80090F50 D1410038 */  stfs      f10, 0x38(r1)
/* 08DF54 80090F54 C0A28388 */  lfs       f5, D_8018C2C8@sda21(r0)
/* 08DF58 80090F58 7C691B78 */  mr        r9, r3
/* 08DF5C 80090F5C D1610048 */  stfs      f11, 0x48(r1)
/* 08DF60 80090F60 39430020 */  addi      r10, r3, 0x20
/* 08DF64 80090F64 C08283A4 */  lfs       f4, D_8018C2E4@sda21(r0)
/* 08DF68 80090F68 D3E10058 */  stfs      f31, 0x58(r1)
/* 08DF6C 80090F6C C06283B0 */  lfs       f3, D_8018C2F0@sda21(r0)
/* 08DF70 80090F70 D001002C */  stfs      f0, 0x2c(r1)
/* 08DF74 80090F74 D021003C */  stfs      f1, 0x3c(r1)
/* 08DF78 80090F78 D041004C */  stfs      f2, 0x4c(r1)
/* 08DF7C 80090F7C D1A1005C */  stfs      f13, 0x5c(r1)
/* 08DF80 80090F80 D0C10030 */  stfs      f6, 0x30(r1)
/* 08DF84 80090F84 D0E10040 */  stfs      f7, 0x40(r1)
/* 08DF88 80090F88 D1010050 */  stfs      f8, 0x50(r1)
/* 08DF8C 80090F8C D1810060 */  stfs      f12, 0x60(r1)
/* 08DF90 80090F90 D0A10034 */  stfs      f5, 0x34(r1)
/* 08DF94 80090F94 D0A10044 */  stfs      f5, 0x44(r1)
/* 08DF98 80090F98 D0A10054 */  stfs      f5, 0x54(r1)
/* 08DF9C 80090F9C D0810064 */  stfs      f4, 0x64(r1)
lbl_80090FA0:
/* 08DFA0 80090FA0 C0260000 */  lfs       f1, 0x0(r6)
/* 08DFA4 80090FA4 C0060004 */  lfs       f0, 0x4(r6)
/* 08DFA8 80090FA8 EC230072 */  fmuls     f1, f3, f1
/* 08DFAC 80090FAC EC030032 */  fmuls     f0, f3, f0
/* 08DFB0 80090FB0 FC20081E */  fctiwz    f1, f1
/* 08DFB4 80090FB4 FC00001E */  fctiwz    f0, f0
/* 08DFB8 80090FB8 D8210080 */  stfd      f1, 0x80(r1)
/* 08DFBC 80090FBC D8010078 */  stfd      f0, 0x78(r1)
/* 08DFC0 80090FC0 80A10084 */  lwz       r5, 0x84(r1)
/* 08DFC4 80090FC4 8101007C */  lwz       r8, 0x7c(r1)
/* 08DFC8 80090FC8 54A0801E */  slwi      r0, r5, 16
/* 08DFCC 80090FCC 5503843E */  srwi      r3, r8, 16
/* 08DFD0 80090FD0 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08DFD4 80090FD4 90690000 */  stw       r3, 0x0(r9)
/* 08DFD8 80090FD8 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08DFDC 80090FDC 900A0000 */  stw       r0, 0x0(r10)
/* 08DFE0 80090FE0 C0260008 */  lfs       f1, 0x8(r6)
/* 08DFE4 80090FE4 C006000C */  lfs       f0, 0xc(r6)
/* 08DFE8 80090FE8 38C60010 */  addi      r6, r6, 0x10
/* 08DFEC 80090FEC EC230072 */  fmuls     f1, f3, f1
/* 08DFF0 80090FF0 EC030032 */  fmuls     f0, f3, f0
/* 08DFF4 80090FF4 FC20081E */  fctiwz    f1, f1
/* 08DFF8 80090FF8 FC00001E */  fctiwz    f0, f0
/* 08DFFC 80090FFC D8210080 */  stfd      f1, 0x80(r1)
/* 08E000 80091000 D8010078 */  stfd      f0, 0x78(r1)
/* 08E004 80091004 80A10084 */  lwz       r5, 0x84(r1)
/* 08E008 80091008 8101007C */  lwz       r8, 0x7c(r1)
/* 08E00C 8009100C 54A0801E */  slwi      r0, r5, 16
/* 08E010 80091010 5503843E */  srwi      r3, r8, 16
/* 08E014 80091014 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08E018 80091018 90690004 */  stw       r3, 0x4(r9)
/* 08E01C 8009101C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08E020 80091020 39290008 */  addi      r9, r9, 0x8
/* 08E024 80091024 900A0004 */  stw       r0, 0x4(r10)
/* 08E028 80091028 394A0008 */  addi      r10, r10, 0x8
/* 08E02C 8009102C C0260000 */  lfs       f1, 0x0(r6)
/* 08E030 80091030 38E70001 */  addi      r7, r7, 0x1
/* 08E034 80091034 C0060004 */  lfs       f0, 0x4(r6)
/* 08E038 80091038 EC230072 */  fmuls     f1, f3, f1
/* 08E03C 8009103C EC030032 */  fmuls     f0, f3, f0
/* 08E040 80091040 FC20081E */  fctiwz    f1, f1
/* 08E044 80091044 FC00001E */  fctiwz    f0, f0
/* 08E048 80091048 D8210080 */  stfd      f1, 0x80(r1)
/* 08E04C 8009104C D8010078 */  stfd      f0, 0x78(r1)
/* 08E050 80091050 80A10084 */  lwz       r5, 0x84(r1)
/* 08E054 80091054 8101007C */  lwz       r8, 0x7c(r1)
/* 08E058 80091058 54A0801E */  slwi      r0, r5, 16
/* 08E05C 8009105C 5503843E */  srwi      r3, r8, 16
/* 08E060 80091060 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08E064 80091064 90690000 */  stw       r3, 0x0(r9)
/* 08E068 80091068 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08E06C 8009106C 900A0000 */  stw       r0, 0x0(r10)
/* 08E070 80091070 C0260008 */  lfs       f1, 0x8(r6)
/* 08E074 80091074 C006000C */  lfs       f0, 0xc(r6)
/* 08E078 80091078 38C60010 */  addi      r6, r6, 0x10
/* 08E07C 8009107C EC230072 */  fmuls     f1, f3, f1
/* 08E080 80091080 EC030032 */  fmuls     f0, f3, f0
/* 08E084 80091084 FC20081E */  fctiwz    f1, f1
/* 08E088 80091088 FC00001E */  fctiwz    f0, f0
/* 08E08C 8009108C D8210080 */  stfd      f1, 0x80(r1)
/* 08E090 80091090 D8010078 */  stfd      f0, 0x78(r1)
/* 08E094 80091094 80A10084 */  lwz       r5, 0x84(r1)
/* 08E098 80091098 8101007C */  lwz       r8, 0x7c(r1)
/* 08E09C 8009109C 54A0801E */  slwi      r0, r5, 16
/* 08E0A0 800910A0 5503843E */  srwi      r3, r8, 16
/* 08E0A4 800910A4 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08E0A8 800910A8 90690004 */  stw       r3, 0x4(r9)
/* 08E0AC 800910AC 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08E0B0 800910B0 39290008 */  addi      r9, r9, 0x8
/* 08E0B4 800910B4 900A0004 */  stw       r0, 0x4(r10)
/* 08E0B8 800910B8 394A0008 */  addi      r10, r10, 0x8
/* 08E0BC 800910BC 4200FEE4 */  bdnz      lbl_80090FA0
/* 08E0C0 800910C0 800100AC */  lwz       r0, 0xac(r1)
/* 08E0C4 800910C4 CBE100A0 */  lfd       f31, 0xa0(r1)
/* 08E0C8 800910C8 CBC10098 */  lfd       f30, 0x98(r1)
/* 08E0CC 800910CC 7C0803A6 */  mtlr      r0
/* 08E0D0 800910D0 CBA10090 */  lfd       f29, 0x90(r1)
/* 08E0D4 800910D4 83E1008C */  lwz       r31, 0x8c(r1)
/* 08E0D8 800910D8 382100A8 */  addi      r1, r1, 0xa8
/* 08E0DC 800910DC 4E800020 */  blr

glabel guLookAtReflectF
/* 08E0E0 800910E0 7C0802A6 */  mflr      r0
/* 08E0E4 800910E4 90010004 */  stw       r0, 0x4(r1)
/* 08E0E8 800910E8 9421FFA8 */  stwu      r1, -0x58(r1)
/* 08E0EC 800910EC DBE10050 */  stfd      f31, 0x50(r1)
/* 08E0F0 800910F0 3881001C */  addi      r4, r1, 0x1c
/* 08E0F4 800910F4 DBC10048 */  stfd      f30, 0x48(r1)
/* 08E0F8 800910F8 DBA10040 */  stfd      f29, 0x40(r1)
/* 08E0FC 800910FC 93E1003C */  stw       r31, 0x3c(r1)
/* 08E100 80091100 7C7F1B78 */  mr        r31, r3
/* 08E104 80091104 80A30064 */  lwz       r5, 0x64(r3)
/* 08E108 80091108 4BFA2F2D */  bl        cpuGetAddressBuffer
/* 08E10C 8009110C 80BF006C */  lwz       r5, 0x6c(r31)
/* 08E110 80091110 387F0000 */  addi      r3, r31, 0x0
/* 08E114 80091114 38810028 */  addi      r4, r1, 0x28
/* 08E118 80091118 4BFA2F1D */  bl        cpuGetAddressBuffer
/* 08E11C 8009111C 80BF012C */  lwz       r5, 0x12c(r31)
/* 08E120 80091120 387F0000 */  addi      r3, r31, 0x0
/* 08E124 80091124 38810018 */  addi      r4, r1, 0x18
/* 08E128 80091128 4BFA2F0D */  bl        cpuGetAddressBuffer
/* 08E12C 8009112C 801F0074 */  lwz       r0, 0x74(r31)
/* 08E130 80091130 90010024 */  stw       r0, 0x24(r1)
/* 08E134 80091134 C0610024 */  lfs       f3, 0x24(r1)
/* 08E138 80091138 801F007C */  lwz       r0, 0x7c(r31)
/* 08E13C 8009113C 90010024 */  stw       r0, 0x24(r1)
/* 08E140 80091140 80610018 */  lwz       r3, 0x18(r1)
/* 08E144 80091144 C0810024 */  lfs       f4, 0x24(r1)
/* 08E148 80091148 80030010 */  lwz       r0, 0x10(r3)
/* 08E14C 8009114C 90010024 */  stw       r0, 0x24(r1)
/* 08E150 80091150 C0A10024 */  lfs       f5, 0x24(r1)
/* 08E154 80091154 80030014 */  lwz       r0, 0x14(r3)
/* 08E158 80091158 90010024 */  stw       r0, 0x24(r1)
/* 08E15C 8009115C C0010024 */  lfs       f0, 0x24(r1)
/* 08E160 80091160 80030018 */  lwz       r0, 0x18(r3)
/* 08E164 80091164 ECC01828 */  fsubs     f6, f0, f3
/* 08E168 80091168 90010024 */  stw       r0, 0x24(r1)
/* 08E16C 8009116C C0010024 */  lfs       f0, 0x24(r1)
/* 08E170 80091170 8003001C */  lwz       r0, 0x1c(r3)
/* 08E174 80091174 ECE02028 */  fsubs     f7, f0, f4
/* 08E178 80091178 90010024 */  stw       r0, 0x24(r1)
/* 08E17C 8009117C C0210024 */  lfs       f1, 0x24(r1)
/* 08E180 80091180 EC0701F2 */  fmuls     f0, f7, f7
/* 08E184 80091184 80030020 */  lwz       r0, 0x20(r3)
/* 08E188 80091188 ED012828 */  fsubs     f8, f1, f5
/* 08E18C 8009118C 90010024 */  stw       r0, 0x24(r1)
/* 08E190 80091190 EC2601BA */  fmadds    f1, f6, f6, f0
/* 08E194 80091194 C0010024 */  lfs       f0, 0x24(r1)
/* 08E198 80091198 80030024 */  lwz       r0, 0x24(r3)
/* 08E19C 8009119C EDA80A3A */  fmadds    f13, f8, f8, f1
/* 08E1A0 800911A0 90010024 */  stw       r0, 0x24(r1)
/* 08E1A4 800911A4 C0210024 */  lfs       f1, 0x24(r1)
/* 08E1A8 800911A8 80030028 */  lwz       r0, 0x28(r3)
/* 08E1AC 800911AC 90010024 */  stw       r0, 0x24(r1)
/* 08E1B0 800911B0 C1228388 */  lfs       f9, D_8018C2C8@sda21(r0)
/* 08E1B4 800911B4 C0410024 */  lfs       f2, 0x24(r1)
/* 08E1B8 800911B8 FC0D4840 */  fcmpo     cr0, f13, f9
/* 08E1BC 800911BC 40810050 */  ble       lbl_8009120C
/* 08E1C0 800911C0 FD406834 */  frsqrte   f10, f13
/* 08E1C4 800911C4 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08E1C8 800911C8 C9628398 */  lfd       f11, D_8018C2D8@sda21(r0)
/* 08E1CC 800911CC FD2A02B2 */  fmul      f9, f10, f10
/* 08E1D0 800911D0 FD4C02B2 */  fmul      f10, f12, f10
/* 08E1D4 800911D4 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08E1D8 800911D8 FD4A0272 */  fmul      f10, f10, f9
/* 08E1DC 800911DC FD2A02B2 */  fmul      f9, f10, f10
/* 08E1E0 800911E0 FD4C02B2 */  fmul      f10, f12, f10
/* 08E1E4 800911E4 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08E1E8 800911E8 FD4A0272 */  fmul      f10, f10, f9
/* 08E1EC 800911EC FD2A02B2 */  fmul      f9, f10, f10
/* 08E1F0 800911F0 FD4C02B2 */  fmul      f10, f12, f10
/* 08E1F4 800911F4 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08E1F8 800911F8 FD2A0272 */  fmul      f9, f10, f9
/* 08E1FC 800911FC FD2D0272 */  fmul      f9, f13, f9
/* 08E200 80091200 FD204818 */  frsp      f9, f9
/* 08E204 80091204 D1210014 */  stfs      f9, 0x14(r1)
/* 08E208 80091208 C1A10014 */  lfs       f13, 0x14(r1)
lbl_8009120C:
/* 08E20C 8009120C C12283A0 */  lfs       f9, D_8018C2E0@sda21(r0)
/* 08E210 80091210 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08E214 80091214 ED296824 */  fdivs     f9, f9, f13
/* 08E218 80091218 ED080272 */  fmuls     f8, f8, f9
/* 08E21C 8009121C ECC60272 */  fmuls     f6, f6, f9
/* 08E220 80091220 ECE70272 */  fmuls     f7, f7, f9
/* 08E224 80091224 ED400232 */  fmuls     f10, f0, f8
/* 08E228 80091228 ED2101B2 */  fmuls     f9, f1, f6
/* 08E22C 8009122C EDA201F2 */  fmuls     f13, f2, f7
/* 08E230 80091230 ED4251B8 */  fmsubs    f10, f2, f6, f10
/* 08E234 80091234 ED6049F8 */  fmsubs    f11, f0, f7, f9
/* 08E238 80091238 ED216A38 */  fmsubs    f9, f1, f8, f13
/* 08E23C 8009123C EC0A02B2 */  fmuls     f0, f10, f10
/* 08E240 80091240 EC09027A */  fmadds    f0, f9, f9, f0
/* 08E244 80091244 EDAB02FA */  fmadds    f13, f11, f11, f0
/* 08E248 80091248 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E24C 8009124C 40810050 */  ble       lbl_8009129C
/* 08E250 80091250 FC206834 */  frsqrte   f1, f13
/* 08E254 80091254 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08E258 80091258 C8428398 */  lfd       f2, D_8018C2D8@sda21(r0)
/* 08E25C 8009125C FC010072 */  fmul      f0, f1, f1
/* 08E260 80091260 FC2C0072 */  fmul      f1, f12, f1
/* 08E264 80091264 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08E268 80091268 FC210032 */  fmul      f1, f1, f0
/* 08E26C 8009126C FC010072 */  fmul      f0, f1, f1
/* 08E270 80091270 FC2C0072 */  fmul      f1, f12, f1
/* 08E274 80091274 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08E278 80091278 FC210032 */  fmul      f1, f1, f0
/* 08E27C 8009127C FC010072 */  fmul      f0, f1, f1
/* 08E280 80091280 FC2C0072 */  fmul      f1, f12, f1
/* 08E284 80091284 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08E288 80091288 FC010032 */  fmul      f0, f1, f0
/* 08E28C 8009128C FC0D0032 */  fmul      f0, f13, f0
/* 08E290 80091290 FC000018 */  frsp      f0, f0
/* 08E294 80091294 D0010010 */  stfs      f0, 0x10(r1)
/* 08E298 80091298 C1A10010 */  lfs       f13, 0x10(r1)
lbl_8009129C:
/* 08E29C 8009129C C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08E2A0 800912A0 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08E2A4 800912A4 EC006824 */  fdivs     f0, f0, f13
/* 08E2A8 800912A8 ED6B0032 */  fmuls     f11, f11, f0
/* 08E2AC 800912AC ED290032 */  fmuls     f9, f9, f0
/* 08E2B0 800912B0 ED4A0032 */  fmuls     f10, f10, f0
/* 08E2B4 800912B4 EC2602F2 */  fmuls     f1, f6, f11
/* 08E2B8 800912B8 EC070272 */  fmuls     f0, f7, f9
/* 08E2BC 800912BC EDA802B2 */  fmuls     f13, f8, f10
/* 08E2C0 800912C0 EC280A78 */  fmsubs    f1, f8, f9, f1
/* 08E2C4 800912C4 EC4602B8 */  fmsubs    f2, f6, f10, f0
/* 08E2C8 800912C8 EC076AF8 */  fmsubs    f0, f7, f11, f13
/* 08E2CC 800912CC EDA10072 */  fmuls     f13, f1, f1
/* 08E2D0 800912D0 EDA0683A */  fmadds    f13, f0, f0, f13
/* 08E2D4 800912D4 EFA268BA */  fmadds    f29, f2, f2, f13
/* 08E2D8 800912D8 FC1D6040 */  fcmpo     cr0, f29, f12
/* 08E2DC 800912DC 40810050 */  ble       lbl_8009132C
/* 08E2E0 800912E0 FDA0E834 */  frsqrte   f13, f29
/* 08E2E4 800912E4 CBC28390 */  lfd       f30, D_8018C2D0@sda21(r0)
/* 08E2E8 800912E8 CBE28398 */  lfd       f31, D_8018C2D8@sda21(r0)
/* 08E2EC 800912EC FD8D0372 */  fmul      f12, f13, f13
/* 08E2F0 800912F0 FDBE0372 */  fmul      f13, f30, f13
/* 08E2F4 800912F4 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08E2F8 800912F8 FDAD0332 */  fmul      f13, f13, f12
/* 08E2FC 800912FC FD8D0372 */  fmul      f12, f13, f13
/* 08E300 80091300 FDBE0372 */  fmul      f13, f30, f13
/* 08E304 80091304 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08E308 80091308 FDAD0332 */  fmul      f13, f13, f12
/* 08E30C 8009130C FD8D0372 */  fmul      f12, f13, f13
/* 08E310 80091310 FDBE0372 */  fmul      f13, f30, f13
/* 08E314 80091314 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08E318 80091318 FD8D0332 */  fmul      f12, f13, f12
/* 08E31C 8009131C FD9D0332 */  fmul      f12, f29, f12
/* 08E320 80091320 FD806018 */  frsp      f12, f12
/* 08E324 80091324 D181000C */  stfs      f12, 0xc(r1)
/* 08E328 80091328 C3A1000C */  lfs       f29, 0xc(r1)
lbl_8009132C:
/* 08E32C 8009132C C18283A4 */  lfs       f12, D_8018C2E4@sda21(r0)
/* 08E330 80091330 C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08E334 80091334 EFACE824 */  fdivs     f29, f12, f29
/* 08E338 80091338 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08E33C 8009133C EDAD0272 */  fmuls     f13, f13, f9
/* 08E340 80091340 EC000772 */  fmuls     f0, f0, f29
/* 08E344 80091344 EC210772 */  fmuls     f1, f1, f29
/* 08E348 80091348 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E34C 8009134C EC420772 */  fmuls     f2, f2, f29
/* 08E350 80091350 40800008 */  bge       lbl_80091358
/* 08E354 80091354 48000008 */  b         lbl_8009135C
lbl_80091358:
/* 08E358 80091358 FDA06090 */  fmr       f13, f12
lbl_8009135C:
/* 08E35C 8009135C FD80681E */  fctiwz    f12, f13
/* 08E360 80091360 80610028 */  lwz       r3, 0x28(r1)
/* 08E364 80091364 D9810030 */  stfd      f12, 0x30(r1)
/* 08E368 80091368 80010034 */  lwz       r0, 0x34(r1)
/* 08E36C 8009136C 98030008 */  stb       r0, 0x8(r3)
/* 08E370 80091370 C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08E374 80091374 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08E378 80091378 EDAD02B2 */  fmuls     f13, f13, f10
/* 08E37C 8009137C FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E380 80091380 40800008 */  bge       lbl_80091388
/* 08E384 80091384 48000008 */  b         lbl_8009138C
lbl_80091388:
/* 08E388 80091388 FDA06090 */  fmr       f13, f12
lbl_8009138C:
/* 08E38C 8009138C FD80681E */  fctiwz    f12, f13
/* 08E390 80091390 80610028 */  lwz       r3, 0x28(r1)
/* 08E394 80091394 D9810030 */  stfd      f12, 0x30(r1)
/* 08E398 80091398 80010034 */  lwz       r0, 0x34(r1)
/* 08E39C 8009139C 98030009 */  stb       r0, 0x9(r3)
/* 08E3A0 800913A0 C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08E3A4 800913A4 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08E3A8 800913A8 EDAD02F2 */  fmuls     f13, f13, f11
/* 08E3AC 800913AC FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E3B0 800913B0 40800008 */  bge       lbl_800913B8
/* 08E3B4 800913B4 48000008 */  b         lbl_800913BC
lbl_800913B8:
/* 08E3B8 800913B8 FDA06090 */  fmr       f13, f12
lbl_800913BC:
/* 08E3BC 800913BC FD80681E */  fctiwz    f12, f13
/* 08E3C0 800913C0 80610028 */  lwz       r3, 0x28(r1)
/* 08E3C4 800913C4 D9810030 */  stfd      f12, 0x30(r1)
/* 08E3C8 800913C8 80010034 */  lwz       r0, 0x34(r1)
/* 08E3CC 800913CC 9803000A */  stb       r0, 0xa(r3)
/* 08E3D0 800913D0 C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08E3D4 800913D4 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08E3D8 800913D8 EDAD0032 */  fmuls     f13, f13, f0
/* 08E3DC 800913DC FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E3E0 800913E0 40800008 */  bge       lbl_800913E8
/* 08E3E4 800913E4 48000008 */  b         lbl_800913EC
lbl_800913E8:
/* 08E3E8 800913E8 FDA06090 */  fmr       f13, f12
lbl_800913EC:
/* 08E3EC 800913EC FD80681E */  fctiwz    f12, f13
/* 08E3F0 800913F0 80610028 */  lwz       r3, 0x28(r1)
/* 08E3F4 800913F4 D9810030 */  stfd      f12, 0x30(r1)
/* 08E3F8 800913F8 80010034 */  lwz       r0, 0x34(r1)
/* 08E3FC 800913FC 98030018 */  stb       r0, 0x18(r3)
/* 08E400 80091400 C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08E404 80091404 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08E408 80091408 EDAD0072 */  fmuls     f13, f13, f1
/* 08E40C 8009140C FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E410 80091410 40800008 */  bge       lbl_80091418
/* 08E414 80091414 48000008 */  b         lbl_8009141C
lbl_80091418:
/* 08E418 80091418 FDA06090 */  fmr       f13, f12
lbl_8009141C:
/* 08E41C 8009141C FD80681E */  fctiwz    f12, f13
/* 08E420 80091420 80610028 */  lwz       r3, 0x28(r1)
/* 08E424 80091424 D9810030 */  stfd      f12, 0x30(r1)
/* 08E428 80091428 80010034 */  lwz       r0, 0x34(r1)
/* 08E42C 8009142C 98030019 */  stb       r0, 0x19(r3)
/* 08E430 80091430 C1A283A8 */  lfs       f13, D_8018C2E8@sda21(r0)
/* 08E434 80091434 C18283AC */  lfs       f12, D_8018C2EC@sda21(r0)
/* 08E438 80091438 EDAD00B2 */  fmuls     f13, f13, f2
/* 08E43C 8009143C FC0D6040 */  fcmpo     cr0, f13, f12
/* 08E440 80091440 40800008 */  bge       lbl_80091448
/* 08E444 80091444 48000008 */  b         lbl_8009144C
lbl_80091448:
/* 08E448 80091448 FDA06090 */  fmr       f13, f12
lbl_8009144C:
/* 08E44C 8009144C FFE0681E */  fctiwz    f31, f13
/* 08E450 80091450 80610028 */  lwz       r3, 0x28(r1)
/* 08E454 80091454 EDA402B2 */  fmuls     f13, f4, f10
/* 08E458 80091458 38800000 */  li        r4, 0x0
/* 08E45C 8009145C ED840072 */  fmuls     f12, f4, f1
/* 08E460 80091460 DBE10030 */  stfd      f31, 0x30(r1)
/* 08E464 80091464 EDA36A7A */  fmadds    f13, f3, f9, f13
/* 08E468 80091468 ED83603A */  fmadds    f12, f3, f0, f12
/* 08E46C 8009146C 38000080 */  li        r0, 0x80
/* 08E470 80091470 80A10034 */  lwz       r5, 0x34(r1)
/* 08E474 80091474 EDA56AFE */  fnmadds   f13, f5, f11, f13
/* 08E478 80091478 98A3001A */  stb       r5, 0x1a(r3)
/* 08E47C 8009147C ED8560BE */  fnmadds   f12, f5, f2, f12
/* 08E480 80091480 80610028 */  lwz       r3, 0x28(r1)
/* 08E484 80091484 98830000 */  stb       r4, 0x0(r3)
/* 08E488 80091488 80610028 */  lwz       r3, 0x28(r1)
/* 08E48C 8009148C 98830001 */  stb       r4, 0x1(r3)
/* 08E490 80091490 80610028 */  lwz       r3, 0x28(r1)
/* 08E494 80091494 98830002 */  stb       r4, 0x2(r3)
/* 08E498 80091498 80610028 */  lwz       r3, 0x28(r1)
/* 08E49C 8009149C 98830003 */  stb       r4, 0x3(r3)
/* 08E4A0 800914A0 80610028 */  lwz       r3, 0x28(r1)
/* 08E4A4 800914A4 98830004 */  stb       r4, 0x4(r3)
/* 08E4A8 800914A8 80610028 */  lwz       r3, 0x28(r1)
/* 08E4AC 800914AC 98830005 */  stb       r4, 0x5(r3)
/* 08E4B0 800914B0 80610028 */  lwz       r3, 0x28(r1)
/* 08E4B4 800914B4 98830006 */  stb       r4, 0x6(r3)
/* 08E4B8 800914B8 80610028 */  lwz       r3, 0x28(r1)
/* 08E4BC 800914BC 98830007 */  stb       r4, 0x7(r3)
/* 08E4C0 800914C0 80610028 */  lwz       r3, 0x28(r1)
/* 08E4C4 800914C4 98830010 */  stb       r4, 0x10(r3)
/* 08E4C8 800914C8 80610028 */  lwz       r3, 0x28(r1)
/* 08E4CC 800914CC 98030011 */  stb       r0, 0x11(r3)
/* 08E4D0 800914D0 80610028 */  lwz       r3, 0x28(r1)
/* 08E4D4 800914D4 98830012 */  stb       r4, 0x12(r3)
/* 08E4D8 800914D8 80610028 */  lwz       r3, 0x28(r1)
/* 08E4DC 800914DC 98830013 */  stb       r4, 0x13(r3)
/* 08E4E0 800914E0 80610028 */  lwz       r3, 0x28(r1)
/* 08E4E4 800914E4 98830014 */  stb       r4, 0x14(r3)
/* 08E4E8 800914E8 80610028 */  lwz       r3, 0x28(r1)
/* 08E4EC 800914EC 98030015 */  stb       r0, 0x15(r3)
/* 08E4F0 800914F0 80610028 */  lwz       r3, 0x28(r1)
/* 08E4F4 800914F4 98830016 */  stb       r4, 0x16(r3)
/* 08E4F8 800914F8 80610028 */  lwz       r3, 0x28(r1)
/* 08E4FC 800914FC 98830017 */  stb       r4, 0x17(r3)
/* 08E500 80091500 D1210024 */  stfs      f9, 0x24(r1)
/* 08E504 80091504 80010024 */  lwz       r0, 0x24(r1)
/* 08E508 80091508 8061001C */  lwz       r3, 0x1c(r1)
/* 08E50C 8009150C 90030000 */  stw       r0, 0x0(r3)
/* 08E510 80091510 D1410024 */  stfs      f10, 0x24(r1)
/* 08E514 80091514 80010024 */  lwz       r0, 0x24(r1)
/* 08E518 80091518 8061001C */  lwz       r3, 0x1c(r1)
/* 08E51C 8009151C 90030010 */  stw       r0, 0x10(r3)
/* 08E520 80091520 D1610024 */  stfs      f11, 0x24(r1)
/* 08E524 80091524 80010024 */  lwz       r0, 0x24(r1)
/* 08E528 80091528 8061001C */  lwz       r3, 0x1c(r1)
/* 08E52C 8009152C 90030020 */  stw       r0, 0x20(r3)
/* 08E530 80091530 D1A10024 */  stfs      f13, 0x24(r1)
/* 08E534 80091534 80010024 */  lwz       r0, 0x24(r1)
/* 08E538 80091538 8061001C */  lwz       r3, 0x1c(r1)
/* 08E53C 8009153C 90030030 */  stw       r0, 0x30(r3)
/* 08E540 80091540 D0010024 */  stfs      f0, 0x24(r1)
/* 08E544 80091544 80010024 */  lwz       r0, 0x24(r1)
/* 08E548 80091548 8061001C */  lwz       r3, 0x1c(r1)
/* 08E54C 8009154C 90030004 */  stw       r0, 0x4(r3)
/* 08E550 80091550 D0210024 */  stfs      f1, 0x24(r1)
/* 08E554 80091554 80010024 */  lwz       r0, 0x24(r1)
/* 08E558 80091558 8061001C */  lwz       r3, 0x1c(r1)
/* 08E55C 8009155C 90030014 */  stw       r0, 0x14(r3)
/* 08E560 80091560 D0410024 */  stfs      f2, 0x24(r1)
/* 08E564 80091564 80010024 */  lwz       r0, 0x24(r1)
/* 08E568 80091568 8061001C */  lwz       r3, 0x1c(r1)
/* 08E56C 8009156C 90030024 */  stw       r0, 0x24(r3)
/* 08E570 80091570 D1810024 */  stfs      f12, 0x24(r1)
/* 08E574 80091574 80010024 */  lwz       r0, 0x24(r1)
/* 08E578 80091578 8061001C */  lwz       r3, 0x1c(r1)
/* 08E57C 8009157C 90030034 */  stw       r0, 0x34(r3)
/* 08E580 80091580 D0C10024 */  stfs      f6, 0x24(r1)
/* 08E584 80091584 80010024 */  lwz       r0, 0x24(r1)
/* 08E588 80091588 8061001C */  lwz       r3, 0x1c(r1)
/* 08E58C 8009158C 90030008 */  stw       r0, 0x8(r3)
/* 08E590 80091590 D0E10024 */  stfs      f7, 0x24(r1)
/* 08E594 80091594 80010024 */  lwz       r0, 0x24(r1)
/* 08E598 80091598 8061001C */  lwz       r3, 0x1c(r1)
/* 08E59C 8009159C 90030018 */  stw       r0, 0x18(r3)
/* 08E5A0 800915A0 D1010024 */  stfs      f8, 0x24(r1)
/* 08E5A4 800915A4 EC0401F2 */  fmuls     f0, f4, f7
/* 08E5A8 800915A8 80010024 */  lwz       r0, 0x24(r1)
/* 08E5AC 800915AC 8061001C */  lwz       r3, 0x1c(r1)
/* 08E5B0 800915B0 EC0301BA */  fmadds    f0, f3, f6, f0
/* 08E5B4 800915B4 90030028 */  stw       r0, 0x28(r3)
/* 08E5B8 800915B8 EC05023E */  fnmadds   f0, f5, f8, f0
/* 08E5BC 800915BC D0010024 */  stfs      f0, 0x24(r1)
/* 08E5C0 800915C0 80010024 */  lwz       r0, 0x24(r1)
/* 08E5C4 800915C4 8061001C */  lwz       r3, 0x1c(r1)
/* 08E5C8 800915C8 90030038 */  stw       r0, 0x38(r3)
/* 08E5CC 800915CC C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 08E5D0 800915D0 D0010024 */  stfs      f0, 0x24(r1)
/* 08E5D4 800915D4 80010024 */  lwz       r0, 0x24(r1)
/* 08E5D8 800915D8 8061001C */  lwz       r3, 0x1c(r1)
/* 08E5DC 800915DC 9003000C */  stw       r0, 0xc(r3)
/* 08E5E0 800915E0 D0010024 */  stfs      f0, 0x24(r1)
/* 08E5E4 800915E4 80010024 */  lwz       r0, 0x24(r1)
/* 08E5E8 800915E8 8061001C */  lwz       r3, 0x1c(r1)
/* 08E5EC 800915EC 9003001C */  stw       r0, 0x1c(r3)
/* 08E5F0 800915F0 D0010024 */  stfs      f0, 0x24(r1)
/* 08E5F4 800915F4 80010024 */  lwz       r0, 0x24(r1)
/* 08E5F8 800915F8 8061001C */  lwz       r3, 0x1c(r1)
/* 08E5FC 800915FC 9003002C */  stw       r0, 0x2c(r3)
/* 08E600 80091600 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08E604 80091604 D0010024 */  stfs      f0, 0x24(r1)
/* 08E608 80091608 80010024 */  lwz       r0, 0x24(r1)
/* 08E60C 8009160C 8061001C */  lwz       r3, 0x1c(r1)
/* 08E610 80091610 9003003C */  stw       r0, 0x3c(r3)
/* 08E614 80091614 8001005C */  lwz       r0, 0x5c(r1)
/* 08E618 80091618 CBE10050 */  lfd       f31, 0x50(r1)
/* 08E61C 8009161C CBC10048 */  lfd       f30, 0x48(r1)
/* 08E620 80091620 CBA10040 */  lfd       f29, 0x40(r1)
/* 08E624 80091624 83E1003C */  lwz       r31, 0x3c(r1)
/* 08E628 80091628 38210058 */  addi      r1, r1, 0x58
/* 08E62C 8009162C 7C0803A6 */  mtlr      r0
/* 08E630 80091630 4E800020 */  blr

glabel guLookAtHilite
/* 08E634 80091634 7C0802A6 */  mflr      r0
/* 08E638 80091638 90010004 */  stw       r0, 0x4(r1)
/* 08E63C 8009163C 9421FF08 */  stwu      r1, -0xf8(r1)
/* 08E640 80091640 DBE100F0 */  stfd      f31, 0xf0(r1)
/* 08E644 80091644 38810034 */  addi      r4, r1, 0x34
/* 08E648 80091648 DBC100E8 */  stfd      f30, 0xe8(r1)
/* 08E64C 8009164C DBA100E0 */  stfd      f29, 0xe0(r1)
/* 08E650 80091650 DB8100D8 */  stfd      f28, 0xd8(r1)
/* 08E654 80091654 DB6100D0 */  stfd      f27, 0xd0(r1)
/* 08E658 80091658 DB4100C8 */  stfd      f26, 0xc8(r1)
/* 08E65C 8009165C DB2100C0 */  stfd      f25, 0xc0(r1)
/* 08E660 80091660 DB0100B8 */  stfd      f24, 0xb8(r1)
/* 08E664 80091664 DAE100B0 */  stfd      f23, 0xb0(r1)
/* 08E668 80091668 93E100AC */  stw       r31, 0xac(r1)
/* 08E66C 8009166C 7C7F1B78 */  mr        r31, r3
/* 08E670 80091670 80A30064 */  lwz       r5, 0x64(r3)
/* 08E674 80091674 4BFA29C1 */  bl        cpuGetAddressBuffer
/* 08E678 80091678 80BF006C */  lwz       r5, 0x6c(r31)
/* 08E67C 8009167C 387F0000 */  addi      r3, r31, 0x0
/* 08E680 80091680 38810084 */  addi      r4, r1, 0x84
/* 08E684 80091684 4BFA29B1 */  bl        cpuGetAddressBuffer
/* 08E688 80091688 80BF0074 */  lwz       r5, 0x74(r31)
/* 08E68C 8009168C 387F0000 */  addi      r3, r31, 0x0
/* 08E690 80091690 38810080 */  addi      r4, r1, 0x80
/* 08E694 80091694 4BFA29A1 */  bl        cpuGetAddressBuffer
/* 08E698 80091698 80BF012C */  lwz       r5, 0x12c(r31)
/* 08E69C 8009169C 387F0000 */  addi      r3, r31, 0x0
/* 08E6A0 800916A0 38810030 */  addi      r4, r1, 0x30
/* 08E6A4 800916A4 4BFA2991 */  bl        cpuGetAddressBuffer
/* 08E6A8 800916A8 801F007C */  lwz       r0, 0x7c(r31)
/* 08E6AC 800916AC 9001007C */  stw       r0, 0x7c(r1)
/* 08E6B0 800916B0 80610030 */  lwz       r3, 0x30(r1)
/* 08E6B4 800916B4 C0C1007C */  lfs       f6, 0x7c(r1)
/* 08E6B8 800916B8 80030010 */  lwz       r0, 0x10(r3)
/* 08E6BC 800916BC 9001007C */  stw       r0, 0x7c(r1)
/* 08E6C0 800916C0 C0E1007C */  lfs       f7, 0x7c(r1)
/* 08E6C4 800916C4 80030014 */  lwz       r0, 0x14(r3)
/* 08E6C8 800916C8 9001007C */  stw       r0, 0x7c(r1)
/* 08E6CC 800916CC C101007C */  lfs       f8, 0x7c(r1)
/* 08E6D0 800916D0 80030018 */  lwz       r0, 0x18(r3)
/* 08E6D4 800916D4 9001007C */  stw       r0, 0x7c(r1)
/* 08E6D8 800916D8 C001007C */  lfs       f0, 0x7c(r1)
/* 08E6DC 800916DC 8003001C */  lwz       r0, 0x1c(r3)
/* 08E6E0 800916E0 EC003028 */  fsubs     f0, f0, f6
/* 08E6E4 800916E4 9001007C */  stw       r0, 0x7c(r1)
/* 08E6E8 800916E8 C021007C */  lfs       f1, 0x7c(r1)
/* 08E6EC 800916EC 80030020 */  lwz       r0, 0x20(r3)
/* 08E6F0 800916F0 EC213828 */  fsubs     f1, f1, f7
/* 08E6F4 800916F4 9001007C */  stw       r0, 0x7c(r1)
/* 08E6F8 800916F8 C041007C */  lfs       f2, 0x7c(r1)
/* 08E6FC 800916FC EC610072 */  fmuls     f3, f1, f1
/* 08E700 80091700 80030024 */  lwz       r0, 0x24(r3)
/* 08E704 80091704 EC424028 */  fsubs     f2, f2, f8
/* 08E708 80091708 9001007C */  stw       r0, 0x7c(r1)
/* 08E70C 8009170C EC80183A */  fmadds    f4, f0, f0, f3
/* 08E710 80091710 C061007C */  lfs       f3, 0x7c(r1)
/* 08E714 80091714 80030028 */  lwz       r0, 0x28(r3)
/* 08E718 80091718 EF2220BA */  fmadds    f25, f2, f2, f4
/* 08E71C 8009171C 9001007C */  stw       r0, 0x7c(r1)
/* 08E720 80091720 C181007C */  lfs       f12, 0x7c(r1)
/* 08E724 80091724 8003002C */  lwz       r0, 0x2c(r3)
/* 08E728 80091728 9001007C */  stw       r0, 0x7c(r1)
/* 08E72C 8009172C C081007C */  lfs       f4, 0x7c(r1)
/* 08E730 80091730 80030030 */  lwz       r0, 0x30(r3)
/* 08E734 80091734 9001007C */  stw       r0, 0x7c(r1)
/* 08E738 80091738 C361007C */  lfs       f27, 0x7c(r1)
/* 08E73C 8009173C 80030034 */  lwz       r0, 0x34(r3)
/* 08E740 80091740 9001007C */  stw       r0, 0x7c(r1)
/* 08E744 80091744 C381007C */  lfs       f28, 0x7c(r1)
/* 08E748 80091748 80030038 */  lwz       r0, 0x38(r3)
/* 08E74C 8009174C 9001007C */  stw       r0, 0x7c(r1)
/* 08E750 80091750 C341007C */  lfs       f26, 0x7c(r1)
/* 08E754 80091754 8003003C */  lwz       r0, 0x3c(r3)
/* 08E758 80091758 9001007C */  stw       r0, 0x7c(r1)
/* 08E75C 8009175C C121007C */  lfs       f9, 0x7c(r1)
/* 08E760 80091760 80030040 */  lwz       r0, 0x40(r3)
/* 08E764 80091764 9001007C */  stw       r0, 0x7c(r1)
/* 08E768 80091768 C141007C */  lfs       f10, 0x7c(r1)
/* 08E76C 8009176C 80030044 */  lwz       r0, 0x44(r3)
/* 08E770 80091770 9001007C */  stw       r0, 0x7c(r1)
/* 08E774 80091774 C0A28388 */  lfs       f5, D_8018C2C8@sda21(r0)
/* 08E778 80091778 C161007C */  lfs       f11, 0x7c(r1)
/* 08E77C 8009177C FC192840 */  fcmpo     cr0, f25, f5
/* 08E780 80091780 80C30048 */  lwz       r6, 0x48(r3)
/* 08E784 80091784 80E3004C */  lwz       r7, 0x4c(r3)
/* 08E788 80091788 40810050 */  ble       lbl_800917D8
/* 08E78C 8009178C FDA0C834 */  frsqrte   f13, f25
/* 08E790 80091790 CB028390 */  lfd       f24, D_8018C2D0@sda21(r0)
/* 08E794 80091794 CAE28398 */  lfd       f23, D_8018C2D8@sda21(r0)
/* 08E798 80091798 FCAD0372 */  fmul      f5, f13, f13
/* 08E79C 8009179C FDB80372 */  fmul      f13, f24, f13
/* 08E7A0 800917A0 FCB9B97C */  fnmsub    f5, f25, f5, f23
/* 08E7A4 800917A4 FDAD0172 */  fmul      f13, f13, f5
/* 08E7A8 800917A8 FCAD0372 */  fmul      f5, f13, f13
/* 08E7AC 800917AC FDB80372 */  fmul      f13, f24, f13
/* 08E7B0 800917B0 FCB9B97C */  fnmsub    f5, f25, f5, f23
/* 08E7B4 800917B4 FDAD0172 */  fmul      f13, f13, f5
/* 08E7B8 800917B8 FCAD0372 */  fmul      f5, f13, f13
/* 08E7BC 800917BC FDB80372 */  fmul      f13, f24, f13
/* 08E7C0 800917C0 FCB9B97C */  fnmsub    f5, f25, f5, f23
/* 08E7C4 800917C4 FCAD0172 */  fmul      f5, f13, f5
/* 08E7C8 800917C8 FCB90172 */  fmul      f5, f25, f5
/* 08E7CC 800917CC FCA02818 */  frsp      f5, f5
/* 08E7D0 800917D0 D0A10024 */  stfs      f5, 0x24(r1)
/* 08E7D4 800917D4 C3210024 */  lfs       f25, 0x24(r1)
lbl_800917D8:
/* 08E7D8 800917D8 C0A283A0 */  lfs       f5, D_8018C2E0@sda21(r0)
/* 08E7DC 800917DC C1A28388 */  lfs       f13, D_8018C2C8@sda21(r0)
/* 08E7E0 800917E0 ECA5C824 */  fdivs     f5, f5, f25
/* 08E7E4 800917E4 EC420172 */  fmuls     f2, f2, f5
/* 08E7E8 800917E8 EC000172 */  fmuls     f0, f0, f5
/* 08E7EC 800917EC EC210172 */  fmuls     f1, f1, f5
/* 08E7F0 800917F0 EEE300B2 */  fmuls     f23, f3, f2
/* 08E7F4 800917F4 ECAC0032 */  fmuls     f5, f12, f0
/* 08E7F8 800917F8 EF040072 */  fmuls     f24, f4, f1
/* 08E7FC 800917FC EC84B838 */  fmsubs    f4, f4, f0, f23
/* 08E800 80091800 ECA32878 */  fmsubs    f5, f3, f1, f5
/* 08E804 80091804 EC6CC0B8 */  fmsubs    f3, f12, f2, f24
/* 08E808 80091808 ED840132 */  fmuls     f12, f4, f4
/* 08E80C 8009180C ED8360FA */  fmadds    f12, f3, f3, f12
/* 08E810 80091810 EF25617A */  fmadds    f25, f5, f5, f12
/* 08E814 80091814 FC196840 */  fcmpo     cr0, f25, f13
/* 08E818 80091818 40810050 */  ble       lbl_80091868
/* 08E81C 8009181C FDA0C834 */  frsqrte   f13, f25
/* 08E820 80091820 CB028390 */  lfd       f24, D_8018C2D0@sda21(r0)
/* 08E824 80091824 CAE28398 */  lfd       f23, D_8018C2D8@sda21(r0)
/* 08E828 80091828 FD8D0372 */  fmul      f12, f13, f13
/* 08E82C 8009182C FDB80372 */  fmul      f13, f24, f13
/* 08E830 80091830 FD99BB3C */  fnmsub    f12, f25, f12, f23
/* 08E834 80091834 FDAD0332 */  fmul      f13, f13, f12
/* 08E838 80091838 FD8D0372 */  fmul      f12, f13, f13
/* 08E83C 8009183C FDB80372 */  fmul      f13, f24, f13
/* 08E840 80091840 FD99BB3C */  fnmsub    f12, f25, f12, f23
/* 08E844 80091844 FDAD0332 */  fmul      f13, f13, f12
/* 08E848 80091848 FD8D0372 */  fmul      f12, f13, f13
/* 08E84C 8009184C FDB80372 */  fmul      f13, f24, f13
/* 08E850 80091850 FD99BB3C */  fnmsub    f12, f25, f12, f23
/* 08E854 80091854 FD8D0332 */  fmul      f12, f13, f12
/* 08E858 80091858 FD990332 */  fmul      f12, f25, f12
/* 08E85C 8009185C FD806018 */  frsp      f12, f12
/* 08E860 80091860 D1810020 */  stfs      f12, 0x20(r1)
/* 08E864 80091864 C3210020 */  lfs       f25, 0x20(r1)
lbl_80091868:
/* 08E868 80091868 C18283A4 */  lfs       f12, D_8018C2E4@sda21(r0)
/* 08E86C 8009186C C2E28388 */  lfs       f23, D_8018C2C8@sda21(r0)
/* 08E870 80091870 ED8CC824 */  fdivs     f12, f12, f25
/* 08E874 80091874 ECA50332 */  fmuls     f5, f5, f12
/* 08E878 80091878 EC630332 */  fmuls     f3, f3, f12
/* 08E87C 8009187C EC840332 */  fmuls     f4, f4, f12
/* 08E880 80091880 EDA00172 */  fmuls     f13, f0, f5
/* 08E884 80091884 ED8100F2 */  fmuls     f12, f1, f3
/* 08E888 80091888 EF020132 */  fmuls     f24, f2, f4
/* 08E88C 8009188C EFE268F8 */  fmsubs    f31, f2, f3, f13
/* 08E890 80091890 EFC06138 */  fmsubs    f30, f0, f4, f12
/* 08E894 80091894 EDA1C178 */  fmsubs    f13, f1, f5, f24
/* 08E898 80091898 ED9F07F2 */  fmuls     f12, f31, f31
/* 08E89C 8009189C ED8D637A */  fmadds    f12, f13, f13, f12
/* 08E8A0 800918A0 ED9E67BA */  fmadds    f12, f30, f30, f12
/* 08E8A4 800918A4 FC0CB840 */  fcmpo     cr0, f12, f23
/* 08E8A8 800918A8 40810050 */  ble       lbl_800918F8
/* 08E8AC 800918AC FF006034 */  frsqrte   f24, f12
/* 08E8B0 800918B0 CBA28390 */  lfd       f29, D_8018C2D0@sda21(r0)
/* 08E8B4 800918B4 CB228398 */  lfd       f25, D_8018C2D8@sda21(r0)
/* 08E8B8 800918B8 FEF80632 */  fmul      f23, f24, f24
/* 08E8BC 800918BC FF1D0632 */  fmul      f24, f29, f24
/* 08E8C0 800918C0 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E8C4 800918C4 FF1805F2 */  fmul      f24, f24, f23
/* 08E8C8 800918C8 FEF80632 */  fmul      f23, f24, f24
/* 08E8CC 800918CC FF1D0632 */  fmul      f24, f29, f24
/* 08E8D0 800918D0 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E8D4 800918D4 FF1805F2 */  fmul      f24, f24, f23
/* 08E8D8 800918D8 FEF80632 */  fmul      f23, f24, f24
/* 08E8DC 800918DC FF1D0632 */  fmul      f24, f29, f24
/* 08E8E0 800918E0 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E8E4 800918E4 FEF805F2 */  fmul      f23, f24, f23
/* 08E8E8 800918E8 FD8C05F2 */  fmul      f12, f12, f23
/* 08E8EC 800918EC FD806018 */  frsp      f12, f12
/* 08E8F0 800918F0 D181001C */  stfs      f12, 0x1c(r1)
/* 08E8F4 800918F4 C181001C */  lfs       f12, 0x1c(r1)
lbl_800918F8:
/* 08E8F8 800918F8 C32283A4 */  lfs       f25, D_8018C2E4@sda21(r0)
/* 08E8FC 800918FC EF1C0732 */  fmuls     f24, f28, f28
/* 08E900 80091900 C2E28388 */  lfs       f23, D_8018C2C8@sda21(r0)
/* 08E904 80091904 EF396024 */  fdivs     f25, f25, f12
/* 08E908 80091908 ED9BC6FA */  fmadds    f12, f27, f27, f24
/* 08E90C 8009190C EDAD0672 */  fmuls     f13, f13, f25
/* 08E910 80091910 EFFF0672 */  fmuls     f31, f31, f25
/* 08E914 80091914 ED9A66BA */  fmadds    f12, f26, f26, f12
/* 08E918 80091918 EFDE0672 */  fmuls     f30, f30, f25
/* 08E91C 8009191C FC0CB840 */  fcmpo     cr0, f12, f23
/* 08E920 80091920 40810050 */  ble       lbl_80091970
/* 08E924 80091924 FF006034 */  frsqrte   f24, f12
/* 08E928 80091928 CBA28390 */  lfd       f29, D_8018C2D0@sda21(r0)
/* 08E92C 8009192C CB228398 */  lfd       f25, D_8018C2D8@sda21(r0)
/* 08E930 80091930 FEF80632 */  fmul      f23, f24, f24
/* 08E934 80091934 FF1D0632 */  fmul      f24, f29, f24
/* 08E938 80091938 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E93C 8009193C FF1805F2 */  fmul      f24, f24, f23
/* 08E940 80091940 FEF80632 */  fmul      f23, f24, f24
/* 08E944 80091944 FF1D0632 */  fmul      f24, f29, f24
/* 08E948 80091948 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E94C 8009194C FF1805F2 */  fmul      f24, f24, f23
/* 08E950 80091950 FEF80632 */  fmul      f23, f24, f24
/* 08E954 80091954 FF1D0632 */  fmul      f24, f29, f24
/* 08E958 80091958 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E95C 8009195C FEF805F2 */  fmul      f23, f24, f23
/* 08E960 80091960 FD8C05F2 */  fmul      f12, f12, f23
/* 08E964 80091964 FD806018 */  frsp      f12, f12
/* 08E968 80091968 D1810018 */  stfs      f12, 0x18(r1)
/* 08E96C 8009196C C1810018 */  lfs       f12, 0x18(r1)
lbl_80091970:
/* 08E970 80091970 C30283A4 */  lfs       f24, D_8018C2E4@sda21(r0)
/* 08E974 80091974 C2E28388 */  lfs       f23, D_8018C2C8@sda21(r0)
/* 08E978 80091978 ED986024 */  fdivs     f12, f24, f12
/* 08E97C 8009197C EF9C0332 */  fmuls     f28, f28, f12
/* 08E980 80091980 EF7B0332 */  fmuls     f27, f27, f12
/* 08E984 80091984 EF5A0332 */  fmuls     f26, f26, f12
/* 08E988 80091988 EF9C082A */  fadds     f28, f28, f1
/* 08E98C 8009198C EFBB002A */  fadds     f29, f27, f0
/* 08E990 80091990 EF7A102A */  fadds     f27, f26, f2
/* 08E994 80091994 ED9C0732 */  fmuls     f12, f28, f28
/* 08E998 80091998 ED9D677A */  fmadds    f12, f29, f29, f12
/* 08E99C 8009199C ED9B66FA */  fmadds    f12, f27, f27, f12
/* 08E9A0 800919A0 FC0CB840 */  fcmpo     cr0, f12, f23
/* 08E9A4 800919A4 40810050 */  ble       lbl_800919F4
/* 08E9A8 800919A8 FF006034 */  frsqrte   f24, f12
/* 08E9AC 800919AC CB428390 */  lfd       f26, D_8018C2D0@sda21(r0)
/* 08E9B0 800919B0 CB228398 */  lfd       f25, D_8018C2D8@sda21(r0)
/* 08E9B4 800919B4 FEF80632 */  fmul      f23, f24, f24
/* 08E9B8 800919B8 FF1A0632 */  fmul      f24, f26, f24
/* 08E9BC 800919BC FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E9C0 800919C0 FF1805F2 */  fmul      f24, f24, f23
/* 08E9C4 800919C4 FEF80632 */  fmul      f23, f24, f24
/* 08E9C8 800919C8 FF1A0632 */  fmul      f24, f26, f24
/* 08E9CC 800919CC FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E9D0 800919D0 FF1805F2 */  fmul      f24, f24, f23
/* 08E9D4 800919D4 FEF80632 */  fmul      f23, f24, f24
/* 08E9D8 800919D8 FF1A0632 */  fmul      f24, f26, f24
/* 08E9DC 800919DC FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08E9E0 800919E0 FEF805F2 */  fmul      f23, f24, f23
/* 08E9E4 800919E4 FD8C05F2 */  fmul      f12, f12, f23
/* 08E9E8 800919E8 FD806018 */  frsp      f12, f12
/* 08E9EC 800919EC D1810014 */  stfs      f12, 0x14(r1)
/* 08E9F0 800919F0 C1810014 */  lfs       f12, 0x14(r1)
lbl_800919F4:
/* 08E9F4 800919F4 CAE283B8 */  lfd       f23, D_8018C2F8@sda21(r0)
/* 08E9F8 800919F8 FC0CB840 */  fcmpo     cr0, f12, f23
/* 08E9FC 800919FC 408100B0 */  ble       lbl_80091AAC
/* 08EA00 80091A00 C2E283A4 */  lfs       f23, D_8018C2E4@sda21(r0)
/* 08EA04 80091A04 6CC38000 */  xoris     r3, r6, 0x8000
/* 08EA08 80091A08 6CE08000 */  xoris     r0, r7, 0x8000
/* 08EA0C 80091A0C 906100A4 */  stw       r3, 0xa4(r1)
/* 08EA10 80091A10 EF576024 */  fdivs     f26, f23, f12
/* 08EA14 80091A14 3C604330 */  lis       r3, 0x4330
/* 08EA18 80091A18 90010094 */  stw       r0, 0x94(r1)
/* 08EA1C 80091A1C CAE283C8 */  lfd       f23, D_8018C308@sda21(r0)
/* 08EA20 80091A20 54C5103A */  slwi      r5, r6, 2
/* 08EA24 80091A24 EF9C06B2 */  fmuls     f28, f28, f26
/* 08EA28 80091A28 906100A0 */  stw       r3, 0xa0(r1)
/* 08EA2C 80091A2C EFBD06B2 */  fmuls     f29, f29, f26
/* 08EA30 80091A30 C18283C0 */  lfs       f12, D_8018C300@sda21(r0)
/* 08EA34 80091A34 CB0100A0 */  lfd       f24, 0xa0(r1)
/* 08EA38 80091A38 EF3C0132 */  fmuls     f25, f28, f4
/* 08EA3C 80091A3C 90610090 */  stw       r3, 0x90(r1)
/* 08EA40 80091A40 EF7B06B2 */  fmuls     f27, f27, f26
/* 08EA44 80091A44 80610080 */  lwz       r3, 0x80(r1)
/* 08EA48 80091A48 EF5C07F2 */  fmuls     f26, f28, f31
/* 08EA4C 80091A4C EF3DC8FA */  fmadds    f25, f29, f3, f25
/* 08EA50 80091A50 CB810090 */  lfd       f28, 0x90(r1)
/* 08EA54 80091A54 EF5DD37A */  fmadds    f26, f29, f13, f26
/* 08EA58 80091A58 54E4103A */  slwi      r4, r7, 2
/* 08EA5C 80091A5C EF18B828 */  fsubs     f24, f24, f23
/* 08EA60 80091A60 EFBBC97A */  fmadds    f29, f27, f5, f25
/* 08EA64 80091A64 EF9CB828 */  fsubs     f28, f28, f23
/* 08EA68 80091A68 EF5BD7BA */  fmadds    f26, f27, f30, f26
/* 08EA6C 80091A6C EF780772 */  fmuls     f27, f24, f29
/* 08EA70 80091A70 EF5C06B2 */  fmuls     f26, f28, f26
/* 08EA74 80091A74 EF6C06F2 */  fmuls     f27, f12, f27
/* 08EA78 80091A78 ED8C06B2 */  fmuls     f12, f12, f26
/* 08EA7C 80091A7C FF40D81E */  fctiwz    f26, f27
/* 08EA80 80091A80 FD80601E */  fctiwz    f12, f12
/* 08EA84 80091A84 DB410098 */  stfd      f26, 0x98(r1)
/* 08EA88 80091A88 8001009C */  lwz       r0, 0x9c(r1)
/* 08EA8C 80091A8C D9810088 */  stfd      f12, 0x88(r1)
/* 08EA90 80091A90 7C050214 */  add       r0, r5, r0
/* 08EA94 80091A94 90030000 */  stw       r0, 0x0(r3)
/* 08EA98 80091A98 8001008C */  lwz       r0, 0x8c(r1)
/* 08EA9C 80091A9C 80610080 */  lwz       r3, 0x80(r1)
/* 08EAA0 80091AA0 7C040214 */  add       r0, r4, r0
/* 08EAA4 80091AA4 90030004 */  stw       r0, 0x4(r3)
/* 08EAA8 80091AA8 4800001C */  b         lbl_80091AC4
lbl_80091AAC:
/* 08EAAC 80091AAC 80610080 */  lwz       r3, 0x80(r1)
/* 08EAB0 80091AB0 54C4083C */  slwi      r4, r6, 1
/* 08EAB4 80091AB4 54E0083C */  slwi      r0, r7, 1
/* 08EAB8 80091AB8 90830000 */  stw       r4, 0x0(r3)
/* 08EABC 80091ABC 80610080 */  lwz       r3, 0x80(r1)
/* 08EAC0 80091AC0 90030004 */  stw       r0, 0x4(r3)
lbl_80091AC4:
/* 08EAC4 80091AC4 EF4A02B2 */  fmuls     f26, f10, f10
/* 08EAC8 80091AC8 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08EACC 80091ACC EF49D27A */  fmadds    f26, f9, f9, f26
/* 08EAD0 80091AD0 EF0BD2FA */  fmadds    f24, f11, f11, f26
/* 08EAD4 80091AD4 FC186040 */  fcmpo     cr0, f24, f12
/* 08EAD8 80091AD8 40810050 */  ble       lbl_80091B28
/* 08EADC 80091ADC FEE0C034 */  frsqrte   f23, f24
/* 08EAE0 80091AE0 CB828390 */  lfd       f28, D_8018C2D0@sda21(r0)
/* 08EAE4 80091AE4 CB628398 */  lfd       f27, D_8018C2D8@sda21(r0)
/* 08EAE8 80091AE8 FD9705F2 */  fmul      f12, f23, f23
/* 08EAEC 80091AEC FF5C05F2 */  fmul      f26, f28, f23
/* 08EAF0 80091AF0 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08EAF4 80091AF4 FEFA0332 */  fmul      f23, f26, f12
/* 08EAF8 80091AF8 FD9705F2 */  fmul      f12, f23, f23
/* 08EAFC 80091AFC FF5C05F2 */  fmul      f26, f28, f23
/* 08EB00 80091B00 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08EB04 80091B04 FEFA0332 */  fmul      f23, f26, f12
/* 08EB08 80091B08 FD9705F2 */  fmul      f12, f23, f23
/* 08EB0C 80091B0C FF5C05F2 */  fmul      f26, f28, f23
/* 08EB10 80091B10 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08EB14 80091B14 FD9A0332 */  fmul      f12, f26, f12
/* 08EB18 80091B18 FD980332 */  fmul      f12, f24, f12
/* 08EB1C 80091B1C FD806018 */  frsp      f12, f12
/* 08EB20 80091B20 D1810010 */  stfs      f12, 0x10(r1)
/* 08EB24 80091B24 C3010010 */  lfs       f24, 0x10(r1)
lbl_80091B28:
/* 08EB28 80091B28 C34283A4 */  lfs       f26, D_8018C2E4@sda21(r0)
/* 08EB2C 80091B2C C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08EB30 80091B30 EEFAC024 */  fdivs     f23, f26, f24
/* 08EB34 80091B34 ED4A05F2 */  fmuls     f10, f10, f23
/* 08EB38 80091B38 ED2905F2 */  fmuls     f9, f9, f23
/* 08EB3C 80091B3C ED6B05F2 */  fmuls     f11, f11, f23
/* 08EB40 80091B40 ED4A082A */  fadds     f10, f10, f1
/* 08EB44 80091B44 ED29002A */  fadds     f9, f9, f0
/* 08EB48 80091B48 ED6B102A */  fadds     f11, f11, f2
/* 08EB4C 80091B4C EF4A02B2 */  fmuls     f26, f10, f10
/* 08EB50 80091B50 EF49D27A */  fmadds    f26, f9, f9, f26
/* 08EB54 80091B54 EF0BD2FA */  fmadds    f24, f11, f11, f26
/* 08EB58 80091B58 FC186040 */  fcmpo     cr0, f24, f12
/* 08EB5C 80091B5C 40810050 */  ble       lbl_80091BAC
/* 08EB60 80091B60 FEE0C034 */  frsqrte   f23, f24
/* 08EB64 80091B64 CB828390 */  lfd       f28, D_8018C2D0@sda21(r0)
/* 08EB68 80091B68 CB628398 */  lfd       f27, D_8018C2D8@sda21(r0)
/* 08EB6C 80091B6C FD9705F2 */  fmul      f12, f23, f23
/* 08EB70 80091B70 FF5C05F2 */  fmul      f26, f28, f23
/* 08EB74 80091B74 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08EB78 80091B78 FEFA0332 */  fmul      f23, f26, f12
/* 08EB7C 80091B7C FD9705F2 */  fmul      f12, f23, f23
/* 08EB80 80091B80 FF5C05F2 */  fmul      f26, f28, f23
/* 08EB84 80091B84 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08EB88 80091B88 FEFA0332 */  fmul      f23, f26, f12
/* 08EB8C 80091B8C FD9705F2 */  fmul      f12, f23, f23
/* 08EB90 80091B90 FF5C05F2 */  fmul      f26, f28, f23
/* 08EB94 80091B94 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08EB98 80091B98 FD9A0332 */  fmul      f12, f26, f12
/* 08EB9C 80091B9C FD980332 */  fmul      f12, f24, f12
/* 08EBA0 80091BA0 FD806018 */  frsp      f12, f12
/* 08EBA4 80091BA4 D181000C */  stfs      f12, 0xc(r1)
/* 08EBA8 80091BA8 C301000C */  lfs       f24, 0xc(r1)
lbl_80091BAC:
/* 08EBAC 80091BAC C98283B8 */  lfd       f12, D_8018C2F8@sda21(r0)
/* 08EBB0 80091BB0 FC186040 */  fcmpo     cr0, f24, f12
/* 08EBB4 80091BB4 408100B0 */  ble       lbl_80091C64
/* 08EBB8 80091BB8 C18283A4 */  lfs       f12, D_8018C2E4@sda21(r0)
/* 08EBBC 80091BBC 6CC38000 */  xoris     r3, r6, 0x8000
/* 08EBC0 80091BC0 6CE08000 */  xoris     r0, r7, 0x8000
/* 08EBC4 80091BC4 9061008C */  stw       r3, 0x8c(r1)
/* 08EBC8 80091BC8 EEECC024 */  fdivs     f23, f12, f24
/* 08EBCC 80091BCC 3C604330 */  lis       r3, 0x4330
/* 08EBD0 80091BD0 9001009C */  stw       r0, 0x9c(r1)
/* 08EBD4 80091BD4 CB8283C8 */  lfd       f28, D_8018C308@sda21(r0)
/* 08EBD8 80091BD8 54C5103A */  slwi      r5, r6, 2
/* 08EBDC 80091BDC ED4A05F2 */  fmuls     f10, f10, f23
/* 08EBE0 80091BE0 90610088 */  stw       r3, 0x88(r1)
/* 08EBE4 80091BE4 ED2905F2 */  fmuls     f9, f9, f23
/* 08EBE8 80091BE8 C3A283C0 */  lfs       f29, D_8018C300@sda21(r0)
/* 08EBEC 80091BEC CB610088 */  lfd       f27, 0x88(r1)
/* 08EBF0 80091BF0 ED8A0132 */  fmuls     f12, f10, f4
/* 08EBF4 80091BF4 90610098 */  stw       r3, 0x98(r1)
/* 08EBF8 80091BF8 ED6B05F2 */  fmuls     f11, f11, f23
/* 08EBFC 80091BFC 80610080 */  lwz       r3, 0x80(r1)
/* 08EC00 80091C00 ED4A07F2 */  fmuls     f10, f10, f31
/* 08EC04 80091C04 EF4960FA */  fmadds    f26, f9, f3, f12
/* 08EC08 80091C08 C9810098 */  lfd       f12, 0x98(r1)
/* 08EC0C 80091C0C ED29537A */  fmadds    f9, f9, f13, f10
/* 08EC10 80091C10 54E4103A */  slwi      r4, r7, 2
/* 08EC14 80091C14 EF7BE028 */  fsubs     f27, f27, f28
/* 08EC18 80091C18 EF4BD17A */  fmadds    f26, f11, f5, f26
/* 08EC1C 80091C1C ED4CE028 */  fsubs     f10, f12, f28
/* 08EC20 80091C20 ED2B4FBA */  fmadds    f9, f11, f30, f9
/* 08EC24 80091C24 ED7B06B2 */  fmuls     f11, f27, f26
/* 08EC28 80091C28 ED2A0272 */  fmuls     f9, f10, f9
/* 08EC2C 80091C2C ED5D02F2 */  fmuls     f10, f29, f11
/* 08EC30 80091C30 ED3D0272 */  fmuls     f9, f29, f9
/* 08EC34 80091C34 FD40501E */  fctiwz    f10, f10
/* 08EC38 80091C38 FD20481E */  fctiwz    f9, f9
/* 08EC3C 80091C3C D9410090 */  stfd      f10, 0x90(r1)
/* 08EC40 80091C40 80010094 */  lwz       r0, 0x94(r1)
/* 08EC44 80091C44 D92100A0 */  stfd      f9, 0xa0(r1)
/* 08EC48 80091C48 7C050214 */  add       r0, r5, r0
/* 08EC4C 80091C4C 90030008 */  stw       r0, 0x8(r3)
/* 08EC50 80091C50 800100A4 */  lwz       r0, 0xa4(r1)
/* 08EC54 80091C54 80610080 */  lwz       r3, 0x80(r1)
/* 08EC58 80091C58 7C040214 */  add       r0, r4, r0
/* 08EC5C 80091C5C 9003000C */  stw       r0, 0xc(r3)
/* 08EC60 80091C60 4800001C */  b         lbl_80091C7C
lbl_80091C64:
/* 08EC64 80091C64 80610080 */  lwz       r3, 0x80(r1)
/* 08EC68 80091C68 54C4083C */  slwi      r4, r6, 1
/* 08EC6C 80091C6C 54E0083C */  slwi      r0, r7, 1
/* 08EC70 80091C70 90830008 */  stw       r4, 0x8(r3)
/* 08EC74 80091C74 80610080 */  lwz       r3, 0x80(r1)
/* 08EC78 80091C78 9003000C */  stw       r0, 0xc(r3)
lbl_80091C7C:
/* 08EC7C 80091C7C C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08EC80 80091C80 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08EC84 80091C84 ED4A00F2 */  fmuls     f10, f10, f3
/* 08EC88 80091C88 FC0A4840 */  fcmpo     cr0, f10, f9
/* 08EC8C 80091C8C 40800008 */  bge       lbl_80091C94
/* 08EC90 80091C90 48000008 */  b         lbl_80091C98
lbl_80091C94:
/* 08EC94 80091C94 FD404890 */  fmr       f10, f9
lbl_80091C98:
/* 08EC98 80091C98 FD20501E */  fctiwz    f9, f10
/* 08EC9C 80091C9C 80610084 */  lwz       r3, 0x84(r1)
/* 08ECA0 80091CA0 D9210088 */  stfd      f9, 0x88(r1)
/* 08ECA4 80091CA4 8001008C */  lwz       r0, 0x8c(r1)
/* 08ECA8 80091CA8 98030008 */  stb       r0, 0x8(r3)
/* 08ECAC 80091CAC C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08ECB0 80091CB0 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08ECB4 80091CB4 ED4A0132 */  fmuls     f10, f10, f4
/* 08ECB8 80091CB8 FC0A4840 */  fcmpo     cr0, f10, f9
/* 08ECBC 80091CBC 40800008 */  bge       lbl_80091CC4
/* 08ECC0 80091CC0 48000008 */  b         lbl_80091CC8
lbl_80091CC4:
/* 08ECC4 80091CC4 FD404890 */  fmr       f10, f9
lbl_80091CC8:
/* 08ECC8 80091CC8 FD20501E */  fctiwz    f9, f10
/* 08ECCC 80091CCC 80610084 */  lwz       r3, 0x84(r1)
/* 08ECD0 80091CD0 D9210088 */  stfd      f9, 0x88(r1)
/* 08ECD4 80091CD4 8001008C */  lwz       r0, 0x8c(r1)
/* 08ECD8 80091CD8 98030009 */  stb       r0, 0x9(r3)
/* 08ECDC 80091CDC C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08ECE0 80091CE0 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08ECE4 80091CE4 ED4A0172 */  fmuls     f10, f10, f5
/* 08ECE8 80091CE8 FC0A4840 */  fcmpo     cr0, f10, f9
/* 08ECEC 80091CEC 40800008 */  bge       lbl_80091CF4
/* 08ECF0 80091CF0 48000008 */  b         lbl_80091CF8
lbl_80091CF4:
/* 08ECF4 80091CF4 FD404890 */  fmr       f10, f9
lbl_80091CF8:
/* 08ECF8 80091CF8 FD20501E */  fctiwz    f9, f10
/* 08ECFC 80091CFC 80610084 */  lwz       r3, 0x84(r1)
/* 08ED00 80091D00 D9210088 */  stfd      f9, 0x88(r1)
/* 08ED04 80091D04 8001008C */  lwz       r0, 0x8c(r1)
/* 08ED08 80091D08 9803000A */  stb       r0, 0xa(r3)
/* 08ED0C 80091D0C C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08ED10 80091D10 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08ED14 80091D14 ED4A0372 */  fmuls     f10, f10, f13
/* 08ED18 80091D18 FC0A4840 */  fcmpo     cr0, f10, f9
/* 08ED1C 80091D1C 40800008 */  bge       lbl_80091D24
/* 08ED20 80091D20 48000008 */  b         lbl_80091D28
lbl_80091D24:
/* 08ED24 80091D24 FD404890 */  fmr       f10, f9
lbl_80091D28:
/* 08ED28 80091D28 FD20501E */  fctiwz    f9, f10
/* 08ED2C 80091D2C 80610084 */  lwz       r3, 0x84(r1)
/* 08ED30 80091D30 D9210088 */  stfd      f9, 0x88(r1)
/* 08ED34 80091D34 8001008C */  lwz       r0, 0x8c(r1)
/* 08ED38 80091D38 98030018 */  stb       r0, 0x18(r3)
/* 08ED3C 80091D3C C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08ED40 80091D40 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08ED44 80091D44 ED4A07F2 */  fmuls     f10, f10, f31
/* 08ED48 80091D48 FC0A4840 */  fcmpo     cr0, f10, f9
/* 08ED4C 80091D4C 40800008 */  bge       lbl_80091D54
/* 08ED50 80091D50 48000008 */  b         lbl_80091D58
lbl_80091D54:
/* 08ED54 80091D54 FD404890 */  fmr       f10, f9
lbl_80091D58:
/* 08ED58 80091D58 FD20501E */  fctiwz    f9, f10
/* 08ED5C 80091D5C 80610084 */  lwz       r3, 0x84(r1)
/* 08ED60 80091D60 D9210088 */  stfd      f9, 0x88(r1)
/* 08ED64 80091D64 8001008C */  lwz       r0, 0x8c(r1)
/* 08ED68 80091D68 98030019 */  stb       r0, 0x19(r3)
/* 08ED6C 80091D6C C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08ED70 80091D70 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08ED74 80091D74 ED4A07B2 */  fmuls     f10, f10, f30
/* 08ED78 80091D78 FC0A4840 */  fcmpo     cr0, f10, f9
/* 08ED7C 80091D7C 40800008 */  bge       lbl_80091D84
/* 08ED80 80091D80 48000008 */  b         lbl_80091D88
lbl_80091D84:
/* 08ED84 80091D84 FD404890 */  fmr       f10, f9
lbl_80091D88:
/* 08ED88 80091D88 FD60501E */  fctiwz    f11, f10
/* 08ED8C 80091D8C 38000002 */  li        r0, 0x2
/* 08ED90 80091D90 ED470132 */  fmuls     f10, f7, f4
/* 08ED94 80091D94 80610084 */  lwz       r3, 0x84(r1)
/* 08ED98 80091D98 ED2707F2 */  fmuls     f9, f7, f31
/* 08ED9C 80091D9C D9610088 */  stfd      f11, 0x88(r1)
/* 08EDA0 80091DA0 ED4650FA */  fmadds    f10, f6, f3, f10
/* 08EDA4 80091DA4 ED264B7A */  fmadds    f9, f6, f13, f9
/* 08EDA8 80091DA8 38A00000 */  li        r5, 0x0
/* 08EDAC 80091DAC 8081008C */  lwz       r4, 0x8c(r1)
/* 08EDB0 80091DB0 ECE70072 */  fmuls     f7, f7, f1
/* 08EDB4 80091DB4 9883001A */  stb       r4, 0x1a(r3)
/* 08EDB8 80091DB8 38800080 */  li        r4, 0x80
/* 08EDBC 80091DBC ED48517E */  fnmadds   f10, f8, f5, f10
/* 08EDC0 80091DC0 80610084 */  lwz       r3, 0x84(r1)
/* 08EDC4 80091DC4 ECC6383A */  fmadds    f6, f6, f0, f7
/* 08EDC8 80091DC8 7C0903A6 */  mtctr     r0
/* 08EDCC 80091DCC 98A30000 */  stb       r5, 0x0(r3)
/* 08EDD0 80091DD0 ED284FBE */  fnmadds   f9, f8, f30, f9
/* 08EDD4 80091DD4 38C10038 */  addi      r6, r1, 0x38
/* 08EDD8 80091DD8 80610084 */  lwz       r3, 0x84(r1)
/* 08EDDC 80091DDC ECE830BE */  fnmadds   f7, f8, f2, f6
/* 08EDE0 80091DE0 38E00000 */  li        r7, 0x0
/* 08EDE4 80091DE4 98A30001 */  stb       r5, 0x1(r3)
/* 08EDE8 80091DE8 80610084 */  lwz       r3, 0x84(r1)
/* 08EDEC 80091DEC 98A30002 */  stb       r5, 0x2(r3)
/* 08EDF0 80091DF0 80610084 */  lwz       r3, 0x84(r1)
/* 08EDF4 80091DF4 98A30003 */  stb       r5, 0x3(r3)
/* 08EDF8 80091DF8 80610084 */  lwz       r3, 0x84(r1)
/* 08EDFC 80091DFC 98A30004 */  stb       r5, 0x4(r3)
/* 08EE00 80091E00 80610084 */  lwz       r3, 0x84(r1)
/* 08EE04 80091E04 98A30005 */  stb       r5, 0x5(r3)
/* 08EE08 80091E08 80610084 */  lwz       r3, 0x84(r1)
/* 08EE0C 80091E0C 98A30006 */  stb       r5, 0x6(r3)
/* 08EE10 80091E10 80610084 */  lwz       r3, 0x84(r1)
/* 08EE14 80091E14 98A30007 */  stb       r5, 0x7(r3)
/* 08EE18 80091E18 80610084 */  lwz       r3, 0x84(r1)
/* 08EE1C 80091E1C 98A30010 */  stb       r5, 0x10(r3)
/* 08EE20 80091E20 80610084 */  lwz       r3, 0x84(r1)
/* 08EE24 80091E24 98830011 */  stb       r4, 0x11(r3)
/* 08EE28 80091E28 80610084 */  lwz       r3, 0x84(r1)
/* 08EE2C 80091E2C 98A30012 */  stb       r5, 0x12(r3)
/* 08EE30 80091E30 80610084 */  lwz       r3, 0x84(r1)
/* 08EE34 80091E34 98A30013 */  stb       r5, 0x13(r3)
/* 08EE38 80091E38 80610084 */  lwz       r3, 0x84(r1)
/* 08EE3C 80091E3C 98A30014 */  stb       r5, 0x14(r3)
/* 08EE40 80091E40 80610084 */  lwz       r3, 0x84(r1)
/* 08EE44 80091E44 98830015 */  stb       r4, 0x15(r3)
/* 08EE48 80091E48 80610084 */  lwz       r3, 0x84(r1)
/* 08EE4C 80091E4C 98A30016 */  stb       r5, 0x16(r3)
/* 08EE50 80091E50 80610084 */  lwz       r3, 0x84(r1)
/* 08EE54 80091E54 98A30017 */  stb       r5, 0x17(r3)
/* 08EE58 80091E58 D0610038 */  stfs      f3, 0x38(r1)
/* 08EE5C 80091E5C 80610034 */  lwz       r3, 0x34(r1)
/* 08EE60 80091E60 D0810048 */  stfs      f4, 0x48(r1)
/* 08EE64 80091E64 C0C28388 */  lfs       f6, D_8018C2C8@sda21(r0)
/* 08EE68 80091E68 7C691B78 */  mr        r9, r3
/* 08EE6C 80091E6C D0A10058 */  stfs      f5, 0x58(r1)
/* 08EE70 80091E70 39430020 */  addi      r10, r3, 0x20
/* 08EE74 80091E74 C08283A4 */  lfs       f4, D_8018C2E4@sda21(r0)
/* 08EE78 80091E78 D1410068 */  stfs      f10, 0x68(r1)
/* 08EE7C 80091E7C C06283B0 */  lfs       f3, D_8018C2F0@sda21(r0)
/* 08EE80 80091E80 D1A1003C */  stfs      f13, 0x3c(r1)
/* 08EE84 80091E84 D3E1004C */  stfs      f31, 0x4c(r1)
/* 08EE88 80091E88 D3C1005C */  stfs      f30, 0x5c(r1)
/* 08EE8C 80091E8C D121006C */  stfs      f9, 0x6c(r1)
/* 08EE90 80091E90 D0010040 */  stfs      f0, 0x40(r1)
/* 08EE94 80091E94 D0210050 */  stfs      f1, 0x50(r1)
/* 08EE98 80091E98 D0410060 */  stfs      f2, 0x60(r1)
/* 08EE9C 80091E9C D0E10070 */  stfs      f7, 0x70(r1)
/* 08EEA0 80091EA0 D0C10044 */  stfs      f6, 0x44(r1)
/* 08EEA4 80091EA4 D0C10054 */  stfs      f6, 0x54(r1)
/* 08EEA8 80091EA8 D0C10064 */  stfs      f6, 0x64(r1)
/* 08EEAC 80091EAC D0810074 */  stfs      f4, 0x74(r1)
lbl_80091EB0:
/* 08EEB0 80091EB0 C0260000 */  lfs       f1, 0x0(r6)
/* 08EEB4 80091EB4 C0060004 */  lfs       f0, 0x4(r6)
/* 08EEB8 80091EB8 EC230072 */  fmuls     f1, f3, f1
/* 08EEBC 80091EBC EC030032 */  fmuls     f0, f3, f0
/* 08EEC0 80091EC0 FC20081E */  fctiwz    f1, f1
/* 08EEC4 80091EC4 FC00001E */  fctiwz    f0, f0
/* 08EEC8 80091EC8 D8210088 */  stfd      f1, 0x88(r1)
/* 08EECC 80091ECC D8010090 */  stfd      f0, 0x90(r1)
/* 08EED0 80091ED0 80A1008C */  lwz       r5, 0x8c(r1)
/* 08EED4 80091ED4 81010094 */  lwz       r8, 0x94(r1)
/* 08EED8 80091ED8 54A0801E */  slwi      r0, r5, 16
/* 08EEDC 80091EDC 5503843E */  srwi      r3, r8, 16
/* 08EEE0 80091EE0 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08EEE4 80091EE4 90690000 */  stw       r3, 0x0(r9)
/* 08EEE8 80091EE8 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08EEEC 80091EEC 900A0000 */  stw       r0, 0x0(r10)
/* 08EEF0 80091EF0 C0260008 */  lfs       f1, 0x8(r6)
/* 08EEF4 80091EF4 C006000C */  lfs       f0, 0xc(r6)
/* 08EEF8 80091EF8 38C60010 */  addi      r6, r6, 0x10
/* 08EEFC 80091EFC EC230072 */  fmuls     f1, f3, f1
/* 08EF00 80091F00 EC030032 */  fmuls     f0, f3, f0
/* 08EF04 80091F04 FC20081E */  fctiwz    f1, f1
/* 08EF08 80091F08 FC00001E */  fctiwz    f0, f0
/* 08EF0C 80091F0C D8210088 */  stfd      f1, 0x88(r1)
/* 08EF10 80091F10 D8010090 */  stfd      f0, 0x90(r1)
/* 08EF14 80091F14 80A1008C */  lwz       r5, 0x8c(r1)
/* 08EF18 80091F18 81010094 */  lwz       r8, 0x94(r1)
/* 08EF1C 80091F1C 54A0801E */  slwi      r0, r5, 16
/* 08EF20 80091F20 5503843E */  srwi      r3, r8, 16
/* 08EF24 80091F24 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08EF28 80091F28 90690004 */  stw       r3, 0x4(r9)
/* 08EF2C 80091F2C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08EF30 80091F30 39290008 */  addi      r9, r9, 0x8
/* 08EF34 80091F34 900A0004 */  stw       r0, 0x4(r10)
/* 08EF38 80091F38 394A0008 */  addi      r10, r10, 0x8
/* 08EF3C 80091F3C C0260000 */  lfs       f1, 0x0(r6)
/* 08EF40 80091F40 38E70001 */  addi      r7, r7, 0x1
/* 08EF44 80091F44 C0060004 */  lfs       f0, 0x4(r6)
/* 08EF48 80091F48 EC230072 */  fmuls     f1, f3, f1
/* 08EF4C 80091F4C EC030032 */  fmuls     f0, f3, f0
/* 08EF50 80091F50 FC20081E */  fctiwz    f1, f1
/* 08EF54 80091F54 FC00001E */  fctiwz    f0, f0
/* 08EF58 80091F58 D8210088 */  stfd      f1, 0x88(r1)
/* 08EF5C 80091F5C D8010090 */  stfd      f0, 0x90(r1)
/* 08EF60 80091F60 80A1008C */  lwz       r5, 0x8c(r1)
/* 08EF64 80091F64 81010094 */  lwz       r8, 0x94(r1)
/* 08EF68 80091F68 54A0801E */  slwi      r0, r5, 16
/* 08EF6C 80091F6C 5503843E */  srwi      r3, r8, 16
/* 08EF70 80091F70 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08EF74 80091F74 90690000 */  stw       r3, 0x0(r9)
/* 08EF78 80091F78 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08EF7C 80091F7C 900A0000 */  stw       r0, 0x0(r10)
/* 08EF80 80091F80 C0260008 */  lfs       f1, 0x8(r6)
/* 08EF84 80091F84 C006000C */  lfs       f0, 0xc(r6)
/* 08EF88 80091F88 38C60010 */  addi      r6, r6, 0x10
/* 08EF8C 80091F8C EC230072 */  fmuls     f1, f3, f1
/* 08EF90 80091F90 EC030032 */  fmuls     f0, f3, f0
/* 08EF94 80091F94 FC20081E */  fctiwz    f1, f1
/* 08EF98 80091F98 FC00001E */  fctiwz    f0, f0
/* 08EF9C 80091F9C D8210088 */  stfd      f1, 0x88(r1)
/* 08EFA0 80091FA0 D8010090 */  stfd      f0, 0x90(r1)
/* 08EFA4 80091FA4 80A1008C */  lwz       r5, 0x8c(r1)
/* 08EFA8 80091FA8 81010094 */  lwz       r8, 0x94(r1)
/* 08EFAC 80091FAC 54A0801E */  slwi      r0, r5, 16
/* 08EFB0 80091FB0 5503843E */  srwi      r3, r8, 16
/* 08EFB4 80091FB4 50A3001E */  rlwimi    r3, r5, 0, 0, 15
/* 08EFB8 80091FB8 90690004 */  stw       r3, 0x4(r9)
/* 08EFBC 80091FBC 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08EFC0 80091FC0 39290008 */  addi      r9, r9, 0x8
/* 08EFC4 80091FC4 900A0004 */  stw       r0, 0x4(r10)
/* 08EFC8 80091FC8 394A0008 */  addi      r10, r10, 0x8
/* 08EFCC 80091FCC 4200FEE4 */  bdnz      lbl_80091EB0
/* 08EFD0 80091FD0 800100FC */  lwz       r0, 0xfc(r1)
/* 08EFD4 80091FD4 CBE100F0 */  lfd       f31, 0xf0(r1)
/* 08EFD8 80091FD8 CBC100E8 */  lfd       f30, 0xe8(r1)
/* 08EFDC 80091FDC 7C0803A6 */  mtlr      r0
/* 08EFE0 80091FE0 CBA100E0 */  lfd       f29, 0xe0(r1)
/* 08EFE4 80091FE4 CB8100D8 */  lfd       f28, 0xd8(r1)
/* 08EFE8 80091FE8 CB6100D0 */  lfd       f27, 0xd0(r1)
/* 08EFEC 80091FEC CB4100C8 */  lfd       f26, 0xc8(r1)
/* 08EFF0 80091FF0 CB2100C0 */  lfd       f25, 0xc0(r1)
/* 08EFF4 80091FF4 CB0100B8 */  lfd       f24, 0xb8(r1)
/* 08EFF8 80091FF8 CAE100B0 */  lfd       f23, 0xb0(r1)
/* 08EFFC 80091FFC 83E100AC */  lwz       r31, 0xac(r1)
/* 08F000 80092000 382100F8 */  addi      r1, r1, 0xf8
/* 08F004 80092004 4E800020 */  blr

glabel guLookAtHiliteF
/* 08F008 80092008 7C0802A6 */  mflr      r0
/* 08F00C 8009200C 90010004 */  stw       r0, 0x4(r1)
/* 08F010 80092010 9421FF50 */  stwu      r1, -0xb0(r1)
/* 08F014 80092014 DBE100A8 */  stfd      f31, 0xa8(r1)
/* 08F018 80092018 3881002C */  addi      r4, r1, 0x2c
/* 08F01C 8009201C DBC100A0 */  stfd      f30, 0xa0(r1)
/* 08F020 80092020 DBA10098 */  stfd      f29, 0x98(r1)
/* 08F024 80092024 DB810090 */  stfd      f28, 0x90(r1)
/* 08F028 80092028 DB610088 */  stfd      f27, 0x88(r1)
/* 08F02C 8009202C DB410080 */  stfd      f26, 0x80(r1)
/* 08F030 80092030 DB210078 */  stfd      f25, 0x78(r1)
/* 08F034 80092034 DB010070 */  stfd      f24, 0x70(r1)
/* 08F038 80092038 DAE10068 */  stfd      f23, 0x68(r1)
/* 08F03C 8009203C 93E10064 */  stw       r31, 0x64(r1)
/* 08F040 80092040 7C7F1B78 */  mr        r31, r3
/* 08F044 80092044 80A30064 */  lwz       r5, 0x64(r3)
/* 08F048 80092048 4BFA1FED */  bl        cpuGetAddressBuffer
/* 08F04C 8009204C 80BF006C */  lwz       r5, 0x6c(r31)
/* 08F050 80092050 387F0000 */  addi      r3, r31, 0x0
/* 08F054 80092054 3881003C */  addi      r4, r1, 0x3c
/* 08F058 80092058 4BFA1FDD */  bl        cpuGetAddressBuffer
/* 08F05C 8009205C 80BF0074 */  lwz       r5, 0x74(r31)
/* 08F060 80092060 387F0000 */  addi      r3, r31, 0x0
/* 08F064 80092064 38810038 */  addi      r4, r1, 0x38
/* 08F068 80092068 4BFA1FCD */  bl        cpuGetAddressBuffer
/* 08F06C 8009206C 80BF012C */  lwz       r5, 0x12c(r31)
/* 08F070 80092070 387F0000 */  addi      r3, r31, 0x0
/* 08F074 80092074 38810028 */  addi      r4, r1, 0x28
/* 08F078 80092078 4BFA1FBD */  bl        cpuGetAddressBuffer
/* 08F07C 8009207C 801F007C */  lwz       r0, 0x7c(r31)
/* 08F080 80092080 90010034 */  stw       r0, 0x34(r1)
/* 08F084 80092084 80610028 */  lwz       r3, 0x28(r1)
/* 08F088 80092088 C0C10034 */  lfs       f6, 0x34(r1)
/* 08F08C 8009208C 80030010 */  lwz       r0, 0x10(r3)
/* 08F090 80092090 90010034 */  stw       r0, 0x34(r1)
/* 08F094 80092094 C0E10034 */  lfs       f7, 0x34(r1)
/* 08F098 80092098 80030014 */  lwz       r0, 0x14(r3)
/* 08F09C 8009209C 90010034 */  stw       r0, 0x34(r1)
/* 08F0A0 800920A0 C1010034 */  lfs       f8, 0x34(r1)
/* 08F0A4 800920A4 80030018 */  lwz       r0, 0x18(r3)
/* 08F0A8 800920A8 90010034 */  stw       r0, 0x34(r1)
/* 08F0AC 800920AC C0010034 */  lfs       f0, 0x34(r1)
/* 08F0B0 800920B0 8003001C */  lwz       r0, 0x1c(r3)
/* 08F0B4 800920B4 EC003028 */  fsubs     f0, f0, f6
/* 08F0B8 800920B8 90010034 */  stw       r0, 0x34(r1)
/* 08F0BC 800920BC C0210034 */  lfs       f1, 0x34(r1)
/* 08F0C0 800920C0 80030020 */  lwz       r0, 0x20(r3)
/* 08F0C4 800920C4 EC213828 */  fsubs     f1, f1, f7
/* 08F0C8 800920C8 90010034 */  stw       r0, 0x34(r1)
/* 08F0CC 800920CC C0410034 */  lfs       f2, 0x34(r1)
/* 08F0D0 800920D0 EC610072 */  fmuls     f3, f1, f1
/* 08F0D4 800920D4 80030024 */  lwz       r0, 0x24(r3)
/* 08F0D8 800920D8 EC424028 */  fsubs     f2, f2, f8
/* 08F0DC 800920DC 90010034 */  stw       r0, 0x34(r1)
/* 08F0E0 800920E0 EC80183A */  fmadds    f4, f0, f0, f3
/* 08F0E4 800920E4 C0610034 */  lfs       f3, 0x34(r1)
/* 08F0E8 800920E8 80030028 */  lwz       r0, 0x28(r3)
/* 08F0EC 800920EC EF2220BA */  fmadds    f25, f2, f2, f4
/* 08F0F0 800920F0 90010034 */  stw       r0, 0x34(r1)
/* 08F0F4 800920F4 C1810034 */  lfs       f12, 0x34(r1)
/* 08F0F8 800920F8 8003002C */  lwz       r0, 0x2c(r3)
/* 08F0FC 800920FC 90010034 */  stw       r0, 0x34(r1)
/* 08F100 80092100 C0810034 */  lfs       f4, 0x34(r1)
/* 08F104 80092104 80030030 */  lwz       r0, 0x30(r3)
/* 08F108 80092108 90010034 */  stw       r0, 0x34(r1)
/* 08F10C 8009210C C3610034 */  lfs       f27, 0x34(r1)
/* 08F110 80092110 80030034 */  lwz       r0, 0x34(r3)
/* 08F114 80092114 90010034 */  stw       r0, 0x34(r1)
/* 08F118 80092118 C3810034 */  lfs       f28, 0x34(r1)
/* 08F11C 8009211C 80030038 */  lwz       r0, 0x38(r3)
/* 08F120 80092120 90010034 */  stw       r0, 0x34(r1)
/* 08F124 80092124 C3410034 */  lfs       f26, 0x34(r1)
/* 08F128 80092128 8003003C */  lwz       r0, 0x3c(r3)
/* 08F12C 8009212C 90010034 */  stw       r0, 0x34(r1)
/* 08F130 80092130 C1210034 */  lfs       f9, 0x34(r1)
/* 08F134 80092134 80030040 */  lwz       r0, 0x40(r3)
/* 08F138 80092138 90010034 */  stw       r0, 0x34(r1)
/* 08F13C 8009213C C1410034 */  lfs       f10, 0x34(r1)
/* 08F140 80092140 80030044 */  lwz       r0, 0x44(r3)
/* 08F144 80092144 90010034 */  stw       r0, 0x34(r1)
/* 08F148 80092148 C0A28388 */  lfs       f5, D_8018C2C8@sda21(r0)
/* 08F14C 8009214C C1610034 */  lfs       f11, 0x34(r1)
/* 08F150 80092150 FC192840 */  fcmpo     cr0, f25, f5
/* 08F154 80092154 80C30048 */  lwz       r6, 0x48(r3)
/* 08F158 80092158 80E3004C */  lwz       r7, 0x4c(r3)
/* 08F15C 8009215C 40810050 */  ble       lbl_800921AC
/* 08F160 80092160 FDA0C834 */  frsqrte   f13, f25
/* 08F164 80092164 CB028390 */  lfd       f24, D_8018C2D0@sda21(r0)
/* 08F168 80092168 CAE28398 */  lfd       f23, D_8018C2D8@sda21(r0)
/* 08F16C 8009216C FCAD0372 */  fmul      f5, f13, f13
/* 08F170 80092170 FDB80372 */  fmul      f13, f24, f13
/* 08F174 80092174 FCB9B97C */  fnmsub    f5, f25, f5, f23
/* 08F178 80092178 FDAD0172 */  fmul      f13, f13, f5
/* 08F17C 8009217C FCAD0372 */  fmul      f5, f13, f13
/* 08F180 80092180 FDB80372 */  fmul      f13, f24, f13
/* 08F184 80092184 FCB9B97C */  fnmsub    f5, f25, f5, f23
/* 08F188 80092188 FDAD0172 */  fmul      f13, f13, f5
/* 08F18C 8009218C FCAD0372 */  fmul      f5, f13, f13
/* 08F190 80092190 FDB80372 */  fmul      f13, f24, f13
/* 08F194 80092194 FCB9B97C */  fnmsub    f5, f25, f5, f23
/* 08F198 80092198 FCAD0172 */  fmul      f5, f13, f5
/* 08F19C 8009219C FCB90172 */  fmul      f5, f25, f5
/* 08F1A0 800921A0 FCA02818 */  frsp      f5, f5
/* 08F1A4 800921A4 D0A10024 */  stfs      f5, 0x24(r1)
/* 08F1A8 800921A8 C3210024 */  lfs       f25, 0x24(r1)
lbl_800921AC:
/* 08F1AC 800921AC C0A283A0 */  lfs       f5, D_8018C2E0@sda21(r0)
/* 08F1B0 800921B0 C1A28388 */  lfs       f13, D_8018C2C8@sda21(r0)
/* 08F1B4 800921B4 ECA5C824 */  fdivs     f5, f5, f25
/* 08F1B8 800921B8 EC420172 */  fmuls     f2, f2, f5
/* 08F1BC 800921BC EC000172 */  fmuls     f0, f0, f5
/* 08F1C0 800921C0 EC210172 */  fmuls     f1, f1, f5
/* 08F1C4 800921C4 EEE300B2 */  fmuls     f23, f3, f2
/* 08F1C8 800921C8 ECAC0032 */  fmuls     f5, f12, f0
/* 08F1CC 800921CC EF040072 */  fmuls     f24, f4, f1
/* 08F1D0 800921D0 EC84B838 */  fmsubs    f4, f4, f0, f23
/* 08F1D4 800921D4 ECA32878 */  fmsubs    f5, f3, f1, f5
/* 08F1D8 800921D8 EC6CC0B8 */  fmsubs    f3, f12, f2, f24
/* 08F1DC 800921DC ED840132 */  fmuls     f12, f4, f4
/* 08F1E0 800921E0 ED8360FA */  fmadds    f12, f3, f3, f12
/* 08F1E4 800921E4 EF25617A */  fmadds    f25, f5, f5, f12
/* 08F1E8 800921E8 FC196840 */  fcmpo     cr0, f25, f13
/* 08F1EC 800921EC 40810050 */  ble       lbl_8009223C
/* 08F1F0 800921F0 FDA0C834 */  frsqrte   f13, f25
/* 08F1F4 800921F4 CB028390 */  lfd       f24, D_8018C2D0@sda21(r0)
/* 08F1F8 800921F8 CAE28398 */  lfd       f23, D_8018C2D8@sda21(r0)
/* 08F1FC 800921FC FD8D0372 */  fmul      f12, f13, f13
/* 08F200 80092200 FDB80372 */  fmul      f13, f24, f13
/* 08F204 80092204 FD99BB3C */  fnmsub    f12, f25, f12, f23
/* 08F208 80092208 FDAD0332 */  fmul      f13, f13, f12
/* 08F20C 8009220C FD8D0372 */  fmul      f12, f13, f13
/* 08F210 80092210 FDB80372 */  fmul      f13, f24, f13
/* 08F214 80092214 FD99BB3C */  fnmsub    f12, f25, f12, f23
/* 08F218 80092218 FDAD0332 */  fmul      f13, f13, f12
/* 08F21C 8009221C FD8D0372 */  fmul      f12, f13, f13
/* 08F220 80092220 FDB80372 */  fmul      f13, f24, f13
/* 08F224 80092224 FD99BB3C */  fnmsub    f12, f25, f12, f23
/* 08F228 80092228 FD8D0332 */  fmul      f12, f13, f12
/* 08F22C 8009222C FD990332 */  fmul      f12, f25, f12
/* 08F230 80092230 FD806018 */  frsp      f12, f12
/* 08F234 80092234 D1810020 */  stfs      f12, 0x20(r1)
/* 08F238 80092238 C3210020 */  lfs       f25, 0x20(r1)
lbl_8009223C:
/* 08F23C 8009223C C18283A4 */  lfs       f12, D_8018C2E4@sda21(r0)
/* 08F240 80092240 C2E28388 */  lfs       f23, D_8018C2C8@sda21(r0)
/* 08F244 80092244 ED8CC824 */  fdivs     f12, f12, f25
/* 08F248 80092248 ECA50332 */  fmuls     f5, f5, f12
/* 08F24C 8009224C EC630332 */  fmuls     f3, f3, f12
/* 08F250 80092250 EC840332 */  fmuls     f4, f4, f12
/* 08F254 80092254 EDA00172 */  fmuls     f13, f0, f5
/* 08F258 80092258 ED8100F2 */  fmuls     f12, f1, f3
/* 08F25C 8009225C EF020132 */  fmuls     f24, f2, f4
/* 08F260 80092260 EFE268F8 */  fmsubs    f31, f2, f3, f13
/* 08F264 80092264 EFC06138 */  fmsubs    f30, f0, f4, f12
/* 08F268 80092268 EDA1C178 */  fmsubs    f13, f1, f5, f24
/* 08F26C 8009226C ED9F07F2 */  fmuls     f12, f31, f31
/* 08F270 80092270 ED8D637A */  fmadds    f12, f13, f13, f12
/* 08F274 80092274 ED9E67BA */  fmadds    f12, f30, f30, f12
/* 08F278 80092278 FC0CB840 */  fcmpo     cr0, f12, f23
/* 08F27C 8009227C 40810050 */  ble       lbl_800922CC
/* 08F280 80092280 FF006034 */  frsqrte   f24, f12
/* 08F284 80092284 CBA28390 */  lfd       f29, D_8018C2D0@sda21(r0)
/* 08F288 80092288 CB228398 */  lfd       f25, D_8018C2D8@sda21(r0)
/* 08F28C 8009228C FEF80632 */  fmul      f23, f24, f24
/* 08F290 80092290 FF1D0632 */  fmul      f24, f29, f24
/* 08F294 80092294 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F298 80092298 FF1805F2 */  fmul      f24, f24, f23
/* 08F29C 8009229C FEF80632 */  fmul      f23, f24, f24
/* 08F2A0 800922A0 FF1D0632 */  fmul      f24, f29, f24
/* 08F2A4 800922A4 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F2A8 800922A8 FF1805F2 */  fmul      f24, f24, f23
/* 08F2AC 800922AC FEF80632 */  fmul      f23, f24, f24
/* 08F2B0 800922B0 FF1D0632 */  fmul      f24, f29, f24
/* 08F2B4 800922B4 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F2B8 800922B8 FEF805F2 */  fmul      f23, f24, f23
/* 08F2BC 800922BC FD8C05F2 */  fmul      f12, f12, f23
/* 08F2C0 800922C0 FD806018 */  frsp      f12, f12
/* 08F2C4 800922C4 D181001C */  stfs      f12, 0x1c(r1)
/* 08F2C8 800922C8 C181001C */  lfs       f12, 0x1c(r1)
lbl_800922CC:
/* 08F2CC 800922CC C32283A4 */  lfs       f25, D_8018C2E4@sda21(r0)
/* 08F2D0 800922D0 EF1C0732 */  fmuls     f24, f28, f28
/* 08F2D4 800922D4 C2E28388 */  lfs       f23, D_8018C2C8@sda21(r0)
/* 08F2D8 800922D8 EF396024 */  fdivs     f25, f25, f12
/* 08F2DC 800922DC ED9BC6FA */  fmadds    f12, f27, f27, f24
/* 08F2E0 800922E0 EDAD0672 */  fmuls     f13, f13, f25
/* 08F2E4 800922E4 EFFF0672 */  fmuls     f31, f31, f25
/* 08F2E8 800922E8 ED9A66BA */  fmadds    f12, f26, f26, f12
/* 08F2EC 800922EC EFDE0672 */  fmuls     f30, f30, f25
/* 08F2F0 800922F0 FC0CB840 */  fcmpo     cr0, f12, f23
/* 08F2F4 800922F4 40810050 */  ble       lbl_80092344
/* 08F2F8 800922F8 FF006034 */  frsqrte   f24, f12
/* 08F2FC 800922FC CBA28390 */  lfd       f29, D_8018C2D0@sda21(r0)
/* 08F300 80092300 CB228398 */  lfd       f25, D_8018C2D8@sda21(r0)
/* 08F304 80092304 FEF80632 */  fmul      f23, f24, f24
/* 08F308 80092308 FF1D0632 */  fmul      f24, f29, f24
/* 08F30C 8009230C FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F310 80092310 FF1805F2 */  fmul      f24, f24, f23
/* 08F314 80092314 FEF80632 */  fmul      f23, f24, f24
/* 08F318 80092318 FF1D0632 */  fmul      f24, f29, f24
/* 08F31C 8009231C FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F320 80092320 FF1805F2 */  fmul      f24, f24, f23
/* 08F324 80092324 FEF80632 */  fmul      f23, f24, f24
/* 08F328 80092328 FF1D0632 */  fmul      f24, f29, f24
/* 08F32C 8009232C FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F330 80092330 FEF805F2 */  fmul      f23, f24, f23
/* 08F334 80092334 FD8C05F2 */  fmul      f12, f12, f23
/* 08F338 80092338 FD806018 */  frsp      f12, f12
/* 08F33C 8009233C D1810018 */  stfs      f12, 0x18(r1)
/* 08F340 80092340 C1810018 */  lfs       f12, 0x18(r1)
lbl_80092344:
/* 08F344 80092344 C30283A4 */  lfs       f24, D_8018C2E4@sda21(r0)
/* 08F348 80092348 C2E28388 */  lfs       f23, D_8018C2C8@sda21(r0)
/* 08F34C 8009234C ED986024 */  fdivs     f12, f24, f12
/* 08F350 80092350 EF9C0332 */  fmuls     f28, f28, f12
/* 08F354 80092354 EF7B0332 */  fmuls     f27, f27, f12
/* 08F358 80092358 EF5A0332 */  fmuls     f26, f26, f12
/* 08F35C 8009235C EF9C082A */  fadds     f28, f28, f1
/* 08F360 80092360 EFBB002A */  fadds     f29, f27, f0
/* 08F364 80092364 EF7A102A */  fadds     f27, f26, f2
/* 08F368 80092368 ED9C0732 */  fmuls     f12, f28, f28
/* 08F36C 8009236C ED9D677A */  fmadds    f12, f29, f29, f12
/* 08F370 80092370 ED9B66FA */  fmadds    f12, f27, f27, f12
/* 08F374 80092374 FC0CB840 */  fcmpo     cr0, f12, f23
/* 08F378 80092378 40810050 */  ble       lbl_800923C8
/* 08F37C 8009237C FF006034 */  frsqrte   f24, f12
/* 08F380 80092380 CB428390 */  lfd       f26, D_8018C2D0@sda21(r0)
/* 08F384 80092384 CB228398 */  lfd       f25, D_8018C2D8@sda21(r0)
/* 08F388 80092388 FEF80632 */  fmul      f23, f24, f24
/* 08F38C 8009238C FF1A0632 */  fmul      f24, f26, f24
/* 08F390 80092390 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F394 80092394 FF1805F2 */  fmul      f24, f24, f23
/* 08F398 80092398 FEF80632 */  fmul      f23, f24, f24
/* 08F39C 8009239C FF1A0632 */  fmul      f24, f26, f24
/* 08F3A0 800923A0 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F3A4 800923A4 FF1805F2 */  fmul      f24, f24, f23
/* 08F3A8 800923A8 FEF80632 */  fmul      f23, f24, f24
/* 08F3AC 800923AC FF1A0632 */  fmul      f24, f26, f24
/* 08F3B0 800923B0 FEECCDFC */  fnmsub    f23, f12, f23, f25
/* 08F3B4 800923B4 FEF805F2 */  fmul      f23, f24, f23
/* 08F3B8 800923B8 FD8C05F2 */  fmul      f12, f12, f23
/* 08F3BC 800923BC FD806018 */  frsp      f12, f12
/* 08F3C0 800923C0 D1810014 */  stfs      f12, 0x14(r1)
/* 08F3C4 800923C4 C1810014 */  lfs       f12, 0x14(r1)
lbl_800923C8:
/* 08F3C8 800923C8 CAE283B8 */  lfd       f23, D_8018C2F8@sda21(r0)
/* 08F3CC 800923CC FC0CB840 */  fcmpo     cr0, f12, f23
/* 08F3D0 800923D0 408100B0 */  ble       lbl_80092480
/* 08F3D4 800923D4 C2E283A4 */  lfs       f23, D_8018C2E4@sda21(r0)
/* 08F3D8 800923D8 6CC38000 */  xoris     r3, r6, 0x8000
/* 08F3DC 800923DC 6CE08000 */  xoris     r0, r7, 0x8000
/* 08F3E0 800923E0 9061005C */  stw       r3, 0x5c(r1)
/* 08F3E4 800923E4 EF576024 */  fdivs     f26, f23, f12
/* 08F3E8 800923E8 3C604330 */  lis       r3, 0x4330
/* 08F3EC 800923EC 9001004C */  stw       r0, 0x4c(r1)
/* 08F3F0 800923F0 CAE283C8 */  lfd       f23, D_8018C308@sda21(r0)
/* 08F3F4 800923F4 54C5103A */  slwi      r5, r6, 2
/* 08F3F8 800923F8 EF9C06B2 */  fmuls     f28, f28, f26
/* 08F3FC 800923FC 90610058 */  stw       r3, 0x58(r1)
/* 08F400 80092400 EFBD06B2 */  fmuls     f29, f29, f26
/* 08F404 80092404 C18283C0 */  lfs       f12, D_8018C300@sda21(r0)
/* 08F408 80092408 CB010058 */  lfd       f24, 0x58(r1)
/* 08F40C 8009240C EF3C0132 */  fmuls     f25, f28, f4
/* 08F410 80092410 90610048 */  stw       r3, 0x48(r1)
/* 08F414 80092414 EF7B06B2 */  fmuls     f27, f27, f26
/* 08F418 80092418 80610038 */  lwz       r3, 0x38(r1)
/* 08F41C 8009241C EF5C07F2 */  fmuls     f26, f28, f31
/* 08F420 80092420 EF3DC8FA */  fmadds    f25, f29, f3, f25
/* 08F424 80092424 CB810048 */  lfd       f28, 0x48(r1)
/* 08F428 80092428 EF5DD37A */  fmadds    f26, f29, f13, f26
/* 08F42C 8009242C 54E4103A */  slwi      r4, r7, 2
/* 08F430 80092430 EF18B828 */  fsubs     f24, f24, f23
/* 08F434 80092434 EFBBC97A */  fmadds    f29, f27, f5, f25
/* 08F438 80092438 EF9CB828 */  fsubs     f28, f28, f23
/* 08F43C 8009243C EF5BD7BA */  fmadds    f26, f27, f30, f26
/* 08F440 80092440 EF780772 */  fmuls     f27, f24, f29
/* 08F444 80092444 EF5C06B2 */  fmuls     f26, f28, f26
/* 08F448 80092448 EF6C06F2 */  fmuls     f27, f12, f27
/* 08F44C 8009244C ED8C06B2 */  fmuls     f12, f12, f26
/* 08F450 80092450 FF40D81E */  fctiwz    f26, f27
/* 08F454 80092454 FD80601E */  fctiwz    f12, f12
/* 08F458 80092458 DB410050 */  stfd      f26, 0x50(r1)
/* 08F45C 8009245C 80010054 */  lwz       r0, 0x54(r1)
/* 08F460 80092460 D9810040 */  stfd      f12, 0x40(r1)
/* 08F464 80092464 7C050214 */  add       r0, r5, r0
/* 08F468 80092468 90030000 */  stw       r0, 0x0(r3)
/* 08F46C 8009246C 80010044 */  lwz       r0, 0x44(r1)
/* 08F470 80092470 80610038 */  lwz       r3, 0x38(r1)
/* 08F474 80092474 7C040214 */  add       r0, r4, r0
/* 08F478 80092478 90030004 */  stw       r0, 0x4(r3)
/* 08F47C 8009247C 4800001C */  b         lbl_80092498
lbl_80092480:
/* 08F480 80092480 80610038 */  lwz       r3, 0x38(r1)
/* 08F484 80092484 54C4083C */  slwi      r4, r6, 1
/* 08F488 80092488 54E0083C */  slwi      r0, r7, 1
/* 08F48C 8009248C 90830000 */  stw       r4, 0x0(r3)
/* 08F490 80092490 80610038 */  lwz       r3, 0x38(r1)
/* 08F494 80092494 90030004 */  stw       r0, 0x4(r3)
lbl_80092498:
/* 08F498 80092498 EF4A02B2 */  fmuls     f26, f10, f10
/* 08F49C 8009249C C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08F4A0 800924A0 EF49D27A */  fmadds    f26, f9, f9, f26
/* 08F4A4 800924A4 EF0BD2FA */  fmadds    f24, f11, f11, f26
/* 08F4A8 800924A8 FC186040 */  fcmpo     cr0, f24, f12
/* 08F4AC 800924AC 40810050 */  ble       lbl_800924FC
/* 08F4B0 800924B0 FEE0C034 */  frsqrte   f23, f24
/* 08F4B4 800924B4 CB828390 */  lfd       f28, D_8018C2D0@sda21(r0)
/* 08F4B8 800924B8 CB628398 */  lfd       f27, D_8018C2D8@sda21(r0)
/* 08F4BC 800924BC FD9705F2 */  fmul      f12, f23, f23
/* 08F4C0 800924C0 FF5C05F2 */  fmul      f26, f28, f23
/* 08F4C4 800924C4 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08F4C8 800924C8 FEFA0332 */  fmul      f23, f26, f12
/* 08F4CC 800924CC FD9705F2 */  fmul      f12, f23, f23
/* 08F4D0 800924D0 FF5C05F2 */  fmul      f26, f28, f23
/* 08F4D4 800924D4 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08F4D8 800924D8 FEFA0332 */  fmul      f23, f26, f12
/* 08F4DC 800924DC FD9705F2 */  fmul      f12, f23, f23
/* 08F4E0 800924E0 FF5C05F2 */  fmul      f26, f28, f23
/* 08F4E4 800924E4 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08F4E8 800924E8 FD9A0332 */  fmul      f12, f26, f12
/* 08F4EC 800924EC FD980332 */  fmul      f12, f24, f12
/* 08F4F0 800924F0 FD806018 */  frsp      f12, f12
/* 08F4F4 800924F4 D1810010 */  stfs      f12, 0x10(r1)
/* 08F4F8 800924F8 C3010010 */  lfs       f24, 0x10(r1)
lbl_800924FC:
/* 08F4FC 800924FC C34283A4 */  lfs       f26, D_8018C2E4@sda21(r0)
/* 08F500 80092500 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08F504 80092504 EEFAC024 */  fdivs     f23, f26, f24
/* 08F508 80092508 ED4A05F2 */  fmuls     f10, f10, f23
/* 08F50C 8009250C ED2905F2 */  fmuls     f9, f9, f23
/* 08F510 80092510 ED6B05F2 */  fmuls     f11, f11, f23
/* 08F514 80092514 ED4A082A */  fadds     f10, f10, f1
/* 08F518 80092518 ED29002A */  fadds     f9, f9, f0
/* 08F51C 8009251C ED6B102A */  fadds     f11, f11, f2
/* 08F520 80092520 EF4A02B2 */  fmuls     f26, f10, f10
/* 08F524 80092524 EF49D27A */  fmadds    f26, f9, f9, f26
/* 08F528 80092528 EF0BD2FA */  fmadds    f24, f11, f11, f26
/* 08F52C 8009252C FC186040 */  fcmpo     cr0, f24, f12
/* 08F530 80092530 40810050 */  ble       lbl_80092580
/* 08F534 80092534 FEE0C034 */  frsqrte   f23, f24
/* 08F538 80092538 CB828390 */  lfd       f28, D_8018C2D0@sda21(r0)
/* 08F53C 8009253C CB628398 */  lfd       f27, D_8018C2D8@sda21(r0)
/* 08F540 80092540 FD9705F2 */  fmul      f12, f23, f23
/* 08F544 80092544 FF5C05F2 */  fmul      f26, f28, f23
/* 08F548 80092548 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08F54C 8009254C FEFA0332 */  fmul      f23, f26, f12
/* 08F550 80092550 FD9705F2 */  fmul      f12, f23, f23
/* 08F554 80092554 FF5C05F2 */  fmul      f26, f28, f23
/* 08F558 80092558 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08F55C 8009255C FEFA0332 */  fmul      f23, f26, f12
/* 08F560 80092560 FD9705F2 */  fmul      f12, f23, f23
/* 08F564 80092564 FF5C05F2 */  fmul      f26, f28, f23
/* 08F568 80092568 FD98DB3C */  fnmsub    f12, f24, f12, f27
/* 08F56C 8009256C FD9A0332 */  fmul      f12, f26, f12
/* 08F570 80092570 FD980332 */  fmul      f12, f24, f12
/* 08F574 80092574 FD806018 */  frsp      f12, f12
/* 08F578 80092578 D181000C */  stfs      f12, 0xc(r1)
/* 08F57C 8009257C C301000C */  lfs       f24, 0xc(r1)
lbl_80092580:
/* 08F580 80092580 C98283B8 */  lfd       f12, D_8018C2F8@sda21(r0)
/* 08F584 80092584 FC186040 */  fcmpo     cr0, f24, f12
/* 08F588 80092588 408100B0 */  ble       lbl_80092638
/* 08F58C 8009258C C18283A4 */  lfs       f12, D_8018C2E4@sda21(r0)
/* 08F590 80092590 6CC38000 */  xoris     r3, r6, 0x8000
/* 08F594 80092594 6CE08000 */  xoris     r0, r7, 0x8000
/* 08F598 80092598 90610044 */  stw       r3, 0x44(r1)
/* 08F59C 8009259C EEECC024 */  fdivs     f23, f12, f24
/* 08F5A0 800925A0 3C604330 */  lis       r3, 0x4330
/* 08F5A4 800925A4 90010054 */  stw       r0, 0x54(r1)
/* 08F5A8 800925A8 CB8283C8 */  lfd       f28, D_8018C308@sda21(r0)
/* 08F5AC 800925AC 54C5103A */  slwi      r5, r6, 2
/* 08F5B0 800925B0 ED4A05F2 */  fmuls     f10, f10, f23
/* 08F5B4 800925B4 90610040 */  stw       r3, 0x40(r1)
/* 08F5B8 800925B8 ED2905F2 */  fmuls     f9, f9, f23
/* 08F5BC 800925BC C3A283C0 */  lfs       f29, D_8018C300@sda21(r0)
/* 08F5C0 800925C0 CB610040 */  lfd       f27, 0x40(r1)
/* 08F5C4 800925C4 ED8A0132 */  fmuls     f12, f10, f4
/* 08F5C8 800925C8 90610050 */  stw       r3, 0x50(r1)
/* 08F5CC 800925CC ED6B05F2 */  fmuls     f11, f11, f23
/* 08F5D0 800925D0 80610038 */  lwz       r3, 0x38(r1)
/* 08F5D4 800925D4 ED4A07F2 */  fmuls     f10, f10, f31
/* 08F5D8 800925D8 EF4960FA */  fmadds    f26, f9, f3, f12
/* 08F5DC 800925DC C9810050 */  lfd       f12, 0x50(r1)
/* 08F5E0 800925E0 ED29537A */  fmadds    f9, f9, f13, f10
/* 08F5E4 800925E4 54E4103A */  slwi      r4, r7, 2
/* 08F5E8 800925E8 EF7BE028 */  fsubs     f27, f27, f28
/* 08F5EC 800925EC EF4BD17A */  fmadds    f26, f11, f5, f26
/* 08F5F0 800925F0 ED4CE028 */  fsubs     f10, f12, f28
/* 08F5F4 800925F4 ED2B4FBA */  fmadds    f9, f11, f30, f9
/* 08F5F8 800925F8 ED7B06B2 */  fmuls     f11, f27, f26
/* 08F5FC 800925FC ED2A0272 */  fmuls     f9, f10, f9
/* 08F600 80092600 ED5D02F2 */  fmuls     f10, f29, f11
/* 08F604 80092604 ED3D0272 */  fmuls     f9, f29, f9
/* 08F608 80092608 FD40501E */  fctiwz    f10, f10
/* 08F60C 8009260C FD20481E */  fctiwz    f9, f9
/* 08F610 80092610 D9410048 */  stfd      f10, 0x48(r1)
/* 08F614 80092614 8001004C */  lwz       r0, 0x4c(r1)
/* 08F618 80092618 D9210058 */  stfd      f9, 0x58(r1)
/* 08F61C 8009261C 7C050214 */  add       r0, r5, r0
/* 08F620 80092620 90030008 */  stw       r0, 0x8(r3)
/* 08F624 80092624 8001005C */  lwz       r0, 0x5c(r1)
/* 08F628 80092628 80610038 */  lwz       r3, 0x38(r1)
/* 08F62C 8009262C 7C040214 */  add       r0, r4, r0
/* 08F630 80092630 9003000C */  stw       r0, 0xc(r3)
/* 08F634 80092634 4800001C */  b         lbl_80092650
lbl_80092638:
/* 08F638 80092638 80610038 */  lwz       r3, 0x38(r1)
/* 08F63C 8009263C 54C4083C */  slwi      r4, r6, 1
/* 08F640 80092640 54E0083C */  slwi      r0, r7, 1
/* 08F644 80092644 90830008 */  stw       r4, 0x8(r3)
/* 08F648 80092648 80610038 */  lwz       r3, 0x38(r1)
/* 08F64C 8009264C 9003000C */  stw       r0, 0xc(r3)
lbl_80092650:
/* 08F650 80092650 C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08F654 80092654 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08F658 80092658 ED4A00F2 */  fmuls     f10, f10, f3
/* 08F65C 8009265C FC0A4840 */  fcmpo     cr0, f10, f9
/* 08F660 80092660 40800008 */  bge       lbl_80092668
/* 08F664 80092664 48000008 */  b         lbl_8009266C
lbl_80092668:
/* 08F668 80092668 FD404890 */  fmr       f10, f9
lbl_8009266C:
/* 08F66C 8009266C FD20501E */  fctiwz    f9, f10
/* 08F670 80092670 8061003C */  lwz       r3, 0x3c(r1)
/* 08F674 80092674 D9210040 */  stfd      f9, 0x40(r1)
/* 08F678 80092678 80010044 */  lwz       r0, 0x44(r1)
/* 08F67C 8009267C 98030008 */  stb       r0, 0x8(r3)
/* 08F680 80092680 C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08F684 80092684 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08F688 80092688 ED4A0132 */  fmuls     f10, f10, f4
/* 08F68C 8009268C FC0A4840 */  fcmpo     cr0, f10, f9
/* 08F690 80092690 40800008 */  bge       lbl_80092698
/* 08F694 80092694 48000008 */  b         lbl_8009269C
lbl_80092698:
/* 08F698 80092698 FD404890 */  fmr       f10, f9
lbl_8009269C:
/* 08F69C 8009269C FD20501E */  fctiwz    f9, f10
/* 08F6A0 800926A0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F6A4 800926A4 D9210040 */  stfd      f9, 0x40(r1)
/* 08F6A8 800926A8 80010044 */  lwz       r0, 0x44(r1)
/* 08F6AC 800926AC 98030009 */  stb       r0, 0x9(r3)
/* 08F6B0 800926B0 C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08F6B4 800926B4 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08F6B8 800926B8 ED4A0172 */  fmuls     f10, f10, f5
/* 08F6BC 800926BC FC0A4840 */  fcmpo     cr0, f10, f9
/* 08F6C0 800926C0 40800008 */  bge       lbl_800926C8
/* 08F6C4 800926C4 48000008 */  b         lbl_800926CC
lbl_800926C8:
/* 08F6C8 800926C8 FD404890 */  fmr       f10, f9
lbl_800926CC:
/* 08F6CC 800926CC FD20501E */  fctiwz    f9, f10
/* 08F6D0 800926D0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F6D4 800926D4 D9210040 */  stfd      f9, 0x40(r1)
/* 08F6D8 800926D8 80010044 */  lwz       r0, 0x44(r1)
/* 08F6DC 800926DC 9803000A */  stb       r0, 0xa(r3)
/* 08F6E0 800926E0 C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08F6E4 800926E4 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08F6E8 800926E8 ED4A0372 */  fmuls     f10, f10, f13
/* 08F6EC 800926EC FC0A4840 */  fcmpo     cr0, f10, f9
/* 08F6F0 800926F0 40800008 */  bge       lbl_800926F8
/* 08F6F4 800926F4 48000008 */  b         lbl_800926FC
lbl_800926F8:
/* 08F6F8 800926F8 FD404890 */  fmr       f10, f9
lbl_800926FC:
/* 08F6FC 800926FC FD20501E */  fctiwz    f9, f10
/* 08F700 80092700 8061003C */  lwz       r3, 0x3c(r1)
/* 08F704 80092704 D9210040 */  stfd      f9, 0x40(r1)
/* 08F708 80092708 80010044 */  lwz       r0, 0x44(r1)
/* 08F70C 8009270C 98030018 */  stb       r0, 0x18(r3)
/* 08F710 80092710 C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08F714 80092714 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08F718 80092718 ED4A07F2 */  fmuls     f10, f10, f31
/* 08F71C 8009271C FC0A4840 */  fcmpo     cr0, f10, f9
/* 08F720 80092720 40800008 */  bge       lbl_80092728
/* 08F724 80092724 48000008 */  b         lbl_8009272C
lbl_80092728:
/* 08F728 80092728 FD404890 */  fmr       f10, f9
lbl_8009272C:
/* 08F72C 8009272C FD20501E */  fctiwz    f9, f10
/* 08F730 80092730 8061003C */  lwz       r3, 0x3c(r1)
/* 08F734 80092734 D9210040 */  stfd      f9, 0x40(r1)
/* 08F738 80092738 80010044 */  lwz       r0, 0x44(r1)
/* 08F73C 8009273C 98030019 */  stb       r0, 0x19(r3)
/* 08F740 80092740 C14283A8 */  lfs       f10, D_8018C2E8@sda21(r0)
/* 08F744 80092744 C12283AC */  lfs       f9, D_8018C2EC@sda21(r0)
/* 08F748 80092748 ED4A07B2 */  fmuls     f10, f10, f30
/* 08F74C 8009274C FC0A4840 */  fcmpo     cr0, f10, f9
/* 08F750 80092750 40800008 */  bge       lbl_80092758
/* 08F754 80092754 48000008 */  b         lbl_8009275C
lbl_80092758:
/* 08F758 80092758 FD404890 */  fmr       f10, f9
lbl_8009275C:
/* 08F75C 8009275C FD60501E */  fctiwz    f11, f10
/* 08F760 80092760 8061003C */  lwz       r3, 0x3c(r1)
/* 08F764 80092764 ED470132 */  fmuls     f10, f7, f4
/* 08F768 80092768 38800000 */  li        r4, 0x0
/* 08F76C 8009276C ED2707F2 */  fmuls     f9, f7, f31
/* 08F770 80092770 D9610040 */  stfd      f11, 0x40(r1)
/* 08F774 80092774 ED4650FA */  fmadds    f10, f6, f3, f10
/* 08F778 80092778 ED264B7A */  fmadds    f9, f6, f13, f9
/* 08F77C 8009277C 38000080 */  li        r0, 0x80
/* 08F780 80092780 80A10044 */  lwz       r5, 0x44(r1)
/* 08F784 80092784 ED48517E */  fnmadds   f10, f8, f5, f10
/* 08F788 80092788 98A3001A */  stb       r5, 0x1a(r3)
/* 08F78C 8009278C ED284FBE */  fnmadds   f9, f8, f30, f9
/* 08F790 80092790 8061003C */  lwz       r3, 0x3c(r1)
/* 08F794 80092794 98830000 */  stb       r4, 0x0(r3)
/* 08F798 80092798 8061003C */  lwz       r3, 0x3c(r1)
/* 08F79C 8009279C 98830001 */  stb       r4, 0x1(r3)
/* 08F7A0 800927A0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7A4 800927A4 98830002 */  stb       r4, 0x2(r3)
/* 08F7A8 800927A8 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7AC 800927AC 98830003 */  stb       r4, 0x3(r3)
/* 08F7B0 800927B0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7B4 800927B4 98830004 */  stb       r4, 0x4(r3)
/* 08F7B8 800927B8 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7BC 800927BC 98830005 */  stb       r4, 0x5(r3)
/* 08F7C0 800927C0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7C4 800927C4 98830006 */  stb       r4, 0x6(r3)
/* 08F7C8 800927C8 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7CC 800927CC 98830007 */  stb       r4, 0x7(r3)
/* 08F7D0 800927D0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7D4 800927D4 98830010 */  stb       r4, 0x10(r3)
/* 08F7D8 800927D8 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7DC 800927DC 98030011 */  stb       r0, 0x11(r3)
/* 08F7E0 800927E0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7E4 800927E4 98830012 */  stb       r4, 0x12(r3)
/* 08F7E8 800927E8 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7EC 800927EC 98830013 */  stb       r4, 0x13(r3)
/* 08F7F0 800927F0 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7F4 800927F4 98830014 */  stb       r4, 0x14(r3)
/* 08F7F8 800927F8 8061003C */  lwz       r3, 0x3c(r1)
/* 08F7FC 800927FC 98030015 */  stb       r0, 0x15(r3)
/* 08F800 80092800 8061003C */  lwz       r3, 0x3c(r1)
/* 08F804 80092804 98830016 */  stb       r4, 0x16(r3)
/* 08F808 80092808 8061003C */  lwz       r3, 0x3c(r1)
/* 08F80C 8009280C 98830017 */  stb       r4, 0x17(r3)
/* 08F810 80092810 D0610034 */  stfs      f3, 0x34(r1)
/* 08F814 80092814 80010034 */  lwz       r0, 0x34(r1)
/* 08F818 80092818 8061002C */  lwz       r3, 0x2c(r1)
/* 08F81C 8009281C 90030000 */  stw       r0, 0x0(r3)
/* 08F820 80092820 D0810034 */  stfs      f4, 0x34(r1)
/* 08F824 80092824 80010034 */  lwz       r0, 0x34(r1)
/* 08F828 80092828 8061002C */  lwz       r3, 0x2c(r1)
/* 08F82C 8009282C 90030010 */  stw       r0, 0x10(r3)
/* 08F830 80092830 D0A10034 */  stfs      f5, 0x34(r1)
/* 08F834 80092834 80010034 */  lwz       r0, 0x34(r1)
/* 08F838 80092838 8061002C */  lwz       r3, 0x2c(r1)
/* 08F83C 8009283C 90030020 */  stw       r0, 0x20(r3)
/* 08F840 80092840 D1410034 */  stfs      f10, 0x34(r1)
/* 08F844 80092844 80010034 */  lwz       r0, 0x34(r1)
/* 08F848 80092848 8061002C */  lwz       r3, 0x2c(r1)
/* 08F84C 8009284C 90030030 */  stw       r0, 0x30(r3)
/* 08F850 80092850 D1A10034 */  stfs      f13, 0x34(r1)
/* 08F854 80092854 80010034 */  lwz       r0, 0x34(r1)
/* 08F858 80092858 8061002C */  lwz       r3, 0x2c(r1)
/* 08F85C 8009285C 90030004 */  stw       r0, 0x4(r3)
/* 08F860 80092860 D3E10034 */  stfs      f31, 0x34(r1)
/* 08F864 80092864 80010034 */  lwz       r0, 0x34(r1)
/* 08F868 80092868 8061002C */  lwz       r3, 0x2c(r1)
/* 08F86C 8009286C 90030014 */  stw       r0, 0x14(r3)
/* 08F870 80092870 D3C10034 */  stfs      f30, 0x34(r1)
/* 08F874 80092874 80010034 */  lwz       r0, 0x34(r1)
/* 08F878 80092878 8061002C */  lwz       r3, 0x2c(r1)
/* 08F87C 8009287C 90030024 */  stw       r0, 0x24(r3)
/* 08F880 80092880 D1210034 */  stfs      f9, 0x34(r1)
/* 08F884 80092884 80010034 */  lwz       r0, 0x34(r1)
/* 08F888 80092888 8061002C */  lwz       r3, 0x2c(r1)
/* 08F88C 8009288C 90030034 */  stw       r0, 0x34(r3)
/* 08F890 80092890 D0010034 */  stfs      f0, 0x34(r1)
/* 08F894 80092894 80010034 */  lwz       r0, 0x34(r1)
/* 08F898 80092898 8061002C */  lwz       r3, 0x2c(r1)
/* 08F89C 8009289C 90030008 */  stw       r0, 0x8(r3)
/* 08F8A0 800928A0 D0210034 */  stfs      f1, 0x34(r1)
/* 08F8A4 800928A4 80010034 */  lwz       r0, 0x34(r1)
/* 08F8A8 800928A8 8061002C */  lwz       r3, 0x2c(r1)
/* 08F8AC 800928AC 90030018 */  stw       r0, 0x18(r3)
/* 08F8B0 800928B0 D0410034 */  stfs      f2, 0x34(r1)
/* 08F8B4 800928B4 EC270072 */  fmuls     f1, f7, f1
/* 08F8B8 800928B8 80010034 */  lwz       r0, 0x34(r1)
/* 08F8BC 800928BC 8061002C */  lwz       r3, 0x2c(r1)
/* 08F8C0 800928C0 EC06083A */  fmadds    f0, f6, f0, f1
/* 08F8C4 800928C4 90030028 */  stw       r0, 0x28(r3)
/* 08F8C8 800928C8 EC0800BE */  fnmadds   f0, f8, f2, f0
/* 08F8CC 800928CC D0010034 */  stfs      f0, 0x34(r1)
/* 08F8D0 800928D0 80010034 */  lwz       r0, 0x34(r1)
/* 08F8D4 800928D4 8061002C */  lwz       r3, 0x2c(r1)
/* 08F8D8 800928D8 90030038 */  stw       r0, 0x38(r3)
/* 08F8DC 800928DC C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 08F8E0 800928E0 D0010034 */  stfs      f0, 0x34(r1)
/* 08F8E4 800928E4 80010034 */  lwz       r0, 0x34(r1)
/* 08F8E8 800928E8 8061002C */  lwz       r3, 0x2c(r1)
/* 08F8EC 800928EC 9003000C */  stw       r0, 0xc(r3)
/* 08F8F0 800928F0 D0010034 */  stfs      f0, 0x34(r1)
/* 08F8F4 800928F4 80010034 */  lwz       r0, 0x34(r1)
/* 08F8F8 800928F8 8061002C */  lwz       r3, 0x2c(r1)
/* 08F8FC 800928FC 9003001C */  stw       r0, 0x1c(r3)
/* 08F900 80092900 D0010034 */  stfs      f0, 0x34(r1)
/* 08F904 80092904 80010034 */  lwz       r0, 0x34(r1)
/* 08F908 80092908 8061002C */  lwz       r3, 0x2c(r1)
/* 08F90C 8009290C 9003002C */  stw       r0, 0x2c(r3)
/* 08F910 80092910 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08F914 80092914 D0010034 */  stfs      f0, 0x34(r1)
/* 08F918 80092918 80010034 */  lwz       r0, 0x34(r1)
/* 08F91C 8009291C 8061002C */  lwz       r3, 0x2c(r1)
/* 08F920 80092920 9003003C */  stw       r0, 0x3c(r3)
/* 08F924 80092924 800100B4 */  lwz       r0, 0xb4(r1)
/* 08F928 80092928 CBE100A8 */  lfd       f31, 0xa8(r1)
/* 08F92C 8009292C CBC100A0 */  lfd       f30, 0xa0(r1)
/* 08F930 80092930 CBA10098 */  lfd       f29, 0x98(r1)
/* 08F934 80092934 CB810090 */  lfd       f28, 0x90(r1)
/* 08F938 80092938 CB610088 */  lfd       f27, 0x88(r1)
/* 08F93C 8009293C CB410080 */  lfd       f26, 0x80(r1)
/* 08F940 80092940 CB210078 */  lfd       f25, 0x78(r1)
/* 08F944 80092944 CB010070 */  lfd       f24, 0x70(r1)
/* 08F948 80092948 CAE10068 */  lfd       f23, 0x68(r1)
/* 08F94C 8009294C 83E10064 */  lwz       r31, 0x64(r1)
/* 08F950 80092950 382100B0 */  addi      r1, r1, 0xb0
/* 08F954 80092954 7C0803A6 */  mtlr      r0
/* 08F958 80092958 4E800020 */  blr

glabel guLookAt
/* 08F95C 8009295C 7C0802A6 */  mflr      r0
/* 08F960 80092960 90010004 */  stw       r0, 0x4(r1)
/* 08F964 80092964 9421FF60 */  stwu      r1, -0xa0(r1)
/* 08F968 80092968 DBE10098 */  stfd      f31, 0x98(r1)
/* 08F96C 8009296C 3881002C */  addi      r4, r1, 0x2c
/* 08F970 80092970 DBC10090 */  stfd      f30, 0x90(r1)
/* 08F974 80092974 DBA10088 */  stfd      f29, 0x88(r1)
/* 08F978 80092978 93E10084 */  stw       r31, 0x84(r1)
/* 08F97C 8009297C 7C7F1B78 */  mr        r31, r3
/* 08F980 80092980 80A30064 */  lwz       r5, 0x64(r3)
/* 08F984 80092984 4BFA16B1 */  bl        cpuGetAddressBuffer
/* 08F988 80092988 80BF012C */  lwz       r5, 0x12c(r31)
/* 08F98C 8009298C 387F0000 */  addi      r3, r31, 0x0
/* 08F990 80092990 38810028 */  addi      r4, r1, 0x28
/* 08F994 80092994 4BFA16A1 */  bl        cpuGetAddressBuffer
/* 08F998 80092998 801F006C */  lwz       r0, 0x6c(r31)
/* 08F99C 8009299C 90010024 */  stw       r0, 0x24(r1)
/* 08F9A0 800929A0 C1210024 */  lfs       f9, 0x24(r1)
/* 08F9A4 800929A4 801F0074 */  lwz       r0, 0x74(r31)
/* 08F9A8 800929A8 90010024 */  stw       r0, 0x24(r1)
/* 08F9AC 800929AC C1410024 */  lfs       f10, 0x24(r1)
/* 08F9B0 800929B0 801F007C */  lwz       r0, 0x7c(r31)
/* 08F9B4 800929B4 90010024 */  stw       r0, 0x24(r1)
/* 08F9B8 800929B8 80610028 */  lwz       r3, 0x28(r1)
/* 08F9BC 800929BC C1610024 */  lfs       f11, 0x24(r1)
/* 08F9C0 800929C0 80030010 */  lwz       r0, 0x10(r3)
/* 08F9C4 800929C4 90010024 */  stw       r0, 0x24(r1)
/* 08F9C8 800929C8 C0010024 */  lfs       f0, 0x24(r1)
/* 08F9CC 800929CC 80030014 */  lwz       r0, 0x14(r3)
/* 08F9D0 800929D0 EC604828 */  fsubs     f3, f0, f9
/* 08F9D4 800929D4 90010024 */  stw       r0, 0x24(r1)
/* 08F9D8 800929D8 C0010024 */  lfs       f0, 0x24(r1)
/* 08F9DC 800929DC 80030018 */  lwz       r0, 0x18(r3)
/* 08F9E0 800929E0 EC805028 */  fsubs     f4, f0, f10
/* 08F9E4 800929E4 90010024 */  stw       r0, 0x24(r1)
/* 08F9E8 800929E8 C0210024 */  lfs       f1, 0x24(r1)
/* 08F9EC 800929EC EC040132 */  fmuls     f0, f4, f4
/* 08F9F0 800929F0 8003001C */  lwz       r0, 0x1c(r3)
/* 08F9F4 800929F4 ECA15828 */  fsubs     f5, f1, f11
/* 08F9F8 800929F8 90010024 */  stw       r0, 0x24(r1)
/* 08F9FC 800929FC EC2300FA */  fmadds    f1, f3, f3, f0
/* 08FA00 80092A00 C0010024 */  lfs       f0, 0x24(r1)
/* 08FA04 80092A04 80030020 */  lwz       r0, 0x20(r3)
/* 08FA08 80092A08 EDA5097A */  fmadds    f13, f5, f5, f1
/* 08FA0C 80092A0C 90010024 */  stw       r0, 0x24(r1)
/* 08FA10 80092A10 C0210024 */  lfs       f1, 0x24(r1)
/* 08FA14 80092A14 80030024 */  lwz       r0, 0x24(r3)
/* 08FA18 80092A18 90010024 */  stw       r0, 0x24(r1)
/* 08FA1C 80092A1C C0C28388 */  lfs       f6, D_8018C2C8@sda21(r0)
/* 08FA20 80092A20 C0410024 */  lfs       f2, 0x24(r1)
/* 08FA24 80092A24 FC0D3040 */  fcmpo     cr0, f13, f6
/* 08FA28 80092A28 40810050 */  ble       lbl_80092A78
/* 08FA2C 80092A2C FCE06834 */  frsqrte   f7, f13
/* 08FA30 80092A30 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08FA34 80092A34 C9028398 */  lfd       f8, D_8018C2D8@sda21(r0)
/* 08FA38 80092A38 FCC701F2 */  fmul      f6, f7, f7
/* 08FA3C 80092A3C FCEC01F2 */  fmul      f7, f12, f7
/* 08FA40 80092A40 FCCD41BC */  fnmsub    f6, f13, f6, f8
/* 08FA44 80092A44 FCE701B2 */  fmul      f7, f7, f6
/* 08FA48 80092A48 FCC701F2 */  fmul      f6, f7, f7
/* 08FA4C 80092A4C FCEC01F2 */  fmul      f7, f12, f7
/* 08FA50 80092A50 FCCD41BC */  fnmsub    f6, f13, f6, f8
/* 08FA54 80092A54 FCE701B2 */  fmul      f7, f7, f6
/* 08FA58 80092A58 FCC701F2 */  fmul      f6, f7, f7
/* 08FA5C 80092A5C FCEC01F2 */  fmul      f7, f12, f7
/* 08FA60 80092A60 FCCD41BC */  fnmsub    f6, f13, f6, f8
/* 08FA64 80092A64 FCC701B2 */  fmul      f6, f7, f6
/* 08FA68 80092A68 FCCD01B2 */  fmul      f6, f13, f6
/* 08FA6C 80092A6C FCC03018 */  frsp      f6, f6
/* 08FA70 80092A70 D0C10014 */  stfs      f6, 0x14(r1)
/* 08FA74 80092A74 C1A10014 */  lfs       f13, 0x14(r1)
lbl_80092A78:
/* 08FA78 80092A78 C0C283A0 */  lfs       f6, D_8018C2E0@sda21(r0)
/* 08FA7C 80092A7C C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08FA80 80092A80 ECC66824 */  fdivs     f6, f6, f13
/* 08FA84 80092A84 ECA501B2 */  fmuls     f5, f5, f6
/* 08FA88 80092A88 EC6301B2 */  fmuls     f3, f3, f6
/* 08FA8C 80092A8C EC8401B2 */  fmuls     f4, f4, f6
/* 08FA90 80092A90 ECE00172 */  fmuls     f7, f0, f5
/* 08FA94 80092A94 ECC100F2 */  fmuls     f6, f1, f3
/* 08FA98 80092A98 EDA20132 */  fmuls     f13, f2, f4
/* 08FA9C 80092A9C ECE238F8 */  fmsubs    f7, f2, f3, f7
/* 08FAA0 80092AA0 ED003138 */  fmsubs    f8, f0, f4, f6
/* 08FAA4 80092AA4 ECC16978 */  fmsubs    f6, f1, f5, f13
/* 08FAA8 80092AA8 EC0701F2 */  fmuls     f0, f7, f7
/* 08FAAC 80092AAC EC0601BA */  fmadds    f0, f6, f6, f0
/* 08FAB0 80092AB0 EDA8023A */  fmadds    f13, f8, f8, f0
/* 08FAB4 80092AB4 FC0D6040 */  fcmpo     cr0, f13, f12
/* 08FAB8 80092AB8 40810050 */  ble       lbl_80092B08
/* 08FABC 80092ABC FC206834 */  frsqrte   f1, f13
/* 08FAC0 80092AC0 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08FAC4 80092AC4 C8428398 */  lfd       f2, D_8018C2D8@sda21(r0)
/* 08FAC8 80092AC8 FC010072 */  fmul      f0, f1, f1
/* 08FACC 80092ACC FC2C0072 */  fmul      f1, f12, f1
/* 08FAD0 80092AD0 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08FAD4 80092AD4 FC210032 */  fmul      f1, f1, f0
/* 08FAD8 80092AD8 FC010072 */  fmul      f0, f1, f1
/* 08FADC 80092ADC FC2C0072 */  fmul      f1, f12, f1
/* 08FAE0 80092AE0 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08FAE4 80092AE4 FC210032 */  fmul      f1, f1, f0
/* 08FAE8 80092AE8 FC010072 */  fmul      f0, f1, f1
/* 08FAEC 80092AEC FC2C0072 */  fmul      f1, f12, f1
/* 08FAF0 80092AF0 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08FAF4 80092AF4 FC010032 */  fmul      f0, f1, f0
/* 08FAF8 80092AF8 FC0D0032 */  fmul      f0, f13, f0
/* 08FAFC 80092AFC FC000018 */  frsp      f0, f0
/* 08FB00 80092B00 D0010010 */  stfs      f0, 0x10(r1)
/* 08FB04 80092B04 C1A10010 */  lfs       f13, 0x10(r1)
lbl_80092B08:
/* 08FB08 80092B08 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08FB0C 80092B0C C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08FB10 80092B10 EC006824 */  fdivs     f0, f0, f13
/* 08FB14 80092B14 ED080032 */  fmuls     f8, f8, f0
/* 08FB18 80092B18 ECC60032 */  fmuls     f6, f6, f0
/* 08FB1C 80092B1C ECE70032 */  fmuls     f7, f7, f0
/* 08FB20 80092B20 EC230232 */  fmuls     f1, f3, f8
/* 08FB24 80092B24 EC0401B2 */  fmuls     f0, f4, f6
/* 08FB28 80092B28 EDA501F2 */  fmuls     f13, f5, f7
/* 08FB2C 80092B2C EC2509B8 */  fmsubs    f1, f5, f6, f1
/* 08FB30 80092B30 EC4301F8 */  fmsubs    f2, f3, f7, f0
/* 08FB34 80092B34 EC046A38 */  fmsubs    f0, f4, f8, f13
/* 08FB38 80092B38 EDA10072 */  fmuls     f13, f1, f1
/* 08FB3C 80092B3C EDA0683A */  fmadds    f13, f0, f0, f13
/* 08FB40 80092B40 EFA268BA */  fmadds    f29, f2, f2, f13
/* 08FB44 80092B44 FC1D6040 */  fcmpo     cr0, f29, f12
/* 08FB48 80092B48 40810050 */  ble       lbl_80092B98
/* 08FB4C 80092B4C FDA0E834 */  frsqrte   f13, f29
/* 08FB50 80092B50 CBE28390 */  lfd       f31, D_8018C2D0@sda21(r0)
/* 08FB54 80092B54 CBC28398 */  lfd       f30, D_8018C2D8@sda21(r0)
/* 08FB58 80092B58 FD8D0372 */  fmul      f12, f13, f13
/* 08FB5C 80092B5C FDBF0372 */  fmul      f13, f31, f13
/* 08FB60 80092B60 FD9DF33C */  fnmsub    f12, f29, f12, f30
/* 08FB64 80092B64 FDAD0332 */  fmul      f13, f13, f12
/* 08FB68 80092B68 FD8D0372 */  fmul      f12, f13, f13
/* 08FB6C 80092B6C FDBF0372 */  fmul      f13, f31, f13
/* 08FB70 80092B70 FD9DF33C */  fnmsub    f12, f29, f12, f30
/* 08FB74 80092B74 FDAD0332 */  fmul      f13, f13, f12
/* 08FB78 80092B78 FD8D0372 */  fmul      f12, f13, f13
/* 08FB7C 80092B7C FDBF0372 */  fmul      f13, f31, f13
/* 08FB80 80092B80 FD9DF33C */  fnmsub    f12, f29, f12, f30
/* 08FB84 80092B84 FD8D0332 */  fmul      f12, f13, f12
/* 08FB88 80092B88 FD9D0332 */  fmul      f12, f29, f12
/* 08FB8C 80092B8C FD806018 */  frsp      f12, f12
/* 08FB90 80092B90 D181000C */  stfs      f12, 0xc(r1)
/* 08FB94 80092B94 C3A1000C */  lfs       f29, 0xc(r1)
lbl_80092B98:
/* 08FB98 80092B98 C3C283A4 */  lfs       f30, D_8018C2E4@sda21(r0)
/* 08FB9C 80092B9C EFEA01F2 */  fmuls     f31, f10, f7
/* 08FBA0 80092BA0 8061002C */  lwz       r3, 0x2c(r1)
/* 08FBA4 80092BA4 EDAA0132 */  fmuls     f13, f10, f4
/* 08FBA8 80092BA8 EFBEE824 */  fdivs     f29, f30, f29
/* 08FBAC 80092BAC D0C10030 */  stfs      f6, 0x30(r1)
/* 08FBB0 80092BB0 38000002 */  li        r0, 0x2
/* 08FBB4 80092BB4 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08FBB8 80092BB8 D0E10040 */  stfs      f7, 0x40(r1)
/* 08FBBC 80092BBC ECC9F9BA */  fmadds    f6, f9, f6, f31
/* 08FBC0 80092BC0 D1010050 */  stfs      f8, 0x50(r1)
/* 08FBC4 80092BC4 EC210772 */  fmuls     f1, f1, f29
/* 08FBC8 80092BC8 7C0903A6 */  mtctr     r0
/* 08FBCC 80092BCC EC000772 */  fmuls     f0, f0, f29
/* 08FBD0 80092BD0 ED0B323E */  fnmadds   f8, f11, f8, f6
/* 08FBD4 80092BD4 C0C283B0 */  lfs       f6, D_8018C2F0@sda21(r0)
/* 08FBD8 80092BD8 ECEA0072 */  fmuls     f7, f10, f1
/* 08FBDC 80092BDC 7C691B78 */  mr        r9, r3
/* 08FBE0 80092BE0 EC420772 */  fmuls     f2, f2, f29
/* 08FBE4 80092BE4 D1010060 */  stfs      f8, 0x60(r1)
/* 08FBE8 80092BE8 ED09383A */  fmadds    f8, f9, f0, f7
/* 08FBEC 80092BEC ECE968FA */  fmadds    f7, f9, f3, f13
/* 08FBF0 80092BF0 39430020 */  addi      r10, r3, 0x20
/* 08FBF4 80092BF4 D0010034 */  stfs      f0, 0x34(r1)
/* 08FBF8 80092BF8 ED0B40BE */  fnmadds   f8, f11, f2, f8
/* 08FBFC 80092BFC D0210044 */  stfs      f1, 0x44(r1)
/* 08FC00 80092C00 EC0B397E */  fnmadds   f0, f11, f5, f7
/* 08FC04 80092C04 38A10030 */  addi      r5, r1, 0x30
/* 08FC08 80092C08 D0410054 */  stfs      f2, 0x54(r1)
/* 08FC0C 80092C0C 38C00000 */  li        r6, 0x0
/* 08FC10 80092C10 D1010064 */  stfs      f8, 0x64(r1)
/* 08FC14 80092C14 D0610038 */  stfs      f3, 0x38(r1)
/* 08FC18 80092C18 D0810048 */  stfs      f4, 0x48(r1)
/* 08FC1C 80092C1C D0A10058 */  stfs      f5, 0x58(r1)
/* 08FC20 80092C20 D0010068 */  stfs      f0, 0x68(r1)
/* 08FC24 80092C24 D181003C */  stfs      f12, 0x3c(r1)
/* 08FC28 80092C28 D181004C */  stfs      f12, 0x4c(r1)
/* 08FC2C 80092C2C D181005C */  stfs      f12, 0x5c(r1)
/* 08FC30 80092C30 D3C1006C */  stfs      f30, 0x6c(r1)
lbl_80092C34:
/* 08FC34 80092C34 C0250000 */  lfs       f1, 0x0(r5)
/* 08FC38 80092C38 C0050004 */  lfs       f0, 0x4(r5)
/* 08FC3C 80092C3C EC260072 */  fmuls     f1, f6, f1
/* 08FC40 80092C40 EC060032 */  fmuls     f0, f6, f0
/* 08FC44 80092C44 FC20081E */  fctiwz    f1, f1
/* 08FC48 80092C48 FC00001E */  fctiwz    f0, f0
/* 08FC4C 80092C4C D8210078 */  stfd      f1, 0x78(r1)
/* 08FC50 80092C50 D8010070 */  stfd      f0, 0x70(r1)
/* 08FC54 80092C54 80E1007C */  lwz       r7, 0x7c(r1)
/* 08FC58 80092C58 81010074 */  lwz       r8, 0x74(r1)
/* 08FC5C 80092C5C 54E0801E */  slwi      r0, r7, 16
/* 08FC60 80092C60 5503843E */  srwi      r3, r8, 16
/* 08FC64 80092C64 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 08FC68 80092C68 90690000 */  stw       r3, 0x0(r9)
/* 08FC6C 80092C6C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08FC70 80092C70 900A0000 */  stw       r0, 0x0(r10)
/* 08FC74 80092C74 C0250008 */  lfs       f1, 0x8(r5)
/* 08FC78 80092C78 C005000C */  lfs       f0, 0xc(r5)
/* 08FC7C 80092C7C 38A50010 */  addi      r5, r5, 0x10
/* 08FC80 80092C80 EC260072 */  fmuls     f1, f6, f1
/* 08FC84 80092C84 EC060032 */  fmuls     f0, f6, f0
/* 08FC88 80092C88 FC20081E */  fctiwz    f1, f1
/* 08FC8C 80092C8C FC00001E */  fctiwz    f0, f0
/* 08FC90 80092C90 D8210078 */  stfd      f1, 0x78(r1)
/* 08FC94 80092C94 D8010070 */  stfd      f0, 0x70(r1)
/* 08FC98 80092C98 80E1007C */  lwz       r7, 0x7c(r1)
/* 08FC9C 80092C9C 81010074 */  lwz       r8, 0x74(r1)
/* 08FCA0 80092CA0 54E0801E */  slwi      r0, r7, 16
/* 08FCA4 80092CA4 5503843E */  srwi      r3, r8, 16
/* 08FCA8 80092CA8 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 08FCAC 80092CAC 90690004 */  stw       r3, 0x4(r9)
/* 08FCB0 80092CB0 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08FCB4 80092CB4 39290008 */  addi      r9, r9, 0x8
/* 08FCB8 80092CB8 900A0004 */  stw       r0, 0x4(r10)
/* 08FCBC 80092CBC 394A0008 */  addi      r10, r10, 0x8
/* 08FCC0 80092CC0 C0250000 */  lfs       f1, 0x0(r5)
/* 08FCC4 80092CC4 38C60001 */  addi      r6, r6, 0x1
/* 08FCC8 80092CC8 C0050004 */  lfs       f0, 0x4(r5)
/* 08FCCC 80092CCC EC260072 */  fmuls     f1, f6, f1
/* 08FCD0 80092CD0 EC060032 */  fmuls     f0, f6, f0
/* 08FCD4 80092CD4 FC20081E */  fctiwz    f1, f1
/* 08FCD8 80092CD8 FC00001E */  fctiwz    f0, f0
/* 08FCDC 80092CDC D8210078 */  stfd      f1, 0x78(r1)
/* 08FCE0 80092CE0 D8010070 */  stfd      f0, 0x70(r1)
/* 08FCE4 80092CE4 80E1007C */  lwz       r7, 0x7c(r1)
/* 08FCE8 80092CE8 81010074 */  lwz       r8, 0x74(r1)
/* 08FCEC 80092CEC 54E0801E */  slwi      r0, r7, 16
/* 08FCF0 80092CF0 5503843E */  srwi      r3, r8, 16
/* 08FCF4 80092CF4 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 08FCF8 80092CF8 90690000 */  stw       r3, 0x0(r9)
/* 08FCFC 80092CFC 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08FD00 80092D00 900A0000 */  stw       r0, 0x0(r10)
/* 08FD04 80092D04 C0250008 */  lfs       f1, 0x8(r5)
/* 08FD08 80092D08 C005000C */  lfs       f0, 0xc(r5)
/* 08FD0C 80092D0C 38A50010 */  addi      r5, r5, 0x10
/* 08FD10 80092D10 EC260072 */  fmuls     f1, f6, f1
/* 08FD14 80092D14 EC060032 */  fmuls     f0, f6, f0
/* 08FD18 80092D18 FC20081E */  fctiwz    f1, f1
/* 08FD1C 80092D1C FC00001E */  fctiwz    f0, f0
/* 08FD20 80092D20 D8210078 */  stfd      f1, 0x78(r1)
/* 08FD24 80092D24 D8010070 */  stfd      f0, 0x70(r1)
/* 08FD28 80092D28 80E1007C */  lwz       r7, 0x7c(r1)
/* 08FD2C 80092D2C 81010074 */  lwz       r8, 0x74(r1)
/* 08FD30 80092D30 54E0801E */  slwi      r0, r7, 16
/* 08FD34 80092D34 5503843E */  srwi      r3, r8, 16
/* 08FD38 80092D38 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 08FD3C 80092D3C 90690004 */  stw       r3, 0x4(r9)
/* 08FD40 80092D40 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 08FD44 80092D44 39290008 */  addi      r9, r9, 0x8
/* 08FD48 80092D48 900A0004 */  stw       r0, 0x4(r10)
/* 08FD4C 80092D4C 394A0008 */  addi      r10, r10, 0x8
/* 08FD50 80092D50 4200FEE4 */  bdnz      lbl_80092C34
/* 08FD54 80092D54 800100A4 */  lwz       r0, 0xa4(r1)
/* 08FD58 80092D58 CBE10098 */  lfd       f31, 0x98(r1)
/* 08FD5C 80092D5C CBC10090 */  lfd       f30, 0x90(r1)
/* 08FD60 80092D60 7C0803A6 */  mtlr      r0
/* 08FD64 80092D64 CBA10088 */  lfd       f29, 0x88(r1)
/* 08FD68 80092D68 83E10084 */  lwz       r31, 0x84(r1)
/* 08FD6C 80092D6C 382100A0 */  addi      r1, r1, 0xa0
/* 08FD70 80092D70 4E800020 */  blr

glabel guLookAtF
/* 08FD74 80092D74 7C0802A6 */  mflr      r0
/* 08FD78 80092D78 90010004 */  stw       r0, 0x4(r1)
/* 08FD7C 80092D7C 9421FFA8 */  stwu      r1, -0x58(r1)
/* 08FD80 80092D80 DBE10050 */  stfd      f31, 0x50(r1)
/* 08FD84 80092D84 38810034 */  addi      r4, r1, 0x34
/* 08FD88 80092D88 DBC10048 */  stfd      f30, 0x48(r1)
/* 08FD8C 80092D8C DBA10040 */  stfd      f29, 0x40(r1)
/* 08FD90 80092D90 93E1003C */  stw       r31, 0x3c(r1)
/* 08FD94 80092D94 7C7F1B78 */  mr        r31, r3
/* 08FD98 80092D98 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 08FD9C 80092D9C D0010024 */  stfs      f0, 0x24(r1)
/* 08FDA0 80092DA0 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08FDA4 80092DA4 D001001C */  stfs      f0, 0x1c(r1)
/* 08FDA8 80092DA8 80BF0064 */  lwz       r5, 0x64(r31)
/* 08FDAC 80092DAC 4BFA1289 */  bl        cpuGetAddressBuffer
/* 08FDB0 80092DB0 80BF012C */  lwz       r5, 0x12c(r31)
/* 08FDB4 80092DB4 387F0000 */  addi      r3, r31, 0x0
/* 08FDB8 80092DB8 38810030 */  addi      r4, r1, 0x30
/* 08FDBC 80092DBC 4BFA1279 */  bl        cpuGetAddressBuffer
/* 08FDC0 80092DC0 801F006C */  lwz       r0, 0x6c(r31)
/* 08FDC4 80092DC4 9001002C */  stw       r0, 0x2c(r1)
/* 08FDC8 80092DC8 C061002C */  lfs       f3, 0x2c(r1)
/* 08FDCC 80092DCC 801F0074 */  lwz       r0, 0x74(r31)
/* 08FDD0 80092DD0 9001002C */  stw       r0, 0x2c(r1)
/* 08FDD4 80092DD4 C081002C */  lfs       f4, 0x2c(r1)
/* 08FDD8 80092DD8 801F007C */  lwz       r0, 0x7c(r31)
/* 08FDDC 80092DDC 9001002C */  stw       r0, 0x2c(r1)
/* 08FDE0 80092DE0 80610030 */  lwz       r3, 0x30(r1)
/* 08FDE4 80092DE4 C0A1002C */  lfs       f5, 0x2c(r1)
/* 08FDE8 80092DE8 80030010 */  lwz       r0, 0x10(r3)
/* 08FDEC 80092DEC 9001002C */  stw       r0, 0x2c(r1)
/* 08FDF0 80092DF0 C001002C */  lfs       f0, 0x2c(r1)
/* 08FDF4 80092DF4 80030014 */  lwz       r0, 0x14(r3)
/* 08FDF8 80092DF8 ECC01828 */  fsubs     f6, f0, f3
/* 08FDFC 80092DFC 9001002C */  stw       r0, 0x2c(r1)
/* 08FE00 80092E00 C001002C */  lfs       f0, 0x2c(r1)
/* 08FE04 80092E04 80030018 */  lwz       r0, 0x18(r3)
/* 08FE08 80092E08 ECE02028 */  fsubs     f7, f0, f4
/* 08FE0C 80092E0C 9001002C */  stw       r0, 0x2c(r1)
/* 08FE10 80092E10 C021002C */  lfs       f1, 0x2c(r1)
/* 08FE14 80092E14 EC0701F2 */  fmuls     f0, f7, f7
/* 08FE18 80092E18 8003001C */  lwz       r0, 0x1c(r3)
/* 08FE1C 80092E1C ED012828 */  fsubs     f8, f1, f5
/* 08FE20 80092E20 9001002C */  stw       r0, 0x2c(r1)
/* 08FE24 80092E24 EC2601BA */  fmadds    f1, f6, f6, f0
/* 08FE28 80092E28 C001002C */  lfs       f0, 0x2c(r1)
/* 08FE2C 80092E2C 80030020 */  lwz       r0, 0x20(r3)
/* 08FE30 80092E30 EDA80A3A */  fmadds    f13, f8, f8, f1
/* 08FE34 80092E34 9001002C */  stw       r0, 0x2c(r1)
/* 08FE38 80092E38 C021002C */  lfs       f1, 0x2c(r1)
/* 08FE3C 80092E3C 80030024 */  lwz       r0, 0x24(r3)
/* 08FE40 80092E40 9001002C */  stw       r0, 0x2c(r1)
/* 08FE44 80092E44 C1228388 */  lfs       f9, D_8018C2C8@sda21(r0)
/* 08FE48 80092E48 C041002C */  lfs       f2, 0x2c(r1)
/* 08FE4C 80092E4C FC0D4840 */  fcmpo     cr0, f13, f9
/* 08FE50 80092E50 40810050 */  ble       lbl_80092EA0
/* 08FE54 80092E54 FD406834 */  frsqrte   f10, f13
/* 08FE58 80092E58 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08FE5C 80092E5C C9628398 */  lfd       f11, D_8018C2D8@sda21(r0)
/* 08FE60 80092E60 FD2A02B2 */  fmul      f9, f10, f10
/* 08FE64 80092E64 FD4C02B2 */  fmul      f10, f12, f10
/* 08FE68 80092E68 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08FE6C 80092E6C FD4A0272 */  fmul      f10, f10, f9
/* 08FE70 80092E70 FD2A02B2 */  fmul      f9, f10, f10
/* 08FE74 80092E74 FD4C02B2 */  fmul      f10, f12, f10
/* 08FE78 80092E78 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08FE7C 80092E7C FD4A0272 */  fmul      f10, f10, f9
/* 08FE80 80092E80 FD2A02B2 */  fmul      f9, f10, f10
/* 08FE84 80092E84 FD4C02B2 */  fmul      f10, f12, f10
/* 08FE88 80092E88 FD2D5A7C */  fnmsub    f9, f13, f9, f11
/* 08FE8C 80092E8C FD2A0272 */  fmul      f9, f10, f9
/* 08FE90 80092E90 FD2D0272 */  fmul      f9, f13, f9
/* 08FE94 80092E94 FD204818 */  frsp      f9, f9
/* 08FE98 80092E98 D1210014 */  stfs      f9, 0x14(r1)
/* 08FE9C 80092E9C C1A10014 */  lfs       f13, 0x14(r1)
lbl_80092EA0:
/* 08FEA0 80092EA0 C12283A0 */  lfs       f9, D_8018C2E0@sda21(r0)
/* 08FEA4 80092EA4 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08FEA8 80092EA8 ED296824 */  fdivs     f9, f9, f13
/* 08FEAC 80092EAC ED080272 */  fmuls     f8, f8, f9
/* 08FEB0 80092EB0 ECC60272 */  fmuls     f6, f6, f9
/* 08FEB4 80092EB4 ECE70272 */  fmuls     f7, f7, f9
/* 08FEB8 80092EB8 ED400232 */  fmuls     f10, f0, f8
/* 08FEBC 80092EBC ED2101B2 */  fmuls     f9, f1, f6
/* 08FEC0 80092EC0 EDA201F2 */  fmuls     f13, f2, f7
/* 08FEC4 80092EC4 ED4251B8 */  fmsubs    f10, f2, f6, f10
/* 08FEC8 80092EC8 ED6049F8 */  fmsubs    f11, f0, f7, f9
/* 08FECC 80092ECC ED216A38 */  fmsubs    f9, f1, f8, f13
/* 08FED0 80092ED0 EC0A02B2 */  fmuls     f0, f10, f10
/* 08FED4 80092ED4 EC09027A */  fmadds    f0, f9, f9, f0
/* 08FED8 80092ED8 EDAB02FA */  fmadds    f13, f11, f11, f0
/* 08FEDC 80092EDC FC0D6040 */  fcmpo     cr0, f13, f12
/* 08FEE0 80092EE0 40810050 */  ble       lbl_80092F30
/* 08FEE4 80092EE4 FC206834 */  frsqrte   f1, f13
/* 08FEE8 80092EE8 C9828390 */  lfd       f12, D_8018C2D0@sda21(r0)
/* 08FEEC 80092EEC C8428398 */  lfd       f2, D_8018C2D8@sda21(r0)
/* 08FEF0 80092EF0 FC010072 */  fmul      f0, f1, f1
/* 08FEF4 80092EF4 FC2C0072 */  fmul      f1, f12, f1
/* 08FEF8 80092EF8 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08FEFC 80092EFC FC210032 */  fmul      f1, f1, f0
/* 08FF00 80092F00 FC010072 */  fmul      f0, f1, f1
/* 08FF04 80092F04 FC2C0072 */  fmul      f1, f12, f1
/* 08FF08 80092F08 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08FF0C 80092F0C FC210032 */  fmul      f1, f1, f0
/* 08FF10 80092F10 FC010072 */  fmul      f0, f1, f1
/* 08FF14 80092F14 FC2C0072 */  fmul      f1, f12, f1
/* 08FF18 80092F18 FC0D103C */  fnmsub    f0, f13, f0, f2
/* 08FF1C 80092F1C FC010032 */  fmul      f0, f1, f0
/* 08FF20 80092F20 FC0D0032 */  fmul      f0, f13, f0
/* 08FF24 80092F24 FC000018 */  frsp      f0, f0
/* 08FF28 80092F28 D0010010 */  stfs      f0, 0x10(r1)
/* 08FF2C 80092F2C C1A10010 */  lfs       f13, 0x10(r1)
lbl_80092F30:
/* 08FF30 80092F30 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 08FF34 80092F34 C1828388 */  lfs       f12, D_8018C2C8@sda21(r0)
/* 08FF38 80092F38 EC006824 */  fdivs     f0, f0, f13
/* 08FF3C 80092F3C ED6B0032 */  fmuls     f11, f11, f0
/* 08FF40 80092F40 ED290032 */  fmuls     f9, f9, f0
/* 08FF44 80092F44 ED4A0032 */  fmuls     f10, f10, f0
/* 08FF48 80092F48 EC2602F2 */  fmuls     f1, f6, f11
/* 08FF4C 80092F4C EC070272 */  fmuls     f0, f7, f9
/* 08FF50 80092F50 EDA802B2 */  fmuls     f13, f8, f10
/* 08FF54 80092F54 EC280A78 */  fmsubs    f1, f8, f9, f1
/* 08FF58 80092F58 EC4602B8 */  fmsubs    f2, f6, f10, f0
/* 08FF5C 80092F5C EC076AF8 */  fmsubs    f0, f7, f11, f13
/* 08FF60 80092F60 EDA10072 */  fmuls     f13, f1, f1
/* 08FF64 80092F64 EDA0683A */  fmadds    f13, f0, f0, f13
/* 08FF68 80092F68 EFA268BA */  fmadds    f29, f2, f2, f13
/* 08FF6C 80092F6C FC1D6040 */  fcmpo     cr0, f29, f12
/* 08FF70 80092F70 40810050 */  ble       lbl_80092FC0
/* 08FF74 80092F74 FDA0E834 */  frsqrte   f13, f29
/* 08FF78 80092F78 CBC28390 */  lfd       f30, D_8018C2D0@sda21(r0)
/* 08FF7C 80092F7C CBE28398 */  lfd       f31, D_8018C2D8@sda21(r0)
/* 08FF80 80092F80 FD8D0372 */  fmul      f12, f13, f13
/* 08FF84 80092F84 FDBE0372 */  fmul      f13, f30, f13
/* 08FF88 80092F88 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08FF8C 80092F8C FDAD0332 */  fmul      f13, f13, f12
/* 08FF90 80092F90 FD8D0372 */  fmul      f12, f13, f13
/* 08FF94 80092F94 FDBE0372 */  fmul      f13, f30, f13
/* 08FF98 80092F98 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08FF9C 80092F9C FDAD0332 */  fmul      f13, f13, f12
/* 08FFA0 80092FA0 FD8D0372 */  fmul      f12, f13, f13
/* 08FFA4 80092FA4 FDBE0372 */  fmul      f13, f30, f13
/* 08FFA8 80092FA8 FD9DFB3C */  fnmsub    f12, f29, f12, f31
/* 08FFAC 80092FAC FD8D0332 */  fmul      f12, f13, f12
/* 08FFB0 80092FB0 FD9D0332 */  fmul      f12, f29, f12
/* 08FFB4 80092FB4 FD806018 */  frsp      f12, f12
/* 08FFB8 80092FB8 D181000C */  stfs      f12, 0xc(r1)
/* 08FFBC 80092FBC C3A1000C */  lfs       f29, 0xc(r1)
lbl_80092FC0:
/* 08FFC0 80092FC0 C3E283A4 */  lfs       f31, D_8018C2E4@sda21(r0)
/* 08FFC4 80092FC4 EDA402B2 */  fmuls     f13, f4, f10
/* 08FFC8 80092FC8 ED8401F2 */  fmuls     f12, f4, f7
/* 08FFCC 80092FCC D121002C */  stfs      f9, 0x2c(r1)
/* 08FFD0 80092FD0 EFBFE824 */  fdivs     f29, f31, f29
/* 08FFD4 80092FD4 8001002C */  lwz       r0, 0x2c(r1)
/* 08FFD8 80092FD8 80610034 */  lwz       r3, 0x34(r1)
/* 08FFDC 80092FDC 90030000 */  stw       r0, 0x0(r3)
/* 08FFE0 80092FE0 D141002C */  stfs      f10, 0x2c(r1)
/* 08FFE4 80092FE4 ED236A7A */  fmadds    f9, f3, f9, f13
/* 08FFE8 80092FE8 8001002C */  lwz       r0, 0x2c(r1)
/* 08FFEC 80092FEC 80610034 */  lwz       r3, 0x34(r1)
/* 08FFF0 80092FF0 EC210772 */  fmuls     f1, f1, f29
/* 08FFF4 80092FF4 EC000772 */  fmuls     f0, f0, f29
/* 08FFF8 80092FF8 90030010 */  stw       r0, 0x10(r3)
/* 08FFFC 80092FFC ED454AFE */  fnmadds   f10, f5, f11, f9
/* 090000 80093000 ED240072 */  fmuls     f9, f4, f1
/* 090004 80093004 D161002C */  stfs      f11, 0x2c(r1)
/* 090008 80093008 EC8361BA */  fmadds    f4, f3, f6, f12
/* 09000C 8009300C EC420772 */  fmuls     f2, f2, f29
/* 090010 80093010 8001002C */  lwz       r0, 0x2c(r1)
/* 090014 80093014 80610034 */  lwz       r3, 0x34(r1)
/* 090018 80093018 ED23483A */  fmadds    f9, f3, f0, f9
/* 09001C 8009301C EC65223E */  fnmadds   f3, f5, f8, f4
/* 090020 80093020 90030020 */  stw       r0, 0x20(r3)
/* 090024 80093024 EC8548BE */  fnmadds   f4, f5, f2, f9
/* 090028 80093028 D141002C */  stfs      f10, 0x2c(r1)
/* 09002C 8009302C 8001002C */  lwz       r0, 0x2c(r1)
/* 090030 80093030 80610034 */  lwz       r3, 0x34(r1)
/* 090034 80093034 90030030 */  stw       r0, 0x30(r3)
/* 090038 80093038 D001002C */  stfs      f0, 0x2c(r1)
/* 09003C 8009303C 8001002C */  lwz       r0, 0x2c(r1)
/* 090040 80093040 80610034 */  lwz       r3, 0x34(r1)
/* 090044 80093044 90030004 */  stw       r0, 0x4(r3)
/* 090048 80093048 D021002C */  stfs      f1, 0x2c(r1)
/* 09004C 8009304C 8001002C */  lwz       r0, 0x2c(r1)
/* 090050 80093050 80610034 */  lwz       r3, 0x34(r1)
/* 090054 80093054 90030014 */  stw       r0, 0x14(r3)
/* 090058 80093058 D041002C */  stfs      f2, 0x2c(r1)
/* 09005C 8009305C 8001002C */  lwz       r0, 0x2c(r1)
/* 090060 80093060 80610034 */  lwz       r3, 0x34(r1)
/* 090064 80093064 90030024 */  stw       r0, 0x24(r3)
/* 090068 80093068 D081002C */  stfs      f4, 0x2c(r1)
/* 09006C 8009306C 8001002C */  lwz       r0, 0x2c(r1)
/* 090070 80093070 80610034 */  lwz       r3, 0x34(r1)
/* 090074 80093074 90030034 */  stw       r0, 0x34(r3)
/* 090078 80093078 D0C1002C */  stfs      f6, 0x2c(r1)
/* 09007C 8009307C 8001002C */  lwz       r0, 0x2c(r1)
/* 090080 80093080 80610034 */  lwz       r3, 0x34(r1)
/* 090084 80093084 90030008 */  stw       r0, 0x8(r3)
/* 090088 80093088 D0E1002C */  stfs      f7, 0x2c(r1)
/* 09008C 8009308C 8001002C */  lwz       r0, 0x2c(r1)
/* 090090 80093090 80610034 */  lwz       r3, 0x34(r1)
/* 090094 80093094 90030018 */  stw       r0, 0x18(r3)
/* 090098 80093098 D101002C */  stfs      f8, 0x2c(r1)
/* 09009C 8009309C 8001002C */  lwz       r0, 0x2c(r1)
/* 0900A0 800930A0 80610034 */  lwz       r3, 0x34(r1)
/* 0900A4 800930A4 90030028 */  stw       r0, 0x28(r3)
/* 0900A8 800930A8 D061002C */  stfs      f3, 0x2c(r1)
/* 0900AC 800930AC 8001002C */  lwz       r0, 0x2c(r1)
/* 0900B0 800930B0 80610034 */  lwz       r3, 0x34(r1)
/* 0900B4 800930B4 90030038 */  stw       r0, 0x38(r3)
/* 0900B8 800930B8 80010024 */  lwz       r0, 0x24(r1)
/* 0900BC 800930BC 80610034 */  lwz       r3, 0x34(r1)
/* 0900C0 800930C0 9003000C */  stw       r0, 0xc(r3)
/* 0900C4 800930C4 80610034 */  lwz       r3, 0x34(r1)
/* 0900C8 800930C8 9003001C */  stw       r0, 0x1c(r3)
/* 0900CC 800930CC 80610034 */  lwz       r3, 0x34(r1)
/* 0900D0 800930D0 9003002C */  stw       r0, 0x2c(r3)
/* 0900D4 800930D4 8001001C */  lwz       r0, 0x1c(r1)
/* 0900D8 800930D8 80610034 */  lwz       r3, 0x34(r1)
/* 0900DC 800930DC 9003003C */  stw       r0, 0x3c(r3)
/* 0900E0 800930E0 8001005C */  lwz       r0, 0x5c(r1)
/* 0900E4 800930E4 CBE10050 */  lfd       f31, 0x50(r1)
/* 0900E8 800930E8 CBC10048 */  lfd       f30, 0x48(r1)
/* 0900EC 800930EC CBA10040 */  lfd       f29, 0x40(r1)
/* 0900F0 800930F0 83E1003C */  lwz       r31, 0x3c(r1)
/* 0900F4 800930F4 38210058 */  addi      r1, r1, 0x58
/* 0900F8 800930F8 7C0803A6 */  mtlr      r0
/* 0900FC 800930FC 4E800020 */  blr

glabel guRotate
/* 090100 80093100 7C0802A6 */  mflr      r0
/* 090104 80093104 90010004 */  stw       r0, 0x4(r1)
/* 090108 80093108 9421FF50 */  stwu      r1, -0xb0(r1)
/* 09010C 8009310C DBE100A8 */  stfd      f31, 0xa8(r1)
/* 090110 80093110 38810064 */  addi      r4, r1, 0x64
/* 090114 80093114 DBC100A0 */  stfd      f30, 0xa0(r1)
/* 090118 80093118 DBA10098 */  stfd      f29, 0x98(r1)
/* 09011C 8009311C DB810090 */  stfd      f28, 0x90(r1)
/* 090120 80093120 DB610088 */  stfd      f27, 0x88(r1)
/* 090124 80093124 DB410080 */  stfd      f26, 0x80(r1)
/* 090128 80093128 93E1007C */  stw       r31, 0x7c(r1)
/* 09012C 8009312C 7C7F1B78 */  mr        r31, r3
/* 090130 80093130 80A30064 */  lwz       r5, 0x64(r3)
/* 090134 80093134 4BFA0F01 */  bl        cpuGetAddressBuffer
/* 090138 80093138 80BF012C */  lwz       r5, 0x12c(r31)
/* 09013C 8009313C 387F0000 */  addi      r3, r31, 0x0
/* 090140 80093140 38810060 */  addi      r4, r1, 0x60
/* 090144 80093144 4BFA0EF1 */  bl        cpuGetAddressBuffer
/* 090148 80093148 801F006C */  lwz       r0, 0x6c(r31)
/* 09014C 8009314C 9001005C */  stw       r0, 0x5c(r1)
/* 090150 80093150 C3C1005C */  lfs       f30, 0x5c(r1)
/* 090154 80093154 801F0074 */  lwz       r0, 0x74(r31)
/* 090158 80093158 9001005C */  stw       r0, 0x5c(r1)
/* 09015C 8009315C C3A1005C */  lfs       f29, 0x5c(r1)
/* 090160 80093160 801F007C */  lwz       r0, 0x7c(r31)
/* 090164 80093164 9001005C */  stw       r0, 0x5c(r1)
/* 090168 80093168 C381005C */  lfs       f28, 0x5c(r1)
/* 09016C 8009316C 80610060 */  lwz       r3, 0x60(r1)
/* 090170 80093170 EC1C0732 */  fmuls     f0, f28, f28
/* 090174 80093174 80030010 */  lwz       r0, 0x10(r3)
/* 090178 80093178 9001005C */  stw       r0, 0x5c(r1)
/* 09017C 8009317C EC3D077A */  fmadds    f1, f29, f29, f0
/* 090180 80093180 C361005C */  lfs       f27, 0x5c(r1)
/* 090184 80093184 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090188 80093188 EC9B0EFA */  fmadds    f4, f27, f27, f1
/* 09018C 8009318C FC040040 */  fcmpo     cr0, f4, f0
/* 090190 80093190 40810050 */  ble       lbl_800931E0
/* 090194 80093194 FC202034 */  frsqrte   f1, f4
/* 090198 80093198 C8628390 */  lfd       f3, D_8018C2D0@sda21(r0)
/* 09019C 8009319C C8428398 */  lfd       f2, D_8018C2D8@sda21(r0)
/* 0901A0 800931A0 FC010072 */  fmul      f0, f1, f1
/* 0901A4 800931A4 FC230072 */  fmul      f1, f3, f1
/* 0901A8 800931A8 FC04103C */  fnmsub    f0, f4, f0, f2
/* 0901AC 800931AC FC210032 */  fmul      f1, f1, f0
/* 0901B0 800931B0 FC010072 */  fmul      f0, f1, f1
/* 0901B4 800931B4 FC230072 */  fmul      f1, f3, f1
/* 0901B8 800931B8 FC04103C */  fnmsub    f0, f4, f0, f2
/* 0901BC 800931BC FC210032 */  fmul      f1, f1, f0
/* 0901C0 800931C0 FC010072 */  fmul      f0, f1, f1
/* 0901C4 800931C4 FC230072 */  fmul      f1, f3, f1
/* 0901C8 800931C8 FC04103C */  fnmsub    f0, f4, f0, f2
/* 0901CC 800931CC FC010032 */  fmul      f0, f1, f0
/* 0901D0 800931D0 FC040032 */  fmul      f0, f4, f0
/* 0901D4 800931D4 FC000018 */  frsp      f0, f0
/* 0901D8 800931D8 D001000C */  stfs      f0, 0xc(r1)
/* 0901DC 800931DC C081000C */  lfs       f4, 0xc(r1)
lbl_800931E0:
/* 0901E0 800931E0 C02283A4 */  lfs       f1, D_8018C2E4@sda21(r0)
/* 0901E4 800931E4 C00D863C */  lfs       f0, D_8018B5BC@sda21(r0)
/* 0901E8 800931E8 EC412024 */  fdivs     f2, f1, f4
/* 0901EC 800931EC EFDE0032 */  fmuls     f30, f30, f0
/* 0901F0 800931F0 EFBD00B2 */  fmuls     f29, f29, f2
/* 0901F4 800931F4 EF9C00B2 */  fmuls     f28, f28, f2
/* 0901F8 800931F8 FC20F090 */  fmr       f1, f30
/* 0901FC 800931FC EF7B00B2 */  fmuls     f27, f27, f2
/* 090200 80093200 4803DC49 */  bl        sinf
/* 090204 80093204 FFE00890 */  fmr       f31, f1
/* 090208 80093208 FC20F090 */  fmr       f1, f30
/* 09020C 8009320C 4803DAA9 */  bl        cosf
/* 090210 80093210 C16283A4 */  lfs       f11, D_8018C2E4@sda21(r0)
/* 090214 80093214 ECDD0772 */  fmuls     f6, f29, f29
/* 090218 80093218 EDBC0732 */  fmuls     f13, f28, f28
/* 09021C 8009321C 38000002 */  li        r0, 0x2
/* 090220 80093220 D1610018 */  stfs      f11, 0x18(r1)
/* 090224 80093224 C1228388 */  lfs       f9, D_8018C2C8@sda21(r0)
/* 090228 80093228 EC6B3028 */  fsubs     f3, f11, f6
/* 09022C 8009322C D121001C */  stfs      f9, 0x1c(r1)
/* 090230 80093230 ED9B06F2 */  fmuls     f12, f27, f27
/* 090234 80093234 EF4B0828 */  fsubs     f26, f11, f1
/* 090238 80093238 7C0903A6 */  mtctr     r0
/* 09023C 8009323C D1210020 */  stfs      f9, 0x20(r1)
/* 090240 80093240 ECBC06F2 */  fmuls     f5, f28, f27
/* 090244 80093244 ED0130FA */  fmadds    f8, f1, f3, f6
/* 090248 80093248 D1210024 */  stfs      f9, 0x24(r1)
/* 09024C 8009324C EC9B0772 */  fmuls     f4, f27, f29
/* 090250 80093250 EFDA0172 */  fmuls     f30, f26, f5
/* 090254 80093254 D1210028 */  stfs      f9, 0x28(r1)
/* 090258 80093258 ECBD07F2 */  fmuls     f5, f29, f31
/* 09025C 8009325C 38A10018 */  addi      r5, r1, 0x18
/* 090260 80093260 D161002C */  stfs      f11, 0x2c(r1)
/* 090264 80093264 ED5D0732 */  fmuls     f10, f29, f28
/* 090268 80093268 38C00000 */  li        r6, 0x0
/* 09026C 8009326C D1210030 */  stfs      f9, 0x30(r1)
/* 090270 80093270 ECFE2828 */  fsubs     f7, f30, f5
/* 090274 80093274 EC4B6828 */  fsubs     f2, f11, f13
/* 090278 80093278 D1210034 */  stfs      f9, 0x34(r1)
/* 09027C 8009327C ECDE282A */  fadds     f6, f30, f5
/* 090280 80093280 EFBA0132 */  fmuls     f29, f26, f4
/* 090284 80093284 D1210038 */  stfs      f9, 0x38(r1)
/* 090288 80093288 EC7C07F2 */  fmuls     f3, f28, f31
/* 09028C 8009328C D121003C */  stfs      f9, 0x3c(r1)
/* 090290 80093290 ECA168BA */  fmadds    f5, f1, f2, f13
/* 090294 80093294 EC0B6028 */  fsubs     f0, f11, f12
/* 090298 80093298 D1610040 */  stfs      f11, 0x40(r1)
/* 09029C 8009329C EC9D182A */  fadds     f4, f29, f3
/* 0902A0 800932A0 D1210044 */  stfs      f9, 0x44(r1)
/* 0902A4 800932A4 EDBA02B2 */  fmuls     f13, f26, f10
/* 0902A8 800932A8 EC7D1828 */  fsubs     f3, f29, f3
/* 0902AC 800932AC D1210048 */  stfs      f9, 0x48(r1)
/* 0902B0 800932B0 ED5B07F2 */  fmuls     f10, f27, f31
/* 0902B4 800932B4 D121004C */  stfs      f9, 0x4c(r1)
/* 0902B8 800932B8 EC41603A */  fmadds    f2, f1, f0, f12
/* 0902BC 800932BC D1210050 */  stfs      f9, 0x50(r1)
/* 0902C0 800932C0 EC2D5028 */  fsubs     f1, f13, f10
/* 0902C4 800932C4 EC0D502A */  fadds     f0, f13, f10
/* 0902C8 800932C8 D1610054 */  stfs      f11, 0x54(r1)
/* 0902CC 800932CC D1010018 */  stfs      f8, 0x18(r1)
/* 0902D0 800932D0 D0E1003C */  stfs      f7, 0x3c(r1)
/* 0902D4 800932D4 D0C10030 */  stfs      f6, 0x30(r1)
/* 0902D8 800932D8 D0A1002C */  stfs      f5, 0x2c(r1)
/* 0902DC 800932DC D0810038 */  stfs      f4, 0x38(r1)
/* 0902E0 800932E0 D0610020 */  stfs      f3, 0x20(r1)
/* 0902E4 800932E4 D0410040 */  stfs      f2, 0x40(r1)
/* 0902E8 800932E8 D0210028 */  stfs      f1, 0x28(r1)
/* 0902EC 800932EC D001001C */  stfs      f0, 0x1c(r1)
/* 0902F0 800932F0 80610064 */  lwz       r3, 0x64(r1)
/* 0902F4 800932F4 C04283B0 */  lfs       f2, D_8018C2F0@sda21(r0)
/* 0902F8 800932F8 39230000 */  addi      r9, r3, 0x0
/* 0902FC 800932FC 39430020 */  addi      r10, r3, 0x20
lbl_80093300:
/* 090300 80093300 C0250000 */  lfs       f1, 0x0(r5)
/* 090304 80093304 C0050004 */  lfs       f0, 0x4(r5)
/* 090308 80093308 EC220072 */  fmuls     f1, f2, f1
/* 09030C 8009330C EC020032 */  fmuls     f0, f2, f0
/* 090310 80093310 FC20081E */  fctiwz    f1, f1
/* 090314 80093314 FC00001E */  fctiwz    f0, f0
/* 090318 80093318 D8210070 */  stfd      f1, 0x70(r1)
/* 09031C 8009331C D8010068 */  stfd      f0, 0x68(r1)
/* 090320 80093320 80E10074 */  lwz       r7, 0x74(r1)
/* 090324 80093324 8101006C */  lwz       r8, 0x6c(r1)
/* 090328 80093328 54E0801E */  slwi      r0, r7, 16
/* 09032C 8009332C 5503843E */  srwi      r3, r8, 16
/* 090330 80093330 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090334 80093334 90690000 */  stw       r3, 0x0(r9)
/* 090338 80093338 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 09033C 8009333C 900A0000 */  stw       r0, 0x0(r10)
/* 090340 80093340 C0250008 */  lfs       f1, 0x8(r5)
/* 090344 80093344 C005000C */  lfs       f0, 0xc(r5)
/* 090348 80093348 38A50010 */  addi      r5, r5, 0x10
/* 09034C 8009334C EC220072 */  fmuls     f1, f2, f1
/* 090350 80093350 EC020032 */  fmuls     f0, f2, f0
/* 090354 80093354 FC20081E */  fctiwz    f1, f1
/* 090358 80093358 FC00001E */  fctiwz    f0, f0
/* 09035C 8009335C D8210070 */  stfd      f1, 0x70(r1)
/* 090360 80093360 D8010068 */  stfd      f0, 0x68(r1)
/* 090364 80093364 80E10074 */  lwz       r7, 0x74(r1)
/* 090368 80093368 8101006C */  lwz       r8, 0x6c(r1)
/* 09036C 8009336C 54E0801E */  slwi      r0, r7, 16
/* 090370 80093370 5503843E */  srwi      r3, r8, 16
/* 090374 80093374 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090378 80093378 90690004 */  stw       r3, 0x4(r9)
/* 09037C 8009337C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090380 80093380 39290008 */  addi      r9, r9, 0x8
/* 090384 80093384 900A0004 */  stw       r0, 0x4(r10)
/* 090388 80093388 394A0008 */  addi      r10, r10, 0x8
/* 09038C 8009338C C0250000 */  lfs       f1, 0x0(r5)
/* 090390 80093390 38C60001 */  addi      r6, r6, 0x1
/* 090394 80093394 C0050004 */  lfs       f0, 0x4(r5)
/* 090398 80093398 EC220072 */  fmuls     f1, f2, f1
/* 09039C 8009339C EC020032 */  fmuls     f0, f2, f0
/* 0903A0 800933A0 FC20081E */  fctiwz    f1, f1
/* 0903A4 800933A4 FC00001E */  fctiwz    f0, f0
/* 0903A8 800933A8 D8210070 */  stfd      f1, 0x70(r1)
/* 0903AC 800933AC D8010068 */  stfd      f0, 0x68(r1)
/* 0903B0 800933B0 80E10074 */  lwz       r7, 0x74(r1)
/* 0903B4 800933B4 8101006C */  lwz       r8, 0x6c(r1)
/* 0903B8 800933B8 54E0801E */  slwi      r0, r7, 16
/* 0903BC 800933BC 5503843E */  srwi      r3, r8, 16
/* 0903C0 800933C0 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 0903C4 800933C4 90690000 */  stw       r3, 0x0(r9)
/* 0903C8 800933C8 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 0903CC 800933CC 900A0000 */  stw       r0, 0x0(r10)
/* 0903D0 800933D0 C0250008 */  lfs       f1, 0x8(r5)
/* 0903D4 800933D4 C005000C */  lfs       f0, 0xc(r5)
/* 0903D8 800933D8 38A50010 */  addi      r5, r5, 0x10
/* 0903DC 800933DC EC220072 */  fmuls     f1, f2, f1
/* 0903E0 800933E0 EC020032 */  fmuls     f0, f2, f0
/* 0903E4 800933E4 FC20081E */  fctiwz    f1, f1
/* 0903E8 800933E8 FC00001E */  fctiwz    f0, f0
/* 0903EC 800933EC D8210070 */  stfd      f1, 0x70(r1)
/* 0903F0 800933F0 D8010068 */  stfd      f0, 0x68(r1)
/* 0903F4 800933F4 80E10074 */  lwz       r7, 0x74(r1)
/* 0903F8 800933F8 8101006C */  lwz       r8, 0x6c(r1)
/* 0903FC 800933FC 54E0801E */  slwi      r0, r7, 16
/* 090400 80093400 5503843E */  srwi      r3, r8, 16
/* 090404 80093404 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090408 80093408 90690004 */  stw       r3, 0x4(r9)
/* 09040C 8009340C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090410 80093410 39290008 */  addi      r9, r9, 0x8
/* 090414 80093414 900A0004 */  stw       r0, 0x4(r10)
/* 090418 80093418 394A0008 */  addi      r10, r10, 0x8
/* 09041C 8009341C 4200FEE4 */  bdnz      lbl_80093300
/* 090420 80093420 800100B4 */  lwz       r0, 0xb4(r1)
/* 090424 80093424 CBE100A8 */  lfd       f31, 0xa8(r1)
/* 090428 80093428 CBC100A0 */  lfd       f30, 0xa0(r1)
/* 09042C 8009342C 7C0803A6 */  mtlr      r0
/* 090430 80093430 CBA10098 */  lfd       f29, 0x98(r1)
/* 090434 80093434 CB810090 */  lfd       f28, 0x90(r1)
/* 090438 80093438 CB610088 */  lfd       f27, 0x88(r1)
/* 09043C 8009343C CB410080 */  lfd       f26, 0x80(r1)
/* 090440 80093440 83E1007C */  lwz       r31, 0x7c(r1)
/* 090444 80093444 382100B0 */  addi      r1, r1, 0xb0
/* 090448 80093448 4E800020 */  blr

glabel guRotateF
/* 09044C 8009344C 7C0802A6 */  mflr      r0
/* 090450 80093450 90010004 */  stw       r0, 0x4(r1)
/* 090454 80093454 9421FF88 */  stwu      r1, -0x78(r1)
/* 090458 80093458 DBE10070 */  stfd      f31, 0x70(r1)
/* 09045C 8009345C 38810028 */  addi      r4, r1, 0x28
/* 090460 80093460 DBC10068 */  stfd      f30, 0x68(r1)
/* 090464 80093464 DBA10060 */  stfd      f29, 0x60(r1)
/* 090468 80093468 DB810058 */  stfd      f28, 0x58(r1)
/* 09046C 8009346C DB610050 */  stfd      f27, 0x50(r1)
/* 090470 80093470 DB410048 */  stfd      f26, 0x48(r1)
/* 090474 80093474 DB210040 */  stfd      f25, 0x40(r1)
/* 090478 80093478 DB010038 */  stfd      f24, 0x38(r1)
/* 09047C 8009347C 93E10034 */  stw       r31, 0x34(r1)
/* 090480 80093480 7C7F1B78 */  mr        r31, r3
/* 090484 80093484 80A3012C */  lwz       r5, 0x12c(r3)
/* 090488 80093488 4BFA0BAD */  bl        cpuGetAddressBuffer
/* 09048C 8009348C 801F006C */  lwz       r0, 0x6c(r31)
/* 090490 80093490 90010024 */  stw       r0, 0x24(r1)
/* 090494 80093494 C3E10024 */  lfs       f31, 0x24(r1)
/* 090498 80093498 801F0074 */  lwz       r0, 0x74(r31)
/* 09049C 8009349C 90010024 */  stw       r0, 0x24(r1)
/* 0904A0 800934A0 C3C10024 */  lfs       f30, 0x24(r1)
/* 0904A4 800934A4 801F007C */  lwz       r0, 0x7c(r31)
/* 0904A8 800934A8 90010024 */  stw       r0, 0x24(r1)
/* 0904AC 800934AC C3A10024 */  lfs       f29, 0x24(r1)
/* 0904B0 800934B0 80610028 */  lwz       r3, 0x28(r1)
/* 0904B4 800934B4 EC1D0772 */  fmuls     f0, f29, f29
/* 0904B8 800934B8 80030010 */  lwz       r0, 0x10(r3)
/* 0904BC 800934BC 90010024 */  stw       r0, 0x24(r1)
/* 0904C0 800934C0 EC3E07BA */  fmadds    f1, f30, f30, f0
/* 0904C4 800934C4 C3810024 */  lfs       f28, 0x24(r1)
/* 0904C8 800934C8 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 0904CC 800934CC EC9C0F3A */  fmadds    f4, f28, f28, f1
/* 0904D0 800934D0 FC040040 */  fcmpo     cr0, f4, f0
/* 0904D4 800934D4 40810050 */  ble       lbl_80093524
/* 0904D8 800934D8 FC202034 */  frsqrte   f1, f4
/* 0904DC 800934DC C8628390 */  lfd       f3, D_8018C2D0@sda21(r0)
/* 0904E0 800934E0 C8428398 */  lfd       f2, D_8018C2D8@sda21(r0)
/* 0904E4 800934E4 FC010072 */  fmul      f0, f1, f1
/* 0904E8 800934E8 FC230072 */  fmul      f1, f3, f1
/* 0904EC 800934EC FC04103C */  fnmsub    f0, f4, f0, f2
/* 0904F0 800934F0 FC210032 */  fmul      f1, f1, f0
/* 0904F4 800934F4 FC010072 */  fmul      f0, f1, f1
/* 0904F8 800934F8 FC230072 */  fmul      f1, f3, f1
/* 0904FC 800934FC FC04103C */  fnmsub    f0, f4, f0, f2
/* 090500 80093500 FC210032 */  fmul      f1, f1, f0
/* 090504 80093504 FC010072 */  fmul      f0, f1, f1
/* 090508 80093508 FC230072 */  fmul      f1, f3, f1
/* 09050C 8009350C FC04103C */  fnmsub    f0, f4, f0, f2
/* 090510 80093510 FC010032 */  fmul      f0, f1, f0
/* 090514 80093514 FC040032 */  fmul      f0, f4, f0
/* 090518 80093518 FC000018 */  frsp      f0, f0
/* 09051C 8009351C D001000C */  stfs      f0, 0xc(r1)
/* 090520 80093520 C081000C */  lfs       f4, 0xc(r1)
lbl_80093524:
/* 090524 80093524 C02283A4 */  lfs       f1, D_8018C2E4@sda21(r0)
/* 090528 80093528 C00D8638 */  lfs       f0, D_8018B5B8@sda21(r0)
/* 09052C 8009352C EC412024 */  fdivs     f2, f1, f4
/* 090530 80093530 EFFF0032 */  fmuls     f31, f31, f0
/* 090534 80093534 EFDE00B2 */  fmuls     f30, f30, f2
/* 090538 80093538 EFBD00B2 */  fmuls     f29, f29, f2
/* 09053C 8009353C FC20F890 */  fmr       f1, f31
/* 090540 80093540 EF9C00B2 */  fmuls     f28, f28, f2
/* 090544 80093544 4803D905 */  bl        sinf
/* 090548 80093548 FF000890 */  fmr       f24, f1
/* 09054C 8009354C FC20F890 */  fmr       f1, f31
/* 090550 80093550 4803D765 */  bl        cosf
/* 090554 80093554 FFE00890 */  fmr       f31, f1
/* 090558 80093558 C06283A4 */  lfs       f3, D_8018C2E4@sda21(r0)
/* 09055C 8009355C C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090560 80093560 EC5E0772 */  fmuls     f2, f30, f29
/* 090564 80093564 EC3D0732 */  fmuls     f1, f29, f28
/* 090568 80093568 EC83F828 */  fsubs     f4, f3, f31
/* 09056C 8009356C D001001C */  stfs      f0, 0x1c(r1)
/* 090570 80093570 EC1C07B2 */  fmuls     f0, f28, f30
/* 090574 80093574 7FE3FB78 */  mr        r3, r31
/* 090578 80093578 D0610014 */  stfs      f3, 0x14(r1)
/* 09057C 8009357C EF6400B2 */  fmuls     f27, f4, f2
/* 090580 80093580 80BF0064 */  lwz       r5, 0x64(r31)
/* 090584 80093584 EF440072 */  fmuls     f26, f4, f1
/* 090588 80093588 3881002C */  addi      r4, r1, 0x2c
/* 09058C 8009358C EF240032 */  fmuls     f25, f4, f0
/* 090590 80093590 4BFA0AA5 */  bl        cpuGetAddressBuffer
/* 090594 80093594 38000004 */  li        r0, 0x4
/* 090598 80093598 80E10014 */  lwz       r7, 0x14(r1)
/* 09059C 8009359C 7C0903A6 */  mtctr     r0
/* 0905A0 800935A0 8001001C */  lwz       r0, 0x1c(r1)
/* 0905A4 800935A4 39000000 */  li        r8, 0x0
/* 0905A8 800935A8 38C00000 */  li        r6, 0x0
lbl_800935AC:
/* 0905AC 800935AC 38800000 */  li        r4, 0x0
/* 0905B0 800935B0 7C082000 */  cmpw      r8, r4
/* 0905B4 800935B4 54C3103A */  slwi      r3, r6, 2
/* 0905B8 800935B8 40820010 */  bne       lbl_800935C8
/* 0905BC 800935BC 8081002C */  lwz       r4, 0x2c(r1)
/* 0905C0 800935C0 7CE4192E */  stwx      r7, r4, r3
/* 0905C4 800935C4 4800000C */  b         lbl_800935D0
lbl_800935C8:
/* 0905C8 800935C8 8081002C */  lwz       r4, 0x2c(r1)
/* 0905CC 800935CC 7C04192E */  stwx      r0, r4, r3
lbl_800935D0:
/* 0905D0 800935D0 38800001 */  li        r4, 0x1
/* 0905D4 800935D4 7C082000 */  cmpw      r8, r4
/* 0905D8 800935D8 38630004 */  addi      r3, r3, 0x4
/* 0905DC 800935DC 40820010 */  bne       lbl_800935EC
/* 0905E0 800935E0 8081002C */  lwz       r4, 0x2c(r1)
/* 0905E4 800935E4 7CE4192E */  stwx      r7, r4, r3
/* 0905E8 800935E8 4800000C */  b         lbl_800935F4
lbl_800935EC:
/* 0905EC 800935EC 8081002C */  lwz       r4, 0x2c(r1)
/* 0905F0 800935F0 7C04192E */  stwx      r0, r4, r3
lbl_800935F4:
/* 0905F4 800935F4 38800002 */  li        r4, 0x2
/* 0905F8 800935F8 7C082000 */  cmpw      r8, r4
/* 0905FC 800935FC 38A60001 */  addi      r5, r6, 0x1
/* 090600 80093600 38630004 */  addi      r3, r3, 0x4
/* 090604 80093604 40820010 */  bne       lbl_80093614
/* 090608 80093608 8081002C */  lwz       r4, 0x2c(r1)
/* 09060C 8009360C 7CE4192E */  stwx      r7, r4, r3
/* 090610 80093610 4800000C */  b         lbl_8009361C
lbl_80093614:
/* 090614 80093614 8081002C */  lwz       r4, 0x2c(r1)
/* 090618 80093618 7C04192E */  stwx      r0, r4, r3
lbl_8009361C:
/* 09061C 8009361C 38800003 */  li        r4, 0x3
/* 090620 80093620 7C082000 */  cmpw      r8, r4
/* 090624 80093624 38630004 */  addi      r3, r3, 0x4
/* 090628 80093628 40820010 */  bne       lbl_80093638
/* 09062C 8009362C 8081002C */  lwz       r4, 0x2c(r1)
/* 090630 80093630 7CE4192E */  stwx      r7, r4, r3
/* 090634 80093634 4800000C */  b         lbl_80093640
lbl_80093638:
/* 090638 80093638 8081002C */  lwz       r4, 0x2c(r1)
/* 09063C 8009363C 7C04192E */  stwx      r0, r4, r3
lbl_80093640:
/* 090640 80093640 38C60004 */  addi      r6, r6, 0x4
/* 090644 80093644 39080001 */  addi      r8, r8, 0x1
/* 090648 80093648 4200FF64 */  bdnz      lbl_800935AC
/* 09064C 8009364C EC3E07B2 */  fmuls     f1, f30, f30
/* 090650 80093650 C06283A4 */  lfs       f3, D_8018C2E4@sda21(r0)
/* 090654 80093654 EC9E0632 */  fmuls     f4, f30, f24
/* 090658 80093658 ECFD0632 */  fmuls     f7, f29, f24
/* 09065C 8009365C EC030828 */  fsubs     f0, f3, f1
/* 090660 80093660 ED1C0632 */  fmuls     f8, f28, f24
/* 090664 80093664 ECBD0772 */  fmuls     f5, f29, f29
/* 090668 80093668 EC1F083A */  fmadds    f0, f31, f0, f1
/* 09066C 8009366C ED3C0732 */  fmuls     f9, f28, f28
/* 090670 80093670 EC232828 */  fsubs     f1, f3, f5
/* 090674 80093674 D0010024 */  stfs      f0, 0x24(r1)
/* 090678 80093678 EC5A2028 */  fsubs     f2, f26, f4
/* 09067C 8009367C EC034828 */  fsubs     f0, f3, f9
/* 090680 80093680 80010024 */  lwz       r0, 0x24(r1)
/* 090684 80093684 8061002C */  lwz       r3, 0x2c(r1)
/* 090688 80093688 ECDA202A */  fadds     f6, f26, f4
/* 09068C 8009368C ECBF287A */  fmadds    f5, f31, f1, f5
/* 090690 80093690 90030000 */  stw       r0, 0x0(r3)
/* 090694 80093694 EC99382A */  fadds     f4, f25, f7
/* 090698 80093698 EC793828 */  fsubs     f3, f25, f7
/* 09069C 8009369C D0410024 */  stfs      f2, 0x24(r1)
/* 0906A0 800936A0 EC5F483A */  fmadds    f2, f31, f0, f9
/* 0906A4 800936A4 80010024 */  lwz       r0, 0x24(r1)
/* 0906A8 800936A8 EC3B4028 */  fsubs     f1, f27, f8
/* 0906AC 800936AC 8061002C */  lwz       r3, 0x2c(r1)
/* 0906B0 800936B0 EC1B402A */  fadds     f0, f27, f8
/* 0906B4 800936B4 90030024 */  stw       r0, 0x24(r3)
/* 0906B8 800936B8 D0C10024 */  stfs      f6, 0x24(r1)
/* 0906BC 800936BC 80010024 */  lwz       r0, 0x24(r1)
/* 0906C0 800936C0 8061002C */  lwz       r3, 0x2c(r1)
/* 0906C4 800936C4 90030018 */  stw       r0, 0x18(r3)
/* 0906C8 800936C8 D0A10024 */  stfs      f5, 0x24(r1)
/* 0906CC 800936CC 80010024 */  lwz       r0, 0x24(r1)
/* 0906D0 800936D0 8061002C */  lwz       r3, 0x2c(r1)
/* 0906D4 800936D4 90030014 */  stw       r0, 0x14(r3)
/* 0906D8 800936D8 D0810024 */  stfs      f4, 0x24(r1)
/* 0906DC 800936DC 80010024 */  lwz       r0, 0x24(r1)
/* 0906E0 800936E0 8061002C */  lwz       r3, 0x2c(r1)
/* 0906E4 800936E4 90030020 */  stw       r0, 0x20(r3)
/* 0906E8 800936E8 D0610024 */  stfs      f3, 0x24(r1)
/* 0906EC 800936EC 80010024 */  lwz       r0, 0x24(r1)
/* 0906F0 800936F0 8061002C */  lwz       r3, 0x2c(r1)
/* 0906F4 800936F4 90030008 */  stw       r0, 0x8(r3)
/* 0906F8 800936F8 D0410024 */  stfs      f2, 0x24(r1)
/* 0906FC 800936FC 80010024 */  lwz       r0, 0x24(r1)
/* 090700 80093700 8061002C */  lwz       r3, 0x2c(r1)
/* 090704 80093704 90030028 */  stw       r0, 0x28(r3)
/* 090708 80093708 D0210024 */  stfs      f1, 0x24(r1)
/* 09070C 8009370C 80010024 */  lwz       r0, 0x24(r1)
/* 090710 80093710 8061002C */  lwz       r3, 0x2c(r1)
/* 090714 80093714 90030010 */  stw       r0, 0x10(r3)
/* 090718 80093718 D0010024 */  stfs      f0, 0x24(r1)
/* 09071C 8009371C 80010024 */  lwz       r0, 0x24(r1)
/* 090720 80093720 8061002C */  lwz       r3, 0x2c(r1)
/* 090724 80093724 90030004 */  stw       r0, 0x4(r3)
/* 090728 80093728 8001007C */  lwz       r0, 0x7c(r1)
/* 09072C 8009372C CBE10070 */  lfd       f31, 0x70(r1)
/* 090730 80093730 CBC10068 */  lfd       f30, 0x68(r1)
/* 090734 80093734 CBA10060 */  lfd       f29, 0x60(r1)
/* 090738 80093738 CB810058 */  lfd       f28, 0x58(r1)
/* 09073C 8009373C CB610050 */  lfd       f27, 0x50(r1)
/* 090740 80093740 CB410048 */  lfd       f26, 0x48(r1)
/* 090744 80093744 CB210040 */  lfd       f25, 0x40(r1)
/* 090748 80093748 CB010038 */  lfd       f24, 0x38(r1)
/* 09074C 8009374C 83E10034 */  lwz       r31, 0x34(r1)
/* 090750 80093750 38210078 */  addi      r1, r1, 0x78
/* 090754 80093754 7C0803A6 */  mtlr      r0
/* 090758 80093758 4E800020 */  blr

glabel guTranslate
/* 09075C 8009375C 7C0802A6 */  mflr      r0
/* 090760 80093760 90010004 */  stw       r0, 0x4(r1)
/* 090764 80093764 9421FF80 */  stwu      r1, -0x80(r1)
/* 090768 80093768 93E1007C */  stw       r31, 0x7c(r1)
/* 09076C 8009376C 7C7F1B78 */  mr        r31, r3
/* 090770 80093770 38810060 */  addi      r4, r1, 0x60
/* 090774 80093774 80A30064 */  lwz       r5, 0x64(r3)
/* 090778 80093778 4BFA08BD */  bl        cpuGetAddressBuffer
/* 09077C 8009377C C02283A4 */  lfs       f1, D_8018C2E4@sda21(r0)
/* 090780 80093780 38000002 */  li        r0, 0x2
/* 090784 80093784 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090788 80093788 7C0903A6 */  mtctr     r0
/* 09078C 8009378C D0210014 */  stfs      f1, 0x14(r1)
/* 090790 80093790 38A10014 */  addi      r5, r1, 0x14
/* 090794 80093794 D0010018 */  stfs      f0, 0x18(r1)
/* 090798 80093798 38C00000 */  li        r6, 0x0
/* 09079C 8009379C D001001C */  stfs      f0, 0x1c(r1)
/* 0907A0 800937A0 D0010020 */  stfs      f0, 0x20(r1)
/* 0907A4 800937A4 D0010024 */  stfs      f0, 0x24(r1)
/* 0907A8 800937A8 D0210028 */  stfs      f1, 0x28(r1)
/* 0907AC 800937AC D001002C */  stfs      f0, 0x2c(r1)
/* 0907B0 800937B0 D0010030 */  stfs      f0, 0x30(r1)
/* 0907B4 800937B4 D0010034 */  stfs      f0, 0x34(r1)
/* 0907B8 800937B8 D0010038 */  stfs      f0, 0x38(r1)
/* 0907BC 800937BC D021003C */  stfs      f1, 0x3c(r1)
/* 0907C0 800937C0 D0010040 */  stfs      f0, 0x40(r1)
/* 0907C4 800937C4 D0010044 */  stfs      f0, 0x44(r1)
/* 0907C8 800937C8 D0010048 */  stfs      f0, 0x48(r1)
/* 0907CC 800937CC D001004C */  stfs      f0, 0x4c(r1)
/* 0907D0 800937D0 D0210050 */  stfs      f1, 0x50(r1)
/* 0907D4 800937D4 801F006C */  lwz       r0, 0x6c(r31)
/* 0907D8 800937D8 9001005C */  stw       r0, 0x5c(r1)
/* 0907DC 800937DC C001005C */  lfs       f0, 0x5c(r1)
/* 0907E0 800937E0 D0010044 */  stfs      f0, 0x44(r1)
/* 0907E4 800937E4 801F0074 */  lwz       r0, 0x74(r31)
/* 0907E8 800937E8 9001005C */  stw       r0, 0x5c(r1)
/* 0907EC 800937EC C001005C */  lfs       f0, 0x5c(r1)
/* 0907F0 800937F0 D0010048 */  stfs      f0, 0x48(r1)
/* 0907F4 800937F4 801F007C */  lwz       r0, 0x7c(r31)
/* 0907F8 800937F8 9001005C */  stw       r0, 0x5c(r1)
/* 0907FC 800937FC C001005C */  lfs       f0, 0x5c(r1)
/* 090800 80093800 D001004C */  stfs      f0, 0x4c(r1)
/* 090804 80093804 80610060 */  lwz       r3, 0x60(r1)
/* 090808 80093808 C04283B0 */  lfs       f2, D_8018C2F0@sda21(r0)
/* 09080C 8009380C 39230000 */  addi      r9, r3, 0x0
/* 090810 80093810 39430020 */  addi      r10, r3, 0x20
lbl_80093814:
/* 090814 80093814 C0250000 */  lfs       f1, 0x0(r5)
/* 090818 80093818 C0050004 */  lfs       f0, 0x4(r5)
/* 09081C 8009381C EC220072 */  fmuls     f1, f2, f1
/* 090820 80093820 EC020032 */  fmuls     f0, f2, f0
/* 090824 80093824 FC20081E */  fctiwz    f1, f1
/* 090828 80093828 FC00001E */  fctiwz    f0, f0
/* 09082C 8009382C D8210070 */  stfd      f1, 0x70(r1)
/* 090830 80093830 D8010068 */  stfd      f0, 0x68(r1)
/* 090834 80093834 80E10074 */  lwz       r7, 0x74(r1)
/* 090838 80093838 8101006C */  lwz       r8, 0x6c(r1)
/* 09083C 8009383C 54E0801E */  slwi      r0, r7, 16
/* 090840 80093840 5503843E */  srwi      r3, r8, 16
/* 090844 80093844 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090848 80093848 90690000 */  stw       r3, 0x0(r9)
/* 09084C 8009384C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090850 80093850 900A0000 */  stw       r0, 0x0(r10)
/* 090854 80093854 C0250008 */  lfs       f1, 0x8(r5)
/* 090858 80093858 C005000C */  lfs       f0, 0xc(r5)
/* 09085C 8009385C 38A50010 */  addi      r5, r5, 0x10
/* 090860 80093860 EC220072 */  fmuls     f1, f2, f1
/* 090864 80093864 EC020032 */  fmuls     f0, f2, f0
/* 090868 80093868 FC20081E */  fctiwz    f1, f1
/* 09086C 8009386C FC00001E */  fctiwz    f0, f0
/* 090870 80093870 D8210070 */  stfd      f1, 0x70(r1)
/* 090874 80093874 D8010068 */  stfd      f0, 0x68(r1)
/* 090878 80093878 80E10074 */  lwz       r7, 0x74(r1)
/* 09087C 8009387C 8101006C */  lwz       r8, 0x6c(r1)
/* 090880 80093880 54E0801E */  slwi      r0, r7, 16
/* 090884 80093884 5503843E */  srwi      r3, r8, 16
/* 090888 80093888 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 09088C 8009388C 90690004 */  stw       r3, 0x4(r9)
/* 090890 80093890 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090894 80093894 39290008 */  addi      r9, r9, 0x8
/* 090898 80093898 900A0004 */  stw       r0, 0x4(r10)
/* 09089C 8009389C 394A0008 */  addi      r10, r10, 0x8
/* 0908A0 800938A0 C0250000 */  lfs       f1, 0x0(r5)
/* 0908A4 800938A4 38C60001 */  addi      r6, r6, 0x1
/* 0908A8 800938A8 C0050004 */  lfs       f0, 0x4(r5)
/* 0908AC 800938AC EC220072 */  fmuls     f1, f2, f1
/* 0908B0 800938B0 EC020032 */  fmuls     f0, f2, f0
/* 0908B4 800938B4 FC20081E */  fctiwz    f1, f1
/* 0908B8 800938B8 FC00001E */  fctiwz    f0, f0
/* 0908BC 800938BC D8210070 */  stfd      f1, 0x70(r1)
/* 0908C0 800938C0 D8010068 */  stfd      f0, 0x68(r1)
/* 0908C4 800938C4 80E10074 */  lwz       r7, 0x74(r1)
/* 0908C8 800938C8 8101006C */  lwz       r8, 0x6c(r1)
/* 0908CC 800938CC 54E0801E */  slwi      r0, r7, 16
/* 0908D0 800938D0 5503843E */  srwi      r3, r8, 16
/* 0908D4 800938D4 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 0908D8 800938D8 90690000 */  stw       r3, 0x0(r9)
/* 0908DC 800938DC 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 0908E0 800938E0 900A0000 */  stw       r0, 0x0(r10)
/* 0908E4 800938E4 C0250008 */  lfs       f1, 0x8(r5)
/* 0908E8 800938E8 C005000C */  lfs       f0, 0xc(r5)
/* 0908EC 800938EC 38A50010 */  addi      r5, r5, 0x10
/* 0908F0 800938F0 EC220072 */  fmuls     f1, f2, f1
/* 0908F4 800938F4 EC020032 */  fmuls     f0, f2, f0
/* 0908F8 800938F8 FC20081E */  fctiwz    f1, f1
/* 0908FC 800938FC FC00001E */  fctiwz    f0, f0
/* 090900 80093900 D8210070 */  stfd      f1, 0x70(r1)
/* 090904 80093904 D8010068 */  stfd      f0, 0x68(r1)
/* 090908 80093908 80E10074 */  lwz       r7, 0x74(r1)
/* 09090C 8009390C 8101006C */  lwz       r8, 0x6c(r1)
/* 090910 80093910 54E0801E */  slwi      r0, r7, 16
/* 090914 80093914 5503843E */  srwi      r3, r8, 16
/* 090918 80093918 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 09091C 8009391C 90690004 */  stw       r3, 0x4(r9)
/* 090920 80093920 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090924 80093924 39290008 */  addi      r9, r9, 0x8
/* 090928 80093928 900A0004 */  stw       r0, 0x4(r10)
/* 09092C 8009392C 394A0008 */  addi      r10, r10, 0x8
/* 090930 80093930 4200FEE4 */  bdnz      lbl_80093814
/* 090934 80093934 80010084 */  lwz       r0, 0x84(r1)
/* 090938 80093938 83E1007C */  lwz       r31, 0x7c(r1)
/* 09093C 8009393C 38210080 */  addi      r1, r1, 0x80
/* 090940 80093940 7C0803A6 */  mtlr      r0
/* 090944 80093944 4E800020 */  blr

glabel guTranslateF
/* 090948 80093948 7C0802A6 */  mflr      r0
/* 09094C 8009394C 90010004 */  stw       r0, 0x4(r1)
/* 090950 80093950 9421FFD0 */  stwu      r1, -0x30(r1)
/* 090954 80093954 93E1002C */  stw       r31, 0x2c(r1)
/* 090958 80093958 7C7F1B78 */  mr        r31, r3
/* 09095C 8009395C 38810020 */  addi      r4, r1, 0x20
/* 090960 80093960 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090964 80093964 D001001C */  stfs      f0, 0x1c(r1)
/* 090968 80093968 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 09096C 8009396C D0010014 */  stfs      f0, 0x14(r1)
/* 090970 80093970 80BF0064 */  lwz       r5, 0x64(r31)
/* 090974 80093974 4BFA06C1 */  bl        cpuGetAddressBuffer
/* 090978 80093978 38000004 */  li        r0, 0x4
/* 09097C 8009397C 80E10014 */  lwz       r7, 0x14(r1)
/* 090980 80093980 7C0903A6 */  mtctr     r0
/* 090984 80093984 8001001C */  lwz       r0, 0x1c(r1)
/* 090988 80093988 39000000 */  li        r8, 0x0
/* 09098C 8009398C 38C00000 */  li        r6, 0x0
lbl_80093990:
/* 090990 80093990 38800000 */  li        r4, 0x0
/* 090994 80093994 7C082000 */  cmpw      r8, r4
/* 090998 80093998 54C3103A */  slwi      r3, r6, 2
/* 09099C 8009399C 40820010 */  bne       lbl_800939AC
/* 0909A0 800939A0 80810020 */  lwz       r4, 0x20(r1)
/* 0909A4 800939A4 7CE4192E */  stwx      r7, r4, r3
/* 0909A8 800939A8 4800000C */  b         lbl_800939B4
lbl_800939AC:
/* 0909AC 800939AC 80810020 */  lwz       r4, 0x20(r1)
/* 0909B0 800939B0 7C04192E */  stwx      r0, r4, r3
lbl_800939B4:
/* 0909B4 800939B4 38800001 */  li        r4, 0x1
/* 0909B8 800939B8 7C082000 */  cmpw      r8, r4
/* 0909BC 800939BC 38630004 */  addi      r3, r3, 0x4
/* 0909C0 800939C0 40820010 */  bne       lbl_800939D0
/* 0909C4 800939C4 80810020 */  lwz       r4, 0x20(r1)
/* 0909C8 800939C8 7CE4192E */  stwx      r7, r4, r3
/* 0909CC 800939CC 4800000C */  b         lbl_800939D8
lbl_800939D0:
/* 0909D0 800939D0 80810020 */  lwz       r4, 0x20(r1)
/* 0909D4 800939D4 7C04192E */  stwx      r0, r4, r3
lbl_800939D8:
/* 0909D8 800939D8 38800002 */  li        r4, 0x2
/* 0909DC 800939DC 7C082000 */  cmpw      r8, r4
/* 0909E0 800939E0 38A60001 */  addi      r5, r6, 0x1
/* 0909E4 800939E4 38630004 */  addi      r3, r3, 0x4
/* 0909E8 800939E8 40820010 */  bne       lbl_800939F8
/* 0909EC 800939EC 80810020 */  lwz       r4, 0x20(r1)
/* 0909F0 800939F0 7CE4192E */  stwx      r7, r4, r3
/* 0909F4 800939F4 4800000C */  b         lbl_80093A00
lbl_800939F8:
/* 0909F8 800939F8 80810020 */  lwz       r4, 0x20(r1)
/* 0909FC 800939FC 7C04192E */  stwx      r0, r4, r3
lbl_80093A00:
/* 090A00 80093A00 38800003 */  li        r4, 0x3
/* 090A04 80093A04 7C082000 */  cmpw      r8, r4
/* 090A08 80093A08 38630004 */  addi      r3, r3, 0x4
/* 090A0C 80093A0C 40820010 */  bne       lbl_80093A1C
/* 090A10 80093A10 80810020 */  lwz       r4, 0x20(r1)
/* 090A14 80093A14 7CE4192E */  stwx      r7, r4, r3
/* 090A18 80093A18 4800000C */  b         lbl_80093A24
lbl_80093A1C:
/* 090A1C 80093A1C 80810020 */  lwz       r4, 0x20(r1)
/* 090A20 80093A20 7C04192E */  stwx      r0, r4, r3
lbl_80093A24:
/* 090A24 80093A24 38C60004 */  addi      r6, r6, 0x4
/* 090A28 80093A28 39080001 */  addi      r8, r8, 0x1
/* 090A2C 80093A2C 4200FF64 */  bdnz      lbl_80093990
/* 090A30 80093A30 801F006C */  lwz       r0, 0x6c(r31)
/* 090A34 80093A34 80610020 */  lwz       r3, 0x20(r1)
/* 090A38 80093A38 90030030 */  stw       r0, 0x30(r3)
/* 090A3C 80093A3C 801F0074 */  lwz       r0, 0x74(r31)
/* 090A40 80093A40 80610020 */  lwz       r3, 0x20(r1)
/* 090A44 80093A44 90030034 */  stw       r0, 0x34(r3)
/* 090A48 80093A48 801F007C */  lwz       r0, 0x7c(r31)
/* 090A4C 80093A4C 80610020 */  lwz       r3, 0x20(r1)
/* 090A50 80093A50 90030038 */  stw       r0, 0x38(r3)
/* 090A54 80093A54 80010034 */  lwz       r0, 0x34(r1)
/* 090A58 80093A58 83E1002C */  lwz       r31, 0x2c(r1)
/* 090A5C 80093A5C 38210030 */  addi      r1, r1, 0x30
/* 090A60 80093A60 7C0803A6 */  mtlr      r0
/* 090A64 80093A64 4E800020 */  blr

glabel guScale
/* 090A68 80093A68 7C0802A6 */  mflr      r0
/* 090A6C 80093A6C 90010004 */  stw       r0, 0x4(r1)
/* 090A70 80093A70 9421FF80 */  stwu      r1, -0x80(r1)
/* 090A74 80093A74 93E1007C */  stw       r31, 0x7c(r1)
/* 090A78 80093A78 7C7F1B78 */  mr        r31, r3
/* 090A7C 80093A7C 38810020 */  addi      r4, r1, 0x20
/* 090A80 80093A80 80A30064 */  lwz       r5, 0x64(r3)
/* 090A84 80093A84 4BFA05B1 */  bl        cpuGetAddressBuffer
/* 090A88 80093A88 C02283A4 */  lfs       f1, D_8018C2E4@sda21(r0)
/* 090A8C 80093A8C 38000002 */  li        r0, 0x2
/* 090A90 80093A90 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090A94 80093A94 7C0903A6 */  mtctr     r0
/* 090A98 80093A98 D0210024 */  stfs      f1, 0x24(r1)
/* 090A9C 80093A9C 38A10024 */  addi      r5, r1, 0x24
/* 090AA0 80093AA0 D0010028 */  stfs      f0, 0x28(r1)
/* 090AA4 80093AA4 38C00000 */  li        r6, 0x0
/* 090AA8 80093AA8 D001002C */  stfs      f0, 0x2c(r1)
/* 090AAC 80093AAC D0010030 */  stfs      f0, 0x30(r1)
/* 090AB0 80093AB0 D0010034 */  stfs      f0, 0x34(r1)
/* 090AB4 80093AB4 D0210038 */  stfs      f1, 0x38(r1)
/* 090AB8 80093AB8 D001003C */  stfs      f0, 0x3c(r1)
/* 090ABC 80093ABC D0010040 */  stfs      f0, 0x40(r1)
/* 090AC0 80093AC0 D0010044 */  stfs      f0, 0x44(r1)
/* 090AC4 80093AC4 D0010048 */  stfs      f0, 0x48(r1)
/* 090AC8 80093AC8 D021004C */  stfs      f1, 0x4c(r1)
/* 090ACC 80093ACC D0010050 */  stfs      f0, 0x50(r1)
/* 090AD0 80093AD0 D0010054 */  stfs      f0, 0x54(r1)
/* 090AD4 80093AD4 D0010058 */  stfs      f0, 0x58(r1)
/* 090AD8 80093AD8 D001005C */  stfs      f0, 0x5c(r1)
/* 090ADC 80093ADC D0210060 */  stfs      f1, 0x60(r1)
/* 090AE0 80093AE0 801F006C */  lwz       r0, 0x6c(r31)
/* 090AE4 80093AE4 9001001C */  stw       r0, 0x1c(r1)
/* 090AE8 80093AE8 C001001C */  lfs       f0, 0x1c(r1)
/* 090AEC 80093AEC D0010024 */  stfs      f0, 0x24(r1)
/* 090AF0 80093AF0 801F0074 */  lwz       r0, 0x74(r31)
/* 090AF4 80093AF4 9001001C */  stw       r0, 0x1c(r1)
/* 090AF8 80093AF8 C001001C */  lfs       f0, 0x1c(r1)
/* 090AFC 80093AFC D0010038 */  stfs      f0, 0x38(r1)
/* 090B00 80093B00 801F007C */  lwz       r0, 0x7c(r31)
/* 090B04 80093B04 9001001C */  stw       r0, 0x1c(r1)
/* 090B08 80093B08 C001001C */  lfs       f0, 0x1c(r1)
/* 090B0C 80093B0C D001004C */  stfs      f0, 0x4c(r1)
/* 090B10 80093B10 80610020 */  lwz       r3, 0x20(r1)
/* 090B14 80093B14 C04283B0 */  lfs       f2, D_8018C2F0@sda21(r0)
/* 090B18 80093B18 39230000 */  addi      r9, r3, 0x0
/* 090B1C 80093B1C 39430020 */  addi      r10, r3, 0x20
lbl_80093B20:
/* 090B20 80093B20 C0250000 */  lfs       f1, 0x0(r5)
/* 090B24 80093B24 C0050004 */  lfs       f0, 0x4(r5)
/* 090B28 80093B28 EC220072 */  fmuls     f1, f2, f1
/* 090B2C 80093B2C EC020032 */  fmuls     f0, f2, f0
/* 090B30 80093B30 FC20081E */  fctiwz    f1, f1
/* 090B34 80093B34 FC00001E */  fctiwz    f0, f0
/* 090B38 80093B38 D8210070 */  stfd      f1, 0x70(r1)
/* 090B3C 80093B3C D8010068 */  stfd      f0, 0x68(r1)
/* 090B40 80093B40 80E10074 */  lwz       r7, 0x74(r1)
/* 090B44 80093B44 8101006C */  lwz       r8, 0x6c(r1)
/* 090B48 80093B48 54E0801E */  slwi      r0, r7, 16
/* 090B4C 80093B4C 5503843E */  srwi      r3, r8, 16
/* 090B50 80093B50 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090B54 80093B54 90690000 */  stw       r3, 0x0(r9)
/* 090B58 80093B58 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090B5C 80093B5C 900A0000 */  stw       r0, 0x0(r10)
/* 090B60 80093B60 C0250008 */  lfs       f1, 0x8(r5)
/* 090B64 80093B64 C005000C */  lfs       f0, 0xc(r5)
/* 090B68 80093B68 38A50010 */  addi      r5, r5, 0x10
/* 090B6C 80093B6C EC220072 */  fmuls     f1, f2, f1
/* 090B70 80093B70 EC020032 */  fmuls     f0, f2, f0
/* 090B74 80093B74 FC20081E */  fctiwz    f1, f1
/* 090B78 80093B78 FC00001E */  fctiwz    f0, f0
/* 090B7C 80093B7C D8210070 */  stfd      f1, 0x70(r1)
/* 090B80 80093B80 D8010068 */  stfd      f0, 0x68(r1)
/* 090B84 80093B84 80E10074 */  lwz       r7, 0x74(r1)
/* 090B88 80093B88 8101006C */  lwz       r8, 0x6c(r1)
/* 090B8C 80093B8C 54E0801E */  slwi      r0, r7, 16
/* 090B90 80093B90 5503843E */  srwi      r3, r8, 16
/* 090B94 80093B94 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090B98 80093B98 90690004 */  stw       r3, 0x4(r9)
/* 090B9C 80093B9C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090BA0 80093BA0 39290008 */  addi      r9, r9, 0x8
/* 090BA4 80093BA4 900A0004 */  stw       r0, 0x4(r10)
/* 090BA8 80093BA8 394A0008 */  addi      r10, r10, 0x8
/* 090BAC 80093BAC C0250000 */  lfs       f1, 0x0(r5)
/* 090BB0 80093BB0 38C60001 */  addi      r6, r6, 0x1
/* 090BB4 80093BB4 C0050004 */  lfs       f0, 0x4(r5)
/* 090BB8 80093BB8 EC220072 */  fmuls     f1, f2, f1
/* 090BBC 80093BBC EC020032 */  fmuls     f0, f2, f0
/* 090BC0 80093BC0 FC20081E */  fctiwz    f1, f1
/* 090BC4 80093BC4 FC00001E */  fctiwz    f0, f0
/* 090BC8 80093BC8 D8210070 */  stfd      f1, 0x70(r1)
/* 090BCC 80093BCC D8010068 */  stfd      f0, 0x68(r1)
/* 090BD0 80093BD0 80E10074 */  lwz       r7, 0x74(r1)
/* 090BD4 80093BD4 8101006C */  lwz       r8, 0x6c(r1)
/* 090BD8 80093BD8 54E0801E */  slwi      r0, r7, 16
/* 090BDC 80093BDC 5503843E */  srwi      r3, r8, 16
/* 090BE0 80093BE0 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090BE4 80093BE4 90690000 */  stw       r3, 0x0(r9)
/* 090BE8 80093BE8 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090BEC 80093BEC 900A0000 */  stw       r0, 0x0(r10)
/* 090BF0 80093BF0 C0250008 */  lfs       f1, 0x8(r5)
/* 090BF4 80093BF4 C005000C */  lfs       f0, 0xc(r5)
/* 090BF8 80093BF8 38A50010 */  addi      r5, r5, 0x10
/* 090BFC 80093BFC EC220072 */  fmuls     f1, f2, f1
/* 090C00 80093C00 EC020032 */  fmuls     f0, f2, f0
/* 090C04 80093C04 FC20081E */  fctiwz    f1, f1
/* 090C08 80093C08 FC00001E */  fctiwz    f0, f0
/* 090C0C 80093C0C D8210070 */  stfd      f1, 0x70(r1)
/* 090C10 80093C10 D8010068 */  stfd      f0, 0x68(r1)
/* 090C14 80093C14 80E10074 */  lwz       r7, 0x74(r1)
/* 090C18 80093C18 8101006C */  lwz       r8, 0x6c(r1)
/* 090C1C 80093C1C 54E0801E */  slwi      r0, r7, 16
/* 090C20 80093C20 5503843E */  srwi      r3, r8, 16
/* 090C24 80093C24 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090C28 80093C28 90690004 */  stw       r3, 0x4(r9)
/* 090C2C 80093C2C 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090C30 80093C30 39290008 */  addi      r9, r9, 0x8
/* 090C34 80093C34 900A0004 */  stw       r0, 0x4(r10)
/* 090C38 80093C38 394A0008 */  addi      r10, r10, 0x8
/* 090C3C 80093C3C 4200FEE4 */  bdnz      lbl_80093B20
/* 090C40 80093C40 80010084 */  lwz       r0, 0x84(r1)
/* 090C44 80093C44 83E1007C */  lwz       r31, 0x7c(r1)
/* 090C48 80093C48 38210080 */  addi      r1, r1, 0x80
/* 090C4C 80093C4C 7C0803A6 */  mtlr      r0
/* 090C50 80093C50 4E800020 */  blr

glabel guScaleF
/* 090C54 80093C54 7C0802A6 */  mflr      r0
/* 090C58 80093C58 90010004 */  stw       r0, 0x4(r1)
/* 090C5C 80093C5C 9421FFD0 */  stwu      r1, -0x30(r1)
/* 090C60 80093C60 93E1002C */  stw       r31, 0x2c(r1)
/* 090C64 80093C64 7C7F1B78 */  mr        r31, r3
/* 090C68 80093C68 38810020 */  addi      r4, r1, 0x20
/* 090C6C 80093C6C C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090C70 80093C70 D001001C */  stfs      f0, 0x1c(r1)
/* 090C74 80093C74 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 090C78 80093C78 D0010014 */  stfs      f0, 0x14(r1)
/* 090C7C 80093C7C 80BF0064 */  lwz       r5, 0x64(r31)
/* 090C80 80093C80 4BFA03B5 */  bl        cpuGetAddressBuffer
/* 090C84 80093C84 38000004 */  li        r0, 0x4
/* 090C88 80093C88 80E10014 */  lwz       r7, 0x14(r1)
/* 090C8C 80093C8C 7C0903A6 */  mtctr     r0
/* 090C90 80093C90 8001001C */  lwz       r0, 0x1c(r1)
/* 090C94 80093C94 39000000 */  li        r8, 0x0
/* 090C98 80093C98 38C00000 */  li        r6, 0x0
lbl_80093C9C:
/* 090C9C 80093C9C 38800000 */  li        r4, 0x0
/* 090CA0 80093CA0 7C082000 */  cmpw      r8, r4
/* 090CA4 80093CA4 54C3103A */  slwi      r3, r6, 2
/* 090CA8 80093CA8 40820010 */  bne       lbl_80093CB8
/* 090CAC 80093CAC 80810020 */  lwz       r4, 0x20(r1)
/* 090CB0 80093CB0 7CE4192E */  stwx      r7, r4, r3
/* 090CB4 80093CB4 4800000C */  b         lbl_80093CC0
lbl_80093CB8:
/* 090CB8 80093CB8 80810020 */  lwz       r4, 0x20(r1)
/* 090CBC 80093CBC 7C04192E */  stwx      r0, r4, r3
lbl_80093CC0:
/* 090CC0 80093CC0 38800001 */  li        r4, 0x1
/* 090CC4 80093CC4 7C082000 */  cmpw      r8, r4
/* 090CC8 80093CC8 38630004 */  addi      r3, r3, 0x4
/* 090CCC 80093CCC 40820010 */  bne       lbl_80093CDC
/* 090CD0 80093CD0 80810020 */  lwz       r4, 0x20(r1)
/* 090CD4 80093CD4 7CE4192E */  stwx      r7, r4, r3
/* 090CD8 80093CD8 4800000C */  b         lbl_80093CE4
lbl_80093CDC:
/* 090CDC 80093CDC 80810020 */  lwz       r4, 0x20(r1)
/* 090CE0 80093CE0 7C04192E */  stwx      r0, r4, r3
lbl_80093CE4:
/* 090CE4 80093CE4 38800002 */  li        r4, 0x2
/* 090CE8 80093CE8 7C082000 */  cmpw      r8, r4
/* 090CEC 80093CEC 38A60001 */  addi      r5, r6, 0x1
/* 090CF0 80093CF0 38630004 */  addi      r3, r3, 0x4
/* 090CF4 80093CF4 40820010 */  bne       lbl_80093D04
/* 090CF8 80093CF8 80810020 */  lwz       r4, 0x20(r1)
/* 090CFC 80093CFC 7CE4192E */  stwx      r7, r4, r3
/* 090D00 80093D00 4800000C */  b         lbl_80093D0C
lbl_80093D04:
/* 090D04 80093D04 80810020 */  lwz       r4, 0x20(r1)
/* 090D08 80093D08 7C04192E */  stwx      r0, r4, r3
lbl_80093D0C:
/* 090D0C 80093D0C 38800003 */  li        r4, 0x3
/* 090D10 80093D10 7C082000 */  cmpw      r8, r4
/* 090D14 80093D14 38630004 */  addi      r3, r3, 0x4
/* 090D18 80093D18 40820010 */  bne       lbl_80093D28
/* 090D1C 80093D1C 80810020 */  lwz       r4, 0x20(r1)
/* 090D20 80093D20 7CE4192E */  stwx      r7, r4, r3
/* 090D24 80093D24 4800000C */  b         lbl_80093D30
lbl_80093D28:
/* 090D28 80093D28 80810020 */  lwz       r4, 0x20(r1)
/* 090D2C 80093D2C 7C04192E */  stwx      r0, r4, r3
lbl_80093D30:
/* 090D30 80093D30 38C60004 */  addi      r6, r6, 0x4
/* 090D34 80093D34 39080001 */  addi      r8, r8, 0x1
/* 090D38 80093D38 4200FF64 */  bdnz      lbl_80093C9C
/* 090D3C 80093D3C 801F006C */  lwz       r0, 0x6c(r31)
/* 090D40 80093D40 80610020 */  lwz       r3, 0x20(r1)
/* 090D44 80093D44 90030000 */  stw       r0, 0x0(r3)
/* 090D48 80093D48 801F0074 */  lwz       r0, 0x74(r31)
/* 090D4C 80093D4C 80610020 */  lwz       r3, 0x20(r1)
/* 090D50 80093D50 90030014 */  stw       r0, 0x14(r3)
/* 090D54 80093D54 801F007C */  lwz       r0, 0x7c(r31)
/* 090D58 80093D58 80610020 */  lwz       r3, 0x20(r1)
/* 090D5C 80093D5C 90030028 */  stw       r0, 0x28(r3)
/* 090D60 80093D60 80610020 */  lwz       r3, 0x20(r1)
/* 090D64 80093D64 90E3003C */  stw       r7, 0x3c(r3)
/* 090D68 80093D68 80010034 */  lwz       r0, 0x34(r1)
/* 090D6C 80093D6C 83E1002C */  lwz       r31, 0x2c(r1)
/* 090D70 80093D70 38210030 */  addi      r1, r1, 0x30
/* 090D74 80093D74 7C0803A6 */  mtlr      r0
/* 090D78 80093D78 4E800020 */  blr

glabel GenPerspective_1080
/* 090D7C 80093D7C 7C0802A6 */  mflr      r0
/* 090D80 80093D80 90010004 */  stw       r0, 0x4(r1)
/* 090D84 80093D84 9421FFD8 */  stwu      r1, -0x28(r1)
/* 090D88 80093D88 93E10024 */  stw       r31, 0x24(r1)
/* 090D8C 80093D8C 38810010 */  addi      r4, r1, 0x10
/* 090D90 80093D90 93C10020 */  stw       r30, 0x20(r1)
/* 090D94 80093D94 7C7E1B78 */  mr        r30, r3
/* 090D98 80093D98 80C30008 */  lwz       r6, 0x8(r3)
/* 090D9C 80093D9C 80BE0064 */  lwz       r5, 0x64(r30)
/* 090DA0 80093DA0 83E60000 */  lwz       r31, 0x0(r6)
/* 090DA4 80093DA4 4BFA0291 */  bl        cpuGetAddressBuffer
/* 090DA8 80093DA8 80BE012C */  lwz       r5, 0x12c(r30)
/* 090DAC 80093DAC 387E0000 */  addi      r3, r30, 0x0
/* 090DB0 80093DB0 3881000C */  addi      r4, r1, 0xc
/* 090DB4 80093DB4 4BFA0281 */  bl        cpuGetAddressBuffer
/* 090DB8 80093DB8 801E006C */  lwz       r0, 0x6c(r30)
/* 090DBC 80093DBC 38800000 */  li        r4, 0x0
/* 090DC0 80093DC0 38C00000 */  li        r6, 0x0
/* 090DC4 80093DC4 9001001C */  stw       r0, 0x1c(r1)
/* 090DC8 80093DC8 C061001C */  lfs       f3, 0x1c(r1)
/* 090DCC 80093DCC 801E0074 */  lwz       r0, 0x74(r30)
/* 090DD0 80093DD0 9001001C */  stw       r0, 0x1c(r1)
/* 090DD4 80093DD4 C081001C */  lfs       f4, 0x1c(r1)
/* 090DD8 80093DD8 801E007C */  lwz       r0, 0x7c(r30)
/* 090DDC 80093DDC 9001001C */  stw       r0, 0x1c(r1)
/* 090DE0 80093DE0 8061000C */  lwz       r3, 0xc(r1)
/* 090DE4 80093DE4 C021001C */  lfs       f1, 0x1c(r1)
/* 090DE8 80093DE8 80030010 */  lwz       r0, 0x10(r3)
/* 090DEC 80093DEC 9001001C */  stw       r0, 0x1c(r1)
/* 090DF0 80093DF0 807E0008 */  lwz       r3, 0x8(r30)
/* 090DF4 80093DF4 C041001C */  lfs       f2, 0x1c(r1)
/* 090DF8 80093DF8 80BE0064 */  lwz       r5, 0x64(r30)
/* 090DFC 80093DFC 80630000 */  lwz       r3, 0x0(r3)
/* 090E00 80093E00 C0A283A4 */  lfs       f5, D_8018C2E4@sda21(r0)
/* 090E04 80093E04 4BF895D1 */  bl        frameSetMatrixHint
/* 090E08 80093E08 3C7F0004 */  addis     r3, r31, 0x4
/* 090E0C 80093E0C 8003C514 */  lwz       r0, -0x3aec(r3)
/* 090E10 80093E10 9003C518 */  stw       r0, -0x3ae8(r3)
/* 090E14 80093E14 8001002C */  lwz       r0, 0x2c(r1)
/* 090E18 80093E18 83E10024 */  lwz       r31, 0x24(r1)
/* 090E1C 80093E1C 83C10020 */  lwz       r30, 0x20(r1)
/* 090E20 80093E20 38210028 */  addi      r1, r1, 0x28
/* 090E24 80093E24 7C0803A6 */  mtlr      r0
/* 090E28 80093E28 4E800020 */  blr

glabel guPerspective
/* 090E2C 80093E2C 7C0802A6 */  mflr      r0
/* 090E30 80093E30 90010004 */  stw       r0, 0x4(r1)
/* 090E34 80093E34 9421FF58 */  stwu      r1, -0xa8(r1)
/* 090E38 80093E38 DBE100A0 */  stfd      f31, 0xa0(r1)
/* 090E3C 80093E3C 38810060 */  addi      r4, r1, 0x60
/* 090E40 80093E40 DBC10098 */  stfd      f30, 0x98(r1)
/* 090E44 80093E44 DBA10090 */  stfd      f29, 0x90(r1)
/* 090E48 80093E48 DB810088 */  stfd      f28, 0x88(r1)
/* 090E4C 80093E4C DB610080 */  stfd      f27, 0x80(r1)
/* 090E50 80093E50 93E1007C */  stw       r31, 0x7c(r1)
/* 090E54 80093E54 7C7F1B78 */  mr        r31, r3
/* 090E58 80093E58 80A30064 */  lwz       r5, 0x64(r3)
/* 090E5C 80093E5C 4BFA01D9 */  bl        cpuGetAddressBuffer
/* 090E60 80093E60 80BF012C */  lwz       r5, 0x12c(r31)
/* 090E64 80093E64 387F0000 */  addi      r3, r31, 0x0
/* 090E68 80093E68 38810014 */  addi      r4, r1, 0x14
/* 090E6C 80093E6C 4BFA01C9 */  bl        cpuGetAddressBuffer
/* 090E70 80093E70 801F0074 */  lwz       r0, 0x74(r31)
/* 090E74 80093E74 38800000 */  li        r4, 0x0
/* 090E78 80093E78 38A00000 */  li        r5, 0x0
/* 090E7C 80093E7C 9001005C */  stw       r0, 0x5c(r1)
/* 090E80 80093E80 C3C1005C */  lfs       f30, 0x5c(r1)
/* 090E84 80093E84 801F007C */  lwz       r0, 0x7c(r31)
/* 090E88 80093E88 FC60F090 */  fmr       f3, f30
/* 090E8C 80093E8C 9001005C */  stw       r0, 0x5c(r1)
/* 090E90 80093E90 80610014 */  lwz       r3, 0x14(r1)
/* 090E94 80093E94 C3A1005C */  lfs       f29, 0x5c(r1)
/* 090E98 80093E98 80030010 */  lwz       r0, 0x10(r3)
/* 090E9C 80093E9C FC80E890 */  fmr       f4, f29
/* 090EA0 80093EA0 9001005C */  stw       r0, 0x5c(r1)
/* 090EA4 80093EA4 C381005C */  lfs       f28, 0x5c(r1)
/* 090EA8 80093EA8 80030014 */  lwz       r0, 0x14(r3)
/* 090EAC 80093EAC FC20E090 */  fmr       f1, f28
/* 090EB0 80093EB0 9001005C */  stw       r0, 0x5c(r1)
/* 090EB4 80093EB4 C361005C */  lfs       f27, 0x5c(r1)
/* 090EB8 80093EB8 80030018 */  lwz       r0, 0x18(r3)
/* 090EBC 80093EBC FC40D890 */  fmr       f2, f27
/* 090EC0 80093EC0 9001005C */  stw       r0, 0x5c(r1)
/* 090EC4 80093EC4 807F0008 */  lwz       r3, 0x8(r31)
/* 090EC8 80093EC8 C0A1005C */  lfs       f5, 0x5c(r1)
/* 090ECC 80093ECC 80DF0064 */  lwz       r6, 0x64(r31)
/* 090ED0 80093ED0 80630000 */  lwz       r3, 0x0(r3)
/* 090ED4 80093ED4 4BF89501 */  bl        frameSetMatrixHint
/* 090ED8 80093ED8 C02283A4 */  lfs       f1, D_8018C2E4@sda21(r0)
/* 090EDC 80093EDC C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090EE0 80093EE0 D0210018 */  stfs      f1, 0x18(r1)
/* 090EE4 80093EE4 D001001C */  stfs      f0, 0x1c(r1)
/* 090EE8 80093EE8 D0010020 */  stfs      f0, 0x20(r1)
/* 090EEC 80093EEC D0010024 */  stfs      f0, 0x24(r1)
/* 090EF0 80093EF0 D0010028 */  stfs      f0, 0x28(r1)
/* 090EF4 80093EF4 D021002C */  stfs      f1, 0x2c(r1)
/* 090EF8 80093EF8 D0010030 */  stfs      f0, 0x30(r1)
/* 090EFC 80093EFC D0010034 */  stfs      f0, 0x34(r1)
/* 090F00 80093F00 D0010038 */  stfs      f0, 0x38(r1)
/* 090F04 80093F04 D001003C */  stfs      f0, 0x3c(r1)
/* 090F08 80093F08 D0210040 */  stfs      f1, 0x40(r1)
/* 090F0C 80093F0C D0010044 */  stfs      f0, 0x44(r1)
/* 090F10 80093F10 D0010048 */  stfs      f0, 0x48(r1)
/* 090F14 80093F14 D001004C */  stfs      f0, 0x4c(r1)
/* 090F18 80093F18 D0010050 */  stfs      f0, 0x50(r1)
/* 090F1C 80093F1C D0210054 */  stfs      f1, 0x54(r1)
/* 090F20 80093F20 C02283D0 */  lfs       f1, D_8018C310@sda21(r0)
/* 090F24 80093F24 C0028378 */  lfs       f0, D_8018C2B8@sda21(r0)
/* 090F28 80093F28 EFDE0072 */  fmuls     f30, f30, f1
/* 090F2C 80093F2C EFDE0032 */  fmuls     f30, f30, f0
/* 090F30 80093F30 FC20F090 */  fmr       f1, f30
/* 090F34 80093F34 4803CF15 */  bl        sinf
/* 090F38 80093F38 FFE00890 */  fmr       f31, f1
/* 090F3C 80093F3C FC20F090 */  fmr       f1, f30
/* 090F40 80093F40 4803CD75 */  bl        cosf
/* 090F44 80093F44 EC41F824 */  fdivs     f2, f1, f31
/* 090F48 80093F48 38000002 */  li        r0, 0x2
/* 090F4C 80093F4C 7C0903A6 */  mtctr     r0
/* 090F50 80093F50 38A10018 */  addi      r5, r1, 0x18
/* 090F54 80093F54 38C00000 */  li        r6, 0x0
/* 090F58 80093F58 EC02E824 */  fdivs     f0, f2, f29
/* 090F5C 80093F5C D0010018 */  stfs      f0, 0x18(r1)
/* 090F60 80093F60 EC1CD82A */  fadds     f0, f28, f27
/* 090F64 80093F64 EC3CD828 */  fsubs     f1, f28, f27
/* 090F68 80093F68 D041002C */  stfs      f2, 0x2c(r1)
/* 090F6C 80093F6C EC000824 */  fdivs     f0, f0, f1
/* 090F70 80093F70 D0010040 */  stfs      f0, 0x40(r1)
/* 090F74 80093F74 C00283A0 */  lfs       f0, D_8018C2E0@sda21(r0)
/* 090F78 80093F78 D0010044 */  stfs      f0, 0x44(r1)
/* 090F7C 80093F7C C00283C0 */  lfs       f0, D_8018C300@sda21(r0)
/* 090F80 80093F80 EC000732 */  fmuls     f0, f0, f28
/* 090F84 80093F84 EC0006F2 */  fmuls     f0, f0, f27
/* 090F88 80093F88 EC000824 */  fdivs     f0, f0, f1
/* 090F8C 80093F8C D0010050 */  stfs      f0, 0x50(r1)
/* 090F90 80093F90 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 090F94 80093F94 D0010054 */  stfs      f0, 0x54(r1)
/* 090F98 80093F98 80610060 */  lwz       r3, 0x60(r1)
/* 090F9C 80093F9C C04283B0 */  lfs       f2, D_8018C2F0@sda21(r0)
/* 090FA0 80093FA0 39230000 */  addi      r9, r3, 0x0
/* 090FA4 80093FA4 39430020 */  addi      r10, r3, 0x20
lbl_80093FA8:
/* 090FA8 80093FA8 C0250000 */  lfs       f1, 0x0(r5)
/* 090FAC 80093FAC C0050004 */  lfs       f0, 0x4(r5)
/* 090FB0 80093FB0 EC220072 */  fmuls     f1, f2, f1
/* 090FB4 80093FB4 EC020032 */  fmuls     f0, f2, f0
/* 090FB8 80093FB8 FC20081E */  fctiwz    f1, f1
/* 090FBC 80093FBC FC00001E */  fctiwz    f0, f0
/* 090FC0 80093FC0 D8210070 */  stfd      f1, 0x70(r1)
/* 090FC4 80093FC4 D8010068 */  stfd      f0, 0x68(r1)
/* 090FC8 80093FC8 80E10074 */  lwz       r7, 0x74(r1)
/* 090FCC 80093FCC 8101006C */  lwz       r8, 0x6c(r1)
/* 090FD0 80093FD0 54E0801E */  slwi      r0, r7, 16
/* 090FD4 80093FD4 5503843E */  srwi      r3, r8, 16
/* 090FD8 80093FD8 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 090FDC 80093FDC 90690000 */  stw       r3, 0x0(r9)
/* 090FE0 80093FE0 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 090FE4 80093FE4 900A0000 */  stw       r0, 0x0(r10)
/* 090FE8 80093FE8 C0250008 */  lfs       f1, 0x8(r5)
/* 090FEC 80093FEC C005000C */  lfs       f0, 0xc(r5)
/* 090FF0 80093FF0 38A50010 */  addi      r5, r5, 0x10
/* 090FF4 80093FF4 EC220072 */  fmuls     f1, f2, f1
/* 090FF8 80093FF8 EC020032 */  fmuls     f0, f2, f0
/* 090FFC 80093FFC FC20081E */  fctiwz    f1, f1
/* 091000 80094000 FC00001E */  fctiwz    f0, f0
/* 091004 80094004 D8210070 */  stfd      f1, 0x70(r1)
/* 091008 80094008 D8010068 */  stfd      f0, 0x68(r1)
/* 09100C 8009400C 80E10074 */  lwz       r7, 0x74(r1)
/* 091010 80094010 8101006C */  lwz       r8, 0x6c(r1)
/* 091014 80094014 54E0801E */  slwi      r0, r7, 16
/* 091018 80094018 5503843E */  srwi      r3, r8, 16
/* 09101C 8009401C 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 091020 80094020 90690004 */  stw       r3, 0x4(r9)
/* 091024 80094024 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 091028 80094028 39290008 */  addi      r9, r9, 0x8
/* 09102C 8009402C 900A0004 */  stw       r0, 0x4(r10)
/* 091030 80094030 394A0008 */  addi      r10, r10, 0x8
/* 091034 80094034 C0250000 */  lfs       f1, 0x0(r5)
/* 091038 80094038 38C60001 */  addi      r6, r6, 0x1
/* 09103C 8009403C C0050004 */  lfs       f0, 0x4(r5)
/* 091040 80094040 EC220072 */  fmuls     f1, f2, f1
/* 091044 80094044 EC020032 */  fmuls     f0, f2, f0
/* 091048 80094048 FC20081E */  fctiwz    f1, f1
/* 09104C 8009404C FC00001E */  fctiwz    f0, f0
/* 091050 80094050 D8210070 */  stfd      f1, 0x70(r1)
/* 091054 80094054 D8010068 */  stfd      f0, 0x68(r1)
/* 091058 80094058 80E10074 */  lwz       r7, 0x74(r1)
/* 09105C 8009405C 8101006C */  lwz       r8, 0x6c(r1)
/* 091060 80094060 54E0801E */  slwi      r0, r7, 16
/* 091064 80094064 5503843E */  srwi      r3, r8, 16
/* 091068 80094068 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 09106C 8009406C 90690000 */  stw       r3, 0x0(r9)
/* 091070 80094070 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 091074 80094074 900A0000 */  stw       r0, 0x0(r10)
/* 091078 80094078 C0250008 */  lfs       f1, 0x8(r5)
/* 09107C 8009407C C005000C */  lfs       f0, 0xc(r5)
/* 091080 80094080 38A50010 */  addi      r5, r5, 0x10
/* 091084 80094084 EC220072 */  fmuls     f1, f2, f1
/* 091088 80094088 EC020032 */  fmuls     f0, f2, f0
/* 09108C 8009408C FC20081E */  fctiwz    f1, f1
/* 091090 80094090 FC00001E */  fctiwz    f0, f0
/* 091094 80094094 D8210070 */  stfd      f1, 0x70(r1)
/* 091098 80094098 D8010068 */  stfd      f0, 0x68(r1)
/* 09109C 8009409C 80E10074 */  lwz       r7, 0x74(r1)
/* 0910A0 800940A0 8101006C */  lwz       r8, 0x6c(r1)
/* 0910A4 800940A4 54E0801E */  slwi      r0, r7, 16
/* 0910A8 800940A8 5503843E */  srwi      r3, r8, 16
/* 0910AC 800940AC 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 0910B0 800940B0 90690004 */  stw       r3, 0x4(r9)
/* 0910B4 800940B4 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 0910B8 800940B8 39290008 */  addi      r9, r9, 0x8
/* 0910BC 800940BC 900A0004 */  stw       r0, 0x4(r10)
/* 0910C0 800940C0 394A0008 */  addi      r10, r10, 0x8
/* 0910C4 800940C4 4200FEE4 */  bdnz      lbl_80093FA8
/* 0910C8 800940C8 800100AC */  lwz       r0, 0xac(r1)
/* 0910CC 800940CC CBE100A0 */  lfd       f31, 0xa0(r1)
/* 0910D0 800940D0 CBC10098 */  lfd       f30, 0x98(r1)
/* 0910D4 800940D4 7C0803A6 */  mtlr      r0
/* 0910D8 800940D8 CBA10090 */  lfd       f29, 0x90(r1)
/* 0910DC 800940DC CB810088 */  lfd       f28, 0x88(r1)
/* 0910E0 800940E0 CB610080 */  lfd       f27, 0x80(r1)
/* 0910E4 800940E4 83E1007C */  lwz       r31, 0x7c(r1)
/* 0910E8 800940E8 382100A8 */  addi      r1, r1, 0xa8
/* 0910EC 800940EC 4E800020 */  blr

glabel guPerspectiveF
/* 0910F0 800940F0 7C0802A6 */  mflr      r0
/* 0910F4 800940F4 90010004 */  stw       r0, 0x4(r1)
/* 0910F8 800940F8 9421FF98 */  stwu      r1, -0x68(r1)
/* 0910FC 800940FC DBE10060 */  stfd      f31, 0x60(r1)
/* 091100 80094100 3881002C */  addi      r4, r1, 0x2c
/* 091104 80094104 DBC10058 */  stfd      f30, 0x58(r1)
/* 091108 80094108 DBA10050 */  stfd      f29, 0x50(r1)
/* 09110C 8009410C DB810048 */  stfd      f28, 0x48(r1)
/* 091110 80094110 DB610040 */  stfd      f27, 0x40(r1)
/* 091114 80094114 93E1003C */  stw       r31, 0x3c(r1)
/* 091118 80094118 7C7F1B78 */  mr        r31, r3
/* 09111C 8009411C 80A30064 */  lwz       r5, 0x64(r3)
/* 091120 80094120 4BF9FF15 */  bl        cpuGetAddressBuffer
/* 091124 80094124 80BF012C */  lwz       r5, 0x12c(r31)
/* 091128 80094128 387F0000 */  addi      r3, r31, 0x0
/* 09112C 8009412C 38810028 */  addi      r4, r1, 0x28
/* 091130 80094130 4BF9FF05 */  bl        cpuGetAddressBuffer
/* 091134 80094134 80BF006C */  lwz       r5, 0x6c(r31)
/* 091138 80094138 387F0000 */  addi      r3, r31, 0x0
/* 09113C 8009413C 38810030 */  addi      r4, r1, 0x30
/* 091140 80094140 4BF9FEF5 */  bl        cpuGetAddressBuffer
/* 091144 80094144 801F0074 */  lwz       r0, 0x74(r31)
/* 091148 80094148 38800000 */  li        r4, 0x0
/* 09114C 8009414C 38C00000 */  li        r6, 0x0
/* 091150 80094150 90010014 */  stw       r0, 0x14(r1)
/* 091154 80094154 C3A10014 */  lfs       f29, 0x14(r1)
/* 091158 80094158 801F007C */  lwz       r0, 0x7c(r31)
/* 09115C 8009415C FC60E890 */  fmr       f3, f29
/* 091160 80094160 90010014 */  stw       r0, 0x14(r1)
/* 091164 80094164 80610028 */  lwz       r3, 0x28(r1)
/* 091168 80094168 C3810014 */  lfs       f28, 0x14(r1)
/* 09116C 8009416C 80030010 */  lwz       r0, 0x10(r3)
/* 091170 80094170 FC80E090 */  fmr       f4, f28
/* 091174 80094174 90010014 */  stw       r0, 0x14(r1)
/* 091178 80094178 C3610014 */  lfs       f27, 0x14(r1)
/* 09117C 8009417C 80030014 */  lwz       r0, 0x14(r3)
/* 091180 80094180 FC20D890 */  fmr       f1, f27
/* 091184 80094184 90010014 */  stw       r0, 0x14(r1)
/* 091188 80094188 C3E10014 */  lfs       f31, 0x14(r1)
/* 09118C 8009418C 80030018 */  lwz       r0, 0x18(r3)
/* 091190 80094190 FC40F890 */  fmr       f2, f31
/* 091194 80094194 90010014 */  stw       r0, 0x14(r1)
/* 091198 80094198 C0A10014 */  lfs       f5, 0x14(r1)
/* 09119C 8009419C C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 0911A0 800941A0 D0010024 */  stfs      f0, 0x24(r1)
/* 0911A4 800941A4 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 0911A8 800941A8 D001001C */  stfs      f0, 0x1c(r1)
/* 0911AC 800941AC 807F0008 */  lwz       r3, 0x8(r31)
/* 0911B0 800941B0 80BF0064 */  lwz       r5, 0x64(r31)
/* 0911B4 800941B4 80630000 */  lwz       r3, 0x0(r3)
/* 0911B8 800941B8 4BF8921D */  bl        frameSetMatrixHint
/* 0911BC 800941BC 38000004 */  li        r0, 0x4
/* 0911C0 800941C0 80E1001C */  lwz       r7, 0x1c(r1)
/* 0911C4 800941C4 7C0903A6 */  mtctr     r0
/* 0911C8 800941C8 80010024 */  lwz       r0, 0x24(r1)
/* 0911CC 800941CC 39000000 */  li        r8, 0x0
/* 0911D0 800941D0 38C00000 */  li        r6, 0x0
lbl_800941D4:
/* 0911D4 800941D4 38800000 */  li        r4, 0x0
/* 0911D8 800941D8 7C082000 */  cmpw      r8, r4
/* 0911DC 800941DC 54C3103A */  slwi      r3, r6, 2
/* 0911E0 800941E0 40820010 */  bne       lbl_800941F0
/* 0911E4 800941E4 8081002C */  lwz       r4, 0x2c(r1)
/* 0911E8 800941E8 7CE4192E */  stwx      r7, r4, r3
/* 0911EC 800941EC 4800000C */  b         lbl_800941F8
lbl_800941F0:
/* 0911F0 800941F0 8081002C */  lwz       r4, 0x2c(r1)
/* 0911F4 800941F4 7C04192E */  stwx      r0, r4, r3
lbl_800941F8:
/* 0911F8 800941F8 38800001 */  li        r4, 0x1
/* 0911FC 800941FC 7C082000 */  cmpw      r8, r4
/* 091200 80094200 38630004 */  addi      r3, r3, 0x4
/* 091204 80094204 40820010 */  bne       lbl_80094214
/* 091208 80094208 8081002C */  lwz       r4, 0x2c(r1)
/* 09120C 8009420C 7CE4192E */  stwx      r7, r4, r3
/* 091210 80094210 4800000C */  b         lbl_8009421C
lbl_80094214:
/* 091214 80094214 8081002C */  lwz       r4, 0x2c(r1)
/* 091218 80094218 7C04192E */  stwx      r0, r4, r3
lbl_8009421C:
/* 09121C 8009421C 38800002 */  li        r4, 0x2
/* 091220 80094220 7C082000 */  cmpw      r8, r4
/* 091224 80094224 38A60001 */  addi      r5, r6, 0x1
/* 091228 80094228 38630004 */  addi      r3, r3, 0x4
/* 09122C 8009422C 40820010 */  bne       lbl_8009423C
/* 091230 80094230 8081002C */  lwz       r4, 0x2c(r1)
/* 091234 80094234 7CE4192E */  stwx      r7, r4, r3
/* 091238 80094238 4800000C */  b         lbl_80094244
lbl_8009423C:
/* 09123C 8009423C 8081002C */  lwz       r4, 0x2c(r1)
/* 091240 80094240 7C04192E */  stwx      r0, r4, r3
lbl_80094244:
/* 091244 80094244 38800003 */  li        r4, 0x3
/* 091248 80094248 7C082000 */  cmpw      r8, r4
/* 09124C 8009424C 38630004 */  addi      r3, r3, 0x4
/* 091250 80094250 40820010 */  bne       lbl_80094260
/* 091254 80094254 8081002C */  lwz       r4, 0x2c(r1)
/* 091258 80094258 7CE4192E */  stwx      r7, r4, r3
/* 09125C 8009425C 4800000C */  b         lbl_80094268
lbl_80094260:
/* 091260 80094260 8081002C */  lwz       r4, 0x2c(r1)
/* 091264 80094264 7C04192E */  stwx      r0, r4, r3
lbl_80094268:
/* 091268 80094268 38C60004 */  addi      r6, r6, 0x4
/* 09126C 8009426C 39080001 */  addi      r8, r8, 0x1
/* 091270 80094270 4200FF64 */  bdnz      lbl_800941D4
/* 091274 80094274 C02283D0 */  lfs       f1, D_8018C310@sda21(r0)
/* 091278 80094278 C0028378 */  lfs       f0, D_8018C2B8@sda21(r0)
/* 09127C 8009427C EFBD0072 */  fmuls     f29, f29, f1
/* 091280 80094280 EFBD0032 */  fmuls     f29, f29, f0
/* 091284 80094284 FC20E890 */  fmr       f1, f29
/* 091288 80094288 4803CBC1 */  bl        sinf
/* 09128C 8009428C FFC00890 */  fmr       f30, f1
/* 091290 80094290 FC20E890 */  fmr       f1, f29
/* 091294 80094294 4803CA21 */  bl        cosf
/* 091298 80094298 EC41F024 */  fdivs     f2, f1, f30
/* 09129C 8009429C EC02E024 */  fdivs     f0, f2, f28
/* 0912A0 800942A0 D0010014 */  stfs      f0, 0x14(r1)
/* 0912A4 800942A4 EC1BF82A */  fadds     f0, f27, f31
/* 0912A8 800942A8 EC3BF828 */  fsubs     f1, f27, f31
/* 0912AC 800942AC 80010014 */  lwz       r0, 0x14(r1)
/* 0912B0 800942B0 8061002C */  lwz       r3, 0x2c(r1)
/* 0912B4 800942B4 EC000824 */  fdivs     f0, f0, f1
/* 0912B8 800942B8 90030000 */  stw       r0, 0x0(r3)
/* 0912BC 800942BC D0410014 */  stfs      f2, 0x14(r1)
/* 0912C0 800942C0 80010014 */  lwz       r0, 0x14(r1)
/* 0912C4 800942C4 8061002C */  lwz       r3, 0x2c(r1)
/* 0912C8 800942C8 90030014 */  stw       r0, 0x14(r3)
/* 0912CC 800942CC D0010014 */  stfs      f0, 0x14(r1)
/* 0912D0 800942D0 80010014 */  lwz       r0, 0x14(r1)
/* 0912D4 800942D4 8061002C */  lwz       r3, 0x2c(r1)
/* 0912D8 800942D8 90030028 */  stw       r0, 0x28(r3)
/* 0912DC 800942DC C00283A0 */  lfs       f0, D_8018C2E0@sda21(r0)
/* 0912E0 800942E0 D0010014 */  stfs      f0, 0x14(r1)
/* 0912E4 800942E4 80010014 */  lwz       r0, 0x14(r1)
/* 0912E8 800942E8 8061002C */  lwz       r3, 0x2c(r1)
/* 0912EC 800942EC 9003002C */  stw       r0, 0x2c(r3)
/* 0912F0 800942F0 C00283C0 */  lfs       f0, D_8018C300@sda21(r0)
/* 0912F4 800942F4 EC0006F2 */  fmuls     f0, f0, f27
/* 0912F8 800942F8 EC0007F2 */  fmuls     f0, f0, f31
/* 0912FC 800942FC EC000824 */  fdivs     f0, f0, f1
/* 091300 80094300 D0010014 */  stfs      f0, 0x14(r1)
/* 091304 80094304 80010014 */  lwz       r0, 0x14(r1)
/* 091308 80094308 8061002C */  lwz       r3, 0x2c(r1)
/* 09130C 8009430C 90030038 */  stw       r0, 0x38(r3)
/* 091310 80094310 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 091314 80094314 D0010014 */  stfs      f0, 0x14(r1)
/* 091318 80094318 80010014 */  lwz       r0, 0x14(r1)
/* 09131C 8009431C 8061002C */  lwz       r3, 0x2c(r1)
/* 091320 80094320 9003003C */  stw       r0, 0x3c(r3)
/* 091324 80094324 8001006C */  lwz       r0, 0x6c(r1)
/* 091328 80094328 CBE10060 */  lfd       f31, 0x60(r1)
/* 09132C 8009432C CBC10058 */  lfd       f30, 0x58(r1)
/* 091330 80094330 CBA10050 */  lfd       f29, 0x50(r1)
/* 091334 80094334 CB810048 */  lfd       f28, 0x48(r1)
/* 091338 80094338 CB610040 */  lfd       f27, 0x40(r1)
/* 09133C 8009433C 83E1003C */  lwz       r31, 0x3c(r1)
/* 091340 80094340 38210068 */  addi      r1, r1, 0x68
/* 091344 80094344 7C0803A6 */  mtlr      r0
/* 091348 80094348 4E800020 */  blr

glabel guOrtho
/* 09134C 8009434C 7C0802A6 */  mflr      r0
/* 091350 80094350 90010004 */  stw       r0, 0x4(r1)
/* 091354 80094354 9421FF50 */  stwu      r1, -0xb0(r1)
/* 091358 80094358 DBE100A8 */  stfd      f31, 0xa8(r1)
/* 09135C 8009435C 38810060 */  addi      r4, r1, 0x60
/* 091360 80094360 DBC100A0 */  stfd      f30, 0xa0(r1)
/* 091364 80094364 DBA10098 */  stfd      f29, 0x98(r1)
/* 091368 80094368 DB810090 */  stfd      f28, 0x90(r1)
/* 09136C 8009436C DB610088 */  stfd      f27, 0x88(r1)
/* 091370 80094370 DB410080 */  stfd      f26, 0x80(r1)
/* 091374 80094374 93E1007C */  stw       r31, 0x7c(r1)
/* 091378 80094378 7C7F1B78 */  mr        r31, r3
/* 09137C 8009437C 80A30064 */  lwz       r5, 0x64(r3)
/* 091380 80094380 4BF9FCB5 */  bl        cpuGetAddressBuffer
/* 091384 80094384 80BF012C */  lwz       r5, 0x12c(r31)
/* 091388 80094388 387F0000 */  addi      r3, r31, 0x0
/* 09138C 8009438C 38810014 */  addi      r4, r1, 0x14
/* 091390 80094390 4BF9FCA5 */  bl        cpuGetAddressBuffer
/* 091394 80094394 801F006C */  lwz       r0, 0x6c(r31)
/* 091398 80094398 38800001 */  li        r4, 0x1
/* 09139C 8009439C 38A00000 */  li        r5, 0x0
/* 0913A0 800943A0 9001005C */  stw       r0, 0x5c(r1)
/* 0913A4 800943A4 C3E1005C */  lfs       f31, 0x5c(r1)
/* 0913A8 800943A8 801F0074 */  lwz       r0, 0x74(r31)
/* 0913AC 800943AC 9001005C */  stw       r0, 0x5c(r1)
/* 0913B0 800943B0 C3C1005C */  lfs       f30, 0x5c(r1)
/* 0913B4 800943B4 801F007C */  lwz       r0, 0x7c(r31)
/* 0913B8 800943B8 9001005C */  stw       r0, 0x5c(r1)
/* 0913BC 800943BC 80610014 */  lwz       r3, 0x14(r1)
/* 0913C0 800943C0 C3A1005C */  lfs       f29, 0x5c(r1)
/* 0913C4 800943C4 80030010 */  lwz       r0, 0x10(r3)
/* 0913C8 800943C8 9001005C */  stw       r0, 0x5c(r1)
/* 0913CC 800943CC C381005C */  lfs       f28, 0x5c(r1)
/* 0913D0 800943D0 80030014 */  lwz       r0, 0x14(r3)
/* 0913D4 800943D4 9001005C */  stw       r0, 0x5c(r1)
/* 0913D8 800943D8 C361005C */  lfs       f27, 0x5c(r1)
/* 0913DC 800943DC 80030018 */  lwz       r0, 0x18(r3)
/* 0913E0 800943E0 FC20D890 */  fmr       f1, f27
/* 0913E4 800943E4 9001005C */  stw       r0, 0x5c(r1)
/* 0913E8 800943E8 C341005C */  lfs       f26, 0x5c(r1)
/* 0913EC 800943EC 8003001C */  lwz       r0, 0x1c(r3)
/* 0913F0 800943F0 FC40D090 */  fmr       f2, f26
/* 0913F4 800943F4 9001005C */  stw       r0, 0x5c(r1)
/* 0913F8 800943F8 C0628388 */  lfs       f3, D_8018C2C8@sda21(r0)
/* 0913FC 800943FC 807F0008 */  lwz       r3, 0x8(r31)
/* 091400 80094400 FC801890 */  fmr       f4, f3
/* 091404 80094404 C0A1005C */  lfs       f5, 0x5c(r1)
/* 091408 80094408 80DF0064 */  lwz       r6, 0x64(r31)
/* 09140C 8009440C 80630000 */  lwz       r3, 0x0(r3)
/* 091410 80094410 4BF88FC5 */  bl        frameSetMatrixHint
/* 091414 80094414 C0A283A4 */  lfs       f5, D_8018C2E4@sda21(r0)
/* 091418 80094418 EC5EF82A */  fadds     f2, f30, f31
/* 09141C 8009441C EC3CE82A */  fadds     f1, f28, f29
/* 091420 80094420 38000002 */  li        r0, 0x2
/* 091424 80094424 D0A10018 */  stfs      f5, 0x18(r1)
/* 091428 80094428 C0628388 */  lfs       f3, D_8018C2C8@sda21(r0)
/* 09142C 8009442C EC1AD82A */  fadds     f0, f26, f27
/* 091430 80094430 D061001C */  stfs      f3, 0x1c(r1)
/* 091434 80094434 EC9EF828 */  fsubs     f4, f30, f31
/* 091438 80094438 FC401050 */  fneg      f2, f2
/* 09143C 8009443C 7C0903A6 */  mtctr     r0
/* 091440 80094440 D0610020 */  stfs      f3, 0x20(r1)
/* 091444 80094444 ECDCE828 */  fsubs     f6, f28, f29
/* 091448 80094448 FC200850 */  fneg      f1, f1
/* 09144C 8009444C D0610024 */  stfs      f3, 0x24(r1)
/* 091450 80094450 EC422024 */  fdivs     f2, f2, f4
/* 091454 80094454 38A10018 */  addi      r5, r1, 0x18
/* 091458 80094458 D0610028 */  stfs      f3, 0x28(r1)
/* 09145C 8009445C 38C00000 */  li        r6, 0x0
/* 091460 80094460 D0A1002C */  stfs      f5, 0x2c(r1)
/* 091464 80094464 D0610030 */  stfs      f3, 0x30(r1)
/* 091468 80094468 ECFAD828 */  fsubs     f7, f26, f27
/* 09146C 8009446C FC000050 */  fneg      f0, f0
/* 091470 80094470 D0610034 */  stfs      f3, 0x34(r1)
/* 091474 80094474 EC213024 */  fdivs     f1, f1, f6
/* 091478 80094478 D0610038 */  stfs      f3, 0x38(r1)
/* 09147C 8009447C D061003C */  stfs      f3, 0x3c(r1)
/* 091480 80094480 D0A10040 */  stfs      f5, 0x40(r1)
/* 091484 80094484 D0610044 */  stfs      f3, 0x44(r1)
/* 091488 80094488 D0610048 */  stfs      f3, 0x48(r1)
/* 09148C 8009448C EC003824 */  fdivs     f0, f0, f7
/* 091490 80094490 D061004C */  stfs      f3, 0x4c(r1)
/* 091494 80094494 D0610050 */  stfs      f3, 0x50(r1)
/* 091498 80094498 D0A10054 */  stfs      f5, 0x54(r1)
/* 09149C 8009449C C06283C0 */  lfs       f3, D_8018C300@sda21(r0)
/* 0914A0 800944A0 EC832024 */  fdivs     f4, f3, f4
/* 0914A4 800944A4 EC633024 */  fdivs     f3, f3, f6
/* 0914A8 800944A8 D0810018 */  stfs      f4, 0x18(r1)
/* 0914AC 800944AC D061002C */  stfs      f3, 0x2c(r1)
/* 0914B0 800944B0 C06283D4 */  lfs       f3, D_8018C314@sda21(r0)
/* 0914B4 800944B4 EC633824 */  fdivs     f3, f3, f7
/* 0914B8 800944B8 D0610040 */  stfs      f3, 0x40(r1)
/* 0914BC 800944BC D0410048 */  stfs      f2, 0x48(r1)
/* 0914C0 800944C0 D021004C */  stfs      f1, 0x4c(r1)
/* 0914C4 800944C4 D0010050 */  stfs      f0, 0x50(r1)
/* 0914C8 800944C8 D0A10054 */  stfs      f5, 0x54(r1)
/* 0914CC 800944CC 80610060 */  lwz       r3, 0x60(r1)
/* 0914D0 800944D0 C04283B0 */  lfs       f2, D_8018C2F0@sda21(r0)
/* 0914D4 800944D4 39230000 */  addi      r9, r3, 0x0
/* 0914D8 800944D8 39430020 */  addi      r10, r3, 0x20
lbl_800944DC:
/* 0914DC 800944DC C0250000 */  lfs       f1, 0x0(r5)
/* 0914E0 800944E0 C0050004 */  lfs       f0, 0x4(r5)
/* 0914E4 800944E4 EC220072 */  fmuls     f1, f2, f1
/* 0914E8 800944E8 EC020032 */  fmuls     f0, f2, f0
/* 0914EC 800944EC FC20081E */  fctiwz    f1, f1
/* 0914F0 800944F0 FC00001E */  fctiwz    f0, f0
/* 0914F4 800944F4 D8210070 */  stfd      f1, 0x70(r1)
/* 0914F8 800944F8 D8010068 */  stfd      f0, 0x68(r1)
/* 0914FC 800944FC 80E10074 */  lwz       r7, 0x74(r1)
/* 091500 80094500 8101006C */  lwz       r8, 0x6c(r1)
/* 091504 80094504 54E0801E */  slwi      r0, r7, 16
/* 091508 80094508 5503843E */  srwi      r3, r8, 16
/* 09150C 8009450C 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 091510 80094510 90690000 */  stw       r3, 0x0(r9)
/* 091514 80094514 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 091518 80094518 900A0000 */  stw       r0, 0x0(r10)
/* 09151C 8009451C C0250008 */  lfs       f1, 0x8(r5)
/* 091520 80094520 C005000C */  lfs       f0, 0xc(r5)
/* 091524 80094524 38A50010 */  addi      r5, r5, 0x10
/* 091528 80094528 EC220072 */  fmuls     f1, f2, f1
/* 09152C 8009452C EC020032 */  fmuls     f0, f2, f0
/* 091530 80094530 FC20081E */  fctiwz    f1, f1
/* 091534 80094534 FC00001E */  fctiwz    f0, f0
/* 091538 80094538 D8210070 */  stfd      f1, 0x70(r1)
/* 09153C 8009453C D8010068 */  stfd      f0, 0x68(r1)
/* 091540 80094540 80E10074 */  lwz       r7, 0x74(r1)
/* 091544 80094544 8101006C */  lwz       r8, 0x6c(r1)
/* 091548 80094548 54E0801E */  slwi      r0, r7, 16
/* 09154C 8009454C 5503843E */  srwi      r3, r8, 16
/* 091550 80094550 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 091554 80094554 90690004 */  stw       r3, 0x4(r9)
/* 091558 80094558 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 09155C 8009455C 39290008 */  addi      r9, r9, 0x8
/* 091560 80094560 900A0004 */  stw       r0, 0x4(r10)
/* 091564 80094564 394A0008 */  addi      r10, r10, 0x8
/* 091568 80094568 C0250000 */  lfs       f1, 0x0(r5)
/* 09156C 8009456C 38C60001 */  addi      r6, r6, 0x1
/* 091570 80094570 C0050004 */  lfs       f0, 0x4(r5)
/* 091574 80094574 EC220072 */  fmuls     f1, f2, f1
/* 091578 80094578 EC020032 */  fmuls     f0, f2, f0
/* 09157C 8009457C FC20081E */  fctiwz    f1, f1
/* 091580 80094580 FC00001E */  fctiwz    f0, f0
/* 091584 80094584 D8210070 */  stfd      f1, 0x70(r1)
/* 091588 80094588 D8010068 */  stfd      f0, 0x68(r1)
/* 09158C 8009458C 80E10074 */  lwz       r7, 0x74(r1)
/* 091590 80094590 8101006C */  lwz       r8, 0x6c(r1)
/* 091594 80094594 54E0801E */  slwi      r0, r7, 16
/* 091598 80094598 5503843E */  srwi      r3, r8, 16
/* 09159C 8009459C 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 0915A0 800945A0 90690000 */  stw       r3, 0x0(r9)
/* 0915A4 800945A4 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 0915A8 800945A8 900A0000 */  stw       r0, 0x0(r10)
/* 0915AC 800945AC C0250008 */  lfs       f1, 0x8(r5)
/* 0915B0 800945B0 C005000C */  lfs       f0, 0xc(r5)
/* 0915B4 800945B4 38A50010 */  addi      r5, r5, 0x10
/* 0915B8 800945B8 EC220072 */  fmuls     f1, f2, f1
/* 0915BC 800945BC EC020032 */  fmuls     f0, f2, f0
/* 0915C0 800945C0 FC20081E */  fctiwz    f1, f1
/* 0915C4 800945C4 FC00001E */  fctiwz    f0, f0
/* 0915C8 800945C8 D8210070 */  stfd      f1, 0x70(r1)
/* 0915CC 800945CC D8010068 */  stfd      f0, 0x68(r1)
/* 0915D0 800945D0 80E10074 */  lwz       r7, 0x74(r1)
/* 0915D4 800945D4 8101006C */  lwz       r8, 0x6c(r1)
/* 0915D8 800945D8 54E0801E */  slwi      r0, r7, 16
/* 0915DC 800945DC 5503843E */  srwi      r3, r8, 16
/* 0915E0 800945E0 50E3001E */  rlwimi    r3, r7, 0, 0, 15
/* 0915E4 800945E4 90690004 */  stw       r3, 0x4(r9)
/* 0915E8 800945E8 5100043E */  rlwimi    r0, r8, 0, 16, 31
/* 0915EC 800945EC 39290008 */  addi      r9, r9, 0x8
/* 0915F0 800945F0 900A0004 */  stw       r0, 0x4(r10)
/* 0915F4 800945F4 394A0008 */  addi      r10, r10, 0x8
/* 0915F8 800945F8 4200FEE4 */  bdnz      lbl_800944DC
/* 0915FC 800945FC 800100B4 */  lwz       r0, 0xb4(r1)
/* 091600 80094600 CBE100A8 */  lfd       f31, 0xa8(r1)
/* 091604 80094604 CBC100A0 */  lfd       f30, 0xa0(r1)
/* 091608 80094608 7C0803A6 */  mtlr      r0
/* 09160C 8009460C CBA10098 */  lfd       f29, 0x98(r1)
/* 091610 80094610 CB810090 */  lfd       f28, 0x90(r1)
/* 091614 80094614 CB610088 */  lfd       f27, 0x88(r1)
/* 091618 80094618 CB410080 */  lfd       f26, 0x80(r1)
/* 09161C 8009461C 83E1007C */  lwz       r31, 0x7c(r1)
/* 091620 80094620 382100B0 */  addi      r1, r1, 0xb0
/* 091624 80094624 4E800020 */  blr

glabel guOrthoF
/* 091628 80094628 7C0802A6 */  mflr      r0
/* 09162C 8009462C 90010004 */  stw       r0, 0x4(r1)
/* 091630 80094630 9421FF98 */  stwu      r1, -0x68(r1)
/* 091634 80094634 DBE10060 */  stfd      f31, 0x60(r1)
/* 091638 80094638 3881002C */  addi      r4, r1, 0x2c
/* 09163C 8009463C DBC10058 */  stfd      f30, 0x58(r1)
/* 091640 80094640 DBA10050 */  stfd      f29, 0x50(r1)
/* 091644 80094644 DB810048 */  stfd      f28, 0x48(r1)
/* 091648 80094648 DB610040 */  stfd      f27, 0x40(r1)
/* 09164C 8009464C DB410038 */  stfd      f26, 0x38(r1)
/* 091650 80094650 93E10034 */  stw       r31, 0x34(r1)
/* 091654 80094654 7C7F1B78 */  mr        r31, r3
/* 091658 80094658 80A30064 */  lwz       r5, 0x64(r3)
/* 09165C 8009465C 4BF9F9D9 */  bl        cpuGetAddressBuffer
/* 091660 80094660 80BF012C */  lwz       r5, 0x12c(r31)
/* 091664 80094664 387F0000 */  addi      r3, r31, 0x0
/* 091668 80094668 38810028 */  addi      r4, r1, 0x28
/* 09166C 8009466C 4BF9F9C9 */  bl        cpuGetAddressBuffer
/* 091670 80094670 801F006C */  lwz       r0, 0x6c(r31)
/* 091674 80094674 38800001 */  li        r4, 0x1
/* 091678 80094678 38C00000 */  li        r6, 0x0
/* 09167C 8009467C 90010014 */  stw       r0, 0x14(r1)
/* 091680 80094680 C3A10014 */  lfs       f29, 0x14(r1)
/* 091684 80094684 801F0074 */  lwz       r0, 0x74(r31)
/* 091688 80094688 90010014 */  stw       r0, 0x14(r1)
/* 09168C 8009468C C3810014 */  lfs       f28, 0x14(r1)
/* 091690 80094690 801F007C */  lwz       r0, 0x7c(r31)
/* 091694 80094694 90010014 */  stw       r0, 0x14(r1)
/* 091698 80094698 80610028 */  lwz       r3, 0x28(r1)
/* 09169C 8009469C C3610014 */  lfs       f27, 0x14(r1)
/* 0916A0 800946A0 80030010 */  lwz       r0, 0x10(r3)
/* 0916A4 800946A4 90010014 */  stw       r0, 0x14(r1)
/* 0916A8 800946A8 C3410014 */  lfs       f26, 0x14(r1)
/* 0916AC 800946AC 80030014 */  lwz       r0, 0x14(r3)
/* 0916B0 800946B0 90010014 */  stw       r0, 0x14(r1)
/* 0916B4 800946B4 C3E10014 */  lfs       f31, 0x14(r1)
/* 0916B8 800946B8 80030018 */  lwz       r0, 0x18(r3)
/* 0916BC 800946BC FC20F890 */  fmr       f1, f31
/* 0916C0 800946C0 90010014 */  stw       r0, 0x14(r1)
/* 0916C4 800946C4 C3C10014 */  lfs       f30, 0x14(r1)
/* 0916C8 800946C8 8003001C */  lwz       r0, 0x1c(r3)
/* 0916CC 800946CC FC40F090 */  fmr       f2, f30
/* 0916D0 800946D0 90010014 */  stw       r0, 0x14(r1)
/* 0916D4 800946D4 C0628388 */  lfs       f3, D_8018C2C8@sda21(r0)
/* 0916D8 800946D8 C0A10014 */  lfs       f5, 0x14(r1)
/* 0916DC 800946DC FC801890 */  fmr       f4, f3
/* 0916E0 800946E0 D0610024 */  stfs      f3, 0x24(r1)
/* 0916E4 800946E4 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 0916E8 800946E8 D001001C */  stfs      f0, 0x1c(r1)
/* 0916EC 800946EC 807F0008 */  lwz       r3, 0x8(r31)
/* 0916F0 800946F0 80BF0064 */  lwz       r5, 0x64(r31)
/* 0916F4 800946F4 80630000 */  lwz       r3, 0x0(r3)
/* 0916F8 800946F8 4BF88CDD */  bl        frameSetMatrixHint
/* 0916FC 800946FC 38000004 */  li        r0, 0x4
/* 091700 80094700 80E1001C */  lwz       r7, 0x1c(r1)
/* 091704 80094704 7C0903A6 */  mtctr     r0
/* 091708 80094708 80010024 */  lwz       r0, 0x24(r1)
/* 09170C 8009470C 39000000 */  li        r8, 0x0
/* 091710 80094710 38C00000 */  li        r6, 0x0
lbl_80094714:
/* 091714 80094714 38800000 */  li        r4, 0x0
/* 091718 80094718 7C082000 */  cmpw      r8, r4
/* 09171C 8009471C 54C3103A */  slwi      r3, r6, 2
/* 091720 80094720 40820010 */  bne       lbl_80094730
/* 091724 80094724 8081002C */  lwz       r4, 0x2c(r1)
/* 091728 80094728 7CE4192E */  stwx      r7, r4, r3
/* 09172C 8009472C 4800000C */  b         lbl_80094738
lbl_80094730:
/* 091730 80094730 8081002C */  lwz       r4, 0x2c(r1)
/* 091734 80094734 7C04192E */  stwx      r0, r4, r3
lbl_80094738:
/* 091738 80094738 38800001 */  li        r4, 0x1
/* 09173C 8009473C 7C082000 */  cmpw      r8, r4
/* 091740 80094740 38630004 */  addi      r3, r3, 0x4
/* 091744 80094744 40820010 */  bne       lbl_80094754
/* 091748 80094748 8081002C */  lwz       r4, 0x2c(r1)
/* 09174C 8009474C 7CE4192E */  stwx      r7, r4, r3
/* 091750 80094750 4800000C */  b         lbl_8009475C
lbl_80094754:
/* 091754 80094754 8081002C */  lwz       r4, 0x2c(r1)
/* 091758 80094758 7C04192E */  stwx      r0, r4, r3
lbl_8009475C:
/* 09175C 8009475C 38800002 */  li        r4, 0x2
/* 091760 80094760 7C082000 */  cmpw      r8, r4
/* 091764 80094764 38A60001 */  addi      r5, r6, 0x1
/* 091768 80094768 38630004 */  addi      r3, r3, 0x4
/* 09176C 8009476C 40820010 */  bne       lbl_8009477C
/* 091770 80094770 8081002C */  lwz       r4, 0x2c(r1)
/* 091774 80094774 7CE4192E */  stwx      r7, r4, r3
/* 091778 80094778 4800000C */  b         lbl_80094784
lbl_8009477C:
/* 09177C 8009477C 8081002C */  lwz       r4, 0x2c(r1)
/* 091780 80094780 7C04192E */  stwx      r0, r4, r3
lbl_80094784:
/* 091784 80094784 38800003 */  li        r4, 0x3
/* 091788 80094788 7C082000 */  cmpw      r8, r4
/* 09178C 8009478C 38630004 */  addi      r3, r3, 0x4
/* 091790 80094790 40820010 */  bne       lbl_800947A0
/* 091794 80094794 8081002C */  lwz       r4, 0x2c(r1)
/* 091798 80094798 7CE4192E */  stwx      r7, r4, r3
/* 09179C 8009479C 4800000C */  b         lbl_800947A8
lbl_800947A0:
/* 0917A0 800947A0 8081002C */  lwz       r4, 0x2c(r1)
/* 0917A4 800947A4 7C04192E */  stwx      r0, r4, r3
lbl_800947A8:
/* 0917A8 800947A8 38C60004 */  addi      r6, r6, 0x4
/* 0917AC 800947AC 39080001 */  addi      r8, r8, 0x1
/* 0917B0 800947B0 4200FF64 */  bdnz      lbl_80094714
/* 0917B4 800947B4 EC7CE828 */  fsubs     f3, f28, f29
/* 0917B8 800947B8 C04283C0 */  lfs       f2, D_8018C300@sda21(r0)
/* 0917BC 800947BC EC9AD828 */  fsubs     f4, f26, f27
/* 0917C0 800947C0 EC1CE82A */  fadds     f0, f28, f29
/* 0917C4 800947C4 EC221824 */  fdivs     f1, f2, f3
/* 0917C8 800947C8 D0210014 */  stfs      f1, 0x14(r1)
/* 0917CC 800947CC EC222024 */  fdivs     f1, f2, f4
/* 0917D0 800947D0 80010014 */  lwz       r0, 0x14(r1)
/* 0917D4 800947D4 8061002C */  lwz       r3, 0x2c(r1)
/* 0917D8 800947D8 90030000 */  stw       r0, 0x0(r3)
/* 0917DC 800947DC D0210014 */  stfs      f1, 0x14(r1)
/* 0917E0 800947E0 FC400050 */  fneg      f2, f0
/* 0917E4 800947E4 EC1AD82A */  fadds     f0, f26, f27
/* 0917E8 800947E8 80010014 */  lwz       r0, 0x14(r1)
/* 0917EC 800947EC 8061002C */  lwz       r3, 0x2c(r1)
/* 0917F0 800947F0 ECBEF828 */  fsubs     f5, f30, f31
/* 0917F4 800947F4 90030014 */  stw       r0, 0x14(r3)
/* 0917F8 800947F8 FC200050 */  fneg      f1, f0
/* 0917FC 800947FC C00283D4 */  lfs       f0, D_8018C314@sda21(r0)
/* 091800 80094800 EC421824 */  fdivs     f2, f2, f3
/* 091804 80094804 EC002824 */  fdivs     f0, f0, f5
/* 091808 80094808 D0010014 */  stfs      f0, 0x14(r1)
/* 09180C 8009480C EC1EF82A */  fadds     f0, f30, f31
/* 091810 80094810 EC212024 */  fdivs     f1, f1, f4
/* 091814 80094814 80010014 */  lwz       r0, 0x14(r1)
/* 091818 80094818 8061002C */  lwz       r3, 0x2c(r1)
/* 09181C 8009481C 90030028 */  stw       r0, 0x28(r3)
/* 091820 80094820 D0410014 */  stfs      f2, 0x14(r1)
/* 091824 80094824 FC000050 */  fneg      f0, f0
/* 091828 80094828 80010014 */  lwz       r0, 0x14(r1)
/* 09182C 8009482C 8061002C */  lwz       r3, 0x2c(r1)
/* 091830 80094830 90030030 */  stw       r0, 0x30(r3)
/* 091834 80094834 EC002824 */  fdivs     f0, f0, f5
/* 091838 80094838 D0210014 */  stfs      f1, 0x14(r1)
/* 09183C 8009483C 80010014 */  lwz       r0, 0x14(r1)
/* 091840 80094840 8061002C */  lwz       r3, 0x2c(r1)
/* 091844 80094844 90030034 */  stw       r0, 0x34(r3)
/* 091848 80094848 D0010014 */  stfs      f0, 0x14(r1)
/* 09184C 8009484C 80010014 */  lwz       r0, 0x14(r1)
/* 091850 80094850 8061002C */  lwz       r3, 0x2c(r1)
/* 091854 80094854 90030038 */  stw       r0, 0x38(r3)
/* 091858 80094858 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 09185C 8009485C D0010014 */  stfs      f0, 0x14(r1)
/* 091860 80094860 80010014 */  lwz       r0, 0x14(r1)
/* 091864 80094864 8061002C */  lwz       r3, 0x2c(r1)
/* 091868 80094868 9003003C */  stw       r0, 0x3c(r3)
/* 09186C 8009486C 8001006C */  lwz       r0, 0x6c(r1)
/* 091870 80094870 CBE10060 */  lfd       f31, 0x60(r1)
/* 091874 80094874 CBC10058 */  lfd       f30, 0x58(r1)
/* 091878 80094878 CBA10050 */  lfd       f29, 0x50(r1)
/* 09187C 8009487C CB810048 */  lfd       f28, 0x48(r1)
/* 091880 80094880 CB610040 */  lfd       f27, 0x40(r1)
/* 091884 80094884 CB410038 */  lfd       f26, 0x38(r1)
/* 091888 80094888 83E10034 */  lwz       r31, 0x34(r1)
/* 09188C 8009488C 38210068 */  addi      r1, r1, 0x68
/* 091890 80094890 7C0803A6 */  mtlr      r0
/* 091894 80094894 4E800020 */  blr

glabel guMtxIdent
/* 091898 80094898 7C0802A6 */  mflr      r0
/* 09189C 8009489C 90010004 */  stw       r0, 0x4(r1)
/* 0918A0 800948A0 9421FFF0 */  stwu      r1, -0x10(r1)
/* 0918A4 800948A4 80A30064 */  lwz       r5, 0x64(r3)
/* 0918A8 800948A8 3881000C */  addi      r4, r1, 0xc
/* 0918AC 800948AC 4BF9F789 */  bl        cpuGetAddressBuffer
/* 0918B0 800948B0 8061000C */  lwz       r3, 0xc(r1)
/* 0918B4 800948B4 3CA00001 */  lis       r5, 0x1
/* 0918B8 800948B8 38800000 */  li        r4, 0x0
/* 0918BC 800948BC 90A30000 */  stw       r5, 0x0(r3)
/* 0918C0 800948C0 38000001 */  li        r0, 0x1
/* 0918C4 800948C4 8061000C */  lwz       r3, 0xc(r1)
/* 0918C8 800948C8 90830004 */  stw       r4, 0x4(r3)
/* 0918CC 800948CC 8061000C */  lwz       r3, 0xc(r1)
/* 0918D0 800948D0 90030008 */  stw       r0, 0x8(r3)
/* 0918D4 800948D4 8061000C */  lwz       r3, 0xc(r1)
/* 0918D8 800948D8 9083000C */  stw       r4, 0xc(r3)
/* 0918DC 800948DC 8061000C */  lwz       r3, 0xc(r1)
/* 0918E0 800948E0 90830010 */  stw       r4, 0x10(r3)
/* 0918E4 800948E4 8061000C */  lwz       r3, 0xc(r1)
/* 0918E8 800948E8 90A30014 */  stw       r5, 0x14(r3)
/* 0918EC 800948EC 8061000C */  lwz       r3, 0xc(r1)
/* 0918F0 800948F0 90830018 */  stw       r4, 0x18(r3)
/* 0918F4 800948F4 8061000C */  lwz       r3, 0xc(r1)
/* 0918F8 800948F8 9003001C */  stw       r0, 0x1c(r3)
/* 0918FC 800948FC 8061000C */  lwz       r3, 0xc(r1)
/* 091900 80094900 90830020 */  stw       r4, 0x20(r3)
/* 091904 80094904 8061000C */  lwz       r3, 0xc(r1)
/* 091908 80094908 90830024 */  stw       r4, 0x24(r3)
/* 09190C 8009490C 8061000C */  lwz       r3, 0xc(r1)
/* 091910 80094910 90830028 */  stw       r4, 0x28(r3)
/* 091914 80094914 8061000C */  lwz       r3, 0xc(r1)
/* 091918 80094918 9083002C */  stw       r4, 0x2c(r3)
/* 09191C 8009491C 8061000C */  lwz       r3, 0xc(r1)
/* 091920 80094920 90830030 */  stw       r4, 0x30(r3)
/* 091924 80094924 8061000C */  lwz       r3, 0xc(r1)
/* 091928 80094928 90830034 */  stw       r4, 0x34(r3)
/* 09192C 8009492C 8061000C */  lwz       r3, 0xc(r1)
/* 091930 80094930 90830038 */  stw       r4, 0x38(r3)
/* 091934 80094934 8061000C */  lwz       r3, 0xc(r1)
/* 091938 80094938 9083003C */  stw       r4, 0x3c(r3)
/* 09193C 8009493C 80010014 */  lwz       r0, 0x14(r1)
/* 091940 80094940 38210010 */  addi      r1, r1, 0x10
/* 091944 80094944 7C0803A6 */  mtlr      r0
/* 091948 80094948 4E800020 */  blr

glabel guMtxIdentF
/* 09194C 8009494C 7C0802A6 */  mflr      r0
/* 091950 80094950 90010004 */  stw       r0, 0x4(r1)
/* 091954 80094954 9421FFD8 */  stwu      r1, -0x28(r1)
/* 091958 80094958 C0028388 */  lfs       f0, D_8018C2C8@sda21(r0)
/* 09195C 8009495C 38810020 */  addi      r4, r1, 0x20
/* 091960 80094960 D0010014 */  stfs      f0, 0x14(r1)
/* 091964 80094964 C00283A4 */  lfs       f0, D_8018C2E4@sda21(r0)
/* 091968 80094968 D001001C */  stfs      f0, 0x1c(r1)
/* 09196C 8009496C 80A30064 */  lwz       r5, 0x64(r3)
/* 091970 80094970 4BF9F6C5 */  bl        cpuGetAddressBuffer
/* 091974 80094974 38000004 */  li        r0, 0x4
/* 091978 80094978 C001001C */  lfs       f0, 0x1c(r1)
/* 09197C 8009497C 7C0903A6 */  mtctr     r0
/* 091980 80094980 C0210014 */  lfs       f1, 0x14(r1)
/* 091984 80094984 80810020 */  lwz       r4, 0x20(r1)
/* 091988 80094988 38E00000 */  li        r7, 0x0
/* 09198C 8009498C 38C00000 */  li        r6, 0x0
lbl_80094990:
/* 091990 80094990 38000000 */  li        r0, 0x0
/* 091994 80094994 7C070000 */  cmpw      r7, r0
/* 091998 80094998 54C3103A */  slwi      r3, r6, 2
/* 09199C 8009499C 4082000C */  bne       lbl_800949A8
/* 0919A0 800949A0 7C041D2E */  stfsx     f0, r4, r3
/* 0919A4 800949A4 48000008 */  b         lbl_800949AC
lbl_800949A8:
/* 0919A8 800949A8 7C241D2E */  stfsx     f1, r4, r3
lbl_800949AC:
/* 0919AC 800949AC 38000001 */  li        r0, 0x1
/* 0919B0 800949B0 7C070000 */  cmpw      r7, r0
/* 0919B4 800949B4 38630004 */  addi      r3, r3, 0x4
/* 0919B8 800949B8 4082000C */  bne       lbl_800949C4
/* 0919BC 800949BC 7C041D2E */  stfsx     f0, r4, r3
/* 0919C0 800949C0 48000008 */  b         lbl_800949C8
lbl_800949C4:
/* 0919C4 800949C4 7C241D2E */  stfsx     f1, r4, r3
lbl_800949C8:
/* 0919C8 800949C8 38000002 */  li        r0, 0x2
/* 0919CC 800949CC 7C070000 */  cmpw      r7, r0
/* 0919D0 800949D0 38A60001 */  addi      r5, r6, 0x1
/* 0919D4 800949D4 38630004 */  addi      r3, r3, 0x4
/* 0919D8 800949D8 4082000C */  bne       lbl_800949E4
/* 0919DC 800949DC 7C041D2E */  stfsx     f0, r4, r3
/* 0919E0 800949E0 48000008 */  b         lbl_800949E8
lbl_800949E4:
/* 0919E4 800949E4 7C241D2E */  stfsx     f1, r4, r3
lbl_800949E8:
/* 0919E8 800949E8 38000003 */  li        r0, 0x3
/* 0919EC 800949EC 7C070000 */  cmpw      r7, r0
/* 0919F0 800949F0 38630004 */  addi      r3, r3, 0x4
/* 0919F4 800949F4 4082000C */  bne       lbl_80094A00
/* 0919F8 800949F8 7C041D2E */  stfsx     f0, r4, r3
/* 0919FC 800949FC 48000008 */  b         lbl_80094A04
lbl_80094A00:
/* 091A00 80094A00 7C241D2E */  stfsx     f1, r4, r3
lbl_80094A04:
/* 091A04 80094A04 38C60004 */  addi      r6, r6, 0x4
/* 091A08 80094A08 38E70001 */  addi      r7, r7, 0x1
/* 091A0C 80094A0C 4200FF84 */  bdnz      lbl_80094990
/* 091A10 80094A10 8001002C */  lwz       r0, 0x2c(r1)
/* 091A14 80094A14 38210028 */  addi      r1, r1, 0x28
/* 091A18 80094A18 7C0803A6 */  mtlr      r0
/* 091A1C 80094A1C 4E800020 */  blr

glabel guMtxF2L
/* 091A20 80094A20 7C0802A6 */  mflr      r0
/* 091A24 80094A24 90010004 */  stw       r0, 0x4(r1)
/* 091A28 80094A28 9421FFC0 */  stwu      r1, -0x40(r1)
/* 091A2C 80094A2C 93E1003C */  stw       r31, 0x3c(r1)
/* 091A30 80094A30 7C7F1B78 */  mr        r31, r3
/* 091A34 80094A34 38810024 */  addi      r4, r1, 0x24
/* 091A38 80094A38 80A30064 */  lwz       r5, 0x64(r3)
/* 091A3C 80094A3C 4BF9F5F9 */  bl        cpuGetAddressBuffer
/* 091A40 80094A40 80BF006C */  lwz       r5, 0x6c(r31)
/* 091A44 80094A44 387F0000 */  addi      r3, r31, 0x0
/* 091A48 80094A48 38810020 */  addi      r4, r1, 0x20
/* 091A4C 80094A4C 4BF9F5E9 */  bl        cpuGetAddressBuffer
/* 091A50 80094A50 807F0008 */  lwz       r3, 0x8(r31)
/* 091A54 80094A54 809F0064 */  lwz       r4, 0x64(r31)
/* 091A58 80094A58 80630000 */  lwz       r3, 0x0(r3)
/* 091A5C 80094A5C 80BF006C */  lwz       r5, 0x6c(r31)
/* 091A60 80094A60 4BF88A91 */  bl        frameFixMatrixHint
/* 091A64 80094A64 80610020 */  lwz       r3, 0x20(r1)
/* 091A68 80094A68 38000002 */  li        r0, 0x2
/* 091A6C 80094A6C 7C0903A6 */  mtctr     r0
/* 091A70 80094A70 C04283B0 */  lfs       f2, D_8018C2F0@sda21(r0)
/* 091A74 80094A74 39230000 */  addi      r9, r3, 0x0
/* 091A78 80094A78 39430020 */  addi      r10, r3, 0x20
/* 091A7C 80094A7C 39000000 */  li        r8, 0x0
/* 091A80 80094A80 38A00000 */  li        r5, 0x0
lbl_80094A84:
/* 091A84 80094A84 80010024 */  lwz       r0, 0x24(r1)
/* 091A88 80094A88 54A3103A */  slwi      r3, r5, 2
/* 091A8C 80094A8C 38A50004 */  addi      r5, r5, 0x4
/* 091A90 80094A90 7C801A14 */  add       r4, r0, r3
/* 091A94 80094A94 C0040000 */  lfs       f0, 0x0(r4)
/* 091A98 80094A98 38630008 */  addi      r3, r3, 0x8
/* 091A9C 80094A9C D001001C */  stfs      f0, 0x1c(r1)
/* 091AA0 80094AA0 C021001C */  lfs       f1, 0x1c(r1)
/* 091AA4 80094AA4 C0040004 */  lfs       f0, 0x4(r4)
/* 091AA8 80094AA8 EC220072 */  fmuls     f1, f2, f1
/* 091AAC 80094AAC D001001C */  stfs      f0, 0x1c(r1)
/* 091AB0 80094AB0 C001001C */  lfs       f0, 0x1c(r1)
/* 091AB4 80094AB4 FC20081E */  fctiwz    f1, f1
/* 091AB8 80094AB8 EC020032 */  fmuls     f0, f2, f0
/* 091ABC 80094ABC D8210030 */  stfd      f1, 0x30(r1)
/* 091AC0 80094AC0 FC00001E */  fctiwz    f0, f0
/* 091AC4 80094AC4 80C10034 */  lwz       r6, 0x34(r1)
/* 091AC8 80094AC8 54C0801E */  slwi      r0, r6, 16
/* 091ACC 80094ACC D8010028 */  stfd      f0, 0x28(r1)
/* 091AD0 80094AD0 80E1002C */  lwz       r7, 0x2c(r1)
/* 091AD4 80094AD4 54E4843E */  srwi      r4, r7, 16
/* 091AD8 80094AD8 50C4001E */  rlwimi    r4, r6, 0, 0, 15
/* 091ADC 80094ADC 90890000 */  stw       r4, 0x0(r9)
/* 091AE0 80094AE0 50E0043E */  rlwimi    r0, r7, 0, 16, 31
/* 091AE4 80094AE4 900A0000 */  stw       r0, 0x0(r10)
/* 091AE8 80094AE8 80010024 */  lwz       r0, 0x24(r1)
/* 091AEC 80094AEC 7C801A14 */  add       r4, r0, r3
/* 091AF0 80094AF0 C0040000 */  lfs       f0, 0x0(r4)
/* 091AF4 80094AF4 D001001C */  stfs      f0, 0x1c(r1)
/* 091AF8 80094AF8 C021001C */  lfs       f1, 0x1c(r1)
/* 091AFC 80094AFC C0040004 */  lfs       f0, 0x4(r4)
/* 091B00 80094B00 EC220072 */  fmuls     f1, f2, f1
/* 091B04 80094B04 D001001C */  stfs      f0, 0x1c(r1)
/* 091B08 80094B08 C001001C */  lfs       f0, 0x1c(r1)
/* 091B0C 80094B0C FC20081E */  fctiwz    f1, f1
/* 091B10 80094B10 EC020032 */  fmuls     f0, f2, f0
/* 091B14 80094B14 D8210030 */  stfd      f1, 0x30(r1)
/* 091B18 80094B18 FC00001E */  fctiwz    f0, f0
/* 091B1C 80094B1C 80C10034 */  lwz       r6, 0x34(r1)
/* 091B20 80094B20 54C0801E */  slwi      r0, r6, 16
/* 091B24 80094B24 D8010028 */  stfd      f0, 0x28(r1)
/* 091B28 80094B28 80E1002C */  lwz       r7, 0x2c(r1)
/* 091B2C 80094B2C 54E4843E */  srwi      r4, r7, 16
/* 091B30 80094B30 50C4001E */  rlwimi    r4, r6, 0, 0, 15
/* 091B34 80094B34 90890004 */  stw       r4, 0x4(r9)
/* 091B38 80094B38 50E0043E */  rlwimi    r0, r7, 0, 16, 31
/* 091B3C 80094B3C 39290008 */  addi      r9, r9, 0x8
/* 091B40 80094B40 900A0004 */  stw       r0, 0x4(r10)
/* 091B44 80094B44 394A0008 */  addi      r10, r10, 0x8
/* 091B48 80094B48 54A3103A */  slwi      r3, r5, 2
/* 091B4C 80094B4C 80010024 */  lwz       r0, 0x24(r1)
/* 091B50 80094B50 39080001 */  addi      r8, r8, 0x1
/* 091B54 80094B54 38A50004 */  addi      r5, r5, 0x4
/* 091B58 80094B58 7C801A14 */  add       r4, r0, r3
/* 091B5C 80094B5C C0040000 */  lfs       f0, 0x0(r4)
/* 091B60 80094B60 38630008 */  addi      r3, r3, 0x8
/* 091B64 80094B64 D001001C */  stfs      f0, 0x1c(r1)
/* 091B68 80094B68 C021001C */  lfs       f1, 0x1c(r1)
/* 091B6C 80094B6C C0040004 */  lfs       f0, 0x4(r4)
/* 091B70 80094B70 EC220072 */  fmuls     f1, f2, f1
/* 091B74 80094B74 D001001C */  stfs      f0, 0x1c(r1)
/* 091B78 80094B78 C001001C */  lfs       f0, 0x1c(r1)
/* 091B7C 80094B7C FC20081E */  fctiwz    f1, f1
/* 091B80 80094B80 EC020032 */  fmuls     f0, f2, f0
/* 091B84 80094B84 D8210030 */  stfd      f1, 0x30(r1)
/* 091B88 80094B88 FC00001E */  fctiwz    f0, f0
/* 091B8C 80094B8C 80C10034 */  lwz       r6, 0x34(r1)
/* 091B90 80094B90 54C0801E */  slwi      r0, r6, 16
/* 091B94 80094B94 D8010028 */  stfd      f0, 0x28(r1)
/* 091B98 80094B98 80E1002C */  lwz       r7, 0x2c(r1)
/* 091B9C 80094B9C 54E4843E */  srwi      r4, r7, 16
/* 091BA0 80094BA0 50C4001E */  rlwimi    r4, r6, 0, 0, 15
/* 091BA4 80094BA4 90890000 */  stw       r4, 0x0(r9)
/* 091BA8 80094BA8 50E0043E */  rlwimi    r0, r7, 0, 16, 31
/* 091BAC 80094BAC 900A0000 */  stw       r0, 0x0(r10)
/* 091BB0 80094BB0 80010024 */  lwz       r0, 0x24(r1)
/* 091BB4 80094BB4 7C801A14 */  add       r4, r0, r3
/* 091BB8 80094BB8 C0040000 */  lfs       f0, 0x0(r4)
/* 091BBC 80094BBC D001001C */  stfs      f0, 0x1c(r1)
/* 091BC0 80094BC0 C021001C */  lfs       f1, 0x1c(r1)
/* 091BC4 80094BC4 C0040004 */  lfs       f0, 0x4(r4)
/* 091BC8 80094BC8 EC220072 */  fmuls     f1, f2, f1
/* 091BCC 80094BCC D001001C */  stfs      f0, 0x1c(r1)
/* 091BD0 80094BD0 C001001C */  lfs       f0, 0x1c(r1)
/* 091BD4 80094BD4 FC20081E */  fctiwz    f1, f1
/* 091BD8 80094BD8 EC020032 */  fmuls     f0, f2, f0
/* 091BDC 80094BDC D8210030 */  stfd      f1, 0x30(r1)
/* 091BE0 80094BE0 FC00001E */  fctiwz    f0, f0
/* 091BE4 80094BE4 80C10034 */  lwz       r6, 0x34(r1)
/* 091BE8 80094BE8 54C0801E */  slwi      r0, r6, 16
/* 091BEC 80094BEC D8010028 */  stfd      f0, 0x28(r1)
/* 091BF0 80094BF0 80E1002C */  lwz       r7, 0x2c(r1)
/* 091BF4 80094BF4 54E4843E */  srwi      r4, r7, 16
/* 091BF8 80094BF8 50C4001E */  rlwimi    r4, r6, 0, 0, 15
/* 091BFC 80094BFC 90890004 */  stw       r4, 0x4(r9)
/* 091C00 80094C00 50E0043E */  rlwimi    r0, r7, 0, 16, 31
/* 091C04 80094C04 39290008 */  addi      r9, r9, 0x8
/* 091C08 80094C08 900A0004 */  stw       r0, 0x4(r10)
/* 091C0C 80094C0C 394A0008 */  addi      r10, r10, 0x8
/* 091C10 80094C10 4200FE74 */  bdnz      lbl_80094A84
/* 091C14 80094C14 80010044 */  lwz       r0, 0x44(r1)
/* 091C18 80094C18 83E1003C */  lwz       r31, 0x3c(r1)
/* 091C1C 80094C1C 38210040 */  addi      r1, r1, 0x40
/* 091C20 80094C20 7C0803A6 */  mtlr      r0
/* 091C24 80094C24 4E800020 */  blr

glabel guMtxCatF
/* 091C28 80094C28 7C0802A6 */  mflr      r0
/* 091C2C 80094C2C 90010004 */  stw       r0, 0x4(r1)
/* 091C30 80094C30 9421FF58 */  stwu      r1, -0xa8(r1)
/* 091C34 80094C34 BEE10084 */  stmw      r23, 0x84(r1)
/* 091C38 80094C38 7C771B78 */  mr        r23, r3
/* 091C3C 80094C3C 38810024 */  addi      r4, r1, 0x24
/* 091C40 80094C40 80A30064 */  lwz       r5, 0x64(r3)
/* 091C44 80094C44 4BF9F3F1 */  bl        cpuGetAddressBuffer
/* 091C48 80094C48 80B7006C */  lwz       r5, 0x6c(r23)
/* 091C4C 80094C4C 38770000 */  addi      r3, r23, 0x0
/* 091C50 80094C50 38810020 */  addi      r4, r1, 0x20
/* 091C54 80094C54 4BF9F3E1 */  bl        cpuGetAddressBuffer
/* 091C58 80094C58 80B70074 */  lwz       r5, 0x74(r23)
/* 091C5C 80094C5C 38770000 */  addi      r3, r23, 0x0
/* 091C60 80094C60 3881001C */  addi      r4, r1, 0x1c
/* 091C64 80094C64 4BF9F3D1 */  bl        cpuGetAddressBuffer
/* 091C68 80094C68 39010038 */  addi      r8, r1, 0x38
/* 091C6C 80094C6C C0628388 */  lfs       f3, D_8018C2C8@sda21(r0)
/* 091C70 80094C70 38C80000 */  addi      r6, r8, 0x0
/* 091C74 80094C74 39200000 */  li        r9, 0x0
/* 091C78 80094C78 38E00000 */  li        r7, 0x0
/* 091C7C 80094C7C 39400000 */  li        r10, 0x0
lbl_80094C80:
/* 091C80 80094C80 38000002 */  li        r0, 0x2
/* 091C84 80094C84 80810024 */  lwz       r4, 0x24(r1)
/* 091C88 80094C88 39870001 */  addi      r12, r7, 0x1
/* 091C8C 80094C8C 7C0903A6 */  mtctr     r0
/* 091C90 80094C90 39670002 */  addi      r11, r7, 0x2
/* 091C94 80094C94 80A10020 */  lwz       r5, 0x20(r1)
/* 091C98 80094C98 38070003 */  addi      r0, r7, 0x3
/* 091C9C 80094C9C 38660000 */  addi      r3, r6, 0x0
/* 091CA0 80094CA0 5598103A */  slwi      r24, r12, 2
/* 091CA4 80094CA4 557B103A */  slwi      r27, r11, 2
/* 091CA8 80094CA8 541E103A */  slwi      r30, r0, 2
/* 091CAC 80094CAC 3AE00000 */  li        r23, 0x0
/* 091CB0 80094CB0 39600000 */  li        r11, 0x0
lbl_80094CB4:
/* 091CB4 80094CB4 D0630000 */  stfs      f3, 0x0(r3)
/* 091CB8 80094CB8 3B370004 */  addi      r25, r23, 0x4
/* 091CBC 80094CBC 573A103A */  slwi      r26, r25, 2
/* 091CC0 80094CC0 7C04502E */  lwzx      r0, r4, r10
/* 091CC4 80094CC4 3B970008 */  addi      r28, r23, 0x8
/* 091CC8 80094CC8 579D103A */  slwi      r29, r28, 2
/* 091CCC 80094CCC 90010034 */  stw       r0, 0x34(r1)
/* 091CD0 80094CD0 3BF7000C */  addi      r31, r23, 0xc
/* 091CD4 80094CD4 57EC103A */  slwi      r12, r31, 2
/* 091CD8 80094CD8 7C05582E */  lwzx      r0, r5, r11
/* 091CDC 80094CDC 396B0004 */  addi      r11, r11, 0x4
/* 091CE0 80094CE0 3B370005 */  addi      r25, r23, 0x5
/* 091CE4 80094CE4 9001002C */  stw       r0, 0x2c(r1)
/* 091CE8 80094CE8 3B970009 */  addi      r28, r23, 0x9
/* 091CEC 80094CEC 3BF7000D */  addi      r31, r23, 0xd
/* 091CF0 80094CF0 C0410034 */  lfs       f2, 0x34(r1)
/* 091CF4 80094CF4 3AF70002 */  addi      r23, r23, 0x2
/* 091CF8 80094CF8 C021002C */  lfs       f1, 0x2c(r1)
/* 091CFC 80094CFC C0030000 */  lfs       f0, 0x0(r3)
/* 091D00 80094D00 EC02007A */  fmadds    f0, f2, f1, f0
/* 091D04 80094D04 D0030000 */  stfs      f0, 0x0(r3)
/* 091D08 80094D08 7C04C02E */  lwzx      r0, r4, r24
/* 091D0C 80094D0C 90010034 */  stw       r0, 0x34(r1)
/* 091D10 80094D10 7C05D02E */  lwzx      r0, r5, r26
/* 091D14 80094D14 573A103A */  slwi      r26, r25, 2
/* 091D18 80094D18 9001002C */  stw       r0, 0x2c(r1)
/* 091D1C 80094D1C C0410034 */  lfs       f2, 0x34(r1)
/* 091D20 80094D20 C021002C */  lfs       f1, 0x2c(r1)
/* 091D24 80094D24 C0030000 */  lfs       f0, 0x0(r3)
/* 091D28 80094D28 EC02007A */  fmadds    f0, f2, f1, f0
/* 091D2C 80094D2C D0030000 */  stfs      f0, 0x0(r3)
/* 091D30 80094D30 7C04D82E */  lwzx      r0, r4, r27
/* 091D34 80094D34 90010034 */  stw       r0, 0x34(r1)
/* 091D38 80094D38 7C05E82E */  lwzx      r0, r5, r29
/* 091D3C 80094D3C 579D103A */  slwi      r29, r28, 2
/* 091D40 80094D40 9001002C */  stw       r0, 0x2c(r1)
/* 091D44 80094D44 C0410034 */  lfs       f2, 0x34(r1)
/* 091D48 80094D48 C021002C */  lfs       f1, 0x2c(r1)
/* 091D4C 80094D4C C0030000 */  lfs       f0, 0x0(r3)
/* 091D50 80094D50 EC02007A */  fmadds    f0, f2, f1, f0
/* 091D54 80094D54 D0030000 */  stfs      f0, 0x0(r3)
/* 091D58 80094D58 7C04F02E */  lwzx      r0, r4, r30
/* 091D5C 80094D5C 90010034 */  stw       r0, 0x34(r1)
/* 091D60 80094D60 7C05602E */  lwzx      r0, r5, r12
/* 091D64 80094D64 57EC103A */  slwi      r12, r31, 2
/* 091D68 80094D68 9001002C */  stw       r0, 0x2c(r1)
/* 091D6C 80094D6C C0410034 */  lfs       f2, 0x34(r1)
/* 091D70 80094D70 C021002C */  lfs       f1, 0x2c(r1)
/* 091D74 80094D74 C0030000 */  lfs       f0, 0x0(r3)
/* 091D78 80094D78 EC02007A */  fmadds    f0, f2, f1, f0
/* 091D7C 80094D7C D0030000 */  stfs      f0, 0x0(r3)
/* 091D80 80094D80 D0630004 */  stfs      f3, 0x4(r3)
/* 091D84 80094D84 7C04502E */  lwzx      r0, r4, r10
/* 091D88 80094D88 90010034 */  stw       r0, 0x34(r1)
/* 091D8C 80094D8C 7C05582E */  lwzx      r0, r5, r11
/* 091D90 80094D90 396B0004 */  addi      r11, r11, 0x4
/* 091D94 80094D94 9001002C */  stw       r0, 0x2c(r1)
/* 091D98 80094D98 C0410034 */  lfs       f2, 0x34(r1)
/* 091D9C 80094D9C C021002C */  lfs       f1, 0x2c(r1)
/* 091DA0 80094DA0 C0030004 */  lfs       f0, 0x4(r3)
/* 091DA4 80094DA4 EC02007A */  fmadds    f0, f2, f1, f0
/* 091DA8 80094DA8 D0030004 */  stfs      f0, 0x4(r3)
/* 091DAC 80094DAC 7C04C02E */  lwzx      r0, r4, r24
/* 091DB0 80094DB0 90010034 */  stw       r0, 0x34(r1)
/* 091DB4 80094DB4 7C05D02E */  lwzx      r0, r5, r26
/* 091DB8 80094DB8 9001002C */  stw       r0, 0x2c(r1)
/* 091DBC 80094DBC C0410034 */  lfs       f2, 0x34(r1)
/* 091DC0 80094DC0 C021002C */  lfs       f1, 0x2c(r1)
/* 091DC4 80094DC4 C0030004 */  lfs       f0, 0x4(r3)
/* 091DC8 80094DC8 EC02007A */  fmadds    f0, f2, f1, f0
/* 091DCC 80094DCC D0030004 */  stfs      f0, 0x4(r3)
/* 091DD0 80094DD0 7C04D82E */  lwzx      r0, r4, r27
/* 091DD4 80094DD4 90010034 */  stw       r0, 0x34(r1)
/* 091DD8 80094DD8 7C05E82E */  lwzx      r0, r5, r29
/* 091DDC 80094DDC 9001002C */  stw       r0, 0x2c(r1)
/* 091DE0 80094DE0 C0410034 */  lfs       f2, 0x34(r1)
/* 091DE4 80094DE4 C021002C */  lfs       f1, 0x2c(r1)
/* 091DE8 80094DE8 C0030004 */  lfs       f0, 0x4(r3)
/* 091DEC 80094DEC EC02007A */  fmadds    f0, f2, f1, f0
/* 091DF0 80094DF0 D0030004 */  stfs      f0, 0x4(r3)
/* 091DF4 80094DF4 7C04F02E */  lwzx      r0, r4, r30
/* 091DF8 80094DF8 90010034 */  stw       r0, 0x34(r1)
/* 091DFC 80094DFC 7C05602E */  lwzx      r0, r5, r12
/* 091E00 80094E00 9001002C */  stw       r0, 0x2c(r1)
/* 091E04 80094E04 C0410034 */  lfs       f2, 0x34(r1)
/* 091E08 80094E08 C021002C */  lfs       f1, 0x2c(r1)
/* 091E0C 80094E0C C0030004 */  lfs       f0, 0x4(r3)
/* 091E10 80094E10 EC02007A */  fmadds    f0, f2, f1, f0
/* 091E14 80094E14 D0030004 */  stfs      f0, 0x4(r3)
/* 091E18 80094E18 38630008 */  addi      r3, r3, 0x8
/* 091E1C 80094E1C 4200FE98 */  bdnz      lbl_80094CB4
/* 091E20 80094E20 39290001 */  addi      r9, r9, 0x1
/* 091E24 80094E24 2C090004 */  cmpwi     r9, 0x4
/* 091E28 80094E28 38C60010 */  addi      r6, r6, 0x10
/* 091E2C 80094E2C 38E70004 */  addi      r7, r7, 0x4
/* 091E30 80094E30 394A0010 */  addi      r10, r10, 0x10
/* 091E34 80094E34 4180FE4C */  blt       lbl_80094C80
/* 091E38 80094E38 38000002 */  li        r0, 0x2
/* 091E3C 80094E3C 7C0903A6 */  mtctr     r0
/* 091E40 80094E40 39800000 */  li        r12, 0x0
/* 091E44 80094E44 38600000 */  li        r3, 0x0
lbl_80094E48:
/* 091E48 80094E48 C0080000 */  lfs       f0, 0x0(r8)
/* 091E4C 80094E4C 38CC0001 */  addi      r6, r12, 0x1
/* 091E50 80094E50 38AC0002 */  addi      r5, r12, 0x2
/* 091E54 80094E54 D0010034 */  stfs      f0, 0x34(r1)
/* 091E58 80094E58 54CA103A */  slwi      r10, r6, 2
/* 091E5C 80094E5C 54A7103A */  slwi      r7, r5, 2
/* 091E60 80094E60 81210034 */  lwz       r9, 0x34(r1)
/* 091E64 80094E64 388C0003 */  addi      r4, r12, 0x3
/* 091E68 80094E68 80C1001C */  lwz       r6, 0x1c(r1)
/* 091E6C 80094E6C 5480103A */  slwi      r0, r4, 2
/* 091E70 80094E70 38AC0006 */  addi      r5, r12, 0x6
/* 091E74 80094E74 7D26192E */  stwx      r9, r6, r3
/* 091E78 80094E78 38CC0005 */  addi      r6, r12, 0x5
/* 091E7C 80094E7C 388C0007 */  addi      r4, r12, 0x7
/* 091E80 80094E80 C0080004 */  lfs       f0, 0x4(r8)
/* 091E84 80094E84 38630010 */  addi      r3, r3, 0x10
/* 091E88 80094E88 398C0008 */  addi      r12, r12, 0x8
/* 091E8C 80094E8C D0010034 */  stfs      f0, 0x34(r1)
/* 091E90 80094E90 81610034 */  lwz       r11, 0x34(r1)
/* 091E94 80094E94 8121001C */  lwz       r9, 0x1c(r1)
/* 091E98 80094E98 7D69512E */  stwx      r11, r9, r10
/* 091E9C 80094E9C 54CA103A */  slwi      r10, r6, 2
/* 091EA0 80094EA0 C0080008 */  lfs       f0, 0x8(r8)
/* 091EA4 80094EA4 D0010034 */  stfs      f0, 0x34(r1)
/* 091EA8 80094EA8 81210034 */  lwz       r9, 0x34(r1)
/* 091EAC 80094EAC 80C1001C */  lwz       r6, 0x1c(r1)
/* 091EB0 80094EB0 7D26392E */  stwx      r9, r6, r7
/* 091EB4 80094EB4 54A7103A */  slwi      r7, r5, 2
/* 091EB8 80094EB8 C008000C */  lfs       f0, 0xc(r8)
/* 091EBC 80094EBC D0010034 */  stfs      f0, 0x34(r1)
/* 091EC0 80094EC0 80C10034 */  lwz       r6, 0x34(r1)
/* 091EC4 80094EC4 80A1001C */  lwz       r5, 0x1c(r1)
/* 091EC8 80094EC8 7CC5012E */  stwx      r6, r5, r0
/* 091ECC 80094ECC 5480103A */  slwi      r0, r4, 2
/* 091ED0 80094ED0 C0080010 */  lfs       f0, 0x10(r8)
/* 091ED4 80094ED4 D0010034 */  stfs      f0, 0x34(r1)
/* 091ED8 80094ED8 81210034 */  lwz       r9, 0x34(r1)
/* 091EDC 80094EDC 80C1001C */  lwz       r6, 0x1c(r1)
/* 091EE0 80094EE0 7D26192E */  stwx      r9, r6, r3
/* 091EE4 80094EE4 38630010 */  addi      r3, r3, 0x10
/* 091EE8 80094EE8 C0080014 */  lfs       f0, 0x14(r8)
/* 091EEC 80094EEC D0010034 */  stfs      f0, 0x34(r1)
/* 091EF0 80094EF0 81610034 */  lwz       r11, 0x34(r1)
/* 091EF4 80094EF4 8121001C */  lwz       r9, 0x1c(r1)
/* 091EF8 80094EF8 7D69512E */  stwx      r11, r9, r10
/* 091EFC 80094EFC C0080018 */  lfs       f0, 0x18(r8)
/* 091F00 80094F00 D0010034 */  stfs      f0, 0x34(r1)
/* 091F04 80094F04 81210034 */  lwz       r9, 0x34(r1)
/* 091F08 80094F08 80C1001C */  lwz       r6, 0x1c(r1)
/* 091F0C 80094F0C 7D26392E */  stwx      r9, r6, r7
/* 091F10 80094F10 C008001C */  lfs       f0, 0x1c(r8)
/* 091F14 80094F14 39080020 */  addi      r8, r8, 0x20
/* 091F18 80094F18 D0010034 */  stfs      f0, 0x34(r1)
/* 091F1C 80094F1C 80C10034 */  lwz       r6, 0x34(r1)
/* 091F20 80094F20 80A1001C */  lwz       r5, 0x1c(r1)
/* 091F24 80094F24 7CC5012E */  stwx      r6, r5, r0
/* 091F28 80094F28 4200FF20 */  bdnz      lbl_80094E48
/* 091F2C 80094F2C BAE10084 */  lmw       r23, 0x84(r1)
/* 091F30 80094F30 800100AC */  lwz       r0, 0xac(r1)
/* 091F34 80094F34 382100A8 */  addi      r1, r1, 0xa8
/* 091F38 80094F38 7C0803A6 */  mtlr      r0
/* 091F3C 80094F3C 4E800020 */  blr

glabel osVirtualToPhysical
/* 091F40 80094F40 80A30064 */  lwz       r5, 0x64(r3)
/* 091F44 80094F44 3C008000 */  lis       r0, 0x8000
/* 091F48 80094F48 7C050040 */  cmplw     r5, r0
/* 091F4C 80094F4C 4180001C */  blt       lbl_80094F68
/* 091F50 80094F50 3C00A000 */  lis       r0, 0xa000
/* 091F54 80094F54 7C050040 */  cmplw     r5, r0
/* 091F58 80094F58 40800010 */  bge       lbl_80094F68
/* 091F5C 80094F5C 54A000FE */  clrlwi    r0, r5, 3
/* 091F60 80094F60 90030054 */  stw       r0, 0x54(r3)
/* 091F64 80094F64 4E800020 */  blr
lbl_80094F68:
/* 091F68 80094F68 3C00A000 */  lis       r0, 0xa000
/* 091F6C 80094F6C 7C050040 */  cmplw     r5, r0
/* 091F70 80094F70 4180001C */  blt       lbl_80094F8C
/* 091F74 80094F74 3C00C000 */  lis       r0, 0xc000
/* 091F78 80094F78 7C050040 */  cmplw     r5, r0
/* 091F7C 80094F7C 40800010 */  bge       lbl_80094F8C
/* 091F80 80094F80 54A000FE */  clrlwi    r0, r5, 3
/* 091F84 80094F84 90030054 */  stw       r0, 0x54(r3)
/* 091F88 80094F88 4E800020 */  blr
lbl_80094F8C:
/* 091F8C 80094F8C 54A0843E */  srwi      r0, r5, 16
/* 091F90 80094F90 7C830214 */  add       r4, r3, r0
/* 091F94 80094F94 88040F64 */  lbz       r0, 0xf64(r4)
/* 091F98 80094F98 5400103A */  slwi      r0, r0, 2
/* 091F9C 80094F9C 7C830214 */  add       r4, r3, r0
/* 091FA0 80094FA0 80840B64 */  lwz       r4, 0xb64(r4)
/* 091FA4 80094FA4 80040008 */  lwz       r0, 0x8(r4)
/* 091FA8 80094FA8 7C050214 */  add       r0, r5, r0
/* 091FAC 80094FAC 90030054 */  stw       r0, 0x54(r3)
/* 091FB0 80094FB0 4E800020 */  blr

glabel osPhysicalToVirtual
/* 091FB4 80094FB4 80030064 */  lwz       r0, 0x64(r3)
/* 091FB8 80094FB8 64008000 */  oris      r0, r0, 0x8000
/* 091FBC 80094FBC 90030054 */  stw       r0, 0x54(r3)
/* 091FC0 80094FC0 4E800020 */  blr

glabel _memcpy
/* 091FC4 80094FC4 7C0802A6 */  mflr      r0
/* 091FC8 80094FC8 90010004 */  stw       r0, 0x4(r1)
/* 091FCC 80094FCC 9421FFE0 */  stwu      r1, -0x20(r1)
/* 091FD0 80094FD0 93E1001C */  stw       r31, 0x1c(r1)
/* 091FD4 80094FD4 7C7F1B78 */  mr        r31, r3
/* 091FD8 80094FD8 3881000C */  addi      r4, r1, 0xc
/* 091FDC 80094FDC 80A30064 */  lwz       r5, 0x64(r3)
/* 091FE0 80094FE0 4BF9F055 */  bl        cpuGetAddressBuffer
/* 091FE4 80094FE4 80BF006C */  lwz       r5, 0x6c(r31)
/* 091FE8 80094FE8 387F0000 */  addi      r3, r31, 0x0
/* 091FEC 80094FEC 38810010 */  addi      r4, r1, 0x10
/* 091FF0 80094FF0 4BF9F045 */  bl        cpuGetAddressBuffer
/* 091FF4 80094FF4 80BF0074 */  lwz       r5, 0x74(r31)
/* 091FF8 80094FF8 8061000C */  lwz       r3, 0xc(r1)
/* 091FFC 80094FFC 80810010 */  lwz       r4, 0x10(r1)
/* 092000 80095000 4BF71A51 */  bl        xlHeapCopy
/* 092004 80095004 801F0064 */  lwz       r0, 0x64(r31)
/* 092008 80095008 901F0054 */  stw       r0, 0x54(r31)
/* 09200C 8009500C 80010024 */  lwz       r0, 0x24(r1)
/* 092010 80095010 83E1001C */  lwz       r31, 0x1c(r1)
/* 092014 80095014 38210020 */  addi      r1, r1, 0x20
/* 092018 80095018 7C0803A6 */  mtlr      r0
/* 09201C 8009501C 4E800020 */  blr

glabel _bcopy
/* 092020 80095020 7C0802A6 */  mflr      r0
/* 092024 80095024 90010004 */  stw       r0, 0x4(r1)
/* 092028 80095028 9421FFE0 */  stwu      r1, -0x20(r1)
/* 09202C 8009502C 93E1001C */  stw       r31, 0x1c(r1)
/* 092030 80095030 7C7F1B78 */  mr        r31, r3
/* 092034 80095034 38810010 */  addi      r4, r1, 0x10
/* 092038 80095038 80A30064 */  lwz       r5, 0x64(r3)
/* 09203C 8009503C 4BF9EFF9 */  bl        cpuGetAddressBuffer
/* 092040 80095040 80BF006C */  lwz       r5, 0x6c(r31)
/* 092044 80095044 387F0000 */  addi      r3, r31, 0x0
/* 092048 80095048 3881000C */  addi      r4, r1, 0xc
/* 09204C 8009504C 4BF9EFE9 */  bl        cpuGetAddressBuffer
/* 092050 80095050 80BF0074 */  lwz       r5, 0x74(r31)
/* 092054 80095054 8061000C */  lwz       r3, 0xc(r1)
/* 092058 80095058 80810010 */  lwz       r4, 0x10(r1)
/* 09205C 8009505C 4BF719F5 */  bl        xlHeapCopy
/* 092060 80095060 801F006C */  lwz       r0, 0x6c(r31)
/* 092064 80095064 901F0054 */  stw       r0, 0x54(r31)
/* 092068 80095068 80010024 */  lwz       r0, 0x24(r1)
/* 09206C 8009506C 83E1001C */  lwz       r31, 0x1c(r1)
/* 092070 80095070 38210020 */  addi      r1, r1, 0x20
/* 092074 80095074 7C0803A6 */  mtlr      r0
/* 092078 80095078 4E800020 */  blr

glabel _bzero
/* 09207C 8009507C 7C0802A6 */  mflr      r0
/* 092080 80095080 90010004 */  stw       r0, 0x4(r1)
/* 092084 80095084 9421FFE8 */  stwu      r1, -0x18(r1)
/* 092088 80095088 93E10014 */  stw       r31, 0x14(r1)
/* 09208C 8009508C 7C7F1B78 */  mr        r31, r3
/* 092090 80095090 3881000C */  addi      r4, r1, 0xc
/* 092094 80095094 80A30064 */  lwz       r5, 0x64(r3)
/* 092098 80095098 4BF9EF9D */  bl        cpuGetAddressBuffer
/* 09209C 8009509C 80BF006C */  lwz       r5, 0x6c(r31)
/* 0920A0 800950A0 38800000 */  li        r4, 0x0
/* 0920A4 800950A4 8061000C */  lwz       r3, 0xc(r1)
/* 0920A8 800950A8 4BF70279 */  bl        memset
/* 0920AC 800950AC 8001001C */  lwz       r0, 0x1c(r1)
/* 0920B0 800950B0 83E10014 */  lwz       r31, 0x14(r1)
/* 0920B4 800950B4 38210018 */  addi      r1, r1, 0x18
/* 0920B8 800950B8 7C0803A6 */  mtlr      r0
/* 0920BC 800950BC 4E800020 */  blr

glabel __sinf
/* 0920C0 800950C0 7C0802A6 */  mflr      r0
/* 0920C4 800950C4 90010004 */  stw       r0, 0x4(r1)
/* 0920C8 800950C8 9421FFE8 */  stwu      r1, -0x18(r1)
/* 0920CC 800950CC 93E10014 */  stw       r31, 0x14(r1)
/* 0920D0 800950D0 7C7F1B78 */  mr        r31, r3
/* 0920D4 800950D4 C02301A4 */  lfs       f1, 0x1a4(r3)
/* 0920D8 800950D8 4803BD71 */  bl        sinf
/* 0920DC 800950DC D03F0144 */  stfs      f1, 0x144(r31)
/* 0920E0 800950E0 8001001C */  lwz       r0, 0x1c(r1)
/* 0920E4 800950E4 83E10014 */  lwz       r31, 0x14(r1)
/* 0920E8 800950E8 38210018 */  addi      r1, r1, 0x18
/* 0920EC 800950EC 7C0803A6 */  mtlr      r0
/* 0920F0 800950F0 4E800020 */  blr

glabel __cosf
/* 0920F4 800950F4 7C0802A6 */  mflr      r0
/* 0920F8 800950F8 90010004 */  stw       r0, 0x4(r1)
/* 0920FC 800950FC 9421FFE8 */  stwu      r1, -0x18(r1)
/* 092100 80095100 93E10014 */  stw       r31, 0x14(r1)
/* 092104 80095104 7C7F1B78 */  mr        r31, r3
/* 092108 80095108 C02301A4 */  lfs       f1, 0x1a4(r3)
/* 09210C 8009510C 4803BBA9 */  bl        cosf
/* 092110 80095110 D03F0144 */  stfs      f1, 0x144(r31)
/* 092114 80095114 8001001C */  lwz       r0, 0x1c(r1)
/* 092118 80095118 83E10014 */  lwz       r31, 0x14(r1)
/* 09211C 8009511C 38210018 */  addi      r1, r1, 0x18
/* 092120 80095120 7C0803A6 */  mtlr      r0
/* 092124 80095124 4E800020 */  blr

glabel __osSpSetStatus
/* 092128 80095128 7C0802A6 */  mflr      r0
/* 09212C 8009512C 3C800404 */  lis       r4, 0x404
/* 092130 80095130 90010004 */  stw       r0, 0x4(r1)
/* 092134 80095134 38840010 */  addi      r4, r4, 0x10
/* 092138 80095138 9421FFF0 */  stwu      r1, -0x10(r1)
/* 09213C 8009513C 80030064 */  lwz       r0, 0x64(r3)
/* 092140 80095140 38A1000C */  addi      r5, r1, 0xc
/* 092144 80095144 9001000C */  stw       r0, 0xc(r1)
/* 092148 80095148 80630008 */  lwz       r3, 0x8(r3)
/* 09214C 8009514C 80630034 */  lwz       r3, 0x34(r3)
/* 092150 80095150 4BFDCA01 */  bl        rspPut32
/* 092154 80095154 2C030000 */  cmpwi     r3, 0x0
/* 092158 80095158 4082000C */  bne       lbl_80095164
/* 09215C 8009515C 38600000 */  li        r3, 0x0
/* 092160 80095160 48000008 */  b         lbl_80095168
lbl_80095164:
/* 092164 80095164 38600001 */  li        r3, 0x1
lbl_80095168:
/* 092168 80095168 80010014 */  lwz       r0, 0x14(r1)
/* 09216C 8009516C 38210010 */  addi      r1, r1, 0x10
/* 092170 80095170 7C0803A6 */  mtlr      r0
/* 092174 80095174 4E800020 */  blr

glabel __osRestoreInt
/* 092178 80095178 7C0802A6 */  mflr      r0
/* 09217C 8009517C 3880000C */  li        r4, 0xc
/* 092180 80095180 90010004 */  stw       r0, 0x4(r1)
/* 092184 80095184 9421FFE0 */  stwu      r1, -0x20(r1)
/* 092188 80095188 93E1001C */  stw       r31, 0x1c(r1)
/* 09218C 8009518C 3BE30000 */  addi      r31, r3, 0x0
/* 092190 80095190 38A10010 */  addi      r5, r1, 0x10
/* 092194 80095194 4BF9F9E1 */  bl        cpuGetRegisterCP0
/* 092198 80095198 2C030000 */  cmpwi     r3, 0x0
/* 09219C 8009519C 4082000C */  bne       lbl_800951A8
/* 0921A0 800951A0 38600000 */  li        r3, 0x0
/* 0921A4 800951A4 4800004C */  b         lbl_800951F0
lbl_800951A8:
/* 0921A8 800951A8 80E10014 */  lwz       r7, 0x14(r1)
/* 0921AC 800951AC 7FE3FB78 */  mr        r3, r31
/* 0921B0 800951B0 801F0064 */  lwz       r0, 0x64(r31)
/* 0921B4 800951B4 3880000C */  li        r4, 0xc
/* 0921B8 800951B8 80C10010 */  lwz       r6, 0x10(r1)
/* 0921BC 800951BC 80BF0060 */  lwz       r5, 0x60(r31)
/* 0921C0 800951C0 7CE00378 */  or        r0, r7, r0
/* 0921C4 800951C4 90010014 */  stw       r0, 0x14(r1)
/* 0921C8 800951C8 7CC02B78 */  or        r0, r6, r5
/* 0921CC 800951CC 90010010 */  stw       r0, 0x10(r1)
/* 0921D0 800951D0 80A10010 */  lwz       r5, 0x10(r1)
/* 0921D4 800951D4 80C10014 */  lwz       r6, 0x14(r1)
/* 0921D8 800951D8 4BF9FC45 */  bl        cpuSetRegisterCP0
/* 0921DC 800951DC 2C030000 */  cmpwi     r3, 0x0
/* 0921E0 800951E0 4082000C */  bne       lbl_800951EC
/* 0921E4 800951E4 38600000 */  li        r3, 0x0
/* 0921E8 800951E8 48000008 */  b         lbl_800951F0
lbl_800951EC:
/* 0921EC 800951EC 38600001 */  li        r3, 0x1
lbl_800951F0:
/* 0921F0 800951F0 80010024 */  lwz       r0, 0x24(r1)
/* 0921F4 800951F4 83E1001C */  lwz       r31, 0x1c(r1)
/* 0921F8 800951F8 38210020 */  addi      r1, r1, 0x20
/* 0921FC 800951FC 7C0803A6 */  mtlr      r0
/* 092200 80095200 4E800020 */  blr

glabel __osDisableInt
/* 092204 80095204 7C0802A6 */  mflr      r0
/* 092208 80095208 3880000C */  li        r4, 0xc
/* 09220C 8009520C 90010004 */  stw       r0, 0x4(r1)
/* 092210 80095210 9421FFD8 */  stwu      r1, -0x28(r1)
/* 092214 80095214 93E10024 */  stw       r31, 0x24(r1)
/* 092218 80095218 38A10018 */  addi      r5, r1, 0x18
/* 09221C 8009521C 93C10020 */  stw       r30, 0x20(r1)
/* 092220 80095220 3BC30000 */  addi      r30, r3, 0x0
/* 092224 80095224 4BF9F951 */  bl        cpuGetRegisterCP0
/* 092228 80095228 2C030000 */  cmpwi     r3, 0x0
/* 09222C 8009522C 4082000C */  bne       lbl_80095238
/* 092230 80095230 38600000 */  li        r3, 0x0
/* 092234 80095234 48000048 */  b         lbl_8009527C
lbl_80095238:
/* 092238 80095238 83E1001C */  lwz       r31, 0x1c(r1)
/* 09223C 8009523C 38000000 */  li        r0, 0x0
/* 092240 80095240 387E0000 */  addi      r3, r30, 0x0
/* 092244 80095244 57E4003C */  clrrwi    r4, r31, 1
/* 092248 80095248 9081001C */  stw       r4, 0x1c(r1)
/* 09224C 8009524C 3880000C */  li        r4, 0xc
/* 092250 80095250 90010018 */  stw       r0, 0x18(r1)
/* 092254 80095254 80A10018 */  lwz       r5, 0x18(r1)
/* 092258 80095258 80C1001C */  lwz       r6, 0x1c(r1)
/* 09225C 8009525C 4BF9FBC1 */  bl        cpuSetRegisterCP0
/* 092260 80095260 2C030000 */  cmpwi     r3, 0x0
/* 092264 80095264 4082000C */  bne       lbl_80095270
/* 092268 80095268 38600000 */  li        r3, 0x0
/* 09226C 8009526C 48000010 */  b         lbl_8009527C
lbl_80095270:
/* 092270 80095270 57E007FE */  clrlwi    r0, r31, 31
/* 092274 80095274 901E0054 */  stw       r0, 0x54(r30)
/* 092278 80095278 38600001 */  li        r3, 0x1
lbl_8009527C:
/* 09227C 8009527C 8001002C */  lwz       r0, 0x2c(r1)
/* 092280 80095280 83E10024 */  lwz       r31, 0x24(r1)
/* 092284 80095284 83C10020 */  lwz       r30, 0x20(r1)
/* 092288 80095288 7C0803A6 */  mtlr      r0
/* 09228C 8009528C 38210028 */  addi      r1, r1, 0x28
/* 092290 80095290 4E800020 */  blr

glabel osInvalICache
/* 092294 80095294 7C0802A6 */  mflr      r0
/* 092298 80095298 90010004 */  stw       r0, 0x4(r1)
/* 09229C 8009529C 9421FFE0 */  stwu      r1, -0x20(r1)
/* 0922A0 800952A0 93E1001C */  stw       r31, 0x1c(r1)
/* 0922A4 800952A4 93C10018 */  stw       r30, 0x18(r1)
/* 0922A8 800952A8 93A10014 */  stw       r29, 0x14(r1)
/* 0922AC 800952AC 7C7D1B78 */  mr        r29, r3
/* 0922B0 800952B0 83C30064 */  lwz       r30, 0x64(r3)
/* 0922B4 800952B4 801D006C */  lwz       r0, 0x6c(r29)
/* 0922B8 800952B8 389E0000 */  addi      r4, r30, 0x0
/* 0922BC 800952BC 7FFE0214 */  add       r31, r30, r0
/* 0922C0 800952C0 38BF0000 */  addi      r5, r31, 0x0
/* 0922C4 800952C4 4BF9EB55 */  bl        cpuInvalidateCache
/* 0922C8 800952C8 2C030000 */  cmpwi     r3, 0x0
/* 0922CC 800952CC 4082000C */  bne       lbl_800952D8
/* 0922D0 800952D0 38600000 */  li        r3, 0x0
/* 0922D4 800952D4 4800002C */  b         lbl_80095300
lbl_800952D8:
/* 0922D8 800952D8 807D0008 */  lwz       r3, 0x8(r29)
/* 0922DC 800952DC 389E0000 */  addi      r4, r30, 0x0
/* 0922E0 800952E0 38BF0000 */  addi      r5, r31, 0x0
/* 0922E4 800952E4 80630034 */  lwz       r3, 0x34(r3)
/* 0922E8 800952E8 4BFDC4C5 */  bl        rspInvalidateCache
/* 0922EC 800952EC 2C030000 */  cmpwi     r3, 0x0
/* 0922F0 800952F0 4082000C */  bne       lbl_800952FC
/* 0922F4 800952F4 38600000 */  li        r3, 0x0
/* 0922F8 800952F8 48000008 */  b         lbl_80095300
lbl_800952FC:
/* 0922FC 800952FC 38600001 */  li        r3, 0x1
lbl_80095300:
/* 092300 80095300 80010024 */  lwz       r0, 0x24(r1)
/* 092304 80095304 83E1001C */  lwz       r31, 0x1c(r1)
/* 092308 80095308 83C10018 */  lwz       r30, 0x18(r1)
/* 09230C 8009530C 7C0803A6 */  mtlr      r0
/* 092310 80095310 83A10014 */  lwz       r29, 0x14(r1)
/* 092314 80095314 38210020 */  addi      r1, r1, 0x20
/* 092318 80095318 4E800020 */  blr

glabel osGetMemSize
/* 09231C 8009531C 7C0802A6 */  mflr      r0
/* 092320 80095320 90010004 */  stw       r0, 0x4(r1)
/* 092324 80095324 9421FFE8 */  stwu      r1, -0x18(r1)
/* 092328 80095328 93E10014 */  stw       r31, 0x14(r1)
/* 09232C 8009532C 7C7F1B78 */  mr        r31, r3
/* 092330 80095330 3881000C */  addi      r4, r1, 0xc
/* 092334 80095334 80630008 */  lwz       r3, 0x8(r3)
/* 092338 80095338 8063002C */  lwz       r3, 0x2c(r3)
/* 09233C 8009533C 4BFD7505 */  bl        ramGetSize
/* 092340 80095340 2C030000 */  cmpwi     r3, 0x0
/* 092344 80095344 4082000C */  bne       lbl_80095350
/* 092348 80095348 38600000 */  li        r3, 0x0
/* 09234C 8009534C 48000010 */  b         lbl_8009535C
lbl_80095350:
/* 092350 80095350 8001000C */  lwz       r0, 0xc(r1)
/* 092354 80095354 38600001 */  li        r3, 0x1
/* 092358 80095358 901F0054 */  stw       r0, 0x54(r31)
lbl_8009535C:
/* 09235C 8009535C 8001001C */  lwz       r0, 0x1c(r1)
/* 092360 80095360 83E10014 */  lwz       r31, 0x14(r1)
/* 092364 80095364 38210018 */  addi      r1, r1, 0x18
/* 092368 80095368 7C0803A6 */  mtlr      r0
/* 09236C 8009536C 4E800020 */  blr

glabel __osDispatchThread
/* 092370 80095370 7C0802A6 */  mflr      r0
/* 092374 80095374 90010004 */  stw       r0, 0x4(r1)
/* 092378 80095378 9421FFD0 */  stwu      r1, -0x30(r1)
/* 09237C 8009537C BF61001C */  stmw      r27, 0x1c(r1)
/* 092380 80095380 7C7B1B78 */  mr        r27, r3
/* 092384 80095384 3BFB0F64 */  addi      r31, r27, 0xf64
/* 092388 80095388 3BDB0B64 */  addi      r30, r27, 0xb64
/* 09238C 8009538C 38BB0054 */  addi      r5, r27, 0x54
/* 092390 80095390 80630008 */  lwz       r3, 0x8(r3)
/* 092394 80095394 83A30058 */  lwz       r29, 0x58(r3)
/* 092398 80095398 807D0024 */  lwz       r3, 0x24(r29)
/* 09239C 8009539C 80030000 */  lwz       r0, 0x0(r3)
/* 0923A0 800953A0 9001000C */  stw       r0, 0xc(r1)
/* 0923A4 800953A4 8381000C */  lwz       r28, 0xc(r1)
/* 0923A8 800953A8 801D0050 */  lwz       r0, 0x50(r29)
/* 0923AC 800953AC 901B0064 */  stw       r0, 0x64(r27)
/* 0923B0 800953B0 809B0064 */  lwz       r4, 0x64(r27)
/* 0923B4 800953B4 5480843E */  srwi      r0, r4, 16
/* 0923B8 800953B8 7C1F00AE */  lbzx      r0, r31, r0
/* 0923BC 800953BC 5400103A */  slwi      r0, r0, 2
/* 0923C0 800953C0 7C7E002E */  lwzx      r3, r30, r0
/* 0923C4 800953C4 81830014 */  lwz       r12, 0x14(r3)
/* 0923C8 800953C8 80030008 */  lwz       r0, 0x8(r3)
/* 0923CC 800953CC 7D8803A6 */  mtlr      r12
/* 0923D0 800953D0 80630004 */  lwz       r3, 0x4(r3)
/* 0923D4 800953D4 7C840214 */  add       r4, r4, r0
/* 0923D8 800953D8 4E800021 */  blrl
/* 0923DC 800953DC 809B0054 */  lwz       r4, 0x54(r27)
/* 0923E0 800953E0 38BB010C */  addi      r5, r27, 0x10c
/* 0923E4 800953E4 5480843E */  srwi      r0, r4, 16
/* 0923E8 800953E8 7C1F00AE */  lbzx      r0, r31, r0
/* 0923EC 800953EC 5400103A */  slwi      r0, r0, 2
/* 0923F0 800953F0 7C7E002E */  lwzx      r3, r30, r0
/* 0923F4 800953F4 81830014 */  lwz       r12, 0x14(r3)
/* 0923F8 800953F8 80030008 */  lwz       r0, 0x8(r3)
/* 0923FC 800953FC 7D8803A6 */  mtlr      r12
/* 092400 80095400 80630004 */  lwz       r3, 0x4(r3)
/* 092404 80095404 7C840214 */  add       r4, r4, r0
/* 092408 80095408 4E800021 */  blrl
/* 09240C 8009540C 809B0064 */  lwz       r4, 0x64(r27)
/* 092410 80095410 38BB010C */  addi      r5, r27, 0x10c
/* 092414 80095414 5480843E */  srwi      r0, r4, 16
/* 092418 80095418 7C1F00AE */  lbzx      r0, r31, r0
/* 09241C 8009541C 5400103A */  slwi      r0, r0, 2
/* 092420 80095420 7C7E002E */  lwzx      r3, r30, r0
/* 092424 80095424 81830024 */  lwz       r12, 0x24(r3)
/* 092428 80095428 80030008 */  lwz       r0, 0x8(r3)
/* 09242C 8009542C 7D8803A6 */  mtlr      r12
/* 092430 80095430 80630004 */  lwz       r3, 0x4(r3)
/* 092434 80095434 7C840214 */  add       r4, r4, r0
/* 092438 80095438 4E800021 */  blrl
/* 09243C 8009543C 80BB0054 */  lwz       r5, 0x54(r27)
/* 092440 80095440 7F63DB78 */  mr        r3, r27
/* 092444 80095444 80DD0038 */  lwz       r6, 0x38(r29)
/* 092448 80095448 38810010 */  addi      r4, r1, 0x10
/* 09244C 8009544C 90A60000 */  stw       r5, 0x0(r6)
/* 092450 80095450 4BF9EBE5 */  bl        cpuGetAddressBuffer
/* 092454 80095454 2C030000 */  cmpwi     r3, 0x0
/* 092458 80095458 4082000C */  bne       lbl_80095464
/* 09245C 8009545C 38600000 */  li        r3, 0x0
/* 092460 80095460 480004A0 */  b         lbl_80095900
lbl_80095464:
/* 092464 80095464 80610010 */  lwz       r3, 0x10(r1)
/* 092468 80095468 38800004 */  li        r4, 0x4
/* 09246C 8009546C 5780042E */  rlwinm    r0, r28, 0, 16, 23
/* 092470 80095470 B0830010 */  sth       r4, 0x10(r3)
/* 092474 80095474 387B0000 */  addi      r3, r27, 0x0
/* 092478 80095478 3880000C */  li        r4, 0xc
/* 09247C 8009547C 80C10010 */  lwz       r6, 0x10(r1)
/* 092480 80095480 38A00000 */  li        r5, 0x0
/* 092484 80095484 80C60118 */  lwz       r6, 0x118(r6)
/* 092488 80095488 9001000C */  stw       r0, 0xc(r1)
/* 09248C 8009548C 54C0042E */  rlwinm    r0, r6, 0, 16, 23
/* 092490 80095490 54C6061E */  rlwinm    r6, r6, 0, 24, 15
/* 092494 80095494 80E1000C */  lwz       r7, 0xc(r1)
/* 092498 80095498 7CE00038 */  and       r0, r7, r0
/* 09249C 8009549C 9001000C */  stw       r0, 0xc(r1)
/* 0924A0 800954A0 8001000C */  lwz       r0, 0xc(r1)
/* 0924A4 800954A4 7CC00378 */  or        r0, r6, r0
/* 0924A8 800954A8 7C060378 */  mr        r6, r0
/* 0924AC 800954AC 4BF9F971 */  bl        cpuSetRegisterCP0
/* 0924B0 800954B0 2C030000 */  cmpwi     r3, 0x0
/* 0924B4 800954B4 4082000C */  bne       lbl_800954C0
/* 0924B8 800954B8 38600000 */  li        r3, 0x0
/* 0924BC 800954BC 48000444 */  b         lbl_80095900
lbl_800954C0:
/* 0924C0 800954C0 80610010 */  lwz       r3, 0x10(r1)
/* 0924C4 800954C4 80030020 */  lwz       r0, 0x20(r3)
/* 0924C8 800954C8 80630024 */  lwz       r3, 0x24(r3)
/* 0924CC 800954CC 907B004C */  stw       r3, 0x4c(r27)
/* 0924D0 800954D0 901B0048 */  stw       r0, 0x48(r27)
/* 0924D4 800954D4 80610010 */  lwz       r3, 0x10(r1)
/* 0924D8 800954D8 80030028 */  lwz       r0, 0x28(r3)
/* 0924DC 800954DC 8063002C */  lwz       r3, 0x2c(r3)
/* 0924E0 800954E0 907B0054 */  stw       r3, 0x54(r27)
/* 0924E4 800954E4 901B0050 */  stw       r0, 0x50(r27)
/* 0924E8 800954E8 80610010 */  lwz       r3, 0x10(r1)
/* 0924EC 800954EC 80030030 */  lwz       r0, 0x30(r3)
/* 0924F0 800954F0 80630034 */  lwz       r3, 0x34(r3)
/* 0924F4 800954F4 907B005C */  stw       r3, 0x5c(r27)
/* 0924F8 800954F8 901B0058 */  stw       r0, 0x58(r27)
/* 0924FC 800954FC 80610010 */  lwz       r3, 0x10(r1)
/* 092500 80095500 80030038 */  lwz       r0, 0x38(r3)
/* 092504 80095504 8063003C */  lwz       r3, 0x3c(r3)
/* 092508 80095508 907B0064 */  stw       r3, 0x64(r27)
/* 09250C 8009550C 901B0060 */  stw       r0, 0x60(r27)
/* 092510 80095510 80610010 */  lwz       r3, 0x10(r1)
/* 092514 80095514 80030040 */  lwz       r0, 0x40(r3)
/* 092518 80095518 80630044 */  lwz       r3, 0x44(r3)
/* 09251C 8009551C 907B006C */  stw       r3, 0x6c(r27)
/* 092520 80095520 901B0068 */  stw       r0, 0x68(r27)
/* 092524 80095524 80610010 */  lwz       r3, 0x10(r1)
/* 092528 80095528 80030048 */  lwz       r0, 0x48(r3)
/* 09252C 8009552C 8063004C */  lwz       r3, 0x4c(r3)
/* 092530 80095530 907B0074 */  stw       r3, 0x74(r27)
/* 092534 80095534 901B0070 */  stw       r0, 0x70(r27)
/* 092538 80095538 80610010 */  lwz       r3, 0x10(r1)
/* 09253C 8009553C 80030050 */  lwz       r0, 0x50(r3)
/* 092540 80095540 80630054 */  lwz       r3, 0x54(r3)
/* 092544 80095544 907B007C */  stw       r3, 0x7c(r27)
/* 092548 80095548 901B0078 */  stw       r0, 0x78(r27)
/* 09254C 8009554C 80610010 */  lwz       r3, 0x10(r1)
/* 092550 80095550 80030058 */  lwz       r0, 0x58(r3)
/* 092554 80095554 8063005C */  lwz       r3, 0x5c(r3)
/* 092558 80095558 907B0084 */  stw       r3, 0x84(r27)
/* 09255C 8009555C 901B0080 */  stw       r0, 0x80(r27)
/* 092560 80095560 80610010 */  lwz       r3, 0x10(r1)
/* 092564 80095564 80030060 */  lwz       r0, 0x60(r3)
/* 092568 80095568 80630064 */  lwz       r3, 0x64(r3)
/* 09256C 8009556C 907B008C */  stw       r3, 0x8c(r27)
/* 092570 80095570 901B0088 */  stw       r0, 0x88(r27)
/* 092574 80095574 80610010 */  lwz       r3, 0x10(r1)
/* 092578 80095578 80030068 */  lwz       r0, 0x68(r3)
/* 09257C 8009557C 8063006C */  lwz       r3, 0x6c(r3)
/* 092580 80095580 907B0094 */  stw       r3, 0x94(r27)
/* 092584 80095584 901B0090 */  stw       r0, 0x90(r27)
/* 092588 80095588 80610010 */  lwz       r3, 0x10(r1)
/* 09258C 8009558C 80030070 */  lwz       r0, 0x70(r3)
/* 092590 80095590 80630074 */  lwz       r3, 0x74(r3)
/* 092594 80095594 907B009C */  stw       r3, 0x9c(r27)
/* 092598 80095598 901B0098 */  stw       r0, 0x98(r27)
/* 09259C 8009559C 80610010 */  lwz       r3, 0x10(r1)
/* 0925A0 800955A0 80030078 */  lwz       r0, 0x78(r3)
/* 0925A4 800955A4 8063007C */  lwz       r3, 0x7c(r3)
/* 0925A8 800955A8 907B00A4 */  stw       r3, 0xa4(r27)
/* 0925AC 800955AC 901B00A0 */  stw       r0, 0xa0(r27)
/* 0925B0 800955B0 80610010 */  lwz       r3, 0x10(r1)
/* 0925B4 800955B4 80030080 */  lwz       r0, 0x80(r3)
/* 0925B8 800955B8 80630084 */  lwz       r3, 0x84(r3)
/* 0925BC 800955BC 907B00AC */  stw       r3, 0xac(r27)
/* 0925C0 800955C0 901B00A8 */  stw       r0, 0xa8(r27)
/* 0925C4 800955C4 80610010 */  lwz       r3, 0x10(r1)
/* 0925C8 800955C8 80030088 */  lwz       r0, 0x88(r3)
/* 0925CC 800955CC 8063008C */  lwz       r3, 0x8c(r3)
/* 0925D0 800955D0 907B00B4 */  stw       r3, 0xb4(r27)
/* 0925D4 800955D4 901B00B0 */  stw       r0, 0xb0(r27)
/* 0925D8 800955D8 80610010 */  lwz       r3, 0x10(r1)
/* 0925DC 800955DC 80030090 */  lwz       r0, 0x90(r3)
/* 0925E0 800955E0 80630094 */  lwz       r3, 0x94(r3)
/* 0925E4 800955E4 907B00BC */  stw       r3, 0xbc(r27)
/* 0925E8 800955E8 901B00B8 */  stw       r0, 0xb8(r27)
/* 0925EC 800955EC 80610010 */  lwz       r3, 0x10(r1)
/* 0925F0 800955F0 80030098 */  lwz       r0, 0x98(r3)
/* 0925F4 800955F4 8063009C */  lwz       r3, 0x9c(r3)
/* 0925F8 800955F8 907B00C4 */  stw       r3, 0xc4(r27)
/* 0925FC 800955FC 901B00C0 */  stw       r0, 0xc0(r27)
/* 092600 80095600 80610010 */  lwz       r3, 0x10(r1)
/* 092604 80095604 800300A0 */  lwz       r0, 0xa0(r3)
/* 092608 80095608 806300A4 */  lwz       r3, 0xa4(r3)
/* 09260C 8009560C 907B00CC */  stw       r3, 0xcc(r27)
/* 092610 80095610 901B00C8 */  stw       r0, 0xc8(r27)
/* 092614 80095614 80610010 */  lwz       r3, 0x10(r1)
/* 092618 80095618 800300A8 */  lwz       r0, 0xa8(r3)
/* 09261C 8009561C 806300AC */  lwz       r3, 0xac(r3)
/* 092620 80095620 907B00D4 */  stw       r3, 0xd4(r27)
/* 092624 80095624 901B00D0 */  stw       r0, 0xd0(r27)
/* 092628 80095628 80610010 */  lwz       r3, 0x10(r1)
/* 09262C 8009562C 800300B0 */  lwz       r0, 0xb0(r3)
/* 092630 80095630 806300B4 */  lwz       r3, 0xb4(r3)
/* 092634 80095634 907B00DC */  stw       r3, 0xdc(r27)
/* 092638 80095638 901B00D8 */  stw       r0, 0xd8(r27)
/* 09263C 8009563C 80610010 */  lwz       r3, 0x10(r1)
/* 092640 80095640 800300B8 */  lwz       r0, 0xb8(r3)
/* 092644 80095644 806300BC */  lwz       r3, 0xbc(r3)
/* 092648 80095648 907B00E4 */  stw       r3, 0xe4(r27)
/* 09264C 8009564C 901B00E0 */  stw       r0, 0xe0(r27)
/* 092650 80095650 80610010 */  lwz       r3, 0x10(r1)
/* 092654 80095654 800300C0 */  lwz       r0, 0xc0(r3)
/* 092658 80095658 806300C4 */  lwz       r3, 0xc4(r3)
/* 09265C 8009565C 907B00EC */  stw       r3, 0xec(r27)
/* 092660 80095660 901B00E8 */  stw       r0, 0xe8(r27)
/* 092664 80095664 80810010 */  lwz       r4, 0x10(r1)
/* 092668 80095668 38000000 */  li        r0, 0x0
/* 09266C 8009566C 806400C8 */  lwz       r3, 0xc8(r4)
/* 092670 80095670 808400CC */  lwz       r4, 0xcc(r4)
/* 092674 80095674 909B00F4 */  stw       r4, 0xf4(r27)
/* 092678 80095678 907B00F0 */  stw       r3, 0xf0(r27)
/* 09267C 8009567C 80810010 */  lwz       r4, 0x10(r1)
/* 092680 80095680 806400D0 */  lwz       r3, 0xd0(r4)
/* 092684 80095684 808400D4 */  lwz       r4, 0xd4(r4)
/* 092688 80095688 909B00FC */  stw       r4, 0xfc(r27)
/* 09268C 8009568C 907B00F8 */  stw       r3, 0xf8(r27)
/* 092690 80095690 80810010 */  lwz       r4, 0x10(r1)
/* 092694 80095694 806400D8 */  lwz       r3, 0xd8(r4)
/* 092698 80095698 808400DC */  lwz       r4, 0xdc(r4)
/* 09269C 8009569C 909B0104 */  stw       r4, 0x104(r27)
/* 0926A0 800956A0 907B0100 */  stw       r3, 0x100(r27)
/* 0926A4 800956A4 80810010 */  lwz       r4, 0x10(r1)
/* 0926A8 800956A8 806400E0 */  lwz       r3, 0xe0(r4)
/* 0926AC 800956AC 808400E4 */  lwz       r4, 0xe4(r4)
/* 0926B0 800956B0 909B010C */  stw       r4, 0x10c(r27)
/* 0926B4 800956B4 907B0108 */  stw       r3, 0x108(r27)
/* 0926B8 800956B8 80810010 */  lwz       r4, 0x10(r1)
/* 0926BC 800956BC 806400E8 */  lwz       r3, 0xe8(r4)
/* 0926C0 800956C0 808400EC */  lwz       r4, 0xec(r4)
/* 0926C4 800956C4 909B0124 */  stw       r4, 0x124(r27)
/* 0926C8 800956C8 907B0120 */  stw       r3, 0x120(r27)
/* 0926CC 800956CC 80810010 */  lwz       r4, 0x10(r1)
/* 0926D0 800956D0 806400F0 */  lwz       r3, 0xf0(r4)
/* 0926D4 800956D4 808400F4 */  lwz       r4, 0xf4(r4)
/* 0926D8 800956D8 909B012C */  stw       r4, 0x12c(r27)
/* 0926DC 800956DC 907B0128 */  stw       r3, 0x128(r27)
/* 0926E0 800956E0 80810010 */  lwz       r4, 0x10(r1)
/* 0926E4 800956E4 806400F8 */  lwz       r3, 0xf8(r4)
/* 0926E8 800956E8 808400FC */  lwz       r4, 0xfc(r4)
/* 0926EC 800956EC 909B0134 */  stw       r4, 0x134(r27)
/* 0926F0 800956F0 907B0130 */  stw       r3, 0x130(r27)
/* 0926F4 800956F4 80810010 */  lwz       r4, 0x10(r1)
/* 0926F8 800956F8 80640100 */  lwz       r3, 0x100(r4)
/* 0926FC 800956FC 80840104 */  lwz       r4, 0x104(r4)
/* 092700 80095700 909B013C */  stw       r4, 0x13c(r27)
/* 092704 80095704 907B0138 */  stw       r3, 0x138(r27)
/* 092708 80095708 80810010 */  lwz       r4, 0x10(r1)
/* 09270C 8009570C 80640108 */  lwz       r3, 0x108(r4)
/* 092710 80095710 8084010C */  lwz       r4, 0x10c(r4)
/* 092714 80095714 909B0014 */  stw       r4, 0x14(r27)
/* 092718 80095718 907B0010 */  stw       r3, 0x10(r27)
/* 09271C 8009571C 80810010 */  lwz       r4, 0x10(r1)
/* 092720 80095720 80640110 */  lwz       r3, 0x110(r4)
/* 092724 80095724 80840114 */  lwz       r4, 0x114(r4)
/* 092728 80095728 909B001C */  stw       r4, 0x1c(r27)
/* 09272C 8009572C 907B0018 */  stw       r3, 0x18(r27)
/* 092730 80095730 80610010 */  lwz       r3, 0x10(r1)
/* 092734 80095734 8063011C */  lwz       r3, 0x11c(r3)
/* 092738 80095738 9061000C */  stw       r3, 0xc(r1)
/* 09273C 8009573C 8061000C */  lwz       r3, 0xc(r1)
/* 092740 80095740 907B0AB4 */  stw       r3, 0xab4(r27)
/* 092744 80095744 901B0AB0 */  stw       r0, 0xab0(r27)
/* 092748 80095748 80610010 */  lwz       r3, 0x10(r1)
/* 09274C 8009574C 8003012C */  lwz       r0, 0x12c(r3)
/* 092750 80095750 901B0A3C */  stw       r0, 0xa3c(r27)
/* 092754 80095754 80610010 */  lwz       r3, 0x10(r1)
/* 092758 80095758 80030130 */  lwz       r0, 0x130(r3)
/* 09275C 8009575C 80630134 */  lwz       r3, 0x134(r3)
/* 092760 80095760 907B0144 */  stw       r3, 0x144(r27)
/* 092764 80095764 901B0140 */  stw       r0, 0x140(r27)
/* 092768 80095768 80610010 */  lwz       r3, 0x10(r1)
/* 09276C 8009576C 80030138 */  lwz       r0, 0x138(r3)
/* 092770 80095770 8063013C */  lwz       r3, 0x13c(r3)
/* 092774 80095774 907B0154 */  stw       r3, 0x154(r27)
/* 092778 80095778 901B0150 */  stw       r0, 0x150(r27)
/* 09277C 8009577C 80610010 */  lwz       r3, 0x10(r1)
/* 092780 80095780 80030140 */  lwz       r0, 0x140(r3)
/* 092784 80095784 80630144 */  lwz       r3, 0x144(r3)
/* 092788 80095788 907B0164 */  stw       r3, 0x164(r27)
/* 09278C 8009578C 901B0160 */  stw       r0, 0x160(r27)
/* 092790 80095790 80610010 */  lwz       r3, 0x10(r1)
/* 092794 80095794 80030148 */  lwz       r0, 0x148(r3)
/* 092798 80095798 8063014C */  lwz       r3, 0x14c(r3)
/* 09279C 8009579C 907B0174 */  stw       r3, 0x174(r27)
/* 0927A0 800957A0 901B0170 */  stw       r0, 0x170(r27)
/* 0927A4 800957A4 80610010 */  lwz       r3, 0x10(r1)
/* 0927A8 800957A8 80030150 */  lwz       r0, 0x150(r3)
/* 0927AC 800957AC 80630154 */  lwz       r3, 0x154(r3)
/* 0927B0 800957B0 907B0184 */  stw       r3, 0x184(r27)
/* 0927B4 800957B4 901B0180 */  stw       r0, 0x180(r27)
/* 0927B8 800957B8 80610010 */  lwz       r3, 0x10(r1)
/* 0927BC 800957BC 80030158 */  lwz       r0, 0x158(r3)
/* 0927C0 800957C0 8063015C */  lwz       r3, 0x15c(r3)
/* 0927C4 800957C4 907B0194 */  stw       r3, 0x194(r27)
/* 0927C8 800957C8 901B0190 */  stw       r0, 0x190(r27)
/* 0927CC 800957CC 80610010 */  lwz       r3, 0x10(r1)
/* 0927D0 800957D0 80030160 */  lwz       r0, 0x160(r3)
/* 0927D4 800957D4 80630164 */  lwz       r3, 0x164(r3)
/* 0927D8 800957D8 907B01A4 */  stw       r3, 0x1a4(r27)
/* 0927DC 800957DC 901B01A0 */  stw       r0, 0x1a0(r27)
/* 0927E0 800957E0 80610010 */  lwz       r3, 0x10(r1)
/* 0927E4 800957E4 80030168 */  lwz       r0, 0x168(r3)
/* 0927E8 800957E8 8063016C */  lwz       r3, 0x16c(r3)
/* 0927EC 800957EC 907B01B4 */  stw       r3, 0x1b4(r27)
/* 0927F0 800957F0 901B01B0 */  stw       r0, 0x1b0(r27)
/* 0927F4 800957F4 80610010 */  lwz       r3, 0x10(r1)
/* 0927F8 800957F8 80030170 */  lwz       r0, 0x170(r3)
/* 0927FC 800957FC 80630174 */  lwz       r3, 0x174(r3)
/* 092800 80095800 907B01C4 */  stw       r3, 0x1c4(r27)
/* 092804 80095804 901B01C0 */  stw       r0, 0x1c0(r27)
/* 092808 80095808 80A10010 */  lwz       r5, 0x10(r1)
/* 09280C 8009580C 3C80800F */  lis       r4, D_800EFFDC@ha
/* 092810 80095810 3C60A430 */  lis       r3, 0xa430
/* 092814 80095814 80C50178 */  lwz       r6, 0x178(r5)
/* 092818 80095818 3804FFDC */  addi      r0, r4, D_800EFFDC@l
/* 09281C 8009581C 80E5017C */  lwz       r7, 0x17c(r5)
/* 092820 80095820 3883000C */  addi      r4, r3, 0xc
/* 092824 80095824 38A1000C */  addi      r5, r1, 0xc
/* 092828 80095828 90FB01D4 */  stw       r7, 0x1d4(r27)
/* 09282C 8009582C 90DB01D0 */  stw       r6, 0x1d0(r27)
/* 092830 80095830 80C10010 */  lwz       r6, 0x10(r1)
/* 092834 80095834 80660180 */  lwz       r3, 0x180(r6)
/* 092838 80095838 80C60184 */  lwz       r6, 0x184(r6)
/* 09283C 8009583C 90DB01E4 */  stw       r6, 0x1e4(r27)
/* 092840 80095840 907B01E0 */  stw       r3, 0x1e0(r27)
/* 092844 80095844 80C10010 */  lwz       r6, 0x10(r1)
/* 092848 80095848 80660188 */  lwz       r3, 0x188(r6)
/* 09284C 8009584C 80C6018C */  lwz       r6, 0x18c(r6)
/* 092850 80095850 90DB01F4 */  stw       r6, 0x1f4(r27)
/* 092854 80095854 907B01F0 */  stw       r3, 0x1f0(r27)
/* 092858 80095858 80C10010 */  lwz       r6, 0x10(r1)
/* 09285C 8009585C 80660190 */  lwz       r3, 0x190(r6)
/* 092860 80095860 80C60194 */  lwz       r6, 0x194(r6)
/* 092864 80095864 90DB0204 */  stw       r6, 0x204(r27)
/* 092868 80095868 907B0200 */  stw       r3, 0x200(r27)
/* 09286C 8009586C 80C10010 */  lwz       r6, 0x10(r1)
/* 092870 80095870 80660198 */  lwz       r3, 0x198(r6)
/* 092874 80095874 80C6019C */  lwz       r6, 0x19c(r6)
/* 092878 80095878 90DB0214 */  stw       r6, 0x214(r27)
/* 09287C 8009587C 907B0210 */  stw       r3, 0x210(r27)
/* 092880 80095880 80C10010 */  lwz       r6, 0x10(r1)
/* 092884 80095884 806601A0 */  lwz       r3, 0x1a0(r6)
/* 092888 80095888 80C601A4 */  lwz       r6, 0x1a4(r6)
/* 09288C 8009588C 90DB0224 */  stw       r6, 0x224(r27)
/* 092890 80095890 907B0220 */  stw       r3, 0x220(r27)
/* 092894 80095894 80C10010 */  lwz       r6, 0x10(r1)
/* 092898 80095898 806601A8 */  lwz       r3, 0x1a8(r6)
/* 09289C 8009589C 80C601AC */  lwz       r6, 0x1ac(r6)
/* 0928A0 800958A0 90DB0234 */  stw       r6, 0x234(r27)
/* 0928A4 800958A4 907B0230 */  stw       r3, 0x230(r27)
/* 0928A8 800958A8 80610010 */  lwz       r3, 0x10(r1)
/* 0928AC 800958AC 80C30128 */  lwz       r6, 0x128(r3)
/* 0928B0 800958B0 9381000C */  stw       r28, 0xc(r1)
/* 0928B4 800958B4 8061000C */  lwz       r3, 0xc(r1)
/* 0928B8 800958B8 5463843E */  srwi      r3, r3, 16
/* 0928BC 800958BC 9061000C */  stw       r3, 0xc(r1)
/* 0928C0 800958C0 8061000C */  lwz       r3, 0xc(r1)
/* 0928C4 800958C4 7CC61838 */  and       r6, r6, r3
/* 0928C8 800958C8 54C3103A */  slwi      r3, r6, 2
/* 0928CC 800958CC 7C601A14 */  add       r3, r0, r3
/* 0928D0 800958D0 80030000 */  lwz       r0, 0x0(r3)
/* 0928D4 800958D4 9001000C */  stw       r0, 0xc(r1)
/* 0928D8 800958D8 807B0008 */  lwz       r3, 0x8(r27)
/* 0928DC 800958DC 8063003C */  lwz       r3, 0x3c(r3)
/* 0928E0 800958E0 4BFF72C1 */  bl        mipsPut32
/* 0928E4 800958E4 2C030000 */  cmpwi     r3, 0x0
/* 0928E8 800958E8 4082000C */  bne       lbl_800958F4
/* 0928EC 800958EC 38600000 */  li        r3, 0x0
/* 0928F0 800958F0 48000010 */  b         lbl_80095900
lbl_800958F4:
/* 0928F4 800958F4 7F63DB78 */  mr        r3, r27
/* 0928F8 800958F8 4BF9F1E1 */  bl        __cpuERET
/* 0928FC 800958FC 38600001 */  li        r3, 0x1
lbl_80095900:
/* 092900 80095900 BB61001C */  lmw       r27, 0x1c(r1)
/* 092904 80095904 80010034 */  lwz       r0, 0x34(r1)
/* 092908 80095908 38210030 */  addi      r1, r1, 0x30
/* 09290C 8009590C 7C0803A6 */  mtlr      r0
/* 092910 80095910 4E800020 */  blr

glabel __osPopThread
/* 092914 80095914 7C0802A6 */  mflr      r0
/* 092918 80095918 90010004 */  stw       r0, 0x4(r1)
/* 09291C 8009591C 9421FFE0 */  stwu      r1, -0x20(r1)
/* 092920 80095920 93E1001C */  stw       r31, 0x1c(r1)
/* 092924 80095924 93C10018 */  stw       r30, 0x18(r1)
/* 092928 80095928 93A10014 */  stw       r29, 0x14(r1)
/* 09292C 8009592C 7C7D1B78 */  mr        r29, r3
/* 092930 80095930 3BDD0F64 */  addi      r30, r29, 0xf64
/* 092934 80095934 80830064 */  lwz       r4, 0x64(r3)
/* 092938 80095938 3BFD0B64 */  addi      r31, r29, 0xb64
/* 09293C 8009593C 38BD0054 */  addi      r5, r29, 0x54
/* 092940 80095940 5480843E */  srwi      r0, r4, 16
/* 092944 80095944 7C1E00AE */  lbzx      r0, r30, r0
/* 092948 80095948 5400103A */  slwi      r0, r0, 2
/* 09294C 8009594C 7C7F002E */  lwzx      r3, r31, r0
/* 092950 80095950 81830014 */  lwz       r12, 0x14(r3)
/* 092954 80095954 80030008 */  lwz       r0, 0x8(r3)
/* 092958 80095958 7D8803A6 */  mtlr      r12
/* 09295C 8009595C 80630004 */  lwz       r3, 0x4(r3)
/* 092960 80095960 7C840214 */  add       r4, r4, r0
/* 092964 80095964 4E800021 */  blrl
/* 092968 80095968 809D0054 */  lwz       r4, 0x54(r29)
/* 09296C 8009596C 38BD010C */  addi      r5, r29, 0x10c
/* 092970 80095970 5480843E */  srwi      r0, r4, 16
/* 092974 80095974 7C1E00AE */  lbzx      r0, r30, r0
/* 092978 80095978 5400103A */  slwi      r0, r0, 2
/* 09297C 8009597C 7C7F002E */  lwzx      r3, r31, r0
/* 092980 80095980 81830014 */  lwz       r12, 0x14(r3)
/* 092984 80095984 80030008 */  lwz       r0, 0x8(r3)
/* 092988 80095988 7D8803A6 */  mtlr      r12
/* 09298C 8009598C 80630004 */  lwz       r3, 0x4(r3)
/* 092990 80095990 7C840214 */  add       r4, r4, r0
/* 092994 80095994 4E800021 */  blrl
/* 092998 80095998 809D0064 */  lwz       r4, 0x64(r29)
/* 09299C 8009599C 38BD010C */  addi      r5, r29, 0x10c
/* 0929A0 800959A0 5480843E */  srwi      r0, r4, 16
/* 0929A4 800959A4 7C1E00AE */  lbzx      r0, r30, r0
/* 0929A8 800959A8 5400103A */  slwi      r0, r0, 2
/* 0929AC 800959AC 7C7F002E */  lwzx      r3, r31, r0
/* 0929B0 800959B0 81830024 */  lwz       r12, 0x24(r3)
/* 0929B4 800959B4 80030008 */  lwz       r0, 0x8(r3)
/* 0929B8 800959B8 7D8803A6 */  mtlr      r12
/* 0929BC 800959BC 80630004 */  lwz       r3, 0x4(r3)
/* 0929C0 800959C0 7C840214 */  add       r4, r4, r0
/* 0929C4 800959C4 4E800021 */  blrl
/* 0929C8 800959C8 80010024 */  lwz       r0, 0x24(r1)
/* 0929CC 800959CC 38600001 */  li        r3, 0x1
/* 0929D0 800959D0 83E1001C */  lwz       r31, 0x1c(r1)
/* 0929D4 800959D4 83C10018 */  lwz       r30, 0x18(r1)
/* 0929D8 800959D8 7C0803A6 */  mtlr      r0
/* 0929DC 800959DC 83A10014 */  lwz       r29, 0x14(r1)
/* 0929E0 800959E0 38210020 */  addi      r1, r1, 0x20
/* 0929E4 800959E4 4E800020 */  blr

glabel __osEnqueueThread
/* 0929E8 800959E8 7C0802A6 */  mflr      r0
/* 0929EC 800959EC 90010004 */  stw       r0, 0x4(r1)
/* 0929F0 800959F0 9421FFE0 */  stwu      r1, -0x20(r1)
/* 0929F4 800959F4 93E1001C */  stw       r31, 0x1c(r1)
/* 0929F8 800959F8 93C10018 */  stw       r30, 0x18(r1)
/* 0929FC 800959FC 93A10014 */  stw       r29, 0x14(r1)
/* 092A00 80095A00 7C7D1B78 */  mr        r29, r3
/* 092A04 80095A04 3BDD0F64 */  addi      r30, r29, 0xf64
/* 092A08 80095A08 80030064 */  lwz       r0, 0x64(r3)
/* 092A0C 80095A0C 3BFD0B64 */  addi      r31, r29, 0xb64
/* 092A10 80095A10 38BD0104 */  addi      r5, r29, 0x104
/* 092A14 80095A14 9003010C */  stw       r0, 0x10c(r3)
/* 092A18 80095A18 80830064 */  lwz       r4, 0x64(r3)
/* 092A1C 80095A1C 5480843E */  srwi      r0, r4, 16
/* 092A20 80095A20 7C1E00AE */  lbzx      r0, r30, r0
/* 092A24 80095A24 5400103A */  slwi      r0, r0, 2
/* 092A28 80095A28 7C7F002E */  lwzx      r3, r31, r0
/* 092A2C 80095A2C 81830014 */  lwz       r12, 0x14(r3)
/* 092A30 80095A30 80030008 */  lwz       r0, 0x8(r3)
/* 092A34 80095A34 7D8803A6 */  mtlr      r12
/* 092A38 80095A38 80630004 */  lwz       r3, 0x4(r3)
/* 092A3C 80095A3C 7C840214 */  add       r4, r4, r0
/* 092A40 80095A40 4E800021 */  blrl
/* 092A44 80095A44 807D006C */  lwz       r3, 0x6c(r29)
/* 092A48 80095A48 38BD00BC */  addi      r5, r29, 0xbc
/* 092A4C 80095A4C 38830004 */  addi      r4, r3, 0x4
/* 092A50 80095A50 5480843E */  srwi      r0, r4, 16
/* 092A54 80095A54 7C1E00AE */  lbzx      r0, r30, r0
/* 092A58 80095A58 5400103A */  slwi      r0, r0, 2
/* 092A5C 80095A5C 7C7F002E */  lwzx      r3, r31, r0
/* 092A60 80095A60 81830014 */  lwz       r12, 0x14(r3)
/* 092A64 80095A64 80030008 */  lwz       r0, 0x8(r3)
/* 092A68 80095A68 7D8803A6 */  mtlr      r12
/* 092A6C 80095A6C 80630004 */  lwz       r3, 0x4(r3)
/* 092A70 80095A70 7C840214 */  add       r4, r4, r0
/* 092A74 80095A74 4E800021 */  blrl
/* 092A78 80095A78 807D0104 */  lwz       r3, 0x104(r29)
/* 092A7C 80095A7C 38BD00B4 */  addi      r5, r29, 0xb4
/* 092A80 80095A80 38830004 */  addi      r4, r3, 0x4
/* 092A84 80095A84 5480843E */  srwi      r0, r4, 16
/* 092A88 80095A88 7C1E00AE */  lbzx      r0, r30, r0
/* 092A8C 80095A8C 5400103A */  slwi      r0, r0, 2
/* 092A90 80095A90 7C7F002E */  lwzx      r3, r31, r0
/* 092A94 80095A94 81830014 */  lwz       r12, 0x14(r3)
/* 092A98 80095A98 80030008 */  lwz       r0, 0x8(r3)
/* 092A9C 80095A9C 7D8803A6 */  mtlr      r12
/* 092AA0 80095AA0 80630004 */  lwz       r3, 0x4(r3)
/* 092AA4 80095AA4 7C840214 */  add       r4, r4, r0
/* 092AA8 80095AA8 4E800021 */  blrl
/* 092AAC 80095AAC 48000070 */  b         lbl_80095B1C
lbl_80095AB0:
/* 092AB0 80095AB0 801D0104 */  lwz       r0, 0x104(r29)
/* 092AB4 80095AB4 38BD0104 */  addi      r5, r29, 0x104
/* 092AB8 80095AB8 901D010C */  stw       r0, 0x10c(r29)
/* 092ABC 80095ABC 809D0104 */  lwz       r4, 0x104(r29)
/* 092AC0 80095AC0 5480843E */  srwi      r0, r4, 16
/* 092AC4 80095AC4 7C1E00AE */  lbzx      r0, r30, r0
/* 092AC8 80095AC8 5400103A */  slwi      r0, r0, 2
/* 092ACC 80095ACC 7C7F002E */  lwzx      r3, r31, r0
/* 092AD0 80095AD0 81830014 */  lwz       r12, 0x14(r3)
/* 092AD4 80095AD4 80030008 */  lwz       r0, 0x8(r3)
/* 092AD8 80095AD8 7D8803A6 */  mtlr      r12
/* 092ADC 80095ADC 80630004 */  lwz       r3, 0x4(r3)
/* 092AE0 80095AE0 7C840214 */  add       r4, r4, r0
/* 092AE4 80095AE4 4E800021 */  blrl
/* 092AE8 80095AE8 807D0104 */  lwz       r3, 0x104(r29)
/* 092AEC 80095AEC 38BD00B4 */  addi      r5, r29, 0xb4
/* 092AF0 80095AF0 38830004 */  addi      r4, r3, 0x4
/* 092AF4 80095AF4 5480843E */  srwi      r0, r4, 16
/* 092AF8 80095AF8 7C1E00AE */  lbzx      r0, r30, r0
/* 092AFC 80095AFC 5400103A */  slwi      r0, r0, 2
/* 092B00 80095B00 7C7F002E */  lwzx      r3, r31, r0
/* 092B04 80095B04 81830014 */  lwz       r12, 0x14(r3)
/* 092B08 80095B08 80030008 */  lwz       r0, 0x8(r3)
/* 092B0C 80095B0C 7D8803A6 */  mtlr      r12
/* 092B10 80095B10 80630004 */  lwz       r3, 0x4(r3)
/* 092B14 80095B14 7C840214 */  add       r4, r4, r0
/* 092B18 80095B18 4E800021 */  blrl
lbl_80095B1C:
/* 092B1C 80095B1C 807D00B4 */  lwz       r3, 0xb4(r29)
/* 092B20 80095B20 801D00BC */  lwz       r0, 0xbc(r29)
/* 092B24 80095B24 7C030000 */  cmpw      r3, r0
/* 092B28 80095B28 4080FF88 */  bge       lbl_80095AB0
/* 092B2C 80095B2C 809D010C */  lwz       r4, 0x10c(r29)
/* 092B30 80095B30 38BD0104 */  addi      r5, r29, 0x104
/* 092B34 80095B34 5480843E */  srwi      r0, r4, 16
/* 092B38 80095B38 7C1E00AE */  lbzx      r0, r30, r0
/* 092B3C 80095B3C 5400103A */  slwi      r0, r0, 2
/* 092B40 80095B40 7C7F002E */  lwzx      r3, r31, r0
/* 092B44 80095B44 81830014 */  lwz       r12, 0x14(r3)
/* 092B48 80095B48 80030008 */  lwz       r0, 0x8(r3)
/* 092B4C 80095B4C 7D8803A6 */  mtlr      r12
/* 092B50 80095B50 80630004 */  lwz       r3, 0x4(r3)
/* 092B54 80095B54 7C840214 */  add       r4, r4, r0
/* 092B58 80095B58 4E800021 */  blrl
/* 092B5C 80095B5C 809D006C */  lwz       r4, 0x6c(r29)
/* 092B60 80095B60 38BD0104 */  addi      r5, r29, 0x104
/* 092B64 80095B64 5480843E */  srwi      r0, r4, 16
/* 092B68 80095B68 7C1E00AE */  lbzx      r0, r30, r0
/* 092B6C 80095B6C 5400103A */  slwi      r0, r0, 2
/* 092B70 80095B70 7C7F002E */  lwzx      r3, r31, r0
/* 092B74 80095B74 81830024 */  lwz       r12, 0x24(r3)
/* 092B78 80095B78 80030008 */  lwz       r0, 0x8(r3)
/* 092B7C 80095B7C 7D8803A6 */  mtlr      r12
/* 092B80 80095B80 80630004 */  lwz       r3, 0x4(r3)
/* 092B84 80095B84 7C840214 */  add       r4, r4, r0
/* 092B88 80095B88 4E800021 */  blrl
/* 092B8C 80095B8C 809D010C */  lwz       r4, 0x10c(r29)
/* 092B90 80095B90 38BD006C */  addi      r5, r29, 0x6c
/* 092B94 80095B94 5480843E */  srwi      r0, r4, 16
/* 092B98 80095B98 7C1E00AE */  lbzx      r0, r30, r0
/* 092B9C 80095B9C 5400103A */  slwi      r0, r0, 2
/* 092BA0 80095BA0 7C7F002E */  lwzx      r3, r31, r0
/* 092BA4 80095BA4 81830024 */  lwz       r12, 0x24(r3)
/* 092BA8 80095BA8 80030008 */  lwz       r0, 0x8(r3)
/* 092BAC 80095BAC 7D8803A6 */  mtlr      r12
/* 092BB0 80095BB0 80630004 */  lwz       r3, 0x4(r3)
/* 092BB4 80095BB4 7C840214 */  add       r4, r4, r0
/* 092BB8 80095BB8 4E800021 */  blrl
/* 092BBC 80095BBC 807D006C */  lwz       r3, 0x6c(r29)
/* 092BC0 80095BC0 38BD0064 */  addi      r5, r29, 0x64
/* 092BC4 80095BC4 38830008 */  addi      r4, r3, 0x8
/* 092BC8 80095BC8 5480843E */  srwi      r0, r4, 16
/* 092BCC 80095BCC 7C1E00AE */  lbzx      r0, r30, r0
/* 092BD0 80095BD0 5400103A */  slwi      r0, r0, 2
/* 092BD4 80095BD4 7C7F002E */  lwzx      r3, r31, r0
/* 092BD8 80095BD8 81830024 */  lwz       r12, 0x24(r3)
/* 092BDC 80095BDC 80030008 */  lwz       r0, 0x8(r3)
/* 092BE0 80095BE0 7D8803A6 */  mtlr      r12
/* 092BE4 80095BE4 80630004 */  lwz       r3, 0x4(r3)
/* 092BE8 80095BE8 7C840214 */  add       r4, r4, r0
/* 092BEC 80095BEC 4E800021 */  blrl
/* 092BF0 80095BF0 80010024 */  lwz       r0, 0x24(r1)
/* 092BF4 80095BF4 38600001 */  li        r3, 0x1
/* 092BF8 80095BF8 83E1001C */  lwz       r31, 0x1c(r1)
/* 092BFC 80095BFC 83C10018 */  lwz       r30, 0x18(r1)
/* 092C00 80095C00 7C0803A6 */  mtlr      r0
/* 092C04 80095C04 83A10014 */  lwz       r29, 0x14(r1)
/* 092C08 80095C08 38210020 */  addi      r1, r1, 0x20
/* 092C0C 80095C0C 4E800020 */  blr

glabel __osEnqueueAndYield
/* 092C10 80095C10 7C0802A6 */  mflr      r0
/* 092C14 80095C14 90010004 */  stw       r0, 0x4(r1)
/* 092C18 80095C18 9421FFD8 */  stwu      r1, -0x28(r1)
/* 092C1C 80095C1C 93E10024 */  stw       r31, 0x24(r1)
/* 092C20 80095C20 93C10020 */  stw       r30, 0x20(r1)
/* 092C24 80095C24 7C7E1B78 */  mr        r30, r3
/* 092C28 80095C28 38FE0F64 */  addi      r7, r30, 0xf64
/* 092C2C 80095C2C 80630008 */  lwz       r3, 0x8(r3)
/* 092C30 80095C30 38DE0B64 */  addi      r6, r30, 0xb64
/* 092C34 80095C34 38BE006C */  addi      r5, r30, 0x6c
/* 092C38 80095C38 80630058 */  lwz       r3, 0x58(r3)
/* 092C3C 80095C3C 80830060 */  lwz       r4, 0x60(r3)
/* 092C40 80095C40 80630024 */  lwz       r3, 0x24(r3)
/* 092C44 80095C44 5480843E */  srwi      r0, r4, 16
/* 092C48 80095C48 7C0700AE */  lbzx      r0, r7, r0
/* 092C4C 80095C4C 83E30000 */  lwz       r31, 0x0(r3)
/* 092C50 80095C50 5400103A */  slwi      r0, r0, 2
/* 092C54 80095C54 7C66002E */  lwzx      r3, r6, r0
/* 092C58 80095C58 81830014 */  lwz       r12, 0x14(r3)
/* 092C5C 80095C5C 80030008 */  lwz       r0, 0x8(r3)
/* 092C60 80095C60 7D8803A6 */  mtlr      r12
/* 092C64 80095C64 80630004 */  lwz       r3, 0x4(r3)
/* 092C68 80095C68 7C840214 */  add       r4, r4, r0
/* 092C6C 80095C6C 4E800021 */  blrl
/* 092C70 80095C70 80BE006C */  lwz       r5, 0x6c(r30)
/* 092C74 80095C74 387E0000 */  addi      r3, r30, 0x0
/* 092C78 80095C78 38810010 */  addi      r4, r1, 0x10
/* 092C7C 80095C7C 4BF9E3B9 */  bl        cpuGetAddressBuffer
/* 092C80 80095C80 2C030000 */  cmpwi     r3, 0x0
/* 092C84 80095C84 4082000C */  bne       lbl_80095C90
/* 092C88 80095C88 38600000 */  li        r3, 0x0
/* 092C8C 80095C8C 48000258 */  b         lbl_80095EE4
lbl_80095C90:
/* 092C90 80095C90 387E0000 */  addi      r3, r30, 0x0
/* 092C94 80095C94 38A10018 */  addi      r5, r1, 0x18
/* 092C98 80095C98 3880000C */  li        r4, 0xc
/* 092C9C 80095C9C 4BF9EED9 */  bl        cpuGetRegisterCP0
/* 092CA0 80095CA0 2C030000 */  cmpwi     r3, 0x0
/* 092CA4 80095CA4 4082000C */  bne       lbl_80095CB0
/* 092CA8 80095CA8 38600000 */  li        r3, 0x0
/* 092CAC 80095CAC 48000238 */  b         lbl_80095EE4
lbl_80095CB0:
/* 092CB0 80095CB0 8001001C */  lwz       r0, 0x1c(r1)
/* 092CB4 80095CB4 80610010 */  lwz       r3, 0x10(r1)
/* 092CB8 80095CB8 60000002 */  ori       r0, r0, 0x2
/* 092CBC 80095CBC 90030118 */  stw       r0, 0x118(r3)
/* 092CC0 80095CC0 809E00C0 */  lwz       r4, 0xc0(r30)
/* 092CC4 80095CC4 80BE00C4 */  lwz       r5, 0xc4(r30)
/* 092CC8 80095CC8 80610010 */  lwz       r3, 0x10(r1)
/* 092CCC 80095CCC 90A3009C */  stw       r5, 0x9c(r3)
/* 092CD0 80095CD0 90830098 */  stw       r4, 0x98(r3)
/* 092CD4 80095CD4 809E00C8 */  lwz       r4, 0xc8(r30)
/* 092CD8 80095CD8 80BE00CC */  lwz       r5, 0xcc(r30)
/* 092CDC 80095CDC 80610010 */  lwz       r3, 0x10(r1)
/* 092CE0 80095CE0 90A300A4 */  stw       r5, 0xa4(r3)
/* 092CE4 80095CE4 908300A0 */  stw       r4, 0xa0(r3)
/* 092CE8 80095CE8 809E00D0 */  lwz       r4, 0xd0(r30)
/* 092CEC 80095CEC 80BE00D4 */  lwz       r5, 0xd4(r30)
/* 092CF0 80095CF0 80610010 */  lwz       r3, 0x10(r1)
/* 092CF4 80095CF4 90A300AC */  stw       r5, 0xac(r3)
/* 092CF8 80095CF8 908300A8 */  stw       r4, 0xa8(r3)
/* 092CFC 80095CFC 809E00D8 */  lwz       r4, 0xd8(r30)
/* 092D00 80095D00 80BE00DC */  lwz       r5, 0xdc(r30)
/* 092D04 80095D04 80610010 */  lwz       r3, 0x10(r1)
/* 092D08 80095D08 90A300B4 */  stw       r5, 0xb4(r3)
/* 092D0C 80095D0C 908300B0 */  stw       r4, 0xb0(r3)
/* 092D10 80095D10 809E00E0 */  lwz       r4, 0xe0(r30)
/* 092D14 80095D14 80BE00E4 */  lwz       r5, 0xe4(r30)
/* 092D18 80095D18 80610010 */  lwz       r3, 0x10(r1)
/* 092D1C 80095D1C 90A300BC */  stw       r5, 0xbc(r3)
/* 092D20 80095D20 908300B8 */  stw       r4, 0xb8(r3)
/* 092D24 80095D24 809E00E8 */  lwz       r4, 0xe8(r30)
/* 092D28 80095D28 80BE00EC */  lwz       r5, 0xec(r30)
/* 092D2C 80095D2C 80610010 */  lwz       r3, 0x10(r1)
/* 092D30 80095D30 90A300C4 */  stw       r5, 0xc4(r3)
/* 092D34 80095D34 908300C0 */  stw       r4, 0xc0(r3)
/* 092D38 80095D38 809E00F0 */  lwz       r4, 0xf0(r30)
/* 092D3C 80095D3C 80BE00F4 */  lwz       r5, 0xf4(r30)
/* 092D40 80095D40 80610010 */  lwz       r3, 0x10(r1)
/* 092D44 80095D44 90A300CC */  stw       r5, 0xcc(r3)
/* 092D48 80095D48 908300C8 */  stw       r4, 0xc8(r3)
/* 092D4C 80095D4C 809E00F8 */  lwz       r4, 0xf8(r30)
/* 092D50 80095D50 80BE00FC */  lwz       r5, 0xfc(r30)
/* 092D54 80095D54 80610010 */  lwz       r3, 0x10(r1)
/* 092D58 80095D58 90A300D4 */  stw       r5, 0xd4(r3)
/* 092D5C 80095D5C 908300D0 */  stw       r4, 0xd0(r3)
/* 092D60 80095D60 809E0120 */  lwz       r4, 0x120(r30)
/* 092D64 80095D64 80BE0124 */  lwz       r5, 0x124(r30)
/* 092D68 80095D68 80610010 */  lwz       r3, 0x10(r1)
/* 092D6C 80095D6C 90A300EC */  stw       r5, 0xec(r3)
/* 092D70 80095D70 908300E8 */  stw       r4, 0xe8(r3)
/* 092D74 80095D74 809E0128 */  lwz       r4, 0x128(r30)
/* 092D78 80095D78 80BE012C */  lwz       r5, 0x12c(r30)
/* 092D7C 80095D7C 80610010 */  lwz       r3, 0x10(r1)
/* 092D80 80095D80 90A300F4 */  stw       r5, 0xf4(r3)
/* 092D84 80095D84 908300F0 */  stw       r4, 0xf0(r3)
/* 092D88 80095D88 809E0130 */  lwz       r4, 0x130(r30)
/* 092D8C 80095D8C 80BE0134 */  lwz       r5, 0x134(r30)
/* 092D90 80095D90 80610010 */  lwz       r3, 0x10(r1)
/* 092D94 80095D94 90A300FC */  stw       r5, 0xfc(r3)
/* 092D98 80095D98 908300F8 */  stw       r4, 0xf8(r3)
/* 092D9C 80095D9C 809E0138 */  lwz       r4, 0x138(r30)
/* 092DA0 80095DA0 80BE013C */  lwz       r5, 0x13c(r30)
/* 092DA4 80095DA4 80610010 */  lwz       r3, 0x10(r1)
/* 092DA8 80095DA8 90A30104 */  stw       r5, 0x104(r3)
/* 092DAC 80095DAC 90830100 */  stw       r4, 0x100(r3)
/* 092DB0 80095DB0 809E0038 */  lwz       r4, 0x38(r30)
/* 092DB4 80095DB4 80610010 */  lwz       r3, 0x10(r1)
/* 092DB8 80095DB8 9083011C */  stw       r4, 0x11c(r3)
/* 092DBC 80095DBC 809E0A3C */  lwz       r4, 0xa3c(r30)
/* 092DC0 80095DC0 80610010 */  lwz       r3, 0x10(r1)
/* 092DC4 80095DC4 9083012C */  stw       r4, 0x12c(r3)
/* 092DC8 80095DC8 809E01E0 */  lwz       r4, 0x1e0(r30)
/* 092DCC 80095DCC 80BE01E4 */  lwz       r5, 0x1e4(r30)
/* 092DD0 80095DD0 80610010 */  lwz       r3, 0x10(r1)
/* 092DD4 80095DD4 90A30184 */  stw       r5, 0x184(r3)
/* 092DD8 80095DD8 90830180 */  stw       r4, 0x180(r3)
/* 092DDC 80095DDC 809E01F0 */  lwz       r4, 0x1f0(r30)
/* 092DE0 80095DE0 80BE01F4 */  lwz       r5, 0x1f4(r30)
/* 092DE4 80095DE4 80610010 */  lwz       r3, 0x10(r1)
/* 092DE8 80095DE8 90A3018C */  stw       r5, 0x18c(r3)
/* 092DEC 80095DEC 90830188 */  stw       r4, 0x188(r3)
/* 092DF0 80095DF0 809E0200 */  lwz       r4, 0x200(r30)
/* 092DF4 80095DF4 80BE0204 */  lwz       r5, 0x204(r30)
/* 092DF8 80095DF8 80610010 */  lwz       r3, 0x10(r1)
/* 092DFC 80095DFC 90A30194 */  stw       r5, 0x194(r3)
/* 092E00 80095E00 90830190 */  stw       r4, 0x190(r3)
/* 092E04 80095E04 809E0210 */  lwz       r4, 0x210(r30)
/* 092E08 80095E08 80BE0214 */  lwz       r5, 0x214(r30)
/* 092E0C 80095E0C 80610010 */  lwz       r3, 0x10(r1)
/* 092E10 80095E10 90A3019C */  stw       r5, 0x19c(r3)
/* 092E14 80095E14 90830198 */  stw       r4, 0x198(r3)
/* 092E18 80095E18 809E0220 */  lwz       r4, 0x220(r30)
/* 092E1C 80095E1C 80BE0224 */  lwz       r5, 0x224(r30)
/* 092E20 80095E20 80610010 */  lwz       r3, 0x10(r1)
/* 092E24 80095E24 90A301A4 */  stw       r5, 0x1a4(r3)
/* 092E28 80095E28 908301A0 */  stw       r4, 0x1a0(r3)
/* 092E2C 80095E2C 809E0230 */  lwz       r4, 0x230(r30)
/* 092E30 80095E30 80BE0234 */  lwz       r5, 0x234(r30)
/* 092E34 80095E34 80610010 */  lwz       r3, 0x10(r1)
/* 092E38 80095E38 90A301AC */  stw       r5, 0x1ac(r3)
/* 092E3C 80095E3C 908301A8 */  stw       r4, 0x1a8(r3)
/* 092E40 80095E40 5404042F */  rlwinm.   r4, r0, 0, 16, 23
/* 092E44 80095E44 41820020 */  beq       lbl_80095E64
/* 092E48 80095E48 7FE5F8F8 */  nor       r5, r31, r31
/* 092E4C 80095E4C 80610010 */  lwz       r3, 0x10(r1)
/* 092E50 80095E50 54A5042E */  rlwinm    r5, r5, 0, 16, 23
/* 092E54 80095E54 7CA52378 */  or        r5, r5, r4
/* 092E58 80095E58 5400061E */  rlwinm    r0, r0, 0, 24, 15
/* 092E5C 80095E5C 7CA50378 */  or        r5, r5, r0
/* 092E60 80095E60 90A30118 */  stw       r5, 0x118(r3)
lbl_80095E64:
/* 092E64 80095E64 80BE0008 */  lwz       r5, 0x8(r30)
/* 092E68 80095E68 3C60A430 */  lis       r3, 0xa430
/* 092E6C 80095E6C 3883000C */  addi      r4, r3, 0xc
/* 092E70 80095E70 8065003C */  lwz       r3, 0x3c(r5)
/* 092E74 80095E74 38A1000C */  addi      r5, r1, 0xc
/* 092E78 80095E78 4BFF6CA9 */  bl        mipsGet32
/* 092E7C 80095E7C 2C030000 */  cmpwi     r3, 0x0
/* 092E80 80095E80 4082000C */  bne       lbl_80095E8C
/* 092E84 80095E84 38600000 */  li        r3, 0x0
/* 092E88 80095E88 4800005C */  b         lbl_80095EE4
lbl_80095E8C:
/* 092E8C 80095E8C 8081000C */  lwz       r4, 0xc(r1)
/* 092E90 80095E90 28040000 */  cmplwi    r4, 0x0
/* 092E94 80095E94 41820024 */  beq       lbl_80095EB8
/* 092E98 80095E98 80610010 */  lwz       r3, 0x10(r1)
/* 092E9C 80095E9C 57E0843E */  srwi      r0, r31, 16
/* 092EA0 80095EA0 7C0500F8 */  nor       r5, r0, r0
/* 092EA4 80095EA4 80030128 */  lwz       r0, 0x128(r3)
/* 092EA8 80095EA8 54A506BE */  clrlwi    r5, r5, 26
/* 092EAC 80095EAC 7CA00038 */  and       r0, r5, r0
/* 092EB0 80095EB0 7C800378 */  or        r0, r4, r0
/* 092EB4 80095EB4 9001000C */  stw       r0, 0xc(r1)
lbl_80095EB8:
/* 092EB8 80095EB8 8001000C */  lwz       r0, 0xc(r1)
/* 092EBC 80095EBC 80610010 */  lwz       r3, 0x10(r1)
/* 092EC0 80095EC0 90030128 */  stw       r0, 0x128(r3)
/* 092EC4 80095EC4 801E0064 */  lwz       r0, 0x64(r30)
/* 092EC8 80095EC8 28000000 */  cmplwi    r0, 0x0
/* 092ECC 80095ECC 4182000C */  beq       lbl_80095ED8
/* 092ED0 80095ED0 7FC3F378 */  mr        r3, r30
/* 092ED4 80095ED4 4BFFFB15 */  bl        __osEnqueueThread
lbl_80095ED8:
/* 092ED8 80095ED8 7FC3F378 */  mr        r3, r30
/* 092EDC 80095EDC 4BFFF495 */  bl        __osDispatchThread
/* 092EE0 80095EE0 38600001 */  li        r3, 0x1
lbl_80095EE4:
/* 092EE4 80095EE4 8001002C */  lwz       r0, 0x2c(r1)
/* 092EE8 80095EE8 83E10024 */  lwz       r31, 0x24(r1)
/* 092EEC 80095EEC 83C10020 */  lwz       r30, 0x20(r1)
/* 092EF0 80095EF0 7C0803A6 */  mtlr      r0
/* 092EF4 80095EF4 38210028 */  addi      r1, r1, 0x28
/* 092EF8 80095EF8 4E800020 */  blr

glabel send_mesg
/* 092EFC 80095EFC 7C0802A6 */  mflr      r0
/* 092F00 80095F00 90010004 */  stw       r0, 0x4(r1)
/* 092F04 80095F04 9421FFE0 */  stwu      r1, -0x20(r1)
/* 092F08 80095F08 93E1001C */  stw       r31, 0x1c(r1)
/* 092F0C 80095F0C 93C10018 */  stw       r30, 0x18(r1)
/* 092F10 80095F10 93A10014 */  stw       r29, 0x14(r1)
/* 092F14 80095F14 93810010 */  stw       r28, 0x10(r1)
/* 092F18 80095F18 7C7C1B78 */  mr        r28, r3
/* 092F1C 80095F1C 3BBC0F64 */  addi      r29, r28, 0xf64
/* 092F20 80095F20 80630008 */  lwz       r3, 0x8(r3)
/* 092F24 80095F24 3BDC0B64 */  addi      r30, r28, 0xb64
/* 092F28 80095F28 38BC008C */  addi      r5, r28, 0x8c
/* 092F2C 80095F2C 83E30058 */  lwz       r31, 0x58(r3)
/* 092F30 80095F30 801F0064 */  lwz       r0, 0x64(r31)
/* 092F34 80095F34 901C0094 */  stw       r0, 0x94(r28)
/* 092F38 80095F38 807C0094 */  lwz       r3, 0x94(r28)
/* 092F3C 80095F3C 801C0064 */  lwz       r0, 0x64(r28)
/* 092F40 80095F40 7C030214 */  add       r0, r3, r0
/* 092F44 80095F44 901C0094 */  stw       r0, 0x94(r28)
/* 092F48 80095F48 809C0094 */  lwz       r4, 0x94(r28)
/* 092F4C 80095F4C 5480843E */  srwi      r0, r4, 16
/* 092F50 80095F50 7C1D00AE */  lbzx      r0, r29, r0
/* 092F54 80095F54 5400103A */  slwi      r0, r0, 2
/* 092F58 80095F58 7C7E002E */  lwzx      r3, r30, r0
/* 092F5C 80095F5C 81830014 */  lwz       r12, 0x14(r3)
/* 092F60 80095F60 80030008 */  lwz       r0, 0x8(r3)
/* 092F64 80095F64 7D8803A6 */  mtlr      r12
/* 092F68 80095F68 80630004 */  lwz       r3, 0x4(r3)
/* 092F6C 80095F6C 7C840214 */  add       r4, r4, r0
/* 092F70 80095F70 4E800021 */  blrl
/* 092F74 80095F74 807C008C */  lwz       r3, 0x8c(r28)
/* 092F78 80095F78 28030000 */  cmplwi    r3, 0x0
/* 092F7C 80095F7C 418202EC */  beq       lbl_80096268
/* 092F80 80095F80 38830008 */  addi      r4, r3, 0x8
/* 092F84 80095F84 5480843E */  srwi      r0, r4, 16
/* 092F88 80095F88 7C1D00AE */  lbzx      r0, r29, r0
/* 092F8C 80095F8C 38BC009C */  addi      r5, r28, 0x9c
/* 092F90 80095F90 5400103A */  slwi      r0, r0, 2
/* 092F94 80095F94 7C7E002E */  lwzx      r3, r30, r0
/* 092F98 80095F98 81830014 */  lwz       r12, 0x14(r3)
/* 092F9C 80095F9C 80030008 */  lwz       r0, 0x8(r3)
/* 092FA0 80095FA0 7D8803A6 */  mtlr      r12
/* 092FA4 80095FA4 80630004 */  lwz       r3, 0x4(r3)
/* 092FA8 80095FA8 7C840214 */  add       r4, r4, r0
/* 092FAC 80095FAC 4E800021 */  blrl
/* 092FB0 80095FB0 807C008C */  lwz       r3, 0x8c(r28)
/* 092FB4 80095FB4 38BC00A4 */  addi      r5, r28, 0xa4
/* 092FB8 80095FB8 38830010 */  addi      r4, r3, 0x10
/* 092FBC 80095FBC 5480843E */  srwi      r0, r4, 16
/* 092FC0 80095FC0 7C1D00AE */  lbzx      r0, r29, r0
/* 092FC4 80095FC4 5400103A */  slwi      r0, r0, 2
/* 092FC8 80095FC8 7C7E002E */  lwzx      r3, r30, r0
/* 092FCC 80095FCC 81830014 */  lwz       r12, 0x14(r3)
/* 092FD0 80095FD0 80030008 */  lwz       r0, 0x8(r3)
/* 092FD4 80095FD4 7D8803A6 */  mtlr      r12
/* 092FD8 80095FD8 80630004 */  lwz       r3, 0x4(r3)
/* 092FDC 80095FDC 7C840214 */  add       r4, r4, r0
/* 092FE0 80095FE0 4E800021 */  blrl
/* 092FE4 80095FE4 807C009C */  lwz       r3, 0x9c(r28)
/* 092FE8 80095FE8 801C00A4 */  lwz       r0, 0xa4(r28)
/* 092FEC 80095FEC 7C030000 */  cmpw      r3, r0
/* 092FF0 80095FF0 40800278 */  bge       lbl_80096268
/* 092FF4 80095FF4 807C008C */  lwz       r3, 0x8c(r28)
/* 092FF8 80095FF8 38BC00AC */  addi      r5, r28, 0xac
/* 092FFC 80095FFC 3883000C */  addi      r4, r3, 0xc
/* 093000 80096000 5480843E */  srwi      r0, r4, 16
/* 093004 80096004 7C1D00AE */  lbzx      r0, r29, r0
/* 093008 80096008 5400103A */  slwi      r0, r0, 2
/* 09300C 8009600C 7C7E002E */  lwzx      r3, r30, r0
/* 093010 80096010 81830014 */  lwz       r12, 0x14(r3)
/* 093014 80096014 80030008 */  lwz       r0, 0x8(r3)
/* 093018 80096018 7D8803A6 */  mtlr      r12
/* 09301C 8009601C 80630004 */  lwz       r3, 0x4(r3)
/* 093020 80096020 7C840214 */  add       r4, r4, r0
/* 093024 80096024 4E800021 */  blrl
/* 093028 80096028 807C00AC */  lwz       r3, 0xac(r28)
/* 09302C 8009602C 38BC00A4 */  addi      r5, r28, 0xa4
/* 093030 80096030 801C009C */  lwz       r0, 0x9c(r28)
/* 093034 80096034 7C030214 */  add       r0, r3, r0
/* 093038 80096038 901C00AC */  stw       r0, 0xac(r28)
/* 09303C 8009603C 809C00AC */  lwz       r4, 0xac(r28)
/* 093040 80096040 807C00A4 */  lwz       r3, 0xa4(r28)
/* 093044 80096044 7C041B96 */  divwu     r0, r4, r3
/* 093048 80096048 7C0019D6 */  mullw     r0, r0, r3
/* 09304C 8009604C 7C002050 */  subf      r0, r0, r4
/* 093050 80096050 901C00AC */  stw       r0, 0xac(r28)
/* 093054 80096054 807C008C */  lwz       r3, 0x8c(r28)
/* 093058 80096058 38830014 */  addi      r4, r3, 0x14
/* 09305C 8009605C 5480843E */  srwi      r0, r4, 16
/* 093060 80096060 7C1D00AE */  lbzx      r0, r29, r0
/* 093064 80096064 5400103A */  slwi      r0, r0, 2
/* 093068 80096068 7C7E002E */  lwzx      r3, r30, r0
/* 09306C 8009606C 81830014 */  lwz       r12, 0x14(r3)
/* 093070 80096070 80030008 */  lwz       r0, 0x8(r3)
/* 093074 80096074 7D8803A6 */  mtlr      r12
/* 093078 80096078 80630004 */  lwz       r3, 0x4(r3)
/* 09307C 8009607C 7C840214 */  add       r4, r4, r0
/* 093080 80096080 4E800021 */  blrl
/* 093084 80096084 801C00AC */  lwz       r0, 0xac(r28)
/* 093088 80096088 38BC00AC */  addi      r5, r28, 0xac
/* 09308C 8009608C 5400103A */  slwi      r0, r0, 2
/* 093090 80096090 901C00AC */  stw       r0, 0xac(r28)
/* 093094 80096094 807C00A4 */  lwz       r3, 0xa4(r28)
/* 093098 80096098 801C00AC */  lwz       r0, 0xac(r28)
/* 09309C 8009609C 7C030214 */  add       r0, r3, r0
/* 0930A0 800960A0 901C00A4 */  stw       r0, 0xa4(r28)
/* 0930A4 800960A4 807C0094 */  lwz       r3, 0x94(r28)
/* 0930A8 800960A8 38830004 */  addi      r4, r3, 0x4
/* 0930AC 800960AC 5480843E */  srwi      r0, r4, 16
/* 0930B0 800960B0 7C1D00AE */  lbzx      r0, r29, r0
/* 0930B4 800960B4 5400103A */  slwi      r0, r0, 2
/* 0930B8 800960B8 7C7E002E */  lwzx      r3, r30, r0
/* 0930BC 800960BC 81830014 */  lwz       r12, 0x14(r3)
/* 0930C0 800960C0 80030008 */  lwz       r0, 0x8(r3)
/* 0930C4 800960C4 7D8803A6 */  mtlr      r12
/* 0930C8 800960C8 80630004 */  lwz       r3, 0x4(r3)
/* 0930CC 800960CC 7C840214 */  add       r4, r4, r0
/* 0930D0 800960D0 4E800021 */  blrl
/* 0930D4 800960D4 809C00A4 */  lwz       r4, 0xa4(r28)
/* 0930D8 800960D8 38BC00AC */  addi      r5, r28, 0xac
/* 0930DC 800960DC 5480843E */  srwi      r0, r4, 16
/* 0930E0 800960E0 7C1D00AE */  lbzx      r0, r29, r0
/* 0930E4 800960E4 5400103A */  slwi      r0, r0, 2
/* 0930E8 800960E8 7C7E002E */  lwzx      r3, r30, r0
/* 0930EC 800960EC 81830024 */  lwz       r12, 0x24(r3)
/* 0930F0 800960F0 80030008 */  lwz       r0, 0x8(r3)
/* 0930F4 800960F4 7D8803A6 */  mtlr      r12
/* 0930F8 800960F8 80630004 */  lwz       r3, 0x4(r3)
/* 0930FC 800960FC 7C840214 */  add       r4, r4, r0
/* 093100 80096100 4E800021 */  blrl
/* 093104 80096104 807C009C */  lwz       r3, 0x9c(r28)
/* 093108 80096108 38BC0094 */  addi      r5, r28, 0x94
/* 09310C 8009610C 38030001 */  addi      r0, r3, 0x1
/* 093110 80096110 901C0094 */  stw       r0, 0x94(r28)
/* 093114 80096114 807C008C */  lwz       r3, 0x8c(r28)
/* 093118 80096118 38830008 */  addi      r4, r3, 0x8
/* 09311C 8009611C 5480843E */  srwi      r0, r4, 16
/* 093120 80096120 7C1D00AE */  lbzx      r0, r29, r0
/* 093124 80096124 5400103A */  slwi      r0, r0, 2
/* 093128 80096128 7C7E002E */  lwzx      r3, r30, r0
/* 09312C 8009612C 81830024 */  lwz       r12, 0x24(r3)
/* 093130 80096130 80030008 */  lwz       r0, 0x8(r3)
/* 093134 80096134 7D8803A6 */  mtlr      r12
/* 093138 80096138 80630004 */  lwz       r3, 0x4(r3)
/* 09313C 8009613C 7C840214 */  add       r4, r4, r0
/* 093140 80096140 4E800021 */  blrl
/* 093144 80096144 809C008C */  lwz       r4, 0x8c(r28)
/* 093148 80096148 38BC0094 */  addi      r5, r28, 0x94
/* 09314C 8009614C 5480843E */  srwi      r0, r4, 16
/* 093150 80096150 7C1D00AE */  lbzx      r0, r29, r0
/* 093154 80096154 5400103A */  slwi      r0, r0, 2
/* 093158 80096158 7C7E002E */  lwzx      r3, r30, r0
/* 09315C 8009615C 81830014 */  lwz       r12, 0x14(r3)
/* 093160 80096160 80030008 */  lwz       r0, 0x8(r3)
/* 093164 80096164 7D8803A6 */  mtlr      r12
/* 093168 80096168 80630004 */  lwz       r3, 0x4(r3)
/* 09316C 8009616C 7C840214 */  add       r4, r4, r0
/* 093170 80096170 4E800021 */  blrl
/* 093174 80096174 809C0094 */  lwz       r4, 0x94(r28)
/* 093178 80096178 38BC009C */  addi      r5, r28, 0x9c
/* 09317C 8009617C 5480843E */  srwi      r0, r4, 16
/* 093180 80096180 7C1D00AE */  lbzx      r0, r29, r0
/* 093184 80096184 5400103A */  slwi      r0, r0, 2
/* 093188 80096188 7C7E002E */  lwzx      r3, r30, r0
/* 09318C 8009618C 81830014 */  lwz       r12, 0x14(r3)
/* 093190 80096190 80030008 */  lwz       r0, 0x8(r3)
/* 093194 80096194 7D8803A6 */  mtlr      r12
/* 093198 80096198 80630004 */  lwz       r3, 0x4(r3)
/* 09319C 8009619C 7C840214 */  add       r4, r4, r0
/* 0931A0 800961A0 4E800021 */  blrl
/* 0931A4 800961A4 801C009C */  lwz       r0, 0x9c(r28)
/* 0931A8 800961A8 28000000 */  cmplwi    r0, 0x0
/* 0931AC 800961AC 418200BC */  beq       lbl_80096268
/* 0931B0 800961B0 801C008C */  lwz       r0, 0x8c(r28)
/* 0931B4 800961B4 38BC0054 */  addi      r5, r28, 0x54
/* 0931B8 800961B8 901C0064 */  stw       r0, 0x64(r28)
/* 0931BC 800961BC 809C0064 */  lwz       r4, 0x64(r28)
/* 0931C0 800961C0 5480843E */  srwi      r0, r4, 16
/* 0931C4 800961C4 7C1D00AE */  lbzx      r0, r29, r0
/* 0931C8 800961C8 5400103A */  slwi      r0, r0, 2
/* 0931CC 800961CC 7C7E002E */  lwzx      r3, r30, r0
/* 0931D0 800961D0 81830014 */  lwz       r12, 0x14(r3)
/* 0931D4 800961D4 80030008 */  lwz       r0, 0x8(r3)
/* 0931D8 800961D8 7D8803A6 */  mtlr      r12
/* 0931DC 800961DC 80630004 */  lwz       r3, 0x4(r3)
/* 0931E0 800961E0 7C840214 */  add       r4, r4, r0
/* 0931E4 800961E4 4E800021 */  blrl
/* 0931E8 800961E8 809C0054 */  lwz       r4, 0x54(r28)
/* 0931EC 800961EC 38BC010C */  addi      r5, r28, 0x10c
/* 0931F0 800961F0 5480843E */  srwi      r0, r4, 16
/* 0931F4 800961F4 7C1D00AE */  lbzx      r0, r29, r0
/* 0931F8 800961F8 5400103A */  slwi      r0, r0, 2
/* 0931FC 800961FC 7C7E002E */  lwzx      r3, r30, r0
/* 093200 80096200 81830014 */  lwz       r12, 0x14(r3)
/* 093204 80096204 80030008 */  lwz       r0, 0x8(r3)
/* 093208 80096208 7D8803A6 */  mtlr      r12
/* 09320C 8009620C 80630004 */  lwz       r3, 0x4(r3)
/* 093210 80096210 7C840214 */  add       r4, r4, r0
/* 093214 80096214 4E800021 */  blrl
/* 093218 80096218 809C0064 */  lwz       r4, 0x64(r28)
/* 09321C 8009621C 38BC010C */  addi      r5, r28, 0x10c
/* 093220 80096220 5480843E */  srwi      r0, r4, 16
/* 093224 80096224 7C1D00AE */  lbzx      r0, r29, r0
/* 093228 80096228 5400103A */  slwi      r0, r0, 2
/* 09322C 8009622C 7C7E002E */  lwzx      r3, r30, r0
/* 093230 80096230 81830024 */  lwz       r12, 0x24(r3)
/* 093234 80096234 80030008 */  lwz       r0, 0x8(r3)
/* 093238 80096238 7D8803A6 */  mtlr      r12
/* 09323C 8009623C 80630004 */  lwz       r3, 0x4(r3)
/* 093240 80096240 7C840214 */  add       r4, r4, r0
/* 093244 80096244 4E800021 */  blrl
/* 093248 80096248 801C0054 */  lwz       r0, 0x54(r28)
/* 09324C 8009624C 7F83E378 */  mr        r3, r28
/* 093250 80096250 901C0094 */  stw       r0, 0x94(r28)
/* 093254 80096254 801C0094 */  lwz       r0, 0x94(r28)
/* 093258 80096258 901C006C */  stw       r0, 0x6c(r28)
/* 09325C 8009625C 801F0050 */  lwz       r0, 0x50(r31)
/* 093260 80096260 901C0064 */  stw       r0, 0x64(r28)
/* 093264 80096264 4BFFF785 */  bl        __osEnqueueThread
lbl_80096268:
/* 093268 80096268 80010024 */  lwz       r0, 0x24(r1)
/* 09326C 8009626C 38600001 */  li        r3, 0x1
/* 093270 80096270 83E1001C */  lwz       r31, 0x1c(r1)
/* 093274 80096274 83C10018 */  lwz       r30, 0x18(r1)
/* 093278 80096278 7C0803A6 */  mtlr      r0
/* 09327C 8009627C 83A10014 */  lwz       r29, 0x14(r1)
/* 093280 80096280 83810010 */  lwz       r28, 0x10(r1)
/* 093284 80096284 38210020 */  addi      r1, r1, 0x20
/* 093288 80096288 4E800020 */  blr

glabel __osException
/* 09328C 8009628C 7C0802A6 */  mflr      r0
/* 093290 80096290 90010004 */  stw       r0, 0x4(r1)
/* 093294 80096294 9421FF90 */  stwu      r1, -0x70(r1)
/* 093298 80096298 BE210034 */  stmw      r17, 0x34(r1)
/* 09329C 8009629C 7C7D1B78 */  mr        r29, r3
/* 0932A0 800962A0 3BFD0B64 */  addi      r31, r29, 0xb64
/* 0932A4 800962A4 3BDD0F64 */  addi      r30, r29, 0xf64
/* 0932A8 800962A8 38A10028 */  addi      r5, r1, 0x28
/* 0932AC 800962AC 80830008 */  lwz       r4, 0x8(r3)
/* 0932B0 800962B0 82640058 */  lwz       r19, 0x58(r4)
/* 0932B4 800962B4 3880000C */  li        r4, 0xc
/* 0932B8 800962B8 80D30024 */  lwz       r6, 0x24(r19)
/* 0932BC 800962BC 80060000 */  lwz       r0, 0x0(r6)
/* 0932C0 800962C0 90010010 */  stw       r0, 0x10(r1)
/* 0932C4 800962C4 82E10010 */  lwz       r23, 0x10(r1)
/* 0932C8 800962C8 4BF9E8AD */  bl        cpuGetRegisterCP0
/* 0932CC 800962CC 2C030000 */  cmpwi     r3, 0x0
/* 0932D0 800962D0 4082000C */  bne       lbl_800962DC
/* 0932D4 800962D4 38600000 */  li        r3, 0x0
/* 0932D8 800962D8 48000C84 */  b         lbl_80096F5C
lbl_800962DC:
/* 0932DC 800962DC 80C1002C */  lwz       r6, 0x2c(r1)
/* 0932E0 800962E0 3880FFFC */  li        r4, -0x4
/* 0932E4 800962E4 80A10028 */  lwz       r5, 0x28(r1)
/* 0932E8 800962E8 3800FFFF */  li        r0, -0x1
/* 0932EC 800962EC 3AC60000 */  addi      r22, r6, 0x0
/* 0932F0 800962F0 387D0000 */  addi      r3, r29, 0x0
/* 0932F4 800962F4 7CC62038 */  and       r6, r6, r4
/* 0932F8 800962F8 7CA50038 */  and       r5, r5, r0
/* 0932FC 800962FC 3880000C */  li        r4, 0xc
/* 093300 80096300 4BF9EB1D */  bl        cpuSetRegisterCP0
/* 093304 80096304 2C030000 */  cmpwi     r3, 0x0
/* 093308 80096308 4082000C */  bne       lbl_80096314
/* 09330C 8009630C 38600000 */  li        r3, 0x0
/* 093310 80096310 48000C4C */  b         lbl_80096F5C
lbl_80096314:
/* 093314 80096314 80930060 */  lwz       r4, 0x60(r19)
/* 093318 80096318 38BD0114 */  addi      r5, r29, 0x114
/* 09331C 8009631C 5480843E */  srwi      r0, r4, 16
/* 093320 80096320 7C1E00AE */  lbzx      r0, r30, r0
/* 093324 80096324 5400103A */  slwi      r0, r0, 2
/* 093328 80096328 7C7F002E */  lwzx      r3, r31, r0
/* 09332C 8009632C 81830014 */  lwz       r12, 0x14(r3)
/* 093330 80096330 80030008 */  lwz       r0, 0x8(r3)
/* 093334 80096334 7D8803A6 */  mtlr      r12
/* 093338 80096338 80630004 */  lwz       r3, 0x4(r3)
/* 09333C 8009633C 7C840214 */  add       r4, r4, r0
/* 093340 80096340 4E800021 */  blrl
/* 093344 80096344 80BD0114 */  lwz       r5, 0x114(r29)
/* 093348 80096348 387D0000 */  addi      r3, r29, 0x0
/* 09334C 8009634C 38810018 */  addi      r4, r1, 0x18
/* 093350 80096350 4BF9DCE5 */  bl        cpuGetAddressBuffer
/* 093354 80096354 2C030000 */  cmpwi     r3, 0x0
/* 093358 80096358 4082000C */  bne       lbl_80096364
/* 09335C 8009635C 38600000 */  li        r3, 0x0
/* 093360 80096360 48000BFC */  b         lbl_80096F5C
lbl_80096364:
/* 093364 80096364 801D0048 */  lwz       r0, 0x48(r29)
/* 093368 80096368 809D004C */  lwz       r4, 0x4c(r29)
/* 09336C 8009636C 80610018 */  lwz       r3, 0x18(r1)
/* 093370 80096370 90830024 */  stw       r4, 0x24(r3)
/* 093374 80096374 90030020 */  stw       r0, 0x20(r3)
/* 093378 80096378 80610018 */  lwz       r3, 0x18(r1)
/* 09337C 8009637C 92C30118 */  stw       r22, 0x118(r3)
/* 093380 80096380 801D0080 */  lwz       r0, 0x80(r29)
/* 093384 80096384 809D0084 */  lwz       r4, 0x84(r29)
/* 093388 80096388 80610018 */  lwz       r3, 0x18(r1)
/* 09338C 8009638C 9083005C */  stw       r4, 0x5c(r3)
/* 093390 80096390 90030058 */  stw       r0, 0x58(r3)
/* 093394 80096394 801D0088 */  lwz       r0, 0x88(r29)
/* 093398 80096398 809D008C */  lwz       r4, 0x8c(r29)
/* 09339C 8009639C 80610018 */  lwz       r3, 0x18(r1)
/* 0933A0 800963A0 90830064 */  stw       r4, 0x64(r3)
/* 0933A4 800963A4 90030060 */  stw       r0, 0x60(r3)
/* 0933A8 800963A8 801D0090 */  lwz       r0, 0x90(r29)
/* 0933AC 800963AC 809D0094 */  lwz       r4, 0x94(r29)
/* 0933B0 800963B0 80610018 */  lwz       r3, 0x18(r1)
/* 0933B4 800963B4 9083006C */  stw       r4, 0x6c(r3)
/* 0933B8 800963B8 90030068 */  stw       r0, 0x68(r3)
/* 0933BC 800963BC 801D0050 */  lwz       r0, 0x50(r29)
/* 0933C0 800963C0 809D0054 */  lwz       r4, 0x54(r29)
/* 0933C4 800963C4 80610018 */  lwz       r3, 0x18(r1)
/* 0933C8 800963C8 9083002C */  stw       r4, 0x2c(r3)
/* 0933CC 800963CC 90030028 */  stw       r0, 0x28(r3)
/* 0933D0 800963D0 801D0058 */  lwz       r0, 0x58(r29)
/* 0933D4 800963D4 809D005C */  lwz       r4, 0x5c(r29)
/* 0933D8 800963D8 80610018 */  lwz       r3, 0x18(r1)
/* 0933DC 800963DC 90830034 */  stw       r4, 0x34(r3)
/* 0933E0 800963E0 90030030 */  stw       r0, 0x30(r3)
/* 0933E4 800963E4 801D0060 */  lwz       r0, 0x60(r29)
/* 0933E8 800963E8 809D0064 */  lwz       r4, 0x64(r29)
/* 0933EC 800963EC 80610018 */  lwz       r3, 0x18(r1)
/* 0933F0 800963F0 9083003C */  stw       r4, 0x3c(r3)
/* 0933F4 800963F4 90030038 */  stw       r0, 0x38(r3)
/* 0933F8 800963F8 801D0068 */  lwz       r0, 0x68(r29)
/* 0933FC 800963FC 809D006C */  lwz       r4, 0x6c(r29)
/* 093400 80096400 80610018 */  lwz       r3, 0x18(r1)
/* 093404 80096404 90830044 */  stw       r4, 0x44(r3)
/* 093408 80096408 90030040 */  stw       r0, 0x40(r3)
/* 09340C 8009640C 801D0070 */  lwz       r0, 0x70(r29)
/* 093410 80096410 809D0074 */  lwz       r4, 0x74(r29)
/* 093414 80096414 80610018 */  lwz       r3, 0x18(r1)
/* 093418 80096418 9083004C */  stw       r4, 0x4c(r3)
/* 09341C 8009641C 90030048 */  stw       r0, 0x48(r3)
/* 093420 80096420 801D0078 */  lwz       r0, 0x78(r29)
/* 093424 80096424 809D007C */  lwz       r4, 0x7c(r29)
/* 093428 80096428 80610018 */  lwz       r3, 0x18(r1)
/* 09342C 8009642C 90830054 */  stw       r4, 0x54(r3)
/* 093430 80096430 90030050 */  stw       r0, 0x50(r3)
/* 093434 80096434 801D0098 */  lwz       r0, 0x98(r29)
/* 093438 80096438 809D009C */  lwz       r4, 0x9c(r29)
/* 09343C 8009643C 80610018 */  lwz       r3, 0x18(r1)
/* 093440 80096440 90830074 */  stw       r4, 0x74(r3)
/* 093444 80096444 90030070 */  stw       r0, 0x70(r3)
/* 093448 80096448 801D00A0 */  lwz       r0, 0xa0(r29)
/* 09344C 8009644C 809D00A4 */  lwz       r4, 0xa4(r29)
/* 093450 80096450 80610018 */  lwz       r3, 0x18(r1)
/* 093454 80096454 9083007C */  stw       r4, 0x7c(r3)
/* 093458 80096458 90030078 */  stw       r0, 0x78(r3)
/* 09345C 8009645C 801D00A8 */  lwz       r0, 0xa8(r29)
/* 093460 80096460 809D00AC */  lwz       r4, 0xac(r29)
/* 093464 80096464 80610018 */  lwz       r3, 0x18(r1)
/* 093468 80096468 90830084 */  stw       r4, 0x84(r3)
/* 09346C 8009646C 90030080 */  stw       r0, 0x80(r3)
/* 093470 80096470 801D00B0 */  lwz       r0, 0xb0(r29)
/* 093474 80096474 809D00B4 */  lwz       r4, 0xb4(r29)
/* 093478 80096478 80610018 */  lwz       r3, 0x18(r1)
/* 09347C 8009647C 9083008C */  stw       r4, 0x8c(r3)
/* 093480 80096480 90030088 */  stw       r0, 0x88(r3)
/* 093484 80096484 801D00B8 */  lwz       r0, 0xb8(r29)
/* 093488 80096488 809D00BC */  lwz       r4, 0xbc(r29)
/* 09348C 8009648C 80610018 */  lwz       r3, 0x18(r1)
/* 093490 80096490 90830094 */  stw       r4, 0x94(r3)
/* 093494 80096494 90030090 */  stw       r0, 0x90(r3)
/* 093498 80096498 801D00C0 */  lwz       r0, 0xc0(r29)
/* 09349C 8009649C 809D00C4 */  lwz       r4, 0xc4(r29)
/* 0934A0 800964A0 80610018 */  lwz       r3, 0x18(r1)
/* 0934A4 800964A4 9083009C */  stw       r4, 0x9c(r3)
/* 0934A8 800964A8 90030098 */  stw       r0, 0x98(r3)
/* 0934AC 800964AC 801D00C8 */  lwz       r0, 0xc8(r29)
/* 0934B0 800964B0 809D00CC */  lwz       r4, 0xcc(r29)
/* 0934B4 800964B4 80610018 */  lwz       r3, 0x18(r1)
/* 0934B8 800964B8 908300A4 */  stw       r4, 0xa4(r3)
/* 0934BC 800964BC 900300A0 */  stw       r0, 0xa0(r3)
/* 0934C0 800964C0 801D00D0 */  lwz       r0, 0xd0(r29)
/* 0934C4 800964C4 809D00D4 */  lwz       r4, 0xd4(r29)
/* 0934C8 800964C8 80610018 */  lwz       r3, 0x18(r1)
/* 0934CC 800964CC 908300AC */  stw       r4, 0xac(r3)
/* 0934D0 800964D0 900300A8 */  stw       r0, 0xa8(r3)
/* 0934D4 800964D4 801D00D8 */  lwz       r0, 0xd8(r29)
/* 0934D8 800964D8 809D00DC */  lwz       r4, 0xdc(r29)
/* 0934DC 800964DC 80610018 */  lwz       r3, 0x18(r1)
/* 0934E0 800964E0 908300B4 */  stw       r4, 0xb4(r3)
/* 0934E4 800964E4 900300B0 */  stw       r0, 0xb0(r3)
/* 0934E8 800964E8 801D00E0 */  lwz       r0, 0xe0(r29)
/* 0934EC 800964EC 809D00E4 */  lwz       r4, 0xe4(r29)
/* 0934F0 800964F0 80610018 */  lwz       r3, 0x18(r1)
/* 0934F4 800964F4 908300BC */  stw       r4, 0xbc(r3)
/* 0934F8 800964F8 900300B8 */  stw       r0, 0xb8(r3)
/* 0934FC 800964FC 809D00E8 */  lwz       r4, 0xe8(r29)
/* 093500 80096500 56C0042F */  rlwinm.   r0, r22, 0, 16, 23
/* 093504 80096504 80BD00EC */  lwz       r5, 0xec(r29)
/* 093508 80096508 80610018 */  lwz       r3, 0x18(r1)
/* 09350C 8009650C 90A300C4 */  stw       r5, 0xc4(r3)
/* 093510 80096510 908300C0 */  stw       r4, 0xc0(r3)
/* 093514 80096514 809D00F0 */  lwz       r4, 0xf0(r29)
/* 093518 80096518 80BD00F4 */  lwz       r5, 0xf4(r29)
/* 09351C 8009651C 80610018 */  lwz       r3, 0x18(r1)
/* 093520 80096520 90A300CC */  stw       r5, 0xcc(r3)
/* 093524 80096524 908300C8 */  stw       r4, 0xc8(r3)
/* 093528 80096528 809D00F8 */  lwz       r4, 0xf8(r29)
/* 09352C 8009652C 80BD00FC */  lwz       r5, 0xfc(r29)
/* 093530 80096530 80610018 */  lwz       r3, 0x18(r1)
/* 093534 80096534 90A300D4 */  stw       r5, 0xd4(r3)
/* 093538 80096538 908300D0 */  stw       r4, 0xd0(r3)
/* 09353C 8009653C 809D0100 */  lwz       r4, 0x100(r29)
/* 093540 80096540 80BD0104 */  lwz       r5, 0x104(r29)
/* 093544 80096544 80610018 */  lwz       r3, 0x18(r1)
/* 093548 80096548 90A300DC */  stw       r5, 0xdc(r3)
/* 09354C 8009654C 908300D8 */  stw       r4, 0xd8(r3)
/* 093550 80096550 809D0108 */  lwz       r4, 0x108(r29)
/* 093554 80096554 80BD010C */  lwz       r5, 0x10c(r29)
/* 093558 80096558 80610018 */  lwz       r3, 0x18(r1)
/* 09355C 8009655C 90A300E4 */  stw       r5, 0xe4(r3)
/* 093560 80096560 908300E0 */  stw       r4, 0xe0(r3)
/* 093564 80096564 809D0120 */  lwz       r4, 0x120(r29)
/* 093568 80096568 80BD0124 */  lwz       r5, 0x124(r29)
/* 09356C 8009656C 80610018 */  lwz       r3, 0x18(r1)
/* 093570 80096570 90A300EC */  stw       r5, 0xec(r3)
/* 093574 80096574 908300E8 */  stw       r4, 0xe8(r3)
/* 093578 80096578 809D0128 */  lwz       r4, 0x128(r29)
/* 09357C 8009657C 80BD012C */  lwz       r5, 0x12c(r29)
/* 093580 80096580 80610018 */  lwz       r3, 0x18(r1)
/* 093584 80096584 90A300F4 */  stw       r5, 0xf4(r3)
/* 093588 80096588 908300F0 */  stw       r4, 0xf0(r3)
/* 09358C 8009658C 809D0130 */  lwz       r4, 0x130(r29)
/* 093590 80096590 80BD0134 */  lwz       r5, 0x134(r29)
/* 093594 80096594 80610018 */  lwz       r3, 0x18(r1)
/* 093598 80096598 90A300FC */  stw       r5, 0xfc(r3)
/* 09359C 8009659C 908300F8 */  stw       r4, 0xf8(r3)
/* 0935A0 800965A0 809D0138 */  lwz       r4, 0x138(r29)
/* 0935A4 800965A4 80BD013C */  lwz       r5, 0x13c(r29)
/* 0935A8 800965A8 80610018 */  lwz       r3, 0x18(r1)
/* 0935AC 800965AC 90A30104 */  stw       r5, 0x104(r3)
/* 0935B0 800965B0 90830100 */  stw       r4, 0x100(r3)
/* 0935B4 800965B4 809D0010 */  lwz       r4, 0x10(r29)
/* 0935B8 800965B8 80BD0014 */  lwz       r5, 0x14(r29)
/* 0935BC 800965BC 80610018 */  lwz       r3, 0x18(r1)
/* 0935C0 800965C0 90A3010C */  stw       r5, 0x10c(r3)
/* 0935C4 800965C4 90830108 */  stw       r4, 0x108(r3)
/* 0935C8 800965C8 809D0018 */  lwz       r4, 0x18(r29)
/* 0935CC 800965CC 80BD001C */  lwz       r5, 0x1c(r29)
/* 0935D0 800965D0 80610018 */  lwz       r3, 0x18(r1)
/* 0935D4 800965D4 90A30114 */  stw       r5, 0x114(r3)
/* 0935D8 800965D8 90830110 */  stw       r4, 0x110(r3)
/* 0935DC 800965DC 41820050 */  beq       lbl_8009662C
/* 0935E0 800965E0 7EE3B8F8 */  nor       r3, r23, r23
/* 0935E4 800965E4 80810018 */  lwz       r4, 0x18(r1)
/* 0935E8 800965E8 90610010 */  stw       r3, 0x10(r1)
/* 0935EC 800965EC 56E3042E */  rlwinm    r3, r23, 0, 16, 23
/* 0935F0 800965F0 6463FFFF */  oris      r3, r3, 0xffff
/* 0935F4 800965F4 80C10010 */  lwz       r6, 0x10(r1)
/* 0935F8 800965F8 56C5061E */  rlwinm    r5, r22, 0, 24, 15
/* 0935FC 800965FC 606300FF */  ori       r3, r3, 0xff
/* 093600 80096600 54C6042E */  rlwinm    r6, r6, 0, 16, 23
/* 093604 80096604 90C10010 */  stw       r6, 0x10(r1)
/* 093608 80096608 7ED61838 */  and       r22, r22, r3
/* 09360C 8009660C 80610010 */  lwz       r3, 0x10(r1)
/* 093610 80096610 7C600378 */  or        r0, r3, r0
/* 093614 80096614 90010010 */  stw       r0, 0x10(r1)
/* 093618 80096618 80010010 */  lwz       r0, 0x10(r1)
/* 09361C 8009661C 7C002B78 */  or        r0, r0, r5
/* 093620 80096620 90010010 */  stw       r0, 0x10(r1)
/* 093624 80096624 80010010 */  lwz       r0, 0x10(r1)
/* 093628 80096628 90040118 */  stw       r0, 0x118(r4)
lbl_8009662C:
/* 09362C 8009662C 80BD0008 */  lwz       r5, 0x8(r29)
/* 093630 80096630 3C60A430 */  lis       r3, 0xa430
/* 093634 80096634 3883000C */  addi      r4, r3, 0xc
/* 093638 80096638 8065003C */  lwz       r3, 0x3c(r5)
/* 09363C 8009663C 38A1000C */  addi      r5, r1, 0xc
/* 093640 80096640 4BFF64E1 */  bl        mipsGet32
/* 093644 80096644 2C030000 */  cmpwi     r3, 0x0
/* 093648 80096648 4082000C */  bne       lbl_80096654
/* 09364C 8009664C 38600000 */  li        r3, 0x0
/* 093650 80096650 4800090C */  b         lbl_80096F5C
lbl_80096654:
/* 093654 80096654 80A1000C */  lwz       r5, 0xc(r1)
/* 093658 80096658 28050000 */  cmplwi    r5, 0x0
/* 09365C 8009665C 4182004C */  beq       lbl_800966A8
/* 093660 80096660 92E10010 */  stw       r23, 0x10(r1)
/* 093664 80096664 80610018 */  lwz       r3, 0x18(r1)
/* 093668 80096668 80010010 */  lwz       r0, 0x10(r1)
/* 09366C 8009666C 5400843E */  srwi      r0, r0, 16
/* 093670 80096670 90010010 */  stw       r0, 0x10(r1)
/* 093674 80096674 80010010 */  lwz       r0, 0x10(r1)
/* 093678 80096678 7C0000F8 */  nor       r0, r0, r0
/* 09367C 8009667C 90010010 */  stw       r0, 0x10(r1)
/* 093680 80096680 80010010 */  lwz       r0, 0x10(r1)
/* 093684 80096684 540006BE */  clrlwi    r0, r0, 26
/* 093688 80096688 90010010 */  stw       r0, 0x10(r1)
/* 09368C 8009668C 80810010 */  lwz       r4, 0x10(r1)
/* 093690 80096690 80030128 */  lwz       r0, 0x128(r3)
/* 093694 80096694 7C800038 */  and       r0, r4, r0
/* 093698 80096698 90010010 */  stw       r0, 0x10(r1)
/* 09369C 8009669C 80010010 */  lwz       r0, 0x10(r1)
/* 0936A0 800966A0 7CA00378 */  or        r0, r5, r0
/* 0936A4 800966A4 9001000C */  stw       r0, 0xc(r1)
lbl_800966A8:
/* 0936A8 800966A8 8001000C */  lwz       r0, 0xc(r1)
/* 0936AC 800966AC 7FA3EB78 */  mr        r3, r29
/* 0936B0 800966B0 80C10018 */  lwz       r6, 0x18(r1)
/* 0936B4 800966B4 38A10020 */  addi      r5, r1, 0x20
/* 0936B8 800966B8 3880000D */  li        r4, 0xd
/* 0936BC 800966BC 90060128 */  stw       r0, 0x128(r6)
/* 0936C0 800966C0 801D0AB4 */  lwz       r0, 0xab4(r29)
/* 0936C4 800966C4 80C10018 */  lwz       r6, 0x18(r1)
/* 0936C8 800966C8 90010010 */  stw       r0, 0x10(r1)
/* 0936CC 800966CC 80010010 */  lwz       r0, 0x10(r1)
/* 0936D0 800966D0 9006011C */  stw       r0, 0x11c(r6)
/* 0936D4 800966D4 801D0A3C */  lwz       r0, 0xa3c(r29)
/* 0936D8 800966D8 80C10018 */  lwz       r6, 0x18(r1)
/* 0936DC 800966DC 9006012C */  stw       r0, 0x12c(r6)
/* 0936E0 800966E0 801D0140 */  lwz       r0, 0x140(r29)
/* 0936E4 800966E4 80FD0144 */  lwz       r7, 0x144(r29)
/* 0936E8 800966E8 80C10018 */  lwz       r6, 0x18(r1)
/* 0936EC 800966EC 90E60134 */  stw       r7, 0x134(r6)
/* 0936F0 800966F0 90060130 */  stw       r0, 0x130(r6)
/* 0936F4 800966F4 801D0150 */  lwz       r0, 0x150(r29)
/* 0936F8 800966F8 80FD0154 */  lwz       r7, 0x154(r29)
/* 0936FC 800966FC 80C10018 */  lwz       r6, 0x18(r1)
/* 093700 80096700 90E6013C */  stw       r7, 0x13c(r6)
/* 093704 80096704 90060138 */  stw       r0, 0x138(r6)
/* 093708 80096708 801D0160 */  lwz       r0, 0x160(r29)
/* 09370C 8009670C 80FD0164 */  lwz       r7, 0x164(r29)
/* 093710 80096710 80C10018 */  lwz       r6, 0x18(r1)
/* 093714 80096714 90E60144 */  stw       r7, 0x144(r6)
/* 093718 80096718 90060140 */  stw       r0, 0x140(r6)
/* 09371C 8009671C 801D0170 */  lwz       r0, 0x170(r29)
/* 093720 80096720 80FD0174 */  lwz       r7, 0x174(r29)
/* 093724 80096724 80C10018 */  lwz       r6, 0x18(r1)
/* 093728 80096728 90E6014C */  stw       r7, 0x14c(r6)
/* 09372C 8009672C 90060148 */  stw       r0, 0x148(r6)
/* 093730 80096730 801D0180 */  lwz       r0, 0x180(r29)
/* 093734 80096734 80FD0184 */  lwz       r7, 0x184(r29)
/* 093738 80096738 80C10018 */  lwz       r6, 0x18(r1)
/* 09373C 8009673C 90E60154 */  stw       r7, 0x154(r6)
/* 093740 80096740 90060150 */  stw       r0, 0x150(r6)
/* 093744 80096744 801D0190 */  lwz       r0, 0x190(r29)
/* 093748 80096748 80FD0194 */  lwz       r7, 0x194(r29)
/* 09374C 8009674C 80C10018 */  lwz       r6, 0x18(r1)
/* 093750 80096750 90E6015C */  stw       r7, 0x15c(r6)
/* 093754 80096754 90060158 */  stw       r0, 0x158(r6)
/* 093758 80096758 801D01A0 */  lwz       r0, 0x1a0(r29)
/* 09375C 8009675C 80FD01A4 */  lwz       r7, 0x1a4(r29)
/* 093760 80096760 80C10018 */  lwz       r6, 0x18(r1)
/* 093764 80096764 90E60164 */  stw       r7, 0x164(r6)
/* 093768 80096768 90060160 */  stw       r0, 0x160(r6)
/* 09376C 8009676C 801D01B0 */  lwz       r0, 0x1b0(r29)
/* 093770 80096770 80FD01B4 */  lwz       r7, 0x1b4(r29)
/* 093774 80096774 80C10018 */  lwz       r6, 0x18(r1)
/* 093778 80096778 90E6016C */  stw       r7, 0x16c(r6)
/* 09377C 8009677C 90060168 */  stw       r0, 0x168(r6)
/* 093780 80096780 801D01C0 */  lwz       r0, 0x1c0(r29)
/* 093784 80096784 80FD01C4 */  lwz       r7, 0x1c4(r29)
/* 093788 80096788 80C10018 */  lwz       r6, 0x18(r1)
/* 09378C 8009678C 90E60174 */  stw       r7, 0x174(r6)
/* 093790 80096790 90060170 */  stw       r0, 0x170(r6)
/* 093794 80096794 801D01D0 */  lwz       r0, 0x1d0(r29)
/* 093798 80096798 80FD01D4 */  lwz       r7, 0x1d4(r29)
/* 09379C 8009679C 80C10018 */  lwz       r6, 0x18(r1)
/* 0937A0 800967A0 90E6017C */  stw       r7, 0x17c(r6)
/* 0937A4 800967A4 90060178 */  stw       r0, 0x178(r6)
/* 0937A8 800967A8 801D01E0 */  lwz       r0, 0x1e0(r29)
/* 0937AC 800967AC 80FD01E4 */  lwz       r7, 0x1e4(r29)
/* 0937B0 800967B0 80C10018 */  lwz       r6, 0x18(r1)
/* 0937B4 800967B4 90E60184 */  stw       r7, 0x184(r6)
/* 0937B8 800967B8 90060180 */  stw       r0, 0x180(r6)
/* 0937BC 800967BC 801D01F0 */  lwz       r0, 0x1f0(r29)
/* 0937C0 800967C0 80FD01F4 */  lwz       r7, 0x1f4(r29)
/* 0937C4 800967C4 80C10018 */  lwz       r6, 0x18(r1)
/* 0937C8 800967C8 90E6018C */  stw       r7, 0x18c(r6)
/* 0937CC 800967CC 90060188 */  stw       r0, 0x188(r6)
/* 0937D0 800967D0 801D0200 */  lwz       r0, 0x200(r29)
/* 0937D4 800967D4 80FD0204 */  lwz       r7, 0x204(r29)
/* 0937D8 800967D8 80C10018 */  lwz       r6, 0x18(r1)
/* 0937DC 800967DC 90E60194 */  stw       r7, 0x194(r6)
/* 0937E0 800967E0 90060190 */  stw       r0, 0x190(r6)
/* 0937E4 800967E4 801D0210 */  lwz       r0, 0x210(r29)
/* 0937E8 800967E8 80FD0214 */  lwz       r7, 0x214(r29)
/* 0937EC 800967EC 80C10018 */  lwz       r6, 0x18(r1)
/* 0937F0 800967F0 90E6019C */  stw       r7, 0x19c(r6)
/* 0937F4 800967F4 90060198 */  stw       r0, 0x198(r6)
/* 0937F8 800967F8 801D0220 */  lwz       r0, 0x220(r29)
/* 0937FC 800967FC 80FD0224 */  lwz       r7, 0x224(r29)
/* 093800 80096800 80C10018 */  lwz       r6, 0x18(r1)
/* 093804 80096804 90E601A4 */  stw       r7, 0x1a4(r6)
/* 093808 80096808 900601A0 */  stw       r0, 0x1a0(r6)
/* 09380C 8009680C 801D0230 */  lwz       r0, 0x230(r29)
/* 093810 80096810 80FD0234 */  lwz       r7, 0x234(r29)
/* 093814 80096814 80C10018 */  lwz       r6, 0x18(r1)
/* 093818 80096818 90E601AC */  stw       r7, 0x1ac(r6)
/* 09381C 8009681C 900601A8 */  stw       r0, 0x1a8(r6)
/* 093820 80096820 4BF9E355 */  bl        cpuGetRegisterCP0
/* 093824 80096824 2C030000 */  cmpwi     r3, 0x0
/* 093828 80096828 4082000C */  bne       lbl_80096834
/* 09382C 8009682C 38600000 */  li        r3, 0x0
/* 093830 80096830 4800072C */  b         lbl_80096F5C
lbl_80096834:
/* 093834 80096834 80610024 */  lwz       r3, 0x24(r1)
/* 093838 80096838 38800002 */  li        r4, 0x2
/* 09383C 8009683C 3800007C */  li        r0, 0x7c
/* 093840 80096840 90610010 */  stw       r3, 0x10(r1)
/* 093844 80096844 3AA00000 */  li        r21, 0x0
/* 093848 80096848 80610018 */  lwz       r3, 0x18(r1)
/* 09384C 8009684C 38A00002 */  li        r5, 0x2
/* 093850 80096850 80C10010 */  lwz       r6, 0x10(r1)
/* 093854 80096854 90C30120 */  stw       r6, 0x120(r3)
/* 093858 80096858 80610018 */  lwz       r3, 0x18(r1)
/* 09385C 8009685C B0830010 */  sth       r4, 0x10(r3)
/* 093860 80096860 80610020 */  lwz       r3, 0x20(r1)
/* 093864 80096864 82810024 */  lwz       r20, 0x24(r1)
/* 093868 80096868 7C63A838 */  and       r3, r3, r21
/* 09386C 8009686C 7E840038 */  and       r4, r20, r0
/* 093870 80096870 480360F5 */  bl        __shr2i
/* 093874 80096874 38A00009 */  li        r5, 0x9
/* 093878 80096878 7C852A78 */  xor       r5, r4, r5
/* 09387C 8009687C 7C60AA78 */  xor       r0, r3, r21
/* 093880 80096880 7CA00379 */  or.       r0, r5, r0
/* 093884 80096884 41820470 */  beq       lbl_80096CF4
/* 093888 80096888 38C00009 */  li        r6, 0x9
/* 09388C 8009688C 6C658000 */  xoris     r5, r3, 0x8000
/* 093890 80096890 6EA08000 */  xoris     r0, r21, 0x8000
/* 093894 80096894 7CC62010 */  subfc     r6, r6, r4
/* 093898 80096898 7C002910 */  subfe     r0, r0, r5
/* 09389C 8009689C 7C063110 */  subfe     r0, r6, r6
/* 0938A0 800968A0 7C0000D1 */  neg.      r0, r0
/* 0938A4 800968A4 41820018 */  beq       lbl_800968BC
/* 0938A8 800968A8 7C84AA78 */  xor       r4, r4, r21
/* 0938AC 800968AC 7C60AA78 */  xor       r0, r3, r21
/* 0938B0 800968B0 7C800379 */  or.       r0, r4, r0
/* 0938B4 800968B4 41820020 */  beq       lbl_800968D4
/* 0938B8 800968B8 480004C4 */  b         lbl_80096D7C
lbl_800968BC:
/* 0938BC 800968BC 38A0000B */  li        r5, 0xb
/* 0938C0 800968C0 7C852A78 */  xor       r5, r4, r5
/* 0938C4 800968C4 7C60AA78 */  xor       r0, r3, r21
/* 0938C8 800968C8 7CA00379 */  or.       r0, r5, r0
/* 0938CC 800968CC 41820448 */  beq       lbl_80096D14
/* 0938D0 800968D0 480004AC */  b         lbl_80096D7C
lbl_800968D4:
/* 0938D4 800968D4 3C600001 */  lis       r3, 0x1
/* 0938D8 800968D8 3C80800F */  lis       r4, jtbl_800F1448@ha
/* 0938DC 800968DC 7ED2A038 */  and       r18, r22, r20
/* 0938E0 800968E0 56F4843E */  srwi      r20, r23, 16
/* 0938E4 800968E4 3B038008 */  subi      r24, r3, 0x7ff8
/* 0938E8 800968E8 3AA41448 */  addi      r21, r4, jtbl_800F1448@l
/* 0938EC 800968EC 3F80A460 */  lis       r28, 0xa460
/* 0938F0 800968F0 3F60A480 */  lis       r27, 0xa480
/* 0938F4 800968F4 3F40A450 */  lis       r26, 0xa450
/* 0938F8 800968F8 3F20A440 */  lis       r25, 0xa440
/* 0938FC 800968FC 3EE00404 */  lis       r23, 0x404
/* 093900 80096900 3EC0A430 */  lis       r22, 0xa430
lbl_80096904:
/* 093904 80096904 564005EF */  rlwinm.   r0, r18, 0, 23, 23
/* 093908 80096908 38600000 */  li        r3, 0x0
/* 09390C 8009690C 41820008 */  beq       lbl_80096914
/* 093910 80096910 38600001 */  li        r3, 0x1
lbl_80096914:
/* 093914 80096914 564005AD */  rlwinm.   r0, r18, 0, 22, 22
/* 093918 80096918 41820008 */  beq       lbl_80096920
/* 09391C 8009691C 38600002 */  li        r3, 0x2
lbl_80096920:
/* 093920 80096920 5640056B */  rlwinm.   r0, r18, 0, 21, 21
/* 093924 80096924 41820008 */  beq       lbl_8009692C
/* 093928 80096928 38600003 */  li        r3, 0x3
lbl_8009692C:
/* 09392C 8009692C 56400529 */  rlwinm.   r0, r18, 0, 20, 20
/* 093930 80096930 41820008 */  beq       lbl_80096938
/* 093934 80096934 38600004 */  li        r3, 0x4
lbl_80096938:
/* 093938 80096938 564004E7 */  rlwinm.   r0, r18, 0, 19, 19
/* 09393C 8009693C 41820008 */  beq       lbl_80096944
/* 093940 80096940 38600005 */  li        r3, 0x5
lbl_80096944:
/* 093944 80096944 564004A5 */  rlwinm.   r0, r18, 0, 18, 18
/* 093948 80096948 41820008 */  beq       lbl_80096950
/* 09394C 8009694C 38600006 */  li        r3, 0x6
lbl_80096950:
/* 093950 80096950 56400463 */  rlwinm.   r0, r18, 0, 17, 17
/* 093954 80096954 41820008 */  beq       lbl_8009695C
/* 093958 80096958 38600007 */  li        r3, 0x7
lbl_8009695C:
/* 09395C 8009695C 56400421 */  rlwinm.   r0, r18, 0, 16, 16
/* 093960 80096960 41820008 */  beq       lbl_80096968
/* 093964 80096964 38600008 */  li        r3, 0x8
lbl_80096968:
/* 093968 80096968 28030008 */  cmplwi    r3, 0x8
/* 09396C 8009696C 41810488 */  bgt       lbl_80096DF4
/* 093970 80096970 5460103A */  slwi      r0, r3, 2
/* 093974 80096974 7C15002E */  lwzx      r0, r21, r0
/* 093978 80096978 7C0903A6 */  mtctr     r0
/* 09397C 8009697C 4E800420 */  bctr
lbl_80096980:
/* 093980 80096980 80A10024 */  lwz       r5, 0x24(r1)
/* 093984 80096984 3800FEFF */  li        r0, -0x101
/* 093988 80096988 80810020 */  lwz       r4, 0x20(r1)
/* 09398C 8009698C 3860FFFF */  li        r3, -0x1
/* 093990 80096990 7CA00038 */  and       r0, r5, r0
/* 093994 80096994 90010024 */  stw       r0, 0x24(r1)
/* 093998 80096998 7C801838 */  and       r0, r4, r3
/* 09399C 8009699C 387D0000 */  addi      r3, r29, 0x0
/* 0939A0 800969A0 90010020 */  stw       r0, 0x20(r1)
/* 0939A4 800969A4 3880000D */  li        r4, 0xd
/* 0939A8 800969A8 80A10020 */  lwz       r5, 0x20(r1)
/* 0939AC 800969AC 80C10024 */  lwz       r6, 0x24(r1)
/* 0939B0 800969B0 4BF9E46D */  bl        cpuSetRegisterCP0
/* 0939B4 800969B4 2C030000 */  cmpwi     r3, 0x0
/* 0939B8 800969B8 4082000C */  bne       lbl_800969C4
/* 0939BC 800969BC 38600000 */  li        r3, 0x0
/* 0939C0 800969C0 4800059C */  b         lbl_80096F5C
lbl_800969C4:
/* 0939C4 800969C4 38000000 */  li        r0, 0x0
/* 0939C8 800969C8 901D0064 */  stw       r0, 0x64(r29)
/* 0939CC 800969CC 7FA3EB78 */  mr        r3, r29
/* 0939D0 800969D0 4BFFF52D */  bl        send_mesg
/* 0939D4 800969D4 5652062C */  rlwinm    r18, r18, 0, 24, 22
/* 0939D8 800969D8 4BFFFF2C */  b         lbl_80096904
lbl_800969DC:
/* 0939DC 800969DC 80A10024 */  lwz       r5, 0x24(r1)
/* 0939E0 800969E0 3800FDFF */  li        r0, -0x201
/* 0939E4 800969E4 80810020 */  lwz       r4, 0x20(r1)
/* 0939E8 800969E8 3860FFFF */  li        r3, -0x1
/* 0939EC 800969EC 7CA00038 */  and       r0, r5, r0
/* 0939F0 800969F0 90010024 */  stw       r0, 0x24(r1)
/* 0939F4 800969F4 7C801838 */  and       r0, r4, r3
/* 0939F8 800969F8 387D0000 */  addi      r3, r29, 0x0
/* 0939FC 800969FC 90010020 */  stw       r0, 0x20(r1)
/* 093A00 80096A00 3880000D */  li        r4, 0xd
/* 093A04 80096A04 80A10020 */  lwz       r5, 0x20(r1)
/* 093A08 80096A08 80C10024 */  lwz       r6, 0x24(r1)
/* 093A0C 80096A0C 4BF9E411 */  bl        cpuSetRegisterCP0
/* 093A10 80096A10 2C030000 */  cmpwi     r3, 0x0
/* 093A14 80096A14 4082000C */  bne       lbl_80096A20
/* 093A18 80096A18 38600000 */  li        r3, 0x0
/* 093A1C 80096A1C 48000540 */  b         lbl_80096F5C
lbl_80096A20:
/* 093A20 80096A20 38000008 */  li        r0, 0x8
/* 093A24 80096A24 901D0064 */  stw       r0, 0x64(r29)
/* 093A28 80096A28 7FA3EB78 */  mr        r3, r29
/* 093A2C 80096A2C 4BFFF4D1 */  bl        send_mesg
/* 093A30 80096A30 565205EA */  rlwinm    r18, r18, 0, 23, 21
/* 093A34 80096A34 4BFFFED0 */  b         lbl_80096904
lbl_80096A38:
/* 093A38 80096A38 807D0008 */  lwz       r3, 0x8(r29)
/* 093A3C 80096A3C 38960008 */  addi      r4, r22, 0x8
/* 093A40 80096A40 38A10010 */  addi      r5, r1, 0x10
/* 093A44 80096A44 8063003C */  lwz       r3, 0x3c(r3)
/* 093A48 80096A48 4BFF60D9 */  bl        mipsGet32
/* 093A4C 80096A4C 2C030000 */  cmpwi     r3, 0x0
/* 093A50 80096A50 4082000C */  bne       lbl_80096A5C
/* 093A54 80096A54 38600000 */  li        r3, 0x0
/* 093A58 80096A58 48000504 */  b         lbl_80096F5C
lbl_80096A5C:
/* 093A5C 80096A5C 80010010 */  lwz       r0, 0x10(r1)
/* 093A60 80096A60 7E830038 */  and       r3, r20, r0
/* 093A64 80096A64 546007FF */  clrlwi.   r0, r3, 31
/* 093A68 80096A68 3A230000 */  addi      r17, r3, 0x0
/* 093A6C 80096A6C 41820084 */  beq       lbl_80096AF0
/* 093A70 80096A70 807D0008 */  lwz       r3, 0x8(r29)
/* 093A74 80096A74 563106BC */  rlwinm    r17, r17, 0, 26, 30
/* 093A78 80096A78 38970010 */  addi      r4, r23, 0x10
/* 093A7C 80096A7C 80630034 */  lwz       r3, 0x34(r3)
/* 093A80 80096A80 38A10014 */  addi      r5, r1, 0x14
/* 093A84 80096A84 4BFDAE6D */  bl        rspGet32
/* 093A88 80096A88 2C030000 */  cmpwi     r3, 0x0
/* 093A8C 80096A8C 4082000C */  bne       lbl_80096A98
/* 093A90 80096A90 38600000 */  li        r3, 0x0
/* 093A94 80096A94 480004C8 */  b         lbl_80096F5C
lbl_80096A98:
/* 093A98 80096A98 93010010 */  stw       r24, 0x10(r1)
/* 093A9C 80096A9C 38970010 */  addi      r4, r23, 0x10
/* 093AA0 80096AA0 38A10010 */  addi      r5, r1, 0x10
/* 093AA4 80096AA4 807D0008 */  lwz       r3, 0x8(r29)
/* 093AA8 80096AA8 80630034 */  lwz       r3, 0x34(r3)
/* 093AAC 80096AAC 4BFDB0A5 */  bl        rspPut32
/* 093AB0 80096AB0 2C030000 */  cmpwi     r3, 0x0
/* 093AB4 80096AB4 4082000C */  bne       lbl_80096AC0
/* 093AB8 80096AB8 38600000 */  li        r3, 0x0
/* 093ABC 80096ABC 480004A0 */  b         lbl_80096F5C
lbl_80096AC0:
/* 093AC0 80096AC0 80010014 */  lwz       r0, 0x14(r1)
/* 093AC4 80096AC4 540005AF */  rlwinm.   r0, r0, 0, 22, 23
/* 093AC8 80096AC8 41820018 */  beq       lbl_80096AE0
/* 093ACC 80096ACC 38000020 */  li        r0, 0x20
/* 093AD0 80096AD0 901D0064 */  stw       r0, 0x64(r29)
/* 093AD4 80096AD4 7FA3EB78 */  mr        r3, r29
/* 093AD8 80096AD8 4BFFF425 */  bl        send_mesg
/* 093ADC 80096ADC 48000014 */  b         lbl_80096AF0
lbl_80096AE0:
/* 093AE0 80096AE0 38000058 */  li        r0, 0x58
/* 093AE4 80096AE4 901D0064 */  stw       r0, 0x64(r29)
/* 093AE8 80096AE8 7FA3EB78 */  mr        r3, r29
/* 093AEC 80096AEC 4BFFF411 */  bl        send_mesg
lbl_80096AF0:
/* 093AF0 80096AF0 56200739 */  rlwinm.   r0, r17, 0, 28, 28
/* 093AF4 80096AF4 41820044 */  beq       lbl_80096B38
/* 093AF8 80096AF8 38000000 */  li        r0, 0x0
/* 093AFC 80096AFC 90010010 */  stw       r0, 0x10(r1)
/* 093B00 80096B00 72310037 */  andi.     r17, r17, 0x37
/* 093B04 80096B04 38990010 */  addi      r4, r25, 0x10
/* 093B08 80096B08 807D0008 */  lwz       r3, 0x8(r29)
/* 093B0C 80096B0C 38A10010 */  addi      r5, r1, 0x10
/* 093B10 80096B10 80630050 */  lwz       r3, 0x50(r3)
/* 093B14 80096B14 4BFF77B5 */  bl        videoPut32
/* 093B18 80096B18 2C030000 */  cmpwi     r3, 0x0
/* 093B1C 80096B1C 4082000C */  bne       lbl_80096B28
/* 093B20 80096B20 38600000 */  li        r3, 0x0
/* 093B24 80096B24 48000438 */  b         lbl_80096F5C
lbl_80096B28:
/* 093B28 80096B28 38000038 */  li        r0, 0x38
/* 093B2C 80096B2C 901D0064 */  stw       r0, 0x64(r29)
/* 093B30 80096B30 7FA3EB78 */  mr        r3, r29
/* 093B34 80096B34 4BFFF3C9 */  bl        send_mesg
lbl_80096B38:
/* 093B38 80096B38 5620077B */  rlwinm.   r0, r17, 0, 29, 29
/* 093B3C 80096B3C 41820044 */  beq       lbl_80096B80
/* 093B40 80096B40 38000001 */  li        r0, 0x1
/* 093B44 80096B44 90010010 */  stw       r0, 0x10(r1)
/* 093B48 80096B48 7231003B */  andi.     r17, r17, 0x3b
/* 093B4C 80096B4C 389A000C */  addi      r4, r26, 0xc
/* 093B50 80096B50 807D0008 */  lwz       r3, 0x8(r29)
/* 093B54 80096B54 38A10010 */  addi      r5, r1, 0x10
/* 093B58 80096B58 8063004C */  lwz       r3, 0x4c(r3)
/* 093B5C 80096B5C 4BFF7325 */  bl        audioPut32
/* 093B60 80096B60 2C030000 */  cmpwi     r3, 0x0
/* 093B64 80096B64 4082000C */  bne       lbl_80096B70
/* 093B68 80096B68 38600000 */  li        r3, 0x0
/* 093B6C 80096B6C 480003F0 */  b         lbl_80096F5C
lbl_80096B70:
/* 093B70 80096B70 38000030 */  li        r0, 0x30
/* 093B74 80096B74 901D0064 */  stw       r0, 0x64(r29)
/* 093B78 80096B78 7FA3EB78 */  mr        r3, r29
/* 093B7C 80096B7C 4BFFF381 */  bl        send_mesg
lbl_80096B80:
/* 093B80 80096B80 562007BD */  rlwinm.   r0, r17, 0, 30, 30
/* 093B84 80096B84 41820044 */  beq       lbl_80096BC8
/* 093B88 80096B88 38000000 */  li        r0, 0x0
/* 093B8C 80096B8C 90010010 */  stw       r0, 0x10(r1)
/* 093B90 80096B90 7231003D */  andi.     r17, r17, 0x3d
/* 093B94 80096B94 389B0018 */  addi      r4, r27, 0x18
/* 093B98 80096B98 807D0008 */  lwz       r3, 0x8(r29)
/* 093B9C 80096B9C 38A10010 */  addi      r5, r1, 0x10
/* 093BA0 80096BA0 80630054 */  lwz       r3, 0x54(r3)
/* 093BA4 80096BA4 4BFF7B21 */  bl        serialPut32
/* 093BA8 80096BA8 2C030000 */  cmpwi     r3, 0x0
/* 093BAC 80096BAC 4082000C */  bne       lbl_80096BB8
/* 093BB0 80096BB0 38600000 */  li        r3, 0x0
/* 093BB4 80096BB4 480003A8 */  b         lbl_80096F5C
lbl_80096BB8:
/* 093BB8 80096BB8 38000028 */  li        r0, 0x28
/* 093BBC 80096BBC 901D0064 */  stw       r0, 0x64(r29)
/* 093BC0 80096BC0 7FA3EB78 */  mr        r3, r29
/* 093BC4 80096BC4 4BFFF339 */  bl        send_mesg
lbl_80096BC8:
/* 093BC8 80096BC8 562006F7 */  rlwinm.   r0, r17, 0, 27, 27
/* 093BCC 80096BCC 41820044 */  beq       lbl_80096C10
/* 093BD0 80096BD0 38000002 */  li        r0, 0x2
/* 093BD4 80096BD4 90010010 */  stw       r0, 0x10(r1)
/* 093BD8 80096BD8 7231002F */  andi.     r17, r17, 0x2f
/* 093BDC 80096BDC 389C0010 */  addi      r4, r28, 0x10
/* 093BE0 80096BE0 807D0008 */  lwz       r3, 0x8(r29)
/* 093BE4 80096BE4 38A10010 */  addi      r5, r1, 0x10
/* 093BE8 80096BE8 8063005C */  lwz       r3, 0x5c(r3)
/* 093BEC 80096BEC 480005A1 */  bl        peripheralPut32
/* 093BF0 80096BF0 2C030000 */  cmpwi     r3, 0x0
/* 093BF4 80096BF4 4082000C */  bne       lbl_80096C00
/* 093BF8 80096BF8 38600000 */  li        r3, 0x0
/* 093BFC 80096BFC 48000360 */  b         lbl_80096F5C
lbl_80096C00:
/* 093C00 80096C00 38000040 */  li        r0, 0x40
/* 093C04 80096C04 901D0064 */  stw       r0, 0x64(r29)
/* 093C08 80096C08 7FA3EB78 */  mr        r3, r29
/* 093C0C 80096C0C 4BFFF2F1 */  bl        send_mesg
lbl_80096C10:
/* 093C10 80096C10 562006B5 */  rlwinm.   r0, r17, 0, 26, 26
/* 093C14 80096C14 41820040 */  beq       lbl_80096C54
/* 093C18 80096C18 38000800 */  li        r0, 0x800
/* 093C1C 80096C1C 90010010 */  stw       r0, 0x10(r1)
/* 093C20 80096C20 38A10010 */  addi      r5, r1, 0x10
/* 093C24 80096C24 3C80A430 */  lis       r4, 0xa430
/* 093C28 80096C28 807D0008 */  lwz       r3, 0x8(r29)
/* 093C2C 80096C2C 8063003C */  lwz       r3, 0x3c(r3)
/* 093C30 80096C30 4BFF5F71 */  bl        mipsPut32
/* 093C34 80096C34 2C030000 */  cmpwi     r3, 0x0
/* 093C38 80096C38 4082000C */  bne       lbl_80096C44
/* 093C3C 80096C3C 38600000 */  li        r3, 0x0
/* 093C40 80096C40 4800031C */  b         lbl_80096F5C
lbl_80096C44:
/* 093C44 80096C44 38000048 */  li        r0, 0x48
/* 093C48 80096C48 901D0064 */  stw       r0, 0x64(r29)
/* 093C4C 80096C4C 7FA3EB78 */  mr        r3, r29
/* 093C50 80096C50 4BFFF2AD */  bl        send_mesg
lbl_80096C54:
/* 093C54 80096C54 565205A8 */  rlwinm    r18, r18, 0, 22, 20
/* 093C58 80096C58 4BFFFCAC */  b         lbl_80096904
lbl_80096C5C:
/* 093C5C 80096C5C 38000010 */  li        r0, 0x10
/* 093C60 80096C60 901D0064 */  stw       r0, 0x64(r29)
/* 093C64 80096C64 387D0000 */  addi      r3, r29, 0x0
/* 093C68 80096C68 56520566 */  rlwinm    r18, r18, 0, 21, 19
/* 093C6C 80096C6C 4BFFF291 */  bl        send_mesg
/* 093C70 80096C70 4BFFFC94 */  b         lbl_80096904
lbl_80096C74:
/* 093C74 80096C74 80610018 */  lwz       r3, 0x18(r1)
/* 093C78 80096C78 80030118 */  lwz       r0, 0x118(r3)
/* 093C7C 80096C7C 54000524 */  rlwinm    r0, r0, 0, 20, 18
/* 093C80 80096C80 90030118 */  stw       r0, 0x118(r3)
/* 093C84 80096C84 48000170 */  b         lbl_80096DF4
lbl_80096C88:
/* 093C88 80096C88 565204E2 */  rlwinm    r18, r18, 0, 19, 17
/* 093C8C 80096C8C 4BFFFC78 */  b         lbl_80096904
lbl_80096C90:
/* 093C90 80096C90 565204A0 */  rlwinm    r18, r18, 0, 18, 16
/* 093C94 80096C94 4BFFFC70 */  b         lbl_80096904
lbl_80096C98:
/* 093C98 80096C98 387D0000 */  addi      r3, r29, 0x0
/* 093C9C 80096C9C 38A10028 */  addi      r5, r1, 0x28
/* 093CA0 80096CA0 3880000B */  li        r4, 0xb
/* 093CA4 80096CA4 4BF9DED1 */  bl        cpuGetRegisterCP0
/* 093CA8 80096CA8 2C030000 */  cmpwi     r3, 0x0
/* 093CAC 80096CAC 4082000C */  bne       lbl_80096CB8
/* 093CB0 80096CB0 38600000 */  li        r3, 0x0
/* 093CB4 80096CB4 480002A8 */  b         lbl_80096F5C
lbl_80096CB8:
/* 093CB8 80096CB8 80A10028 */  lwz       r5, 0x28(r1)
/* 093CBC 80096CBC 7FA3EB78 */  mr        r3, r29
/* 093CC0 80096CC0 80C1002C */  lwz       r6, 0x2c(r1)
/* 093CC4 80096CC4 3880000B */  li        r4, 0xb
/* 093CC8 80096CC8 4BF9E155 */  bl        cpuSetRegisterCP0
/* 093CCC 80096CCC 2C030000 */  cmpwi     r3, 0x0
/* 093CD0 80096CD0 4082000C */  bne       lbl_80096CDC
/* 093CD4 80096CD4 38600000 */  li        r3, 0x0
/* 093CD8 80096CD8 48000284 */  b         lbl_80096F5C
lbl_80096CDC:
/* 093CDC 80096CDC 38000018 */  li        r0, 0x18
/* 093CE0 80096CE0 901D0064 */  stw       r0, 0x64(r29)
/* 093CE4 80096CE4 7FA3EB78 */  mr        r3, r29
/* 093CE8 80096CE8 4BFFF215 */  bl        send_mesg
/* 093CEC 80096CEC 5652045E */  rlwinm    r18, r18, 0, 17, 15
/* 093CF0 80096CF0 4BFFFC14 */  b         lbl_80096904
lbl_80096CF4:
/* 093CF4 80096CF4 80610018 */  lwz       r3, 0x18(r1)
/* 093CF8 80096CF8 38800001 */  li        r4, 0x1
/* 093CFC 80096CFC 38000050 */  li        r0, 0x50
/* 093D00 80096D00 B0830012 */  sth       r4, 0x12(r3)
/* 093D04 80096D04 7FA3EB78 */  mr        r3, r29
/* 093D08 80096D08 901D0064 */  stw       r0, 0x64(r29)
/* 093D0C 80096D0C 4BFFF1F1 */  bl        send_mesg
/* 093D10 80096D10 480000E4 */  b         lbl_80096DF4
lbl_80096D14:
/* 093D14 80096D14 80810018 */  lwz       r4, 0x18(r1)
/* 093D18 80096D18 38000001 */  li        r0, 0x1
/* 093D1C 80096D1C 387D0000 */  addi      r3, r29, 0x0
/* 093D20 80096D20 90040018 */  stw       r0, 0x18(r4)
/* 093D24 80096D24 38A10028 */  addi      r5, r1, 0x28
/* 093D28 80096D28 3880000C */  li        r4, 0xc
/* 093D2C 80096D2C 4BF9DE49 */  bl        cpuGetRegisterCP0
/* 093D30 80096D30 2C030000 */  cmpwi     r3, 0x0
/* 093D34 80096D34 4082000C */  bne       lbl_80096D40
/* 093D38 80096D38 38600000 */  li        r3, 0x0
/* 093D3C 80096D3C 48000220 */  b         lbl_80096F5C
lbl_80096D40:
/* 093D40 80096D40 8081002C */  lwz       r4, 0x2c(r1)
/* 093D44 80096D44 3C002000 */  lis       r0, 0x2000
/* 093D48 80096D48 80A10028 */  lwz       r5, 0x28(r1)
/* 093D4C 80096D4C 387D0000 */  addi      r3, r29, 0x0
/* 093D50 80096D50 7C800378 */  or        r0, r4, r0
/* 093D54 80096D54 9001002C */  stw       r0, 0x2c(r1)
/* 093D58 80096D58 3880000C */  li        r4, 0xc
/* 093D5C 80096D5C 90A10028 */  stw       r5, 0x28(r1)
/* 093D60 80096D60 80A10028 */  lwz       r5, 0x28(r1)
/* 093D64 80096D64 80C1002C */  lwz       r6, 0x2c(r1)
/* 093D68 80096D68 4BF9E0B5 */  bl        cpuSetRegisterCP0
/* 093D6C 80096D6C 2C030000 */  cmpwi     r3, 0x0
/* 093D70 80096D70 40820148 */  bne       lbl_80096EB8
/* 093D74 80096D74 38600000 */  li        r3, 0x0
/* 093D78 80096D78 480001E4 */  b         lbl_80096F5C
lbl_80096D7C:
/* 093D7C 80096D7C 80BD0114 */  lwz       r5, 0x114(r29)
/* 093D80 80096D80 38E00001 */  li        r7, 0x1
/* 093D84 80096D84 80930034 */  lwz       r4, 0x34(r19)
/* 093D88 80096D88 38000002 */  li        r0, 0x2
/* 093D8C 80096D8C 387D0000 */  addi      r3, r29, 0x0
/* 093D90 80096D90 90A40000 */  stw       r5, 0x0(r4)
/* 093D94 80096D94 38A10028 */  addi      r5, r1, 0x28
/* 093D98 80096D98 38800008 */  li        r4, 0x8
/* 093D9C 80096D9C 80C10018 */  lwz       r6, 0x18(r1)
/* 093DA0 80096DA0 B0E60010 */  sth       r7, 0x10(r6)
/* 093DA4 80096DA4 80C10018 */  lwz       r6, 0x18(r1)
/* 093DA8 80096DA8 B0060012 */  sth       r0, 0x12(r6)
/* 093DAC 80096DAC 4BF9DDC9 */  bl        cpuGetRegisterCP0
/* 093DB0 80096DB0 2C030000 */  cmpwi     r3, 0x0
/* 093DB4 80096DB4 4082000C */  bne       lbl_80096DC0
/* 093DB8 80096DB8 38600000 */  li        r3, 0x0
/* 093DBC 80096DBC 480001A0 */  b         lbl_80096F5C
lbl_80096DC0:
/* 093DC0 80096DC0 8081002C */  lwz       r4, 0x2c(r1)
/* 093DC4 80096DC4 38000060 */  li        r0, 0x60
/* 093DC8 80096DC8 387D0000 */  addi      r3, r29, 0x0
/* 093DCC 80096DCC 90810010 */  stw       r4, 0x10(r1)
/* 093DD0 80096DD0 80810018 */  lwz       r4, 0x18(r1)
/* 093DD4 80096DD4 80A10010 */  lwz       r5, 0x10(r1)
/* 093DD8 80096DD8 90A40124 */  stw       r5, 0x124(r4)
/* 093DDC 80096DDC 901D0064 */  stw       r0, 0x64(r29)
/* 093DE0 80096DE0 4BFFF11D */  bl        send_mesg
/* 093DE4 80096DE4 7FA3EB78 */  mr        r3, r29
/* 093DE8 80096DE8 4BFFE589 */  bl        __osDispatchThread
/* 093DEC 80096DEC 38600001 */  li        r3, 0x1
/* 093DF0 80096DF0 4800016C */  b         lbl_80096F5C
lbl_80096DF4:
/* 093DF4 80096DF4 807D0114 */  lwz       r3, 0x114(r29)
/* 093DF8 80096DF8 38BD008C */  addi      r5, r29, 0x8c
/* 093DFC 80096DFC 38830004 */  addi      r4, r3, 0x4
/* 093E00 80096E00 5480843E */  srwi      r0, r4, 16
/* 093E04 80096E04 7C1E00AE */  lbzx      r0, r30, r0
/* 093E08 80096E08 5400103A */  slwi      r0, r0, 2
/* 093E0C 80096E0C 7C7F002E */  lwzx      r3, r31, r0
/* 093E10 80096E10 81830014 */  lwz       r12, 0x14(r3)
/* 093E14 80096E14 80030008 */  lwz       r0, 0x8(r3)
/* 093E18 80096E18 7D8803A6 */  mtlr      r12
/* 093E1C 80096E1C 80630004 */  lwz       r3, 0x4(r3)
/* 093E20 80096E20 7C840214 */  add       r4, r4, r0
/* 093E24 80096E24 4E800021 */  blrl
/* 093E28 80096E28 80930050 */  lwz       r4, 0x50(r19)
/* 093E2C 80096E2C 38BD0094 */  addi      r5, r29, 0x94
/* 093E30 80096E30 5480843E */  srwi      r0, r4, 16
/* 093E34 80096E34 7C1E00AE */  lbzx      r0, r30, r0
/* 093E38 80096E38 5400103A */  slwi      r0, r0, 2
/* 093E3C 80096E3C 7C7F002E */  lwzx      r3, r31, r0
/* 093E40 80096E40 81830014 */  lwz       r12, 0x14(r3)
/* 093E44 80096E44 80030008 */  lwz       r0, 0x8(r3)
/* 093E48 80096E48 7D8803A6 */  mtlr      r12
/* 093E4C 80096E4C 80630004 */  lwz       r3, 0x4(r3)
/* 093E50 80096E50 7C840214 */  add       r4, r4, r0
/* 093E54 80096E54 4E800021 */  blrl
/* 093E58 80096E58 807D0094 */  lwz       r3, 0x94(r29)
/* 093E5C 80096E5C 38BD009C */  addi      r5, r29, 0x9c
/* 093E60 80096E60 38830004 */  addi      r4, r3, 0x4
/* 093E64 80096E64 5480843E */  srwi      r0, r4, 16
/* 093E68 80096E68 7C1E00AE */  lbzx      r0, r30, r0
/* 093E6C 80096E6C 5400103A */  slwi      r0, r0, 2
/* 093E70 80096E70 7C7F002E */  lwzx      r3, r31, r0
/* 093E74 80096E74 81830014 */  lwz       r12, 0x14(r3)
/* 093E78 80096E78 80030008 */  lwz       r0, 0x8(r3)
/* 093E7C 80096E7C 7D8803A6 */  mtlr      r12
/* 093E80 80096E80 80630004 */  lwz       r3, 0x4(r3)
/* 093E84 80096E84 7C840214 */  add       r4, r4, r0
/* 093E88 80096E88 4E800021 */  blrl
/* 093E8C 80096E8C 807D008C */  lwz       r3, 0x8c(r29)
/* 093E90 80096E90 801D009C */  lwz       r0, 0x9c(r29)
/* 093E94 80096E94 7C030040 */  cmplw     r3, r0
/* 093E98 80096E98 40800020 */  bge       lbl_80096EB8
/* 093E9C 80096E9C 801D0114 */  lwz       r0, 0x114(r29)
/* 093EA0 80096EA0 7FA3EB78 */  mr        r3, r29
/* 093EA4 80096EA4 901D006C */  stw       r0, 0x6c(r29)
/* 093EA8 80096EA8 80130050 */  lwz       r0, 0x50(r19)
/* 093EAC 80096EAC 901D0064 */  stw       r0, 0x64(r29)
/* 093EB0 80096EB0 4BFFEB39 */  bl        __osEnqueueThread
/* 093EB4 80096EB4 4800009C */  b         lbl_80096F50
lbl_80096EB8:
/* 093EB8 80096EB8 80130050 */  lwz       r0, 0x50(r19)
/* 093EBC 80096EBC 38BD0094 */  addi      r5, r29, 0x94
/* 093EC0 80096EC0 901D008C */  stw       r0, 0x8c(r29)
/* 093EC4 80096EC4 809D008C */  lwz       r4, 0x8c(r29)
/* 093EC8 80096EC8 5480843E */  srwi      r0, r4, 16
/* 093ECC 80096ECC 7C1E00AE */  lbzx      r0, r30, r0
/* 093ED0 80096ED0 5400103A */  slwi      r0, r0, 2
/* 093ED4 80096ED4 7C7F002E */  lwzx      r3, r31, r0
/* 093ED8 80096ED8 81830014 */  lwz       r12, 0x14(r3)
/* 093EDC 80096EDC 80030008 */  lwz       r0, 0x8(r3)
/* 093EE0 80096EE0 7D8803A6 */  mtlr      r12
/* 093EE4 80096EE4 80630004 */  lwz       r3, 0x4(r3)
/* 093EE8 80096EE8 7C840214 */  add       r4, r4, r0
/* 093EEC 80096EEC 4E800021 */  blrl
/* 093EF0 80096EF0 809D0114 */  lwz       r4, 0x114(r29)
/* 093EF4 80096EF4 38BD0094 */  addi      r5, r29, 0x94
/* 093EF8 80096EF8 5480843E */  srwi      r0, r4, 16
/* 093EFC 80096EFC 7C1E00AE */  lbzx      r0, r30, r0
/* 093F00 80096F00 5400103A */  slwi      r0, r0, 2
/* 093F04 80096F04 7C7F002E */  lwzx      r3, r31, r0
/* 093F08 80096F08 81830024 */  lwz       r12, 0x24(r3)
/* 093F0C 80096F0C 80030008 */  lwz       r0, 0x8(r3)
/* 093F10 80096F10 7D8803A6 */  mtlr      r12
/* 093F14 80096F14 80630004 */  lwz       r3, 0x4(r3)
/* 093F18 80096F18 7C840214 */  add       r4, r4, r0
/* 093F1C 80096F1C 4E800021 */  blrl
/* 093F20 80096F20 809D008C */  lwz       r4, 0x8c(r29)
/* 093F24 80096F24 38BD0114 */  addi      r5, r29, 0x114
/* 093F28 80096F28 5480843E */  srwi      r0, r4, 16
/* 093F2C 80096F2C 7C1E00AE */  lbzx      r0, r30, r0
/* 093F30 80096F30 5400103A */  slwi      r0, r0, 2
/* 093F34 80096F34 7C7F002E */  lwzx      r3, r31, r0
/* 093F38 80096F38 81830024 */  lwz       r12, 0x24(r3)
/* 093F3C 80096F3C 80030008 */  lwz       r0, 0x8(r3)
/* 093F40 80096F40 7D8803A6 */  mtlr      r12
/* 093F44 80096F44 80630004 */  lwz       r3, 0x4(r3)
/* 093F48 80096F48 7C840214 */  add       r4, r4, r0
/* 093F4C 80096F4C 4E800021 */  blrl
lbl_80096F50:
/* 093F50 80096F50 7FA3EB78 */  mr        r3, r29
/* 093F54 80096F54 4BFFE41D */  bl        __osDispatchThread
/* 093F58 80096F58 38600001 */  li        r3, 0x1
lbl_80096F5C:
/* 093F5C 80096F5C BA210034 */  lmw       r17, 0x34(r1)
/* 093F60 80096F60 80010074 */  lwz       r0, 0x74(r1)
/* 093F64 80096F64 38210070 */  addi      r1, r1, 0x70
/* 093F68 80096F68 7C0803A6 */  mtlr      r0
/* 093F6C 80096F6C 4E800020 */  blr

# 0x800EFFC0 - 0x800F1470
.section .data, "wa"

.balign 8

glabel D_800EFFC0
	.string "OS-LIBRARY"

glabel gap_05_800EFFCB_data
.hidden gap_05_800EFFCB_data
	.byte 0x00

glabel gClassLibrary
	.long D_800EFFC0
	.long 0x00000068
	.long 0x00000000
	.long libraryEvent

glabel D_800EFFDC
	.long 0x00000555
	.long 0x00000556
	.long 0x00000559
	.long 0x0000055A
	.long 0x00000565
	.long 0x00000566
	.long 0x00000569
	.long 0x0000056A
	.long 0x00000595
	.long 0x00000596
	.long 0x00000599
	.long 0x0000059A
	.long 0x000005A5
	.long 0x000005A6
	.long 0x000005A9
	.long 0x000005AA
	.long 0x00000655
	.long 0x00000656
	.long 0x00000659
	.long 0x0000065A
	.long 0x00000665
	.long 0x00000666
	.long 0x00000669
	.long 0x0000066A
	.long 0x00000695
	.long 0x00000696
	.long 0x00000699
	.long 0x0000069A
	.long 0x000006A5
	.long 0x000006A6
	.long 0x000006A9
	.long 0x000006AA
	.long 0x00000955
	.long 0x00000956
	.long 0x00000959
	.long 0x0000095A
	.long 0x00000965
	.long 0x00000966
	.long 0x00000969
	.long 0x0000096A
	.long 0x00000995
	.long 0x00000996
	.long 0x00000999
	.long 0x0000099A
	.long 0x000009A5
	.long 0x000009A6
	.long 0x000009A9
	.long 0x000009AA
	.long 0x00000A55
	.long 0x00000A56
	.long 0x00000A59
	.long 0x00000A5A
	.long 0x00000A65
	.long 0x00000A66
	.long 0x00000A69
	.long 0x00000A6A
	.long 0x00000A95
	.long 0x00000A96
	.long 0x00000A99
	.long 0x00000A9A
	.long 0x00000AA5
	.long 0x00000AA6
	.long 0x00000AA9
	.long 0x00000AAA

glabel D_800F00DC
	.long 0x73656E64
	.long 0x5F6D6573
	.long 0x67000000

glabel D_800F00E8
	.string "__osEnqueueAndYield"

glabel D_800F00FC
	.long 0x5F5F6F73
	.long 0x456E7175
	.long 0x65756554
	.long 0x68726561
	.long 0x64000000

glabel D_800F0110
	.long 0x5F5F6F73
	.long 0x506F7054
	.long 0x68726561
	.long 0x64000000

glabel D_800F0120
	.long 0x5F5F6F73
	.long 0x44697370
	.long 0x61746368
	.long 0x54687265
	.long 0x61640000

glabel D_800F0134
	.long 0x6F734765
	.long 0x744D656D
	.long 0x53697A65
	.long 0x00000000

glabel D_800F0144
	.long 0x6F73496E
	.long 0x76616C44
	.long 0x43616368
	.long 0x65000000

glabel D_800F0154
	.long 0x6F73496E
	.long 0x76616C49
	.long 0x43616368
	.long 0x65000000

glabel D_800F0164
	.long 0x6F735772
	.long 0x69746562
	.long 0x61636B44
	.long 0x43616368
	.long 0x65000000

glabel D_800F0178
	.long 0x6F735772
	.long 0x69746562
	.long 0x61636B44
	.long 0x43616368
	.long 0x65416C6C
	.long 0x00000000

glabel D_800F0190
	.long 0x5F5F6F73
	.long 0x44697361
	.long 0x626C6549
	.long 0x6E740000

glabel D_800F01A0
	.long 0x5F5F6F73
	.long 0x52657374
	.long 0x6F726549
	.long 0x6E740000

glabel D_800F01B0
	.string "__osSpSetStatus"

glabel D_800F01C0
	.string "osVirtualToPhysical"

glabel D_800F01D4
	.string "osPhysicalToVirtual"

glabel D_800F01E8
	.long 0x67754D74
	.long 0x7846324C
	.long 0x00000000

glabel D_800F01F4
	.long 0x67754D74
	.long 0x78436174
	.long 0x46000000

glabel D_800F0200
	.string "guMtxIdentF"

glabel D_800F020C
	.long 0x67754D74
	.long 0x78496465
	.long 0x6E740000

glabel D_800F0218
	.long 0x67754F72
	.long 0x74686F46
	.long 0x00000000

glabel D_800F0224
	.long 0x67755065
	.long 0x72737065
	.long 0x63746976
	.long 0x65460000

glabel D_800F0234
	.long 0x67755065
	.long 0x72737065
	.long 0x63746976
	.long 0x65000000

glabel D_800F0244
	.long 0x67755363
	.long 0x616C6546
	.long 0x00000000

glabel D_800F0250
	.long 0x6775526F
	.long 0x74617465
	.long 0x46000000

glabel D_800F025C
	.long 0x6775526F
	.long 0x74617465
	.long 0x00000000

glabel D_800F0268
	.long 0x67755472
	.long 0x616E736C
	.long 0x61746546
	.long 0x00000000

glabel D_800F0278
	.string "guTranslate"

glabel D_800F0284
	.long 0x67754C6F
	.long 0x6F6B4174
	.long 0x46000000

glabel D_800F0290
	.long 0x67754C6F
	.long 0x6F6B4174
	.long 0x00000000

glabel D_800F029C
	.string "guLookAtHiliteF"

glabel D_800F02AC
	.long 0x67754C6F
	.long 0x6F6B4174
	.long 0x48696C69
	.long 0x74650000

glabel D_800F02BC
	.long 0x67754C6F
	.long 0x6F6B4174
	.long 0x5265666C
	.long 0x65637446
	.long 0x00000000

glabel D_800F02D0
	.string "guLookAtReflect"

glabel D_800F02E0
	.long 0x6F734169
	.long 0x53657446
	.long 0x72657175
	.long 0x656E6379
	.long 0x00000000

glabel D_800F02F4
	.long 0x6F734169
	.long 0x5365744E
	.long 0x65787442
	.long 0x75666665
	.long 0x72000000

glabel D_800F0308
	.long 0x5F5F6F73
	.long 0x45657053
	.long 0x74617475
	.long 0x73000000

glabel D_800F0318
	.long 0x6F734565
	.long 0x70726F6D
	.long 0x52656164
	.long 0x00000000

glabel D_800F0328
	.long 0x6F734565
	.long 0x70726F6D
	.long 0x57726974
	.long 0x65000000

glabel D_800F0338
	.long 0x6F734565
	.long 0x70726F6D
	.long 0x4C6F6E67
	.long 0x52656164
	.long 0x00000000

glabel D_800F034C
	.long 0x6F734565
	.long 0x70726F6D
	.long 0x4C6F6E67
	.long 0x57726974
	.long 0x65000000

glabel D_800F0360
	.string "starfoxCopy"

glabel D_800F036C
	.long 0x47656E50
	.long 0x65727370
	.long 0x65637469
	.long 0x76650000

glabel D_800F037C
	.long 0x70696374
	.long 0x75726553
	.long 0x6E61705F
	.long 0x5A656C64
	.long 0x61320000

glabel D_800F0390
	.long 0x646D6153
	.long 0x6F756E64
	.long 0x526F6D48
	.long 0x616E646C
	.long 0x65725F5A
	.long 0x454C4441
	.long 0x31000000

glabel D_800F03AC
	.long 0x6F735669
	.long 0x53776170
	.long 0x42756666
	.long 0x65725F45
	.long 0x6E747279
	.long 0x00000000

glabel D_800F03C4
	.long 0x7A656C64
	.long 0x614C6F61
	.long 0x64535A53
	.long 0x5F456E74
	.long 0x72790000

glabel D_800F03D8
	.long 0x7A656C64
	.long 0x614C6F61
	.long 0x64535A53
	.long 0x5F457869
	.long 0x74000000

glabel D_800F03EC
	.long D_800F00DC
	.long send_mesg
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
	.long D_800F00E8
	.long __osEnqueueAndYield
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
	.long D_800F00FC
	.long __osEnqueueThread
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
	.long D_800F0110
	.long __osPopThread
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000

glabel D_800F04E8
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
	.long D_800F0120
	.long __osDispatchThread
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
	.long D_800F0134
	.long osGetMemSize
	.long 0x00000045
	.long 0xE82F9DC4
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
	.long D_800F0144
	.long 0x00000000
	.long 0x0000002C
	.long 0x384D2C37
	.long 0x0000002B
	.long 0x3954FA00
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
	.long D_800F0154
	.long osInvalICache
	.long 0x0000001D
	.long 0x376979EF
	.long 0x0000001D
	.long 0x3769A92F
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
	.long D_800F0164
	.long 0x00000000
	.long 0x0000001D
	.long 0x376979EF
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
	.long D_800F0178
	.long 0x00000000
	.long 0x0000000A
	.long 0x0F38926F
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
	.long D_800F0190
	.long __osDisableInt
	.long 0x00000020
	.long 0x3F5B05D4
	.long 0x00000022
	.long 0x3F5B35D1
	.long 0x00000008
	.long 0x10310240
	.long 0x0000000C
	.long 0x10310300
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long D_800F01A0
	.long __osRestoreInt
	.long 0x00000007
	.long 0x10000400
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
	.long D_800F01B0
	.long __osSpSetStatus
	.long 0x00000003
	.long 0x0000F02B
	.long 0x00000004
	.long 0x003CD02B
	.long 0x0000000B
	.long 0x5604E8E1
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
	.long D_8018B5C4
	.long __cosf
	.long 0x0000007E
	.long 0x0EA800A6
	.long 0x0000005A
	.long 0xA7BF8A16
	.long 0x0000008E
	.long 0x417938C2
	.long 0x000002B5
	.long 0x82283827
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long D_8018B5CC
	.long __sinf
	.long 0x0000007D
	.long 0x9DDC3AD1
	.long 0x00000070
	.long 0x972CC1AA
	.long 0x000000AB
	.long 0x537273BE
	.long 0x00000090
	.long 0xA23718AB
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long D_8018B5D4
	.long _bzero
	.long 0x00000028
	.long 0x6A68DD7D
	.long 0x00000027
	.long 0x6A68E5DB
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
	.long D_8018B5DC
	.long _bcopy
	.long 0x000000CE
	.long 0xFF1D6C61
	.long 0x000000F0
	.long 0x082F2020
	.long 0x000000C7
	.long 0xB1771900
	.long 0x000000C7
	.long 0xC732F943
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long D_8018B5E4
	.long _memcpy
	.long 0x00000026
	.long 0xC912B3A8
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
	.long D_800F01C0
	.long osVirtualToPhysical
	.long 0x00000037
	.long 0x5F70CFD6
	.long 0x00000015
	.long 0x17E44014
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
	.long D_800F01D4
	.long osPhysicalToVirtual
	.long 0x0000000D
	.long 0x2B8FBACB
	.long 0x00000003
	.long 0x0000F000
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
	.long D_800F01E8
	.long guMtxF2L
	.long 0x00000026
	.long 0x686C0856
	.long 0x00000019
	.long 0x7CC68902
	.long 0x00000040
	.long 0x4425DE45
	.long 0x0000005C
	.long 0x220BB2B0
	.long 0x00000027
	.long 0x60FF87FD
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long D_800F01F4
	.long guMtxCatF
	.long 0x00000037
	.long 0x91255B90
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
	.long D_800F0200
	.long guMtxIdentF
	.long 0x00000014
	.long 0x14BCF092
	.long 0x00000022
	.long 0x69E2607E
	.long 0x0000003B
	.long 0x03585A21
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
	.long D_800F020C
	.long guMtxIdent
	.long 0x0000003C
	.long 0xA20CBF46
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
	.long D_800F0218
	.long guOrthoF
	.long 0x00000055
	.long 0x7F37D860
	.long 0x00000080
	.long 0x7C65E2F4
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
	.long D_8018B5EC
	.long guOrtho
	.long 0x0000001A
	.long 0xB0EC9807
	.long 0x00000053
	.long 0xA76A660F
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
	.long D_800F0224
	.long guPerspectiveF
	.long 0x0000008C
	.long 0x9EC5FEAB
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
	.long D_800F0234
	.long guPerspective
	.long 0x00000072
	.long 0x2B0214E7
	.long 0x00000016
	.long 0x99A85378
	.long 0x0000001B
	.long 0x8CC9B39E
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
	.long D_800F0244
	.long guScaleF
	.long 0x00000015
	.long 0xCA91FB16
	.long 0x00000018
	.long 0x8497864D
	.long 0x00000020
	.long 0xBC8FF165
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
	.long D_8018B5F4
	.long guScale
	.long 0x0000001F
	.long 0xA2C19EFB
	.long 0x00000012
	.long 0x3E48EAE5
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
	.long D_800F0250
	.long guRotateF
	.long 0x00000065
	.long 0xD5CF8FAE
	.long 0x00000057
	.long 0xFA3518F4
	.long 0x00000093
	.long 0x9AA6B979
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
	.long D_800F025C
	.long guRotate
	.long 0x0000005E
	.long 0x06A7BCE6
	.long 0x00000014
	.long 0x698E4905
	.long 0x00000017
	.long 0x36AEAFA5
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
	.long D_800F0268
	.long guTranslateF
	.long 0x0000001B
	.long 0xC211F512
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
	.long D_800F0278
	.long guTranslate
	.long 0x0000001C
	.long 0x80FA01A4
	.long 0x00000015
	.long 0x71F205A8
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
	.long D_800F0284
	.long guLookAtF
	.long 0x00000107
	.long 0xB11E3841
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
	.long D_800F0290
	.long guLookAt
	.long 0x000000E1
	.long 0xE544558C
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
	.long D_800F029C
	.long guLookAtHiliteF
	.long 0x000002E9
	.long 0xCA0CCB5F
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
	.long D_800F02AC
	.long guLookAtHilite
	.long 0x00000035
	.long 0xC2E98EC2
	.long 0x00000035
	.long 0x6B82DCD5
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
	.long D_800F02BC
	.long guLookAtReflectF
	.long 0x0000015E
	.long 0x55ACFC31
	.long 0x000001BF
	.long 0xBFD63279
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
	.long D_800F02D0
	.long guLookAtReflect
	.long 0x0000001B
	.long 0xD6F88212
	.long 0x00000023
	.long 0xD70B815D
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
	.long D_800F02E0
	.long osAiSetFrequency
	.long 0x00000046
	.long 0x88F8FC90
	.long 0x00000058
	.long 0xA177D03D
	.long 0x00000051
	.long 0xD3B85DEF
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
	.long D_800F02F4
	.long osAiSetNextBuffer
	.long 0x00000025
	.long 0x5ACF0804
	.long 0x0000002A
	.long 0x978F50F1
	.long 0x0000001D
	.long 0x47200DC9
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
	.long D_800F0308
	.long __osEepStatus
	.long 0x000000A8
	.long 0x8FBCE3BC
	.long 0x00000067
	.long 0x9870CAC4
	.long 0x00000089
	.long 0x807A196A
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
	.long D_800F0318
	.long osEepromRead
	.long 0x00000066
	.long 0x380B07CA
	.long 0x000000A5
	.long 0x947050BF
	.long 0x0000007C
	.long 0x66EC38E8
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
	.long D_800F0328
	.long osEepromWrite
	.long 0x0000005A
	.long 0x5FCCA978
	.long 0x00000080
	.long 0xF6971795
	.long 0x0000006C
	.long 0x07B6DF06
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
	.long D_800F0338
	.long osEepromLongRead
	.long 0x0000001C
	.long 0x63BA7FE0
	.long 0x0000002E
	.long 0xF25B283A
	.long 0x0000004F
	.long 0x5B919EF9
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
	.long D_800F034C
	.long osEepromLongWrite
	.long 0x00000039
	.long 0xED7A2E0B
	.long 0x00000044
	.long 0xF6B9E6BD
	.long 0x0000004F
	.long 0x5B919EF9
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
	.long D_800F0360
	.long starfoxCopy
	.long 0x00000026
	.long 0x158C0203
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
	.long D_800F036C
	.long GenPerspective_1080
	.long 0x0000002F
	.long 0x3879CA27
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
	.long D_800F037C
	.long pictureSnap_Zelda2
	.long 0x000001F0
	.long 0xC2739708
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
	.long D_800F0390
	.long dmaSoundRomHandler_ZELDA1
	.long 0x0000001D
	.long 0x7C4D46F6
	.long 0x00000008
	.long 0x008D2AC3
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
	.long D_800F03AC
	.long osViSwapBuffer_Entry
	.long 0x00000011
	.long 0x5147109A
	.long 0x00000038
	.long 0xBF405C09
	.long 0x00000014
	.long 0x745C58FD
	.long 0x00000013
	.long 0x6467CCEE
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long D_800F03C4
	.long zeldaLoadSZS_Entry
	.long 0x0000005A
	.long 0x8EA707A2
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
	.long D_800F03D8
	.long zeldaLoadSZS_Exit
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
	.long 0x54657374
	.long 0x46756E63
	.long 0x74696F6E
	.long 0x3A20494E
	.long 0x5445524E
	.long 0x414C2045
	.long 0x52524F52
	.long 0x3A206F73
	.long 0x56695377
	.long 0x61704275
	.long 0x66666572
	.long 0x3A204E6F
	.long 0x20414444
	.long 0x4955206F
	.long 0x70636F64
	.long 0x653A2030
	.long 0x78253038
	.long 0x78000000
	.long 0x6C696272
	.long 0x6172792E
	.long 0x63000000

jtbl_800F1448:
	.long __osException, lbl_80096DF4
	.long __osException, lbl_80096980
	.long __osException, lbl_800969DC
	.long __osException, lbl_80096A38
	.long __osException, lbl_80096C5C
	.long __osException, lbl_80096C74
	.long __osException, lbl_80096C88
	.long __osException, lbl_80096C90
	.long __osException, lbl_80096C98

glabel gap_05_800F146C_data
.hidden gap_05_800F146C_data
	.long 0x00000000

# 0x8018B5B8 - 0x8018B600
.section .sdata, "wa"

glabel D_8018B5B8
	.float 0.017453292

glabel D_8018B5BC
	.float 0.017453292

glabel D_8018B5C0
	.long 0xFFFFFFFF

glabel D_8018B5C4
	.long 0x5F5F636F
	.long 0x73660000

glabel D_8018B5CC
	.long 0x5F5F7369
	.long 0x6E660000

glabel D_8018B5D4
	.long 0x627A6572
	.long 0x6F000000

glabel D_8018B5DC
	.long 0x62636F70
	.long 0x79000000

glabel D_8018B5E4
	.long 0x6D656D63
	.long 0x70790000

glabel D_8018B5EC
	.string "guOrtho"

glabel D_8018B5F4
	.long 0x67755363
	.long 0x616C6500
	.long 0x00000000

# 0x8018C2B8 - 0x8018C318
.section .sdata2, "a"

glabel D_8018C2B8
	.float 0.5

glabel D_8018C2BC
	.float 48681812

glabel D_8018C2C0
	.double 4503599627370496

glabel D_8018C2C8
	.float 0

glabel gap_09_8018C2CC_sdata2
.hidden gap_09_8018C2CC_sdata2
	.long 0x00000000

glabel D_8018C2D0
	.double 0.5

glabel D_8018C2D8
	.double 3

glabel D_8018C2E0
	.float -1

glabel D_8018C2E4
	.float 1

glabel D_8018C2E8
	.float 128

glabel D_8018C2EC
	.float 127

glabel D_8018C2F0
	.float 65536

glabel gap_09_8018C2F4_sdata2
.hidden gap_09_8018C2F4_sdata2
	.long 0x00000000

glabel D_8018C2F8
	.double 0.1

glabel D_8018C300
	.float 2

glabel gap_09_8018C304_sdata2
.hidden gap_09_8018C304_sdata2
	.long 0x00000000

glabel D_8018C308
	.double 4503601774854144

glabel D_8018C310
	.float 0.017453292

glabel D_8018C314
	.float -2
