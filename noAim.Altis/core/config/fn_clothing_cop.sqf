#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_B_Wetsuit","Polizei Taucheranzug",20000];
		_ret pushBack ["U_B_CombatUniform_mcam","Polizei Anzug",0];
		if(__GETC__(zak_copstufe) > 5) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_tshirt","Zivil Polizei",0];
		};		
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_police",nil,120]; //POLIZEI bearbeiten
		_ret pushBack ["H_Cap_blk",nil,120];
		if(__GETC__(zak_copstufe) > 1) then
		{
			_ret pushBack ["H_MilCap_blue",nil,120];//
			_ret pushBack ["H_Beret_blk_POLICE",nil,120]; //BLU POLIZEI färben
			_ret pushBack ["H_RacingHelmet_1_blue_F",nil,7000];
			_ret pushBack ["H_RacingHelmet_1_black_F",nil,7000];
			_ret pushBack ["H_RacingHelmet_1_white_F",nil,7000];
		};
		if(__GETC__(zak_copstufe) > 5) then
		{		
			_ret pushBack ["H_Watchcap_sgg",nil,120]; // blau färben? wenn nicht blau
			_ret pushBack ["H_PilotHelmetHeli_B",nil,300];
			_ret pushBack ["H_Bandanna_blu",nil,420]; 
		};
		if(__GETC__(zak_copstufe) > 7) then
		{
			_ret pushBack ["H_CrewHelmetHeli_B",nil,300];
		};
		if(__GETC__(zak_copstufe) > 8) then
		{
			_ret pushBack ["H_HelmetCrew_B",nil,300];//COP
		};
		if(__GETC__(zak_copstufe) > 9) then
		{
			_ret pushBack ["H_Beret_02","Chef!",1000];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,110],
			["G_Shades_Blue",nil,120],
			["G_Shades_Green",nil,130],
			["G_Shades_Red",nil,140],
			["G_Spectacles",nil,150],
			["G_Spectacles_Tinted",nil,160],
			["G_Sport_Blackred",nil,170],
			["G_Sport_Checkered",nil,180],
			["G_Sport_BlackWhite",nil,200],
			["G_Sport_Greenblack",nil,210],
			["G_Sport_Red",nil,220],
			["G_Squares",nil,230],
			["G_Tactical_Black",nil,500],
			["G_Tactical_Clear",nil,700],
			["G_Aviator",nil,240],
			["G_Goggles_VR",nil,6000],
			["G_Balaclava_blk",nil,9000],
			["G_Balaclava_combat","GasMaske",1000],
			["G_Diving",nil,1300]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_RebreatherB","Atemgerät",1000];
		_ret pushBack ["V_PlateCarrier1_blk",nil,1200];
		_ret pushBack ["V_Rangemaster_belt",nil,300]; //schwarz färben
		if(__GETC__(zak_copstufe) > 2) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE",nil,2500]; //COP
		};
		if(__GETC__(zak_copstufe) > 4) then
		{	
			_ret pushBack ["V_BandollierB_blk",nil,1200]; //COP
			_ret pushBack ["V_Chestrig_blk",nil,1200]; //COP
		};	
		if(__GETC__(zak_copstufe) > 6) then
		{
			_ret pushBack ["V_I_G_resistanceLeader_F",nil,2000]; 
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Carryall_oucamo",nil,35000],
			["B_TacticalPack_blk","Outdoor(Schwarz)",15000],
			["B_Kitbag_rgr","Sport RS (Schwarz)",20000]
		];
	};
};

_ret;