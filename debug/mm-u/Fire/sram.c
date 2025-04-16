/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\sram.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800918EC -> 0x80091C5C
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7A12B; // size = 0x10

// size = 0x10, address = 0x800F7E08
struct _XL_OBJECTTYPE gClassSram;

typedef struct __anon_0x7A21D {
    /* 0x0 */ void* pHost;
} __anon_0x7A21D; // size = 0x4

// Range: 0x80091BE4 -> 0x80091C5C
s32 sramCopySRAM(struct __anon_0x7A21D* pSRAM, s32 nOffsetRAM, s32 nOffsetSRAM, s32 nSize) {
    // Parameters
    // struct __anon_0x7A21D* pSRAM; // r1+0x8
    // s32 nOffsetRAM; // r4
    // s32 nOffsetSRAM; // r31
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
}

// Range: 0x80091B6C -> 0x80091BE4
s32 sramTransferSRAM(struct __anon_0x7A21D* pSRAM, s32 nOffsetRAM, s32 nOffsetSRAM, s32 nSize) {
    // Parameters
    // struct __anon_0x7A21D* pSRAM; // r1+0x8
    // s32 nOffsetRAM; // r4
    // s32 nOffsetSRAM; // r31
    // s32 nSize; // r1+0x14

    // Local variables
    void* pTarget; // r1+0x18
}

// Range: 0x80091B3C -> 0x80091B6C
static s32 sramPut8(u32 nAddress, char* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // char* pData; // r5
}

// Range: 0x80091B0C -> 0x80091B3C
static s32 sramPut16(u32 nAddress, s16* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s16* pData; // r5
}

// Range: 0x80091ADC -> 0x80091B0C
static s32 sramPut32(u32 nAddress, s32* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s32* pData; // r5
}

// Range: 0x80091AAC -> 0x80091ADC
static s32 sramPut64(u32 nAddress, s64* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s64* pData; // r5
}

// Range: 0x80091A7C -> 0x80091AAC
static s32 sramGet8(u32 nAddress, char* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // char* pData; // r5
}

// Range: 0x80091A4C -> 0x80091A7C
static s32 sramGet16(u32 nAddress, s16* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s16* pData; // r5
}

// Range: 0x80091A1C -> 0x80091A4C
static s32 sramGet32(u32 nAddress, s32* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s32* pData; // r5
}

// Range: 0x800919EC -> 0x80091A1C
static s32 sramGet64(u32 nAddress, s64* pData) {
    // Parameters
    // u32 nAddress; // r1+0xC
    // s64* pData; // r5
}

// Range: 0x800918EC -> 0x800919EC
s32 sramEvent(struct __anon_0x7A21D* pSram, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7A21D* pSram; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
