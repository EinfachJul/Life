#include "..\macros.hpp"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_siren3_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_pickAxeAllowed = true;
life_HandcovesAllowed = true;
life_ShovelAllowed = true;
life_SaegeAllowed = true;
life_SiebAllowed = true;
life_spikestrip = ObjNull;
life_mauer = ObjNull;
life_roadcone = ObjNull;
life_barrierlight = ObjNull;
life_schranke = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_placing = objNull;
life_cursorTarget = objNull;
life_sit = false;
life_sitting = false;
//life_firstSpawn = false;
life_action_gather = false;
life_tracked = [];
life_fatigue = 0.5; //Set the max fatigue limit (50%)
life_request_timer = false;
life_schutz = false;
life_ncmusica = false;
life_channel_send = false;
life_TankLaster = 1;
nn_last_vehicles = [];
nn_empInUse = false;
life_nottoofast = time;
kav_eventzone = false;
life_lockToggleAllowed = true;
life_calledTaxi = false;
life_isOnDutyTaxi = false;
life_inTaxi = false;
life_casino_slotmachine = [];
life_requested_backup = false;
life_requested_fw = false;
life_spam = 0;
allowEarplug = true;
airnoise = false;
life_enslaved = false;
//life_racetimer = 0;
life_kw_kavala = false;
life_kw_kavalaon = false;
life_dkonsum = 0;
life_GSG9aktiv = false;
life_target_towRope = objNull;
//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,true); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,25000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,10); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,250000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,150000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

__CONST__(life_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

// Settings Menu
life_settings_enableSidechannel = profileNamespace getVariable["life_enableSidechannel",true];
life_settings_SidechannelChangeAllowed = true;
life_settings_viewDistanceFoot = profileNamespace getVariable["life_viewDistanceFoot",viewDistance];
life_settings_viewDistanceCar = profileNamespace getVariable["life_viewDistanceCar",viewDistance];
life_settings_viewDistanceAir = profileNamespace getVariable["life_viewDistanceAir",viewDistance];


// Vehicle 3D Showcase
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];

/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 40; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 40; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_use_atm_2 = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,10); //Five minutes
//life_znorak = 0;
//[1, 0] call noaim_fnc_tempcheck;
__CONST__(life_impound_car,15500);
__CONST__(life_impound_boat,22000);
__CONST__(life_impound_air,35500);
life_istazed = false;
life_my_gang = ObjNull;
life_god = false; //Add this
life_frozen = false; //And this
life_markers = false; //Finally this
life_drugged_cocaine = -1;
life_drugged_cocaine_duration = 5; 
life_drugged_weed = -1;
life_drugged_weed_duration = 3;
life_smartphoneTarget = ObjNull;

life_fuelstations = ["tankstelle_1","tankstelle_2","tankstelle_3","tankstelle_4","tankstelle_5","tankstelle_6","tankstelle_7","tankstelle_8","tankstelle_9","tankstelle_10","tankstelle_11","tankstelle_12","tankstelle_13","tankstelle_14","tankstelle_15","tankstelle_17"];
life_fuelstations_air = ["tankstelle_16"];
life_fuelstations_ship = ["tankstelle_16"];

zaki_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_zgazzy = 35000; //Starting Bank Money
		//[0, 67000] call noaim_fnc_tempcheck;
		life_paycheck = 20000; //Paycheck Amount 2500000
	};
	case civilian:
	{
		life_zgazzy = 150000; //Starting Bank Money
		//[0, 67000] call noaim_fnc_tempcheck;
		life_paycheck = 5500; //Paycheck Amount
	};

	case east:
	{
		life_zgazzy = 35000; //Starting Bank Money
		//[0, 67000] call noaim_fnc_tempcheck;
		life_paycheck = 25000;
	};
	case independent:
	{
		life_zgazzy = 35000; //Starting Bank Money
		//[0, 67000] call noaim_fnc_tempcheck;
		life_paycheck = 10000; //Paycheck Amount
	};
};

/* RACING SCRIPT
racing_rounds = 0;
race_started = false;
race_competitors = [];
round_starttime = 0;
*/

life_vShop_rentalOnly = ["B_MRAP_01_hmg_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

zoki_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_orange",
	"life_inv_lsd",
	"life_inv_ectazy",
	"life_inv_haschisch",
	"life_inv_vodkau",
	"life_inv_diske",
	"life_inv_hotdog",
	"life_inv_fries",
	"life_inv_burger1",
	"life_inv_burger2",
	"life_inv_burger3",
	"life_inv_burger4",
	"life_inv_burger5",
	"life_inv_burger6",
	"life_inv_pizza1",
	"life_inv_pizza2",
	"life_inv_pizza3",
	"life_inv_pizza4",
	"life_inv_sandwich",
	"life_inv_snack1",
	"life_inv_snack2",
	"life_inv_lasagne",
	"life_inv_spaghetti",
	"life_inv_doener",
	"life_inv_gyros",
	"life_inv_apfeltasche",
	"life_inv_icecream1",
	"life_inv_orangejuice",
	"life_inv_applejuice",
	"life_inv_eggs",
	"life_inv_goatmilk",
	"life_inv_wool",
	"life_inv_cotton",
	"life_inv_slavecotton",
	"life_inv_leather",
	"life_inv_hartz",
	"life_inv_areifen",
	"life_inv_amotor",
	"life_inv_arotor",
	"life_inv_atape",
	"life_inv_glue",
	"life_inv_woodenboard",
	"life_inv_lead",
	"life_inv_leadraw",
	"life_inv_aluminium",
	"life_inv_aluminiumraw",
	"life_inv_seil",
	"life_inv_edelmetall",
	"life_inv_edelholz",
	"life_inv_stoff",
	"life_inv_farbe",
	"life_inv_messing",
	"life_inv_schwarzpulver",
	"life_inv_stahl",
	"life_inv_painkiller",
	"life_inv_specialfett",
	"life_inv_netzz",
	"life_inv_gas",
	"life_inv_rubber",
	"life_inv_plastic",
	"life_inv_plasticpackaging",
	"life_inv_fabric",
	"life_inv_screws",
	"life_inv_batterie",
	"life_inv_altiscola",
	"life_inv_altisorange",
	"life_inv_altisbeer",
	"life_inv_gasbottle",
	"life_inv_laptop",
	"life_inv_pccpu",
	"life_inv_pcmainboard",
	"life_inv_laptopcase",
	"life_inv_knife",
	"life_inv_weizenbrot",
	"life_inv_currywurst",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_handcoves",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_glass",
	"life_inv_corals",
	"life_inv_painkillers",
	"life_inv_morphium",
	"life_inv_lockpick",
	"life_inv_handcuffkey",
	"life_inv_redgull",
	"life_inv_diamond",
	"life_inv_cocaine",
	"life_inv_cocainep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_crowbar",
	"life_inv_wrench",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_boxzlarge",
	"life_inv_boxzsmall",
	"life_inv_boxzmedium",
	"life_inv_zipties",
	"life_inv_kidney",
	"life_inv_scalpel",
	"life_inv_tracker",
	"life_inv_getreideu",
	"life_inv_holzu",
	"life_inv_hopfenu",
	"life_inv_schwefelu",
	"life_inv_silberu",
	"life_inv_tabaku",
	"life_inv_traubenu",
	"life_inv_zinnu",
	"life_inv_zinku",
	"life_inv_zinkp",
	"life_inv_abulb",
	"life_inv_zuckeru",
	"life_inv_getreideip",
	"life_inv_tabakip",
	"life_inv_zuckerip",
	"life_inv_eisenp",
	"life_inv_getreidep",
	"life_inv_holzp",
	"life_inv_hopfenp",
	"life_inv_schwefelp",
	"life_inv_silberp",
	"life_inv_tabakp",
	"life_inv_traubenp",
	"life_inv_zinnp",
	"life_inv_zuckerp",
	"life_inv_bronze",
	"life_inv_schmuck",
	"life_inv_henraw",
	"life_inv_turtlepanzer",
	"life_inv_feather",
	"life_inv_goatfur",
	"life_inv_sheepwool",
    "life_inv_roosterraw",
    "life_inv_sheepraw",
    "life_inv_goatraw",
	"life_inv_rabbitraw",
	"life_inv_henrawsteak",
    "life_inv_roosterrawsteak",
    "life_inv_sheeprawsteak",
    "life_inv_goatrawsteak",
	"life_inv_rabbitrawsteak",
	"life_inv_schranke",
	"life_inv_barrierlight",
	"life_inv_strahler",
	"life_inv_bunker",
	"life_inv_mauer",
	"life_inv_roadcone",
	"life_inv_table",
	"life_inv_stuhl",
	"life_inv_lampe",
	"life_inv_bett",
	"life_inv_schwefelacid",
	"life_inv_karton",
	"life_inv_coolbox",
	"life_inv_techarchiv",
	"life_inv_chemie2",
	"life_inv_uwsl",
	"life_inv_nitro",
	"life_inv_sieb",
	"life_inv_shovel",
	"life_inv_saege",
	"life_inv_countrypotatoes",
	"life_inv_saladpot",
	"life_inv_altismeal"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach zoki_inv_items;
//Licenses [license var, civ/cop]

// inventory, class, name, rotation, distance, damageable
life_placeable =
[
	["strahler","Land_PortableLight_double_F","Strahler",0,4, false],
	["bunker","Land_BagBunker_Small_F","Bunker",0,4, false]
	//Klappturm Land_Cargo_Patrol_V3_F
	//klappschranke RoadBarrier_small_F
	//Halojump plattform Land_JumpTarget_F
	//absperrung   	TapeSign_F
	//Target/Zielscheibe Target_PopUp_Moving_Acc2_F
	//Target/Zielscheibe TargetP_Inf_Acc2_F
	//Target/Zielscheibe TargetP_Inf_Acc2_NoPop_F
	//Target/Zielscheibe Target_PopUp_Moving_Acc2_NoPop_F
	//Plastikabsprerrung plasticbarrier_03_orange_f
	//Plastikblock Grau PlasticBarrier_02_grey_F
	//Plastikblock Gelb PlasticBarrier_02_yellow_F
];

life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_gsg9","cop"],
	["license_cop_gsg9tl","cop"],
	["license_fwehr_air","med"],
	["license_civ_donator","civ"],
	["license_civ_home","civ"],
	["license_civ_rebel","civ"],
	["license_civ_mafia","civ"],
	["license_civ_gun","civ"],
	["license_civ_driver","civ"],
	["license_civ_truck","civ"],
	["license_civ_air","civ"],
	["license_civ_boat","civ"],
	["license_civ_dive","civ"],
	["license_civ_heroin","civ"],
	["license_civ_cocaine","civ"],
	["license_civ_marijuana","civ"],	
	["license_civ_oil","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_nudeln","civ"],
	["license_civ_wein","civ"],
	["license_civ_zigarren","civ"],
	["license_civ_holz","civ"],
	["license_civ_schwefel","civ"],
	["license_civ_schmuck","civ"],
	["license_fwehr_car","med"],
	["license_civ_kidney", "civ"],
	["license_civ_haschisch","civ"],
	["license_civ_plastic","civ"],
	["license_civ_woll","civ"],
	["license_civ_fabric","civ"],
	["license_civ_aluminium","civ"],
	["license_civ_jadgschein","civ"],
	["license_civ_fishing","civ"],
	["license_civ_anwalt","civ"],
	["license_civ_richter","civ"],
	["license_civ_gokart","civ"],
	["license_civ_taxi","civ"],
	["license_civ_logistika","civ"],
	["license_civ_wooden","civ"],
	["license_civ_weizenbrot","civ"],
	["license_civ_laptop","civ"],
	["license_civ_laptopcase","civ"],
	["license_civ_clubdj","civ"],
	["license_civ_gas","civ"],
	["license_civ_clanbase","civ"],
	["license_civ_clan1","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
// inventory, class, name, rotation, distance, damageable
	//Klappturm Land_Cargo_Patrol_V3_F
	//klappschranke RoadBarrier_small_F
	//Halojump plattform Land_JumpTarget_F
	//absperrung   	TapeSign_F
	//Target/Zielscheibe Target_PopUp_Moving_Acc2_F
	//Target/Zielscheibe TargetP_Inf_Acc2_F
	//Target/Zielscheibe TargetP_Inf_Acc2_NoPop_F
	//Target/Zielscheibe Target_PopUp_Moving_Acc2_NoPop_F
	//Plastikabsprerrung plasticbarrier_03_orange_f
	//Plastikblock Grau PlasticBarrier_02_grey_F
	//Plastikblock Gelb PlasticBarrier_02_yellow_F

life_illegal_items = [["heroinu",4000],["heroinp",5000],["cocaine",4000],["corals",4000],["cocainep",5000],["cannabis",3000],["marijuana",3500],["turtle",11000],["tabakip",4500],["blastingcharge",100000],["boltcutter",100000],["haschisch",5000],["goldbar",150000],["kidney",25000]];
//ARYX ILLEGAL

life_prof =
[
	["Copper_Prof","civ"],
	["Iron_Prof","civ"],
	["Sand_Prof","civ"],
	["Diamond_Prof","civ"],
	["Oil_Prof","civ"],
	["Gas_Prof","civ"],
	["Aluminum_Prof","civ"],
	["Schwefel_Prof","civ"],
	["Kunststoff_Prof","civ"],
	["Stoff_Prof","civ"],
	["Heroin_Prof","civ"],
	["Cocain_Prof","civ"],
	["Canabis_Prof","civ"],
	["Tabak_Prof","civ"],
	["Alkohol_Prof","civ"],
	["Fruit_Prof","civ"],
	["Food_Prof","civ"],
	["Laptop_Prof","civ"],
	["Wood_Prof","civ"],
	["Turtle_Prof","civ"],
	["TurtleSoup_Prof","civ"],
	["Corals_Prof","civ"],
	["Fish_Prof","civ"],
	["Jagd_Prof","civ"],
	["Schmuck_Prof","civ"],	
	["Dieb_Prof","civ"],
	["Gang_Prof","civ"],
	 //["Repair_Civ_Prof","civ"], //
	 //["Bank_Civ_Prof","civ"], //
	//POLIZEI
	["Ticket_Prof","cop"],
	["Arrest_Prof","cop"],
	["Impound_Prof","cop"],
	["ImpoundPerm_Prof","cop"],
	["ImpoundCrash_Prof","cop"],
	["ImpoundFW_Prof","med"],
	 //["Impound_Perm_Prof","cop"], //
	["Hero_Prof","cop"],
	//SANITÄTER
	["Revive_Prof","med"],
	 //["Therapie_Prof","med"], //
	 //["Heal_Prof","med"], //
	["Repair_Prof","med"],
	["RepairCop_Prof","cop"],
	["RepairCiv_Prof","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),[0,0]];} foreach life_prof;

/*
	Resources list
	
	to remove the ability to gather a specific resource just comment it out on the list (all zones will be deactivated)
*/
resource_list = [
	"apple",
	"eggs",
	//"goatmilk", NOCH NICHT EINGEBAUT ARYX
	"cotton",
	"slavecotton",
	"corals",
	"aluminiumraw",
	"gas",
	"heroinu", 
	"cocaine", 
	"cannabis", 
	"traubenu",  
	"getreideu", 
	"tabaku", 
	"copperore",
	"ironore",
	"sand",
    "diamond",
    "oilu",
	"holzu",
	"schwefelu"
];

/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["eggs",120],
	["wool",2000],
	["cotton",60],
	["woodenboard",4000],
	["lead",3000],
	["aluminium",3500],
	["stoff",2440],
	["stahl",4350],
	["gas",5000],
	["plastic",5500],
	["fabric",4500],
	["gasbottle",14000],
	["laptop",100000],
	["knife",10000],
	["weizenbrot",3000],
	["snack1",100000],
	["salema",1245], //
	["ornate",1311], //
	["mackerel",1475], //
	["tuna",6400], //
	["mullet",2175], //
	["catshark",2150], //
	["turtle",11000],
	["turtlesoup",9000], //
	["lockpick",1000],
	["pickaxe",1250],
	["handcoves",4750],
	["spikeStrip",1200],
	["goldbar",150000],
	["cocainep",5000],
	["heroinp",5000],
	["marijuana",3500],
	["iron_r",2000],
	["copper_r",1500],
	["glass",3000],
	["oilp",4000],
	["diamond",1500],
	["diamondc",3500],
	["getreidep",2000],
	["holzp",2500],
	["schwefelp",2000],
	["silberp",50000],
	["tabakp",1000],
	["traubenp",3000],
	["bronze",25000],
	["getreideip",2000],
	["tabakip",4500],
	["kidney",25000],
	["scalpel",3000],
	["henraw",3000],
    ["roosterraw",4000],
    ["sheepraw",4000],
    ["goatraw",4000],
    ["rabbitraw",40],
	["henrawsteak",7000],
    ["roosterrawsteak",8000],
    ["sheeprawsteak",12000],
    ["goatrawsteak",12000],
    ["rabbitrawsteak",500],
   // ["lsd",6000],
	["haschisch",5000],
    ["vodkau",3000],
	["aluminiumraw",3000],
	["corals",4000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["vodkau",5000],
	["altiscola",195],
	["altisorange",195],
	["altisbeer",660],
	["knife",12000],
	["hotdog",150],
	["fries",80],
	["burger1",180],
	["burger2",190],
	["burger3",180],
	["burger4",200],
	["atape",320],
	["tabakp",5000],
	["burger5",220],
	["burger6",250],
	["pizza1",280],
	["pizza2",290],
	["pizza3",300],
	["pizza4",310],
	["sandwich",120],
	["snack2",500],
	["lasagne",220],
	["spaghetti",520],
	["doener",160],
	["gyros",260],
	["apfeltasche",100],
	["icecream1",150],
	["currywurst",175],
	["water",50],
	["donuts",120],
	["coffee",60],
	["lockpick",25000],
	["handcuffkey",5000],
	["pickaxe",1500],
	["redgull",2500],
	["fuelF",950],
	["spikeStrip",15000],
	["blastingcharge",125000],
	["boltcutter",125000],
	["crowbar",25000],
	["wrench",25000],
	["defusekit",2500],
	["zipties",35500],
	["storagesmall",1000000],
	["storagebig",2000000],
	["boxzlarge",3500000],
	["boxzmedium",2000000],
	["boxzsmall",1000000],
	["tracker",10000],
	["kidney",50000],
	["coolbox",26500],
	["scalpel",50000],
	["hopfenp",2500],
	["traubenp",3500],
	["zuckerip",5000],
	["getreideip",5000],
	["schranke",5000],
	["barrierlight",5000],
	["strahler",5000],
	["bunker",5000],
	["mauer",5000],
	["roadcone",5000],
	["table",20000],
	["stuhl",15000],
	["lampe",5000],
	["bett",30000],
	["techarchiv",25000],
	["uwsl",80000],
	["sieb",12200],
	["shovel",3200],
	["handcoves",5200],
	["saege",2200],
	["painkillers",1400],
	["morphium",1500]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["hgun_P07_snds_F",0], //
	["hgun_P07_F",2000], //mafia,civil,
	["hgun_Pistol_heavy_02_F",3000], //mafia,rebel,civil,
	["hgun_ACPC2_F",3000], //mafia,rebel,civil,
	["hgun_PDW2000_F",8500], //mafia,civil,
	["16Rnd_9x21_Mag",0], //mafia,civil,
	["9Rnd_45ACP_Mag",0], //mafia,rebel,civil,
	["6Rnd_45ACP_Cylinder",0], //mafia,rebel,civil,
	["30Rnd_9x21_Mag",0], //mafia,civil,
	["20Rnd_556x45_UW_mag",200], //mafia,
	["11Rnd_45ACP_Mag",500], //mafia,
	["30Rnd_45ACP_Mag_SMG_01",500], //mafia,
	["30Rnd_45ACP_Mag_SMG_01_tracer_green",1000], //mafia,
	["7Rnd_408_Mag",5000], //mafia,rebel
	["30Rnd_556x45_Stanag",500], //mafia,
	["30Rnd_556x45_Stanag_Tracer_Green",500], //mafia,
	["30Rnd_556x45_Stanag_Tracer_Red",500], //mafia,civil,
	["30Rnd_556x45_Stanag_Tracer_Yellow",500], //mafia,
	["30Rnd_65x39_caseless_green",1500], //mafia,
	["30Rnd_65x39_caseless_green_mag_Tracer",1500], //mafia,
	["20Rnd_762x51_Mag",2000], //mafia,civil,
	["30Rnd_65x39_caseless_mag",1500], //mafia,
	["30Rnd_65x39_caseless_mag_Tracer",1500], //mafia,
	["100Rnd_65x39_caseless_mag",2500], //mafia,
	["100Rnd_65x39_caseless_mag_Tracer",2500], //mafia,
	["10Rnd_93x64_DMR_05_Mag",1500], //rebel,
	["10Rnd_762x54_Mag",1500], //rebel,
	["200Rnd_65x39_cased_Box_Tracer",5000], //rebel,
	["150Rnd_762x54_Box",3500], //rebel,
	["150Rnd_762x54_Box_Tracer",4000], //rebel,
	["130Rnd_338_Mag",2000], //rebel,	
	["V_Rangemaster_belt",1500], //mafia,civil,
	["optic_ACO_grn_smg",500], //mafia,
	["optic_Holosight_smg",3000], //civil,
	["optic_ACO_grn",2000], //civil,
	["optic_Aco",2000], //civil,
	["optic_Holosight",2000], //civil,
	["optic_MRCO",5000], //civil,
	["optic_SOS",20000], //civil,
	["optic_NVS",10000], //civil,
	["optic_DMS",15000], //civil,
	["optic_Arco",10000], //civil,
	["optic_Hamr",2000], //civil,
	["optic_AMS_khk",30000], //civil,
	["optic_AMS_snd",30000], //civil,
	["optic_KHS_hex",30000], //civil,
	["optic_KHS_old",30000], //civil,
	["optic_LRPS",20000], //civil,
	["optic_AMS",20000], //civil,
	["optic_KHS_blk",20000], //civil,
	["bipod_01_F_blk",2500], //civil,
	["bipod_02_F_hex",12500], //civil,
	["bipod_03_F_oli",12500], //civil,
	["acc_flashlight",2500], //civil,
	["acc_pointer_IR",2500], //civil,
	["muzzle_snds_H",4500], //civil,
	["muzzle_snds_H_MG",4500], //civil,
	["muzzle_snds_M",4500], //civil,
	["muzzle_snds_B",500], //civil,
	["muzzle_snds_acp",2500], //civil,
	["muzzle_snds_93mmg",5000], //civil,
	["3Rnd_UGL_FlareGreen_F",4500], //civil,
	["3Rnd_UGL_FlareRed_F",45000], //civil,
	["3Rnd_SmokeRed_Grenade_shell",7500], //civil,
	["3Rnd_SmokeGreen_Grenade_shell",7500], //civil,
	["ItemGPS",500], //mafia,
	["ItemRadio",0], //mafia,
	["Medikit",0], //mafia,
	["NVGoggles_OPFOR",0], //mafia,
	["NVGoggles_INDEP",0], //mafia,civil,
	["Rangefinder",0], //mafia,civil,
	["ItemMap",0], //civil,
	["ItemCompass",0], //civil,
	["ItemWatch",0], //civil,
	["ToolKit",0], //civil,
	["NVGoggles",0], //civil,
	["Binocular",0], //civil,
	["FirstAidKit",0], //civil,
	["Chemlight_red",500], //civil,
	["Chemlight_yellow",500], //civil,
	["Chemlight_green",500], //civil,
	["Chemlight_blue",500], //civil,
	["B_Parachute",0], //civil,
	["hgun_Pistol_Signal_F",25000], //civil,
	["6Rnd_GreenSignal_F",2500], //civil,
	["6Rnd_RedSignal_F",2500], //civil,
	["arifle_SDAR_F",20000], //mafia,
	["SMG_01_F",500], //mafia,
	["arifle_Mk20C_F",75000], //mafia,
	["arifle_Katiba_F",20000], //mafia,
	["arifle_Katiba_C_F",40000], //mafia,
	["arifle_Katiba_GL_F",35000], //mafia,
	["srifle_DMR_03_F",40000], //mafia,
	["arifle_Mk20_plain_F",25000], //mafia,
	["arifle_MXC_Black_F",45000], //mafia,
	["arifle_MX_Black_F",15000], //mafia,
	["arifle_MX_SW_Black_F",60000], //mafia,
	["arifle_MXM_Black_F",45000], //mafia,
	["srifle_LRR_camo_F",150000], //rebel,
	["srifle_DMR_05_blk_F",140000], //rebel,
	["srifle_DMR_05_tan_f",400000], //rebel,
	["srifle_DMR_01_F",150000], //rebel,
	["arifle_MXM_F",155000], //rebel,
	["arifle_MX_SW_F",250000], //rebel,
	["LMG_Mk200_F",30000], //rebel,
	["arifle_MXC_F",100000], //rebel,
	["arifle_MX_F",100000], //rebel,
	["arifle_MX_GL_F",100000], //rebel,
	["srifle_EBR_F",100000], //rebel,
	["LMG_Zafir_F",30000], //rebel,
	["MMG_02_sand_F",1500000], //rebel,
	["arifle_Mk20_F",100000], //civil,
	["srifle_DMR_06_olive_F",400000], //civil,
	["hgun_Rook40_F",3000], //civil,
	["srifle_DMR_03_tan_F",200000] //civil,
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",500],
	["C_Hatchback_01_F",1000],
	["C_Offroad_01_F",2500],
	["C_Offroad_01_repair_F",2500],
	["B_G_Offroad_01_F",2500],
	["B_G_Offroad_01_armed_F",4000],
	["I_G_Offroad_01_armed_F",4000],
	["C_SUV_01_F",3500],
	["C_Van_01_transport_F",3000],
	["I_G_Van_01_transport_F",5000],
	["C_Hatchback_01_sport_F",10000],
	["I_Heli_Transport_02_F",15750],
	["C_Van_01_box_F",6000],
	["C_Van_01_fuel_F",5000],
	["I_Truck_02_transport_F",5000],
	["O_Truck_02_Transport_F",5000],
	["I_Truck_02_covered_F",5000],
	["O_Truck_02_covered_F",5000],
	["O_Truck_02_box_F",5000],
	["O_Truck_02_fuel_F",5000], //nicht eingebunden
	["I_Truck_02_fuel_F",5000],
	["B_Truck_01_transport_F",15000],
	["B_Truck_01_box_F",25000],
	["O_MRAP_02_F",50000],
	["B_Heli_Light_01_F",10000],
	["O_Heli_Light_02_unarmed_F",15000],
	["I_Heli_light_03_unarmed_F",14000],
	["C_Rubberboat",1000],
	["C_Boat_Civil_01_F",8500],
	["B_Boat_Transport_01_F",7500],
	["C_Boat_Civil_01_police_F",8500],
	["C_Boat_Civil_01_rescue_F",8500],
	["B_SDV_01_F",5000],
	["I_Plane_Fighter_03_AA_F",100000],
	["B_Plane_CAS_01_F",100000],
	["O_Plane_CAS_02_F",100000],
	["B_MRAP_01_F",15000],
	["B_MRAP_01_hmg_F",65000], //nicht eingebunden
	["I_MRAP_03_F",60000],
	["O_Truck_03_ammo_F",20000],
	["B_Truck_01_ammo_F",35000],
	["B_Truck_01_covered_F",25000],
	["B_Truck_01_fuel_F",20000],
	["O_Truck_03_transport_F",20000],
	["O_Truck_03_fuel_F",35000],
	["O_Truck_03_device_F",100000],
	["O_Truck_03_covered_F",15000],
	["C_Kart_01_Blu_F",2500],
	["C_Kart_01_Fuel_F",2500],
	["C_Kart_01_Red_F",2500],
	["C_Kart_01_Vrana_F",2500],
	["B_Heli_Transport_01_F",20000],
	["B_Heli_Transport_03_unarmed_F",20000],
	["O_Heli_Transport_04_box_F",55000],
	["O_Heli_Transport_04_fuel_F",40000],
	["O_Heli_Transport_04_covered_F",40000],
	["O_Heli_Transport_04_medevac_F",40000],
	["I_Truck_02_box_F",20000],
	["B_Truck_01_mover_F",15000],
	["C_Heli_Light_01_civil_F",10000],
	["O_Heli_Transport_04_F",20000],
	["B_Slingload_01_Cargo_F",60000],
	["B_Slingload_01_Fuel_F",60000],
	["Land_Pod_Heli_Transport_04_fuel_F",60000],
	["Land_Pod_Heli_Transport_04_covered_F",60000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_QuadBike_01_F",3000],
	["C_Hatchback_01_F",10000],
	["C_Offroad_01_F",23000],
	["C_Offroad_01_repair_F",5000],
	["B_G_Offroad_01_F",22000],
	["B_G_Offroad_01_armed_F",5000],
	["I_G_Offroad_01_armed_F",5000],
	["C_SUV_01_F",28000],
	["C_Van_01_transport_F",44000],
	["C_Hatchback_01_sport_F",240000],
	["I_Heli_Transport_02_F",480000],
	["C_Van_01_box_F",60000],
	["C_Van_01_fuel_F",70000],
	["I_Truck_02_transport_F",200000],
	["I_Truck_02_covered_F",250000],
	["O_Truck_02_fuel_F",5000], //nicht eingebunden
	["B_Truck_01_transport_F",500000],
	["B_Truck_01_box_F",1600000],
	["O_MRAP_02_F",1800000],
	["B_Heli_Light_01_F",150000],
	["O_Heli_Light_02_unarmed_F",250000],
	["I_Heli_light_03_unarmed_F",240000],
	["C_Rubberboat",7000],
	["C_Boat_Civil_01_F",15000],
	["B_Boat_Transport_01_F",2400],
	["C_Boat_Civil_01_police_F",15000],
	["C_Boat_Civil_01_rescue_F",35000],
	["B_SDV_01_F",700000],
	["I_Plane_Fighter_03_AA_F",5000000],
	["B_Plane_CAS_01_F",8000000],
	["O_Plane_CAS_02_F",12000000],
	["B_MRAP_01_F",340000],
	["B_MRAP_01_hmg_F",5000], //nicht eingebunden
	["I_MRAP_03_F",590000],
	["O_Truck_03_ammo_F",400000],
	["B_Truck_01_covered_F",1000000],
	["B_Truck_01_fuel_F",1000000],
	["O_Truck_03_transport_F",500000],
	["O_Truck_03_fuel_F",200000],
	["O_Truck_03_device_F",5000000],
	["O_Truck_03_covered_F",400000],
	["C_Kart_01_Blu_F",8000],
	["C_Kart_01_Fuel_F",8000],
	["C_Kart_01_Red_F",8000],
	["C_Kart_01_Vrana_F",8000],
	["B_Heli_Transport_01_F",500000],
	["B_Heli_Transport_03_unarmed_F",15000000],
	["O_Heli_Transport_04_box_F",15000000],
	["O_Heli_Transport_04_covered_F",3700000],
	["O_Heli_Transport_04_medevac_F",300000],
	["I_Truck_02_box_F",240000],
	["B_Truck_01_mover_F",100000],
	["C_Heli_Light_01_civil_F",400000],
	["O_Heli_Transport_04_F",2500000],
	["B_Slingload_01_Cargo_F",5000000],
	["B_Slingload_01_Fuel_F",5000],
	["Land_Pod_Heli_Transport_04_fuel_F",0],
	["Land_Pod_Heli_Transport_04_covered_F",2500000]
];
__CONST__(life_garage_sell,life_garage_sell);

[] execVM "IgiLoad\IgiLoadInit.sqf";