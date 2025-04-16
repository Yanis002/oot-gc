/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\mips.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800909FC -> 0x80090F3C
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x789A7; // size = 0x10

// size = 0x10, address = 0x800F7D70
struct _XL_OBJECTTYPE gClassMips;

typedef struct __anon_0x78A99 {
    /* 0x0 */ s32 nMask;
    /* 0x4 */ s32 nMode;
    /* 0x8 */ void* pHost;
    /* 0xC */ s32 nInterrupt;
} __anon_0x78A99; // size = 0x10

typedef enum __anon_0x78E3C {
    MIT_NONE = -1,
    MIT_SP = 0,
    MIT_SI = 1,
    MIT_AI = 2,
    MIT_VI = 3,
    MIT_PI = 4,
    MIT_DP = 5,
} __anon_0x78E3C;

// Range: 0x80090E50 -> 0x80090F3C
s32 mipsSetInterrupt(struct __anon_0x78A99* pMips, enum __anon_0x78E3C eType) {
    // Parameters
    // struct __anon_0x78A99* pMips; // r1+0x0
    // enum __anon_0x78E3C eType; // r1+0x4

    // Local variables
    s32 nInterrupt; // r5
}

// Range: 0x80090DAC -> 0x80090E50
s32 mipsResetInterrupt(struct __anon_0x78A99* pMips, enum __anon_0x78E3C eType) {
    // Parameters
    // struct __anon_0x78A99* pMips; // r1+0x0
    // enum __anon_0x78E3C eType; // r1+0x4

    // Local variables
    s32 nInterrupt; // r5
}

// Range: 0x80090DA4 -> 0x80090DAC
s32 mipsPut8() {}

// Range: 0x80090D9C -> 0x80090DA4
s32 mipsPut16() {}

// Range: 0x80090B94 -> 0x80090D9C
s32 mipsPut32(struct __anon_0x78A99* pMips, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x78A99* pMips; // r30
    // u32 nAddress; // r1+0xC
    // s32* pData; // r1+0x10

    // Local variables
    s32 nData; // r31
}

// Range: 0x80090B8C -> 0x80090B94
s32 mipsPut64() {}

// Range: 0x80090B84 -> 0x80090B8C
s32 mipsGet8() {}

// Range: 0x80090B7C -> 0x80090B84
s32 mipsGet16() {}

// Range: 0x80090B14 -> 0x80090B7C
s32 mipsGet32(struct __anon_0x78A99* pMips, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x78A99* pMips; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x80090B0C -> 0x80090B14
s32 mipsGet64() {}

// Range: 0x800909FC -> 0x80090B0C
s32 mipsEvent(struct __anon_0x78A99* pMips, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x78A99* pMips; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
