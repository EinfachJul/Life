/*
	Author: Bryan "Tonic" Boardwine
	Lists impounded vehicles.
*/
private["_display","_cars","_name","_pic","_color","_text","_price"];
_boxType = ["B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_covered_F","Box_IND_Wps_F","Box_IND_WpsSpecial_F","Box_IND_WpsLaunch_F","Box_IND_Support_F"];
if(!dialog) then
{
	if(!(createDialog "Life_impound_menu")) exitWith {};
	life_impound_yard = _this select 3;
};
disableSerialization;

_display = findDisplay 2800;
if(isNull _display) exitWith {};
_cars = _display displayCtrl 2801;
lbClear _cars;

for "_i" from 0 to (count zaki_vehicles)-1 do
{
	_veh = zaki_vehicles select _i;
	if(_veh distance impound_obj < 50) then
	{
		_price = [_veh] call noaim_fnc_impoundPrice;
		switch (true) do
		{
			case (_veh isKindOf "Car") : {_price = _price + 100;};
			case (_veh isKindOf "Air") : {_price = _price + 650;};
			case (_veh isKindOf "Ship") : {_price = _price + 50;};
			case (typeof _veh in _boxType) : {_price = _price + 50;};
		};
	
		if(_price > life_znorak) then
		{
			_price = _price + 200;
		};
		_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call noaim_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text == "()") then
		{
			_text = "";
		};
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_cars lbAdd format["%1 %2 - Cost: €%3",_name,_text,[_price] call noaim_fnc_numberText];
		_cars lbSetPicture [(lbSize _cars)-1,_pic];
		_cars lbSetData [(lbSize _cars)-1,str(_i)];
		_cars lbSetValue [(lbSize _cars)-1,_price];
	};
};