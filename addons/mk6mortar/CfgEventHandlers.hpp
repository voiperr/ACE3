class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class TNG_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE( call COMPILE_FILE(XEH_clientInit) );
    };
};
class TNG_FiredBIS_EventHandlers {
    class Mortar_01_base_F {
        class ADDON {
            firedBIS = QUOTE(_this call FUNC(handleFired));
        };
    };
};
