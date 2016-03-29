#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through noaim_fnc_TRY
*/
private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case east: {"med"}; case independent: {"alac"};};

switch(_mode) do {

	// 0 = Speichern von Cash
	case 0: {
		_packet set[2,life_znorak];
	};
	
	// 1 = Speichern von BankCash
	case 1: {
		_packet set[2,life_zgazzy];
	};
	
	// 2 = Lizenzen
	case 2: {
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach life_licenses;
		
		_packet set[2,_array];
	};
	
	// 3 = Gear und Z-Inventar
	case 3: {
		[] call noaim_fnc_saveGear;
		_packet set[2,life_gear];
	};
	
	// 4 = Am Leben?
	case 4: {
		//_packet set[2,life_is_arrested];
	};
	
	// 5 = Arrested?
	case 5: {
		_packet set[2,life_is_arrested];
	};
	
	case 6: {
		_packet set[2,life_znorak];
		_packet set[4,life_zgazzy];
	};
	
	case 7: {
		//_packet set[2,life_is_arrested];
	};
};

_packet remoteExec ["DB_fnc_updatePartial",2];

//[_packet,"DB_fnc_updatePartial",false,false] call noaim_fnc_DONE;

//_packet remoteExec ["DB_fnc_updatePartial",2]; REMOTE