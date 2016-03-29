/*
	Author: Bryan "Tonic" Boardwine
	Master config for a thing that will be gone eventually..
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0;};

if(!dialog) then
{
	if(!(createDialog "shop_menu")) exitWith {};
};
disableSerialization;
ctrlSetText[601,format["Geld: €%1",[life_znorak] call noaim_fnc_numberText]];

switch (_shop) do
{
	case "reb":
	{
		ctrlSetText[2505,"Rebel Shop"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	case "maf":
	{
		ctrlSetText[2505,"Mafia Zone Shop"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "clanbase":
	{
		ctrlSetText[2505,"Clanbase Zone Shop"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "gsg9":
	{
		ctrlSetText[2505,"GSG9 Shop"];
		ctrlShow[2503,false];
	};
	
	case "fwr";
	{
		ctrlSetText[2505,"Feuerwehr Shop"];
		ctrlShow[2503,false];
	};
	
	case "cop":
	{
		ctrlSetText[2505,"Cop Shop"];
		ctrlShow[2503,false];
	};
	
	case "gun":
	{
		ctrlSetText[2505,"Gun Store"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "taxi":
	{
		ctrlSetText[2505,"Taxi Store"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "gang":
	{
		ctrlSetText[2505,"Gang Shop"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "dive":
	{
		ctrlSetText[2505,"Diving Shop"];
		ctrlShow[2503,false];
		ctrlShow[2510,false];
		ctrlShow[2511,false];
		ctrlShow[2513,false];
	};
	
	case "donator":
	{
		ctrlSetText[2505,"Donator Shop"];
	};
	
	case "sergeant":
	{
		ctrlSetText[2505,"Sergeants Shop"];
		ctrlShow[2503,false];
	};
	
	case "gen":
	{
		ctrlSetText[2505,"General Store"];
		ctrlShow[2503,false];
	};
	
	case "officer":
	{
		ctrlSetText[2505,"Patrol Officer Shop"];
		ctrlShow[2503,false];
	};
	
	case "admin":
	{
		ctrlSetText[2505,"Admin Shop"];
	};
};

["guns"] call noaim_fnc_shops_changeMenu;