/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\sram.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80090F44 -> 0x800912B4
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7C82F; // size = 0x10

// size = 0x10, address = 0x800E6A80
struct _XL_OBJECTTYPE gClassSram;

typedef struct __anon_0x7C921 {
    /* 0x0 */ void* pHost;
} __anon_0x7C921; // size = 0x4

// Range: 0x8009123C -> 0x800912B4
s32 sramCopySRAM(struct __anon_0x7C921* pSRAM, s32 nOffsetRAM, s32 nOffsetSRAM, s32 nSize) {
    // Parameters
    // struct __anon_0x7C921* pSRAM; // r1+0x8
    // s32 nOffsetRAM; // r4
    // s32 nOffsetSRAM; // r31
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
}

// Range: 0x800911C4 -> 0x8009123C
s32 sramTransferSRAM(struct __anon_0x7C921* pSRAM, s32 nOffsetRAM, s32 nOffsetSRAM, s32 nSize) {
    // Parameters
    // struct __anon_0x7C921* pSRAM; // r1+0x8
    // s32 nOffsetRAM; // r4
    // s32 nOffsetSRAM; // r31
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
}

// Range: 0x80091194 -> 0x800911C4
static s32 sramPut8(u32 nAddress, char* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // char* pData; // r5
}

// Range: 0x80091164 -> 0x80091194
static s32 sramPut16(u32 nAddress, s16* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s16* pData; // r5
}

// Range: 0x80091134 -> 0x80091164
static s32 sramPut32(u32 nAddress, s32* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s32* pData; // r5
}

// Range: 0x80091104 -> 0x80091134
static s32 sramPut64(u32 nAddress, s64* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s64* pData; // r5
}

// Range: 0x800910D4 -> 0x80091104
static s32 sramGet8(u32 nAddress, char* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // char* pData; // r5
}

// Range: 0x800910A4 -> 0x800910D4
static s32 sramGet16(u32 nAddress, s16* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s16* pData; // r5
}

// Range: 0x80091074 -> 0x800910A4
static s32 sramGet32(u32 nAddress, s32* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s32* pData; // r5
}

// Range: 0x80091044 -> 0x80091074
static s32 sramGet64(u32 nAddress, s64* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s64* pData; // r5
}

// Range: 0x80090F44 -> 0x80091044
s32 sramEvent(struct __anon_0x7C921* pSram, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7C921* pSram; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
