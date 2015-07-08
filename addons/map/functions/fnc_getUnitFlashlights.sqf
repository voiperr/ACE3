/*
    Author:
    voiper

    Description:
    Check a unit for any flashlights that can be used on map.

    Arguments:
    0: Unit to check <Object>

    Example:
    [unit] call ace_map_fnc_getUnitFlashlights;

    Return Value:
    Flashlight classnames (empty for none) <Array>

    Public:
    No
*/

#include "script_component.hpp"

PARAMS_1(_unit);

_flashlights = [];

{
    if ((isText (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Colour")) && !(_x in _flashlights)) then {
            _flashlights pushBack _x;
    };
} forEach (items _unit);

_flashlights