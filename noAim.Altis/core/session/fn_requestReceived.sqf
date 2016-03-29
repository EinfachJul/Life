#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SAX_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SAX_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SAX_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SAX_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SAX_fnc_dataQuery;};

//Parse basic player information.
life_znorak = parseNumber (_this select 2);
life_zgazzy = parseNumber (_this select 3);
coins_cache = life_znorak;
atmcoins_cache = life_zgazzy;
__CONST__(zko_adminstufe, parseNumber(_this select 4));
__CONST__(life_donatorlevel, parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

/*
if((__GETC__(life_donatorlevel) == 0)) then {
license_civ_donator = false;
[2] call SOCK_fnc_updatePartial;
} else {
license_civ_donator = true;
[2] call SOCK_fnc_updatePartial;
};*/

life_gear = _this select 8;
//life_persistent_gear = _playerData select 8;
[] call noaim_fnc_loadGear;

if(count (_this select 9) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),[parseNumber (_x select 1), parseNumber (_x select 2)]];
	} foreach (_this select 9);
};

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(zak_copstufe, parseNumber(_this select 7));
		__CONST__(zek_fwehrstufe,0);
		__CONST__(life_alaclevel,0);
		//life_blacklisted = _this select 11;
	};

	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(zak_copstufe,0);
		__CONST__(zek_fwehrstufe,0);
		__CONST__(life_alaclevel,0);
		
		life_houses = _this select 10;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			zaki_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = _This select 11;
		if(count life_gangData != 0) then {
			[] spawn noaim_fnc_initGang;
		};
		[] spawn noaim_fnc_initHouses;
	};

	case east: {
		__CONST__(zek_fwehrstufe, parseNumber(_this select 7));
		__CONST__(zak_copstufe,0);
		__CONST__(life_alaclevel,0);
	};
	
	case independent: {
		__CONST__(life_alaclevel, parseNumber(_this select 7));
		__CONST__(zak_copstufe,0);
		__CONST__(zek_fwehrstufe,0);
	};
};

if(count (_this select 13) > 0) then {
	{zaki_vehicles pushBack _x;} foreach (_this select 12);
};

life_session_completed = true;