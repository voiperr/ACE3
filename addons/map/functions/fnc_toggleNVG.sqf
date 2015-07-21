/*
 * Author: voiper
 * Switch player's NVG state while in map.
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * [1] call ace_map_fnc_toggleNVG;
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_switch);

switch (_switch) do {
    case 0: {
        ACE_player action ["NVGogglesOff"];
    };

    case 1: {
        ACE_player action ["NVGoggles"];
    };
};