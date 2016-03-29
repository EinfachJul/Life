#include "..\..\macros.hpp"
/*
	Author: Arkensor
	handles requests for picking up various items
*/
private["_curTarget","_curObject"];
_curTarget = cursorTarget;
_curObject = cursorObject;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//OK, it wasn't a player so what is it?
private["_miscItems","_money"];
_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
_money = "Land_Money_F";

//OK, it wasn't a vehicle so let's see what else it could be?
if(!(player getVariable["restrained",false]) && (typeOf _curObject) in _miscItems) then {
	private["_handle"];
	_handle = [_curObject] spawn noaim_fnc_pickupItem;
	waitUntil {scriptDone _handle};
	life_action_inUse = false;
} else {
	if(!(player getVariable["restrained",false]) && (typeOf _curObject) == _money && {!(_curObject getVariable["inUse",false])}) then {
		private["_handle"];
		_curObject setVariable["inUse",TRUE,TRUE];
		_handle = [_curObject] spawn noaim_fnc_pickupMoney;
		waitUntil {scriptDone _handle};
		life_action_inUse = false;
	};
};