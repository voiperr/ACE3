class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            //todo: add flashlight attach actions
        }; 
    };
    
    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;

    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX993,12);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_KSF1,12);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_XL50,12);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX993,12);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX993,12);
            MACRO_ADDITEM(ACE_Flashlight_KSF1,12);
            MACRO_ADDITEM(ACE_Flashlight_XL50,12);
        };
    };
};