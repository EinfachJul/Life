/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(playerSide == civilian) then {
	if(player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
	if(player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};
};

if(playerSide == east) exitWith {};

if(playerSide == west OR (vehicle player == player)) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
titleText[localize "STR_NOTF_PulledOut","PLAIN"];
titleFadeOut 4;