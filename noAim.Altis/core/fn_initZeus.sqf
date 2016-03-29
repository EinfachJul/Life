/*
    Author: John "Paratus" VanderZwet
    Zeus Initialization file.
*/

player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn noaim_fnc_copMarkers;

if(zko_adminstufe < 2) exitWith
{
    endMission "Loser";
};