NON_MATCHING := 1
VERSION := ce-j

# either mwcc or gcc
COMPILER := gcc

#-------------------------------------------------------------------------------
# Files
#-------------------------------------------------------------------------------

TARGET := oot-gcc

BUILD_DIR := build/gcc

SRC_DIRS := $(shell find src -type d)
ASM_DIRS := $(shell find asm -type d -not -path "asm/non_matchings*")

C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
CPP_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.cpp))

# Inputs
LDSCRIPT := $(BUILD_DIR)/ldscript.lcf

# Outputs
ELF := $(BUILD_DIR)/$(TARGET).elf
MAP := $(ELF:.elf=.map)
DOL := $(ELF:.elf=.dol)

# Object files in link order
include obj_files.mk

#-------------------------------------------------------------------------------
# Tools
#-------------------------------------------------------------------------------

MWCC_VERSION := GC/3.0a5.2

# revision build year, 2002 for MQ, 2003 for CE
DOLPHIN_REVISION := 2003

# Programs
ifeq ($(OS),Windows_NT)
	WINE := 
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		WINE := build/tools/wibo
	else ifeq ($(UNAME_S),Darwin)
		WINE := wine
	else
		$(error Unknown OS: $(OS))
	endif
endif

ifneq ($(strip $(DEVKITPPC)),)
PPC_BIN_PREFIX      = $(DEVKITPPC)/bin/powerpc-eabi-
else
PPC_BIN_PREFIX      = powerpc-eabi-
endif

AS := $(PPC_BIN_PREFIX)as
OBJCOPY := $(PPC_BIN_PREFIX)objcopy
OBJDUMP := $(PPC_BIN_PREFIX)objdump

INCLUDES := -Iinclude -Ilibc -Ibuild/$(VERSION)/include -Isrc

MWCC_DIR := build/compilers/$(MWCC_VERSION)
MWCC_CC := $(WINE) $(MWCC_DIR)/mwcceppc.exe
MWCC_LD := $(WINE) $(MWCC_DIR)/mwldeppc.exe
MWCC_ASFLAGS := -mgekko -I include -I libc
MWCC_LDFLAGS := -map $(MAP) -fp hardware -nodefaults -warn off
MWCC_CFLAGS := -c -Cpp_exceptions off -proc gekko -fp hardware -fp_contract on -enum int -align powerpc -nosyspath -RTTI off -str reuse -enc SJIS -O4,p -sym on -nodefaults -msgstyle gcc $(INCLUDES) -DVERSION=CE_J -inline auto

ifeq ($(COMPILER),gcc)
CC := $(PPC_BIN_PREFIX)gcc
LD := $(CC)

ASFLAGS := -mgekko -I include -I libc
LDFLAGS := -T libs/common_symbols.txt -specs=nosys.specs -Wl,--gc-sections,--section-start,.init=0x80003100 -Wl,-Map=$(MAP)
CFLAGS := -c -mcpu=750 -meabi -mhard-float -O3 -ffreestanding -ffunction-sections -fdata-sections -DVERSION=CE_J $(INCLUDES)
else
CC := $(MWCC_CC)
LD := $(MWCC_LD)
ASFLAGS := $(MWCC_ASFLAGS)
LDFLAGS := $(MWCC_LDFLAGS)
CFLAGS := $(MWCC_CFLAGS)
endif

PYTHON := python3

ELF2DOL := build/tools/dtk elf2dol
# POSTPROC := tools/postprocess.py

CFLAGS += -DNON_MATCHING

CC_CHECK := gcc
CC_CHECK_FLAGS := -fno-builtin -fsyntax-only -std=gnu99 -I include -I libc $(CC_CHECK_WARNINGS) -DNON_MATCHING -DDOLPHIN_REV=$(DOLPHIN_REVISION)
CC_CHECK_WARNINGS := \
	-Wall \
	-Wextra \
	-Werror=strict-prototypes \
	-Werror=implicit-function-declaration \
	-Wno-cast-function-type \
	-Wno-incompatible-pointer-types \
	-Wno-pointer-to-int-cast \
	-Wno-return-type \
	-Wno-sequence-point \
	-Wno-sign-compare \
	-Wno-unknown-pragmas \
	-Wno-unused-but-set-variable \
	-Wno-unused-function \
	-Wno-unused-parameter \
	-Wno-unused-variable

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

### Default target ###

default: all

# Compare to the checksum of a stripped original
all: $(ELF)

# setup:
# # Build/download tools
# 	$(MAKE) -C tools
# # Patch linker
# 	tools/patch_linker.sh $(MWCC_DIR)/mwldeppc.exe
# # Strip debugging sections and .mwcats.text section so only the important sections remain
# # Tested to ensure it doesn't crash at least on Dolphin
# 	$(OBJCOPY) SIM_original.elf SIM.elf -R .mwcats.text -g
# # Copy again to strip symbols since we don't want to diff those
# 	$(OBJCOPY) SIM.elf SIM_S.elf -S

clean:
	rm -f -r $(BUILD_DIR)

distclean: clean	

format:
	find include libc src -name '*.h' -o -name '*.c' -o -name '*.hpp' -o -name '*.cpp' | xargs clang-format-18 -i

# Note: this is meant for testing/modding purposes as a dol is easier to package and run than the original elf
dol: all $(DOL)

.PHONY: all setup clean format dol distclean

ALL_DIRS := build $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS))

# Make sure build directory exists before compiling anything
DUMMY != mkdir -p $(ALL_DIRS)

ifeq ($(COMPILER),gcc)
$(ELF): $(O_FILES) build.ld
	$(LD) $(LDFLAGS) -o $@ -T build.ld $(O_FILES) 
else
$(ELF): $(O_FILES) ldscript.lcf
	$(LD) $(LDFLAGS) -o $@ -lcf ldscript.lcf $(O_FILES)
endif

$(DOL): $(ELF)
	$(ELF2DOL) $< $@

# compile the files with inline asm using mwcc
ifeq ($(COMPILER),gcc)
$(BUILD_DIR)/src/emulator/simGCN.o: src/emulator/simGCN.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/ai/ai.o: src/dolphin/ai/ai.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/base/PPCArch.o: src/dolphin/base/PPCArch.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/db/db.o: src/dolphin/db/db.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/gx/GXTransform.o: src/dolphin/gx/GXTransform.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/mtx/mtx.o: src/dolphin/mtx/mtx.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/mtx/mtx44.o: src/dolphin/mtx/mtx44.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/mtx/mtxvec.o: src/dolphin/mtx/mtxvec.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/os/%.o: src/dolphin/os/%.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/dolphin/thp/THPDec.o: src/dolphin/thp/THPDec.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/metrotrk/dolphin_trk_glue.o: src/metrotrk/dolphin_trk_glue.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/metrotrk/dolphin_trk.o: src/metrotrk/dolphin_trk.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/metrotrk/flush_cache.o: src/metrotrk/flush_cache.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/metrotrk/mpc_7xx_603e.o: src/metrotrk/mpc_7xx_603e.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/metrotrk/targimpl.o: src/metrotrk/targimpl.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<

$(BUILD_DIR)/src/runtime/runtime.o: src/runtime/runtime.c
	$(MWCC_CC) $(MWCC_CFLAGS) -o $@ $<
endif

$(BUILD_DIR)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ $<
