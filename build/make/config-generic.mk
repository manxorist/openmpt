
$(warning warning: CONFIG=generic is deprecated. Use CONFIG=standard instead.)

CC  ?= cc 
CXX ?= c++
LD  ?= $(CXX)
AR  ?= ar

CXXFLAGS_STDCXX = -std=c++17
CFLAGS_STDC = -std=c99
CXXFLAGS += $(CXXFLAGS_STDCXX)
CFLAGS += $(CFLAGS_STDC)

CPPFLAGS += 
CXXFLAGS += 
CFLAGS   += 
LDFLAGS  += 
LDLIBS   += 
ARFLAGS  := rcs

MPT_COMPILER_GENERIC=1
SHARED_LIB=0
DYNLINK=0

EXESUFFIX=

