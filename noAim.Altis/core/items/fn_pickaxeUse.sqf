/*
	Author: Bryan "Tonic" Boardwine
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val", "_veh"];

_veh = nearestObjects [player, ["Car", "Air"],8];
if(count _veh != 0) exitWith {
	hint localize "STR_NOTF_Mine_Near_Vehicle";
};

switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "zink_1") < 30): {_mine = "zinku"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 40): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "alumine_1") < 40): {_mine = "aluminiumraw"; _val = 2;};
	case (player distance (getMarkerPos "schwefel_1") < 50) : {_mine = "schwefelu"; _val = 2;};
	case (player distance (getMarkerPos "diamond_1") < 20): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "bleimine_1") < 40) : {_mine = "leadraw"; _val = 1;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call noaim_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

if(!life_pickAxeAllowed) exitWith {};
life_pickAxeAllowed = false;
life_action_gather = true;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2.5;
};

if(([true,_mine,_diff] call noaim_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call noaim_fnc_varHandle)] call noaim_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
};

life_action_gather = false;
life_pickAxeAllowed = true;