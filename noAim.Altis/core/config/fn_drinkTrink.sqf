/*
	Author: Bryan "Tonic" Boardwine
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_water","_val","_sum"];
_water = [_this,0,"",[""]] call BIS_fnc_param;
if(_water == "") exitWith {};

if([false,_water,1] call noaim_fnc_handleInv) then {
	switch (_water) do
	{
		case "goatmilk": {_val = 40};
		case "water": {_val = 50};
		case "coffee": {_val = 25};
		case "orangejuice": {_val = 100};
		case "applejuice": {_val = 100};
		case "altiscola": {_val = 75};
		case "altisorange": {_val = 75};
	};

	_sum = life_thirst + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast zuviel getrunken und musst gleich kotzen.";};
	life_thirst = _sum;
	[] call noaim_fnc_status_bar;
};