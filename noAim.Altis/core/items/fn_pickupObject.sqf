/*
	File: fn_pickupObject.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Removes a placed object from the world.
*/
private ["_item","_index","_object"];

_item = cursorTarget;
if (isNull _item) then
{
	_item = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
	if (isNull _item) exitWith {};
};

_index = [typeOf _item, life_placeable] call TON_fnc_index;
if (_index < 0) exitWith {hint "Dieser Gegenstand kann nicht aufgehoben werden."};
if (isNull (_item getVariable ["owner",objNull])) exitWith { hint "Dieser Gegenstand ist zu Schwer oder befaestigt, und kann daher nicht aufgehoben werden." };

_placable = life_placeable select _index;
if (!([true,_placable select 0,1] call noaim_fnc_handleInv)) exitWith { hint format["Sie besitzen nicht genuegend platz in ihrem Inventar fuer ein(e) %1.", _placable select 2] };

hint format["Sie haben ein(e) %1 aufgehoben.", _placable select 2];
deleteVehicle _item;