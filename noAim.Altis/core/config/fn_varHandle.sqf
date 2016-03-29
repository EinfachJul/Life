/*
	Author: Bryan "Tonic" Boardwine
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "orange": {"life_inv_orange"};
			case "orangejuice": {"life_inv_orangejuice"};
			case "applejuice": {"life_inv_applejuice"};
			case "karton": {"life_inv_karton"};
			case "schwefelacid": {"life_inv_schwefelacid"};
			case "techarchiv": {"life_inv_techarchiv"};
			case "weizen": {"life_inv_weizen"};
			case "abulb": {"life_inv_abulb"};
			case "alamp": {"life_inv_alamp"};
			case "acupboard": {"life_inv_acupboard"};
			case "achair": {"life_inv_achair"};
			case "atable": {"life_inv_atable"};
			case "chemie1": {"life_inv_chemie1"};
			case "chemie2": {"life_inv_chemie2"};
			case "aluminiumraw": {"life_inv_aluminiumraw"};
			case "leadraw": {"life_inv_leadraw"};
			case "applejuice": {"life_inv_applejuice"};
			case "eggs": {"life_inv_eggs"};
			case "goatmilk": {"life_inv_goatmilk"};
			case "wool": {"life_inv_wool"};
			case "cotton": {"life_inv_cotton"};
			case "slavecotton": {"life_inv_slavecotton"};
			case "leather": {"life_inv_leather"};
			case "hartz": {"life_inv_hartz"};
			case "areifen": {"life_inv_areifen"};
			case "amotor": {"life_inv_amotor"};
			case "arotor": {"life_inv_arotor"};
			case "atape": {"life_inv_atape"};
			case "glue": {"life_inv_glue"};
			case "woodenboard": {"life_inv_woodenboard"};
			case "lead": {"life_inv_lead"};
			case "aluminium": {"life_inv_aluminium"};
			case "seil": {"life_inv_seil"};
			case "edelmetall": {"life_inv_edelmetall"};
			case "edelholz": {"life_inv_edelholz"};
			case "stoff": {"life_inv_stoff"};
			case "farbe": {"life_inv_farbe"};
			case "messing": {"life_inv_messing"};
			case "schwarzpulver": {"life_inv_schwarzpulver"};
			case "stahl": {"life_inv_stahl"};
			case "painkiller": {"life_inv_painkiller"};
			case "specialfett": {"life_inv_specialfett"};
			case "netzz": {"life_inv_netzz"};
			case "gas": {"life_inv_gas"};
			case "rubber": {"life_inv_rubber"};
			case "plastic": {"life_inv_plastic"};
			case "plasticpackaging": {"life_inv_plasticpackaging"};
			case "fabric": {"life_inv_fabric"};
			case "screws": {"life_inv_screws"};
			case "batterie": {"life_inv_batterie"};
			case "altiscola": {"life_inv_altiscola"};
			case "altisorange": {"life_inv_altisorange"};
			case "altisbeer": {"life_inv_altisbeer"};
			case "gasbottle": {"life_inv_gasbottle"};
			case "laptop": {"life_inv_laptop"};
			case "pccpu": {"life_inv_pccpu"};
			case "pcmainboard": {"life_inv_pcmainboard"};
			case "laptopcase": {"life_inv_laptopcase"};
			case "knife": {"life_inv_knife"};
			case "weizenbrot": {"life_inv_weizenbrot"};
			case "hotdog": {"life_inv_hotdog"};
			case "fries": {"life_inv_fries"};
			case "burger1": {"life_inv_burger1"};
			case "burger2": {"life_inv_burger2"};
			case "burger3": {"life_inv_burger3"};
			case "burger4": {"life_inv_burger4"};
			case "burger5": {"life_inv_burger5"};
			case "burger6": {"life_inv_burger6"};
			case "pizza1": {"life_inv_pizza1"};
			case "pizza2": {"life_inv_pizza2"};
			case "pizza3": {"life_inv_pizza3"};
			case "pizza4": {"life_inv_pizza4"};
			case "sandwich": {"life_inv_sandwich"};
			case "snack1": {"life_inv_snack1"};
			case "snack2": {"life_inv_snack2"};
			case "lasagne": {"life_inv_lasagne"};
			case "spaghetti": {"life_inv_spaghetti"};
			case "doener": {"life_inv_doener"};
			case "gyros": {"life_inv_gyros"};
			case "apfeltasche": {"life_inv_apfeltasche"};
			case "icecream1": {"life_inv_icecream1"};
			case "water": {"life_inv_water"};
			case "currywurst": {"life_inv_currywurst"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"life_znorak"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "shovel": {"life_inv_shovel"};
			case "handcoves": {"life_inv_handcoves"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "painkillers": {"life_inv_painkillers"};
			case "corals": {"life_inv_corals"};
			case "morphium": {"life_inv_morphium"};
			case "lockpick": {"life_inv_lockpick"};
			case "handcuffkey": {"life_inv_handcuffkey"};
			case "redgull": {"life_inv_redgull"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_cocaine"};
			case "cocainep": {"life_inv_cocainep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "crowbar": {"life_inv_crowbar"};
			case "wrench": {"life_inv_wrench"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "boxzsmall": {"life_inv_boxzsmall"};
			case "boxzlarge": {"life_inv_boxzlarge"};
			case "boxzmedium": {"life_inv_boxzmedium"};
			case "zipties": {"life_inv_zipties"};
			case "kidney": {"life_inv_kidney"};
			case "scalpel": {"life_inv_scalpel"};
			case "tracker": {"life_inv_tracker"};
			case "getreideu": {"life_inv_getreideu"};
			case "holzu": {"life_inv_holzu"};
			case "hopfenu": {"life_inv_hopfenu"};
			case "schwefelu": {"life_inv_schwefelu"};
			case "silberu": {"life_inv_silberu"};
			case "tabaku": {"life_inv_tabaku"};
			case "traubenu": {"life_inv_traubenu"};
			case "zinnu": {"life_inv_zinnu"};
			case "zinku": {"life_inv_zinku"};
			case "zinkp": {"life_inv_zinkp"};
			case "zuckeru": {"life_inv_zuckeru"};
			case "getreideip": {"life_inv_getreideip"};
			case "tabakip": {"life_inv_tabakip"};
			case "zuckerip": {"life_inv_zuckerip"};
			case "eisenp": {"life_inv_eisenp"};
			case "getreidep": {"life_inv_getreidep"};
			case "holzp": {"life_inv_holzp"};
			case "hopfenp": {"life_inv_hopfenp"};
			case "schwefelp": {"life_inv_schwefelp"};
			case "silberp": {"life_inv_silberp"};
			case "tabakp": {"life_inv_tabakp"};
			case "traubenp": {"life_inv_traubenp"};
			case "zinnp": {"life_inv_zinnp"};
			case "zuckerp": {"life_inv_zuckerp"};
			case "bronze": {"life_inv_bronze"};
			case "schmuck": {"life_inv_schmuck"};
			case "henraw": {"life_inv_henraw"};
            case "turtlepanzer": {"life_inv_turtlepanzer"};
            case "feather": {"life_inv_feather"};
            case "goatfur": {"life_inv_goatfur"};
            case "sheepwool": {"life_inv_sheepwool"};
            case "roosterraw": {"life_inv_roosterraw"};
            case "goatraw": {"life_inv_goatraw"};
            case "sheepraw": {"life_inv_sheepraw"};
            case "rabbitraw": {"life_inv_rabbitraw"};
			case "henrawsteak": {"life_inv_henrawsteak"};
            case "roosterrawsteak": {"life_inv_roosterrawsteak"};
            case "goatrawsteak": {"life_inv_goatrawsteak"};
            case "sheeprawsteak": {"life_inv_sheeprawsteak"};
            case "rabbitrawsteak": {"life_inv_rabbitrawsteak"};
            case "lsd": {"life_inv_lsd"};
            case "ectazy": {"life_inv_ectazy"};
			case "haschisch": {"life_inv_haschisch"};
            case "vodkau": {"life_inv_vodkau"};
			case "diske": {"life_inv_diske"};
			case "schranke": {"life_inv_schranke"};
			case "barrierlight": {"life_inv_barrierlight"};
			case "strahler": {"life_inv_strahler"};
			case "bunker": {"life_inv_bunker"};
			case "mauer": {"life_inv_mauer"};
			case "roadcone": {"life_inv_roadcone"};
			case "table": {"life_inv_table"};
			case "stuhl": {"life_inv_stuhl"};
			case "lampe": {"life_inv_lampe"};
			case "bett": {"life_inv_bett"};
			case "coolbox": {"life_inv_coolbox"};
			case "uwsl": {"life_inv_uwsl"};
			case "nitro": {"life_inv_nitro"};
			case "sieb": {"life_inv_sieb"};
			case "saege": {"life_inv_saege"};
			case "countrypotatoes": {"life_inv_countrypotatoes"};
			case "saladpot": {"life_inv_saladpot"};
			case "altismeal": {"life_inv_altismeal"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_orange": {"orange"};
			case "life_inv_orangejuice": {"orangejuice"};
			case "life_inv_applejuice": {"applejuice"};
			case "life_inv_karton": {"karton"};
			case "life_inv_schwefelacid": {"schwefelacid"};
			case "life_inv_techarchiv": {"techarchiv"};
			case "life_inv_weizen": {"weizen"};
			case "life_inv_abulb": {"abulb"};
			case "life_inv_alamp": {"alamp"};
			case "life_inv_acupboard": {"acupboard"};
			case "life_inv_achair": {"achair"};
			case "life_inv_atable": {"atable"};
			case "life_inv_chemie1": {"chemie1"};
			case "life_inv_chemie2": {"chemie2"};
			case "life_inv_aluminiumraw": {"aluminiumraw"};
			case "life_inv_leadraw": {"leadraw"};
			case "life_inv_applejuice": {"applejuice"};
			case "life_inv_eggs": {"eggs"};
			case "life_inv_goatmilk": {"goatmilk"};
			case "life_inv_wool": {"wool"};
			case "life_inv_cotton": {"cotton"};
			case "life_inv_slavecotton": {"slavecotton"};
			case "life_inv_leather": {"leather"};
			case "life_inv_hartz": {"hartz"};
			case "life_inv_areifen": {"areifen"};
			case "life_inv_amotor": {"amotor"};
			case "life_inv_arotor": {"arotor"};
			case "life_inv_atape": {"atape"};
			case "life_inv_glue": {"glue"};
			case "life_inv_woodenboard": {"woodenboard"};
			case "life_inv_lead": {"lead"};
			case "life_inv_aluminium": {"aluminium"};
			case "life_inv_seil": {"seil"};
			case "life_inv_edelmetall": {"edelmetall"};
			case "life_inv_edelholz": {"edelholz"};
			case "life_inv_stoff": {"stoff"};
			case "life_inv_farbe": {"farbe"};
			case "life_inv_messing": {"messing"};
			case "life_inv_schwarzpulver": {"schwarzpulver"};
			case "life_inv_stahl": {"stahl"};
			case "life_inv_painkiller": {"painkiller"};
			case "life_inv_specialfett": {"specialfett"};
			case "life_inv_netzz": {"netzz"};
			case "life_inv_gas": {"gas"};
			case "life_inv_rubber": {"rubber"};
			case "life_inv_plastic": {"plastic"};
			case "life_inv_plasticpackaging": {"plasticpackaging"};
			case "life_inv_fabric": {"fabric"};
			case "life_inv_screws": {"screws"};
			case "life_inv_batterie": {"batterie"};
			case "life_inv_altiscola": {"altiscola"};
			case "life_inv_altisorange": {"altisorange"};
			case "life_inv_altisbeer": {"altisbeer"};
			case "life_inv_gasbottle": {"gasbottle"};
			case "life_inv_laptop": {"laptop"};
			case "life_inv_pccpu": {"pccpu"};
			case "life_inv_pcmainboard": {"pcmainboard"};
			case "life_inv_laptopcase": {"laptopcase"};
			case "life_inv_knife": {"knife"};
			case "life_inv_weizenbrot": {"weizenbrot"};
			case "life_inv_hotdog": {"hotdog"};
			case "life_inv_fries": {"fries"};
			case "life_inv_burger1": {"burger1"};
			case "life_inv_burger2": {"burger2"};
			case "life_inv_burger3": {"burger3"};
			case "life_inv_burger4": {"burger4"};
			case "life_inv_burger5": {"burger5"};
			case "life_inv_burger6": {"burger6"};
			case "life_inv_pizza1": {"pizza1"};
			case "life_inv_pizza2": {"pizza2"};
			case "life_inv_pizza3": {"pizza3"};
			case "life_inv_pizza4": {"pizza4"};
			case "life_inv_sandwich": {"sandwich"};
			case "life_inv_snack1": {"snack1"};
			case "life_inv_snack2": {"snack2"};
			case "life_inv_lasagne": {"lasagne"};
			case "life_inv_spaghetti": {"spaghetti"};
			case "life_inv_doener": {"doener"};
			case "life_inv_gyros": {"gyros"};
			case "life_inv_apfeltasche": {"apfeltasche"};
			case "life_inv_icecream1": {"icecream1"};
			case "life_inv_water": {"water"} ;
			case "life_inv_currywurst": {"currywurst"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_znorak": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_shovel": {"shovel"};
			case "life_inv_handcoves": {"handcoves"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_corals": {"corals"};
			case "life_inv_handcuffkey": {"handcuffkey"};
			case "life_inv_painkillers": {"painkillers"};
			case "life_inv_morphium": {"morphium"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_cocaine": {"cocaine"};
			case "life_inv_cocainep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_wrench": {"wrench"};
			case "life_inv_crowbar": {"crowbar"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_boxzlarge": {"boxzlarge"};
			case "life_inv_boxzsmall": {"boxzsmall"};
			case "life_inv_boxzmedium": {"boxzmedium"};
			case "life_inv_zipties": {"zipties"};
			case "life_inv_kidney": {"kidney"};
			case "life_inv_scalpel": {"scalpel"};
			case "life_inv_tracker": {"tracker"};
			case "life_inv_getreideu": {"getreideu"};
			case "life_inv_holzu": {"holzu"};
			case "life_inv_hopfenu": {"hopfenu"};
			case "life_inv_schwefelu": {"schwefelu"};
			case "life_inv_silberu": {"silberu"};
			case "life_inv_tabaku": {"tabaku"};
			case "life_inv_traubenu": {"traubenu"};
			case "life_inv_zinnu": {"zinnu"};
			case "life_inv_zinku": {"zinku"};
			case "life_inv_zinkp": {"zinkp"};
			case "life_inv_zuckeru": {"zuckeru"};
			case "life_inv_getreideip": {"getreideip"};
			case "life_inv_tabakip": {"tabakip"};
			case "life_inv_zuckerip": {"zuckerip"};
			case "life_inv_eisenp": {"eisenp"};
			case "life_inv_getreidep": {"getreidep"};
			case "life_inv_holzp": {"holzp"};
			case "life_inv_hopfenp": {"hopfenp"};
			case "life_inv_schwefelp": {"schwefelp"};
			case "life_inv_silberp": {"silberp"};
			case "life_inv_tabakp": {"tabakp"};
			case "life_inv_traubenp": {"traubenp"};
			case "life_inv_zinnp": {"zinnp"};
			case "life_inv_zuckerp": {"zuckerp"};
			case "life_inv_bronze": {"bronze"};
			case "life_inv_schmuck": {"schmuck"};
			case "life_inv_henraw": {"henraw"};
			case "life_inv_turtlepanzer": {"turtlepanzer"};
			case "life_inv_feather": {"feather"};
			case "life_inv_goatfur": {"goatfur"};
			case "life_inv_sheepwool": {"sheepwool"};
            case "life_inv_roosterraw": {"roosterraw"};
            case "life_inv_goatraw": {"goatraw"};
            case "life_inv_sheepraw": {"sheepraw"};
            case "life_inv_rabbitraw": {"rabbitraw"};
			case "life_inv_henrawsteak": {"henrawsteak"};
            case "life_inv_roosterrawsteak": {"roosterrawsteak"};
            case "life_inv_goatrawsteak": {"goatrawsteak"};
            case "life_inv_sheeprawsteak": {"sheeprawsteak"};
            case "life_inv_rabbitrawsteak": {"rabbitrawsteak"};
            case "life_inv_lsd": {"lsd"};
            case "life_inv_ectazy": {"ectazy"};
			case "life_inv_haschisch": {"haschisch"};
            case "life_inv_vodkau": {"vodkau"};
			case "life_inv_diske": {"diske"};
			case "life_inv_schranke": {"schranke"};
			case "life_inv_barrierlight": {"barrierlight"};
			case "life_inv_strahler": {"strahler"};
			case "life_inv_bunker": {"bunker"};
			case "life_inv_mauer": {"mauer"};
			case "life_inv_roadcone": {"roadcone"};
			case "life_inv_table": {"table"};
			case "life_inv_stuhl": {"stuhl"};
			case "life_inv_lampe": {"lampe"};
			case "life_inv_bett": {"bett"};
			case "life_inv_coolbox": {"coolbox"};
			case "life_inv_uwsl": {"uwsl"};
			case "life_inv_nitro": {"nitro"};
			case "life_inv_sieb": {"sieb"};
			case "life_inv_saege": {"saege"};
			case "life_inv_countrypotatoes": {"countrypotatoes"};
			case "life_inv_saladpot": {"saladpot"};
			case "life_inv_altismeal": {"altismeal"};
		};
	};
};