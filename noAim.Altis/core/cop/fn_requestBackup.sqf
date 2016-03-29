#include "..\..\macros.hpp"
/*
	File: fn_requestBackup.sqf
	Author: TheRick
	
	Description:
	Puts a marker on the map to request backup at the players position
	It stays for 15 seconds and gets removed again
*/
private["_text","_sp","_marker"];
if(playerSide != west) exitWith {};

life_requested_backup = true;
_uid = getPlayerUID player;
_text = (player getVariable ["realname",name player]);

if (playerSide == west) then {
	_marker = createMarker [_uid, position player ];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_end";
	_marker setMarkerColor "ColorOPFOR";
	_marker setMarkerText _text;
};
//[[0,format["%1 ruft fuer Verstaerkung!!! Sucht auf der Karte nach seiner Markierung.", _text]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
[0,format["%1 ruft fuer Verstaerkung!!! Sucht auf der Karte nach seiner Markierung.", _text]] remoteExecCall ["noaim_fnc_broadcast",west];

sleep 25;
deleteMarker _marker;
life_requested_backup = false;