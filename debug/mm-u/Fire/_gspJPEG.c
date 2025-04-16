/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\_gspJPEG.c
    Producer: MW EABI PPC C-Compiler
    Language: C89
    Code range: 0x8007E430 -> 0x80084268
*/

#include "types.h"

// Range: 0x80083984 -> 0x80084268
static s32 rspCreateJPEGArrays(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
}

// Erased
static s32 rspDestroyJPEGArrays() {}

// Erased
static void rspConvertBufferToRGBA(u8* buf, struct __anon_0x5DB84* rgba) {
    // Parameters
    // u8* buf; // r1+0x4
    // struct __anon_0x5DB84* rgba; // r1+0x8
}

// Range: 0x800837EC -> 0x80083984
static void rspConvertRGBAtoYUV(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8

    // Local variables
    s32 i; // r30
    s32 j; // r1+0x8
    s32 Y; // r20
    s32 U; // r20
    s32 V; // r12
}

// Range: 0x800830FC -> 0x800837EC
static void rspYUVtoDCTBuf(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x0

    // Local variables
    s32 i; // r1+0x0
}

// Range: 0x80082E2C -> 0x800830FC
static void rspDCT(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8

    // Local variables
    s32 c; // r1+0xA4
    s32 i; // r1+0xA0
    s32 j; // r1+0x8
    s32 dd; // r6
    s16 t[8][8]; // r1+0x1C
}

// Range: 0x80082CB0 -> 0x80082E2C
static void rspQuantize(struct __anon_0x5DC82* pRSP, s32 scale) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s32 scale; // r1+0xC

    // Local variables
    s32 c; // r29
    s32 i; // r28
    s32 j; // r27
    s16 q; // r6
    s16 s; // r1+0x8
}

// Erased
static void rspZigzagData(struct __anon_0x5DC82* pRSP, u8** databuf, s32 n, s32* preDc) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // u8** databuf; // r1+0xC
    // s32 n; // r1+0x10
    // s32* preDc; // r1+0x14

    // Local variables
    s16 Ac; // r30
    s32 i; // r6
    s32 z; // r7
}

// Erased
static void rspUndoZigzagData(struct __anon_0x5DC82* pRSP, u8** databuf, s32 n, s32* preDc) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // u8** databuf; // r1+0xC
    // s32 n; // r1+0x10
    // s32* preDc; // r1+0x14

    // Local variables
    s16 Dc; // r12
    s16 Ac; // r12
    s32 i; // r7
    s32 z; // r31
}

// Range: 0x80082B2C -> 0x80082CB0
void rspUndoQuantize(struct __anon_0x5DC82* pRSP, s32 scale) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s32 scale; // r1+0xC

    // Local variables
    s32 c; // r29
    s32 i; // r28
    s32 j; // r27
    s16 q; // r6
    s16 s; // r1+0x8
}

// Range: 0x80082840 -> 0x80082B2C
void rspUndoDCT(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8

    // Local variables
    s32 c; // r1+0xA4
    s32 i; // r1+0xA0
    s32 j; // r5
    s32 dd; // r6
    s16 t[8][8]; // r1+0x1C
}

// Range: 0x800820B8 -> 0x80082840
void rspUndoYUVtoDCTBuf(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8

    // Local variables
    s32 i; // r1+0x8
    s32 j; // r1+0x8
}

// Range: 0x80081F08 -> 0x800820B8
void rspFormatYUV(struct __anon_0x5DC82* pRSP, char* imgBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // char* imgBuf; // r4

    // Local variables
    s32 i; // r10
    s32 j; // r11
}

// Range: 0x800814D0 -> 0x80081F08
static s32 rspParseJPEG_Encode(struct __anon_0x5DC82* pRSP, struct __anon_0x5CDE1* pTask) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r19
    // struct __anon_0x5CDE1* pTask; // r16

    // Local variables
    u8* temp; // r24
    u8* temp2; // r23
    s32 i; // r10
    s32 j; // r11
    s32 x; // r22
    s32 y; // r21
    u8* system_imb; // r1+0x30
    u8* system_cfb; // r1+0x2C
    s32 scale; // r20
}

// Range: 0x80080C84 -> 0x800814D0
static s32 rspParseJPEG_Decode(struct __anon_0x5DC82* pRSP, struct __anon_0x5CDE1* pTask) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r30
    // struct __anon_0x5CDE1* pTask; // r20

    // Local variables
    s32 i; // r3
    s32 y; // r25
    u8* temp; // r31
    u8* temp2; // r26
    u64* system_imb; // r1+0x1C
    s32 size; // r21
    s32 scale; // r22
}

// Range: 0x8008098C -> 0x80080C84
static s32 rspCreateJPEGArraysZ(struct __anon_0x5DC82* pRSP, s32 qYAddress, s32 qCbAddress, s32 qCrAddress) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r24
    // s32 qYAddress; // r4
    // s32 qCbAddress; // r25
    // s32 qCrAddress; // r26
}

// Erased
static s32 rspDestroyJPEGArraysZ() {}

// Range: 0x800806BC -> 0x8008098C
static void rspDCTZ(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8

    // Local variables
    s32 c; // r1+0xA4
    s32 i; // r1+0xA0
    s32 j; // r1+0x8
    s32 dd; // r6
    s16 t[8][8]; // r1+0x1C
}

// Range: 0x80080090 -> 0x800806BC
static void rspQuantizeZ(struct __anon_0x5DC82* pRSP, s16* dataBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s16* dataBuf; // r1+0xC

    // Local variables
    s32 c; // r12
    s32 i; // r1+0x8
}

// Range: 0x8007FB68 -> 0x80080090
void rspZigzagDataZ(struct __anon_0x5DC82* pRSP, s16* dataBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s16* dataBuf; // r4

    // Local variables
    s32 c; // r1+0x8
}

// Range: 0x8007F59C -> 0x8007FB68
void rspUndoQuantizeZ(struct __anon_0x5DC82* pRSP, s16* dataBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s16* dataBuf; // r1+0xC

    // Local variables
    s32 c; // r12
    s32 i; // r1+0x8
}

// Range: 0x8007F174 -> 0x8007F59C
void rspUndoZigzagDataZ(struct __anon_0x5DC82* pRSP, s16* dataBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s16* dataBuf; // r4

    // Local variables
    s32 c; // r1+0x8
}

// Range: 0x8007EEA4 -> 0x8007F174
void rspUndoDCTZ(struct __anon_0x5DC82* pRSP) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8

    // Local variables
    s32 c; // r1+0xA4
    s32 i; // r1+0xA0
    s32 j; // r5
    s32 dd; // r6
    s16 t[8][8]; // r1+0x1C
}

// Range: 0x8007EE10 -> 0x8007EEA4
s32 rspUndoLoadColorBufferZ(s32 r, s32 g, s32 b, s16* imgBuf, s32 index) {
    // Parameters
    // s32 r; // r3
    // s32 g; // r1+0x8
    // s32 b; // r4
    // s16* imgBuf; // r1+0x10
    // s32 index; // r1+0x14
}

// Range: 0x8007EA08 -> 0x8007EE10
s32 rspUndoRecon420Z(struct __anon_0x5DC82* pRSP, s16* imgBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r30
    // s16* imgBuf; // r29

    // Local variables
    s32 i; // r1+0x8
    s32 j; // r24
    s32 r; // r1+0x8
    s32 g; // r1+0x8
    s32 b; // r1+0x8
    s32 y; // r7
    s32 u; // r5
    s32 v; // r1+0x8
}

// Erased
static s32 rspLoadColorBufferZ(s32* r, s32* g, s32* b, s16* imgBuf, s32 index) {
    // Parameters
    // s32* r; // r1+0x4
    // s32* g; // r1+0x8
    // s32* b; // r1+0xC
    // s16* imgBuf; // r1+0x10
    // s32 index; // r1+0x14
}

// Range: 0x8007E628 -> 0x8007EA08
s32 rspRecon420Z(struct __anon_0x5DC82* pRSP, s16* imgBuf) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r1+0x8
    // s16* imgBuf; // r1+0xC

    // Local variables
    s32 i; // r1+0x10
    s32 j; // r26
    s32 r; // r10
    s32 g; // r7
    s32 b; // r11
    s32 y; // r6
    s32 u; // r9
    s32 v; // r1+0x8
}

// Range: 0x8007E52C -> 0x8007E628
static s32 rspParseJPEG_EncodeZ(struct __anon_0x5DC82* pRSP, struct __anon_0x5CDE1* pTask) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r28
    // struct __anon_0x5CDE1* pTask; // r4

    // Local variables
    s32 y; // r31
    s16* temp; // r1+0x8
    s16* temp2; // r30
    u64* system_imb; // r1+0x20
    u32* infoStruct; // r1+0x1C
    s32 size; // r29
}

// Range: 0x8007E430 -> 0x8007E52C
static s32 rspParseJPEG_DecodeZ(struct __anon_0x5DC82* pRSP, struct __anon_0x5CDE1* pTask) {
    // Parameters
    // struct __anon_0x5DC82* pRSP; // r28
    // struct __anon_0x5CDE1* pTask; // r4

    // Local variables
    s32 y; // r31
    s16* temp; // r1+0x8
    s16* temp2; // r30
    u64* system_imb; // r1+0x20
    u32* infoStruct; // r1+0x1C
    s32 size; // r29
}
