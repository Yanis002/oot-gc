/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\flash.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80090828 -> 0x80090F44
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7C00C; // size = 0x10

// size = 0x10, address = 0x800E6A70
struct _XL_OBJECTTYPE gClassFlash;

typedef struct __anon_0x7C0FF {
    /* 0x0 */ void* pHost;
    /* 0x4 */ s32 flashCommand;
    /* 0x8 */ char* flashBuffer;
    /* 0xC */ s32 flashStatus;
} __anon_0x7C0FF; // size = 0x10

// Range: 0x80090E00 -> 0x80090F44
s32 flashCopyFLASH(struct __anon_0x7C0FF* pFLASH, s32 nOffsetRAM, s32 nOffsetFLASH, s32 nSize) {
    // Parameters
    // struct __anon_0x7C0FF* pFLASH; // r30
    // s32 nOffsetRAM; // r4
    // s32 nOffsetFLASH; // r31
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
}

// Range: 0x80090CEC -> 0x80090E00
s32 flashTransferFLASH(struct __anon_0x7C0FF* pFLASH, s32 nOffsetRAM, s32 nSize) {
    // Parameters
    // struct __anon_0x7C0FF* pFLASH; // r31
    // s32 nOffsetRAM; // r4
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
    s32 i; // r4
}

// Range: 0x80090CE4 -> 0x80090CEC
static s32 flashPut8() {}

// Range: 0x80090CDC -> 0x80090CE4
static s32 flashPut16() {}

// Range: 0x80090A0C -> 0x80090CDC
static s32 flashPut32(struct __anon_0x7C0FF* pFLASH, s32* pData) {
    // Parameters
    // struct __anon_0x7C0FF* pFLASH; // r30
    // s32* pData; // r31

    // Local variables
    s32 i; // r1+0x8
    char buffer[128]; // r1+0x1C
}

// Range: 0x80090A04 -> 0x80090A0C
static s32 flashPut64() {}

// Range: 0x800909FC -> 0x80090A04
static s32 flashGet8() {}

// Range: 0x800909F4 -> 0x800909FC
static s32 flashGet16() {}

// Range: 0x80090950 -> 0x800909F4
static s32 flashGet32(struct __anon_0x7C0FF* pFLASH, s32* pData) {
    // Parameters
    // struct __anon_0x7C0FF* pFLASH; // r1+0x0
    // s32* pData; // r1+0x8
}

// Range: 0x80090948 -> 0x80090950
static s32 flashGet64() {}

// Range: 0x80090828 -> 0x80090948
s32 flashEvent(struct __anon_0x7C0FF* pFLASH, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7C0FF* pFLASH; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
