/*
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit == west || side _unit == east) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid

[_unit,player,false] remoteExec ["noaim_fnc_wantedBounty", 2];

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
//[[_unit,false,_time],"noaim_fnc_jail",_unit,false] spawn noaim_fnc_DONE;
[_unit,false,_time] remoteExec ["noaim_fnc_jail", _unit];
//[[0,format[(localize "STR_NOTF_Arrested_1"), _unit getVariable["realname",name _unit], profileName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_DONE;
[0,format[localize "STR_NOTF_Arrested_1",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["noaim_fnc_broadcast",-2];

_data = missionNamespace getVariable "Arrest_Prof";
_addExpAmount = 50;
_addExpAmount = _addExpAmount + (5 * (_data select 0));
["Arrest_Prof",_AddExpAmount] call noaim_fnc_addExp;
[0,format["Sie erhalten %1 XP fuer das einsperren eines Kriminellen", _addExpAmount]] remoteExecCall ["noaim_fnc_broadcast",player];

//[[0,format["Sie erhalten %1 XP fuer das einsperren eines Kriminellen", _addExpAmount]],"noaim_fnc_broadcast",player,false] spawn noaim_fnc_TRY;