#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "Dieses Haus hat noch keinen Besitzer."};
closeDialog 0;

_houseCfg = [(typeOf _house)] call noaim_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call noaim_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if((_house getVariable["house_soldCheck",false])) exitWith {hint "Dieses Haus wurde bereits verkauft!"};

if(_action) then {
	_house setVariable["house_sold",true,true];
	_house setVariable["house_soldCheck",true,true];
	[_house] remoteExec ["TON_fnc_sellHouse",2];
	//[[_house],"TON_fnc_sellHouse",false,false] spawn noaim_fnc_DONE;
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];
	
	life_zgazzy = life_zgazzy + (round((_houseCfg select 0)/2));
	_index = zaki_vehicles find _house;
	if(_index != -1) then {
		zaki_vehicles set[_index,-1];
		zaki_vehicles = zaki_vehicles - [-1];
	};
	
	[format ["HOUSESELL: %1 hat ein Haus fuer %2 verkauft. Position %3", name player, [(round((_houseCfg select 0)/2))] call noaim_fnc_numberText,getPosATL _house],"ax_log",false,false] call noaim_fnc_Loggy;
	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
};