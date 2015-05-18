#include "script_component.hpp"
private["_xehQueue", "_result"];

TNG_LOG("TNG PreInit Started");

PREP(buildObjectsEH);
PREP(getInitClasses);

[] call compile preprocessFileLineNumbers QUOTE(PATHTOF(TNG_gameInit.sqf));

_xehQueue = [QUOTE(COMPAT(PreInit_EventHandlers))] call FUNC(getInitClasses);
{
    TRACE_1("Executing", _x);
    try {
        [] call _x;
        #ifdef XEH_TRACK
        TNG_ExecLog pushBack ["preinit", format["%1", _x] ];
        #endif
    } catch { 
        diag_log text format["TNG PreInit Failure : %1", _x];
    };  
} forEach _xehQueue;

// Build the XEH object based init handler caches here
[] call FUNC(buildObjectsEH);

TNG_PreInit = true;
TNG_LOG("TNG PreInit Finished");