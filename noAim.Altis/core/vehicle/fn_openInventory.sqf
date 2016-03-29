/*
	Author: Bryan "Tonic" Boardwine
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_rndm"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
//uiSleep random 3.00000;
if(isNull _vehicle OR !(("Land_Wreck_Traw_F" == typeOf _vehicle) OR ("Land_Wreck_Traw2_F" == typeOf _vehicle) OR _vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F" OR _vehicle isKindOF "Box" OR _vehicle isKindOF "ReammoBox_F" OR _vehicle isKindOF "StaticWeapon" OR _vehicle isKindOF "Cargo_base_F")) exitWith {}; //Either a null or invalid vehicle type.

if (typeName (_vehicle getVariable "trunk_in_use") != "STRING") then {_vehicle setVariable["trunk_in_use","",true];};
if (((_vehicle getVariable ["trunk_in_use",""]) != "") && {!([(_vehicle getVariable ["trunk_in_use",""])] call noaim_fnc_isUIDActiv)}) then {_vehicle setVariable["trunk_in_use","",true];};
if ((_vehicle getVariable ["trunk_in_use",""]) == (getPlayerUID player)) then {_vehicle setVariable["trunk_in_use","",true];};
if ((_vehicle getVariable ["trunk_in_use",""]) != "") exitWith {hint "Nur eine Person kann auf den Kofferraum zugreifen!"};
_vehicle setVariable["trunk_in_use",getPlayerUID player,true];

if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

//log
//_toLog = format ["OPENINVENTORY: %1 | %2 hat das inventar von %3 geoeffnet",getPlayerUID player,name player,_vehicle];
//[[1,_toLog],"ax_log",false,false] call noaim_fnc_Loggy;
//log

[_vehicle, player] spawn {
	while {true} do
	{
		if (isNull (findDisplay 3500)) exitWith {};
		if (((_this select 0) getVariable ["trunk_in_use",""]) != getPlayerUID (_this select 1)) exitWith
		{
			hint "Nur eine Person kann auf den Kofferraum zugreifen!";
			(_this select 0) setVariable["trunk_in_use","",true];
			closeDialog 0;
		};

		uiSleep 0.1;
	};
};

[_vehicle] call noaim_fnc_updateVehTrunk;

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call noaim_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call noaim_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call noaim_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use","",true],
	if (_this isKindOf "House_F") then {[_this] call noaim_fnc_updateTrunk};
};
