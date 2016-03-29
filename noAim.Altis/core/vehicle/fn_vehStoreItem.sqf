#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Author: Bryan "Tonic" Boardwine
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call noaim_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call noaim_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call noaim_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F" OR life_trunk_vehicle isKindOf "Box" OR life_trunk_vehicle isKindOf "ReammoBox_F" OR life_trunk_vehicle isKindOf "Cargo_base_F" OR life_trunk_vehicle isKindOf "StaticWeapon")}) exitWith {hint "Du kannst Goldbarren nur in Bodengebundene Fahrzeuge einlagern!"};

_Truck = TypeOf life_trunk_vehicle;
_FuelStuff = ["oilu","oilp","gas"]; //Wich Items can be stored in?
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Heli_Transport_04_fuel_F"]; //Fuel Trucks, who are allowed to carry fuel

switch (true) do
{
case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 3}; //NonFuel in FuelTruck -> Nope
case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};

if (life_TankLaster == 3) exitWith {hint "Du kannst nur Oel oder Gas in das Fahrzeug laden!)";};
if (life_TankLaster == 4) exitWith {hint "Du kannst Oel oder Gas nur in das entsprechnden Fahrzeug laden!)";};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(life_znorak < _num) exitWith {hint "Du hast nicht genug Geld um es im Fahrzeug zu lagern!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
	else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_znorak = life_znorak - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call noaim_fnc_vehInventory;
}
else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist voll oder du kannst nicht soviel auf einmal einlagern."};

	if(!([false,_ctrl,_num] call noaim_fnc_handleInv)) exitWith {hint "Die Items konnten nicht ins Fahrzeug gelegt werden.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
	else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call noaim_fnc_vehInventory;
};
//[3] call SAX_fnc_updatePartial;