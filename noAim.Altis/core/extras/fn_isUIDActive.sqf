#define PARAM(A,S,T) if (!isNil {A} && {typeName A == "ARRAY"} &&  {S >= 0} && {count A > S}) then {if (typeName (A select S) == typeName T) then {A select S} else {diag_log format["[error pos] paramMethode - [A:%1|S:%2|T:%5(%3)] Fehler #200 (type:%4) [%6|%7]",A,S,T,typeName (A select S),typeName T,_fnc_scriptName,_fnc_scriptNameParent]; nil}} else {diag_log format["[error pos] paramMethode - [A:%1|S:%2|T:%3(%4)] Fehler #100 [%5|%6]",A,S,typeName T,T,_fnc_scriptName,_fnc_scriptNameParent]; nil}
/*
	Author: Bryan "Tonic" Boardwine
	Modified by: [BBQCAMP.de]-Team
*/
private["_uid","_ret"];
_uid = PARAM(_this,0,"");

if (isNil "_uid") exitWith {false};
if (_uid == "") exitWith {false};

_ret = false;
{
	if (getPlayerUID _x == _uid) exitWith {_ret = true;};
} forEach playableUnits;

_ret;
