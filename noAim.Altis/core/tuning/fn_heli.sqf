/*
		File: heli.sqf
		Author: Aryx
		
		Description: Vehicle Modding
*/
private["_invhtype"];
_invhtype = _this select 0;

_unit = cursorTarget;

if(!(_unit isKindOf "Air")) exitWith {hint "Das Fahrzeug benoetigt keinen Rotor.";};
if (vehicle player != player) exitWith {};
//if (!([false,"carwheel",1] call noaim_fnc_handleInv)) exitWith {};

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
	if(!([false,_invhtype,1] call noaim_fnc_handleInv)) exitWith {};
	switch (_invhtype) do {
		case "hrotor": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitHRotor",0];
				hint "Hauptrotor Preis + Zeit: 10000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitHRotor",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitHRotor",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Hauptrotor Preis + Zeit: 10500 Euro";
			};
		};
		
		case "vrotor": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitVRotor",0];
				hint "Heckrotor + Zeit: 5000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitVRotor",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitVRotor",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Heckrotor + Zeit: 5500 Euro";
			};
		};
		
		case "avionics": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitAvionics",0];
				hint "Cockpitinstrumente Preis + Zeit: 2000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitAvionics",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitAvionics",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Cockpitinstrumente Preis + Zeit: 2500 Euro";
			};
		};
	};
};