/*
	Author: Bryan "Tonic" Boardwine
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_distance","_killerWep","_weaponName"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_distance = _killer distance _unit;
_distance = floor(_distance);
_killerWep = currentWeapon _killer;
_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
_weaponName = format["%1",getText(_weaponName >> "displayName")];
_killerWep = "";

profileNamespace setVariable["Busted",true];

_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];
_unit enableFatigue false;
_unit allowSprint true;
_unit enableStamina false;
_unit setCustomAimCoef 0.15;

[1] call noaim_fnc_tempSack;

if((_killer isKindOf "landVehicle") || (_killer isKindOf "Ship") || (_killer isKindOf "Air")) then {
	_killerWep = typeOf (vehicle _killer);
} else {
	_killerWep = currentWeapon _killer;
};

if(life_GSG9aktiv == true) then {
	life_GSG9aktiv = false;
};

/*
if (playerSide in [civilian,east,west]) then {
	life_gear = [];
	[6] call SAX_fnc_updatePartial;
};*/

//AX_LOG *DEFEKT *FIX
[format ["KILLER: %1(ID:%2) wurde von %3(ID:%4) aus einer Entfernung von %5 Meter(n) mit %6 getötet. Geld v. Opfer: %7€ | Gear: %8", name player, getPlayerUID _unit, _killer getVariable["realname","Unknown"], getPlayerUID _killer, floor(_killer distance _unit), _killerWep, [life_znorak] call noaim_fnc_numberText, life_gear],"ax_log",false,false] call noaim_fnc_Loggy;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

/*
life_deathCamera camSetRelPos [0,20,20];
life_deathCamera camSetFOV .8;
life_deathCamera camSetFocus [100,0];
life_deathCamera camCommit 0;*/

//[0] call SAX_fnc_updatePartial;
//[3] call SAX_fnc_updatePartial;
//[] call SAX_fnc_updateRequest;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);

	_medicsOnline = {_x != player && side _x == east} count playableUnits;
	if(_medicsOnline > 0) then {
		life_respawn_timer = 5; // 5 Minuten
	} else {
		life_respawn_timer = 1;
	};
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format["Neues Leben in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText "Du wurdest gerettet und aus dem Krankenhaus entlassen!";

};

[] spawn noaim_fnc_deathScreen;

[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; /*life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;*/};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		//[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
		[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"] remoteExec ["noaim_fnc_wantedAdd",2];
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
		//===================================== 28.11.2015
			if (vehicle _killer isKindOf "Car") then
			{
				//[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
				[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"] remoteExec ["noaim_fnc_wantedAdd",2];
				[2] remoteExec ["noaim_fnc_removeLicenses",_killer];
				//[[2],"noaim_fnc_removeLicenses",_killer,FALSE] spawn noaim_fnc_DONE;
				
				[format ["VEHARKILL: %1(ID:%2) wurde von %3(ID:%4) Überfahren.", _unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer],"ax_log",false,false] call noaim_fnc_Loggy;
				//_toLog = format["VEHARKILL: %1(ID:%2) wurde von %3(ID:%4) Überfahren.",_unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer];
				//[["kills",_toLog],"ax_log",false,false] call noaim_fnc_Loggy;
			};

			if (vehicle _killer isKindOf "Truck") then
			{
				//[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
				[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"] remoteExec ["noaim_fnc_wantedAdd",2];
				[4] remoteExec ["noaim_fnc_removeLicenses",_killer];
				//[[4],"noaim_fnc_removeLicenses",_killer,FALSE] spawn noaim_fnc_DONE;
				
				//_toLog = format["VEHTRUCKKILL: %1(ID:%2) wurde von %3(ID:%4) Überfahren.",_unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer];
				//[["kills",_toLog],"ax_log",false,false] call noaim_fnc_Loggy;
				
				[format ["VEHTRUCKKILL: %1(ID:%2) wurde von %3(ID:%4) Überfahren.", _unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer],"ax_log",false,false] call noaim_fnc_Loggy;
			};

			if (vehicle _killer isKindOf "Ship") then
			{
				//[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
				[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"] remoteExec ["noaim_fnc_wantedAdd",2];
				[6] remoteExec ["noaim_fnc_removeLicenses",_killer];
				//[[6],"noaim_fnc_removeLicenses",_killer,FALSE] spawn noaim_fnc_DONE;
				
				//_toLog = format["VEHSHIPKILL: %1(ID:%2) wurde von %3(ID:%4) Gekentert.",_unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer];
				//[["kills",_toLog],"ax_log",false,false] call noaim_fnc_Loggy;
				
				[format ["VEHSHIPKILL: %1(ID:%2) wurde von %3(ID:%4) Überfahren.", _unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer],"ax_log",false,false] call noaim_fnc_Loggy;
			};
			
			if (vehicle _killer isKindOf "Air") then
			{
				//[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;
				[getPlayerUID _killer,_killer getVariable["realname",name _killer],"114"] remoteExecCall ["noaim_fnc_wantedAdd",2];
				//[[5],"noaim_fnc_removeLicenses",_killer,FALSE] spawn noaim_fnc_TRY;
				[5] remoteExecCall ["noaim_fnc_removeLicenses",_killer];
				
				_toLog = format["VEHAIRKILL: %1(ID:%2) wurde von %3(ID:%4) Zerstört.",_unit getVariable["realname","Unknown"],getPlayerUID _unit,_killer getVariable["realname","Unknown"],getPlayerUID _killer];
				[["kills",_toLog],"ax_log",false,false] call noaim_fnc_Loggy;
			};
		//===================================== 28.11.2015
		};
	} else {
		//[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;
		[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"] remoteExecCall ["noaim_fnc_wantedAdd",2];		
		
		if(!local _killer) then {
			//[[3],"noaim_fnc_removeLicenses",_killer,FALSE] spawn noaim_fnc_TRY;
			[3] remoteExecCall ["noaim_fnc_removeLicenses",_killer];
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_znorak > 0}) then {
		//[format[localize "STR_Cop_RobberDead",[life_znorak] call noaim_fnc_numberText],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_DONE;
		format[localize "STR_Cop_RobberDead",[life_znorak] call noaim_fnc_numberText] remoteExec ["noaim_fnc_broadcast",-2];
		life_znorak = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn noaim_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_znorak = 0;

//================================ LYNX 28.11.2015
//fix for kill in vehicle
if(primaryWeapon _unit != "") then {
	_unit removeWeapon (primaryWeapon _unit);
};

if(secondaryWeapon _unit != "") then {
	_unit removeWeapon (secondaryWeapon _unit);
};

uisleep 0.5;
_containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated","GroundWeaponHolder"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers;
//================================ LYNX 28.11.2015

[] call noaim_fnc_status_bar; //Get our HUD updated.

[player,life_sidechat,playerSide] remoteExec ["TON_fnc_managesc",2];
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn noaim_fnc_DONE;

//[player, life_sidechat, playerSide] remoteExec ["TON_fnc_managesc", 2]; REMOTE Version

[0] call SAX_fnc_updatePartial;
[3] call SAX_fnc_updatePartial;