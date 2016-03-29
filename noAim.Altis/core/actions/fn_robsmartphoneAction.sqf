/*
	Author: Bryan "Tonic" Boardwine
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
//xif(player distance (getMarkerPos "safezone_kavala") < 300) exitWith { player addWeapon "ItemRadio";};
if(player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
if(player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};

if("ItemRadio" in assignedItems cursorTarget) then {
cursorTarget removeweapon "ItemRadio";

titleText[localize "STR_NOTF_SmartphoneDrop","PLAIN"];
//Nachricht das smartphone runtergefallen ist. ZEROONE

hint "Ein Smartphone ist auf den Boden gefallen";
_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);
} else { hint "Die Person hat kein Smartphone!"};