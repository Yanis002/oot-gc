/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\ram.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8006C574 -> 0x8006CB88
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x4E326; // size = 0x10

// size = 0x10, address = 0x800F5D08
struct _XL_OBJECTTYPE gClassRAM;

typedef struct __anon_0x4E417 {
    /* 0x0 */ void* pHost;
    /* 0x4 */ void* pBuffer;
    /* 0x8 */ u32 nSize;
} __anon_0x4E417; // size = 0xC

// Range: 0x8006CB80 -> 0x8006CB88
static s32 ramPutControl8() {}

// Range: 0x8006CB78 -> 0x8006CB80
static s32 ramPutControl16() {}

// Range: 0x8006CB44 -> 0x8006CB78
static s32 ramPutControl32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006CB3C -> 0x8006CB44
static s32 ramPutControl64() {}

// Range: 0x8006CB34 -> 0x8006CB3C
static s32 ramGetControl8() {}

// Range: 0x8006CB2C -> 0x8006CB34
static s32 ramGetControl16() {}

// Range: 0x8006CAF8 -> 0x8006CB2C
static s32 ramGetControl32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006CAF0 -> 0x8006CAF8
static s32 ramGetControl64() {}

// Range: 0x8006CAE8 -> 0x8006CAF0
static s32 ramPutRI8() {}

// Range: 0x8006CAE0 -> 0x8006CAE8
static s32 ramPutRI16() {}

// Range: 0x8006CAAC -> 0x8006CAE0
static s32 ramPutRI32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006CAA4 -> 0x8006CAAC
static s32 ramPutRI64() {}

// Range: 0x8006CA9C -> 0x8006CAA4
static s32 ramGetRI8() {}

// Range: 0x8006CA94 -> 0x8006CA9C
static s32 ramGetRI16() {}

// Range: 0x8006CA60 -> 0x8006CA94
static s32 ramGetRI32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006CA58 -> 0x8006CA60
static s32 ramGetRI64() {}

// Range: 0x8006CA34 -> 0x8006CA58
static s32 ramPut8(struct __anon_0x4E417* pRAM, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r6
    // char* pData; // r1+0x8
}

// Range: 0x8006CA0C -> 0x8006CA34
static s32 ramPut16(struct __anon_0x4E417* pRAM, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r6
    // s16* pData; // r1+0x8
}

// Range: 0x8006C9E4 -> 0x8006CA0C
static s32 ramPut32(struct __anon_0x4E417* pRAM, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r6
    // s32* pData; // r1+0x8
}

// Range: 0x8006C9B0 -> 0x8006C9E4
static s32 ramPut64(struct __anon_0x4E417* pRAM, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s64* pData; // r1+0x8
}

// Range: 0x8006C980 -> 0x8006C9B0
static s32 ramGet8(struct __anon_0x4E417* pRAM, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // char* pData; // r1+0x8
}

// Range: 0x8006C94C -> 0x8006C980
static s32 ramGet16(struct __anon_0x4E417* pRAM, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s16* pData; // r1+0x8
}

// Range: 0x8006C918 -> 0x8006C94C
static s32 ramGet32(struct __anon_0x4E417* pRAM, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s32* pData; // r1+0x8
}

// Range: 0x8006C8D4 -> 0x8006C918
static s32 ramGet64(struct __anon_0x4E417* pRAM, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s64* pData; // r1+0x8
}

// Range: 0x8006C87C -> 0x8006C8D4
s32 ramGetBuffer(struct __anon_0x4E417* pRAM, void* ppRAM, u32 nOffset, u32* pnSize) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // void* ppRAM; // r1+0x4
    // u32 nOffset; // r5
    // u32* pnSize; // r1+0xC
}

// Range: 0x8006C834 -> 0x8006C87C
s32 ramWipe(struct __anon_0x4E417* pRAM) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r3
}

// Range: 0x8006C7C4 -> 0x8006C834
s32 ramSetSize(struct __anon_0x4E417* pRAM, u32 nSize) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r30
    // u32 nSize; // r31
}

// Range: 0x8006C7AC -> 0x8006C7C4
s32 ramGetSize(struct __anon_0x4E417* pRAM, u32* pnSize) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r1+0x0
    // u32* pnSize; // r1+0x4
}

// Range: 0x8006C574 -> 0x8006C7AC
s32 ramEvent(struct __anon_0x4E417* pRAM, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x4E417* pRAM; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
