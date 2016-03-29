/*
	Author: Bryan "Tonic" Boardwine
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
if(player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};

if(_target getVariable["robbed",false]) exitWith {};
/*if(_target getVariable["newbie",false]) exitWith {};*/
//[[player],"noaim_fnc_robPerson",_target,false] spawn noaim_fnc_DONE;
[player] remoteExec ["noaim_fnc_robPerson",_target];
_target setVariable["robbed",TRUE,TRUE];