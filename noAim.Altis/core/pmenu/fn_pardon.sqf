/*
	Author: Bryan "Tonic" Boardwine
	Pardons the selected player.
*/
private["_display","_list","_uid"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_uid = _data select 0;
[_uid] remoteExec ["noaim_fnc_wantedRemove",2];
//[[_uid],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_DONE;