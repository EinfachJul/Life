#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "ReammoBox_F") OR (_vehicle isKindOf "StaticWeapon") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	_index = [_var,life_illegal_items] call TON_fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
	};
} foreach (_vehicleInfo select 0);

if(_value > 0) then
{
	//[[0,"STR_NOTF_VehContraband",true,[[_value] call noaim_fnc_numberText]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
	[0,"STR_NOTF_VehContraband",true,[[_value] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",-2];
	life_zgazzy = life_zgazzy + _value;
	_vehicle setVariable["Trunk",[],true];
}
else
{
	hint localize "STR_Cop_NoIllegalVeh";
};