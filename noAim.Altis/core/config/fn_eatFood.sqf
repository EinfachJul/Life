/*
	Author: Bryan "Tonic" Boardwine
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};

if([false,_food,1] call noaim_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 10};
		case "orange": {_val = 10};
		case "hotdog": {_val = 50};
		case "fries": {_val = 30};
		case "burger1": {_val = 41};
		case "burger2": {_val = 44};
		case "burger3": {_val = 43};
		case "burger4": {_val = 42};
		case "burger5": {_val = 43};
		case "burger6": {_val = 47};
		case "pizza1": {_val = 51};
		case "pizza2": {_val = 53};
		case "pizza3": {_val = 56};
		case "pizza4": {_val = 57};
		case "sandwich": {_val = 30};
		case "snack1": {_val = 100};
		case "snack2": {_val = 30};
		case "lasagne": {_val = 50};
		case "spaghetti": {_val = 50};
		case "doener": {_val = 40};
		case "gyros": {_val = 40};
		case "apfeltasche": {_val = 20};
		case "icecream1": {_val = 10};
		case "currywurst": {_val = 30};
		case "salema": {_val = 20};
		case "ornate": {_val = 15};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 50};
		case "mullet": {_val = 40};
		case "catshark": {_val = 40};
		case "turtlesoup": {_val = 30};
		case "donuts": {_val = 20};
		case "countrypotatoes": {_val = 10};
		case "saladpot": {_val = 10};
		case "altismeal": {_val = 60};
		case "henrawsteak": {_val = 80};
		case "roosterrawsteak": {_val = 80};
		case "goatrawsteak": {_val = 80};
		case "sheeprawsteak": {_val = 90};
		case "rabbitrawsteak": {_val = 50};
	};

	_sum = life_hunger + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast zuviel gegessen und fuehlst dich schlapp.";};
	life_hunger = _sum;
	[] call noaim_fnc_status_bar;
};