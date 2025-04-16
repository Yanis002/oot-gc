/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Core\xlFile.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x800079C8 -> 0x80008080
*/

#include "types.h"

// size = 0x4, address = 0x8012F368
static char* gacValidNumber;

// size = 0x4, address = 0x8012F36C
static char* gacValidSymbol;

// size = 0x4, address = 0x8012F370
static char* gacValidLabel;

typedef enum __anon_0x50D7 {
    XLFT_NONE = -1,
    XLFT_TEXT = 0,
    XLFT_BINARY = 1,
} __anon_0x50D7;

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x518E; // size = 0x20

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
    /* 0x28 */ void (* callback)(s32, struct DVDCommandBlock*);
    /* 0x2C */ void* userData;
} __anon_0x52FE; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (* callback)(s32, struct DVDFileInfo*);
} __anon_0x5524; // size = 0x3C

typedef struct tXL_FILE {
    /* 0x00 */ void* pData;
    /* 0x04 */ char* acLine;
    /* 0x08 */ void* pBuffer;
    /* 0x0C */ s32 nAttributes;
    /* 0x10 */ s32 nSize;
    /* 0x14 */ s32 nOffset;
    /* 0x18 */ enum __anon_0x50D7 eType;
    /* 0x1C */ s32 iLine;
    /* 0x20 */ s32 nLineNumber;
    /* 0x24 */ struct DVDFileInfo info;
} __anon_0x55DC; // size = 0x60

typedef struct __anon_0x5768 {
    /* 0x0 */ s32 nPosition;
    /* 0x4 */ s32 nLineNumber;
} __anon_0x5768; // size = 0x8

typedef enum __anon_0x58CC {
    XLFTT_NONE = -1,
    XLFTT_LABEL = 0,
    XLFTT_NUMBER = 1,
    XLFTT_STRING = 2,
    XLFTT_SYMBOL = 3,
    XLFTT_LAST_ = 4,
} __anon_0x58CC;

// Range: 0x80008008 -> 0x80008080
s32 xlFileGetSize(s32* pnSize, char* szFileName) {
    // Parameters
    // s32* pnSize; // r31
    // char* szFileName; // r4

    // Local variables
    struct tXL_FILE* pFile; // r1+0x10
}

// Erased
static s32 xlFileLoad(char* szFileName, void* ppBuffer) {
    // Parameters
    // char* szFileName; // r30
    // void* ppBuffer; // r31

    // Local variables
    s32 nSize; // r1+0x18
    struct tXL_FILE* pFile; // r1+0x14
}

// Erased
static s32 xlFileGetFlip(struct tXL_FILE* pFile, void* pTarget, s32 nSizeBytes) {
    // Parameters
    // struct tXL_FILE* pFile; // r30
    // void* pTarget; // r31
    // s32 nSizeBytes; // r1+0x10
}

// Range: 0x80007ED8 -> 0x80008008
s32 xlFileGetLine(struct tXL_FILE* pFile, char* acLine, s32 nSizeLine) {
    // Parameters
    // struct tXL_FILE* pFile; // r28
    // char* acLine; // r29
    // s32 nSizeLine; // r30

    // Local variables
    s32 iCharacter; // r31
    char nCharacter; // r1+0x14
}

// Erased
static s32 xlFilePutFlip(struct tXL_FILE* pFile, void* pTarget, s32 nSizeBytes) {
    // Parameters
    // struct tXL_FILE* pFile; // r30
    // void* pTarget; // r31
    // s32 nSizeBytes; // r1+0x10
}

// Erased
static s32 xlFilePutLine() {}

// Erased
static s32 xlTokenGetFloat(char* acToken, f32* prValue) {
    // Parameters
    // char* acToken; // r1+0x8
    // f32* prValue; // r1+0xC

    // Local variables
    s32 iToken; // r5
    f32 rValue; // f3
    f32 rFraction; // f4
    s32 bFraction; // r7
    s32 bNegate; // r8
}

// Range: 0x80007DB4 -> 0x80007ED8
s32 xlTokenGetInteger(char* acToken, s32* pnValue) {
    // Parameters
    // char* acToken; // r1+0x0
    // s32* pnValue; // r1+0x4

    // Local variables
    s32 nValue; // r6
    s32 nBase; // r7
    s32 iToken; // r8
    s32 bNegate; // r9
}

// Range: 0x80007DA4 -> 0x80007DB4
s32 xlFileSkipLine(struct tXL_FILE* pFile) {
    // Parameters
    // struct tXL_FILE* pFile; // r1+0x0
}

// Range: 0x80007AE4 -> 0x80007DA4
s32 xlFileGetToken(struct tXL_FILE* pFile, enum __anon_0x58CC* peType, char* acToken, s32 nSizeToken) {
    // Parameters
    // struct tXL_FILE* pFile; // r24
    // enum __anon_0x58CC* peType; // r25
    // char* acToken; // r26
    // s32 nSizeToken; // r27

    // Local variables
    char* acLine; // r31
    s32 iLine; // r30
    s32 iToken; // r29
    enum __anon_0x58CC eType; // r28

    // References
    // -> static char* gacValidSymbol;
    // -> static char* gacValidLabel;
    // -> static char* gacValidNumber;
}

// Range: 0x80007A14 -> 0x80007AE4
s32 xlFileMatchToken(struct tXL_FILE* pFile, enum __anon_0x58CC eType, char* acToken, s32 nSizeToken, char* szText) {
    // Parameters
    // struct tXL_FILE* pFile; // r3
    // enum __anon_0x58CC eType; // r28
    // char* acToken; // r29
    // s32 nSizeToken; // r30
    // char* szText; // r31

    // Local variables
    enum __anon_0x58CC eTypeToken; // r1+0x60
    char acTokenLocal[65]; // r1+0x1C
}

// Range: 0x800079C8 -> 0x80007A14
s32 xlFileGetLineSave(struct tXL_FILE* pFile, struct __anon_0x5768* pSave) {
    // Parameters
    // struct tXL_FILE* pFile; // r3
    // struct __anon_0x5768* pSave; // r4
}

// Erased
static s32 xlFileSetLineSave(struct tXL_FILE* pFile, struct __anon_0x5768* pSave) {
    // Parameters
    // struct tXL_FILE* pFile; // r3
    // struct __anon_0x5768* pSave; // r4
}
