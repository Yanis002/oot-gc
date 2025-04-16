/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\pif.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8006B644 -> 0x8006C574
*/

#include "types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x4CC32; // size = 0x10

// size = 0x10, address = 0x800F5CF8
struct _XL_OBJECTTYPE gClassPIF;

typedef struct __anon_0x4CDAC {
    /* 0x00 */ void* pROM;
    /* 0x04 */ void* pRAM;
    /* 0x08 */ void* pHost;
    /* 0x0C */ u16 controllerType[5];
    /* 0x16 */ char controllerStatus[5];
    /* 0x1C */ enum __anon_0x4D836 eControllerType[5];
} __anon_0x4CDAC; // size = 0x30

typedef enum __anon_0x4D836 {
    CT_NONE = 0,
    CT_CONTROLLER = 1,
    CT_CONTROLLER_W_PAK = 2,
    CT_CONTROLLER_W_RPAK = 3,
    CT_MOUSE = 4,
    CT_VOICE = 5,
    CT_4K = 6,
    CT_16K = 7,
    CT_COUNT = 8,
} __anon_0x4D836;

// Erased
static s32 pifIdCheckSum(u16* ptr, u16* csum, u16* icsum) {
    // Parameters
    // u16* ptr; // r4
    // u16* csum; // r1+0x8
    // u16* icsum; // r1+0xC

    // Local variables
    u16 data; // r7
    u32 j; // r1+0x0
}

// Range: 0x8006C450 -> 0x8006C574
s32 pifReadRumble(u16 address, u8* data) {
    // Parameters
    // u16 address; // r1+0x8
    // u8* data; // r1+0xC

    // Local variables
    s32 i; // r1+0x0
}

// Range: 0x8006C3F8 -> 0x8006C450
s32 pifWriteRumble(s32 channel, u16 address, u8* data) {
    // Parameters
    // s32 channel; // r4
    // u16 address; // r1+0x10
    // u8* data; // r1+0x14
}

// Range: 0x8006C280 -> 0x8006C3F8
static u8 pifContDataCrc(u8* data) {
    // Parameters
    // u8* data; // r4

    // Local variables
    u32 temp; // r3
    u32 i; // r5
    u32 j; // r6
}

// Range: 0x8006C170 -> 0x8006C280
s32 pifSetControllerType(struct __anon_0x4CDAC* pPIF, s32 channel, enum __anon_0x4D836 type) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r29
    // s32 channel; // r30
    // enum __anon_0x4D836 type; // r31
}

// Range: 0x8006C158 -> 0x8006C170
s32 pifGetEControllerType(struct __anon_0x4CDAC* pPIF, s32 channel, enum __anon_0x4D836* type) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // s32 channel; // r1+0x4
    // enum __anon_0x4D836* type; // r1+0x8
}

// Range: 0x8006C0F4 -> 0x8006C158
s32 pifSetEEPROMType(struct __anon_0x4CDAC* pPIF, enum __anon_0x4D836 type) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // enum __anon_0x4D836 type; // r1+0x4
}

// Erased
static s32 pifGetControllerInput(s32 channel, u32* controllerInput) {
    // Parameters
    // s32 channel; // r4
    // u32* controllerInput; // r5
}

// Erased
static s32 pifGetControllerType(struct __anon_0x4CDAC* pPIF, s32 channel, u16* type, char* status) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // s32 channel; // r1+0x4
    // u16* type; // r1+0x8
    // char* status; // r1+0xC

    // Local variables
    enum __anon_0x4D836 eType; // r1+0x0
}

// Range: 0x8006C0B0 -> 0x8006C0F4
s32 pifGetEEPROMSize(struct __anon_0x4CDAC* pPIF, u32* size) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32* size; // r1+0x4
}

// Erased
static s32 pifQueryController(struct __anon_0x4CDAC* pPIF, u8* buffer, u8* prx, s32 channel) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u8* buffer; // r1+0x4
    // u8* prx; // r1+0xC
    // s32 channel; // r1+0x10
}

// Erased
static s32 pifReadController(struct __anon_0x4CDAC* pPIF, u8* buffer, u8* prx, s32 channel) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x8
    // u8* buffer; // r4
    // u8* prx; // r1+0x14
    // s32 channel; // r7

    // Local variables
    enum __anon_0x4D836 type; // r1+0x8
}

// Range: 0x8006C08C -> 0x8006C0B0
static s32 pifPut8(struct __anon_0x4CDAC* pPIF, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // char* pData; // r1+0x8
}

// Range: 0x8006C064 -> 0x8006C08C
static s32 pifPut16(struct __anon_0x4CDAC* pPIF, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s16* pData; // r1+0x8
}

// Range: 0x8006C03C -> 0x8006C064
static s32 pifPut32(struct __anon_0x4CDAC* pPIF, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x8006C008 -> 0x8006C03C
static s32 pifPut64(struct __anon_0x4CDAC* pPIF, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s64* pData; // r1+0x8
}

// Range: 0x8006BFD4 -> 0x8006C008
static s32 pifGet8(struct __anon_0x4CDAC* pPIF, u32 nAddress, char* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // char* pData; // r1+0x8
}

// Range: 0x8006BF98 -> 0x8006BFD4
static s32 pifGet16(struct __anon_0x4CDAC* pPIF, u32 nAddress, s16* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s16* pData; // r1+0x8
}

// Range: 0x8006BF5C -> 0x8006BF98
static s32 pifGet32(struct __anon_0x4CDAC* pPIF, u32 nAddress, s32* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s32* pData; // r1+0x8
}

// Range: 0x8006BF08 -> 0x8006BF5C
static s32 pifGet64(struct __anon_0x4CDAC* pPIF, u32 nAddress, s64* pData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r1+0x0
    // u32 nAddress; // r1+0x4
    // s64* pData; // r1+0x8
}

// Range: 0x8006BC64 -> 0x8006BF08
s32 pifExecuteCommand(struct __anon_0x4CDAC* pPIF, u8* buffer, u8* prx, s32 channel) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r30
    // u8* buffer; // r31
    // u8* prx; // r1+0x14
    // s32 channel; // r7
}

// Range: 0x8006BAD4 -> 0x8006BC64
s32 pifProcessInputData(struct __anon_0x4CDAC* pPIF) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r30

    // Local variables
    u8* prx; // r6
    u8* ptx; // r5
    s32 iData; // r29
    s32 channel; // r31
}

// Range: 0x8006B938 -> 0x8006BAD4
s32 pifProcessOutputData(struct __anon_0x4CDAC* pPIF) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r29

    // Local variables
    u8* prx; // r6
    u8* ptx; // r5
    s32 iData; // r31
    s32 channel; // r30
}

// Range: 0x8006B8D8 -> 0x8006B938
s32 pifSetData(struct __anon_0x4CDAC* pPIF, u8* acData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r31
    // u8* acData; // r4
}

// Range: 0x8006B86C -> 0x8006B8D8
s32 pifGetData(struct __anon_0x4CDAC* pPIF, u8* acData) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r30
    // u8* acData; // r31
}

// Range: 0x8006B644 -> 0x8006B86C
s32 pifEvent(struct __anon_0x4CDAC* pPIF, s32 nEvent, void* pArgument) {
    // Parameters
    // struct __anon_0x4CDAC* pPIF; // r30
    // s32 nEvent; // r1+0xC
    // void* pArgument; // r31

    // Local variables
    s32 i; // r31
}
