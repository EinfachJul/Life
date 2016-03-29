/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Poloshirt_burgundy","Dokemon",200],
			["U_C_Poloshirt_redwhite","Rot-Weisses",200],
			["U_C_Poloshirt_stripped","I like Drugs",200],
			["U_C_Poloshirt_tricolour","Trifarben",200],
			["U_C_Commoner1_1","Northpark",200],
			["U_C_Commoner1_2","Blue Bull",200],
			["U_C_Commoner1_3","Bye Kitty",200],
			["U_C_Poor_shorts_1","Geistbusters",200],
			["U_C_Commoner_shorts","Hallo Kitty",200],
			["U_C_ShirtSurfer_shorts","Jurassic Zoo",200],
			["U_C_TeeSurfer_shorts_1","Monsta",200],
			["U_C_TeeSurfer_shorts_2","noAim Fan",200],
			["U_C_Poor_2",nil,200],
			["U_OrestesBody",nil,1200],
			["U_C_HunterBody_grn",nil,1500],
			["U_C_Scientist",nil,2000],
			["U_C_Journalist",nil,2500],
			["U_IG_Guerilla2_3",nil,2500],
			//["U_BG_Guerilla2_3",nil,1],
			//["U_OG_Guerilla2_3",nil,1],
			["U_NikosBody",nil,5000],
			["U_NikosAgedBody","Anzug",5000],
			["U_Competitor",nil,2500],
			["U_IG_Guerilla2_1",nil,2500],
			//["U_BG_Guerilla2_1",nil,1],
			//["U_OG_Guerilla2_1",nil,1],
			["U_I_G_resistanceLeader_F",nil,5000],
			//["U_OG_Guerilla3_2",nil,1],
			//["U_BG_Guerilla1_1",nil,1],
			["U_IG_Guerilla1_1",nil,10000]
		];
	};
	
	//Hats
	case 1:
	{
		[		
			["H_Cap_blu",nil,100], //
			["H_Cap_grn",nil,100], //
			["H_Cap_oli",nil,100], //
			["H_Cap_red",nil,100], //
			["H_Cap_surfer",nil,100], //
			["H_Cap_press",nil,100], //
			["H_Cap_tan",nil,100], //
			["H_Cap_blk_CMMG",nil,100], //
			["H_Cap_grn_BI",nil,100], //
			["H_Cap_blk",nil,100], //
			["H_Cap_usblack",nil,100], //
			["H_Bandanna_blu",nil,200], //
			["H_Cap_blk_Raven",nil,300], //
			["H_Cap_blk_ION",nil,300], //
			["H_Cap_oli_hs",nil,300], //
			["H_Bandanna_surfer",nil,400], //
			["H_Bandanna_surfer_grn",nil,400], //
			["H_Bandanna_surfer_blk",nil,400], //
			["H_Booniehat_khk",nil,500], //
			["H_Booniehat_oli",nil,500], //
			["H_Booniehat_indp",nil,500], //
			["H_Hat_brown",nil,1000], //
			["H_Hat_grey",nil,1000], //
			["H_Hat_tan",nil,1000], //
			["H_Hat_blue",nil,1000], //
			["H_Hat_checker",nil,1000], //
			["H_StrawHat",nil,2000], //
			["H_StrawHat_dark",nil,2000], //
			["H_BandMask_blk",nil,4000],
			["H_Cap_marshal",nil,5000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,50],
			["G_Shades_Blue",nil,50],
			["G_Shades_Green",nil,50],
			["G_Shades_Red",nil,50],
			["G_Spectacles",nil,60],
			["G_Spectacles_Tinted",nil,60],
			["G_Sport_Blackred",nil,60],
			["G_Sport_Checkered",nil,60],
			["G_Sport_Blackyellow",nil,60],
			["G_Sport_BlackWhite",nil,60],
			["G_Sport_Greenblack",nil,60],
			["G_Sport_Red",nil,60],
			["G_Squares",nil,70],
			["G_Aviator",nil,100],
			["G_Lady_Blue",nil,100],
			["G_Tactical_Black",nil,150],
			["G_Tactical_Clear",nil,200],
			["G_Lowprofile",nil,400],
			["G_Combat",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		[
		    ["V_Rangemaster_belt",nil,15000],
		    ["V_Press_F",nil,5000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[	
			//["B_AssaultPack_cbr",nil,5000],
			//["B_AssaultPack_dgtl",nil,5000],
			["B_AssaultPack_khk",nil,4000],
			//["B_AssaultPack_mcamo",nil,5000],
			//["B_AssaultPack_ocamo",nil,5000],
			//["B_AssaultPack_rgr",nil,5000],
			//["B_AssaultPack_sgg",nil,5000],
			//["B_AssaultPack_Kerry",nil,5000],
			//["B_FieldPack_cbr",nil,10000],
			//["B_FieldPack_ocamo",nil,10000],
			//["B_FieldPack_khk",nil,10000],
			//["B_FieldPack_oli",nil,10000],
			//["B_FieldPack_oucamo",nil,10000],
			//["B_BergenG",nil,12000],
			["B_Kitbag_sgg",nil,5000],
			["B_Kitbag_cbr",nil,5000],
			["B_BergenC_blu",nil,6000],
			["B_BergenC_grn",nil,6000],
			["B_BergenC_red",nil,6000],
			["B_Bergen_sgg",nil,6000],
			//["B_Bergen_mcamo",nil,12000],
			//["B_Bergen_rgr",nil,12000],
			//["B_TacticalPack_oli",nil,6500],
			["B_TacticalPack_mcamo",nil,6500],
			//["B_TacticalPack_ocamo",nil,15000],
			//["B_TacticalPack_rgr",nil,15000],
			["B_Carryall_khk",nil,7000],
			//["B_Carryall_mcamo",nil,25000],
			["B_OutdoorPack_blu",nil,10000],
			["B_Parachute",nil,3900]
			//["B_OutdoorPack_tan",nil,30],
			//["B_HuntingBackpack",nil,30]
		];
	};
};