#include "script_component.hpp"

ADDON = false;
TNG_LOG("TNG GameInit Started");

// PREP EH's
PREP_EH(eh_onInit);
PREP_EH(eh_onFired);
PREP_EH(eh_onAnimChanged);
PREP_EH(eh_onAnimDone);
PREP_EH(eh_onAnimStateChanged);
PREP_EH(eh_onContainerClosed);
PREP_EH(eh_onContainerOpened);
PREP_EH(eh_onControlsShifted);
PREP_EH(eh_onDammaged);
PREP_EH(eh_onEngine);
PREP_EH(eh_onEpeContact);
PREP_EH(eh_onEpeContactEnd);
PREP_EH(eh_onEpeContactStart);
PREP_EH(eh_onExplosion);
PREP_EH(eh_onFiredNear);
PREP_EH(eh_onFuel);
PREP_EH(eh_onGear);
PREP_EH(eh_onGetIn);
PREP_EH(eh_onGetOut);
PREP_EH(eh_onHandleHeal);
PREP_EH(eh_onHit);
PREP_EH(eh_onHitPart);
PREP_EH(eh_onIncomingMissile);
PREP_EH(eh_onInventoryClosed);
PREP_EH(eh_onInventoryOpened);
PREP_EH(eh_onKilled);
PREP_EH(eh_onLandedTouchDown);
PREP_EH(eh_onLandedStopped);
PREP_EH(eh_onLocal);
PREP_EH(eh_onRespawn);
PREP_EH(eh_onPut);
PREP_EH(eh_onTake);
PREP_EH(eh_onSoundPlayed);
PREP_EH(eh_onWeaponAssembled);
PREP_EH(eh_onWeaponDisassembled);

TNG_EH = [];
TNG_EH_Lookup = [];

TNG_ExecLog = [];

TNG_PreInit = false;
TNG_PostInit = false;
TNG_ObjectInit = false;

ADDON = true;
TNG_LOG("TNG GameInit Finished");