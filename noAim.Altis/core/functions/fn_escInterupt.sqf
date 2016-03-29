/*
	Author: Bryan "Tonic" Boardwine
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 15;
		
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call SAX_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton buttonSetAction "[player] remoteExec [""TON_fnc_cleanupRequest"",2];";
	_abortButton ctrlSetEventHandler [
		"ButtonClick",
		"[] spawn noaim_fnc_goOff; (findDisplay 49) closeDisplay 2; true" 
	];
	
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;

	waitUntil{isNull (findDisplay 49)};
};