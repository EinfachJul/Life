/*
	File: fn_vehicleColorCraftCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_newItem"];
_newItem = [_this,0,"",[""]] call BIS_fnc_param;

switch (_newItem) do
{
	case "C_SUV_01_F": {5};
	case "O_Truck_03_ammo_F": {0};
	case "C_Heli_Light_01_civil_F": {0};
	default {0};
};