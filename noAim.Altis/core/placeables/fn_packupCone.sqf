/*
    File: fn_packupCone.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz & Pak

    Description:
    Nimmt eine Pylone auf.
*/
private["_roadcone"];
_roadcone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_roadcone") exitWith {};

if(([true,"roadcone",1] call noaim_fnc_handleInv)) then
{
    titleText["Du hast die Pylone aufgehoben.","PLAIN"];
    deleteVehicle _roadcone;
};