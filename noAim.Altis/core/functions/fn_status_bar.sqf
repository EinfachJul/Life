/*
	Author: Bryan "Tonic" Boardwine
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_status_BAR"];
disableSerialization;

2 cutRsc ["playerHUD","PLAIN"];
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call noaim_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_misc = _ui displayCtrl 23520;
_miscImg = _ui displayCtrl 23521;
_foodIcon = _ui displayCtrl 23531;
_waterIcon = _ui displayCtrl 23532;
_healthIcon = _ui displayCtrl 23533;

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.570];
_food ctrlSetText format["%1%2", life_hunger, "%"];
_food ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_hunger < 0.3) then { 
	_food ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.508];
_water ctrlSetText format["%1%2", life_thirst, "%"];
_water ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_thirst < 0.3) then { 
	_water ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};

//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.445];
_dam = round((1 - (damage player)) * 100);
_health ctrlSetText format["%1%2", _dam, "%"];
_health ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(damage player > 0.5) then { 
	_health ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
};

_misc ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.380];
_misc ctrlSetBackgroundColor [0, 0, 0, 0.5]; 

//_misc progressSetPosition (life_carryWeight * (100 / life_maxWeight) / 100 );
_misc progressSetPosition life_carryWeight / life_maxWeight;
_misc ctrlSetText format["%1 / %2", life_carryWeight, life_maxWeight];
_misc ctrlCommit 0; 

//_misc ctrlCommit 0;
_miscImg ctrlCommit 0;
_food ctrlCommit 0;
_water ctrlCommit 0;
_health ctrlCommit 0;