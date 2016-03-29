/*
	Author: Bryan "Tonic" Boardwine
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj","_curWep","_curMags","_attach"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};
if(player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
if(player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
disableUserInput true;
player playMoveNow "Incapacitated";

	_curWep = currentWeapon player;
	_curMags = magazines player;
	_attach = if(primaryWeapon player != "") then {primaryWeaponItems _target} else {[]};
	{player removeMagazine _x} foreach _curMags;
	player removeWeapon _curWep;
	player addWeapon _curWep;
	if(count _attach != 0 && primaryWeapon _target != "") then
	{
		{
			_target addPrimaryWeaponItem _x;
		} foreach _attach;
	};
	if(count _curMags != 0) then
	{
		{player addMagazine _x;} foreach _curMags;
	};

_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
_target attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "amovppnemstpsraswrfldnon";
disableUserInput false;
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];