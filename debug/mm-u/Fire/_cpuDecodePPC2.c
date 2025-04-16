/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\_cpuDecodePPC2.c
    Producer: MW EABI PPC C-Compiler
    Language: C89
    Code range: 0x80067B44 -> 0x8006B644
*/

#include "types.h"

// Range: 0x8006B45C -> 0x8006B644
static s32 cpuCompile_DSLLV(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r11
    s32 nSize; // r1+0x8
}

// Range: 0x8006B274 -> 0x8006B45C
static s32 cpuCompile_DSRLV(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r11
    s32 nSize; // r1+0x8
}

// Range: 0x8006B070 -> 0x8006B274
static s32 cpuCompile_DSRAV(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r1+0x8
    s32 nSize; // r1+0x8
}

// Range: 0x8006AB6C -> 0x8006B070
static s32 cpuCompile_DMULT(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r27

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x8006A858 -> 0x8006AB6C
static s32 cpuCompile_DMULTU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r30

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x8006A29C -> 0x8006A858
static s32 cpuCompile_DDIV(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r16

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r23
    s32 nSize; // r1+0x8
}

// Range: 0x80069E80 -> 0x8006A29C
static s32 cpuCompile_DDIVU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r24

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Erased
static s32 cpuCompile_DADD(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Erased
static s32 cpuCompile_DADDU(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Erased
static s32 cpuCompile_DSUB(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Erased
static s32 cpuCompile_DSUBU(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80069B40 -> 0x80069E80
static s32 cpuCompile_S_SQRT(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r19
    // s32* addressGCN; // r18

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r29
    s32 nSize; // r1+0x8
}

// Range: 0x8006970C -> 0x80069B40
static s32 cpuCompile_D_SQRT(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r22
    // s32* addressGCN; // r21

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r21
    s32 nSize; // r1+0x8
}

// Range: 0x8006955C -> 0x8006970C
static s32 cpuCompile_W_CVT_SD(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r30

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r30
    s32 nSize; // r1+0x8
}

// Range: 0x80068FDC -> 0x8006955C
static s32 cpuCompile_L_CVT_SD(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80068E20 -> 0x80068FDC
static s32 cpuCompile_CEIL_W(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80068C64 -> 0x80068E20
static s32 cpuCompile_FLOOR_W(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Erased
static s32 cpuCompile_ROUND_W(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Erased
static s32 cpuCompile_TRUNC_W(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80068AF8 -> 0x80068C64
static s32 cpuCompile_LB(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Range: 0x8006898C -> 0x80068AF8
static s32 cpuCompile_LH(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Range: 0x80068834 -> 0x8006898C
static s32 cpuCompile_LW(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x800686DC -> 0x80068834
static s32 cpuCompile_LBU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80068584 -> 0x800686DC
static s32 cpuCompile_LHU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80068428 -> 0x80068584
static s32 cpuCompile_SB(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x800682CC -> 0x80068428
static s32 cpuCompile_SH(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80068170 -> 0x800682CC
static s32 cpuCompile_SW(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80067FE8 -> 0x80068170
static s32 cpuCompile_LDC(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80067E60 -> 0x80067FE8
static s32 cpuCompile_SDC(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80067CD0 -> 0x80067E60
static s32 cpuCompile_LWL(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Range: 0x80067B44 -> 0x80067CD0
static s32 cpuCompile_LWR(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}
