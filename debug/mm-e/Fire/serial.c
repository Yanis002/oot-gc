/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\serial.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80091C44 -> 0x80091F18
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x80421; // size = 0x10

// size = 0x10, address = 0x800E6D40
struct _XL_OBJECTTYPE gClassSerial;

typedef struct __anon_0x80515 {
    /* 0x0 */ void* pHost;
    /* 0x4 */ s32 nAddress;
} __anon_0x80515; // size = 0x8

// Range: 0x80091F10 -> 0x80091F18
s32 serialPut8() {}

// Range: 0x80091F08 -> 0x80091F10
s32 serialPut16() {}

// Range: 0x80091DC8 -> 0x80091F08
s32 serialPut32(struct __anon_0x80515* pSerial, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x80515* pSerial; // r31
    // u32 nAddress; // r1+0xC
    // s32* pData; // r1+0x10

    // Local variables
    s32 nSize; // r1+0x18
    void* aData; // r1+0x14
}

// Range: 0x80091DC0 -> 0x80091DC8
s32 serialPut64() {}

// Range: 0x80091DB8 -> 0x80091DC0
s32 serialGet8() {}

// Range: 0x80091DB0 -> 0x80091DB8
s32 serialGet16() {}

// Range: 0x80091D4C -> 0x80091DB0
s32 serialGet32(struct __anon_0x80515* pSerial, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x80515* pSerial; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x80091D44 -> 0x80091D4C
s32 serialGet64() {}

// Range: 0x80091C44 -> 0x80091D44
s32 serialEvent(struct __anon_0x80515* pSerial, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x80515* pSerial; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
