/*
	Author: Bryan "Tonic" Boardwine
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
//if((side player == civilian) && !license_civ_gun) exitWith {hint "Du benoetigst einen Waffenschein um andere Bewohner von Altis fesseln zu koennen.";};
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit || side _unit == east) exitWith {};
if(playerSide == civilian && player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
if(playerSide == civilian && player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};
if((player getVariable "restrained") || (player getVariable "Escorting") || (player getVariable "transporting") || (life_is_arrested) || (life_istazed)) exitWith {hint "Hallo???? Du bist selber gefesselt... WIE WILLST DU SO JEMAND FESSELN????? tzzzzz.";};
if((player distance _unit > 3)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
[player,"handcuffs"] call noaim_fnc_globalSound;
_unit setVariable["restrained",true,true];
//[[player], "noaim_fnc_Zrestrain", _unit, false] spawn noaim_fnc_DONE;
[player] remoteExec ["noaim_fnc_Zrestrain", _unit];
/*
if(playerside == west) then 
{
	//[[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_DONE;
} else {
	//[[0,"STR_NOTF_Restrained2",true,[_unit getVariable["realname", name _unit], profileName]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_DONE;
};*/

//[[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["noaim_fnc_broadcast",west];