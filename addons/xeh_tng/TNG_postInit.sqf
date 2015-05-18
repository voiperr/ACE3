#include "script_component.hpp"
private["_xehQueue", "_result"];

TNG_LOG("TNG PostInit Started");

_xehQueue = [QUOTE(COMPAT(PostInit_EventHandlers))] call FUNC(getInitClasses);
{
    TRACE_1("Executing", _x);
    try {
        [] call _x;
        #ifdef XEH_TRACK
        TNG_ExecLog pushBack ["postinit", format["%1", _x] ];
        #endif
    } catch {
        diag_log text format["TNG PostInit Failure : %1", _x];
    };
} forEach _xehQueue;

TNG_PostInit = true;
TNG_LOG("TNG PostInit Finished");