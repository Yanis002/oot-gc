#ifndef _METROTRK_SUPPORT_H
#define _METROTRK_SUPPORT_H

#include "dolphin/types.h"
#include "metrotrk/msgbuf.h"
#include "metrotrk/trk.h"

#ifdef __cplusplus
extern "C" {
#endif

DSError TRKSuppAccessFile(u32, u8*, size_t*, u8*, bool, bool);
DSError TRKRequestSend(MessageBuffer* msgBuf, int* bufferId, u32 p1, u32 p2, int p3);
DSError HandleOpenFileSupportRequest(const char*, u8, u32*, DSIOResult*);
DSError HandleCloseFileSupportRequest(int, DSIOResult*);
DSError HandlePositionFileSupportRequest(u32, u32*, u8, DSIOResult*);

#ifdef __cplusplus
}
#endif

#endif
