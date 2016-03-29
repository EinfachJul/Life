/*
	Author: Bryan "Tonic" Boardwine
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "AntiFuel": {2};
	case "Handschuhe": {2};
	case "Skalpel": {3};
	case "scalpel": {2};
	case "kidney": {15};
	case "oilu": {7};
	case "oilp": {6};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {5};
	case "marijuana": {4};
	case "apple": {1};
	case "orange": {1};
	case "orangejuice": {3};
	case "applejuice": {3};
	case "eggs": {1};
	case "goatmilk": {3};
	case "wool": {2};
	case "cotton": {3};
	case "slavecotton": {1};
	case "leather": {3};
	case "hartz": {1};
	case "areifen": {3};
	case "amotor": {5};
	case "arotor": {6};
	case "atape": {1};
	case "glue": {2};
	case "woodenboard": {3};
	case "lead": {6};
	case "aluminium": {3};
	case "seil": {2};
	case "edelmetall": {3};
	case "edelholz": {2};
	case "stoff": {1};
	case "farbe": {1};
	case "messing": {3};
	case "schwarzpulver": {2};
	case "stahl": {3};
	case "painkiller": {1};
	case "specialfett": {2};
	case "netzz": {2};
	case "gas": {6};
	case "rubber": {2};
	case "karton": {3};
	case "schwefelacid": {4};
	case "techarchiv": {2};
	case "weizen": {3};
	case "abulb": {3};
	case "alamp": {10};
	case "acupboard": {35};
	case "achair": {15};
	case "atable": {17};
	case "chemie1": {2};
	case "chemie2": {6};
	case "aluminiumraw": {4};
	case "leadraw": {7};
	case "plastic": {4};
	case "plasticpackaging": {4};
	case "fabric": {2};
	case "screws": {1};
	case "batterie": {3};
	case "altiscola": {2};
	case "altisorange": {2};
	case "altisbeer": {2};
	case "gasbottle": {5};
	case "laptop": {40};
	case "pccpu": {5};
	case "pcmainboard": {5};
	case "laptopcase": {6};
	case "knife": {5};
	case "countrypotatoes": {1};
	case "saladpot": {1};
	case "altismeal": {5};
	case "weizenbrot": {2};
	case "hotdog": {1};
	case "fries": {1};
	case "burger1": {1};
	case "burger2": {1};
	case "burger3": {1};
	case "burger4": {1};
	case "burger5": {1};
	case "burger6": {1};
	case "pizza1": {2};
	case "pizza2": {2};
	case "pizza3": {2};
	case "pizza4": {2};
	case "sandwich": {1};
	case "snack1": {1};
	case "snack2": {1};
	case "lasagne": {2};
	case "spaghetti": {2};
	case "doener": {2};
	case "gyros": {2};
	case "apfeltasche": {1};
	case "icecream1": {1};
	case "water": {1};
	case "currywurst": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {3};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {4};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "shovel": {2};
	case "handcoves": {2};
	case "copperore": {4};
	case "ironore": {4};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "glass": {2};
	case "diamond": {4};
	case "diamondc": {3};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {5};
	case "corals": {6};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "crowbar": {20};
	case "wrench": {5};
	case "defusekit": {2};
	case "storagesmall": {10};
	case "storagebig": {20};
	case "boxzsmall": {10};
	case "boxzlarge": {30};
	case "boxzmedium": {20};
	case "zipties": {2};
	case "tracker": {3};
	case "getreideu": {3};
	case "holzu": {4};
	case "hopfenu": {3};
	case "schwefelu": {4};
	case "silberu": {7};
	case "tabaku": {4};
	case "traubenu": {4};
	case "zinnu": {3};
	case "zuckeru": {4};
	case "getreideip": {5};
	case "tabakip": {3};
	case "zuckerip": {4};
	case "eisenp": {4};
	case "getreidep": {2};
	case "holzp": {3};
	case "hopfenp": {4};
	case "schwefelp": {3};
	case "silberp": {7};
	case "tabakp": {3};
	case "traubenp": {3};
	case "zinnp": {3};
	case "zuckerp": {4};
	case "schmuck": {5};
	case "bronze": {8};
	case "handcuffkey": {1};
	case "scalpel": {2};
	case "coolbox": {5};
	case "feather": {1};
	case "goatfur": {2};
	case "sheepwool": {2};
	case "turtlepanzer": {2};
	case "henraw": {2};
    case "roosterraw": {2};
    case "goatraw": {3};
    case "sheepraw": {3};
    case "rabbitraw": {2};
	case "henrawsteak": {2};
    case "roosterrawsteak": {2};
    case "goatrawsteak": {2};
    case "sheeprawsteak": {2};
    case "rabbitrawsteak": {1};
    case "lsd": {4};
    case "ectazy": {4};
	case "haschisch": {3};
    case "vodkau": {7};
	case "diske": {7};
	case "schranke": {5};
	case "barrierlight": {2};
	case "strahler": {5};
	case "bunker": {10};
	case "mauer": {2};
	case "cone": {2};
	case "table": {5};
	case "stuhl": {5};
	case "lampe": {5};
	case "bett": {5};
	case "uwsl": {25};
	case "nitro": {5};
	case "sieb": {5};
	case "saege": {5};
	default {1};
};
