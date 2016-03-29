#include "..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

switch(__GETC__(zak_copstufe)) do
{
	case 1: {life_paycheck = 8000;};
	case 2: {life_paycheck = 10000;};
	case 3: {life_paycheck = 12000;};
	case 4: {life_paycheck = 14000;};
	case 5: {life_paycheck = 22000;};
	case 6: {life_paycheck = 25000;};
	case 7: {life_paycheck = 27000;};
	default { life_paycheck = 10000; };
};

if(license_cop_gsg9) then
{
	life_paycheck = life_paycheck + 10000;
};

if((__GETC__(zak_copstufe) == 0) && (__GETC__(zko_adminstufe) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	[player,"POLIZEI"] call BIS_fnc_setUnitInsignia;
	sleep 35;
};

if((str(player) in ["cop_gsg1","cop_gsg2","cop_gsg3","cop_gsg4"])) then {
	if(!license_cop_gsg9) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		[player,"GSG9"] call BIS_fnc_setUnitInsignia;
		uiSleep 35;
	};
};

player setVariable["rank",(__GETC__(zak_copstufe)),true];
[] spawn noaim_fnc_welcomeHint;
waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

[] call noaim_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

player enableFatigue false;
player allowSprint true;
player enableStamina false;
player setCustomAimCoef 0.15;

[] call noaim_fnc_updateClothing;