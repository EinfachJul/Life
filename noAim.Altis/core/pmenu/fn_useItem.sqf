/*
	Author: Bryan "Tonic" Boardwine
	Main function for item effects and functionality through the player menu.
*/
private["_item","_itemdice"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Sie mueessen zu erst einen Gegenstand auswaehlen!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
//*********************************************************************************************************
	// Lebensmittel
	
	//Trinken
	case (_item in ["goatmilk","water","coffee","orangejuice","applejuice","altiscola","altisorange"]):
	{
		playSound "drink";
		[_item] call noaim_fnc_drinkTrink;
	};
	
	//Essen
	case (_item in ["apple","orange","hotdog","fries","countrypotatoes","henrawsteak","roosterrawsteak","goatrawsteak","sheeprawsteak","rabbitrawsteak","saladpot","altismeal","burger1","burger2","burger3","burger4","burger5","burger6","pizza1","pizza2","pizza3","pizza4","sandwich","snack1","snack2","lasagne","spaghetti","doener","gyros","apfeltasche","icecream1","currywurst","salema","ornate","ornate","mackerel","tuna","mullet","catshark","turtlesoup","donuts"]):
	{
		playSound "eat";
		[_item] call noaim_fnc_eatFood;
	};

	case (_item in ["henraw","roosterraw","goatraw","sheepraw","rabbitraw"]): {
		hint "Das Fleisch muss erst gegrillt werden, an einem Lagerfeuer.";
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] call noaim_fnc_status_bar;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Du kannst nun 3 Minuten lang sprinten","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	// Alkohol
	case (_item in ["hopfenp","traubenp","altisbeer","wine"]):
	{
 		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_useAlkohol;
    	};
	};
	
	case (_item in ["getreideip","zuckerip","vodkau"]):
	{
 		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_useSpirituosen;
    	};
	};
	
//*********************************************************************************************************	
	//House Items
	
	case (_item in ["storagesmall","storagebig","boxzlarge","boxzsmall","boxzmedium"]): {
		[_item] call noaim_fnc_storageBox;
	};
	
//*********************************************************************************************************		
	// Spass Effekte
	case (_item in ["tabakp","tabakip"]):
	{
		if(life_drugged_weed == 1) then {
			hint "Du rauchst bereits eine Zig!";
		} else {
			if(([false,_item,1] call noaim_fnc_handleInv)) then
			{
				[] spawn noaim_fnc_usetobacco;
			};
		};
	};

	case (_item == "laptop"):
	{
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			hint "Kernel Error.";
		};
	};
	
//*********************************************************************************************************	
	// Fahrzeug Items
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "You can't refuel the vehicle while in it!"};
		[] spawn noaim_fnc_jerryRefuel;
	};
	
	case (_item == "fuelE"):
	{
		_FSAbfrage = nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"], 3];
		if((count _FSAbfrage) == 0) exitwith {closeDialog 0; hint "Du bist nicht in der Naehe einer Tankstelle";};
		[false,"fuelE",1] call noaim_fnc_handleInv;
		if(!(player canAdd _ItemOutput)) exitWith {closeDialog 0; hint "Du hast nicht genügend Platz im Inventar!";[true,"fuelE",1] call noaim_fnc_handleInv;};
		if((count _FSAbfrage) > 0) then
		{
			closeDialog 1;
			player removeMagazine _Item;
			[true,"fuelF",1] call noaim_fnc_handleInv;
			titleText["Du hast einen Benzinkanister aufgefüllt","PLAIN"];
		};
	};
	
	case (_item == "nitro"): { [] spawn noaim_fnc_nitro; };
	case (_item == "stahl"): { [] spawn noaim_fnc_wheel; };
	//case (_item in ["carwheel","truckwheel","scrapbody","scraphull","glasplate","tankbody","enginebody"]): { [] spawn noaim_fnc_auto; };
	//case (_item in ["vrotor","hrotor","avionics"]): { [] spawn noaim_fnc_heli; };

//*********************************************************************************************************	
	// Rebellen und Polizei Items
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn noaim_fnc_boltcutter;
		closeDialog 0;
	};
		
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn noaim_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn noaim_fnc_defuseKit;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn noaim_fnc_lockpick;
	};
	
	case (_item == "handcuffkey"):
	{
		[] spawn noaim_fnc_handcuffkey;
	};
	
	case (_item == "tracker"):
	{
		[] spawn noaim_fnc_tracker;
	};
	
	/*
	case (_item == "uwsl"): {
            if (("Land_Wreck_Traw_F" == typeOf cursorTarget) OR ("Land_Wreck_Traw2_F" == typeOf cursorTarget) && ([false,_item,1] call noaim_fnc_handleInv)) then {
			_ship = cursorTarget getVariable "opened";
			_ship_obj = cursorTarget;
			if (_ship) then {hint "Das Schiff wurde bereits geoeffnet!"};
			if (!_ship) then {
				hint "Der Sprengstoff wurde platziert, bitte entfernen Sie sich von dem Schiffswrack!";
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _ship_obj];
				sleep 10;
				"M_NLAW_AT_F" createVehicle [getPos _ship_obj select 0, getPos _ship_obj select 1, 0];
				schiffwoffen = true;
				publicVariableServer "schiffwoffen";
			};
		};
	}; */
	
	case (_item == "crowbar"):
	{
		[] spawn noaim_fnc_wrench;
	};

//*********************************************************************************************************	
	// Werkzeuge womit man Items sammeln muss
	
	case (_item == "pickaxe"):
	{
		[] spawn noaim_fnc_pickAxeUse;
	};
	
//NEUES
	case (_item == "shovel"):
	{
		[] spawn noaim_fnc_shovelUse;
	};
	
	case (_item == "handcoves"):
	{
		[] spawn noaim_fnc_handcovesUse;
	};
	
	case (_item == "sieb"):
	{
		[] spawn noaim_fnc_siebUse;
	};
	
	case (_item == "saege"):
	{
		[] spawn noaim_fnc_saegeUse;
	};
	
//*********************************************************************************************************		
	// Medikamente
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};

	case (_item == "painkillers"):
	{
		if(vehicle player != player) exitWith {hint "Du kannst dich nicht in einem Fahrzeug heilen..."};
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			_itemdice = random(100);
			if(_itemdice < 30) then {
				player setDamage 0;
				player setFatigue 0;
				player allowDamage true;
				player enableSimulation true;
				closeDialog 0;
				hint "Die Schmerzmittel haben gewirkt! Du hast nun wieder volles Leben."
			} else {
				hint "Die Schmerzmittel haben nicht gewirkt."
			};
		};
	};
	
	case (_item == "morphium"):
	{
		if(playerSide in [west,east]) exitWith {hint "Du bist im Dienst !"};
		if(vehicle player != player) exitWith {hint "Du kannst dich nicht in einem Fahrzeug heilen..."};
		if(([false,_item,1]call noaim_fnc_handleInv)) then
		{
			player setFatigue 1;
			player setDamage 0;
			//if(isNil "life_drink") then {life_drink = 0;};
			//life_drink = life_drink + 0.1;
			life_thirst = life_thirst - 65;
			life_hunger = life_hunger - 75;
			//if (life_drink < 0.08) exitWith {};
			[] spawn noaim_fnc_useAlkohol;
			closeDialog 0;
		};
	};
	
	//suicidePille adrenaline
	
//*********************************************************************************************************	
	// DROGEN
	
	case (_item == "heroinp"):
	{
 		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_useHeroin;
			life_dkonsum = life_dkonsum + 1;
    	};
	};
	case (_item == "cocainep"):
	{
 		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_useKokain2;
			life_dkonsum = life_dkonsum + 1;
    	};
	};	
	case (_item == "marijuana"):
	{
		if(life_drugged_weed == 1) then {
			hint "Du rauchst bereits ein Joint!";
		} else {
			if(([false,_item,1] call noaim_fnc_handleInv)) then
			{
				[] spawn noaim_fnc_useMarihuana;
				life_dkonsum = life_dkonsum + 1;
			};
		};
	};
	
	case (_item == "haschisch"): // SCRIPT LADEN ARYX
	{
 		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_useHaschisch;
			life_dkonsum = life_dkonsum + 1;
    	};
	};
	
//*********************************************************************************************************
	// Platzierbare Items der Polizei, Medic und Alac
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband gelegt"};
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_spikeStrip;
		};
	};
		
	case (_item == "schranke"):
	{
		if(playerSide in [civilian]) exitWith {hint "Du bist nicht berechtigt diese Items zu Platzieren!"};
		if(!isNull life_schranke) exitWith {hint "Du hast bereits eine Schranke aufgestellt"};
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_schranke;
		};
	};
	
	case (_item == "mauer"):
	{
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_mauer;
		};
	};
	
	case (_item == "barrierlight"):
	{
		if(!isNull life_barrierlight) exitWith {hint "Du hast bereits ein Lichtschranke aufgestellt"};
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_barrierlight;
		};
	};
		
	case (_item == "roadcone"):
	{
		if(playerSide in [civilian]) exitWith {hint "Du bist nicht berechtigt diese Items zu Platzieren!"};
		if(!isNull life_roadcone) exitWith {hint "Du hast bereits ein Kegel aufgestellt"};
		if(([false,_item,1] call noaim_fnc_handleInv)) then
		{
			[] spawn noaim_fnc_roadcone;
		};
	};
	
	case (_item in ["strahler","bunker"]): {
		if(playerSide in [civilian]) exitWith {hint "Du bist nicht berechtigt diese Items zu Platzieren!"};
		[_item] call noaim_fnc_placeObject;
	};
	
//*********************************************************************************************************	
	default
	{
		//hint localize "STR_ISTR_NotUsable";
		hint "Das Item ist nicht benutzbar.";
	};
};
	
[] call noaim_fnc_p_updateMenu;
[] call noaim_fnc_status_bar;