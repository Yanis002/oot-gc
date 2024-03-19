# THPDraw.c
.include "macros.inc"

.section .text, "ax"

.balign 4

# 0x80010F14 - 0x80011714

glabel THPGXRestore
/* 00DF14 80010F14 7C0802A6 */  mflr      r0
/* 00DF18 80010F18 38600001 */  li        r3, 0x1
/* 00DF1C 80010F1C 90010004 */  stw       r0, 0x4(r1)
/* 00DF20 80010F20 38800007 */  li        r4, 0x7
/* 00DF24 80010F24 38A00000 */  li        r5, 0x0
/* 00DF28 80010F28 9421FFF8 */  stwu      r1, -0x8(r1)
/* 00DF2C 80010F2C 4809C22D */  bl        GXSetZMode
/* 00DF30 80010F30 38600000 */  li        r3, 0x0
/* 00DF34 80010F34 38800001 */  li        r4, 0x1
/* 00DF38 80010F38 38A00000 */  li        r5, 0x0
/* 00DF3C 80010F3C 38C0000F */  li        r6, 0xf
/* 00DF40 80010F40 4809C16D */  bl        fn_800AD0AC
/* 00DF44 80010F44 38600001 */  li        r3, 0x1
/* 00DF48 80010F48 48098875 */  bl        GXSetNumTexGens
/* 00DF4C 80010F4C 38600000 */  li        r3, 0x0
/* 00DF50 80010F50 4809A231 */  bl        GXSetNumChans
/* 00DF54 80010F54 38600001 */  li        r3, 0x1
/* 00DF58 80010F58 4809BCAD */  bl        GXSetNumTevStages
/* 00DF5C 80010F5C 38600000 */  li        r3, 0x0
/* 00DF60 80010F60 38800000 */  li        r4, 0x0
/* 00DF64 80010F64 38A00000 */  li        r5, 0x0
/* 00DF68 80010F68 38C000FF */  li        r6, 0xff
/* 00DF6C 80010F6C 4809BAC1 */  bl        GXSetTevOrder
/* 00DF70 80010F70 38600000 */  li        r3, 0x0
/* 00DF74 80010F74 38800003 */  li        r4, 0x3
/* 00DF78 80010F78 4809B4D9 */  bl        GXSetTevOp
/* 00DF7C 80010F7C 38600000 */  li        r3, 0x0
/* 00DF80 80010F80 38800000 */  li        r4, 0x0
/* 00DF84 80010F84 38A00000 */  li        r5, 0x0
/* 00DF88 80010F88 4809B8E1 */  bl        GXSetTevSwapMode
/* 00DF8C 80010F8C 38600001 */  li        r3, 0x1
/* 00DF90 80010F90 38800000 */  li        r4, 0x0
/* 00DF94 80010F94 38A00000 */  li        r5, 0x0
/* 00DF98 80010F98 4809B8D1 */  bl        GXSetTevSwapMode
/* 00DF9C 80010F9C 38600002 */  li        r3, 0x2
/* 00DFA0 80010FA0 38800000 */  li        r4, 0x0
/* 00DFA4 80010FA4 38A00000 */  li        r5, 0x0
/* 00DFA8 80010FA8 4809B8C1 */  bl        GXSetTevSwapMode
/* 00DFAC 80010FAC 38600003 */  li        r3, 0x3
/* 00DFB0 80010FB0 38800000 */  li        r4, 0x0
/* 00DFB4 80010FB4 38A00000 */  li        r5, 0x0
/* 00DFB8 80010FB8 4809B8B1 */  bl        GXSetTevSwapMode
/* 00DFBC 80010FBC 38600000 */  li        r3, 0x0
/* 00DFC0 80010FC0 38800000 */  li        r4, 0x0
/* 00DFC4 80010FC4 38A00001 */  li        r5, 0x1
/* 00DFC8 80010FC8 38C00002 */  li        r6, 0x2
/* 00DFCC 80010FCC 38E00003 */  li        r7, 0x3
/* 00DFD0 80010FD0 4809B8ED */  bl        GXSetTevSwapModeTable
/* 00DFD4 80010FD4 38600001 */  li        r3, 0x1
/* 00DFD8 80010FD8 38800000 */  li        r4, 0x0
/* 00DFDC 80010FDC 38A00000 */  li        r5, 0x0
/* 00DFE0 80010FE0 38C00000 */  li        r6, 0x0
/* 00DFE4 80010FE4 38E00003 */  li        r7, 0x3
/* 00DFE8 80010FE8 4809B8D5 */  bl        GXSetTevSwapModeTable
/* 00DFEC 80010FEC 38600002 */  li        r3, 0x2
/* 00DFF0 80010FF0 38800001 */  li        r4, 0x1
/* 00DFF4 80010FF4 38A00001 */  li        r5, 0x1
/* 00DFF8 80010FF8 38C00001 */  li        r6, 0x1
/* 00DFFC 80010FFC 38E00003 */  li        r7, 0x3
/* 00E000 80011000 4809B8BD */  bl        GXSetTevSwapModeTable
/* 00E004 80011004 38600003 */  li        r3, 0x3
/* 00E008 80011008 38800002 */  li        r4, 0x2
/* 00E00C 8001100C 38A00002 */  li        r5, 0x2
/* 00E010 80011010 38C00002 */  li        r6, 0x2
/* 00E014 80011014 38E00003 */  li        r7, 0x3
/* 00E018 80011018 4809B8A5 */  bl        GXSetTevSwapModeTable
/* 00E01C 8001101C 8001000C */  lwz       r0, 0xc(r1)
/* 00E020 80011020 38210008 */  addi      r1, r1, 0x8
/* 00E024 80011024 7C0803A6 */  mtlr      r0
/* 00E028 80011028 4E800020 */  blr

glabel THPGXYuv2RgbSetup
/* 00E02C 8001102C 7C0802A6 */  mflr      r0
/* 00E030 80011030 38800000 */  li        r4, 0x0
/* 00E034 80011034 90010004 */  stw       r0, 0x4(r1)
/* 00E038 80011038 9421FF10 */  stwu      r1, -0xf0(r1)
/* 00E03C 8001103C BF6100DC */  stmw      r27, 0xdc(r1)
/* 00E040 80011040 A3830004 */  lhz       r28, 0x4(r3)
/* 00E044 80011044 A3630006 */  lhz       r27, 0x6(r3)
/* 00E048 80011048 38600000 */  li        r3, 0x0
/* 00E04C 8001104C 4809C179 */  bl        GXSetPixelFmt
/* 00E050 80011050 6F7D8000 */  xoris     r29, r27, 0x8000
/* 00E054 80011054 C022808C */  lfs       f1, D_8018BFCC@sda21(r0)
/* 00E058 80011058 6F9F8000 */  xoris     r31, r28, 0x8000
/* 00E05C 8001105C 93A100D4 */  stw       r29, 0xd4(r1)
/* 00E060 80011060 3FC04330 */  lis       r30, 0x4330
/* 00E064 80011064 C8828098 */  lfd       f4, D_8018BFD8@sda21(r0)
/* 00E068 80011068 93E100CC */  stw       r31, 0xcc(r1)
/* 00E06C 8001106C FC600890 */  fmr       f3, f1
/* 00E070 80011070 FCA00890 */  fmr       f5, f1
/* 00E074 80011074 C0C28090 */  lfs       f6, D_8018BFD0@sda21(r0)
/* 00E078 80011078 93C100D0 */  stw       r30, 0xd0(r1)
/* 00E07C 8001107C 38610074 */  addi      r3, r1, 0x74
/* 00E080 80011080 93C100C8 */  stw       r30, 0xc8(r1)
/* 00E084 80011084 C84100D0 */  lfd       f2, 0xd0(r1)
/* 00E088 80011088 C80100C8 */  lfd       f0, 0xc8(r1)
/* 00E08C 8001108C EC422028 */  fsubs     f2, f2, f4
/* 00E090 80011090 EC802028 */  fsubs     f4, f0, f4
/* 00E094 80011094 48095B35 */  bl        C_MTXOrtho
/* 00E098 80011098 38610074 */  addi      r3, r1, 0x74
/* 00E09C 8001109C 38800001 */  li        r4, 0x1
/* 00E0A0 800110A0 4809C335 */  bl        GXSetProjection
/* 00E0A4 800110A4 93E100C4 */  stw       r31, 0xc4(r1)
/* 00E0A8 800110A8 C022808C */  lfs       f1, D_8018BFCC@sda21(r0)
/* 00E0AC 800110AC 93A100BC */  stw       r29, 0xbc(r1)
/* 00E0B0 800110B0 C8828098 */  lfd       f4, D_8018BFD8@sda21(r0)
/* 00E0B4 800110B4 FC400890 */  fmr       f2, f1
/* 00E0B8 800110B8 93C100C0 */  stw       r30, 0xc0(r1)
/* 00E0BC 800110BC FCA00890 */  fmr       f5, f1
/* 00E0C0 800110C0 C0C28094 */  lfs       f6, D_8018BFD4@sda21(r0)
/* 00E0C4 800110C4 93C100B8 */  stw       r30, 0xb8(r1)
/* 00E0C8 800110C8 C86100C0 */  lfd       f3, 0xc0(r1)
/* 00E0CC 800110CC C80100B8 */  lfd       f0, 0xb8(r1)
/* 00E0D0 800110D0 EC632028 */  fsubs     f3, f3, f4
/* 00E0D4 800110D4 EC802028 */  fsubs     f4, f0, f4
/* 00E0D8 800110D8 4809C701 */  bl        GXSetViewport
/* 00E0DC 800110DC 38BC0000 */  addi      r5, r28, 0x0
/* 00E0E0 800110E0 38DB0000 */  addi      r6, r27, 0x0
/* 00E0E4 800110E4 38600000 */  li        r3, 0x0
/* 00E0E8 800110E8 38800000 */  li        r4, 0x0
/* 00E0EC 800110EC 4809C711 */  bl        GXSetScissor
/* 00E0F0 800110F0 38610044 */  addi      r3, r1, 0x44
/* 00E0F4 800110F4 480957B9 */  bl        PSMTXIdentity
/* 00E0F8 800110F8 38610044 */  addi      r3, r1, 0x44
/* 00E0FC 800110FC 38800000 */  li        r4, 0x0
/* 00E100 80011100 4809C449 */  bl        fn_800AD548
/* 00E104 80011104 38600000 */  li        r3, 0x0
/* 00E108 80011108 4809C4E1 */  bl        fn_800AD5E8
/* 00E10C 8001110C 38600001 */  li        r3, 0x1
/* 00E110 80011110 38800007 */  li        r4, 0x7
/* 00E114 80011114 38A00000 */  li        r5, 0x0
/* 00E118 80011118 4809C041 */  bl        GXSetZMode
/* 00E11C 8001111C 38600000 */  li        r3, 0x0
/* 00E120 80011120 38800001 */  li        r4, 0x1
/* 00E124 80011124 38A00000 */  li        r5, 0x0
/* 00E128 80011128 38C00000 */  li        r6, 0x0
/* 00E12C 8001112C 4809BF81 */  bl        fn_800AD0AC
/* 00E130 80011130 38600001 */  li        r3, 0x1
/* 00E134 80011134 4809BFCD */  bl        fn_800AD100
/* 00E138 80011138 38600000 */  li        r3, 0x0
/* 00E13C 8001113C 4809BFF1 */  bl        fn_800AD12C
/* 00E140 80011140 38600000 */  li        r3, 0x0
/* 00E144 80011144 48099B29 */  bl        GXSetDispCopyGamma
/* 00E148 80011148 38600000 */  li        r3, 0x0
/* 00E14C 8001114C 48099085 */  bl        GXSetCullMode
/* 00E150 80011150 38600007 */  li        r3, 0x7
/* 00E154 80011154 38800000 */  li        r4, 0x0
/* 00E158 80011158 38A00000 */  li        r5, 0x0
/* 00E15C 8001115C 38C00007 */  li        r6, 0x7
/* 00E160 80011160 38E00000 */  li        r7, 0x0
/* 00E164 80011164 4809B7F1 */  bl        GXSetAlphaCompare
/* 00E168 80011168 38600000 */  li        r3, 0x0
/* 00E16C 8001116C 38800011 */  li        r4, 0x11
/* 00E170 80011170 38A00000 */  li        r5, 0x0
/* 00E174 80011174 4809B835 */  bl        GXSetZTexture
/* 00E178 80011178 38600000 */  li        r3, 0x0
/* 00E17C 8001117C 4809A005 */  bl        GXSetNumChans
/* 00E180 80011180 38600002 */  li        r3, 0x2
/* 00E184 80011184 48098639 */  bl        GXSetNumTexGens
/* 00E188 80011188 38600000 */  li        r3, 0x0
/* 00E18C 8001118C 38800001 */  li        r4, 0x1
/* 00E190 80011190 38A00004 */  li        r5, 0x4
/* 00E194 80011194 38C0003C */  li        r6, 0x3c
/* 00E198 80011198 38E00000 */  li        r7, 0x0
/* 00E19C 8001119C 3900007D */  li        r8, 0x7d
/* 00E1A0 800111A0 4809834D */  bl        fn_800A94EC
/* 00E1A4 800111A4 38600001 */  li        r3, 0x1
/* 00E1A8 800111A8 38800001 */  li        r4, 0x1
/* 00E1AC 800111AC 38A00004 */  li        r5, 0x4
/* 00E1B0 800111B0 38C0003C */  li        r6, 0x3c
/* 00E1B4 800111B4 38E00000 */  li        r7, 0x0
/* 00E1B8 800111B8 3900007D */  li        r8, 0x7d
/* 00E1BC 800111BC 48098331 */  bl        fn_800A94EC
/* 00E1C0 800111C0 4809AA35 */  bl        GXInvalidateTexAll
/* 00E1C4 800111C4 48097AE9 */  bl        GXClearVtxDesc
/* 00E1C8 800111C8 38600009 */  li        r3, 0x9
/* 00E1CC 800111CC 38800001 */  li        r4, 0x1
/* 00E1D0 800111D0 48097615 */  bl        GXSetVtxDesc
/* 00E1D4 800111D4 3860000D */  li        r3, 0xd
/* 00E1D8 800111D8 38800001 */  li        r4, 0x1
/* 00E1DC 800111DC 48097609 */  bl        GXSetVtxDesc
/* 00E1E0 800111E0 38600007 */  li        r3, 0x7
/* 00E1E4 800111E4 38800009 */  li        r4, 0x9
/* 00E1E8 800111E8 38A00001 */  li        r5, 0x1
/* 00E1EC 800111EC 38C00003 */  li        r6, 0x3
/* 00E1F0 800111F0 38E00000 */  li        r7, 0x0
/* 00E1F4 800111F4 48097AF1 */  bl        GXSetVtxAttrFmt
/* 00E1F8 800111F8 38600007 */  li        r3, 0x7
/* 00E1FC 800111FC 3880000D */  li        r4, 0xd
/* 00E200 80011200 38A00001 */  li        r5, 0x1
/* 00E204 80011204 38C00002 */  li        r6, 0x2
/* 00E208 80011208 38E00000 */  li        r7, 0x0
/* 00E20C 8001120C 48097AD9 */  bl        GXSetVtxAttrFmt
/* 00E210 80011210 38600004 */  li        r3, 0x4
/* 00E214 80011214 4809B9F1 */  bl        GXSetNumTevStages
/* 00E218 80011218 38600000 */  li        r3, 0x0
/* 00E21C 8001121C 38800001 */  li        r4, 0x1
/* 00E220 80011220 38A00001 */  li        r5, 0x1
/* 00E224 80011224 38C000FF */  li        r6, 0xff
/* 00E228 80011228 4809B805 */  bl        GXSetTevOrder
/* 00E22C 8001122C 38600000 */  li        r3, 0x0
/* 00E230 80011230 3880000F */  li        r4, 0xf
/* 00E234 80011234 38A00008 */  li        r5, 0x8
/* 00E238 80011238 38C0000E */  li        r6, 0xe
/* 00E23C 8001123C 38E00002 */  li        r7, 0x2
/* 00E240 80011240 4809B29D */  bl        GXSetTevColorIn
/* 00E244 80011244 38600000 */  li        r3, 0x0
/* 00E248 80011248 38800000 */  li        r4, 0x0
/* 00E24C 8001124C 38A00000 */  li        r5, 0x0
/* 00E250 80011250 38C00000 */  li        r6, 0x0
/* 00E254 80011254 38E00000 */  li        r7, 0x0
/* 00E258 80011258 39000000 */  li        r8, 0x0
/* 00E25C 8001125C 4809B309 */  bl        GXSetTevColorOp
/* 00E260 80011260 38600000 */  li        r3, 0x0
/* 00E264 80011264 38800007 */  li        r4, 0x7
/* 00E268 80011268 38A00004 */  li        r5, 0x4
/* 00E26C 8001126C 38C00006 */  li        r6, 0x6
/* 00E270 80011270 38E00001 */  li        r7, 0x1
/* 00E274 80011274 4809B2AD */  bl        GXSetTevAlphaIn
/* 00E278 80011278 38600000 */  li        r3, 0x0
/* 00E27C 8001127C 38800001 */  li        r4, 0x1
/* 00E280 80011280 38A00000 */  li        r5, 0x0
/* 00E284 80011284 38C00000 */  li        r6, 0x0
/* 00E288 80011288 38E00000 */  li        r7, 0x0
/* 00E28C 8001128C 39000000 */  li        r8, 0x0
/* 00E290 80011290 4809B33D */  bl        GXSetTevAlphaOp
/* 00E294 80011294 38600000 */  li        r3, 0x0
/* 00E298 80011298 3880000C */  li        r4, 0xc
/* 00E29C 8001129C 4809B4F5 */  bl        GXSetTevKColorSel
/* 00E2A0 800112A0 38600000 */  li        r3, 0x0
/* 00E2A4 800112A4 3880001C */  li        r4, 0x1c
/* 00E2A8 800112A8 4809B555 */  bl        GXSetTevKAlphaSel
/* 00E2AC 800112AC 38600000 */  li        r3, 0x0
/* 00E2B0 800112B0 38800000 */  li        r4, 0x0
/* 00E2B4 800112B4 38A00000 */  li        r5, 0x0
/* 00E2B8 800112B8 4809B5B1 */  bl        GXSetTevSwapMode
/* 00E2BC 800112BC 38600001 */  li        r3, 0x1
/* 00E2C0 800112C0 38800001 */  li        r4, 0x1
/* 00E2C4 800112C4 38A00002 */  li        r5, 0x2
/* 00E2C8 800112C8 38C000FF */  li        r6, 0xff
/* 00E2CC 800112CC 4809B761 */  bl        GXSetTevOrder
/* 00E2D0 800112D0 38600001 */  li        r3, 0x1
/* 00E2D4 800112D4 3880000F */  li        r4, 0xf
/* 00E2D8 800112D8 38A00008 */  li        r5, 0x8
/* 00E2DC 800112DC 38C0000E */  li        r6, 0xe
/* 00E2E0 800112E0 38E00000 */  li        r7, 0x0
/* 00E2E4 800112E4 4809B1F9 */  bl        GXSetTevColorIn
/* 00E2E8 800112E8 38600001 */  li        r3, 0x1
/* 00E2EC 800112EC 38800000 */  li        r4, 0x0
/* 00E2F0 800112F0 38A00000 */  li        r5, 0x0
/* 00E2F4 800112F4 38C00001 */  li        r6, 0x1
/* 00E2F8 800112F8 38E00000 */  li        r7, 0x0
/* 00E2FC 800112FC 39000000 */  li        r8, 0x0
/* 00E300 80011300 4809B265 */  bl        GXSetTevColorOp
/* 00E304 80011304 38600001 */  li        r3, 0x1
/* 00E308 80011308 38800007 */  li        r4, 0x7
/* 00E30C 8001130C 38A00004 */  li        r5, 0x4
/* 00E310 80011310 38C00006 */  li        r6, 0x6
/* 00E314 80011314 38E00000 */  li        r7, 0x0
/* 00E318 80011318 4809B209 */  bl        GXSetTevAlphaIn
/* 00E31C 8001131C 38600001 */  li        r3, 0x1
/* 00E320 80011320 38800001 */  li        r4, 0x1
/* 00E324 80011324 38A00000 */  li        r5, 0x0
/* 00E328 80011328 38C00000 */  li        r6, 0x0
/* 00E32C 8001132C 38E00000 */  li        r7, 0x0
/* 00E330 80011330 39000000 */  li        r8, 0x0
/* 00E334 80011334 4809B299 */  bl        GXSetTevAlphaOp
/* 00E338 80011338 38600001 */  li        r3, 0x1
/* 00E33C 8001133C 3880000D */  li        r4, 0xd
/* 00E340 80011340 4809B451 */  bl        GXSetTevKColorSel
/* 00E344 80011344 38600001 */  li        r3, 0x1
/* 00E348 80011348 3880001D */  li        r4, 0x1d
/* 00E34C 8001134C 4809B4B1 */  bl        GXSetTevKAlphaSel
/* 00E350 80011350 38600001 */  li        r3, 0x1
/* 00E354 80011354 38800000 */  li        r4, 0x0
/* 00E358 80011358 38A00000 */  li        r5, 0x0
/* 00E35C 8001135C 4809B50D */  bl        GXSetTevSwapMode
/* 00E360 80011360 38600002 */  li        r3, 0x2
/* 00E364 80011364 38800000 */  li        r4, 0x0
/* 00E368 80011368 38A00000 */  li        r5, 0x0
/* 00E36C 8001136C 38C000FF */  li        r6, 0xff
/* 00E370 80011370 4809B6BD */  bl        GXSetTevOrder
/* 00E374 80011374 38600002 */  li        r3, 0x2
/* 00E378 80011378 3880000F */  li        r4, 0xf
/* 00E37C 8001137C 38A00008 */  li        r5, 0x8
/* 00E380 80011380 38C0000C */  li        r6, 0xc
/* 00E384 80011384 38E00000 */  li        r7, 0x0
/* 00E388 80011388 4809B155 */  bl        GXSetTevColorIn
/* 00E38C 8001138C 38600002 */  li        r3, 0x2
/* 00E390 80011390 38800000 */  li        r4, 0x0
/* 00E394 80011394 38A00000 */  li        r5, 0x0
/* 00E398 80011398 38C00000 */  li        r6, 0x0
/* 00E39C 8001139C 38E00001 */  li        r7, 0x1
/* 00E3A0 800113A0 39000000 */  li        r8, 0x0
/* 00E3A4 800113A4 4809B1C1 */  bl        GXSetTevColorOp
/* 00E3A8 800113A8 38600002 */  li        r3, 0x2
/* 00E3AC 800113AC 38800004 */  li        r4, 0x4
/* 00E3B0 800113B0 38A00007 */  li        r5, 0x7
/* 00E3B4 800113B4 38C00007 */  li        r6, 0x7
/* 00E3B8 800113B8 38E00000 */  li        r7, 0x0
/* 00E3BC 800113BC 4809B165 */  bl        GXSetTevAlphaIn
/* 00E3C0 800113C0 38600002 */  li        r3, 0x2
/* 00E3C4 800113C4 38800000 */  li        r4, 0x0
/* 00E3C8 800113C8 38A00000 */  li        r5, 0x0
/* 00E3CC 800113CC 38C00000 */  li        r6, 0x0
/* 00E3D0 800113D0 38E00001 */  li        r7, 0x1
/* 00E3D4 800113D4 39000000 */  li        r8, 0x0
/* 00E3D8 800113D8 4809B1F5 */  bl        GXSetTevAlphaOp
/* 00E3DC 800113DC 38600002 */  li        r3, 0x2
/* 00E3E0 800113E0 38800000 */  li        r4, 0x0
/* 00E3E4 800113E4 38A00000 */  li        r5, 0x0
/* 00E3E8 800113E8 4809B481 */  bl        GXSetTevSwapMode
/* 00E3EC 800113EC 38600003 */  li        r3, 0x3
/* 00E3F0 800113F0 388000FF */  li        r4, 0xff
/* 00E3F4 800113F4 38A000FF */  li        r5, 0xff
/* 00E3F8 800113F8 38C000FF */  li        r6, 0xff
/* 00E3FC 800113FC 4809B631 */  bl        GXSetTevOrder
/* 00E400 80011400 38600003 */  li        r3, 0x3
/* 00E404 80011404 38800001 */  li        r4, 0x1
/* 00E408 80011408 38A00000 */  li        r5, 0x0
/* 00E40C 8001140C 38C0000E */  li        r6, 0xe
/* 00E410 80011410 38E0000F */  li        r7, 0xf
/* 00E414 80011414 4809B0C9 */  bl        GXSetTevColorIn
/* 00E418 80011418 38600003 */  li        r3, 0x3
/* 00E41C 8001141C 38800000 */  li        r4, 0x0
/* 00E420 80011420 38A00000 */  li        r5, 0x0
/* 00E424 80011424 38C00000 */  li        r6, 0x0
/* 00E428 80011428 38E00001 */  li        r7, 0x1
/* 00E42C 8001142C 39000000 */  li        r8, 0x0
/* 00E430 80011430 4809B135 */  bl        GXSetTevColorOp
/* 00E434 80011434 38600003 */  li        r3, 0x3
/* 00E438 80011438 38800007 */  li        r4, 0x7
/* 00E43C 8001143C 38A00007 */  li        r5, 0x7
/* 00E440 80011440 38C00007 */  li        r6, 0x7
/* 00E444 80011444 38E00007 */  li        r7, 0x7
/* 00E448 80011448 4809B0D9 */  bl        GXSetTevAlphaIn
/* 00E44C 8001144C 38600003 */  li        r3, 0x3
/* 00E450 80011450 38800000 */  li        r4, 0x0
/* 00E454 80011454 38A00000 */  li        r5, 0x0
/* 00E458 80011458 38C00000 */  li        r6, 0x0
/* 00E45C 8001145C 38E00001 */  li        r7, 0x1
/* 00E460 80011460 39000000 */  li        r8, 0x0
/* 00E464 80011464 4809B169 */  bl        GXSetTevAlphaOp
/* 00E468 80011468 38600003 */  li        r3, 0x3
/* 00E46C 8001146C 38800000 */  li        r4, 0x0
/* 00E470 80011470 38A00000 */  li        r5, 0x0
/* 00E474 80011474 4809B3F5 */  bl        GXSetTevSwapMode
/* 00E478 80011478 38600003 */  li        r3, 0x3
/* 00E47C 8001147C 3880000E */  li        r4, 0xe
/* 00E480 80011480 4809B311 */  bl        GXSetTevKColorSel
/* 00E484 80011484 80628078 */  lwz       r3, D_8018BFB8@sda21(r0)
/* 00E488 80011488 3881003C */  addi      r4, r1, 0x3c
/* 00E48C 8001148C 8002807C */  lwz       r0, D_8018BFB8+0x4@sda21(r0)
/* 00E490 80011490 90610034 */  stw       r3, 0x34(r1)
/* 00E494 80011494 38600001 */  li        r3, 0x1
/* 00E498 80011498 90010038 */  stw       r0, 0x38(r1)
/* 00E49C 8001149C 80A10034 */  lwz       r5, 0x34(r1)
/* 00E4A0 800114A0 80010038 */  lwz       r0, 0x38(r1)
/* 00E4A4 800114A4 90A1003C */  stw       r5, 0x3c(r1)
/* 00E4A8 800114A8 90010040 */  stw       r0, 0x40(r1)
/* 00E4AC 800114AC 4809B1FD */  bl        GXSetTevColorS10
/* 00E4B0 800114B0 80028080 */  lwz       r0, D_8018BFC0@sda21(r0)
/* 00E4B4 800114B4 38810030 */  addi      r4, r1, 0x30
/* 00E4B8 800114B8 38600000 */  li        r3, 0x0
/* 00E4BC 800114BC 9001002C */  stw       r0, 0x2c(r1)
/* 00E4C0 800114C0 8001002C */  lwz       r0, 0x2c(r1)
/* 00E4C4 800114C4 90010030 */  stw       r0, 0x30(r1)
/* 00E4C8 800114C8 4809B255 */  bl        GXSetTevKColor
/* 00E4CC 800114CC 80028084 */  lwz       r0, D_8018BFC4@sda21(r0)
/* 00E4D0 800114D0 38810028 */  addi      r4, r1, 0x28
/* 00E4D4 800114D4 38600001 */  li        r3, 0x1
/* 00E4D8 800114D8 90010024 */  stw       r0, 0x24(r1)
/* 00E4DC 800114DC 80010024 */  lwz       r0, 0x24(r1)
/* 00E4E0 800114E0 90010028 */  stw       r0, 0x28(r1)
/* 00E4E4 800114E4 4809B239 */  bl        GXSetTevKColor
/* 00E4E8 800114E8 80028088 */  lwz       r0, D_8018BFC8@sda21(r0)
/* 00E4EC 800114EC 38810020 */  addi      r4, r1, 0x20
/* 00E4F0 800114F0 38600002 */  li        r3, 0x2
/* 00E4F4 800114F4 9001001C */  stw       r0, 0x1c(r1)
/* 00E4F8 800114F8 8001001C */  lwz       r0, 0x1c(r1)
/* 00E4FC 800114FC 90010020 */  stw       r0, 0x20(r1)
/* 00E500 80011500 4809B21D */  bl        GXSetTevKColor
/* 00E504 80011504 38600000 */  li        r3, 0x0
/* 00E508 80011508 38800000 */  li        r4, 0x0
/* 00E50C 8001150C 38A00001 */  li        r5, 0x1
/* 00E510 80011510 38C00002 */  li        r6, 0x2
/* 00E514 80011514 38E00003 */  li        r7, 0x3
/* 00E518 80011518 4809B3A5 */  bl        GXSetTevSwapModeTable
/* 00E51C 8001151C BB6100DC */  lmw       r27, 0xdc(r1)
/* 00E520 80011520 800100F4 */  lwz       r0, 0xf4(r1)
/* 00E524 80011524 382100F0 */  addi      r1, r1, 0xf0
/* 00E528 80011528 7C0803A6 */  mtlr      r0
/* 00E52C 8001152C 4E800020 */  blr

glabel THPGXYuv2RgbDraw
/* 00E530 80011530 7C0802A6 */  mflr      r0
/* 00E534 80011534 90010004 */  stw       r0, 0x4(r1)
/* 00E538 80011538 9421FF60 */  stwu      r1, -0xa0(r1)
/* 00E53C 8001153C BF010080 */  stmw      r24, 0x80(r1)
/* 00E540 80011540 3B880000 */  addi      r28, r8, 0x0
/* 00E544 80011544 3BA90000 */  addi      r29, r9, 0x0
/* 00E548 80011548 AB6100AA */  lha       r27, 0xaa(r1)
/* 00E54C 8001154C 3B040000 */  addi      r24, r4, 0x0
/* 00E550 80011550 3B250000 */  addi      r25, r5, 0x0
/* 00E554 80011554 3BC60000 */  addi      r30, r6, 0x0
/* 00E558 80011558 3BE70000 */  addi      r31, r7, 0x0
/* 00E55C 8001155C 3B4A0000 */  addi      r26, r10, 0x0
/* 00E560 80011560 38830000 */  addi      r4, r3, 0x0
/* 00E564 80011564 38BC0000 */  addi      r5, r28, 0x0
/* 00E568 80011568 38DD0000 */  addi      r6, r29, 0x0
/* 00E56C 8001156C 38610060 */  addi      r3, r1, 0x60
/* 00E570 80011570 38E00001 */  li        r7, 0x1
/* 00E574 80011574 39000000 */  li        r8, 0x0
/* 00E578 80011578 39200000 */  li        r9, 0x0
/* 00E57C 8001157C 39400000 */  li        r10, 0x0
/* 00E580 80011580 48099DD9 */  bl        GXInitTexObj
/* 00E584 80011584 C022808C */  lfs       f1, D_8018BFCC@sda21(r0)
/* 00E588 80011588 38610060 */  addi      r3, r1, 0x60
/* 00E58C 8001158C 38800000 */  li        r4, 0x0
/* 00E590 80011590 FC400890 */  fmr       f2, f1
/* 00E594 80011594 38A00000 */  li        r5, 0x0
/* 00E598 80011598 FC600890 */  fmr       f3, f1
/* 00E59C 8001159C 38C00000 */  li        r6, 0x0
/* 00E5A0 800115A0 38E00000 */  li        r7, 0x0
/* 00E5A4 800115A4 39000000 */  li        r8, 0x0
/* 00E5A8 800115A8 4809A06D */  bl        fn_800AB614
/* 00E5AC 800115AC 38610060 */  addi      r3, r1, 0x60
/* 00E5B0 800115B0 38800000 */  li        r4, 0x0
/* 00E5B4 800115B4 4809A3A1 */  bl        GXLoadTexObj
/* 00E5B8 800115B8 7F800734 */  extsh     r0, r28
/* 00E5BC 800115BC 7C1C0E70 */  srawi     r28, r0, 1
/* 00E5C0 800115C0 7FA00734 */  extsh     r0, r29
/* 00E5C4 800115C4 7C1D0E70 */  srawi     r29, r0, 1
/* 00E5C8 800115C8 38980000 */  addi      r4, r24, 0x0
/* 00E5CC 800115CC 38610040 */  addi      r3, r1, 0x40
/* 00E5D0 800115D0 5785043E */  clrlwi    r5, r28, 16
/* 00E5D4 800115D4 57A6043E */  clrlwi    r6, r29, 16
/* 00E5D8 800115D8 38E00001 */  li        r7, 0x1
/* 00E5DC 800115DC 39000000 */  li        r8, 0x0
/* 00E5E0 800115E0 39200000 */  li        r9, 0x0
/* 00E5E4 800115E4 39400000 */  li        r10, 0x0
/* 00E5E8 800115E8 48099D71 */  bl        GXInitTexObj
/* 00E5EC 800115EC C022808C */  lfs       f1, D_8018BFCC@sda21(r0)
/* 00E5F0 800115F0 38610040 */  addi      r3, r1, 0x40
/* 00E5F4 800115F4 38800000 */  li        r4, 0x0
/* 00E5F8 800115F8 FC400890 */  fmr       f2, f1
/* 00E5FC 800115FC 38A00000 */  li        r5, 0x0
/* 00E600 80011600 FC600890 */  fmr       f3, f1
/* 00E604 80011604 38C00000 */  li        r6, 0x0
/* 00E608 80011608 38E00000 */  li        r7, 0x0
/* 00E60C 8001160C 39000000 */  li        r8, 0x0
/* 00E610 80011610 4809A005 */  bl        fn_800AB614
/* 00E614 80011614 38610040 */  addi      r3, r1, 0x40
/* 00E618 80011618 38800001 */  li        r4, 0x1
/* 00E61C 8001161C 4809A339 */  bl        GXLoadTexObj
/* 00E620 80011620 38990000 */  addi      r4, r25, 0x0
/* 00E624 80011624 38610020 */  addi      r3, r1, 0x20
/* 00E628 80011628 5785043E */  clrlwi    r5, r28, 16
/* 00E62C 8001162C 57A6043E */  clrlwi    r6, r29, 16
/* 00E630 80011630 38E00001 */  li        r7, 0x1
/* 00E634 80011634 39000000 */  li        r8, 0x0
/* 00E638 80011638 39200000 */  li        r9, 0x0
/* 00E63C 8001163C 39400000 */  li        r10, 0x0
/* 00E640 80011640 48099D19 */  bl        GXInitTexObj
/* 00E644 80011644 C022808C */  lfs       f1, D_8018BFCC@sda21(r0)
/* 00E648 80011648 38610020 */  addi      r3, r1, 0x20
/* 00E64C 8001164C 38800000 */  li        r4, 0x0
/* 00E650 80011650 FC400890 */  fmr       f2, f1
/* 00E654 80011654 38A00000 */  li        r5, 0x0
/* 00E658 80011658 FC600890 */  fmr       f3, f1
/* 00E65C 8001165C 38C00000 */  li        r6, 0x0
/* 00E660 80011660 38E00000 */  li        r7, 0x0
/* 00E664 80011664 39000000 */  li        r8, 0x0
/* 00E668 80011668 48099FAD */  bl        fn_800AB614
/* 00E66C 8001166C 38610020 */  addi      r3, r1, 0x20
/* 00E670 80011670 38800002 */  li        r4, 0x2
/* 00E674 80011674 4809A2E1 */  bl        GXLoadTexObj
/* 00E678 80011678 38600080 */  li        r3, 0x80
/* 00E67C 8001167C 38800007 */  li        r4, 0x7
/* 00E680 80011680 38A00004 */  li        r5, 0x4
/* 00E684 80011684 480988E9 */  bl        GXBegin
/* 00E688 80011688 3CC0CC01 */  lis       r6, 0xcc01
/* 00E68C 8001168C B3C68000 */  sth       r30, -0x8000(r6)
/* 00E690 80011690 7FE00734 */  extsh     r0, r31
/* 00E694 80011694 7CE0DA14 */  add       r7, r0, r27
/* 00E698 80011698 B3E68000 */  sth       r31, -0x8000(r6)
/* 00E69C 8001169C 38A00000 */  li        r5, 0x0
/* 00E6A0 800116A0 7FC30734 */  extsh     r3, r30
/* 00E6A4 800116A4 B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6A8 800116A8 7F400734 */  extsh     r0, r26
/* 00E6AC 800116AC 7C030214 */  add       r0, r3, r0
/* 00E6B0 800116B0 B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6B4 800116B4 7C040734 */  extsh     r4, r0
/* 00E6B8 800116B8 38600001 */  li        r3, 0x1
/* 00E6BC 800116BC B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6C0 800116C0 7CE00734 */  extsh     r0, r7
/* 00E6C4 800116C4 B0868000 */  sth       r4, -0x8000(r6)
/* 00E6C8 800116C8 B3E68000 */  sth       r31, -0x8000(r6)
/* 00E6CC 800116CC B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6D0 800116D0 B0668000 */  sth       r3, -0x8000(r6)
/* 00E6D4 800116D4 B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6D8 800116D8 B0868000 */  sth       r4, -0x8000(r6)
/* 00E6DC 800116DC B0068000 */  sth       r0, -0x8000(r6)
/* 00E6E0 800116E0 B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6E4 800116E4 B0668000 */  sth       r3, -0x8000(r6)
/* 00E6E8 800116E8 B0668000 */  sth       r3, -0x8000(r6)
/* 00E6EC 800116EC B3C68000 */  sth       r30, -0x8000(r6)
/* 00E6F0 800116F0 B0068000 */  sth       r0, -0x8000(r6)
/* 00E6F4 800116F4 B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6F8 800116F8 B0A68000 */  sth       r5, -0x8000(r6)
/* 00E6FC 800116FC B0668000 */  sth       r3, -0x8000(r6)
/* 00E700 80011700 800100A4 */  lwz       r0, 0xa4(r1)
/* 00E704 80011704 BB010080 */  lmw       r24, 0x80(r1)
/* 00E708 80011708 382100A0 */  addi      r1, r1, 0xa0
/* 00E70C 8001170C 7C0803A6 */  mtlr      r0
/* 00E710 80011710 4E800020 */  blr

# 0x8018BFB8 - 0x8018BFE0
.section .sdata2, "a"

glabel D_8018BFB8
	.long 0xFFA60000
	.long 0xFF8E0087

glabel D_8018BFC0
	.long 0x0000E258

glabel D_8018BFC4
	.long 0xB30000B6

glabel D_8018BFC8
	.long 0xFF00FF80

glabel D_8018BFCC
	.float 0

glabel D_8018BFD0
	.float -1

glabel D_8018BFD4
	.float 1

glabel D_8018BFD8
	.double 4503601774854144
