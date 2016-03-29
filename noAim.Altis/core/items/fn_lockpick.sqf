/*
	Author: Bryan "Tonic" Boardwine
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
//if( player distance (getMarkerPos "safezone_1") < 300 ) exitWith {hint "Du bist in einer Safezone"};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;

if(playerSide == civilian && player distance (getMarkerPos "safezone_kavala") < 300) exitWith {};
if(playerSide == civilian && player distance (getMarkerPos "safezone_pygros") < 150) exitWith {};

if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air") OR (_curTarget isKindOf "ReammoBox_F") OR (_curTarget isKindOf "StaticWeapon") OR (_curTarget isKindOf "Cargo_base_F")) then {true} else {false};
if(_isVehicle && _curTarget in zaki_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if((animationState player=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon")) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call noaim_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 30) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		//[player,"car_alarm"] call noaim_fnc_globalSound;
		//_curTarget say3D "caralarm";
		[_curTarget,"car_alarm", 5] call noaim_fnc_globalSound;
		zaki_vehicles set[count zaki_vehicles,_curTarget];
		[getPlayerUID player,profileName,"487"] remoteExec ["noaim_fnc_wantedAdd",2];
		//[[getPlayerUID player,profileName,"487"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
		//AX_LOG *DEFEKT
		[format ["STOLECAR: %1(%2€) hat das Fahrzeug von %3 aufgebrochen", name player, getPlayerUID player, _curTarget getVariable["vehicle_info_owners",[]]],"ax_log",false,false] call noaim_fnc_Loggy;
	} else {
		//[[_curTarget],"noaim_fnc_CarAlarmSound",nil,true] spawn noaim_fnc_DONE;
		//_curTarget say3D "caralarm";
		[_curTarget,"car_alarm", 5] call noaim_fnc_globalSound;
		[getPlayerUID player,profileName,"215"] remoteExec ["noaim_fnc_wantedAdd",2];
		//[[getPlayerUID player,profileName,"215"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
		//[[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_DONE;
		//format["STR_ISTR_Lock_FailedNOTF",profileName] remoteExec ["systemChat",west];
		[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",-2];
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
};