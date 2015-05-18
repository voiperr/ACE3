#define COMPONENT xeh_tng
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_ENABLED_XEH
#ifdef DEBUG_ENABLED_XEH
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_XEH
    #define DEBUG_SETTINGS DEBUG_SETTINGS_XEH
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define XEH_TRACK

#ifdef DEBUG_SETTINGS_XEH
    #define PREP_EH(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE(PATHTOF(eventhandlers\DOUBLES(fnc,fncName).sqf))
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf))
#else
    #define PREP_EH(fncName) DFUNC(fncName) = compileFinal preprocessFileLineNumbers QUOTE(PATHTOF(eventhandlers\DOUBLES(fnc,fncName).sqf))
    #define PREP(fncName) DFUNC(fncName) = compileFinal preprocessFileLineNumbers QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf))
#endif

#define TNG_LOG(MESSAGE) diag_log [diag_frameNo, diag_tickTime, time, MESSAGE];

#define COMPAT(NAME) TNG_##NAME