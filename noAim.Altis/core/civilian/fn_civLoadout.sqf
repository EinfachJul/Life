/*
Author: Bryan "Tonic" Boardwine
Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn noaim_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poor_1","U_C_Poloshirt_stripped","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_2","U_C_TeeSurfer_shorts_1","U_C_Commoner1_1"];
player addUniform (_clothings select (floor(random (count _clothings))));

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemRadio";
player assignItem "ItemRadio"; 

[] call noaim_fnc_saveGear;