/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\ram.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8006CFF4 -> 0x8006D608
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x50AF6; // size = 0x10

// size = 0x10, address = 0x800E4C88
struct _XL_OBJECTTYPE gClassRAM;

typedef struct __anon_0x50BE7 {
    /* 0x0 */ void* pHost;
    /* 0x4 */ void* pBuffer;
    /* 0x8 */ u32 nSize;
} __anon_0x50BE7; // size = 0xC

// Range: 0x8006D600 -> 0x8006D608
static s32 ramPutControl8() {}

// Range: 0x8006D5F8 -> 0x8006D600
static s32 ramPutControl16() {}

// Range: 0x8006D5C4 -> 0x8006D5F8
static s32 ramPutControl32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006D5BC -> 0x8006D5C4
static s32 ramPutControl64() {}

// Range: 0x8006D5B4 -> 0x8006D5BC
static s32 ramGetControl8() {}

// Range: 0x8006D5AC -> 0x8006D5B4
static s32 ramGetControl16() {}

// Range: 0x8006D578 -> 0x8006D5AC
static s32 ramGetControl32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006D570 -> 0x8006D578
static s32 ramGetControl64() {}

// Range: 0x8006D568 -> 0x8006D570
static s32 ramPutRI8() {}

// Range: 0x8006D560 -> 0x8006D568
static s32 ramPutRI16() {}

// Range: 0x8006D52C -> 0x8006D560
static s32 ramPutRI32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006D524 -> 0x8006D52C
static s32 ramPutRI64() {}

// Range: 0x8006D51C -> 0x8006D524
static s32 ramGetRI8() {}

// Range: 0x8006D514 -> 0x8006D51C
static s32 ramGetRI16() {}

// Range: 0x8006D4E0 -> 0x8006D514
static s32 ramGetRI32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x8006D4D8 -> 0x8006D4E0
static s32 ramGetRI64() {}

// Range: 0x8006D4B4 -> 0x8006D4D8
static s32 ramPut8(struct __anon_0x50BE7* pRAM, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r6
    // char* pData; // r1+0x8
}

// Range: 0x8006D48C -> 0x8006D4B4
static s32 ramPut16(struct __anon_0x50BE7* pRAM, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r6
    // s16* pData; // r1+0x8
}

// Range: 0x8006D464 -> 0x8006D48C
static s32 ramPut32(struct __anon_0x50BE7* pRAM, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r6
    // s32* pData; // r1+0x8
}

// Range: 0x8006D430 -> 0x8006D464
static s32 ramPut64(struct __anon_0x50BE7* pRAM, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s64* pData; // r1+0x8
}

// Range: 0x8006D400 -> 0x8006D430
static s32 ramGet8(struct __anon_0x50BE7* pRAM, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // char* pData; // r1+0x8
}

// Range: 0x8006D3CC -> 0x8006D400
static s32 ramGet16(struct __anon_0x50BE7* pRAM, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s16* pData; // r1+0x8
}

// Range: 0x8006D398 -> 0x8006D3CC
static s32 ramGet32(struct __anon_0x50BE7* pRAM, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s32* pData; // r1+0x8
}

// Range: 0x8006D354 -> 0x8006D398
static s32 ramGet64(struct __anon_0x50BE7* pRAM, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32 nAddress; // r4
    // s64* pData; // r1+0x8
}

// Range: 0x8006D2FC -> 0x8006D354
s32 ramGetBuffer(struct __anon_0x50BE7* pRAM, void* ppRAM, u32 nOffset, u32* pnSize) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // void* ppRAM; // r1+0x4
    // u32 nOffset; // r5
    // u32* pnSize; // r1+0xC
}

// Range: 0x8006D2B4 -> 0x8006D2FC
s32 ramWipe(struct __anon_0x50BE7* pRAM) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r3
}

// Range: 0x8006D244 -> 0x8006D2B4
s32 ramSetSize(struct __anon_0x50BE7* pRAM, u32 nSize) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r30
    // u32 nSize; // r31
}

// Range: 0x8006D22C -> 0x8006D244
s32 ramGetSize(struct __anon_0x50BE7* pRAM, u32* pnSize) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r1+0x0
    // u32* pnSize; // r1+0x4
}

// Range: 0x8006CFF4 -> 0x8006D22C
s32 ramEvent(struct __anon_0x50BE7* pRAM, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x50BE7* pRAM; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
