#include "..\..\macros.hpp"
/*
	Author: Tabakhase
	Slightly adapted by Daniel Larusso (Keep Calm and Roleplay)
	Master configuration file for seize player everything.
	
	Parameters:
	0 = All
	1 = Weapons
	2 = Uniform
	3 = Backpack
	4 = Vest
	5 = Items
	
	ToDo:
	Adding list 0,2,3,4&5
*/
private["_mode"];
_mode = [_this,0,objNull,[""]] call BIS_fnc_param;

switch(_mode) do
{
	if(license_civ_gun) then
		{
			case 1: {
			[
				// Weapons
				"hgun_P07_snds_F",
				"hgun_ACPC2_F",
				"hgun_Pistol_heavy_02_F",
				"hgun_Pistol_heavy_01_F",
				"SMG_01_F",
				"arifle_sdar_F",
				"arifle_Mk20_plain_F",
				"arifle_TRG21_F",
				"arifle_Katiba_C_F",
				"arifle_Katiba_F",
				"arifle_MX_Black_F",
				"arifle_MXC_Black_F",
				"arifle_MX_SW_Black_F",
				"arifle_MXM_Black_F",
				"arifle_MXC_F",
				"arifle_MX_F",
				"arifle_MX_SW_F",
				"arifle_MXM_F",
				"srifle_DMR_01_F",
				"LMG_Zafir_F",
				"srifle_EBR_F",
				// Mags
				"9Rnd_45ACP_Mag",
				"6Rnd_45ACP_Cylinder",
				"11Rnd_45ACP_Mag",
				"30Rnd_45ACP_Mag_SMG_01",
				"20Rnd_556x45_UW_mag",
				"30Rnd_556x45_Stanag",
				"30Rnd_65x39_caseless_green",
				// Accs
				"HandGrenade_Stone",
				"muzzle_snds_M",
				"muzzle_snds_H",
				"muzzle_snds_B",
				"muzzle_snds_acp",
				"optic_Yorris",
				"optic_Holosight_smg",
				"optic_ACO_grn",
				"optic_Aco",
				"optic_Holosight",
				"optic_Arco",
				"optic_Hamr",
				"optic_MRCO",
				"acc_pointer_IR",
				"acc_flashlight"
				];
			};
		} else {
			case 1: {
			[
				"hgun_Rook40_F",
				"hgun_P07_snds_F",
				"hgun_ACPC2_F",
				"hgun_Pistol_heavy_02_F",
				"hgun_Pistol_heavy_01_F",
				"SMG_01_F",
				"SMG_02_F",
				"hgun_PDW2000_F",
				"arifle_sdar_F",
				"arifle_Mk20_plain_F",
				"arifle_TRG21_F",
				"arifle_Katiba_C_F",
				"arifle_Katiba_F",
				"arifle_MX_Black_F",
				"arifle_MXC_Black_F",
				"arifle_MX_SW_Black_F",
				"arifle_MXM_Black_F",
				"arifle_MXC_F",
				"arifle_MX_F",
				"arifle_MX_SW_F",
				"arifle_MXM_F",
				"LMG_Mk200_F",
				"srifle_DMR_01_F",
				"LMG_Zafir_F",
				"srifle_EBR_F",
				// Mags
				"30Rnd_9x21_Mag",
				"16Rnd_9x21_Mag",
				"9Rnd_45ACP_Mag",
				"6Rnd_45ACP_Cylinder",
				"11Rnd_45ACP_Mag",
				"30Rnd_45ACP_Mag_SMG_01",
				"20Rnd_556x45_UW_mag",
				"30Rnd_556x45_Stanag",
				"30Rnd_65x39_caseless_green",
				"200Rnd_65x39_cased_Box",
				// Accs
				"HandGrenade_Stone",
				"muzzle_snds_M",
				"muzzle_snds_H",
				"muzzle_snds_B",
				"muzzle_snds_acp",
				"optic_Yorris",
				"optic_Holosight_smg",
				"optic_ACO_grn",
				"optic_ACO_grn_smg",
				"optic_Aco",
				"optic_Holosight",
				"optic_Arco",
				"optic_Hamr",
				"optic_MRCO",
				"acc_pointer_IR",
				"acc_flashlight"
			];
		};
	};
};