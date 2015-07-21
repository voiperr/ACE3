class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_MapFlashlight {
                displayName = CSTRING(Action_Flashlights);
                icon = QUOTE(\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa);
                condition = QUOTE(GVAR(mapIllumination) && visibleMap && (count ([ACE_player] call FUNC(getUnitFlashlights)) > 0));
                statement = "true";
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                insertChildren = QUOTE(_this call DFUNC(compileFlashlightMenu));
                showDisabled = 0;
                priority = 99;
            };
            class ACE_MapNVG {
                displayName = CSTRING(Action_NVG);
                icon = QUOTE(\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\nvgs_ca.paa);
                condition = QUOTE(GVAR(mapIllumination) && visibleMap && ((getText (configFile >> 'CfgWeapons' >> (hmd ACE_player) >> 'simulation')) == 'NVGoggles'));
                statement = "true";
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                showDisabled = 0;
                priority = 98;
                
                class ACE_MapNVGOn {
                    displayName = CSTRING(Action_NVGOn);
                    icon = "";
                    condition = QUOTE(currentVisionMode ACE_player == 0);
                    statement = QUOTE([1] call DFUNC(toggleNVG));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                    priority = 0;
                };
                
                class ACE_MapNVGUp {
                    displayName = CSTRING(Action_NVGUp);
                    icon = "";
                    condition = QUOTE(GVAR(aceNVG) && (currentVisionMode ACE_player == 1));
                    statement = QUOTE([ARR_2(ACE_player,1)] call DEFUNC(nightvision,changeNVGBrightness));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                    priority = 1;
                };
                
                class ACE_MapNVGDown {
                    displayName = CSTRING(Action_NVGDown);
                    icon = "";
                    condition = QUOTE(GVAR(aceNVG) && (currentVisionMode ACE_player == 1));
                    statement = QUOTE([ARR_2(ACE_player,-1)] call DEFUNC(nightvision,changeNVGBrightness));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                    priority = 2;
                };
                
                class ACE_MapNVGOff {
                    displayName = CSTRING(Action_NVGOff);
                    icon = "";
                    condition = QUOTE(currentVisionMode ACE_player == 1);
                    statement = QUOTE([0] call DFUNC(toggleNVG));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                    priority = 3;
                };
            };
        }; 
    };
    
    class ACE_Module;
    class ACE_ModuleMap: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleMap);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Map_ca.paa);
        class Arguments {
            class MapIllumination {
                displayName = CSTRING(MapIllumination_DisplayName);
                description = CSTRING(MapIllumination_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class MapShake {
                displayName = CSTRING(MapShake_DisplayName);
                description = CSTRING(MapShake_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class MapLimitZoom {
                displayName = CSTRING(MapLimitZoom_DisplayName);
                description = CSTRING(MapLimitZoom_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class MapShowCursorCoordinates {
                displayName = CSTRING(MapShowCursorCoordinates_DisplayName);
                description = CSTRING(MapShowCursorCoordinates_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class Module_F;
    class ACE_ModuleBlueForceTracking: Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(BFT_Module_DisplayName);
        function = QFUNC(blueForceTrackingModule);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_BFTracking_ca.paa);
        class Arguments {
            class Enabled {
                displayName = CSTRING(BFT_Enabled_DisplayName);
                description = CSTRING(BFT_Enabled_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class Interval {
                displayName = CSTRING(BFT_Interval_DisplayName);
                description = CSTRING(BFT_Interval_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class HideAiGroups {
                displayName = CSTRING(BFT_HideAiGroups_DisplayName);
                description = CSTRING(BFT_HideAiGroups_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(BFT_Module_Description);
        };
    };
};