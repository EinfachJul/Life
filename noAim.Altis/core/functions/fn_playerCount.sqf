/*
	Author: Bryan "Tonic" Boardwine
	Retrieves the amount of players on per side specified.
*/
private["_faction"];
_faction = [_this,0,civilian,[east]] call BIS_fnc_param;

{side _x == _faction} count playableUnits;