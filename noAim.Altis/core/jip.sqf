/*
	Author: Bryan "Tonic" Boardwine
	JIP functionality for JIP required things like vehicles.
*/
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn noaim_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn noaim_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");