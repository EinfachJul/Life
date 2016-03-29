#include "..\..\macros.hpp"
/*
	File: fn_requestBackup.sqf
	Author: TheRick
	
	Description:
	Puts a marker on the map to request backup at the players position
	It stays for 15 seconds and gets removed again
*/

private["_text","_sp","_markerfw","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(!life_requested_fw) then {
	life_requested_fw = true;

	_uid = getPlayerUID player;
	_text = (player getVariable ["realname",name player]);

	_markerfw = createMarker [_uid, position player ];
	_markerfw setMarkerShape "ICON";
	_markerfw setMarkerType "mil_end";
	_markerfw setMarkerColor "ColorRed";
	_markerfw setMarkerText format["%1 - SOS",_text];

	if(side player == east) then {
		titleText["Ein Spieler hat die Feuerwehr gerufen, bitte auf M nachschauen.","PLAIN"];
	} else {
		sleep 0.1;
		_markerfw setMarkerAlphalocal 0;
		sleep 60;
		deleteMarker _markerfw;
	};

	life_requested_fw = false;
	hint format[localize "STR_Fwehr_PosCall",name player];
} else { 
	hint format[localize "STR_Fwehr_PosTimeCall"];
};