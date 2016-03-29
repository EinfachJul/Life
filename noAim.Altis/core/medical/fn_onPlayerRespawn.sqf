#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];
_unit setvariable["fwcall",nil,true];
_unit setvariable["fwoffline",nil,true];
_unit enableFatigue false;
_unit allowSprint true;
_unit enableStamina false;
_unit setCustomAimCoef 0.15;

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call noaim_fnc_setupActions;
[_unit,life_sidechat,playerSide] remoteExec ["TON_fnc_managesc",2];
//[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn noaim_fnc_DONE;
player enableFatigue (__GETC__(life_enableFatigue));

player enableFatigue false;
player allowSprint true;
player enableStamina false;
player setCustomAimCoef 0.15;