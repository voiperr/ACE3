// Class for "pre-init", run-once event handlers. Code in here runs before any
// TNG_Init_Eventhandlers code.
class TNG_PreInit_EventHandlers {};

// The PostInit handlers also run once, but after all the extended init EH:s
// have run and after all mission.sqm "init lines" have been processed.
class TNG_PostInit_EventHandlers {};

// Finally, "InitPost" handlers are run once on every unit in the mission.
// Note the difference here - the PreInit and PostInit handlers above run once
// per mission but InitPost handlers are called for each unit.
class TNG_InitPost_EventHandlers {};

// Extended EH classes, where new events are defined.
class TNG_AnimChanged_EventHandlers {};
class TNG_AnimDone_EventHandlers {};
class TNG_AnimStateChanged_EventHandlers {};
class TNG_ContainerClosed_EventHandlers {};
class TNG_ContainerOpened_EventHandlers {};
class TNG_ControlsShifted_EventHandlers {};
class TNG_Dammaged_EventHandlers {};
class TNG_Engine_EventHandlers {};
class TNG_EpeContact_EventHandlers {};
class TNG_EpeContactEnd_EventHandlers {};
class TNG_EpeContactStart_EventHandlers {};
class TNG_Explosion_EventHandlers {};
class TNG_Fired_EventHandlers {}; // New fired EH, uses BIS notation
class TNG_FiredNear_EventHandlers {};
class TNG_Fuel_EventHandlers {};
class TNG_Gear_EventHandlers {};
class TNG_HandleDamage_EventHandlers {}; // Not implemented yet
class TNG_HandleHeal_EventHandlers {};   // Not implemented yet
class TNG_Hit_EventHandlers {};
class TNG_HitPart_EventHandlers {};
class TNG_Init_EventHandlers {};
class TNG_IncomingMissile_EventHandlers {};
class TNG_InventoryClosed_EventHandlers {};
class TNG_InventoryOpened_EventHandlers {};
class TNG_Killed_EventHandlers {};
class TNG_LandedTouchDown_EventHandlers {};
class TNG_LandedStopped_EventHandlers {};
class TNG_Local_EventHandlers {};
/*
// Don't work
class TNG_MPHit_EventHandlers {};
class TNG_MPKilled_EventHandlers {};
class TNG_MPRespawn_EventHandlers {};
*/
class TNG_Put_EventHandlers {};
class TNG_Take_EventHandlers {};
class TNG_SoundPlayed_EventHandlers {};
class TNG_WeaponAssembled_EventHandlers {};
class TNG_WeaponDisassembled_EventHandlers {};

class TNG_GetIn_EventHandlers
{
    // Default Extended Event Handlers: Custom GetInMan event
    class AllVehicles
    {
        class TNG_GetInMan
        {
                scope     = public;
                getIn  = QUOTE(_this call FUNC(eh_onGetInMan));
        };
    };
};

class TNG_GetOut_EventHandlers
{
    // Default Extended Event Handlers: Custom GetOutMan event
    class AllVehicles
    {
        class TNG_GetOutMan
        {
                scope     = public;
                getOut = QUOTE(_this call FUNC(eh_onGetOutMan));
        };
    };
};

class TNG_GetInMan_EventHandlers {};
class TNG_GetOutMan_EventHandlers {};

// New OA 1.55 classes
// TODO: What about Vehicle Respawn?
// TODO: MPRespawn vs Respawn seems unclear, only respawn seems to work?
// Respawn only seems to fire where the unit is local, but MPRespawn or MPKilled nowhere??
class TNG_Respawn_EventHandlers
{
    // We use this to re-attach eventhandlers on respawn, just like ordinary eventhandlers are re-attached.
    // We also use it to rerun init eventhandlers with onRespawn = true; functionallity now sort of shared with MPRespawn EH etc.
    // This is required because BIS Initeventhandlers fire on all machines for respawning unit, except on his own machine.
    class CAManBase
    {
        class TNG_RespawnInit
        {
                scope     = public;
                respawn  = QUOTE(_this call FUNC(eh_onRespawn));
        };
    };
};

class DefaultEventhandlers;
class Default_TNG_Eventhandlers: DefaultEventhandlers { EXTENDED_EVENTHANDLERS };
