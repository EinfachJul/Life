#include "..\macros.hpp"
/*
	File: fn_createObjects.sqf
	Author: MarkusSR1984
	Description: This is a File :P
*/

// Befehl zum auslesen der Objecte:

_life_Objects = [];
_object_Files = [];
_object_Files pushBack "core\extras\build_clanbase1.sqf";
_object_Files pushBack "core\extras\build_mafia.sqf";
_object_Files pushBack "core\extras\build_taxi.sqf";

{
	{
		_x call noaim_fnc_objectInit;
		false;
	} count (call compile preprocessFileLineNumbers _x);
	false;
} count _object_Files;
