[] spawn  {
	private["_fnc_food","_fnc_water","_fnc_drogen"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call noaim_fnc_status_bar;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call noaim_fnc_status_bar;	
			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};
	
	/*_fnc_drogen = 
	{
		//[] call noaim_fnc_status_bar;
		if(life_drug < 0.1) then {}
		else
		{
			if(life_drug < 0.2) then {hint "Du bist clean!";};
			life_drug = life_drug - 0.1;
			switch(life_drug) do
			{
				case 1.0: {hint "Sie sollten bei einen Notarzt vorbei schauen! Sie sind stark Drogensuechtig!";};
				case 0.6: {hint "Du bist noch stark unter Drogeneinfluss. Fahre kein Auto und halte dich am besten von der Polizei fern!";};
				case 0.3: {hint "Langsam ist alles abgebaut! Probleme sollte es mit der Polizei nun nicht mehr geben, jedoch solltest du das Auto noch stehen lassen.";};
				case 0.1: {hint "Fast clean. Gut gemacht!";};
			};
		};
	};*/
		
	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call noaim_fnc_status_bar;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
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
		//[] call noaim_fnc_updateClothing;
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
		sleep 1.5;
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

[] spawn  {
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};