/*
    Author:
    voiper

    Description:
    Switch flashlight.

    Arguments:
    0: Flashlight ("" for off) <String>

    Example:
    ["ACE_Flashlight_MX991"] call ace_map_fnc_switchFlashlight;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

PARAMS_1(_flashlight);

GVAR(flashlightInUse) = _flashlight;
[GVAR(flashlightInUse)] call FUNC(flashlightGlow);
playSound "ACE_flashlights_flashlightClick";