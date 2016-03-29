#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Master configuration file for the weapon shops.
*/
private["_shop","_cash"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
_cash = life_zgazzy + life_znorak;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			default
			{
				["Polizeihändler",
					[
						["ItemWatch",nil,100],
						["ItemMap",nil,100],
						["ItemGPS",nil,1500],
						["ItemRadio","Smartphone",220],
						["ItemCompass",nil,100],
						["ToolKit",nil,3500],
						["Medikit",nil,5000],
						["FirstAidKit",nil,1150],
						["Binocular",nil,250],
						["NVGoggles_OPFOR",nil,100],
						["Rangefinder",nil,50000],
						["B_Parachute",nil,3000]
					]
				];
			};
		};
	};
	case "gsg9_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein GSG9er!"};
			default
			{
				["GSG9händler",
					[
						["ItemWatch",nil,100],
						["ItemMap",nil,100],
						["ItemGPS",nil,1500],
						["ItemRadio","Smartphone",220],
						["ItemCompass",nil,100],
						["ToolKit",nil,3500],
						["Medikit",nil,5000],
						["FirstAidKit",nil,7600],
						["Binocular",nil,2000],
						["NVGoggles_OPFOR",nil,2000],
						["Rangefinder",nil,50000],
						["B_Parachute",nil,3000]
					]
				];
			};
		};
	};
	case "cop_waffen":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(zak_copstufe) == 0): {"Du bist kein Polizist!"};
			case (__GETC__(zak_copstufe) == 1): //Anwärter
			{
				["Polizeianwaerter",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 2): //Wachmeister
			{
				["Wachtmeister",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["20Rnd_762x51_Mag",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_AMS",nil,25000],
						["optic_Arco",nil,10000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 3): //Obermeister
			{
				["Obermeister",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["20Rnd_762x51_Mag",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_AMS",nil,25000],
						["optic_Arco",nil,10000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 4): //Hauptmeister
			{
				["Hauptmeister",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["20Rnd_762x51_Mag",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_AMS",nil,25000],
						["optic_Arco",nil,10000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 5): //Kommissar
			{
				["Polizeikommissar",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						["hgun_ACPC2_F",nil,3500],
						["9Rnd_45ACP_Mag",nil,1500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["srifle_EBR_F",nil,120000], //MK18
						["20Rnd_762x51_Mag",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_MRCO",nil,15000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_AMS",nil,25000],
						["optic_NVS",nil,12000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 6): //Oberkommissar
			{
				["Polizeioberkommisar",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						["hgun_ACPC2_F",nil,3500],
						["9Rnd_45ACP_Mag",nil,1500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["arifle_MXM_Black_F",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["srifle_EBR_F",nil,120000], //MK18
						["srifle_DMR_06_camo_F",nil,120000], //Mk14
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_05_ACO_F",nil,150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag",nil,6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3 mmg",10000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_MRCO",nil,15000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_AMS",nil,25000],
						["optic_DMS",nil,20000],
						["optic_NVS",nil,12000],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]						
					]
				];
			};
			case (__GETC__(zak_copstufe) == 7):  //Hauptkommissar
			{
				["Polizeihauptkommisar",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						["hgun_ACPC2_F",nil,3500],
						["9Rnd_45ACP_Mag",nil,1500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["arifle_MXM_Black_F",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["srifle_EBR_F",nil,120000], //MK18
						["srifle_DMR_06_camo_F",nil,120000], //Mk14
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_05_ACO_F",nil,150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag",nil,6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3 mmg",10000],
						// ========================================================= Zusatz
						["acc_pointer_IR",nil,5000],
						["acc_flashlight",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_MRCO",nil,15000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_AMS",nil,25000],
						["optic_DMS",nil,20000],
						["optic_NVS",nil,12000],
						["optic_LRPS",nil,35000],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 8):  //Rat
			{
				["Polizeirat",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						["hgun_ACPC2_F",nil,3500],
						["9Rnd_45ACP_Mag",nil,1500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["arifle_MXM_Black_F",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["srifle_EBR_F",nil,120000], //MK18
						["srifle_DMR_06_camo_F",nil,120000], //Mk14
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_05_ACO_F",nil,150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag",nil,6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3 mmg",10000],
						["srifle_DMR_02_F","MAR-10 .338",165000], //MAR-10
						["10Rnd_338_Mag","10Rnd .338",7500],
						["muzzle_snds_338_black","Schalldaempfer .338",10000],
						// ========================================================= Zusatz
						["acc_pointer_IR",nil,5000],
						["acc_flashlight",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_MRCO",nil,15000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_AMS",nil,25000],
						["optic_DMS",nil,20000],
						["optic_NVS",nil,12000],
						["optic_LRPS",nil,35000],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 9):  //Oberrat
			{
				["Polizeioberrat",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						["hgun_ACPC2_F",nil,3500],
						["9Rnd_45ACP_Mag",nil,1500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["arifle_MXM_Black_F",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["srifle_EBR_F",nil,120000], //MK18
						["srifle_DMR_06_camo_F",nil,120000], //Mk14
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_05_ACO_F",nil,150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag",nil,6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3 mmg",10000],
						["srifle_DMR_02_F","MAR-10 .338",165000], //MAR-10
						["10Rnd_338_Mag","10Rnd .338",7500],
						["muzzle_snds_338_black","Schalldaempfer .338",10000],
						// ========================================================= Zusatz
						["acc_pointer_IR",nil,5000],
						["acc_flashlight",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_MRCO",nil,15000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_AMS",nil,25000],
						["optic_DMS",nil,20000],
						["optic_NVS",nil,12000],
						["optic_LRPS",nil,35000],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 10):  //Direktor
			{
				["Polizeidirektor",
					[
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						// ========================================================= PISTOLEN
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,500],
						["hgun_ACPC2_F",nil,3500],
						["9Rnd_45ACP_Mag",nil,1500],
						// ========================================================= Sturmgewehre
						["arifle_MX_Black_F",nil,20000],
						["arifle_MXM_Black_F",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Katiba_F",nil,25000],
						["arifle_Katiba_C_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,3000],
						["arifle_Katiba_GL_F","Katiba GL 6.5 mm",50000],
						// ========================================================= Sniper
						["srifle_DMR_03_F",nil,60000], //Mk-I EMR 
						["srifle_EBR_F",nil,120000], //MK18
						["srifle_DMR_06_camo_F",nil,120000], //Mk14
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_05_ACO_F",nil,150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag",nil,6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3 mmg",10000],
						["srifle_DMR_02_F","MAR-10 .338",165000], //MAR-10
						["10Rnd_338_Mag","10Rnd .338",7500],
						["muzzle_snds_338_black","Schalldaempfer .338",10000],
						// ========================================================= Visiere
						["optic_Holosight",nil,2500],
						["optic_Hamr",nil,3000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_DMS",nil,20000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_MRCO",nil,15000],
						["optic_NVS",nil,12000],
						["optic_MRD",nil,2000],
						["optic_Yorris",nil,2000],
						["optic_AMS",nil,25000],
						["optic_KHS_blk",nil,25000],
						["optic_LRPS",nil,35000],
						// ========================================================= Zusatz
						["acc_pointer_IR",nil,5000],
						["acc_flashlight",nil,5000],
						// ========================================================= Zubehoer
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_MRCO",nil,15000],
						["optic_Arco",nil,10000],
						["optic_SOS",nil,25000],
						["optic_AMS",nil,25000],
						["optic_DMS",nil,20000],
						["optic_NVS",nil,12000],
						["optic_LRPS",nil,35000],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_93mmg",nil,7500],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_H_MG",nil,7500],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_B",nil,5000],
						["muzzle_snds_M",nil,5000],
						["bipod_01_F_blk",nil,5500]
					]
				];
			};
			case (__GETC__(zak_copstufe) == 11):
			{
				["Polizeipraesident",
					[
						["arifle_MXM_Black_F",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2000]
					]
				];
			};
		};
	};
	
	case "cop_gsg9":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (!license_cop_gsg9): {"Du bist kein GSG9 Beamter!"};
			default
			{
				["GSG9",
					[				
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["30Rnd_9x21_Mag","30Rnd Taser magazin",500],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						//---------------------------------------------------Pistole
						["hgun_Rook40_snds_F","Rook-40 9 mm",2500],
						["30Rnd_9x21_Mag","Rook 9 mm Ammo",500],
						//---------------------------------------------------Sturmgewehr
						["arifle_Katiba_C_F","Katiba Carbine 6.5 mm",50000],
						["30Rnd_65x39_caseless_green","Kat 6.5 mm Caseless Mag",3000],
						["arifle_MXM_Black_F","MXM 6.5 mm",50000],
						["30Rnd_65x39_caseless_mag","MXM 6.5 mm Ammo",5000],
						["arifle_MX_SW_Black_F","MX SW 6.5 mm",70000],
						["100Rnd_65x39_caseless_mag","MX SW 6.5 mm Ammo",7000],
						["muzzle_snds_H","Schalldaempfer 6.5 mm",5000],
						//---------------------------------------------------Gunner
						["LMG_Mk200_F","Mk200 6.5 mm",40000],
						["200Rnd_65x39_cased_Box","6.5x39 mm Caliber",4000],
						["muzzle_snds_H_MG","Schalldaempfer 6.5 mm",6000],
						["LMG_Zafir_F","Zafir 7.62 mm",40000],
						["150Rnd_762x54_Box","7.62mm 150Rnd Box",4000],
						//---------------------------------------------------Sniper
						["srifle_DMR_05_blk_F","Cyrus 9.3mm",150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag","9.3x64mm Caliber",6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3mm",5000],
						["srifle_DMR_02_camo_F","MAR-10 Camo .338",165000], //MAR-10
						["10Rnd_338_Mag","10Rnd .338",7500],
						["muzzle_snds_338_green","Schalldaempfer .338",10000],
						//---------------------------------------------------Scopes
						["optic_Arco","ARCO Visier",10000],
						["optic_Holosight","Holosight Visier",2500],
						["optic_MRCO","MRCO Visier",15000],
						["optic_NVS","NVS Visier",12000],
						["optic_LRPS","LRPS Visier",35000],
						["optic_KHS_old","KHS Visier",25000],
						["optic_AMS_khk","AMS Visier",25000],
						//---------------------------------------------------Zubehoer
						["bipod_01_F_mtp","Zweibein",5500],
						["bipod_03_F_oli","Zweibein",5500],
						["acc_flashlight","Taschenlampe",5000],
						["acc_pointer_IR","Laserpointer",5000],	
						["HandGrenade_Stone","Blendgranate",10000],
						["SmokeShellOrange","Traenengas",10000],
						["SmokeShell","Weisse Rauchgranate",5000],
						["SmokeShellRed","Rote Rauchgranate",5000]
					]
				];
			};
		};
	};
	case "cop_gsg9tl":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (!license_cop_gsg9tl): {"Du bist kein GSG9 Team-Leiter!"};
			default
			{
				["GSG9TL",
					[	
						["hgun_P07_snds_F","Taserpistole",10],
						["16Rnd_9x21_Mag","16Rnd Taser magazin",50],
						["30Rnd_9x21_Mag","30Rnd Taser magazin",500],
						["SMG_01_Holo_F","Gummigeschossgewehr",5000],
						["30Rnd_45ACP_Mag_SMG_01","Gummigeschoss",500],
						//---------------------------------------------------Pistole
						["hgun_Rook40_snds_F","Rook-40 9 mm",2500],
						["30Rnd_9x21_Mag","Rook 9 mm Ammo",500],
						//---------------------------------------------------Sturmgewehr
						["SMG_02_F","Sting 9 mm",25000],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",2500],
						["arifle_Katiba_C_F","Katiba Carbine 6.5 mm",50000],
						["30Rnd_65x39_caseless_green","Kat 6.5 mm Caseless Mag",3000],
						["30Rnd_65x39_caseless_green_mag_Tracer","Kat 6.5 mm Gruen Mag",3500],
						["arifle_MXM_Black_F","MXM 6.5 mm",50000],
						["30Rnd_65x39_caseless_mag","MXM 6.5 mm Ammo",5000],
						["30Rnd_65x39_caseless_mag_Tracer","MXM 6.5 mm Tracer Ammo",5500],
						["arifle_MX_SW_Black_F","MX SW 6.5 mm",70000],
						["100Rnd_65x39_caseless_mag","MX SW 6.5 mm Ammo",7000],
						["100Rnd_65x39_caseless_mag_Tracer","MX SW 6.5 mm Tracer Ammo",7500],
						["muzzle_snds_H","Schalldaempfer 6.5 mm",5000],
						//---------------------------------------------------Gunner
						["LMG_Mk200_F","Mk200 6.5 mm",40000],
						["200Rnd_65x39_cased_Box","6.5x39 mm Caliber",4000],
						["muzzle_snds_H_MG","Schalldaempfer 6.5 mm",6000],
						["LMG_Zafir_F","Zafir 7.62 mm",40000],
						["150Rnd_762x54_Box","7.62mm 150Rnd Box",4000],
						["MMG_02_camo_F","SPMG .338",60000], //SPMG .338
						["130Rnd_338_Mag","338 Norma",5000],
						["muzzle_snds_338_green","Schalldaempfer .338",10000],
						//---------------------------------------------------Sniper
						["srifle_DMR_05_blk_F","Cyrus 9.3mm",150000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag","9.3x64mm Caliber",6500],
						["muzzle_snds_93mmg","Schalldaempfer 9.3mm",5000],
						["srifle_DMR_02_camo_F","MAR-10 Camo .338",165000], //MAR-10
						["10Rnd_338_Mag","10Rnd .338",7500],
						["muzzle_snds_338_green","Schalldaempfer .338",10000],
						["srifle_DMR_04_F","ASP Silent",25000],
						["10Rnd_127x54_Mag","ASP 127x54",3000],
						["srifle_DMR_03_F","Mk-I EMR 7.62mm",55000],
						["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",5000],
						//---------------------------------------------------Rockets
						["launch_NLAW_F","Racketenwerfer",150000],
						["NLAW_F","Racketen",85000],						
						//---------------------------------------------------Scopes
						["optic_Arco","ARCO Visier",10000],
						["optic_Holosight","Holosight Visier",2500],
						["optic_MRCO","MRCO Visier",15000],
						["optic_NVS","NVS Visier",12000],
						["optic_LRPS","LRPS Visier",35000],
						["optic_KHS_old","KHS Visier",25000],
						["optic_AMS_khk","AMS Visier",25000],
						["optic_tws","WBV Visier",50000],
						//---------------------------------------------------Zubehoer
						["bipod_01_F_mtp","Zweibein",5500],
						["bipod_03_F_oli","Zweibein",5500],
						["acc_pointer_IR","Laserpointer",5000],	
						["HandGrenade_Stone","Blendgranate",10000],
						["SmokeShellOrange","Traenengas",10000],
						["SmokeShell","Weisse Rauchgranate",5000],
						["SmokeShellRed","Rote Rauchgranate",5000],
						["SmokeShellBlue","Blaue Rauchgranate",5000],
						["SmokeShellGreen","Gruene Rauchgranate",5000],
						["Chemlight_green","Gruene Knicklichter",5000],
						["Chemlight_red","Rote Knicklichter",2000],
						["Chemlight_yellow","Gelbe Knicklichter",2000],
						["Chemlight_blue","Blaue Knicklichter",2000],
						["HandGrenade","HE Granate",20000],
						//------------------------------Drohnen
						["B_UAV_01_backpack_F","Drohne",160000],
						["B_UavTerminal","Drohnen Terminal",100000],
						["acc_pointer_IR","Test1",100000],
						["srifle_DMR_03_F","Test2",100000]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != east): {"Du bist kein Sanitaeter"};
			default {
				["EMS Handel",
					[
						["ItemWatch",nil,100],
						["ItemMap",nil,100],
						["ItemGPS",nil,1500],
						["ItemRadio","Smartphone",220],
						["ItemCompass",nil,100],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,250],
						["Binocular",nil,150],
						["NVGoggles_OPFOR",nil,10],
						["B_Parachute",nil,1000],		
						["hgun_Pistol_Signal_F",nil,50000],
						["6Rnd_GreenSignal_F",nil,5000],
						["6Rnd_RedSignal_F",nil,5000]
					]
				];
			};
		};
	};
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Waffenladen",
					[
						["hgun_P07_F",nil,10000],
						["hgun_Pistol_heavy_02_F",nil,20000],
						["hgun_ACPC2_F",nil,14000],
						["hgun_PDW2000_F",nil,24000],
						["16Rnd_9x21_Mag",nil,400],
						["30Rnd_9x21_Mag",nil,400],
						["optic_ACO_grn_smg",nil,10000],
						["9Rnd_45ACP_Mag",nil,150],
						["6Rnd_45ACP_Cylinder",nil,150],
						["V_Rangemaster_belt",nil,6500]
					]
				];
			};
		};
	};
	
	case "dive_basic":
	{
		switch (true) do 
		{
			case (!license_civ_dive): {"Du hast keinen Taucherschein!"};
			default {
				["Taucher Handel",
					[
						["ItemGPS",nil,1500],
						["ItemRadio","Smartphone",220],
						//["FirstAidKit",nil,10000],
						["Medikit",nil,4000],
						["NVGoggles_OPFOR",nil,5000],
						["arifle_SDAR_F",nil,72000],
						["20Rnd_556x45_UW_mag",nil,5000]
					]
				];
			};
		};
	};
	
	case "shootclub":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Schiessplatz Waffenladen",
					[
						["hgun_P07_F",nil,45000],
						["hgun_Pistol_heavy_02_F",nil,60000],
						["hgun_ACPC2_F",nil,65000],
						["hgun_PDW2000_F",nil,85000],
						["optic_ACO_grn_smg",nil,15000],
						["16Rnd_9x21_Mag",nil,750],
						["9Rnd_45ACP_Mag",nil,1000],
						["6Rnd_45ACP_Cylinder",nil,1200],
						["30Rnd_9x21_Mag",nil,2200],
						["V_Rangemaster_belt",nil,25000]
					]
				];
			};
		};
	};
	
	case "jagdhaus":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Jagdhaus Waffenladen",
					[
						["arifle_Mk20_F","Jagdwaffe",300000],
						["30Rnd_556x45_Stanag_Tracer_Red","30Rnd Leuchtspur Munition",6500],
						["srifle_DMR_06_olive_F","Jagdgewehr",1200000],
						["20Rnd_762x51_Mag","20nd Jagdmunition",10000],
						["V_Rangemaster_belt",nil,25000]
					]
				];
			};
		};
	};
	case "donator_legal":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_donator): {"Du bist kein Donator!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Donator Fundgrube",
					[
						["hgun_P07_F",nil,10400],
						["30Rnd_9x21_Mag",nil,650]
					]
				];
			};
		};
	};
	case "mafia":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_mafia): {"Du hast keine Mafiaenlizenz!"};
			default
			{
				["Mafia Waffenkammer",
					[
						["hgun_ACPC2_F",nil,20000],
						["9Rnd_45ACP_Mag",nil,1000],
						["hgun_Pistol_heavy_02_F",nil,25000],
						["6Rnd_45ACP_Cylinder",nil,2000],
						["hgun_Pistol_heavy_01_F",nil,35000],
						["11Rnd_45ACP_Mag",nil,2000],
						["SMG_01_F",nil,70000],
						["30Rnd_45ACP_Mag_SMG_01",nil,2500],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,2500],
						["7Rnd_408_Mag",nil,125000],
						["arifle_Mk20C_F",nil,140000],
						["30Rnd_556x45_Stanag",nil,1500],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1500],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1500],
						["arifle_Katiba_F",nil,75000],
						["arifle_Katiba_C_F",nil,100000],
					//	["arifle_Katiba_GL_F",nil,100000],
						["30Rnd_65x39_caseless_green",nil,3000],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,3000],
						["srifle_DMR_03_F",nil,250000],
						["20Rnd_762x51_Mag",nil,4400],
						["arifle_Mk20_plain_F",nil,50000],
						["30Rnd_556x45_Stanag",nil,2000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,2000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,2000],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,2000],
						["arifle_MXC_Black_F",nil,75000],
						["arifle_MX_Black_F",nil,75000],
						["arifle_MX_SW_Black_F",nil,175000],
						["arifle_MXM_Black_F",nil,100000],
						["30Rnd_65x39_caseless_mag",nil,3000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,3000],
						["100Rnd_65x39_caseless_mag",nil,5000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,5000]
					]
				];
			};
		};
	};
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Rebellenlizenz!"};
			default
			{
				["Rebellen Waffenkammer",
					[
					//============PISTOLES
						["hgun_ACPC2_F",nil,20000],
						["9Rnd_45ACP_Mag",nil,1000],
						["hgun_Pistol_heavy_02_F",nil,25000],
						["6Rnd_45ACP_Cylinder",nil,2000],
					//============GUNS
						["arifle_SDAR_F",nil,72000],
						["20Rnd_556x45_UW_mag","5.56 Wasser",250],
						["30Rnd_556x45_Stanag","5.56 Land",500],
						["SMG_02_F",nil,80000],
						["30Rnd_9x21_Mag",nil,400],
						["arifle_TRG20_F",nil,90000],
						["arifle_TRG21_F",nil,90000],
						["30Rnd_556x45_Stanag",nil,500],
						["arifle_MXC_F",nil,150000],
						["arifle_MX_F",nil,150000],
						//["arifle_MX_GL_F",nil,230000],
						["arifle_MXM_F",nil,200000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,2000],
					//============SNIPERS
						["srifle_EBR_F",nil,450000],
						["20Rnd_762x51_Mag",nil,4900],
						["srifle_DMR_03_tan_F",nil,450000],
						["20Rnd_762x51_Mag",nil,4000],
						["10Rnd_93x64_DMR_05_Mag",nil,80000],
						["srifle_DMR_01_F",nil,300000],
						["10Rnd_762x54_Mag",nil,3500],
					//============MGS
						["arifle_MX_SW_F",nil,600000],
						["LMG_Mk200_F",nil,950000],
						["100Rnd_65x39_caseless_mag",nil,4000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,4000],
						["200Rnd_65x39_cased_Box_Tracer",nil,10000],
						["LMG_Zafir_F",nil,1300000],
						["150Rnd_762x54_Box",nil,9000],
						["150Rnd_762x54_Box_Tracer",nil,8000]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist"};
			case (!license_civ_gun): {"Du hast keine Schusswaffenlizenz!"};
			default
			{
				["Waffenlagerversteck",
					[
						["hgun_Rook40_F",nil,30000],
						["hgun_ACPC2_F",nil,24000],
						["hgun_PDW2000_F",nil,48000],
						["30Rnd_9x21_Mag",nil,800],
						["9Rnd_45ACP_Mag",nil,600],
						["arifle_MX_F",nil,225000],
						["30Rnd_65x39_caseless_mag",nil,3000],
						["optic_ACO_grn_smg",nil,8000],
						["optic_Holosight_smg",nil,10000],
						["V_Rangemaster_belt",nil,6000]
					]
				];
			};
		};
	};
	
	case "clanbase":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist"};
			case (!license_civ_clanbase): {"Du hast keine Clanbaselizenz!"};
			default
			{
				["ClanWaffenlager",
					[
						["hgun_Rook40_F",nil,30000],
						["hgun_ACPC2_F",nil,24000],
						["hgun_PDW2000_F",nil,48000],
						["30Rnd_9x21_Mag",nil,800],
						["9Rnd_45ACP_Mag",nil,600],
						["arifle_MX_F",nil,225000],
						["30Rnd_65x39_caseless_mag",nil,3000],
						["srifle_DMR_03_tan_F",nil,450000],
						["20Rnd_762x51_Mag",nil,4000],
						["srifle_DMR_03_F",nil,400000],
						["20Rnd_762x51_Mag",nil,4400],
						["optic_ACO_grn_smg",nil,8000],
						["optic_Holosight_smg",nil,10000],
						["V_Rangemaster_belt",nil,6000],
						["U_B_GhillieSuit",nil,150000],
						["U_IG_Guerilla3_2",nil,75000],
						["V_Chestrig_oli",nil,13000],
						["V_TacVest_brn",nil,22000],
						["B_Carryall_oli",nil,55000]
					]
				];
			};
		};
	};
	
	case "donator_hq":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_donator): {"Du bist kein Donator!"};
			default
			{
				["Donator Fundgrube",
					[
						["hgun_ACPC2_F",nil,30000]
					]
				];
			};
		};
	};
	
	case "rebel_scopes":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Mafiaenlizenz!"};
			default
			{
				["Rebellen Waffenkammer",
					[
						["optic_ACO_grn",nil,5000],
						["optic_Aco",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_Holosight_smg",nil,5000],
						["optic_MRCO",nil,15000],
						["optic_SOS",nil,80000],
                        ["optic_NVS",nil,30000],
                        ["optic_DMS",nil,80000],
                        ["optic_Arco",nil,40000],
                        ["optic_Hamr",nil,50000],
                        //["optic_AMS_khk",nil,50000],
                        ["optic_AMS_snd",nil,50000],
						//["optic_KHS_hex",nil,50000],
                       // ["optic_KHS_old",nil,50000],
                        ["optic_KHS_hex",nil,50000],
                        ["bipod_02_F_hex",nil,25000],
                        ["bipod_03_F_oli",nil,25000],
						["acc_flashlight",nil,5000],
						["acc_pointer_IR",nil,5500],
						["muzzle_snds_H",nil,10000],
						["muzzle_snds_H_MG",nil,20000],
						["muzzle_snds_B",nil,2500],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_M",nil,25000],
						["muzzle_snds_L",nil,25000],
						//["3Rnd_UGL_FlareGreen_F",nil,9000],
						//["3Rnd_UGL_FlareRed_F",nil,90000],
						//["3Rnd_SmokeRed_Grenade_shell",nil,12000],
						//["3Rnd_SmokeGreen_Grenade_shell",nil,12000],
						["Binocular",nil,2000],
						["Rangefinder",nil,7000],
						["NVGoggles",nil,10000],
						["NVGoggles_INDEP",nil,10000],
						["NVGoggles_OPFOR",nil,10000],
						["ItemGPS",nil,1000],
						["ItemRadio","Smartphone",2000],
						["ToolKit",nil,2000],
						["FirstAidKit",nil,5000],
						["SmokeShellGreen",nil,5000]
					]
				];
			};
		};
	};	
	case "mafia_scopes":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_mafia): {"Du hast keine Mafiaenlizenz!"};
			default
			{
				["Giovannis Waffenkammer",
					[
						["muzzle_snds_H",nil,10000],
						["muzzle_snds_H_MG",nil,20000],
						["muzzle_snds_B",nil,2500],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_M",nil,25000],
						["muzzle_snds_L",nil,25000],
						["optic_ACO_grn",nil,5000],
						["optic_Aco",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_MRCO",nil,15000],
						["optic_SOS",nil,80000],
						["optic_NVS",nil,30000],
						["optic_LRPS",nil,100000],
						["optic_AMS",nil,50000],
						["optic_KHS_blk",nil,50000],
						["bipod_01_F_blk",nil,25000],
						["acc_flashlight",nil,5000],
						["acc_pointer_IR",nil,5500],
						["UGL_FlareGreen_F",nil,4500],
						["UGL_FlareRed_F",nil,4500],
						["1Rnd_SmokeRed_Grenade_shell",nil,5000],
						["1Rnd_SmokeGreen_Grenade_shell",nil,5000],
						["Binocular",nil,2000],
						["Rangefinder",nil,7000],
						["NVGoggles_OPFOR",nil,10000],
						["ItemGPS",nil,1000],
						["ItemRadio","Smartphone",2000],
						["ToolKit",nil,2000],
						["FirstAidKit",nil,5000],
						["SmokeShellGreen",nil,5000]
					]
				];
			};
		};
	};	
	case "donator_scopes":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_donator): {"Du bist kein Donator!"};
			default
			{
				["Donator Fundgrube",
					[
						["muzzle_snds_M",nil,80000]
					]
				];
			};
		};
	};
	case "genstore_newbs":
	{
		switch(true) do
		{
			case (_cash > 250000): {"Du bist dir zu fein für gebrauchte Gemischtwaren"};
			default
			{
				["Gebrauchte Gemischtwaren",
					[
						["ItemMap",nil,50],
						["ItemCompass",nil,50],
						["ItemWatch",nil,50],
						["ToolKit",nil,2000],
						["ItemRadio","Smartphone",250],
						["NVGoggles",nil,5000]
					]
				];
			};
		};
	};
	case "infostore":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			default
			{
				["Information",
					[
						["ItemWatch",nil,50],
						["ItemCompass",nil,50],
						["ItemGPS",nil,2000],
						["ItemMap",nil,50]
					]
				];
			};
		};
	};
	case "genstore":
	{
		switch(true) do
		{
			case (_cash < 250000): {"Willst du nicht erst die Gebrauchtwaren durchsuchen?"};
			default
			{
				["Gebrauchte Gemischtwaren",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,2000],
						["ItemMap",nil,50],
						["ItemCompass",nil,50],
						["ItemWatch",nil,50],
						["ItemRadio","Smartphone",250],
						["ToolKit",nil,4000],
						["FirstAidKit",nil,5000],
						["NVGoggles",nil,5000],
						["Chemlight_red",nil,1500],
						["Chemlight_yellow",nil,1500],
						["Chemlight_green",nil,1500],
						["Chemlight_blue",nil,1500],
						["B_Parachute",nil,3000]
					]
				];
			};
		};
	};
	
	case "gas_station":
	{
			switch(true) do
		{
			//case (playerSide != civilian): {"Du bist kein Zivilist!"};
			default
			{
				["Fuel Station Shop",
					[
						["ItemGPS",nil,1000],
						["ToolKit",nil,3500],
						["ItemRadio","Smartphone",250],
						["Chemlight_yellow",nil,300]
					]
				];
			};
		};
	};
	
	case "umwelt":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			default
			{
				["Umweltamt",
					[
						["ToolKit",nil,10000],
						["FirstAidKit",nil,7500],
						["U_C_Scientist","Strahlenschutzanzug",10000]
					]
				];
			};
		};
	};
	
	case "marken_rucksack":
	{
		switch(true) do
		{
			case (_cash < 1750000): {"Diese Rucksaecke sind Markenrucksaecke, erst erhaeltlich bei einem hoeheren einkommen."};
			default
			{
				["Marken Rucksaecke",
					[
						["B_AssaultPack_blk","Assault RS (Schwarz)",20000],
						["B_FieldPack_blk","Feld RS (Schwarz)",30000],
						["B_Bergen_blk","Bergen RS (Schwarz)",45000],
						["B_OutdoorPack_blk","Outdoor RS (Schwarz)",45000],
						["B_TacticalPack_oli","Outdoor RS (Camo)",65000],
						["B_TacticalPack_blk","Outdoor RS (Schwarz)",65000],
						["B_Kitbag_mcamo","Sport RS (Camo)",85000],
						["B_Kitbag_rgr","Sport RS (Schwarz)",85000],
						["B_Carryall_oli","Großer RS (Camo)",125000],
						["B_Carryall_ocamo","Großer RS (Desert)",125000],
						["B_Carryall_cbr","Großer RS (Schwarz)",125000],
						["B_Carryall_oucamo","Unsichtbar",250000]
					]
				];
			};
		};
	};
};