/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(_vehicle getVariable["nano_warned",false]) exitWith { hint "Das EMP warnt gerade schon ein Fahrzeug"; };
	nn_empInUse = true;
	_index = lbCurSel (2902);
	if(_index == -1) exitWith { hint "Kein Fahrzeug ausgewahlt!"; };
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	//[[_vehicle], "noaim_fnc_vehicleWarned",crew _vehicle,false] call noaim_fnc_DONE;
	[_vehicle] remoteExec ["noaim_fnc_vehicleWarned",crew _vehicle];
};