/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\rdb.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800744AC -> 0x80074A94
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x5E856; // size = 0x10

// size = 0x10, address = 0x800E64C8
struct _XL_OBJECTTYPE gClassRdb;

typedef struct __anon_0x5E967 {
    /* 0x000 */ s32 nHackCount;
    /* 0x004 */ char szString[256];
    /* 0x104 */ s32 nIndexString;
    /* 0x108 */ s32 nAddress;
    /* 0x10C */ void* pHost;
} __anon_0x5E967; // size = 0x110

// Range: 0x80074A8C -> 0x80074A94
static s32 rdbPut8() {}

// Range: 0x80074A84 -> 0x80074A8C
static s32 rdbPut16() {}

// Range: 0x80074608 -> 0x80074A84
static s32 rdbPut32(struct __anon_0x5E967* pRDB, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x5E967* pRDB; // r3
    // u32 nAddress; // r1+0xC
    // s32* pData; // r1+0x10

    // Local variables
    s32 nLength; // r7
    s32 iCounter; // r5
}

// Range: 0x80074600 -> 0x80074608
static s32 rdbPut64() {}

// Range: 0x800745F8 -> 0x80074600
static s32 rdbGet8() {}

// Range: 0x800745F0 -> 0x800745F8
static s32 rdbGet16() {}

// Range: 0x800745BC -> 0x800745F0
static s32 rdbGet32(u32 nAddress) {
    // Parameters
    // u32 nAddress; // r1+0x4
}

// Range: 0x800745B4 -> 0x800745BC
static s32 rdbGet64() {}

// Range: 0x800744AC -> 0x800745B4
s32 rdbEvent(struct __anon_0x5E967* pRDB, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x5E967* pRDB; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31
}
