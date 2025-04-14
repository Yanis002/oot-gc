#ifndef _MACROS_H
#define _MACROS_H

// The VERSION macro will be set to one of these version numbers.
#define MQ_J 1
#define MQ_U 2
#define MQ_E 3
#define CE_J 4
#define CE_U 5
#define CE_E 6
#define MM_J 7
#define IS_MQ (VERSION == MQ_J || VERSION == MQ_U || VERSION == MQ_E)
#define IS_CE (VERSION == CE_J || VERSION == CE_U || VERSION == CE_E)
#define IS_JP (VERSION == MQ_J || VERSION == CE_J)
#define IS_US (VERSION == MQ_U || VERSION == CE_U)
#define IS_EU (VERSION == MQ_E || VERSION == CE_E)
#define IS_MM (VERSION == MM_J)
#define IS_OOT (!IS_MM)

#define ALIGN_PREV(X, N) ((X) & ~((N) - 1))
#define ALIGN_NEXT(X, N) ALIGN_PREV(((X) + (N) - 1), N)

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))
#define ARRAY_COUNTU(arr) (u32)(sizeof(arr) / sizeof(arr[0]))

#define OFFSETOF(p, field) ((u8*)&(p)->field - (u8*)(p))

#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) < (b) ? (b) : (a))
#define SQ(x) ((x) * (x))
#define CLAMP(x, l, h) (((x) > (h)) ? (h) : (((x) < (l)) ? (l) : (x)))

#if IS_OOT
#define OOT_INLINE static inline
#define OOT_STATIC static
#else
#define OOT_INLINE static
#define OOT_STATIC
#endif

#if IS_MM
#define MM_INLINE static inline
#define MM_STATIC static
#else
#define MM_INLINE static
#define MM_STATIC
#endif

// Adds no-ops to increase a function's size, preventing automatic inlining
#define NO_INLINE() \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0;        \
    (void)0

// Adds a stack variable in an inline function, which can be used to pad the
// stack after other functions have been inlined
inline void padStack(void) { int pad = 0; }
#define PAD_STACK() padStack()

#ifdef __MWERKS__
#define AT_ADDRESS(xyz) : (xyz)
#define DECL_SECTION(x) __declspec(section x)
#define WEAK __declspec(weak)
#define ASM asm
#else
#define AT_ADDRESS(xyz)
#define DECL_SECTION(x)
#define WEAK
#define ASM
#endif

#define INIT DECL_SECTION(".init")
#define CTORS DECL_SECTION(".ctors")
#define DTORS DECL_SECTION(".dtors")

#endif
