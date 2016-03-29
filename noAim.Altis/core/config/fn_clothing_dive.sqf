/*
	Author: Bryan "Tonic" Boardwine
	Master configuration file for  Diving Shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Steve's Diving Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_Wetsuit",nil,50000],
			["U_O_Wetsuit",nil,50000]
		];
	};
	
	//Hats
	case 1:
	{
		[
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Diving",nil,50000]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB",nil,100000],
			["V_RebreatherIA",nil,100000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_FieldPack_blk",nil,30000]
		];
	};
};
