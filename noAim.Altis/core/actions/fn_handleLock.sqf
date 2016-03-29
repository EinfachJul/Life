/*
	File: fn_handleLock.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handle Lock reconfiguration to fix double click
*/

private ['_veh'];
_veh = [_this,0,objNull] call BIS_fnc_param;

// Delay for locking and unlocking
if(!life_lockToggleAllowed) exitWith {};
life_lockToggleAllowed = false;
[] spawn {
	sleep 2;
	life_lockToggleAllowed = true;
};

if(_veh isKindOf "House_F" && (playerSide == civilian || playerSide == east)) then {
	if(_veh in zaki_vehicles && player distance _veh < 8) then {
		_door = [_veh] call noaim_fnc_nearestDoor;
		if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
		_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
		if(_locked == 0) then {
			_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
			_veh animate [format["door_%1_rot",_door],0];
			systemChat localize "STR_House_Door_Lock";
		} else {
			_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
			_veh animate [format["door_%1_rot",_door],1];
			systemChat localize "STR_House_Door_Unlock";
		};
	};
} else {
	_locked = locked _veh;
	if(_veh in zaki_vehicles && player distance _veh < 8) then {
	if(_locked == 2) then {
			if(local _veh) then {
				_veh lock 0;
			} else {
				//[[_veh,0],"noaim_fnc_lockVehicle",_veh,false] spawn noaim_fnc_TRY;
				[_veh,0] remoteExec ["noaim_fnc_lockVehicle",_veh];
			};
			systemChat localize "STR_MISC_VehUnlock";
		} else {
			if(local _veh) then {
				_veh lock 2;
			} else {
				//[[_veh,2],"noaim_fnc_lockVehicle",_veh,false] spawn noaim_fnc_TRY;
				[_veh,2] remoteExec ["noaim_fnc_lockVehicle",_veh];
			};
			systemChat localize "STR_MISC_VehLock";
		};
	};
};