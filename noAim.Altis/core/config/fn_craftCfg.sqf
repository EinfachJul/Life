#include "..\..\macros.hpp"
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		_return = [
			//["srifle_DMR_05_blk_F", ["life_inv_edelmetall",2,"life_inv_edelholz",2,"life_inv_specialfett",2]],	//Cyrus
			//["MMG_01_hex_F",["life_inv_edelmetall",1,"life_inv_edelholz",1,"life_inv_schwarzpulver",2,"life_inv_holzp",2,"life_inv_farbe",2,"life_inv_silberp",1]],
			//["MMG_01_tan_F",["life_inv_edelmetall",1,"life_inv_edelholz",1,"life_inv_schwarzpulver",2,"life_inv_holzp",2,"life_inv_specialfett",1,"life_inv_silberp",1]],
			//["MMG_02_sand_F",["life_inv_edelmetall",1,"life_inv_edelholz",1,"life_inv_schwarzpulver",2,"life_inv_holzp",2,"life_inv_specialfett",1,"life_inv_messing",1]],
			["srifle_DMR_05_tan_f",["life_inv_edelmetall",1,"life_inv_edelholz",1,"life_inv_schwarzpulver",2,"life_inv_holzp",2,"life_inv_specialfett",1,"life_inv_farbe",1,"life_inv_screws",1,"life_inv_messing",1]],
			["srifle_DMR_06_olive_F",["life_inv_edelmetall",1,"life_inv_edelholz",1,"life_inv_schwarzpulver",2,"life_inv_holzp",2,"life_inv_specialfett",1,"life_inv_farbe",1,"life_inv_screws",1,"life_inv_messing",1]],
			["muzzle_snds_93mmg", ["life_inv_edelmetall",2,"life_inv_edelholz",2,"life_inv_glass",2]]
			//["MMG_02_camo_F",["life_inv_edelmetall",1,"life_inv_edelholz",1,"life_inv_schwarzpulver",2,"life_inv_holzp",2,"life_inv_farbe",1,"life_inv_screws",1,"life_inv_messing",1]],
			//["srifle_DMR_02_sniper_F",["life_inv_specialfett",1,"life_inv_edelmetall",4,"life_inv_edelholz",4,"life_inv_schwarzpulver",3,"life_inv_screws",2,"life_inv_bronze",1,"life_inv_holzp",2,"life_inv_boltcutter",1]]
		];
	};

	case "uniform":
	{
		_return = [
			["U_I_GhillieSuit", ["life_inv_stoff",1,"life_inv_farbe",1,"life_inv_netzz",1]],
			["U_O_GhillieSuit", ["life_inv_stoff",2,"life_inv_farbe",1,"life_inv_netzz",1]], //geht
			["U_B_GhillieSuit", ["life_inv_stoff",4,"life_inv_farbe",1,"life_inv_netzz",1]]
		];
	};
	
	case "vest":
	{
		_return = [
			["V_PlateCarrierGL_blk", ["life_inv_stoff",2,"life_inv_farbe",2,"life_inv_netzz",2,"life_inv_glue",1]],
			["V_PlateCarrierGL_mtp", ["life_inv_stoff",2,"life_inv_farbe",2,"life_inv_netzz",2,"life_inv_glue",1]],
			["V_PlateCarrierSpec_blk", ["life_inv_stoff",2,"life_inv_farbe",2,"life_inv_netzz",1,"life_inv_glue",1]],
			["V_PlateCarrierSpec_mtp", ["life_inv_stoff",2,"life_inv_farbe",2,"life_inv_netzz",1,"life_inv_glue",1]],
			["V_PlateCarrierIAGL_oli", ["life_inv_stoff",2,"life_inv_farbe",2,"life_inv_netzz",1,"life_inv_glue",1]]
		];
	};

	case "backpack":
	{
		_return = [
			["B_Carryall_ocamo", ["life_inv_stoff",2,"life_inv_netzz",1,"life_inv_seil",1]],
			["B_Carryall_oli", ["life_inv_stoff",2,"life_inv_netzz",1,"life_inv_seil",1]],
			["B_Carryall_cbr", ["life_inv_stoff",2,"life_inv_netzz",1,"life_inv_farbe",1]],
			["B_Carryall_oucamo", ["life_inv_stoff",2,"life_inv_netzz",1,"life_inv_farbe",1]]
		];
	};

	case "item":
	{
		_return = [
			["life_inv_edelmetall", ["life_inv_ironr",4,"life_inv_diamondr",2]],
			["life_inv_edelholz", ["life_inv_holzp",4,"life_inv_oilu",3,"life_inv_schwefelp",2]],
			["life_inv_stoff", ["life_inv_fabric",3,"life_inv_scalpel",1,"life_inv_seil",2]],
			["life_inv_farbe", ["life_inv_specialfett",2,"life_inv_oilp",2,"life_inv_hartz",1]],
			["life_inv_messing", ["life_inv_copperr",3,"life_inv_ironr",3]],
			["life_inv_schwarzpulver", ["life_inv_blastingcharge",1,"life_inv_holzp",2,"life_inv_schwefelp",2]],
			["life_inv_specialfett", ["life_inv_fuelF",3,"life_inv_oilp",1]],
			["life_inv_screws", ["life_inv_ironr",1,"life_inv_copperr",1]],
			["life_inv_glue", ["life_inv_hartz",1,"life_inv_oilp",2]],
			["life_inv_knife", ["life_inv_stahl",1,"life_inv_plastic",1]],
			["life_inv_seil", ["life_inv_cotton",2,"life_inv_scalpel",1]],
			["life_inv_stahl", ["life_inv_ironore",2,"life_inv_schwefelp",1]],
			["life_inv_painkiller", ["life_inv_marijuana",1,"life_inv_heroinp",1]],
			["life_inv_netzz", ["life_inv_seil",2]],
			["life_inv_rubber", ["life_inv_holzp",2,"life_inv_oilp",1]],
			["life_inv_hartz", ["life_inv_holzp",2]],
			["life_inv_zipties", ["life_inv_seil",1,"life_inv_rubber",1]],
			// NEU
			["life_inv_areifen", ["life_inv_rubber",2,"life_inv_ironr",1]],
			["life_inv_amotor", ["life_inv_pccpu",1,"life_inv_blastingcharge",1,"life_inv_stahl",1,"life_inv_specialfett",1,"life_inv_oilp",1,"life_inv_atape",1]],
			["life_inv_arotor", ["life_inv_blastingcharge",1,"life_inv_stahl",3,"life_inv_specialfett",1,"life_inv_oilp",1,"life_inv_atape",1]],
			//
			["life_inv_nitro", ["life_inv_schwefelp",2,"life_inv_blastingcharge",1,"life_inv_gasbottle",1]],
			["life_inv_diske", ["life_inv_pccpu",1,"life_inv_blastingcharge",1,"life_inv_plastic",1,"life_inv_scalpel",1]],
			["life_inv_plasticpackaging", ["life_inv_glue",1,"life_inv_plastic",4]],
			["life_inv_pccpu", ["life_inv_ironr",2,"life_inv_aluminium",1,"life_inv_plastic",2,"life_inv_copperr",2,"life_inv_glue",1]],
			["life_inv_pcmainboard", ["life_inv_ironr",3,"life_inv_aluminium",3,"life_inv_plastic",2,"life_inv_copperr",3,"life_inv_screws",6,"life_inv_glue",1]]
		];
	};
	case "vehicle":
	{
		_return = [
			["O_Truck_03_ammo_F", ["life_inv_amotor",2,"life_inv_areifen",8,"life_inv_glass",3,"life_inv_stahl",3,"life_inv_farbe",1,"life_inv_gasbottle",1]],
			["C_Heli_Light_01_civil_F", ["life_inv_arotor",1,"life_inv_amotor",1,"life_inv_glass",2,"life_inv_stahl",1,"life_inv_farbe",1,"life_inv_atape",1]]
		];
	};
};

_return; 