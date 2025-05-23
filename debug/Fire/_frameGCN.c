/*
    Compile unit: C:\HOMEBOY\STEPHEN\Japanese Ocarina\Fire\_frameGCN.c
    Producer: MW EABI PPC C-Compiler
    Language: C89
    Code range: 0x80021204 -> 0x8002CA14
*/

#include "dolphin/types.h"

// Erased
static int frameSetProjection(struct __anon_0x24C38* pFrame, int iHint) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // int iHint; // r1+0xC

    // Local variables
    struct __anon_0x24A81* pHint; // r1+0x8
}

// Range: 0x8002C67C -> 0x8002CA14
static int frameDrawSetupFog_Zelda1(struct __anon_0x24C38* pFrame) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x8

    // Local variables
    enum _GXFogType nFogType; // r5
    f32 rNear; // r1+0x8
    f32 rFar; // f2
    unsigned int nMode; // r1+0x8
    unsigned int iHint; // r8
    f32 rFogNear; // f3
    f32 rFogFar; // f4
    f32 rFogMin; // f1
    f32 rFogMax; // f2
    f32 rMultiplier; // f6
    f32 rOffset; // f7
    f32 rMinimum; // f1
    f32 rMaximum; // f9
    f32 dplane; // f6
    f32 dplane; // f5
    f32 dplane; // f5
    f32 dplane; // f5
    f32 dplane; // f5
    f32 rFarScale; // f8
    f32 rNearScale; // f10

    // References
    // -> struct __anon_0x26A4E* gpSystem;
}

// Range: 0x8002C378 -> 0x8002C67C
static int frameDrawSetupFog_Default(struct __anon_0x24C38* pFrame) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31

    // Local variables
    int iHint; // r6
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

// Range: 0x8002C360 -> 0x8002C378
static void frameDrawSyncCallback(u16 nToken) {
    // Parameters
    // u16 nToken; // r1+0x0

    // References
    // -> static int sCopyFrameSyncReceived;
}

// Erased
static int frameSetVertexArray() {}

// Range: 0x8002C2E4 -> 0x8002C360
static void frameDrawDone() {
    // References
    // -> int gNoSwapBuffer;
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> static int gbFrameValid;
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

// Range: 0x8002C178 -> 0x8002C2E4
static int frameMakeTLUT(struct __anon_0x24C38* pFrame, struct _FRAME_TEXTURE* pTexture, int nCount, int nOffsetTMEM,
                         int bReload) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct _FRAME_TEXTURE* pTexture; // r28
    // int nCount; // r30
    // int nOffsetTMEM; // r31
    // int bReload; // r1+0x18

    // Local variables
    int iColor; // r5
    u16* anColor; // r3
    u16 nData16; // r1+0x8
}

// Erased
static int frameFreeTLUT(struct __anon_0x24C38* pFrame, struct _FRAME_TEXTURE* pTexture) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x0
    // struct _FRAME_TEXTURE* pTexture; // r1+0x4
}

// Range: 0x8002A784 -> 0x8002C178
static int frameMakePixels(struct __anon_0x24C38* pFrame, struct _FRAME_TEXTURE* pTexture, struct __anon_0x247BF* pTile,
                           int bReload) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r19
    // struct _FRAME_TEXTURE* pTexture; // r16
    // struct __anon_0x247BF* pTile; // r26
    // int bReload; // r17

    // Local variables
    void* aPixel; // r24
    int nSizeLine; // r18
    int nFlip; // r9
    int nSize; // r1+0x40
    int nCount; // r1+0x8
    int nMode; // r1+0x8
    int nSizeX; // r30
    int nSizeY; // r15
    int nSource; // r10
    int nTarget; // r11
    int iPixelX; // r3
    int iPixelY; // r20
    int iTarget; // r1+0x8
    u8 nData8; // r31
    u16 nData16; // r31
    unsigned int nData32; // r31
    int nSizeTextureX; // r1+0x8
    int nSizeTextureY; // r26
    s32 lineX; // r1+0x8
    s32 lineY; // r1+0x8
    s32 linePixX; // r4
    s32 lineStep; // r5
    s32 tmemStart; // r21
    s32 tmemEnd; // r23
    int __nSizeX; // r5
    int __nSizeY; // r6
    unsigned int rgb[3]; // r1+0x24
    unsigned int yuv[3]; // r1+0x18

    // References
    // -> static u8 sRemapI$746[8];
}

// Erased
static int frameFreePixels(struct __anon_0x24C38* pFrame, struct _FRAME_TEXTURE* pTexture) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct _FRAME_TEXTURE* pTexture; // r31
}

// Range: 0x8002A4A8 -> 0x8002A784
static int frameLoadTexture(struct __anon_0x24C38* pFrame, struct _FRAME_TEXTURE* pTexture, int iTextureCode,
                            struct __anon_0x247BF* pTile) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r26
    // struct _FRAME_TEXTURE* pTexture; // r27
    // int iTextureCode; // r1+0x18
    // struct __anon_0x247BF* pTile; // r1+0x1C

    // Local variables
    void* pData; // r4
    int iName; // r30
    int nFilter; // r4
    enum _GXTexWrapMode eWrapS; // r29
    enum _GXTexWrapMode eWrapT; // r28

    // References
    // -> enum _GXTexMapID ganNamePixel[8];
    // -> u32 ganNameColor[8];
}

// Range: 0x8002A2FC -> 0x8002A4A8
int frameDrawSetup2D(struct __anon_0x24C38* pFrame) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31

    // Local variables
    f32 matrix44[4][4]; // r1+0x10

    // References
    // -> static int snScissorChanged;
    // -> static u32 snScissorHeight;
    // -> static u32 snScissorWidth;
    // -> static u32 snScissorYOrig;
    // -> static u32 snScissorXOrig;
}

// Range: 0x80029948 -> 0x8002A2FC
static int frameDrawSetupSP(struct __anon_0x24C38* pFrame, int* pnColors, int* pbFlag, int nVertexCount) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r28
    // int* pnColors; // r29
    // int* pbFlag; // r30
    // int nVertexCount; // r31

    // Local variables
    f32 rValue23; // f1
    int bTextureGen; // r22
    f32 rNear; // f24
    f32 rFar; // f4
    f32 rScaleS; // f25
    f32 rScaleT; // f24
    f32 rSlideS; // f4
    f32 rSlideT; // f2
    struct _FRAME_TEXTURE* pTexture[8]; // r1+0x12C
    int nColors; // r21
    int bFlag; // r20
    int iTile; // r19
    int iHint; // r1+0x8
    f32 matrix[3][4]; // r1+0xFC
    f32 matrixA[3][4]; // r1+0xCC
    f32 matrixB[3][4]; // r1+0x9C
    f32 matrix44[4][4]; // r1+0x5C
    f32 matrixProjection[4][4]; // r1+0x1C
    enum _GXProjectionType eTypeProjection; // r4
    f32 scale; // r1+0x8
    int nCount; // r18
    int iIndex; // r6

    // References
    // -> u32 ganNameTexMtx[8];
    // -> static int snScissorChanged;
    // -> static u32 snScissorWidth;
    // -> static u32 snScissorHeight;
    // -> static u32 snScissorYOrig;
    // -> static u32 snScissorXOrig;
}

// Range: 0x8002984C -> 0x80029948
static int frameGetCombineColor(enum _GXTevColorArg* pnColorTEV, int nColorN64) {
    // Parameters
    // enum _GXTevColorArg* pnColorTEV; // r1+0x4
    // int nColorN64; // r1+0x8
}

// Range: 0x800297BC -> 0x8002984C
static int frameGetCombineAlpha(enum _GXTevAlphaArg* pnAlphaTEV, int nAlphaN64) {
    // Parameters
    // enum _GXTevAlphaArg* pnAlphaTEV; // r1+0x4
    // int nAlphaN64; // r1+0x8
}

// Range: 0x80029250 -> 0x800297BC
static int frameDrawSetupDP(struct __anon_0x24C38* pFrame, int* pnColors, int* pbFlag) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // int* pnColors; // r1+0xC
    // int* pbFlag; // r1+0x10

    // Local variables
    unsigned int nMode; // r1+0x8
    s32 numCycles; // r30
    u32 mode; // r1+0x8
    u32 cycle; // r4

    // References
    // -> struct __anon_0x26A4E* gpSystem;
}

// Range: 0x80029118 -> 0x80029250
static int frameDrawTriangle_C0T0(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int iData; // r6
    u8* anData; // r7
    struct __anon_0x23FC4* pVertex; // r3
}

// Range: 0x80028F7C -> 0x80029118
static int frameDrawTriangle_C1T0(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int iData; // r10
    u8* anData; // r11
    struct __anon_0x23FC4* pVertex; // r1+0x8
    struct __anon_0x23FC4* pVertexColor; // r3
}

// Range: 0x80028DC0 -> 0x80028F7C
static int frameDrawTriangle_C3T0(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int iData; // r9
    u8* anData; // r10
    struct __anon_0x23FC4* pVertex; // r8
}

// Range: 0x80028C34 -> 0x80028DC0
static int frameDrawTriangle_C0T3(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int iData; // r6
    u8* anData; // r7
    struct __anon_0x23FC4* pVertex; // r3
}

// Range: 0x80028A44 -> 0x80028C34
static int frameDrawTriangle_C1T3(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int iData; // r10
    u8* anData; // r11
    struct __anon_0x23FC4* pVertex; // r1+0x8
    struct __anon_0x23FC4* pVertexColor; // r3
}

// Range: 0x80027B80 -> 0x80028A44
static int frameCheckTriangleDivide(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r22
    // struct __anon_0x2D45B* pPrimitive; // r23

    // Local variables
    int iData; // r25
    u8* anData; // r24
    struct __anon_0x23FC4 aNewVertArray[8]; // r1+0x184
    f32 fInterp; // r1+0x8
    f32 fTempColor1; // f2
    f32 fTempColor2; // f3
    unsigned int nNewVertCount; // r5
    unsigned int bInFront; // r7
    unsigned int bBehind; // r8
}

// Range: 0x800279DC -> 0x80027B80
static int frameDrawTriangle_C3T3(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    f32(*pMatrix)[4]; // r3

    // References
    // -> static unsigned int gHackCreditsColor;
    // -> struct __anon_0x26A4E* gpSystem;
}

// Range: 0x80027900 -> 0x800279DC
static int frameDrawTriangle_Setup(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int bFlag; // r1+0x14
    int nColors; // r1+0x10

    // References
    // -> static int (* gapfDrawTriangle[8])(void*, void*);
}

// Range: 0x8002778C -> 0x80027900
static int frameDrawLine_C0T0(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    int iData; // r6
    u8* anData; // r31
    struct __anon_0x23FC4* pVertex; // r3
}

// Range: 0x800275C4 -> 0x8002778C
static int frameDrawLine_C1T0(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    int iData; // r10
    u8* anData; // r31
    struct __anon_0x23FC4* pVertex; // r1+0x8
    struct __anon_0x23FC4* pVertexColor; // r3
}

// Range: 0x800273EC -> 0x800275C4
static int frameDrawLine_C2T0(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    int iData; // r8
    u8* anData; // r31
    struct __anon_0x23FC4* pVertex; // r9
}

// Range: 0x80027234 -> 0x800273EC
static int frameDrawLine_C0T2(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    int iData; // r6
    u8* anData; // r31
    struct __anon_0x23FC4* pVertex; // r3
}

// Range: 0x80027028 -> 0x80027234
static int frameDrawLine_C1T2(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    int iData; // r10
    u8* anData; // r31
    struct __anon_0x23FC4* pVertex; // r1+0x8
    struct __anon_0x23FC4* pVertexColor; // r3
}

// Range: 0x80026E0C -> 0x80027028
static int frameDrawLine_C2T2(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r29
    // struct __anon_0x2D45B* pPrimitive; // r30

    // Local variables
    int iData; // r8
    u8* anData; // r31
    struct __anon_0x23FC4* pVertex; // r9
}

// Range: 0x80026D30 -> 0x80026E0C
static int frameDrawLine_Setup(struct __anon_0x24C38* pFrame, struct __anon_0x2D45B* pPrimitive) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D45B* pPrimitive; // r31

    // Local variables
    int bFlag; // r1+0x14
    int nColors; // r1+0x10

    // References
    // -> static int (* gapfDrawLine[6])(void*, void*);
}

// Range: 0x80026A9C -> 0x80026D30
static int frameDrawRectFill(struct __anon_0x24C38* pFrame, struct __anon_0x2D2B6* pRectangle) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x8
    // struct __anon_0x2D2B6* pRectangle; // r1+0xC

    // Local variables
    int bFlag; // r8
    f32 rDepth; // f31
    f32 rX0; // f30
    f32 rY0; // f29
    f32 rX1; // f28
    f32 rY1; // f27
}

// Range: 0x800269EC -> 0x80026A9C
static int frameDrawRectFill_Setup(struct __anon_0x24C38* pFrame, struct __anon_0x2D2B6* pRectangle) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D2B6* pRectangle; // r31

    // Local variables
    int bFlag; // r1+0x14
    int nColors; // r1+0x10
}

// Range: 0x80026514 -> 0x800269EC
static int frameDrawRectTexture(struct __anon_0x24C38* pFrame, struct __anon_0x2D2B6* pRectangle) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x2D2B6* pRectangle; // r31

    // Local variables
    int bCopy; // r11
    f32 rDepth; // f31
    f32 rDeltaT; // f5
    f32 rX0; // f30
    f32 rY0; // f29
    f32 rX1; // f28
    f32 rY1; // f27
    f32 rS0; // f26
    f32 rT0; // f25
    f32 rS1; // f24
    f32 rT1; // f23

    // References
    // -> static int gnCountMapHack;
    // -> struct __anon_0x26A4E* gpSystem;
    // -> static u8 sSpecialZeldaHackON;
    // -> static int nCounter$1367;
}

// Range: 0x80026124 -> 0x80026514
static int frameDrawRectTexture_Setup(struct __anon_0x24C38* pFrame, struct __anon_0x2D2B6* pRectangle) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r22
    // struct __anon_0x2D2B6* pRectangle; // r23

    // Local variables
    f32 matrix[3][4]; // r1+0x98
    f32 matrixA[3][4]; // r1+0x68
    f32 matrixB[3][4]; // r1+0x38
    struct _FRAME_TEXTURE* pTexture[8]; // r1+0x18
    f32 rScaleS; // f29
    f32 rScaleT; // f28
    f32 rSlideS; // f2
    f32 rSlideT; // r1+0x8
    unsigned int bFlag; // r1+0x14
    unsigned int nColors; // r1+0x10
    int iTile; // r25
    int firstTile; // r3
    int nCount; // r24
    int iIndex; // r6
    char cTempAlpha; // r20

    // References
    // -> static int bSkip$1410;
    // -> struct __anon_0x26A4E* gpSystem;
    // -> u32 ganNameTexMtx[8];
    // -> static u8 sSpecialZeldaHackON;
}

// Erased
static int frameTick() {}

// Erased
static int frameDraw() {}

// Erased
static void CopyZBuffer() {}

// Range: 0x8002611C -> 0x80026124
int frameShow() {}

// Erased
static int frameHide() {}

// Range: 0x80025FF4 -> 0x8002611C
int frameSetScissor(struct __anon_0x24C38* pFrame, struct __anon_0x2D2B6* pScissor) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x8
    // struct __anon_0x2D2B6* pScissor; // r1+0xC

    // Local variables
    int nTemp; // r1+0x8
    int nX0; // r3
    int nY0; // r4
    int nX1; // r5
    int nY1; // r6
}

// Erased
static int frameGetScissor() {}

// Range: 0x80025FE4 -> 0x80025FF4
int frameSetDepth(struct __anon_0x24C38* pFrame, f32 rDepth, f32 rDelta) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x0
    // f32 rDepth; // r1+0x4
    // f32 rDelta; // r1+0x8
}

// Range: 0x80025EE8 -> 0x80025FE4
int frameSetColor(struct __anon_0x24C38* pFrame, enum __anon_0x2D223 eType, unsigned int nRGBA) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // enum __anon_0x2D223 eType; // r30
    // unsigned int nRGBA; // r1+0x10
}

// Range: 0x80025ECC -> 0x80025EE8
int frameBeginOK() {
    // References
    // -> static int gbFrameValid;
}

// Range: 0x80025C40 -> 0x80025ECC
int frameBegin(struct __anon_0x24C38* pFrame, int nCountVertex) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // int nCountVertex; // r28

    // Local variables
    s32 i; // r28
    f32 matrix[3][4]; // r1+0x14

    // References
    // -> enum _GXTexCoordID ganNameTexCoord[8];
    // -> u32 ganNameTexMtx[8];
    // -> static int gbFrameValid;
    // -> static int gbFrameBegin;
}

// Range: 0x800259B8 -> 0x80025C40
int frameEnd(struct __anon_0x24C38* pFrame) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30

    // Local variables
    struct _CPU* pCPU; // r31
    int iHint; // r7
    void* pData; // r29

    // References
    // -> struct __anon_0x26A4E* gpSystem;
    // -> void* DemoCurrentBuffer;
    // -> static int sCopyFrameSyncReceived;
    // -> static u16 sTempZBuf[4800][4][4];
    // -> static int gbFrameValid;
    // -> static int gbFrameBegin;
}

// Range: 0x80025890 -> 0x800259B8
int _frameDrawRectangle(struct __anon_0x24C38* pFrame, unsigned int nColor, int nX, int nY, int nSizeX, int nSizeY) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x0
    // unsigned int nColor; // r1+0x4
    // int nX; // r11
    // int nY; // r1+0xC
    // int nSizeX; // r7
    // int nSizeY; // r1+0x14

    // Local variables
    int iY; // r10
    int iX; // r11
    unsigned int* pnPixel; // r3
    int nSizeTargetX; // r9

    // References
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> void* DemoCurrentBuffer;
}

// Erased
static int _frameDrawImage(struct __anon_0x24C38* pFrame, u16* pnImage, int nSizeX, int nSizeY, int nX0, int nY0,
                           int bAlpha) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x8
    // u16* pnImage; // r1+0xC
    // int nSizeX; // r1+0x10
    // int nSizeY; // r1+0x14
    // int nX0; // r1+0x18
    // int nY0; // r1+0x1C
    // int bAlpha; // r1+0x20

    // Local variables
    int iY; // r30
    int iX; // r1+0x8
    int nSizeTargetX; // r30
    unsigned int* pnPixel; // r3
    unsigned int* aPixel; // r29
    unsigned int nPixelSource; // r7
    unsigned int nPixelTarget; // r29

    // References
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> void* DemoCurrentBuffer;
}

// Erased
static void ZeldaDrawFrameZTexture(struct __anon_0x24C38* pFrame, unsigned int* pData) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r3
    // unsigned int* pData; // r30

    // Local variables
    f32 matrix[3][4]; // r1+0x30

    // References
    // -> static struct _GXTexObj sFrameObj1$1562;
}

// Range: 0x8002569C -> 0x80025890
void ZeldaDrawFrameNoBlend(struct __anon_0x24C38* pFrame, u16* pData) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r3
    // u16* pData; // r30

    // Local variables
    f32 matrix[3][4]; // r1+0x30

    // References
    // -> static struct _GXTexObj sFrameObj$1564;
}

// Range: 0x800253B8 -> 0x8002569C
void ZeldaDrawFrameBlur(struct __anon_0x24C38* pFrame, u16* pData) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // u16* pData; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    struct _GXColor color; // r1+0x14

    // References
    // -> static struct _GXTexObj sFrameObj$1565;
}

// Range: 0x800250D8 -> 0x800253B8
void ZeldaDrawFrame(struct __anon_0x24C38* pFrame, u16* pData) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // u16* pData; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    struct _GXColor color; // r1+0x14

    // References
    // -> static struct _GXTexObj sFrameObj$1568;
}

// Erased
static void CopyCFBAlpha(u8* srcP) {
    // Parameters
    // u8* srcP; // r31

    // References
    // -> static int sCopyFrameSyncReceived;
}

// Erased
static void CopyCFBZTexture(unsigned int* srcP) {
    // Parameters
    // unsigned int* srcP; // r31

    // References
    // -> static int sCopyFrameSyncReceived;
}

// Erased
static void ConvertZ(u16* srcP) {
    // Parameters
    // u16* srcP; // r29

    // Local variables
    u16* dataEndP; // r30
    s32 tile; // r7
    s32 y; // r8
    s32 x; // r1+0x8
    u16 val; // r9

    // References
    // -> static u32 line$1582[80][4][4];
}

// Erased
static void CopyCFB(u16* srcP) {
    // Parameters
    // u16* srcP; // r31

    // References
    // -> static int sCopyFrameSyncReceived;
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
    // -> static u16 line$1606[80][4][4];
}

// Range: 0x80024D94 -> 0x800250D8
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
    // -> static u16 line$1630[80][4][4];
    // -> static int sCopyFrameSyncReceived;
}

// Range: 0x80024A04 -> 0x80024D94
static void ZeldaGreyScaleConvert(struct __anon_0x24C38* pFrame) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    void* dataP; // r29
    struct _GXColor color; // r1+0x10

    // References
    // -> static struct _GXTexObj sFrameObj$1647;
    // -> static u8 cAlpha$1648;
    // -> static unsigned int gHackCreditsColor;
    // -> void* DemoCurrentBuffer;
}

// Erased
static void ZeldaCopyFrameHiRes(void* pSrc) {
    // Parameters
    // void* pSrc; // r31

    // References
    // -> static int sCopyFrameSyncReceived;
}

// Erased
static void ZeldaDrawFrameHiRes(struct __anon_0x24C38* pFrame, void* pSrc) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // void* pSrc; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x38
    struct _GXColor color; // r1+0x14

    // References
    // -> static struct _GXTexObj sFrameObj$1660;
}

// Range: 0x800244F8 -> 0x80024A04
void ZeldaDrawFrameShrink(struct __anon_0x24C38* pFrame, int posX, int posY, int size) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // int posX; // r1+0xC
    // int posY; // r1+0x10
    // int size; // r1+0x14

    // Local variables
    f32 matrix[3][4]; // r1+0x28
    f32 nX0; // f31
    f32 nX1; // f30
    f32 nY0; // f29
    f32 nY1; // f28
    f32 scale; // f4
    void* frameBuffer; // r26
    struct _GXColor color; // r1+0x20

    // References
    // -> static struct _GXTexObj frameObj$1663;
    // -> void* DemoCurrentBuffer;
}

// Erased
static void ZeldaCopyCamera(u16* buffer) {
    // Parameters
    // u16* buffer; // r31
}

// Range: 0x80024204 -> 0x800244F8
void ZeldaDrawFrameCamera(struct __anon_0x24C38* pFrame, void* buffer) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // void* buffer; // r29

    // Local variables
    f32 matrix[3][4]; // r1+0x30
    struct _GXColor color; // r1+0x2C

    // References
    // -> static struct _GXTexObj frameObj$1673;
}

// Range: 0x8002403C -> 0x80024204
int frameHackTIMG_Zelda(struct __anon_0x24C38* pFrame, u64** pnGBI, unsigned int* pnCommandLo,
                        unsigned int* pnCommandHi) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r3
    // u64** pnGBI; // r30
    // unsigned int* pnCommandLo; // r31
    // unsigned int* pnCommandHi; // r1+0x14

    // Local variables
    unsigned int i; // r7

    // References
    // -> static unsigned int sDestinationBuffer;
    // -> struct __anon_0x26A4E* gpSystem;
    // -> static unsigned int sSrcBuffer;
    // -> static u8 sSpecialZeldaHackON;
    // -> static u32 sCommandCodes$1679[8];
}

// Range: 0x800239E4 -> 0x8002403C
int frameHackCIMG_Zelda2(struct __anon_0x24C38* pFrame, struct __anon_0x23B9E* pBuffer, u64* pnGBI) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x23B9E* pBuffer; // r31
    // u64* pnGBI; // r1+0x10

    // Local variables
    unsigned int i; // r7
    u32* pGBI; // r8

    // References
    // -> static int sCopyFrameSyncReceived;
    // -> int gNoSwapBuffer;
    // -> static int nLastFrame$1695;
    // -> static int nCopyFrame$1697;
    // -> static u32 sCommandCodes2$1722[10];
    // -> static u32 sCommandCodes$1702[10];
}

// Range: 0x800235A4 -> 0x800239E4
int frameHackCIMG_Zelda(struct __anon_0x24C38* pFrame, struct __anon_0x23B9E* pBuffer, u64* pnGBI,
                        unsigned int nCommandLo) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x8
    // struct __anon_0x23B9E* pBuffer; // r28
    // u64* pnGBI; // r1+0x10
    // unsigned int nCommandLo; // r29

    // Local variables
    unsigned int i; // r30
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
    // -> static u16 tempLine$1785[16][4][4];
    // -> static int sCopyFrameSyncReceived;
    // -> int gNoSwapBuffer;
    // -> static unsigned int sNumAddr;
    // -> static unsigned int sConstantBufAddr[6];
    // -> static int gnCountMapHack;
    // -> static unsigned int sSrcBuffer;
    // -> static unsigned int sDestinationBuffer;
    // -> struct __anon_0x26A4E* gpSystem;
}

// Range: 0x80023430 -> 0x800235A4
int frameHackCIMG_Zelda2_Shrink(struct __anon_0x2865F* pRDP, struct __anon_0x24C38* pFrame, u64** ppnGBI) {
    // Parameters
    // struct __anon_0x2865F* pRDP; // r1+0x8
    // struct __anon_0x24C38* pFrame; // r27
    // u64** ppnGBI; // r28

    // Local variables
    u64* pnGBI; // r30
    int count; // r8
    int nAddress; // r4
    unsigned int nCommandLo; // r6
    unsigned int nCommandHi; // r1+0x8
    struct __anon_0x297E0* pRSP; // r29
    int done; // r3
    union __anon_0x2ACA3 bg; // r1+0x18

    // References
    // -> static unsigned int GBIcode$1816[3];
}

// Range: 0x800232FC -> 0x80023430
int frameHackCIMG_Zelda2_Camera(struct __anon_0x24C38* pFrame, struct __anon_0x23B9E* pBuffer, unsigned int nCommandHi,
                                unsigned int nCommandLo) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // struct __anon_0x23B9E* pBuffer; // r1+0xC
    // unsigned int nCommandHi; // r1+0x10
    // unsigned int nCommandLo; // r1+0x14
}

// Range: 0x80023250 -> 0x800232FC
void PanelDrawBG8(u16* BG, u16* LUT, u8* bitmap, int sizeX, int sizeY, int posX, int posY, int flip) {
    // Parameters
    // u16* BG; // r1+0x8
    // u16* LUT; // r1+0xC
    // u8* bitmap; // r1+0x10
    // int sizeX; // r1+0x14
    // int sizeY; // r1+0x18
    // int posX; // r1+0x1C
    // int posY; // r1+0x20
    // int flip; // r1+0x24

    // Local variables
    int i; // r28
    int j; // r27
    u16 color; // r1+0x8
}

// Range: 0x80023194 -> 0x80023250
void PanelDrawBG16(u16* BG, u16* bitmap, int sizeX, int sizeY, int posX, int posY, int flip) {
    // Parameters
    // u16* BG; // r1+0x8
    // u16* bitmap; // r1+0xC
    // int sizeX; // r1+0x10
    // int sizeY; // r1+0x14
    // int posX; // r1+0x18
    // int posY; // r1+0x1C
    // int flip; // r1+0x20

    // Local variables
    int i; // r29
    int j; // r28
    u16 color; // r1+0x8
}

// Range: 0x800230E0 -> 0x80023194
void PanelDrawFR3D(u16* FR, u16* LUT, u8* bitmap, int sizeX, int sizeY, int posX, int posY, int first) {
    // Parameters
    // u16* FR; // r1+0x8
    // u16* LUT; // r1+0xC
    // u8* bitmap; // r1+0x10
    // int sizeX; // r1+0x14
    // int sizeY; // r1+0x18
    // int posX; // r1+0x1C
    // int posY; // r1+0x20
    // int first; // r1+0x24

    // Local variables
    int i; // r30
    int j; // r1+0x8
    u16 color; // r29
}

// Range: 0x8002303C -> 0x800230E0
int frameHackTIMG_Panel(struct __anon_0x24C38* pFrame, struct __anon_0x23B9E* pBuffer) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x0
    // struct __anon_0x23B9E* pBuffer; // r1+0x4
}

// Range: 0x800217F8 -> 0x8002303C
int frameHackCIMG_Panel(struct __anon_0x2865F* pRDP, struct __anon_0x24C38* pFrame, struct __anon_0x23B9E* pBuffer,
                        u64** ppnGBI) {
    // Parameters
    // struct __anon_0x2865F* pRDP; // r29
    // struct __anon_0x24C38* pFrame; // r30
    // struct __anon_0x23B9E* pBuffer; // r17
    // u64** ppnGBI; // r14

    // Local variables
    struct __anon_0x297E0* pRSP; // r17
    u64* pnGBI; // r20
    int count; // r8
    int nAddress; // r5
    int sizeX; // r6
    unsigned int nCommandLo; // r7
    unsigned int nCommandHi; // r3
    u16* BG; // r18
    u16* FR; // r28
    u16* pLUT; // r16
    u16* pBitmap16; // r4
    u8* pBitmap8; // r5
    int iTile; // r5
    int nCount; // r4
    struct __anon_0x247BF* pTile; // r5
    int iTile; // r1+0x8
    int nCount; // r4
    int iTile; // r5
    int nCount; // r4
    union __anon_0x2ACA3 bg; // r1+0x50
    union __anon_0x2B091 objTxtr; // r1+0x38
    unsigned int nLoadType; // r1+0x34
    struct __anon_0x23B9E* pBG; // r18

    // References
    // -> static unsigned int GBIcode2D2$1906[7];
    // -> static unsigned int GBIcode3D2$1908[6];
    // -> static unsigned int GBIcode3D1$1907[5];
}

// Range: 0x80021588 -> 0x800217F8
int frameGetDepth(struct __anon_0x24C38* pFrame, u16* pnData, int nAddress) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r1+0x8
    // u16* pnData; // r1+0xC
    // int nAddress; // r1+0x10

    // Local variables
    unsigned int nX; // r7
    unsigned int nY; // r8
    unsigned int nOffset; // r1+0x8
    s32 n64CalcValue; // r6
    int exp; // r7
    int mantissa; // r1+0x8
    s32 compare; // r3
    s32 val; // r7
    struct __anon_0x285E5 z_format[8]; // r1+0x14

    // References
    // -> static u16 sTempZBuf[4800][4][4];
}

// Range: 0x80021204 -> 0x80021588
static int frameEvent(struct __anon_0x24C38* pFrame, int nEvent) {
    // Parameters
    // struct __anon_0x24C38* pFrame; // r31
    // int nEvent; // r1+0xC

    // References
    // -> struct __anon_0x26A4E* gpSystem;
    // -> static int gnCountMapHack;
    // -> static int gbFrameValid;
    // -> static int gbFrameBegin;
}
