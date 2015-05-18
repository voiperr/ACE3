#include "script_component.hpp"
private["_ehConfig", "_retXeh", "_xehCode", "_config"];



{
    private["_ehName", "_ehConfig", "_retXeh", "_xehCode", "_config"];
    
    _ehName = _x;
    _ehConfig = "true" configClasses (configFile >> _x);
    _ehConfig = _ehConfig + ("true" configClasses (missionConfigFile >> _x));

    
    
} forEach [ QUOTE(COMPAT(Init_EventHandlers)), 
            QUOTE(COMPAT(FiredBIS_EventHandlers))
        ];

#ifdef DEBUG_MODE_FULL
TRACE_1("TNG Cache built", "");
{
    TRACE_1("", _x);
} forEach TNG_EH_Lookup;

{
    TRACE_1("", _x);
} forEach TNG_EH;
#endif