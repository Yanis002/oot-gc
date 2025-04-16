/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Fire\snddvdtrk.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x8009EA3C -> 0x8009F7B8
*/

#include "types.h"

// size = 0x4, address = 0x8012FB08
s32 gBGMVolume;

// size = 0x4, address = 0x8012FB0C
s32* gDVDVolumeP;

// size = 0x4, address = 0x8012FF08
static s32 vErrReadDone;

typedef struct DVDDiskID {
    /* 0x0 */ char gameName[4];
    /* 0x4 */ char company[2];
    /* 0x6 */ u8 diskNumber;
    /* 0x7 */ u8 gameVersion;
    /* 0x8 */ u8 streaming;
    /* 0x9 */ u8 streamingBufSize;
    /* 0xA */ u8 padding[22];
} __anon_0x92DB8; // size = 0x20

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
} __anon_0x92F28; // size = 0x30

typedef struct DVDFileInfo {
    /* 0x00 */ struct DVDCommandBlock cb;
    /* 0x30 */ u32 startAddr;
    /* 0x34 */ u32 length;
    /* 0x38 */ void (* callback)(s32, struct DVDFileInfo*);
} __anon_0x9314E; // size = 0x3C

// size = 0x3C, address = 0x8012ABB8
static struct DVDFileInfo sErrorDFI;

// size = 0x4, address = 0x8012FF0C
static s32 counter$238;

typedef union __anon_0x932F6 {
    /* 0x0 */ s32 code;
    /* 0x0 */ u8 bytes[4];
} __anon_0x932F6;

typedef enum ErrorRetreivalState {
    NO_ERROR_RETRIEVING = 0,
    RETRIEVING_ERROR = 1,
    ERROR_RETRIEVED = 2,
} __anon_0x93351;

typedef struct DVDTrackInfo {
    /* 0x0 */ s32 fadeTime;
    /* 0x4 */ s32 volume;
    /* 0x8 */ s32 trackID;
    /* 0xC */ s32 flags;
} __anon_0x933C0; // size = 0x10

typedef struct DVDFadeInfo {
    /* 0x00 */ s32 curTime;
    /* 0x04 */ s32 fadeTime;
    /* 0x08 */ s32 curVol;
    /* 0x0C */ s32 startVol;
    /* 0x10 */ s32 nextVol;
} __anon_0x93473; // size = 0x14

typedef struct DVDTrackList {
    /* 0x000 */ s32 fileIDs[60];
    /* 0x0F0 */ char filenames[60][32];
    /* 0x870 */ u8 playOrder[60];
    /* 0x8AC */ struct DVDFileInfo playingFileInfo;
    /* 0x8E8 */ union __anon_0x932F6 error;
    /* 0x8EC */ enum ErrorRetreivalState errorState;
    /* 0x8F0 */ s32 numTracks;
    /* 0x8F4 */ struct DVDTrackInfo curState;
    /* 0x904 */ struct DVDTrackInfo nextState;
    /* 0x914 */ struct DVDTrackInfo queueState;
    /* 0x924 */ s32 stopTrack;
    /* 0x928 */ s32 stopFadeTime;
    /* 0x92C */ s32 fadeTime;
    /* 0x930 */ s32 waitTime;
    /* 0x934 */ struct DVDFadeInfo fadeInfo;
    /* 0x948 */ s32 volume;
    /* 0x94C */ s32 fadeInOutVolume;
    /* 0x950 */ enum DVDTrackState state;
    /* 0x954 */ enum DVDTrackState lastState;
} __anon_0x9354C; // size = 0x958

// size = 0x958, address = 0x8012ABF4
struct DVDTrackList gDVDTrackList;

typedef enum DVDTrackState {
    TRACK_NOTHING = 0,
    TRACK_PREPARE_STREAM = 1,
    TRACK_PLAYING_STREAM = 2,
    TRACK_PAUSING_STREAM = 3,
    TRACK_PAUSE_STREAM = 4,
    TRACK_FADE_IN_STREAM = 5,
    TRACK_FADE_OUT_PAUSE = 6,
    TRACK_FADE_OUT_HOLD_PAUSE = 7,
    TRACK_FADE_OUT_STREAM = 8,
    TRACK_STOPPING_STREAM = 9,
    MAX_TRACK_STATES = 10,
} __anon_0x943E3;

// Range: 0x8009F71C -> 0x8009F7B8
static s32 CheckForStopDVDTrack() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static void DVDTrackGetErrorCallback(s32 result) {
    // Parameters
    // s32 result; // r1+0x8

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F6E0 -> 0x8009F71C
static void CheckErrorStatus(s32 result) {
    // Parameters
    // s32 result; // r1+0x8

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F6DC -> 0x8009F6E0
static void DVDTrackStopCallback() {}

// Range: 0x8009F4F8 -> 0x8009F6DC
static void DVDTrackPrepareStreamCallback(s32 result, struct DVDFileInfo* fileInfo) {
    // Parameters
    // s32 result; // r1+0x8
    // struct DVDFileInfo* fileInfo; // r29

    // Local variables
    enum DVDTrackState lastState; // r30

    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Range: 0x8009F4A4 -> 0x8009F4F8
static void DVDTrackCancelStreamCallback(s32 result) {
    // Parameters
    // s32 result; // r1+0x8

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F300 -> 0x8009F4A4
static void DVDTrackFadeOutUpdate() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void DVDTrackFadeOutPauseUpdate() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void DVDTrackFadeInUpdate() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void StartTrack() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F20C -> 0x8009F300
void InitDVDTrackList() {
    // Local variables
    s32 i; // r7

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F178 -> 0x8009F20C
s32 AddDVDTrack(char* filename) {
    // Parameters
    // char* filename; // r3

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 ReplaceDVDTrack(char* filename, s32 songID) {
    // Parameters
    // char* filename; // r4
    // s32 songID; // r29

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 GetDVDTrackID(char* filename) {
    // Parameters
    // char* filename; // r28

    // Local variables
    s32 i; // r29

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 GetRealDVDTrackID(s32 songID) {
    // Parameters
    // s32 songID; // r1+0x0

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F078 -> 0x8009F178
void PlayDVDTrack(s32 songID, s32 volume, s32 fadeTime, s32 flags) {
    // Parameters
    // s32 songID; // r9
    // s32 volume; // r4
    // s32 fadeTime; // r1+0x10
    // s32 flags; // r1+0x14

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static char* GetDVDTrackFileName(s32 songID) {
    // Parameters
    // s32 songID; // r1+0x0

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 GetCurrentDVDTrackID() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 GetPlayingDVDTrackID() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Range: 0x8009F040 -> 0x8009F078
static void ErrorCallBack(s32 result, struct DVDFileInfo* pdfi) {
    // Parameters
    // s32 result; // r1+0x8
    // struct DVDFileInfo* pdfi; // r4

    // References
    // -> static s32 vErrReadDone;
}

// Erased
static s32 HandleDVDTrackListError() {
    // Local variables
    s32 status; // r31
    s32 flag; // r30

    // References
    // -> static struct DVDFileInfo sErrorDFI;
    // -> static s32 vErrReadDone;
}

// Range: 0x8009EAF4 -> 0x8009F040
void UpdateDVDTrackList() {
    // Local variables
    s32 updateVolume; // r28
    s32 error; // r27

    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
    // -> static s32 counter$238;
    // -> static struct DVDFileInfo sErrorDFI;
    // -> static s32 vErrReadDone;
}

// Range: 0x8009EA3C -> 0x8009EAF4
void PauseDVDTrack() {
    // Local variables
    s32 enabled; // r3

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static void ResumeDVDTrack() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void ResumeDVDTrackPause(s32 fadeInTime) {
    // Parameters
    // s32 fadeInTime; // r1+0x8

    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void StopDVDTrackPause(s32 fadeTime) {
    // Parameters
    // s32 fadeTime; // r31

    // Local variables
    s32 enabled; // r3

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static void StopDVDTrack(s32 fadeTime) {
    // Parameters
    // s32 fadeTime; // r29

    // Local variables
    s32 enabled; // r3

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static void StopDVDTrackForce() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static void ExitDVDTrackList() {}

// Erased
static void DVDTrackVolume(s32 newVolume, s32 fadeTime) {
    // Parameters
    // s32 newVolume; // r1+0x8
    // s32 fadeTime; // r1+0xC

    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void SetDVDTrackVolume() {
    // Local variables
    s32 volume; // r4

    // References
    // -> struct DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static s32 ShuffleDVDTracks(s32 currentSongID) {
    // Parameters
    // s32 currentSongID; // r1+0x0

    // Local variables
    s32 i; // r9
    u8 realTrackID; // r10
    u8 temp; // r8

    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 IsDVDTrackStopped() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static s32 IsDVDTrackPaused() {
    // References
    // -> struct DVDTrackList gDVDTrackList;
}

// Erased
static void SetDVDGlobalVolume(s32* volP) {
    // Parameters
    // s32* volP; // r1+0x0

    // References
    // -> s32* gDVDVolumeP;
}
