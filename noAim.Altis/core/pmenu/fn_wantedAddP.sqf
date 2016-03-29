#include "..\..\macros.hpp"
private["_unit","_amount"];
if(playerSide != west) exitWith {hint "Was tust du?"};
if(__GETC__(zak_copstufe) < 1) exitWith {hint "Du Made hast nicht genug Ansehen bei der Polizei um Verbrecher von der Liste zu entfernen" }; //LYNX 28.11.2015
if((lbCurSel 2406) == -1) exitWith {hint "Du musst einen Taeter aussuchen"};
if((lbCurSel 2407) == -1) exitWith {hint "Du musst ein Verbrechen aussuchen"};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
if(side _unit == west) exitWith {hint "Du kannst keinen Polizisten ankreiden" };
if(_unit == player) exitWith {hint "Du kannst dich nicht zur Fahndung ausschreiben lassen";};
if(isNull _unit) exitWith {};

//[[1,format["%1 wird gesucht.",_unit getVariable["realname",name _unit],_amount,getPlayerUID _unit]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
[1,format["%1 wird gesucht.",_unit getVariable["realname",name _unit],_amount,getPlayerUID _unit]] remoteExecCall ["noaim_fnc_broadcast",west];

//[[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY; 
[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount] remoteExec ["noaim_fnc_wantedAdd",2];

//AX_LOG NEED TEST
[format ["COPABUSE: Beamter %1(%2) hat %3(%4) wegen %5 auf die Fahndungsliste gesetzt.", name player, getPlayerUID player, name _unit, getPlayerUID _unit, _amount],"ax_log",false,false] call noaim_fnc_Loggy;