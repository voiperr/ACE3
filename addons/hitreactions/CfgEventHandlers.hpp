
class TNG_Preinit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Hit_EventHandlers {
    class CAManBase {
        class ADDON {
            hit = QUOTE(_this call FUNC(fallDown));
        };
    };
};
