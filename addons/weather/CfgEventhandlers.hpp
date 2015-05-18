class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class TNG_PostInit_EventHandlers {
    class ADDON {
        serverInit = QUOTE(call COMPILE_FILE(XEH_PostServerInit));
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};
