/*
 * Author: marc_book
 * Put's backpack to front.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * NONE.
 */

#include "script_component.hpp"

private ["_unit", "_holder"];
_unit = _this select 0;
_holder = [_unit] call EFUNC(common,dropBackpack);

_holder attachTo [_unit, [-0.1,0.8,-0.05], "Pelvis"];
_holder setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];

// lock GWH, so other items won't be attached to the player magically
_holder setVariable ["ACE_isLocked", true, true];

_unit playAction "PutDown";

_unit setVariable ["ACE_Backpack", _holder, true];
