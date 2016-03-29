/*
	File: fn_medicservice.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_mode","_deathcorpse","_display"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;

disableSerialization;
_display = findDisplay 13525;
_deathcorpse = lbData[13526,lbCurSel (13526)];
_deathcorpse = call compile format["%1", _deathcorpse];

if(isNil "_deathcorpse") exitwith {};
if(isNull _deathcorpse) exitWith {};
switch (_mode) do {
	case 1: { [1,profileName] remoteExec ["noaim_fnc_fwmsg",_deathcorpse]; };
	case 2: { [2] remoteExec ["noaim_fnc_fwmsg",_deathcorpse]; };
};
closeDialog 0;