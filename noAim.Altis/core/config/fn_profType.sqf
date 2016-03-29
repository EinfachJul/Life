/*
Author: Jacob "PapaBear" Tyler
Text changing
*/
//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param;
 
if(_type == "" ) exitWith {[]};
 
_profName = "";
switch ( _type ) do
{	
	//text to license
	//DRUGS
	case "cocaine": { _profName = "Cocain_Prof";};
	case "cocainep": { _profName = "Cocain_Prof";};
	case "marijuana": { _profName = "Canabis_Prof";};
	case "cannabis": { _profName = "Canabis_Prof";};
	case "heroinu": {_profName = "Heroin_Prof"; };
	case "heroinp": {_profName = "Heroin_Prof"; };
	case "haschisch": { _profName = "Canabis_Prof";};
	case "corals": { _profName = "Corals_Prof";};
	//IRONS
	case "copperr": { _profName = "Copper_Prof"; };
	case "copperore": { _profName = "Copper_Prof"; };
	case "ironr": { _profName = "Iron_Prof";};
	case "ironore": { _profName = "Iron_Prof";};
	case "aluminium": { _profName = "Aluminum_Prof";};
	case "aluminiumraw": { _profName = "Aluminum_Prof";};
	//STONES
	case "sand": { _profName = "Sand_Prof";};
	case "diamond": { _profName = "Diamond_Prof";};
	case "diamondr": { _profName = "Diamond_Prof";};
	case "schmuck": { _profName = "Schmuck_Prof";};
	//ALKOHOL
	case "traubenp": { _profName = "Alkohol_Prof";};
	//FULES
	case "oilp": { _profName = "Oil_Prof";};
	case "oilu": { _profName = "Oil_Prof";};
	case "gas": { _profName = "Gas_Prof";};
	case "gasbottle": { _profName = "Gas_Prof";};
	//FOOD
	case "apple": { _profName = "Fruit_Prof"; };
	case "traubenu": { _profName = "Fruit_Prof"; };
	case "weizenbrot": { _profName = "Food_Prof";};
	case "henraw": { _profName = "Jagd_Prof";};
	case "roosterraw": { _profName = "Jagd_Prof";};
	case "sheepraw": { _profName = "Jagd_Prof";};
	case "goatraw": { _profName = "Jagd_Prof";};
	case "salema": { _profName = "Fish_Prof"; };
	case "ornate": { _profName = "Fish_Prof"; };
	case "mackerel": { _profName = "Fish_Prof"; };
	case "tuna": { _profName = "Fish_Prof"; };
	case "mullet": { _profName = "Fish_Prof"; };
	case "catshark": { _profName = "Fish_Prof"; };
	case "turtle": { _profName = "Turtle_Prof"; };
	case "turtlesoup": { _profName = "TurtleSoup_Prof"; };
	//ANDERES
	case "tabakip": { _profName = "Tabak_Prof";};
	case "tabaku": { _profName = "Tabak_Prof";};
	case "laptop": { _profName = "Laptop_Prof";};
	case "wool": { _profName = "Stoff_Prof";};
	case "cotton": { _profName = "Stoff_Prof";};
	case "fabric": { _profName = "Stoff_Prof";};
	case "woodenboard": { _profName = "Wood_Prof";};
	case "holzu": { _profName = "Wood_Prof";};
	case "plastic": { _profName = "Kunststoff_Prof";};
	case "schwefelu": { _profName = "Schwefel_Prof";};
	case "schwefelp": { _profName = "Schwefel_Prof";};
	//=======================================================

	//license to text
	//DRUGS
	case "Heroin_Prof": {_profName = "Heroin"; };
	case "Cocain_Prof": { _profName = "Cocaine"; };
	case "Canabis_Prof": { _profName = "Cannabis"; };
	case "Tabak_Prof": { _profName = "Tabak"; };
	case "Alkohol_Prof": { _profName = "Alkohol"; };
	//MATERIALS
	case "Copper_Prof": { _profName = "Copper"; };
	case "Iron_Prof": { _profName = "Iron";  };
	case "Sand_Prof": { _profName = "Sand"; };
	case "Diamond_Prof": { _profName = "Diamond"; };
	case "Oil_Prof": { _profName = "Oil"; };
	case "Gas_Prof": { _profName = "Gas"; };
	case "Aluminum_Prof": { _profName = "Aluminum"; };
	case "Schwefel_Prof": { _profName = "Schwefel"; };
	case "Kunststoff_Prof": { _profName = "Kunststoff"; };
	case "Stoff_Prof": { _profName = "Stoff"; };
	//EXTRAS
	case "Fruit_Prof": { _profName = "Fruit"; };
	case "Food_Prof": { _profName = "Food"; };
	case "Laptop_Prof": { _profName = "Laptop"; };
	case "Wood_Prof": { _profName = "Holz"; };
	case "Turtle_Prof": { _profName = "Schildkroeten"; };
	case "Corals_Prof": { _profName = "Korallen"; };
	case "TurtleSoup_Prof": { _profName = "Schildkroetensuppe"; };
	case "Fish_Prof": { _profName = "Fisch"; };
	case "Jagd_Prof": { _profName = "Jagd"; };
	case "Schmuck_Prof": { _profName = "Schmuck"; };
	//===========
	case "Ticket_Prof": {_profName = "Ticket (COP)"; };
	case "TicketFW_Prof": {_profName = "Ticket (FW)"; };
	case "Arrest_Prof": {_profName = "Arrest (COP)"; };
	case "Impound_Prof": {_profName = "Abschleppen (COP)"; };
	case "ImpoundPerm_Prof": {_profName = "Beschlagnahmen (COP)"; };
	case "ImpoundCrash_Prof": {_profName = "Zerstoeren (COP)"; };
	case "ImpoundFW_Prof": {_profName = "Abschleppen (FW)"; };
	case "Revive_Prof": {_profName = "Revive (FW)"; };
	case "Hero_Prof": {_profName = "Wanted (COP)"; };
	case "Dieb_Prof": {_profName = "Dieb (CIV)"; };
	case "Gang_Prof": {_profName = "Gang (CIV)"; };
	case "Repair_Prof": {_profName = "Repair (FW)"; };
	case "RepairCop_Prof": {_profName = "Repair (COP)"; };
	default{""};
};

_profName;