#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {hint "This house is already owned even though you shouldn't be seeing this hint..."};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};
if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call noaim_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

if((_house getVariable["house_owned",false])) exitWith {hint "Dieses Haus ist bereits im Besitz, auch wenn Sie dies nicht wissen sollten.."};
_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call noaim_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_zgazzy < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	//[[_uid,_house],"TON_fnc_addHouse",false,false] spawn noaim_fnc_DONE;
	[_uid,_house] remoteExec ["TON_fnc_addHouse",2];
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	life_zgazzy = life_zgazzy - (_houseCfg select 0);
	[6] call SAX_fnc_updatePartial;
	zaki_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	
	[format ["HOUSEBUY: %1 hat ein Haus fuer %2 gekauft. Position %3", name player, [(_houseCfg select 0)] call noaim_fnc_numberText, getPosATL _house],"ax_log",false,false] call noaim_fnc_Loggy;
};