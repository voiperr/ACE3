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

PARAMS_3(_vehicle,_player,_parameters);

_actions = [];
_flashlights = [_player] call FUNC(getUnitFlashlights);

//add all carried flashlight menus and on/off submenu actions
{
    _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    _icon = getText (configFile >> "CfgWeapons" >> _x >> "picture");
    
    _children = {
        PARAMS_3(_vehicle,_player,_flashlight);
        _actions = [];
        
        _onAction = [
            (_flashlight + "_On"),
            "On", 
            "", 
            {[_this select 2] call FUNC(switchFlashlight)},
            {GVAR(flashlightInUse) != (_this select 2)},
            {},
            _flashlight
        ] call EFUNC(interact_menu,createAction);
        
        _offAction = [
            (_flashlight + "_Off"),
            "Off",
            "",
            {[""] call FUNC(switchFlashlight)},
            {GVAR(flashlightInUse) == (_this select 2)},
            {},
            _flashlight
        ] call EFUNC(interact_menu,createAction);
    
        _actions pushBack [_onAction, [], _player];
        _actions pushBack [_offAction, [], _player];
    
        _actions
    };
    
    _parentAction = [_x, _displayName, _icon, {true}, {true}, _children, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_parentAction, [], _player];
} forEach _flashlights;

_actions