_target = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _target) exitWith {};
player moveInCargo _target;