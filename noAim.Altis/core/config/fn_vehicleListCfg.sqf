#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",50000], // 15.000
			["C_Kart_01_Fuel_F",50000], // 15.000
			["C_Kart_01_Red_F",50000], // 15.000
			["C_Kart_01_Vrana_F",50000], // 15.000
			["C_Kart_01_black_F",50000] // 15.000
		];
	};
	
	case "fwehr_air": {
		
		if(license_fwehr_air) then
		{
			_return pushBack ["B_Heli_Light_01_F",200000]; // 225.000
		};
		if(__GETC__(zek_fwehrstufe) > 3) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",400000]; // 600.000 300.000
			_return pushBack ["I_Heli_Transport_02_F",500000]; //750.000 500.000
		};
	};
	
	case "fwehr_ship":
	{
		_return =
		[
			["C_Boat_Civil_01_rescue_F",50000] //75.000
		];
	};
	
	case "fwehr_car":
    {
		if(__GETC__(zek_fwehrstufe) > 0) then
		{
			_return pushBack ["C_Hatchback_01_F",16000]; // 24.000
			_return pushBack ["C_Offroad_01_F",25000];
		};
		if(__GETC__(zek_fwehrstufe) > 1) then
		{
			_return pushBack ["B_Quadbike_01_F",5000];
			_return pushBack ["C_Kart_01_F",50000];
			_return pushBack ["I_Truck_02_box_F",250000];
			_return pushBack ["B_Truck_01_mover_F",125000];
			_return pushBack ["C_Van_01_box_F",65000]; // 75.000 55.000
			_return pushBack ["C_Offroad_01_F",25000]; // 37.500 
		};
		if(__GETC__(zek_fwehrstufe) > 2) then
		{
			_return pushBack ["B_MRAP_01_F",350000];
			_return pushBack ["C_Hatchback_01_sport_F",250000]; // 375.000 75.000
		};
		if(__GETC__(zek_fwehrstufe) > 3) then
		{
			_return pushBack ["I_G_Van_01_transport_F",50000];
			_return pushBack ["C_SUV_01_F",50000]; // 75.000
			_return pushBack ["I_Truck_02_covered_F",260000]; // 187.500 150.000
		};
	};
		
	case "taxi_car":
	{
		_return = // 36000 /3 * 2 | 24000 /2 * 3
		[
			["C_SUV_01_F",40000] //112.500
		];
	};
	
	case "civ_car":
	{
		_return = //
		[
			["B_Quadbike_01_F",3300], // 4.950
			["C_Hatchback_01_F",16000], // 24.000
			["C_Offroad_01_F",25000], // 37.500
			["C_SUV_01_F",40000], // 60.000
			["C_Hatchback_01_sport_F",500000], // 750.000
			["C_Van_01_transport_F",48000], // 72.000
			["C_Van_01_box_F",72000] // 108.000
		];
	};
	
	case "civ_truck":
	{
		_return =
		[	
			["C_Van_01_fuel_F",80000], // 120.000
			["C_Van_01_transport_F",48000], // 72.000
			["C_Van_01_box_F",72000], // 108.000	
			["I_Truck_02_transport_F",250000], // 375.000
			["O_Truck_03_transport_F",1000000], // 1.500.000
			["B_Truck_01_transport_F",3000000], // 4.500.000
			["I_Truck_02_covered_F",350000], // 525.000
			["O_Truck_03_covered_F",1500000], // 2.250.000
			["B_Truck_01_covered_F",3500000], // 5.250.000
			["I_Truck_02_box_F",400000], // 600.000
			["B_Truck_01_box_F",3500000], // 5.250.000
			["O_Truck_03_fuel_F",820000], // 1.230.000
			["B_Truck_01_fuel_F",2700000], // 4.050.000
			["O_Truck_03_device_F",25000000] // 37.500.000
		];	
	};
	
	case "civ_air":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F",300000], // 450.000
			["B_Heli_Light_01_F",360000], // 540.000
			["O_Heli_Light_02_unarmed_F",1500000], //* 2.250.000
			["I_Heli_Transport_02_F",7000000], //10.500.000
			["O_Heli_Transport_04_F",9000000]// 13.500.000
		];
	};
	
	case "civ_airXL":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F",300000], // 450.000
			["B_Heli_Light_01_F",360000], // 540.000
			["O_Heli_Light_02_unarmed_F",1500000], //* 2.250.000
			["I_Heli_Transport_02_F",7000000], //10.500.000
			["O_Heli_Transport_04_F",9000000], // 13.500.000
			["I_Plane_Fighter_03_AA_F",35000000], // 52.500.000
			["B_Plane_CAS_01_F",55000000], //* 82.500.000
			["O_Plane_CAS_02_F",60000000] //* 90.000.000
		];
	};
		
	case "civ_airXD":
	{
		_return =
		[
			["I_Plane_Fighter_03_AA_F",35000000], // 52.500.000
			["B_Plane_CAS_01_F",55000000], //* 82.500.000
			["O_Plane_CAS_02_F",60000000] //* 90.000.000
		];
	};
	
	case "civ_logistika":
	{
		_return = [
            ["B_Slingload_01_Cargo_F",20000000], // 30.000.000
			["Land_Pod_Heli_Transport_04_covered_F",9000000] //1.350.000
		];
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",10000], // 15.000
			["C_Boat_Civil_01_F",50000], // 75.000
			["B_SDV_01_F",1500000] // 2.250.000
		];
	};
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",3300], // 4.950
			["B_G_Offroad_01_F",25000], // 37.500
			["O_MRAP_02_F",2500000], //3.750.000
			["B_MRAP_01_F",3500000], //5.250.000
			["I_MRAP_03_F",7500000] //11.250.000
		];
	};
	
	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",360000], // 540.000
			["O_Heli_Light_02_unarmed_F",2250000],// 3.375.000
			["I_Heli_Transport_02_F",7000000], // 10.500.000
			["O_Heli_Transport_04_F",9000000], // 13.500.000
			["O_Heli_Transport_04_covered_F",6700000],// 10.050.000
			["O_Heli_Transport_04_box_F",25000000],//TARU FRACHT *37.500.0000
			["O_Heli_Transport_04_fuel_F",20000000],//Taru Benzin/Gas *30.000.000
			["B_Heli_Transport_03_unarmed_F",35000000]//52.500.000
		];
	};
		
	case "maf_car":
	{
		_return =
		[
			["C_Hatchback_01_F",12000], // 18.000
			["C_Offroad_01_F",25000], // 37.500
			["C_SUV_01_F",40000], // 60.000
			["C_Hatchback_01_sport_F",500000], // 750.000
			["C_Van_01_transport_F",54000], // 81.000
			["C_Van_01_box_F",80000], // 120.000
			["I_Truck_02_transport_F",250000], // 375.000
			["I_Truck_02_covered_F",350000] // 525.000
		];
	};
	
	case "maf_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",360000], // 540.000
			["O_Heli_Light_02_unarmed_F",2250000], // 3.375.000
			["B_Heli_Transport_01_F",10000000], // 15.000.000
			["I_Heli_Transport_02_F",7000000] //10.500.000
		];
	};
	
	case "clan_veh":
	{
		_return =
		[
			["B_MRAP_01_F",3000000], //13.500.000 *5.000.000
			["B_Heli_Light_01_F",1000000] // 2.250.000
		];
	};
			
	case "cop_car":
	{
		_return pushBack ["B_Quadbike_01_F",5000]; // 7.500
		if(__GETC__(zak_copstufe) > 0) then
		{	
			_return pushBack ["C_Hatchback_01_F",15000]; // 22.500
			_return pushBack ["C_Offroad_01_F",24000]; // 36.000
		};
		if(__GETC__(zak_copstufe) > 1) then
		{	
			_return pushBack ["C_SUV_01_F",30000]; // 45.000
			_return pushBack ["C_Kart_01_F",50000]; // 75.000 *150.000
		};
		if(__GETC__(zak_copstufe) > 2) then
		{	
			_return pushBack ["C_Hatchback_01_sport_F",250000];// 150.000
			_return pushBack ["I_Truck_02_covered_F",260000]; //187500
		};
		if(__GETC__(zak_copstufe) > 3) then
		{	
			_return pushBack ["B_MRAP_01_F",350000];// 225.000
		};
		if(__GETC__(zak_copstufe) > 4) then
		{	
			_return pushBack ["I_MRAP_03_F",600000]; // 525.000
		};
	};
	
	case "cop_air":
	{
		if(__GETC__(zak_copstufe) > 2) then
		{
			_return pushBack ["B_Heli_Light_01_F",200000];// 150.000
		};
		if(__GETC__(zak_copstufe) > 3) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",400000];//300.000
			_return pushBack ["I_Heli_light_03_unarmed_F",600000];// 225.000
		};
	};
		
	case "gsg9_car":
	{
		if(license_cop_gsg9) then
		{
			if(__GETC__(zak_copstufe) > 3) then
			{
				_return pushBack ["C_SUV_01_F",30000]; // 45.000
				_return pushBack ["O_MRAP_02_F",350000]; // 525.000
			};
			if(__GETC__(zak_copstufe) > 4) then
			{
				_return pushBack ["I_MRAP_03_F",600000]; // 525.000
				_return pushBack ["B_Truck_01_ammo_F",6000]; // 525.000
			};
		};
	};
	
	case "gsg9_air":
	{
		if(license_cop_gsg9) then
		{
			if(__GETC__(zak_copstufe) > 2) then
			{
				_return pushBack ["B_Heli_Light_01_F",200000]; // 150000
			};
			if(__GETC__(zak_copstufe) > 3) then
			{
				_return pushBack ["I_Heli_Transport_02_F",500000]; 
				_return pushBack ["B_Heli_Transport_01_F",600000]; // 525.00
			};
			if(__GETC__(zak_copstufe) > 4) then
			{
				_return pushBack ["B_Heli_Transport_03_unarmed_F",600000]; // 525.00
				_return pushBack ["O_Heli_Transport_04_F",600000]; // 525.00
			};
		};
	};

	case "cop_ship":
	{
		_return = [
			["C_Boat_Civil_01_police_F",20000], // 30.000
			["B_SDV_01_F",750000], // 300.000
			["Submarine_01_F",20000],
			["O_Boat_Armed_01_hmg_F",20000],
			["B_Boat_Armed_01_minigun_F",20000],
			["I_Boat_Armed_01_minigun_F",20000]
		];
	};	

	case "donator_hq": //REB
	{
		if(__GETC__(life_donatorlevel) > 0) then
		{
			_return pushBack ["B_Quadbike_01_F",13200]; //
			_return pushBack ["C_SUV_01_F",50000]; //
		};
	};
};
_return;