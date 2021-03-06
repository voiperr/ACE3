#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(cacheAmmoLoudness) = call CBA_fnc_createNamespace;

GVAR(deafnessDV) = 0;
GVAR(deafnessPrior) = 0;
GVAR(volume) = 1;
GVAR(playerVehAttenuation) = 1;
GVAR(time3) = 0;
GVAR(damageCoefficent) = 1;
GVAR(volumeAttenuation) = 1;

["ace_settingsInitialized", {
    TRACE_1("settingInit",GVAR(EnableCombatDeafness));
    // Only run PFEH and install event handlers if combat deafness is enabled
    if (!GVAR(EnableCombatDeafness)) exitWith {};

    //Add XEH:
    ["CAManBase", "FiredNear", FUNC(firedNear)] call CBA_fnc_addClassEventHandler;
    ["CAManBase", "Explosion", FUNC(explosionNear)] call CBA_fnc_addClassEventHandler;

    // Update hearing protection now:
    [] call FUNC(updateHearingProtection);

    // Spawn volume updating process
    [FUNC(updateVolume), 1, [false]] call CBA_fnc_addPerFrameHandler;

    // Update veh attunation when player veh changes
    ["ace_playerVehicleChanged", FUNC(updatePlayerVehAttenuation)] call CBA_fnc_addEventHandler;
    ["ace_playerTurretChanged", FUNC(updatePlayerVehAttenuation)] call CBA_fnc_addEventHandler;

    // Reset deafness on respawn (or remote control player switch)
    ["ace_playerChanged", {
        GVAR(deafnessDV) = 0;
        GVAR(deafnessPrior) = 0;
        ACE_player setVariable [QGVAR(deaf), false];
        GVAR(time3) = 0;
        [] call FUNC(updateHearingProtection);
    }] call CBA_fnc_addEventHandler;

    // Update protection on possible helmet change
    ["ace_playerInventoryChanged", {[] call FUNC(updateHearingProtection);}] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
