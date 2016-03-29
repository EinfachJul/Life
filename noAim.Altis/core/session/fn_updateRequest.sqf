/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,life_znorak,life_zgazzy];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case east: {"med"}; case independent: {"alac"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call noaim_fnc_saveGear;
_packet pushBack life_gear;

_profs = [];
{
	if(_x select 1 == _flag) then
	{
		_data = missionNamespace getVariable (_x select 0);
		_profs pushBack [_x select 0,_data select 0,_data select 1];
	};
 
} foreach life_prof;
_packet pushBack _profs;

switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

if (!isnil "nokwaffe") then {
	_packet pushBack nokwaffe;
};

_packet remoteExec ["DB_fnc_updateRequest",2];
//[_packet,"DB_fnc_updateRequest",false,false] spawn noaim_fnc_DONE;