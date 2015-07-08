/*
    Author:
    voiper

    Description:
    Switch player's NVG state while in map.

    Arguments:
    0: Mode <Scalar>

    Example:
    [1] call ace_map_fnc_toggleNVG;

    Return Value:
    None

    Public:
    No
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