/*
	Author: Bryan "Tonic" Boardwine
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_minesh","_itemWeight","_diff","_itemName","_val", "_veh"];

_veh = nearestObjects [player, ["Car", "Air"],8];
if(count _veh != 0) exitWith {
	hint localize "STR_NOTF_Mine_Near_Vehicle";
};

switch (true) do
{
	case (player distance (getMarkerPos "sand_1") < 50) : {_minesh = "sand"; _val = 2;};
	default {_minesh = "";};
};
//Mine check
if(_minesh == "") exitWith {};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_minesh,_val,life_carryWeight,life_maxWeight] call noaim_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

if(!life_ShovelAllowed) exitWith {};
life_ShovelAllowed = false;
life_action_gather = true;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2.5;
};

if(([true,_minesh,_diff] call noaim_fnc_handleInv)) then
{
	_itemName = [([_minesh,0] call noaim_fnc_varHandle)] call noaim_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
};

life_action_gather = false;
life_ShovelAllowed = true;