class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_pre_init));
    };
};

class TNG_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_post_init));
    };
};

class TNG_Init_EventHandlers {
    class Helicopter {
        class ADDON {
            init = QUOTE(_this call DFUNC(initDesignatorActions));
        };
    };
};