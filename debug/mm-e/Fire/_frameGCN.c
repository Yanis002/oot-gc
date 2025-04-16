/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\_frameGCN.c
    Producer: MW EABI PPC C-Compiler
    Language: C89
    Code range: 0x80021D94 -> 0x8002C374
*/

#include "types.h"

// Erased
static f32 guMtxXFM1F_dol3(f32 (* mf)[4], enum _GXProjectionType type, f32 zc) {
    // Parameters
    // f32 (* mf)[4]; // r1+0x0
    // enum _GXProjectionType type; // r1+0x4
    // f32 zc; // r1+0x8

    // Local variables
    f32 ze; // f1
}

// Erased
static s32 frameSetProjection(struct __anon_0x294AC* pFrame, s32 iHint) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // s32 iHint; // r1+0xC

    // Local variables
    struct __anon_0x292F5* pHint; // r1+0x8
}

// Range: 0x8002C240 -> 0x8002C374
static s32 frameDrawSetupFog_MarioKart(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8

    // Local variables
    enum _GXFogType nFogType; // r1+0x8
    f32 rNear; // f3
    f32 rFar; // f4
    u32 nMode; // r1+0x8
    u32 iHint; // r6
    f32 rFogNear; // f3
    f32 rFogFar; // f4
    f32 rFogMin; // f5
    f32 rFogMax; // f2
    f32 rMultiplier; // f2
    f32 dplane; // f6
}

// Range: 0x8002C10C -> 0x8002C240
static s32 frameDrawSetupFog_StarFox(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8

    // Local variables
    enum _GXFogType nFogType; // r1+0x8
    f32 rNear; // f3
    f32 rFar; // f4
    u32 nMode; // r1+0x8
    u32 iHint; // r6
    f32 rFogNear; // f3
    f32 rFogFar; // f4
    f32 rFogMin; // f5
    f32 rFogMax; // f2
    f32 rMultiplier; // f2
    f32 dplane; // f6
}

// Range: 0x8002BC00 -> 0x8002C10C
static s32 frameDrawSetupFog_Zelda1(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8

    // Local variables
    struct _GXColor fogColor; // r1+0x40
    enum _GXFogType nFogType; // r5
    f32 rNear; // r1+0x8
    f32 rFar; // f2
    u32 nMode; // r1+0x8
    u32 iHint; // r9
    f32 rFogNear; // f3
    f32 rFogFar; // f4
    f32 rFogMin; // f9
    f32 rFogMax; // f2
    f32 rMultiplier; // f5
    f32 rOffset; // f7
    f32 rMinimum; // f1
    f32 rMaximum; // f5
    f32 dplane; // f6
    f32 dplane; // f5
    f32 dplane; // f5
    f32 dplane; // f5
    f32 dval; // f2
    f32 dminmax; // f10
    f32 rDMinMax; // f8
    f32 val1; // f6
    f32 dplane; // f6
    f32 rFarScale; // f9
    f32 rNearScale; // f5

    // References
    // -> f32 gRealProjectionMtx[4][4];
    // -> enum _GXProjectionType gRealProjectionType;
    // -> f32 gFarVal;
    // -> f32 gNearVal;
    // -> struct __anon_0x2BA1D* gpSystem;
}

// Range: 0x8002B8FC -> 0x8002BC00
static s32 frameDrawSetupFog_Default(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31

    // Local variables
    s32 iHint; // r6
    f32 rNear; // f31
    f32 rFar; // f30
    f32 rFOVY; // f29
    f32 matrixProjection[4][4]; // r1+0x34
    struct _GXFogAdjTable fogTable; // r1+0x20
    f32 rMax; // f2
    f32 rMin; // r1+0x8
    f32 rIntpV; // f4
    f32 rMinimum; // r1+0x8
    f32 rMultiplier; // f3
    f32 rOffset; // r1+0x8
}

// Range: 0x8002B8E4 -> 0x8002B8FC
static void frameDrawSyncCallback(u16 nToken) {
    // Parameters
    // u16 nToken; // r1+0x0

    // References
    // -> static s32 sCopyFrameSyncReceived;
}

// Erased
static s32 frameSetVertexArray() {}

// Range: 0x8002B868 -> 0x8002B8E4
static void frameDrawDone() {
    // References
    // -> s32 gNoSwapBuffer;
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> static s32 gbFrameValid;
}

// Erased
static void* AllocateWrapper(u32 size) {
    // Parameters
    // u32 size; // r1+0x8

    // Local variables
    void* tempP; // r1+0xC
}

// Erased
static void* DeallocateWrapper(void* dataP) {
    // Parameters
    // void* dataP; // r1+0x8
}

// Erased
static void __DEMODoneRender() {
    // References
    // -> void* DemoCurrentBuffer;
}

// Range: 0x8002B6FC -> 0x8002B868
static s32 frameMakeTLUT(struct __anon_0x294AC* pFrame, struct _FRAME_TEXTURE* pTexture, s32 nCount, s32 nOffsetTMEM, s32 bReload) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct _FRAME_TEXTURE* pTexture; // r28
    // s32 nCount; // r30
    // s32 nOffsetTMEM; // r31
    // s32 bReload; // r1+0x18

    // Local variables
    s32 iColor; // r5
    u16* anColor; // r3
    u16 nData16; // r1+0x8
}

// Erased
static s32 frameFreeTLUT(struct __anon_0x294AC* pFrame, struct _FRAME_TEXTURE* pTexture) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x0
    // struct _FRAME_TEXTURE* pTexture; // r1+0x4
}

// Range: 0x80029D08 -> 0x8002B6FC
static s32 frameMakePixels(struct __anon_0x294AC* pFrame, struct _FRAME_TEXTURE* pTexture, struct __anon_0x29033* pTile, s32 bReload) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r19
    // struct _FRAME_TEXTURE* pTexture; // r16
    // struct __anon_0x29033* pTile; // r26
    // s32 bReload; // r17

    // Local variables
    void* aPixel; // r24
    s32 nSizeLine; // r18
    s32 nFlip; // r9
    s32 nSize; // r1+0x40
    s32 nCount; // r1+0x8
    s32 nMode; // r1+0x8
    s32 nSizeX; // r30
    s32 nSizeY; // r15
    s32 nSource; // r10
    s32 nTarget; // r11
    s32 iPixelX; // r3
    s32 iPixelY; // r20
    s32 iTarget; // r1+0x8
    u8 nData8; // r31
    u16 nData16; // r31
    u32 nData32; // r31
    s32 nSizeTextureX; // r1+0x8
    s32 nSizeTextureY; // r26
    s32 lineX; // r1+0x8
    s32 lineY; // r1+0x8
    s32 linePixX; // r4
    s32 lineStep; // r5
    s32 tmemStart; // r21
    s32 tmemEnd; // r23
    s32 __nSizeX; // r5
    s32 __nSizeY; // r6
    u32 rgb[3]; // r1+0x24
    u32 yuv[3]; // r1+0x18

    // References
    // -> static u8 sRemapI$798[8];
}

// Erased
static s32 frameFreePixels(struct __anon_0x294AC* pFrame, struct _FRAME_TEXTURE* pTexture) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct _FRAME_TEXTURE* pTexture; // r31
}

// Range: 0x80029A2C -> 0x80029D08
static s32 frameLoadTexture(struct __anon_0x294AC* pFrame, struct _FRAME_TEXTURE* pTexture, s32 iTextureCode, struct __anon_0x29033* pTile) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r26
    // struct _FRAME_TEXTURE* pTexture; // r27
    // s32 iTextureCode; // r1+0x18
    // struct __anon_0x29033* pTile; // r1+0x1C

    // Local variables
    void* pData; // r4
    s32 iName; // r30
    s32 nFilter; // r4
    enum _GXTexWrapMode eWrapS; // r29
    enum _GXTexWrapMode eWrapT; // r28

    // References
    // -> enum _GXTexMapID ganNamePixel[8];
    // -> u32 ganNameColor[8];
}

// Range: 0x80029814 -> 0x80029A2C
s32 frameDrawSetup2D(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31

    // Local variables
    f32 matrix44[4][4]; // r1+0x10

    // References
    // -> static s32 snScissorChanged;
    // -> static u32 snScissorHeight;
    // -> static u32 snScissorWidth;
    // -> static u32 snScissorYOrig;
    // -> static u32 snScissorXOrig;
    // -> struct __anon_0x2BA1D* gpSystem;
}

// Range: 0x80028E10 -> 0x80029814
static s32 frameDrawSetupSP(struct __anon_0x294AC* pFrame, s32* pnColors, s32* pbFlag, s32 nVertexCount) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r28
    // s32* pnColors; // r29
    // s32* pbFlag; // r30
    // s32 nVertexCount; // r31

    // Local variables
    f32 rValue23; // f6
    s32 bTextureGen; // r21
    f32 rNear; // f26
    f32 rFar; // f27
    f32 rScaleS; // f25
    f32 rScaleT; // f24
    f32 rSlideS; // f4
    f32 rSlideT; // f2
    s32 nColors; // r20
    s32 bFlag; // r19
    s32 iTile; // r18
    s32 iHint; // r1+0x8
    f32 matrixA[3][4]; // r1+0xCC
    f32 matrixB[3][4]; // r1+0x9C
    f32 matrix44[4][4]; // r1+0x5C
    f32 matrixProjection[4][4]; // r1+0x1C
    enum _GXProjectionType eTypeProjection; // r4
    f32 scale; // r1+0x8
    s32 nCount; // r17
    s32 iIndex; // r7

    // References
    // -> u32 ganNameTexMtx[8];
    // -> f32 gTextureMatrix[8][3][4];
    // -> struct _FRAME_TEXTURE* gpTexture[8];
    // -> enum _GXProjectionType gRealProjectionType;
    // -> f32 gRealProjectionMtx[4][4];
    // -> f32 gFarVal;
    // -> f32 gNearVal;
    // -> static s32 snScissorChanged;
    // -> static u32 snScissorWidth;
    // -> static u32 snScissorHeight;
    // -> static u32 snScissorYOrig;
    // -> static u32 snScissorXOrig;
}

// Range: 0x80028D14 -> 0x80028E10
static s32 frameGetCombineColor(enum _GXTevColorArg* pnColorTEV, s32 nColorN64) {
    // Parameters
    // enum _GXTevColorArg* pnColorTEV; // r1+0x4
    // s32 nColorN64; // r1+0x8
}

// Range: 0x80028C84 -> 0x80028D14
static s32 frameGetCombineAlpha(enum _GXTevAlphaArg* pnAlphaTEV, s32 nAlphaN64) {
    // Parameters
    // enum _GXTevAlphaArg* pnAlphaTEV; // r1+0x4
    // s32 nAlphaN64; // r1+0x8
}

// Range: 0x80028770 -> 0x80028C84
static s32 frameDrawSetupDP(struct __anon_0x294AC* pFrame, s32* pnColors, s32* pbFlag) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // s32* pnColors; // r1+0xC
    // s32* pbFlag; // r1+0x10

    // Local variables
    u32 nMode; // r1+0x8
    s32 numCycles; // r30
    u32 mode; // r1+0x8
    u32 cycle; // r4

    // References
    // -> struct __anon_0x2BA1D* gpSystem;
}

// Range: 0x80028638 -> 0x80028770
static s32 frameDrawTriangle_C0T0(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 iData; // r6
    u8* anData; // r7
    struct __anon_0x28D37* pVertex; // r3
}

// Range: 0x8002849C -> 0x80028638
static s32 frameDrawTriangle_C1T0(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 iData; // r10
    u8* anData; // r11
    struct __anon_0x28D37* pVertex; // r1+0x8
    struct __anon_0x28D37* pVertexColor; // r3
}

// Range: 0x800282E0 -> 0x8002849C
static s32 frameDrawTriangle_C3T0(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 iData; // r9
    u8* anData; // r10
    struct __anon_0x28D37* pVertex; // r8
}

// Range: 0x80028154 -> 0x800282E0
static s32 frameDrawTriangle_C0T3(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 iData; // r6
    u8* anData; // r7
    struct __anon_0x28D37* pVertex; // r3
}

// Range: 0x80027F64 -> 0x80028154
static s32 frameDrawTriangle_C1T3(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 iData; // r10
    u8* anData; // r11
    struct __anon_0x28D37* pVertex; // r1+0x8
    struct __anon_0x28D37* pVertexColor; // r3
}

// Range: 0x800270A0 -> 0x80027F64
static s32 frameCheckTriangleDivide(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r22
    // struct __anon_0x31C30* pPrimitive; // r23

    // Local variables
    s32 iData; // r25
    u8* anData; // r24
    struct __anon_0x28D37 aNewVertArray[8]; // r1+0x184
    f32 fInterp; // r1+0x8
    f32 fTempColor1; // f2
    f32 fTempColor2; // f3
    u32 nNewVertCount; // r5
    u32 bInFront; // r7
    u32 bBehind; // r8
}

// Range: 0x80026EFC -> 0x800270A0
static s32 frameDrawTriangle_C3T3(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    f32 (* pMatrix)[4]; // r3

    // References
    // -> static u32 gHackCreditsColor;
    // -> struct __anon_0x2BA1D* gpSystem;
}

// Range: 0x80026E20 -> 0x80026EFC
static s32 frameDrawTriangle_Setup(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 bFlag; // r1+0x14
    s32 nColors; // r1+0x10

    // References
    // -> static s32 (* gapfDrawTriangle[8])(void*, void*);
}

// Range: 0x80026CAC -> 0x80026E20
static s32 frameDrawLine_C0T0(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    s32 iData; // r6
    u8* anData; // r31
    struct __anon_0x28D37* pVertex; // r3
}

// Range: 0x80026AE4 -> 0x80026CAC
static s32 frameDrawLine_C1T0(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    s32 iData; // r10
    u8* anData; // r31
    struct __anon_0x28D37* pVertex; // r1+0x8
    struct __anon_0x28D37* pVertexColor; // r3
}

// Range: 0x8002690C -> 0x80026AE4
static s32 frameDrawLine_C2T0(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    s32 iData; // r8
    u8* anData; // r31
    struct __anon_0x28D37* pVertex; // r9
}

// Range: 0x80026754 -> 0x8002690C
static s32 frameDrawLine_C0T2(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    s32 iData; // r6
    u8* anData; // r31
    struct __anon_0x28D37* pVertex; // r3
}

// Range: 0x80026548 -> 0x80026754
static s32 frameDrawLine_C1T2(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    s32 iData; // r10
    u8* anData; // r31
    struct __anon_0x28D37* pVertex; // r1+0x8
    struct __anon_0x28D37* pVertexColor; // r3
}

// Range: 0x8002632C -> 0x80026548
static s32 frameDrawLine_C2T2(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r29
    // struct __anon_0x31C30* pPrimitive; // r30

    // Local variables
    s32 iData; // r8
    u8* anData; // r31
    struct __anon_0x28D37* pVertex; // r9
}

// Range: 0x80026250 -> 0x8002632C
static s32 frameDrawLine_Setup(struct __anon_0x294AC* pFrame, struct __anon_0x31C30* pPrimitive) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x31C30* pPrimitive; // r31

    // Local variables
    s32 bFlag; // r1+0x14
    s32 nColors; // r1+0x10

    // References
    // -> static s32 (* gapfDrawLine[6])(void*, void*);
}

// Range: 0x80025FBC -> 0x80026250
static s32 frameDrawRectFill(struct __anon_0x294AC* pFrame, struct __anon_0x2FA23* pRectangle) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8
    // struct __anon_0x2FA23* pRectangle; // r1+0xC

    // Local variables
    s32 bFlag; // r8
    f32 rDepth; // f31
    f32 rX0; // f30
    f32 rY0; // f29
    f32 rX1; // f28
    f32 rY1; // f27
}

// Range: 0x80025F0C -> 0x80025FBC
static s32 frameDrawRectFill_Setup(struct __anon_0x294AC* pFrame, struct __anon_0x2FA23* pRectangle) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x2FA23* pRectangle; // r31

    // Local variables
    s32 bFlag; // r1+0x14
    s32 nColors; // r1+0x10
}

// Range: 0x800259D8 -> 0x80025F0C
static s32 frameDrawRectTexture(struct __anon_0x294AC* pFrame, struct __anon_0x2FA23* pRectangle) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8
    // struct __anon_0x2FA23* pRectangle; // r31

    // Local variables
    s32 bCopy; // r7
    f32 rDeltaT; // f1
    f32 rX0; // f31
    f32 rY0; // f30
    f32 rX1; // f29
    f32 rY1; // f28
    f32 rS0; // f27
    f32 rT0; // f26
    f32 rS1; // f25
    f32 rT1; // f24

    // References
    // -> static s32 gnCountMapHack;
    // -> struct __anon_0x2BA1D* gpSystem;
    // -> static u8 sSpecialZeldaHackON;
}

// Range: 0x8002566C -> 0x800259D8
static s32 frameDrawRectTexture_Setup(struct __anon_0x294AC* pFrame, struct __anon_0x2FA23* pRectangle) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r22
    // struct __anon_0x2FA23* pRectangle; // r23

    // Local variables
    f32 matrixA[3][4]; // r1+0x48
    f32 matrixB[3][4]; // r1+0x18
    f32 rScaleS; // f29
    f32 rScaleT; // f28
    f32 rSlideS; // f2
    f32 rSlideT; // r1+0x8
    u32 bFlag; // r1+0x14
    u32 nColors; // r1+0x10
    s32 iTile; // r25
    s32 firstTile; // r3
    s32 nCount; // r24
    s32 iIndex; // r8

    // References
    // -> u32 ganNameTexMtx[8];
    // -> f32 gTextureMatrix[8][3][4];
    // -> struct _FRAME_TEXTURE* gpTexture[8];
    // -> static u8 sSpecialZeldaHackON;
}

// Erased
static s32 frameTick() {}

// Erased
static s32 frameDraw() {}

// Erased
static void CopyZBuffer() {}

// Range: 0x80025664 -> 0x8002566C
s32 frameShow() {}

// Erased
static s32 frameHide() {}

// Range: 0x8002553C -> 0x80025664
s32 frameSetScissor(struct __anon_0x294AC* pFrame, struct __anon_0x2FA23* pScissor) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8
    // struct __anon_0x2FA23* pScissor; // r1+0xC

    // Local variables
    s32 nTemp; // r1+0x8
    s32 nX0; // r3
    s32 nY0; // r4
    s32 nX1; // r5
    s32 nY1; // r6
}

// Erased
static s32 frameGetScissor() {}

// Range: 0x8002552C -> 0x8002553C
s32 frameSetDepth(struct __anon_0x294AC* pFrame, f32 rDepth, f32 rDelta) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x0
    // f32 rDepth; // r1+0x4
    // f32 rDelta; // r1+0x8
}

// Range: 0x80025430 -> 0x8002552C
s32 frameSetColor(struct __anon_0x294AC* pFrame, enum __anon_0x31B7D eType, u32 nRGBA) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // enum __anon_0x31B7D eType; // r30
    // u32 nRGBA; // r1+0x10
}

// Range: 0x80025414 -> 0x80025430
s32 frameBeginOK() {
    // References
    // -> static s32 gbFrameValid;
}

// Range: 0x80025184 -> 0x80025414
s32 frameBegin(struct __anon_0x294AC* pFrame, s32 nCountVertex) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // s32 nCountVertex; // r28

    // Local variables
    s32 i; // r28
    f32 matrix[3][4]; // r1+0x14

    // References
    // -> enum _GXTexCoordID ganNameTexCoord[8];
    // -> u32 ganNameTexMtx[8];
    // -> static s32 gbFrameValid;
    // -> static s32 gbFrameBegin;
}

// Range: 0x80024FC4 -> 0x80025184
s32 frameEnd(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30

    // Local variables
    struct _CPU* pCPU; // r31
    s32 iHint; // r7
    void* pData; // r29

    // References
    // -> struct __anon_0x2BA1D* gpSystem;
    // -> void* DemoCurrentBuffer;
    // -> static u16 sTempZBuf[4800][4][4];
    // -> static s32 gbFrameValid;
    // -> static s32 gbFrameBegin;
}

// Range: 0x80024E9C -> 0x80024FC4
s32 _frameDrawRectangle(struct __anon_0x294AC* pFrame, u32 nColor, s32 nX, s32 nY, s32 nSizeX, s32 nSizeY) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x0
    // u32 nColor; // r1+0x4
    // s32 nX; // r11
    // s32 nY; // r1+0xC
    // s32 nSizeX; // r7
    // s32 nSizeY; // r1+0x14

    // Local variables
    s32 iY; // r10
    s32 iX; // r11
    u32* pnPixel; // r3
    s32 nSizeTargetX; // r9

    // References
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> void* DemoCurrentBuffer;
}

// Erased
static s32 _frameDrawImage(struct __anon_0x294AC* pFrame, u16* pnImage, s32 nSizeX, s32 nSizeY, s32 nX0, s32 nY0, s32 bAlpha) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8
    // u16* pnImage; // r1+0xC
    // s32 nSizeX; // r1+0x10
    // s32 nSizeY; // r1+0x14
    // s32 nX0; // r1+0x18
    // s32 nY0; // r1+0x1C
    // s32 bAlpha; // r1+0x20

    // Local variables
    s32 iY; // r30
    s32 iX; // r1+0x8
    s32 nSizeTargetX; // r30
    u32* pnPixel; // r3
    u32* aPixel; // r29
    u32 nPixelSource; // r7
    u32 nPixelTarget; // r29

    // References
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> void* DemoCurrentBuffer;
}

// Erased
static void ZeldaDrawFrameNoBlend(struct __anon_0x294AC* pFrame, u16* pData) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r3
    // u16* pData; // r30

    // Local variables
    f32 matrix[3][4]; // r1+0x30

    // References
    // -> static struct _GXTexObj sFrameObj$1587;
}

// Range: 0x80024BB8 -> 0x80024E9C
void ZeldaDrawFrameBlur(struct __anon_0x294AC* pFrame, u16* pData) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // u16* pData; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    struct _GXColor color; // r1+0x14

    // References
    // -> static struct _GXTexObj sFrameObj$1588;
}

// Range: 0x800248D8 -> 0x80024BB8
void ZeldaDrawFrame(struct __anon_0x294AC* pFrame, u16* pData) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // u16* pData; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    struct _GXColor color; // r1+0x14

    // References
    // -> static struct _GXTexObj sFrameObj$1591;
}

// Erased
static void CopyCFBAlpha(u8* srcP) {
    // Parameters
    // u8* srcP; // r31

    // References
    // -> static s32 sCopyFrameSyncReceived;
}

// Range: 0x80024848 -> 0x800248D8
void CopyCFB(u16* srcP) {
    // Parameters
    // u16* srcP; // r31

    // References
    // -> static s32 sCopyFrameSyncReceived;
}

// Erased
static void ConvertCFB(u16* srcP) {
    // Parameters
    // u16* srcP; // r29

    // Local variables
    u16* dataEndP; // r30
    s32 tile; // r6
    s32 y; // r7
    s32 x; // r1+0x8
    u16 val; // r1+0x8

    // References
    // -> static u16 line$1605[80][4][4];
}

// Range: 0x80024504 -> 0x80024848
void CopyAndConvertCFB(u16* srcP) {
    // Parameters
    // u16* srcP; // r29

    // Local variables
    u16* dataEndP; // r30
    s32 tile; // r6
    s32 y; // r7
    s32 x; // r1+0x8
    u16 val; // r1+0x8

    // References
    // -> static u16 line$1629[80][4][4];
    // -> static s32 sCopyFrameSyncReceived;
}

// Range: 0x80024458 -> 0x80024504
void CopyZValue(u32* ptr) {
    // Parameters
    // u32* ptr; // r31

    // References
    // -> struct _GXRenderModeObj* rmode;
}

// Range: 0x80024324 -> 0x80024458
void frameCopyLensTexture(struct __anon_0x294AC* pFrame, struct __anon_0x2FA23* pRectangle) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x2FA23* pRectangle; // r31

    // Local variables
    void* originalDataP; // r1+0x8

    // References
    // -> static struct LensTexture sLensTex;
    // -> struct _FRAME_TEXTURE* gpTexture[8];
    // -> f32 gTextureMatrix[8][3][4];
}

// Range: 0x80023E18 -> 0x80024324
void WriteZValue(struct __anon_0x294AC* pFrame, u32* ptr) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r27
    // u32* ptr; // r28

    // Local variables
    s32 x; // r1+0x5C
    f32 matrix[3][4]; // r1+0x2C

    // References
    // -> struct _GXRenderModeObj* rmode;
    // -> static struct LensTexture sLensTex;
    // -> static struct _GXTexObj texObj$1646;
    // -> enum _GXTexCoordID ganNameTexCoord[8];
    // -> u32 ganNameTexMtx[8];
}

// Range: 0x80023A88 -> 0x80023E18
static void ZeldaGreyScaleConvert(struct __anon_0x294AC* pFrame) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    void* dataP; // r29
    struct _GXColor color; // r1+0x10

    // References
    // -> static struct _GXTexObj sFrameObj$1659;
    // -> static u8 cAlpha$1660;
    // -> static u32 gHackCreditsColor;
    // -> void* DemoCurrentBuffer;
}

// Erased
static void ZeldaCopyFrameHiRes(void* pSrc) {
    // Parameters
    // void* pSrc; // r31

    // References
    // -> static s32 sCopyFrameSyncReceived;
}

// Erased
static void ZeldaDrawFrameHiRes(struct __anon_0x294AC* pFrame, void* pSrc) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // void* pSrc; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    struct _GXColor color; // r1+0x14

    // References
    // -> static struct _GXTexObj sFrameObj$1672;
}

// Range: 0x8002357C -> 0x80023A88
void ZeldaDrawFrameShrink(struct __anon_0x294AC* pFrame, s32 posX, s32 posY, s32 size) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // s32 posX; // r1+0xC
    // s32 posY; // r1+0x10
    // s32 size; // r1+0x14

    // Local variables
    f32 matrix[3][4]; // r1+0x24
    f32 nX0; // f31
    f32 nX1; // f30
    f32 nY0; // f29
    f32 nY1; // f28
    f32 scale; // f4
    void* frameBuffer; // r26
    struct _GXColor color; // r1+0x20

    // References
    // -> static struct _GXTexObj frameObj$1675;
    // -> void* DemoCurrentBuffer;
}

// Range: 0x80023530 -> 0x8002357C
void ZeldaEraseCamera() {
    // Local variables
    struct __anon_0x294AC* pFrame; // r3

    // References
    // -> struct __anon_0x2BA1D* gpSystem;
}

// Erased
static void ZeldaCopyCamera(u8* buffer) {
    // Parameters
    // u8* buffer; // r31
}

// Range: 0x80023134 -> 0x80023530
void ZeldaDrawFrameCamera(struct __anon_0x294AC* pFrame, void* buffer) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // void* buffer; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x1C
    struct _GXColor color; // r1+0x18
    f32 nX0; // f31
    f32 nY0; // f30
    f32 nX1; // f29
    f32 nY1; // f28
    f32 width; // f2
    f32 height; // f3

    // References
    // -> static struct _GXTexObj frameObj$1685;
}

// Range: 0x80022F6C -> 0x80023134
s32 frameHackTIMG_Zelda(struct __anon_0x294AC* pFrame, u64** pnGBI, u32* pnCommandLo, u32* pnCommandHi) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r3
    // u64** pnGBI; // r30
    // u32* pnCommandLo; // r31
    // u32* pnCommandHi; // r1+0x14

    // Local variables
    u32 i; // r7

    // References
    // -> static u32 sDestinationBuffer;
    // -> struct __anon_0x2BA1D* gpSystem;
    // -> static u32 sSrcBuffer;
    // -> static u8 sSpecialZeldaHackON;
    // -> static u32 sCommandCodes$1698[8];
}

// Range: 0x80022A00 -> 0x80022F6C
s32 frameHackCIMG_Zelda2(struct __anon_0x294AC* pFrame, struct __anon_0x28911* pBuffer, u64* pnGBI) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x28911* pBuffer; // r31
    // u64* pnGBI; // r1+0x10

    // Local variables
    u32 i; // r7
    u32* pGBI; // r8
    u32* pGBI; // r7

    // References
    // -> static s32 sCopyFrameSyncReceived;
    // -> s32 gNoSwapBuffer;
    // -> static s32 nLastFrame$1714;
    // -> static s32 nCopyFrame$1716;
    // -> static u32 sCommandCodes2$1740[10];
    // -> static u32 sCommandCodes$1721[10];
}

// Range: 0x800225C0 -> 0x80022A00
s32 frameHackCIMG_Zelda(struct __anon_0x294AC* pFrame, struct __anon_0x28911* pBuffer, u64* pnGBI, u32 nCommandLo) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8
    // struct __anon_0x28911* pBuffer; // r28
    // u64* pnGBI; // r1+0x10
    // u32 nCommandLo; // r29

    // Local variables
    u32 i; // r30
    u32 low2; // r1+0x8
    u32 high2; // r1+0x8
    u16* srcP; // r1+0x20
    u16* val; // r27
    u16* valEnd; // r29
    s32 tile; // r6
    s32 y; // r7
    s32 x; // r1+0x8
    u8* val; // r3
    u8* valEnd; // r4

    // References
    // -> static u16 tempLine$1800[16][4][4];
    // -> static s32 sCopyFrameSyncReceived;
    // -> s32 gNoSwapBuffer;
    // -> static u32 sNumAddr;
    // -> static u32 sConstantBufAddr[6];
    // -> static s32 gnCountMapHack;
    // -> static u32 sSrcBuffer;
    // -> static u32 sDestinationBuffer;
    // -> struct __anon_0x2BA1D* gpSystem;
}

// Range: 0x80022458 -> 0x800225C0
s32 frameHackCIMG_Zelda2_Shrink(struct __anon_0x2CE13* pRDP, struct __anon_0x294AC* pFrame, u64** ppnGBI) {
    // Parameters
    // struct __anon_0x2CE13* pRDP; // r1+0x8
    // struct __anon_0x294AC* pFrame; // r27
    // u64** ppnGBI; // r28

    // Local variables
    u64* pnGBI; // r30
    s32 count; // r8
    s32 nAddress; // r4
    u32 nCommandLo; // r6
    u32 nCommandHi; // r1+0x8
    struct __anon_0x2DF94* pRSP; // r29
    s32 done; // r3
    union __anon_0x2F457 bg; // r1+0x18

    // References
    // -> static u32 GBIcode$1831[3];
}

// Range: 0x8002234C -> 0x80022458
s32 frameHackCIMG_Zelda2_Camera(struct __anon_0x294AC* pFrame, struct __anon_0x28911* pBuffer, u32 nCommandHi, u32 nCommandLo) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r30
    // struct __anon_0x28911* pBuffer; // r1+0xC
    // u32 nCommandHi; // r1+0x10
    // u32 nCommandLo; // r1+0x14
}

// Erased
static void PanelDrawBG8(u16* BG, u16* LUT, u8* bitmap, s32 sizeX, s32 sizeY, s32 posX, s32 posY, s32 flip) {
    // Parameters
    // u16* BG; // r1+0x8
    // u16* LUT; // r1+0xC
    // u8* bitmap; // r1+0x10
    // s32 sizeX; // r1+0x14
    // s32 sizeY; // r1+0x18
    // s32 posX; // r1+0x1C
    // s32 posY; // r1+0x20
    // s32 flip; // r1+0x24

    // Local variables
    s32 i; // r28
    s32 j; // r27
    u16 color; // r1+0x8
}

// Erased
static void PanelDrawBG16(u16* BG, u16* bitmap, s32 sizeX, s32 sizeY, s32 posX, s32 posY, s32 flip) {
    // Parameters
    // u16* BG; // r1+0x8
    // u16* bitmap; // r1+0xC
    // s32 sizeX; // r1+0x10
    // s32 sizeY; // r1+0x14
    // s32 posX; // r1+0x18
    // s32 posY; // r1+0x1C
    // s32 flip; // r1+0x20

    // Local variables
    s32 i; // r29
    s32 j; // r28
    u16 color; // r1+0x8
}

// Erased
static void PanelDrawFR3D(u16* FR, u16* LUT, u8* bitmap, s32 sizeX, s32 sizeY, s32 posX, s32 posY, s32 first) {
    // Parameters
    // u16* FR; // r1+0x8
    // u16* LUT; // r1+0xC
    // u8* bitmap; // r1+0x10
    // s32 sizeX; // r1+0x14
    // s32 sizeY; // r1+0x18
    // s32 posX; // r1+0x1C
    // s32 posY; // r1+0x20
    // s32 first; // r1+0x24

    // Local variables
    s32 i; // r30
    s32 j; // r1+0x8
    u16 color; // r29
}

// Range: 0x800220DC -> 0x8002234C
s32 frameGetDepth(struct __anon_0x294AC* pFrame, u16* pnData, s32 nAddress) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r1+0x8
    // u16* pnData; // r1+0xC
    // s32 nAddress; // r1+0x10

    // Local variables
    u32 nX; // r7
    u32 nY; // r8
    u32 nOffset; // r1+0x8
    s32 n64CalcValue; // r6
    s32 exp; // r7
    s32 mantissa; // r1+0x8
    s32 compare; // r3
    s32 val; // r7
    struct __anon_0x2CD99 z_format[8]; // r1+0x14

    // References
    // -> static u16 sTempZBuf[4800][4][4];
}

// Range: 0x80021D94 -> 0x800220DC
static s32 frameEvent(struct __anon_0x294AC* pFrame, s32 nEvent) {
    // Parameters
    // struct __anon_0x294AC* pFrame; // r31
    // s32 nEvent; // r1+0xC

    // References
    // -> struct __anon_0x2BA1D* gpSystem;
    // -> static s32 gnCountMapHack;
    // -> static s32 gbFrameValid;
    // -> static s32 gbFrameBegin;
}
