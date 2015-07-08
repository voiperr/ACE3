/*
    Author:
    voiper

    Description:
    Compile list of flashlight classnames and add to the "Flashlight" parent menu.

    Arguments:
    0: List of flashlights in player's inventory <Array>

    Example:
    [_flashlights] call ace_map_fnc_compileFlashlightMenu;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

PARAMS_1(_flashlights);

//remove existing classes
{
    [ACE_player, 1, _x] call EFUNC(interact_menu,removeActionFromObject);
} forEach GVAR(flashlightActions);

GVAR(flashlightActions) = [];

//add all carried flashlight classes
{
    _parentName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    _icon = getText (configFile >> "CfgWeapons" >> _x >> "picture");
    _parentAction = [_x, _parentName, _icon, {true}, {true}, {}, _x, [0,0,0], 100] call EFUNC(interact_menu,createAction);
    _index1 = ["ACE_SelfActions", "ACE_MapFlashlight"];
    [ACE_player, 1, _index1, _parentAction] call EFUNC(interact_menu,addActionToObject);
    _index1 pushBack _x;

    _on = [(_x + "_On"), "On", "", {[_this select 2] call FUNC(switchFlashlight)}, {GVAR(flashlightInUse) != (_this select 2)}, {}, _x, [0,0,0], 100] call EFUNC(interact_menu,createAction);
    _index2 = ["ACE_SelfActions", "ACE_MapFlashlight", _x];
    [ACE_player, 1, _index2, _on] call EFUNC(interact_menu,addActionToObject);
    _index2 pushBack (_x + "_On");

    _off = [(_x + "_Off"), "Off", "", {[""] call FUNC(switchFlashlight)}, {GVAR(flashlightInUse) == (_this select 2)}, {}, _x, [0,0,0], 100] call EFUNC(interact_menu,createAction);
    _index3 = ["ACE_SelfActions", "ACE_MapFlashlight", _x];
    [ACE_player, 1, _index3, _off] call EFUNC(interact_menu,addActionToObject);
    _index3 pushBack (_x + "_Off");

    {GVAR(flashlightActions) pushBack _x} forEach [_index3, _index2, _index1];
} forEach _flashlights;