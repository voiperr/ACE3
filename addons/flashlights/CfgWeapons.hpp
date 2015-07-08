class CfgWeapons {

    class ItemCore;
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class InventoryFlashlightItem_Base_F;
    
    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class Flashlight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Size = 2.75;
            };
        };
    };

    class ACE_Flashlight_MX993: ACE_ItemCore {
        displayName = "Fulton MX-993";
        descriptionShort = CSTRING(MX993_Description);
        model = "\A3\weapons_f\acc\accv_Flashlight_F";
        picture = PATHTOF(UI\mx993_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Size = 1.75;
            };
        };
    };
    
    class ACE_Flashlight_KSF1: ACE_ItemCore {
        displayName = "KSF-1";
        descriptionShort = CSTRING(KSF1_Description);
        model = "\A3\weapons_f\acc\accv_Flashlight_F";
        picture = PATHTOF(UI\ksf1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Size = 1.5;
            };
        };
    };
    
    class ACE_Flashlight_XL50: ACE_ItemCore {
        displayName = "Maglite XL50";
        descriptionShort = CSTRING(XL50_Description);
        model = "\A3\weapons_f\acc\accv_Flashlight_F";
        picture = PATHTOF(UI\xl50_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Size = 2.15;
            };
        };
    };
};