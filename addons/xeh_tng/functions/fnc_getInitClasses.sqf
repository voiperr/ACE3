#include "script_component.hpp"
private["_ehConfig", "_retXeh", "_xehCode", "_config"];

_retXeh = [];
_ehConfig = "true" configClasses (configFile >> (_this select 0));
_ehConfig = _ehConfig + ("true" configClasses (missionConfigFile >> (_this select 0)));

#ifdef DEBUG_MODE_FULL
TRACE_1("Collection stage", _ehConfig);
#endif

for "_i" from 0 to (count _ehConfig)-1 do {
    if( isText (_ehConfig select _i) ) then {
        _xehCode = getText _config;
        if(!isNil "_xehCode" && {_xehCode != ""}) then {
                #ifdef DEBUG_MODE_FULL
                diag_log text format["%1 - %2", _config, (getText _config)];
                #endif
                _retXeh pushBack compile (_xehCode);
            };
    };
};

// Run child configs
{
    #ifdef DEBUG_MODE_FULL
    TRACE_1("Collecting", _x);
    #endif
    
    // iterate through preinit classes and just execute the fuckers
    for "_i" from 0 to (count _x)-1 do {
        _config = _x select _i;

        if(isText _config) then {
            if((configName _config) == "init" || 
                { (configName _config) == "serverInit" && isServer} || 
                { (configName _config) == "clientInit" && hasInterface } || 
                { (configName _config) == "hcInit" && !isServer && !hasInterface }
              ) then {
                _xehCode = getText _config;
                if(!isNil "_xehCode" && {_xehCode != ""}) then {
                    #ifdef DEBUG_MODE_FULL
                    diag_log text format["%1 - %2", _config, (getText _config)];
                    #endif
                    _retXeh pushBack (compile (_xehCode));
                };
            };
        };
    };
} forEach _ehConfig;

_retXeh;