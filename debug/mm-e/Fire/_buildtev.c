/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\_buildtev.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8009B634 -> 0x8009EA3C
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
} __anon_0x90E70;

// size = 0x40, address = 0x800E86B0
enum _GXTevColorArg gColorArgs[16];

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
} __anon_0x9100E;

// size = 0x28, address = 0x800E86F0
enum _GXTevAlphaArg gAlphaArgs[10];

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
} __anon_0x91103;

typedef enum _GXTevBias {
    GX_TB_ZERO = 0,
    GX_TB_ADDHALF = 1,
    GX_TB_SUBHALF = 2,
    GX_MAX_TEVBIAS = 3,
} __anon_0x9122E;

typedef enum _GXTevScale {
    GX_CS_SCALE_1 = 0,
    GX_CS_SCALE_2 = 1,
    GX_CS_SCALE_4 = 2,
    GX_CS_DIVIDE_2 = 3,
    GX_MAX_TEVSCALE = 4,
} __anon_0x91299;

typedef enum _GXTevRegID {
    GX_TEVPREV = 0,
    GX_TEVREG0 = 1,
    GX_TEVREG1 = 2,
    GX_TEVREG2 = 3,
    GX_MAX_TEVREG = 4,
} __anon_0x9131C;

typedef struct TevColorOp {
    /* 0x00 */ enum _GXTevOp op;
    /* 0x04 */ enum _GXTevBias bias;
    /* 0x08 */ enum _GXTevScale scale;
    /* 0x0C */ u8 clamp;
    /* 0x10 */ enum _GXTevRegID out_reg;
} __anon_0x91390; // size = 0x14

// size = 0x50, address = 0x800E8718
static struct TevColorOp sUsualOps[4];

// size = 0x10, address = 0x800E8768
static enum _GXTevColorArg sUsualCArgs[4];

// size = 0x10, address = 0x800E8778
static enum _GXTevAlphaArg sUsualAArgs[4];

// size = 0x8, address = 0x8012FAF8
static s32 zeroType$182[2];

// size = 0x20, address = 0x800E8788
static s32 texelType$183[2][4];

// size = 0x10, address = 0x800E87A8
static s32 lightType$184[2][2];

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
} __anon_0x916A8;

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
} __anon_0x91781;

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
} __anon_0x91857;

typedef struct TevOrder {
    /* 0x0 */ enum _GXTexCoordID coordID;
    /* 0x4 */ enum _GXTexMapID mapID;
    /* 0x8 */ enum _GXChannelID chanID;
} __anon_0x9191F; // size = 0xC

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
} __anon_0x91A9D; // size = 0x2B8

// size = 0x2B8, address = 0x8012A900
static struct CombineModeTev tevStages$519;

typedef enum __anon_0x9253E {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x9253E;

typedef struct __anon_0x925A7 {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x925A7; // size = 0x10

typedef enum __anon_0x92658 {
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
} __anon_0x92658;

typedef enum __anon_0x927BC {
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
} __anon_0x927BC;

typedef struct __anon_0x928FD {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0x9253E eMode;
    /* 0x10 */ struct __anon_0x925A7 romCopy;
    /* 0x20 */ enum __anon_0x92658 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x927BC storageDevice;
    /* 0x74 */ u8 anException[16];
} __anon_0x928FD; // size = 0x88

// size = 0x4, address = 0x8012FD48
struct __anon_0x928FD* gpSystem;

// Range: 0x8009E8A4 -> 0x8009EA3C
void SetColor(u8* stageValues, u32 colorVal, u8 cycle) {
    // Parameters
    // u8* stageValues; // r1+0x0
    // u32 colorVal; // r1+0x4
    // u8 cycle; // r1+0x8

    // Local variables
    s32 i; // r9

    // References
    // -> struct __anon_0x928FD* gpSystem;
}

// Range: 0x8009E76C -> 0x8009E8A4
void SetAlpha(u8* stageValues, u32 alphaVal, u8 cycle) {
    // Parameters
    // u8* stageValues; // r1+0x0
    // u32 alphaVal; // r1+0x4
    // u8 cycle; // r1+0x8

    // Local variables
    s32 i; // r8
}

// Range: 0x8009E64C -> 0x8009E76C
static s32 AddAlphaTevOrder(struct CombineModeTev* tvP, s32 foundTypes, s32 curStage) {
    // Parameters
    // struct CombineModeTev* tvP; // r1+0x0
    // s32 foundTypes; // r1+0x4
    // s32 curStage; // r5

    // Local variables
    s32 ret; // r6

    // References
    // -> static struct TevColorOp sUsualOps[4];
}

// Erased
static void AddColorTevOrder(struct CombineModeTev* tvP, s32 foundTypes, s32 curStage) {
    // Parameters
    // struct CombineModeTev* tvP; // r1+0x0
    // s32 foundTypes; // r1+0x4
    // s32 curStage; // r1+0x8
}

// Range: 0x8009BB5C -> 0x8009E64C
s32 SetupStage(struct CombineModeTev* tvP, u8* stageValues, s32 type) {
    // Parameters
    // struct CombineModeTev* tvP; // r26
    // u8* stageValues; // r27
    // s32 type; // r22

    // Local variables
    s32 zero; // r1+0x8
    s32 curStage; // r31
    s32 textureFoundPos; // r30
    s32 numFound[2]; // r1+0x18
    s32 retStages; // r29
    s32 ret; // r1+0x8
    s32 i; // r21
    s32 num; // r6
    s32 j; // r7
    s32 foundTypes; // r28
    s32 texelNum; // r10
    s32 mask; // r5
    s32 mask; // r21
    s32 index1; // r1+0x8
    s32 index2; // r23
    s32 index1; // r1+0x8
    s32 index2; // r23
    s32 flag; // r7
    s32 mask; // r4

    // References
    // -> enum _GXTevAlphaArg gAlphaArgs[10];
    // -> static struct TevColorOp sUsualOps[4];
    // -> enum _GXTevColorArg gColorArgs[16];
    // -> static s32 lightType$184[2][2];
    // -> static s32 texelType$183[2][4];
    // -> static s32 zeroType$182[2];
}

// Range: 0x8009BA70 -> 0x8009BB5C
void BuildCycle(struct CombineModeTev* tvP, u8 (* stageValues)[4]) {
    // Parameters
    // struct CombineModeTev* tvP; // r31
    // u8 (* stageValues)[4]; // r29

    // Local variables
    s32 numCParts; // r1+0x8
    s32 numAParts; // r1+0x8
    s32 i; // r5
}

// Range: 0x8009B634 -> 0x8009BA70
struct CombineModeTev* BuildCombineModeTev(u32 color1, u32 alpha1, u32 color2, u32 alpha2, u32 numCycles) {
    // Parameters
    // u32 color1; // r26
    // u32 alpha1; // r27
    // u32 color2; // r28
    // u32 alpha2; // r29
    // u32 numCycles; // r30

    // Local variables
    u8 stageValues[2][2][4]; // r1+0x28
    s32 i; // r1+0x8
    s32 j; // r6
    u8* tempPtr; // r1+0x8

    // References
    // -> static struct CombineModeTev tevStages$519;
    // -> static enum _GXTevAlphaArg sUsualAArgs[4];
    // -> static enum _GXTevColorArg sUsualCArgs[4];
}
