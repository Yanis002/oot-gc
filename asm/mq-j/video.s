# video.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x8008DFD8 - 0x8008E54C

glabel videoEvent
/* 08AFD8 8008DFD8 7C0802A6 */  mflr      r0
/* 08AFDC 8008DFDC 2C040004 */  cmpwi     r4, 0x4
/* 08AFE0 8008DFE0 90010004 */  stw       r0, 0x4(r1)
/* 08AFE4 8008DFE4 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08AFE8 8008DFE8 93E1001C */  stw       r31, 0x1c(r1)
/* 08AFEC 8008DFEC 3BE50000 */  addi      r31, r5, 0x0
/* 08AFF0 8008DFF0 93C10018 */  stw       r30, 0x18(r1)
/* 08AFF4 8008DFF4 3BC30000 */  addi      r30, r3, 0x0
/* 08AFF8 8008DFF8 41820104 */  beq       lbl_8008E0FC
/* 08AFFC 8008DFFC 4080001C */  bge       lbl_8008E018
/* 08B000 8008E000 2C040002 */  cmpwi     r4, 0x2
/* 08B004 8008E004 4182002C */  beq       lbl_8008E030
/* 08B008 8008E008 408000FC */  bge       lbl_8008E104
/* 08B00C 8008E00C 2C040000 */  cmpwi     r4, 0x0
/* 08B010 8008E010 408000F4 */  bge       lbl_8008E104
/* 08B014 8008E014 480000E8 */  b         lbl_8008E0FC
lbl_8008E018:
/* 08B018 8008E018 2C041002 */  cmpwi     r4, 0x1002
/* 08B01C 8008E01C 41820060 */  beq       lbl_8008E07C
/* 08B020 8008E020 408000DC */  bge       lbl_8008E0FC
/* 08B024 8008E024 2C040006 */  cmpwi     r4, 0x6
/* 08B028 8008E028 408000D4 */  bge       lbl_8008E0FC
/* 08B02C 8008E02C 480000D8 */  b         lbl_8008E104
lbl_8008E030:
/* 08B030 8008E030 38600000 */  li        r3, 0x0
/* 08B034 8008E034 907E0000 */  stw       r3, 0x0(r30)
/* 08B038 8008E038 3C000001 */  lis       r0, 0x1
/* 08B03C 8008E03C 907E0008 */  stw       r3, 0x8(r30)
/* 08B040 8008E040 907E000C */  stw       r3, 0xc(r30)
/* 08B044 8008E044 907E0014 */  stw       r3, 0x14(r30)
/* 08B048 8008E048 907E0018 */  stw       r3, 0x18(r30)
/* 08B04C 8008E04C 907E001C */  stw       r3, 0x1c(r30)
/* 08B050 8008E050 907E0024 */  stw       r3, 0x24(r30)
/* 08B054 8008E054 907E0028 */  stw       r3, 0x28(r30)
/* 08B058 8008E058 907E002C */  stw       r3, 0x2c(r30)
/* 08B05C 8008E05C 907E0030 */  stw       r3, 0x30(r30)
/* 08B060 8008E060 907E0034 */  stw       r3, 0x34(r30)
/* 08B064 8008E064 907E0038 */  stw       r3, 0x38(r30)
/* 08B068 8008E068 907E003C */  stw       r3, 0x3c(r30)
/* 08B06C 8008E06C 907E0004 */  stw       r3, 0x4(r30)
/* 08B070 8008E070 901E0020 */  stw       r0, 0x20(r30)
/* 08B074 8008E074 93FE0010 */  stw       r31, 0x10(r30)
/* 08B078 8008E078 4800008C */  b         lbl_8008E104
lbl_8008E07C:
/* 08B07C 8008E07C 807E0010 */  lwz       r3, 0x10(r30)
/* 08B080 8008E080 3CA08009 */  lis       r5, videoPut8@ha
/* 08B084 8008E084 3CC08009 */  lis       r6, videoPut16@ha
/* 08B088 8008E088 3CE08009 */  lis       r7, videoPut32@ha
/* 08B08C 8008E08C 80630024 */  lwz       r3, 0x24(r3)
/* 08B090 8008E090 3C808009 */  lis       r4, videoPut64@ha
/* 08B094 8008E094 3904E2C0 */  addi      r8, r4, videoPut64@l
/* 08B098 8008E098 38A5E544 */  addi      r5, r5, videoPut8@l
/* 08B09C 8008E09C 38C6E53C */  addi      r6, r6, videoPut16@l
/* 08B0A0 8008E0A0 38E7E2C8 */  addi      r7, r7, videoPut32@l
/* 08B0A4 8008E0A4 389F0000 */  addi      r4, r31, 0x0
/* 08B0A8 8008E0A8 4BFA683D */  bl        cpuSetDevicePut
/* 08B0AC 8008E0AC 2C030000 */  cmpwi     r3, 0x0
/* 08B0B0 8008E0B0 4082000C */  bne       lbl_8008E0BC
/* 08B0B4 8008E0B4 38600000 */  li        r3, 0x0
/* 08B0B8 8008E0B8 48000050 */  b         lbl_8008E108
lbl_8008E0BC:
/* 08B0BC 8008E0BC 807E0010 */  lwz       r3, 0x10(r30)
/* 08B0C0 8008E0C0 3CA08009 */  lis       r5, videoGet8@ha
/* 08B0C4 8008E0C4 3CC08009 */  lis       r6, videoGet16@ha
/* 08B0C8 8008E0C8 3CE08009 */  lis       r7, videoGet32@ha
/* 08B0CC 8008E0CC 80630024 */  lwz       r3, 0x24(r3)
/* 08B0D0 8008E0D0 3C808009 */  lis       r4, videoGet64@ha
/* 08B0D4 8008E0D4 3904E18C */  addi      r8, r4, videoGet64@l
/* 08B0D8 8008E0D8 38A5E2B8 */  addi      r5, r5, videoGet8@l
/* 08B0DC 8008E0DC 38C6E2B0 */  addi      r6, r6, videoGet16@l
/* 08B0E0 8008E0E0 38E7E194 */  addi      r7, r7, videoGet32@l
/* 08B0E4 8008E0E4 389F0000 */  addi      r4, r31, 0x0
/* 08B0E8 8008E0E8 4BFA6815 */  bl        cpuSetDeviceGet
/* 08B0EC 8008E0EC 2C030000 */  cmpwi     r3, 0x0
/* 08B0F0 8008E0F0 40820014 */  bne       lbl_8008E104
/* 08B0F4 8008E0F4 38600000 */  li        r3, 0x0
/* 08B0F8 8008E0F8 48000010 */  b         lbl_8008E108
lbl_8008E0FC:
/* 08B0FC 8008E0FC 38600000 */  li        r3, 0x0
/* 08B100 8008E100 48000008 */  b         lbl_8008E108
lbl_8008E104:
/* 08B104 8008E104 38600001 */  li        r3, 0x1
lbl_8008E108:
/* 08B108 8008E108 80010024 */  lwz       r0, 0x24(r1)
/* 08B10C 8008E10C 83E1001C */  lwz       r31, 0x1c(r1)
/* 08B110 8008E110 83C10018 */  lwz       r30, 0x18(r1)
/* 08B114 8008E114 7C0803A6 */  mtlr      r0
/* 08B118 8008E118 38210020 */  addi      r1, r1, 0x20
/* 08B11C 8008E11C 4E800020 */  blr

glabel videoForceRetrace
/* 08B120 8008E120 7C0802A6 */  mflr      r0
/* 08B124 8008E124 38800008 */  li        r4, 0x8
/* 08B128 8008E128 90010004 */  stw       r0, 0x4(r1)
/* 08B12C 8008E12C 9421FFE8 */  stwu      r1, -0x18(r1)
/* 08B130 8008E130 93E10014 */  stw       r31, 0x14(r1)
/* 08B134 8008E134 7C7F1B78 */  mr        r31, r3
/* 08B138 8008E138 80630010 */  lwz       r3, 0x10(r3)
/* 08B13C 8008E13C 4BF9EE11 */  bl        systemExceptionPending
/* 08B140 8008E140 2C030000 */  cmpwi     r3, 0x0
/* 08B144 8008E144 40820030 */  bne       lbl_8008E174
/* 08B148 8008E148 801F0014 */  lwz       r0, 0x14(r31)
/* 08B14C 8008E14C 540007BF */  clrlwi.   r0, r0, 30
/* 08B150 8008E150 41820024 */  beq       lbl_8008E174
/* 08B154 8008E154 801F0020 */  lwz       r0, 0x20(r31)
/* 08B158 8008E158 38801000 */  li        r4, 0x1000
/* 08B15C 8008E15C 38A00008 */  li        r5, 0x8
/* 08B160 8008E160 901F0000 */  stw       r0, 0x0(r31)
/* 08B164 8008E164 807F0010 */  lwz       r3, 0x10(r31)
/* 08B168 8008E168 4BF79A65 */  bl        xlObjectEvent
/* 08B16C 8008E16C 38600001 */  li        r3, 0x1
/* 08B170 8008E170 48000008 */  b         lbl_8008E178
lbl_8008E174:
/* 08B174 8008E174 38600000 */  li        r3, 0x0
lbl_8008E178:
/* 08B178 8008E178 8001001C */  lwz       r0, 0x1c(r1)
/* 08B17C 8008E17C 83E10014 */  lwz       r31, 0x14(r1)
/* 08B180 8008E180 38210018 */  addi      r1, r1, 0x18
/* 08B184 8008E184 7C0803A6 */  mtlr      r0
/* 08B188 8008E188 4E800020 */  blr

glabel videoGet64
/* 08B18C 8008E18C 38600000 */  li        r3, 0x0
/* 08B190 8008E190 4E800020 */  blr

glabel videoGet32
/* 08B194 8008E194 7C0802A6 */  mflr      r0
/* 08B198 8008E198 90010004 */  stw       r0, 0x4(r1)
/* 08B19C 8008E19C 548006BE */  clrlwi    r0, r4, 26
/* 08B1A0 8008E1A0 28000034 */  cmplwi    r0, 0x34
/* 08B1A4 8008E1A4 9421FFE0 */  stwu      r1, -0x20(r1)
/* 08B1A8 8008E1A8 93E1001C */  stw       r31, 0x1c(r1)
/* 08B1AC 8008E1AC 3BE50000 */  addi      r31, r5, 0x0
/* 08B1B0 8008E1B0 93C10018 */  stw       r30, 0x18(r1)
/* 08B1B4 8008E1B4 3BC30000 */  addi      r30, r3, 0x0
/* 08B1B8 8008E1B8 418100D4 */  bgt       lbl_8008E28C
/* 08B1BC 8008E1BC 3C60800F */  lis       r3, jtbl_800EFD40@ha
/* 08B1C0 8008E1C0 3863FD40 */  addi      r3, r3, jtbl_800EFD40@l
/* 08B1C4 8008E1C4 5400103A */  slwi      r0, r0, 2
/* 08B1C8 8008E1C8 7C03002E */  lwzx      r0, r3, r0
/* 08B1CC 8008E1CC 7C0903A6 */  mtctr     r0
/* 08B1D0 8008E1D0 4E800420 */  bctr
lbl_8008E1D4:
/* 08B1D4 8008E1D4 801E0014 */  lwz       r0, 0x14(r30)
/* 08B1D8 8008E1D8 901F0000 */  stw       r0, 0x0(r31)
/* 08B1DC 8008E1DC 480000B8 */  b         lbl_8008E294
lbl_8008E1E0:
/* 08B1E0 8008E1E0 801E001C */  lwz       r0, 0x1c(r30)
/* 08B1E4 8008E1E4 901F0000 */  stw       r0, 0x0(r31)
/* 08B1E8 8008E1E8 480000AC */  b         lbl_8008E294
lbl_8008E1EC:
/* 08B1EC 8008E1EC 801E000C */  lwz       r0, 0xc(r30)
/* 08B1F0 8008E1F0 901F0000 */  stw       r0, 0x0(r31)
/* 08B1F4 8008E1F4 480000A0 */  b         lbl_8008E294
lbl_8008E1F8:
/* 08B1F8 8008E1F8 801E0020 */  lwz       r0, 0x20(r30)
/* 08B1FC 8008E1FC 5400043E */  clrlwi    r0, r0, 16
/* 08B200 8008E200 901F0000 */  stw       r0, 0x0(r31)
/* 08B204 8008E204 48000090 */  b         lbl_8008E294
lbl_8008E208:
/* 08B208 8008E208 480184B9 */  bl        VIGetCurrentLine
/* 08B20C 8008E20C 5460083C */  slwi      r0, r3, 1
/* 08B210 8008E210 901E0000 */  stw       r0, 0x0(r30)
/* 08B214 8008E214 801E0000 */  lwz       r0, 0x0(r30)
/* 08B218 8008E218 901F0000 */  stw       r0, 0x0(r31)
/* 08B21C 8008E21C 48000078 */  b         lbl_8008E294
lbl_8008E220:
/* 08B220 8008E220 801E0018 */  lwz       r0, 0x18(r30)
/* 08B224 8008E224 901F0000 */  stw       r0, 0x0(r31)
/* 08B228 8008E228 4800006C */  b         lbl_8008E294
lbl_8008E22C:
/* 08B22C 8008E22C 801E0038 */  lwz       r0, 0x38(r30)
/* 08B230 8008E230 901F0000 */  stw       r0, 0x0(r31)
/* 08B234 8008E234 48000060 */  b         lbl_8008E294
lbl_8008E238:
/* 08B238 8008E238 801E0034 */  lwz       r0, 0x34(r30)
/* 08B23C 8008E23C 901F0000 */  stw       r0, 0x0(r31)
/* 08B240 8008E240 48000054 */  b         lbl_8008E294
lbl_8008E244:
/* 08B244 8008E244 801E003C */  lwz       r0, 0x3c(r30)
/* 08B248 8008E248 901F0000 */  stw       r0, 0x0(r31)
/* 08B24C 8008E24C 48000048 */  b         lbl_8008E294
lbl_8008E250:
/* 08B250 8008E250 801E002C */  lwz       r0, 0x2c(r30)
/* 08B254 8008E254 901F0000 */  stw       r0, 0x0(r31)
/* 08B258 8008E258 4800003C */  b         lbl_8008E294
lbl_8008E25C:
/* 08B25C 8008E25C 801E0030 */  lwz       r0, 0x30(r30)
/* 08B260 8008E260 901F0000 */  stw       r0, 0x0(r31)
/* 08B264 8008E264 48000030 */  b         lbl_8008E294
lbl_8008E268:
/* 08B268 8008E268 801E0008 */  lwz       r0, 0x8(r30)
/* 08B26C 8008E26C 901F0000 */  stw       r0, 0x0(r31)
/* 08B270 8008E270 48000024 */  b         lbl_8008E294
lbl_8008E274:
/* 08B274 8008E274 801E0024 */  lwz       r0, 0x24(r30)
/* 08B278 8008E278 901F0000 */  stw       r0, 0x0(r31)
/* 08B27C 8008E27C 48000018 */  b         lbl_8008E294
lbl_8008E280:
/* 08B280 8008E280 801E0028 */  lwz       r0, 0x28(r30)
/* 08B284 8008E284 901F0000 */  stw       r0, 0x0(r31)
/* 08B288 8008E288 4800000C */  b         lbl_8008E294
lbl_8008E28C:
/* 08B28C 8008E28C 38600000 */  li        r3, 0x0
/* 08B290 8008E290 48000008 */  b         lbl_8008E298
lbl_8008E294:
/* 08B294 8008E294 38600001 */  li        r3, 0x1
lbl_8008E298:
/* 08B298 8008E298 80010024 */  lwz       r0, 0x24(r1)
/* 08B29C 8008E29C 83E1001C */  lwz       r31, 0x1c(r1)
/* 08B2A0 8008E2A0 83C10018 */  lwz       r30, 0x18(r1)
/* 08B2A4 8008E2A4 7C0803A6 */  mtlr      r0
/* 08B2A8 8008E2A8 38210020 */  addi      r1, r1, 0x20
/* 08B2AC 8008E2AC 4E800020 */  blr

glabel videoGet16
/* 08B2B0 8008E2B0 38600000 */  li        r3, 0x0
/* 08B2B4 8008E2B4 4E800020 */  blr

glabel videoGet8
/* 08B2B8 8008E2B8 38600000 */  li        r3, 0x0
/* 08B2BC 8008E2BC 4E800020 */  blr

glabel videoPut64
/* 08B2C0 8008E2C0 38600000 */  li        r3, 0x0
/* 08B2C4 8008E2C4 4E800020 */  blr

glabel videoPut32
/* 08B2C8 8008E2C8 7C0802A6 */  mflr      r0
/* 08B2CC 8008E2CC 90010004 */  stw       r0, 0x4(r1)
/* 08B2D0 8008E2D0 548006BE */  clrlwi    r0, r4, 26
/* 08B2D4 8008E2D4 28000034 */  cmplwi    r0, 0x34
/* 08B2D8 8008E2D8 9421FFD8 */  stwu      r1, -0x28(r1)
/* 08B2DC 8008E2DC 93E10024 */  stw       r31, 0x24(r1)
/* 08B2E0 8008E2E0 3BE30000 */  addi      r31, r3, 0x0
/* 08B2E4 8008E2E4 93C10020 */  stw       r30, 0x20(r1)
/* 08B2E8 8008E2E8 93A1001C */  stw       r29, 0x1c(r1)
/* 08B2EC 8008E2EC 41810228 */  bgt       lbl_8008E514
/* 08B2F0 8008E2F0 3C60800F */  lis       r3, jtbl_800EFE14@ha
/* 08B2F4 8008E2F4 3863FE14 */  addi      r3, r3, jtbl_800EFE14@l
/* 08B2F8 8008E2F8 5400103A */  slwi      r0, r0, 2
/* 08B2FC 8008E2FC 7C03002E */  lwzx      r0, r3, r0
/* 08B300 8008E300 7C0903A6 */  mtctr     r0
/* 08B304 8008E304 4E800420 */  bctr
lbl_8008E308:
/* 08B308 8008E308 80050000 */  lwz       r0, 0x0(r5)
/* 08B30C 8008E30C 5400043E */  clrlwi    r0, r0, 16
/* 08B310 8008E310 901F0014 */  stw       r0, 0x14(r31)
/* 08B314 8008E314 48000208 */  b         lbl_8008E51C
lbl_8008E318:
/* 08B318 8008E318 80050000 */  lwz       r0, 0x0(r5)
/* 08B31C 8008E31C 38810014 */  addi      r4, r1, 0x14
/* 08B320 8008E320 38C00000 */  li        r6, 0x0
/* 08B324 8008E324 5400023E */  clrlwi    r0, r0, 8
/* 08B328 8008E328 901F001C */  stw       r0, 0x1c(r31)
/* 08B32C 8008E32C 807F0010 */  lwz       r3, 0x10(r31)
/* 08B330 8008E330 80BF001C */  lwz       r5, 0x1c(r31)
/* 08B334 8008E334 80E30000 */  lwz       r7, 0x0(r3)
/* 08B338 8008E338 8063002C */  lwz       r3, 0x2c(r3)
/* 08B33C 8008E33C 3BC70000 */  addi      r30, r7, 0x0
/* 08B340 8008E340 3BA700F0 */  addi      r29, r7, 0xf0
/* 08B344 8008E344 4BFDE5CD */  bl        ramGetBuffer
/* 08B348 8008E348 2C030000 */  cmpwi     r3, 0x0
/* 08B34C 8008E34C 4082000C */  bne       lbl_8008E358
/* 08B350 8008E350 38600000 */  li        r3, 0x0
/* 08B354 8008E354 480001CC */  b         lbl_8008E520
lbl_8008E358:
/* 08B358 8008E358 807D000C */  lwz       r3, 0xc(r29)
/* 08B35C 8008E35C 80010014 */  lwz       r0, 0x14(r1)
/* 08B360 8008E360 7C030040 */  cmplw     r3, r0
/* 08B364 8008E364 418201B8 */  beq       lbl_8008E51C
/* 08B368 8008E368 38000000 */  li        r0, 0x0
/* 08B36C 8008E36C 901D0008 */  stw       r0, 0x8(r29)
/* 08B370 8008E370 38000002 */  li        r0, 0x2
/* 08B374 8008E374 387E0000 */  addi      r3, r30, 0x0
/* 08B378 8008E378 901D0000 */  stw       r0, 0x0(r29)
/* 08B37C 8008E37C 38800002 */  li        r4, 0x2
/* 08B380 8008E380 801F000C */  lwz       r0, 0xc(r31)
/* 08B384 8008E384 901D0004 */  stw       r0, 0x4(r29)
/* 08B388 8008E388 80010014 */  lwz       r0, 0x14(r1)
/* 08B38C 8008E38C 901D000C */  stw       r0, 0xc(r29)
/* 08B390 8008E390 4BF8F219 */  bl        frameSetBuffer
/* 08B394 8008E394 2C030000 */  cmpwi     r3, 0x0
/* 08B398 8008E398 40820184 */  bne       lbl_8008E51C
/* 08B39C 8008E39C 38600000 */  li        r3, 0x0
/* 08B3A0 8008E3A0 48000180 */  b         lbl_8008E520
lbl_8008E3A4:
/* 08B3A4 8008E3A4 80050000 */  lwz       r0, 0x0(r5)
/* 08B3A8 8008E3A8 5400053E */  clrlwi    r0, r0, 20
/* 08B3AC 8008E3AC 901F000C */  stw       r0, 0xc(r31)
/* 08B3B0 8008E3B0 4800016C */  b         lbl_8008E51C
lbl_8008E3B4:
/* 08B3B4 8008E3B4 80050000 */  lwz       r0, 0x0(r5)
/* 08B3B8 8008E3B8 540005BE */  clrlwi    r0, r0, 22
/* 08B3BC 8008E3BC 901F0020 */  stw       r0, 0x20(r31)
/* 08B3C0 8008E3C0 4800015C */  b         lbl_8008E51C
lbl_8008E3C4:
/* 08B3C4 8008E3C4 807F0010 */  lwz       r3, 0x10(r31)
/* 08B3C8 8008E3C8 38801001 */  li        r4, 0x1001
/* 08B3CC 8008E3CC 38A00008 */  li        r5, 0x8
/* 08B3D0 8008E3D0 4BF797FD */  bl        xlObjectEvent
/* 08B3D4 8008E3D4 3C000001 */  lis       r0, 0x1
/* 08B3D8 8008E3D8 901F0020 */  stw       r0, 0x20(r31)
/* 08B3DC 8008E3DC 48000140 */  b         lbl_8008E51C
lbl_8008E3E0:
/* 08B3E0 8008E3E0 80050000 */  lwz       r0, 0x0(r5)
/* 08B3E4 8008E3E4 901F0018 */  stw       r0, 0x18(r31)
/* 08B3E8 8008E3E8 48000134 */  b         lbl_8008E51C
lbl_8008E3EC:
/* 08B3EC 8008E3EC 80050000 */  lwz       r0, 0x0(r5)
/* 08B3F0 8008E3F0 540005BE */  clrlwi    r0, r0, 22
/* 08B3F4 8008E3F4 901F0038 */  stw       r0, 0x38(r31)
/* 08B3F8 8008E3F8 48000124 */  b         lbl_8008E51C
lbl_8008E3FC:
/* 08B3FC 8008E3FC 80050000 */  lwz       r0, 0x0(r5)
/* 08B400 8008E400 540002FE */  clrlwi    r0, r0, 11
/* 08B404 8008E404 901F0034 */  stw       r0, 0x34(r31)
/* 08B408 8008E408 48000114 */  b         lbl_8008E51C
lbl_8008E40C:
/* 08B40C 8008E40C 80050000 */  lwz       r0, 0x0(r5)
/* 08B410 8008E410 5400013E */  clrlwi    r0, r0, 4
/* 08B414 8008E414 901F003C */  stw       r0, 0x3c(r31)
/* 08B418 8008E418 48000104 */  b         lbl_8008E51C
lbl_8008E41C:
/* 08B41C 8008E41C 3C6003FF */  lis       r3, 0x3ff
/* 08B420 8008E420 80850000 */  lwz       r4, 0x0(r5)
/* 08B424 8008E424 380303FF */  addi      r0, r3, 0x3ff
/* 08B428 8008E428 7C800039 */  and.      r0, r4, r0
/* 08B42C 8008E42C 901F002C */  stw       r0, 0x2c(r31)
/* 08B430 8008E430 4082001C */  bne       lbl_8008E44C
/* 08B434 8008E434 801F0004 */  lwz       r0, 0x4(r31)
/* 08B438 8008E438 2C000001 */  cmpwi     r0, 0x1
/* 08B43C 8008E43C 418200E0 */  beq       lbl_8008E51C
/* 08B440 8008E440 38000001 */  li        r0, 0x1
/* 08B444 8008E444 901F0004 */  stw       r0, 0x4(r31)
/* 08B448 8008E448 480000D4 */  b         lbl_8008E51C
lbl_8008E44C:
/* 08B44C 8008E44C 801F0004 */  lwz       r0, 0x4(r31)
/* 08B450 8008E450 2C000000 */  cmpwi     r0, 0x0
/* 08B454 8008E454 418200C8 */  beq       lbl_8008E51C
/* 08B458 8008E458 38000000 */  li        r0, 0x0
/* 08B45C 8008E45C 901F0004 */  stw       r0, 0x4(r31)
/* 08B460 8008E460 480000BC */  b         lbl_8008E51C
lbl_8008E464:
/* 08B464 8008E464 3C6003FF */  lis       r3, 0x3ff
/* 08B468 8008E468 80850000 */  lwz       r4, 0x0(r5)
/* 08B46C 8008E46C 380303FF */  addi      r0, r3, 0x3ff
/* 08B470 8008E470 7C800038 */  and       r0, r4, r0
/* 08B474 8008E474 901F0030 */  stw       r0, 0x30(r31)
/* 08B478 8008E478 480000A4 */  b         lbl_8008E51C
lbl_8008E47C:
/* 08B47C 8008E47C 3C6003FF */  lis       r3, 0x3ff
/* 08B480 8008E480 80850000 */  lwz       r4, 0x0(r5)
/* 08B484 8008E484 380303FF */  addi      r0, r3, 0x3ff
/* 08B488 8008E488 7C800038 */  and       r0, r4, r0
/* 08B48C 8008E48C 901F0008 */  stw       r0, 0x8(r31)
/* 08B490 8008E490 4800008C */  b         lbl_8008E51C
lbl_8008E494:
/* 08B494 8008E494 80050000 */  lwz       r0, 0x0(r5)
/* 08B498 8008E498 38800000 */  li        r4, 0x0
/* 08B49C 8008E49C 5400053E */  clrlwi    r0, r0, 20
/* 08B4A0 8008E4A0 901F0024 */  stw       r0, 0x24(r31)
/* 08B4A4 8008E4A4 801F0028 */  lwz       r0, 0x28(r31)
/* 08B4A8 8008E4A8 807F0010 */  lwz       r3, 0x10(r31)
/* 08B4AC 8008E4AC 1C0000F0 */  mulli     r0, r0, 0xf0
/* 08B4B0 8008E4B0 80BF000C */  lwz       r5, 0xc(r31)
/* 08B4B4 8008E4B4 80630000 */  lwz       r3, 0x0(r3)
/* 08B4B8 8008E4B8 7C065670 */  srawi     r6, r0, 10
/* 08B4BC 8008E4BC 7CC60194 */  addze     r6, r6
/* 08B4C0 8008E4C0 4BF91A99 */  bl        frameSetSize
/* 08B4C4 8008E4C4 2C030000 */  cmpwi     r3, 0x0
/* 08B4C8 8008E4C8 40820054 */  bne       lbl_8008E51C
/* 08B4CC 8008E4CC 38600000 */  li        r3, 0x0
/* 08B4D0 8008E4D0 48000050 */  b         lbl_8008E520
lbl_8008E4D4:
/* 08B4D4 8008E4D4 80050000 */  lwz       r0, 0x0(r5)
/* 08B4D8 8008E4D8 38800000 */  li        r4, 0x0
/* 08B4DC 8008E4DC 5400053E */  clrlwi    r0, r0, 20
/* 08B4E0 8008E4E0 901F0028 */  stw       r0, 0x28(r31)
/* 08B4E4 8008E4E4 801F0028 */  lwz       r0, 0x28(r31)
/* 08B4E8 8008E4E8 807F0010 */  lwz       r3, 0x10(r31)
/* 08B4EC 8008E4EC 1C0000F0 */  mulli     r0, r0, 0xf0
/* 08B4F0 8008E4F0 80BF000C */  lwz       r5, 0xc(r31)
/* 08B4F4 8008E4F4 80630000 */  lwz       r3, 0x0(r3)
/* 08B4F8 8008E4F8 7C065670 */  srawi     r6, r0, 10
/* 08B4FC 8008E4FC 7CC60194 */  addze     r6, r6
/* 08B500 8008E500 4BF91A59 */  bl        frameSetSize
/* 08B504 8008E504 2C030000 */  cmpwi     r3, 0x0
/* 08B508 8008E508 40820014 */  bne       lbl_8008E51C
/* 08B50C 8008E50C 38600000 */  li        r3, 0x0
/* 08B510 8008E510 48000010 */  b         lbl_8008E520
lbl_8008E514:
/* 08B514 8008E514 38600000 */  li        r3, 0x0
/* 08B518 8008E518 48000008 */  b         lbl_8008E520
lbl_8008E51C:
/* 08B51C 8008E51C 38600001 */  li        r3, 0x1
lbl_8008E520:
/* 08B520 8008E520 8001002C */  lwz       r0, 0x2c(r1)
/* 08B524 8008E524 83E10024 */  lwz       r31, 0x24(r1)
/* 08B528 8008E528 83C10020 */  lwz       r30, 0x20(r1)
/* 08B52C 8008E52C 7C0803A6 */  mtlr      r0
/* 08B530 8008E530 83A1001C */  lwz       r29, 0x1c(r1)
/* 08B534 8008E534 38210028 */  addi      r1, r1, 0x28
/* 08B538 8008E538 4E800020 */  blr

glabel videoPut16
/* 08B53C 8008E53C 38600000 */  li        r3, 0x0
/* 08B540 8008E540 4E800020 */  blr

glabel videoPut8
/* 08B544 8008E544 38600000 */  li        r3, 0x0
/* 08B548 8008E548 4E800020 */  blr

# 0x800EFD30 - 0x800EFEE8
.section .data, "wa"

.balign 8

glabel gClassVideo
	.long D_8018B5A8
	.long 0x00000040
	.long 0x00000000
	.long videoEvent

jtbl_800EFD40:
	.long videoGet32, lbl_8008E1D4
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E1E0
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E1EC
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E1F8
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E208
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E220
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E22C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E238
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E244
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E250
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E25C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E268
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E274
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E28C
	.long videoGet32, lbl_8008E280

jtbl_800EFE14:
	.long videoPut32, lbl_8008E308
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E318
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E3A4
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E3B4
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E3C4
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E3E0
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E3EC
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E3FC
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E40C
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E41C
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E464
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E47C
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E494
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E514
	.long videoPut32, lbl_8008E4D4

# 0x8018B5A8 - 0x8018B5B0
.section .sdata, "wa"

glabel D_8018B5A8
	.long 0x56494445
	.long 0x4F000000
