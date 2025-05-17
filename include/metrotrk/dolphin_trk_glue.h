#ifndef _METROTRK_TRK_GLUE_H
#define _METROTRK_TRK_GLUE_H

#include "dolphin/os/OSInterrupt.h"
#include "dolphin/types.h"
#include "metrotrk/UART.h"
#include "stddef.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    HARDWARE_GDEV = 0,
    HARDWARE_NDEV = 1,
    HARDWARE_BBA = 2
} HardwareType;

typedef int (*DBCommFunc)(void);
typedef void (*DBCommInitFunc)(volatile u8**, __OSInterruptHandler);
typedef int (*DBCommReadFunc)(void*, u32);
typedef int (*DBCommWriteFunc)(const void*, u32);

typedef struct DBCommTable {
    /* 0x00 */ DBCommInitFunc initialize_func;
    /* 0x04 */ DBCommFunc initinterrupts_func;
    /* 0x08 */ DBCommFunc peek_func;
    /* 0x0C */ DBCommReadFunc read_func;
    /* 0x10 */ DBCommWriteFunc write_func;
    /* 0x14 */ DBCommFunc open_func;
    /* 0x18 */ DBCommFunc close_func;
} DBCommTable; // size = 0x1C

int InitMetroTRKCommTable(int);
void TRKUARTInterruptHandler();
UARTError TRK_InitializeIntDrivenUART(u32, u32, void*);
void EnableEXI2Interrupts();
int TRKPollUART();
UARTError TRK_ReadUARTN(void*, u32);
UARTError TRK_WriteUARTN(const void*, u32);
void ReserveEXI2Port(void);
void UnreserveEXI2Port(void);
void TRK_board_display(char*);
void InitializeProgramEndTrap();

#ifdef __cplusplus
}
#endif

#endif
