# mem.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel memcmp
/* 0C9370 800CE910 38C3FFFF */  addi	r6, r3, -1
/* 0C9374 800CE914 3884FFFF */  addi	r4, r4, -1
/* 0C9378 800CE918 38A50001 */  addi	r5, r5, 1
/* 0C937C 800CE91C 48000028 */  b		lbl_800CE944
lbl_800CE920:
/* 0C9380 800CE920 8C660001 */  lbzu	r3, 1(r6)
/* 0C9384 800CE924 8C040001 */  lbzu	r0, 1(r4)
/* 0C9388 800CE928 7C030040 */  cmplw	r3, r0
/* 0C938C 800CE92C 41820018 */  beq		lbl_800CE944
/* 0C9390 800CE930 4080000C */  bge		lbl_800CE93C
/* 0C9394 800CE934 3860FFFF */  li		r3, -1
/* 0C9398 800CE938 4E800020 */  blr		
lbl_800CE93C:
/* 0C939C 800CE93C 38600001 */  li		r3, 1
/* 0C93A0 800CE940 4E800020 */  blr		
lbl_800CE944:
/* 0C93A4 800CE944 34A5FFFF */  addic.	r5, r5, -1
/* 0C93A8 800CE948 4082FFD8 */  bne		lbl_800CE920
/* 0C93AC 800CE94C 38600000 */  li		r3, 0
/* 0C93B0 800CE950 4E800020 */  blr		

glabel memchr
/* 0C93B4 800CE954 5484063E */  clrlwi	r4, r4, 0x18
/* 0C93B8 800CE958 3863FFFF */  addi	r3, r3, -1
/* 0C93BC 800CE95C 38A50001 */  addi	r5, r5, 1
/* 0C93C0 800CE960 48000010 */  b		lbl_800CE970
lbl_800CE964:
/* 0C93C4 800CE964 8C030001 */  lbzu	r0, 1(r3)
/* 0C93C8 800CE968 7C002040 */  cmplw	r0, r4
/* 0C93CC 800CE96C 4D820020 */  beqlr	
lbl_800CE970:
/* 0C93D0 800CE970 34A5FFFF */  addic.	r5, r5, -1
/* 0C93D4 800CE974 4082FFF0 */  bne		lbl_800CE964
/* 0C93D8 800CE978 38600000 */  li		r3, 0
/* 0C93DC 800CE97C 4E800020 */  blr		

glabel memmove
/* 0C93E0 800CE980 7C0802A6 */  mflr	r0
/* 0C93E4 800CE984 28050020 */  cmplwi	r5, 0x20
/* 0C93E8 800CE988 90010004 */  stw		r0, 4(r1)
/* 0C93EC 800CE98C 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0C93F0 800CE990 93E1001C */  stw		r31, 0x1c(r1)
/* 0C93F4 800CE994 3BE30000 */  addi	r31, r3, 0
/* 0C93F8 800CE998 7C7F2010 */  subfc	r3, r31, r4
/* 0C93FC 800CE99C 7C000110 */  subfe	r0, r0, r0
/* 0C9400 800CE9A0 7C6000D0 */  neg		r3, r0
/* 0C9404 800CE9A4 41800054 */  blt		lbl_800CE9F8
/* 0C9408 800CE9A8 7FE02278 */  xor		r0, r31, r4
/* 0C940C 800CE9AC 540007BF */  clrlwi.	r0, r0, 0x1e
/* 0C9410 800CE9B0 41820024 */  beq		lbl_800CE9D4
/* 0C9414 800CE9B4 2C030000 */  cmpwi	r3, 0
/* 0C9418 800CE9B8 40820010 */  bne		lbl_800CE9C8
/* 0C941C 800CE9BC 7FE3FB78 */  mr		r3, r31
/* 0C9420 800CE9C0 4800014D */  bl		__copy_longs_unaligned
/* 0C9424 800CE9C4 4800002C */  b		lbl_800CE9F0
lbl_800CE9C8:
/* 0C9428 800CE9C8 7FE3FB78 */  mr		r3, r31
/* 0C942C 800CE9CC 48000091 */  bl		__copy_longs_rev_unaligned
/* 0C9430 800CE9D0 48000020 */  b		lbl_800CE9F0
lbl_800CE9D4:
/* 0C9434 800CE9D4 2C030000 */  cmpwi	r3, 0
/* 0C9438 800CE9D8 40820010 */  bne		lbl_800CE9E8
/* 0C943C 800CE9DC 7FE3FB78 */  mr		r3, r31
/* 0C9440 800CE9E0 4800029D */  bl		__copy_longs_aligned
/* 0C9444 800CE9E4 4800000C */  b		lbl_800CE9F0
lbl_800CE9E8:
/* 0C9448 800CE9E8 7FE3FB78 */  mr		r3, r31
/* 0C944C 800CE9EC 480001E5 */  bl		__copy_longs_rev_aligned
lbl_800CE9F0:
/* 0C9450 800CE9F0 7FE3FB78 */  mr		r3, r31
/* 0C9454 800CE9F4 48000054 */  b		lbl_800CEA48
lbl_800CE9F8:
/* 0C9458 800CE9F8 2C030000 */  cmpwi	r3, 0
/* 0C945C 800CE9FC 40820028 */  bne		lbl_800CEA24
/* 0C9460 800CEA00 3864FFFF */  addi	r3, r4, -1
/* 0C9464 800CEA04 389FFFFF */  addi	r4, r31, -1
/* 0C9468 800CEA08 38A50001 */  addi	r5, r5, 1
/* 0C946C 800CEA0C 4800000C */  b		lbl_800CEA18
lbl_800CEA10:
/* 0C9470 800CEA10 8C030001 */  lbzu	r0, 1(r3)
/* 0C9474 800CEA14 9C040001 */  stbu	r0, 1(r4)
lbl_800CEA18:
/* 0C9478 800CEA18 34A5FFFF */  addic.	r5, r5, -1
/* 0C947C 800CEA1C 4082FFF4 */  bne		lbl_800CEA10
/* 0C9480 800CEA20 48000024 */  b		lbl_800CEA44
lbl_800CEA24:
/* 0C9484 800CEA24 7C642A14 */  add		r3, r4, r5
/* 0C9488 800CEA28 7C9F2A14 */  add		r4, r31, r5
/* 0C948C 800CEA2C 38A50001 */  addi	r5, r5, 1
/* 0C9490 800CEA30 4800000C */  b		lbl_800CEA3C
lbl_800CEA34:
/* 0C9494 800CEA34 8C03FFFF */  lbzu	r0, -1(r3)
/* 0C9498 800CEA38 9C04FFFF */  stbu	r0, -1(r4)
lbl_800CEA3C:
/* 0C949C 800CEA3C 34A5FFFF */  addic.	r5, r5, -1
/* 0C94A0 800CEA40 4082FFF4 */  bne		lbl_800CEA34
lbl_800CEA44:
/* 0C94A4 800CEA44 7FE3FB78 */  mr		r3, r31
lbl_800CEA48:
/* 0C94A8 800CEA48 80010024 */  lwz		r0, 0x24(r1)
/* 0C94AC 800CEA4C 83E1001C */  lwz		r31, 0x1c(r1)
/* 0C94B0 800CEA50 38210020 */  addi	r1, r1, 0x20
/* 0C94B4 800CEA54 7C0803A6 */  mtlr	r0
/* 0C94B8 800CEA58 4E800020 */  blr		


