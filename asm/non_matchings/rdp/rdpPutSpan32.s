glabel rdpPutSpan32
/* 06AB54 800700F4 5480073E */  clrlwi  r0, r4, 0x1c
/* 06AB58 800700F8 2800000C */  cmplwi  r0, 0xc
/* 06AB5C 800700FC 41810054 */  bgt     lbl_80070150
/* 06AB60 80070100 3C80800F */  lis     r4, jtbl_800EDF90@ha
/* 06AB64 80070104 3884DF90 */  addi    r4, r4, jtbl_800EDF90@l
/* 06AB68 80070108 5400103A */  slwi    r0, r0, 2
/* 06AB6C 8007010C 7C04002E */  lwzx    r0, r4, r0
/* 06AB70 80070110 7C0903A6 */  mtctr   r0
/* 06AB74 80070114 4E800420 */  bctr    
.global lbl_80070118
lbl_80070118:
/* 06AB78 80070118 80050000 */  lwz     r0, 0(r5)
/* 06AB7C 8007011C 5400057E */  clrlwi  r0, r0, 0x15
/* 06AB80 80070120 90030000 */  stw     r0, 0(r3)
/* 06AB84 80070124 4800002C */  b       lbl_80070150
.global lbl_80070128
lbl_80070128:
/* 06AB88 80070128 80050000 */  lwz     r0, 0(r5)
/* 06AB8C 8007012C 540007FE */  clrlwi  r0, r0, 0x1f
/* 06AB90 80070130 9003000C */  stw     r0, 0xc(r3)
/* 06AB94 80070134 4800001C */  b       lbl_80070150
.global lbl_80070138
lbl_80070138:
/* 06AB98 80070138 80050000 */  lwz     r0, 0(r5)
/* 06AB9C 8007013C 5400067E */  clrlwi  r0, r0, 0x19
/* 06ABA0 80070140 90030014 */  stw     r0, 0x14(r3)
/* 06ABA4 80070144 4800000C */  b       lbl_80070150
.global lbl_80070148
lbl_80070148:
/* 06ABA8 80070148 80050000 */  lwz     r0, 0(r5)
/* 06ABAC 8007014C 90030010 */  stw     r0, 0x10(r3)
.global lbl_80070150
lbl_80070150:
/* 06ABB0 80070150 38600001 */  li      r3, 1
/* 06ABB4 80070154 4E800020 */  blr     

.section .data

jtbl_800EDF90:
    .word lbl_80070118
    .word lbl_80070150
    .word lbl_80070150
    .word lbl_80070150
    .word lbl_80070128
    .word lbl_80070150
    .word lbl_80070150
    .word lbl_80070150
    .word lbl_80070138
    .word lbl_80070150
    .word lbl_80070150
    .word lbl_80070150
    .word lbl_80070148
