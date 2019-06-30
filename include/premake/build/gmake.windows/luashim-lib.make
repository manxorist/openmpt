# GNU Make project makefile autogenerated by Premake

ifndef config
  config=release_x86
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),release_x86)
  RESCOMP = windres
  TARGETDIR = bin/x86/Release
  TARGET = $(TARGETDIR)/luashim-lib.lib
  OBJDIR = obj/x86/Release/luashim-lib
  DEFINES += -DPREMAKE_COMPRESSION -DCURL_STATICLIB -DPREMAKE_CURL -DNDEBUG
  INCLUDES += -I../../contrib/lua/src
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -flto -O3 -fPIC -Wall -Wextra
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -flto -O3 -fPIC -Wall -Wextra -fno-stack-protector
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -flto -s
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  RESCOMP = windres
  TARGETDIR = bin/x64/Release
  TARGET = $(TARGETDIR)/luashim-lib.lib
  OBJDIR = obj/x64/Release/luashim-lib
  DEFINES += -DPREMAKE_COMPRESSION -DCURL_STATICLIB -DPREMAKE_CURL -DNDEBUG
  INCLUDES += -I../../contrib/lua/src
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -flto -O3 -fPIC -Wall -Wextra
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -flto -O3 -fPIC -Wall -Wextra -fno-stack-protector
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -flto -s
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x86)
  RESCOMP = windres
  TARGETDIR = bin/x86/Debug
  TARGET = $(TARGETDIR)/luashim-lib.lib
  OBJDIR = obj/x86/Debug/luashim-lib
  DEFINES += -DPREMAKE_COMPRESSION -DCURL_STATICLIB -DPREMAKE_CURL -D_DEBUG
  INCLUDES += -I../../contrib/lua/src
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -fPIC -g -Wall -Wextra
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -fPIC -g -Wall -Wextra
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x64)
  RESCOMP = windres
  TARGETDIR = bin/x64/Debug
  TARGET = $(TARGETDIR)/luashim-lib.lib
  OBJDIR = obj/x64/Debug/luashim-lib
  DEFINES += -DPREMAKE_COMPRESSION -DCURL_STATICLIB -DPREMAKE_CURL -D_DEBUG
  INCLUDES += -I../../contrib/lua/src
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -fPIC -g -Wall -Wextra
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -fPIC -g -Wall -Wextra
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/luashim.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES) | $(TARGETDIR)
	@echo Linking luashim-lib
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(CUSTOMFILES): | $(OBJDIR)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning luashim-lib
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH) | $(OBJDIR)
$(GCH): $(PCH) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
else
$(OBJECTS): | $(OBJDIR)
endif

$(OBJDIR)/luashim.o: ../../contrib/luashim/luashim.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif