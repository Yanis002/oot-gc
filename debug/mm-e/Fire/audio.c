/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\audio.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800912B4 -> 0x800916AC
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7D154; // size = 0x10

// size = 0x10, address = 0x800E6A90
struct _XL_OBJECTTYPE gClassAudio;

typedef struct __anon_0x7D247 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 bEnable;
    /* 0x08 */ void* pHost;
    /* 0x0C */ s32 nControl;
    /* 0x10 */ s32 nAddress;
    /* 0x14 */ s32 nRateBit;
    /* 0x18 */ s32 nRateDAC;
    /* 0x1C */ s32 nStatus;
} __anon_0x7D247; // size = 0x20

// Range: 0x800916A4 -> 0x800916AC
s32 audioPut8() {}

// Range: 0x8009169C -> 0x800916A4
s32 audioPut16() {}

// Range: 0x80091554 -> 0x8009169C
s32 audioPut32(struct __anon_0x7D247* pAudio, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x7D247* pAudio; // r31
    // u32 nAddress; // r1+0xC
    // s32* pData; // r1+0x10

    // Local variables
    void* pBuffer; // r1+0x14
}

// Range: 0x8009154C -> 0x80091554
s32 audioPut64() {}

// Range: 0x80091544 -> 0x8009154C
s32 audioGet8() {}

// Range: 0x8009153C -> 0x80091544
s32 audioGet16() {}

// Range: 0x80091434 -> 0x8009153C
s32 audioGet32(struct __anon_0x7D247* pAudio, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x7D247* pAudio; // r30
    // u32 nAddress; // r1+0xC
    // s32* pData; // r31
}

// Range: 0x8009142C -> 0x80091434
s32 audioGet64() {}

// Range: 0x800913D4 -> 0x8009142C
s32 audioEnable(struct __anon_0x7D247* pAudio, s32 bEnable) {
    // Parameters
    // struct __anon_0x7D247* pAudio; // r3
    // s32 bEnable; // r1+0xC
}

// Range: 0x800912B4 -> 0x800913D4
s32 audioEvent(struct __anon_0x7D247* pAudio, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7D247* pAudio; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
