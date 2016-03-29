/*
	Author: Bryan "Tonic" Boardwine
	Catches a dead turtle?
*/
private["_obj"];
_obj = cursorObject;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle",1] call noaim_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
};