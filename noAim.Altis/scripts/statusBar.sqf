//Start erst nach Spawn
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

//_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
//_rscLayer cutRsc["osefStatusBar","PLAIN"]; 

[] spawn {
uiSleep 5;
_counter = 180;
_timeSinceLastUpdate = 0;

	while {true} do
	{
		uisleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["POLIZEI: %1 | FEUERWEHR: %2 | ZIVIS: %3 | GELD: %4 | BANK: %5 | SPIELER: %6 | Up-Time: %7 | FPS: %8 ", west countSide playableUnits, east countSide playableUnits, civilian countSide playableUnits,[life_znorak] call noaim_fnc_numberText,[life_zgazzy] call noaim_fnc_numberText, count playableUnits, [serverTime,"HH:MM"] call BIS_fnc_secondsToString, round diag_fps, _counter];
	}; 
};