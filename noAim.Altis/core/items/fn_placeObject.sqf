/*
	File: fn_placeObject.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Places an object in the world.
*/
private ["_item","_index","_object"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if (_item == "") exitWith {};

closeDialog 0;

if (!isNull life_placing) exitWith {hint "Sie platzieren bereits schon einen anderen Gegenstand.";};

_index = [_item,life_placeable] call TON_fnc_index;
if (_index < 0) exitWith {};

_object = ((life_placeable select _index) select 1) createVehicle [0,0,0];
_object attachTo[player,[0,((life_placeable select _index) select 4),0.2]];
_object setDir ((life_placeable select _index) select 3);

life_placing = _object;