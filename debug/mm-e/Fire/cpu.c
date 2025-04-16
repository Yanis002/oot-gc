/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\cpu.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80030F70 -> 0x80036A44
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x4154A; // size = 0x10

// size = 0x10, address = 0x800E2C18
struct _XL_OBJECTTYPE gClassCPU;

// size = 0x80, address = 0x800E2C28
static char* gaszNameGPR[32];

// size = 0x80, address = 0x800E2CA8
static char* gaszNameFPR[32];

// size = 0x80, address = 0x800E2E10
static char* gaszNameCP0[32];

// size = 0x80, address = 0x800E30C4
static char* gaszNameCP1[32];

// size = 0x100, address = 0x800E3148
static s64 ganMaskGetCP0[32];

// size = 0x100, address = 0x800E3248
static s64 ganMaskSetCP0[32];

// size = 0x40, address = 0x800E3348
static u8 Opcode[64];

// size = 0x40, address = 0x800E3388
static u8 SpecialOpcode[64];

// size = 0x20, address = 0x800E33C8
static u8 RegimmOpcode[32];

// size = 0x4, address = 0x8012FE30
void* gHeapTree;

// size = 0x1, address = 0x8012FE34
u8 gRegCount;

// size = 0x14, address = 0x800E33E8
static u32 ganOpcodeSaveFP1[5];

// size = 0x14, address = 0x800E33FC
static u32 ganOpcodeSaveFP2_0[5];

// size = 0xC, address = 0x800E3410
static u32 ganOpcodeSaveFP2_1[3];

// size = 0x14, address = 0x800E341C
static u32 ganOpcodeLoadFP[5];

// size = 0x80, address = 0x800E3430
s32 ganMapGPR[32];

// size = 0x4, address = 0x8012FE38
static s32 cpuCompile_DSLLV_function;

// size = 0x4, address = 0x8012FE3C
static s32 cpuCompile_DSRLV_function;

// size = 0x4, address = 0x8012FE40
static s32 cpuCompile_DSRAV_function;

// size = 0x4, address = 0x8012FE44
static s32 cpuCompile_DMULT_function;

// size = 0x4, address = 0x8012FE48
static s32 cpuCompile_DMULTU_function;

// size = 0x4, address = 0x8012FE4C
static s32 cpuCompile_DDIV_function;

// size = 0x4, address = 0x8012FE50
static s32 cpuCompile_DDIVU_function;

// size = 0x4, address = 0x8012FE54
static s32 cpuCompile_DADD_function;

// size = 0x4, address = 0x8012FE58
static s32 cpuCompile_DADDU_function;

// size = 0x4, address = 0x8012FE5C
static s32 cpuCompile_DSUB_function;

// size = 0x4, address = 0x8012FE60
static s32 cpuCompile_DSUBU_function;

// size = 0x4, address = 0x8012FE64
static s32 cpuCompile_S_SQRT_function;

// size = 0x4, address = 0x8012FE68
static s32 cpuCompile_D_SQRT_function;

// size = 0x4, address = 0x8012FE6C
static s32 cpuCompile_W_CVT_SD_function;

// size = 0x4, address = 0x8012FE70
static s32 cpuCompile_L_CVT_SD_function;

// size = 0x4, address = 0x8012FE74
static s32 cpuCompile_CEIL_W_function;

// size = 0x4, address = 0x8012FE78
static s32 cpuCompile_FLOOR_W_function;

// size = 0x4, address = 0x8012FE7C
static s32 cpuCompile_ROUND_W_function;

// size = 0x4, address = 0x8012FE80
static s32 cpuCompile_TRUNC_W_function;

// size = 0x4, address = 0x8012FE84
static s32 cpuCompile_LB_function;

// size = 0x4, address = 0x8012FE88
static s32 cpuCompile_LH_function;

// size = 0x4, address = 0x8012FE8C
static s32 cpuCompile_LW_function;

// size = 0x4, address = 0x8012FE90
static s32 cpuCompile_LBU_function;

// size = 0x4, address = 0x8012FE94
static s32 cpuCompile_LHU_function;

// size = 0x4, address = 0x8012FE98
static s32 cpuCompile_SB_function;

// size = 0x4, address = 0x8012FE9C
static s32 cpuCompile_SH_function;

// size = 0x4, address = 0x8012FEA0
static s32 cpuCompile_SW_function;

// size = 0x4, address = 0x8012FEA4
static s32 cpuCompile_LDC_function;

// size = 0x4, address = 0x8012FEA8
static s32 cpuCompile_SDC_function;

// size = 0x4, address = 0x8012FEAC
static s32 cpuCompile_LWL_function;

// size = 0x4, address = 0x8012FEB0
static s32 cpuCompile_LWR_function;

// size = 0x20, address = 0x8012A6A8
u8 gRegList[32];

// size = 0x1F4, address = 0x8012A6C8
u32 aHeapTreeFlag[125];

typedef enum __anon_0x42191 {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x42191;

typedef struct __anon_0x421F4 {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x421F4; // size = 0x10

typedef enum __anon_0x422A5 {
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
} __anon_0x422A5;

typedef enum __anon_0x42403 {
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
} __anon_0x42403;

typedef struct __anon_0x4253E {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0x42191 eMode;
    /* 0x10 */ struct __anon_0x421F4 romCopy;
    /* 0x20 */ enum __anon_0x422A5 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x42403 storageDevice;
    /* 0x74 */ u8 anException[16];
} __anon_0x4253E; // size = 0x88

// size = 0x4, address = 0x8012FD48
struct __anon_0x4253E* gpSystem;

typedef struct __anon_0x42875 {
    /* 0x0 */ s32 nOffsetHost;
    /* 0x4 */ s32 nAddressN64;
} __anon_0x42875; // size = 0x8

typedef struct cpu_callerID {
    /* 0x0 */ s32 N64address;
    /* 0x4 */ s32 GCNaddress;
} __anon_0x428DB; // size = 0x8

typedef struct cpu_function {
    /* 0x00 */ void* pnBase;
    /* 0x04 */ void* pfCode;
    /* 0x08 */ s32 nCountJump;
    /* 0x0C */ struct __anon_0x42875* aJump;
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
} __anon_0x4294E; // size = 0x48

typedef union __anon_0x42C2A {
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
} __anon_0x42C2A;

typedef union __anon_0x4303E {
    /* 0x0 */ f32 _0f32;
    /* 0x4 */ f32 f32;
    /* 0x0 */ f64 f64;
    /* 0x0 */ s32 _0s32;
    /* 0x4 */ s32 s32;
    /* 0x0 */ s64 s64;
    /* 0x0 */ u32 _0u32;
    /* 0x4 */ u32 u32;
    /* 0x0 */ u64 u64;
} __anon_0x4303E;

typedef struct __anon_0x4354C {
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
} __anon_0x4354C; // size = 0x34

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
} __anon_0x4381A; // size = 0x84

typedef struct __anon_0x43A7D {
    /* 0x0 */ u32 nAddress;
    /* 0x4 */ u32 nOpcodeOld;
    /* 0x8 */ u32 nOpcodeNew;
} __anon_0x43A7D; // size = 0xC

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
} __anon_0x43BA8; // size = 0x2C8

typedef struct OSAlarm {
    /* 0x00 */ void (* handler)(struct OSAlarm*, struct OSContext*);
    /* 0x04 */ u32 tag;
    /* 0x08 */ s64 fire;
    /* 0x10 */ struct OSAlarm* prev;
    /* 0x14 */ struct OSAlarm* next;
    /* 0x18 */ s64 period;
    /* 0x20 */ s64 start;
} __anon_0x43DFF; // size = 0x28

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
} __anon_0x43F1A; // size = 0x28

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
    /* 0x00040 */ union __anon_0x42C2A aGPR[32];
    /* 0x00140 */ union __anon_0x4303E aFPR[32];
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
    /* 0x00B64 */ struct __anon_0x4354C* apDevice[256];
    /* 0x00F64 */ u8 aiDevice[65536];
    /* 0x10F64 */ void* gHeap1;
    /* 0x10F68 */ void* gHeap2;
    /* 0x10F6C */ u32 aHeap1Flag[192];
    /* 0x1126C */ u32 aHeap2Flag[13];
    /* 0x112A0 */ struct cpu_treeRoot* gTree;
    /* 0x112A4 */ struct _CPU_ADDRESS aAddressCache[256];
    /* 0x11EA4 */ s32 nCountCodeHack;
    /* 0x11EA8 */ struct __anon_0x43A7D aCodeHack[32];
    /* 0x12028 */ s64 nTimeRetrace;
    /* 0x12030 */ struct OSAlarm alarmRetrace;
    /* 0x12058 */ u32 nFlagRAM;
    /* 0x1205C */ u32 nFlagCODE;
    /* 0x12060 */ u32 nCompileFlag;
    /* 0x12064 */ struct cpu_optimize nOptimize;
} __anon_0x440C7; // size = 0x12090

typedef struct cpu_disk_node {
    /* 0x00 */ u32 functionLength;
    /* 0x04 */ u32 checksum;
    /* 0x08 */ s32 startAddress;
    /* 0x0C */ s32 endAddress;
    /* 0x10 */ u32 specialFlag;
    /* 0x14 */ u32 frequency;
    /* 0x18 */ u32 inCatalog;
    /* 0x1C */ u32* length;
    /* 0x20 */ u32 size;
    /* 0x24 */ u32 GCNsize;
    /* 0x28 */ u32* N64code;
    /* 0x2C */ u32* GCNcode;
    /* 0x30 */ struct cpu_disk_node* prev;
    /* 0x34 */ struct cpu_disk_node* left;
    /* 0x38 */ struct cpu_disk_node* right;
    /* 0x3C */ struct cpu_disk_node* same;
} __anon_0x44859; // size = 0x40

typedef enum __anon_0x47970 {
    CS_NONE = -1,
    CS_32BIT = 0,
    CS_64BIT = 1,
} __anon_0x47970;

typedef enum __anon_0x48513 {
    RLM_NONE = -1,
    RLM_PART = 0,
    RLM_FULL = 1,
    RLM_COUNT_ = 2,
} __anon_0x48513;

typedef struct __anon_0x48572 {
    /* 0x0 */ s32 iCache;
    /* 0x4 */ u32 nSize;
    /* 0x8 */ u32 nTickUsed;
    /* 0xC */ char keep;
} __anon_0x48572; // size = 0x10

typedef struct __anon_0x48686 {
    /* 0x00 */ s32 bWait;
    /* 0x04 */ s32 (* pCallback)();
    /* 0x08 */ u8* pTarget;
    /* 0x0C */ u32 nSize;
    /* 0x10 */ u32 nOffset;
} __anon_0x48686; // size = 0x14

typedef struct __anon_0x48766 {
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
} __anon_0x48766; // size = 0x30

typedef struct __anon_0x48951 {
    /* 0x0 */ s32 nPosition;
    /* 0x4 */ s32 nLineNumber;
} __anon_0x48951; // size = 0x8

typedef struct __anon_0x489B5 {
    /* 0x0 */ s32 nMode;
    /* 0x4 */ s32 nModeSave;
    /* 0x8 */ struct __anon_0x48951 save;
} __anon_0x489B5; // size = 0x10

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x48A96; // size = 0x20

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
} __anon_0x48C06; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (* callback)(s32, struct DVDFileInfo*);
} __anon_0x48E2C; // size = 0x3C

typedef struct __anon_0x48EE4 {
    /* 0x00000 */ void* pHost;
    /* 0x00004 */ void* pBuffer;
    /* 0x00008 */ s32 bFlip;
    /* 0x0000C */ s32 bLoad;
    /* 0x00010 */ char acNameFile[513];
    /* 0x00214 */ u32 nSize;
    /* 0x00218 */ enum __anon_0x48513 eModeLoad;
    /* 0x0021C */ struct __anon_0x48572 aBlock[4096];
    /* 0x1021C */ u32 nTick;
    /* 0x10220 */ u8* pCacheRAM;
    /* 0x10224 */ u8 anBlockCachedRAM[1024];
    /* 0x10624 */ u8 anBlockCachedARAM[2046];
    /* 0x10E24 */ struct __anon_0x48686 copy;
    /* 0x10E38 */ struct __anon_0x48766 load;
    /* 0x10E68 */ s32 nCountBlockRAM;
    /* 0x10E6C */ s32 nSizeCacheRAM;
    /* 0x10E70 */ u8 acHeader[64];
    /* 0x10EB0 */ u32* anOffsetBlock;
    /* 0x10EB4 */ s32 nCountOffsetBlocks;
    /* 0x10EB8 */ struct __anon_0x489B5 tagFile;
    /* 0x10EC8 */ u32 nChecksum;
    /* 0x10ECC */ struct DVDFileInfo fileInfo;
    /* 0x10F08 */ s32 offsetToRom;
} __anon_0x48EE4; // size = 0x10F0C

// size = 0x4, address = 0x8012FDBC
s32 mcardSaveDisplay;

// size = 0x0, address = 0x800ECB38
s32 __float_nan[];

// size = 0x0, address = 0x800ECB3C
s32 __float_huge[];

// size = 0x4, address = 0x8012F4F4
f32 fTickScale;

// size = 0x4, address = 0x8012F4F0
u32 nTickMultiplier;

typedef enum __anon_0x4938F {
    RUM_NONE = 0,
    RUM_IDLE = 1,
} __anon_0x4938F;

typedef enum __anon_0x4964F {
    CM_NONE = -1,
    CM_USER = 0,
    CM_SUPER = 1,
    CM_KERNEL = 2,
} __anon_0x4964F;

typedef enum __anon_0x4A647 {
    CEC_NONE = -1,
    CEC_INTERRUPT = 0,
    CEC_TLB_MODIFICATION = 1,
    CEC_TLB_LOAD = 2,
    CEC_TLB_STORE = 3,
    CEC_ADDRESS_LOAD = 4,
    CEC_ADDRESS_STORE = 5,
    CEC_BUS_INSTRUCTION = 6,
    CEC_BUS_DATA = 7,
    CEC_SYSCALL = 8,
    CEC_BREAK = 9,
    CEC_RESERVED = 10,
    CEC_COPROCESSOR = 11,
    CEC_OVERFLOW = 12,
    CEC_TRAP = 13,
    CEC_VCE_INSTRUCTION = 14,
    CEC_FLOAT = 15,
    CEC_RESERVED_16 = 16,
    CEC_RESERVED_17 = 17,
    CEC_RESERVED_18 = 18,
    CEC_RESERVED_19 = 19,
    CEC_RESERVED_20 = 20,
    CEC_RESERVED_21 = 21,
    CEC_RESERVED_22 = 22,
    CEC_WATCH = 23,
    CEC_RESERVED_24 = 24,
    CEC_RESERVED_25 = 25,
    CEC_RESERVED_26 = 26,
    CEC_RESERVED_27 = 27,
    CEC_RESERVED_28 = 28,
    CEC_RESERVED_29 = 29,
    CEC_RESERVED_30 = 30,
    CEC_VCE_DATA = 31,
    CEC_COUNT = 32,
} __anon_0x4A647;

typedef struct _CPU_ADDRESS {
    /* 0x0 */ s32 nN64;
    /* 0x4 */ s32 nHost;
    /* 0x8 */ struct cpu_function* pFunction;
} __anon_0x4AA8E; // size = 0xC

// size = 0x10, address = 0x800E4C88
struct _XL_OBJECTTYPE gClassRAM;

// Erased
static s32 cpuHackIdle(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8

    // Local variables
    struct __anon_0x4253E* pSystem; // r3
}

// Erased
static s32 cpuHackCacheInstruction(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r31

    // Local variables
    u32* pnCode; // r1+0x10
}

// Range: 0x8003682C -> 0x80036A44
static s32 cpuHackHandler(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r27

    // Local variables
    u32 nSize; // r1+0x10
    u32* pnCode; // r1+0xC
    s32 iCode; // r3
    s32 iSave1; // r30
    s32 iSave2; // r29
    s32 iLoad; // r28

    // References
    // -> static u32 ganOpcodeLoadFP[5];
    // -> static u32 ganOpcodeSaveFP2_1[3];
    // -> static u32 ganOpcodeSaveFP2_0[5];
    // -> static u32 ganOpcodeSaveFP1[5];
    // -> struct _XL_OBJECTTYPE gClassRAM;
}

// Erased
static s32 cpuMakeCachedAddress(struct _CPU* pCPU, s32 nAddressN64, s32 nAddressHost, struct cpu_function* pFunction) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32 nAddressN64; // r1+0x4
    // s32 nAddressHost; // r1+0x8
    // struct cpu_function* pFunction; // r1+0xC

    // Local variables
    s32 iAddress; // r7
    struct _CPU_ADDRESS* aAddressCache; // r9
}

// Range: 0x80036798 -> 0x8003682C
s32 cpuFreeCachedAddress(struct _CPU* pCPU, s32 nAddress0, s32 nAddress1) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32 nAddress0; // r1+0x4
    // s32 nAddress1; // r1+0x8

    // Local variables
    s32 iAddress; // r10
    s32 iAddressNext; // r11
    s32 nAddressN64; // r1+0x0
    struct _CPU_ADDRESS* aAddressCache; // r12
}

// Range: 0x800365BC -> 0x80036798
static s32 cpuFindCachedAddress(struct _CPU* pCPU, s32 nAddressN64, s32* pnAddressHost) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8
    // s32 nAddressN64; // r1+0xC
    // s32* pnAddressHost; // r1+0x10

    // Local variables
    s32 iAddress; // r10
    struct cpu_function* pFunction; // r1+0x8
    struct _CPU_ADDRESS addressFound; // r1+0x14
    struct _CPU_ADDRESS* aAddressCache; // r6
}

// Range: 0x800364E0 -> 0x800365BC
s32 cpuTestInterrupt(struct _CPU* pCPU, s32 nMaskIP) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8
    // s32 nMaskIP; // r31
}

// Erased
static s32 cpuResetInterrupt(struct _CPU* pCPU, s32 nMaskIP) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32 nMaskIP; // r1+0x4
}

// Range: 0x80036220 -> 0x800364E0
s32 cpuException(struct _CPU* pCPU, enum __anon_0x4A647 eCode, s32 nMaskIP) {
    // Parameters
    // struct _CPU* pCPU; // r27
    // enum __anon_0x4A647 eCode; // r28
    // s32 nMaskIP; // r29
}

// Range: 0x80036110 -> 0x80036220
static s32 cpuMakeDevice(struct _CPU* pCPU, s32* piDevice, void* pObject, s32 nOffset, u32 nAddress0, u32 nAddress1, s32 nType) {
    // Parameters
    // struct _CPU* pCPU; // r25
    // s32* piDevice; // r1+0xC
    // void* pObject; // r26
    // s32 nOffset; // r27
    // u32 nAddress0; // r28
    // u32 nAddress1; // r29
    // s32 nType; // r30

    // Local variables
    struct __anon_0x4354C* pDevice; // r1+0x28
    s32 iDevice; // r31
}

// Range: 0x8003606C -> 0x80036110
static s32 cpuFreeDevice(struct _CPU* pCPU, s32 iDevice) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // s32 iDevice; // r30

    // Local variables
    s32 iAddress; // r4
}

// Erased
static s32 cpuWipeDevices(struct _CPU* pCPU, s32 bFree) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // s32 bFree; // r29

    // Local variables
    s32 iDevice; // r30
}

// Range: 0x80035EA4 -> 0x8003606C
static s32 cpuMapAddress(struct _CPU* pCPU, s32* piDevice, u32 nVirtual, u32 nPhysical, s32 nSize) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* piDevice; // r31
    // u32 nVirtual; // r28
    // u32 nPhysical; // r6
    // s32 nSize; // r29

    // Local variables
    s32 iDeviceTarget; // r1+0x1C
    s32 iDeviceSource; // r5
    u32 nAddressVirtual0; // r5
    u32 nAddressVirtual1; // r6
}

// Erased
static s32 cpuCountTLB(struct _CPU* pCPU, s32* pnCount) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // s32* pnCount; // r1+0x4

    // Local variables
    s32 iEntry; // r8
    s32 nCount; // r9
}

// Range: 0x80035BC0 -> 0x80035EA4
static s32 cpuSetTLB(struct _CPU* pCPU, s32 iEntry) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // s32 iEntry; // r1+0xC

    // Local variables
    s32 iDevice; // r1+0x10
    u32 nMask; // r1+0x8
    u32 nVirtual; // r27
    u32 nPhysical; // r30
}

// Erased
static s32 cpuGetTLB(struct _CPU* pCPU, s32 iEntry) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32 iEntry; // r1+0x4
}

// Erased
static s32 cpuFindTLB(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u64 nAddressVirtual; // r1+0x8
    // u32* pnAddressPhysical; // r1+0x10

    // Local variables
    s32 iEntry; // r12
    u32 nMask; // r1+0x0
    u32 nVirtual; // r1+0x0
}

// Erased
static s32 cpuVirtualToPhysical_User32(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u64 nAddressVirtual; // r1+0x8
    // u32* pnAddressPhysical; // r1+0x10
}

// Erased
static s32 cpuVirtualToPhysical_User64(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u64 nAddressVirtual; // r1+0x8
    // u32* pnAddressPhysical; // r1+0x10
}

// Erased
static s32 cpuVirtualToPhysical_Super32(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u64 nAddressVirtual; // r1+0x8
    // u32* pnAddressPhysical; // r1+0x10
}

// Erased
static s32 cpuVirtualToPhysical_Super64(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u64 nAddressVirtual; // r1+0x8
    // u32* pnAddressPhysical; // r1+0x10
}

// Erased
static s32 cpuVirtualToPhysical_Kernel32(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u64 nAddressVirtual; // r1+0x8
    // u32* pnAddressPhysical; // r1+0x10
}

// Erased
static s32 cpuVirtualToPhysical_Kernel64(struct _CPU* pCPU, u64 nAddressVirtual, u32* pnAddressPhysical) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // u64 nAddressVirtual; // r30
    // u32* pnAddressPhysical; // r31
}

// Range: 0x80035AE8 -> 0x80035BC0
static s32 cpuGetMode(u64 nStatus, enum __anon_0x4964F* peMode) {
    // Parameters
    // u64 nStatus; // r1+0x0
    // enum __anon_0x4964F* peMode; // r1+0x8
}

// Range: 0x800359A4 -> 0x80035AE8
static s32 cpuGetSize(u64 nStatus, enum __anon_0x47970* peSize, enum __anon_0x4964F* peMode) {
    // Parameters
    // u64 nStatus; // r29
    // enum __anon_0x47970* peSize; // r30
    // enum __anon_0x4964F* peMode; // r31

    // Local variables
    enum __anon_0x4964F eMode; // r1+0x18
}

// Erased
static s32 cpuSetCP0_Config(struct _CPU* pCPU, u32 nConfig) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // u32 nConfig; // r1+0x4
}

// Range: 0x80035910 -> 0x800359A4
static s32 cpuSetCP0_Status(struct _CPU* pCPU, u64 nStatus) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // u64 nStatus; // r31

    // Local variables
    enum __anon_0x4964F eMode; // r1+0x28
    enum __anon_0x4964F eModeLast; // r1+0x24
    enum __anon_0x47970 eSize; // r1+0x20
    enum __anon_0x47970 eSizeLast; // r1+0x1C
}

// Range: 0x80035744 -> 0x80035910
s32 cpuSetRegisterCP0(struct _CPU* pCPU, s32 iRegister, s64 nData) {
    // Parameters
    // struct _CPU* pCPU; // r26
    // s32 iRegister; // r27
    // s64 nData; // r29

    // Local variables
    s32 bFlag; // r30

    // References
    // -> static s64 ganMaskSetCP0[32];
}

// Range: 0x8003549C -> 0x80035744
s32 cpuGetRegisterCP0(struct _CPU* pCPU, s32 iRegister, s64* pnData) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // s32 iRegister; // r1+0xC
    // s64* pnData; // r1+0x10

    // Local variables
    s32 bFlag; // r1+0x8

    // References
    // -> static s64 ganMaskGetCP0[32];
}

// Range: 0x80035400 -> 0x8003549C
s32 __cpuERET(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
}

// Range: 0x800353EC -> 0x80035400
s32 __cpuBreak(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
}

// Erased
static s32 cpuGetOpcodeText() {}

// Range: 0x8003523C -> 0x800353EC
s32 cpuMapObject(struct _CPU* pCPU, void* pObject, u32 nAddress0, u32 nAddress1, s32 nType) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // void* pObject; // r27
    // u32 nAddress0; // r28
    // u32 nAddress1; // r29
    // s32 nType; // r30

    // Local variables
    s32 iDevice; // r1+0x24
    s32 iAddress; // r4
    u32 nAddressVirtual0; // r5
    u32 nAddressVirtual1; // r6
}

// Range: 0x80035224 -> 0x8003523C
s32 cpuSetDeviceGet(struct __anon_0x4354C* pDevice, s32 (* pfGet8)(void*, u32, char*), s32 (* pfGet16)(void*, u32, s16*), s32 (* pfGet32)(void*, u32, s32*), s32 (* pfGet64)(void*, u32, s64*)) {
    // Parameters
    // struct __anon_0x4354C* pDevice; // r1+0x4
    // s32 (* pfGet8)(void*, u32, char*); // r1+0x8
    // s32 (* pfGet16)(void*, u32, s16*); // r1+0xC
    // s32 (* pfGet32)(void*, u32, s32*); // r1+0x10
    // s32 (* pfGet64)(void*, u32, s64*); // r1+0x14
}

// Range: 0x8003520C -> 0x80035224
s32 cpuSetDevicePut(struct __anon_0x4354C* pDevice, s32 (* pfPut8)(void*, u32, char*), s32 (* pfPut16)(void*, u32, s16*), s32 (* pfPut32)(void*, u32, s32*), s32 (* pfPut64)(void*, u32, s64*)) {
    // Parameters
    // struct __anon_0x4354C* pDevice; // r1+0x4
    // s32 (* pfPut8)(void*, u32, char*); // r1+0x8
    // s32 (* pfPut16)(void*, u32, s16*); // r1+0xC
    // s32 (* pfPut32)(void*, u32, s32*); // r1+0x10
    // s32 (* pfPut64)(void*, u32, s64*); // r1+0x14
}

// Range: 0x800351A0 -> 0x8003520C
s32 cpuSetCodeHack(struct _CPU* pCPU, s32 nAddress, s32 nOpcodeOld, s32 nOpcodeNew) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // s32 nAddress; // r1+0x4
    // s32 nOpcodeOld; // r1+0x8
    // s32 nOpcodeNew; // r1+0xC

    // Local variables
    s32 iHack; // r9
}

// Range: 0x80034C2C -> 0x800351A0
s32 cpuReset(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r31

    // Local variables
    s32 iRegister; // r1+0x8
    s32 iTLB; // r1+0x8

    // References
    // -> u8 gRegList[32];
    // -> u8 gRegCount;
    // -> void* gHeapTree;
    // -> u32 aHeapTreeFlag[125];
}

// Erased
static s32 cpuGetXPC(struct _CPU* pCPU, s32* pnPC, s32* pnLo, s32* pnHi) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // s32* pnPC; // r29
    // s32* pnLo; // r30
    // s32* pnHi; // r31

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuGetGPR(struct _CPU* pCPU, s32* anRegister) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* anRegister; // r31

    // Local variables
    s32 iRegister; // r1+0x8
    enum __anon_0x47970 eSize; // r1+0x18

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuGetCP0(struct _CPU* pCPU, s32* anRegister) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* anRegister; // r31

    // Local variables
    s32 iRegister; // r1+0x8

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuGetFPR(struct _CPU* pCPU, f64* arRegister, s32 bDouble) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // f64* arRegister; // r30
    // s32 bDouble; // r31

    // Local variables
    s32 iRegister; // r1+0x8

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuGetFCR(struct _CPU* pCPU, s32* anRegister) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* anRegister; // r31

    // Local variables
    s32 iRegister; // r1+0x8

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Range: 0x80034BB0 -> 0x80034C2C
s32 cpuSetXPC(struct _CPU* pCPU, s64 nPC, s64 nLo, s64 nHi) {
    // Parameters
    // struct _CPU* pCPU; // r26
    // s64 nPC; // r0
    // s64 nLo; // r29
    // s64 nHi; // r31

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuSetGPR(struct _CPU* pCPU, s32* anRegister) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* anRegister; // r31

    // Local variables
    s32 iRegister; // r1+0x8
    enum __anon_0x47970 eSize; // r1+0x18

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuSetCP0(struct _CPU* pCPU, s32* anRegister) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* anRegister; // r31

    // Local variables
    s32 iRegister; // r1+0x8

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuSetFPR(struct _CPU* pCPU, f64* arRegister, s32 bDouble) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // f64* arRegister; // r30
    // s32 bDouble; // r31

    // Local variables
    s32 iRegister; // r1+0x8

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Erased
static s32 cpuSetFCR(struct _CPU* pCPU, s32* anRegister) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* anRegister; // r31

    // Local variables
    s32 iRegister; // r1+0x8

    // References
    // -> struct _XL_OBJECTTYPE gClassCPU;
}

// Range: 0x800349A8 -> 0x80034BB0
s32 cpuEvent(struct _CPU* pCPU, s32 nEvent, void* pArgument) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r1+0x10
}

// Range: 0x8003493C -> 0x800349A8
s32 cpuGetAddressOffset(struct _CPU* pCPU, s32* pnOffset, u32 nAddress) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32* pnOffset; // r1+0x4
    // u32 nAddress; // r1+0x8

    // Local variables
    s32 iDevice; // r1+0x0
}

// Range: 0x800348C4 -> 0x8003493C
s32 cpuGetAddressBuffer(struct _CPU* pCPU, void* ppBuffer, u32 nAddress) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8
    // void* ppBuffer; // r4
    // u32 nAddress; // r5

    // Local variables
    struct __anon_0x4354C* pDevice; // r1+0x8
}

// Range: 0x80034734 -> 0x800348C4
s32 cpuGetOffsetAddress(struct _CPU* pCPU, u32* anAddress, s32* pnCount, u32 nOffset, u32 nSize) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // u32* anAddress; // r1+0xC
    // s32* pnCount; // r1+0x10
    // u32 nOffset; // r1+0x14
    // u32 nSize; // r1+0x18

    // Local variables
    s32 iEntry; // r1+0x8
    s32 iAddress; // r7
    u32 nAddress; // r1+0x8
    u32 nMask; // r1+0x8
    u32 nSizeMapped; // r26
}

// Range: 0x800346A8 -> 0x80034734
s32 cpuInvalidateCache(struct _CPU* pCPU, s32 nAddress0, s32 nAddress1) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // s32 nAddress0; // r30
    // s32 nAddress1; // r31
}

// Range: 0x80034468 -> 0x800346A8
s32 cpuGetFunctionChecksum(struct _CPU* pCPU, u32* pnChecksum, struct cpu_function* pFunction) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8
    // u32* pnChecksum; // r30
    // struct cpu_function* pFunction; // r31

    // Local variables
    s32 nSize; // r10
    u32* pnBuffer; // r1+0x18
    u32 nChecksum; // r11
    u32 nData; // r12
}

// Range: 0x800343CC -> 0x80034468
static s32 cpuHeapReset(u32* array, s32 count) {
    // Parameters
    // u32* array; // r3
    // s32 count; // r1+0x4

    // Local variables
    s32 i; // r6
}

// Range: 0x8003416C -> 0x800343CC
s32 cpuHeapTake(void* heap, struct _CPU* pCPU, struct cpu_function* pFunction, s32 memory_size) {
    // Parameters
    // void* heap; // r3
    // struct _CPU* pCPU; // r1+0xC
    // struct cpu_function* pFunction; // r1+0x10
    // s32 memory_size; // r6

    // Local variables
    s32 done; // r12
    s32 second; // r7
    u32* anPack; // r8
    s32 nPackCount; // r9
    s32 nBlockCount; // r10
    s32 nOffset; // r27
    s32 nCount; // r26
    s32 iPack; // r1+0x8
    u32 nPack; // r25
    u32 nMask; // r24
    u32 nMask0; // r23
}

// Range: 0x80034080 -> 0x8003416C
s32 cpuHeapFree(struct _CPU* pCPU, struct cpu_function* pFunction) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8
    // struct cpu_function* pFunction; // r4

    // Local variables
    u32* anPack; // r8
    s32 iPack; // r1+0x8
    u32 nMask; // r6
}

// Range: 0x80033FCC -> 0x80034080
static s32 cpuTreeTake(void* heap, s32* where) {
    // Parameters
    // void* heap; // r1+0x0
    // s32* where; // r1+0x4

    // Local variables
    s32 done; // r5
    s32 nOffset; // r8
    s32 nCount; // r1+0x0
    s32 iPack; // r1+0x0
    u32 nPack; // r9
    u32 nMask; // r10
    u32 nMask0; // r1+0x0

    // References
    // -> void* gHeapTree;
    // -> u32 aHeapTreeFlag[125];
}

// Erased
static s32 cpuTreeFree(struct cpu_function* pFunction) {
    // Parameters
    // struct cpu_function* pFunction; // r1+0x0

    // Local variables
    u32* anPack; // r1+0x0
    s32 iPack; // r1+0x0
    u32 nMask; // r5

    // References
    // -> u32 aHeapTreeFlag[125];
}

// Range: 0x80033448 -> 0x80033FCC
s32 cpuFindFunction(struct _CPU* pCPU, s32 theAddress, struct cpu_function** tree_node) {
    // Parameters
    // struct _CPU* pCPU; // r22
    // s32 theAddress; // r1+0x38
    // struct cpu_function** tree_node; // r28

    // Local variables
    struct __anon_0x4354C** apDevice; // r26
    u8* aiDevice; // r27
    u32 opcode; // r1+0x34
    u8 follow; // r1+0x3D
    u8 valid; // r16
    u8 check; // r1+0x3C
    u8 end_flag; // r18
    u8 save_restore; // r14
    u8 alert; // r15
    s32 beginAddress; // r21
    s32 cheat_address; // r17
    s32 current_address; // r31
    s32 temp_address; // r30
    s32 branch; // r1+0x8

    // References
    // -> static u8 Opcode[64];
    // -> static u8 RegimmOpcode[32];
    // -> static u8 SpecialOpcode[64];
}

// Range: 0x800332E8 -> 0x80033448
static s32 cpuDMAUpdateFunction(struct _CPU* pCPU, s32 start, s32 end) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // s32 start; // r29
    // s32 end; // r30

    // Local variables
    struct cpu_treeRoot* root; // r1+0x8
    s32 count; // r1+0x8
    s32 cancel; // r5
}

// Erased
static void treeCallerInit(struct cpu_callerID* block, s32 total) {
    // Parameters
    // struct cpu_callerID* block; // r3
    // s32 total; // r1+0x4

    // Local variables
    s32 count; // r6
}

// Erased
static s32 treeCallerKill(struct _CPU* pCPU, struct cpu_function* kill) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // struct cpu_function* kill; // r30

    // Local variables
    s32 left; // r1+0x14
    s32 right; // r1+0x10
    struct cpu_treeRoot* root; // r31
}

// Range: 0x800331E4 -> 0x800332E8
static s32 treeCallerCheck(struct _CPU* pCPU, struct cpu_function* tree, s32 flag, s32 nAddress0, s32 nAddress1) {
    // Parameters
    // struct _CPU* pCPU; // r24
    // struct cpu_function* tree; // r25
    // s32 flag; // r26
    // s32 nAddress0; // r27
    // s32 nAddress1; // r28

    // Local variables
    s32 count; // r30
    s32 saveGCN; // r6
    s32 saveN64; // r1+0x8
    s32* addr_function; // r1+0x8
    s32* addr_call; // r29
}

// Range: 0x8003318C -> 0x800331E4
static s32 treeInit(struct _CPU* pCPU, s32 root_address) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32 root_address; // r1+0x4

    // Local variables
    struct cpu_treeRoot* root; // r1+0x0
}

// Range: 0x80033070 -> 0x8003318C
static s32 treeInitNode(struct cpu_function** tree, struct cpu_function* prev, s32 start, s32 end) {
    // Parameters
    // struct cpu_function** tree; // r30
    // struct cpu_function* prev; // r31
    // s32 start; // r28
    // s32 end; // r29

    // Local variables
    struct cpu_function* node; // r1+0x1C
    s32 where; // r1+0x18
}

// Range: 0x80032DB0 -> 0x80033070
static s32 treeKill(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r28

    // Local variables
    struct cpu_treeRoot* root; // r1+0x8
    s32 count; // r29

    // References
    // -> u32 aHeapTreeFlag[125];
}

// Range: 0x80032AEC -> 0x80032DB0
static s32 treeKillNodes(struct _CPU* pCPU, struct cpu_function* tree) {
    // Parameters
    // struct _CPU* pCPU; // r23
    // struct cpu_function* tree; // r24

    // Local variables
    struct cpu_function* current; // r26
    struct cpu_function* kill; // r27
    s32 count; // r25

    // References
    // -> u32 aHeapTreeFlag[125];
}

// Range: 0x8003278C -> 0x80032AEC
static s32 treeDeleteNode(struct _CPU* pCPU, struct cpu_function** top, struct cpu_function* kill) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // struct cpu_function** top; // r1+0xC
    // struct cpu_function* kill; // r31

    // Local variables
    struct cpu_treeRoot* root; // r3
    struct cpu_function* save1; // r5
    struct cpu_function* save2; // r8
    struct cpu_function* connect; // r1+0x8

    // References
    // -> u32 aHeapTreeFlag[125];
}

// Erased
static s32 treeRebuild(struct _CPU* pCPU, s32 start_address, struct cpu_function** node) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // s32 start_address; // r30
    // struct cpu_function** node; // r31
}

// Erased
static s32 treeInsertAndReturn(struct _CPU* pCPU, s32 start, s32 end, struct cpu_function** ppFunction) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // s32 start; // r28
    // s32 end; // r29
    // struct cpu_function** ppFunction; // r30

    // Local variables
    struct cpu_treeRoot* root; // r31
    s32 flag; // r3
}

// Range: 0x80032670 -> 0x8003278C
s32 treeInsert(struct _CPU* pCPU, s32 start, s32 end) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // s32 start; // r29
    // s32 end; // r30

    // Local variables
    struct cpu_treeRoot* root; // r31
    struct cpu_function* current; // r1+0x14
    s32 flag; // r3
}

// Range: 0x80032588 -> 0x80032670
static s32 treeInsertNode(struct cpu_function** tree, s32 start, s32 end, struct cpu_function** ppFunction) {
    // Parameters
    // struct cpu_function** tree; // r31
    // s32 start; // r8
    // s32 end; // r7
    // struct cpu_function** ppFunction; // r30

    // Local variables
    struct cpu_function** current; // r31
    struct cpu_function* prev; // r4
}

// Range: 0x800323F0 -> 0x80032588
static s32 treeBalance(struct cpu_treeRoot* root) {
    // Parameters
    // struct cpu_treeRoot* root; // r1+0x0

    // Local variables
    struct cpu_function* tree; // r8
    struct cpu_function* current; // r4
    struct cpu_function* save; // r6
    s32 total; // r9
    s32 count; // r7
}

// Range: 0x80032204 -> 0x800323F0
static s32 treeAdjustRoot(struct _CPU* pCPU, s32 new_end) {
    // Parameters
    // struct _CPU* pCPU; // r23
    // s32 new_end; // r24

    // Local variables
    s32 old_root; // r1+0x8
    s32 new_root; // r30
    s32 kill_start; // r29
    s32 check1; // r1+0x8
    s32 check2; // r28
    u16 total; // r27
    s32 total_memory; // r26
    s32 address; // r22
    struct cpu_treeRoot* root; // r25
    struct cpu_function* node; // r1+0x18
    struct cpu_function* change; // r1+0x14
}

// Erased
static s32 treeSearch(struct _CPU* pCPU, s32 target, struct cpu_function** node) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x8
    // s32 target; // r4
    // struct cpu_function** node; // r5

    // Local variables
    struct cpu_treeRoot* root; // r1+0x8
    s32 flag; // r3
}

// Range: 0x800321A0 -> 0x80032204
static s32 treeSearchNode(struct cpu_function* tree, s32 target, struct cpu_function** node) {
    // Parameters
    // struct cpu_function* tree; // r3
    // s32 target; // r1+0x4
    // struct cpu_function** node; // r1+0x8

    // Local variables
    struct cpu_function* current; // r3
}

// Range: 0x800319F0 -> 0x800321A0
static s32 treeKillRange(struct _CPU* pCPU, struct cpu_function* tree, s32 start, s32 end) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // struct cpu_function* tree; // r24
    // s32 start; // r25
    // s32 end; // r26

    // Local variables
    struct cpu_treeRoot* root; // r29
    struct cpu_function* node1; // r1+0x3C
    struct cpu_function* node2; // r1+0x38
    struct cpu_function* save1; // r3
    struct cpu_function* save2; // r4
    struct cpu_function* connect; // r5
    s32 update; // r28
    s32 count; // r27

    // References
    // -> u32 aHeapTreeFlag[125];
}

// Range: 0x80031960 -> 0x800319F0
static s32 treeKillReason(struct _CPU* pCPU, s32* value) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
    // s32* value; // r1+0x4
}

// Range: 0x8003184C -> 0x80031960
static s32 treeTimerCheck(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r30

    // Local variables
    struct cpu_treeRoot* root; // r1+0x8
    s32 begin; // r1+0x10
    s32 end; // r1+0xC
}

// Erased
static s32 treeCleanUpCheck(struct _CPU* pCPU, struct cpu_function* node) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // struct cpu_function* node; // r30

    // Local variables
    struct cpu_treeRoot* root; // r31
}

// Range: 0x8003171C -> 0x8003184C
static s32 treeCleanUp(struct _CPU* pCPU, struct cpu_treeRoot* root) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // struct cpu_treeRoot* root; // r31

    // Local variables
    s32 done; // r3
    s32 complete; // r30
}

// Range: 0x8003143C -> 0x8003171C
static s32 treeCleanNodes(struct _CPU* pCPU, struct cpu_function* top) {
    // Parameters
    // struct _CPU* pCPU; // r27
    // struct cpu_function* top; // r1+0xC

    // Local variables
    struct cpu_function** current; // r30
    struct cpu_function* kill; // r29
    struct cpu_treeRoot* root; // r1+0x8
    s32 kill_limit; // r28
}

// Erased
static s32 treeForceCleanUp(struct _CPU* pCPU, struct cpu_function* node, s32 kill_value) {
    // Parameters
    // struct _CPU* pCPU; // r3
    // struct cpu_function* node; // r1+0xC
    // s32 kill_value; // r5

    // Local variables
    struct cpu_treeRoot* root; // r31
}

// Range: 0x80031268 -> 0x8003143C
static s32 treeForceCleanNodes(struct _CPU* pCPU, struct cpu_function* tree, s32 kill_limit) {
    // Parameters
    // struct _CPU* pCPU; // r28
    // struct cpu_function* tree; // r1+0xC
    // s32 kill_limit; // r29

    // Local variables
    struct cpu_function* current; // r31
    struct cpu_function* kill; // r30
}

// Erased
static s32 treePrint(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r29

    // Local variables
    struct cpu_treeRoot* root; // r1+0x8
    s32 left; // r1+0x10
    s32 right; // r1+0xC
}

// Range: 0x80031084 -> 0x80031268
static s32 treePrintNode(struct _CPU* pCPU, struct cpu_function* tree, s32 print_flag, s32* left, s32* right) {
    // Parameters
    // struct _CPU* pCPU; // r21
    // struct cpu_function* tree; // r22
    // s32 print_flag; // r1+0x10
    // s32* left; // r23
    // s32* right; // r24

    // Local variables
    struct cpu_function* current; // r27
    s32 flag; // r26
    s32 level; // r25

    // References
    // -> s32 ganMapGPR[32];
}

// Erased
static s32 treeMemory(struct _CPU* pCPU) {
    // Parameters
    // struct _CPU* pCPU; // r1+0x0
}

// Range: 0x80030F70 -> 0x80031084
static s32 cpuOpcodeChecksum(u32 opcode) {
    // Parameters
    // u32 opcode; // r1+0x0

    // Local variables
    s32 flag; // r5
}

// Erased
static s32 cpuDoubleCheckSameChecksum(struct cpu_disk_node* pDisk, s32 start) {
    // Parameters
    // struct cpu_disk_node* pDisk; // r30
    // s32 start; // r4

    // Local variables
    s32 count; // r1+0x8
    s32 instruction; // r1+0x8
    u32* last; // r31
    u32* current; // r1+0x10

    // References
    // -> struct __anon_0x4253E* gpSystem;
}

// Erased
static s32 cpuCheckOpcodeHack(struct _CPU* pCPU, s32 startAddress, s32 instruction) {
    // Parameters
    // struct _CPU* pCPU; // r29
    // s32 startAddress; // r30
    // s32 instruction; // r31

    // Local variables
    s32 iHack; // r1+0x8
    u32* opcode; // r1+0x14
}

// Erased
static s32 cpuUpdateDiskChecksum(u32* checksum, s32 startAddress, s32 endAddress) {
    // Parameters
    // u32* checksum; // r29
    // s32 startAddress; // r4
    // s32 endAddress; // r1+0x10

    // Local variables
    s32 count; // r31
    s32 instruction; // r30
    s32 check; // r1+0x8
    u32* opcode; // r1+0x14
    u32 part; // r27

    // References
    // -> struct __anon_0x4253E* gpSystem;
}
