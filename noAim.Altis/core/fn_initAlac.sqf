#include "..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Initializes the PMC
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_alacLevel)) == 0) exitWith {0 cutText ["","BLACK FADED"];
0 cutFadeOut 99999999; ["NotWhitelisted"] call BIS_fnc_endMission; life_paycheck = 0;};
life_paycheck = life_paycheck + (__GETC__(life_alacLevel)) * 4000;

[] spawn noaim_fnc_welcomeHint;
waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

[] call noaim_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done. 

[] call noaim_fnc_updateClothing;

player allowDamage false;