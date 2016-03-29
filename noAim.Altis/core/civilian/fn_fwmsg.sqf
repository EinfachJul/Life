/*
	File: fn_fwmsg.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_mode","_unit","_name"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;

switch (_mode) do {
	case 1:
	{
		["TextMessage",[format["Die Feuerwehr ist auf dem Weg!"]]] call bis_fnc_showNotification;
		life_income = true;
		player setvariable["fwoffline",true,true];
		player setvariable["fwname",_name,true];
	};
	case 2: 
	{
		["TextMessage",[format["Die Feuerwehr hat die Anfrage abgebrochen!"]]] call bis_fnc_showNotification;
		life_income = false;
		player setvariable["fwoffline",false,true];
	};
};