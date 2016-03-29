/*
	Author: Bryan "Tonic" Boardwine
	Retrains the target.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;

[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["noaim_fnc_broadcast",west];
//[[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]],"noaim_fnc_broadcast",west,FALSE] call noaim_fnc_TRY;