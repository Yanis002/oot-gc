#include "dolphin/card.h"

u16 __CARDVendorID = 0xFFFF;

#if IS_CE || IS_MM
u8 __CARDPermMask = 0x1C;
#endif
