/*
    Compile unit: C:\HOMEBOY\STEPHEN\Japanese Ocarina\Fire\soundGCN.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8001C498 -> 0x8001D34C
*/

#include "dolphin/types.h"

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ int nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ int (*pfEvent)(void*, int, void*);
} __anon_0x20667; // size = 0x10

// size = 0x10, address = 0x800EA7D8
struct _XL_OBJECTTYPE gClassSound;

// size = 0x404, address = 0x80108180
s32 gVolumeCurve[257];

typedef enum __anon_0x2084C {
    SPM_NONE = -1,
    SPM_PLAY = 0,
    SPM_RAMPQUEUED = 1,
    SPM_RAMPPLAYED = 2,
} __anon_0x2084C;

typedef struct __anon_0x208BA {
    /* 0x00 */ void* pSrcData;
    /* 0x04 */ int nFrequency;
    /* 0x08 */ int nDacrate;
    /* 0x0C */ int nSndLen;
    /* 0x10 */ void* apBuffer[16];
    /* 0x50 */ int anSizeBuffer[16];
    /* 0x90 */ int nCountBeep;
    /* 0x94 */ int anSizeBeep[3];
    /* 0xA0 */ void* apDataBeep[3];
    /* 0xAC */ int iBufferPlay;
    /* 0xB0 */ int iBufferMake;
    /* 0xB4 */ enum __anon_0x2084C eMode;
    /* 0xB8 */ void* pBufferZero;
    /* 0xBC */ void* pBufferHold;
    /* 0xC0 */ void* pBufferRampUp;
    /* 0xC4 */ void* pBufferRampDown;
    /* 0xC8 */ int nSizePlay;
    /* 0xCC */ int nSizeZero;
    /* 0xD0 */ int nSizeHold;
    /* 0xD4 */ int nSizeRamp;
} __anon_0x208BA; // size = 0xD8

typedef enum __anon_0x20C8D {
    SOUND_BEEP_ACCEPT = 0,
    SOUND_BEEP_DECLINE = 1,
    SOUND_BEEP_SELECT = 2,
    SOUND_BEEP_COUNT = 3,
} __anon_0x20C8D;

typedef enum __anon_0x20E13 {
    XLFT_NONE = -1,
    XLFT_TEXT = 0,
    XLFT_BINARY = 1,
} __anon_0x20E13;

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x20ECC; // size = 0x20

typedef struct DVDCommandBlock {
    /* 0x00 */ struct DVDCommandBlock* next;
    /* 0x04 */ struct DVDCommandBlock* prev;
    /* 0x08 */ u32 command;
    /* 0x0C */ s32 state;
    /* 0x10 */ u32 offset;
    /* 0x14 */ u32 length;
    /* 0x18 */ void* addr;
    /* 0x1C */ u32 currTransferSize;
    /* 0x20 */ u32 transferredSize;
    /* 0x24 */ struct DVDDiskID* id;
    /* 0x28 */ void (*callback)(s32, struct DVDCommandBlock*);
    /* 0x2C */ void* userData;
} __anon_0x2103C; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (*callback)(s32, struct DVDFileInfo*);
} __anon_0x21262; // size = 0x3C

typedef struct tXL_FILE {
    /* 0x00 */ int iBuffer;
    /* 0x04 */ void* pData;
    /* 0x08 */ void* pBuffer;
    /* 0x0C */ int nAttributes;
    /* 0x10 */ int nSize;
    /* 0x14 */ int nOffset;
    /* 0x18 */ enum __anon_0x20E13 eType;
    /* 0x1C */ struct DVDFileInfo info;
} __anon_0x2131A; // size = 0x58

typedef enum __anon_0x2152F {
    SM_NONE = -1,
    SM_RUNNING = 0,
    SM_STOPPED = 1,
} __anon_0x2152F;

typedef struct __anon_0x21596 {
    /* 0x0 */ int nSize;
    /* 0x4 */ int nOffsetRAM;
    /* 0x8 */ int nOffsetROM;
    /* 0xC */ int (*pCallback)();
} __anon_0x21596; // size = 0x10

typedef enum __anon_0x21647 {
    SRT_NONE = -1,
    SRT_MARIO = 0,
    SRT_WAVERACE = 1,
    SRT_MARIOKART = 2,
    SRT_STARFOX = 3,
    SRT_ZELDA1 = 4,
    SRT_ZELDA2 = 5,
    SRT_1080 = 6,
    SRT_PANEL = 7,
    SRT_MARIOPARTY1 = 8,
    SRT_MARIOPARTY2 = 9,
    SRT_MARIOPARTY3 = 10,
    SRT_DRMARIO = 11,
    SRT_UNKNOWN = 12,
} __anon_0x21647;

typedef enum __anon_0x21778 {
    SOT_NONE = -1,
    SOT_CPU = 0,
    SOT_PIF = 1,
    SOT_RAM = 2,
    SOT_ROM = 3,
    SOT_RSP = 4,
    SOT_RDP = 5,
    SOT_MIPS = 6,
    SOT_DISK = 7,
    SOT_FLASH = 8,
    SOT_SRAM = 9,
    SOT_AUDIO = 10,
    SOT_VIDEO = 11,
    SOT_SERIAL = 12,
    SOT_LIBRARY = 13,
    SOT_PERIPHERAL = 14,
    SOT_RDB = 15,
    SOT_COUNT = 16,
} __anon_0x21778;

typedef struct __anon_0x218B8 {
    /* 0x00 */ void* pFrame;
    /* 0x04 */ void* pSound;
    /* 0x08 */ int bException;
    /* 0x0C */ enum __anon_0x2152F eMode;
    /* 0x10 */ struct __anon_0x21596 romCopy;
    /* 0x20 */ enum __anon_0x21647 eTypeROM;
    /* 0x24 */ void* apObject[16];
    /* 0x68 */ u64 nAddressBreak;
    /* 0x70 */ enum __anon_0x21778 storageDevice;
    /* 0x74 */ u8 anException[16];
    /* 0x84 */ int bJapaneseVersion;
} __anon_0x218B8; // size = 0x88

// size = 0x4, address = 0x80135600
struct __anon_0x218B8* gpSystem;

typedef enum __anon_0x221A3 {
    SR_NONE = -1,
    SR_DECREASE = 0,
    SR_INCREASE = 1,
} __anon_0x221A3;

// Range: 0x8001D250 -> 0x8001D34C
int soundWipeBuffers(struct __anon_0x208BA* pSound) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r31

    // Local variables
    int iBuffer; // r30
}

// Range: 0x8001CD8C -> 0x8001D250
static int soundMakeRamp(struct __anon_0x208BA* pSound, int iBuffer, enum __anon_0x221A3 eRamp) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r1+0x8
    // int iBuffer; // r1+0xC
    // enum __anon_0x221A3 eRamp; // r1+0x10

    // Local variables
    int bFlag; // r8
    int iData; // r1+0x8
    s16* anData; // r9
    s16 nData0; // r10
    s16 nData1; // r11
    s16 nGoal0; // r12
    s16 nGoal1; // r31
    s16 nStep0; // r5
    s16 nStep1; // r4
    s16 nLast0; // r27
    s16 nLast1; // r27
}

// Erased
static int soundMakeZero(struct __anon_0x208BA* pSound) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r3

    // Local variables
    int iData; // r7
}

// Erased
static int soundMakeHold() {}

// Range: 0x8001CCCC -> 0x8001CD8C
static int soundPlayBuffer(struct __anon_0x208BA* pSound) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r1+0x8

    // Local variables
    void* pData; // r6
    int iBuffer; // r4
    int nSize; // r4
}

// Range: 0x8001CCA4 -> 0x8001CCCC
static void soundCallbackDMA() {
    // References
    // -> struct __anon_0x218B8* gpSystem;
}

// Range: 0x8001CAB8 -> 0x8001CCA4
static int soundMakeBuffer(struct __anon_0x208BA* pSound) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r29

    // Local variables
    u32 nSamples; // r5
    s16* curBufP; // r3
    u32 sampleStep; // r1+0x8
    u32 sample; // r6
    int j; // r7
    int nSize; // r4
    int samp; // r11
    int iBuffer; // r31
    s32 vol; // r8
    int bFlag; // r28
    int bPlay; // r30
    s32 volAdjust; // r11

    // References
    // -> s32 gVolumeCurve[257];
}

// Range: 0x8001CA80 -> 0x8001CAB8
int soundSetLength(struct __anon_0x208BA* pSound, int nSize) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r3
    // int nSize; // r1+0xC
}

// Range: 0x8001CA60 -> 0x8001CA80
int soundSetDACRate(struct __anon_0x208BA* pSound, int nDacRate) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r1+0x0
    // int nDacRate; // r1+0x4
}

// Erased
static int soundSetBitRate() {}

// Range: 0x8001CA54 -> 0x8001CA60
int soundSetAddress(struct __anon_0x208BA* pSound, void* pData) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r1+0x0
    // void* pData; // r1+0x4
}

// Range: 0x8001CA20 -> 0x8001CA54
int soundGetDMABuffer(unsigned int* pnSize) {
    // Parameters
    // unsigned int* pnSize; // r31
}

// Range: 0x8001C880 -> 0x8001CA20
int soundSetBufferSize(struct __anon_0x208BA* pSound, int nSize) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r31
    // int nSize; // r29

    // Local variables
    int iBuffer; // r29
}

// Erased
static void InitVolumeCurve() {
    // Local variables
    s32 i; // r29

    // References
    // -> s32 gVolumeCurve[257];
}

// Range: 0x8001C824 -> 0x8001C880
static void soundCallbackBeep() {
    // Local variables
    struct __anon_0x208BA* pSound; // r31

    // References
    // -> struct __anon_0x218B8* gpSystem;
}

// Range: 0x8001C70C -> 0x8001C824
int soundLoadBeep(struct __anon_0x208BA* pSound, enum __anon_0x20C8D iBeep, char* szNameFile) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r28
    // enum __anon_0x20C8D iBeep; // r1+0xC
    // char* szNameFile; // r5

    // Local variables
    struct tXL_FILE* pFile; // r1+0x14
}

// Range: 0x8001C690 -> 0x8001C70C
int soundPlayBeep(struct __anon_0x208BA* pSound, enum __anon_0x20C8D iBeep) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r29
    // enum __anon_0x20C8D iBeep; // r1+0xC
}

// Erased
static int soundFreeBeep(struct __anon_0x208BA* pSound, enum __anon_0x20C8D iBeep) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r5
    // enum __anon_0x20C8D iBeep; // r1+0xC
}

// Range: 0x8001C498 -> 0x8001C690
int soundEvent(struct __anon_0x208BA* pSound, int nEvent) {
    // Parameters
    // struct __anon_0x208BA* pSound; // r3
    // int nEvent; // r1+0xC

    // Local variables
    int iBuffer; // r1+0x8

    // References
    // -> s32 gVolumeCurve[257];
}
