/*
	File: fn_sellHostage.sqf
	@Foamy
	www.strainonline.com
	www.strainmod.com
	Description:
	Sells the targeted person into Slavery.
*/
#include "..\..\macros.hpp"

private["_unit","_rate"];
_rate = 150000; // change this to change payout.
_unit = cursorTarget;
if(isNull _unit) exitWith {hint "null Target"};
if(!(_unit getVariable ["restrained",false])) exitWith {hint "Die Geseil ist nicht Gefesselt."};
//if(!(_unit getVariable ["hostage",false])) exitWith {hint "Target is not a Hostage!"};
if((_unit getVariable ["enslaved",false])) exitWith { hint "Ihr Geisel wurde kuerzlich verkauft, Sie muessen 5 minuten warten."};
if((player getVariable ["slaver",false])) exitWith { hint "Sie haben kuerzlich jemanden verkauft, und muessen 5 minuten warten."};
if(playerSide == west) exitWith {hint "Sie sind im Dienst!"};
if(side _unit == west) exitWith {hint "Die Polizei kann nicht Verkauft werden."};
if(side _unit == east) exitWith {hint "Die Feuerwehr kann nicht Verkauft werden."};
if(!(_unit getVariable "Escorting")) exitWith {}; //He's not being Escorted.
if(player == _unit) exitWith {hint "Sie koennen sich selbst nicht Verkaufen!"};
if(!isPlayer _unit) exitWith {hint "Das ist keine Geseil."};
if(life_slaver) exitWith {hint "Sie haben bereits eine Geseil verkauft,Sie muessen 5 minuten warten."};

if((player distance (getMarkerPos "slave_trader_marker") > 10)) exitWith {hint "Sie stehen nicht nah genug am Sklavenhaendler."};
if((player distance (getMarkerPos "slave_trader_marker") < 10)) then
{
	//[[getPlayerUID player,player getVariable["realname",name player],"236"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;
	[getPlayerUID player,player getVariable["realname",name player],"236"] remoteExec ["noaim_fnc_wantedAdd",2];
	detach _unit;
	//[[_unit,false],"noaim_fnc_sellHostageAction",_unit,false] spawn noaim_fnc_LAST;
	[_unit,false] remoteExec ["noaim_fnc_sellHostageAction",_unit];
};
/*
[ player] spawn {
	while {true} do
	{
		if (isNull (findDisplay 3500)) exitWith {};
		if (((_this select 0) _unit) != getPlayerUID (_this select 1)) exitWith
		{
			hint "Nur eine Person kann diesen Sklaven Verkaufen!";
			(_this select 0) life_slaver;
			closeDialog 0;
		};

		uiSleep 0.1;
	};
};*/

life_znorak = life_znorak + _rate;
hint "Sie erhalten 150.000 € fuer die Geseil.";
life_slaver = true;
player setVariable["slaver",true,true];
//sleep (30 * 60);
sleep 300;
life_slaver = false;
player setVariable["slaver",false,true];
hint "Sie koennen wieder Menschen versklaven!";