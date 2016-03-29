#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_messageBox_confirm"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(isNil "life_cgar_inUse") then {life_cgar_inUse = time - 121 ;};
if(life_cgar_inUse + (120) >= time) exitWith {closeDialog 0;hint format["Du kannst ein Fahrzeug nur alle 2 Minuten verkaufen. Verbleibende Zeit: %1:%2",4 - floor ((time - life_cgar_inUse) / 60),59 - round (time - life_cgar_inUse - (floor ((time - life_cgar_inUse) / 60)) * 60)];};

_price = [playerSide,life_garage_type,_vehicle] call noaim_fnc_getVehicleSellPrice;


_vehiclename = getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName");

_messageBox_confirm = [
		format[localize "STR_Garage_VerkaufenCheck",_vehiclename,[_price] call noaim_fnc_numberText],
		localize "STR_Garage_VerkaufenCheck",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

if(!_messageBox_confirm) exitWith {hint localize "STR_NOTF_ActionCancel";};

//[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn noaim_fnc_DONE;
[_vid,_pid,_price,player,life_garage_type] remoteExec ["TON_fnc_vehicleDelete",2];
hint format[localize "STR_Garage_SoldCar",[_price] call noaim_fnc_numberText];
life_zgazzy = life_zgazzy + _price;

[format ["GARAGESELL: %1 hat %2 für %3 verkauft.", name player, _vehicle, _price],"ax_log",false,false] call noaim_fnc_Loggy;

life_cgar_inUse = time;
closeDialog 0;