class TNG_Preinit_EventHandlers {
    class ADDON    {
        init = QUOTE(call COMPILE_FILE(XEH_pre_init));
    };
};

class TNG_PostInit_EventHandlers {
    class ADDON    {
        init = QUOTE(call COMPILE_FILE(XEH_post_init));
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};

class TNG_FiredBIS_EventHandlers {
    class All {
        ADDON = QUOTE(_this call FUNC(onFired));
    };
};