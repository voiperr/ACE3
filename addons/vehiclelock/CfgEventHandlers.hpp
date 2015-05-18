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
class Extended_InventoryOpened_EventHandlers {
    class CAManBase {
        class ADDON {
            clientInventoryOpened = QUOTE(_this call FUNC(onOpenInventory););
        };
    };
};
class Extended_InitPost_EventHandlers {
    class Car {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleVehicleInitPost));
        };
    };
    class Tank {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleVehicleInitPost));
        };
    };
    class Helicopter {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleVehicleInitPost));
        };
    };
};
