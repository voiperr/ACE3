class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class TNG_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class TNG_FiredBIS_EventHandlers {
    class CAManBase {
        class ADDON {
            clientFiredBIS = QUOTE( _this call FUNC(throwGrenade) );
        };
    };
};
