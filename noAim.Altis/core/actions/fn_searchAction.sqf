/*
	Author: Bryan "Tonic" Boardwine
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
[player,"patdown"] call noaim_fnc_globalSound;
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Konnte Person nicht durchsuchen"};
//[[player],"noaim_fnc_searchClient",_unit,false] spawn noaim_fnc_DONE;
[player] remoteExec ["noaim_fnc_searchClient",_unit];
life_action_inUse = true;