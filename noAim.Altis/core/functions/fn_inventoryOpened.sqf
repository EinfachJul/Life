/*
	Author: Bryan "Tonic" Boardwine
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_isPack","_house"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;


_exit = {
	for "_i" from 1 to 10 do {
		closeDialog 0;
		uisleep 0.1;
	};
	if(!isNull (findDisplay 602)) then {
		closeDialog 0;
		closeDialog 0;
	};
};

// 05.12.2015 - ERWEITERT GEGEN ÖFFNEN VON RUCKSÄCKEN
_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && playerSide != west) then {
	[] spawn _exit;
	hintSilent localize "STR_MISC_Backpack";
	true;
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		uisleep 0.2;
		closeDialog 0;
		uisleep 0.2;
		closeDialog 0;
		uisleep 0.2;
		closeDialog 0;
		uisleep 0.2;
		closeDialog 0;
		uisleep 0.2;
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in zaki_vehicles) && {(_house getVariable ["locked",false])}) then {
		[] spawn _exit;
		hint localize "STR_House_ContainerDeny";
		true;
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air" OR _container isKindOf "ReammoBox_F" OR _container isKindOf "StaticWeapon") exitWith {
	if(!(_container in zaki_vehicles) && {(locked _container) == 2}) exitWith {
//hint localize "STR_MISC_VehInventory";
		[] spawn _exit;
		hintSilent localize "STR_MISC_VehInventory";
		true;
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
/*
if(_container isKindOf "Man" && !alive _container) exitWith {
hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};*/ // LOOT DEAD BODIES ARYX
[] call noaim_fnc_updateClothing;