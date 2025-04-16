/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\_cpuDecodePPC2.c
    Producer: MW EABI PPC C-Compiler
    Language: C89
    Code range: 0x800685C4 -> 0x8006C0C4
*/

#include "types.h"

// Range: 0x8006BEDC -> 0x8006C0C4
static s32 cpuCompile_DSLLV(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r11
    s32 nSize; // r1+0x8
}

// Range: 0x8006BCF4 -> 0x8006BEDC
static s32 cpuCompile_DSRLV(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r11
    s32 nSize; // r1+0x8
}

// Range: 0x8006BAF0 -> 0x8006BCF4
static s32 cpuCompile_DSRAV(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r1+0x8
    s32 nSize; // r1+0x8
}

// Range: 0x8006B5EC -> 0x8006BAF0
static s32 cpuCompile_DMULT(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r27

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x8006B2D8 -> 0x8006B5EC
static s32 cpuCompile_DMULTU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r30

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x8006AD1C -> 0x8006B2D8
static s32 cpuCompile_DDIV(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r16

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r23
    s32 nSize; // r1+0x8
}

// Range: 0x8006A900 -> 0x8006AD1C
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

// Range: 0x8006A5C0 -> 0x8006A900
static s32 cpuCompile_S_SQRT(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r19
    // s32* addressGCN; // r18

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r29
    s32 nSize; // r1+0x8
}

// Range: 0x8006A18C -> 0x8006A5C0
static s32 cpuCompile_D_SQRT(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r22
    // s32* addressGCN; // r21

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r21
    s32 nSize; // r1+0x8
}

// Range: 0x80069FDC -> 0x8006A18C
static s32 cpuCompile_W_CVT_SD(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r31
    // s32* addressGCN; // r30

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r30
    s32 nSize; // r1+0x8
}

// Range: 0x80069A5C -> 0x80069FDC
static s32 cpuCompile_L_CVT_SD(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x800698A0 -> 0x80069A5C
static s32 cpuCompile_CEIL_W(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x800696E4 -> 0x800698A0
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

// Range: 0x80069578 -> 0x800696E4
static s32 cpuCompile_LB(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Range: 0x8006940C -> 0x80069578
static s32 cpuCompile_LH(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Range: 0x800692B4 -> 0x8006940C
static s32 cpuCompile_LW(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x8006915C -> 0x800692B4
static s32 cpuCompile_LBU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80069004 -> 0x8006915C
static s32 cpuCompile_LHU(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80068EA8 -> 0x80069004
static s32 cpuCompile_SB(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80068D4C -> 0x80068EA8
static s32 cpuCompile_SH(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80068BF0 -> 0x80068D4C
static s32 cpuCompile_SW(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}

// Range: 0x80068A68 -> 0x80068BF0
static s32 cpuCompile_LDC(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x800688E0 -> 0x80068A68
static s32 cpuCompile_SDC(struct _CPU* pCPU, s32* addressGCN) {
    // Parameters
    // struct _CPU* pCPU; // r30
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r5
    s32 nSize; // r1+0x8
}

// Range: 0x80068750 -> 0x800688E0
static s32 cpuCompile_LWL(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r9
    s32 nSize; // r1+0x8
}

// Range: 0x800685C4 -> 0x80068750
static s32 cpuCompile_LWR(s32* addressGCN) {
    // Parameters
    // s32* addressGCN; // r31

    // Local variables
    s32* compile; // r1+0x10
    s32 count; // r7
    s32 nSize; // r1+0x8
}
