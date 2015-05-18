
class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class TNG_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
        serverInit = QUOTE(call COMPILE_FILE(XEH_serverInit));
    };
};

class TNG_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(_this call DFUNC(initPerson));
        };
    };
    class StaticWeapon {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class ReammoBox_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call DFUNC(handleKilled));
        };
    };
};

class Extended_AnimChanged_EventHandlers {
    class CAManBase {
        class ADDON {
            animChanged = QUOTE(_this call DFUNC(handleAnimChanged));
        };
    };
};
