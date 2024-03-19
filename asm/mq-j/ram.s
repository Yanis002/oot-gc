# ram.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x8006C614 - 0x8006CC1C

glabel ramEvent
/* 069614 8006C614 7C0802A6 */  mflr      r0
/* 069618 8006C618 2C040003 */  cmpwi     r4, 0x3
/* 06961C 8006C61C 90010004 */  stw       r0, 0x4(r1)
/* 069620 8006C620 9421FFE0 */  stwu      r1, -0x20(r1)
/* 069624 8006C624 93E1001C */  stw       r31, 0x1c(r1)
/* 069628 8006C628 3BE50000 */  addi      r31, r5, 0x0
/* 06962C 8006C62C 93C10018 */  stw       r30, 0x18(r1)
/* 069630 8006C630 3BC30000 */  addi      r30, r3, 0x0
/* 069634 8006C634 418201F0 */  beq       lbl_8006C824
/* 069638 8006C638 40800018 */  bge       lbl_8006C650
/* 06963C 8006C63C 2C040002 */  cmpwi     r4, 0x2
/* 069640 8006C640 4080001C */  bge       lbl_8006C65C
/* 069644 8006C644 2C040000 */  cmpwi     r4, 0x0
/* 069648 8006C648 408001DC */  bge       lbl_8006C824
/* 06964C 8006C64C 480001D0 */  b         lbl_8006C81C
lbl_8006C650:
/* 069650 8006C650 2C041002 */  cmpwi     r4, 0x1002
/* 069654 8006C654 4182001C */  beq       lbl_8006C670
/* 069658 8006C658 480001C4 */  b         lbl_8006C81C
lbl_8006C65C:
/* 06965C 8006C65C 38000000 */  li        r0, 0x0
/* 069660 8006C660 901E0008 */  stw       r0, 0x8(r30)
/* 069664 8006C664 901E0004 */  stw       r0, 0x4(r30)
/* 069668 8006C668 93FE0000 */  stw       r31, 0x0(r30)
/* 06966C 8006C66C 480001B8 */  b         lbl_8006C824
lbl_8006C670:
/* 069670 8006C670 801F0000 */  lwz       r0, 0x0(r31)
/* 069674 8006C674 5400063E */  clrlwi    r0, r0, 24
/* 069678 8006C678 2C000001 */  cmpwi     r0, 0x1
/* 06967C 8006C67C 418200A0 */  beq       lbl_8006C71C
/* 069680 8006C680 40800010 */  bge       lbl_8006C690
/* 069684 8006C684 2C000000 */  cmpwi     r0, 0x0
/* 069688 8006C688 40800014 */  bge       lbl_8006C69C
/* 06968C 8006C68C 48000198 */  b         lbl_8006C824
lbl_8006C690:
/* 069690 8006C690 2C000003 */  cmpwi     r0, 0x3
/* 069694 8006C694 40800190 */  bge       lbl_8006C824
/* 069698 8006C698 48000104 */  b         lbl_8006C79C
lbl_8006C69C:
/* 06969C 8006C69C 807E0000 */  lwz       r3, 0x0(r30)
/* 0696A0 8006C6A0 3CA08007 */  lis       r5, ramPut8@ha
/* 0696A4 8006C6A4 3CC08007 */  lis       r6, ramPut16@ha
/* 0696A8 8006C6A8 3CE08007 */  lis       r7, ramPut32@ha
/* 0696AC 8006C6AC 80630024 */  lwz       r3, 0x24(r3)
/* 0696B0 8006C6B0 3C808007 */  lis       r4, ramPut64@ha
/* 0696B4 8006C6B4 3904CA44 */  addi      r8, r4, ramPut64@l
/* 0696B8 8006C6B8 38A5CAC8 */  addi      r5, r5, ramPut8@l
/* 0696BC 8006C6BC 38C6CAA0 */  addi      r6, r6, ramPut16@l
/* 0696C0 8006C6C0 38E7CA78 */  addi      r7, r7, ramPut32@l
/* 0696C4 8006C6C4 389F0000 */  addi      r4, r31, 0x0
/* 0696C8 8006C6C8 4BFC821D */  bl        cpuSetDevicePut
/* 0696CC 8006C6CC 2C030000 */  cmpwi     r3, 0x0
/* 0696D0 8006C6D0 4082000C */  bne       lbl_8006C6DC
/* 0696D4 8006C6D4 38600000 */  li        r3, 0x0
/* 0696D8 8006C6D8 48000150 */  b         lbl_8006C828
lbl_8006C6DC:
/* 0696DC 8006C6DC 807E0000 */  lwz       r3, 0x0(r30)
/* 0696E0 8006C6E0 3CA08007 */  lis       r5, ramGet8@ha
/* 0696E4 8006C6E4 3CC08007 */  lis       r6, ramGet16@ha
/* 0696E8 8006C6E8 3CE08007 */  lis       r7, ramGet32@ha
/* 0696EC 8006C6EC 80630024 */  lwz       r3, 0x24(r3)
/* 0696F0 8006C6F0 3C808007 */  lis       r4, ramGet64@ha
/* 0696F4 8006C6F4 3904C968 */  addi      r8, r4, ramGet64@l
/* 0696F8 8006C6F8 38A5CA14 */  addi      r5, r5, ramGet8@l
/* 0696FC 8006C6FC 38C6C9E0 */  addi      r6, r6, ramGet16@l
/* 069700 8006C700 38E7C9AC */  addi      r7, r7, ramGet32@l
/* 069704 8006C704 389F0000 */  addi      r4, r31, 0x0
/* 069708 8006C708 4BFC81F5 */  bl        cpuSetDeviceGet
/* 06970C 8006C70C 2C030000 */  cmpwi     r3, 0x0
/* 069710 8006C710 40820114 */  bne       lbl_8006C824
/* 069714 8006C714 38600000 */  li        r3, 0x0
/* 069718 8006C718 48000110 */  b         lbl_8006C828
lbl_8006C71C:
/* 06971C 8006C71C 807E0000 */  lwz       r3, 0x0(r30)
/* 069720 8006C720 3CA08007 */  lis       r5, ramPutRI8@ha
/* 069724 8006C724 3CC08007 */  lis       r6, ramPutRI16@ha
/* 069728 8006C728 3CE08007 */  lis       r7, ramPutRI32@ha
/* 06972C 8006C72C 80630024 */  lwz       r3, 0x24(r3)
/* 069730 8006C730 3C808007 */  lis       r4, ramPutRI64@ha
/* 069734 8006C734 3904CB38 */  addi      r8, r4, ramPutRI64@l
/* 069738 8006C738 38A5CB7C */  addi      r5, r5, ramPutRI8@l
/* 06973C 8006C73C 38C6CB74 */  addi      r6, r6, ramPutRI16@l
/* 069740 8006C740 38E7CB40 */  addi      r7, r7, ramPutRI32@l
/* 069744 8006C744 389F0000 */  addi      r4, r31, 0x0
/* 069748 8006C748 4BFC819D */  bl        cpuSetDevicePut
/* 06974C 8006C74C 2C030000 */  cmpwi     r3, 0x0
/* 069750 8006C750 4082000C */  bne       lbl_8006C75C
/* 069754 8006C754 38600000 */  li        r3, 0x0
/* 069758 8006C758 480000D0 */  b         lbl_8006C828
lbl_8006C75C:
/* 06975C 8006C75C 807E0000 */  lwz       r3, 0x0(r30)
/* 069760 8006C760 3CA08007 */  lis       r5, ramGetRI8@ha
/* 069764 8006C764 3CC08007 */  lis       r6, ramGetRI16@ha
/* 069768 8006C768 3CE08007 */  lis       r7, ramGetRI32@ha
/* 06976C 8006C76C 80630024 */  lwz       r3, 0x24(r3)
/* 069770 8006C770 3C808007 */  lis       r4, ramGetRI64@ha
/* 069774 8006C774 3904CAEC */  addi      r8, r4, ramGetRI64@l
/* 069778 8006C778 38A5CB30 */  addi      r5, r5, ramGetRI8@l
/* 06977C 8006C77C 38C6CB28 */  addi      r6, r6, ramGetRI16@l
/* 069780 8006C780 38E7CAF4 */  addi      r7, r7, ramGetRI32@l
/* 069784 8006C784 389F0000 */  addi      r4, r31, 0x0
/* 069788 8006C788 4BFC8175 */  bl        cpuSetDeviceGet
/* 06978C 8006C78C 2C030000 */  cmpwi     r3, 0x0
/* 069790 8006C790 40820094 */  bne       lbl_8006C824
/* 069794 8006C794 38600000 */  li        r3, 0x0
/* 069798 8006C798 48000090 */  b         lbl_8006C828
lbl_8006C79C:
/* 06979C 8006C79C 807E0000 */  lwz       r3, 0x0(r30)
/* 0697A0 8006C7A0 3CA08007 */  lis       r5, ramPutControl8@ha
/* 0697A4 8006C7A4 3CC08007 */  lis       r6, ramPutControl16@ha
/* 0697A8 8006C7A8 3CE08007 */  lis       r7, ramPutControl32@ha
/* 0697AC 8006C7AC 80630024 */  lwz       r3, 0x24(r3)
/* 0697B0 8006C7B0 3C808007 */  lis       r4, ramPutControl64@ha
/* 0697B4 8006C7B4 3904CBD0 */  addi      r8, r4, ramPutControl64@l
/* 0697B8 8006C7B8 38A5CC14 */  addi      r5, r5, ramPutControl8@l
/* 0697BC 8006C7BC 38C6CC0C */  addi      r6, r6, ramPutControl16@l
/* 0697C0 8006C7C0 38E7CBD8 */  addi      r7, r7, ramPutControl32@l
/* 0697C4 8006C7C4 389F0000 */  addi      r4, r31, 0x0
/* 0697C8 8006C7C8 4BFC811D */  bl        cpuSetDevicePut
/* 0697CC 8006C7CC 2C030000 */  cmpwi     r3, 0x0
/* 0697D0 8006C7D0 4082000C */  bne       lbl_8006C7DC
/* 0697D4 8006C7D4 38600000 */  li        r3, 0x0
/* 0697D8 8006C7D8 48000050 */  b         lbl_8006C828
lbl_8006C7DC:
/* 0697DC 8006C7DC 807E0000 */  lwz       r3, 0x0(r30)
/* 0697E0 8006C7E0 3CA08007 */  lis       r5, ramGetControl8@ha
/* 0697E4 8006C7E4 3CC08007 */  lis       r6, ramGetControl16@ha
/* 0697E8 8006C7E8 3CE08007 */  lis       r7, ramGetControl32@ha
/* 0697EC 8006C7EC 80630024 */  lwz       r3, 0x24(r3)
/* 0697F0 8006C7F0 3C808007 */  lis       r4, ramGetControl64@ha
/* 0697F4 8006C7F4 3904CB84 */  addi      r8, r4, ramGetControl64@l
/* 0697F8 8006C7F8 38A5CBC8 */  addi      r5, r5, ramGetControl8@l
/* 0697FC 8006C7FC 38C6CBC0 */  addi      r6, r6, ramGetControl16@l
/* 069800 8006C800 38E7CB8C */  addi      r7, r7, ramGetControl32@l
/* 069804 8006C804 389F0000 */  addi      r4, r31, 0x0
/* 069808 8006C808 4BFC80F5 */  bl        cpuSetDeviceGet
/* 06980C 8006C80C 2C030000 */  cmpwi     r3, 0x0
/* 069810 8006C810 40820014 */  bne       lbl_8006C824
/* 069814 8006C814 38600000 */  li        r3, 0x0
/* 069818 8006C818 48000010 */  b         lbl_8006C828
lbl_8006C81C:
/* 06981C 8006C81C 38600000 */  li        r3, 0x0
/* 069820 8006C820 48000008 */  b         lbl_8006C828
lbl_8006C824:
/* 069824 8006C824 38600001 */  li        r3, 0x1
lbl_8006C828:
/* 069828 8006C828 80010024 */  lwz       r0, 0x24(r1)
/* 06982C 8006C82C 83E1001C */  lwz       r31, 0x1c(r1)
/* 069830 8006C830 83C10018 */  lwz       r30, 0x18(r1)
/* 069834 8006C834 7C0803A6 */  mtlr      r0
/* 069838 8006C838 38210020 */  addi      r1, r1, 0x20
/* 06983C 8006C83C 4E800020 */  blr

glabel ramGetSize
/* 069840 8006C840 28040000 */  cmplwi    r4, 0x0
/* 069844 8006C844 4182000C */  beq       lbl_8006C850
/* 069848 8006C848 80030008 */  lwz       r0, 0x8(r3)
/* 06984C 8006C84C 90040000 */  stw       r0, 0x0(r4)
lbl_8006C850:
/* 069850 8006C850 38600001 */  li        r3, 0x1
/* 069854 8006C854 4E800020 */  blr

glabel ramSetSize
/* 069858 8006C858 7C0802A6 */  mflr      r0
/* 06985C 8006C85C 90010004 */  stw       r0, 0x4(r1)
/* 069860 8006C860 9421FFE8 */  stwu      r1, -0x18(r1)
/* 069864 8006C864 93E10014 */  stw       r31, 0x14(r1)
/* 069868 8006C868 93C10010 */  stw       r30, 0x10(r1)
/* 06986C 8006C86C 7C7E1B78 */  mr        r30, r3
/* 069870 8006C870 80030004 */  lwz       r0, 0x4(r3)
/* 069874 8006C874 28000000 */  cmplwi    r0, 0x0
/* 069878 8006C878 4182000C */  beq       lbl_8006C884
/* 06987C 8006C87C 38600000 */  li        r3, 0x0
/* 069880 8006C880 48000030 */  b         lbl_8006C8B0
lbl_8006C884:
/* 069884 8006C884 380403FF */  addi      r0, r4, 0x3ff
/* 069888 8006C888 541F002A */  clrrwi    r31, r0, 10
/* 06988C 8006C88C 387E0004 */  addi      r3, r30, 0x4
/* 069890 8006C890 67E43000 */  oris      r4, r31, 0x3000
/* 069894 8006C894 4BF9A881 */  bl        xlHeapTake
/* 069898 8006C898 2C030000 */  cmpwi     r3, 0x0
/* 06989C 8006C89C 4082000C */  bne       lbl_8006C8A8
/* 0698A0 8006C8A0 38600000 */  li        r3, 0x0
/* 0698A4 8006C8A4 4800000C */  b         lbl_8006C8B0
lbl_8006C8A8:
/* 0698A8 8006C8A8 93FE0008 */  stw       r31, 0x8(r30)
/* 0698AC 8006C8AC 38600001 */  li        r3, 0x1
lbl_8006C8B0:
/* 0698B0 8006C8B0 8001001C */  lwz       r0, 0x1c(r1)
/* 0698B4 8006C8B4 83E10014 */  lwz       r31, 0x14(r1)
/* 0698B8 8006C8B8 83C10010 */  lwz       r30, 0x10(r1)
/* 0698BC 8006C8BC 7C0803A6 */  mtlr      r0
/* 0698C0 8006C8C0 38210018 */  addi      r1, r1, 0x18
/* 0698C4 8006C8C4 4E800020 */  blr

glabel ramWipe
/* 0698C8 8006C8C8 7C0802A6 */  mflr      r0
/* 0698CC 8006C8CC 90010004 */  stw       r0, 0x4(r1)
/* 0698D0 8006C8D0 9421FFF8 */  stwu      r1, -0x8(r1)
/* 0698D4 8006C8D4 80830008 */  lwz       r4, 0x8(r3)
/* 0698D8 8006C8D8 28040000 */  cmplwi    r4, 0x0
/* 0698DC 8006C8DC 41820020 */  beq       lbl_8006C8FC
/* 0698E0 8006C8E0 80630004 */  lwz       r3, 0x4(r3)
/* 0698E4 8006C8E4 38A00000 */  li        r5, 0x0
/* 0698E8 8006C8E8 4BF99F81 */  bl        xlHeapFill32
/* 0698EC 8006C8EC 2C030000 */  cmpwi     r3, 0x0
/* 0698F0 8006C8F0 4082000C */  bne       lbl_8006C8FC
/* 0698F4 8006C8F4 38600000 */  li        r3, 0x0
/* 0698F8 8006C8F8 48000008 */  b         lbl_8006C900
lbl_8006C8FC:
/* 0698FC 8006C8FC 38600001 */  li        r3, 0x1
lbl_8006C900:
/* 069900 8006C900 8001000C */  lwz       r0, 0xc(r1)
/* 069904 8006C904 38210008 */  addi      r1, r1, 0x8
/* 069908 8006C908 7C0803A6 */  mtlr      r0
/* 06990C 8006C90C 4E800020 */  blr

glabel ramGetBuffer
/* 069910 8006C910 80E30008 */  lwz       r7, 0x8(r3)
/* 069914 8006C914 54A501BE */  clrlwi    r5, r5, 6
/* 069918 8006C918 28070000 */  cmplwi    r7, 0x0
/* 06991C 8006C91C 4082000C */  bne       lbl_8006C928
/* 069920 8006C920 38600000 */  li        r3, 0x0
/* 069924 8006C924 4E800020 */  blr
lbl_8006C928:
/* 069928 8006C928 28060000 */  cmplwi    r6, 0x0
/* 06992C 8006C92C 41820028 */  beq       lbl_8006C954
/* 069930 8006C930 80060000 */  lwz       r0, 0x0(r6)
/* 069934 8006C934 7C050214 */  add       r0, r5, r0
/* 069938 8006C938 7C003840 */  cmplw     r0, r7
/* 06993C 8006C93C 41800018 */  blt       lbl_8006C954
/* 069940 8006C940 7C053851 */  subf.     r0, r5, r7
/* 069944 8006C944 90060000 */  stw       r0, 0x0(r6)
/* 069948 8006C948 4080000C */  bge       lbl_8006C954
/* 06994C 8006C94C 38000000 */  li        r0, 0x0
/* 069950 8006C950 90060000 */  stw       r0, 0x0(r6)
lbl_8006C954:
/* 069954 8006C954 80030004 */  lwz       r0, 0x4(r3)
/* 069958 8006C958 38600001 */  li        r3, 0x1
/* 06995C 8006C95C 7C002A14 */  add       r0, r0, r5
/* 069960 8006C960 90040000 */  stw       r0, 0x0(r4)
/* 069964 8006C964 4E800020 */  blr

glabel ramGet64
/* 069968 8006C968 80030008 */  lwz       r0, 0x8(r3)
/* 06996C 8006C96C 548401BE */  clrlwi    r4, r4, 6
/* 069970 8006C970 7C040040 */  cmplw     r4, r0
/* 069974 8006C974 40800024 */  bge       lbl_8006C998
/* 069978 8006C978 80630004 */  lwz       r3, 0x4(r3)
/* 06997C 8006C97C 54800038 */  clrrwi    r0, r4, 3
/* 069980 8006C980 7C630214 */  add       r3, r3, r0
/* 069984 8006C984 80030000 */  lwz       r0, 0x0(r3)
/* 069988 8006C988 80630004 */  lwz       r3, 0x4(r3)
/* 06998C 8006C98C 90650004 */  stw       r3, 0x4(r5)
/* 069990 8006C990 90050000 */  stw       r0, 0x0(r5)
/* 069994 8006C994 48000010 */  b         lbl_8006C9A4
lbl_8006C998:
/* 069998 8006C998 38000000 */  li        r0, 0x0
/* 06999C 8006C99C 90050004 */  stw       r0, 0x4(r5)
/* 0699A0 8006C9A0 90050000 */  stw       r0, 0x0(r5)
lbl_8006C9A4:
/* 0699A4 8006C9A4 38600001 */  li        r3, 0x1
/* 0699A8 8006C9A8 4E800020 */  blr

glabel ramGet32
/* 0699AC 8006C9AC 80030008 */  lwz       r0, 0x8(r3)
/* 0699B0 8006C9B0 548401BE */  clrlwi    r4, r4, 6
/* 0699B4 8006C9B4 7C040040 */  cmplw     r4, r0
/* 0699B8 8006C9B8 40800018 */  bge       lbl_8006C9D0
/* 0699BC 8006C9BC 80630004 */  lwz       r3, 0x4(r3)
/* 0699C0 8006C9C0 5480003A */  clrrwi    r0, r4, 2
/* 0699C4 8006C9C4 7C03002E */  lwzx      r0, r3, r0
/* 0699C8 8006C9C8 90050000 */  stw       r0, 0x0(r5)
/* 0699CC 8006C9CC 4800000C */  b         lbl_8006C9D8
lbl_8006C9D0:
/* 0699D0 8006C9D0 38000000 */  li        r0, 0x0
/* 0699D4 8006C9D4 90050000 */  stw       r0, 0x0(r5)
lbl_8006C9D8:
/* 0699D8 8006C9D8 38600001 */  li        r3, 0x1
/* 0699DC 8006C9DC 4E800020 */  blr

glabel ramGet16
/* 0699E0 8006C9E0 80030008 */  lwz       r0, 0x8(r3)
/* 0699E4 8006C9E4 548401BE */  clrlwi    r4, r4, 6
/* 0699E8 8006C9E8 7C040040 */  cmplw     r4, r0
/* 0699EC 8006C9EC 40800018 */  bge       lbl_8006CA04
/* 0699F0 8006C9F0 80630004 */  lwz       r3, 0x4(r3)
/* 0699F4 8006C9F4 5480003C */  clrrwi    r0, r4, 1
/* 0699F8 8006C9F8 7C0302AE */  lhax      r0, r3, r0
/* 0699FC 8006C9FC B0050000 */  sth       r0, 0x0(r5)
/* 069A00 8006CA00 4800000C */  b         lbl_8006CA0C
lbl_8006CA04:
/* 069A04 8006CA04 38000000 */  li        r0, 0x0
/* 069A08 8006CA08 B0050000 */  sth       r0, 0x0(r5)
lbl_8006CA0C:
/* 069A0C 8006CA0C 38600001 */  li        r3, 0x1
/* 069A10 8006CA10 4E800020 */  blr

glabel ramGet8
/* 069A14 8006CA14 80030008 */  lwz       r0, 0x8(r3)
/* 069A18 8006CA18 548401BE */  clrlwi    r4, r4, 6
/* 069A1C 8006CA1C 7C040040 */  cmplw     r4, r0
/* 069A20 8006CA20 40800014 */  bge       lbl_8006CA34
/* 069A24 8006CA24 80030004 */  lwz       r0, 0x4(r3)
/* 069A28 8006CA28 7C0400AE */  lbzx      r0, r4, r0
/* 069A2C 8006CA2C 98050000 */  stb       r0, 0x0(r5)
/* 069A30 8006CA30 4800000C */  b         lbl_8006CA3C
lbl_8006CA34:
/* 069A34 8006CA34 38000000 */  li        r0, 0x0
/* 069A38 8006CA38 98050000 */  stb       r0, 0x0(r5)
lbl_8006CA3C:
/* 069A3C 8006CA3C 38600001 */  li        r3, 0x1
/* 069A40 8006CA40 4E800020 */  blr

glabel ramPut64
/* 069A44 8006CA44 80030008 */  lwz       r0, 0x8(r3)
/* 069A48 8006CA48 548401BE */  clrlwi    r4, r4, 6
/* 069A4C 8006CA4C 7C040040 */  cmplw     r4, r0
/* 069A50 8006CA50 40800020 */  bge       lbl_8006CA70
/* 069A54 8006CA54 80630004 */  lwz       r3, 0x4(r3)
/* 069A58 8006CA58 54800038 */  clrrwi    r0, r4, 3
/* 069A5C 8006CA5C 80850000 */  lwz       r4, 0x0(r5)
/* 069A60 8006CA60 80A50004 */  lwz       r5, 0x4(r5)
/* 069A64 8006CA64 7C630214 */  add       r3, r3, r0
/* 069A68 8006CA68 90A30004 */  stw       r5, 0x4(r3)
/* 069A6C 8006CA6C 90830000 */  stw       r4, 0x0(r3)
lbl_8006CA70:
/* 069A70 8006CA70 38600001 */  li        r3, 0x1
/* 069A74 8006CA74 4E800020 */  blr

glabel ramPut32
/* 069A78 8006CA78 80030008 */  lwz       r0, 0x8(r3)
/* 069A7C 8006CA7C 548601BE */  clrlwi    r6, r4, 6
/* 069A80 8006CA80 7C060040 */  cmplw     r6, r0
/* 069A84 8006CA84 40800014 */  bge       lbl_8006CA98
/* 069A88 8006CA88 80850000 */  lwz       r4, 0x0(r5)
/* 069A8C 8006CA8C 54C0003A */  clrrwi    r0, r6, 2
/* 069A90 8006CA90 80630004 */  lwz       r3, 0x4(r3)
/* 069A94 8006CA94 7C83012E */  stwx      r4, r3, r0
lbl_8006CA98:
/* 069A98 8006CA98 38600001 */  li        r3, 0x1
/* 069A9C 8006CA9C 4E800020 */  blr

glabel ramPut16
/* 069AA0 8006CAA0 80030008 */  lwz       r0, 0x8(r3)
/* 069AA4 8006CAA4 548601BE */  clrlwi    r6, r4, 6
/* 069AA8 8006CAA8 7C060040 */  cmplw     r6, r0
/* 069AAC 8006CAAC 40800014 */  bge       lbl_8006CAC0
/* 069AB0 8006CAB0 A0850000 */  lhz       r4, 0x0(r5)
/* 069AB4 8006CAB4 54C0003C */  clrrwi    r0, r6, 1
/* 069AB8 8006CAB8 80630004 */  lwz       r3, 0x4(r3)
/* 069ABC 8006CABC 7C83032E */  sthx      r4, r3, r0
lbl_8006CAC0:
/* 069AC0 8006CAC0 38600001 */  li        r3, 0x1
/* 069AC4 8006CAC4 4E800020 */  blr

glabel ramPut8
/* 069AC8 8006CAC8 80030008 */  lwz       r0, 0x8(r3)
/* 069ACC 8006CACC 548601BE */  clrlwi    r6, r4, 6
/* 069AD0 8006CAD0 7C060040 */  cmplw     r6, r0
/* 069AD4 8006CAD4 40800010 */  bge       lbl_8006CAE4
/* 069AD8 8006CAD8 88850000 */  lbz       r4, 0x0(r5)
/* 069ADC 8006CADC 80030004 */  lwz       r0, 0x4(r3)
/* 069AE0 8006CAE0 7C8601AE */  stbx      r4, r6, r0
lbl_8006CAE4:
/* 069AE4 8006CAE4 38600001 */  li        r3, 0x1
/* 069AE8 8006CAE8 4E800020 */  blr

glabel ramGetRI64
/* 069AEC 8006CAEC 38600000 */  li        r3, 0x0
/* 069AF0 8006CAF0 4E800020 */  blr

glabel ramGetRI32
/* 069AF4 8006CAF4 548006FE */  clrlwi    r0, r4, 27
/* 069AF8 8006CAF8 2800001C */  cmplwi    r0, 0x1c
/* 069AFC 8006CAFC 4181001C */  bgt       lbl_8006CB18
/* 069B00 8006CB00 3C60800F */  lis       r3, jtbl_800EEBA0@ha
/* 069B04 8006CB04 3863EBA0 */  addi      r3, r3, jtbl_800EEBA0@l
/* 069B08 8006CB08 5400103A */  slwi      r0, r0, 2
/* 069B0C 8006CB0C 7C03002E */  lwzx      r0, r3, r0
/* 069B10 8006CB10 7C0903A6 */  mtctr     r0
/* 069B14 8006CB14 4E800420 */  bctr
lbl_8006CB18:
/* 069B18 8006CB18 38600000 */  li        r3, 0x0
/* 069B1C 8006CB1C 4E800020 */  blr
lbl_8006CB20:
/* 069B20 8006CB20 38600001 */  li        r3, 0x1
/* 069B24 8006CB24 4E800020 */  blr

glabel ramGetRI16
/* 069B28 8006CB28 38600000 */  li        r3, 0x0
/* 069B2C 8006CB2C 4E800020 */  blr

glabel ramGetRI8
/* 069B30 8006CB30 38600000 */  li        r3, 0x0
/* 069B34 8006CB34 4E800020 */  blr

glabel ramPutRI64
/* 069B38 8006CB38 38600000 */  li        r3, 0x0
/* 069B3C 8006CB3C 4E800020 */  blr

glabel ramPutRI32
/* 069B40 8006CB40 548006FE */  clrlwi    r0, r4, 27
/* 069B44 8006CB44 2800001C */  cmplwi    r0, 0x1c
/* 069B48 8006CB48 4181001C */  bgt       lbl_8006CB64
/* 069B4C 8006CB4C 3C60800F */  lis       r3, jtbl_800EEC14@ha
/* 069B50 8006CB50 3863EC14 */  addi      r3, r3, jtbl_800EEC14@l
/* 069B54 8006CB54 5400103A */  slwi      r0, r0, 2
/* 069B58 8006CB58 7C03002E */  lwzx      r0, r3, r0
/* 069B5C 8006CB5C 7C0903A6 */  mtctr     r0
/* 069B60 8006CB60 4E800420 */  bctr
lbl_8006CB64:
/* 069B64 8006CB64 38600000 */  li        r3, 0x0
/* 069B68 8006CB68 4E800020 */  blr
lbl_8006CB6C:
/* 069B6C 8006CB6C 38600001 */  li        r3, 0x1
/* 069B70 8006CB70 4E800020 */  blr

glabel ramPutRI16
/* 069B74 8006CB74 38600000 */  li        r3, 0x0
/* 069B78 8006CB78 4E800020 */  blr

glabel ramPutRI8
/* 069B7C 8006CB7C 38600000 */  li        r3, 0x0
/* 069B80 8006CB80 4E800020 */  blr

glabel ramGetControl64
/* 069B84 8006CB84 38600000 */  li        r3, 0x0
/* 069B88 8006CB88 4E800020 */  blr

glabel ramGetControl32
/* 069B8C 8006CB8C 548006BE */  clrlwi    r0, r4, 26
/* 069B90 8006CB90 28000024 */  cmplwi    r0, 0x24
/* 069B94 8006CB94 4181001C */  bgt       lbl_8006CBB0
/* 069B98 8006CB98 3C60800F */  lis       r3, jtbl_800EEC88@ha
/* 069B9C 8006CB9C 3863EC88 */  addi      r3, r3, jtbl_800EEC88@l
/* 069BA0 8006CBA0 5400103A */  slwi      r0, r0, 2
/* 069BA4 8006CBA4 7C03002E */  lwzx      r0, r3, r0
/* 069BA8 8006CBA8 7C0903A6 */  mtctr     r0
/* 069BAC 8006CBAC 4E800420 */  bctr
lbl_8006CBB0:
/* 069BB0 8006CBB0 38600000 */  li        r3, 0x0
/* 069BB4 8006CBB4 4E800020 */  blr
lbl_8006CBB8:
/* 069BB8 8006CBB8 38600001 */  li        r3, 0x1
/* 069BBC 8006CBBC 4E800020 */  blr

glabel ramGetControl16
/* 069BC0 8006CBC0 38600000 */  li        r3, 0x0
/* 069BC4 8006CBC4 4E800020 */  blr

glabel ramGetControl8
/* 069BC8 8006CBC8 38600000 */  li        r3, 0x0
/* 069BCC 8006CBCC 4E800020 */  blr

glabel ramPutControl64
/* 069BD0 8006CBD0 38600000 */  li        r3, 0x0
/* 069BD4 8006CBD4 4E800020 */  blr

glabel ramPutControl32
/* 069BD8 8006CBD8 548006BE */  clrlwi    r0, r4, 26
/* 069BDC 8006CBDC 28000024 */  cmplwi    r0, 0x24
/* 069BE0 8006CBE0 4181001C */  bgt       lbl_8006CBFC
/* 069BE4 8006CBE4 3C60800F */  lis       r3, jtbl_800EED1C@ha
/* 069BE8 8006CBE8 3863ED1C */  addi      r3, r3, jtbl_800EED1C@l
/* 069BEC 8006CBEC 5400103A */  slwi      r0, r0, 2
/* 069BF0 8006CBF0 7C03002E */  lwzx      r0, r3, r0
/* 069BF4 8006CBF4 7C0903A6 */  mtctr     r0
/* 069BF8 8006CBF8 4E800420 */  bctr
lbl_8006CBFC:
/* 069BFC 8006CBFC 38600000 */  li        r3, 0x0
/* 069C00 8006CC00 4E800020 */  blr
lbl_8006CC04:
/* 069C04 8006CC04 38600001 */  li        r3, 0x1
/* 069C08 8006CC08 4E800020 */  blr

glabel ramPutControl16
/* 069C0C 8006CC0C 38600000 */  li        r3, 0x0
/* 069C10 8006CC10 4E800020 */  blr

glabel ramPutControl8
/* 069C14 8006CC14 38600000 */  li        r3, 0x0
/* 069C18 8006CC18 4E800020 */  blr

# 0x800EEB90 - 0x800EEDB0
.section .data, "wa"

.balign 8

glabel gClassRAM
	.long D_8018B508
	.long 0x0000000C
	.long 0x00000000
	.long ramEvent

jtbl_800EEBA0:
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB18
	.long ramGetRI32, lbl_8006CB20

jtbl_800EEC14:
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB64
	.long ramPutRI32, lbl_8006CB6C

jtbl_800EEC88:
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB0
	.long ramGetControl32, lbl_8006CBB8

jtbl_800EED1C:
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CBFC
	.long ramPutControl32, lbl_8006CC04

# 0x8018B508 - 0x8018B510
.section .sdata, "wa"

glabel D_8018B508
	.string "RAM"

glabel gap_07_8018B50C_sdata
.hidden gap_07_8018B50C_sdata
	.long 0x00000000
