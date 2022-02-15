# Copyright 1994-2002 The MathWorks, Inc.
#
# File    : grt_lcc.tmf   $Revision: 1.26 $
#
# Abstract:
#	Real-Time Workshop template makefile for building a PC-based
#	stand-alone generic real-time version of Simulink model using
#	generated C code and
#			LCC compiler Version 2.4
#
# 	This makefile attempts to conform to the guidelines specified in the
# 	IEEE Std 1003.2-1992 (POSIX) standard. It is designed to be used
#       with GNU Make (gmake) which is located in matlabroot/rtw/bin/win32.
#
# 	Note that this template is automatically customized by the Real-Time
#	Workshop build procedure to create "<model>.mk"
#
#       The following defines can be used to modify the behavior of the
#	build:
#	  OPT_OPTS       - Optimization options. Default is none. To enable 
#                          debugging specify as OPT_OPTS=-g4. 
#	  OPTS           - User specific compile options.
#	  USER_SRCS      - Additional user sources, such as files needed by
#			   S-functions.
#	  USER_INCLUDES  - Additional include paths
#			   (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#			   (For Lcc, have a '/'as file seperator before the 
#			   file name instead of a '\' . 
#			   i.e.,  d:\work\proj1/myfile.c - reqd for 'gmake')
#
#       This template makefile is designed to be used with a system target
#       file that contains 'rtwgensettings.BuildDirSuffix' see grt.tlc

#------------------------ Macros read by make_rtw ------------------------------
#
# The following macros are read by the Real-Time Workshop build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the Real-Time Workshop build procedure
#                    (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = "%MATLAB%\rtw\bin\win32\gmake"
HOST            = PC
BUILD           = yes
SYS_TARGET_FILE = grt.tlc

#---------------------- Tokens expanded by make_rtw ----------------------------
#
# The following tokens, when wrapped with "|>" and "|<" are expanded by the
# Real-Time Workshop build procedure.
#
#  MODEL_NAME          - Name of the Simulink block diagram
#  MODEL_MODULES       - Any additional generated source modules
#  MAKEFILE_NAME       - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT         - Path to were MATLAB is installed.
#  MATLAB_BIN          - Path to MATLAB executable.
#  S_FUNCTIONS         - List of S-functions.
#  S_FUNCTIONS_LIB     - List of S-functions libraries to link. 
#  SOLVER              - Solver source file name
#  NUMST               - Number of sample times
#  TID01EQ             - yes (1) or no (0): Are sampling rates of continuous task
#                        (tid=0) and 1st discrete task equal.
#  NCSTATES            - Number of continuous states
#  BUILDARGS           - Options passed in at the command line.
#  MULTITASKING        - yes (1) or no (0): Is solver mode multitasking
#  EXT_MODE            - yes (1) or no (0): Build for external mode
#  TMW_EXTMODE_TESTING - yes (1) or no (0): Build ext_test.c for external mode
#                        testing.

MODEL                = zftz
MODULES              = zftz_data.c 
MAKEFILE             = zftz.mk
MATLAB_ROOT          = D:\Matlab65
MATLAB_BIN           = D:\Matlab65\bin\win32
S_FUNCTIONS          = 
S_FUNCTIONS_LIB      = 
SOLVER               = ode5.c
NUMST                = 2
TID01EQ              = 1
NCSTATES             = 2
BUILDARGS            = ADD_MDL_NAME_TO_GLOBALS=1
MULTITASKING         = 0
EXT_MODE             = 0
TMW_EXTMODE_TESTING  = 0

#--------------------------- Tool Specifications ------------------------------

LCC = $(MATLAB_ROOT)\sys\lcc
include $(MATLAB_ROOT)\rtw\c\tools\lcctools.mak

#------------------------------ Include Path ----------------------------------

# see MATLAB_INCLUDES and COMPILER_INCLUDES from lcctools.mak

ADD_INCLUDES = \
	-Id:\matlab65\rtw\c\libsrc \


INCLUDES = -I. -I.. $(MATLAB_INCLUDES) $(ADD_INCLUDES) \
           $(COMPILER_INCLUDES) $(USER_INCLUDES)

#----------------------------- External mode -----------------------------------
# Uncomment -DVERBOSE to have information printed to stdout (or specify
# OPTS=-DVERBOSE).

ifeq ($(EXT_MODE),1)
  EXT_SRC     = ext_svr.c updown.c ext_svr_transport.c ext_work.c
  EXT_CC_OPTS = -DEXT_MODE -DWIN32 #-DVERBOSE
  EXT_LIB     = $(MATLAB_ROOT)\sys\lcc\lib\wsock32.lib
  ifeq ($(TMW_EXTMODE_TESTING),1)
    EXT_SRC     += ext_test.c
    EXT_CC_OPTS += -DTMW_EXTMODE_TESTING
  endif
endif

#------------------------ rtModel ----------------------------------------------
RTM_CC_OPTS = -DUSE_RTMODEL

#-------------------------------- C Flags --------------------------------------

# Optimization Options
OPT_OPTS = $(DEFAULT_OPT_OPTS)

# General User Options
OPTS =

# Compiler options, etc:
CC_OPTS = $(OPT_OPTS) $(OPTS) $(ANSI_OPTS) $(EXT_CC_OPTS) $(RTM_CC_OPTS)

CPP_REQ_DEFINES = -DMODEL=$(MODEL) -DRT -DNUMST=$(NUMST) \
                  -DTID01EQ=$(TID01EQ) -DNCSTATES=$(NCSTATES) \
                  -DMT=$(MULTITASKING) -DHAVESTDIO

CFLAGS = $(CC_OPTS) $(CPP_REQ_DEFINES) $(INCLUDES) -noregistrylookup

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
LDFLAGS = -s -L$(LIB)
else
LDFLAGS = -L$(LIB)
endif

#------------------------- Additional Libraries -------------------------------

LIBS =

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
LIBS += $(MATLAB_ROOT)\rtw\c\lib\win32\rtwlib_lcc.lib
else
LIBS += rtwlib.lib
endif 

LIBS += $(EXT_LIB) $(S_FUNCTIONS_LIB)

#----------------------------- Source Files ------------------------------------

REQ_SRCS  = $(MODEL).c $(MODULES) grt_main.c rt_sim.c rt_nonfinite.c \
            $(EXT_SRC) 
USER_SRCS =

USER_OBJS       = $(USER_SRCS:.c=.obj)
LOCAL_USER_OBJS = $(notdir $(USER_OBJS))

SRCS      = $(REQ_SRCS) $(S_FUNCTIONS) $(SOLVER)
OBJS      = $(SRCS:.c=.obj)  $(USER_OBJS)
LINK_OBJS = $(SRCS:.c=.obj) $(LOCAL_USER_OBJS)

PROGRAM   = ../$(MODEL).exe

#--------------------------------- Rules ---------------------------------------

$(PROGRAM) : $(OBJS) $(LIBS)
	$(LD) $(LDFLAGS) -o $@ $(LINK_OBJS) $(LIBS)
	@echo ### Created executable: $(MODEL).exe

%.obj : %.c
	$(CC) -c -Fo$(@F) $(CFLAGS) $<

%.obj : ../%.c
	$(CC) -c -Fo$(@F) -I../$(<F:.c=cn_rtw) $(CFLAGS)  $<

%.obj : $(MATLAB_ROOT)/rtw/c/grt/%.c
	$(CC) -c -Fo$(@F) $(CFLAGS) $<

%.obj : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) -c -Fo$(@F) $(CFLAGS) $<

%.obj : d:\matlab65\rtw\c\libsrc/%.c
	$(CC) -c -Fo$(@F) $(CFLAGS) $<



%.obj : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) -c -Fo$(@F) $(CFLAGS) $<

# Libraries:



MODULES_rtwlib = \
	rt_atan2.obj \
	rt_atan232.obj \
	rt_backsubcc_dbl.obj \
	rt_backsubcc_sgl.obj \
	rt_backsubrc_dbl.obj \
	rt_backsubrc_sgl.obj \
	rt_backsubrr_dbl.obj \
	rt_backsubrr_sgl.obj \
	rt_enab.obj \
	rt_forwardsubcc_dbl.obj \
	rt_forwardsubcc_sgl.obj \
	rt_forwardsubcr_dbl.obj \
	rt_forwardsubcr_sgl.obj \
	rt_forwardsubrc_dbl.obj \
	rt_forwardsubrc_sgl.obj \
	rt_forwardsubrr_dbl.obj \
	rt_forwardsubrr_sgl.obj \
	rt_hypot.obj \
	rt_hypot32.obj \
	rt_i32zcfcn.obj \
	rt_intrp1flatcd.obj \
	rt_intrp1flatcf.obj \
	rt_intrp1flatd.obj \
	rt_intrp1flatf.obj \
	rt_intrp1lincd.obj \
	rt_intrp1lincf.obj \
	rt_intrp1linxd.obj \
	rt_intrp1linxf.obj \
	rt_intrp2flatcd.obj \
	rt_intrp2flatcf.obj \
	rt_intrp2flatd.obj \
	rt_intrp2flatf.obj \
	rt_intrp2lincd.obj \
	rt_intrp2lincf.obj \
	rt_intrp2linxd.obj \
	rt_intrp2linxf.obj \
	rt_intrpnflatcd.obj \
	rt_intrpnflatcf.obj \
	rt_intrpnflatd.obj \
	rt_intrpnflatf.obj \
	rt_intrpnlincd.obj \
	rt_intrpnlincf.obj \
	rt_intrpnlind.obj \
	rt_intrpnlinf.obj \
	rt_intrpnlinxd.obj \
	rt_intrpnlinxf.obj \
	rt_intrpnspld.obj \
	rt_intrpnsplf.obj \
	rt_logging.obj \
	rt_look.obj \
	rt_look1d.obj \
	rt_look1d32.obj \
	rt_look2d32_general.obj \
	rt_look2d32_normal.obj \
	rt_look2d_general.obj \
	rt_look2d_normal.obj \
	rt_look32.obj \
	rt_lookflat1bincsd.obj \
	rt_lookflat1bincsf.obj \
	rt_lookflat1binczd.obj \
	rt_lookflat1binczf.obj \
	rt_lookflat1evncsd.obj \
	rt_lookflat1evncsf.obj \
	rt_lookflat1evnczd.obj \
	rt_lookflat1evnczf.obj \
	rt_lookflat1lincsd.obj \
	rt_lookflat1lincsf.obj \
	rt_lookflat1linczd.obj \
	rt_lookflat1linczf.obj \
	rt_lookflat2bincsd.obj \
	rt_lookflat2bincsf.obj \
	rt_lookflat2binczd.obj \
	rt_lookflat2binczf.obj \
	rt_lookflat2evncsd.obj \
	rt_lookflat2evncsf.obj \
	rt_lookflat2evnczd.obj \
	rt_lookflat2evnczf.obj \
	rt_lookflat2lincsd.obj \
	rt_lookflat2lincsf.obj \
	rt_lookflat2linczd.obj \
	rt_lookflat2linczf.obj \
	rt_lookflatnbincsd.obj \
	rt_lookflatnbincsf.obj \
	rt_lookflatnbinczd.obj \
	rt_lookflatnbinczf.obj \
	rt_lookflatnevncsd.obj \
	rt_lookflatnevncsf.obj \
	rt_lookflatnevnczd.obj \
	rt_lookflatnevnczf.obj \
	rt_lookflatnlincsd.obj \
	rt_lookflatnlincsf.obj \
	rt_lookflatnlinczd.obj \
	rt_lookflatnlinczf.obj \
	rt_looklin1bincsd.obj \
	rt_looklin1bincsf.obj \
	rt_looklin1binczd.obj \
	rt_looklin1binczf.obj \
	rt_looklin1binxsd.obj \
	rt_looklin1binxsf.obj \
	rt_looklin1binxzd.obj \
	rt_looklin1binxzf.obj \
	rt_looklin1evncsd.obj \
	rt_looklin1evncsf.obj \
	rt_looklin1evnczd.obj \
	rt_looklin1evnczf.obj \
	rt_looklin1evnxsd.obj \
	rt_looklin1evnxsf.obj \
	rt_looklin1evnxzd.obj \
	rt_looklin1evnxzf.obj \
	rt_looklin1lincsd.obj \
	rt_looklin1lincsf.obj \
	rt_looklin1linczd.obj \
	rt_looklin1linczf.obj \
	rt_looklin1linxsd.obj \
	rt_looklin1linxsf.obj \
	rt_looklin1linxzd.obj \
	rt_looklin1linxzf.obj \
	rt_looklin2bincsd.obj \
	rt_looklin2bincsf.obj \
	rt_looklin2binczd.obj \
	rt_looklin2binczf.obj \
	rt_looklin2binxsd.obj \
	rt_looklin2binxsf.obj \
	rt_looklin2binxzd.obj \
	rt_looklin2binxzf.obj \
	rt_looklin2evncsd.obj \
	rt_looklin2evncsf.obj \
	rt_looklin2evnczd.obj \
	rt_looklin2evnczf.obj \
	rt_looklin2evnxsd.obj \
	rt_looklin2evnxsf.obj \
	rt_looklin2evnxzd.obj \
	rt_looklin2evnxzf.obj \
	rt_looklin2lincsd.obj \
	rt_looklin2lincsf.obj \
	rt_looklin2linczd.obj \
	rt_looklin2linczf.obj \
	rt_looklin2linxsd.obj \
	rt_looklin2linxsf.obj \
	rt_looklin2linxzd.obj \
	rt_looklin2linxzf.obj \
	rt_looklinnbincsd.obj \
	rt_looklinnbincsf.obj \
	rt_looklinnbinczd.obj \
	rt_looklinnbinczf.obj \
	rt_looklinnbinxsd.obj \
	rt_looklinnbinxsf.obj \
	rt_looklinnbinxzd.obj \
	rt_looklinnbinxzf.obj \
	rt_looklinnevncsd.obj \
	rt_looklinnevncsf.obj \
	rt_looklinnevnczd.obj \
	rt_looklinnevnczf.obj \
	rt_looklinnevnxsd.obj \
	rt_looklinnevnxsf.obj \
	rt_looklinnevnxzd.obj \
	rt_looklinnevnxzf.obj \
	rt_looklinnlincsd.obj \
	rt_looklinnlincsf.obj \
	rt_looklinnlinczd.obj \
	rt_looklinnlinczf.obj \
	rt_looklinnlinxsd.obj \
	rt_looklinnlinxsf.obj \
	rt_looklinnlinxzd.obj \
	rt_looklinnlinxzf.obj \
	rt_looksplnbincsd.obj \
	rt_looksplnbincsf.obj \
	rt_looksplnbinczd.obj \
	rt_looksplnbinczf.obj \
	rt_looksplnbinssd.obj \
	rt_looksplnbinssf.obj \
	rt_looksplnbinszd.obj \
	rt_looksplnbinszf.obj \
	rt_looksplnbinxsd.obj \
	rt_looksplnbinxsf.obj \
	rt_looksplnbinxzd.obj \
	rt_looksplnbinxzf.obj \
	rt_looksplnevncsd.obj \
	rt_looksplnevncsf.obj \
	rt_looksplnevnczd.obj \
	rt_looksplnevnczf.obj \
	rt_looksplnevnssd.obj \
	rt_looksplnevnssf.obj \
	rt_looksplnevnszd.obj \
	rt_looksplnevnszf.obj \
	rt_looksplnevnxsd.obj \
	rt_looksplnevnxsf.obj \
	rt_looksplnevnxzd.obj \
	rt_looksplnevnxzf.obj \
	rt_looksplnlincsd.obj \
	rt_looksplnlincsf.obj \
	rt_looksplnlinczd.obj \
	rt_looksplnlinczf.obj \
	rt_looksplnlinssd.obj \
	rt_looksplnlinssf.obj \
	rt_looksplnlinszd.obj \
	rt_looksplnlinszf.obj \
	rt_looksplnlinxsd.obj \
	rt_looksplnlinxsf.obj \
	rt_looksplnlinxzd.obj \
	rt_looksplnlinxzf.obj \
	rt_lu_cplx.obj \
	rt_lu_cplx_sgl.obj \
	rt_lu_real.obj \
	rt_lu_real_sgl.obj \
	rt_matdivcc_dbl.obj \
	rt_matdivcc_sgl.obj \
	rt_matdivcr_dbl.obj \
	rt_matdivcr_sgl.obj \
	rt_matdivrc_dbl.obj \
	rt_matdivrc_sgl.obj \
	rt_matdivrr_dbl.obj \
	rt_matdivrr_sgl.obj \
	rt_matmultandinccc_dbl.obj \
	rt_matmultandinccc_sgl.obj \
	rt_matmultandinccr_dbl.obj \
	rt_matmultandinccr_sgl.obj \
	rt_matmultandincrc_dbl.obj \
	rt_matmultandincrc_sgl.obj \
	rt_matmultandincrr_dbl.obj \
	rt_matmultandincrr_sgl.obj \
	rt_matmultcc_dbl.obj \
	rt_matmultcc_sgl.obj \
	rt_matmultcr_dbl.obj \
	rt_matmultcr_sgl.obj \
	rt_matmultrc_dbl.obj \
	rt_matmultrc_sgl.obj \
	rt_matmultrr_dbl.obj \
	rt_matmultrr_sgl.obj \
	rt_matrx.obj \
	rt_nrand.obj \
	rt_plookbincd.obj \
	rt_plookbincf.obj \
	rt_plookbinkcd.obj \
	rt_plookbinkcf.obj \
	rt_plookbinxd.obj \
	rt_plookbinxf.obj \
	rt_plookevncd.obj \
	rt_plookevncf.obj \
	rt_plookevnkcd.obj \
	rt_plookevnkcf.obj \
	rt_plookevnxd.obj \
	rt_plookevnxf.obj \
	rt_plooklincd.obj \
	rt_plooklincf.obj \
	rt_plooklinkcd.obj \
	rt_plooklinkcf.obj \
	rt_plooklinxd.obj \
	rt_plooklinxf.obj \
	rt_printf.obj \
	rt_sat_div_int16.obj \
	rt_sat_div_int32.obj \
	rt_sat_div_int8.obj \
	rt_sat_div_uint16.obj \
	rt_sat_div_uint32.obj \
	rt_sat_div_uint8.obj \
	rt_sat_prod_int16.obj \
	rt_sat_prod_int32.obj \
	rt_sat_prod_int8.obj \
	rt_sat_prod_uint16.obj \
	rt_sat_prod_uint32.obj \
	rt_sat_prod_uint8.obj \
	rt_tdelay.obj \
	rt_urand.obj \
	rt_zcfcn.obj \


rtwlib.lib : $(MAKEFILE) rtw_proj.tmw $(MODULES_rtwlib)
	@echo ### Creating $@
	@if exist $@ del $@
	$(LIBCMD) /out:$@ $(MODULES_rtwlib)
	@echo ### Created $@



#----------------------------- Dependencies ------------------------------------

$(OBJS) : $(MAKEFILE) rtw_proj.tmw

#--------- Miscellaneous rules to purge, clean and lint (sol2 only) ------------

purge : clean
	@echo ### Deleting the generated source code for $(MODEL)
	@del $(MODEL).c $(MODEL).h $(MODEL)_types.h $(MODEL)_data.c \
	        $(MODEL)_private.h $(MODEL).rtw $(MODULES) rtw_proj.tmw $(MAKEFILE)

clean :
	@echo ### Deleting the objects and $(PROGRAM)
	@del $(LINK_OBJS) ..\$(MODEL).exe

	@del rtwlib.lib


# EOF: grt_lcc.tmf








