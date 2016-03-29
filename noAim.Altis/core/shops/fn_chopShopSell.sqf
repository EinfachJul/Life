/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
//_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck","Air","ReammoBox_F","StaticWeapon","Cargo_base_F"],10]; //25
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

_owners = _vehicle getVariable "vehicle_info_owners";
if(isNil {_owners}) exitWith {
	// Log: CHOP CHEAT
	[format ["WARNING: %1 hat versucht ein %2 ohne Owner zu verkaufen.", name player, typeOf _vehicle],"ax_log",false,false] call noaim_fnc_Loggy;
	hint format ["Du kannst dieses Fahrzeug nicht verkaufen. Ein Administrator wurde informiert. Es besteht akuter Verdacht des Hackings."]; deleteVehicle _vehicle;
};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = life_znorak + _price;

//_toLog = format ["CHOPSHOP: %1 hat %2 für %3 verkauft.", name player, typeOf _vehicle, [_price] call noaim_fnc_numberText];
//[_toLog,"ax_log",false,false] call noaim_fnc_DONEax;

[format ["CHOPSHOP: %1 hat %2 für %3 verkauft.", name player, typeOf _vehicle, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;

[player,_vehicle,_price,_price2] remoteExec ["TON_fnc_chopShopSell",2];
//[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn noaim_fnc_DONE;
closeDialog 0;

life_cgar_inUse = time;