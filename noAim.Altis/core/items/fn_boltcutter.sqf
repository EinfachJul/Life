/*
	Author: Bryan "Tonic" Boardwine
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_exit","_dome","_glitch","_isFed","_cops","_markercopz"];

_glitch = 1;
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
_exit = false;
_isFed = if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {true} else {false};
if(_isFed) then {
	//if({side _x == west} count playableUnits < 5) exitWith {hint "Es sind zu wenig Polizisten Online, das Gold wurde vorher an einem geheimen Ort versteckt."};
	_cops = [];
	{
		if (side _x == west && _x getVariable "rank" > 1) then { _cops pushBack _x};

	} forEach playableUnits;
	
	if(count _cops < 7) exitWith {hintSilent localize "STR_NOTF_No_Cops"; _exit = true;};
	//[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_DONE;
	//[[1,2],"!!!!! Jemand bricht in die Bundesbank ein !!!!!!"] remoteExec ["noaim_fnc_broadcast",-2];
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["noaim_fnc_broadcast",-2];
	//[[getPlayerUID player, (localize "STR_ISTR_Bolt_AlertFed")],"TON_fnc_logit",false] spawn noaim_fnc_LAST;	//BANK WIRD AUFGEBROCHEN IN LOG GESCHREIBEN
	[(getPlayerUID player), (localize "STR_ISTR_Bolt_AlertFed")] remoteExec ["TON_fnc_logit",2];
	
	if(_building == (fed_bank getVariable "Rsb")) then
	{
		_glitch = 0;
		_dome = fed_bank getVariable "Dome";
		for "_i" from 1 to 3 do
		{	//1 gleich close 0 = open
			if(_dome getVariable (format["bis_disabled_Door_%1",_i]) == 0) then {_glitch = 1;};
		};
		if(_glitch == 0) then
		{
			//[[[0,1,2], "STR_Fed_Glitch", true, [player getVariable ["realname",name player]]],"noaim_fnc_broadcast",nil,false] spawn noaim_fnc_TRY;
			[[0,1,2],"STR_Fed_Glitch",true,[player getVariable ["realname",name player]]] remoteExecCall ["noaim_fnc_broadcast",west];
			
			//STRAFE MUSS SEIN AB INSCOP HQ UND GEFESSELT BLEIBEN !!!
			player setPos (getMarkerPos "Fed_Glitch");
			player setVariable["restrained",true,true];
			[2,-1,"Ich hab mich in die Bank GEGLITCHED und stehe gefesselt im Polizei HQ Kavalla und warte auf meine Bestrafung !!!"] call noaim_fnc_newMsg;
			//player say3D "GlitchUse";
			[] spawn {
				while {player getVariable "restrained"} do
				{
					if(vehicle player == player) then
					{
						player playMove "AmovPercMstpSnonWnonDnon_Ease";
					};
	
					waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained")};
			
					if(!alive player) exitWith
					{
						player setVariable ["restrained",false,true];
						player setVariable ["Escorting",false,true];
						player setVariable ["transporting",false,true];
						detach player;
					};
	
					if(vehicle player != player) then
					{
						if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
					};
				};
				
				if(alive player) then
				{
					player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
					player setVariable ["Escorting",false,true];
					player setVariable ["transporting",false,true];
					detach player;
				};
			};
			//ENDE VOM RESTARAIN :D
		};
	};
		
} else {

	//[[0,"STR_ISTR_Bolt_AlertHouse2",true,[profileName,(_building getVariable "house_owner") select 1]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
	[0,"STR_ISTR_Bolt_AlertHouse2",true,[profileName,(_building getVariable "house_owner") select 1]] remoteExecCall ["noaim_fnc_broadcast",-2];
	//[[1,format[localize "STR_ISTR_Bolt_AlertHouse3",profileName, mapGridPosition player]],"noaim_fnc_broadcast",west,FALSE] call noaim_fnc_TRY;
	[1,format[localize "STR_ISTR_Bolt_AlertHouse3",profileName, mapGridPosition player]] remoteExecCall ["noaim_fnc_broadcast",west];
	//[[0,"STR_ISTR_Bolt_AlertHouse3",true,[profileName, mapGridPosition player]],"noaim_fnc_broadcast",west,false] call noaim_fnc_DONE;
	//[_curTarget,"caralarm", 5] call noaim_fnc_globalSound;
};

if(_glitch == 0) exitWith{};
if(_exit) exitWith {};
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door

for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.002;};
	default {_cpRate = 0.004;}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"noaim_fnc_animSync",true,false] spawn noaim_fnc_TRY;
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["noaim_fnc_animSync",-2];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.55;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call noaim_fnc_handleInv;
	life_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
if(playerSide == civilian) then {
	if(_isFed) then {
	//LYNX - 28.11.2015 wantedeintrag geändert
		[getPlayerUID player,profileName,"153"] remoteExec ["noaim_fnc_wantedAdd",2];
		//[[getPlayerUID player,profileName,"153"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
	} else {
	//LYNX - 28.11.2015 wantedadd
		[getPlayerUID player,profileName,"156"] remoteExec ["noaim_fnc_wantedAdd",2];
		//[[getPlayerUID player,profileName,"156"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
	};
};