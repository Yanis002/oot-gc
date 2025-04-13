#include "dolphin/demo.h"
#include "dolphin/gx.h"
#include "dolphin/pad.h"
#include "dolphin/types.h"
#include "emulator/frame.h"
#include "emulator/simGCN.h"

static u16 sButtonOrder[18] = {
    PAD_BUTTON_UP,   PAD_BUTTON_UP,    PAD_BUTTON_DOWN, PAD_BUTTON_DOWN,  PAD_BUTTON_LEFT, PAD_BUTTON_RIGHT,
    PAD_BUTTON_LEFT, PAD_BUTTON_RIGHT, PAD_BUTTON_X,    PAD_BUTTON_Y,     PAD_BUTTON_B,    PAD_BUTTON_A,
    PAD_BUTTON_UP,   PAD_BUTTON_LEFT,  PAD_BUTTON_DOWN, PAD_BUTTON_RIGHT, PAD_BUTTON_A,    PAD_BUTTON_START,
};

// clang-format off
static u8 ImportantData[112] = {
    0x07, 
    'C', 'R', 'E', 'D', 'I', 'T', 'S',
    0x01, 0x40, 0x01, 0x40, 0x01, 0x40, 0x0B,
    'E', 'N', 'G', 'I', 'N', 'E', 'E', 'R', 'I', 'N', 'G', 
    0x01, 0x40, 0x01, 0x40, 0x10,
    'R', 'o', 'b', 'e', 'r', 't', ' ', 'C', 'h', 'a', 'm', 'p', 'a', 'g', 'n', 'e', ('\n' + 0x02),
    'D', 'a', 'v', 'i', 'd', ' ', 'D', 'e', 'v', 'a', 't', 'y', ('\n' + 0x03),
    'R', 'o', 'r', 'y', ' ', 'J', 'o', 'h', 'n', 's', 't', 'o', 'n', ('\n' + 0x01),
    'S', 't', 'e', 'p', 'h', 'e', 'n', ' ', 'L', 'e', 'e', ('\n' + 0x02),
    'Y', 'o', 'o', 'n', 'J', 'o', 'o', 'n', ' ', 'L', 'e', 'e', ('\n' + 0x01),
    'M', 'a', 'x', ' ', 'S', 'z', 'l', 'a', 'g', 'o', 'r', '\0',
};
// clang-format on

extern u8 special_data[];

static u16 sCurrButton;

#define BUTTON_COMBO_HOLD (PAD_TRIGGER_Z | PAD_TRIGGER_R | PAD_TRIGGER_L)

static void DrawStuff(u8* dataP, s32 y) {
    // Parameters
    // u8* dataP; // r30
    // s32 y; // r31

    // Local variables
    s32 i; // r1+0x8
    s32 length; // r27
    s32 x; // r7
    f32 tx; // f3
    s32 id; // r1+0x8

    f32 temp_f2;
    f32 temp_f31;
    s32 temp_r0;
    u8* var_r30;
    s32 temp_r3;
    s32 temp_r6;

    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
    GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_TEX_ST, GX_RGBA6, 0U);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_RGBA6, 0U);
    length = *dataP;
    temp_f31 = 0.016949153f;

    while (length > 0) {
        GXBegin(GX_QUADS, GX_VTXFMT0, (length * 4) & 0xFFFC);
        var_r30 = dataP + 1;
        i = length;
        temp_r6 = N64_FRAME_WIDTH - (length * 8);
        temp_r0 = y + 8;
        x = temp_r6 / 2;

        for (i = 0; i < length; i++) {
            temp_r3 = x + 8;
            temp_r6 = *var_r30 - 0x40;
            var_r30 += 1;
            x += 8;
            GXPosition2f32(x, y);
            tx = temp_r6 * temp_f31;
            temp_f2 = tx + temp_f31;
            GXPosition2f32(0.0f, tx);
            GXPosition2f32(0.0f, temp_r3);
            GXPosition2f32(y, 0.0f);
            GXPosition2f32(temp_f2, 0.0f);
            GXPosition2f32(temp_r3, temp_r0);
            GXPosition2f32(0.0f, temp_f2);
            GXPosition2f32(1.0f, x);
            GXPosition2f32(temp_r0, 0.0f);
            GXPosition2f32(tx, 1.0f);
        }

        length = *var_r30;
        y += 8;
        var_r30 += 1;
    }

    GXPixModeSync();
}

static void DrawSpecialScreen() {
    GXColor color;
    Mtx matrix;
    static GXTexObj texObj;
    static GXTexObj texObj2;
    s32 pad[12];

    while (frameBeginOK(gpFrame) != 1) {}
    xlCoreBeforeRender();
    frameDrawSetup2D(gpFrame);

    // draw background
    GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
    GXSetZCompLoc(GX_TRUE);
    GXSetNumTevStages(1);
    GXSetNumChans(1);
    GXSetNumTexGens(0);
    color.r = 0;
    color.g = 0;
    color.b = 0;
    color.a = 255;
    GXSetTevColor(GX_TEVREG0, color);
    GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_C0);
    GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR_NULL);
    GXSetBlendMode(GX_BM_NONE, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_NOOP);
    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_TEX_ST, GX_RGBA6, 0);
    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
    GXPosition3f32(0.0f, 0.0f, 0.0f);
    GXPosition3f32(N64_FRAME_WIDTH, 0.0f, 0.0f);
    GXPosition3f32(N64_FRAME_WIDTH, N64_FRAME_HEIGHT, 0.0f);
    GXPosition3f32(0.0f, N64_FRAME_HEIGHT, 0.0f);
    GXEnd();

    // draw text
    color.r = 255;
    color.g = 255;
    color.b = 255;
    color.a = 255;
    GXSetNumTevStages(1);
    GXSetNumChans(0);
    GXSetNumTexGens(1);
    GXSetTevColor(GX_TEVREG0, color);
    GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_C0, GX_CC_ZERO);
    GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_A0);
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_NOOP);
    GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
    GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
    GXSetZCompLoc(GX_TRUE);
    PSMTXIdentity(matrix);
    GXLoadTexMtxImm(matrix, 0x1E, GX_MTX2x4);
    GXInitTexObj(&texObj, special_data, 472, 8, GX_TF_I4, GX_CLAMP, GX_CLAMP, GX_FALSE);
    GXInitTexObjLOD(&texObj, GX_NEAR, GX_NEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    GXLoadTexObj(&texObj, GX_TEXMAP0);
    DrawStuff(ImportantData, 30);
    gpFrame->nMode = 0;
    gpFrame->nModeVtx = -1;
    frameDrawReset(gpFrame, 0x5FFED);
    simulatorDEMODoneRender();
}

void UpdateSpecial(void) {
    // static u16 lastButtons;

    // Local variables
    u16 buttons; // r30
    u16 pressed; // r5
    s32 pad;
    static u16 lastButtons;

    // References
    // -> static u16 lastButtons_156;
    // -> struct __anon_0x94E61 DemoPad[4];
    // -> static u16 sCurrButton;
    // -> static u16 sButtonOrder[18];

    u16 temp_r3;

    temp_r3 = DemoPad->pst.button & (lastButtons ^ DemoPad->pst.button);
    buttons = DemoPad->pst.button;

    if ((DemoPad->pst.button & BUTTON_COMBO_HOLD) == BUTTON_COMBO_HOLD) {
        if (temp_r3 == sButtonOrder[sCurrButton]) {
            sCurrButton += 1;
        } else if (temp_r3 != 0) {
            sCurrButton = 0;
        }
    } else {
        sCurrButton = 0;
        buttons = 0;
    }

    if (sCurrButton == ARRAY_COUNT(sButtonOrder)) {
        while (true) {
            DEMOPadRead();
            pressed = DemoPad->pst.button & (lastButtons ^ DemoPad->pst.button);
            DrawSpecialScreen();

            if (pressed & 0x200) {
                break;
            }

            lastButtons = buttons;
        }
    }

    lastButtons = buttons;
}
