#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_curObject"];
_boxType = ["B_Slingload_01_Cargo_F","Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_covered_F"];
_curObject = cursorObject;
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};

_isWater = surfaceIsWater (getPosASL player);
if(isNull _curObject) then {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then 
		{
			if (typeOf _fish in ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F"]) exitWith {[_fish] call noaim_fnc_catchFish;};
		};
	} else {
	
		if(playerSide == civilian) exitWith {[] call noaim_fnc_gather;};
	};
};

if(_curObject isKindOf "Animal" && {!alive _curObject}) exitWith {
   [_turtle] spawn noaim_fnc_jagen;
};

_FSAbfrage = nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"], 3];
if((count _FSAbfrage) > 0) exitWith {[] spawn noaim_fnc_D41_Tanke;};

/*if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[4199.25,17.8,0],"Land_Research_house_V1_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Factory_Main_F"]) == _curTarget) OR ((player distance [9662.72,8818.95,1.01383]) < 5)) exitWith {
	[_curTarget] call noaim_fnc_houseMenu;
};*/

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call noaim_fnc_houseMenu;
};


if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide == east}) exitWith {
	if((playerSide == east) && {"Medikit" in (items player)}) then {
		[_curTarget] call noaim_fnc_revivePlayer;
	};
};

/*
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide == west}) exitWith {
	
	if((__GETC__(zak_copstufe) > 4) && {"Medikit" in (items player)}) then {
	_medicsOnline = {_x != player && side _x == east} count playableUnits;
	if(_medicsOnline < 1) then {
		[_curTarget] call noaim_fnc_revivePlayer;
	};
};*/

//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == west && (player distance _curTarget) < 4) then {
		[_curTarget] call noaim_fnc_copInteractionMenu;
	};
	if((_curTarget getVariable["restrained",false]) && !dialog && (playerSide == civilian) && (player distance _curTarget) < 4) then {
		[_curTarget] call noaim_fnc_civInteractionMenu;
	};
	if(!(player getVariable["restrained",false]) && !dialog && playerSide == east) then
	{
		[_curTarget] call noaim_fnc_medInteractionMenu;
	};
	if(!(player getVariable["restrained",false]) && !dialog && playerSide == independent) then
	{
		[_curTarget] call noaim_fnc_alacInteractionMenu;
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "ReammoBox_F") OR (_curTarget isKindOf "StaticWeapon") OR (_curTarget isKindOf "Cargo_base_F") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F"];
	//_animalHuntTypes = ["Hen_random_F","Goat_random_F","Sheep_random_F","Cock_random_F","Rabbit_F","Turtle_F"];
	
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call noaim_fnc_vInteractionMenu;
			};
		};
	} else {
		if((typeOf _curObject) in _animalTypes) then {
			private["_handle"];
			_handle = [_curObject] spawn noaim_fnc_catchFish;
			waitUntil {scriptDone _handle};
		} else {
			if(!(player getVariable["restrained",false]) && (typeOf _curObject) in _miscItems) then {
				private["_handle"];
				_handle = [_curObject] spawn noaim_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				if(!(player getVariable["restrained",false]) && (typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn noaim_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};