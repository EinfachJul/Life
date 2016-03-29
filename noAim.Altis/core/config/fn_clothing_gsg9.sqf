#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"GSG9 Lagerhaus"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_B_Wetsuit","Polizei Taucheranzug",2000];
		_ret pushBack ["U_B_SpecopsUniform_sgg","GSG9 Gray",0];
		_ret pushBack ["U_B_CTRG_1","GSG9 Braun",0];
		_ret pushBack ["U_B_CombatUniform_mcam_worn","GSG9 Jungle",0];
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Beret_blk",nil,100];
		_ret pushBack ["H_Bandanna_gry",nil,75];
		_ret pushBack ["H_Watchcap_blk",nil,75];
		
		if(license_cop_gsg9) then
		{	
			//Muetzen
			_ret pushBack ["H_Booniehat_dgtl",nil,1000];
			_ret pushBack ["H_Booniehat_indp",nil,1000];
			
			//Helme
			_ret pushBack ["H_HelmetB_light_snakeskin","GSG9 Helm",3000];
			_ret pushBack ["H_HelmetB_camo",nil,4000];
		};
		
		if(license_cop_gsg9tl) then
		{
			_ret pushBack ["H_Beret_02","Chef!",1000];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Balaclava_combat","GasMaske",1000],
			["G_Tactical_Black",nil,500],
			["G_Tactical_Clear",nil,500],
			["G_Aviator",nil,1000],
			["G_Goggles_VR",nil,4000],
			["G_Balaclava_blk",nil,1000],
			["G_Balaclava_lowprofile",nil,1000],
			["G_Diving",nil,4000]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_RebreatherB","Atemgerät",1000];
		_ret pushBack ["V_PlateCarrier1_blk",nil,2700]; //GSG9
		if(license_cop_gsg9) then
		{
			_ret pushBack ["V_PlateCarrier2_blk",nil,2700]; //GSG9
			_ret pushBack ["V_PlateCarrier2_rgr",nil,2700]; //GSG9
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Carryall_oucamo",nil,0]
		];
	};
};

_ret;