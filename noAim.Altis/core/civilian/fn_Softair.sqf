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

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];

disableUserInput true;
player switchMove "AcinPercMstpSnonWnonDnon_agony";
sleep 3.5;
player playMoveNow "Incapacitated";

		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};

_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
_hndlBlur = ppEffectCreate ["DynamicBlur",450];
_hndlBlur ppEffectEnable true;
_hndlBlur ppEffectAdjust [30];
_hndlBlur ppEffectCommit 7;
_hndlGrain = ppEffectCreate ["filmGrain",450];
_hndlGrain ppEffectEnable true;
_hndlGrain ppEffectAdjust [1, 10, 4, 0, 0, true];
_hndlGrain ppEffectCommit 9;
sleep 13 + random 5;
_hndlBlur ppEffectAdjust [0];
_hndlBlur ppEffectCommit 3;
_hndlGrain ppEffectAdjust [0, 10, 4, 0, 0, true];
_hndlGrain ppEffectCommit 3;
ppEffectDestroy _hndlBlur;
ppEffectDestroy _hndlGrain;
player playMoveNow "amovppnemstpsraswrfldnon";
disableUserInput false;
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];