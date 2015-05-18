
class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class TNG_FiredBIS_EventHandlers {
    class CAManBase {
        class ADDON {
            clientFiredBIS = QUOTE(if (_this select 0 == ACE_player) then {_this call FUNC(camshake)};);
        };
    };
};
