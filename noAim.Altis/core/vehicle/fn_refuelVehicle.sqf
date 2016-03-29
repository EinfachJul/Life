/*
	File: fn_refuelVehicle.sqf
	
	Description:
	Manages refueling the nearest car.
*/
_pump = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _pump) exitWith {};
if(life_zgazzy < 2500) exitWith {hint "Sie haben weniger als 2500 € auf Ihrem Bankkonto und daher nicht genug Geld zum Tanken.";};
if((count nearestObjects[_pump,["Car","Truck","Air","Ship"],10]) < 1) exitWith {};

_vehicle = (nearestObjects[_pump,["Car","Truck","Air","Ship"],10]) select 0;
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

life_zgazzy = life_zgazzy - 2500;

if(!local _vehicle) then {
	//[[_vehicle,1],"noaim_fnc_setFuel",_vehicle,false] spawn noaim_fnc_TRY;
	[_vehicle,1] remoteExecCall ["noaim_fnc_setFuel",_vehicle];
} else {
	_vehicle setFuel 1;
};
//cutText[format["Ihr %1 wurde erfolgreich Voll getankt. Danke schön, bis zum naechsten mal!",_vehicleName],"PLAIN DOWN"];
cutText[format[localize "STR_fuelstation_bam",_vehicleName],"PLAIN DOWN"];