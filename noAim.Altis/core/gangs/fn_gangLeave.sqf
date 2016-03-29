#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable ["gang_members",[]];
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];

//[[4,_grp,player],"TON_fnc_updateGang",false,false] spawn noaim_fnc_DONE;
[4,grpPlayer,_members] remoteExec ["TON_fnc_updateGang",2];

[player,grpPlayer] remoteExec ["noaim_fnc_clientGangLeft",player];


hint "Sie muessen ggfs den Server Neu verbinden.";

closeDialog 0;
life_gangData = [];