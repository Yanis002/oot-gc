/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\mcardGCN.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800141E8 -> 0x8001D000
*/

#include "types.h"

// size = 0xA000, address = 0x800F6720
static char gMCardCardWorkArea[40960];

// size = 0x4, address = 0x8012FDA8
s32 currentIdx;

// size = 0x4, address = 0x8012FDAC
static s32 yes$791;

typedef enum __anon_0x1C22C {
    MC_M_NONE = 0,
    MC_M_LD01 = 1,
    MC_M_LD02 = 2,
    MC_M_LD03 = 3,
    MC_M_LD04 = 4,
    MC_M_LD05 = 5,
    MC_M_LD05_2 = 6,
    MC_M_LD06 = 7,
    MC_M_LD06_2 = 8,
    MC_M_LD06_3 = 9,
    MC_M_LD06_4 = 10,
    MC_M_LD07 = 11,
    MC_M_SV01 = 12,
    MC_M_SV01_2 = 13,
    MC_M_SV02 = 14,
    MC_M_SV03 = 15,
    MC_M_SV04 = 16,
    MC_M_SV05 = 17,
    MC_M_SV05_2 = 18,
    MC_M_SV06 = 19,
    MC_M_SV06_2 = 20,
    MC_M_SV06_3 = 21,
    MC_M_SV06_4 = 22,
    MC_M_SV06_5 = 23,
    MC_M_SV07 = 24,
    MC_M_SV08_L = 25,
    MC_M_SV08_L_2 = 26,
    MC_M_SV08 = 27,
    MC_M_SV08_2 = 28,
    MC_M_SV10 = 29,
    MC_M_SV11 = 30,
    MC_M_SV12 = 31,
    MC_M_SV_SHARE = 32,
    MC_M_IN01_L = 33,
    MC_M_IN01_S = 34,
    MC_M_IN02 = 35,
    MC_M_IN03 = 36,
    MC_M_IN04_L = 37,
    MC_M_IN04_S = 38,
    MC_M_IN05 = 39,
    MC_M_GF01_L = 40,
    MC_M_GF01_L_2 = 41,
    MC_M_GF01_S = 42,
    MC_M_GF01_S_2 = 43,
    MC_M_GF02 = 44,
    MC_M_GF03 = 45,
    MC_M_GF04_L = 46,
    MC_M_GF04_S = 47,
    MC_M_GF05 = 48,
    MC_M_GF06 = 49,
} __anon_0x1C22C;

// size = 0x4, address = 0x8012FDB0
static enum __anon_0x1C22C prevMenuEntry$792;

// size = 0x4, address = 0x8012FDB4
static enum __anon_0x1C22C nextMenuEntry$793;

// size = 0x4, address = 0x8012FDB8
s32 mcardNewStart;

// size = 0x4, address = 0x8012FDBC
s32 mcardSaveDisplay;

// size = 0x4, address = 0x8012FDC0
s32 mcardOneTime;

// size = 0x4, address = 0x8012F448
static s32 toggle$1049;

// size = 0x4, address = 0x8012FDC4
static s32 toggle2$1050;

// size = 0x4, address = 0x8012FDC8
static s32 checkFailCount$1650;

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
} __anon_0x1C6A7; // size = 0x28

// size = 0x28, address = 0x80100720
struct OSCalendarTime gDate;

// size = 0x4, address = 0x8012FDCC
s32 bWrite2Card;

// size = 0x28, address = 0x80100748
s32 bNoWriteInCurrentFrame[10];

typedef struct __anon_0x1C8D3 {
    /* 0x00 */ s32 configuration;
    /* 0x04 */ s32 size;
    /* 0x08 */ s32 offset;
    /* 0x0C */ char* buffer;
    /* 0x10 */ s32* writtenBlocks;
    /* 0x14 */ s32 writtenConfig;
} __anon_0x1C8D3; // size = 0x18

typedef struct CARDFileInfo {
    /* 0x00 */ s32 chan;
    /* 0x04 */ s32 fileNo;
    /* 0x08 */ s32 offset;
    /* 0x0C */ s32 length;
    /* 0x10 */ u16 iBlock;
    /* 0x12 */ u16 __padding;
} __anon_0x1CA76; // size = 0x14

typedef struct __anon_0x1CB6E {
    /* 0x000 */ s32 currentGame;
    /* 0x004 */ s32 fileSize;
    /* 0x008 */ char name[33];
    /* 0x02C */ s32 numberOfGames;
    /* 0x030 */ struct __anon_0x1C8D3 game;
    /* 0x048 */ s32 changedDate;
    /* 0x04C */ s32 changedChecksum;
    /* 0x050 */ s32 gameSize[16];
    /* 0x090 */ s32 gameOffset[16];
    /* 0x0D0 */ s32 gameConfigIndex[16];
    /* 0x110 */ char gameName[16][33];
    /* 0x320 */ struct OSCalendarTime time;
    /* 0x348 */ struct CARDFileInfo fileInfo;
} __anon_0x1CB6E; // size = 0x35C

typedef enum __anon_0x1CD84 {
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
} __anon_0x1CD84;

typedef struct _MCARD {
    /* 0x000 */ struct __anon_0x1CB6E file;
    /* 0x35C */ enum __anon_0x1CD84 error;
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
} __anon_0x1D028; // size = 0x7B8

// size = 0x7B8, address = 0x80100770
struct _MCARD mCard;

typedef enum __anon_0x1D4CC {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x1D4CC;

typedef struct __anon_0x1D534 {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x1D534; // size = 0x10

typedef enum __anon_0x1D5E5 {
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
} __anon_0x1D5E5;

typedef enum __anon_0x1D748 {
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
} __anon_0x1D748;

typedef struct __anon_0x1D888 {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0x1D4CC eMode;
    /* 0x10 */ struct __anon_0x1D534 romCopy;
    /* 0x20 */ enum __anon_0x1D5E5 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x1D748 storageDevice;
    /* 0x74 */ u8 anException[16];
} __anon_0x1D888; // size = 0x88

// size = 0x4, address = 0x8012FD48
struct __anon_0x1D888* gpSystem;

typedef struct __anon_0x1DA8C {
    /* 0x0 */ f32 rX;
    /* 0x4 */ f32 rY;
    /* 0x8 */ f32 rSizeX;
    /* 0xC */ f32 rSizeY;
} __anon_0x1DA8C; // size = 0x10

typedef struct __anon_0x1DB26 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 nWidth;
    /* 0x08 */ s32 nFormat;
    /* 0x0C */ void* pData;
    /* 0x10 */ s32 nAddress;
} __anon_0x1DB26; // size = 0x14

typedef struct __anon_0x1DC67 {
    /* 0x0 */ f32 x;
    /* 0x4 */ f32 y;
    /* 0x8 */ f32 z;
} __anon_0x1DC67; // size = 0xC

typedef struct __anon_0x1DCD7 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x1DC67 rVecOrigTowards;
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
} __anon_0x1DCD7; // size = 0x3C

typedef struct __anon_0x1DF07 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x1DC67 rS;
    /* 0x10 */ struct __anon_0x1DC67 rT;
    /* 0x1C */ struct __anon_0x1DC67 rSRaw;
    /* 0x28 */ struct __anon_0x1DC67 rTRaw;
} __anon_0x1DF07; // size = 0x34

typedef struct __anon_0x1DFF0 {
    /* 0x00 */ f32 rSum;
    /* 0x04 */ f32 rS;
    /* 0x08 */ f32 rT;
    /* 0x0C */ struct __anon_0x1DC67 vec;
    /* 0x18 */ u8 anColor[4];
} __anon_0x1DFF0; // size = 0x1C

typedef union __anon_0x1E14F {
    /* 0x0 */ u8 u8[4096];
    /* 0x0 */ u16 u16[2048];
    /* 0x0 */ u32 u32[1024];
    /* 0x0 */ u64 u64[512];
} __anon_0x1E14F;

typedef struct __anon_0x1E1EC {
    /* 0x0 */ union __anon_0x1E14F data;
} __anon_0x1E1EC; // size = 0x1000

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
} __anon_0x1E285;

typedef struct _GXTlutObj {
    /* 0x0 */ u32 dummy[3];
} __anon_0x1E447; // size = 0xC

typedef enum _GXTexWrapMode {
    GX_CLAMP = 0,
    GX_REPEAT = 1,
    GX_MIRROR = 2,
    GX_MAX_TEXWRAPMODE = 3,
} __anon_0x1E48E;

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
} __anon_0x1E4F7; // size = 0x6C

typedef struct __anon_0x1E854 {
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
} __anon_0x1E854; // size = 0x2C

typedef enum __anon_0x1EB36 {
    FMP_NONE = -1,
    FMP_PERSPECTIVE = 0,
    FMP_ORTHOGRAPHIC = 1,
} __anon_0x1EB36;

typedef struct __anon_0x1EBBC {
    /* 0x00 */ s32 nCount;
    /* 0x04 */ f32 rScale;
    /* 0x08 */ f32 rAspect;
    /* 0x0C */ f32 rFieldOfViewY;
    /* 0x10 */ f32 rClipNear;
    /* 0x14 */ f32 rClipFar;
    /* 0x18 */ u32 nAddressFloat;
    /* 0x1C */ u32 nAddressFixed;
    /* 0x20 */ enum __anon_0x1EB36 eProjection;
} __anon_0x1EBBC; // size = 0x24

typedef struct _GXColor {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
} __anon_0x1ED51; // size = 0x4

typedef struct __anon_0x1EE0C {
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
    /* 0x000A8 */ struct __anon_0x1DA8C viewport;
    /* 0x000B8 */ struct __anon_0x1DB26 aBuffer[4];
    /* 0x00108 */ u32 nOffsetDepth0;
    /* 0x0010C */ u32 nOffsetDepth1;
    /* 0x00110 */ s32 nWidthLine;
    /* 0x00114 */ f32 rDepth;
    /* 0x00118 */ f32 rDelta;
    /* 0x0011C */ s32 (* aDraw[4])(void*, void*);
    /* 0x0012C */ s32 nCountLight;
    /* 0x00130 */ struct __anon_0x1DCD7 aLight[8];
    /* 0x00310 */ struct __anon_0x1DF07 lookAt;
    /* 0x00344 */ s32 nCountVertex;
    /* 0x00348 */ struct __anon_0x1DFF0 aVertex[80];
    /* 0x00C08 */ struct __anon_0x1E1EC TMEM;
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
    /* 0x3C348 */ struct __anon_0x1E854 aTile[8];
    /* 0x3C4A8 */ s32 anSizeX[2];
    /* 0x3C4B0 */ s32 anSizeY[2];
    /* 0x3C4B8 */ s32 iHintMatrix;
    /* 0x3C4BC */ s32 iMatrixModel;
    /* 0x3C4C0 */ s32 iHintProjection;
    /* 0x3C4C4 */ f32 matrixView[4][4];
    /* 0x3C504 */ s32 iHintLast;
    /* 0x3C508 */ s32 iHintHack;
    /* 0x3C50C */ enum __anon_0x1EB36 eTypeProjection;
    /* 0x3C510 */ f32 aMatrixModel[10][4][4];
    /* 0x3C790 */ f32 matrixProjection[4][4];
    /* 0x3C7D0 */ f32 matrixProjectionExtra[4][4];
    /* 0x3C810 */ struct __anon_0x1EBBC aMatrixHint[64];
    /* 0x3D110 */ u8 primLODmin;
    /* 0x3D111 */ u8 primLODfrac;
    /* 0x3D112 */ u8 lastTile;
    /* 0x3D113 */ u8 iTileDrawn;
    /* 0x3D114 */ struct _GXColor aColor[5];
    /* 0x3D128 */ u32 nModeVtx;
    /* 0x3D12C */ u16* nTempBuffer;
    /* 0x3D130 */ u16* nCopyBuffer;
    /* 0x3D134 */ u8* nCameraBuffer;
} __anon_0x1EE0C; // size = 0x3D138

typedef enum __anon_0x20255 {
    MC_C_NONE = 0,
    MC_C_CONTINUE = 1,
    MC_C_IPL = 2,
    MC_C_GO_TO_GAME = 3,
    MC_C_CREATE_GAME = 4,
    MC_C_DELETE_GAME = 5,
    MC_C_FORMAT_CARD = 6,
} __anon_0x20255;

// size = 0x4, address = 0x8012FD1C
s32 gButtonDownToggle;

typedef struct __anon_0x20563 {
    /* 0x000 */ char rom[36];
    /* 0x024 */ s32 controllerConfiguration[4][20];
    /* 0x164 */ s32 rumbleConfiguration;
    /* 0x168 */ s32 storageDevice;
    /* 0x16C */ s32 normalControllerConfig;
    /* 0x170 */ s32 currentControllerConfig;
} __anon_0x20563; // size = 0x174

// size = 0x174, address = 0x8012A530
struct __anon_0x20563 gSystemRomConfigurationList[1];

typedef struct _GXTexObj {
    /* 0x0 */ u32 dummy[8];
} __anon_0x212CE; // size = 0x20

typedef struct CARDStat {
    /* 0x00 */ char fileName[32];
    /* 0x20 */ u32 length;
    /* 0x24 */ u32 time;
    /* 0x28 */ u8 gameName[4];
    /* 0x2C */ u8 company[2];
    /* 0x2E */ u8 bannerFormat;
    /* 0x2F */ u8 __padding;
    /* 0x30 */ u32 iconAddr;
    /* 0x34 */ u16 iconFormat;
    /* 0x36 */ u16 iconSpeed;
    /* 0x38 */ u32 commentAddr;
    /* 0x3C */ u32 offsetBanner;
    /* 0x40 */ u32 offsetBannerTlut;
    /* 0x44 */ u32 offsetIcon[8];
    /* 0x64 */ u32 offsetIconTlut;
    /* 0x68 */ u32 offsetData;
} __anon_0x21394; // size = 0x6C

// size = 0x1, address = 0x8012FCF4
u8 gLanguage;

typedef enum _GXTexFilter {
    GX_NEAR = 0,
    GX_LINEAR = 1,
    GX_NEAR_MIP_NEAR = 2,
    GX_LIN_MIP_NEAR = 3,
    GX_NEAR_MIP_LIN = 4,
    GX_LIN_MIP_LIN = 5,
} __anon_0x237A8;

typedef struct __anon_0x23839 {
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
} __anon_0x23839; // size = 0x24

typedef enum _GXTlutFmt {
    GX_TL_IA8 = 0,
    GX_TL_RGB565 = 1,
    GX_TL_RGB5A3 = 2,
    GX_MAX_TLUTFMT = 3,
} __anon_0x23A2C;

typedef struct __anon_0x23A94 {
    /* 0x0 */ u16 numEntries;
    /* 0x2 */ u8 unpacked;
    /* 0x3 */ u8 pad8;
    /* 0x4 */ enum _GXTlutFmt format;
    /* 0x8 */ char* data;
} __anon_0x23A94; // size = 0xC

typedef struct __anon_0x23B60 {
    /* 0x0 */ struct __anon_0x23839* textureHeader;
    /* 0x4 */ struct __anon_0x23A94* CLUTHeader;
} __anon_0x23B60; // size = 0x8

typedef struct __anon_0x23BD1 {
    /* 0x0 */ u32 versionNumber;
    /* 0x4 */ u32 numDescriptors;
    /* 0x8 */ struct __anon_0x23B60* descriptorArray;
} __anon_0x23BD1; // size = 0xC

// Erased
static void mcardUnpackTexPalette(struct __anon_0x23BD1* pal) {
    // Parameters
    // struct __anon_0x23BD1* pal; // r1+0x0

    // Local variables
    u16 i; // r4
}

// Range: 0x8001CE5C -> 0x8001D000
static s32 mcardGCErrorHandler(struct _MCARD* pMCard, s32 gcError) {
    // Parameters
    // struct _MCARD* pMCard; // r1+0x0
    // s32 gcError; // r1+0x4
}

// Range: 0x8001CDFC -> 0x8001CE5C
static s32 mcardCalculateChecksum(struct _MCARD* pMCard, s32* checksum) {
    // Parameters
    // struct _MCARD* pMCard; // r1+0x0
    // s32* checksum; // r1+0x4

    // Local variables
    s32 i; // r1+0x0

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001CC94 -> 0x8001CDFC
static s32 mcardCalculateChecksumFileBlock1(struct _MCARD* pMCard, s32* checksum) {
    // Parameters
    // struct _MCARD* pMCard; // r1+0x0
    // s32* checksum; // r1+0x4

    // Local variables
    s32 i; // r8

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001CB2C -> 0x8001CC94
static s32 mcardCalculateChecksumFileBlock2(struct _MCARD* pMCard, s32* checksum) {
    // Parameters
    // struct _MCARD* pMCard; // r1+0x0
    // s32* checksum; // r1+0x4

    // Local variables
    s32 i; // r8

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001C7D0 -> 0x8001CB2C
static s32 mcardSaveChecksumFileHeader(struct _MCARD* pMCard, char* buffer) {
    // Parameters
    // struct _MCARD* pMCard; // r30
    // char* buffer; // r31

    // Local variables
    char buffer2[8192]; // r1+0x1C
    s32 checksum; // r1+0x18

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardGetFileTime(struct _MCARD* pMCard, struct OSCalendarTime* time) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // struct OSCalendarTime* time; // r30

    // Local variables
    char buffer[544]; // r1+0x10
}

// Range: 0x8001C350 -> 0x8001C7D0
static s32 mcardReplaceFileBlock(struct _MCARD* pMCard, s32 index) {
    // Parameters
    // struct _MCARD* pMCard; // r28
    // s32 index; // r29

    // Local variables
    s32 checksum1; // r1+0x2238
    s32 checksum2; // r30
    char buffer[8192]; // r1+0x238

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001C03C -> 0x8001C350
static s32 mcardCheckChecksumFileHeader(struct _MCARD* pMCard, char* buffer) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // char* buffer; // r27

    // Local variables
    s32 checksum; // r31
    char buffer2[8192]; // r1+0x18
    s32 toggle; // r30

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001BE10 -> 0x8001C03C
static s32 mcardVerifyChecksumFileHeader(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // Local variables
    char* buffer; // r1+0xC

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardCompareName(char* name1, char* name2) {
    // Parameters
    // char* name1; // r4
    // char* name2; // r5
}

// Erased
static s32 mcardCopyName(char* name1, char* name2) {
    // Parameters
    // char* name1; // r4
    // char* name2; // r5

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001BD24 -> 0x8001BE10
static s32 mcardPoll(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001BB90 -> 0x8001BD24
static s32 mcardReadyCard(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // Local variables
    s32 i; // r31
    s32 sectorSize; // r1+0xC

    // References
    // -> static char gMCardCardWorkArea[40960];
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardFinishCard(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r3
}

// Erased
static s32 mcardReadyFile(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31
}

// Erased
static s32 mcardFinishFile(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31
}

// Erased
static s32 mcardReadAnywhereNoTime(struct _MCARD* pMCard, s32 offset, s32 size, char* buffer) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // s32 offset; // r3
    // s32 size; // r30
    // char* buffer; // r31

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardWriteAnywhereNoTime(struct _MCARD* pMCard, s32 offset, s32 size, char* buffer) {
    // Parameters
    // struct _MCARD* pMCard; // r28
    // s32 offset; // r29
    // s32 size; // r30
    // char* buffer; // r31

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardSetFileTime(struct _MCARD* pMCard, struct OSCalendarTime* time) {
    // Parameters
    // struct _MCARD* pMCard; // r30
    // struct OSCalendarTime* time; // r31

    // Local variables
    char buffer[24608]; // r1+0x10

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardTimeCheck(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // Local variables
    struct OSCalendarTime time; // r1+0x22C
}

// Range: 0x8001BA20 -> 0x8001BB90
static s32 mcardReadAnywhere(struct _MCARD* pMCard, s32 offset, s32 size, char* buffer) {
    // Parameters
    // struct _MCARD* pMCard; // r27
    // s32 offset; // r28
    // s32 size; // r29
    // char* buffer; // r30

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001B884 -> 0x8001BA20
static s32 mcardWriteAnywhere(struct _MCARD* pMCard, s32 offset, s32 size, char* buffer) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // s32 offset; // r27
    // s32 size; // r28
    // char* buffer; // r29

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001B6D8 -> 0x8001B884
static s32 mcardWriteAnywherePartial(struct _MCARD* pMCard, s32 offset, s32 size, char* buffer, s32 partialOffset, s32 totalSize) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // s32 offset; // r25
    // s32 size; // r26
    // char* buffer; // r27
    // s32 partialOffset; // r28
    // s32 totalSize; // r29

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001B4B4 -> 0x8001B6D8
static s32 mcardReadFileHeader(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31

    // Local variables
    char buffer[24608]; // r1+0x254

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001B0F8 -> 0x8001B4B4
static s32 mcardWriteFileHeader(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // Local variables
    char buffer[24608]; // r1+0x49C

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001AFA0 -> 0x8001B0F8
static s32 mcardReadFileHeaderInitial(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // Local variables
    char buffer[24608]; // r1+0xC

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001AD7C -> 0x8001AFA0
static s32 mcardWriteFileHeaderInitial(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31

    // Local variables
    char buffer[24608]; // r1+0xC

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardReadCardHeader(struct _MCARD* pMCard, char* cardHeader) {
    // Parameters
    // struct _MCARD* pMCard; // r30
    // char* cardHeader; // r31

    // Local variables
    char buffer[24608]; // r1+0x258

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardWriteCardHeader(struct _MCARD* pMCard, char* cardHeader) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // char* cardHeader; // r30

    // Local variables
    char buffer[24608]; // r1+0x4A0

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001ABB8 -> 0x8001AD7C
static s32 mcardWriteBufferAsynch(struct _MCARD* pMCard, s32 offset) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // s32 offset; // r30

    // Local variables
    struct OSCalendarTime date; // r1+0x258

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001AA14 -> 0x8001ABB8
static s32 mcardReadBufferAsynch(struct _MCARD* pMCard, s32 offset) {
    // Parameters
    // struct _MCARD* pMCard; // r30
    // s32 offset; // r27

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardWriteConfigPrepareWriteBuffer(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r29

    // Local variables
    s32 checksum; // r1+0x4A0

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001A850 -> 0x8001AA14
static s32 mcardWriteConfigAsynch(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardWriteTimePrepareWriteBuffer(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r29

    // Local variables
    char dateString[32]; // r1+0x4A4
    s32 checksum; // r1+0x4A0

    // References
    // -> struct OSCalendarTime gDate;
    // -> struct _MCARD mCard;
}

// Range: 0x8001A64C -> 0x8001A850
static s32 mcardWriteTimeAsynch(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // References
    // -> struct OSCalendarTime gDate;
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardReplaceBlock(struct _MCARD* pMCard, s32 index) {
    // Parameters
    // struct _MCARD* pMCard; // r27
    // s32 index; // r28

    // Local variables
    s32 checksum1; // r1+0x4A4
    s32 checksum2; // r29

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001A2B4 -> 0x8001A64C
s32 mcardReadGameData(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r23

    // Local variables
    s32 checksum1; // r1+0x260
    s32 checksum2; // r26
    s32 i; // r25
    s32 toggle; // r24

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardWriteGameData(struct _MCARD* pMCard, s32 offset) {
    // Parameters
    // struct _MCARD* pMCard; // r3
    // s32 offset; // r4
}

// Erased
static s32 mcardWriteGameDataWait(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r24

    // Local variables
    s32 checksum; // r1+0x258
    s32 i; // r25

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001A24C -> 0x8001A2B4
s32 mcardWriteGameDataReset(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x8001A0D0 -> 0x8001A24C
s32 mcardReInit(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30
}

// Range: 0x8001A078 -> 0x8001A0D0
s32 mcardInit(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31
}

// Range: 0x80019C54 -> 0x8001A078
s32 mcardFileSet(struct _MCARD* pMCard, char* name) {
    // Parameters
    // struct _MCARD* pMCard; // r30
    // char* name; // r4

    // Local variables
    s32 i; // r7

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x80019B20 -> 0x80019C54
s32 mcardGameSetNoSave(struct _MCARD* pMCard, s32 size) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // s32 size; // r30

    // Local variables
    s32* testInt; // r31
    char testChar; // r30

    // References
    // -> u8 gLanguage;
    // -> struct __anon_0x1D888* gpSystem;
}

// Range: 0x800196AC -> 0x80019B20
s32 mcardGameSet(struct _MCARD* pMCard, char* name) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // char* name; // r28

    // Local variables
    s32 i; // r29
    s32* testInt; // r29
    char testChar; // r30

    // References
    // -> u8 gLanguage;
    // -> struct __anon_0x1D888* gpSystem;
}

// Range: 0x80018F4C -> 0x800196AC
s32 mcardFileCreate(struct _MCARD* pMCard, char* name, char* comment, char* icon, char* banner, s32 size) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // char* name; // r21
    // char* comment; // r25
    // char* icon; // r27
    // char* banner; // r26
    // s32 size; // r1+0x1C

    // Local variables
    s32 freeBytes; // r1+0x114
    s32 freeFiles; // r1+0x110
    s32 totalSize; // r30
    s32 i; // r21
    char* buffer; // r1+0x10C
    struct _GXTexObj texObj; // r1+0xEC
    void* dataP; // r4
    struct CARDStat cardStatus; // r1+0x80
    s32 fileNo; // r27
    struct OSCalendarTime date; // r1+0x58
    char dateString[32]; // r1+0x38

    // References
    // -> struct __anon_0x1D888* gpSystem;
    // -> struct _MCARD mCard;
}

// Range: 0x800187C0 -> 0x80018F4C
s32 mcardGameCreate(struct _MCARD* pMCard, char* name, s32 defaultConfiguration, s32 size) {
    // Parameters
    // struct _MCARD* pMCard; // r25
    // char* name; // r30
    // s32 defaultConfiguration; // r29
    // s32 size; // r27

    // Local variables
    s32 i; // r26

    // References
    // -> struct _MCARD mCard;
}

// Erased
static s32 mcardGameCreateDuringGame(struct _MCARD* pMCard, char* name, s32 size) {
    // Parameters
    // struct _MCARD* pMCard; // r25
    // char* name; // r29
    // s32 size; // r24

    // Local variables
    s32 i; // r26

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x80018688 -> 0x800187C0
s32 mcardCardErase(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r29

    // Local variables
    s32 slot; // r30
}

// Range: 0x800184F8 -> 0x80018688
s32 mcardFileErase(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30
}

// Range: 0x80018350 -> 0x800184F8
s32 mcardGameErase(struct _MCARD* pMCard, s32 index) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // s32 index; // r30
}

// Erased
static s32 mcardFileRelease(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r30
}

// Range: 0x800182CC -> 0x80018350
s32 mcardGameRelease(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31
}

// Range: 0x8001829C -> 0x800182CC
s32 mcardRead(struct _MCARD* pMCard, s32 address, s32 size, char* data) {
    // Parameters
    // struct _MCARD* pMCard; // r3
    // s32 address; // r4
    // s32 size; // r5
    // char* data; // r6
}

// Range: 0x800178F8 -> 0x8001829C
s32 mcardMenu(struct _MCARD* pMCard, enum __anon_0x1C22C menuEntry, enum __anon_0x20255* pCommand) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // enum __anon_0x1C22C menuEntry; // r4
    // enum __anon_0x20255* pCommand; // r30

    // References
    // -> static enum __anon_0x1C22C nextMenuEntry$793;
    // -> static s32 yes$791;
    // -> static enum __anon_0x1C22C prevMenuEntry$792;
}

// Range: 0x80017818 -> 0x800178F8
s32 mcardOpenError(struct _MCARD* pMCard, enum __anon_0x20255* pCommand) {
    // Parameters
    // struct _MCARD* pMCard; // r3
    // enum __anon_0x20255* pCommand; // r4
}

// Range: 0x80017738 -> 0x80017818
s32 mcardOpenDuringGameError(struct _MCARD* pMCard, enum __anon_0x20255* pCommand) {
    // Parameters
    // struct _MCARD* pMCard; // r3
    // enum __anon_0x20255* pCommand; // r4
}

// Erased
static s32 corruptionCheck(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r23

    // Local variables
    char* buffer; // r1+0x4AC
    s32 checksum1; // r1+0x4A8
    s32 checksum2; // r26
    s32 i; // r25
    s32 toggle; // r24

    // References
    // -> struct _MCARD mCard;
}

// Range: 0x80016E80 -> 0x80017738
s32 mcardWrite(struct _MCARD* pMCard, s32 address, s32 size, char* data) {
    // Parameters
    // struct _MCARD* pMCard; // r27
    // s32 address; // r28
    // s32 size; // r29
    // char* data; // r30

    // Local variables
    s32 i; // r1+0x8
    char testByte; // r25

    // References
    // -> s32 mcardNewStart;
    // -> static s32 toggle2$1050;
    // -> s32 mcardSaveDisplay;
    // -> s32 mcardOneTime;
    // -> static s32 toggle$1049;
    // -> struct __anon_0x1D888* gpSystem;
    // -> s32 currentIdx;
    // -> s32 bNoWriteInCurrentFrame[10];
    // -> s32 bWrite2Card;
}

// Erased
static s32 mcardGetError(struct _MCARD* pMCard, enum __anon_0x1CD84* pMCardError) {
    // Parameters
    // struct _MCARD* pMCard; // r1+0x0
    // enum __anon_0x1CD84* pMCardError; // r1+0x4
}

// Erased
static s32 mcardCheckSpace(struct _MCARD* pMCard, s32 size) {
    // Parameters
    // struct _MCARD* pMCard; // r30
    // s32 size; // r31

    // Local variables
    s32 freeBytes; // r1+0x18
    s32 freeFiles; // r1+0x14
}

// Range: 0x80016130 -> 0x80016E80
s32 mcardOpen(struct _MCARD* pMCard, char* fileName, char* comment, char* icon, char* banner, char* gameName, s32* defaultConfiguration, s32 fileSize, s32 gameSize) {
    // Parameters
    // struct _MCARD* pMCard; // r31
    // char* fileName; // r29
    // char* comment; // r25
    // char* icon; // r23
    // char* banner; // r22
    // char* gameName; // r30
    // s32* defaultConfiguration; // r21
    // s32 fileSize; // r26
    // s32 gameSize; // r28

    // Local variables
    s32 i; // r24
    enum __anon_0x20255 command; // r1+0x34

    // References
    // -> s32 mcardNewStart;
    // -> struct __anon_0x20563 gSystemRomConfigurationList[1];
    // -> s32 gButtonDownToggle;
}

// Range: 0x800155E0 -> 0x80016130
s32 mcardOpenDuringGame(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r31

    // Local variables
    s32 i; // r28
    enum __anon_0x20255 command; // r1+0x18
    s32 loadToggle; // r27

    // References
    // -> s32 gButtonDownToggle;
}

// Range: 0x800146D8 -> 0x800155E0
s32 mcardStore(struct _MCARD* pMCard) {
    // Parameters
    // struct _MCARD* pMCard; // r29

    // Local variables
    s32 i; // r30
    s32 checksum; // r1+0x4DC
    s32 bufferOffset; // r4
    enum __anon_0x20255 command; // r1+0x4C8

    // References
    // -> static s32 checkFailCount$1650;
    // -> struct _MCARD mCard;
    // -> struct OSCalendarTime gDate;
}

// Range: 0x800144DC -> 0x800146D8
s32 mcardUpdate() {
    // Local variables
    s32 j; // r5
    s32 toggle; // r26
    s32 prevIndex; // r25
    s32 index; // r24
    s32 counter; // r23

    // References
    // -> struct _MCARD mCard;
    // -> s32 bWrite2Card;
}

// Range: 0x80014460 -> 0x800144DC
static void convert_i8i5(void* i8buf, void* i5buf, u32 num) {
    // Parameters
    // void* i8buf; // r3
    // void* i5buf; // r4
    // u32 num; // r1+0x8

    // Local variables
    const u8* i8ptr; // r3
    u8* i5ptr; // r4
    s32 bitcnt; // r5
    s32 bitcnt2; // r7
    u32 bits; // r8
    u32 i; // r1+0x0
    u32 c1; // r1+0x0
}

// Range: 0x800143E0 -> 0x80014460
static void convert_i5i8(void* i5buf, void* i8buf, u32 num) {
    // Parameters
    // void* i5buf; // r1+0x0
    // void* i8buf; // r4
    // u32 num; // r1+0x8

    // Local variables
    const u8* i5ptr; // r6
    u8* i8ptr; // r4
    s32 bitcnt; // r1+0x0
    s32 bitcnt2; // r7
    u32 bits; // r8
    u32 i; // r1+0x0
    u32 c1; // r5
}

// Range: 0x800142EC -> 0x800143E0
s32 mcardSaveCamera() {
    // Local variables
    struct __anon_0x1EE0C* pFrame; // r31
    void* i8Buffer; // r1+0x10
    void* i5Buffer; // r1+0xC
    u8* ptr; // r30

    // References
    // -> struct __anon_0x1D888* gpSystem;
}

// Erased
static s32 mcardSaveZelda2Camera(struct _MCARD* pMCard, u32 address) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // u32 address; // r30

    // Local variables
    struct __anon_0x1EE0C* pFrame; // r31
    void* i8Buffer; // r1+0x14
    void* i5Buffer; // r1+0x10

    // References
    // -> struct __anon_0x1D888* gpSystem;
}

// Range: 0x800141E8 -> 0x800142EC
static s32 mcardLoadZelda2Camera(struct _MCARD* pMCard, u32 address) {
    // Parameters
    // struct _MCARD* pMCard; // r29
    // u32 address; // r30

    // Local variables
    struct __anon_0x1EE0C* pFrame; // r31
    void* i8Buffer; // r1+0x14
    void* i5Buffer; // r1+0x10

    // References
    // -> struct __anon_0x1D888* gpSystem;
}
