/*
	Author: Bryan "Tonic" Boardwine
	Returns the licenses to the cop.
*/
private["_cop"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		_licenses = _licenses + ([_x select 0] call noaim_fnc_varToStr) + "<br/>";
	};
} foreach life_licenses;

if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

//[[profileName,_licenses],"noaim_fnc_licensesRead",_cop,FALSE] spawn noaim_fnc_DONE;
[profileName,_licenses] remoteExec ["noaim_fnc_licensesRead",_cop];