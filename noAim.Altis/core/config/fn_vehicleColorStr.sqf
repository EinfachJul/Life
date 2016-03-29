/*
	Author: Bryan "Tonic" Boardwine
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	// Quad
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Digi-Wueste"};
			case 2: {_color = "Blau"};
			case 3: {_color = "Rot"};
			case 4: {_color = "Weiss"};
			case 5: {_color = "Digi-Gruen"};
			case 6: {_color = "Jagd-Camo"};
			case 7: {_color = "Rebellen-Camo"};
			case 8: {_color = "Polizei"};
			case 9: {_color = "Feuerwehr"};
		};
	};

	case "C_Kart_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei Kart"};
			case 1: {_color = "Feuerwehr Kart"};
		};
	};
	
	// *** AUTOs ****************************************************************************************************************************	
	// Hatchback
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Polizei"};
			case 2: {_color = "Pizza"};
			case 3: {_color = "Notarzt"};
			case 4: {_color = "Gruen"};
			case 5: {_color = "Blau"};
			case 6: {_color = "Dunkelblau"};
			case 7: {_color = "Gelb"};
			case 8: {_color = "Weiss"};
			case 9: {_color = "Grau"};
			case 10: {_color = "Schwarz"};
			case 11: {_color = "Mafia"};
			case 12: {_color = "Gepunktet"};
			case 13: {_color = "Dunkelgruen"};
			case 14: {_color = "Dunkelrot"};
			case 15: {_color = "Bye kitty"};
			case 16: {_color = "Hello kitty"};
			case 17: {_color = "Marijuana"};
			case 18: {_color = "Post"};
			case 19: {_color = "Ghostbuster"};
			case 20: {_color = "Sunset"};
			case 21: {_color = "Wave"};
		};
	};
	
	// Hatchback SPORT
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Polizei"};
			case 2: {_color = "Notarzt"};
			case 3: {_color = "Post"};
			case 4: {_color = "Gruen"};
			case 5: {_color = "Blau"};
			case 6: {_color = "Dunkelblau"};
			case 7: {_color = "Flower Power"};
			case 8: {_color = "Monsta"};
			case 9: {_color = "Pizza"};
			case 10: {_color = "Rally Racer"};
			case 11: {_color = "Red Racing"};
			case 12: {_color = "Blue Racing"};
			case 13: {_color = "Weiss Racing"};
			case 14: {_color = "Racing"};
			case 15: {_color = "Beiges Racing"};
			case 16: {_color = "Gruen Racing"};
			case 17: {_color = "Mafia"};
			case 18: {_color = "Sunset"};
			case 19: {_color = "Wave"};
		};
	};
	
	// SUV
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkelrot"};
			case 1: {_color = "Polizei"};
			case 2: {_color = "Notarzt"};
			//case 3: {_color = "Taxi"};
			case 3: {_color = "Taxi-Kavala"};
			case 4: {_color = "Silber"};
			case 5: {_color = "Orange"};
			case 6: {_color = "Test"};
			case 7: {_color = "Mafia"};
			case 8: {_color = "Schwarz"};
			case 9: {_color = "Taxi-Altis"};
			case 10: {_color = "Taxi-Stratis"};
			case 11: {_color = "Camaro(Gelb)"};
			case 12: {_color = "Camaro(Schwarz)"};
			case 13: {_color = "Camaro(Rot)"};
			case 14: {_color = "Viper(Blau)"};
			case 15: {_color = "Autobahn"}; // 01.09.2015 Rigo
			case 16: {_color = "Silber(UC)"};
			case 17: {_color = "Camaro(Weiss)"};
			case 18: {_color = "Camaro(Feuer)"};
			case 19: {_color = "Camaro(Pink)"};
			case 20: {_color = "VIP"};
			case 21: {_color = "Weed"};
		};
	};
	
	// Offroad
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Polizei"};
			case 2: {_color = "Notarzt"};
			case 3: {_color = "Gelb"};
			case 4: {_color = "Weiss"};
			case 5: {_color = "Blau"};
			case 6: {_color = "Dunkelrot"};
			case 7: {_color = "Dunkellila"};
			case 8: {_color = "Blau Weiss"};
			case 9: {_color = "Lila"};
			case 10: {_color = "Pink"};
			case 11: {_color = "Violet"};
			case 12: {_color = "Neon Gruen"};
			case 13: {_color = "Signal Pink"};
			case 14: {_color = "Neon Gelb"};
			case 15: {_color = "Gold Gelb"};
			case 16: {_color = "Orange"};
			case 17: {_color = "Dunkelblau"};
			case 18: {_color = "Dunkelbraun"};
			case 19: {_color = "Mafia"};
			case 20: {_color = "Tuerkis"};
			case 21: {_color = "Weinrot"};
			case 22: {_color = "Braun"};
			case 23: {_color = "Olive Gruen"};
			case 24: {_color = "Sports Blau"};
			case 25: {_color = "Monsta"};
			case 26: {_color = "Sports Rot"};
			case 27: {_color = "BioHazard"};
		};
	};
	
	// Offroad - mit Sirene
	case "C_Offroad_01_repair_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Feuerwehr"}; // noAim
		};
	};
	
	// Offroad mit MG
	case "I_G_Offroad_01_armed_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	// Offroad mit MG
	case "B_G_Offroad_01_armed_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Grau"};
			case 2: {_color = "Rebellen"};
			case 3: {_color = "RebelCamo"};
		};
	};
	
	case "B_G_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "RebelCamo"};
		};
	};
	
	// *** LASTWÄGEN ****************************************************************************************************************************
	// Truck
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss+Schwarz"};
			case 1: {_color = "Rot+Schwarz"};
			case 2: {_color = "Mafia"};
			case 3: {_color = "Schwarz+HGruen"};
			case 4: {_color = "Schwarz+Gruen"};
			case 5: {_color = "Schwarz+Orange"};
			case 6: {_color = "Schwarz+HBlau"};
			case 7: {_color = "Schwarz+Blau"};
			case 8: {_color = "Schwarz+Rot"};
			case 9: {_color = "Schwarz+Weiss"};
			case 10: {_color = "Schwarz+HGrau"};
			case 11: {_color = "Schwarz+Grau"};
			case 12: {_color = "Weiss+Blau"};
			case 13: {_color = "Weiss+HBlau"};
			case 14: {_color = "Weiss+Rot"};
			case 15: {_color = "Weiss+Grau"};
			case 16: {_color = "Rot+Rot"};
			case 17: {_color = "Rot+Blau"};
			case 18: {_color = "Rot+Weiss"};
		};
	};
	
	case "I_G_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Feuerwehr"};
		};
	};
	
	// Truck Box
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Mafia"};
			case 1: {_color = "Notarzt"};
			case 2: {_color = "Altis Cola"};
			case 3: {_color = "Altis Post"};
			case 4: {_color = "Altis Bier"};
			case 5: {_color = "Schwarz+HGruen"};
			case 6: {_color = "Schwarz+Gruen"};
			case 7: {_color = "Schwarz+Orange"};
			case 8: {_color = "Schwarz+HBlau"};
			case 9: {_color = "Schwarz+Blau"};
			case 10: {_color = "Schwarz+Rot"};
			case 11: {_color = "Schwarz+Weiss"};
			case 12: {_color = "Schwarz+HGrau"};
			case 13: {_color = "Schwarz+Grau"};
			case 14: {_color = "Weiss+Blau"};
			case 15: {_color = "Weiss+HBlau"};
			case 16: {_color = "Weiss+Rot"};
			case 17: {_color = "Weiss+Grau"};
			case 18: {_color = "Rot+Rot"};
			case 19: {_color = "Rot+Blau"};
			case 20: {_color = "Rot+Weiss"};
			case 21: {_color = "Altis Orange"};
		};
	};
	
	// Truck Fuel
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Petrol"};
			case 1: {_color = "Gas"};
			case 2: {_color = "Milk"};
		};
	};
	
		// Zamak 01-06-2015 (edit)
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Mafia"};
			case 3: {_color = "Notarzt"};
			case 4: {_color = "Schwarz+Rot"};
			case 5: {_color = "Schwarz+Weiss"};
			case 6: {_color = "Schwarz+Grau"};
			case 7: {_color = "Schwarz+Gruen"};
			case 8: {_color = "Weiss+Blau"};
			case 9: {_color = "Weiss+Grau"};
			case 10: {_color = "Weiss+Schwarz"};
			case 11: {_color = "Orange+Rot"};
			case 12: {_color = "Orange+Blau"};
			case 13: {_color = "Hanf"};
			case 14: {_color = "Ereka"};
			case 15: {_color = "Polizei"};
		};
	};

	// Zamak 01-06-2015 (check)
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Mafia"};
			case 3: {_color = "Schwarz+Rot"};
			case 4: {_color = "Schwarz+Weiss"};
			case 5: {_color = "Schwarz+Grau"};
			case 6: {_color = "Schwarz+Gruen"};
			case 7: {_color = "Weiss+Blau"};
			case 8: {_color = "Weiss+Grau"};
			case 9: {_color = "Weiss+Schwarz"};
			case 10: {_color = "Orange+Rot"};
			case 11: {_color = "Orange+Blau"};
		};
	};
	
	// Truck NEED TEXTURE ZEROONE?
	case "I_Truck_02_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standart"};
			case 1: {_color = "Schwarz+Blau"}; // noAim
			case 2: {_color = "Schwarz+Rot"};
			case 3: {_color = "Schwarz+Weiss"};
			case 4: {_color = "Schwarz+Grau"};
			case 5: {_color = "Schwarz+Gruen"};
			case 6: {_color = "Weiss+Blau"};
			case 7: {_color = "Weiss+Grau"};
			case 8: {_color = "Weiss+Schwarz"};
			case 9: {_color = "Orange+Rot"};
			case 10: {_color = "Orange+Blau"};
			case 11: {_color = "Feuerwehr"};
		};
	};
	
		// Truck NEED TEXTURE ZEROONE?
	case "O_Truck_02_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};

	case "B_Truck_01_mover_F": //B_Truck_01_mover_F
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"}; //ALAC need edit
		};
	};
	
	// HEMTT 01-06-2015 (check)
	case "B_Truck_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	// HEMTT
	case "B_Truck_01_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	// HEMTT
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Orange"};
			case 2: {_color = "Rot"};
			case 3: {_color = "Blau"};
		};
	};
	// HEMTT
	case "B_Truck_01_ammo_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Radioaktiv"};
			case 1: {_color = "Standard"};
			case 2: {_color = "Orange"};
			case 3: {_color = "GSG9"};
		};
	};	
	
	// HEMTT
	case "B_Truck_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Petrol"};
		};
	};
	
	// Tempestt
	case "O_Truck_03_device_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};

	};
	
	// Tempestt
	case "O_Truck_03_ammo_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	// Tempestt
	case "O_Truck_03_covered_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	// Tempestt
	case "O_Truck_03_transport_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	// Tempestt
	case "O_Truck_03_fuel_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	
	// *** GEPANZERTE AUTOs ****************************************************************************************************************************
	// Hunter 01-06-2015 (edit)
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "Polizei"};
            case 2: {_color = "Mafia"};
			case 3: {_color = "Rebell-Pink"};
			case 4: {_color = "Rebell-Rot"};
			case 5: {_color = "Rebell-Gruen"};
			case 6: {_color = "Rebell-Blau"};
			case 7: {_color = "Feuerwehr"};
			case 8: {_color = "Clan1"};
		};
	};
	
	// Ifrit 01-06-2015 (edit)
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "Gruen-Camo"};
			case 2: {_color = "Blau-Camo"};
			case 3: {_color = "Rot-Camo"};
			case 4: {_color = "Pink-Camo"};
			case 5: {_color = "GSG9"};
		};
	};
	
	// Strider 01-06-2015 (edit)
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "GSG9"};
			case 2: {_color = "Polizei"};
			case 3: {_color = "Rebell-Green"};
			case 4: {_color = "Camo-Desert"};
			case 5: {_color = "Camo-Jungle"};
			case 6: {_color = "Camo-Fantasy"};
		};
	};
	
	// *** BOOTE ****************************************************************************************************************************
	// Boat 01-06-2015 (edit)
	case "C_Boat_Civil_01_police_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	// Boat 01-06-2015 (edit)
	case "C_Boat_Civil_01_rescue_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rescue"};
		};
	};
	
/*
	case "B_Boat_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
*/

	case "C_Rubberboat":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Rescue"};
			case 2: {_color = "Civilian"};
			case 3: {_color = "Opfor"};
			case 4: {_color = "Indp"};
		};
	};
	
	case "C_Boat_Civil_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	case "B_SDV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Indp"};
			case 2: {_color = "Opfor"};
		};
	};
	
	case "Submarine_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	case "O_Boat_Armed_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	case "B_Boat_Armed_01_minigun_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	case "I_Boat_Armed_01_minigun_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
		};
	};
	
	// *** HELICOPTER *******************************************************************************************
	// Hummingbird 01.06.2015 (edit)
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Polizei"};
			case 2: {_color = "Notarzt"};
			case 3: {_color = "Channel7"};
			case 4: {_color = "Digital-Gruen"};
			case 5: {_color = "Banditen-Digital"};
			case 6: {_color = "Ion"};
			case 7: {_color = "Blue"};
			case 8: {_color = "Standard"};
			// case 10: {_color = "Blueline"}; Polizeigrundlage
			case 9: {_color = "Welle"};
			case 10: {_color = "Elliptical"};
			case 11: {_color = "Furious"};
			case 12: {_color = "Jeans"};
			case 13: {_color = "Speedy"};
			case 14: {_color = "Sunset"};
			case 15: {_color = "Vrana"};
			case 16: {_color = "Wave"};
			case 17: {_color = "Digital"};
			case 18: {_color = "Graywatcher"};
			case 19: {_color = "Wasp"};
			case 20: {_color = "Shadow"};
			case 21: {_color = "Sheriff"};
			case 22: {_color = "Mafia"};
			case 23: {_color = "GSG9"};
			case 24: {_color = "Rebellen-Red"};
			case 25: {_color = "Clan1"};
		};
	};

	// Civil Heli - Color/Texture Support
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Furious"};
			case 2: {_color = "Wasp"};
		};
	};

	// Helicopter 01.06.2015 (edit)
	case "O_Heli_Transport_04_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Schwarz+Pink"};
			case 3: {_color = "Schwarz+Gelb"};
			case 4: {_color = "Schwarz+Rot"};
			case 5: {_color = "Schwarz+Orange"};
			case 6: {_color = "Schwarz+Weiss"};
			case 7: {_color = "Schwarz+Grau"};
			case 8: {_color = "GSG9"};
		};
	};
	
	case "O_Heli_Transport_04_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
		};
	};
	
	case "O_Heli_Transport_04_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Schwarz+Rot"};
		};
	};
	
	
	case "O_Heli_Transport_04_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Schwarz+Rot"};
		};
	};
	
	// Orca - Texture/Color:Black
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Digital-Gruen"};
			case 1: {_color = "Notarzt"};
			case 2: {_color = "Wuesten-Digi"};
			case 3: {_color = "Schwarz"};
			case 4: {_color = "Weiss - Blau"};
			case 5: {_color = "Mafia"};
			case 6: {_color = "Polizei"};
		};
	};

	// Hellcat - Texture/Schwarz
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "Polizei"};
		};
	};
	// Mohawk - Texture/Color:Black or Color:TAN,TANDARK,TANLIGHT check
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebell"};
			case 1: {_color = "Standard"};
			case 2: {_color = "Ion"};
			case 3: {_color = "Mafia"};
			case 4: {_color = "Notarzt"};
			case 5: {_color = "Test"};
			case 6: {_color = "Bundespolizei"};
		};
	};

	// Ghosthawk mit 2x MG ohne Munition
	case "B_Heli_Transport_01_F": 
	{
		switch (_index) do
		{
			case 0: {_color = "Mafia"};
			case 1: {_color = "GSG9"};
		};
	};
	
	// Huron - Texture/Color:Black or Color:Black&GELB
	case "B_Heli_Transport_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen"};
			case 1: {_color = "Schwarz+Pink"};
			case 2: {_color = "Schwarz"};
			case 3: {_color = "Schwarz+Gelb"};
			case 4: {_color = "Schwarz+Weiss"};
			case 5: {_color = "Schwarz+Rot"};
			case 6: {_color = "GSG9"};
		};
	};
	
	/*
	// CARGO
	case "B_Slingload_01_Cargo_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Test"};
		};
	};
	
	case "B_Slingload_01_Fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Test"};
		};
	};
	
	case "Land_Pod_Heli_Transport_04_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Standard"};
			case 2: {_color = "Test"};
		};
	};
	
	case "Land_Pod_Heli_Transport_04_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Standard"};
			case 2: {_color = "Test"};
		};
	};
	
	case "Land_Pod_Heli_Transport_04_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Standard"};
			case 2: {_color = "Test"};
		};
	};
	
	case "Box_IND_AmmoVeh_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Test"};
		};
	};
	*/
	// *** PLANES ****************************************************************************************************************************

	// Planes : 27-05-2015
	case "I_Plane_Fighter_03_AA_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Test"};
		};
	};
	// Planes : 27-05-2015
	case "B_Plane_CAS_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Test"};
		};
	};
	// Planes : 27-05-2015
	case "O_Plane_CAS_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Test"};
		};
	};
};
_color;