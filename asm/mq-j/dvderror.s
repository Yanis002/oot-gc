# dvderror.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x800B4628 - 0x800B47C0

ErrorCode2Num:
/* 0B1628 800B4628 38000002 */  li        r0, 0x2
/* 0B162C 800B462C 3C80800F */  lis       r4, D_800F3948@ha
/* 0B1630 800B4630 7C0903A6 */  mtctr     r0
/* 0B1634 800B4634 38843948 */  addi      r4, r4, D_800F3948@l
/* 0B1638 800B4638 38A00000 */  li        r5, 0x0
lbl_800B463C:
/* 0B163C 800B463C 80040000 */  lwz       r0, 0x0(r4)
/* 0B1640 800B4640 7C030040 */  cmplw     r3, r0
/* 0B1644 800B4644 4082000C */  bne       lbl_800B4650
/* 0B1648 800B4648 54A3063E */  clrlwi    r3, r5, 24
/* 0B164C 800B464C 4E800020 */  blr
lbl_800B4650:
/* 0B1650 800B4650 84040004 */  lwzu      r0, 0x4(r4)
/* 0B1654 800B4654 38A50001 */  addi      r5, r5, 0x1
/* 0B1658 800B4658 7C030040 */  cmplw     r3, r0
/* 0B165C 800B465C 4082000C */  bne       lbl_800B4668
/* 0B1660 800B4660 54A3063E */  clrlwi    r3, r5, 24
/* 0B1664 800B4664 4E800020 */  blr
lbl_800B4668:
/* 0B1668 800B4668 84040004 */  lwzu      r0, 0x4(r4)
/* 0B166C 800B466C 38A50001 */  addi      r5, r5, 0x1
/* 0B1670 800B4670 7C030040 */  cmplw     r3, r0
/* 0B1674 800B4674 4082000C */  bne       lbl_800B4680
/* 0B1678 800B4678 54A3063E */  clrlwi    r3, r5, 24
/* 0B167C 800B467C 4E800020 */  blr
lbl_800B4680:
/* 0B1680 800B4680 84040004 */  lwzu      r0, 0x4(r4)
/* 0B1684 800B4684 38A50001 */  addi      r5, r5, 0x1
/* 0B1688 800B4688 7C030040 */  cmplw     r3, r0
/* 0B168C 800B468C 4082000C */  bne       lbl_800B4698
/* 0B1690 800B4690 54A3063E */  clrlwi    r3, r5, 24
/* 0B1694 800B4694 4E800020 */  blr
lbl_800B4698:
/* 0B1698 800B4698 84040004 */  lwzu      r0, 0x4(r4)
/* 0B169C 800B469C 38A50001 */  addi      r5, r5, 0x1
/* 0B16A0 800B46A0 7C030040 */  cmplw     r3, r0
/* 0B16A4 800B46A4 4082000C */  bne       lbl_800B46B0
/* 0B16A8 800B46A8 54A3063E */  clrlwi    r3, r5, 24
/* 0B16AC 800B46AC 4E800020 */  blr
lbl_800B46B0:
/* 0B16B0 800B46B0 84040004 */  lwzu      r0, 0x4(r4)
/* 0B16B4 800B46B4 38A50001 */  addi      r5, r5, 0x1
/* 0B16B8 800B46B8 7C030040 */  cmplw     r3, r0
/* 0B16BC 800B46BC 4082000C */  bne       lbl_800B46C8
/* 0B16C0 800B46C0 54A3063E */  clrlwi    r3, r5, 24
/* 0B16C4 800B46C4 4E800020 */  blr
lbl_800B46C8:
/* 0B16C8 800B46C8 84040004 */  lwzu      r0, 0x4(r4)
/* 0B16CC 800B46CC 38A50001 */  addi      r5, r5, 0x1
/* 0B16D0 800B46D0 7C030040 */  cmplw     r3, r0
/* 0B16D4 800B46D4 4082000C */  bne       lbl_800B46E0
/* 0B16D8 800B46D8 54A3063E */  clrlwi    r3, r5, 24
/* 0B16DC 800B46DC 4E800020 */  blr
lbl_800B46E0:
/* 0B16E0 800B46E0 84040004 */  lwzu      r0, 0x4(r4)
/* 0B16E4 800B46E4 38A50001 */  addi      r5, r5, 0x1
/* 0B16E8 800B46E8 7C030040 */  cmplw     r3, r0
/* 0B16EC 800B46EC 4082000C */  bne       lbl_800B46F8
/* 0B16F0 800B46F0 54A3063E */  clrlwi    r3, r5, 24
/* 0B16F4 800B46F4 4E800020 */  blr
lbl_800B46F8:
/* 0B16F8 800B46F8 84040004 */  lwzu      r0, 0x4(r4)
/* 0B16FC 800B46FC 38A50001 */  addi      r5, r5, 0x1
/* 0B1700 800B4700 7C030040 */  cmplw     r3, r0
/* 0B1704 800B4704 4082000C */  bne       lbl_800B4710
/* 0B1708 800B4708 54A3063E */  clrlwi    r3, r5, 24
/* 0B170C 800B470C 4E800020 */  blr
lbl_800B4710:
/* 0B1710 800B4710 38840004 */  addi      r4, r4, 0x4
/* 0B1714 800B4714 38A50001 */  addi      r5, r5, 0x1
/* 0B1718 800B4718 4200FF24 */  bdnz      lbl_800B463C
/* 0B171C 800B471C 3C800010 */  lis       r4, 0x10
/* 0B1720 800B4720 7C032040 */  cmplw     r3, r4
/* 0B1724 800B4724 41800018 */  blt       lbl_800B473C
/* 0B1728 800B4728 38040008 */  addi      r0, r4, 0x8
/* 0B172C 800B472C 7C030040 */  cmplw     r3, r0
/* 0B1730 800B4730 4181000C */  bgt       lbl_800B473C
/* 0B1734 800B4734 38600011 */  li        r3, 0x11
/* 0B1738 800B4738 4E800020 */  blr
lbl_800B473C:
/* 0B173C 800B473C 3860001D */  li        r3, 0x1d
/* 0B1740 800B4740 4E800020 */  blr

glabel __DVDStoreErrorCode
/* 0B1744 800B4744 7C0802A6 */  mflr      r0
/* 0B1748 800B4748 90010004 */  stw       r0, 0x4(r1)
/* 0B174C 800B474C 3C03FEDD */  subis     r0, r3, 0x123
/* 0B1750 800B4750 28004567 */  cmplwi    r0, 0x4567
/* 0B1754 800B4754 9421FFE8 */  stwu      r1, -0x18(r1)
/* 0B1758 800B4758 93E10014 */  stw       r31, 0x14(r1)
/* 0B175C 800B475C 4082000C */  bne       lbl_800B4768
/* 0B1760 800B4760 3BE000FF */  li        r31, 0xff
/* 0B1764 800B4764 48000038 */  b         lbl_800B479C
lbl_800B4768:
/* 0B1768 800B4768 28004568 */  cmplwi    r0, 0x4568
/* 0B176C 800B476C 4082000C */  bne       lbl_800B4778
/* 0B1770 800B4770 3BE000FE */  li        r31, 0xfe
/* 0B1774 800B4774 48000028 */  b         lbl_800B479C
lbl_800B4778:
/* 0B1778 800B4778 547F463E */  srwi      r31, r3, 24
/* 0B177C 800B477C 5463023E */  clrlwi    r3, r3, 8
/* 0B1780 800B4780 4BFFFEA9 */  bl        ErrorCode2Num
/* 0B1784 800B4784 281F0006 */  cmplwi    r31, 0x6
/* 0B1788 800B4788 41800008 */  blt       lbl_800B4790
/* 0B178C 800B478C 3BE00006 */  li        r31, 0x6
lbl_800B4790:
/* 0B1790 800B4790 1C1F001E */  mulli     r0, r31, 0x1e
/* 0B1794 800B4794 5463063E */  clrlwi    r3, r3, 24
/* 0B1798 800B4798 7FE30214 */  add       r31, r3, r0
lbl_800B479C:
/* 0B179C 800B479C 4BFEB4E1 */  bl        __OSLockSramEx
/* 0B17A0 800B47A0 9BE30024 */  stb       r31, 0x24(r3)
/* 0B17A4 800B47A4 38600001 */  li        r3, 0x1
/* 0B17A8 800B47A8 4BFEB85D */  bl        __OSUnlockSramEx
/* 0B17AC 800B47AC 8001001C */  lwz       r0, 0x1c(r1)
/* 0B17B0 800B47B0 83E10014 */  lwz       r31, 0x14(r1)
/* 0B17B4 800B47B4 38210018 */  addi      r1, r1, 0x18
/* 0B17B8 800B47B8 7C0803A6 */  mtlr      r0
/* 0B17BC 800B47BC 4E800020 */  blr

# 0x800F3948 - 0x800F3990
.section .data, "wa"

.balign 8

glabel D_800F3948
	.long 0x00000000
	.long 0x00023A00
	.long 0x00062800
	.long 0x00030200
	.long 0x00031100
	.long 0x00052000
	.long 0x00052001
	.long 0x00052100
	.long 0x00052400
	.long 0x00052401
	.long 0x00052402
	.long 0x000B5A01
	.long 0x00056300
	.long 0x00020401
	.long 0x00020400
	.long 0x00040800
	.long 0x00100007
	.long 0x00000000
