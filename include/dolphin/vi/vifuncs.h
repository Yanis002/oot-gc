#ifndef _DOLPHIN_VI_VIFUNCS_H
#define _DOLPHIN_VI_VIFUNCS_H

#include "dolphin/gx/GXStruct.h"
#include "dolphin/types.h"
#include "dolphin/vi/vitypes.h"

#ifdef __cplusplus
extern "C" {
#endif

VIRetraceCallback VISetPreRetraceCallback(VIRetraceCallback cb);
VIRetraceCallback VISetPostRetraceCallback(VIRetraceCallback cb);
void VIInit(void);
void VIWaitForRetrace(void);
void VIConfigure(const GXRenderModeObj* rm);
void VIConfigurePan(u16 xOrg, u16 yOrg, u16 width, u16 height);
void VIFlush(void);
void VISetNextFrameBuffer(void* fb);
void VISetNextRightFrameBuffer(void* fb);
void VISetBlack(bool black);
void VISet3D(bool threeD);
u32 VIGetRetraceCount(void);
u32 VIGetNextField(void);
u32 VIGetCurrentLine(void);
u32 VIGetTvFormat(void);
void* VIGetNextFrameBuffer(void);
void* VIGetCurrentFrameBuffer(void);
u32 VIGetScanMode(void);
u32 VIGetDTVStatus(void);

#ifdef __cplusplus
}
#endif

#endif
