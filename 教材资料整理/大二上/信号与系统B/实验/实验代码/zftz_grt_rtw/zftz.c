/*
 * Real-Time Workshop code generation for Simulink model "zftz.mdl".
 *
 * Model Version                        : 1.37
 * Real-Time Workshop file version      : 5.0 $Date: 2002/05/30 19:21:33 $
 * Real-Time Workshop file generated on : Tue Jun 18 14:05:45 2013
 * TLC version                          : 5.0 (Jun 18 2002)
 * C source code generated on           : Tue Jun 18 14:05:45 2013
 */

#include <math.h>
#include <string.h>
#include "zftz.h"
#include "zftz_private.h"

/* Block signals (auto storage) */
BlockIO rtB;

/* Continuous states */
ContinuousStates rtX;

/* Block states (auto storage) */
D_Work rtDWork;

/* Parent Simstruct */
static rtModel_zftz model_S;
rtModel_zftz *const rtM_zftz = &model_S;

/* Initial conditions for root system: '<Root>' */
void MdlInitialize(void)
{

  /* TransferFcn Block: <Root>/µÍÍ¨ÂË²¨Æ÷ */
  rtX.id_e_CSTATE[0] = 0.0;
  rtX.id_e_CSTATE[1] = 0.0;
}

/* Start for root system: '<Root>' */
void MdlStart(void)
{
  MdlInitialize();
}

/* Outputs for root system: '<Root>' */
void MdlOutputs(int_T tid)
{
  /* local block i/o variables */
  real_T rtb_id_a;

  if (rtmIsContinuousTask(rtM_zftz, tid)) { /* Sample time: [0.0, 0.0] */

    /* Sin: '<Root>/µ÷ÖÆÐÅºÅ' */

    rtb_id_a = rtP.id_a_Amp *
      sin(rtP.id_a_Freq * rtmGetTaskTime(rtM_zftz, tid) + rtP.id_a_Phase) +
      rtP.id_a_Bias;

    /* Sum: '<Root>/Sum' incorporates:
     *   Constant: '<Root>/³£Á¿'
     */
    rtB.Sum = rtb_id_a + rtP.id_b_Value;

    /* Sin: '<Root>/ÔØ²¨' */

    rtB.id_c = rtP.id_c_Amp *
      sin(rtP.id_c_Freq * rtmGetTaskTime(rtM_zftz, tid) + rtP.id_c_Phase) +
      rtP.id_c_Bias;

    /* Product: '<Root>/³Ë·¨Æ÷' */
    rtB.id_d = rtB.Sum * rtB.id_c;

    /* TransferFcn Block: <Root>/µÍÍ¨ÂË²¨Æ÷ */
    rtB.id_e = rtP.id_e_C[0]*rtX.id_e_CSTATE[0] +
      rtP.id_e_C[1]*rtX.id_e_CSTATE[1];

    /* Product: '<Root>/³Ë·¨Æ÷1' */
    rtB.id_g = rtB.id_d * rtB.id_c;
  }
}

/* Update for root system: '<Root>' */
void MdlUpdate(int_T tid)
{
}

/* Derivatives for root system: '<Root>' */
void MdlDerivatives(void)
{
  /* simstruct variables */
  StateDerivatives *rtXdot = (StateDerivatives*) rtM_zftz->ModelData.derivs;

  /* TransferFcn Block: <Root>/µÍÍ¨ÂË²¨Æ÷ */
  {

    rtXdot->id_e_CSTATE[0] = rtB.id_g;
    rtXdot->id_e_CSTATE[0] += (rtP.id_e_A[0])*rtX.id_e_CSTATE[0] +
      (rtP.id_e_A[1])*rtX.id_e_CSTATE[1];
    rtXdot->id_e_CSTATE[1] = rtX.id_e_CSTATE[0];
  }
}

/* Projection for root system: '<Root>' */
void MdlProjection(void)
{
}

/* Terminate for root system: '<Root>' */
void MdlTerminate(void)
{
  if(rtM_zftz != NULL) {
  }
}

/* Function to initialize sizes */
void MdlInitializeSizes(void)
{
  rtM_zftz->Sizes.numContStates = (2); /* Number of continuous states */
  rtM_zftz->Sizes.numY = (0);           /* Number of model outputs */
  rtM_zftz->Sizes.numU = (0);           /* Number of model inputs */
  rtM_zftz->Sizes.sysDirFeedThru = (0); /* The model is not direct feedthrough */
  rtM_zftz->Sizes.numSampTimes = (2);   /* Number of sample times */
  rtM_zftz->Sizes.numBlocks = (8);      /* Number of blocks */
  rtM_zftz->Sizes.numBlockIO = (5);     /* Number of block outputs */
  rtM_zftz->Sizes.numBlockPrms = (13); /* Sum of parameter "widths" */
}

/* Function to initialize sample times */
void MdlInitializeSampleTimes(void)
{
  /* task periods */
  rtM_zftz->Timing.sampleTimes[0] = (0.0);
  rtM_zftz->Timing.sampleTimes[1] = (0.00001);

  /* task offsets */
  rtM_zftz->Timing.offsetTimes[0] = (0.0);
  rtM_zftz->Timing.offsetTimes[1] = (0.0);
}

/* Function to register the model */
rtModel_zftz *zftz(void)
{
  (void)memset((char *)rtM_zftz, 0, sizeof(rtModel_zftz));

  {
    /* Setup solver object */
    static RTWSolverInfo rt_SolverInfo;
    rtM_zftz->solverInfo = (&rt_SolverInfo);

    rtsiSetSimTimeStepPtr(rtM_zftz->solverInfo, &rtM_zftz->Timing.simTimeStep);
    rtsiSetTPtr(rtM_zftz->solverInfo, &rtmGetTPtr(rtM_zftz));
    rtsiSetStepSizePtr(rtM_zftz->solverInfo, &rtM_zftz->Timing.stepSize);
    rtsiSetdXPtr(rtM_zftz->solverInfo, &rtM_zftz->ModelData.derivs);
    rtsiSetContStatesPtr(rtM_zftz->solverInfo, &rtM_zftz->ModelData.contStates);
    rtsiSetNumContStatesPtr(rtM_zftz->solverInfo,
     &rtM_zftz->Sizes.numContStates);
    rtsiSetErrorStatusPtr(rtM_zftz->solverInfo, &rtmGetErrorStatus(rtM_zftz));

    rtsiSetRTModelPtr(rtM_zftz->solverInfo, rtM_zftz);
  }

  /* timing info */
  {
    static time_T mdlPeriod[NSAMPLE_TIMES];
    static time_T mdlOffset[NSAMPLE_TIMES];
    static time_T mdlTaskTimes[NSAMPLE_TIMES];
    static int_T mdlTsMap[NSAMPLE_TIMES];
    static int_T mdlSampleHits[NSAMPLE_TIMES];

    {
      int_T i;

      for(i = 0; i < NSAMPLE_TIMES; i++) {
        mdlPeriod[i] = 0.0;
        mdlOffset[i] = 0.0;
        mdlTaskTimes[i] = 0.0;
      }
    }
    (void)memset((char_T *)&mdlTsMap[0], 0, 2 * sizeof(int_T));
    (void)memset((char_T *)&mdlSampleHits[0], 0, 2 * sizeof(int_T));

    rtM_zftz->Timing.sampleTimes = (&mdlPeriod[0]);
    rtM_zftz->Timing.offsetTimes = (&mdlOffset[0]);
    rtM_zftz->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    rtmSetTPtr(rtM_zftz, &mdlTaskTimes[0]);
    rtM_zftz->Timing.sampleHits = (&mdlSampleHits[0]);
  }
  rtsiSetSolverMode(rtM_zftz->solverInfo, SOLVER_MODE_SINGLETASKING);

  /*
   * initialize model vectors and cache them in SimStruct
   */

  /* block I/O */
  {
    void *b = (void *) &rtB;
    rtM_zftz->ModelData.blockIO = (b);

    {
      int_T i;

      b =&rtB.Sum;
      for (i = 0; i < 5; i++) {
        ((real_T*)b)[i] = 0.0;
      }
    }
  }

  /* parameters */
  rtM_zftz->ModelData.defaultParam = ((real_T *) &rtP);

  /* states */
  {
    int_T i;
    real_T *x = (real_T *) &rtX;
    rtM_zftz->ModelData.contStates = (x);
    for(i = 0; i < (int_T)(sizeof(ContinuousStates)/sizeof(real_T)); i++) {
      x[i] = 0.0;
    }
  }

  /* data type work */
  {
    void *dwork = (void *) &rtDWork;
    rtM_zftz->Work.dwork = (dwork);
    (void)memset((char_T *) dwork, 0, sizeof(D_Work));
  }

  /* Model specific registration */

  rtM_zftz->modelName = ("zftz");
  rtM_zftz->path = ("zftz");

  rtmSetTStart(rtM_zftz, 0.0);
  rtM_zftz->Timing.tFinal = (0.5);
  rtM_zftz->Timing.stepSize = (0.00001);
  rtsiSetFixedStepSize(rtM_zftz->solverInfo, 0.00001);
  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;

    rtM_zftz->rtwLogInfo = (&rt_DataLoggingInfo);

    rtliSetLogFormat(rtM_zftz->rtwLogInfo, 0);

    rtliSetLogMaxRows(rtM_zftz->rtwLogInfo, 1000);

    rtliSetLogDecimation(rtM_zftz->rtwLogInfo, 1);

    rtliSetLogVarNameModifier(rtM_zftz->rtwLogInfo, "rt_");

    rtliSetLogT(rtM_zftz->rtwLogInfo, "tout");

    rtliSetLogX(rtM_zftz->rtwLogInfo, "");

    rtliSetLogXFinal(rtM_zftz->rtwLogInfo, "");

    rtliSetLogXSignalInfo(rtM_zftz->rtwLogInfo, NULL);

    rtliSetLogXSignalPtrs(rtM_zftz->rtwLogInfo, NULL);

    rtliSetLogY(rtM_zftz->rtwLogInfo, "");

    rtliSetLogYSignalInfo(rtM_zftz->rtwLogInfo, NULL);

    rtliSetLogYSignalPtrs(rtM_zftz->rtwLogInfo, NULL);
  }

  rtM_zftz->Sizes.checksums[0] = (455778568U);
  rtM_zftz->Sizes.checksums[1] = (1819632802U);
  rtM_zftz->Sizes.checksums[2] = (3990176408U);
  rtM_zftz->Sizes.checksums[3] = (108931416U);

  return rtM_zftz;
}

