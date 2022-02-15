/*
 * zftz_private.h
 *
 * Real-Time Workshop code generation for Simulink model "zftz.mdl".
 *
 * Model Version                        : 1.37
 * Real-Time Workshop file version      : 5.0 $Date: 2002/05/30 19:21:33 $
 * Real-Time Workshop file generated on : Tue Jun 18 14:05:45 2013
 * TLC version                          : 5.0 (Jun 18 2002)
 * C source code generated on           : Tue Jun 18 14:05:45 2013
 */

#ifndef _RTW_HEADER_zftz_private_h_
# define _RTW_HEADER_zftz_private_h_

#ifndef _RTW_COMMON_DEFINES_
# define _RTW_COMMON_DEFINES_

#ifndef TRUE
# define TRUE (1)
#endif
#ifndef FALSE
# define FALSE (0)
#endif
#endif                                  /* _RTW_COMMON_DEFINES_ */

#ifndef UCHAR_MAX
#include <limits.h>
#endif

#if ( UCHAR_MAX != (0xFFU) )
#error Fixed point code was generated for compiler with different sized uchars.
#endif

#if ( SCHAR_MAX != (0x7F) )
#error Fixed point code was generated for compiler with different sized chars.
#endif

#if ( USHRT_MAX != (0xFFFFU) )
#error Fixed point code was generated for compiler with different sized ushorts.
#endif

#if ( SHRT_MAX != (0x7FFF) )
#error Fixed point code was generated for compiler with different sized shorts.
#endif

#if ( UINT_MAX != (0xFFFFFFFFU) )
#error Fixed point code was generated for compiler with different sized uints.
#endif

#if ( INT_MAX != (0x7FFFFFFF) )
#error Fixed point code was generated for compiler with different sized ints.
#endif

#if ( ULONG_MAX != (0xFFFFFFFFU) )
#error Fixed point code was generated for compiler with different sized ulongs.
#endif

#if ( LONG_MAX != (0x7FFFFFFF) )
#error Fixed point code was generated for compiler with different sized longs.
#endif

#if defined(MULTITASKING)
# error Model (zftz) was built in \
  SingleTasking solver mode, however the MULTITASKING define is \
  present. If you have multitasking (e.g. -DMT or -DMULTITASKING) \
  defined on the RTW page of Simulation parameter dialog, please \
  remove it and on the Solver page, select solver mode \
  MultiTasking. If the Simulation parameter dialog is configured \
  correctly, please verify that your template makefile is \
  configured correctly.
#endif

#endif                                  /* _RTW_HEADER_zftz_private_h_ */
