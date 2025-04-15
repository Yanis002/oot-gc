#include "emulator/snddvdtrk.h"
#include "macros.h"

void PauseDVDTrack(void);
static void StopDVDTrack(s32 fadeTime);
static void SetDVDTrackVolume(void);

s32 gBGMVolume = 127;
s32* gDVDVolumeP = &gBGMVolume;
static s32 vErrReadDone;
static DVDFileInfo sErrorDFI;
DVDTrackList gDVDTrackList;

static bool CheckForStopDVDTrack(void) {
    if (gDVDTrackList.stopTrack == 1) {
        gDVDTrackList.fadeTime = gDVDTrackList.stopFadeTime;
        gDVDTrackList.curState.fadeTime = gDVDTrackList.stopFadeTime;
        gDVDTrackList.state = TRACK_FADE_OUT_STREAM;
        return true;
    }

    if (gDVDTrackList.stopTrack == 2) {
        gDVDTrackList.fadeTime = gDVDTrackList.stopFadeTime;
        gDVDTrackList.curState.fadeTime = gDVDTrackList.stopFadeTime;
        gDVDTrackList.state = TRACK_FADE_OUT_PAUSE;
        gDVDTrackList.stopTrack = 0;
        return true;
    }

    if (gDVDTrackList.nextState.trackID >= 0) {
        gDVDTrackList.curState.fadeTime = 0;
        gDVDTrackList.fadeTime = 0;
        gDVDTrackList.state = TRACK_FADE_OUT_STREAM;
        return true;
    }

    return false;
}

// Erased
static void DVDTrackGetErrorCallback(s32 result) {
    // Parameters
    // s32 result; // r1+0x8

    // References
    // -> DVDTrackList gDVDTrackList;
}

static void CheckErrorStatus(s32 result) {
    // Parameters
    // s32 result; // r1+0x8

    // References
    // -> DVDTrackList gDVDTrackList;

    gDVDTrackList.error.code = result;
    gDVDTrackList.errorState = ERROR_RETRIEVED;
}

static void DVDTrackStopCallback(void) {}

static void DVDTrackPrepareStreamCallback(s32 result, DVDFileInfo* fileInfo) {
    // Parameters
    // s32 result; // r1+0x8
    // DVDFileInfo* fileInfo; // r29

    // Local variables
    DVDTrackState lastState; // r30
    u32 temp_r28;

    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;

    if (result == 0) {
        if (gDVDTrackList.waitTime >= 30) {
            StopDVDTrack(gDVDTrackList.stopFadeTime);
        } else {
            lastState = gDVDTrackList.state;

            if (lastState != TRACK_FADE_OUT_STREAM) {
                gDVDTrackList.volume = gDVDTrackList.curState.fadeTime;
                gDVDTrackList.state = TRACK_FADE_IN_STREAM;

                if (gDVDTrackList.fadeTime >= gDVDTrackList.curState.fadeTime) {
                    gDVDTrackList.fadeInOutVolume = 128;
                    gDVDTrackList.state = TRACK_PLAYING_STREAM;
                } else {
                    gDVDTrackList.fadeTime++;
                    gDVDTrackList.fadeInOutVolume = (gDVDTrackList.fadeTime * 128) / gDVDTrackList.curState.fadeTime;
                }

                SetDVDTrackVolume();

                if (!(gDVDTrackList.curState.flags & 0x4000) && lastState != TRACK_PAUSING_STREAM) {
                    AISetStreamPlayState(1);
                } else {
                    PauseDVDTrack();
                }

                gDVDTrackList.curState.flags &= 0xFFFFBFFF;

                if (!(gDVDTrackList.curState.flags & 1)) {
                    DVDStopStreamAtEndAsync(fileInfo, DVDTrackStopCallback);
                }
            }
        }

        gDVDTrackList.curState.flags &= 0xFFFFBFFF;
    }
}

static void DVDTrackCancelStreamCallback(s32 result, DVDCommandBlock* block) {
    // Parameters
    // s32 result; // r1+0x8

    // References
    // -> DVDTrackList gDVDTrackList;

    if (result == 0) {
        DVDClose(&gDVDTrackList.playingFileInfo);
        AISetStreamPlayState(0);
        gDVDTrackList.state = 0;
        gDVDTrackList.curState.trackID = -1;
    }
}

static void DVDTrackFadeOutUpdate(void) {
    if (gDVDTrackList.fadeTime <= 0) {
        gDVDTrackList.error.code = 1;

        if ((gDVDTrackList.fadeTime < 0) && (gDVDTrackList.fadeTime == -1)) {
            gDVDTrackList.fadeTime = 0;
            gDVDTrackList.error.code = DVDGetStreamErrorStatus(&gDVDTrackList.playingFileInfo.cb);
        }

        gDVDTrackList.fadeInOutVolume = 0;
        SetDVDTrackVolume();
        // AISetStreamVolLeft(0);
        // AISetStreamVolRight(0);

        gDVDTrackList.state = TRACK_STOPPING_STREAM;

        if ((gDVDTrackList.error.bytes[0] == 0 && gDVDTrackList.error.bytes[1] == 0) && gDVDTrackList.error.bytes[3] != 0) {
            DVDClose(&gDVDTrackList.playingFileInfo);
            AISetStreamPlayState(0);
            gDVDTrackList.state = TRACK_NOTHING;
            gDVDTrackList.curState.trackID = -1;
        } else if (!DVDCancelStreamAsync(&gDVDTrackList.playingFileInfo.cb, DVDTrackCancelStreamCallback)) {
            DVDClose(&gDVDTrackList.playingFileInfo);
            AISetStreamPlayState(0);
            gDVDTrackList.state = TRACK_NOTHING;
            gDVDTrackList.curState.trackID = -1;
        }
    } else {
        gDVDTrackList.fadeTime--;
        gDVDTrackList.fadeInOutVolume = (gDVDTrackList.fadeTime * 128) / gDVDTrackList.curState.fadeTime;
        SetDVDTrackVolume();
    }
}

// Erased
static void DVDTrackFadeOutPauseUpdate(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void DVDTrackFadeInUpdate(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void StartTrack(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
}

void InitDVDTrackList(void) {
    int i;

    memset(&gDVDTrackList, 0, sizeof(DVDTrackList));
    gDVDTrackList.nextState.trackID = -1;
    gDVDTrackList.curState.trackID = -1;
    gDVDTrackList.state = TRACK_NOTHING;
    AISetStreamVolLeft(0);
    AISetStreamVolRight(0);

    for (i = 0; i < ARRAY_COUNT(gDVDTrackList.playOrder); i++) {
        gDVDTrackList.playOrder[i] = i;
    }
}

s32 AddDVDTrack(char* filename) {    
    if (gDVDTrackList.numTracks >= ARRAY_COUNT(gDVDTrackList.playOrder)) {
        return -1;
    } 
    
    strncpy(gDVDTrackList.filenames[gDVDTrackList.numTracks], filename, 0x20);
    gDVDTrackList.fileIDs[gDVDTrackList.numTracks] = DVDConvertPathToEntrynum(gDVDTrackList.filenames[gDVDTrackList.numTracks]);

    return gDVDTrackList.numTracks++;
}

// Erased
static bool ReplaceDVDTrack(char* filename, s32 songID) {
    // Parameters
    // char* filename; // r4
    // s32 songID; // r29

    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static bool GetDVDTrackID(char* filename) {
    // Parameters
    // char* filename; // r28

    // Local variables
    s32 i; // r29

    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static bool GetRealDVDTrackID(s32 songID) {
    // Parameters
    // s32 songID; // r1+0x0

    // References
    // -> DVDTrackList gDVDTrackList;
}

void PlayDVDTrack(s32 songID, s32 volume, s32 fadeTime, s32 flags) {
    // Parameters
    // s32 songID; // r9
    // s32 volume; // r4
    // s32 fadeTime; // r1+0x10
    // s32 flags; // r1+0x14

    // References
    // -> DVDTrackList gDVDTrackList;

    u8 uVar1;

    if (songID >= 0) {
        if (songID < gDVDTrackList.numTracks) {
            return;
        }

        uVar1 = gDVDTrackList.playOrder[songID];

        if (gDVDTrackList.fileIDs[uVar1] >= 0) {
            if (volume < 0) {
                volume = 255;
            }

            if (
                (
                ((gDVDTrackList.nextState.trackID >= 0
                || uVar1 != gDVDTrackList.curState.trackID) 
                || volume != gDVDTrackList.curState.volume)
                || (((gDVDTrackList.state < TRACK_PREPARE_STREAM || (gDVDTrackList.state > TRACK_FADE_IN_STREAM)) && gDVDTrackList.state != TRACK_PAUSING_STREAM)))
                || gDVDTrackList.stopTrack != 0) {

                gDVDTrackList.fadeInfo.startVol = 127;
                gDVDTrackList.fadeInfo.curVol = 127;
                gDVDTrackList.fadeInfo.nextVol = 127;
                gDVDTrackList.nextState.fadeTime = fadeTime;
                gDVDTrackList.nextState.volume = volume;
                gDVDTrackList.nextState.trackID = uVar1;
                gDVDTrackList.nextState.flags = flags;

                if (gDVDTrackList.state == TRACK_PAUSING_STREAM || gDVDTrackList.state == TRACK_PAUSE_STREAM) {
                    CheckForStopDVDTrack();
                }
            }
        }
    }
}

// Erased
static char* GetDVDTrackFileName(s32 songID) {
    // Parameters
    // s32 songID; // r1+0x0

    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static bool GetCurrentDVDTrackID(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static bool GetPlayingDVDTrackID(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
}

static void ErrorCallBack(s32 result, DVDFileInfo* pdfi) {
    if (result != -1) {
        DVDClose(pdfi);
        vErrReadDone -= 1;
    }
}

// Erased
static bool HandleDVDTrackListError(void) {
    // Local variables
    s32 status; // r31
    s32 flag; // r30

    // References
    // -> static DVDFileInfo sErrorDFI;
    // -> static s32 vErrReadDone;
}

void UpdateDVDTrackList(void) {
    // Local variables
    s32 updateVolume; // r28
    s32 error; // r27

    static s32 counter;

    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
    // -> static s32 counter$238;
    // -> static DVDFileInfo sErrorDFI;
    // -> static s32 vErrReadDone;
}

void PauseDVDTrack(void) {
    // Local variables
    bool enabled; // r3

    // References
    // -> DVDTrackList gDVDTrackList;

    if (gDVDTrackList.state != TRACK_PAUSE_STREAM) {
        enabled = OSDisableInterrupts();

        if ((gDVDTrackList.state == TRACK_PREPARE_STREAM) || (gDVDTrackList.state == TRACK_STOPPING_STREAM)) {
            gDVDTrackList.state = TRACK_PAUSING_STREAM;
        }

        OSRestoreInterrupts(enabled);

        if ((gDVDTrackList.state != TRACK_PAUSING_STREAM) && (gDVDTrackList.state > 1) && (gDVDTrackList.state < 9)) {
            gDVDTrackList.lastState = gDVDTrackList.state;
            gDVDTrackList.state = TRACK_PAUSE_STREAM;
            AISetStreamVolLeft(0);
            AISetStreamVolRight(0);
            AISetStreamPlayState(0);
        }
    }

    NO_INLINE();
}

// Erased
static void ResumeDVDTrack(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void ResumeDVDTrackPause(s32 fadeInTime) {
    // Parameters
    // s32 fadeInTime; // r1+0x8

    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void StopDVDTrackPause(s32 fadeTime) {
    // Parameters
    // s32 fadeTime; // r31

    // Local variables
    s32 enabled; // r3

    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static void StopDVDTrack(s32 fadeTime) {
    // Parameters
    // s32 fadeTime; // r29

    // Local variables
    bool enabled = OSDisableInterrupts(); // r3

    if (gDVDTrackList.state > TRACK_NOTHING && gDVDTrackList.state < TRACK_FADE_OUT_STREAM) {
        gDVDTrackList.stopTrack = 1;

        if (!(gDVDTrackList.curState.flags & 1)) {
            gDVDTrackList.stopFadeTime = 0;
        } else {
            gDVDTrackList.stopFadeTime = 0;
        }
    }

    OSRestoreInterrupts(enabled);

    if (gDVDTrackList.state == TRACK_PAUSING_STREAM || gDVDTrackList.state == TRACK_PAUSE_STREAM) {
        CheckForStopDVDTrack();
    }

    gDVDTrackList.state = TRACK_FADE_OUT_STREAM;
}

// Erased
static void StopDVDTrackForce(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static void ExitDVDTrackList(void) {}

// Erased
static void DVDTrackVolume(s32 newVolume, s32 fadeTime) {
    // Parameters
    // s32 newVolume; // r1+0x8
    // s32 fadeTime; // r1+0xC

    // References
    // -> DVDTrackList gDVDTrackList;
    // -> s32* gDVDVolumeP;
}

// Erased
static void SetDVDTrackVolume(void) {
    s32 volume = (((((gDVDTrackList.volume * *gDVDVolumeP) >> 7) * gDVDTrackList.fadeInOutVolume) >> 7) * gDVDTrackList.fadeInfo.curVol) >> 7;

    AISetStreamVolLeft(volume);
    AISetStreamVolRight(volume);
}

// Erased
static bool ShuffleDVDTracks(s32 currentSongID) {
    // Parameters
    // s32 currentSongID; // r1+0x0

    // Local variables
    s32 i; // r9
    u8 realTrackID; // r10
    u8 temp; // r8

    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static bool IsDVDTrackStopped(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static bool IsDVDTrackPaused(void) {
    // References
    // -> DVDTrackList gDVDTrackList;
}

// Erased
static void SetDVDGlobalVolume(s32* volP) {
    // Parameters
    // s32* volP; // r1+0x0

    // References
    // -> s32* gDVDVolumeP;
}
