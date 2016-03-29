/*
	Author: Bryan "Tonic" Boardwine
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn noaim_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_B_CTRG_1";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";

player addBackpack "B_Carryall_oucamo";
player addItemToBackpack "Toolkit";
player addItemToBackpack "Medikit";

//[[player,0,"textures\uniforms\fw\fw_uniformX.paa"],"noaim_fnc_setTexture",true,false] spawn noaim_fnc_LAST;
[player,0,"textures\uniforms\fw\fw_uniformX.paa"] remoteExec ["noaim_fnc_setTexture", -2];

[] call noaim_fnc_updateClothing;
[] call noaim_fnc_saveGear;