//need to store
// _resource : the name of the resource as input
// _zoneSize : the diameter of the resource zone in meters
// _batchSize : how many items should be gathererd in one go
// _requiredItem : is an item required to grather this resource?
private["_var", "_zoneSize", "_batchSize", "_requiredItem", "_resourcetypeof"];
_resource = [_this,0,"",[""]] call BIS_fnc_param;

//default values
_zoneSize = 50;
_batchSize = 1;
_requiredItem = "";
_resourceZones = [];
_resourcetypeof = 0;

//if you want to overwrite a value for one of the resource just add a case for it here
switch(_resource) do {

	case ("apple") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["apple_1","apple_2","apple_3","apple_4"];
		_resourcetypeof = 1;
	};
	
	case  ("heroinu") : {
		if(license_civ_mafia) then {
			_batchSize = round(random 3) +3;
		}
		else {
			_batchSize = round(random 3) +1;
		};
		_resourceZones = ["heroin_1"];
		_resourcetypeof = 1;
	};
	
	case  ("cocaine") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["cocaine_1"];
		_resourcetypeof = 1;
	};
	
	case  ("cannabis") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["weed_1"];
		_resourcetypeof = 1;
	};
	
	case  ("traubenu") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["trauben_1"];
		_resourcetypeof = 1;
	};	
	
	case  ("getreideu") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["getreide_1"];
		_resourcetypeof = 1;
	};	

	case  ("tabaku") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["tabak_1"];
		_resourcetypeof = 1;
	};
	
	case ("copperore") : {
		_batchSize = 2;
		_requiredItem = "pickaxe";
		_resourceZones = ["lead_1"];
		_resourcetypeof = 2;
	};
	
	case ("ironore") : {
		_batchSize = 2;
		_requiredItem = "pickaxe";
		_resourceZones = ["iron_1"];
		_resourcetypeof = 2;
	};
	
	case ("sand") : {
		_batchSize = round(random 3) +1;
		_requiredItem = "shovel";
		_resourceZones = ["sand_1"];
		_resourcetypeof = 4;
	};
	
	case ("diamond") : {
		_batchSize = round(random 3) +1;
		_requiredItem = "pickaxe";
		_resourceZones = ["diamond_1"];
		_resourcetypeof = 2;
	};
	
	case ("oilu") : {
		_batchSize = round(random 3) +1;
//_requiredItem = "handcoves";
		_resourceZones = ["oil_1","oil_21"];
		_resourcetypeof = 2;
	};
	
	case ("holzu") : {
		_batchSize = round(random 3) +1;
		_requiredItem = "saege";
		_resourceZones = ["holz_1"];
		_resourcetypeof = 3;
	};
	
	case ("schwefelu") : {
		_batchSize = round(random 3) +1;
		_requiredItem = "pickaxe";
		_resourceZones = ["schwefel_1"];
		_resourcetypeof = 2;
	};
	
	case ("aluminiumraw") : {
		_batchSize = round(random 3) +1;
		_requiredItem = "pickaxe";
		_resourceZones = ["alumine_1"];
		_resourcetypeof = 2;
	};
	
	case  ("gas") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["gaz_1"];
		_resourcetypeof = 1;
		_zoneSize = 25;
	};	

	case  ("cotton") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["baumwolle_2"];
		_resourcetypeof = 1;
	};	
	
	case  ("slavecotton") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["baumwolle_1"];
		_resourcetypeof = 1;
		_zoneSize = 17;
	};	

	case  ("eggs") : {
		_batchSize = round(random 3) +1;
		_resourceZones = ["bauernhof_1"];
		_resourcetypeof = 1;
	};	
	
	case  ("corals") : {
		if(license_civ_mafia) then {
			_batchSize = round(random 3) +3;
		}
		else {
			_batchSize = round(random 3) +1;
		};
		_requiredItem = "sieb";
		_resourceZones = ["corals_a1","corals_a2","corals_a3","corals_a4","corals_a5"];
		_resourcetypeof = 5;
	};		
};

[_resourceZones, _zoneSize, _batchSize, _requiredItem, _resourcetypeof];