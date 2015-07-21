/*
 * Author: voioper
 * Switch flashlight.
 *
 * Arguments:
 * 0: Flashlight classname ("" for off) <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * ["ACE_Flashlight_MX991"] call ace_map_fnc_switchFlashlight;
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_flashlight);

GVAR(flashlightInUse) = _flashlight;
[GVAR(flashlightInUse)] call FUNC(flashlightGlow);
playSound "ACE_flashlights_flashlightClick";