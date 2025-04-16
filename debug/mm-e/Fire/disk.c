/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\disk.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80090594 -> 0x80090828
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7B8AF; // size = 0x10

// size = 0x10, address = 0x800E6A60
struct _XL_OBJECTTYPE gClassDisk;

typedef struct __anon_0x7B9A1 {
    /* 0x0 */ void* pHost;
} __anon_0x7B9A1; // size = 0x4

// Range: 0x80090820 -> 0x80090828
static s32 diskPutROM8() {}

// Range: 0x80090818 -> 0x80090820
static s32 diskPutROM16() {}

// Range: 0x80090810 -> 0x80090818
static s32 diskPutROM32() {}

// Range: 0x80090808 -> 0x80090810
static s32 diskPutROM64() {}

// Range: 0x800907F8 -> 0x80090808
static s32 diskGetROM8(char* pData) {
    // Parameters
    // char* pData; // r1+0x8
}

// Range: 0x800907E8 -> 0x800907F8
static s32 diskGetROM16(s16* pData) {
    // Parameters
    // s16* pData; // r1+0x8
}

// Range: 0x800907D8 -> 0x800907E8
static s32 diskGetROM32(s32* pData) {
    // Parameters
    // s32* pData; // r1+0x8
}

// Range: 0x800907C4 -> 0x800907D8
static s32 diskGetROM64(s64* pData) {
    // Parameters
    // s64* pData; // r1+0x8
}

// Range: 0x800907BC -> 0x800907C4
static s32 diskPutDrive8() {}

// Range: 0x800907B4 -> 0x800907BC
static s32 diskPutDrive16() {}

// Range: 0x80090788 -> 0x800907B4
static s32 diskPutDrive32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x80090780 -> 0x80090788
static s32 diskPutDrive64() {}

// Range: 0x80090778 -> 0x80090780
static s32 diskGetDrive8() {}

// Range: 0x80090770 -> 0x80090778
static s32 diskGetDrive16() {}

// Range: 0x80090738 -> 0x80090770
static s32 diskGetDrive32(u32 nAddress, s32* pData) {
    // Parameters
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x80090730 -> 0x80090738
static s32 diskGetDrive64() {}

// Range: 0x80090594 -> 0x80090730
s32 diskEvent(struct __anon_0x7B9A1* pDisk, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7B9A1* pDisk; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
