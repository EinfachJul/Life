/*
	Author: Bryan "Tonic" Boardwine
	Initializes the civilian.
	Edited by noAim
*/
private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_u_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F"],150];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_u_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F"],150];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_u_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F"],150];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_u_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F"],150];
civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", ["Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_u_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F"],250];
//mafia_spawn_1 = nearestObjects[getMarkerPos  "mafia_spawn_1", ["Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_u_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn noaim_fnc_jail;
} else {

	[] spawn noaim_fnc_welcomeHint;
	waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
	waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.
	
	[] call noaim_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;
player enableFatigue false;
player allowSprint true;
player enableStamina false;
player setCustomAimCoef 0.15;

[] call noaim_fnc_updateClothing;