/*
    Compile unit: C:\HOMEBOY\STEPHEN\Japanese Ocarina\Fire\rom.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8006D3AC -> 0x8006FEC0
*/

#include "dolphin/types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ int nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ int (*pfEvent)(void*, int, void*);
} __anon_0x4CD3A; // size = 0x10

// size = 0x10, address = 0x800ED8E8
struct _XL_OBJECTTYPE gClassROM;

// size = 0x318, address = 0x800ED8F8
static unsigned int ganOffsetBlock_ZLJ[198];

// size = 0x318, address = 0x800EDC10
static unsigned int ganOffsetBlock_URAZLJ[198];

// size = 0x4, address = 0x80135760
static int gbProgress;

// size = 0x4, address = 0x80135764
static void* gpImageBack;

// size = 0x4, address = 0x80135768
static int iImage$294;

typedef enum __anon_0x4CF87 {
    RLM_NONE = -1,
    RLM_PART = 0,
    RLM_FULL = 1,
    RLM_COUNT_ = 2,
} __anon_0x4CF87;

typedef struct __anon_0x4CFE6 {
    /* 0x0 */ int iCache;
    /* 0x4 */ unsigned int nSize;
    /* 0x8 */ unsigned int nTickUsed;
    /* 0xC */ char keep;
} __anon_0x4CFE6; // size = 0x10

typedef struct __anon_0x4D0FA {
    /* 0x00 */ int bWait;
    /* 0x04 */ int (*pCallback)();
    /* 0x08 */ u8* pTarget;
    /* 0x0C */ unsigned int nSize;
    /* 0x10 */ unsigned int nOffset;
} __anon_0x4D0FA; // size = 0x14

typedef struct __anon_0x4D1DA {
    /* 0x00 */ int bWait;
    /* 0x04 */ int bDone;
    /* 0x08 */ int nResult;
    /* 0x0C */ u8* anData;
    /* 0x10 */ int (*pCallback)();
    /* 0x14 */ int iCache;
    /* 0x18 */ int iBlock;
    /* 0x1C */ int nOffset;
    /* 0x20 */ unsigned int nOffset0;
    /* 0x24 */ unsigned int nOffset1;
    /* 0x28 */ unsigned int nSize;
    /* 0x2C */ unsigned int nSizeRead;
} __anon_0x4D1DA; // size = 0x30

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x4D425; // size = 0x20

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
    /* 0x28 */ void (*callback)(s32, struct DVDCommandBlock*);
    /* 0x2C */ void* userData;
} __anon_0x4D595; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (*callback)(s32, struct DVDFileInfo*);
} __anon_0x4D7BB; // size = 0x3C

typedef struct __anon_0x4D873 {
    /* 0x00000 */ void* pHost;
    /* 0x00004 */ void* pBuffer;
    /* 0x00008 */ int bFlip;
    /* 0x0000C */ int bLoad;
    /* 0x00010 */ char acNameFile[513];
    /* 0x00214 */ unsigned int nSize;
    /* 0x00218 */ enum __anon_0x4CF87 eModeLoad;
    /* 0x0021C */ struct __anon_0x4CFE6 aBlock[4096];
    /* 0x1021C */ unsigned int nTick;
    /* 0x10220 */ u8* pCacheRAM;
    /* 0x10224 */ u8 anBlockCachedRAM[1024];
    /* 0x10624 */ u8 anBlockCachedARAM[2046];
    /* 0x10E24 */ struct __anon_0x4D0FA copy;
    /* 0x10E38 */ struct __anon_0x4D1DA load;
    /* 0x10E68 */ int nCountBlockRAM;
    /* 0x10E6C */ int nSizeCacheRAM;
    /* 0x10E70 */ u8 acHeader[64];
    /* 0x10EB0 */ unsigned int* anOffsetBlock;
    /* 0x10EB4 */ int nCountOffsetBlocks;
    /* 0x10EB8 */ struct DVDFileInfo fileInfo;
    /* 0x10EF4 */ int offsetToRom;
} __anon_0x4D873; // size = 0x10EF8

typedef enum __anon_0x4DD08 {
    XLFT_NONE = -1,
    XLFT_TEXT = 0,
    XLFT_BINARY = 1,
} __anon_0x4DD08;

typedef struct tXL_FILE {
    /* 0x00 */ int iBuffer;
    /* 0x04 */ void* pData;
    /* 0x08 */ void* pBuffer;
    /* 0x0C */ int nAttributes;
    /* 0x10 */ int nSize;
    /* 0x14 */ int nOffset;
    /* 0x18 */ enum __anon_0x4DD08 eType;
    /* 0x1C */ struct DVDFileInfo info;
} __anon_0x4DD5C; // size = 0x58

typedef struct __anon_0x4F17B {
    /* 0x0 */ int nOffsetHost;
    /* 0x4 */ int nAddressN64;
} __anon_0x4F17B; // size = 0x8

typedef struct cpu_callerID {
    /* 0x0 */ int N64address;
    /* 0x4 */ int GCNaddress;
} __anon_0x4F1E1; // size = 0x8

typedef struct cpu_function {
    /* 0x00 */ void* pnBase;
    /* 0x04 */ void* pfCode;
    /* 0x08 */ int nCountJump;
    /* 0x0C */ struct __anon_0x4F17B* aJump;
    /* 0x10 */ int nAddress0;
    /* 0x14 */ int nAddress1;
    /* 0x18 */ struct cpu_callerID* block;
    /* 0x1C */ int callerID_total;
    /* 0x20 */ int callerID_flag;
    /* 0x24 */ unsigned int nChecksum;
    /* 0x28 */ int timeToLive;
    /* 0x2C */ int memory_size;
    /* 0x30 */ int heapID;
    /* 0x34 */ int heapWhere;
    /* 0x38 */ int treeheapWhere;
    /* 0x3C */ struct cpu_function* prev;
    /* 0x40 */ struct cpu_function* left;
    /* 0x44 */ struct cpu_function* right;
} __anon_0x4F254; // size = 0x48

typedef union __anon_0x4F530 {
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
    /* 0x0 */ int _0s32;
    /* 0x4 */ int s32;
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
    /* 0x0 */ unsigned int _0u32;
    /* 0x4 */ unsigned int u32;
    /* 0x0 */ u64 u64;
} __anon_0x4F530;

typedef union __anon_0x4F944 {
    /* 0x0 */ f32 _0f32;
    /* 0x4 */ f32 f32;
    /* 0x0 */ f64 f64;
    /* 0x0 */ int _0s32;
    /* 0x4 */ int s32;
    /* 0x0 */ s64 s64;
    /* 0x0 */ unsigned int _0u32;
    /* 0x4 */ unsigned int u32;
    /* 0x0 */ u64 u64;
} __anon_0x4F944;

typedef struct __anon_0x4FE52 {
    /* 0x00 */ int nType;
    /* 0x04 */ void* pObject;
    /* 0x08 */ int nOffsetAddress;
    /* 0x0C */ int (*pfGet8)(void*, unsigned int, char*);
    /* 0x10 */ int (*pfGet16)(void*, unsigned int, s16*);
    /* 0x14 */ int (*pfGet32)(void*, unsigned int, int*);
    /* 0x18 */ int (*pfGet64)(void*, unsigned int, s64*);
    /* 0x1C */ int (*pfPut8)(void*, unsigned int, char*);
    /* 0x20 */ int (*pfPut16)(void*, unsigned int, s16*);
    /* 0x24 */ int (*pfPut32)(void*, unsigned int, int*);
    /* 0x28 */ int (*pfPut64)(void*, unsigned int, s64*);
    /* 0x2C */ unsigned int nAddressPhysical0;
    /* 0x30 */ unsigned int nAddressPhysical1;
} __anon_0x4FE52; // size = 0x34

typedef struct cpu_treeRoot {
    /* 0x00 */ u16 total;
    /* 0x04 */ int total_memory;
    /* 0x08 */ int root_address;
    /* 0x0C */ int start_range;
    /* 0x10 */ int end_range;
    /* 0x14 */ int cache_miss;
    /* 0x18 */ int cache[20];
    /* 0x68 */ struct cpu_function* left;
    /* 0x6C */ struct cpu_function* right;
    /* 0x70 */ int kill_limit;
    /* 0x74 */ int kill_number;
    /* 0x78 */ int side;
    /* 0x7C */ struct cpu_function* restore;
    /* 0x80 */ int restore_side;
} __anon_0x50120; // size = 0x84

typedef struct _CPU_ADDRESS {
    /* 0x0 */ int nN64;
    /* 0x4 */ int nHost;
    /* 0x8 */ struct cpu_function* pFunction;
} __anon_0x50361; // size = 0xC

typedef struct __anon_0x50416 {
    /* 0x0 */ unsigned int nAddress;
    /* 0x4 */ unsigned int nOpcodeOld;
    /* 0x8 */ unsigned int nOpcodeNew;
} __anon_0x50416; // size = 0xC

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
} __anon_0x50541; // size = 0x2C8

typedef struct OSAlarm {
    /* 0x00 */ void (*handler)(struct OSAlarm*, struct OSContext*);
    /* 0x04 */ u32 tag;
    /* 0x08 */ s64 fire;
    /* 0x10 */ struct OSAlarm* prev;
    /* 0x14 */ struct OSAlarm* next;
    /* 0x18 */ s64 period;
    /* 0x20 */ s64 start;
} __anon_0x50798; // size = 0x28

typedef struct cpu_optimize {
    /* 0x00 */ unsigned int validCheck;
    /* 0x04 */ unsigned int destGPR_check;
    /* 0x08 */ int destGPR;
    /* 0x0C */ int destGPR_mapping;
    /* 0x10 */ unsigned int destFPR_check;
    /* 0x14 */ int destFPR;
    /* 0x18 */ unsigned int addr_check;
    /* 0x1C */ int addr_last;
    /* 0x20 */ unsigned int checkType;
    /* 0x24 */ unsigned int checkNext;
} __anon_0x508B3; // size = 0x28

typedef struct _CPU {
    /* 0x00000 */ int nMode;
    /* 0x00004 */ int nTick;
    /* 0x00008 */ void* pHost;
    /* 0x00010 */ s64 nLo;
    /* 0x00018 */ s64 nHi;
    /* 0x00020 */ int nCountAddress;
    /* 0x00024 */ int iDeviceDefault;
    /* 0x00028 */ unsigned int nPC;
    /* 0x0002C */ unsigned int nWaitPC;
    /* 0x00030 */ unsigned int nCallLast;
    /* 0x00034 */ struct cpu_function* pFunctionLast;
    /* 0x00038 */ int nReturnAddrLast;
    /* 0x0003C */ int survivalTimer;
    /* 0x00040 */ union __anon_0x4F530 aGPR[32];
    /* 0x00140 */ union __anon_0x4F944 aFPR[32];
    /* 0x00240 */ u64 aTLB[48][5];
    /* 0x009C0 */ int anFCR[32];
    /* 0x00A40 */ s64 anCP0[32];
    /* 0x00B40 */ int (*pfStep)(struct _CPU*);
    /* 0x00B44 */ int (*pfJump)(struct _CPU*);
    /* 0x00B48 */ int (*pfCall)(struct _CPU*);
    /* 0x00B4C */ int (*pfIdle)(struct _CPU*);
    /* 0x00B50 */ int (*pfRam)(struct _CPU*);
    /* 0x00B54 */ int (*pfRamF)(struct _CPU*);
    /* 0x00B58 */ unsigned int nTickLast;
    /* 0x00B5C */ unsigned int nRetrace;
    /* 0x00B60 */ unsigned int nRetraceUsed;
    /* 0x00B64 */ struct __anon_0x4FE52* apDevice[256];
    /* 0x00F64 */ u8 aiDevice[65536];
    /* 0x10F64 */ void* gHeap1;
    /* 0x10F68 */ void* gHeap2;
    /* 0x10F6C */ unsigned int aHeap1Flag[192];
    /* 0x1126C */ unsigned int aHeap2Flag[13];
    /* 0x112A0 */ struct cpu_treeRoot* gTree;
    /* 0x112A4 */ struct _CPU_ADDRESS aAddressCache[256];
    /* 0x11EA4 */ int nCountCodeHack;
    /* 0x11EA8 */ struct __anon_0x50416 aCodeHack[32];
    /* 0x12028 */ s64 nTimeRetrace;
    /* 0x12030 */ struct OSAlarm alarmRetrace;
    /* 0x12058 */ unsigned int nFlagRAM;
    /* 0x1205C */ unsigned int nFlagCODE;
    /* 0x12060 */ unsigned int nCompileFlag;
    /* 0x12064 */ struct cpu_optimize nOptimize;
} __anon_0x50A60; // size = 0x12090

typedef enum __anon_0x51281 {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x51281;

typedef struct __anon_0x512E3 {
    /* 0x0 */ int nSize;
    /* 0x4 */ int nOffsetRAM;
    /* 0x8 */ int nOffsetROM;
    /* 0xC */ int (*pCallback)();
} __anon_0x512E3; // size = 0x10

typedef enum __anon_0x51394 {
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
    SRT_UNKNOWN = 12,
} __anon_0x51394;

typedef enum __anon_0x514C0 {
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
} __anon_0x514C0;

typedef struct __anon_0x515FB {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ int bException;
    /* 0x0C */ enum __anon_0x51281 eMode;
    /* 0x10 */ struct __anon_0x512E3 romCopy;
    /* 0x20 */ enum __anon_0x51394 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x514C0 storageDevice;
    /* 0x74 */ u8 anException[16];
    /* 0x84 */ int bJapaneseVersion;
} __anon_0x515FB; // size = 0x88

// size = 0x4, address = 0x80135600
struct __anon_0x515FB* gpSystem;

// size = 0x4, address = 0x801355D8
int gDVDResetToggle;

// size = 0x4, address = 0x801356D8
unsigned int gnFlagZelda;

// size = 0x4, address = 0x801355FC
int gbDisplayedError;

typedef struct _GXTexObj {
    /* 0x0 */ u32 dummy[8];
} __anon_0x51BD0; // size = 0x20

typedef enum __anon_0x5219D {
    RCT_NONE = -1,
    RCT_RAM = 0,
    RCT_ARAM = 1,
} __anon_0x5219D;

// Erased
static int romTestARAM() {}

// Erased
static int romMatchRange(struct __anon_0x4D873* pROM, unsigned int nOffset, int* pnOffset0, int* pnOffset1) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // unsigned int nOffset; // r1+0x4
    // int* pnOffset0; // r1+0x8
    // int* pnOffset1; // r1+0xC

    // Local variables
    int iBlock; // r10
}

// Erased
static int romFreeBlock(struct __anon_0x4D873* pROM, int iBlock) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // int iBlock; // r1+0x4

    // Local variables
    int iCache; // r4
    struct __anon_0x4CFE6* pBlock; // r1+0x0
}

// Range: 0x8006FDFC -> 0x8006FEC0
static int romFindFreeCache(struct __anon_0x4D873* pROM, int* piCache, enum __anon_0x5219D eType) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // int* piCache; // r1+0x4
    // enum __anon_0x5219D eType; // r1+0x8

    // Local variables
    int iBlock; // r7
}

// Range: 0x8006FC4C -> 0x8006FDFC
static int romFindOldestBlock(struct __anon_0x4D873* pROM, int* piBlock, enum __anon_0x5219D eTypeCache,
                              int whichBlock) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r3
    // int* piBlock; // r1+0x4
    // enum __anon_0x5219D eTypeCache; // r1+0x8
    // int whichBlock; // r1+0xC

    // Local variables
    struct __anon_0x4CFE6* pBlock; // r7
    int iBlock; // r8
    int iBlockOldest; // r9
    unsigned int nTick; // r10
    unsigned int nTickDelta; // r11
    unsigned int nTickDeltaOldest; // r12
}

// Range: 0x8006FA38 -> 0x8006FC4C
static int romMakeFreeCache(struct __anon_0x4D873* pROM, int* piCache, enum __anon_0x5219D eType) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r30
    // int* piCache; // r31
    // enum __anon_0x5219D eType; // r1+0x10

    // Local variables
    int iCache; // r1+0x20
    int iBlockOldest; // r1+0x1C
}

// Range: 0x8006F7E0 -> 0x8006FA38
static int romSetBlockCache(struct __anon_0x4D873* pROM, int iBlock, enum __anon_0x5219D eType) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r30
    // int iBlock; // r1+0xC
    // enum __anon_0x5219D eType; // r1+0x10

    // Local variables
    struct __anon_0x4CFE6* pBlock; // r31
    int iCacheRAM; // r1+0x18
    int iCacheARAM; // r1+0x14
    int nOffsetRAM; // r28
    int nOffsetARAM; // r29
}

// Range: 0x8006F6EC -> 0x8006F7E0
static int __romLoadBlock_Complete(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x8

    // Local variables
    unsigned int iData; // r9
    unsigned int nData; // r1+0x8
}

// Range: 0x8006F6D0 -> 0x8006F6EC
static void __romLoadBlock_CompleteGCN(s32 nResult) {
    // Parameters
    // s32 nResult; // r1+0x0

    // Local variables
    struct __anon_0x4D873* pROM; // r4

    // References
    // -> struct __anon_0x515FB* gpSystem;
}

// Range: 0x8006F5D4 -> 0x8006F6D0
static int romLoadBlock(struct __anon_0x4D873* pROM, int iBlock, int iCache, int (*pCallback)()) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r31
    // int iBlock; // r1+0xC
    // int iCache; // r1+0x10
    // int (* pCallback)(); // r1+0x14

    // Local variables
    u8* anData; // r8
    int nSizeRead; // r10
    unsigned int nSize; // r10
    unsigned int nOffset; // r1+0x8
}

// Erased
static int romKeepCheck() {}

// Range: 0x8006F488 -> 0x8006F5D4
static int romLoadRange(struct __anon_0x4D873* pROM, int begin, int end, int* blockCount, int whichBlock,
                        int (*pfProgress)(f32)) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r26
    // int begin; // r1+0xC
    // int end; // r1+0x10
    // int* blockCount; // r27
    // int whichBlock; // r1+0x18
    // int (* pfProgress)(f32); // r28

    // Local variables
    int iCache; // r1+0x20
    unsigned int iBlock; // r30
    unsigned int iBlockLast; // r29
}

// Range: 0x8006F208 -> 0x8006F488
static int romCacheGame_ZELDA(f32 rProgress) {
    // Parameters
    // f32 rProgress; // f31

    // Local variables
    int nSize; // r31
    f32 matrix44[4][4]; // r1+0x2C
    struct _GXTexObj textureObject; // r1+0xC

    // References
    // -> static int gbProgress;
    // -> static int iImage$294;
    // -> struct __anon_0x515FB* gpSystem;
    // -> static void* gpImageBack;
    // -> int gbDisplayedError;
}

// Range: 0x8006EC58 -> 0x8006F208
static int romCacheGame(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r31

    // Local variables
    int blockCount; // r1+0x68
    int nSize; // r30
    char* szName; // r5
    struct tXL_FILE* pFile; // r1+0x5C

    // References
    // -> int gDVDResetToggle;
    // -> unsigned int gnFlagZelda;
    // -> int gbDisplayedError;
    // -> static int gbProgress;
    // -> static void* gpImageBack;
    // -> static unsigned int ganOffsetBlock_URAZLJ[198];
    // -> static unsigned int ganOffsetBlock_ZLJ[198];
}

// Range: 0x8006EC3C -> 0x8006EC58
static int __romLoadUpdate_Complete() {
    // References
    // -> struct __anon_0x515FB* gpSystem;
}

// Erased
static int romLoadInProgress(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
}

// Range: 0x8006EADC -> 0x8006EC3C
static int romLoadUpdate(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r29

    // Local variables
    int iCache; // r1+0xC
    struct __anon_0x4CFE6* pBlock; // r4
    unsigned int iBlock0; // r31
    unsigned int iBlock1; // r25
    struct _CPU* pCPU; // r30
}

// Range: 0x8006EAC0 -> 0x8006EADC
static int __romCopyUpdate_Complete() {
    // References
    // -> struct __anon_0x515FB* gpSystem;
}

// Range: 0x8006E83C -> 0x8006EAC0
static int romCopyUpdate(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r29

    // Local variables
    struct __anon_0x4CFE6* pBlock; // r28
    int iCache; // r1+0xC
    int nTickLast; // r27
    u8* anData; // r1+0x8
    unsigned int iBlock; // r26
    unsigned int nSize; // r26
    unsigned int nOffsetBlock; // r1+0x8
    struct _CPU* pCPU; // r30
}

// Erased
static int romCacheAllBlocks(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r27

    // Local variables
    int iCache; // r1+0xC
    unsigned int iBlock; // r28
    unsigned int iBlockLast; // r1+0x8
}

// Range: 0x8006E3D4 -> 0x8006E83C
static int romLoadFullOrPart(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r31

    // Local variables
    struct tXL_FILE* pFile; // r1+0x1C
    int iBlock; // r1+0x8
    int nLoad; // r27
    int nStep; // r28
    int iData; // r7
    unsigned int nData; // r1+0x8
}

// Erased
static int romLoad(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r31
}

// Range: 0x8006E1D8 -> 0x8006E3D4
int romGetPC(struct __anon_0x4D873* pROM, u64* pnPC) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r3
    // u64* pnPC; // r31

    // Local variables
    int nOffset; // r5
    unsigned int nData; // r5
    unsigned int iData; // r1+0x8
    unsigned int anData[1024]; // r1+0x18
}

// Range: 0x8006E1A4 -> 0x8006E1D8
int romGetCode(struct __anon_0x4D873* pROM, char* acCode) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // char* acCode; // r1+0x4
}

// Erased
static int romGetName(struct __anon_0x4D873* pROM, char* acName) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // char* acName; // r1+0x4

    // Local variables
    int iName; // r10
}

// Erased
static int romGetMask(struct __anon_0x4D873* pROM, int* pnMask) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // int* pnMask; // r1+0x4
}

// Range: 0x8006E0E0 -> 0x8006E1A4
int romTestCode(struct __anon_0x4D873* pROM, char* acCode) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x8
    // char* acCode; // r1+0xC

    // Local variables
    int iCode; // r1+0x8
    char acCodeCurrent[5]; // r1+0x1C
}

// Range: 0x8006E0D8 -> 0x8006E0E0
static int romPut8() {}

// Range: 0x8006E0D0 -> 0x8006E0D8
static int romPut16() {}

// Range: 0x8006E0C8 -> 0x8006E0D0
static int romPut32() {}

// Range: 0x8006E0C0 -> 0x8006E0C8
static int romPut64() {}

// Range: 0x8006E050 -> 0x8006E0C0
static int romGet8(struct __anon_0x4D873* pROM, unsigned int nAddress, char* pData) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r3
    // unsigned int nAddress; // r4
    // char* pData; // r31

    // Local variables
    u8 nData; // r1+0x14
}

// Range: 0x8006DFE0 -> 0x8006E050
static int romGet16(struct __anon_0x4D873* pROM, unsigned int nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r3
    // unsigned int nAddress; // r4
    // s16* pData; // r31

    // Local variables
    u16 nData; // r1+0x14
}

// Range: 0x8006DF70 -> 0x8006DFE0
static int romGet32(struct __anon_0x4D873* pROM, unsigned int nAddress, int* pData) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r3
    // unsigned int nAddress; // r4
    // int* pData; // r31

    // Local variables
    unsigned int nData; // r1+0x14
}

// Range: 0x8006DEF4 -> 0x8006DF70
static int romGet64(struct __anon_0x4D873* pROM, unsigned int nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r3
    // unsigned int nAddress; // r4
    // s64* pData; // r31

    // Local variables
    u64 nData; // r1+0x18
}

// Range: 0x8006DEEC -> 0x8006DEF4
static int romPutDebug8() {}

// Range: 0x8006DEE4 -> 0x8006DEEC
static int romPutDebug16() {}

// Range: 0x8006DEDC -> 0x8006DEE4
static int romPutDebug32() {}

// Range: 0x8006DED4 -> 0x8006DEDC
static int romPutDebug64() {}

// Range: 0x8006DEC4 -> 0x8006DED4
static int romGetDebug8(char* pData) {
    // Parameters
    // char* pData; // r1+0x8
}

// Range: 0x8006DEB4 -> 0x8006DEC4
static int romGetDebug16(s16* pData) {
    // Parameters
    // s16* pData; // r1+0x8
}

// Range: 0x8006DEA4 -> 0x8006DEB4
static int romGetDebug32(int* pData) {
    // Parameters
    // int* pData; // r1+0x8
}

// Range: 0x8006DE90 -> 0x8006DEA4
static int romGetDebug64(s64* pData) {
    // Parameters
    // s64* pData; // r1+0x8
}

// Erased
static int romGetSize(struct __anon_0x4D873* pROM, int* pnSize) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // int* pnSize; // r1+0x4
}

// Range: 0x8006DBF8 -> 0x8006DE90
int romCopy(struct __anon_0x4D873* pROM, void* pTarget, int nOffset, unsigned int nSize, int (*pCallback)()) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r27
    // void* pTarget; // r28
    // int nOffset; // r29
    // unsigned int nSize; // r30
    // int (* pCallback)(); // r31

    // Local variables
    void* pSource; // r4
    struct tXL_FILE* pFile; // r1+0x1C
}

// Range: 0x8006D990 -> 0x8006DBF8
int romCopyImmediate(struct __anon_0x4D873* pROM, void* pTarget, int nOffsetROM, unsigned int nSize) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r26
    // void* pTarget; // r27
    // int nOffsetROM; // r28
    // unsigned int nSize; // r29

    // Local variables
    void* pSource; // r4
    struct __anon_0x4CFE6* pBlock; // r3
    int nOffsetARAM; // r23
    int nSizeCopy; // r31
    int nOffsetBlock; // r1+0x8
    int nSizeCopyARAM; // r22
    int nSizeDMA; // r21
    int nOffset; // r20
    int nOffsetTarget; // r19
    u8* pBuffer; // r30
    u8 anBuffer[608]; // r1+0x18
}

// Range: 0x8006D830 -> 0x8006D990
int romUpdate(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r31

    // Local variables
    int nStatus; // r30
}

// Erased
static int romCopyBusy(struct __anon_0x4D873* pROM) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
}

// Range: 0x8006D794 -> 0x8006D830
int romSetCacheSize(struct __anon_0x4D873* pROM, int nSize) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r30
    // int nSize; // r4
}

// Erased
static int romGetCacheSize(struct __anon_0x4D873* pROM, int* pnSize) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // int* pnSize; // r1+0x4
}

// Range: 0x8006D620 -> 0x8006D794
int romSetImage(struct __anon_0x4D873* pROM, char* szNameFile) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r28
    // char* szNameFile; // r29

    // Local variables
    struct tXL_FILE* pFile; // r1+0x14
    int iName; // r5
    int nSize; // r1+0x10
}

// Range: 0x8006D5D8 -> 0x8006D620
int romGetImage(struct __anon_0x4D873* pROM, char* acNameFile) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r1+0x0
    // char* acNameFile; // r1+0x4

    // Local variables
    int iName; // r6
}

// Range: 0x8006D3AC -> 0x8006D5D8
int romEvent(struct __anon_0x4D873* pROM, int nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x4D873* pROM; // r30
    // int nEvent; // r1+0xC
    // void* pArgument; // r31
}
