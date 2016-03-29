private ["_speed","_vehicle","_name","_list","_blitzer50"];

while {playerSide == civilian} do 
{
	_vehicle = vehicle player;
	_speed = speed _vehicle;
	_blitzer50 = [Kavala_Nord,Kavala_Sued,Kavala_Mitte,Checkpoint_1_50_1,Checkpoint_1_50_2,GrenzeSued,GrenzeNord,Sofia_0_50_1,Pygros_0_50_1,Athera_0_50_1];
	_name = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayname");
	_list = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","B_Truck_01_mover_F","O_Truck_03_transport_F","O_Truck_03_device_F","C_Van_01_fuel_F","O_Truck_03_covered_F","C_Offroad_01_repair_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","C_Kart_01_F","C_Kart_01_black_F","O_MRAP_02_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","B_G_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_box_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","B_MRAP_01_F","I_MRAP_03_F"];
	{
		if ((player == driver _vehicle) && (_vehicle distance _x < 15) && (_speed >= 55)) then 
		{ 
			titleCut [" ","white in",1];
			//[[getPlayerUID player,name player,"501"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;
			switch(true) do
			{
				case (_speed >= 50 and _speed < 75): 	{[getPlayerUID player,name player,"501"] remoteExec ["noaim_fnc_wantedAdd",2];};
				case (_speed >= 75 and _speed < 100): 	{[getPlayerUID player,name player,"502"] remoteExec ["noaim_fnc_wantedAdd",2];};
				case (_speed >= 100 and _speed < 125): 	{[getPlayerUID player,name player,"503"] remoteExec ["noaim_fnc_wantedAdd",2];};
				case (_speed >= 125 and _speed < 150): 	{[getPlayerUID player,name player,"504"] remoteExec ["noaim_fnc_wantedAdd",2];};
				case (_speed >= 150 and _speed < 175): 	{[getPlayerUID player,name player,"505"] remoteExec ["noaim_fnc_wantedAdd",2];};
				case (_speed >= 175 and _speed < 200): 	{[getPlayerUID player,name player,"506"] remoteExec ["noaim_fnc_wantedAdd",2];};
				case (_speed >= 200 and _speed < 350): 	{[getPlayerUID player,name player,"507"] remoteExec ["noaim_fnc_wantedAdd",2];};
			};
			
			hint parseText format ["Du wurdest gerade geblitzt! (Limit: 50, Geschwindigkeit: %1)", round _speed];
			//[[0,format["%1 wurde geblitzt! Fahrzeug: %4, Position: %3, Geschwindigkeit: %2 Kmh!",name player, round _speed, _x, _name]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
			[0,format["%1 wurde geblitzt! Fahrzeug: %4, Position: %3, Geschwindigkeit: %2 Kmh!",name player, round _speed, _x, _name]] remoteExecCall ["noaim_fnc_broadcast",west];			
			//[[0,format["%1 wurde geblitzt! Fahrzeug: %3, Geschwindigkeit: %2 Kmh!",name player, round _speed, _name]],"noaim_fnc_broadcast",civilian,false] spawn noaim_fnc_TRY;
			[0,format["%1 wurde geblitzt! Fahrzeug: %3, Geschwindigkeit: %2 Kmh!",name player, round _speed, _name]] remoteExecCall ["noaim_fnc_broadcast",civilian];
			sleep 3;
		};
	} foreach _blitzer50;
	sleep 1;
};