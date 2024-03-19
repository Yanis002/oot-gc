# xlObject.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x80007B20 - 0x80007EE0

glabel xlObjectReset
/* 004B20 80007B20 7C0802A6 */  mflr      r0
/* 004B24 80007B24 90010004 */  stw       r0, 0x4(r1)
/* 004B28 80007B28 9421FFF0 */  stwu      r1, -0x10(r1)
/* 004B2C 80007B2C 93E1000C */  stw       r31, 0xc(r1)
/* 004B30 80007B30 806D88E8 */  lwz       r3, gpListData@sda21(r0)
/* 004B34 80007B34 83E30008 */  lwz       r31, 0x8(r3)
/* 004B38 80007B38 48000020 */  b         lbl_80007B58
lbl_80007B3C:
/* 004B3C 80007B3C 387F0004 */  addi      r3, r31, 0x4
/* 004B40 80007B40 4BFFE8B5 */  bl        xlListFree
/* 004B44 80007B44 2C030000 */  cmpwi     r3, 0x0
/* 004B48 80007B48 4082000C */  bne       lbl_80007B54
/* 004B4C 80007B4C 38600000 */  li        r3, 0x0
/* 004B50 80007B50 4800002C */  b         lbl_80007B7C
lbl_80007B54:
/* 004B54 80007B54 83FF0000 */  lwz       r31, 0x0(r31)
lbl_80007B58:
/* 004B58 80007B58 281F0000 */  cmplwi    r31, 0x0
/* 004B5C 80007B5C 4082FFE0 */  bne       lbl_80007B3C
/* 004B60 80007B60 386D88E8 */  li        r3, gpListData@sda21
/* 004B64 80007B64 4BFFE891 */  bl        xlListFree
/* 004B68 80007B68 2C030000 */  cmpwi     r3, 0x0
/* 004B6C 80007B6C 4082000C */  bne       lbl_80007B78
/* 004B70 80007B70 38600000 */  li        r3, 0x0
/* 004B74 80007B74 48000008 */  b         lbl_80007B7C
lbl_80007B78:
/* 004B78 80007B78 38600001 */  li        r3, 0x1
lbl_80007B7C:
/* 004B7C 80007B7C 80010014 */  lwz       r0, 0x14(r1)
/* 004B80 80007B80 83E1000C */  lwz       r31, 0xc(r1)
/* 004B84 80007B84 38210010 */  addi      r1, r1, 0x10
/* 004B88 80007B88 7C0803A6 */  mtlr      r0
/* 004B8C 80007B8C 4E800020 */  blr

glabel xlObjectSetup
/* 004B90 80007B90 7C0802A6 */  mflr      r0
/* 004B94 80007B94 386D88E8 */  li        r3, gpListData@sda21
/* 004B98 80007B98 90010004 */  stw       r0, 0x4(r1)
/* 004B9C 80007B9C 38800008 */  li        r4, 0x8
/* 004BA0 80007BA0 9421FFF8 */  stwu      r1, -0x8(r1)
/* 004BA4 80007BA4 4BFFE90D */  bl        xlListMake
/* 004BA8 80007BA8 2C030000 */  cmpwi     r3, 0x0
/* 004BAC 80007BAC 4082000C */  bne       lbl_80007BB8
/* 004BB0 80007BB0 38600000 */  li        r3, 0x0
/* 004BB4 80007BB4 48000008 */  b         lbl_80007BBC
lbl_80007BB8:
/* 004BB8 80007BB8 38600001 */  li        r3, 0x1
lbl_80007BBC:
/* 004BBC 80007BBC 8001000C */  lwz       r0, 0xc(r1)
/* 004BC0 80007BC0 38210008 */  addi      r1, r1, 0x8
/* 004BC4 80007BC4 7C0803A6 */  mtlr      r0
/* 004BC8 80007BC8 4E800020 */  blr

glabel xlObjectEvent
/* 004BCC 80007BCC 7C0802A6 */  mflr      r0
/* 004BD0 80007BD0 90010004 */  stw       r0, 0x4(r1)
/* 004BD4 80007BD4 9421FFD0 */  stwu      r1, -0x30(r1)
/* 004BD8 80007BD8 BF410018 */  stmw      r26, 0x18(r1)
/* 004BDC 80007BDC 7C7A1B79 */  mr.       r26, r3
/* 004BE0 80007BE0 3B640000 */  addi      r27, r4, 0x0
/* 004BE4 80007BE4 3B850000 */  addi      r28, r5, 0x0
/* 004BE8 80007BE8 41820084 */  beq       lbl_80007C6C
/* 004BEC 80007BEC 3BFAFFFC */  subi      r31, r26, 0x4
/* 004BF0 80007BF0 806D88E8 */  lwz       r3, gpListData@sda21(r0)
/* 004BF4 80007BF4 83BAFFFC */  lwz       r29, -0x4(r26)
/* 004BF8 80007BF8 7FA4EB78 */  mr        r4, r29
/* 004BFC 80007BFC 4BFFE615 */  bl        xlListTestItem
/* 004C00 80007C00 2C030000 */  cmpwi     r3, 0x0
/* 004C04 80007C04 41820068 */  beq       lbl_80007C6C
/* 004C08 80007C08 281A0000 */  cmplwi    r26, 0x0
/* 004C0C 80007C0C 83DD0004 */  lwz       r30, 0x4(r29)
/* 004C10 80007C10 41820030 */  beq       lbl_80007C40
/* 004C14 80007C14 83FF0000 */  lwz       r31, 0x0(r31)
/* 004C18 80007C18 806D88E8 */  lwz       r3, gpListData@sda21(r0)
/* 004C1C 80007C1C 7FE4FB78 */  mr        r4, r31
/* 004C20 80007C20 4BFFE5F1 */  bl        xlListTestItem
/* 004C24 80007C24 2C030000 */  cmpwi     r3, 0x0
/* 004C28 80007C28 41820018 */  beq       lbl_80007C40
/* 004C2C 80007C2C 801F0004 */  lwz       r0, 0x4(r31)
/* 004C30 80007C30 7C00F040 */  cmplw     r0, r30
/* 004C34 80007C34 4082000C */  bne       lbl_80007C40
/* 004C38 80007C38 38000001 */  li        r0, 0x1
/* 004C3C 80007C3C 48000008 */  b         lbl_80007C44
lbl_80007C40:
/* 004C40 80007C40 38000000 */  li        r0, 0x0
lbl_80007C44:
/* 004C44 80007C44 2C000000 */  cmpwi     r0, 0x0
/* 004C48 80007C48 41820024 */  beq       lbl_80007C6C
/* 004C4C 80007C4C 80BD0004 */  lwz       r5, 0x4(r29)
/* 004C50 80007C50 387A0000 */  addi      r3, r26, 0x0
/* 004C54 80007C54 389B0000 */  addi      r4, r27, 0x0
/* 004C58 80007C58 8185000C */  lwz       r12, 0xc(r5)
/* 004C5C 80007C5C 38BC0000 */  addi      r5, r28, 0x0
/* 004C60 80007C60 7D8803A6 */  mtlr      r12
/* 004C64 80007C64 4E800021 */  blrl
/* 004C68 80007C68 48000008 */  b         lbl_80007C70
lbl_80007C6C:
/* 004C6C 80007C6C 38600000 */  li        r3, 0x0
lbl_80007C70:
/* 004C70 80007C70 BB410018 */  lmw       r26, 0x18(r1)
/* 004C74 80007C74 80010034 */  lwz       r0, 0x34(r1)
/* 004C78 80007C78 38210030 */  addi      r1, r1, 0x30
/* 004C7C 80007C7C 7C0803A6 */  mtlr      r0
/* 004C80 80007C80 4E800020 */  blr

glabel xlObjectTest
/* 004C84 80007C84 7C0802A6 */  mflr      r0
/* 004C88 80007C88 28030000 */  cmplwi    r3, 0x0
/* 004C8C 80007C8C 90010004 */  stw       r0, 0x4(r1)
/* 004C90 80007C90 9421FFE8 */  stwu      r1, -0x18(r1)
/* 004C94 80007C94 93E10014 */  stw       r31, 0x14(r1)
/* 004C98 80007C98 93C10010 */  stw       r30, 0x10(r1)
/* 004C9C 80007C9C 3BC40000 */  addi      r30, r4, 0x0
/* 004CA0 80007CA0 41820030 */  beq       lbl_80007CD0
/* 004CA4 80007CA4 83E3FFFC */  lwz       r31, -0x4(r3)
/* 004CA8 80007CA8 806D88E8 */  lwz       r3, gpListData@sda21(r0)
/* 004CAC 80007CAC 7FE4FB78 */  mr        r4, r31
/* 004CB0 80007CB0 4BFFE561 */  bl        xlListTestItem
/* 004CB4 80007CB4 2C030000 */  cmpwi     r3, 0x0
/* 004CB8 80007CB8 41820018 */  beq       lbl_80007CD0
/* 004CBC 80007CBC 801F0004 */  lwz       r0, 0x4(r31)
/* 004CC0 80007CC0 7C00F040 */  cmplw     r0, r30
/* 004CC4 80007CC4 4082000C */  bne       lbl_80007CD0
/* 004CC8 80007CC8 38600001 */  li        r3, 0x1
/* 004CCC 80007CCC 48000008 */  b         lbl_80007CD4
lbl_80007CD0:
/* 004CD0 80007CD0 38600000 */  li        r3, 0x0
lbl_80007CD4:
/* 004CD4 80007CD4 8001001C */  lwz       r0, 0x1c(r1)
/* 004CD8 80007CD8 83E10014 */  lwz       r31, 0x14(r1)
/* 004CDC 80007CDC 83C10010 */  lwz       r30, 0x10(r1)
/* 004CE0 80007CE0 7C0803A6 */  mtlr      r0
/* 004CE4 80007CE4 38210018 */  addi      r1, r1, 0x18
/* 004CE8 80007CE8 4E800020 */  blr

glabel xlObjectFree
/* 004CEC 80007CEC 7C0802A6 */  mflr      r0
/* 004CF0 80007CF0 90010004 */  stw       r0, 0x4(r1)
/* 004CF4 80007CF4 9421FFE8 */  stwu      r1, -0x18(r1)
/* 004CF8 80007CF8 93E10014 */  stw       r31, 0x14(r1)
/* 004CFC 80007CFC 93C10010 */  stw       r30, 0x10(r1)
/* 004D00 80007D00 7C7E1B79 */  mr.       r30, r3
/* 004D04 80007D04 41820064 */  beq       lbl_80007D68
/* 004D08 80007D08 807E0000 */  lwz       r3, 0x0(r30)
/* 004D0C 80007D0C 28030000 */  cmplwi    r3, 0x0
/* 004D10 80007D10 41820058 */  beq       lbl_80007D68
/* 004D14 80007D14 83E3FFFC */  lwz       r31, -0x4(r3)
/* 004D18 80007D18 38800003 */  li        r4, 0x3
/* 004D1C 80007D1C 38A00000 */  li        r5, 0x0
/* 004D20 80007D20 80DF0004 */  lwz       r6, 0x4(r31)
/* 004D24 80007D24 8186000C */  lwz       r12, 0xc(r6)
/* 004D28 80007D28 7D8803A6 */  mtlr      r12
/* 004D2C 80007D2C 4E800021 */  blrl
/* 004D30 80007D30 807E0000 */  lwz       r3, 0x0(r30)
/* 004D34 80007D34 389E0000 */  addi      r4, r30, 0x0
/* 004D38 80007D38 3803FFFC */  subi      r0, r3, 0x4
/* 004D3C 80007D3C 901E0000 */  stw       r0, 0x0(r30)
/* 004D40 80007D40 807F0000 */  lwz       r3, 0x0(r31)
/* 004D44 80007D44 4BFFE559 */  bl        xlListFreeItem
/* 004D48 80007D48 2C030000 */  cmpwi     r3, 0x0
/* 004D4C 80007D4C 4082000C */  bne       lbl_80007D58
/* 004D50 80007D50 38600000 */  li        r3, 0x0
/* 004D54 80007D54 48000018 */  b         lbl_80007D6C
lbl_80007D58:
/* 004D58 80007D58 38000000 */  li        r0, 0x0
/* 004D5C 80007D5C 901E0000 */  stw       r0, 0x0(r30)
/* 004D60 80007D60 38600001 */  li        r3, 0x1
/* 004D64 80007D64 48000008 */  b         lbl_80007D6C
lbl_80007D68:
/* 004D68 80007D68 38600000 */  li        r3, 0x0
lbl_80007D6C:
/* 004D6C 80007D6C 8001001C */  lwz       r0, 0x1c(r1)
/* 004D70 80007D70 83E10014 */  lwz       r31, 0x14(r1)
/* 004D74 80007D74 83C10010 */  lwz       r30, 0x10(r1)
/* 004D78 80007D78 7C0803A6 */  mtlr      r0
/* 004D7C 80007D7C 38210018 */  addi      r1, r1, 0x18
/* 004D80 80007D80 4E800020 */  blr

glabel xlObjectMake
/* 004D84 80007D84 7C0802A6 */  mflr      r0
/* 004D88 80007D88 90010004 */  stw       r0, 0x4(r1)
/* 004D8C 80007D8C 9421FFD8 */  stwu      r1, -0x28(r1)
/* 004D90 80007D90 93E10024 */  stw       r31, 0x24(r1)
/* 004D94 80007D94 93C10020 */  stw       r30, 0x20(r1)
/* 004D98 80007D98 7CBE2B78 */  mr        r30, r5
/* 004D9C 80007D9C 93A1001C */  stw       r29, 0x1c(r1)
/* 004DA0 80007DA0 3BA40000 */  addi      r29, r4, 0x0
/* 004DA4 80007DA4 93810018 */  stw       r28, 0x18(r1)
/* 004DA8 80007DA8 3B830000 */  addi      r28, r3, 0x0
/* 004DAC 80007DAC 80CD88E8 */  lwz       r6, gpListData@sda21(r0)
/* 004DB0 80007DB0 80860008 */  lwz       r4, 0x8(r6)
/* 004DB4 80007DB4 48000028 */  b         lbl_80007DDC
lbl_80007DB8:
/* 004DB8 80007DB8 38040004 */  addi      r0, r4, 0x4
/* 004DBC 80007DBC 90010014 */  stw       r0, 0x14(r1)
/* 004DC0 80007DC0 80610014 */  lwz       r3, 0x14(r1)
/* 004DC4 80007DC4 80030004 */  lwz       r0, 0x4(r3)
/* 004DC8 80007DC8 7C00F040 */  cmplw     r0, r30
/* 004DCC 80007DCC 4082000C */  bne       lbl_80007DD8
/* 004DD0 80007DD0 38000001 */  li        r0, 0x1
/* 004DD4 80007DD4 48000014 */  b         lbl_80007DE8
lbl_80007DD8:
/* 004DD8 80007DD8 80840000 */  lwz       r4, 0x0(r4)
lbl_80007DDC:
/* 004DDC 80007DDC 28040000 */  cmplwi    r4, 0x0
/* 004DE0 80007DE0 4082FFD8 */  bne       lbl_80007DB8
/* 004DE4 80007DE4 38000000 */  li        r0, 0x0
lbl_80007DE8:
/* 004DE8 80007DE8 2C000000 */  cmpwi     r0, 0x0
/* 004DEC 80007DEC 40820064 */  bne       lbl_80007E50
/* 004DF0 80007DF0 38660000 */  addi      r3, r6, 0x0
/* 004DF4 80007DF4 38810014 */  addi      r4, r1, 0x14
/* 004DF8 80007DF8 4BFFE551 */  bl        xlListMakeItem
/* 004DFC 80007DFC 2C030000 */  cmpwi     r3, 0x0
/* 004E00 80007E00 4082000C */  bne       lbl_80007E0C
/* 004E04 80007E04 38000000 */  li        r0, 0x0
/* 004E08 80007E08 48000030 */  b         lbl_80007E38
lbl_80007E0C:
/* 004E0C 80007E0C 80610014 */  lwz       r3, 0x14(r1)
/* 004E10 80007E10 93C30004 */  stw       r30, 0x4(r3)
/* 004E14 80007E14 809E0004 */  lwz       r4, 0x4(r30)
/* 004E18 80007E18 80610014 */  lwz       r3, 0x14(r1)
/* 004E1C 80007E1C 38840004 */  addi      r4, r4, 0x4
/* 004E20 80007E20 4BFFE691 */  bl        xlListMake
/* 004E24 80007E24 2C030000 */  cmpwi     r3, 0x0
/* 004E28 80007E28 4082000C */  bne       lbl_80007E34
/* 004E2C 80007E2C 38000000 */  li        r0, 0x0
/* 004E30 80007E30 48000008 */  b         lbl_80007E38
lbl_80007E34:
/* 004E34 80007E34 38000001 */  li        r0, 0x1
lbl_80007E38:
/* 004E38 80007E38 2C000000 */  cmpwi     r0, 0x0
/* 004E3C 80007E3C 4082000C */  bne       lbl_80007E48
/* 004E40 80007E40 38600000 */  li        r3, 0x0
/* 004E44 80007E44 4800007C */  b         lbl_80007EC0
lbl_80007E48:
/* 004E48 80007E48 3BE00001 */  li        r31, 0x1
/* 004E4C 80007E4C 48000008 */  b         lbl_80007E54
lbl_80007E50:
/* 004E50 80007E50 3BE00000 */  li        r31, 0x0
lbl_80007E54:
/* 004E54 80007E54 80610014 */  lwz       r3, 0x14(r1)
/* 004E58 80007E58 7F84E378 */  mr        r4, r28
/* 004E5C 80007E5C 80630000 */  lwz       r3, 0x0(r3)
/* 004E60 80007E60 4BFFE4E9 */  bl        xlListMakeItem
/* 004E64 80007E64 2C030000 */  cmpwi     r3, 0x0
/* 004E68 80007E68 4082000C */  bne       lbl_80007E74
/* 004E6C 80007E6C 38600000 */  li        r3, 0x0
/* 004E70 80007E70 48000050 */  b         lbl_80007EC0
lbl_80007E74:
/* 004E74 80007E74 807C0000 */  lwz       r3, 0x0(r28)
/* 004E78 80007E78 2C1F0000 */  cmpwi     r31, 0x0
/* 004E7C 80007E7C 80810014 */  lwz       r4, 0x14(r1)
/* 004E80 80007E80 38030004 */  addi      r0, r3, 0x4
/* 004E84 80007E84 901C0000 */  stw       r0, 0x0(r28)
/* 004E88 80007E88 90830000 */  stw       r4, 0x0(r3)
/* 004E8C 80007E8C 4182001C */  beq       lbl_80007EA8
/* 004E90 80007E90 819E000C */  lwz       r12, 0xc(r30)
/* 004E94 80007E94 38800000 */  li        r4, 0x0
/* 004E98 80007E98 807C0000 */  lwz       r3, 0x0(r28)
/* 004E9C 80007E9C 38A00000 */  li        r5, 0x0
/* 004EA0 80007EA0 7D8803A6 */  mtlr      r12
/* 004EA4 80007EA4 4E800021 */  blrl
lbl_80007EA8:
/* 004EA8 80007EA8 819E000C */  lwz       r12, 0xc(r30)
/* 004EAC 80007EAC 7FA5EB78 */  mr        r5, r29
/* 004EB0 80007EB0 807C0000 */  lwz       r3, 0x0(r28)
/* 004EB4 80007EB4 38800002 */  li        r4, 0x2
/* 004EB8 80007EB8 7D8803A6 */  mtlr      r12
/* 004EBC 80007EBC 4E800021 */  blrl
lbl_80007EC0:
/* 004EC0 80007EC0 8001002C */  lwz       r0, 0x2c(r1)
/* 004EC4 80007EC4 83E10024 */  lwz       r31, 0x24(r1)
/* 004EC8 80007EC8 83C10020 */  lwz       r30, 0x20(r1)
/* 004ECC 80007ECC 7C0803A6 */  mtlr      r0
/* 004ED0 80007ED0 83A1001C */  lwz       r29, 0x1c(r1)
/* 004ED4 80007ED4 83810018 */  lwz       r28, 0x18(r1)
/* 004ED8 80007ED8 38210028 */  addi      r1, r1, 0x28
/* 004EDC 80007EDC 4E800020 */  blr

# 0x8018B868 - 0x8018B870
.section .sbss, "wa"

glabel gpListData
	.skip 0x8
