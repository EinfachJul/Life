/*
	Author: Bryan "Tonic" Boardwine
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
if(player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
if(player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};
life_knockout = true;

//[[player,"AwopPercMstpSgthWrflDnon_End2"],"noaim_fnc_animSync",nil,false] spawn noaim_fnc_DONE;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExec ["noaim_fnc_animSync",0];
sleep 0.08;
//[[_target,profileName],"noaim_fnc_knockedOut",_target,false] spawn noaim_fnc_DONE;
[_target,profileName] remoteExec ["noaim_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;