/*
	Author: Bryan "Tonic" Boardwine
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
createDialog "shops_menu";

[] call noaim_fnc_virt_update;