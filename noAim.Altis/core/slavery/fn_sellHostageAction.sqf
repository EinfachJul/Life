/*
	File: fn_sellHostageAction.sqf
	@Foamy
	www.strainonline.com
	www.strainmod.com
	Description:
	Player Sale Action.
*/
#include "..\..\macros.hpp"
private["_unit","_noesckey"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; // There is no spoon
if(life_enslaved) exitWith {hint "Dieser Mensch wurde kuerzlich als Sklave verkauft, Sie muessen eine zeit lang warten bis Sie diese Person wieder verkaufen duerfen!"}; // Target already Enslaved

// Disable Esc key
_noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

// Send player to slave pen
player setPos (getMarkerPos "slave_trader_center");

// Release the player
player setVariable["restrained",false,true];
player setVariable["escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["tempSack",false,true];
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
"DynamicBlur" ppEffectEnable false;

// Set enslaved
player setVariable["enslaved",true,true];
life_enslaved = true;

titleText["Du wurdest als Sklave verkauft, zeit dich hier Freizukaufen findest du nicht?","PLAIN"];
hint "Du wurdest als Sklave verkauft, zeit um dich Freizukaufen!";
sleep 15;
slave_task1 = player createSimpleTask ["slave_task_1"];
slave_task1 setSimpleTaskDescription ["Du musst 20 Baumwolle sammeln um dich selbst freizukaufen","Kauf dich Frei!",""];
slave_task1 setTaskState "Assigned";
player setCurrentTask slave_task1;
waitUntil {!life_enslaved};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _noesckey];