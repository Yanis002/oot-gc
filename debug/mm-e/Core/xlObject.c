/*
    Compile unit: c:\HOMEBOY\STEPHEN\Emulator\Core\xlObject.c
    Producer: MW EABI PPC C-Compiler
    Language: C++
    Code range: 0x80008080 -> 0x80008440
*/

#include "types.h"

typedef struct tXL_LIST {
    /* 0x0 */ s32 nItemSize;
    /* 0x4 */ s32 nItemCount;
    /* 0x8 */ void* pNodeHead;
    /* 0xC */ void* pNodeNext;
} __anon_0x640F; // size = 0x10

// size = 0x4, address = 0x8012FCE8
static struct tXL_LIST* gpListData;

typedef struct _XL_OBJECTTYPE {
    /* 0x0 */ char* szName;
    /* 0x4 */ s32 nSizeObject;
    /* 0x8 */ struct _XL_OBJECTTYPE* pClassBase;
    /* 0xC */ s32 (* pfEvent)(void*, s32, void*);
} __anon_0x6538; // size = 0x10

typedef struct __anon_0x6602 {
    /* 0x0 */ struct tXL_LIST* pList;
    /* 0x4 */ struct _XL_OBJECTTYPE* pType;
} __anon_0x6602; // size = 0x8

// Erased
static s32 xlObjectFindData(struct __anon_0x6602** ppData, struct _XL_OBJECTTYPE* pType) {
    // Parameters
    // struct __anon_0x6602** ppData; // r1+0x0
    // struct _XL_OBJECTTYPE* pType; // r1+0x4

    // Local variables
    void* pListNode; // r6

    // References
    // -> static struct tXL_LIST* gpListData;
}

// Erased
static s32 xlObjectMakeData(struct __anon_0x6602** ppData, struct _XL_OBJECTTYPE* pType) {
    // Parameters
    // struct __anon_0x6602** ppData; // r30
    // struct _XL_OBJECTTYPE* pType; // r31

    // References
    // -> static struct tXL_LIST* gpListData;
}

// Range: 0x800082E4 -> 0x80008440
s32 xlObjectMake(void* ppObject, void* pArgument, struct _XL_OBJECTTYPE* pType) {
    // Parameters
    // void* ppObject; // r28
    // void* pArgument; // r29
    // struct _XL_OBJECTTYPE* pType; // r30

    // Local variables
    s32 bFlag; // r31
    struct __anon_0x6602* pData; // r1+0x14

    // References
    // -> static struct tXL_LIST* gpListData;
}

// Range: 0x8000824C -> 0x800082E4
s32 xlObjectFree(void* ppObject) {
    // Parameters
    // void* ppObject; // r30

    // Local variables
    struct __anon_0x6602* pData; // r31
}

// Range: 0x800081E4 -> 0x8000824C
s32 xlObjectTest(void* pObject, struct _XL_OBJECTTYPE* pType) {
    // Parameters
    // void* pObject; // r1+0x8
    // struct _XL_OBJECTTYPE* pType; // r30

    // Local variables
    struct __anon_0x6602* pData; // r31

    // References
    // -> static struct tXL_LIST* gpListData;
}

// Erased
static s32 xlObjectFindType(void* pObject, struct _XL_OBJECTTYPE** ppType) {
    // Parameters
    // void* pObject; // r1+0x8
    // struct _XL_OBJECTTYPE** ppType; // r30

    // Local variables
    struct __anon_0x6602* pData; // r31

    // References
    // -> static struct tXL_LIST* gpListData;
}

// Range: 0x8000812C -> 0x800081E4
s32 xlObjectEvent(void* pObject, s32 nEvent, void* pArgument) {
    // Parameters
    // void* pObject; // r26
    // s32 nEvent; // r27
    // void* pArgument; // r28

    // Local variables
    struct __anon_0x6602* pData; // r29

    // References
    // -> static struct tXL_LIST* gpListData;
}

// Range: 0x800080F0 -> 0x8000812C
s32 xlObjectSetup() {
    // References
    // -> static struct tXL_LIST* gpListData;
}

// Range: 0x80008080 -> 0x800080F0
s32 xlObjectReset() {
    // Local variables
    struct __anon_0x6602* pData; // r3
    void* pListNode; // r31

    // References
    // -> static struct tXL_LIST* gpListData;
}
