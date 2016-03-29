/*
	Author: Bryan "Tonic" Boardwine
	Modified by Aryx
*/
closeDialog 0;
private["_minesi","_itemWeight","_diff","_itemName","_val", "_veh"];

_veh = nearestObjects [player, ["Car", "Air", "Ship"],8];
if(count _veh != 0) exitWith {
	hint localize "STR_NOTF_Mine_Near_Vehicle";
};

switch (true) do
{
	case (player distance (getMarkerPos "corals_1") < 300) : {_minesi = "corals"; _val = 2;};
 	default {_minesi = "";};
};
//Mine check
if(_minesi == "") exitWith {};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_minesi,_val,life_carryWeight,life_maxWeight] call noaim_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

if(!life_SiebAllowed) exitWith {};
life_SiebAllowed = false;
life_action_gather = true;

player say3D "shakepowder";
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_minesi,_diff] call noaim_fnc_handleInv)) then
{
	_itemName = [([_minesi,0] call noaim_fnc_varHandle)] call noaim_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
};

life_action_gather = false;
life_SiebAllowed = true;