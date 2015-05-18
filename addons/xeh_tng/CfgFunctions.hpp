class CfgFunctions {
    class CBA {
        tag = "CBA";
        class TNG {
            tag = "TNG";
            class gameStart {
                file = PATHTOF(TNG_gameInit.sqf);
                preInit = 0; 
                postInit = 0; 
                preStart = 1;
                recompile = 1;
                headerType = -1; 
            };
            class preInit {
                file = PATHTOF(TNG_preInit.sqf);
                preInit = 1; 
                postInit = 0; 
                preStart = 0;
                recompile = 1;
                headerType = -1; 
            };
            class TNG_PostInit {
                file = PATHTOF(TNG_postInit.sqf);
                preInit = 0; 
                postInit = 1; 
                preStart = 0;
                recompile = 1;
                headerType = -1; 
            };
        };
    };
};