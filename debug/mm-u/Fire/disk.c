/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\disk.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80090F3C -> 0x800911D0
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x791AB; // size = 0x10

// size = 0x10, address = 0x800F7DE8
struct _XL_OBJECTTYPE gClassDisk;

typedef struct __anon_0x7929D {
    /* 0x0 */ void* pHost;
} __anon_0x7929D; // size = 0x4

// Range: 0x800911C8 -> 0x800911D0
static s32 diskPutROM8() {}

// Range: 0x800911C0 -> 0x800911C8
static s32 diskPutROM16() {}

// Range: 0x800911B8 -> 0x800911C0
static s32 diskPutROM32() {}

// Range: 0x800911B0 -> 0x800911B8
static s32 diskPutROM64() {}

// Range: 0x800911A0 -> 0x800911B0
static s32 diskGetROM8(char* pData) {
    // Parameters
    // char* pData; // r1+0x8
}

// Range: 0x80091190 -> 0x800911A0
static s32 diskGetROM16(s16* pData) {
    // Parameters
    // s16* pData; // r1+0x8
}

// Range: 0x80091180 -> 0x80091190
static s32 diskGetROM32(s32* pData) {
    // Parameters
    // s32* pData; // r1+0x8
}

// Range: 0x8009116C -> 0x80091180
static s32 diskGetROM64(s64* pData) {
    // Parameters
    // s64* pData; // r1+0x8
}

// Range: 0x80091164 -> 0x8009116C
static s32 diskPutDrive8() {}

// Range: 0x8009115C -> 0x80091164
static s32 diskPutDrive16() {}

// Range: 0x80091130 -> 0x8009115C
static s32 diskPutDrive32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x80091128 -> 0x80091130
static s32 diskPutDrive64() {}

// Range: 0x80091120 -> 0x80091128
static s32 diskGetDrive8() {}

// Range: 0x80091118 -> 0x80091120
static s32 diskGetDrive16() {}

// Range: 0x800910E0 -> 0x80091118
static s32 diskGetDrive32(u32 nAddress, s32* pData) {
    // Parameters
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x800910D8 -> 0x800910E0
static s32 diskGetDrive64() {}

// Range: 0x80090F3C -> 0x800910D8
s32 diskEvent(struct __anon_0x7929D* pDisk, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7929D* pDisk; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
