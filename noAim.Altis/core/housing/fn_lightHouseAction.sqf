/*
	Author: Bryan "Tonic" Boardwine
	Lights up the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	//[[_house,true],"noaim_fnc_lightHouse",true,false] spawn noaim_fnc_DONE;
	[_house,true] remoteExec ["noaim_fnc_lightHouse",-2];
} else {
	[_house,false] remoteExec ["noaim_fnc_lightHouse",-2];
//	[[_house,false],"noaim_fnc_lightHouse",true,false] spawn noaim_fnc_DONE;
};