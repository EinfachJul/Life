#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];
_gangName = _hideout getVariable ["gangOwnerName",grpNull];

if(playerSide == civilian) then {
	if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
	if(_group == grpPlayer) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
	if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint localize "STR_GNOTF_Captured";};
	if(!isNull _group) then {
		_gangName = _group getVariable ["gang_name",""];
		_action = [
			format[localize "STR_GNOTF_AlreadyControlled",_gangName],
			localize "STR_GNOTF_CurrentCapture",
			localize "STR_Global_Yes",
			localize "STR_Global_No"
		] call BIS_fnc_guiMessage;
		_hideout setVariable["taken",false,true];
		
		_cpRate = 0.0045;
	} else {
		_cpRate = 0.0075;
	};

	if(!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
	life_action_inUse = true;

	//Setup the progress bar
	disableSerialization;
	_title = localize "STR_GNOTF_Capturing";
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;
	
	[[0,1],format["%1 und seine Gang: %2 versuchen die Kontrolle ueber ein Gangversteck zu uebernehmen!",name player,(group player) getVariable "gang_name" ]] remoteExecCall ["noaim_fnc_broadcast",-2];

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
		sleep 0.195;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + _cpRate;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		_hideout setVariable["inCapture",true,true];
		if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
		if(life_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
		if(life_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
	};

	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
	life_action_inUse = false;

	titleText["Hideout wurde erfolgreich eingenommen.","PLAIN"];
	_flagTexture = "\A3\Data_F\Flags\flag_fd_red_CO.paa";
	_this select 0 setFlagTexture _flagTexture;
	//[[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
	[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["noaim_fnc_broadcast",-2];
	_hideout setVariable["inCapture",false,true];
	_hideout setVariable["gangOwner",grpPlayer,true];
	_hideout setVariable["taken",true,true];
	_Pos = position _hideout;
	deleteMarker "_whichMarker";
	deleteMarker "_whichMarkerText";
	 _marker = createMarker ["_whichMarker", _Pos];
	"_whichMarker" setMarkerColor "ColorRed";
	"_whichMarker" setMarkerType "Empty";
	"_whichMarker" setMarkerShape "ELLIPSE";
	"_whichMarker" setMarkerSize [200,200];
	_markerText = createMarker ["_whichMarkerText", _Pos];
	"_whichMarkerText" setMarkerColor "ColorBlack";
	"_whichMarkerText" setMarkerText format["%1 Kontrollieren diese Zone",(group player) getVariable "gang_name"];
	"_whichMarkerText" setMarkerType "mil_warning";

	_data = missionNamespace getVariable "Gang_Prof";
	_addExpAmount = 50;
	_addExpAmount = _addExpAmount + (5 * (_data select 0));
	["Gang_Prof",_AddExpAmount] call noaim_fnc_addExp;
	//[[0,format["Sie erhalten %1 XP fuer die uebernahme eines Gang Hideouts!", _addExpAmount]],"noaim_fnc_broadcast",player,false] spawn noaim_fnc_TRY;
	[0,format["Sie erhalten %1 XP fuer die uebernahme eines Gang Hideouts!", _addExpAmount]] remoteExecCall ["noaim_fnc_broadcast",player];
};

if(playerSide == west) then {
	if((_hideout getVariable ["inCapture",false])) exitWith {hint localize "STR_GNOTF_Captured";};
	if(!(_hideout getVariable ["taken",false])) exitWith {hint "This gang hideout is not under any gang control";};
	_cpRate = 0.0055;
	//[[1,format["Der Polizist %1 versucht gerade einen Gang Hideout zu sichern.",name player]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
	[0,format["Sie erhalten %1 XP fuer die uebernahme eines Gang Hideouts!", _addExpAmount]] remoteExecCall ["noaim_fnc_broadcast",player];
	//format["Sie erhalten %1 XP fuer das einsperren eines Kriminellen", _addExpAmount] remoteExec ["systemChat",player];
	life_action_inUse = true;

	//Setup the progress bar
	disableSerialization;
	_title = localize "STR_GNOTF_CapturingCop";
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
		sleep 0.195;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + _cpRate;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		_hideout setVariable["inCapture",true,true];
		if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
		if(life_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
		if(life_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
	};

	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
	if(life_interrupted) exitWith {life_interrupted = false; titleText["Action cancelled","PLAIN"]; life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
	life_action_inUse = false;

	titleText["Hideout has been secured.","PLAIN"];
	_flagTexture = "\A3\Data_F\Flags\Flag_blue_CO.paa";
	_this select 0 setFlagTexture _flagTexture;
	//_gangName = _group getVariable ["gang_name",""];
	[[0,1],"STR_GNOTF_CaptureSuccessCop",true,name player] remoteExecCall ["noaim_fnc_broadcast",-2];
	//[[[0,1],"STR_GNOTF_CaptureSuccessCop",true,name player],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
	_hideout setVariable["inCapture",false,true];
	_hideout setVariable["gangOwner",false,true];
	_hideout setVariable["taken",false,true];
	life_zgazzy = life_zgazzy + 10000;
	titleText ["Der Gang Hideout wurde erfolgreich gesichert, sie erhalten 50000 Euro Bonus!","PLAIN"];
	deleteMarker "_whichMarker";
	deleteMarker "_whichMarkerText";
};
	//deleteMarker "_whichMarker";
	//deleteMarker "_whichMarkerText";