/*
	File: initServer.sqf
	Starts the initialization of the server.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call noaim_fnc_MPexec};
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
master_group attachTo[bank_obj,[0,0,0]];
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
//[8,true,12] execFSM "core\fsm\timeModule.fsm";
[7,true,15] execFSM "core\fsm\timeModule.fsm";