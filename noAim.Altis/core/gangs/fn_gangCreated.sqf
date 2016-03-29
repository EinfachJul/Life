#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
life_action_gangInUse = nil;

if(life_zgazzy < (__GETC__(life_gangPrice))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-life_zgazzy)] call noaim_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(life_zgazzy,(__GETC__(life_gangPrice)));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call noaim_fnc_numberText];