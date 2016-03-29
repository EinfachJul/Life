/*
		File: wheel.sqf
		Author: Aryx
		
		Description: Vehicle Modding
*/

_unit = cursorTarget;

if(!(_unit isKindOf "Car")) exitWith {hint "Das Fahrzeug benoetigt keine Reifen.";};
if (vehicle player != player) exitWith {};
if (!([false,"areifen",1] call noaim_fnc_handleInv)) exitWith {};

life_action_in_use = true;
_upp = "A New Wheel placed...";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _unit > 6) exitWith {};
	if(!alive player) exitWith {};
	if(speed player > 2) exitWith {};
	if (!life_action_in_use) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_in_use = false;

if (_success) then
{
	 if(local _unit) then
	{
		_unit setHitPointDamage["HitRFWheel",0];
		_unit setHitPointDamage["HitLFWheel",0];
		_unit setHitPointDamage["HitRF2Wheel",0];
		_unit setHitPointDamage["HitLF2Wheel",0];
		titleText ["Reifen Preis + Zeit: 2000 Euro", "PLAIN"];
		//hint "Reifen Preis + Zeit: 2000 Euro";
	} else {
		getDammage _unit;
		//[{(vehicle player) setHitPointDamage["HitRFWheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
		{(vehicle player) setHitPointDamage["HitRFWheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
		//[{(vehicle player) setHitPointDamage["HitLFWheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
		{(vehicle player) setHitPointDamage["HitLFWheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
		//[{(vehicle player) setHitPointDamage["HitRF2Wheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
		{(vehicle player) setHitPointDamage["HitRF2Wheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
		//[{(vehicle player) setHitPointDamage["HitLF2Wheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
		{(vehicle player) setHitPointDamage["HitLF2Wheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
		titleText ["Reifen Preis + Zeit: 2500 Euro", "PLAIN"];
		//hint "Reifen Preis + Zeit: 2500 Euro";
	};
};