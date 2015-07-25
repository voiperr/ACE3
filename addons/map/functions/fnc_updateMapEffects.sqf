/*
* Author: Rocko, esteldunedain, voiper
* On map draw, updates the effects
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: No
*/
#include "script_component.hpp"

_mapCtrl = findDisplay 12 displayCtrl 51;
_mapScale = ctrlMapScale _mapCtrl;
_mapCentre = _mapCtrl ctrlMapScreenToWorld [0.5, 0.5];

if (GVAR(mapIllumination)) then {

    //get nearby lighting
    _light = [[ACE_player], FUNC(determineMapLight), missionNamespace, QGVAR(mapLight), 0.1] call EFUNC(common,cachedCall);

    EXPLODE_2_PVT(_light,_darkenMap,_lightLevel);

    if (!_darkenMap) exitWith {};

    _hmd = hmd ACE_player;
    _nvgOn = (((getText (configFile >> 'CfgWeapons' >> _hmd >> 'simulation')) == 'NVGoggles') && (currentVisionMode ACE_player == 1));
    _aceNVG = GVAR(aceNVG);
    _flashlight = GVAR(flashlightInUse);

    //map width (on screen) in pixels
    _screenSize = 640 * safeZoneW;

    //resolution params (every frame in case resolution change)
    EXPLODE_6_PVT(getResolution,_resX,_resY,_viewPortX,_viewPortY,_nil,_uiScale);

    //engine rounds the viewport ratios, when they should be fractions; this can cause problems
    _realViewPortY = _resY * _uiScale;
    _realViewPortX = _realViewPortY * 4/3;

    //textures
    _blackTex = "#(rgb,8,8,3)color(0,0,0,1)";
    _whiteTex = "#(rgb,8,8,3)color(1,1,1,1)";

    //colour/alpha
    EXPLODE_4_PVT(_lightLevel,_r,_g,_b,_a);
    _colourAlpha = (_r + _g + _b) min _a;
    _shadeAlpha = _a;

    if (_nvgOn) then {
        _flashlightAdd = if (_flashlight != "") then {0.75} else {0};
        _shadeAlpha = 0.8 - _a + _flashlightAdd;
        _fillTex = _whiteTex;

        if (_aceNVG) then {
            _nvgAlpha = ACE_player getVariable [QEGVAR(nightvision,NVGBrightness), 0];

            if (_nvgAlpha >= 0) then {
                _shadeAlpha = _shadeAlpha + _nvgAlpha / 2;
            } else {
                //if flashlight off
                if (_flashlight == "") then {
                    //if there's nearby light
                    if (_shadeAlpha > 0) then {
                        _shadeAlpha = _shadeAlpha + _nvgAlpha / 2;
                    } else {
                        _fillTex = _blackTex;
                        _shadeAlpha = -_nvgAlpha / 1.5;
                    };
                } else {
                    _shadeAlpha = _shadeAlpha + _nvgAlpha;
                };
            };

            _grainConfig = (configFile >> "CfgWeapons" >> _hmd >> "ACE_NightVision_grain");
            _grain = if (isNumber _grainConfig) then {
                (getNumber _grainConfig) / 2
            } else {
                0
            };

            if (_grain > 0) then {
                _posX = (_mapCentre select 0) + (_mapScale * random 500);
                _posY = (_mapCentre select 1) + (_mapScale * random 500);
                _mapCtrl drawIcon [format["#(ai,2048,2048,1)perlinNoise(%1,%2,0,1)", _resX, _resX], [0.25,0.25,0.25,_grain], [_posX, _posY], _screenSize * 2.5, _screenSize * 2.5, 0, "", 0]; //noise
            };
        };

        _mapCtrl drawIcon ["#(rgb,8,8,3)color(0,0.5,0,1)", [1,1,1,0.5], _mapCentre, _screenSize, _screenSize, 0, "", 0]; //nvg green
        _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], _mapCentre, _screenSize, _screenSize, 0, "", 0]; //alpha fill
    } else {
        _fillTex = _blackTex;

        _colourList = [_r, _g, _b];
        _colourList sort false;
        _maxColour = _colourList select 0;

        //ambient colour fill
        _mapCtrl drawIcon [format["#(rgb,8,8,3)color(%1,%2,%3,1)", _r / _maxColour, _g / _maxColour, _b / _maxColour], [1,1,1,_colourAlpha], _mapCentre, _screenSize, _screenSize, 0, "", 0];

        if (_flashlight == "") then {
            //ambient shade fill
            _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], _mapCentre, _screenSize, _screenSize, 0, "", 0];
        } else {
            //mouse pos
            _mousePos = GVAR(mousePos);

            //flashlight settings
            _colour = getText (configFile >> "CfgWeapons" >> _flashlight >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Colour");
            _size = getNumber (configFile >> "CfgWeapons" >> _flashlight >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Size");
            _flashTex = format[QUOTE(PATHTOF_SYS(ace,flashlights,UI\Flashlight_Beam_%1_ca.paa)), _colour];
            _beamSize = _screenSize / _size;

            //after 5x zoom, it's simulated to be fixed (it actually gets bigger relative to zoom)
            if (_mapScale < 0.2) then {_beamSize = _beamSize / (_mapScale * (1 / 0.2))};

            //assign corrective ratio to fix sub-pixel gaps/overlaps (symptom of viewport * X/Y resolution rounding)
            _viewPortRatioFixY = if (_realViewPortY != _viewPortY) then {
                _realViewPortX / (_realViewPortY / _viewPortY * _viewPortX)
            } else {
                if (_realViewPortX != _viewPortX) then {
                    _realViewPortX / _viewPortX
                } else {
                    1
                };
            };

            //offset the elements
            _offsetX = _mapScale * GVAR(worldSize) * (_screenSize * 2 + _beamSize);
            _offsetYDown = _mapScale * GVAR(worldSize) * (_screenSize + _beamSize) * _viewPortRatioFixY;
            //up is bigger because of a potential exploit
            _offsetYUp = _mapScale * GVAR(worldSize) * (_screenSize * 4 + _beamSize) * _viewPortRatioFixY;

            //draw the matrix /whoa
            _mapCtrl drawIcon [_flashTex, [1,1,1,_shadeAlpha], _mousePos, _beamSize, _beamSize, 0, "", 0]; //centre beam
            _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0) - _offsetX, (_mousePos select 1)], _screenSize * 2, _beamSize, 0, "", 0]; //left
            _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0) + _offsetX, (_mousePos select 1)], _screenSize * 2, _beamSize, 0, "", 0]; //right
            _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0), (_mousePos select 1) - _offsetYDown], _screenSize * 4, _screenSize, 0, "", 0]; //down
            _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0), (_mousePos select 1) + _offsetYUp], _screenSize * 4, _screenSize * 4, 0, "", 0]; //up
        };
    };
};

if (GVAR(mapShake)) then {
    private ["_speed","_amplitude", "_time", "_shakePos"];

    // Only shake map while moving on foot
    _speed = 0;
    if (vehicle ACE_player == ACE_player) then {
        _speed = vectorMagnitude (velocity ACE_player);
    };

    // If speed is large enough, create anims to shake map
    if (_speed > 0.1) then {
        if (ctrlMapAnimDone _mapCtrl) then {

            _amplitude = (_speed - 0.1) / 5 * (1000 * _mapScale);
            _time = 0.1;

            _shakePos = [(GVAR(lastStillPosition) select 0) + sin((ACE_time + _time - GVAR(lastStillTime))*100) * _amplitude * 0.25,
                         (GVAR(lastStillPosition) select 1) + sin((ACE_time + _time - GVAR(lastStillTime))*260) * _amplitude];

            _mapCtrl ctrlMapAnimAdd [_time, _mapScale, _shakePos];
            ctrlMapAnimCommit _mapCtrl;

            GVAR(isShaking) = true;
        };
    } else {
        if (GVAR(isShaking)) then {
            // Stop shaking, return to original position
            ctrlMapAnimClear _mapCtrl;
            _mapCtrl ctrlMapAnimAdd [0, _mapScale, GVAR(lastStillPosition)];
            ctrlMapAnimCommit _mapCtrl;
            GVAR(isShaking) = false;
        } else {
            // The map is still, store state
            GVAR(lastStillPosition) = _mapCentre;
            GVAR(lastStillTime) = ACE_time;
        };
    };
};

if (GVAR(mapLimitZoom)) then {
    if (GVAR(minMapSize) >= _mapScale) then {
        ctrlMapAnimClear _mapCtrl;
        _mapCtrl ctrlMapAnimAdd [0, GVAR(minMapSize) + 0.001, _mapCentre];
        ctrlMapAnimCommit _mapCtrl;
    };
};