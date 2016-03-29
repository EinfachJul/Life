private["_tier","_type","_displayName","_val","_displayBonus","_typeBonus","_valBonus"];
_tier = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
if(playerSide in [west,east]) exitWith {hint "Du bist im Dienst, tu dies in deiner Freizeit!"};
if(player distance _tier > 3.5) exitWith {};

if(life_inv_knife > 0) then {

	life_action_inUse = true; 
	switch(true) do
	{
		case ((typeOf _tier) == "Turtle_F"): {_displayName = "Schildkroete"; _type = "turtle"; _val = 2; _displayBonus = "Schildkroetenpanzer"; _typeBonus = "turtlepanzer"; _valBonus = 1;};
		case ((typeOf _tier) == "Hen_random_F") : {_displayName = "Huehnchen"; _type = "henraw"; _val = 1; _displayBonus = "Federn"; _typeBonus = "feather"; _valBonus = 1;};
		case ((typeOf _tier) == "Cock_random_F") : {_displayName = "Haehnchen"; _type = "roosterraw"; _val = 1; _displayBonus = "Federn"; _typeBonus = "feather"; _valBonus = 1;};
		case ((typeOf _tier) == "Goat_random_F") : {_displayName = "Ziegen"; _type = "goatraw"; _val = 2; _displayBonus = "Ziegenfell"; _typeBonus = "goatfur"; _valBonus = 1;};
		case ((typeOf _tier) == "Sheep_random_F") : {_displayName = "Schaf"; _type = "sheepraw"; _val = 2; _displayBonus = "Schafwolle"; _typeBonus = "sheepwool"; _valBonus = 1;};
	//	case ((typeOf _tier) == "Rabbit_F") : {_displayName = "Hasen"; _type = "rabbitraw"; _val = 1; _displayBonus = "Schildkroete"; _typeBonus = "turtle"; _valBonus = 1;};
		default {_displayName = ""; _type = ""; _val = 0; _displayBonus = ""; _typeBonus = ""; _valBonus = 0;};
	};

	if (_displayName == "") exitWith {life_action_inUse = false;};

	if( _type isEqualTo "" ) exitWith {}; //Couldn't get a type
	//if(_type == "") exitWith {}; //Couldn't get a type

	life_action_inUse = false;
	if(isNull _tier) exitWith {life_action_inUse = false;};
	
	if(([true,_typeBonus,_valBonus] call noaim_fnc_handleInv)) then
	{
		[true,_type,_val] call noaim_fnc_handleInv;
		deleteVehicle _tier;
		//titleText[format[(localize "STR_NOTF_Fishing"),_type],"PLAIN"];
		titleText [format["Du hast rohes %1 fleisch und %2 gesammelt.",_displayName, _displayBonus],"PLAIN"];
		player say3D "bagopen";
	} else {
		deleteVehicle _animalCorpse;
		titleText ["Dein Inventar ist voll","PLAIN"];
	};

} else {
	hint "Sie besitzen kein Jagtmesser!";
};