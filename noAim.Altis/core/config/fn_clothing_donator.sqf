/*
	Author: Bryan "Tonic" Boardwine
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
					//Zivilekleidung
		 //   ["U_C_Poloshirt_blue",nil,750],
			["U_B_GhillieSuit",nil,225000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			//Zivilhelme
	        ["H_Cap_blu",nil,2500],
			["H_HelmetO_oucamo",nil,125000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			//Zivilbrillen
			["G_Aviator",nil,2500],
			["G_Tactical_Black",nil,135000]
		];
	};
	
	//Vest
	case 3:
	{
		[
			//Zivilwesten
		    ["V_Rangemaster_belt",nil,20000],
			["V_PlateCarrierIA2_dgtl",nil,150000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			//Zivilrucksäcke
		    ["B_AssaultPack_cbr",nil,9000],
			["B_Carryall_oucamo",nil,20000]
		];
	};
};