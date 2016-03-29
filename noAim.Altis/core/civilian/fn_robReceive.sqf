/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

life_znorak = life_znorak + _cash;
titleText[format[localize "STR_Civ_Robbed",[_cash] call noaim_fnc_numberText],"PLAIN"];

[] call SAX_fnc_updateRequest;
[0] call SAX_fnc_updatePartial;
/*
// Sync life_znorak to DB:
[[getPlayerUID player,playerSide,life_znorak,0],"DB_fnc_updatePartial",false,false] spawn noaim_fnc_DONE;

// Sync life_zgazzy to DB:
[[getPlayerUID player,playerSide,life_zgazzy,1],"DB_fnc_updatePartial",false,false] spawn noaim_fnc_DONE*/