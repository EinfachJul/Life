/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(_vehicle getVariable["nano_empd",false]) exitWith { hint "Das EMP warnt gerade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen"; };
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	//[[_vehicle], "noaim_fnc_vehicleEmpd",crew _vehicle,false] call noaim_fnc_DONE;
	[_vehicle] remoteExec ["noaim_fnc_vehicleEmpd",(crew _vehicle)];
};