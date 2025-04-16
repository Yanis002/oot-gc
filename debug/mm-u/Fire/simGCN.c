/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\simGCN.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80008568 -> 0x800100C0
*/

#include "types.h"

typedef struct __anon_0x6E49 {
    /* 0x0 */ s32 nMode;
} __anon_0x6E49; // size = 0x4

// size = 0x4, address = 0x801410B0
static struct __anon_0x6E49* gpCode;

// size = 0x2E61, address = 0x800E0C60
u8 gcoverOpen[11873];

// size = 0x2501, address = 0x800E3AE0
u8 gnoDisk[9473];

// size = 0x3401, address = 0x800E6000
u8 gretryErr[13313];

// size = 0x4B41, address = 0x800E9420
u8 gfatalErr[19265];

// size = 0x2501, address = 0x800EDF80
u8 gwrongDisk[9473];

// size = 0x1061, address = 0x800F04A0
u8 greadingDisk[4193];

// size = 0x741, address = 0x800F1520
u8 gbar[1857];

// size = 0x141, address = 0x800F1C80
u8 gyes[321];

// size = 0x101, address = 0x800F1DE0
u8 gno[257];

// size = 0x161, address = 0x800F1F00
u8 gmesgOK[353];

// size = 0x4, address = 0x80140758
u32 gmsg_ld01Size;

// size = 0x4, address = 0x8014075C
u32 gmsg_ld02Size;

// size = 0x4, address = 0x80140760
u32 gmsg_ld03Size;

// size = 0x4, address = 0x80140764
u32 gmsg_ld04Size;

// size = 0x4, address = 0x80140768
u32 gmsg_ld05_1Size;

// size = 0x4, address = 0x8014076C
u32 gmsg_ld05_2Size;

// size = 0x4, address = 0x80140770
u32 gmsg_ld06_1Size;

// size = 0x4, address = 0x80140774
u32 gmsg_ld06_2Size;

// size = 0x4, address = 0x80140778
u32 gmsg_ld06_3Size;

// size = 0x4, address = 0x8014077C
u32 gmsg_ld06_4Size;

// size = 0x4, address = 0x80140780
u32 gmsg_ld07Size;

// size = 0x4, address = 0x80140784
u32 gmsg_gf01Size;

// size = 0x4, address = 0x80140788
u32 gmsg_gf02Size;

// size = 0x4, address = 0x8014078C
u32 gmsg_gf03Size;

// size = 0x4, address = 0x80140790
u32 gmsg_gf04Size;

// size = 0x4, address = 0x80140794
u32 gmsg_gf05Size;

// size = 0x4, address = 0x80140798
u32 gmsg_gf06Size;

// size = 0x4, address = 0x8014079C
u32 gmsg_in01Size;

// size = 0x4, address = 0x801407A0
u32 gmsg_in02Size;

// size = 0x4, address = 0x801407A4
u32 gmsg_in03Size;

// size = 0x4, address = 0x801407A8
u32 gmsg_in04Size;

// size = 0x4, address = 0x801407AC
u32 gmsg_in05Size;

// size = 0x4, address = 0x801407B0
u32 gmsg_sv01Size;

// size = 0x4, address = 0x801407B4
u32 gmsg_sv01_2Size;

// size = 0x4, address = 0x801407B8
u32 gmsg_sv02Size;

// size = 0x4, address = 0x801407BC
u32 gmsg_sv03Size;

// size = 0x4, address = 0x801407C0
u32 gmsg_sv04Size;

// size = 0x4, address = 0x801407C4
u32 gmsg_sv05_1Size;

// size = 0x4, address = 0x801407C8
u32 gmsg_sv06_1Size;

// size = 0x4, address = 0x801407CC
u32 gmsg_sv06_2Size;

// size = 0x4, address = 0x801407D0
u32 gmsg_sv06_3Size;

// size = 0x4, address = 0x801407D4
u32 gmsg_sv06_4Size;

// size = 0x4, address = 0x801407D8
u32 gmsg_sv06_5Size;

// size = 0x4, address = 0x801407DC
u32 gmsg_sv07Size;

// size = 0x4, address = 0x801407E0
u32 gmsg_sv08Size;

// size = 0x4, address = 0x801407E4
u32 gmsg_sv09Size;

// size = 0x4, address = 0x801407E8
u32 gmsg_sv10Size;

// size = 0x4, address = 0x801407EC
u32 gmsg_sv11Size;

// size = 0x4, address = 0x801407F0
u32 gmsg_sv12Size;

// size = 0x4, address = 0x801407F4
u32 gmsg_sv_shareSize;

// size = 0x4, address = 0x801407F8
u32 gz_bnrSize;

// size = 0x4, address = 0x801407FC
u32 gz_iconSize;

// size = 0x4, address = 0x80140800
s32 gHighlightChoice;

typedef enum __anon_0x785E {
    S_M_NONE = -1,
    S_M_DISK_COVER_OPEN = 0,
    S_M_DISK_WRONG_DISK = 1,
    S_M_DISK_READING_DISK = 2,
    S_M_DISK_FATAL_ERROR = 3,
    S_M_DISK_RETRY_ERROR = 4,
    S_M_DISK_NO_DISK = 5,
    S_M_DISK_DEFAULT_ERROR = 6,
    S_M_CARD_LD01 = 7,
    S_M_CARD_LD02 = 8,
    S_M_CARD_LD03 = 9,
    S_M_CARD_LD04 = 10,
    S_M_CARD_LD05_1 = 11,
    S_M_CARD_LD05_2 = 12,
    S_M_CARD_LD06_1 = 13,
    S_M_CARD_LD06_2 = 14,
    S_M_CARD_LD06_3 = 15,
    S_M_CARD_LD06_4 = 16,
    S_M_CARD_LD07 = 17,
    S_M_CARD_GF01 = 18,
    S_M_CARD_GF02 = 19,
    S_M_CARD_GF03 = 20,
    S_M_CARD_GF04 = 21,
    S_M_CARD_GF05 = 22,
    S_M_CARD_GF06 = 23,
    S_M_CARD_IN01 = 24,
    S_M_CARD_IN02 = 25,
    S_M_CARD_IN03 = 26,
    S_M_CARD_IN04 = 27,
    S_M_CARD_IN05 = 28,
    S_M_CARD_SV01 = 29,
    S_M_CARD_SV01_2 = 30,
    S_M_CARD_SV02 = 31,
    S_M_CARD_SV03 = 32,
    S_M_CARD_SV04 = 33,
    S_M_CARD_SV05_1 = 34,
    S_M_CARD_SV06_1 = 35,
    S_M_CARD_SV06_2 = 36,
    S_M_CARD_SV06_3 = 37,
    S_M_CARD_SV06_4 = 38,
    S_M_CARD_SV06_5 = 39,
    S_M_CARD_SV07 = 40,
    S_M_CARD_SV08 = 41,
    S_M_CARD_SV09 = 42,
    S_M_CARD_SV10 = 43,
    S_M_CARD_SV11 = 44,
    S_M_CARD_SV12 = 45,
    S_M_CARD_SV_SHARE = 46,
    S_M_CARD_DEFAULT_ERROR = 47,
} __anon_0x785E;

// size = 0x4, address = 0x80140804
enum __anon_0x785E simulatorMessageCurrent;

// size = 0x40, address = 0x800FE5E0
static f32 gOrthoMtx[4][4];

// size = 0x4, address = 0x801410B4
s32 gButtonDownToggle;

// size = 0x18, address = 0x800F2080
s16 Vert_s16[12];

// size = 0x18, address = 0x800F20A0
s16 Vert_s16Bar[12];

// size = 0xC, address = 0x800F20C0
u32 Colors_u32[3];

// size = 0x8, address = 0x800F20E0
u8 TexCoords_u8[8];

// size = 0x4, address = 0x801410B8
s32 gDVDResetToggle;

// size = 0x4, address = 0x801410BC
static s32 toggle$188;

typedef struct _GXTexObj {
    /* 0x0 */ u32 dummy[8];
} __anon_0x7EA9; // size = 0x20

// size = 0x20, address = 0x800FE620
static struct _GXTexObj texObj$281;

// size = 0x20, address = 0x800FE640
static struct _GXTexObj texObj2$282;

// size = 0x20, address = 0x800FE660
static struct _GXTexObj texObj1$299;

// size = 0x20, address = 0x800FE680
static struct _GXTexObj texObj2$300;

// size = 0x20, address = 0x800FE6A0
static struct _GXTexObj texObj3$301;

// size = 0x20, address = 0x800FE6C0
static struct _GXTexObj texObj1$320;

// size = 0x20, address = 0x800FE6E0
static struct _GXTexObj texObj2$321;

// size = 0x20, address = 0x800FE700
static struct _GXTexObj texObj3$322;

// size = 0x140, address = 0x800FE720
static u32 gContMap[4][20];

// size = 0x4, address = 0x801410C0
static u32 nPrevButton$680;

// size = 0x4, address = 0x801410C4
static u32 nCurrButton$681;

// size = 0x4, address = 0x801410C8
static s32 gbReset;

// size = 0x4, address = 0x801410CC
static u32 gnTickReset;

// size = 0x4, address = 0x80140808
s32 gResetBeginFlag;

// size = 0x4, address = 0x801410D0
s32 gPreviousIPLSetting;

// size = 0x4, address = 0x801410D4
s32 gPreviousForceMenuSetting;

// size = 0x4, address = 0x801410D8
s32 gPreviousAllowResetSetting;

// size = 0x20, address = 0x800FE860
static char* gaszArgument[8];

// size = 0x5000, address = 0x800FE880
char gpErrorMessageBuffer[20480];

// size = 0x4, address = 0x801410DC
s32 gbDisplayedError;

typedef struct __anon_0x82DE {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x82DE; // size = 0x10

typedef enum __anon_0x838F {
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
} __anon_0x838F;

typedef enum __anon_0x84F0 {
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
} __anon_0x84F0;

typedef struct __anon_0x862E {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0xBD9F eMode;
    /* 0x10 */ struct __anon_0x82DE romCopy;
    /* 0x20 */ enum __anon_0x838F eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x84F0 storageDevice;
    /* 0x74 */ u8 anException[16];
    /* 0x84 */ s32 bJapaneseVersion;
} __anon_0x862E; // size = 0x88

// size = 0x4, address = 0x801410E0
struct __anon_0x862E* gpSystem;

typedef enum __anon_0x889F {
    SPM_NONE = -1,
    SPM_PLAY = 0,
    SPM_RAMPQUEUED = 1,
    SPM_RAMPPLAYED = 2,
} __anon_0x889F;

typedef struct __anon_0x890B {
    /* 0x00 */ void* pSrcData;
    /* 0x04 */ s32 nFrequency;
    /* 0x08 */ s32 nDacrate;
    /* 0x0C */ s32 nSndLen;
    /* 0x10 */ void* apBuffer[16];
    /* 0x50 */ s32 anSizeBuffer[16];
    /* 0x90 */ s32 nCountBeep;
    /* 0x94 */ s32 anSizeBeep[3];
    /* 0xA0 */ void* apDataBeep[3];
    /* 0xAC */ s32 iBufferPlay;
    /* 0xB0 */ s32 iBufferMake;
    /* 0xB4 */ enum __anon_0x889F eMode;
    /* 0xB8 */ void* pBufferZero;
    /* 0xBC */ void* pBufferHold;
    /* 0xC0 */ void* pBufferRampUp;
    /* 0xC4 */ void* pBufferRampDown;
    /* 0xC8 */ s32 nSizePlay;
    /* 0xCC */ s32 nSizeZero;
    /* 0xD0 */ s32 nSizeHold;
    /* 0xD4 */ s32 nSizeRamp;
} __anon_0x890B; // size = 0xD8

// size = 0x4, address = 0x801410E4
struct __anon_0x890B* gpSound;

typedef struct __anon_0x8C9B {
    /* 0x0 */ f32 rX;
    /* 0x4 */ f32 rY;
    /* 0x8 */ f32 rSizeX;
    /* 0xC */ f32 rSizeY;
} __anon_0x8C9B; // size = 0x10

typedef struct __anon_0x8D35 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 nWidth;
    /* 0x08 */ s32 nFormat;
    /* 0x0C */ void* pData;
    /* 0x10 */ s32 nAddress;
} __anon_0x8D35; // size = 0x14

typedef struct __anon_0x8E76 {
    /* 0x0 */ f32 x;
    /* 0x4 */ f32 y;
    /* 0x8 */ f32 z;
} __anon_0x8E76; // size = 0xC

typedef struct __anon_0x8EE6 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x8E76 rVecOrigTowards;
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
} __anon_0x8EE6; // size = 0x3C

typedef struct __anon_0x9116 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x8E76 rS;
    /* 0x10 */ struct __anon_0x8E76 rT;
    /* 0x1C */ struct __anon_0x8E76 rSRaw;
    /* 0x28 */ struct __anon_0x8E76 rTRaw;
} __anon_0x9116; // size = 0x34

typedef struct __anon_0x91FF {
    /* 0x00 */ f32 rSum;
    /* 0x04 */ f32 rS;
    /* 0x08 */ f32 rT;
    /* 0x0C */ struct __anon_0x8E76 vec;
    /* 0x18 */ u8 anColor[4];
} __anon_0x91FF; // size = 0x1C

typedef union __anon_0x935E {
    /* 0x0 */ u8 u8[4096];
    /* 0x0 */ u16 u16[2048];
    /* 0x0 */ u32 u32[1024];
    /* 0x0 */ u64 u64[512];
} __anon_0x935E;

typedef struct __anon_0x93FB {
    /* 0x0 */ union __anon_0x935E data;
} __anon_0x93FB; // size = 0x1000

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
} __anon_0x9494;

typedef struct _GXTlutObj {
    /* 0x0 */ u32 dummy[3];
} __anon_0x9656; // size = 0xC

typedef enum _GXTexWrapMode {
    GX_CLAMP = 0,
    GX_REPEAT = 1,
    GX_MIRROR = 2,
    GX_MAX_TEXWRAPMODE = 3,
} __anon_0x969D;

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
} __anon_0x9706; // size = 0x6C

typedef struct __anon_0x9A63 {
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
} __anon_0x9A63; // size = 0x2C

typedef enum __anon_0x9D45 {
    FMP_NONE = -1,
    FMP_PERSPECTIVE = 0,
    FMP_ORTHOGRAPHIC = 1,
} __anon_0x9D45;

typedef struct __anon_0x9DC9 {
    /* 0x00 */ s32 nCount;
    /* 0x04 */ f32 rScale;
    /* 0x08 */ f32 rAspect;
    /* 0x0C */ f32 rFieldOfViewY;
    /* 0x10 */ f32 rClipNear;
    /* 0x14 */ f32 rClipFar;
    /* 0x18 */ u32 nAddressFloat;
    /* 0x1C */ u32 nAddressFixed;
    /* 0x20 */ enum __anon_0x9D45 eProjection;
} __anon_0x9DC9; // size = 0x24

typedef struct __anon_0x9F80 {
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
    /* 0x000A8 */ struct __anon_0x8C9B viewport;
    /* 0x000B8 */ struct __anon_0x8D35 aBuffer[4];
    /* 0x00108 */ u32 nOffsetDepth0;
    /* 0x0010C */ u32 nOffsetDepth1;
    /* 0x00110 */ s32 nWidthLine;
    /* 0x00114 */ f32 rDepth;
    /* 0x00118 */ f32 rDelta;
    /* 0x0011C */ s32 (* aDraw[4])(void*, void*);
    /* 0x0012C */ s32 nCountLight;
    /* 0x00130 */ struct __anon_0x8EE6 aLight[8];
    /* 0x00310 */ struct __anon_0x9116 lookAt;
    /* 0x00344 */ s32 nCountVertex;
    /* 0x00348 */ struct __anon_0x91FF aVertex[80];
    /* 0x00C08 */ struct __anon_0x93FB TMEM;
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
    /* 0x3C348 */ struct __anon_0x9A63 aTile[8];
    /* 0x3C4A8 */ s32 anSizeX[2];
    /* 0x3C4B0 */ s32 anSizeY[2];
    /* 0x3C4B8 */ s32 iHintMatrix;
    /* 0x3C4BC */ s32 iMatrixModel;
    /* 0x3C4C0 */ s32 iHintProjection;
    /* 0x3C4C4 */ f32 matrixView[4][4];
    /* 0x3C504 */ s32 iHintLast;
    /* 0x3C508 */ s32 iHintHack;
    /* 0x3C50C */ enum __anon_0x9D45 eTypeProjection;
    /* 0x3C510 */ f32 aMatrixModel[10][4][4];
    /* 0x3C790 */ f32 matrixProjection[4][4];
    /* 0x3C7D0 */ f32 matrixProjectionExtra[4][4];
    /* 0x3C810 */ struct __anon_0x9DC9 aMatrixHint[64];
    /* 0x3D110 */ u8 primLODmin;
    /* 0x3D111 */ u8 primLODfrac;
    /* 0x3D112 */ u8 lastTile;
    /* 0x3D113 */ u8 iTileDrawn;
    /* 0x3D114 */ struct _GXColor aColor[5];
    /* 0x3D128 */ u32 nModeVtx;
    /* 0x3D12C */ u16* nTempBuffer;
    /* 0x3D130 */ u16* nCopyBuffer;
    /* 0x3D134 */ u16* nCameraBuffer;
} __anon_0x9F80; // size = 0x3D138

// size = 0x4, address = 0x801410E8
struct __anon_0x9F80* gpFrame;

// size = 0x1, address = 0x801415A8
u8 DemoStatEnable;

// size = 0x4, address = 0x8014158C
void* DemoCurrentBuffer;

// size = 0x4, address = 0x80141594
void* DemoFrameBuffer1;

// size = 0x4, address = 0x80141590
void* DemoFrameBuffer2;

typedef struct __anon_0xADEF {
    /* 0x00 */ s32 configuration;
    /* 0x04 */ s32 size;
    /* 0x08 */ s32 offset;
    /* 0x0C */ char* buffer;
    /* 0x10 */ s32* writtenBlocks;
    /* 0x14 */ s32 writtenConfig;
} __anon_0xADEF; // size = 0x18

typedef struct OSCalendarTime {
    /* 0x00 */ s32 sec;
    /* 0x04 */ s32 min;
    /* 0x08 */ s32 hour;
    /* 0x0C */ s32 mday;
    /* 0x10 */ s32 mon;
    /* 0x14 */ s32 year;
    /* 0x18 */ s32 wday;
    /* 0x1C */ s32 yday;
    /* 0x20 */ s32 msec;
    /* 0x24 */ s32 usec;
} __anon_0xAF92; // size = 0x28

typedef struct CARDFileInfo {
    /* 0x00 */ s32 chan;
    /* 0x04 */ s32 fileNo;
    /* 0x08 */ s32 offset;
    /* 0x0C */ s32 length;
    /* 0x10 */ u16 iBlock;
    /* 0x12 */ u16 __padding;
} __anon_0xB100; // size = 0x14

typedef struct __anon_0xB1F8 {
    /* 0x000 */ s32 currentGame;
    /* 0x004 */ s32 fileSize;
    /* 0x008 */ char name[33];
    /* 0x02C */ s32 numberOfGames;
    /* 0x030 */ struct __anon_0xADEF game;
    /* 0x048 */ s32 changedDate;
    /* 0x04C */ s32 changedChecksum;
    /* 0x050 */ s32 gameSize[16];
    /* 0x090 */ s32 gameOffset[16];
    /* 0x0D0 */ s32 gameConfigIndex[16];
    /* 0x110 */ char gameName[16][33];
    /* 0x320 */ struct OSCalendarTime time;
    /* 0x348 */ struct CARDFileInfo fileInfo;
} __anon_0xB1F8; // size = 0x35C

typedef enum __anon_0xB40E {
    MC_E_NONE = 0,
    MC_E_BUSY = 1,
    MC_E_WRONGDEVICE = 2,
    MC_E_NOCARD = 3,
    MC_E_NOFILE = 4,
    MC_E_IOERROR = 5,
    MC_E_BROKEN = 6,
    MC_E_EXIST = 7,
    MC_E_NOENT = 8,
    MC_E_INSSPACE = 9,
    MC_E_NOPERM = 10,
    MC_E_LIMIT = 11,
    MC_E_NAMETOOLONG = 12,
    MC_E_ENCODING = 13,
    MC_E_CANCELED = 14,
    MC_E_FATAL = 15,
    MC_E_SECTOR_SIZE_INVALID = 16,
    MC_E_GAME_NOT_FOUND = 17,
    MC_E_CHECKSUM = 18,
    MC_E_NO_FREE_SPACE = 19,
    MC_E_NO_FREE_FILES = 20,
    MC_E_FILE_EXISTS = 21,
    MC_E_GAME_EXISTS = 22,
    MC_E_TIME_WRONG = 23,
    MC_E_WRITE_CORRUPTED = 24,
    MC_E_UNKNOWN = 25,
} __anon_0xB40E;

typedef struct _MCARD {
    /* 0x000 */ struct __anon_0xB1F8 file;
    /* 0x35C */ enum __anon_0xB40E error;
    /* 0x360 */ s32 slot;
    /* 0x364 */ s32 (* pPollFunction)();
    /* 0x368 */ s32 pollPrevBytes;
    /* 0x36C */ s32 pollSize;
    /* 0x370 */ char pollMessage[256];
    /* 0x470 */ s32 saveToggle;
    /* 0x474 */ char* writeBuffer;
    /* 0x478 */ char* readBuffer;
    /* 0x47C */ s32 writeToggle;
    /* 0x480 */ s32 soundToggle;
    /* 0x484 */ s32 writeStatus;
    /* 0x488 */ s32 writeIndex;
    /* 0x48C */ s32 accessType;
    /* 0x490 */ s32 gameIsLoaded;
    /* 0x494 */ char saveFileName[256];
    /* 0x594 */ char saveComment[256];
    /* 0x694 */ char* saveIcon;
    /* 0x698 */ char* saveBanner;
    /* 0x69C */ char saveGameName[256];
    /* 0x79C */ s32 saveFileSize;
    /* 0x7A0 */ s32 saveGameSize;
    /* 0x7A4 */ s32 bufferCreated;
    /* 0x7A8 */ s32 cardSize;
    /* 0x7AC */ s32 wait;
    /* 0x7B0 */ s32 isBroken;
    /* 0x7B4 */ s32 saveConfiguration;
} __anon_0xB6B0; // size = 0x7B8

// size = 0x7B8, address = 0x80111B50
struct _MCARD mCard;

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0xBB98; // size = 0x10

// size = 0x10, address = 0x800F2E20
struct _XL_OBJECTTYPE gClassCode;

// size = 0x10, address = 0x800F2E60
struct _XL_OBJECTTYPE gClassFrame;

// size = 0x10, address = 0x800F2E30
struct _XL_OBJECTTYPE gClassSound;

// size = 0x10, address = 0x800F38E0
struct _XL_OBJECTTYPE gClassSystem;

typedef struct _GXColor {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
} __anon_0xBD06; // size = 0x4

typedef enum __anon_0xBD9F {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0xBD9F;

typedef enum __anon_0xC03B {
    SAT_NONE = -1,
    SAT_NAME = 0,
    SAT_PROGRESSIVE = 1,
    SAT_VIBRATION = 2,
    SAT_CONTROLLER = 3,
    SAT_XTRA = 4,
    SAT_MEMORYCARD = 5,
    SAT_MOVIE = 6,
    SAT_RESET = 7,
    SAT_COUNT_ = 8,
} __anon_0xC03B;

typedef struct PADStatus {
    /* 0x0 */ u16 button;
    /* 0x2 */ s8 stickX;
    /* 0x3 */ s8 stickY;
    /* 0x4 */ s8 substickX;
    /* 0x5 */ s8 substickY;
    /* 0x6 */ u8 triggerLeft;
    /* 0x7 */ u8 triggerRight;
    /* 0x8 */ u8 analogA;
    /* 0x9 */ u8 analogB;
    /* 0xA */ s8 err;
} __anon_0xC258; // size = 0xC

typedef struct __anon_0xC3E8 {
    /* 0x00 */ struct PADStatus pst;
    /* 0x0C */ u16 buttonDown;
    /* 0x0E */ u16 buttonUp;
    /* 0x10 */ u16 dirs;
    /* 0x12 */ u16 dirsNew;
    /* 0x14 */ u16 dirsReleased;
    /* 0x16 */ s16 stickDeltaX;
    /* 0x18 */ s16 stickDeltaY;
    /* 0x1A */ s16 substickDeltaX;
    /* 0x1C */ s16 substickDeltaY;
} __anon_0xC3E8; // size = 0x1E

// size = 0x78, address = 0x8013E1B8
struct __anon_0xC3E8 DemoPad[4];

typedef enum __anon_0xD6BC {
    CT_NONE = 0,
    CT_CONTROLLER = 1,
    CT_CONTROLLER_W_PAK = 2,
    CT_CONTROLLER_W_RPAK = 3,
    CT_MOUSE = 4,
    CT_VOICE = 5,
    CT_4K = 6,
    CT_16K = 7,
    CT_COUNT = 8,
} __anon_0xD6BC;

typedef struct __anon_0xDD13 {
    /* 0x000 */ char rom[36];
    /* 0x024 */ s32 controllerConfiguration[4][20];
    /* 0x164 */ s32 rumbleConfiguration;
    /* 0x168 */ s32 storageDevice;
    /* 0x16C */ s32 normalControllerConfig;
    /* 0x170 */ s32 currentControllerConfig;
} __anon_0xDD13; // size = 0x174

typedef enum __anon_0xE0B8 {
    SV_NONE = 0,
    SV_CODE = 1,
    SV_FRAME = 2,
} __anon_0xE0B8;

typedef enum __anon_0xE241 {
    VI_TVMODE_NTSC_INT = 0,
    VI_TVMODE_NTSC_DS = 1,
    VI_TVMODE_NTSC_PROG = 2,
    VI_TVMODE_PAL_INT = 4,
    VI_TVMODE_PAL_DS = 5,
    VI_TVMODE_EURGB60_INT = 20,
    VI_TVMODE_EURGB60_DS = 21,
    VI_TVMODE_MPAL_INT = 8,
    VI_TVMODE_MPAL_DS = 9,
    VI_TVMODE_DEBUG_INT = 12,
    VI_TVMODE_DEBUG_PAL_INT = 16,
    VI_TVMODE_DEBUG_PAL_DS = 17,
} __anon_0xE241;

typedef enum __anon_0xE38B {
    VI_XFBMODE_SF = 0,
    VI_XFBMODE_DF = 1,
} __anon_0xE38B;

typedef struct _GXRenderModeObj {
    /* 0x00 */ enum __anon_0xE241 viTVmode;
    /* 0x04 */ u16 fbWidth;
    /* 0x06 */ u16 efbHeight;
    /* 0x08 */ u16 xfbHeight;
    /* 0x0A */ u16 viXOrigin;
    /* 0x0C */ u16 viYOrigin;
    /* 0x0E */ u16 viWidth;
    /* 0x10 */ u16 viHeight;
    /* 0x14 */ enum __anon_0xE38B xFBmode;
    /* 0x18 */ u8 field_rendering;
    /* 0x19 */ u8 aa;
    /* 0x1A */ u8 sample_pattern[12][2];
    /* 0x32 */ u8 vfilter[7];
} __anon_0xE43C; // size = 0x3C

// size = 0x4, address = 0x8014107C
struct _GXRenderModeObj* rmode;

// size = 0x4, address = 0x80141124
s32 gMovieErrorToggle;

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0xE834; // size = 0x20

typedef struct DVDCommandBlock {
    /* 0x00 */ struct DVDCommandBlock* next;
    /* 0x04 */ struct DVDCommandBlock* prev;
    /* 0x08 */ u32 command;
    /* 0x0C */ s32 state;
    /* 0x10 */ u32 offset;
    /* 0x14 */ u32 length;
    /* 0x18 */ void* addr;
    /* 0x1C */ u32 currTransferSize;
    /* 0x20 */ u32 transferredSize;
    /* 0x24 */ struct DVDDiskID* id;
    /* 0x28 */ void (* callback)(s32, struct DVDCommandBlock*);
    /* 0x2C */ void* userData;
} __anon_0xE9A4; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (* callback)(s32, struct DVDFileInfo*);
} __anon_0xEBCA; // size = 0x3C

typedef enum _GXTexFilter {
    GX_NEAR = 0,
    GX_LINEAR = 1,
    GX_NEAR_MIP_NEAR = 2,
    GX_LIN_MIP_NEAR = 3,
    GX_NEAR_MIP_LIN = 4,
    GX_LIN_MIP_LIN = 5,
} __anon_0xEE46;

typedef struct __anon_0xEED7 {
    /* 0x00 */ u16 height;
    /* 0x02 */ u16 width;
    /* 0x04 */ u32 format;
    /* 0x08 */ char* data;
    /* 0x0C */ enum _GXTexWrapMode wrapS;
    /* 0x10 */ enum _GXTexWrapMode wrapT;
    /* 0x14 */ enum _GXTexFilter minFilter;
    /* 0x18 */ enum _GXTexFilter magFilter;
    /* 0x1C */ f32 LODBias;
    /* 0x20 */ u8 edgeLODEnable;
    /* 0x21 */ u8 minLOD;
    /* 0x22 */ u8 maxLOD;
    /* 0x23 */ u8 unpacked;
} __anon_0xEED7; // size = 0x24

typedef enum _GXTlutFmt {
    GX_TL_IA8 = 0,
    GX_TL_RGB565 = 1,
    GX_TL_RGB5A3 = 2,
    GX_MAX_TLUTFMT = 3,
} __anon_0xF0CA;

typedef struct __anon_0xF132 {
    /* 0x0 */ u16 numEntries;
    /* 0x2 */ u8 unpacked;
    /* 0x3 */ u8 pad8;
    /* 0x4 */ enum _GXTlutFmt format;
    /* 0x8 */ char* data;
} __anon_0xF132; // size = 0xC

typedef struct __anon_0xF1FE {
    /* 0x0 */ struct __anon_0xEED7* textureHeader;
    /* 0x4 */ struct __anon_0xF132* CLUTHeader;
} __anon_0xF1FE; // size = 0x8

typedef struct __anon_0xF26F {
    /* 0x0 */ u32 versionNumber;
    /* 0x4 */ u32 numDescriptors;
    /* 0x8 */ struct __anon_0xF1FE* descriptorArray;
} __anon_0xF26F; // size = 0xC

// Erased
static s32 simulatorGXInit() {
    // Local variables
    s32 i; // r31
    struct _GXColor GX_DEFAULT_BG; // r1+0x58
    struct _GXColor BLACK; // r1+0x54
    struct _GXColor WHITE; // r1+0x50
    f32 identity_mtx[3][4]; // r1+0x20
}

// Range: 0x8000FFE4 -> 0x800100C0
void simulatorUnpackTexPalette(struct __anon_0xF26F* pal) {
    // Parameters
    // struct __anon_0xF26F* pal; // r1+0x0

    // Local variables
    u16 i; // r4
}

// Erased
static void simulatorDEMOSwapBuffers() {
    // References
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
}

// Range: 0x8000FF48 -> 0x8000FFE4
void simulatorDEMODoneRender() {
    // References
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
}

// Range: 0x8000FD40 -> 0x8000FF48
s32 simulatorDVDShowError(s32 nStatus) {
    // Parameters
    // s32 nStatus; // r26

    // Local variables
    s32 continueToggle; // r28
    enum __anon_0x785E nMessage; // r27

    // References
    // -> struct __anon_0x862E* gpSystem;
    // -> s32 gDVDResetToggle;
    // -> static s32 toggle$188;
}

// Range: 0x8000FCD0 -> 0x8000FD40
s32 simulatorDVDOpen(char* szNameFile, struct DVDFileInfo* pFileInfo) {
    // Parameters
    // char* szNameFile; // r30
    // struct DVDFileInfo* pFileInfo; // r31

    // Local variables
    s32 nStatus; // r3
}

// Range: 0x8000FBEC -> 0x8000FCD0
s32 simulatorDVDRead(struct DVDFileInfo* pFileInfo, void* anData, s32 nSizeRead, s32 nOffset, void (* callback)(s32, struct DVDFileInfo*)) {
    // Parameters
    // struct DVDFileInfo* pFileInfo; // r26
    // void* anData; // r27
    // s32 nSizeRead; // r28
    // s32 nOffset; // r29
    // void (* callback)(s32, struct DVDFileInfo*); // r7

    // Local variables
    s32 nStatus; // r31
    s32 bRetry; // r30
}

// Range: 0x8000FB80 -> 0x8000FBEC
s32 simulatorPlayMovie() {
    // References
    // -> struct __anon_0x862E* gpSystem;
}

// Range: 0x8000F350 -> 0x8000FB80
s32 simulatorDrawImage(struct __anon_0xF26F* tpl, s32 nX0, s32 nY0, s32 drawBar, s32 percent) {
    // Parameters
    // struct __anon_0xF26F* tpl; // r24
    // s32 nX0; // r21
    // s32 nY0; // r25
    // s32 drawBar; // r26
    // s32 percent; // r27

    // Local variables
    struct _GXColor color; // r1+0x8C
    f32 matrix[3][4]; // r1+0x5C
    s32 width; // r23
    s32 height; // r22
    f32 g2DviewMtx[3][4]; // r1+0x28

    // References
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
    // -> struct __anon_0x9F80* gpFrame;
    // -> static struct _GXTexObj texObj2$282;
    // -> u8 gbar[1857];
    // -> u8 TexCoords_u8[8];
    // -> u32 Colors_u32[3];
    // -> s16 Vert_s16Bar[12];
    // -> static struct _GXTexObj texObj$281;
}

// Range: 0x8000E794 -> 0x8000F350
s32 simulatorDrawYesNoImage(struct __anon_0xF26F* tplMessage, s32 nX0Message, s32 nY0Message, struct __anon_0xF26F* tplYes, s32 nX0Yes, s32 nY0Yes, struct __anon_0xF26F* tplNo, s32 nX0No, s32 nY0No) {
    // Parameters
    // struct __anon_0xF26F* tplMessage; // r22
    // s32 nX0Message; // r23
    // s32 nY0Message; // r24
    // struct __anon_0xF26F* tplYes; // r25
    // s32 nX0Yes; // r25
    // s32 nY0Yes; // r21
    // struct __anon_0xF26F* tplNo; // r26
    // s32 nX0No; // r26
    // s32 nY0No; // r21

    // Local variables
    struct _GXColor color; // r1+0x68
    f32 matrix[3][4]; // r1+0x38
    s32 width; // r21
    s32 height; // r27

    // References
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
    // -> struct __anon_0x9F80* gpFrame;
    // -> static struct _GXTexObj texObj3$301;
    // -> s32 gHighlightChoice;
    // -> static struct _GXTexObj texObj2$300;
    // -> static struct _GXTexObj texObj1$299;
}

// Range: 0x8000DF54 -> 0x8000E794
s32 simulatorDrawOKImage(struct __anon_0xF26F* tplMessage, s32 nX0Message, s32 nY0Message, struct __anon_0xF26F* tplOK, s32 nX0OK, s32 nY0OK) {
    // Parameters
    // struct __anon_0xF26F* tplMessage; // r24
    // s32 nX0Message; // r21
    // s32 nY0Message; // r25
    // struct __anon_0xF26F* tplOK; // r26
    // s32 nX0OK; // r23
    // s32 nY0OK; // r22

    // Local variables
    struct _GXColor color; // r1+0x5C
    f32 matrix[3][4]; // r1+0x2C
    s32 width; // r23
    s32 height; // r22

    // References
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
    // -> struct __anon_0x9F80* gpFrame;
    // -> static struct _GXTexObj texObj2$321;
    // -> static struct _GXTexObj texObj1$320;
}

// Range: 0x8000DD1C -> 0x8000DF54
s32 simulatorDrawErrorMessage(enum __anon_0x785E simulatorErrorMessage, s32 drawBar, s32 percent) {
    // Parameters
    // enum __anon_0x785E simulatorErrorMessage; // r28
    // s32 drawBar; // r30
    // s32 percent; // r31

    // References
    // -> s32 gbDisplayedError;
    // -> u8 gfatalErr[19265];
    // -> u8 gnoDisk[9473];
    // -> u8 gretryErr[13313];
    // -> u8 greadingDisk[4193];
    // -> u8 gwrongDisk[9473];
    // -> u8 gcoverOpen[11873];
}

// Range: 0x8000DB44 -> 0x8000DD1C
s32 simulatorPrepareMessage(enum __anon_0x785E simulatorErrorMessage) {
    // Parameters
    // enum __anon_0x785E simulatorErrorMessage; // r1+0x8

    // Local variables
    struct DVDFileInfo fileInfo; // r1+0x2C
    char buf[30]; // r1+0xC

    // References
    // -> char gpErrorMessageBuffer[20480];
    // -> u32 gmsg_gf02Size;
    // -> enum __anon_0x785E simulatorMessageCurrent;
    // -> u32 gmsg_sv09Size;
    // -> u32 gmsg_in02Size;
}

// Erased
static s32 simulatorDrawErrorMessageFromDVD(s32 drawBar, s32 percent) {
    // Parameters
    // s32 drawBar; // r29
    // s32 percent; // r30

    // References
    // -> char gpErrorMessageBuffer[20480];
}

// Range: 0x8000D878 -> 0x8000DB44
s32 simulatorDrawYesNoMessageLoop(struct __anon_0xF26F* simulatorQuestion, s32* yes) {
    // Parameters
    // struct __anon_0xF26F* simulatorQuestion; // r26
    // s32* yes; // r27

    // References
    // -> struct __anon_0x862E* gpSystem;
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> s32 gButtonDownToggle;
    // -> u8 gno[257];
    // -> u8 gyes[321];
    // -> s32 gHighlightChoice;
}

// Range: 0x8000D428 -> 0x8000D878
s32 simulatorDrawYesNoMessage(enum __anon_0x785E simulatorMessage, s32* yes) {
    // Parameters
    // enum __anon_0x785E simulatorMessage; // r1+0x8
    // s32* yes; // r30

    // Local variables
    struct DVDFileInfo fileInfo; // r1+0x30
    char buf[30]; // r1+0x10

    // References
    // -> char gpErrorMessageBuffer[20480];
    // -> u32 gmsg_sv08Size;
    // -> enum __anon_0x785E simulatorMessageCurrent;
    // -> u32 gmsg_sv06_5Size;
    // -> u32 gmsg_sv06_4Size;
    // -> u32 gmsg_in01Size;
    // -> u32 gmsg_gf01Size;
    // -> u32 gmsg_ld07Size;
    // -> u32 gmsg_ld06_4Size;
    // -> u32 gmsg_ld05_2Size;
}

// Erased
static s32 simulatorDrawOKMessageLoop(struct __anon_0xF26F* simulatorMessage) {
    // Parameters
    // struct __anon_0xF26F* simulatorMessage; // r27

    // References
    // -> s32 gButtonDownToggle;
    // -> struct __anon_0x862E* gpSystem;
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> u8 gmesgOK[353];
    // -> u8 gyes[321];
}

// Range: 0x8000A138 -> 0x8000D428
s32 simulatorDrawErrorMessageWait(enum __anon_0x785E simulatorErrorMessage) {
    // Parameters
    // enum __anon_0x785E simulatorErrorMessage; // r1+0x8

    // Local variables
    struct DVDFileInfo fileInfo; // r1+0xA0
    char buf[30]; // r1+0x80

    // References
    // -> s32 gButtonDownToggle;
    // -> struct __anon_0x862E* gpSystem;
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> u8 gmesgOK[353];
    // -> char gpErrorMessageBuffer[20480];
    // -> u8 gyes[321];
    // -> u32 gmsg_sv_shareSize;
    // -> enum __anon_0x785E simulatorMessageCurrent;
    // -> u32 gmsg_sv12Size;
    // -> u32 gmsg_sv11Size;
    // -> u32 gmsg_sv10Size;
    // -> u32 gmsg_sv07Size;
    // -> u32 gmsg_sv06_3Size;
    // -> u32 gmsg_sv06_2Size;
    // -> u32 gmsg_sv06_1Size;
    // -> u32 gmsg_sv05_1Size;
    // -> u32 gmsg_sv04Size;
    // -> u32 gmsg_sv03Size;
    // -> u32 gmsg_sv02Size;
    // -> u32 gmsg_sv01_2Size;
    // -> u32 gmsg_sv01Size;
    // -> u32 gmsg_in05Size;
    // -> u32 gmsg_in04Size;
    // -> u32 gmsg_in03Size;
    // -> u32 gmsg_gf06Size;
    // -> u32 gmsg_gf05Size;
    // -> u32 gmsg_gf04Size;
    // -> u32 gmsg_gf03Size;
    // -> u32 gmsg_ld06_3Size;
    // -> u32 gmsg_ld06_2Size;
    // -> u32 gmsg_ld06_1Size;
    // -> u32 gmsg_ld05_1Size;
    // -> u32 gmsg_ld04Size;
    // -> u32 gmsg_ld03Size;
    // -> u32 gmsg_ld02Size;
    // -> u32 gmsg_ld01Size;
}

// Range: 0x8000A088 -> 0x8000A138
void simulatorReset(s32 IPL, s32 forceMenu) {
    // Parameters
    // s32 IPL; // r30
    // s32 forceMenu; // r31

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x80009F2C -> 0x8000A088
void simulatorResetAndPlayMovie() {
    // Local variables
    struct _GXColor color; // r1+0x14
    struct _GXRenderModeObj* simrmode; // r31

    // References
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
    // -> s32 gMovieErrorToggle;
    // -> struct _GXRenderModeObj* rmode;
    // -> struct _MCARD mCard;
}

// Erased
static s32 simulatorSetPart() {}

// Erased
static s32 simulatorAddXtraTime() {}

// Erased
static s32 simulatorShowParts() {}

// Erased
static enum __anon_0xE0B8 simulatorGetView() {
    // References
    // -> static struct __anon_0x6E49* gpCode;
    // -> struct __anon_0x9F80* gpFrame;
}

// Erased
static s32 simulatorSetView(enum __anon_0xE0B8 eView) {
    // Parameters
    // enum __anon_0xE0B8 eView; // r1+0x8

    // References
    // -> static struct __anon_0x6E49* gpCode;
    // -> struct __anon_0x9F80* gpFrame;
}

// Range: 0x80009E54 -> 0x80009F2C
s32 simulatorSetControllerMap(u32* mapData, s32 channel) {
    // Parameters
    // u32* mapData; // r1+0x0
    // s32 channel; // r1+0x4

    // Local variables
    s32 i; // r7

    // References
    // -> static u32 gContMap[4][20];
}

// Range: 0x80009D8C -> 0x80009E54
s32 simulatorCopyControllerMap(u32* mapDataOutput, u32* mapDataInput) {
    // Parameters
    // u32* mapDataOutput; // r1+0x0
    // u32* mapDataInput; // r1+0x4

    // Local variables
    s32 i; // r7
}

// Erased
static s32 simulatorChangeControllerConfig(s32 channel, s32 nCurrButton) {
    // Parameters
    // s32 channel; // r31
    // s32 nCurrButton; // r1+0xC

    // References
    // -> static u32 gContMap[4][20];
    // -> static struct __anon_0xDD13 gSystemRomConfigurationList[1];
    // -> struct __anon_0x862E* gpSystem;
    // -> struct _MCARD mCard;
}

// Range: 0x80009738 -> 0x80009D8C
s32 simulatorReadController(s32 channel, u32* anData) {
    // Parameters
    // s32 channel; // r29
    // u32* anData; // r30

    // Local variables
    f32 subStickTest; // f1
    s32 stickX; // r1+0x8
    s32 stickY; // r1+0x8
    s32 subStickX; // r6
    s32 subStickY; // r7
    s32 nDirButton; // r3

    // References
    // -> static u32 gContMap[4][20];
    // -> static u32 nCurrButton$681;
    // -> struct __anon_0x862E* gpSystem;
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> s32 gButtonDownToggle;
    // -> static u32 nPrevButton$680;
}

// Erased
static void DEMOInitWindow(s32 nSizeX, s32 nSizeY, s32 nColorR, s32 nColorG, s32 nColorB) {
    // Parameters
    // s32 nSizeX; // r3
    // s32 nSizeY; // r1+0xC
    // s32 nColorR; // r29
    // s32 nColorG; // r30
    // s32 nColorB; // r31

    // Local variables
    struct _GXColor color; // r1+0x20
}

// Range: 0x80009730 -> 0x80009738
s32 simulatorShowLoad() {}

// Erased
static s32 simulatorResetController() {}

// Range: 0x800096DC -> 0x80009730
s32 simulatorDetectController(s32 channel) {
    // Parameters
    // s32 channel; // r31

    // Local variables
    struct PADStatus status[4]; // r1+0xC
}

// Range: 0x80009660 -> 0x800096DC
s32 simulatorReadPak(s32 channel, u16 address, u8* data) {
    // Parameters
    // s32 channel; // r29
    // u16 address; // r30
    // u8* data; // r31

    // Local variables
    enum __anon_0xD6BC type; // r1+0x14

    // References
    // -> struct __anon_0x862E* gpSystem;
}

// Range: 0x800095E4 -> 0x80009660
s32 simulatorWritePak(s32 channel, u16 address, u8* data) {
    // Parameters
    // s32 channel; // r29
    // u16 address; // r30
    // u8* data; // r31

    // Local variables
    enum __anon_0xD6BC type; // r1+0x14

    // References
    // -> struct __anon_0x862E* gpSystem;
}

// Range: 0x80009574 -> 0x800095E4
s32 simulatorReadEEPROM(u8 address, u8* data) {
    // Parameters
    // u8 address; // r30
    // u8* data; // r31

    // Local variables
    s32 size; // r1+0x10

    // References
    // -> struct _MCARD mCard;
    // -> struct __anon_0x862E* gpSystem;
}

// Range: 0x80009504 -> 0x80009574
s32 simulatorWriteEEPROM(u8 address, u8* data) {
    // Parameters
    // u8 address; // r30
    // u8* data; // r31

    // Local variables
    s32 size; // r1+0x10

    // References
    // -> struct _MCARD mCard;
    // -> struct __anon_0x862E* gpSystem;
}

// Range: 0x800094D0 -> 0x80009504
s32 simulatorReadSRAM(u32 address, u8* data, s32 size) {
    // Parameters
    // u32 address; // r4
    // u8* data; // r6
    // s32 size; // r5

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8000949C -> 0x800094D0
s32 simulatorWriteSRAM(u32 address, u8* data, s32 size) {
    // Parameters
    // u32 address; // r4
    // u8* data; // r6
    // s32 size; // r5

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x80009468 -> 0x8000949C
s32 simulatorReadFLASH(u32 address, u8* data, s32 size) {
    // Parameters
    // u32 address; // r4
    // u8* data; // r6
    // s32 size; // r5

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x80009434 -> 0x80009468
s32 simulatorWriteFLASH(u32 address, u8* data, s32 size) {
    // Parameters
    // u32 address; // r4
    // u8* data; // r6
    // s32 size; // r5

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8000940C -> 0x80009434
s32 simulatorRumbleStart(s32 channel) {
    // Parameters
    // s32 channel; // r3
}

// Range: 0x800093E4 -> 0x8000940C
s32 simulatorRumbleStop(s32 channel) {
    // Parameters
    // s32 channel; // r3
}

// Erased
static void* sScreenshotAlloc() {}

// Erased
static void sScreenshotFree() {}

// Range: 0x80009204 -> 0x800093E4
s32 simulatorTestReset(s32 IPL, s32 forceMenu, s32 allowReset, s32 usePreviousSettings) {
    // Parameters
    // s32 IPL; // r24
    // s32 forceMenu; // r25
    // s32 allowReset; // r26
    // s32 usePreviousSettings; // r27

    // Local variables
    u32 bFlag; // r1+0x8
    u32 nTick; // r1+0x8
    s32 prevIPLSetting; // r28
    s32 prevForceMenuSetting; // r27
    s32 prevAllowResetSetting; // r1+0x8

    // References
    // -> static u32 gnTickReset;
    // -> static s32 gbReset;
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> s32 gResetBeginFlag;
    // -> s32 gPreviousAllowResetSetting;
    // -> s32 gPreviousForceMenuSetting;
    // -> s32 gPreviousIPLSetting;
}

// Erased
static s32 simulatorDrawText(s32 nX, s32 nY, char* szText, s32 nColorR, s32 nColorG, s32 nColorB) {
    // Parameters
    // s32 nX; // r26
    // s32 nY; // r27
    // char* szText; // r28
    // s32 nColorR; // r29
    // s32 nColorG; // r30
    // s32 nColorB; // r31

    // Local variables
    struct _GXColor color; // r1+0x24
}

// Range: 0x8000916C -> 0x80009204
s32 simulatorDrawMCardText() {
    // References
    // -> char gpErrorMessageBuffer[20480];
}

// Range: 0x8000903C -> 0x8000916C
s32 simulatorMCardPollDrawBar() {
    // Local variables
    f32 rate; // r1+0x8
    s32 nBytes; // r1+0x8

    // References
    // -> char gpErrorMessageBuffer[20480];
    // -> struct _MCARD mCard;
}

// Range: 0x80008F0C -> 0x8000903C
s32 simulatorMCardPollDrawFormatBar() {
    // Local variables
    f32 rate; // r1+0x8
    s32 nBytes; // r1+0x8

    // References
    // -> char gpErrorMessageBuffer[20480];
    // -> struct _MCARD mCard;
}

// Range: 0x80008D04 -> 0x80008F0C
static s32 simulatorDrawCursor(s32 nX, s32 nY) {
    // Parameters
    // s32 nX; // r30
    // s32 nY; // r31

    // Local variables
    struct _GXColor color; // r1+0x18
    s32 nTick; // r4
}

// Erased
static s32 simulatorDrawYesNoScreen(char* line1, char* line2, char* line3, s32* yes) {
    // Parameters
    // char* line1; // r21
    // char* line2; // r22
    // char* line3; // r23
    // s32* yes; // r24

    // Local variables
    s32 nCount; // r25

    // References
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> s32 gButtonDownToggle;
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
}

// Erased
static s32 simulatorDrawOKScreen(char* line1, char* line2, char* line3) {
    // Parameters
    // char* line1; // r22
    // char* line2; // r23
    // char* line3; // r24

    // Local variables
    s32 nCount; // r25

    // References
    // -> s32 gButtonDownToggle;
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
}

// Erased
static s32 simulatorPickROM() {}

// Erased
static s32 simulatorMenu() {}

// Erased
static void MyGXInit() {
    // Local variables
    s32 i; // r31
    f32 identity_mtx[3][4]; // r1+0x50
}

// Erased
static s32 editSoundMenu() {
    // Local variables
    s32* menuValues[3]; // r1+0x94
    s32 menuMinMax[3][2]; // r1+0x7C
    char* menuNames[3]; // r1+0x70
    char* menuHelp[3]; // r1+0x64
    char str[32]; // r1+0x44
    s32 curItem; // r24
    s32 bDone; // r1+0xA0
    s32 i; // r6
    u32 heldButtons; // r7
    u32 buttons; // r8
    u32 downButtons; // r1+0x8
    u8 holdCount[16]; // r1+0x34
    struct _GXColor color[3]; // r1+0x28
    s32 step; // r20
    u32 bit; // r1+0x8
    struct _GXColor* colorP; // r31

    // References
    // -> struct __anon_0xC3E8 DemoPad[4];
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> void* DemoFrameBuffer1;
    // -> u8 DemoStatEnable;
}

// Range: 0x80008BA0 -> 0x80008D04
static s32 simulatorParseArguments() {
    // Local variables
    s32 iArgument; // r23
    char* szText; // r1+0x14
    char* szValue; // r1+0x10

    // References
    // -> static char* gaszArgument[8];
}

// Range: 0x80008B60 -> 0x80008BA0
s32 simulatorGetArgument(enum __anon_0xC03B eType, char** pszArgument) {
    // Parameters
    // enum __anon_0xC03B eType; // r1+0x0
    // char** pszArgument; // r1+0x4

    // References
    // -> static char* gaszArgument[8];
}

// Range: 0x80008568 -> 0x80008B60
s32 xlMain() {
    // Local variables
    struct _GXColor color; // r1+0x3C
    enum __anon_0xBD9F eMode; // r1+0x38
    s32 nSize0; // r1+0x34
    s32 nSize1; // r1+0x30
    s32 iName; // r5
    char* szNameROM; // r1+0x2C
    char acNameROM[32]; // r1+0xC
    s32 rumbleYes; // r1+0x8

    // References
    // -> static struct __anon_0x6E49* gpCode;
    // -> struct __anon_0x9F80* gpFrame;
    // -> struct __anon_0x890B* gpSound;
    // -> struct __anon_0x862E* gpSystem;
    // -> struct _XL_OBJECTTYPE gClassSystem;
    // -> struct _XL_OBJECTTYPE gClassSound;
    // -> struct _XL_OBJECTTYPE gClassFrame;
    // -> struct _XL_OBJECTTYPE gClassCode;
    // -> static char* gaszArgument[8];
    // -> struct _MCARD mCard;
    // -> static u32 gnTickReset;
    // -> static s32 gbReset;
    // -> u8 gmesgOK[353];
    // -> u8 gno[257];
    // -> u8 gyes[321];
    // -> u8 gbar[1857];
    // -> u8 greadingDisk[4193];
    // -> u8 gwrongDisk[9473];
    // -> u8 gfatalErr[19265];
    // -> u8 gretryErr[13313];
    // -> u8 gnoDisk[9473];
    // -> u8 gcoverOpen[11873];
    // -> void* DemoFrameBuffer1;
    // -> void* DemoCurrentBuffer;
    // -> void* DemoFrameBuffer2;
    // -> u8 DemoStatEnable;
    // -> s32 gResetBeginFlag;
    // -> s32 gButtonDownToggle;
    // -> s32 gbDisplayedError;
    // -> s32 gDVDResetToggle;
}
