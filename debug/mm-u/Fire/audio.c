/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\audio.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80091C5C -> 0x80092054
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x7AA50; // size = 0x10

// size = 0x10, address = 0x800F7E18
struct _XL_OBJECTTYPE gClassAudio;

typedef struct __anon_0x7AB43 {
    /* 0x00 */ s32 nSize;
    /* 0x04 */ s32 bEnable;
    /* 0x08 */ void* pHost;
    /* 0x0C */ s32 nControl;
    /* 0x10 */ s32 nAddress;
    /* 0x14 */ s32 nRateBit;
    /* 0x18 */ s32 nRateDAC;
    /* 0x1C */ s32 nStatus;
} __anon_0x7AB43; // size = 0x20

// Range: 0x8009204C -> 0x80092054
s32 audioPut8() {}

// Range: 0x80092044 -> 0x8009204C
s32 audioPut16() {}

// Range: 0x80091EFC -> 0x80092044
s32 audioPut32(struct __anon_0x7AB43* pAudio, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x7AB43* pAudio; // r31
    // u32 nAddress; // r1+0xC
    // s32* pData; // r1+0x10

    // Local variables
    void* pBuffer; // r1+0x14
}

// Range: 0x80091EF4 -> 0x80091EFC
s32 audioPut64() {}

// Range: 0x80091EEC -> 0x80091EF4
s32 audioGet8() {}

// Range: 0x80091EE4 -> 0x80091EEC
s32 audioGet16() {}

// Range: 0x80091DDC -> 0x80091EE4
s32 audioGet32(struct __anon_0x7AB43* pAudio, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x7AB43* pAudio; // r30
    // u32 nAddress; // r1+0xC
    // s32* pData; // r31
}

// Range: 0x80091DD4 -> 0x80091DDC
s32 audioGet64() {}

// Range: 0x80091D7C -> 0x80091DD4
s32 audioEnable(struct __anon_0x7AB43* pAudio, s32 bEnable) {
    // Parameters
    // struct __anon_0x7AB43* pAudio; // r3
    // s32 bEnable; // r1+0xC
}

// Range: 0x80091C5C -> 0x80091D7C
s32 audioEvent(struct __anon_0x7AB43* pAudio, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x7AB43* pAudio; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
