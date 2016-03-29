/*
Author: Bryan "Tonic" Boardwine
Takes the long-name (variable) and returns a display name for our
virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
//Virtual Inventory Items
	case "life_inv_AntiFuel": {(localize "STR_Item_Scanner")}; 
	case "life_inv_Handschuhe": {(localize "STR_Item_Handschuh")}; 
	case "life_inv_Skalpel": {(localize "STR_Item_Skalpel")};
	case "life_inv_kidney": {(localize "STR_Item_Niere")};
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_orange": {(localize "STR_Item_Orange")};
	case "life_inv_orangejuice": {(localize "STR_Item_Orangejuice")};
	case "life_inv_applejuice": {(localize "STR_Item_Applejuice")};
	case "life_inv_karton": {(localize "STR_Item_Karton")};
	case "life_inv_schwefelacid": {(localize "STR_Item_Schwefelacid")};
	case "life_inv_techarchiv": {(localize "STR_Item_Techarchiv")};
	case "life_inv_weizen": {(localize "STR_Item_Weizen")};
	case "life_inv_abulb": {(localize "STR_Item_Abulb")};
	case "life_inv_alamp": {(localize "STR_Item_Alamp")};
	case "life_inv_acupboard": {(localize "STR_Item_Acupboard")};
	case "life_inv_achair": {(localize "STR_Item_Achair")};
	case "life_inv_atable": {(localize "STR_Item_Atable")};
	case "life_inv_chemie1": {(localize "STR_Item_Chemie1")};
	case "life_inv_chemie2": {(localize "STR_Item_Chemie2")};
	case "life_inv_aluminiumraw": {(localize "STR_Item_Aluminiumraw")};
	case "life_inv_leadraw": {(localize "STR_Item_Leadraw")};
	case "life_inv_eggs": {(localize "STR_Item_Eggs")};
	case "life_inv_goatmilk": {(localize "STR_Item_Goatmilk")};
	case "life_inv_wool": {(localize "STR_Item_Wool")};
	case "life_inv_cotton": {(localize "STR_Item_Cotton")};
	case "life_inv_slavecotton": {(localize "STR_Item_Cotton")};
	case "life_inv_leather": {(localize "STR_Item_Leather")};
	case "life_inv_hartz": {(localize "STR_Item_Hartz")};
	case "life_inv_areifen": {(localize "STR_Item_Areifen")};
	case "life_inv_amotor": {(localize "STR_Item_Amotor")};
	case "life_inv_arotor": {(localize "STR_Item_Arotor")};
	case "life_inv_atape": {(localize "STR_Item_Atape")};
	case "life_inv_glue": {(localize "STR_Item_Glue")};
	case "life_inv_woodenboard": {(localize "STR_Item_Woodenboard")};
	case "life_inv_lead": {(localize "STR_Item_Lead")};
	case "life_inv_aluminium": {(localize "STR_Item_Aluminium")};
	case "life_inv_seil": {(localize "STR_Item_Seil")};
	case "life_inv_edelmetall": {(localize "STR_Item_Edelmetall")};
	case "life_inv_edelholz": {(localize "STR_Item_Edelholz")};
	case "life_inv_stoff": {(localize "STR_Item_Stoff")};
	case "life_inv_farbe": {(localize "STR_Item_Farbe")};
	case "life_inv_messing": {(localize "STR_Item_Messing")};
	case "life_inv_schwarzpulver": {(localize "STR_Item_Schwarzpulver")};
	case "life_inv_stahl": {(localize "STR_Item_Stahl")};
	case "life_inv_painkiller": {(localize "STR_Item_Painkiller")};
	case "life_inv_specialfett": {(localize "STR_Item_Specialfett")};
	case "life_inv_netzz": {(localize "STR_Item_Netzz")};
	case "life_inv_gas": {(localize "STR_Item_Gas")};
	case "life_inv_rubber": {(localize "STR_Item_Rubber")};
	case "life_inv_ketchup": {(localize "STR_Item_Ketchup")};
	case "life_inv_mustard": {(localize "STR_Item_Mustard")};
	case "life_inv_plastic": {(localize "STR_Item_Plastic")};
	case "life_inv_plasticpackaging": {(localize "STR_Item_Plasticpackaging")};
	case "life_inv_fabric": {(localize "STR_Item_Fabric")};
	case "life_inv_screws": {(localize "STR_Item_Screws")};
	case "life_inv_batterie": {(localize "STR_Item_Batterie")};
	case "life_inv_altiscola": {(localize "STR_Item_Altiscola")};
	case "life_inv_altisorange": {(localize "STR_Item_Altisorange")};
	case "life_inv_altisbeer": {(localize "STR_Item_Altisbeer")};
	case "life_inv_gasbottle": {(localize "STR_Item_Gasbottle")};
	case "life_inv_laptop": {(localize "STR_Item_Laptop")};
	case "life_inv_pccpu": {(localize "STR_Item_Pccpu")};
	case "life_inv_pcmainboard": {(localize "STR_Item_Pcmainboard")};
	case "life_inv_laptopcase": {(localize "STR_Item_Laptopcase")};
	case "life_inv_knife": {(localize "STR_Item_Knife")};
	case "life_inv_weizenbrot": {(localize "STR_Item_Weizenbrot")};
	case "life_inv_hotdog": {(localize "STR_Item_Hotdog")};
	case "life_inv_fries": {(localize "STR_Item_Fries")};
	case "life_inv_burger1": {(localize "STR_Item_Burger1")};
	case "life_inv_burger2": {(localize "STR_Item_Burger2")};
	case "life_inv_burger3": {(localize "STR_Item_Burger3")};
	case "life_inv_burger4": {(localize "STR_Item_Burger4")};
	case "life_inv_burger5": {(localize "STR_Item_Burger5")};
	case "life_inv_burger6": {(localize "STR_Item_Burger6")};
	case "life_inv_pizza1": {(localize "STR_Item_Pizza1")};
	case "life_inv_pizza2": {(localize "STR_Item_Pizza2")};
	case "life_inv_pizza3": {(localize "STR_Item_Pizza3")};
	case "life_inv_pizza4": {(localize "STR_Item_Pizza4")};
	case "life_inv_sandwich": {(localize "STR_Item_Sandwich")};
	case "life_inv_snack1": {(localize "STR_Item_Snack1")};
	case "life_inv_snack2": {(localize "STR_Item_Snack2")};
	case "life_inv_lasagne": {(localize "STR_Item_Lasagne")};
	case "life_inv_spaghetti": {(localize "STR_Item_Spaghetti")};
	case "life_inv_doener": {(localize "STR_Item_Doener")};
	case "life_inv_gyros": {(localize "STR_Item_Gyros")};
	case "life_inv_apfeltasche": {(localize "STR_Item_Apfeltasche")};
	case "life_inv_icecream1": {(localize "STR_Item_Icecream1")};
	case "life_inv_currywurst": {(localize "STR_Item_Currywurst")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_corals": {(localize "STR_Item_Corals")};
	case "life_inv_painkillers": {(localize "STR_Item_Painkillers")};
	case "life_inv_morphium": {(localize "STR_Item_Morphium")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_handcuffkey": {(localize "STR_Item_handcuffkey")};
	case "life_inv_cocaine": {(localize "STR_Item_CocaineU")};
	case "life_inv_cocainep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_crowbar": {(localize "STR_Item_CrowBar")};
	case "life_inv_wrench": {(localize "STR_Item_Wrench")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_boxzlarge": {(localize "STR_Item_BoxzLarge")};
	case "life_inv_boxzsmall": {(localize "STR_Item_BoxzSmall")};
	case "life_inv_boxzmedium": {(localize "STR_Item_BoxzMedium")};
	case "life_inv_zipties": {(localize "STR_Item_Zip")};
	case "life_inv_scalpel": {(localize "STR_Item_Skalpel")};
	case "life_inv_kidney": {(localize "STR_Item_Niere")};
	case "life_inv_tracker": {(localize "STR_Item_Peilsender")};
	case "life_inv_getreideu": {(localize "STR_Item_Getreide")};
	case "life_inv_holzu": {(localize "STR_Item_Holz")};
	case "life_inv_hopfenu": {(localize "STR_Item_Hopfen")};
	case "life_inv_schwefelu": {(localize "STR_Item_Schwefel")};
	case "life_inv_silberu": {(localize "STR_Item_Silbererz")};
	case "life_inv_tabaku": {(localize "STR_Item_Tabakblatt")};
	case "life_inv_traubenu": {(localize "STR_Item_Trauben")};
	case "life_inv_zinnu": {(localize "STR_Item_Zinnerz")};
	case "life_inv_zinku": {(localize "STR_Item_Zinkerz")};
	case "life_inv_zinkp": {(localize "STR_Item_Zinkbarren")};
	case "life_inv_zuckeru": {(localize "STR_Item_Zuckerrohr")};
	case "life_inv_getreideip": {(localize "STR_Item_Whiskey")};
	case "life_inv_tabakip": {(localize "STR_Item_Zigarren")};
	case "life_inv_zuckerip": {(localize "STR_Item_Rum")};
	case "life_inv_eisenp": {(localize "STR_Item_Gussform")};
	case "life_inv_getreidep": {(localize "STR_Item_Mehl")};
	case "life_inv_holzp": {(localize "STR_Item_Holzkohle")};
	case "life_inv_hopfenp": {(localize "STR_Item_Bier")};
	case "life_inv_schwefelp": {(localize "STR_Item_Schwefelpulver")};
	case "life_inv_silberp": {(localize "STR_Item_Silberbarren")};
	case "life_inv_tabakp": {(localize "STR_Item_Zigaretten")};
	case "life_inv_traubenp": {(localize "STR_Item_Wein")};
	case "life_inv_zinnp": {(localize "STR_Item_Zinnbarren")};
	case "life_inv_zuckerp": {(localize "STR_Item_Zucker")};
	case "life_inv_bronze": {(localize "STR_Item_Bronzebarren")};
	case "life_inv_schmuck": {(localize "STR_Item_Schmuck")};
	case "life_inv_henraw": {(localize "STR_Item_Henraw")};
	case "life_inv_turtlepanzer": {(localize "STR_Item_Turtlepanzer")};
	case "life_inv_feather": {(localize "STR_Item_Feather")};
	case "life_inv_goatfur": {(localize "STR_Item_Goatfur")};
	case "life_inv_sheepwool": {(localize "STR_Item_Sheepwool")};
    case "life_inv_roosterraw": {(localize "STR_Item_Roosterraw")};
    case "life_inv_goatraw": {(localize "STR_Item_Goatraw")};
    case "life_inv_sheepraw": {(localize "STR_Item_Sheepraw")};
    case "life_inv_rabbitraw": {(localize "STR_Item_Rabbitraw")};
	case "life_inv_henrawsteak": {(localize "STR_Item_Hensteak")};
    case "life_inv_roosterrawsteak": {(localize "STR_Item_Roostersteak")};
    case "life_inv_goatrawsteak": {(localize "STR_Item_Goatsteak")};
    case "life_inv_sheeprawsteak": {(localize "STR_Item_Sheepsteak")};
    case "life_inv_rabbitrawsteak": {(localize "STR_Item_Rabbitsteak")};
    case "life_inv_lsd": {(localize "STR_Item_Lsd")};
	case "life_inv_haschisch": {(localize "STR_Item_Haschisch")};
    case "life_inv_ectazy": {(localize "STR_Item_Ectazy")};
    case "life_inv_vodkau": {(localize "STR_Item_Vodka")};
	case "life_inv_diske": {(localize "STR_Item_Diske")};
	case "life_inv_schranke": {(localize "STR_Item_Schranke")};
	case "life_inv_barrierlight": {(localize "STR_Item_BarrierLight")};
	case "life_inv_strahler": {(localize "STR_Item_Strahler")};
	case "life_inv_bunker": {(localize "STR_Item_Bunker")};
	case "life_inv_mauer": {(localize "STR_Item_Mauer")};
	case "life_inv_roadcone": {(localize "STR_Item_Cone")};
	case "life_inv_table": {(localize "STR_Item_Table")};
	case "life_inv_stuhl": {(localize "STR_Item_Stuhl")};
	case "life_inv_lampe": {(localize "STR_Item_Lampe")};
	case "life_inv_bett": {(localize "STR_Item_Bett")};
	case "life_inv_coolbox": {(localize "STR_Item_Coolbox")};
	case "life_inv_uwsl": {(localize "STR_Item_Uwsl")};
	case "life_inv_nitro": {(localize "STR_Item_Nitro")};
	case "life_inv_shovel": {(localize "STR_Item_Shovel")};
	case "life_inv_sieb": {(localize "STR_Item_Sieb")};
	case "life_inv_handcoves": {(localize "STR_Item_Handcoves")};
	case "life_inv_saege": {(localize "STR_Item_Saege")};
	case "life_inv_countrypotatoes": {(localize "STR_Item_Countrypotatoes")};
	case "life_inv_saladpot": {(localize "STR_Item_Saladpot")};
	case "life_inv_altismeal": {(localize "STR_Item_Altismeal")};
	
	//License Block
	case "license_civ_donator": {(localize "STR_License_Donator")};
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_fwehr_car": {(localize "STR_License_FWCar")};
	case "license_fwehr_air": {(localize "STR_License_Pilot")};
	case "license_cop_gsg9": {(localize "STR_License_Gsg9")};
	case "license_cop_gsg9tl": {(localize "STR_License_Gsg9tl")};
	case "license_civ_mafia": {(localize "STR_License_Mafia")};
	case "license_civ_clan1": {(localize "STR_License_Clan")};
	case "license_civ_clanbase": {(localize "STR_License_Clanbase")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_cocaine": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_nudeln": {(localize "STR_License_Getreide")};
	case "license_civ_wein": {(localize "STR_License_Wein")};
	case "license_civ_zigarren": {(localize "STR_License_Zigarren")};
	case "license_civ_schwefel": {(localize "STR_License_Schwefel")};
	case "license_civ_schmuck": {(localize "STR_License_Schmuck")};
	case "license_civ_kidney": {(localize "STR_License_Kidney")};
	case "license_civ_taxi": {(localize "STR_License_Taxi")};
	case "license_civ_haschisch": {(localize "STR_License_Haschisch")};
	case "license_civ_alkohol": {(localize "STR_License_Alkohol")};
	case "license_civ_plastic": {(localize "STR_License_Kunststoff")};
	case "license_civ_woll": {(localize "STR_License_Wolle")};
	case "license_civ_holz": {(localize "STR_License_Holz")};
	case "license_civ_aluminum": {(localize "STR_License_Aluminium")};
	case "license_civ_blei": {(localize "STR_License_Blei")};
	case "license_civ_jadgschein": {(localize "STR_License_Jagdschein")};
	case "license_civ_fishing": {(localize "STR_License_Fishing")};
	case "license_civ_anwalt": {(localize "STR_License_Anwalt")};
	case "license_civ_richter": {(localize "STR_License_Richter")};
	case "license_civ_gokart": {(localize "STR_License_Gokart")};
	case "license_civ_logistika": {(localize "STR_License_Logistik")};
	case "license_civ_wooden": {(localize "STR_License_Wooden")};
	case "license_civ_weizenbrot": {(localize "STR_License_Weizenbrot")};
	case "license_civ_laptop": {(localize "STR_License_Laptop")};
	case "license_civ_clubdj": {(localize "STR_License_Clubdj")};
	case "license_civ_aluminium": {(localize "STR_License_Aluminium")};
	case "license_civ_fabric": {(localize "STR_License_Fabric")};
	case "license_civ_gas": {(localize "STR_License_Gas")};
	
	
	//Prof Block
	case "Heroin_Prof": {(localize "STR_Prof_Heroin")};
	case "Cocain_Prof": {(localize "STR_Prof_Cocain")};
	case "Canabis_Prof": {(localize "STR_Prof_Canabis")};
	case "Tabak_Prof": {(localize "STR_Prof_Tabak")};
	case "Eztacy_Prof": {(localize "STR_Prof_Eztacy")};
	case "Alkohol_Prof": {(localize "STR_Prof_Alkohol")};
	//MATERIALS
	case "Copper_Prof": {(localize "STR_Prof_Copper")};
	case "Corals_Prof": {(localize "STR_Prof_Corals")};
	case "TurtleSoup_Prof": {(localize "STR_Prof_TurtleSoup")};
	case "Iron_Prof": {(localize "STR_Prof_Iron")};
	case "Sand_Prof": {(localize "STR_Prof_Sand")};
	case "Diamond_Prof": {(localize "STR_Prof_Diamond")};
	case "Oil_Prof": {(localize "STR_Prof_Oil")};
	case "Gas_Prof": {(localize "STR_Prof_Gas")};
	case "Aluminum_Prof": {(localize "STR_Prof_Aluminum")};
	case "Lead_Prof": {(localize "STR_Prof_Lead")};
	case "Schwefel_Prof": {(localize "STR_Prof_Schwefel")};//;
	case "Kunststoff_Prof": {(localize "STR_Prof_Kunststoff")};//
	case "Stoff_Prof": {(localize "STR_Prof_Stoff")};//
	case "Zink_Prof": {(localize "STR_Prof_Zink")};//
	//EXTRAS
	case "Fruit_Prof": {(localize "STR_Prof_Fruit")};
	case "Food_Prof": {(localize "STR_Prof_Food")};
	case "Laptop_Prof": {(localize "STR_Prof_Laptop")};
	case "Elektro_Prof": {(localize "STR_Prof_Elektro")};//
	case "Wood_Prof": {(localize "STR_Prof_Wood")};//
	case "Turtle_Prof": {(localize "STR_Prof_Turtle")};//
	case "Fish_Prof": {(localize "STR_Prof_Fish")};//
	case "Juice_Prof": {(localize "STR_Prof_Juice")};//
	case "Jagd_Prof": {(localize "STR_Prof_Jagd")};//
	case "Schmuck_Prof": {(localize "STR_Prof_Schmuck")};//
	//===========
	case "Ticket_Prof": {(localize "STR_Prof_Ticket")};//X
	case "TicketFW_Prof": {(localize "STR_Prof_TicketFW")};//X
	case "Arrest_Prof": {(localize "STR_Prof_Arrest")};//X
	case "Impound_Prof": {(localize "STR_Prof_Impound")};//X
	case "ImpoundPerm_Prof": {(localize "STR_Prof_ImpoundPerm")};
	case "ImpoundCrash_Prof": {(localize "STR_Prof_ImpoundCrash")};
	case "ImpoundFW_Prof": {(localize "STR_Prof_ImpoundFW")};
	case "Revive_Prof": {(localize "STR_Prof_Revive")};//X
	case "Hero_Prof": {(localize "STR_Prof_Hero")};
	case "Dieb_Prof": {(localize "STR_Prof_Dieb")};//X
	//case "Criminal_Prof": {(localize "STR_Prof_Criminal")};
	//case "Shop_Prof": {(localize "STR_Prof_Shop")};
	case "Gang_Prof": {(localize "STR_Prof_Gang")};//X
	case "Repair_Prof": {(localize "STR_Prof_Repair")};//X
	case "RepairCop_Prof": {(localize "STR_Prof_Repair")};//X
};
