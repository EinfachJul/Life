/*
	Author: Bryan "Tonic" Boardwine - edited by Aryx
	Master configuration file for Mafia shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Al Capones Mafia Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_Marshal","White Shirt",10000],
			["U_Rangemaster","Black Shirt",20000],
			//["U_O_OfficerUniform_ocamo","Black",50000],
			["U_IG_Guerilla3_1","Schwarzer Anzug",50000],
			["U_OG_Guerilla3_1","Schwarzer Anzug 2",50000],
			["U_BG_Guerilla3_1","Grauer Anzug",60000],
			["U_BG_Guerilla3_2","Schleicher",80000],
			["U_I_CombatUniform","Neuer Anzug",90000]
		];
	};
	
	//Hats
	case 1:
	{
		[	
			["H_MilCap_gry","Schwarze Cap",200],
			["H_Bandanna_surfer_blk",nil,200],
			["H_Watchcap_blk",nil,200],
			["H_Cap_blk",nil,200],
			["H_Bandanna_blu",nil,500],
			["H_Bandanna_gry",nil,1000],
			["H_Hat_blue",nil,2000],
			["H_Hat_brown",nil,4000],
			["H_Hat_grey",nil,6000],
			["H_Hat_checker",nil,1000],
			["H_CrewHelmetHeli_B",nil,10000],
			["H_HelmetSpecO_blk",nil,10000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,110],
			["G_Shades_Blue",nil,120],
			["G_Spectacles_Tinted",nil,160],
			["G_Sport_BlackWhite",nil,200],
			["G_Squares",nil,230],
			["G_Aviator",nil,240],
			["G_Bandanna_blk",nil,4000],
			["G_Bandanna_aviator",nil,8000],
			["G_Balaclava_blk",nil,9000]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_Rangemaster_belt",nil,5000],
			["V_Chestrig_blk",nil,5000],
			["V_TacVest_blk",nil,25000],
			["V_RebreatherB","Schutzveste",50000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_blk","Assault RS (Schwarz)",20000],
			["B_FieldPack_blk","Feld RS (Schwarz)",30000],
			["B_Bergen_blk","Bergen RS (Schwarz)",45000],
			["B_OutdoorPack_blk","Outdoor RS (Schwarz)",45000],
			["B_TacticalPack_blk","Outdoor RS (Schwarz)",65000],
			["B_Kitbag_rgr","Sport RS (Schwarz)",85000],
			["B_Carryall_cbr","Großer RS (Schwarz)",125000],
			["B_Carryall_oucamo","Unsichtbar",250000]
		];
	};
};
