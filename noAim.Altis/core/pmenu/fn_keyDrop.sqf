/*
	Author: Bryan "Tonic" Boardwine
	Drops the key.
*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "No Data Selected";};
_index = (parseNumber(_list lbData _sel));
_vehicle = zaki_vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {hint "Sie koennen die Hausschluessel nicht entfernen!"};
_owners = _vehicle getVariable "vehicle_info_owners";

_index2 = [(getPlayerUID player),_owners] call TON_fnc_index;
zaki_vehicles = zaki_vehicles - [_vehicle];
_owners set[_index,-1];
_owners = _owners - [-1];
_vehicle setVariable["vehicle_info_owners",_owners,true];

[] spawn noaim_fnc_keyMenu;