/*
	File: fn_placedObject.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Places an object in the world.
*/

private ["_index"];

if(isNull life_placing) exitWith {};

_index = [typeOf life_placing,life_placeable] call TON_fnc_index;
if (_index < 0) exitWith {};

detach life_placing;
life_placing setPos [(getPos life_placing select 0),(getPos life_placing select 1),0];
life_placing enableSimulationGlobal false;
life_placing setVariable ["owner", player, true];

if (!((life_placeable select _index) select 5)) then { life_placing allowDamage false; };

life_placing = objNull;