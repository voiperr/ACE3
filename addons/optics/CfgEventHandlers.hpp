
class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class TNG_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class TNG_FiredBIS_EventHandlers {
    class CAManBase {
        class AGM_Optics {
            clientFiredBIS = QUOTE(if (_this select 0 == ACE_player) then {_this call DFUNC(handleFired)};);
        };
    };
};
