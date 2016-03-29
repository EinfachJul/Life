/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F","B_QuadBike_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","O_Truck_02_fuel_F","B_MRAP_01_hmg_F","O_Truck_03_ammo_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_black_F","C_Kart_01_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then {
	_vehicle setVariable["lights",FALSE,TRUE];
} else {
	playsound "blinkerstart";
	_vehicle setVariable["lights",TRUE,TRUE];
	//[[_vehicle,0.12],"noaim_fnc_leftl",true,false] call noaim_fnc_TRY;
	[_vehicle,0.12] remoteExec ["noaim_fnc_leftl",-2];
	[_vehicle,0.12] remoteExec ["noaim_fnc_rightl",-2];
	//[[_vehicle,0.12],"noaim_fnc_rightl",true,false] call noaim_fnc_TRY;
};