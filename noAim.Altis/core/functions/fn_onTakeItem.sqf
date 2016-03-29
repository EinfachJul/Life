/*
	Author: Bryan "Tonic" Boardwine
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

_itemInfo = [_item] call noaim_fnc_fetchCfgDetails;

[] call noaim_fnc_updateClothing;

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		//if (backpack player != "") then { _load = 60; };
		if (backpack player == "B_AssaultPack_blk") then { _load = 40; }; //Marke
		if (backpack player == "B_FieldPack_blk") then { _load = 60; }; //Marke
		if (backpack player == "B_Bergen_blk") then { _load = 90; }; //Marke
		if (backpack player == "B_OutdoorPack_blk") then { _load = 90; }; //Marke
		if (backpack player == "B_TacticalPack_oli") then { _load = 100; }; //Marke Jungle
		if (backpack player == "B_TacticalPack_blk") then { _load = 100; }; //Marke Black
		if (backpack player == "B_Kitbag_mcamo") then { _load = 115; }; //Marke Camo
		if (backpack player == "B_Kitbag_rgr") then { _load = 115; }; //Marke Black
		if (backpack player == "B_Carryall_oli") then { _load = 130; }; //Marke Jungle
		if (backpack player == "B_Carryall_cbr") then { _load = 130; }; //Marke Black
		if (backpack player == "B_Carryall_ocamo") then { _load = 130; }; //Marke Desert
		if (backpack player == "B_Carryall_oucamo") then { _load = 100; }; //INVIS
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 0.2; //NOWX
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};