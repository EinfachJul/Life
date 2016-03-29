/*
	File: vehicleEmpd.sqf
*/
private["_vehicle"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_empd", false])) exitWith {};
_vehicle setVariable["nano_empd",true,true];
if(_vehicle isKindOf "Air") then {
	1 fadeSound 1;
	_vehicle say3D "empwarn";
	sleep 3.35;
	if(local _vehicle) then {
		_vehicle setFuel 0.005;
		_vehicle setHitPointDamage ["HitEngine", 1.0];
	};
};

if(_vehicle isKindOf "Car") then {
	_vehicle say3D "empwarn";
	sleep 3.35;
	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	};
};

if(_vehicle isKindOf "Ship") then {
	_vehicle say3D "empwarn";
	sleep 3.35;
	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};
_vehicle setVariable["nano_empd",false,true];