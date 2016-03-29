#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Sanitäter Arbeitsklamotten"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_B_CTRG_1","Feuerwehr",0];
		_ret pushBack ["U_B_CTRG_3","Feuerwehr2",0];
		if(__GETC__(zek_fwehrstufe) > 1) then //>2
		{ 
			_ret pushBack ["U_B_CombatUniform_mcam_worn","Sanitaeter Kleidung",0];
		};
		if(__GETC__(zek_fwehrstufe) > 2) then
		{ 
			_ret pushBack ["U_B_SpecopsUniform_sgg","Notarzt Kleidung",0];
		};
		
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_red",nil,85];
		if(__GETC__(zek_fwehrstufe) > 1) then
		{ 
			_ret pushBack ["H_Watchcap_blk",nil,85];
			_ret pushBack ["H_Bandanna_gry","Schwarze Bandanna",85];
			_ret pushBack ["H_RacingHelmet_1_red_F",nil,8500];
			_ret pushBack ["H_HelmetSpecB_blk","Feuerwehr Helm",550];
			_ret pushBack ["H_HelmetB_light_black","Feuerwehr Helm",550];	
			_ret pushBack ["H_PilotHelmetHeli_B",nil,550];
			_ret pushBack ["H_Beret_02",nil,550];
		};
		if(license_fwehr_air) then
		{ 
			_ret pushBack ["H_Cap_marshal",nil,150];
			_ret pushBack ["H_HelmetCrew_B",nil,180];
			_ret pushBack ["H_CrewHelmetHeli_B",nil,200];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = [
			["G_Shades_Black",nil,110],
			["G_Sport_BlackWhite",nil,110],
			["G_Shades_Blue",nil,120],
			["G_Spectacles_Tinted",nil,160],
			["G_Aviator",nil,240]
		];
	};
	
	//Vest
	case 3:
	{
		if(__GETC__(zek_fwehrstufe) > 4) then
		{ 
			_ret pushBack ["V_Rangemaster_belt",nil,55];
			_ret pushBack ["V_TacVestIR_blk",nil,400];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret = [
			["B_Kitbag_sgg",nil,200],
			["B_Carryall_oucamo",nil,3000]
		];
	};
};

_ret;