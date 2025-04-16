/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\_frameGCNcc.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8009B6D4 -> 0x8009BFDC
*/

#include "types.h"

typedef enum _GXTevColorArg {
    GX_CC_CPREV = 0,
    GX_CC_APREV = 1,
    GX_CC_C0 = 2,
    GX_CC_A0 = 3,
    GX_CC_C1 = 4,
    GX_CC_A1 = 5,
    GX_CC_C2 = 6,
    GX_CC_A2 = 7,
    GX_CC_TEXC = 8,
    GX_CC_TEXA = 9,
    GX_CC_RASC = 10,
    GX_CC_RASA = 11,
    GX_CC_ONE = 12,
    GX_CC_HALF = 13,
    GX_CC_KONST = 14,
    GX_CC_ZERO = 15,
    GX_CC_TEXRRR = 16,
    GX_CC_TEXGGG = 17,
    GX_CC_TEXBBB = 18,
    GX_CC_QUARTER = 14,
} __anon_0x8A0AE;

// size = 0x40, address = 0x800F9730
enum _GXTevColorArg gCombinedColor[16];

typedef enum _GXTevAlphaArg {
    GX_CA_APREV = 0,
    GX_CA_A0 = 1,
    GX_CA_A1 = 2,
    GX_CA_A2 = 3,
    GX_CA_TEXA = 4,
    GX_CA_RASA = 5,
    GX_CA_KONST = 6,
    GX_CA_ZERO = 7,
    GX_CA_ONE = 6,
} __anon_0x8A250;

// size = 0x20, address = 0x800F9770
enum _GXTevAlphaArg gCombinedAlpha[8];

typedef enum _GXTevStageID {
    GX_TEVSTAGE0 = 0,
    GX_TEVSTAGE1 = 1,
    GX_TEVSTAGE2 = 2,
    GX_TEVSTAGE3 = 3,
    GX_TEVSTAGE4 = 4,
    GX_TEVSTAGE5 = 5,
    GX_TEVSTAGE6 = 6,
    GX_TEVSTAGE7 = 7,
    GX_TEVSTAGE8 = 8,
    GX_TEVSTAGE9 = 9,
    GX_TEVSTAGE10 = 10,
    GX_TEVSTAGE11 = 11,
    GX_TEVSTAGE12 = 12,
    GX_TEVSTAGE13 = 13,
    GX_TEVSTAGE14 = 14,
    GX_TEVSTAGE15 = 15,
    GX_MAX_TEVSTAGE = 16,
} __anon_0x8A349;

// size = 0x40, address = 0x800F9790
static enum _GXTevStageID ganNameTevStage[16];

// size = 0x5, address = 0x80140E38
static u8 sOrder[5];

typedef enum _GXTevOp {
    GX_TEV_ADD = 0,
    GX_TEV_SUB = 1,
    GX_TEV_COMP_R8_GT = 8,
    GX_TEV_COMP_R8_EQ = 9,
    GX_TEV_COMP_GR16_GT = 10,
    GX_TEV_COMP_GR16_EQ = 11,
    GX_TEV_COMP_BGR24_GT = 12,
    GX_TEV_COMP_BGR24_EQ = 13,
    GX_TEV_COMP_RGB8_GT = 14,
    GX_TEV_COMP_RGB8_EQ = 15,
    GX_TEV_COMP_A8_GT = 14,
    GX_TEV_COMP_A8_EQ = 15,
} __anon_0x8A52E;

typedef enum _GXTevBias {
    GX_TB_ZERO = 0,
    GX_TB_ADDHALF = 1,
    GX_TB_SUBHALF = 2,
    GX_MAX_TEVBIAS = 3,
} __anon_0x8A659;

typedef enum _GXTevScale {
    GX_CS_SCALE_1 = 0,
    GX_CS_SCALE_2 = 1,
    GX_CS_SCALE_4 = 2,
    GX_CS_DIVIDE_2 = 3,
    GX_MAX_TEVSCALE = 4,
} __anon_0x8A6C4;

typedef enum _GXTevRegID {
    GX_TEVPREV = 0,
    GX_TEVREG0 = 1,
    GX_TEVREG1 = 2,
    GX_TEVREG2 = 3,
    GX_MAX_TEVREG = 4,
} __anon_0x8A747;

typedef struct TevColorOp {
    /* 0x00 */ enum _GXTevOp op;
    /* 0x04 */ enum _GXTevBias bias;
    /* 0x08 */ enum _GXTevScale scale;
    /* 0x0C */ u8 clamp;
    /* 0x10 */ enum _GXTevRegID out_reg;
} __anon_0x8A7BB; // size = 0x14

// size = 0x64, address = 0x800F97D0
static struct TevColorOp sTevColorOp[5];

// size = 0x5, address = 0x80140E40
static u8 sReplace[5];

// size = 0x50, address = 0x800F9834
static enum _GXTevColorArg sTevColorArg[5][4];

// size = 0x50, address = 0x800F9884
static enum _GXTevAlphaArg sTevAlphaArg[5][4];

// size = 0x40, address = 0x800F9968
static char* sColorNames[16];

// size = 0x40, address = 0x800F99A8
static char* sAlphaNames[2][8];

// size = 0x40, address = 0x800F99E8
static char* strings$289[4][4];

typedef enum __anon_0x8ADE1 {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x8ADE1;

typedef struct __anon_0x8AE4C {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x8AE4C; // size = 0x10

typedef enum __anon_0x8AEFD {
    SRT_NONE = -1,
    SRT_MARIO = 0,
    SRT_WAVERACE = 1,
    SRT_MARIOKART = 2,
    SRT_STARFOX = 3,
    SRT_ZELDA1 = 4,
    SRT_ZELDA2 = 5,
    SRT_1080 = 6,
    SRT_PANEL = 7,
    SRT_MARIOPARTY1 = 8,
    SRT_MARIOPARTY2 = 9,
    SRT_MARIOPARTY3 = 10,
    SRT_DRMARIO = 11,
    SRT_KIRBY = 12,
    SRT_PILOTWING = 13,
    SRT_SLICRADIC = 14,
    SRT_UNKNOWN = 15,
} __anon_0x8AEFD;

typedef enum __anon_0x8B063 {
    SOT_NONE = -1,
    SOT_CPU = 0,
    SOT_PIF = 1,
    SOT_RAM = 2,
    SOT_ROM = 3,
    SOT_RSP = 4,
    SOT_RDP = 5,
    SOT_MIPS = 6,
    SOT_DISK = 7,
    SOT_FLASH = 8,
    SOT_SRAM = 9,
    SOT_AUDIO = 10,
    SOT_VIDEO = 11,
    SOT_SERIAL = 12,
    SOT_LIBRARY = 13,
    SOT_PERIPHERAL = 14,
    SOT_RDB = 15,
    SOT_COUNT = 16,
} __anon_0x8B063;

typedef struct __anon_0x8B1A6 {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0x8ADE1 eMode;
    /* 0x10 */ struct __anon_0x8AE4C romCopy;
    /* 0x20 */ enum __anon_0x8AEFD eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x8B063 storageDevice;
    /* 0x74 */ u8 anException[16];
    /* 0x84 */ s32 bJapaneseVersion;
} __anon_0x8B1A6; // size = 0x88

// size = 0x4, address = 0x801410E0
struct __anon_0x8B1A6* gpSystem;

typedef struct __anon_0x8B3D7 {
    /* 0x0 */ f32 rX;
    /* 0x4 */ f32 rY;
    /* 0x8 */ f32 rSizeX;
    /* 0xC */ f32 rSizeY;
} __anon_0x8B3D7; // size = 0x10

typedef struct __anon_0x8B471 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 nWidth;
    /* 0x08 */ s32 nFormat;
    /* 0x0C */ void* pData;
    /* 0x10 */ s32 nAddress;
} __anon_0x8B471; // size = 0x14

typedef struct __anon_0x8B5B2 {
    /* 0x0 */ f32 x;
    /* 0x4 */ f32 y;
    /* 0x8 */ f32 z;
} __anon_0x8B5B2; // size = 0xC

typedef struct __anon_0x8B622 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x8B5B2 rVecOrigTowards;
    /* 0x10 */ f32 rColorR;
    /* 0x14 */ f32 rColorG;
    /* 0x18 */ f32 rColorB;
    /* 0x1C */ f32 rVectorX;
    /* 0x20 */ f32 rVectorY;
    /* 0x24 */ f32 rVectorZ;
    /* 0x28 */ f32 kc;
    /* 0x2C */ f32 kl;
    /* 0x30 */ f32 kq;
    /* 0x34 */ s16 coordX;
    /* 0x36 */ s16 coordY;
    /* 0x38 */ s16 coordZ;
} __anon_0x8B622; // size = 0x3C

typedef struct __anon_0x8B852 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x8B5B2 rS;
    /* 0x10 */ struct __anon_0x8B5B2 rT;
    /* 0x1C */ struct __anon_0x8B5B2 rSRaw;
    /* 0x28 */ struct __anon_0x8B5B2 rTRaw;
} __anon_0x8B852; // size = 0x34

typedef struct __anon_0x8B93B {
    /* 0x00 */ f32 rSum;
    /* 0x04 */ f32 rS;
    /* 0x08 */ f32 rT;
    /* 0x0C */ struct __anon_0x8B5B2 vec;
    /* 0x18 */ u8 anColor[4];
} __anon_0x8B93B; // size = 0x1C

typedef union __anon_0x8BA9A {
    /* 0x0 */ u8 u8[4096];
    /* 0x0 */ u16 u16[2048];
    /* 0x0 */ u32 u32[1024];
    /* 0x0 */ u64 u64[512];
} __anon_0x8BA9A;

typedef struct __anon_0x8BB37 {
    /* 0x0 */ union __anon_0x8BA9A data;
} __anon_0x8BB37; // size = 0x1000

typedef enum _GXTexFmt {
    GX_TF_I4 = 0,
    GX_TF_I8 = 1,
    GX_TF_IA4 = 2,
    GX_TF_IA8 = 3,
    GX_TF_RGB565 = 4,
    GX_TF_RGB5A3 = 5,
    GX_TF_RGBA8 = 6,
    GX_TF_CMPR = 14,
    GX_CTF_R4 = 32,
    GX_CTF_RA4 = 34,
    GX_CTF_RA8 = 35,
    GX_CTF_YUVA8 = 38,
    GX_CTF_A8 = 39,
    GX_CTF_R8 = 40,
    GX_CTF_G8 = 41,
    GX_CTF_B8 = 42,
    GX_CTF_RG8 = 43,
    GX_CTF_GB8 = 44,
    GX_TF_Z8 = 17,
    GX_TF_Z16 = 19,
    GX_TF_Z24X8 = 22,
    GX_CTF_Z4 = 48,
    GX_CTF_Z8M = 57,
    GX_CTF_Z8L = 58,
    GX_CTF_Z16L = 60,
    GX_TF_A8 = 39,
} __anon_0x8BBD0;

typedef struct _GXTlutObj {
    /* 0x0 */ u32 dummy[3];
} __anon_0x8BD92; // size = 0xC

typedef struct _GXTexObj {
    /* 0x0 */ u32 dummy[8];
} __anon_0x8BDF9; // size = 0x20

typedef enum _GXTexWrapMode {
    GX_CLAMP = 0,
    GX_REPEAT = 1,
    GX_MIRROR = 2,
    GX_MAX_TEXWRAPMODE = 3,
} __anon_0x8BE3F;

typedef struct _FRAME_TEXTURE {
    /* 0x00 */ s32 nMode;
    /* 0x04 */ s32 iPackPixel;
    /* 0x08 */ s32 iPackColor;
    /* 0x0C */ s32 nFrameLast;
    /* 0x10 */ s16 nSizeX;
    /* 0x12 */ s16 nSizeY;
    /* 0x14 */ u32 nAddress;
    /* 0x18 */ u32 nCodePixel;
    /* 0x1C */ u32 nCodeColor;
    /* 0x20 */ struct _FRAME_TEXTURE* pTextureNext;
    /* 0x24 */ u32 nData0;
    /* 0x28 */ u32 nData1;
    /* 0x2C */ u32 nData2;
    /* 0x30 */ u32 nData3;
    /* 0x34 */ enum _GXTexFmt eFormat;
    /* 0x38 */ struct _GXTlutObj objectTLUT;
    /* 0x44 */ struct _GXTexObj objectTexture;
    /* 0x64 */ enum _GXTexWrapMode eWrapS;
    /* 0x68 */ enum _GXTexWrapMode eWrapT;
} __anon_0x8BEA8; // size = 0x6C

typedef struct __anon_0x8C205 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 nTMEM;
    /* 0x08 */ s32 iTLUT;
    /* 0x0C */ s32 nSizeX;
    /* 0x10 */ s32 nFormat;
    /* 0x14 */ s16 nMaskS;
    /* 0x16 */ s16 nMaskT;
    /* 0x18 */ s16 nModeS;
    /* 0x1A */ s16 nModeT;
    /* 0x1C */ s16 nShiftS;
    /* 0x1E */ s16 nShiftT;
    /* 0x20 */ s16 nX0;
    /* 0x22 */ s16 nY0;
    /* 0x24 */ s16 nX1;
    /* 0x26 */ s16 nY1;
    /* 0x28 */ u32 nCodePixel;
} __anon_0x8C205; // size = 0x2C

typedef enum __anon_0x8C4E7 {
    FMP_NONE = -1,
    FMP_PERSPECTIVE = 0,
    FMP_ORTHOGRAPHIC = 1,
} __anon_0x8C4E7;

typedef struct __anon_0x8C570 {
    /* 0x00 */ s32 nCount;
    /* 0x04 */ f32 rScale;
    /* 0x08 */ f32 rAspect;
    /* 0x0C */ f32 rFieldOfViewY;
    /* 0x10 */ f32 rClipNear;
    /* 0x14 */ f32 rClipFar;
    /* 0x18 */ u32 nAddressFloat;
    /* 0x1C */ u32 nAddressFixed;
    /* 0x20 */ enum __anon_0x8C4E7 eProjection;
} __anon_0x8C570; // size = 0x24

typedef struct __anon_0x8C727 {
    /* 0x00000 */ u32 anCIMGAddresses[8];
    /* 0x00020 */ u16 nNumCIMGAddresses;
    /* 0x00024 */ s32 bBlurOn;
    /* 0x00028 */ s32 bHackPause;
    /* 0x0002C */ s32 nHackCount;
    /* 0x00030 */ s32 nFrameCounter;
    /* 0x00034 */ s32 bPauseThisFrame;
    /* 0x00038 */ s32 bCameFromBomberNotes;
    /* 0x0003C */ s32 bInBomberNotes;
    /* 0x00040 */ s32 bShrinking;
    /* 0x00044 */ s32 bSnapShot;
    /* 0x00048 */ s32 bUsingLens;
    /* 0x0004C */ u8 cBlurAlpha;
    /* 0x00050 */ s32 bBlurredThisFrame;
    /* 0x00054 */ s32 nFrameCIMGCalls;
    /* 0x00058 */ s32 bModifyZBuffer;
    /* 0x0005C */ s32 nZBufferSets;
    /* 0x00060 */ s32 nLastFrameZSets;
    /* 0x00064 */ s32 bPauseBGDrawn;
    /* 0x00068 */ u64* pnGBI;
    /* 0x0006C */ u32 nFlag;
    /* 0x00070 */ f32 rScaleX;
    /* 0x00074 */ f32 rScaleY;
    /* 0x00078 */ u32 nCountFrames;
    /* 0x0007C */ u32 nMode;
    /* 0x00080 */ u32 aMode[10];
    /* 0x000A8 */ struct __anon_0x8B3D7 viewport;
    /* 0x000B8 */ struct __anon_0x8B471 aBuffer[4];
    /* 0x00108 */ u32 nOffsetDepth0;
    /* 0x0010C */ u32 nOffsetDepth1;
    /* 0x00110 */ s32 nWidthLine;
    /* 0x00114 */ f32 rDepth;
    /* 0x00118 */ f32 rDelta;
    /* 0x0011C */ s32 (* aDraw[4])(void*, void*);
    /* 0x0012C */ s32 nCountLight;
    /* 0x00130 */ struct __anon_0x8B622 aLight[8];
    /* 0x00310 */ struct __anon_0x8B852 lookAt;
    /* 0x00344 */ s32 nCountVertex;
    /* 0x00348 */ struct __anon_0x8B93B aVertex[80];
    /* 0x00C08 */ struct __anon_0x8BB37 TMEM;
    /* 0x01C08 */ void* aPixelData;
    /* 0x01C0C */ void* aColorData;
    /* 0x01C10 */ s32 nBlocksPixel;
    /* 0x01C14 */ s32 nBlocksMaxPixel;
    /* 0x01C18 */ s32 nBlocksColor;
    /* 0x01C1C */ s32 nBlocksMaxColor;
    /* 0x01C20 */ s32 nBlocksTexture;
    /* 0x01C24 */ s32 nBlocksMaxTexture;
    /* 0x01C28 */ u32 anPackPixel[48];
    /* 0x01CE8 */ u32 anPackColor[320];
    /* 0x021E8 */ u32 nAddressLoad;
    /* 0x021EC */ u32 nCodePixel;
    /* 0x021F0 */ u32 nTlutCode[16];
    /* 0x02230 */ struct _FRAME_TEXTURE aTexture[2048];
    /* 0x38230 */ u32 anTextureUsed[64];
    /* 0x38330 */ struct _FRAME_TEXTURE* apTextureCached[4096];
    /* 0x3C330 */ s32 iTileLoad;
    /* 0x3C334 */ u32 n2dLoadTexType;
    /* 0x3C338 */ s32 nLastX0;
    /* 0x3C33C */ s32 nLastY0;
    /* 0x3C340 */ s32 nLastX1;
    /* 0x3C344 */ s32 nLastY1;
    /* 0x3C348 */ struct __anon_0x8C205 aTile[8];
    /* 0x3C4A8 */ s32 anSizeX[2];
    /* 0x3C4B0 */ s32 anSizeY[2];
    /* 0x3C4B8 */ s32 iHintMatrix;
    /* 0x3C4BC */ s32 iMatrixModel;
    /* 0x3C4C0 */ s32 iHintProjection;
    /* 0x3C4C4 */ f32 matrixView[4][4];
    /* 0x3C504 */ s32 iHintLast;
    /* 0x3C508 */ s32 iHintHack;
    /* 0x3C50C */ enum __anon_0x8C4E7 eTypeProjection;
    /* 0x3C510 */ f32 aMatrixModel[10][4][4];
    /* 0x3C790 */ f32 matrixProjection[4][4];
    /* 0x3C7D0 */ f32 matrixProjectionExtra[4][4];
    /* 0x3C810 */ struct __anon_0x8C570 aMatrixHint[64];
    /* 0x3D110 */ u8 primLODmin;
    /* 0x3D111 */ u8 primLODfrac;
    /* 0x3D112 */ u8 lastTile;
    /* 0x3D113 */ u8 iTileDrawn;
    /* 0x3D114 */ struct _GXColor aColor[5];
    /* 0x3D128 */ u32 nModeVtx;
    /* 0x3D12C */ u16* nTempBuffer;
    /* 0x3D130 */ u16* nCopyBuffer;
    /* 0x3D134 */ u16* nCameraBuffer;
} __anon_0x8C727; // size = 0x3D138

typedef enum _GXTexCoordID {
    GX_TEXCOORD0 = 0,
    GX_TEXCOORD1 = 1,
    GX_TEXCOORD2 = 2,
    GX_TEXCOORD3 = 3,
    GX_TEXCOORD4 = 4,
    GX_TEXCOORD5 = 5,
    GX_TEXCOORD6 = 6,
    GX_TEXCOORD7 = 7,
    GX_MAX_TEXCOORD = 8,
    GX_TEXCOORD_NULL = 255,
} __anon_0x8D4E1;

typedef enum _GXTexMapID {
    GX_TEXMAP0 = 0,
    GX_TEXMAP1 = 1,
    GX_TEXMAP2 = 2,
    GX_TEXMAP3 = 3,
    GX_TEXMAP4 = 4,
    GX_TEXMAP5 = 5,
    GX_TEXMAP6 = 6,
    GX_TEXMAP7 = 7,
    GX_MAX_TEXMAP = 8,
    GX_TEXMAP_NULL = 255,
    GX_TEX_DISABLE = 256,
} __anon_0x8D5BA;

typedef enum _GXChannelID {
    GX_COLOR0 = 0,
    GX_COLOR1 = 1,
    GX_ALPHA0 = 2,
    GX_ALPHA1 = 3,
    GX_COLOR0A0 = 4,
    GX_COLOR1A1 = 5,
    GX_COLOR_ZERO = 6,
    GX_ALPHA_BUMP = 7,
    GX_ALPHA_BUMPN = 8,
    GX_COLOR_NULL = 255,
} __anon_0x8D690;

typedef struct TevOrder {
    /* 0x0 */ enum _GXTexCoordID coordID;
    /* 0x4 */ enum _GXTexMapID mapID;
    /* 0x8 */ enum _GXChannelID chanID;
} __anon_0x8D758; // size = 0xC

typedef struct CombineModeTev {
    /* 0x000 */ u32 ccCodes[2][2];
    /* 0x010 */ u8 numCycles;
    /* 0x011 */ u8 numStages;
    /* 0x012 */ u8 numTexGen;
    /* 0x013 */ u8 numChan;
    /* 0x014 */ u32 flags;
    /* 0x018 */ struct TevOrder tevOrder[8];
    /* 0x078 */ struct TevColorOp tevColorOpP[8][2];
    /* 0x1B8 */ enum _GXTevColorArg tevColorArg[8][4];
    /* 0x238 */ enum _GXTevAlphaArg tevAlphaArg[8][4];
} __anon_0x8D8D6; // size = 0x2B8

// size = 0x0, address = 0x800F2ED0
enum _GXTexCoordID ganNameTexCoord[];

// size = 0x0, address = 0x800F2E90
enum _GXTexMapID ganNamePixel[];

typedef struct _GXColor {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
} __anon_0x8E44F; // size = 0x4

// Range: 0x8009BCD8 -> 0x8009BFDC
static void SetTableTevStages(struct __anon_0x8C727* pFrame, struct CombineModeTev* ctP) {
    // Parameters
    // struct __anon_0x8C727* pFrame; // r30
    // struct CombineModeTev* ctP; // r31

    // Local variables
    s32 i; // r23
    s32 iStart; // r1+0x8
    struct _GXColor color; // r1+0x30
    struct TevOrder* toP; // r6
    struct TevColorOp* tcP; // r22
    enum _GXTevColorArg* cArgP; // r21
    enum _GXTevAlphaArg* aArgP; // r20

    // References
    // -> static enum _GXTevStageID ganNameTevStage[16];
}

// Erased
static void OutputCCMode(s32 cycle, u32 tempColor, u32 tempAlpha) {
    // Parameters
    // s32 cycle; // r1+0x8
    // u32 tempColor; // r1+0xC
    // u32 tempAlpha; // r1+0x10

    // Local variables
    s32 i; // r1+0x8
    u8 nColor[4]; // r1+0x18
    u8 nAlpha[4]; // r1+0x14

    // References
    // -> static char* sAlphaNames[2][8];
    // -> static char* sColorNames[16];
}

// Erased
static void CheckNewCCMode(struct __anon_0x8C727* pFrame, s32 numCycles) {
    // Parameters
    // struct __anon_0x8C727* pFrame; // r1+0x8
    // s32 numCycles; // r29

    // Local variables
    s32 i; // r3
    u32 tempColor1; // r8
    u32 tempAlpha1; // r5
    u32 tempColor2; // r31
    u32 tempAlpha2; // r30

    // References
    // -> static u32 sCurCCMode;
    // -> static u32 sPrevCCModes[100][2][2];
}

// Range: 0x8009BB18 -> 0x8009BCD8
void SetNumTexGensChans(struct __anon_0x8C727* pFrame, s32 numCycles) {
    // Parameters
    // struct __anon_0x8C727* pFrame; // r1+0x8
    // s32 numCycles; // r1+0xC

    // Local variables
    u8 nColor[4]; // r1+0x14
    u8 nAlpha[4]; // r1+0x10
    u32 tempColor; // r5
    u32 tempAlpha; // r7
    s32 i; // r8
    s32 j; // r1+0x8
    s32 numGens; // r9
    s32 numChans; // r1+0x8
}

// Range: 0x8009B794 -> 0x8009BB18
void SetTevStages(struct __anon_0x8C727* pFrame, s32 cycle) {
    // Parameters
    // struct __anon_0x8C727* pFrame; // r1+0x8
    // s32 cycle; // r17

    // Local variables
    u8 nColor[4]; // r1+0x5C
    u8 nAlpha[4]; // r1+0x58
    u32 tempColor; // r6
    u32 tempAlpha; // r9
    enum _GXTevColorArg colorArg[4]; // r1+0x48
    enum _GXTevAlphaArg alphaArg[4]; // r1+0x38
    enum _GXTevStageID tevStages[5]; // r1+0x24
    struct TevColorOp* tP; // r1+0x8
    s32 j; // r1+0x8
    enum _GXTevColorArg* cArgP; // r21
    enum _GXTevAlphaArg* aArgP; // r20
    s32 i; // r19
    s32 order; // r18

    // References
    // -> static enum _GXTevAlphaArg sTevAlphaArg[5][4];
    // -> static enum _GXTevColorArg sTevColorArg[5][4];
    // -> static struct TevColorOp sTevColorOp[5];
    // -> static u8 sOrder[5];
    // -> static u8 sReplace[5];
    // -> enum _GXTevAlphaArg gCombinedAlpha[8];
    // -> enum _GXTevColorArg gCombinedColor[16];
    // -> enum _GXTexMapID ganNamePixel[];
    // -> enum _GXTexCoordID ganNameTexCoord[];
    // -> static enum _GXTevStageID ganNameTevStage[16];
}

// Range: 0x8009B6D4 -> 0x8009B794
s32 SetTevStageTable(struct __anon_0x8C727* pFrame, s32 numCycles) {
    // Parameters
    // struct __anon_0x8C727* pFrame; // r31
    // s32 numCycles; // r7

    // Local variables
    u32 tempColor1; // r3
    u32 tempAlpha1; // r4
    u32 tempColor2; // r5
    u32 tempAlpha2; // r6
    struct CombineModeTev* ctP; // r4

    // References
    // -> struct __anon_0x8B1A6* gpSystem;
}

// Erased
static void UpdateRenderModeList(u32 renderMode, u32 cycle) {
    // Parameters
    // u32 renderMode; // r1+0x8
    // u32 cycle; // r23

    // Local variables
    s32 i; // r5
    u32 p[2][4]; // r1+0x10

    // References
    // -> static s32 sCurRenderMode$279;
    // -> static u32 sFoundRenderModes$278[100];
    // -> static char* strings$289[4][4];
    // -> static u8 sMemShift$302[2][4];
}
