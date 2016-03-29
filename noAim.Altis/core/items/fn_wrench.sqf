/*
    Author: H4SHK3KS (ofpectag:ZO1)
    sets an Item wrench tool to open a wreck
*/
private ["_Wreck","_var"];
if (!alive player) exitWith {hint "Sie sind nicht mehr am leben!";};
if (vehicle player != player) exitWith {hint "Sie muessen aus dem Fahrzeug austeigen..";};
if (life_inv_crowbar < 1) exitWith {hint"Sie benoetigen ein Brecheisen";};
if (life_inv_wrench < 1) exitWith {hint"Sie benoetigen eine Zange.";};
if (playerSide != civilian) exitWith {hint "Sie befinden sich im Dienst!"};

_Wreck = nearestObjects [player, ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"], 20];
if (count _Wreck == 0) exitWith {hint "Es befindet sich kein Schiffswrack innerhalb von 20 metern";};
_Wreck = _Wreck select 0;
 
life_action_inUse = true;
_upp = "Schiffswrack Lagerbox aufbrechen..";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_time = 0.015;
 
while{true} do
{
	uiSleep 0.15;
	_cP = _cP + _time;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
};
 
life_action_inUse = false;
5 cutText ["","PLAIN"];

_var=floor(random 2);
if (_var==1) then {
	[false,"wrench",1] call noaim_fnc_handleInv;
	hint"Die Zange ist in der Mitte zerbrochen beim Knacken der Lagerbox!";
};

[_Wreck] call noaim_fnc_openInventory;