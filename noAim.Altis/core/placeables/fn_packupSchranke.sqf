/*
    File: fn_packupSchranke.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz & Pak

    Description:
    Nimmt eine Schranke auf.
*/
private["_schranke"];
_schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_schranke") exitWith {};

if(([true,"schranke",1] call noaim_fnc_handleInv)) then
{
    titleText["Du hast die Schranke aufgehoben.","PLAIN"];
    deleteVehicle _schranke;
};