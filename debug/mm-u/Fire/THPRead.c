/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\THPRead.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80012278 -> 0x80013860
*/

#include "types.h"

// size = 0x4, address = 0x80141120
static s32 ReadThreadCreated;

typedef struct OSThreadQueue {
    /* 0x0 */ struct OSThread* head;
    /* 0x4 */ struct OSThread* tail;
} __anon_0x16AD7; // size = 0x8

typedef struct OSMessageQueue {
    /* 0x00 */ struct OSThreadQueue queueSend;
    /* 0x08 */ struct OSThreadQueue queueReceive;
    /* 0x10 */ void* msgArray;
    /* 0x14 */ s32 msgCount;
    /* 0x18 */ s32 firstIndex;
    /* 0x1C */ s32 usedCount;
} __anon_0x16B49; // size = 0x20

// size = 0x20, address = 0x80105360
static struct OSMessageQueue FreeReadBufferQueue;

// size = 0x20, address = 0x80105380
static struct OSMessageQueue ReadedBufferQueue;

// size = 0x20, address = 0x801053A0
static struct OSMessageQueue ReadedBufferQueue2;

// size = 0x28, address = 0x801053C0
static void* FreeReadBufferMessage[10];

// size = 0x28, address = 0x801053E8
static void* ReadedBufferMessage[10];

// size = 0x28, address = 0x80105410
static void* ReadedBufferMessage2[10];

typedef struct OSContext {
    /* 0x000 */ u32 gpr[32];
    /* 0x080 */ u32 cr;
    /* 0x084 */ u32 lr;
    /* 0x088 */ u32 ctr;
    /* 0x08C */ u32 xer;
    /* 0x090 */ f64 fpr[32];
    /* 0x190 */ u32 fpscr_pad;
    /* 0x194 */ u32 fpscr;
    /* 0x198 */ u32 srr0;
    /* 0x19C */ u32 srr1;
    /* 0x1A0 */ u16 mode;
    /* 0x1A2 */ u16 state;
    /* 0x1A4 */ u32 gqr[8];
    /* 0x1C4 */ u32 psf_pad;
    /* 0x1C8 */ f64 psf[32];
} __anon_0x16E60; // size = 0x2C8

typedef struct OSThreadLink {
    /* 0x0 */ struct OSThread* next;
    /* 0x4 */ struct OSThread* prev;
} __anon_0x17079; // size = 0x8

typedef struct OSMutexLink {
    /* 0x0 */ struct OSMutex* next;
    /* 0x4 */ struct OSMutex* prev;
} __anon_0x170EA; // size = 0x8

typedef struct OSMutex {
    /* 0x00 */ struct OSThreadQueue queue;
    /* 0x08 */ struct OSThread* thread;
    /* 0x0C */ s32 count;
    /* 0x10 */ struct OSMutexLink link;
} __anon_0x1715A; // size = 0x18

typedef struct OSMutexQueue {
    /* 0x0 */ struct OSMutex* head;
    /* 0x4 */ struct OSMutex* tail;
} __anon_0x1720B; // size = 0x8

typedef struct OSThread {
    /* 0x000 */ struct OSContext context;
    /* 0x2C8 */ u16 state;
    /* 0x2CA */ u16 attr;
    /* 0x2CC */ s32 suspend;
    /* 0x2D0 */ s32 priority;
    /* 0x2D4 */ s32 base;
    /* 0x2D8 */ void* val;
    /* 0x2DC */ struct OSThreadQueue* queue;
    /* 0x2E0 */ struct OSThreadLink link;
    /* 0x2E8 */ struct OSThreadQueue queueJoin;
    /* 0x2F0 */ struct OSMutex* mutex;
    /* 0x2F4 */ struct OSMutexQueue queueMutex;
    /* 0x2FC */ struct OSThreadLink linkActive;
    /* 0x304 */ u8* stackBase;
    /* 0x308 */ u32* stackEnd;
    /* 0x30C */ s32 error;
    /* 0x310 */ void* specific[2];
} __anon_0x1729C; // size = 0x318

// size = 0x318, address = 0x80105438
static struct OSThread ReadThread;

// size = 0x1000, address = 0x80105750
static u8 ReadThreadStack[4096];

// size = 0x40, address = 0x80106750
static f32 gOrthoMtx[4][4];

// size = 0x4, address = 0x80141124
s32 gMovieErrorToggle;

// size = 0x4, address = 0x80141128
static s32 toggle$185;

// size = 0x4, address = 0x8014112C
static s32 gbReset;

// size = 0x4, address = 0x80141130
static u32 gnTickReset;

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x17932; // size = 0x20

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
} __anon_0x17AA2; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (* callback)(s32, struct DVDFileInfo*);
} __anon_0x17CC8; // size = 0x3C

typedef struct __anon_0x17DA0 {
    /* 0x00 */ char magic[4];
    /* 0x04 */ u32 version;
    /* 0x08 */ u32 bufSize;
    /* 0x0C */ u32 audioMaxSamples;
    /* 0x10 */ f32 frameRate;
    /* 0x14 */ u32 numFrames;
    /* 0x18 */ u32 firstFrameSize;
    /* 0x1C */ u32 movieDataSize;
    /* 0x20 */ u32 compInfoDataOffsets;
    /* 0x24 */ u32 offsetDataOffsets;
    /* 0x28 */ u32 movieDataOffsets;
    /* 0x2C */ u32 finalFrameDataOffsets;
} __anon_0x17DA0; // size = 0x30

typedef struct __anon_0x17FCC {
    /* 0x0 */ u32 numComponents;
    /* 0x4 */ u8 frameComp[16];
} __anon_0x17FCC; // size = 0x14

typedef struct __anon_0x18034 {
    /* 0x0 */ u32 xSize;
    /* 0x4 */ u32 ySize;
    /* 0x8 */ u32 videoType;
} __anon_0x18034; // size = 0xC

typedef struct __anon_0x180B4 {
    /* 0x0 */ u32 sndChannels;
    /* 0x4 */ u32 sndFrequency;
    /* 0x8 */ u32 sndNumSamples;
    /* 0xC */ u32 sndNumTracks;
} __anon_0x180B4; // size = 0x10

typedef struct __anon_0x1816E {
    /* 0x0 */ u8* ytexture;
    /* 0x4 */ u8* utexture;
    /* 0x8 */ u8* vtexture;
    /* 0xC */ s32 frameNumber;
} __anon_0x1816E; // size = 0x10

typedef struct __anon_0x18224 {
    /* 0x0 */ s16* buffer;
    /* 0x4 */ s16* curPtr;
    /* 0x8 */ u32 validSample;
} __anon_0x18224; // size = 0xC

typedef struct __anon_0x182AE {
    /* 0x0 */ u8* ptr;
    /* 0x4 */ s32 frameNumber;
    /* 0x8 */ s32 isValid;
} __anon_0x182AE; // size = 0xC

typedef struct __anon_0x18399 {
    /* 0x000 */ struct DVDFileInfo fileInfo;
    /* 0x03C */ struct __anon_0x17DA0 header;
    /* 0x06C */ struct __anon_0x17FCC compInfo;
    /* 0x080 */ struct __anon_0x18034 videoInfo;
    /* 0x08C */ struct __anon_0x180B4 audioInfo;
    /* 0x09C */ void* thpWork;
    /* 0x0A0 */ s32 open;
    /* 0x0A4 */ u8 state;
    /* 0x0A5 */ u8 internalState;
    /* 0x0A6 */ u8 playFlag;
    /* 0x0A7 */ u8 audioExist;
    /* 0x0A8 */ s32 dvdError;
    /* 0x0AC */ s32 videoError;
    /* 0x0B0 */ s32 onMemory;
    /* 0x0B4 */ u8* movieData;
    /* 0x0B8 */ s32 initOffset;
    /* 0x0BC */ s32 initReadSize;
    /* 0x0C0 */ s32 initReadFrame;
    /* 0x0C8 */ s64 retraceCount;
    /* 0x0D0 */ s32 prevCount;
    /* 0x0D4 */ s32 curCount;
    /* 0x0D8 */ s32 videoAhead;
    /* 0x0DC */ f32 curVolume;
    /* 0x0E0 */ f32 targetVolume;
    /* 0x0E4 */ f32 deltaVolume;
    /* 0x0E8 */ s32 rampCount;
    /* 0x0EC */ s32 curAudioTrack;
    /* 0x0F0 */ s32 curVideoNumber;
    /* 0x0F4 */ s32 curAudioNumber;
    /* 0x0F8 */ struct __anon_0x1816E* dispTextureSet;
    /* 0x0FC */ struct __anon_0x18224* playAudioBuffer;
    /* 0x100 */ struct __anon_0x182AE readBuffer[10];
    /* 0x178 */ struct __anon_0x1816E textureSet[3];
    /* 0x1A8 */ struct __anon_0x18224 audioBuffer[3];
} __anon_0x18399; // size = 0x1D0

// size = 0x1D0, address = 0x80103E20
struct __anon_0x18399 ActivePlayer;

typedef struct PADStatus {
    /* 0x0 */ u16 button;
    /* 0x2 */ s8 stickX;
    /* 0x3 */ s8 stickY;
    /* 0x4 */ s8 substickX;
    /* 0x5 */ s8 substickY;
    /* 0x6 */ u8 triggerLeft;
    /* 0x7 */ u8 triggerRight;
    /* 0x8 */ u8 analogA;
    /* 0x9 */ u8 analogB;
    /* 0xA */ s8 err;
} __anon_0x18B62; // size = 0xC

typedef struct __anon_0x18CF2 {
    /* 0x00 */ struct PADStatus pst;
    /* 0x0C */ u16 buttonDown;
    /* 0x0E */ u16 buttonUp;
    /* 0x10 */ u16 dirs;
    /* 0x12 */ u16 dirsNew;
    /* 0x14 */ u16 dirsReleased;
    /* 0x16 */ s16 stickDeltaX;
    /* 0x18 */ s16 stickDeltaY;
    /* 0x1A */ s16 substickDeltaX;
    /* 0x1C */ s16 substickDeltaY;
} __anon_0x18CF2; // size = 0x1E

// size = 0x78, address = 0x8013E1B8
struct __anon_0x18CF2 DemoPad[4];

typedef enum __anon_0x190B4 {
    M_M_NONE = -1,
    M_M_DISK_COVER_OPEN = 0,
    M_M_DISK_WRONG_DISK = 1,
    M_M_DISK_READING_DISK = 2,
    M_M_DISK_FATAL_ERROR = 3,
    M_M_DISK_RETRY_ERROR = 4,
    M_M_DISK_NO_DISK = 5,
    M_M_DISK_DEFAULT_ERROR = 6,
} __anon_0x190B4;

// size = 0x0, address = 0x800E0C60
u8 gcoverOpen[];

// size = 0x0, address = 0x800EDF80
u8 gwrongDisk[];

// size = 0x0, address = 0x800F04A0
u8 greadingDisk[];

// size = 0x0, address = 0x800E6000
u8 gretryErr[];

// size = 0x0, address = 0x800E9420
u8 gfatalErr[];

// size = 0x0, address = 0x800E3AE0
u8 gnoDisk[];

// size = 0x0, address = 0x800F2080
s16 Vert_s16[];

// size = 0x0, address = 0x800F20C0
u32 Colors_u32[];

// size = 0x0, address = 0x800F20E0
u8 TexCoords_u8[];

typedef enum _GXTexWrapMode {
    GX_CLAMP = 0,
    GX_REPEAT = 1,
    GX_MIRROR = 2,
    GX_MAX_TEXWRAPMODE = 3,
} __anon_0x1954B;

typedef enum _GXTexFilter {
    GX_NEAR = 0,
    GX_LINEAR = 1,
    GX_NEAR_MIP_NEAR = 2,
    GX_LIN_MIP_NEAR = 3,
    GX_NEAR_MIP_LIN = 4,
    GX_LIN_MIP_LIN = 5,
} __anon_0x195B4;

typedef struct __anon_0x19645 {
    /* 0x00 */ u16 height;
    /* 0x02 */ u16 width;
    /* 0x04 */ u32 format;
    /* 0x08 */ char* data;
    /* 0x0C */ enum _GXTexWrapMode wrapS;
    /* 0x10 */ enum _GXTexWrapMode wrapT;
    /* 0x14 */ enum _GXTexFilter minFilter;
    /* 0x18 */ enum _GXTexFilter magFilter;
    /* 0x1C */ f32 LODBias;
    /* 0x20 */ u8 edgeLODEnable;
    /* 0x21 */ u8 minLOD;
    /* 0x22 */ u8 maxLOD;
    /* 0x23 */ u8 unpacked;
} __anon_0x19645; // size = 0x24

typedef enum _GXTlutFmt {
    GX_TL_IA8 = 0,
    GX_TL_RGB565 = 1,
    GX_TL_RGB5A3 = 2,
    GX_MAX_TLUTFMT = 3,
} __anon_0x19838;

typedef struct __anon_0x198A0 {
    /* 0x0 */ u16 numEntries;
    /* 0x2 */ u8 unpacked;
    /* 0x3 */ u8 pad8;
    /* 0x4 */ enum _GXTlutFmt format;
    /* 0x8 */ char* data;
} __anon_0x198A0; // size = 0xC

typedef struct __anon_0x1996C {
    /* 0x0 */ struct __anon_0x19645* textureHeader;
    /* 0x4 */ struct __anon_0x198A0* CLUTHeader;
} __anon_0x1996C; // size = 0x8

typedef struct __anon_0x199DD {
    /* 0x0 */ u32 versionNumber;
    /* 0x4 */ u32 numDescriptors;
    /* 0x8 */ struct __anon_0x1996C* descriptorArray;
} __anon_0x199DD; // size = 0xC

typedef struct _GXTexObj {
    /* 0x0 */ u32 dummy[8];
} __anon_0x19A99; // size = 0x20

typedef struct _GXColor {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
} __anon_0x19ADF; // size = 0x4

// Range: 0x80013190 -> 0x80013860
s32 movieGXInit() {
    // Local variables
    s32 i; // r31
    struct _GXColor GX_DEFAULT_BG; // r1+0x58
    struct _GXColor BLACK; // r1+0x54
    struct _GXColor WHITE; // r1+0x50
    f32 identity_mtx[3][4]; // r1+0x20
}

// Range: 0x80012C74 -> 0x80013190
s32 movieDrawImage(struct __anon_0x199DD* tpl, s16 nX0, s16 nY0) {
    // Parameters
    // struct __anon_0x199DD* tpl; // r25
    // s16 nX0; // r26
    // s16 nY0; // r27

    // Local variables
    struct _GXTexObj texObj; // r1+0xB0
    struct _GXColor color; // r1+0xA8
    f32 identity_mtx[3][4]; // r1+0x78
    f32 g2DviewMtx[3][4]; // r1+0x48
    f32 g2[3][4]; // r1+0x18

    // References
    // -> u8 TexCoords_u8[];
    // -> u32 Colors_u32[];
    // -> s16 Vert_s16[];
    // -> static f32 gOrthoMtx[4][4];
}

// Range: 0x80012AB0 -> 0x80012C74
s32 movieDrawErrorMessage(enum __anon_0x190B4 movieMessage) {
    // Parameters
    // enum __anon_0x190B4 movieMessage; // r1+0x8

    // References
    // -> u8 gfatalErr[];
    // -> u8 gnoDisk[];
    // -> u8 gretryErr[];
    // -> u8 greadingDisk[];
    // -> u8 gwrongDisk[];
    // -> u8 gcoverOpen[];
}

// Range: 0x80012850 -> 0x80012AB0
s32 movieDVDShowError(s32 nStatus) {
    // Parameters
    // s32 nStatus; // r1+0x8

    // Local variables
    enum __anon_0x190B4 nMessage; // r31

    // References
    // -> static u32 gnTickReset;
    // -> static s32 gbReset;
    // -> struct __anon_0x18CF2 DemoPad[4];
    // -> static s32 toggle$185;
    // -> s32 gMovieErrorToggle;
}

// Range: 0x800127A0 -> 0x80012850
s32 movieDVDRead(struct DVDFileInfo* pFileInfo, void* anData, s32 nSizeRead, s32 nOffset) {
    // Parameters
    // struct DVDFileInfo* pFileInfo; // r26
    // void* anData; // r27
    // s32 nSizeRead; // r28
    // s32 nOffset; // r29

    // Local variables
    s32 nStatus; // r31
    s32 bRetry; // r30

    // References
    // -> s32 gMovieErrorToggle;
}

// Range: 0x800125EC -> 0x800127A0
s32 movieTestReset(s32 IPL, s32 forceMenu) {
    // Parameters
    // s32 IPL; // r29
    // s32 forceMenu; // r30

    // Local variables
    u32 bFlag; // r1+0x8
    u32 nTick; // r1+0x8

    // References
    // -> static u32 gnTickReset;
    // -> static s32 gbReset;
    // -> struct __anon_0x18CF2 DemoPad[4];
}

// Range: 0x8001254C -> 0x800125EC
void movieReset(s32 IPL, s32 forceMenu) {
    // Parameters
    // s32 IPL; // r30
    // s32 forceMenu; // r31
}

// Range: 0x800124A0 -> 0x8001254C
s32 CreateReadThread(s32 priority) {
    // Parameters
    // s32 priority; // r3

    // References
    // -> static s32 ReadThreadCreated;
    // -> static void* ReadedBufferMessage2[10];
    // -> static struct OSMessageQueue ReadedBufferQueue2;
    // -> static void* ReadedBufferMessage[10];
    // -> static struct OSMessageQueue ReadedBufferQueue;
    // -> static void* FreeReadBufferMessage[10];
    // -> static struct OSMessageQueue FreeReadBufferQueue;
    // -> static u8 ReadThreadStack[4096];
    // -> static struct OSThread ReadThread;
}

// Range: 0x8001246C -> 0x800124A0
void ReadThreadStart() {
    // References
    // -> static struct OSThread ReadThread;
    // -> static s32 ReadThreadCreated;
}

// Erased
static void ReadThreadCancel() {
    // References
    // -> static s32 ReadThreadCreated;
    // -> static struct OSThread ReadThread;
}

// Range: 0x80012340 -> 0x8001246C
static void* Reader() {
    // Local variables
    struct __anon_0x182AE* readBuffer; // r27
    s32 offset; // r26
    s32 size; // r25
    s32 readFrame; // r24

    // References
    // -> static struct OSThread ReadThread;
    // -> struct __anon_0x18399 ActivePlayer;
    // -> static struct OSMessageQueue ReadedBufferQueue;
    // -> s32 gMovieErrorToggle;
    // -> static struct OSMessageQueue FreeReadBufferQueue;
}

// Range: 0x8001230C -> 0x80012340
void* PopReadedBuffer() {
    // Local variables
    void* msg; // r1+0x8

    // References
    // -> static struct OSMessageQueue ReadedBufferQueue;
}

// Erased
static void PushReadedBuffer(void* buffer) {
    // Parameters
    // void* buffer; // r4

    // References
    // -> static struct OSMessageQueue ReadedBufferQueue;
}

// Erased
static void* PopFreeReadBuffer() {
    // Local variables
    void* msg; // r1+0x8

    // References
    // -> static struct OSMessageQueue FreeReadBufferQueue;
}

// Range: 0x800122DC -> 0x8001230C
void PushFreeReadBuffer(void* buffer) {
    // Parameters
    // void* buffer; // r4

    // References
    // -> static struct OSMessageQueue FreeReadBufferQueue;
}

// Range: 0x800122A8 -> 0x800122DC
void* PopReadedBuffer2() {
    // Local variables
    void* msg; // r1+0x8

    // References
    // -> static struct OSMessageQueue ReadedBufferQueue2;
}

// Range: 0x80012278 -> 0x800122A8
void PushReadedBuffer2(void* buffer) {
    // Parameters
    // void* buffer; // r4

    // References
    // -> static struct OSMessageQueue ReadedBufferQueue2;
}
