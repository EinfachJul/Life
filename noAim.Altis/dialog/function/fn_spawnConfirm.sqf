/*
	Author: Bryan "Tonic" Boardwine
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call noaim_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 0));
	};
	titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
}
	else
{
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
			if((["house",life_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call noaim_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};
				
				{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (life_spawn_point select 0));
	};
	titleText[format["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};
[] call noaim_fnc_updateClothing;
//[] spawn noaim_fnc_IntroCam;

if(life_firstSpawn) then {
	life_firstSpawn = false;
};

[] spawn
{
   private["_handle"];
   cutText ["","BLACK IN"];
 
	if (profileNamespace getVariable["Busted",false]) then
	{
	//life_cash = 0;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	player linkItem "ItemMap";
	player linkItem "ItemRadio";
	player linkItem "ItemWatch";
	player linkItem "ItemCompass";
	player forceaddUniform "U_C_Poloshirt_salmon";
	player setObjectTextureGlobal [0,'textures\uniforms\civ\civ_cry.paa'];
	[3] call SAX_fnc_updatePartial;
	[0] call SAX_fnc_updatePartial;
	profileNamespace setVariable["Busted",false];
	execVM "dialog\busted.sqf";
	};   
};

[] call noaim_fnc_hudSetup;

//--- Color corrections
//[] spawn noaim_fnc_colorCorrections;