#ifndef SNDDVDTRK_H
#define SNDDVDTRK_H

#include "dolphin.h"

// __anon_0x9466F
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
} DVDTrackState;

// __anon_0x935DD
typedef enum ErrorRetreivalState {
    NO_ERROR_RETRIEVING = 0,
    RETRIEVING_ERROR = 1,
    ERROR_RETRIEVED = 2,
} ErrorRetreivalState;

// __anon_0x93582
typedef union __anon_0x93582 {
    /* 0x0 */ s32 code;
    /* 0x0 */ u8 bytes[4];
} __anon_0x93582;

// __anon_0x9364C
typedef struct DVDTrackInfo {
    /* 0x0 */ s32 fadeTime;
    /* 0x4 */ s32 volume;
    /* 0x8 */ s32 trackID;
    /* 0xC */ s32 flags;
} DVDTrackInfo; // size = 0x10

// __anon_0x936FF
typedef struct DVDFadeInfo {
    /* 0x00 */ s32 curTime;
    /* 0x04 */ s32 fadeTime;
    /* 0x08 */ s32 curVol;
    /* 0x0C */ s32 startVol;
    /* 0x10 */ s32 nextVol;
} DVDFadeInfo; // size = 0x14

// __anon_0x937D8
typedef struct DVDTrackList {
    /* 0x000 */ s32 fileIDs[60];
    /* 0x0F0 */ char filenames[60][32];
    /* 0x870 */ u8 playOrder[60];
    /* 0x8AC */ DVDFileInfo playingFileInfo;
    /* 0x8E8 */ __anon_0x93582 error;
    /* 0x8EC */ ErrorRetreivalState errorState;
    /* 0x8F0 */ s32 numTracks;
    /* 0x8F4 */ DVDTrackInfo curState;
    /* 0x904 */ DVDTrackInfo nextState;
    /* 0x914 */ DVDTrackInfo queueState;
    /* 0x924 */ s32 stopTrack;
    /* 0x928 */ s32 stopFadeTime;
    /* 0x92C */ s32 fadeTime;
    /* 0x930 */ s32 waitTime;
    /* 0x934 */ DVDFadeInfo fadeInfo;
    /* 0x948 */ s32 volume;
    /* 0x94C */ s32 fadeInOutVolume;
    /* 0x950 */ DVDTrackState state;
    /* 0x954 */ DVDTrackState lastState;
} DVDTrackList; // size = 0x958

#endif
