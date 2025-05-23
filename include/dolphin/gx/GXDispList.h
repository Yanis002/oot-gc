#ifndef _DOLPHIN_GX_GXDISPLIST_H
#define _DOLPHIN_GX_GXDISPLIST_H

#include "dolphin/types.h"

#ifdef __cplusplus
extern "C" {
#endif

void GXBeginDisplayList(void* list, u32 size);
u32 GXEndDisplayList(void);
void GXCallDisplayList(void* list, u32 nbytes);

#ifdef __cplusplus
}
#endif

#endif
