#include "__ppc_eabi_linker.h"
#include "dolphin/db/DBInterface.h"
#include "dolphin/os.h"
#include "macros.h"
#include "string.h"

#include "dolphin/private/__os.h"

extern void InitMetroTRK();
extern int main(int argc, char* argv[]);
extern void exit(int);

u16 Pad3Button AT_ADDRESS(PAD3_BUTTON_ADDR);

#if IS_CE
static u8 Debug_BBA = 0;
#endif

INIT void __check_pad3(void) {
    if ((Pad3Button & 0x0EEF) == 0x0EEF) {
        OSResetSystem(OS_RESET_RESTART, 0, false);
    }
    return;
}

#if IS_CE
INIT static void __set_debug_bba(void) { Debug_BBA = 1; }
INIT static u8 __get_debug_bba(void) { return Debug_BBA; }
#endif

WEAK ASM void __start(void) {
#ifdef __MWERKS__ // clang-format off
    nofralloc
    bl __init_registers
    bl __init_hardware
    li r0, -1
    stwu r1, -8(r1)
    stw r0, 4(r1)
    stw r0, 0(r1)
    bl __init_data
    li r0, 0
    lis r6, EXCEPTIONMASK_ADDR@ha
    addi r6, r6, EXCEPTIONMASK_ADDR@l
    stw r0, 0(r6)
    lis r6, OS_BI2_DEBUG_ADDRESS@ha
    addi r6, r6, OS_BI2_DEBUG_ADDRESS@l
    lwz r6, 0(r6)

_check_TRK:
    cmplwi r6, 0
    beq _load_lomem_debug_flag
    lwz r7, OS_BI2_DEBUGFLAG_OFFSET(r6)
    b _check_debug_flag

_load_lomem_debug_flag:
    lis r5, ARENAHI_ADDR@ha
    addi r5, r5, ARENAHI_ADDR@l
    lwz r5, 0(r5)
    cmplwi r5, 0
    beq _goto_main
    lis r7, DEBUGFLAG_ADDR@ha
    addi r7, r7, DEBUGFLAG_ADDR@l
    lwz r7, 0(r7)

#if IS_MQ
_check_debug_flag:
    li r5, 0
    cmplwi r7, 2
    beq _goto_inittrk
    cmplwi r7, 3
    bne _goto_main
    li r5, 1
#else
_check_debug_flag:
    li r5, 0
    cmplwi r7, 2
    beq _goto_inittrk
    cmplwi r7, 3
    li r5, 1
    beq _goto_inittrk
    cmplwi r7, 4
    bne _goto_main
    li r5, 2
    bl __set_debug_bba
    b _goto_main
#endif

_goto_inittrk:
    lis r6, InitMetroTRK@ha
    addi r6, r6, InitMetroTRK@l
    mtlr r6
    blrl

_goto_main:
    lis r6, OS_BI2_DEBUG_ADDRESS@ha
    addi r6, r6, OS_BI2_DEBUG_ADDRESS@l
    lwz r5, 0(r6)
    cmplwi r5, 0
    beq+ _no_args
    lwz r6, 8(r5)
    cmplwi r6, 0
    beq+ _no_args
    add r6, r5, r6
    lwz r14, 0(r6)
    cmplwi r14, 0
    beq _no_args
    addi r15, r6, 4
    mtctr r14

_loop:
    addi r6, r6, 4
    lwz r7, 0(r6)
    add r7, r7, r5
    stw r7, 0(r6)
    bdnz _loop
    lis r5, ARENAHI_ADDR@ha
    addi r5, r5, ARENAHI_ADDR@l
    rlwinm r7, r15, 0, 0, 0x1A
    stw r7, 0(r5)
    b _end_of_parseargs

_no_args:
    li r14, 0
    li r15, 0

_end_of_parseargs:
    bl DBInit
    bl OSInit
    lis r4, OS_DVD_DEVICECODE@ha
    addi r4, r4, OS_DVD_DEVICECODE@l
    lhz r3, 0(r4)
    andi. r5, r3, 0x8000
    beq _check_pad3
    andi. r3, r3, 0x7FFF
    cmplwi r3, 1
#if IS_MQ
    bne _goto_skip_init_bba
#else
    bne _skip_crc
#endif

_check_pad3:
    bl __check_pad3

#if IS_CE
_skip_crc:
    bl __get_debug_bba
    cmplwi r3, 1
    bne _goto_skip_init_bba
    bl InitMetroTRK_BBA
#endif

_goto_skip_init_bba:
    bl __init_user
    mr r3, r14
    mr r4, r15
    bl main
    b exit
#endif // clang-format on
}

ASM void __init_registers(void) {
#ifdef __MWERKS__ // clang-format off
    nofralloc

#if IS_CE
    li r0, 0
    li r3, 0
    li r4, 0
    li r5, 0
    li r6, 0
    li r7, 0
    li r8, 0
    li r9, 0
    li r10, 0
    li r11, 0
    li r12, 0
    li r14, 0
    li r15, 0
    li r16, 0
    li r17, 0
    li r18, 0
    li r19, 0
    li r20, 0
    li r21, 0
    li r22, 0
    li r23, 0
    li r24, 0
    li r25, 0
    li r26, 0
    li r27, 0
    li r28, 0
    li r29, 0
    li r30, 0
    li r31, 0
#endif

    lis r1,  _stack_addr@h
    ori r1, r1,  _stack_addr@l
    lis r2, _SDA2_BASE_@h
    ori r2, r2, _SDA2_BASE_@l
    lis r13, _SDA_BASE_@h
    ori r13, r13, _SDA_BASE_@l
    blr
#endif // clang-format on
}

void __copy_rom_section(void* dst, const void* src, unsigned long size) {
    if (size && (dst != src)) {
        memcpy(dst, src, size);
        __flush_cache(dst, size);
    }
}

void __init_bss_section(void* dst, unsigned long size) {
    if (size) {
        memset(dst, 0, size);
    }
}

void __init_data(void) {
    __rom_copy_info* dci;
    __bss_init_info* bii;

    dci = _rom_copy_info;
    while (true) {
        if (dci->size == 0) {
            break;
        }
        __copy_rom_section(dci->addr, dci->rom, dci->size);
        dci++;
    }

    bii = _bss_init_info;
    while (true) {
        if (bii->size == 0) {
            break;
        }
        __init_bss_section(bii->addr, bii->size);
        bii++;
    }
}
