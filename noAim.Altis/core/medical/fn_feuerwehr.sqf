/*
	File: fn_feuerwehr.sqf
	Author: Bryan "Tonic" Boardwine
*/
#include "..\..\macros.hpp"

if(FETCH_CONST(zek_medicstufe) < 1) exitWith {};

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 13525)};
_display = findDisplay 13525;
_list = _display displayCtrl 13526;
ctrlShow[13527,false];
ctrlShow[13528,false];
lbClear _list;

{
	if(_x getvariable ["medicanfrage",false]) then {
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case east: {"FW"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach allDeadMen;
