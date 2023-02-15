# VAR SECTION
COMPILER_NAME = fbc
SOURCE_NAME = main.bas
SOURCE_NAME2 = ../HookEngine.bas
BUILD_DIR = .\build\\
TARGET_NAME_64 = main_win64.exe
TARGET_NAME_32 = main_win32.exe
#############

all: clean create_build_dir m64 m32 m64_debug m32_debug run
	@echo _________________
	@echo done.

m64:
	@echo *BUILD* [TARGET: M64 / $(SOURCE_NAME) -- $(TARGET_NAME_64)]
	@$(COMPILER_NAME)64 $(SOURCE_NAME) $(SOURCE_NAME2) -x "$(BUILD_DIR)$(TARGET_NAME_64)"
	
m32:
	@echo *BUILD* [TARGET: M32 / $(SOURCE_NAME) -- $(TARGET_NAME_32)]
	@$(COMPILER_NAME)32 $(SOURCE_NAME) $(SOURCE_NAME2) -x "$(BUILD_DIR)$(TARGET_NAME_32)"
	
m64_debug:
	@echo *BUILD* [TARGET: M64-DEBUG / $(SOURCE_NAME) -- debug_$(TARGET_NAME_64)]
	@$(COMPILER_NAME)64 $(SOURCE_NAME) $(SOURCE_NAME2) -x "$(BUILD_DIR)debug_$(TARGET_NAME_64)" -g
	
m32_debug:
	@echo *BUILD* [TARGET: M32-DEBUG / $(SOURCE_NAME) -- debug_$(TARGET_NAME_32)]
	@$(COMPILER_NAME)32 $(SOURCE_NAME) $(SOURCE_NAME2) -x "$(BUILD_DIR)debug_$(TARGET_NAME_32)" -g


clean:
	@echo *CLEAN* [TARGET: CLEAN / $(BUILD_DIR)]
	@if exist $(BUILD_DIR) @rd $(BUILD_DIR) /S /Q

create_build_dir:
	@echo *CLEAN* [TARGET: CREATE / $(BUILD_DIR)]
	@if not exist $(BUILD_DIR) mkdir $(BUILD_DIR)

run64:
	@echo .....................................
	@echo *RUN* [TARGET: M64 / $(BUILD_DIR)$(TARGET_NAME_64)]
	@$(BUILD_DIR)$(TARGET_NAME_64)

run32:
	@echo .....................................
	@echo *RUN* [TARGET: M32 / $(BUILD_DIR)$(TARGET_NAME_32)]
	@$(BUILD_DIR)$(TARGET_NAME_32)

run64_debug:
	@echo .....................................
	@echo *RUN* [TARGET: M64-DEBUG / $(BUILD_DIR)debug_$(TARGET_NAME_64)]
	@$(BUILD_DIR)debug_$(TARGET_NAME_64)

run32_debug:
	@echo .....................................
	@echo *RUN* [TARGET: M32-DEBUG / $(BUILD_DIR)debug_$(TARGET_NAME_32)]
	@$(BUILD_DIR)debug_$(TARGET_NAME_32)

run: run64 run32 run64_debug run32_debug