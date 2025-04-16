/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\rom.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8006D608 -> 0x80072EA8
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x51932; // size = 0x10

// size = 0x10, address = 0x800E4EA8
struct _XL_OBJECTTYPE gClassROM;

// size = 0x328, address = 0x800E4EB8
static u32 ganOffsetBlock_ZELDA2P[202];

// size = 0x800, address = 0x800E51E0
static u16 gaPixelDisk1[1024];

// size = 0x800, address = 0x800E59E0
static u16 gaPixelDisk2[1024];

// size = 0x4, address = 0x8012FEB8
static s32 gbProgress;

// size = 0x4, address = 0x8012FEBC
static void* gpImageBack;

// size = 0x4, address = 0x8012FEC0
static s32 iImage$625;

typedef struct _GXTexObj {
    /* 0x0 */ u32 dummy[8];
} __anon_0x51BC4; // size = 0x20

// size = 0x20, address = 0x8012A8C0
static struct _GXTexObj texObj$640;

// size = 0x20, address = 0x8012A8E0
static struct _GXTexObj texObj2$641;

typedef enum __anon_0x51C7B {
    RLM_NONE = -1,
    RLM_PART = 0,
    RLM_FULL = 1,
    RLM_COUNT_ = 2,
} __anon_0x51C7B;

typedef struct __anon_0x51CDA {
    /* 0x0 */ s32 iCache;
    /* 0x4 */ u32 nSize;
    /* 0x8 */ u32 nTickUsed;
    /* 0xC */ char keep;
} __anon_0x51CDA; // size = 0x10

typedef struct __anon_0x51DEE {
    /* 0x00 */ s32 bWait;
    /* 0x04 */ s32 (* pCallback)();
    /* 0x08 */ u8* pTarget;
    /* 0x0C */ u32 nSize;
    /* 0x10 */ u32 nOffset;
} __anon_0x51DEE; // size = 0x14

typedef struct __anon_0x51ECE {
    /* 0x00 */ s32 bWait;
    /* 0x04 */ s32 bDone;
    /* 0x08 */ s32 nResult;
    /* 0x0C */ u8* anData;
    /* 0x10 */ s32 (* pCallback)();
    /* 0x14 */ s32 iCache;
    /* 0x18 */ s32 iBlock;
    /* 0x1C */ s32 nOffset;
    /* 0x20 */ u32 nOffset0;
    /* 0x24 */ u32 nOffset1;
    /* 0x28 */ u32 nSize;
    /* 0x2C */ u32 nSizeRead;
} __anon_0x51ECE; // size = 0x30

typedef struct __anon_0x520B9 {
    /* 0x0 */ s32 nPosition;
    /* 0x4 */ s32 nLineNumber;
} __anon_0x520B9; // size = 0x8

typedef struct __anon_0x5211D {
    /* 0x0 */ s32 nMode;
    /* 0x4 */ s32 nModeSave;
    /* 0x8 */ struct __anon_0x520B9 save;
} __anon_0x5211D; // size = 0x10

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x521FE; // size = 0x20

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
} __anon_0x5236E; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (* callback)(s32, struct DVDFileInfo*);
} __anon_0x52594; // size = 0x3C

typedef struct __anon_0x5264C {
    /* 0x00000 */ void* pHost;
    /* 0x00004 */ void* pBuffer;
    /* 0x00008 */ s32 bFlip;
    /* 0x0000C */ s32 bLoad;
    /* 0x00010 */ char acNameFile[513];
    /* 0x00214 */ u32 nSize;
    /* 0x00218 */ enum __anon_0x51C7B eModeLoad;
    /* 0x0021C */ struct __anon_0x51CDA aBlock[4096];
    /* 0x1021C */ u32 nTick;
    /* 0x10220 */ u8* pCacheRAM;
    /* 0x10224 */ u8 anBlockCachedRAM[1024];
    /* 0x10624 */ u8 anBlockCachedARAM[2046];
    /* 0x10E24 */ struct __anon_0x51DEE copy;
    /* 0x10E38 */ struct __anon_0x51ECE load;
    /* 0x10E68 */ s32 nCountBlockRAM;
    /* 0x10E6C */ s32 nSizeCacheRAM;
    /* 0x10E70 */ u8 acHeader[64];
    /* 0x10EB0 */ u32* anOffsetBlock;
    /* 0x10EB4 */ s32 nCountOffsetBlocks;
    /* 0x10EB8 */ struct __anon_0x5211D tagFile;
    /* 0x10EC8 */ u32 nChecksum;
    /* 0x10ECC */ struct DVDFileInfo fileInfo;
    /* 0x10F08 */ s32 offsetToRom;
} __anon_0x5264C; // size = 0x10F0C

typedef enum __anon_0x52A84 {
    XLFT_NONE = -1,
    XLFT_TEXT = 0,
    XLFT_BINARY = 1,
} __anon_0x52A84;

typedef struct tXL_FILE {
    /* 0x00 */ void* pData;
    /* 0x04 */ char* acLine;
    /* 0x08 */ void* pBuffer;
    /* 0x0C */ s32 nAttributes;
    /* 0x10 */ s32 nSize;
    /* 0x14 */ s32 nOffset;
    /* 0x18 */ enum __anon_0x52A84 eType;
    /* 0x1C */ s32 iLine;
    /* 0x20 */ s32 nLineNumber;
    /* 0x24 */ struct DVDFileInfo info;
} __anon_0x52AD8; // size = 0x60

typedef struct __anon_0x52C64 {
    /* 0x0 */ struct tXL_FILE* pFile;
} __anon_0x52C64; // size = 0x4

typedef enum __anon_0x52CA1 {
    RTT_NONE = -1,
    RTT_CODE = 0,
    RTT_CODE_INVALID = 1,
    RTT_NAME = 2,
    RTT_NAME_INVALID = 3,
    RTT_DATA_STRING = 4,
    RTT_DATA_NUMBER = 5,
    RTT_DONE = 6,
    RTT_LAST_ = 7,
} __anon_0x52CA1;

typedef struct __anon_0x5477F {
    /* 0x0 */ s32 nOffsetHost;
    /* 0x4 */ s32 nAddressN64;
} __anon_0x5477F; // size = 0x8

typedef struct cpu_callerID {
    /* 0x0 */ s32 N64address;
    /* 0x4 */ s32 GCNaddress;
} __anon_0x547E5; // size = 0x8

typedef struct cpu_function {
    /* 0x00 */ void* pnBase;
    /* 0x04 */ void* pfCode;
    /* 0x08 */ s32 nCountJump;
    /* 0x0C */ struct __anon_0x5477F* aJump;
    /* 0x10 */ s32 nAddress0;
    /* 0x14 */ s32 nAddress1;
    /* 0x18 */ struct cpu_callerID* block;
    /* 0x1C */ s32 callerID_total;
    /* 0x20 */ s32 callerID_flag;
    /* 0x24 */ u32 nChecksum;
    /* 0x28 */ s32 timeToLive;
    /* 0x2C */ s32 memory_size;
    /* 0x30 */ s32 heapID;
    /* 0x34 */ s32 heapWhere;
    /* 0x38 */ s32 treeheapWhere;
    /* 0x3C */ struct cpu_function* prev;
    /* 0x40 */ struct cpu_function* left;
    /* 0x44 */ struct cpu_function* right;
} __anon_0x54858; // size = 0x48

typedef union __anon_0x54B34 {
    /* 0x0 */ char _0s8;
    /* 0x1 */ char _1s8;
    /* 0x2 */ char _2s8;
    /* 0x3 */ char _3s8;
    /* 0x4 */ char _4s8;
    /* 0x5 */ char _5s8;
    /* 0x6 */ char _6s8;
    /* 0x7 */ char s8;
    /* 0x0 */ s16 _0s16;
    /* 0x2 */ s16 _1s16;
    /* 0x4 */ s16 _2s16;
    /* 0x6 */ s16 s16;
    /* 0x0 */ s32 _0s32;
    /* 0x4 */ s32 s32;
    /* 0x0 */ s64 s64;
    /* 0x0 */ u8 _0u8;
    /* 0x1 */ u8 _1u8;
    /* 0x2 */ u8 _2u8;
    /* 0x3 */ u8 _3u8;
    /* 0x4 */ u8 _4u8;
    /* 0x5 */ u8 _5u8;
    /* 0x6 */ u8 _6u8;
    /* 0x7 */ u8 u8;
    /* 0x0 */ u16 _0u16;
    /* 0x2 */ u16 _1u16;
    /* 0x4 */ u16 _2u16;
    /* 0x6 */ u16 u16;
    /* 0x0 */ u32 _0u32;
    /* 0x4 */ u32 u32;
    /* 0x0 */ u64 u64;
} __anon_0x54B34;

typedef union __anon_0x54F48 {
    /* 0x0 */ f32 _0f32;
    /* 0x4 */ f32 f32;
    /* 0x0 */ f64 f64;
    /* 0x0 */ s32 _0s32;
    /* 0x4 */ s32 s32;
    /* 0x0 */ s64 s64;
    /* 0x0 */ u32 _0u32;
    /* 0x4 */ u32 u32;
    /* 0x0 */ u64 u64;
} __anon_0x54F48;

typedef struct __anon_0x55456 {
    /* 0x00 */ s32 nType;
    /* 0x04 */ void* pObject;
    /* 0x08 */ s32 nOffsetAddress;
    /* 0x0C */ s32 (* pfGet8)(void*, u32, char*);
    /* 0x10 */ s32 (* pfGet16)(void*, u32, s16*);
    /* 0x14 */ s32 (* pfGet32)(void*, u32, s32*);
    /* 0x18 */ s32 (* pfGet64)(void*, u32, s64*);
    /* 0x1C */ s32 (* pfPut8)(void*, u32, char*);
    /* 0x20 */ s32 (* pfPut16)(void*, u32, s16*);
    /* 0x24 */ s32 (* pfPut32)(void*, u32, s32*);
    /* 0x28 */ s32 (* pfPut64)(void*, u32, s64*);
    /* 0x2C */ u32 nAddressPhysical0;
    /* 0x30 */ u32 nAddressPhysical1;
} __anon_0x55456; // size = 0x34

typedef struct cpu_treeRoot {
    /* 0x00 */ u16 total;
    /* 0x04 */ s32 total_memory;
    /* 0x08 */ s32 root_address;
    /* 0x0C */ s32 start_range;
    /* 0x10 */ s32 end_range;
    /* 0x14 */ s32 cache_miss;
    /* 0x18 */ s32 cache[20];
    /* 0x68 */ struct cpu_function* left;
    /* 0x6C */ struct cpu_function* right;
    /* 0x70 */ s32 kill_limit;
    /* 0x74 */ s32 kill_number;
    /* 0x78 */ s32 side;
    /* 0x7C */ struct cpu_function* restore;
    /* 0x80 */ s32 restore_side;
} __anon_0x55724; // size = 0x84

typedef struct _CPU_ADDRESS {
    /* 0x0 */ s32 nN64;
    /* 0x4 */ s32 nHost;
    /* 0x8 */ struct cpu_function* pFunction;
} __anon_0x55965; // size = 0xC

typedef struct __anon_0x55A1A {
    /* 0x0 */ u32 nAddress;
    /* 0x4 */ u32 nOpcodeOld;
    /* 0x8 */ u32 nOpcodeNew;
} __anon_0x55A1A; // size = 0xC

typedef struct OSContext {
    /* 0x000 */ u32 gpr[32];
    /* 0x080 */ u32 cr;
    /* 0x084 */ u32 lr;
    /* 0x088 */ u32 ctr;
    /* 0x08C */ u32 xer;
    /* 0x090 */ f64 fpr[32];
    /* 0x190 */ u32 fpscr_pad;
    /* 0x194 */ u32 fpscr;
    /* 0x198 */ u32 srr0;
    /* 0x19C */ u32 srr1;
    /* 0x1A0 */ u16 mode;
    /* 0x1A2 */ u16 state;
    /* 0x1A4 */ u32 gqr[8];
    /* 0x1C4 */ u32 psf_pad;
    /* 0x1C8 */ f64 psf[32];
} __anon_0x55B45; // size = 0x2C8

typedef struct OSAlarm {
    /* 0x00 */ void (* handler)(struct OSAlarm*, struct OSContext*);
    /* 0x04 */ u32 tag;
    /* 0x08 */ s64 fire;
    /* 0x10 */ struct OSAlarm* prev;
    /* 0x14 */ struct OSAlarm* next;
    /* 0x18 */ s64 period;
    /* 0x20 */ s64 start;
} __anon_0x55D9C; // size = 0x28

typedef struct cpu_optimize {
    /* 0x00 */ u32 validCheck;
    /* 0x04 */ u32 destGPR_check;
    /* 0x08 */ s32 destGPR;
    /* 0x0C */ s32 destGPR_mapping;
    /* 0x10 */ u32 destFPR_check;
    /* 0x14 */ s32 destFPR;
    /* 0x18 */ u32 addr_check;
    /* 0x1C */ s32 addr_last;
    /* 0x20 */ u32 checkType;
    /* 0x24 */ u32 checkNext;
} __anon_0x55EB7; // size = 0x28

typedef struct _CPU {
    /* 0x00000 */ s32 nMode;
    /* 0x00004 */ s32 nTick;
    /* 0x00008 */ void* pHost;
    /* 0x00010 */ s64 nLo;
    /* 0x00018 */ s64 nHi;
    /* 0x00020 */ s32 nCountAddress;
    /* 0x00024 */ s32 iDeviceDefault;
    /* 0x00028 */ u32 nPC;
    /* 0x0002C */ u32 nWaitPC;
    /* 0x00030 */ u32 nCallLast;
    /* 0x00034 */ struct cpu_function* pFunctionLast;
    /* 0x00038 */ s32 nReturnAddrLast;
    /* 0x0003C */ s32 survivalTimer;
    /* 0x00040 */ union __anon_0x54B34 aGPR[32];
    /* 0x00140 */ union __anon_0x54F48 aFPR[32];
    /* 0x00240 */ u64 aTLB[48][5];
    /* 0x009C0 */ s32 anFCR[32];
    /* 0x00A40 */ s64 anCP0[32];
    /* 0x00B40 */ s32 (* pfStep)(struct _CPU*);
    /* 0x00B44 */ s32 (* pfJump)(struct _CPU*);
    /* 0x00B48 */ s32 (* pfCall)(struct _CPU*);
    /* 0x00B4C */ s32 (* pfIdle)(struct _CPU*);
    /* 0x00B50 */ s32 (* pfRam)(struct _CPU*);
    /* 0x00B54 */ s32 (* pfRamF)(struct _CPU*);
    /* 0x00B58 */ u32 nTickLast;
    /* 0x00B5C */ u32 nRetrace;
    /* 0x00B60 */ u32 nRetraceUsed;
    /* 0x00B64 */ struct __anon_0x55456* apDevice[256];
    /* 0x00F64 */ u8 aiDevice[65536];
    /* 0x10F64 */ void* gHeap1;
    /* 0x10F68 */ void* gHeap2;
    /* 0x10F6C */ u32 aHeap1Flag[192];
    /* 0x1126C */ u32 aHeap2Flag[13];
    /* 0x112A0 */ struct cpu_treeRoot* gTree;
    /* 0x112A4 */ struct _CPU_ADDRESS aAddressCache[256];
    /* 0x11EA4 */ s32 nCountCodeHack;
    /* 0x11EA8 */ struct __anon_0x55A1A aCodeHack[32];
    /* 0x12028 */ s64 nTimeRetrace;
    /* 0x12030 */ struct OSAlarm alarmRetrace;
    /* 0x12058 */ u32 nFlagRAM;
    /* 0x1205C */ u32 nFlagCODE;
    /* 0x12060 */ u32 nCompileFlag;
    /* 0x12064 */ struct cpu_optimize nOptimize;
} __anon_0x56064; // size = 0x12090

typedef enum __anon_0x56885 {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x56885;

typedef struct __anon_0x568E8 {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x568E8; // size = 0x10

typedef enum __anon_0x56999 {
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
} __anon_0x56999;

typedef enum __anon_0x56AF7 {
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
} __anon_0x56AF7;

typedef struct __anon_0x56C32 {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0x56885 eMode;
    /* 0x10 */ struct __anon_0x568E8 romCopy;
    /* 0x20 */ enum __anon_0x56999 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x56AF7 storageDevice;
    /* 0x74 */ u8 anException[16];
} __anon_0x56C32; // size = 0x88

// size = 0x4, address = 0x8012FD48
struct __anon_0x56C32* gpSystem;

// size = 0x4, address = 0x8012FD20
s32 gDVDResetToggle;

// size = 0x1, address = 0x8012FCF4
u8 gLanguage;

// size = 0x4, address = 0x8012FE28
u32 gnFlagZelda;

// size = 0x4, address = 0x8012FD44
s32 gbDisplayedError;

// size = 0x0, address = 0x8012FD0C
u8 greadingDisk[];

typedef struct __anon_0x572D6 {
    /* 0x0 */ f32 rX;
    /* 0x4 */ f32 rY;
    /* 0x8 */ f32 rSizeX;
    /* 0xC */ f32 rSizeY;
} __anon_0x572D6; // size = 0x10

typedef struct __anon_0x57370 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 nWidth;
    /* 0x08 */ s32 nFormat;
    /* 0x0C */ void* pData;
    /* 0x10 */ s32 nAddress;
} __anon_0x57370; // size = 0x14

typedef struct __anon_0x574B1 {
    /* 0x0 */ f32 x;
    /* 0x4 */ f32 y;
    /* 0x8 */ f32 z;
} __anon_0x574B1; // size = 0xC

typedef struct __anon_0x57521 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x574B1 rVecOrigTowards;
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
} __anon_0x57521; // size = 0x3C

typedef struct __anon_0x57751 {
    /* 0x00 */ s32 bTransformed;
    /* 0x04 */ struct __anon_0x574B1 rS;
    /* 0x10 */ struct __anon_0x574B1 rT;
    /* 0x1C */ struct __anon_0x574B1 rSRaw;
    /* 0x28 */ struct __anon_0x574B1 rTRaw;
} __anon_0x57751; // size = 0x34

typedef struct __anon_0x5783A {
    /* 0x00 */ f32 rSum;
    /* 0x04 */ f32 rS;
    /* 0x08 */ f32 rT;
    /* 0x0C */ struct __anon_0x574B1 vec;
    /* 0x18 */ u8 anColor[4];
} __anon_0x5783A; // size = 0x1C

typedef union __anon_0x57999 {
    /* 0x0 */ u8 u8[4096];
    /* 0x0 */ u16 u16[2048];
    /* 0x0 */ u32 u32[1024];
    /* 0x0 */ u64 u64[512];
} __anon_0x57999;

typedef struct __anon_0x57A36 {
    /* 0x0 */ union __anon_0x57999 data;
} __anon_0x57A36; // size = 0x1000

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
} __anon_0x57ACF;

typedef struct _GXTlutObj {
    /* 0x0 */ u32 dummy[3];
} __anon_0x57C91; // size = 0xC

typedef enum _GXTexWrapMode {
    GX_CLAMP = 0,
    GX_REPEAT = 1,
    GX_MIRROR = 2,
    GX_MAX_TEXWRAPMODE = 3,
} __anon_0x57CD8;

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
} __anon_0x57D41; // size = 0x6C

typedef struct __anon_0x5809E {
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
} __anon_0x5809E; // size = 0x2C

typedef enum __anon_0x58380 {
    FMP_NONE = -1,
    FMP_PERSPECTIVE = 0,
    FMP_ORTHOGRAPHIC = 1,
} __anon_0x58380;

typedef struct __anon_0x58401 {
    /* 0x00 */ s32 nCount;
    /* 0x04 */ f32 rScale;
    /* 0x08 */ f32 rAspect;
    /* 0x0C */ f32 rFieldOfViewY;
    /* 0x10 */ f32 rClipNear;
    /* 0x14 */ f32 rClipFar;
    /* 0x18 */ u32 nAddressFloat;
    /* 0x1C */ u32 nAddressFixed;
    /* 0x20 */ enum __anon_0x58380 eProjection;
} __anon_0x58401; // size = 0x24

typedef struct __anon_0x585B8 {
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
    /* 0x000A8 */ struct __anon_0x572D6 viewport;
    /* 0x000B8 */ struct __anon_0x57370 aBuffer[4];
    /* 0x00108 */ u32 nOffsetDepth0;
    /* 0x0010C */ u32 nOffsetDepth1;
    /* 0x00110 */ s32 nWidthLine;
    /* 0x00114 */ f32 rDepth;
    /* 0x00118 */ f32 rDelta;
    /* 0x0011C */ s32 (* aDraw[4])(void*, void*);
    /* 0x0012C */ s32 nCountLight;
    /* 0x00130 */ struct __anon_0x57521 aLight[8];
    /* 0x00310 */ struct __anon_0x57751 lookAt;
    /* 0x00344 */ s32 nCountVertex;
    /* 0x00348 */ struct __anon_0x5783A aVertex[80];
    /* 0x00C08 */ struct __anon_0x57A36 TMEM;
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
    /* 0x3C348 */ struct __anon_0x5809E aTile[8];
    /* 0x3C4A8 */ s32 anSizeX[2];
    /* 0x3C4B0 */ s32 anSizeY[2];
    /* 0x3C4B8 */ s32 iHintMatrix;
    /* 0x3C4BC */ s32 iMatrixModel;
    /* 0x3C4C0 */ s32 iHintProjection;
    /* 0x3C4C4 */ f32 matrixView[4][4];
    /* 0x3C504 */ s32 iHintLast;
    /* 0x3C508 */ s32 iHintHack;
    /* 0x3C50C */ enum __anon_0x58380 eTypeProjection;
    /* 0x3C510 */ f32 aMatrixModel[10][4][4];
    /* 0x3C790 */ f32 matrixProjection[4][4];
    /* 0x3C7D0 */ f32 matrixProjectionExtra[4][4];
    /* 0x3C810 */ struct __anon_0x58401 aMatrixHint[64];
    /* 0x3D110 */ u8 primLODmin;
    /* 0x3D111 */ u8 primLODfrac;
    /* 0x3D112 */ u8 lastTile;
    /* 0x3D113 */ u8 iTileDrawn;
    /* 0x3D114 */ struct _GXColor aColor[5];
    /* 0x3D128 */ u32 nModeVtx;
    /* 0x3D12C */ u16* nTempBuffer;
    /* 0x3D130 */ u16* nCopyBuffer;
    /* 0x3D134 */ u8* nCameraBuffer;
} __anon_0x585B8; // size = 0x3D138

// size = 0x4, address = 0x8012FD50
struct __anon_0x585B8* gpFrame;

// size = 0x0, address = 0x800E0A40
s16 Vert_s16Bar[];

// size = 0x0, address = 0x800E02C0
u8 gbar[];

// size = 0x0, address = 0x800E0A60
u32 Colors_u32[];

// size = 0x0, address = 0x800E0A80
u8 TexCoords_u8[];

typedef struct _GXColor {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
} __anon_0x59475; // size = 0x4

typedef enum _GXTexFilter {
    GX_NEAR = 0,
    GX_LINEAR = 1,
    GX_NEAR_MIP_NEAR = 2,
    GX_LIN_MIP_NEAR = 3,
    GX_NEAR_MIP_LIN = 4,
    GX_LIN_MIP_LIN = 5,
} __anon_0x59550;

typedef struct __anon_0x595E1 {
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
} __anon_0x595E1; // size = 0x24

typedef enum _GXTlutFmt {
    GX_TL_IA8 = 0,
    GX_TL_RGB565 = 1,
    GX_TL_RGB5A3 = 2,
    GX_MAX_TLUTFMT = 3,
} __anon_0x597D4;

typedef struct __anon_0x5983C {
    /* 0x0 */ u16 numEntries;
    /* 0x2 */ u8 unpacked;
    /* 0x3 */ u8 pad8;
    /* 0x4 */ enum _GXTlutFmt format;
    /* 0x8 */ char* data;
} __anon_0x5983C; // size = 0xC

typedef struct __anon_0x59908 {
    /* 0x0 */ struct __anon_0x595E1* textureHeader;
    /* 0x4 */ struct __anon_0x5983C* CLUTHeader;
} __anon_0x59908; // size = 0x8

typedef struct __anon_0x59979 {
    /* 0x0 */ u32 versionNumber;
    /* 0x4 */ u32 numDescriptors;
    /* 0x8 */ struct __anon_0x59908* descriptorArray;
} __anon_0x59979; // size = 0xC

typedef enum __anon_0x5A43D {
    RCT_NONE = -1,
    RCT_RAM = 0,
    RCT_ARAM = 1,
} __anon_0x5A43D;

typedef enum __anon_0x5AB93 {
    XLFTT_NONE = -1,
    XLFTT_LABEL = 0,
    XLFTT_NUMBER = 1,
    XLFTT_STRING = 2,
    XLFTT_SYMBOL = 3,
    XLFTT_LAST_ = 4,
} __anon_0x5AB93;

// Range: 0x800727F8 -> 0x80072EA8
static s32 romGetTagToken(struct __anon_0x5264C* pROM, struct tXL_FILE* pFile, enum __anon_0x52CA1* peToken, char* acData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r27
    // struct tXL_FILE* pFile; // r28
    // enum __anon_0x52CA1* peToken; // r29
    // char* acData; // r30

    // Local variables
    u32 nChecksum; // r1+0x60
    enum __anon_0x5AB93 eTypeToken; // r1+0x5C
    char acToken[65]; // r1+0x18
}

// Erased
static s32 romTestARAM() {}

// Erased
static s32 romMatchRange(struct __anon_0x5264C* pROM, u32 nOffset, s32* pnOffset0, s32* pnOffset1) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // u32 nOffset; // r1+0x4
    // s32* pnOffset0; // r1+0x8
    // s32* pnOffset1; // r1+0xC

    // Local variables
    s32 iBlock; // r10
}

// Erased
static s32 romFreeBlock(struct __anon_0x5264C* pROM, s32 iBlock) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // s32 iBlock; // r1+0x4

    // Local variables
    s32 iCache; // r4
    struct __anon_0x51CDA* pBlock; // r1+0x0
}

// Range: 0x80072734 -> 0x800727F8
static s32 romFindFreeCache(struct __anon_0x5264C* pROM, s32* piCache, enum __anon_0x5A43D eType) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // s32* piCache; // r1+0x4
    // enum __anon_0x5A43D eType; // r1+0x8

    // Local variables
    s32 iBlock; // r7
}

// Range: 0x80072584 -> 0x80072734
static s32 romFindOldestBlock(struct __anon_0x5264C* pROM, s32* piBlock, enum __anon_0x5A43D eTypeCache, s32 whichBlock) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // s32* piBlock; // r1+0x4
    // enum __anon_0x5A43D eTypeCache; // r1+0x8
    // s32 whichBlock; // r1+0xC

    // Local variables
    struct __anon_0x51CDA* pBlock; // r7
    s32 iBlock; // r8
    s32 iBlockOldest; // r9
    u32 nTick; // r10
    u32 nTickDelta; // r11
    u32 nTickDeltaOldest; // r12
}

// Range: 0x80072370 -> 0x80072584
static s32 romMakeFreeCache(struct __anon_0x5264C* pROM, s32* piCache, enum __anon_0x5A43D eType) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r30
    // s32* piCache; // r31
    // enum __anon_0x5A43D eType; // r1+0x10

    // Local variables
    s32 iCache; // r1+0x20
    s32 iBlockOldest; // r1+0x1C
}

// Range: 0x80072118 -> 0x80072370
static s32 romSetBlockCache(struct __anon_0x5264C* pROM, s32 iBlock, enum __anon_0x5A43D eType) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r30
    // s32 iBlock; // r1+0xC
    // enum __anon_0x5A43D eType; // r1+0x10

    // Local variables
    struct __anon_0x51CDA* pBlock; // r31
    s32 iCacheRAM; // r1+0x18
    s32 iCacheARAM; // r1+0x14
    s32 nOffsetRAM; // r28
    s32 nOffsetARAM; // r29
}

// Range: 0x80072024 -> 0x80072118
static s32 __romLoadBlock_Complete(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x8

    // Local variables
    u32 iData; // r9
    u32 nData; // r1+0x8
}

// Range: 0x80072008 -> 0x80072024
static void __romLoadBlock_CompleteGCN(s32 nResult) {
    // Parameters
    // s32 nResult; // r1+0x0

    // Local variables
    struct __anon_0x5264C* pROM; // r4

    // References
    // -> struct __anon_0x56C32* gpSystem;
}

// Range: 0x80071F0C -> 0x80072008
static s32 romLoadBlock(struct __anon_0x5264C* pROM, s32 iBlock, s32 iCache, s32 (* pCallback)()) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r31
    // s32 iBlock; // r1+0xC
    // s32 iCache; // r1+0x10
    // s32 (* pCallback)(); // r1+0x14

    // Local variables
    u8* anData; // r8
    s32 nSizeRead; // r10
    u32 nSize; // r10
    u32 nOffset; // r1+0x8
}

// Erased
static s32 romKeepCheck() {}

// Range: 0x80071DD8 -> 0x80071F0C
static s32 romLoadRange(struct __anon_0x5264C* pROM, s32 begin, s32 end, s32* blockCount, s32 whichBlock, s32 (* pfProgress)(f32)) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r28
    // s32 begin; // r1+0xC
    // s32 end; // r1+0x10
    // s32* blockCount; // r29
    // s32 whichBlock; // r1+0x18
    // s32 (* pfProgress)(f32); // r30

    // Local variables
    s32 iCache; // r1+0x20
    u32 iBlock; // r23
    u32 iBlockLast; // r31
}

// Range: 0x80071CBC -> 0x80071DD8
static s32 romLoadRangeBlock(struct __anon_0x5264C* pROM, s32 beginBlock, s32 endBlock, s32* blockCount, s32 whichBlock, s32 (* pfProgress)(f32)) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r23
    // s32 beginBlock; // r4
    // s32 endBlock; // r24
    // s32* blockCount; // r25
    // s32 whichBlock; // r1+0x18
    // s32 (* pfProgress)(f32); // r26

    // Local variables
    s32 iBlock; // r27
    s32 iCache; // r1+0x20
}

// Range: 0x80070FBC -> 0x80071CBC
s32 romReloadRange(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8

    // Local variables
    s32 iBlock; // r8
    s32 blockCount; // r1+0x10
    struct __anon_0x5264C* pROM; // r31
}

// Range: 0x80070D24 -> 0x80070FBC
static s32 romCacheGame_ZELDA(f32 rProgress) {
    // Parameters
    // f32 rProgress; // f31

    // Local variables
    s32 nSize; // r31
    f32 matrix44[4][4]; // r1+0x5C
    f32 matrix[3][4]; // r1+0x2C
    struct _GXTexObj textureObject; // r1+0xC

    // References
    // -> static s32 gbProgress;
    // -> static s32 iImage$625;
    // -> struct __anon_0x56C32* gpSystem;
    // -> static void* gpImageBack;
    // -> s32 gbDisplayedError;
}

// Range: 0x80070578 -> 0x80070D24
static s32 romCacheEnding_ZELDA(f32 rProgress) {
    // Parameters
    // f32 rProgress; // f31

    // Local variables
    struct _GXColor color; // r1+0x80
    f32 matrix[3][4]; // r1+0x50
    s32 width; // r24
    s32 height; // r30
    s32 nX0; // r31
    s32 nY0; // r26
    struct __anon_0x59979* tpl; // r25
    f32 g2DviewMtx[3][4]; // r1+0x1C
    s32 percent; // r24

    // References
    // -> struct __anon_0x585B8* gpFrame;
    // -> static struct _GXTexObj texObj2$641;
    // -> u8 gbar[];
    // -> u8 TexCoords_u8[];
    // -> u32 Colors_u32[];
    // -> s16 Vert_s16Bar[];
    // -> static struct _GXTexObj texObj$640;
    // -> u8 greadingDisk[];
}

// Range: 0x8006F1A4 -> 0x80070578
static s32 romCacheGame(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r31

    // Local variables
    s32 blockCount; // r1+0x14
    s32 bZeldaE; // r7
    s32 bZeldaF; // r4
    s32 bZeldaG; // r5
    s32 bZeldaI; // r6
    s32 bZeldaS; // r8
    s32 nSize; // r29
    char* szName; // r5
    struct tXL_FILE* pFile; // r1+0xC

    // References
    // -> s32 gDVDResetToggle;
    // -> static u32 ganOffsetBlock_ZELDA2P[202];
    // -> s32 gbDisplayedError;
    // -> static s32 gbProgress;
    // -> static void* gpImageBack;
    // -> u8 gLanguage;
    // -> u32 gnFlagZelda;
}

// Range: 0x8006F188 -> 0x8006F1A4
static s32 __romLoadUpdate_Complete() {
    // References
    // -> struct __anon_0x56C32* gpSystem;
}

// Erased
static s32 romLoadInProgress(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
}

// Range: 0x8006F028 -> 0x8006F188
static s32 romLoadUpdate(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r29

    // Local variables
    s32 iCache; // r1+0xC
    struct __anon_0x51CDA* pBlock; // r4
    u32 iBlock0; // r31
    u32 iBlock1; // r25
    struct _CPU* pCPU; // r30
}

// Range: 0x8006F00C -> 0x8006F028
static s32 __romCopyUpdate_Complete() {
    // References
    // -> struct __anon_0x56C32* gpSystem;
}

// Range: 0x8006ED88 -> 0x8006F00C
static s32 romCopyUpdate(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r29

    // Local variables
    struct __anon_0x51CDA* pBlock; // r28
    s32 iCache; // r1+0xC
    s32 nTickLast; // r27
    u8* anData; // r1+0x8
    u32 iBlock; // r26
    u32 nSize; // r26
    u32 nOffsetBlock; // r1+0x8
    struct _CPU* pCPU; // r30
}

// Erased
static s32 romCacheAllBlocks(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r27

    // Local variables
    s32 iCache; // r1+0xC
    u32 iBlock; // r28
    u32 iBlockLast; // r1+0x8
}

// Range: 0x8006E920 -> 0x8006ED88
static s32 romLoadFullOrPart(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r31

    // Local variables
    struct tXL_FILE* pFile; // r1+0x1C
    s32 iBlock; // r1+0x8
    s32 nLoad; // r27
    s32 nStep; // r28
    s32 iData; // r7
    u32 nData; // r1+0x8
}

// Erased
static s32 romLoad(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r31
}

// Range: 0x8006E724 -> 0x8006E920
s32 romGetPC(struct __anon_0x5264C* pROM, u64* pnPC) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // u64* pnPC; // r31

    // Local variables
    s32 nOffset; // r5
    u32 nData; // r5
    u32 iData; // r1+0x8
    u32 anData[1024]; // r1+0x18
}

// Range: 0x8006E6F0 -> 0x8006E724
s32 romGetCode(struct __anon_0x5264C* pROM, char* acCode) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // char* acCode; // r1+0x4
}

// Erased
static s32 romGetName(struct __anon_0x5264C* pROM, char* acName) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // char* acName; // r1+0x4

    // Local variables
    s32 iName; // r10
}

// Erased
static s32 romGetMask(struct __anon_0x5264C* pROM, s32* pnMask) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // s32* pnMask; // r1+0x4
}

// Range: 0x8006E57C -> 0x8006E6F0
s32 romTestCode(struct __anon_0x5264C* pROM, char* acCode) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // char* acCode; // r1+0x4

    // Local variables
    s32 iCode; // r5
    s32 nCode1; // r5
    s32 nCode2; // r6
}

// Range: 0x8006E574 -> 0x8006E57C
static s32 romPut8() {}

// Range: 0x8006E56C -> 0x8006E574
static s32 romPut16() {}

// Range: 0x8006E564 -> 0x8006E56C
static s32 romPut32() {}

// Range: 0x8006E55C -> 0x8006E564
static s32 romPut64() {}

// Range: 0x8006E4EC -> 0x8006E55C
static s32 romGet8(struct __anon_0x5264C* pROM, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // u32 nAddress; // r4
    // char* pData; // r31

    // Local variables
    u8 nData; // r1+0x14
}

// Range: 0x8006E47C -> 0x8006E4EC
static s32 romGet16(struct __anon_0x5264C* pROM, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // u32 nAddress; // r4
    // s16* pData; // r31

    // Local variables
    u16 nData; // r1+0x14
}

// Range: 0x8006E40C -> 0x8006E47C
static s32 romGet32(struct __anon_0x5264C* pROM, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // u32 nAddress; // r4
    // s32* pData; // r31

    // Local variables
    u32 nData; // r1+0x14
}

// Range: 0x8006E390 -> 0x8006E40C
static s32 romGet64(struct __anon_0x5264C* pROM, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // u32 nAddress; // r4
    // s64* pData; // r31

    // Local variables
    u64 nData; // r1+0x18
}

// Range: 0x8006E388 -> 0x8006E390
static s32 romPutDebug8() {}

// Range: 0x8006E380 -> 0x8006E388
static s32 romPutDebug16() {}

// Range: 0x8006E378 -> 0x8006E380
static s32 romPutDebug32() {}

// Range: 0x8006E370 -> 0x8006E378
static s32 romPutDebug64() {}

// Range: 0x8006E360 -> 0x8006E370
static s32 romGetDebug8(char* pData) {
    // Parameters
    // char* pData; // r1+0x8
}

// Range: 0x8006E350 -> 0x8006E360
static s32 romGetDebug16(s16* pData) {
    // Parameters
    // s16* pData; // r1+0x8
}

// Range: 0x8006E340 -> 0x8006E350
static s32 romGetDebug32(s32* pData) {
    // Parameters
    // s32* pData; // r1+0x8
}

// Range: 0x8006E32C -> 0x8006E340
static s32 romGetDebug64(s64* pData) {
    // Parameters
    // s64* pData; // r1+0x8
}

// Erased
static s32 romGetSize(struct __anon_0x5264C* pROM, s32* pnSize) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // s32* pnSize; // r1+0x4
}

// Range: 0x8006E094 -> 0x8006E32C
s32 romCopy(struct __anon_0x5264C* pROM, void* pTarget, s32 nOffset, u32 nSize, s32 (* pCallback)()) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r27
    // void* pTarget; // r28
    // s32 nOffset; // r29
    // u32 nSize; // r30
    // s32 (* pCallback)(); // r31

    // Local variables
    void* pSource; // r4
    struct tXL_FILE* pFile; // r1+0x1C
}

// Range: 0x8006DDEC -> 0x8006E094
s32 romCopyImmediate(struct __anon_0x5264C* pROM, void* pTarget, s32 nOffsetROM, u32 nSize) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r26
    // void* pTarget; // r27
    // s32 nOffsetROM; // r28
    // u32 nSize; // r29

    // Local variables
    void* pSource; // r4
    struct __anon_0x51CDA* pBlock; // r24
    s32 nOffsetARAM; // r23
    s32 nSizeCopy; // r31
    s32 nOffsetBlock; // r1+0x8
    s32 iBlock; // r23
    s32 nSizeCopyARAM; // r22
    s32 nSizeDMA; // r21
    s32 nOffset; // r20
    s32 nOffsetTarget; // r19
    u8* pBuffer; // r30
    u8 anBuffer[608]; // r1+0x1C
    s32 iCache; // r1+0x18
}

// Range: 0x8006DC8C -> 0x8006DDEC
s32 romUpdate(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r31

    // Local variables
    s32 nStatus; // r30
}

// Erased
static s32 romCopyBusy(struct __anon_0x5264C* pROM) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
}

// Range: 0x8006DBF0 -> 0x8006DC8C
s32 romSetCacheSize(struct __anon_0x5264C* pROM, s32 nSize) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r30
    // s32 nSize; // r4
}

// Erased
static s32 romGetCacheSize(struct __anon_0x5264C* pROM, s32* pnSize) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // s32* pnSize; // r1+0x4
}

// Range: 0x8006D880 -> 0x8006DBF0
s32 romSetImage(struct __anon_0x5264C* pROM, char* szNameFile) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r29
    // char* szNameFile; // r30

    // Local variables
    struct tXL_FILE* pFile; // r1+0x464
    enum __anon_0x52CA1 eToken; // r1+0x460
    s32 iCode; // r1+0x8
    s32 iName; // r5
    s32 nSize; // r1+0x45C
    char acToken[65]; // r1+0x418
    u32 anData[256]; // r1+0x18
}

// Range: 0x8006D838 -> 0x8006D880
s32 romGetImage(struct __anon_0x5264C* pROM, char* acNameFile) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x0
    // char* acNameFile; // r1+0x4

    // Local variables
    s32 iName; // r6
}

// Erased
static s32 romOpenTags(struct __anon_0x5264C* pROM, struct __anon_0x52C64* pTag) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r1+0x8
    // struct __anon_0x52C64* pTag; // r30
}

// Erased
static s32 romFreeTags(struct __anon_0x52C64* pTag) {
    // Parameters
    // struct __anon_0x52C64* pTag; // r4
}

// Erased
static s32 romFindTagLabel(struct __anon_0x5264C* pROM, struct __anon_0x52C64* pTag, char* szLabel) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r29
    // struct __anon_0x52C64* pTag; // r30
    // char* szLabel; // r31

    // Local variables
    enum __anon_0x52CA1 eToken; // r1+0x58
    char acToken[65]; // r1+0x14
}

// Erased
static s32 romGetTagNumber(struct __anon_0x5264C* pROM, struct __anon_0x52C64* pTag, s32* pnData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // struct __anon_0x52C64* pTag; // r4
    // s32* pnData; // r31

    // Local variables
    enum __anon_0x52CA1 eToken; // r1+0x58
    char acToken[65]; // r1+0x14
}

// Erased
static s32 romGetTagString(struct __anon_0x5264C* pROM, struct __anon_0x52C64* pTag, char* acString, s32 nSizeString) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // struct __anon_0x52C64* pTag; // r4
    // char* acString; // r30
    // s32 nSizeString; // r31

    // Local variables
    enum __anon_0x52CA1 eToken; // r1+0x5C
    char acToken[65]; // r1+0x18
}

// Erased
static s32 romGetTagBoolean(struct __anon_0x5264C* pROM, struct __anon_0x52C64* pTag, s32* pnData) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r3
    // struct __anon_0x52C64* pTag; // r4
    // s32* pnData; // r31

    // Local variables
    s32 nValue; // r1+0x5C
    enum __anon_0x52CA1 eToken; // r1+0x58
    char acToken[65]; // r1+0x14
}

// Range: 0x8006D608 -> 0x8006D838
s32 romEvent(struct __anon_0x5264C* pROM, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x5264C* pROM; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
