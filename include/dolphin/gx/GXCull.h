#ifndef _DOLPHIN_GX_GXCULL_H
#define _DOLPHIN_GX_GXCULL_H

#include "dolphin/gx/GXEnum.h"

#ifdef __cplusplus
extern "C" {
#endif

void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht);
void GXSetCullMode(GXCullMode mode);
void GXSetCoPlanar(GXBool enable);

#ifdef __cplusplus
}
#endif

#endif
