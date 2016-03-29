#include "..\..\macros.hpp"
/*
	File: fn_copCrush.sqf
	Author: Kevin Webb
*/
private["_vehicle","_uid","_owner","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_veh","_ropes"];
_vehicle = cursorTarget;
_veh = typeOf _vehicle;
if(!(_veh in["I_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"] || _vehicle getVariable["stolen",false])) then {
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Armored") || (_vehicle isKindOf "ReammoBox_F") || (_vehicle isKindOf "StaticWeapon") || (_vehicle isKindOf "Cargo_base_F"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if(!alive _vehicle) exitWith {};

if(__GETC__(zak_copstufe) < 3) exitWith { hint "Sie haben einen zu Niedrigen Rang um diesen Befehl verwenden zu koennen!"; };

if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Armored") || (_vehicle isKindOf "ReammoBox_F") || (_vehicle isKindOf "StaticWeapon") || (_vehicle isKindOf "Cargo_base_F")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	_uid = getPlayerUID player;
	_owner = (_vehicleData select 0) select 0;
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	if (playerSide == west) then {
		//[[0,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["noaim_fnc_broadcast",-2];
	} else {
		//[[0,"STR_NOTF_BeingImpoundedExtra",true,[(_vehicleData select 0) select 1,_vehicleName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"STR_NOTF_BeingImpoundedExtra",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["noaim_fnc_broadcast",-2];
	};
	//[[0,format["%1 your %2 is being crushed by the police!",(_vehicleData select 0) select 1,_vehicleName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_DONE;
	life_action_inUse = true;
	
	_upp = "Crushing";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {hint "Crushing Canceled"; life_action_inUse = false;};
	if(!alive player) exitWith {life_action_inUse = false;};
	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "ReammoBox_F") || (_vehicle isKindOf "StaticWeapon") || (_vehicle isKindOf "Cargo_base_F") || (_vehicle isKindOf "Ship"))) exitWith {life_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = (call life_impound_car);};
			case (_vehicle isKindOf "Ship"): {_price = (call life_impound_boat);};
			case (_vehicle isKindOf "Air"): {_price = (call life_impound_air);};
			case (_vehicle isKindOf "ReammoBox_F"): {_price = (call life_impound_log);};
			case (_vehicle isKindOf "Cargo_base_F"): {_price = (call life_impound_log);};
			case (_vehicle isKindOf "StaticWeapon"): {_price = (call life_impound_log);};
		};
		
		life_impound_inuse = true;
		//[[_vehicle,true,player],"TON_fnc_vehicleIsDead",false,false] spawn noaim_fnc_DONE;
		[_vehicle,true,player] remoteExec ["TON_fnc_vehicleIsDead",2];
		_ropes = (_vehicle getvariable ["zlt_ropes", []]);
		{deleteVehicle _x} foreach _ropes;
		_vehicle setvariable ["zlt_ropes", [], true];
		[_vehicle] spawn
		{
			sleep 1;
			if(!isNull _this && !isNil "_this") then {
				deleteVehicle _this;
			};
		};
		if(_uid == _owner) then {
			hint format[localize "STR_NOTF_CannotImpoundOwn"];
		} else {
			hint format[localize "STR_NOTF_Impounded",_type,_price];
			//[[0,"STR_NOTF_HasImpounded",true,[profileName,(_vehicleData select 0) select 1,_vehicleName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_DONE;
			[0,"STR_NOTF_HasImpounded",true,[profileName,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["noaim_fnc_broadcast",-2];
			
			life_zgazzy = life_zgazzy + _price;
			//AX_LOG *DEFEKT FIX
			[format ["CRUSHCAR: %1 (%2) hat %3s %4 zerstoert!", name player, getPlayerUID player, (_vehicleData select 0) select 1, _vehicleName],"ax_log",false,false] call noaim_fnc_Loggy;
		};
	}
	else
	{
		hint "Zerstoeren Abgebrochen";
	};
};
life_action_inUse = false;