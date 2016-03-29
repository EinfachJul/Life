/*
    File: fn_packupBarriere.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz & Pak

    Description:
    Nimmt eine Barriere auf.
*/
private["_barrierlight"];
_barrierlight = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_barrierlight") exitWith {};

if(([true,"barrierlight",1] call noaim_fnc_handleInv)) then
{
    titleText["Du hast die Pylone aufgehoben.","PLAIN"];
    deleteVehicle _barrierlight;
};