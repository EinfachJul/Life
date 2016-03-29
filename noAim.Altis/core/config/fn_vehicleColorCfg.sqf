/*
		Author: Bryan "Tonic" Boardwine
		Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	// Quad
	case "B_Quadbike_01_F": // 01-06-2015 (check)
	{
		_ret =
		[
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"], //2
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"], //1
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"], //3
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"], //4
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"], //5
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"], //6
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"], //7
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"], //8
			["textures\vehicle\cop\cop_quad.paa","cop"],
			["textures\vehicle\fw\fw_quad.paa","med"]
		];
	};
	
	case "C_Kart_01_F": // 01-06-2015 (check)
	{
		_ret =
		[
			["textures\vehicle\cop\cop_kart.paa","cop"], //2 by noAim - 10.03.2015
			["textures\vehicle\fw\fw_kart.paa","med"]
		];
	};
	
	// *** AUTOs ****************************************************************************************************************************
		
	// Hatchback
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["textures\vehicle\cop\cop_hatchback_0.paa","cop"],
			["textures\test\civ_hatchback_pizza.paa","civ"],
			["textures\vehicle\medic\medic_hatchback.paa","med"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base05_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","maf"],
			["#(argb,8,8,3)color(0.5,1,0,0.002)","civ"], //GRÜN
			["#(argb,8,8,3)color(1,0.27,0,0.002)","civ"], //ROT
			["textures\vehicle\civ\car\civ_hatchback_byekitty.paa","civ"],
			["textures\vehicle\civ\car\civ_hatchback_hallokitty.paa","civ"],
			["textures\vehicle\civ\car\civ_hatchback_marijuana.paa","civ"],
			["textures\vehicle\civ\car\civ_hatchback_post.paa","civ"],
			["textures\vehicle\civ\car\civ_hatchback_ghost.paa","civ"],
			["textures\vehicle\civ\car\civ_hatchback_sunset.paa","civ"],
			["textures\vehicle\civ\car\civ_hatchback_wave.paa","civ"]
		];
	};


	// Hatchback Sport
	case "C_Hatchback_01_sport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["textures\vehicle\cop\cop_hatchback_0.paa","cop"],
			["textures\vehicle\medic\medic_hatchback.paa","med"],
			["textures\vehicle\civ\car\civ_hatchback_post.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["textures\test\civ_hatchback_fpower2.paa","civ"],
			["textures\test\civ_hatchback_monsta.paa","civ"],
			["textures\test\civ_hatchback_pizza.paa","civ"],
			["textures\test\civ_hatchback_race.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf"], //schwarz
			["textures\vehicle\civ\car\hatchback_sunset.paa","civ"],
			["textures\vehicle\civ\car\hatchback_wave.paa","civ"]
		];
	};
  
	// SUV
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["textures\vehicle\cop\cop_suv_0.paa","cop"],
			["textures\vehicle\medic\med_suv_0.paa","med"],
			["textures\vehicle\taxi\zero_taxi_kavala.paa","taxi"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf"], //schwarz
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"], //schwarz
			["textures\vehicle\taxi\zero_taxi_altis.paa","taxi"],
			["textures\vehicle\taxi\zero_taxi_stratis.paa","taxi"],
			["textures\vehicle\civ\camaro\civ_suv_camaro.paa","civ"],
			["textures\vehicle\civ\camaro\civ_suv_camaroB.paa","civ"],
			["textures\vehicle\civ\camaro\civ_suv_camaroR.paa","civ"],
			["textures\vehicle\civ\camaro\civ_suv_viper.paa","civ"],
			["textures\vehicle\cop\cop_2_suv_0.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","gsg9"], //ZIVIL POLIZEI SILVER
			["textures\vehicle\civ\camaro\civ_suv_white.paa","civ"],
			["textures\vehicle\civ\camaro\civ_suv_red.paa","civ"],
			["textures\vehicle\civ\camaro\rc2\civ_suv_pink.paa","civ"],
			["textures\test\civ_suv_vip.paa","donate"], //v0.1
			["textures\test\civ_suv_weed.paa","civ"] //v0.1
		];
	};
	
	// Offroader
	case "C_Offroad_01_F": // 01-06-2015 (edit)
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","civ"], //5 rot
			["textures\vehicle\cop\cop_offroad.paa","cop"],
			["textures\vehicle\fw\fw_offroader1.paa","med"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","civ"], //gelb
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","civ"], //weiss
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"], //blau
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"], //dunkelrot
			["#(argb,8,8,3)color(0.08,0,0.15,1)","civ"],					// Dunkles Lila
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"], //blau/weiss
			["#(argb,8,8,3)color(0.1,0,0.1,1)","civ"],						// Lila
			["#(argb,8,8,3)color(0.2,0,0.2,1)","civ"],						// Pink
			["#(argb,8,8,3)color(0.54,0.17,0.89,1)","civ"],					// Violet
			["#(argb,8,8,3)color(0.5,1,0,1)","civ"],						// Neon Grün GEIL
			["#(argb,8,8,3)color(0.86,0.08,0.24,1)","civ"],					// Pink GEIL
			["#(argb,8,8,3)color(0.49,0.99,0,1)","civ"],					// Neon Gelb *CHECK sonst (0.2,0.8,0.2,1)oder(1,0.98,0.8,1)
			["#(argb,8,8,3)color(1,0.27,0,1)","civ"],						// Gold Gelb
			["#(argb,8,8,3)color(0.72,0.08,0,1)","civ"],					// Orange
			["#(argb,8,8,3)color(0,0.03,0.14,1)","civ"],					// Dunkel Blau
			["#(argb,8,8,3)color(0.09,0.03,0,1)","civ"],					// Dunkelbraun
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","maf"], 				// Schwarz
			["#(argb,8,8,3)color(0,0.98,0.6,1)","civ"],						// Türkis
			["#(argb,8,8,3)color(0.13,0,0,1)","civ"],						// WeinRot
			["#(argb,8,8,3)color(0.18,0.05,0,1)","civ"],					// Braun
			["#(argb,8,8,3)color(0.1,0.1,0,1)","civ"],						// Olive
			["textures\vehicle\civ\jeep\civ_offroad_blusport.paa","civ"],
			["textures\vehicle\civ\jeep\civ_offroad_monsta.paa","civ"],
			["textures\vehicle\civ\jeep\civ_offroad_redsport.paa","civ"],
			["textures\vehicle\civ\jeep\civ_offroad_biohazard.paa","civ"]
		];
	};
	
	case "C_Offroad_01_repair_F": // 01-06-2015 (check)
	{
		_ret =
		[
			["textures\vehicle\fw\fw_offroader.paa","med"] //2 by noAim - 10.03.2015
		];
	};
	
	case "I_G_Offroad_01_armed_F": // 01-06-2015 (check)
	{
		_ret =
		[
			["textures\vehicle\cop\cop_offroad.paa","cop"]
		];
	};
	
		
	case "B_G_Offroad_01_armed_F":
	{
		_ret =
		[
			["#(ai,64,64,1)Fresnel(0.3,3)","maf"],				//schwarz
			["#(argb,8,8,3)color(0.2,0.2,0.2,1)","maf"],		// Hellgrau
			["\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa","reb"],
			["\A3\soft_f_gamma\Offroad_01\Data\Offroad_01_ext_IG01_CO.paa","reb"]
		];
	};
	
	case "B_G_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa","reb"],
			["\A3\soft_f_gamma\Offroad_01\Data\Offroad_01_ext_IG01_CO.paa","reb"]
		];
	};
	
	// *** LASTWÄGEN ****************************************************************************************************************************
	
	// Truck
	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf","#(ai,64,64,1)Fresnel(0.3,3)"],								// Schwarz+Schwarz
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,1,0,0.2)"],					// Schwarz+HGrün
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.01,0.11,0,1)"],				// Schwarz+Grün
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,0.27,0,0.1)"],					// Schwarz+Orange
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,0.2,0.34,1)"],					// Schwarz+HBLAU
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],				// Schwarz+BLAU
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"],					// Schwarz+Rot
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"],						// Schwarz+Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.2,0.2,0.2,1)"],				// Schwarz+HGrau
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"],				// Schwarz+Grau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],		// Weiss+BLAU
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0,0.2,0.34,1)"],			// Weiss+HellBlau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"],			// Weiss+Rot
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"],		// Weiss+Grau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"],		// Rot+Rot
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],		// Rot+Blau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","#(argb,8,8,3)color(1,1,1,1)"]			// Rot+Weiss
		];
	};
	
	case "I_G_Van_01_transport_F":
	{
		_ret =
		[
			["textures\vehicle\medic\medic_van.paa","med","textures\vehicle\fw\fw_truck.paa"]
		];
	};
	
	// Truck Box
	case "C_Van_01_box_F":
	{
		_ret =
		[
			["#(ai,64,64,1)Fresnel(0.3,3)","maf","#(ai,64,64,1)Fresnel(0.3,3)"],
			["textures\vehicle\medic\medic_van.paa","med","textures\vehicle\fw\fw_truck.paa"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","textures\vehicle\civ\truck\civ_van_cola_adds.paa"], //TEST
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","textures\vehicle\civ\truck\civ_van_post_adds.paa"], //TEST
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","textures\vehicle\civ\truck\civ_van_bier2_adds.paa"], //TEST
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,1,0,0.2)"],			// Schwarz HGrün
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.01,0.11,0,1)"],			// Schwarz Grün
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,0.27,0,0.1)"],			// Schwarz Orange
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,0.2,0.34,1)"],			// Schwarz HBLAU
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],			// Schwarz BLAU
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"],			// Schwarz Rot
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"],				// Schwarz Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.2,0.2,0.2,1)"],				// Schwarz HGrau
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.14,0.14,0.14,1)"],					// Schwarz Grau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],		// Weiss+BLAU
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0,0.2,0.34,1)"],			// Weiss+HellBlau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"],			// Weiss+Rot
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ","#(argb,8,8,3)color(0.14,0.14,0.14,1)"],		// Weiss+Grau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"],		// Rot+Rot
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],		// Rot+Blau
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","#(argb,8,8,3)color(1,1,1,1)"],		// Rot+Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","textures\vehicle\civ\truck\civ_van_orange_adds.paa"] //TEST
		];
	};
	
	// Truck Fuel
	case "C_Van_01_fuel_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","textures\vehicle\civ\truck\civ_van_tank_adds_oel.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","textures\vehicle\civ\truck\civ_van_tank_adds_gas.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","textures\vehicle\civ\truck\civ_van_tank_adds_milch.paa"]
		];
	};
	
	// Zamak 01-06-2015 (edit)
	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf","#(ai,64,64,1)Fresnel(0.3,3)"],
			["#(ai,64,64,1)Fresnel(0.3,3)","alt","#(ai,64,64,1)Fresnel(0.3,3)"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //Schwarz+Rot
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"], //Schwarz+Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //Schwarz+Grau
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.01,0.11,0,1)"], //Schwarz+Grün
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"], //Weiss+Blau
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //Weiss+Grau
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"], //Weiss+Schwarz
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //Orange+Rot
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"], //Orange+Blau*/
			["textures\vehicle\civ\truck\civ_zamak_hanf.paa","civ","textures\vehicle\civ\truck\civ_zamak_hanf_adds.paa"], //1 by noAim - 19.03.2015
			["textures\vehicle\civ\truck\civ_zamak_ereka.paa","civ","textures\vehicle\civ\truck\civ_zamak_ereka_adds.paa"], //2 by noAim - 19.03.2015
			["textures\vehicle\cop\truck\cop_zamak_0.paa","cop","textures\vehicle\cop\truck\cop_zamak_1.paa"] //2 by noAim - 23.10.2015
		];
	};
	
	// Zamak 01-06-2015 (edit)
	case "I_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf","#(ai,64,64,1)Fresnel(0.3,3)"], //schwarz
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //Schwarz+Rot
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"], //Schwarz+Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //Schwarz+Grau
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.01,0.11,0,1)"], //Schwarz+Grün
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"], //Weiss+Blau
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //Weiss+Grau
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"], //Weiss+Schwarz
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //Orange+Rot
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"] //Orange+Blau*/
		];
	};
	
	// Zamak
	case "I_Truck_02_box_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"],//Schwarz+Blau
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //Schwarz+Rot
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"], //Schwarz+Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //Schwarz+Grau
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.01,0.11,0,1)"], //Schwarz+Grün
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"], //Weiss+Blau
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //Weiss+Grau
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"], //Weiss+Schwarz
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //Orange+Rot
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0,0.03,0.14,1)"], //Orange+Blau*/
			["textures\vehicle\fw\fw_zamak_front.paa","med","textures\vehicle\fw\fw_zamak_box.paa"] //FW
		];
	};
	
	case "O_Truck_02_fuel_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,1,1,1)"]
		];
	};
	
	case "B_Truck_01_mover_F":
	{
		_ret =
		[
			["textures\vehicle\fw\fw_hemtt.paa","med","textures\vehicle\fw\fw_hemtt_adds.paa"]
		];
	};

	// HEMTT
	case "B_Truck_01_box_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};

	// HEMTT
	case "B_Truck_01_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};
	
	// HEMTT
	case "B_Truck_01_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["textures\vehicle\civ\truck\hemtt_civ_orange.paa","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["textures\vehicle\civ\truck\hemtt_civ_rot.paa","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["textures\vehicle\civ\truck\hemtt_civ_blu.paa","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	// HEMTT
	case "B_Truck_01_ammo_F":
	{
		_ret =
		[
			["textures\vehicle\civ\tank\civ_hemtt_radio.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa","textures\vehicle\civ\tank\civ_hemtt_radio_adds2.paa"],
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Beta\Truck_01\data\truck_01_cover_co.paa"],
			["textures\vehicle\civ\truck\hemtt_civ_orange.paa","civ"],
			["textures\test\gsg9_hemtt.paa","gsg9","textures\test\gsg9_hemtt_adds1.paa","textures\test\gsg9_hemtt_adds2.paa"]
		];
	};
	// HEMTT
	case "B_Truck_01_fuel_F":
	{
		_ret =
		[
			["textures\vehicle\civ\tank\civ_hemtt_tank_gray.paa","civ","textures\vehicle\civ\tank\civ_hemtt_tank_gray_adds2.paa","textures\vehicle\civ\tank\civ_hemtt_tank_gray_adds2.paa"]
		];
	};
	
	case "O_Truck_03_device_F":
	{
		_ret = [
			["\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","reb","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa"]
		];
	};
	
	// Tempestt - Text nicht änderbar
	case "O_Truck_03_ammo_F":
	{
		_ret =
		[
			["\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","civ","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_ammo_co.paa"]
		];
	};
	
	// Tempestt - Text nicht änderbar
	case "O_Truck_03_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","civ","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_cover_co.paa"]
		];
	};
	
	// Tempestt - Text nicht änderbar
	case "O_Truck_03_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","civ","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_cover_co.paa"]
		];
	};
	// Tempestt - Text nicht änderbar
	case "O_Truck_03_fuel_F":
	{
		_ret =
		[
			["\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","civ","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_fuel_co.paa"]
		];
	};
	
	// *** GEPANZERTE AUTOs ****************************************************************************************************************************
	// *******************************************************************************************************************************
	
	// Hunter 01-06-2015 (edit)
	case "B_MRAP_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","reb","\A3\Soft_F\MRAP_01\Data\mrap_01_adds_co.paa","\A3\Soft_F\MRAP_01\Data\mrap_01_int_co.paa"],//TEST standart["textures\vehicle\cop\cop_hunter_0.paa","cop","textures\vehicle\cop\cop_hunter_1.paa"], //0 by noAim - 10.03.2015
			["textures\vehicle\cop\cop_hunter_0.paa","cop","textures\vehicle\cop\cop_hunter_1.paa"], //0 by noAim - 10.03.2015
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","maf","#(argb,8,8,3)color(0.05,0.05,0.05,1)"], //2  by noAim - 10.03.2015
			["textures\vehicle\civ\jeep\civ_hunter_pink.paa","reb","textures\vehicle\civ\jeep\civ_hunter_back.paa"],
			["textures\vehicle\civ\jeep\civ_hunter_red.paa","reb","textures\vehicle\civ\jeep\civ_hunter_back.paa"],
			["textures\vehicle\civ\jeep\civ_hunter_army.paa","reb","textures\vehicle\civ\jeep\civ_hunter_army_adds.paa"],
			["textures\vehicle\civ\jeep\civ_hunter_blu.paa","reb","textures\vehicle\civ\jeep\civ_hunter_back.paa"],
			["textures\vehicle\fw\fw_hunter.paa","med","textures\vehicle\civ\jeep\civ_hunter_back.paa"],
			["textures\vehicle\civ\jeep\civ_hunter_red.paa","clan1","textures\vehicle\civ\jeep\civ_hunter_back.paa"]
		];
	};
	
	// Ifrit
	case "O_MRAP_02_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_02\Data\mrap_02_ext_01_co.paa","reb","\A3\Soft_F\MRAP_02\Data\mrap_02_ext_02_co.paa"],
			["textures\vehicle\civ\jeep\ifrit_camo_1.paa","reb","textures\vehicle\civ\jeep\ifrit_camo_2.paa"],
			["textures\vehicle\civ\jeep\ifrit_blustyle_1.paa","reb","textures\vehicle\civ\jeep\ifrit_blustyle_2.paa"],
			["textures\vehicle\civ\jeep\ifrit_redstyle_1.paa","reb","textures\vehicle\civ\jeep\ifrit_redstyle_2.paa"],
			["textures\vehicle\civ\jeep\ifrit_pinkstyle_1.paa","reb","textures\vehicle\civ\jeep\ifrit_pinkstyle_2.paa"],
			["textures\test\gsg9_ifrit-1.paa","gsg9","textures\test\gsg9_ifrit-2.paa"]
		];
	};
	
	// Strider 01-06-2015 (edit)
	case "I_MRAP_03_F":
	{
		_ret =
		[
			["\a3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa","reb"],
			["textures\test\gsg9_strider.paa","gsg9"],  //2 by noAim - 10.03.2015
			["textures\vehicle\cop\cop_strider_0.paa","cop"],
			["textures\vehicle\civ\jeep\civ_strider_green.paa","reb"],
			["textures\vehicle\civ\jeep\civ_strider_desert.paa","reb"],
			["textures\vehicle\civ\jeep\civ_strider_jungle.paa","reb"],
			["textures\vehicle\civ\jeep\civ_strider_pinky.paa","reb"]
		];
	};
	
	// *** BOOTE ****************************************************************************************************************************
	// *******************************************************************************************************************************

	// Boot
	case "C_Boat_Civil_01_police_F":
	{
		_ret =
		[
			["\a3\boat_f_gamma\Boat_Civil_01\Data\boat_civil_01_ext_police_co.paa","cop"]
		];
	};
	// Boot
	case "C_Boat_Civil_01_rescue_F":
	{
		_ret =
		[
			["\a3\boat_f_gamma\Boat_Civil_01\Data\boat_civil_01_ext_rescue_co.paa","med"]
		];
	};
	
	/*case "B_Boat_Transport_01_F": { _ret = [ ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","med"] ]; }; */
	
	case "C_Rubberboat":
	{
		_ret =
		[
			["\a3\boat_f\Boat_Transport_01\Data\boat_transport_01_co.paa","civ"],
			["\a3\boat_f\Boat_Transport_01\Data\boat_transport_01_rescue_co.paa","civ"],
			["\a3\boat_f\Boat_Transport_01\Data\boat_transport_01_civilian_co.paa","civ"],
			["\a3\boat_f\Boat_Transport_01\Data\boat_transport_01_opfor_co.paa","civ"],
			["\a3\boat_f\Boat_Transport_01\Data\boat_transport_01_indp_co.paa","civ"]
		];
	};
	
	case "C_Boat_Civil_01_F":
	{
		_ret =
		[
			["\a3\boat_f_gamma\Boat_Civil_01\Data\boat_civil_01_ext_co.paa","civ"]
		];
	};
	
	case "B_SDV_01_F":
	{
		_ret =
		[
			["\a3\boat_f_beta\SDV_01\Data\sdv_ext_co.paa","civ"],
			["\a3\boat_f_beta\SDV_01\Data\sdv_ext_indp_co.paa","civ"],
			["\a3\boat_f_beta\SDV_01\Data\sdv_ext_opfor_co.paa","civ"]
		];
	};
	
	case "Submarine_01_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.86,0.08,0.24,1)","cop"]
		];
	};
	
		
	case "O_Boat_Armed_01_hmg_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.86,0.08,0.24,1)","cop"]
		];
	};
	
	case "B_Boat_Armed_01_minigun_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.86,0.08,0.24,1)","cop"]
		];
	};
	
	case "I_Boat_Armed_01_minigun_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.86,0.08,0.24,1)","cop"]
		];
	};
	
	// *** HELICOPTER ****************************************************************************************************************************
	// *******************************************************************************************************************************	
	
	// Hummingbird 01.06.2015 (edit)
	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","reb"], //6
			["textures\vehicle\cop\cop_hummingbird.paa","cop"], //0 by noAim - 10.03.2015
			["textures\vehicle\medic\medic_hummingbird.paa","med"], //2 by noAim - 10.03.2015
			["textures\vehicle\civ\heli\civ_humbird_red.paa","civ"], //civ_humbird_ch7
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","reb"], //7
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"], //8	
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf"],
			["textures\test\civ_humbird_red.paa","gsg9"], // civ_humbird_ch7
			["textures\vehicle\civ\heli\civ_humbird_red.paa","reb"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","clan1"]
			//add 5 more
		];
	};
	
	// Civil Heli - Color/Texture Support
	case "C_Heli_Light_01_civil_F":
	{
		_ret = [
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"] //add 5 more with texture
		];
	};
	
	// Taru
	case "O_Heli_Transport_04_F": //O_Heli_Transport_04_covered_F / O_Heli_Transport_04_medevac_F
	{
		_ret = [
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.2,0,0.2,1)"], //black+pink
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.72,0.53,0.04,1)"], //black+gelb
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //black+rot
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,0.27,0,0.1)"], //black+orange
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"], //black+Weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.09,0.09,0.09,1)"], //black+HGrau
			["textures\vehicle\cop\gsg9\cop_taru-1.paa","gsg9","textures\vehicle\cop\gsg9\cop_taru-2.paa"]
		];
	};
	
	// Taru
	case "O_Heli_Transport_04_covered_F": //O_Heli_Transport_04_covered_F / O_Heli_Transport_04_medevac_F
	{
		_ret = [
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"]
		];
	};
	
	// Taru
	case "O_Heli_Transport_04_bench_F": //NEEDS TEST
	{
		_ret = [
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"]
		];
	};
	
	// Taru
	case "O_Heli_Transport_04_box_F": //NEEDS TEST
	{
		_ret = [
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","reb","#(argb,8,8,3)color(0.5,0,0,1)"] //black+rot
		];
	};
	
	case "O_Heli_Transport_04_fuel_F": //NEEDS TEST
	{
		_ret = [
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","reb","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","reb","#(argb,8,8,3)color(0.5,0,0,1)"] //black+rot
		];
	};
	
	// Orca - Texture/Color:Black
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","reb"],
			["textures\vehicle\medic\medic_orca.paa","med"], // noAim - 10.03.2015
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","reb"],
			["textures\test\civ_orca.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf"],
			["textures\vehicle\cop\cop_orca.paa","cop"]
		];
	};

	// Hellcat - Texture/Schwarz
	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa","reb"],
			["textures\vehicle\cop\cop_wildcat_0.paa","cop"] //0 by noAim Rigo - 19.06.2015
		];
	};
	// Mohawk - Texture/Color:Black or Color:TAN,TANDARK,TANLIGHT check
	case "I_Heli_Transport_02_F":
	{
		_ret =
		[
			["\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_indp_co.paa","reb","\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_indp_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_indp_co.paa"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","reb","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","reb","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"],
			["#(ai,64,64,1)Fresnel(0.3,3)","maf","#(ai,64,64,1)Fresnel(0.3,3)","#(ai,64,64,1)Fresnel(0.3,3)"],
			["textures\vehicle\medic\medic_mohawk_0.paa","med","textures\vehicle\medic\medic_mohawk_1.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["textures\vehicle\civ\heli\civ_mohawk_green.paa","civ","textures\vehicle\civ\heli\civ_mohawk_green_adds.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],			//1  by noAim - 09.07.2015
			["textures\vehicle\cop\gsg9\Mohawk_BPolizei.paa","gsg9","textures\vehicle\cop\gsg9\Mohawk_BPolizei_1.paa","textures\vehicle\cop\gsg9\Mohawk_BPolizei_2.paa"]
		];
	};
	
	// Ghosthawk mit 2x MG ohne Munition
	case "B_Heli_Transport_01_F":
	{
		_ret =
		[
			["\a3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext01_CO.paa","maf","\a3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext02_co.paa"],
			["textures\test\gsg9_ghosthawk.paa","gsg9","textures\test\gsg9_ghosthawk_adds.paa"] // 06.09.2015 zEro.
		];
	};
	
	// Huron - Texture/Color:Black or Color:Black&GELB
	case "B_Heli_Transport_03_unarmed_F":
	{
		_ret = [
			["\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_co.paa","reb","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.2,0,0.2,1)"], //black+pink
			["\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa","civ","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.72,0.53,0.04,1)"], //black+gelb
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(1,1,1,1)"], //black+weiss
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"], //black+rot
			["textures\test\gsg9_huron-1.paa","gsg9","textures\test\gsg9_huron-2.paa"]
		];
	};
	
	/*
	// CARGO
	// Huron
	case "B_Slingload_01_Cargo_F":
	{
		_ret =
		[
			["\a3\supplies_f_heli\Slingload\Data\slingload_01_part1_co.paa","civ","\a3\supplies_f_heli\Slingload\Data\slingload_01_part2_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"]
		];
	};
	// Huron
	case "B_Slingload_01_Fuel_F":
	{
		_ret =
		[
			["\a3\supplies_f_heli\Slingload\Data\slingload_01_part1_co.paa","civ","\a3\supplies_f_heli\Slingload\Data\slingload_01_part2_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.5,0,0,1)"]
		];
	};

	// Taru
	case "Land_Pod_Heli_Transport_04_box_F":
	{
		_ret =
		[
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa","civ","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa","civ","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.72,0.53,0.04,1)"]
		];
	};
	// Taru
	case "Land_Pod_Heli_Transport_04_fuel_F":
	{
		_ret =
		[
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_fuel_co.paa","civ"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_fuel_black_co.paa","civ"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.72,0.53,0.04,1)"]
		];
	};
	// Taru
	case "Land_Pod_Heli_Transport_04_covered_F":
	{
		_ret =
		[
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa","civ","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"],
			["\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa","civ","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0,0.2,0.34,1)"]
		];
	};
	
	case "Box_IND_AmmoVeh_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(0,0.2,0.34,1)","civ"]
		];
	};
	
	*/
	
	// *** PLANES ****************************************************************************************************************************
	// *******************************************************************************************************************************	
	
	case "I_Plane_Fighter_03_AA_F":
	{
		_ret = [
			["A3\Air_F_Gamma\Plane_Fighter_03\Data\plane_fighter_03_body_1_indp_co.paa","civ","A3\Air_F_Gamma\Plane_Fighter_03\Data\plane_fighter_03_body_2_indp_co.paa"],
			["#(argb,8,8,3)color(0.72,0.53,0.04,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	case "B_Plane_CAS_01_F":
	{
		_ret = [
			["A3\Air_F_EPC\Plane_CAS_01\Data\plane_cas_01_ext01_co.paa","civ","A3\Air_F_EPC\Plane_CAS_01\Data\plane_cas_01_ext02_co.paa"],
			["#(argb,8,8,3)color(0,0.2,0.34,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	case "O_Plane_CAS_02_F":
	{
		_ret = [
			["A3\Air_F_EPC\Plane_CAS_02\Data\fighter02_ext01_co.paa","civ","A3\Air_F_EPC\Plane_CAS_02\Data\fighter02_ext02_co.paa"],
			["#(argb,8,8,3)color(0.5,0,0,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};
}; 
_ret;