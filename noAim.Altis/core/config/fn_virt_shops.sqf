/*
	Author: Bryan "Tonic" Boardwine
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Markt",["water","hotdog","currywurst","apple","orange","redgull","knife"]]};
	case "gsg9": {["Bundespolizeihandel",["lockpick","handcuffkey","donuts","coffee","spikeStrip","water","currywurst","apple","redgull","fuelF","defusekit","tracker","roadcone","mauer","barrierlight","schranke","bunker","strahler"]]};
	case "cop": {["Polizeihandel",["lockpick","handcuffkey","donuts","coffee","spikeStrip","water","currywurst","apple","redgull","fuelF","defusekit","tracker","roadcone","mauer","barrierlight","schranke","bunker","strahler"]]};
	case "medic": {["Sanitaeterhandel",["coolbox","kidney","lockpick","handcuffkey","donuts","coffee","water","currywurst","apple","redgull","fuelF","roadcone","mauer","barrierlight","schranke","strahler"]]};
	//case "rumschladen": {["Rumsch Händler",["lockpick","handcuffkey","pickaxe","shovel","saege","handcoves","sieb","fuelF","storagesmall","storagebig"]]};
	case "rebel": {["Rebellen Markt",["water","currywurst","scalpel","atape","handcuffkey","zipties","hotdog","redgull","lockpick","pickaxe","shovel","saege","handcoves","sieb","fuelF","uwsl","blastingcharge","tracker","boltcutter"]]};
	case "mafia": {["Giovannis Markt",["water","currywurst","scalpel","atape","handcuffkey","zipties","hotdog","redgull","lockpick","pickaxe","shovel","saege","handcoves","sieb","fuelF","uwsl","blastingcharge","tracker","boltcutter"]]};
	case "gang": {["Gang's Markt",["water","currywurst","scalpel","handcuffkey","zipties","hotdog","redgull","sieb","fuelF"]]};
	case "clanbase": {["Clanbase Markt",["water","currywurst","scalpel","handcuffkey","zipties","hotdog","redgull","sieb","fuelF"]]};
	case "wongs": {["ETEKA Feinkost",["turtlesoup","turtle","corals"]]};
	case "jailmarket": {["Gefängnishandel",["water","sandwich","apple","hotdog"]]};
	case "fishmarket": {["Fischmarkt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	//DEALER
	case "heroin": {["Drogendealer",["cocainep","heroinp","marijuana","haschisch","tabakip"]]};
	//HANDEL
	case "oil": {["Oelhandel",["oilp","pickaxe","shovel","saege","handcoves","sieb","fuelF"]]};
	case "glass": {["Glashandel",["glass"]]};
	case "ironz": {["Eisen-/Kupferhandel",["iron_r","copper_r","eisenp"]]};
	case "diamond": {["Diamantenhandel",["diamond","diamondc"]]};
	case "tabak": {["Tabakfachhandel",["tabakip"]]};
	case "backen": {["Baeckerei",["getreidep","donuts","weizenbrot"]]};
	case "kohle": {["Verkohler",["holzp"]]};
	case "trinken": {["Getraenkehandel",["traubenp"]]};
	case "aluz": {["Aluminium",["aluminium","aluminiumraw"]]};
	case "schwefel": {["Schwefelhaftes",["schwefelp"]]};
	case "pchandel": {["Computer Händler",["laptop"]]};
	case "trinkhandel": {["Getränke Händler",["traubenp"]]};
	case "gazhandel": {["Gas Händler",["gasbottle"]]};
	case "verpackhandel": {["Kunststoff Händler",["plastic"]]};
	case "tischhandel": {["Tischler",["woodenboard","holzu"]]};
	case "fleischhandel": {["Fleischer",["henraw","roosterraw","sheepraw","goatraw","rabbitraw","henrawsteak","roosterrawsteak","sheeprawsteak","goatrawsteak","rabbitrawsteak"]]};
	case "schneidhandel": {["Schneider",["cotton","fabric","wool"]]};
	case "pcstore": {["PCstore",["laptop"]]};
	//Laden
	case "gold": {["Goldhandel",["goldbar","silberp","bronze","schmuck"]]};
	case "organ": {["Organ Dealer",["kidney","coolbox","scalpel"]]};
	case "pizzeria": {["Pizzeria",["pizza1","pizza2","pizza3","pizza4","spaghetti","lasagne"]]};
	case "mcburger": {["McBurger",["burger1","burger2","burger3","burger4","burger6","fries","countrypotatoes","saladpot","altismeal","altiscola","altisorange","icecream1"]]};
	case "cafeteria": {["Cafeteria",["snack2","sandwich","apfeltasche","icecream1","water","hotdog","redgull"]]};
	case "bistro": {["Bistro",["sandwich","apfeltasche","pizza1","pizza2","pizza3","pizza4","spaghetti","lasagne"]]};
	case "icecream": {["Eistruhe",["icecream1"]]};
	case "colaautomat": {["Getraenkeautomat",["altiscola","altisorange","altisbeer","water","redgull"]]};
	case "baecker": {["Baeckerei",["sandwich","apfeltasche","eggs"]]};
	case "doenerei": {["Doener King",["doener","gyros","eggs"]]};
	case "tankstelle": {["Tankstelle",["snack2","sandwich"]]};
	case "beer": {["Alkohol Store",["zuckerip","vodkau","getreideip","altisbeer","altiscola","altisorange"]]};
	case "gas": {["Petroleum Gas Store",["gasbottle"]]};
	case "fuelstation": {["Tankladen",["fuelF","shovel","saege","sieb","pickaxe","lockpick","water","donuts","coffee","snack2","sandwich"]]};
	case "moebelhaus": {["Moebelhaus",["storagesmall","storagebig","table","bett","lampe","stuhl"]]};
	case "obst": {["Obstmarkt",["apple"]]};
	case "baumarket": {["Baumarkt",["pickaxe","shovel","saege","handcoves","sieb","fuelF"]]};
	case "gemischt": {["Gemischtwaren",["boltcutter","lockpick","handcuffkey","pickaxe","shovel","saege","handcoves","sieb"]]};
	case "gemischtXL": {["Gemischtwaren",["boltcutter","lockpick","handcuffkey","pickaxe","shovel","handcoves","saege","sieb","fuelF","storagesmall","storagebig"]]};
	case "apotheke": {["Apotheke",["coolbox","kidney","painkillers","morphium"]]};
	case "zigaretz": {["Zigarettenautomat",["tabakp"]]};
	//case "spion": {["Hintermann",["techarchiv"]]};
};