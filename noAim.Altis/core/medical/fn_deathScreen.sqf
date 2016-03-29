/*
	Author: Bryan "Tonic" Boardwine
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nearby = if(([east,getPosATL player,120] call noaim_fnc_nearUnits)) then {" Ja"} else {" Nein"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",[east] call noaim_fnc_playerCount];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];
	sleep 1;
	(isNull (findDisplay 7300))
};