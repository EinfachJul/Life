/*
	File: fn_npcInit.sqf
	Author: MarkusSR1984
*/


_object = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

if (!hasInterface) exitWith 
	{
		_object enableSimulation false;
		_object allowDamage false;
		
	};

switch (_type) do
{
	case "Clanbase_Handel":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};
		
		_this addAction["Bankautomat",noaim_fnc_atmMenu,"",0,false,false,"",' license_civ_clan1 && playerSide == civilian && player distance _target < 4'];
		_this addAction["ClanStore",noaim_fnc_virt_menu,"clanbase",0,false,false,"",' license_civ_clan1 && playerSide == civilian && player distance _target < 3'];
		_this addAction["Clanwaffen",noaim_fnc_weaponShopMenu,"clanbase",0,false,false,"",'license_civ_clan1 && playerSide == civilian'];
		_this addAction["Gemischtwaren",noaim_fnc_weaponShopMenu,"genstore",0,false,false,"",'license_civ_clan1 && playerSide == civilian'];
		_this addAction["Clanfahrzeuge",noaim_fnc_vehicleShopMenu,["clan_veh",civilian,["cb_clan1"],"clan1","Clanbasehändler"],0,false,false,"",'license_civ_clan1'];	
		//_this addAction["Fahrzeug Garage", { [getPlayerUID player,playerSide,"Car",player] remoteExec ["TON_fnc_getVehicles",2]; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Hole Fahrzeuge..."]; life_garage_sp = "cb_clan1"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide == civilian && license_civ_clan1'];
		_this addAction["Fahrzeug Garage", { [getPlayerUID player,playerSide,"Car",player] remoteExec ["TON_fnc_getVehicles",2]; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Hole Fahrzeuge..."]; life_garage_sp = "cb_clan1"; life_garage_type = "Air"; },"",0,false,false,"",'playerSide == civilian && license_civ_clan1'];
		_this addAction["Flugfahrzeug Garage", { [getPlayerUID player,playerSide,"Air",player] remoteExec ["TON_fnc_getVehicles",2]; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Hole Fahrzeuge..."]; life_garage_sp = "cb_clan1"; life_garage_type = "Air"; },"",0,false,false,"",'playerSide == civilian && license_civ_clan1'];
		_this addAction["Flugfahrzeug einparken",noaim_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && playerSide == civilian && license_civ_clan1'];
		};	
	};
	
	case "Stuhl_Effekt":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};	
		_this addAction ["Sit Down","scripts\chair\sitdown.sqf","",0,false,false,"",'player distance _target < 2 && !(_target getVariable["occupied",false]) && isNil "life_sitting_chair" && isNil "life_action_standup"'];
		};	
	};
	
	case "Taxi_Werbung":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};	
			_this setObjectTexture [0,"textures\schilder\dienst\taxi.paa"];
		};	
	};
	
	case "Taxi_Parking":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};	
			_this setObjectTexture [0,"textures\schilder\dienst\taxi2.paa"];
		};	
	};
	
	case "Taxi_Store1":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};	
			_this addAction["Taxi Fahrzeuge",noaim_fnc_vehicleShopMenu,["taxi_car",civilian,["civ_taxi_1_2"],"taxi","Taxi Zentrale"],0,false,false,"",'license_civ_taxi'];
			_this addAction["OnDuty gehen",{if (!license_civ_taxi) exitWith {};life_isOnDutyTaxi = true;[player] remoteExec ["TON_fnc_goOnDuty",2]; }];
			_this addAction["OffDuty gehen",{if (!license_civ_taxi) exitWith {};life_isOnDutyTaxi = false;[player] remoteExec ["TON_fnc_goOffDuty",2];}];
			_this addAction["Taxi Zubehör",noaim_fnc_weaponShopMenu,"gas_station",0,false,false,"",'license_civ_taxi && playerSide == civilian'];	
			_this addAction["Taxi Garage", { [getPlayerUID player,playerSide,"Car",player] remoteExec ["TON_fnc_getVehicles",2]; createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   life_garage_sp = "civ_taxi_1_2"; life_garage_type = "Car";  },"",0,false,false,"",'playerSide == civilian && license_civ_taxi && player distance _target < 4'];
			_this addAction["Taxi einparken",noaim_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && playerSide == civilian && license_civ_taxi'];
		};
	};
	case "Taxi_Store2":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};	
			_this addAction["Taxi Fahrzeuge",noaim_fnc_vehicleShopMenu,["taxi_car",civilian,["civ_taxi_3"],"taxi","Taxi Zentrale"],0,false,false,"",'license_civ_taxi'];
			_this addAction["OnDuty gehen",{if (!license_civ_taxi) exitWith {};life_isOnDutyTaxi = true;[player] remoteExec ["TON_fnc_goOnDuty",2]; }];
			_this addAction["OffDuty gehen",{if (!license_civ_taxi) exitWith {};life_isOnDutyTaxi = false;[player] remoteExec ["TON_fnc_goOffDuty",2];}];
			_this addAction["Taxi Zubehör",noaim_fnc_weaponShopMenu,"gas_station",0,false,false,"",'license_civ_taxi && playerSide == civilian'];
			_this addAction["Taxi Garage", { [getPlayerUID player,playerSide,"Car",player] remoteExec ["TON_fnc_getVehicles",2]; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Hole Fahrzeuge..."]; life_garage_sp = "civ_taxi_3"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide == civilian && license_civ_taxi'];
			_this addAction["Taxi einparken",noaim_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && playerSide == civilian && license_civ_taxi'];
		};	
	};
	case "Taxi_Store3":
	{ 
		_object enableSimulation false; 
		_object allowDamage false;
		_object spawn
		{ 
		waitUntil{!isNil "life_firstSpawn"}; waitUntil{!life_firstSpawn};	
			_this addAction["Taxi Fahrzeuge",noaim_fnc_vehicleShopMenu,["taxi_car",civilian,["civ_taxi_1_7"],"taxi","Taxi Zentrale"],0,false,false,"",'license_civ_taxi'];
			_this addAction["OnDuty gehen",{if (!license_civ_taxi) exitWith {};life_isOnDutyTaxi = true;[player] remoteExec ["TON_fnc_goOnDuty",2]; }];
			_this addAction["OffDuty gehen",{if (!license_civ_taxi) exitWith {};life_isOnDutyTaxi = false;[player] remoteExec ["TON_fnc_goOffDuty",2];}];
			_this addAction["Taxi Zubehör",noaim_fnc_weaponShopMenu,"gas_station",0,false,false,"",'license_civ_taxi && playerSide == civilian'];
			_this addAction["Taxi Garage", { [getPlayerUID player,playerSide,"Car",player] remoteExec ["TON_fnc_getVehicles",2]; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Hole Fahrzeuge..."]; life_garage_sp = "civ_taxi_1_7"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide == civilian && license_civ_taxi'];
			_this addAction["Taxi einparken",noaim_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && playerSide == civilian && license_civ_taxi'];
		};	
	};
};