/*
	Author: Bryan "Tonic" Boardwine
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ (1)","icons\spawnselect\cops.paa"],
			//["cop_spawn_2","Pyrgos HQ (2)","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			//["cop_spawn_5","Sofia HQ (3)","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4_1","AIR / Athira (2)","icons\spawnselect\cops.paa"],
			["cop_jail_spawn","Gefaengnis (3)","icons\spawnselect\jail.paa"],
			["cop_spawn_21","Kuestenwache (4)","icons\spawnselect\polcheck.paa"],
			["cop_spawn_aka","Akademie (5)","icons\spawnselect\polcheck.paa"]
		];
	};
		
	case civilian:
	{
		_return = [
			["civ_spawn_1","Kavala","icons\spawnselect\kavala.paa"],
			["civ_spawn_2","Pyrgos","icons\spawnselect\pyrgos.paa"],
			["civ_spawn_3","Athira","icons\spawnselect\athira.paa"],
			["civ_spawn_4","Sofia","icons\spawnselect\sofia.paa"]
		];
		if(license_civ_rebel) then
		{
		_return = _return + [
			["reb_spawn_hq_1","Rebellen HQ","icons\spawnselect\rebel.paa"]
			//["reb_spawn_blackmarket","Schwarzmarkt","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if(license_civ_mafia) then
		{
		_return = _return + [
			["mafia_spawn_1","Corleone","icons\spawnselect\mafia.paa"]
			];
		};
		
		if(license_civ_donator) then
		{
		_return = _return + [
			["donator_spawn","VIP Camp","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if (license_civ_taxi) then
        {
	    _return = _return + [
			["spawn_taxi","Taxi Zentrale","icons\spawnselect\taxi.paa"]
			];
        };
		
		if(license_civ_clan1) then { _return = _return + [ ["clanbase_01","Clan Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"] ]; };
	
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"icons\spawnselect\home.paa"];;
			} foreach life_houses;
		};	
	};
	
	case east: {
		_return = [
			["medic_spawn_1","Kavala Krankenhaus","icons\spawnselect\sani.paa"],
			["medic_spawn_2","Air Krankenhaus","icons\spawnselect\sani.paa"],
			["medic_spawn_3","Pygros Krankenhaus","icons\spawnselect\sani.paa"],
			
			["fw_spawn_1","Feuerwehr Kavala","icons\spawnselect\feuerwehr.paa"],
			["fw_spawn_3","Feuerwehr Athira","icons\spawnselect\feuerwehr.paa"],
			["fw_spawn_2","Feuerwehr Rodopoli","icons\spawnselect\feuerwehr.paa"]
		];
	};
	
	/*
	case independent: {
		_return = [
			["fw_spawn_1","Feuerwehr Kavala","icons\spawnselect.paa"],
			["fw_spawn_3","Feuerwehr Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["fw_spawn_2","Feuerwehr Rodopoli","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};*/
};

_return;