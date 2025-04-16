/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\flash.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800911D0 -> 0x800918EC
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x79908; // size = 0x10

// size = 0x10, address = 0x800F7DF8
struct _XL_OBJECTTYPE gClassFlash;

typedef struct __anon_0x799FB {
    /* 0x0 */ void* pHost;
    /* 0x4 */ s32 flashCommand;
    /* 0x8 */ char* flashBuffer;
    /* 0xC */ s32 flashStatus;
} __anon_0x799FB; // size = 0x10

// Range: 0x800917A8 -> 0x800918EC
s32 flashCopyFLASH(struct __anon_0x799FB* pFLASH, s32 nOffsetRAM, s32 nOffsetFLASH, s32 nSize) {
    // Parameters
    // struct __anon_0x799FB* pFLASH; // r30
    // s32 nOffsetRAM; // r4
    // s32 nOffsetFLASH; // r31
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
}

// Range: 0x80091694 -> 0x800917A8
s32 flashTransferFLASH(struct __anon_0x799FB* pFLASH, s32 nOffsetRAM, s32 nSize) {
    // Parameters
    // struct __anon_0x799FB* pFLASH; // r31
    // s32 nOffsetRAM; // r4
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
    s32 i; // r4
}

// Range: 0x8009168C -> 0x80091694
static s32 flashPut8() {}

// Range: 0x80091684 -> 0x8009168C
static s32 flashPut16() {}

// Range: 0x800913B4 -> 0x80091684
static s32 flashPut32(struct __anon_0x799FB* pFLASH, s32* pData) {
    // Parameters
    // struct __anon_0x799FB* pFLASH; // r30
    // s32* pData; // r31

    // Local variables
    s32 i; // r1+0x8
    char buffer[128]; // r1+0x1C
}

// Range: 0x800913AC -> 0x800913B4
static s32 flashPut64() {}

// Range: 0x800913A4 -> 0x800913AC
static s32 flashGet8() {}

// Range: 0x8009139C -> 0x800913A4
static s32 flashGet16() {}

// Range: 0x800912F8 -> 0x8009139C
static s32 flashGet32(struct __anon_0x799FB* pFLASH, s32* pData) {
    // Parameters
    // struct __anon_0x799FB* pFLASH; // r1+0x0
    // s32* pData; // r1+0x8
}

// Range: 0x800912F0 -> 0x800912F8
static s32 flashGet64() {}

// Range: 0x800911D0 -> 0x800912F0
s32 flashEvent(struct __anon_0x799FB* pFLASH, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x799FB* pFLASH; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
