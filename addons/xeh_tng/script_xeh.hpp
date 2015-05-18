#define EXTENDED_EVENTHANDLERS \
init               = QUOTE(_this call FUNC(eh_onInit)); \
fired              = QUOTE(_this call FUNC(eh_onFired)); \
animChanged        = QUOTE(_this call FUNC(eh_onAnimChanged)); \
animDone           = QUOTE(_this call FUNC(eh_onAnimDone)); \
animStateChanged   = QUOTE(_this call FUNC(eh_onAnimStateChanged)); \
containerClosed    = QUOTE(_this call FUNC(eh_onContainerClosed)); \
containerOpened    = QUOTE(_this call FUNC(eh_onContainerOpened)); \
controlsShifted    = QUOTE(_this call FUNC(eh_onControlsShifted)); \
dammaged           = QUOTE(_this call FUNC(eh_onDammaged)); \
engine             = QUOTE(_this call FUNC(eh_onEngine)); \
epeContact         = QUOTE(_this call FUNC(eh_onEpeContact)); \
epeContactEnd      = QUOTE(_this call FUNC(eh_onEpeContactEnd)); \
epeContactStart    = QUOTE(_this call FUNC(eh_onEpeContactStart)); \
explosion          = QUOTE(_this call FUNC(eh_onExplosion)); \
firedNear          = QUOTE(_this call FUNC(eh_onFiredNear)); \
fuel               = QUOTE(_this call FUNC(eh_onFuel)); \
gear               = QUOTE(_this call FUNC(eh_onGear)); \
getIn              = QUOTE(_this call FUNC(eh_onGetIn)); \
getOut             = QUOTE(_this call FUNC(eh_onGetOut)); \
handleHeal         = QUOTE(_this call FUNC(eh_onHandleHeal)); \
hit                = QUOTE(_this call FUNC(eh_onHit)); \
hitPart            = QUOTE(_this call FUNC(eh_onHitPart)); \
incomingMissile    = QUOTE(_this call FUNC(eh_onIncomingMissile)); \
inventoryClosed    = QUOTE(_this call FUNC(eh_onInventoryClosed)); \
inventoryOpened    = QUOTE(_this call FUNC(eh_onInventoryOpened)); \
killed             = QUOTE(_this call FUNC(eh_onKilled)); \
landedTouchDown    = QUOTE(_this call FUNC(eh_onLandedTouchDown)); \
landedStopped      = QUOTE(_this call FUNC(eh_onLandedStopped)); \
local              = QUOTE(_this call FUNC(eh_onLocal)); \
respawn            = QUOTE(_this call FUNC(eh_onRespawn)); \
put                = QUOTE(_this call FUNC(eh_onPut)); \
take               = QUOTE(_this call FUNC(eh_onTake)); \
soundPlayed        = QUOTE(_this call FUNC(eh_onSoundPlayed)); \
weaponAssembled    = QUOTE(_this call FUNC(eh_onWeaponAssembled)); \
weaponDisAssembled = QUOTE(_this call FUNC(eh_onWeaponDisassembled));

//handleDamage      = QUOTE(_this call FUNC(eh_onHandleDamage)); \
//mpHit             = QUOTE(_this call FUNC(eh_onMPHit)); \
//mpKilled          = QUOTE(_this call FUNC(eh_onMPKilled)); \
//mpRespawn         = QUOTE(_this call FUNC(eh_onMPRespawn));

#define DELETE_EVENTHANDLERS delete init; \
delete fired; \
delete animChanged; \
delete animDone; \
delete animStateChanged; \
delete containerClosed; \
delete containerOpened; \
delete controlsShifted; \
delete dammaged; \
delete engine; \
delete epeContact; \
delete epeContactEnd; \
delete epeContactStart; \
delete explosion; \
delete firedNear; \
delete fuel; \
delete gear; \
delete getIn; \
delete getOut; \
delete handleHeal; \
delete hit; \
delete hitPart; \
delete incomingMissile; \
delete inventoryClosed; \
delete inventoryOpened; \
delete killed; \
delete landedTouchDown; \
delete landedStopped; \
delete local;  \
delete respawn;  \
delete put;  \
delete take; \
delete soundPlayed; \
delete weaponAssembled; \
delete weaponDisAssembled;
