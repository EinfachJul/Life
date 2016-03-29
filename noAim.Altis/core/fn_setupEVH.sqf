/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn noaim_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call noaim_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call noaim_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call noaim_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call noaim_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call noaim_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call noaim_fnc_inventoryOpened}];
player addEventHandler["Broken",{_this call noaim_fnc_onBroken}];

"noaim_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call noaim_fnc_MPexec;};

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call noaim_fnc_keyHandler"];
(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call noaim_fnc_mkeyHandler"];