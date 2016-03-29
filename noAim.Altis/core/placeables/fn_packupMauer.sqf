/*
    File: fn_packupMauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz & Pak

    Description:
    Nimmt eine Sandsackwand auf.
*/
private["_mauer"];
_mauer = nearestObjects[getPos player,["Land_BagFence_Round_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(([true,"mauer",1] call noaim_fnc_handleInv)) then
{
    titleText["Du hast die Sandsaecke aufgehoben.","PLAIN"];
    deleteVehicle _mauer;
};