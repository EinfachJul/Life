/*
	Play sound global
*/
private["_source","_sound"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,""] call BIS_fnc_param;

if(isNull _source) exitWith {};
if(_sound == "") exitWith {};

//[[_source,_sound],"noaim_fnc_globalSoundClient",true,false] spawn noaim_fnc_DONE;
[_source,_sound] remoteExec ["noaim_fnc_globalSoundClient",-2];