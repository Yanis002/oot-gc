/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\movie.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80010528 -> 0x80010638
*/

#include "types.h"

// size = 0x4, address = 0x8012FD58
u8* gBufferP;

// size = 0x4, address = 0x8012FB28
s32 __OSCurrHeap;

typedef enum __anon_0x105F6 {
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
} __anon_0x105F6;

typedef enum __anon_0x1073E {
    VI_XFBMODE_SF = 0,
    VI_XFBMODE_DF = 1,
} __anon_0x1073E;

typedef struct _GXRenderModeObj {
    /* 0x00 */ enum __anon_0x105F6 viTVmode;
    /* 0x04 */ u16 fbWidth;
    /* 0x06 */ u16 efbHeight;
    /* 0x08 */ u16 xfbHeight;
    /* 0x0A */ u16 viXOrigin;
    /* 0x0C */ u16 viYOrigin;
    /* 0x0E */ u16 viWidth;
    /* 0x10 */ u16 viHeight;
    /* 0x14 */ enum __anon_0x1073E xFBmode;
    /* 0x18 */ u8 field_rendering;
    /* 0x19 */ u8 aa;
    /* 0x1A */ u8 sample_pattern[12][2];
    /* 0x32 */ u8 vfilter[7];
} __anon_0x107ED; // size = 0x3C

// size = 0x4, address = 0x8012FCBC
struct _GXRenderModeObj* rmode;

typedef enum __anon_0x10A7C {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x10A7C;

typedef struct __anon_0x10AE1 {
    /* 0x0 */ s32 nSize;
    /* 0x4 */ s32 nOffsetRAM;
    /* 0x8 */ s32 nOffsetROM;
    /* 0xC */ s32 (* pCallback)();
} __anon_0x10AE1; // size = 0x10

typedef enum __anon_0x10B92 {
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
} __anon_0x10B92;

typedef enum __anon_0x10CF2 {
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
} __anon_0x10CF2;

typedef struct __anon_0x10E2F {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ s32 bException;
    /* 0x0C */ enum __anon_0x10A7C eMode;
    /* 0x10 */ struct __anon_0x10AE1 romCopy;
    /* 0x20 */ enum __anon_0x10B92 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x10CF2 storageDevice;
    /* 0x74 */ u8 anException[16];
} __anon_0x10E2F; // size = 0x88

// size = 0x4, address = 0x8012FD48
struct __anon_0x10E2F* gpSystem;

// Range: 0x80010560 -> 0x80010638
void MovieInit() {
    // Local variables
    char* szText; // r1+0x8
    u32 size; // r4

    // References
    // -> u8* gBufferP;
    // -> s32 __OSCurrHeap;
    // -> struct __anon_0x10E2F* gpSystem;
}

// Erased
static void MovieUpdate() {}

// Range: 0x80010528 -> 0x80010560
void MovieDraw() {
    // References
    // -> struct _GXRenderModeObj* rmode;
}

// Erased
static void MovieDestroy() {
    // References
    // -> u8* gBufferP;
    // -> s32 __OSCurrHeap;
}
