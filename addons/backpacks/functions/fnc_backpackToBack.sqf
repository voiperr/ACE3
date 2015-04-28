/*
 * Author: marc_book
 * Put's backpack to normal position.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * NONE.
 */

#include "script_component.hpp"

private ["_unit", "_backpack"];

_unit = _this select 0;

_backpack = _unit getVariable ["ACE_Backpack", objNull];

// no need to detach, fixes bug that makes backpack disappear
//detach _backpack;

_unit action ["AddBag", _backpack, backpackCargo _backpack select 0];

// GWH will be objNull anyway
//_unit setVariable ["ACE_Backpack", objNull];
