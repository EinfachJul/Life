/*
	Author: Bryan "Tonic" Boardwine
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	//=== KARTs
	case "C_Kart_01_F": {5};
	case "C_Kart_01_Blu_F": {5};
	case "C_Kart_01_Fuel_F": {5};
	case "C_Kart_01_Red_F": {5};
	case "C_Kart_01_Vrana_F": {5};
	case "C_Kart_01_black_F": {5};
	case "B_Quadbike_01_F": {25};
	//=== PKWs
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {45};
	case "C_Offroad_01_F": {70};
	case "B_G_Offroad_01_F": {75};
	case "B_G_Offroad_01_armed_F": {5}; //DISABLE
	case "C_Offroad_01_repair_F": {100};
	case "I_G_Offroad_01_armed_F": {5}; //DISABLE
	case "C_SUV_01_F": {60};
	//=== LKWs
	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100}; //NEU 06.12.2015
	case "C_Van_01_box_F": {125};
	case "C_Van_01_fuel_F": {110};
	case "I_Truck_02_transport_F": {175};
	case "O_Truck_02_Transport_F": {175}; //NEU 06.12.2015
	case "I_Truck_02_covered_F": {225};
	case "O_Truck_02_covered_F": {225}; //NEU 06.12.2015
	case "O_Truck_02_box_F": {300};
	case "I_Truck_02_box_F": {300};
	case "O_Truck_03_transport_F": {350};
	case "O_Truck_03_covered_F": {500};
	case "B_Truck_01_transport_F": {600};
	case "B_Truck_01_covered_F": {700};
	case "I_Truck_02_fuel_F": {400}; //NEU 06.12.2015
	case "O_Truck_02_Fuel_F": {500};  //NEU 06.12.2015
	case "O_Truck_03_fuel_F": {550}; 
	case "B_Truck_01_fuel_F": {900};
	case "O_Truck_03_device_F": {450};
	case "O_Truck_03_ammo_F": {700};
	case "B_Truck_01_box_F": {1050};
	case "B_Truck_01_ammo_F": {800};
	case "B_Truck_01_mover_F": {500}; //alac
	//REBELISCH
	case "B_MRAP_01_F": {90};
	case "B_MRAP_01_hmg_F": {30};
	case "I_MRAP_03_F": {80};
	case "O_MRAP_02_F": {110};
	//HELIs
	case "B_Heli_Light_01_F": {15};
	case "C_Heli_Light_01_civil_F": {10};
	case "O_Heli_Light_02_unarmed_F": {100}; //ORCA
	case "I_Heli_light_03_unarmed_F": {100}; //HELLCAT
	case "I_Heli_Transport_02_F": {300}; //MOHAWK
	case "B_Heli_Transport_01_F": {200}; //GHOSTHAWK
	case "I_Plane_Fighter_03_AA_F": {150};
	case "B_Plane_CAS_01_F": {300};
	case "O_Plane_CAS_02_F": {525};
	case "O_Heli_Transport_04_F": {150};
	case "O_Heli_Transport_04_covered_F": {700};
	case "O_Heli_Transport_04_box_F": {1000};
	case "O_Heli_Transport_04_fuel_F": {750};
	case "B_Heli_Transport_03_unarmed_F": {1000};
	case "O_Heli_Transport_04_medevac_F": {250};
	//BOOTE
	case "C_Rubberboat": {50};
	case "C_Boat_Civil_01_F": {450};
	case "C_Boat_Civil_01_police_F": {110};
	case "C_Boat_Civil_01_rescue_F": {110};
	case "B_SDV_01_F": {350};
	case "B_Boat_Transport_01_F": {250};
	//case "B_APC_Tracked_01_CRV_F": {1000}; DISABLE
	case "Land_Box_AmmoOld_F": {700};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	case "Land_PlasticCase_01_small_F": {250};
	case "Land_PlasticCase_01_medium_F": {450};
	case "Land_PlasticCase_01_large_F": {700};
	case "Land_PaperBox_open_full_F": {1000};
	case "Land_Wreck_Traw_F": {10000000};
	case "Land_Wreck_Traw2_F": {10000000};
	case "B_Slingload_01_Cargo_F": {650};//
	case "Land_Pod_Heli_Transport_04_covered_F": {300};//
	case "Land_CargoBox_V1_F": {5000};
	case "B_Slingload_01_Fuel_F": {600};
	default {-1};
};
