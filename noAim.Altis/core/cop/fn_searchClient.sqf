/*
	Author: Bryan "Tonic" Boardwine
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_robber"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inv = [];
_robber = false; //Illegal items
{
	_var = [_x select 0,0] call noaim_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call noaim_fnc_handleInv;
	};
} foreach life_illegal_items;

if(!life_use_atm) then 
{
	life_znorak = 0;
	_robber = true;
};

if(!life_use_atm_2) then 
{
	life_znorak = 0;
	_robber = true;
};
//[[player,_inv,_robber],"noaim_fnc_copSearch",_cop,false] spawn noaim_fnc_DONE;
[player,_inv,_robber] remoteExec ["noaim_fnc_copSearch",_cop];