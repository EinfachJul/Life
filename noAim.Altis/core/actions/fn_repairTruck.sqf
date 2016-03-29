#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_exit"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
_exit = {
	if(!(__GETC__(zek_fwehrstufe) > 0)) then {
		player addItem "ToolKit";
	};
};

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "ReammoBox_F") OR (_veh isKindOf "StaticWeapon") OR (_veh isKindOf "Cargo_base_F") OR (_veh isKindOf "Slingload_base_F")) then
{
	if("ToolKit" in (items player)) then
	{
		player removeItem "ToolKit";

		if(__GETC__(zek_fwehrstufe) > 0) then {
			player addItem "ToolKit";
		};

		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Repariere %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		if(player getVariable["side",""] == "med") then {
		_cP = 0.06;
		}else{
		_cP = 0.01;
		};
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.55;
			if(player getVariable["side",""] == "med") then {
			_cP = _cP + 0.06;
			}else{
			_cP = _cP + 0.01;
			};
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false; call _exit};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_VehicleGetOut","PLAIN"]; call _exit};
		_veh setDamage 0;
		titleText[localize "STR_NOTF_VehicleRepaired","PLAIN"];
		_data = missionNamespace getVariable ("Repair_Prof");
    	_addExpAmount = 25;
    	_addExpAmount = _addExpAmount + (5 * (_data select 0));
		["Repair_Prof",_AddExpAmount] call noaim_fnc_addExp;
		
		if(playerSide == east) then {
			_data = missionNamespace getVariable ("RepairCop_Prof");
			_addExpAmount = 25;
			_addExpAmount = _addExpAmount + (5 * (_data select 0));
			["RepairCop_Prof",_AddExpAmount] call noaim_fnc_addExp;
		};
	};
};