/*
 * Author: voiper
 * Rows a rubber boat.
 *
 * Arguments:
 * 0: Boat <OBJECT>
 * 1: Direction to move (0-360) <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [boat, direction] call ace_interaction_fnc_row
 *
 * Public: No
 */
 
#include "script_component.hpp"

PARAMS_2(_boat,_param);

_velocity = velocity _boat;
if (vectorMagnitude _velocity > 10) exitWith {};

_boatVector = vectorDir _boat;

_playerPos = getPos ACE_player;
_boatPos = getPos _boat;
_dirOffset = _boatPos vectorFromTo _playerPos;

_angle = [cos _param, sin _param, 0];

_newVector = _boatVector vectordiff _angle;

systemChat str [_boatVector, _newVector];

_newVelocity = _velocity vectorAdd _newVector;

//[[_boat, _newVelocity], QUOTE(FUNC(row)), _boat] call EFUNC(common,execRemoteFnc);

//[{(_this select 0) setVelocity (_this select 1);}, [_boat, _newVelocity], 0.75] call EFUNC(common,waitAndExecute);