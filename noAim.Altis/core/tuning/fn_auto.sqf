/*
		File: auto.sqf
		Author: Aryx
		
		Description: Vehicle Modding
*/
private["_invatype"];
_invatype = _this select 0;
_unit = cursorTarget;

if(!(_unit isKindOf "Car")) exitWith {hint "Das Fahrzeug benoetigt keine Reifen!";};
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
	
	if(!([false,_invatype,1] call noaim_fnc_handleInv)) exitWith {};
	switch (_invatype) do {
	
		case "carwheel": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitRFWheel",0];
				_unit setHitPointDamage["HitLFWheel",0];
				_unit setHitPointDamage["HitRF2Wheel",0];
				_unit setHitPointDamage["HitLF2Wheel",0];
				hint "Reifen Preis + Zeit: 2000 Euro";
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
				hint "Reifen Preis + Zeit: 2500 Euro";
			};
		};
		
		case "truckwheel": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitLBWheel",0];
				_unit setHitPointDamage["HitRBWheel",0];
				_unit setHitPointDamage["HitLMWheel",0];
				_unit setHitPointDamage["HitRMWheel",0];
				hint "Reifen Preis + Zeit: 2000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitLBWheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitLBWheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitRBWheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitRBWheel",0];} remoteExec ["BIS_fnc_spawn",_unit];				
				//[{(vehicle player) setHitPointDamage["HitLMWheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST; 
				{(vehicle player) setHitPointDamage["HitLMWheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitRMWheel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST; 
				{(vehicle player) setHitPointDamage["HitRMWheel",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Reifen Preis + Zeit: 3500 Euro";
			};
		};
		
		case "scrapbody": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitBody",0];
				hint "Blechboden Preis + Zeit: 1000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitBody",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitBody",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Blechboden Preis + Zeit: 1500 Euro";
			};
		};
		
		case "scraphull": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitHull",0];
				hint "Blechteile Preis + Zeit: 1000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitHull",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitHull",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Blechboden Preis + Zeit: 1500 Euro";
			};
		};
		
		case "glasplate": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitRGlass",0];
				_unit setHitPointDamage["HitLGlass",0];
				_unit setHitPointDamage["HitGlass1",0];
				_unit setHitPointDamage["HitGlass2",0];
				_unit setHitPointDamage["HitGlass3",0];
				_unit setHitPointDamage["HitGlass4",0];
				_unit setHitPointDamage["HitGlass5",0];
				_unit setHitPointDamage["HitGlass6",0];
				hint "Glascheiben + Zeit: 2000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitRGlass",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitRGlass",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitLGlass",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitLGlass",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitGlass1",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitGlass1",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitGlass2",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitGlass2",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitGlass3",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitGlass3",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitGlass4",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitGlass4",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitGlass5",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitGlass5",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitGlass6",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitGlass6",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Glascheiben + Zeit: 2500 Euro";
			};
		};
		
		case "tankbody": {
			if(local _unit) then
			{
				_unit setHitPointDamage["HitFuel",0];
				hint "Tank Preis + Zeit: 3000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["HitFuel",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitFuel",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Tank Preis + Zeit: 3500 Euro";
			};
		};
		
		case "enginebody": {
			if(local _unit) then
			{
				_unit setHitPointDamage["hitEngine",0];
				_unit setHitPointDamage["hitEngine2",0];
				_unit setHitPointDamage["HitEngine3",0];
				hint "Motor Preis + Zeit: 10000 Euro";
			} else {
				getDammage _unit;
				//[{(vehicle player) setHitPointDamage["hitEngine",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["hitEngine",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["hitEngine2",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["hitEngine2",0];} remoteExec ["BIS_fnc_spawn",_unit];
				//[{(vehicle player) setHitPointDamage["HitEngine3",0];},"BIS_fnc_spawn",_unit,false] spawn noaim_fnc_LAST;
				{(vehicle player) setHitPointDamage["HitEngine3",0];} remoteExec ["BIS_fnc_spawn",_unit];
				hint "Motor Preis + Zeit: 15000 Euro";
			};
		};
	};
};