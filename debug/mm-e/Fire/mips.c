/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\mips.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80090054 -> 0x80090594
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7B0AB; // size = 0x10

// size = 0x10, address = 0x800E69E8
struct _XL_OBJECTTYPE gClassMips;

typedef struct __anon_0x7B19D {
    /* 0x0 */ s32 nMask;
    /* 0x4 */ s32 nMode;
    /* 0x8 */ void* pHost;
    /* 0xC */ s32 nInterrupt;
} __anon_0x7B19D; // size = 0x10

typedef enum __anon_0x7B540 {
    MIT_NONE = -1,
    MIT_SP = 0,
    MIT_SI = 1,
    MIT_AI = 2,
    MIT_VI = 3,
    MIT_PI = 4,
    MIT_DP = 5,
} __anon_0x7B540;

// Range: 0x800904A8 -> 0x80090594
s32 mipsSetInterrupt(struct __anon_0x7B19D* pMips, enum __anon_0x7B540 eType) {
    // Parameters
    // struct __anon_0x7B19D* pMips; // r1+0x0
    // enum __anon_0x7B540 eType; // r1+0x4

    // Local variables
    s32 nInterrupt; // r5
}

// Range: 0x80090404 -> 0x800904A8
s32 mipsResetInterrupt(struct __anon_0x7B19D* pMips, enum __anon_0x7B540 eType) {
    // Parameters
    // struct __anon_0x7B19D* pMips; // r1+0x0
    // enum __anon_0x7B540 eType; // r1+0x4

    // Local variables
    s32 nInterrupt; // r5
}

// Range: 0x800903FC -> 0x80090404
s32 mipsPut8() {}

// Range: 0x800903F4 -> 0x800903FC
s32 mipsPut16() {}

// Range: 0x800901EC -> 0x800903F4
s32 mipsPut32(struct __anon_0x7B19D* pMips, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x7B19D* pMips; // r30
    // u32 nAddress; // r1+0xC
    // s32* pData; // r1+0x10

    // Local variables
    s32 nData; // r31
}

// Range: 0x800901E4 -> 0x800901EC
s32 mipsPut64() {}

// Range: 0x800901DC -> 0x800901E4
s32 mipsGet8() {}

// Range: 0x800901D4 -> 0x800901DC
s32 mipsGet16() {}

// Range: 0x8009016C -> 0x800901D4
s32 mipsGet32(struct __anon_0x7B19D* pMips, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x7B19D* pMips; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x80090164 -> 0x8009016C
s32 mipsGet64() {}

// Range: 0x80090054 -> 0x80090164
s32 mipsEvent(struct __anon_0x7B19D* pMips, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7B19D* pMips; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
